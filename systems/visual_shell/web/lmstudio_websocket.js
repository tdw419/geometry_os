/**
 * LMStudioWebSocket - Real-time LLM integration client
 *
 * WebSocket client for connecting to LM Studio and receiving
 * real-time inference updates, token streaming, and model status.
 *
 * API Requirements:
 * - constructor(url): Initialize with WebSocket URL
 * - connect(): Establish WebSocket connection
 * - disconnect(): Close connection
 * - send(prompt, options): Send inference request
 * - onProgress(callback): Subscribe to inference progress
 * - onToken(callback): Subscribe to token stream
 * - onComplete(callback): Subscribe to completion
 * - onError(callback): Subscribe to errors
 * - getStatus(): Return connection and model status
 */

class LMStudioWebSocket {
    /**
     * Initialize with WebSocket URL
     * @param {string} url - WebSocket URL (default: ws://localhost:1234)
     * @param {Object} options - Connection options
     */
    constructor(url = 'ws://localhost:1234', options = {}) {
        this.url = url;
        this.options = {
            reconnectInterval: 5000,
            maxReconnectAttempts: 10,
            reconnectBackoffMultiplier: 1.5,
            requestTimeout: 30000,
            ...options
        };

        // Connection state
        this.ws = null;
        this.connected = false;
        this.connecting = false;
        this.reconnectAttempts = 0;
        this.currentReconnectInterval = this.options.reconnectInterval;

        // Request tracking
        this.pendingRequests = new Map();
        this.requestIdCounter = 0;

        // Event callbacks
        this.progressCallbacks = [];
        this.tokenCallbacks = [];
        this.completeCallbacks = [];
        this.errorCallbacks = [];
        this.connectCallbacks = [];
        this.disconnectCallbacks = [];

        // Model status
        this.modelStatus = {
            modelName: null,
            modelPath: null,
            isLoaded: false,
            isInferenceActive: false,
            totalTokensGenerated: 0,
            lastInferenceTime: null
        };

        // Connection status
        this.connectionStatus = {
            connected: false,
            reconnecting: false,
            reconnectAttempt: 0,
            lastError: null,
            lastConnectTime: null,
            lastDisconnectTime: null
        };

        console.log(`[LMStudioWebSocket] Initialized with URL: ${this.url}`);
    }

