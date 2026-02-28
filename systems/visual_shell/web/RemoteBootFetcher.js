/**
 * RemoteBootFetcher - Streaming download of remote containers with progress tracking
 *
 * Provides streaming download of containers from remote servers with real-time
 * progress feedback, cancellation support, and hash verification.
 *
 * Features:
 * - Streaming download using fetch ReadableStream
 * - Real-time progress with percent, speed, and time remaining
 * - Smooth speed averaging over last 3 seconds
 * - Cancellation support via AbortController
 * - Hash verification using CatalogCacheManager
 * - Comprehensive error handling with categorization
 *
 * Uses native fetch API with no external dependencies.
 *
 * @module RemoteBootFetcher
 */

// Import CatalogCacheManager for hash computation (if available)
let CatalogCacheManager = null;
if (typeof window !== 'undefined' && window.CatalogCacheManager) {
    CatalogCacheManager = window.CatalogCacheManager;
}

class RemoteBootFetcher {
    /**
     * Default timeout for downloads (60 seconds - suitable for large containers)
     * @static
     */
    static DEFAULT_TIMEOUT = 60000;

    /**
     * Speed smoothing window in milliseconds
     * @static
     */
    static SPEED_WINDOW_MS = 3000;

    /**
     * Minimum bytes for speed calculation
     * @static
     */
    static MIN_BYTES_FOR_SPEED = 1024;

    /**
     * Create a new RemoteBootFetcher instance
     * @param {Object} options - Configuration options
     * @param {number} [options.timeout=60000] - Download timeout in milliseconds
     */
    constructor(options = {}) {
        this.timeout = options.timeout || RemoteBootFetcher.DEFAULT_TIMEOUT;
        this.abortController = null;

        // Internal state for progress tracking
        this._startTime = null;
        this._bytesLoaded = 0;
        this._totalBytes = null;
        this._speedSamples = []; // For speed smoothing: [{ time, bytes }]
        this._isDownloading = false;

        // Callbacks stored per-fetch
        this._callbacks = null;
    }