    /**
     * Establish WebSocket connection
     * @returns {Promise<void>}
     */
    connect() {
        return new Promise((resolve, reject) => {
            if (this.connected) {
                console.warn('[LMStudioWebSocket] Already connected');
                resolve();
                return;
            }

            if (this.connecting) {
                console.warn('[LMStudioWebSocket] Connection already in progress');
                reject(new Error('Connection already in progress'));
                return;
            }

            this.connecting = true;
            console.log(`[LMStudioWebSocket] Connecting to ${this.url}...`);

            try {
                this.ws = new WebSocket(this.url);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.connecting = false;
                    this.connectionStatus.connected = true;
                    this.connectionStatus.reconnecting = false;
                    this.connectionStatus.reconnectAttempt = 0;
                    this.connectionStatus.lastConnectTime = Date.now();
                    this.connectionStatus.lastError = null;
                    this.reconnectAttempts = 0;
                    this.currentReconnectInterval = this.options.reconnectInterval;

                    console.log(`[LMStudioWebSocket] Connected to ${this.url}`);
                    this._emitConnect();

                    // Request initial model status
                    this._requestModelStatus();

                    resolve();
                };

                this.ws.onmessage = (event) => {
                    this._handleMessage(event.data);
                };

                this.ws.onerror = (error) => {
                    console.error('[LMStudioWebSocket] WebSocket error:', error);
                    this.connectionStatus.lastError = error;
                };

                this.ws.onclose = (event) => {
                    this.connected = false;
                    this.connecting = false;
                    this.connectionStatus.connected = false;
                    this.connectionStatus.lastDisconnectTime = Date.now();

                    console.log(`[LMStudioWebSocket] Disconnected (code: ${event.code})`);
                    this._emitDisconnect();

                    // Attempt reconnection
                    if (this.reconnectAttempts < this.options.maxReconnectAttempts) {
                        this.connectionStatus.reconnecting = true;
                        this.reconnectAttempts++;
                        this.connectionStatus.reconnectAttempt = this.reconnectAttempts;

                        const delay = this.currentReconnectInterval;
                        console.log(`[LMStudioWebSocket] Reconnecting in ${delay}ms (attempt ${this.reconnectAttempts}/${this.options.maxReconnectAttempts})`);

                        setTimeout(() => {
                            this.currentReconnectInterval = Math.min(
                                this.currentReconnectInterval * this.options.reconnectBackoffMultiplier,
                                60000 // Max 60 seconds
                            );
                            this.connect().catch(err => {
                                console.error('[LMStudioWebSocket] Reconnect failed:', err);
                            });
                        }, delay);
                    } else {
                        console.error('[LMStudioWebSocket] Max reconnect attempts reached');
                        this._emitError(new Error('Max reconnect attempts reached'));
                    }
                };
            } catch (error) {
                this.connecting = false;
                reject(error);
            }
        });
    }

    /**
     * Close connection
     */
    disconnect() {
        if (this.ws) {
            this.reconnectAttempts = this.options.maxReconnectAttempts; // Prevent reconnection
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
        this.connecting = false;
        this.connectionStatus.connected = false;
        this.connectionStatus.reconnecting = false;
        console.log('[LMStudioWebSocket] Disconnected by user');
    }

    /**
     * Send inference request
     * @param {string} prompt - Input prompt
     * @param {Object} options - Inference options
     * @returns {Promise<Object>} Inference result
     */
    send(prompt, options = {}) {
        return new Promise((resolve, reject) => {
            if (!this.connected) {
                reject(new Error('Not connected to LM Studio'));
                return;
            }

            const requestId = ++this.requestIdCounter;
            const request = {
                id: requestId,
                prompt,
                options: {
                    temperature: options.temperature || 0.7,
                    maxTokens: options.maxTokens || 2048,
                    topP: options.topP || 0.9,
                    topK: options.topK || 40,
                    stream: options.stream !== false, // Default to streaming
                    ...options
                },
                timestamp: Date.now()
            };

            // Set up timeout
            const timeoutId = setTimeout(() => {
                this.pendingRequests.delete(requestId);
                reject(new Error(`Request timeout after ${this.options.requestTimeout}ms`));
            }, this.options.requestTimeout);

            // Store pending request
            this.pendingRequests.set(requestId, {
                resolve,
                reject,
                timeoutId,
                startTime: Date.now(),
                tokensReceived: [],
                fullResponse: ''
            });

            // Send request
            try {
                this.ws.send(JSON.stringify({
                    type: 'inference_request',
                    ...request
                }));
                console.log(`[LMStudioWebSocket] Sent request ${requestId}`);
            } catch (error) {
                this.pendingRequests.delete(requestId);
                clearTimeout(timeoutId);
                reject(error);
            }
        });
    }

    /**
     * Subscribe to inference progress
     * @param {Function} callback - Progress callback
     * @returns {Function} Unsubscribe function
     */
    onProgress(callback) {
        this.progressCallbacks.push(callback);
        return () => {
            const index = this.progressCallbacks.indexOf(callback);
            if (index > -1) {
                this.progressCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Subscribe to token stream
     * @param {Function} callback - Token callback
     * @returns {Function} Unsubscribe function
     */
    onToken(callback) {
        this.tokenCallbacks.push(callback);
        return () => {
            const index = this.tokenCallbacks.indexOf(callback);
            if (index > -1) {
                this.tokenCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Subscribe to completion
     * @param {Function} callback - Completion callback
     * @returns {Function} Unsubscribe function
     */
    onComplete(callback) {
        this.completeCallbacks.push(callback);
        return () => {
            const index = this.completeCallbacks.indexOf(callback);
            if (index > -1) {
                this.completeCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Subscribe to errors
     * @param {Function} callback - Error callback
     * @returns {Function} Unsubscribe function
     */
    onError(callback) {
        this.errorCallbacks.push(callback);
        return () => {
            const index = this.errorCallbacks.indexOf(callback);
            if (index > -1) {
                this.errorCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Subscribe to connection events
     * @param {Function} callback - Connect callback
     * @returns {Function} Unsubscribe function
     */
    onConnect(callback) {
        this.connectCallbacks.push(callback);
        return () => {
            const index = this.connectCallbacks.indexOf(callback);
            if (index > -1) {
                this.connectCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Subscribe to disconnection events
     * @param {Function} callback - Disconnect callback
     * @returns {Function} Unsubscribe function
     */
    onDisconnect(callback) {
        this.disconnectCallbacks.push(callback);
        return () => {
            const index = this.disconnectCallbacks.indexOf(callback);
            if (index > -1) {
                this.disconnectCallbacks.splice(index, 1);
            }
        };
    }

    /**
     * Return connection and model status
     * @returns {Object} Current status
     */
    getStatus() {
        return {
            connection: { ...this.connectionStatus },
            model: { ...this.modelStatus },
            pendingRequests: this.pendingRequests.size
        };
    }

    /**
     * Handle incoming WebSocket message
     * @private
     */
    _handleMessage(data) {
        try {
            const message = JSON.parse(data);

            switch (message.type) {
                case 'inference_start':
                    this._handleInferenceStart(message);
                    break;

                case 'inference_progress':
                    this._handleInferenceProgress(message);
                    break;

                case 'inference_token':
                    this._handleInferenceToken(message);
                    break;

                case 'inference_complete':
                    this._handleInferenceComplete(message);
                    break;

                case 'inference_error':
                    this._handleInferenceError(message);
                    break;

                case 'model_status':
                    this._handleModelStatus(message);
                    break;

                default:
                    console.log(`[LMStudioWebSocket] Unknown message type: ${message.type}`);
            }
        } catch (error) {
            console.error('[LMStudioWebSocket] Failed to parse message:', error);
        }
    }

    /**
     * Handle inference start
     * @private
     */
    _handleInferenceStart(message) {
        this.modelStatus.isInferenceActive = true;
        console.log(`[LMStudioWebSocket] Inference started for request ${message.requestId}`);

        const request = this.pendingRequests.get(message.requestId);
        if (request) {
            this._emitProgress({
                requestId: message.requestId,
                stage: 'start',
                timestamp: Date.now()
            });
        }
    }

    /**
     * Handle inference progress
     * @private
     */
    _handleInferenceProgress(message) {
        const progressData = {
            requestId: message.requestId,
            stage: 'progress',
            progress: message.progress || 0,
            tokensGenerated: message.tokensGenerated || 0,
            estimatedTimeRemaining: message.estimatedTimeRemaining,
            timestamp: Date.now()
        };

        this._emitProgress(progressData);
    }

    /**
     * Handle inference token
     * @private
     */
    _handleInferenceToken(message) {
        const tokenData = {
            requestId: message.requestId,
            token: message.token,
            position: message.position,
            logprob: message.logprob,
            timestamp: Date.now()
        };

        this._emitToken(tokenData);

        // Accumulate in pending request
        const request = this.pendingRequests.get(message.requestId);
        if (request) {
            request.tokensReceived.push(tokenData);
            request.fullResponse += message.token || '';
        }
    }

    /**
     * Handle inference complete
     * @private
     */
    _handleInferenceComplete(message) {
        const request = this.pendingRequests.get(message.requestId);
        if (request) {
            clearTimeout(request.timeoutId);

            const result = {
                requestId: message.requestId,
                prompt: message.prompt,
                response: request.fullResponse,
                tokens: request.tokensReceived,
                totalTokens: message.totalTokens,
                duration: Date.now() - request.startTime,
                timestamp: Date.now()
            };

            this.pendingRequests.delete(message.requestId);
            request.resolve(result);

            this._emitComplete(result);
        }

        this.modelStatus.isInferenceActive = false;
        this.modelStatus.totalTokensGenerated += message.totalTokens || 0;
        this.modelStatus.lastInferenceTime = Date.now();
    }

    /**
     * Handle inference error
     * @private
     */
    _handleInferenceError(message) {
        const request = this.pendingRequests.get(message.requestId);
        if (request) {
            clearTimeout(request.timeoutId);
            this.pendingRequests.delete(message.requestId);
            request.reject(new Error(message.error || 'Inference failed'));
        }

        this._emitError(new Error(message.error || 'Inference failed'));
        this.modelStatus.isInferenceActive = false;
    }

    /**
     * Handle model status
     * @private
     */
    _handleModelStatus(message) {
        this.modelStatus = {
            ...this.modelStatus,
            modelName: message.modelName,
            modelPath: message.modelPath,
            isLoaded: message.isLoaded || false,
            contextSize: message.contextSize,
            gpuLayers: message.gpuLayers
        };

        console.log('[LMStudioWebSocket] Model status:', this.modelStatus);
    }

    /**
     * Request model status from server
     * @private
     */
    _requestModelStatus() {
        if (this.connected && this.ws) {
            try {
                this.ws.send(JSON.stringify({ type: 'get_model_status' }));
            } catch (error) {
                console.error('[LMStudioWebSocket] Failed to request model status:', error);
            }
        }
    }

    /**
     * Emit progress event
     * @private
     */
    _emitProgress(data) {
        for (const callback of this.progressCallbacks) {
            try {
                callback(data);
            } catch (error) {
                console.error('[LMStudioWebSocket] Progress callback error:', error);
            }
        }
    }

    /**
     * Emit token event
     * @private
     */
    _emitToken(data) {
        for (const callback of this.tokenCallbacks) {
            try {
                callback(data);
            } catch (error) {
                console.error('[LMStudioWebSocket] Token callback error:', error);
            }
        }
    }

    /**
     * Emit complete event
     * @private
     */
    _emitComplete(data) {
        for (const callback of this.completeCallbacks) {
            try {
                callback(data);
            } catch (error) {
                console.error('[LMStudioWebSocket] Complete callback error:', error);
            }
        }
    }

    /**
     * Emit error event
     * @private
     */
    _emitError(error) {
        for (const callback of this.errorCallbacks) {
            try {
                callback(error);
            } catch (err) {
                console.error('[LMStudioWebSocket] Error callback error:', err);
            }
        }
    }

    /**
     * Emit connect event
     * @private
     */
    _emitConnect() {
        for (const callback of this.connectCallbacks) {
            try {
                callback();
            } catch (error) {
                console.error('[LMStudioWebSocket] Connect callback error:', error);
            }
        }
    }

    /**
     * Emit disconnect event
     * @private
     */
    _emitDisconnect() {
        for (const callback of this.disconnectCallbacks) {
            try {
                callback();
            } catch (error) {
                console.error('[LMStudioWebSocket] Disconnect callback error:', error);
            }
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.LMStudioWebSocket = LMStudioWebSocket;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LMStudioWebSocket };
}