    /**
     * Fetch a remote container with streaming and progress tracking
     * @param {string} url - The URL to fetch
     * @param {Object} options - Fetch options
     * @param {string} [options.expectedHash] - Expected SHA256 hash for verification
     * @param {Function} [options.onProgress] - Progress callback: ({ loaded, total, percent, speed, timeRemaining })
     * @param {Function} [options.onComplete] - Completion callback: ({ data, hash, verified, expectedHash })
     * @param {Function} [options.onError] - Error callback: ({ error, type, stage, httpStatus, bytesLoaded, message, retryable })
     * @param {Function} [options.onCancel] - Cancellation callback: ({ bytesLoaded })
     * @returns {Promise<{data: ArrayBuffer, hash: string|null, verified: boolean}|null>} Download result or null on error
     */
    async fetch(url, options = {}) {
        if (this._isDownloading) {
            this._emitError(options.onError, {
                error: new Error('Download already in progress'),
                type: 'state',
                stage: 'connecting',
                httpStatus: null,
                bytesLoaded: 0,
                message: 'Another download is already in progress. Cancel it first.',
                retryable: false
            });
            return null;
        }

        this._isDownloading = true;
        this._bytesLoaded = 0;
        this._totalBytes = null;
        this._startTime = Date.now();
        this._speedSamples = [];
        this._callbacks = {
            onProgress: options.onProgress,
            onComplete: options.onComplete,
            onError: options.onError,
            onCancel: options.onCancel
        };

        // Create abort controller for this fetch
        this.abortController = new AbortController();
        const { signal } = this.abortController;

        // Set up timeout
        let timeoutId = null;
        if (this.timeout > 0) {
            timeoutId = setTimeout(() => {
                if (this.abortController && !signal.aborted) {
                    this.abortController.abort();
                }
            }, this.timeout);
        }

        try {
            // Stage: Connecting
            const response = await fetch(url, { signal });

            // Clear timeout on successful connection
            if (timeoutId) {
                clearTimeout(timeoutId);
                timeoutId = null;
            }

            // Check for HTTP errors
            if (!response.ok) {
                const httpError = this._createHttpError(response.status, url);
                this._emitError(options.onError, httpError);
                this._cleanup();
                return null;
            }

            // Get content length for progress calculation
            const contentLength = response.headers.get('Content-Length');
            this._totalBytes = contentLength ? parseInt(contentLength, 10) : null;

            // Warn if Content-Length is missing (progress will show bytes only, no percent)
            if (this._totalBytes === null) {
                console.warn(
                    '[RemoteBootFetcher] Content-Length header missing. ' +
                    'Progress will show bytes downloaded but no percentage.'
                );
            }

            // Check for zero-byte response
            if (this._totalBytes === 0) {
                this._emitError(options.onError, {
                    error: new Error('Server returned zero-byte response'),
                    type: 'network',
                    stage: 'downloading',
                    httpStatus: response.status,
                    bytesLoaded: 0,
                    message: 'The server returned an empty response.',
                    retryable: true
                });
                this._cleanup();
                return null;
            }

            // Stage: Downloading - stream the response
            const reader = response.body.getReader();
            const chunks = [];
            let result;

            while (true) {
                result = await reader.read();

                if (result.done) {
                    break;
                }

                if (signal.aborted) {
                    // User cancelled - emit cancel callback
                    this._emitCancel(options.onCancel, this._bytesLoaded);
                    this._cleanup();
                    return null;
                }

                // Accumulate chunks
                chunks.push(result.value);
                this._bytesLoaded += result.value.length;

                // Track speed samples
                this._addSpeedSample(result.value.length);

                // Emit progress
                this._emitProgress(options.onProgress);
            }

            // Check if we received more bytes than expected
            if (this._totalBytes !== null && this._bytesLoaded > this._totalBytes) {
                console.warn(
                    '[RemoteBootFetcher] Server sent more bytes than Content-Length:',
                    `received ${this._bytesLoaded}, expected ${this._totalBytes}`
                );
            }

            // Combine chunks into single ArrayBuffer
            const data = this._combineChunks(chunks);

            // Stage: Verifying - compute and verify hash
            const { hash, verified, verificationError } = await this._verifyHash(data, options.expectedHash);

            // If hash verification failed but we have data, emit error but still return data
            if (verificationError && options.expectedHash) {
                this._emitError(options.onError, {
                    error: verificationError,
                    type: 'verification',
                    stage: 'verifying',
                    httpStatus: null,
                    bytesLoaded: this._bytesLoaded,
                    message: `Hash verification failed. Expected ${options.expectedHash.substring(0, 12)}..., got ${hash ? hash.substring(0, 12) : 'none'}.`,
                    retryable: false
                });
            }

            // Emit completion (data is provided even on verification failure)
            this._emitComplete(options.onComplete, {
                data,
                hash,
                verified,
                expectedHash: options.expectedHash || null
            });

            this._cleanup();
            return { data, hash, verified };

        } catch (error) {
            // Handle different error types
            const errorInfo = this._categorizeError(error, this._bytesLoaded);

            // Clear timeout if still pending
            if (timeoutId) {
                clearTimeout(timeoutId);
            }

            this._emitError(options.onError, errorInfo);
            this._cleanup();
            return null;
        }
    }

    /**
     * Cancel an in-progress download
     */
    cancel() {
        if (this.abortController && this._isDownloading) {
            this.abortController.abort();
        }
    }

    /**
     * Check if a download is currently in progress
     * @returns {boolean}
     */
    isDownloading() {
        return this._isDownloading;
    }

    /**
     * Get current download progress info
     * @returns {Object|null} Progress object or null if not downloading
     */
    getProgress() {
        if (!this._isDownloading) return null;

        return this._calculateProgress();
    }

    // ========================================
    // Private Methods
    // ========================================

    /**
     * Add a speed sample for smoothing
     * @param {number} bytes - Bytes received in this sample
     * @private
     */
    _addSpeedSample(bytes) {
        const now = Date.now();
        this._speedSamples.push({ time: now, bytes });

        // Remove samples older than the window
        const cutoff = now - RemoteBootFetcher.SPEED_WINDOW_MS;
        while (this._speedSamples.length > 0 && this._speedSamples[0].time < cutoff) {
            this._speedSamples.shift();
        }
    }

    /**
     * Calculate smoothed speed in bytes per second
     * @returns {number|null} Speed in bytes/sec or null if insufficient data
     * @private
     */
    _calculateSpeed() {
        if (this._speedSamples.length < 2) {
            return null;
        }

        const first = this._speedSamples[0];
        const last = this._speedSamples[this._speedSamples.length - 1];
        const timeDiff = (last.time - first.time) / 1000; // seconds

        if (timeDiff <= 0) {
            return null;
        }

        // Sum bytes in window
        const bytesInWindow = this._speedSamples.reduce((sum, s) => sum + s.bytes, 0);

        return bytesInWindow / timeDiff;
    }

    /**
     * Calculate progress information
     * @returns {Object} Progress object
     * @private
     */
    _calculateProgress() {
        const elapsed = (Date.now() - this._startTime) / 1000; // seconds
        const speed = this._calculateSpeed();

        let percent = null;
        let timeRemaining = null;

        if (this._totalBytes !== null && this._totalBytes > 0) {
            percent = Math.round((this._bytesLoaded / this._totalBytes) * 100);

            // Calculate time remaining if we have speed
            if (speed !== null && speed > 0) {
                const bytesRemaining = this._totalBytes - this._bytesLoaded;
                timeRemaining = bytesRemaining / speed; // seconds
            }
        }

        return {
            loaded: this._bytesLoaded,
            total: this._totalBytes,
            percent,
            speed, // bytes per second
            timeRemaining, // seconds
            elapsed
        };
    }

    /**
     * Emit progress callback
     * @param {Function} callback
     * @private
     */
    _emitProgress(callback) {
        if (typeof callback === 'function') {
            try {
                const progress = this._calculateProgress();
                callback(progress);
            } catch (e) {
                console.error('[RemoteBootFetcher] onProgress callback error:', e);
            }
        }
    }

    /**
     * Emit completion callback
     * @param {Function} callback
     * @param {Object} result
     * @private
     */
    _emitComplete(callback, result) {
        if (typeof callback === 'function') {
            try {
                callback(result);
            } catch (e) {
                console.error('[RemoteBootFetcher] onComplete callback error:', e);
            }
        }
    }

    /**
     * Emit error callback
     * @param {Function} callback
     * @param {Object} errorInfo
     * @private
     */
    _emitError(callback, errorInfo) {
        if (typeof callback === 'function') {
            try {
                callback(errorInfo);
            } catch (e) {
                console.error('[RemoteBootFetcher] onError callback error:', e);
            }
        }
    }

    /**
     * Emit cancel callback
     * @param {Function} callback
     * @param {number} bytesLoaded
     * @private
     */
    _emitCancel(callback, bytesLoaded) {
        if (typeof callback === 'function') {
            try {
                callback({ bytesLoaded });
            } catch (e) {
                console.error('[RemoteBootFetcher] onCancel callback error:', e);
            }
        }
    }

    /**
     * Combine chunks into single ArrayBuffer
     * @param {Uint8Array[]} chunks
     * @returns {ArrayBuffer}
     * @private
     */
    _combineChunks(chunks) {
        const totalLength = chunks.reduce((sum, chunk) => sum + chunk.length, 0);
        const combined = new Uint8Array(totalLength);
        let offset = 0;

        for (const chunk of chunks) {
            combined.set(chunk, offset);
            offset += chunk.length;
        }

        return combined.buffer;
    }

    /**
     * Verify hash of downloaded data
     * @param {ArrayBuffer} data
     * @param {string} expectedHash
     * @returns {Promise<{hash: string|null, verified: boolean, verificationError: Error|null}>}
     * @private
     */
    async _verifyHash(data, expectedHash) {
        let hash = null;
        let verified = false;
        let verificationError = null;

        // Try to use CatalogCacheManager for hash computation
        if (CatalogCacheManager) {
            try {
                const cacheManager = new CatalogCacheManager();
                hash = await cacheManager.computeHash(data);

                if (expectedHash && hash) {
                    verified = hash === expectedHash;

                    if (!verified) {
                        console.warn(
                            '[RemoteBootFetcher] Hash mismatch:',
                            `expected ${expectedHash}, got ${hash}`
                        );
                        verificationError = new Error(`Hash mismatch: expected ${expectedHash}, got ${hash}`);
                    }
                }
            } catch (e) {
                console.error('[RemoteBootFetcher] Hash computation error:', e);
                verificationError = e;
            }
        } else {
            // Fallback to direct Web Crypto API
            try {
                const hashBuffer = await crypto.subtle.digest('SHA-256', data);
                const hashArray = Array.from(new Uint8Array(hashBuffer));
                hash = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

                if (expectedHash) {
                    verified = hash === expectedHash;

                    if (!verified) {
                        console.warn(
                            '[RemoteBootFetcher] Hash mismatch:',
                            `expected ${expectedHash}, got ${hash}`
                        );
                        verificationError = new Error(`Hash mismatch: expected ${expectedHash}, got ${hash}`);
                    }
                }
            } catch (e) {
                console.error('[RemoteBootFetcher] Hash computation error:', e);
                verificationError = e;
            }
        }

        return { hash, verified, verificationError };
    }

    /**
     * Create HTTP error info
     * @param {number} status
     * @param {string} url
     * @returns {Object}
     * @private
     */
    _createHttpError(status, url) {
        let message;
        let retryable;

        if (status >= 400 && status < 500) {
            // 4xx errors - client errors, generally not retryable
            if (status === 404) {
                message = `Container not found at ${url}`;
            } else if (status === 403) {
                message = 'Access denied. You may not have permission to download this container.';
            } else {
                message = `Client error: ${status}`;
            }
            retryable = false;
        } else if (status >= 500) {
            // 5xx errors - server errors, retryable
            message = `Server error (${status}). The remote server is experiencing issues.`;
            retryable = true;
        } else {
            message = `HTTP error: ${status}`;
            retryable = false;
        }

        return {
            error: new Error(message),
            type: 'http',
            stage: 'connecting',
            httpStatus: status,
            bytesLoaded: 0,
            message,
            retryable
        };
    }

    /**
     * Categorize an error into structured info
     * @param {Error} error
     * @param {number} bytesLoaded
     * @returns {Object}
     * @private
     */
    _categorizeError(error, bytesLoaded) {
        const errorName = error.name || '';
        const errorMessage = error.message || '';
        const lowerMessage = errorMessage.toLowerCase();

        // Check for abort (user cancellation)
        if (errorName === 'AbortError' || lowerMessage.includes('abort')) {
            return {
                error,
                type: 'cancelled',
                stage: bytesLoaded > 0 ? 'downloading' : 'connecting',
                httpStatus: null,
                bytesLoaded,
                message: 'Download was cancelled.',
                retryable: false
            };
        }

        // Check for timeout
        if (errorName === 'TimeoutError' || lowerMessage.includes('timeout')) {
            return {
                error,
                type: 'timeout',
                stage: bytesLoaded > 0 ? 'downloading' : 'connecting',
                httpStatus: null,
                bytesLoaded,
                message: 'Download timed out. The server may be slow or unavailable.',
                retryable: true
            };
        }

        // Check for network errors (TypeError with fetch-related message)
        if (errorName === 'TypeError') {
            // Try to detect specific network failure types
            let specificMessage = 'Network error. Please check your connection and the server address.';

            // DNS failure indicators
            if (lowerMessage.includes('dns') || lowerMessage.includes('enotfound') || lowerMessage.includes('name not resolved')) {
                specificMessage = 'DNS resolution failed. The server address could not be found.';
            }
            // Connection refused indicators
            else if (lowerMessage.includes('econnrefused') || lowerMessage.includes('connection refused')) {
                specificMessage = 'Connection refused. The server may be down or not accepting connections.';
            }
            // Network offline indicators
            else if (lowerMessage.includes('offline') || lowerMessage.includes('networkerror') || lowerMessage.includes('net::err_internet_disconnected')) {
                specificMessage = 'You appear to be offline. Please check your internet connection.';
            }
            // CORS error (usually shows as TypeError)
            else if (lowerMessage.includes('cors') || lowerMessage.includes('cross-origin')) {
                specificMessage = 'Cross-origin request blocked. The server does not allow requests from this origin.';
            }
            // Generic fetch failure
            else if (lowerMessage.includes('failed to fetch') || lowerMessage.includes('fetch') || lowerMessage.includes('network')) {
                specificMessage = 'Unable to reach the server. Please check the URL and your connection.';
            }

            return {
                error,
                type: 'network',
                stage: 'connecting',
                httpStatus: null,
                bytesLoaded,
                message: specificMessage,
                retryable: true
            };
        }

        // Generic error - default to network type with retryable
        return {
            error,
            type: 'network',
            stage: bytesLoaded > 0 ? 'downloading' : 'connecting',
            httpStatus: null,
            bytesLoaded,
            message: errorMessage || 'An unexpected error occurred.',
            retryable: true // Default to retryable for unknown errors
        };
    }

    /**
     * Clean up internal state after fetch completes
     * @private
     */
    _cleanup() {
        this._isDownloading = false;
        this.abortController = null;
        this._callbacks = null;
    }
}

// ES6 export + window attachment pattern for dual module/script usage
export { RemoteBootFetcher };
if (typeof window !== 'undefined') {
    window.RemoteBootFetcher = RemoteBootFetcher;
}
