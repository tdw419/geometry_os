/**
 * CatalogCacheManager - IndexedDB-based caching for container data
 *
 * Provides persistent browser storage for downloaded containers,
 * enabling offline access to previously downloaded containers.
 *
 * Features:
 * - IndexedDB-based persistent storage
 * - LRU (Least Recently Used) eviction policy
 * - Stale-while-revalidate pattern with ETag support
 * - SHA256 hash verification using Web Crypto API
 *
 * Uses native IndexedDB API with no external dependencies.
 *
 * @module CatalogCacheManager
 * @extends PIXI.utils.EventEmitter
 */

// Import PIXI EventEmitter if available, otherwise use a minimal polyfill
let EventEmitter;
if (typeof PIXI !== 'undefined' && PIXI.utils && PIXI.utils.EventEmitter) {
    EventEmitter = PIXI.utils.EventEmitter;
} else {
    // Minimal EventEmitter polyfill for standalone usage
    EventEmitter = class EventEmitter {
        constructor() {
            this._events = {};
        }
        on(event, listener) {
            if (!this._events[event]) this._events[event] = [];
            this._events[event].push(listener);
            return this;
        }
        emit(event, ...args) {
            if (this._events[event]) {
                this._events[event].forEach(listener => listener(...args));
            }
            return this;
        }
        off(event, listener) {
            if (this._events[event]) {
                this._events[event] = this._events[event].filter(l => l !== listener);
            }
            return this;
        }
    };
}

class CatalogCacheManager extends EventEmitter {
    /**
     * Database configuration
     * @private
     */
    static DB_NAME = 'gos-cache';
    static DB_VERSION = 1;
    static STORE_NAME = 'containers';
    static DEFAULT_MAX_SIZE = 500 * 1024 * 1024; // 500MB
    static MAX_SIZE_KEY = 'gos-cache-max-size'; // localStorage key

    /**
     * Cache age configuration (in milliseconds)
     * @private
     */
    static DEFAULT_MAX_AGE = 7 * 24 * 60 * 60 * 1000; // 7 days
    static DEFAULT_STALE_WHILE_REVALIDATE = 24 * 60 * 60 * 1000; // 1 day
    static CONFIG_KEY = 'gos-cache-config'; // localStorage key for config

    /**
     * Create a CatalogCacheManager instance
     * @param {Object} options - Configuration options
     * @param {string} options.dbName - Database name (default: 'gos-cache')
     * @param {number} options.dbVersion - Database version (default: 1)
     * @param {boolean} options.verifyOnRead - Verify hash on every read (default: false)
     * @param {number} options.maxAge - Maximum cache age in ms (default: 7 days)
     * @param {number} options.staleWhileRevalidate - Grace period for stale entries (default: 1 day)
     */
    constructor(options = {}) {
        super(); // Call EventEmitter constructor

        this.dbName = options.dbName || CatalogCacheManager.DB_NAME;
        this.dbVersion = options.dbVersion || CatalogCacheManager.DB_VERSION;
        this.verifyOnRead = options.verifyOnRead || false;
        this.db = null;
        this._initPromise = null;

        // Load or set cache age configuration
        this._loadConfig(options);
    }

    /**
     * Load configuration from localStorage or use defaults
     * @private
     * @param {Object} options - Constructor options to override stored config
     */
    _loadConfig(options = {}) {
        try {
            const stored = localStorage.getItem(CatalogCacheManager.CONFIG_KEY);
            if (stored) {
                const config = JSON.parse(stored);
                this.maxAge = options.maxAge || config.maxAge || CatalogCacheManager.DEFAULT_MAX_AGE;
                this.staleWhileRevalidate = options.staleWhileRevalidate || config.staleWhileRevalidate || CatalogCacheManager.DEFAULT_STALE_WHILE_REVALIDATE;
            } else {
                this.maxAge = options.maxAge || CatalogCacheManager.DEFAULT_MAX_AGE;
                this.staleWhileRevalidate = options.staleWhileRevalidate || CatalogCacheManager.DEFAULT_STALE_WHILE_REVALIDATE;
            }
        } catch (error) {
            console.warn('[CatalogCacheManager] Could not load config from localStorage:', error);
            this.maxAge = options.maxAge || CatalogCacheManager.DEFAULT_MAX_AGE;
            this.staleWhileRevalidate = options.staleWhileRevalidate || CatalogCacheManager.DEFAULT_STALE_WHILE_REVALIDATE;
        }
    }

    /**
     * Initialize the IndexedDB database
     * Creates object store and indexes if they don't exist
     * @returns {Promise<IDBDatabase|null>} Database instance or null on failure
     */
    async init() {
        // Return existing init promise if already in progress
        if (this._initPromise) {
            return this._initPromise;
        }

        // Return existing DB if already initialized
        if (this.db) {
            return this.db;
        }

        this._initPromise = new Promise((resolve, reject) => {
            try {
                const request = indexedDB.open(this.dbName, this.dbVersion);

                request.onerror = (event) => {
                    console.error('[CatalogCacheManager] Failed to open database:', event.target.error);
                    this._initPromise = null;
                    resolve(null);
                };

                request.onsuccess = (event) => {
                    this.db = event.target.result;
                    console.log('[CatalogCacheManager] Database opened successfully');
                    resolve(this.db);
                };

                request.onupgradeneeded = (event) => {
                    const db = event.target.result;

                    // Create object store with 'id' as keyPath
                    if (!db.objectStoreNames.contains(CatalogCacheManager.STORE_NAME)) {
                        const store = db.createObjectStore(CatalogCacheManager.STORE_NAME, {
                            keyPath: 'id'
                        });

                        // Create indexes for querying
                        store.createIndex('cachedAt', 'cachedAt', { unique: false });
                        store.createIndex('lastAccessed', 'lastAccessed', { unique: false });
                        store.createIndex('size', 'size', { unique: false });

                        console.log('[CatalogCacheManager] Object store and indexes created');
                    }
                };
            } catch (error) {
                console.error('[CatalogCacheManager] IndexedDB initialization error:', error);
                this._initPromise = null;
                resolve(null);
            }
        });

        return this._initPromise;
    }

    /**
     * Get the object store for read/write operations
     * @private
     * @param {string} mode - Transaction mode ('readonly' or 'readwrite')
     * @returns {IDBObjectStore|null} Object store or null on failure
     */
    async _getStore(mode = 'readonly') {
        if (!this.db) {
            await this.init();
        }

        if (!this.db) {
            return null;
        }

        try {
            const transaction = this.db.transaction([CatalogCacheManager.STORE_NAME], mode);
            return transaction.objectStore(CatalogCacheManager.STORE_NAME);
        } catch (error) {
            console.error('[CatalogCacheManager] Failed to get object store:', error);
            return null;
        }
    }

    /**
     * Wrap IDBRequest in a Promise
     * @private
     * @param {IDBRequest} request - The IDB request to wrap
     * @param {*} defaultValue - Default value to return on error
     * @returns {Promise<*>} Request result or default value on error
     */
    _wrapRequest(request, defaultValue = null) {
        return new Promise((resolve) => {
            request.onsuccess = () => resolve(request.result);
            request.onerror = () => {
                console.error('[CatalogCacheManager] Request error:', request.error);
                resolve(defaultValue);
            };
        });
    }

    // ========================================
    // Hash Computation & Verification
    // ========================================

    /**
     * Compute SHA256 hash of data using Web Crypto API
     * @param {ArrayBuffer|Blob} data - The data to hash
     * @returns {Promise<string|null>} Hex string (64 characters) or null on failure
     *
     * @example
     * const hash = await cache.computeHash(arrayBuffer);
     * // Returns: 'a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e'
     */
    async computeHash(data) {
        try {
            // Convert Blob to ArrayBuffer if needed
            let buffer;
            if (data instanceof Blob) {
                buffer = await data.arrayBuffer();
            } else if (data instanceof ArrayBuffer) {
                buffer = data;
            } else {
                console.error('[CatalogCacheManager] computeHash: Invalid data type, expected ArrayBuffer or Blob');
                return null;
            }

            // Compute SHA-256 hash using Web Crypto API
            const hashBuffer = await crypto.subtle.digest('SHA-256', buffer);

            // Convert to hex string
            const hashArray = Array.from(new Uint8Array(hashBuffer));
            const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

            return hashHex;
        } catch (error) {
            console.error('[CatalogCacheManager] computeHash error:', error);
            return null;
        }
    }

    /**
     * Verify data integrity by comparing computed hash with expected hash
     * @param {ArrayBuffer|Blob} data - The data to verify
     * @param {string} expectedHash - The expected SHA256 hash (hex string)
     * @returns {Promise<boolean>} True if hashes match, false otherwise
     */
    async verifyHash(data, expectedHash) {
        if (!expectedHash) {
            return false;
        }

        const computedHash = await this.computeHash(data);
        if (!computedHash) {
            return false;
        }

        return computedHash === expectedHash;
    }

    // ========================================
    // CRUD Operations
    // ========================================

    /**
     * Retrieve cached container by ID
     * Updates lastAccessed timestamp on successful get
     * Optionally verifies hash if verifyOnRead is enabled
     * @param {string} entryId - The entry ID to retrieve
     * @returns {Promise<Object|null>} Entry data or null if not found
     *
     * @example
     * const entry = await cache.get('ubuntu-22.04');
     * // Returns: { id, data, metadata, size, cachedAt, lastAccessed, hash, verificationStatus }
     */
    async get(entryId) {
        const store = await this._getStore('readwrite');
        if (!store) {
            return null;
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));

            if (entry) {
                // Update lastAccessed timestamp (even for stale entries)
                entry.lastAccessed = Date.now();
                await this._wrapRequest(store.put(entry));

                // Optionally verify hash on read
                if (this.verifyOnRead && entry.hash && entry.data) {
                    const computedHash = await this.computeHash(entry.data);
                    if (computedHash && computedHash !== entry.hash) {
                        console.warn('[CatalogCacheManager] Hash mismatch on read for', entryId);
                        entry.verificationStatus = 'failed';

                        // Emit verification-failed event
                        this.emit('verification-failed', {
                            entryId: entryId,
                            expectedHash: entry.hash,
                            computedHash: computedHash
                        });
                    }
                }
            }

            return entry;
        } catch (error) {
            console.error('[CatalogCacheManager] Get error:', error);
            return null;
        }
    }

    /**
     * Retrieve cached container with full verification
     * Computes hash and compares with stored hash
     * @param {string} entryId - The entry ID to retrieve
     * @returns {Promise<{entry: Object|null, verified: boolean, computedHash: string|null, storedHash: string|null}>}
     *
     * @example
     * const result = await cache.getWithVerification('ubuntu-22.04');
     * // Returns: { entry: {...}, verified: true, computedHash: 'a591...', storedHash: 'a591...' }
     */
    async getWithVerification(entryId) {
        const store = await this._getStore('readwrite');
        if (!store) {
            return { entry: null, verified: false, computedHash: null, storedHash: null };
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));

            if (!entry) {
                return { entry: null, verified: false, computedHash: null, storedHash: null };
            }

            // Update lastAccessed timestamp
            entry.lastAccessed = Date.now();
            await this._wrapRequest(store.put(entry));

            const storedHash = entry.hash || null;
            let computedHash = null;
            let verified = false;

            if (entry.data && storedHash) {
                computedHash = await this.computeHash(entry.data);
                verified = computedHash === storedHash;

                if (!verified) {
                    console.warn('[CatalogCacheManager] Hash verification failed for', entryId,
                        '- stored:', storedHash, 'computed:', computedHash);

                    // Emit verification-failed event
                    this.emit('verification-failed', {
                        entryId: entryId,
                        expectedHash: storedHash,
                        computedHash: computedHash
                    });
                }
            }

            return {
                entry: entry,
                verified: verified,
                computedHash: computedHash,
                storedHash: storedHash
            };
        } catch (error) {
            console.error('[CatalogCacheManager] getWithVerification error:', error);
            return { entry: null, verified: false, computedHash: null, storedHash: null };
        }
    }

    /**
     * Get verification status without loading full data
     * Quick check for UI to display verification status
     * @param {string} entryId - The entry ID to check
     * @returns {Promise<string>} 'verified' | 'failed' | 'pending' | 'not-found'
     *
     * @example
     * const status = await cache.getVerificationStatus('ubuntu-22.04');
     * // Returns: 'verified'
     */
    async getVerificationStatus(entryId) {
        const store = await this._getStore('readonly');
        if (!store) {
            return 'not-found';
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));

            if (!entry) {
                return 'not-found';
            }

            return entry.verificationStatus || 'pending';
        } catch (error) {
            console.error('[CatalogCacheManager] getVerificationStatus error:', error);
            return 'not-found';
        }
    }

    /**
     * Store container in cache with hash verification
     * Automatically evicts LRU entries if cache size limit would be exceeded
     * @param {string} entryId - The entry ID to store
     * @param {ArrayBuffer|Blob} data - The container data
     * @param {Object} metadata - Metadata object with etag, hash, size, source
     * @param {string} metadata.etag - ETag from server response (optional)
     * @param {string} metadata.hash - Expected SHA256 hash for validation (optional)
     * @param {number} metadata.size - Data size in bytes (optional, computed if not provided)
     * @param {string} metadata.source - URL or server ID (optional)
     * @returns {Promise<{success: boolean, hash: string|null, verified: boolean, evicted?: string[]}>} Result object with verification status
     *
     * @example
     * const result = await cache.set('ubuntu-22.04', arrayBuffer, { etag: '"abc123"', hash: 'a591...', size: 1024000 });
     * // Returns: { success: true, hash: 'a591...', verified: true, evicted: ['old-entry-1'] }
     */
    async set(entryId, data, metadata = {}) {
        // Calculate data size before getting store
        const dataSize = metadata.size || (data.byteLength || data.size || 0);

        // Check if eviction is needed before storing
        const maxSize = this.getMaxSize();
        const currentSize = await this.getSize();

        // If existing entry is being updated, account for size change
        const existingEntry = await this._getEntryWithoutUpdate(entryId);
        const existingSize = existingEntry ? (existingEntry.size || 0) : 0;
        const netSizeChange = dataSize - existingSize;

        let evicted = [];
        if (currentSize + netSizeChange > maxSize) {
            console.log('[CatalogCacheManager] Cache size limit exceeded, evicting LRU entries...');
            evicted = await this.evictLRU(dataSize);
        }

        const store = await this._getStore('readwrite');
        if (!store) {
            return { success: false, hash: null, verified: false };
        }

        try {
            // Compute hash of the data
            const computedHash = await this.computeHash(data);

            // Determine verification status
            let verificationStatus = 'pending';
            let verified = false;

            if (metadata.hash && computedHash) {
                // Compare with expected hash if provided
                if (computedHash === metadata.hash) {
                    verificationStatus = 'verified';
                    verified = true;
                } else {
                    verificationStatus = 'failed';
                    console.warn('[CatalogCacheManager] Hash verification failed for', entryId,
                        '- expected:', metadata.hash, 'computed:', computedHash);
                }
            }

            const now = Date.now();
            const entry = {
                id: entryId,
                data: data,
                metadata: {
                    etag: metadata.etag || null,
                    size: dataSize,
                    source: metadata.source || null
                },
                size: dataSize,
                cachedAt: now,
                lastAccessed: now,
                hash: computedHash,
                verificationStatus: verificationStatus
            };

            await this._wrapRequest(store.put(entry));

            const result = {
                success: true,
                hash: computedHash,
                verified: verified
            };
            if (evicted.length > 0) {
                result.evicted = evicted;
            }
            return result;
        } catch (error) {
            console.error('[CatalogCacheManager] Set error:', error);
            return { success: false, hash: null, verified: false };
        }
    }

    /**
     * Get entry without updating lastAccessed timestamp
     * Used internally for size calculations before eviction
     * @private
     * @param {string} entryId - The entry ID to retrieve
     * @returns {Promise<Object|null>} Entry data or null if not found
     */
    async _getEntryWithoutUpdate(entryId) {
        const store = await this._getStore('readonly');
        if (!store) {
            return null;
        }

        try {
            return await this._wrapRequest(store.get(entryId));
        } catch (error) {
            return null;
        }
    }

    /**
     * Remove container from cache
     * @param {string} entryId - The entry ID to delete
     * @returns {Promise<boolean>} True if deleted, false if not found or error
     */
    async delete(entryId) {
        const store = await this._getStore('readwrite');
        if (!store) {
            return false;
        }

        try {
            // Check if entry exists first
            const existing = await this._wrapRequest(store.get(entryId));
            if (!existing) {
                return false;
            }

            await this._wrapRequest(store.delete(entryId));
            return true;
        } catch (error) {
            console.error('[CatalogCacheManager] Delete error:', error);
            return false;
        }
    }

    /**
     * Check if container exists in cache
     * @param {string} entryId - The entry ID to check
     * @returns {Promise<boolean>} True if entry exists
     */
    async has(entryId) {
        const store = await this._getStore('readonly');
        if (!store) {
            return false;
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));
            return entry !== null && entry !== undefined;
        } catch (error) {
            console.error('[CatalogCacheManager] Has error:', error);
            return false;
        }
    }

    /**
     * Get list of all cached entries (without full data)
     * @returns {Promise<Array<Object>>} Array of entry metadata objects
     *
     * @example
     * const entries = await cache.getAll();
     * // Returns: [{ id, metadata, size, cachedAt, lastAccessed }, ...]
     */
    async getAll() {
        const store = await this._getStore('readonly');
        if (!store) {
            return [];
        }

        try {
            const entries = await this._wrapRequest(store.getAll(), []);

            // Return entries without the full data payload
            return entries.map(entry => ({
                id: entry.id,
                metadata: entry.metadata,
                size: entry.size,
                cachedAt: entry.cachedAt,
                lastAccessed: entry.lastAccessed,
                etag: entry.etag,
                hash: entry.hash
            }));
        } catch (error) {
            console.error('[CatalogCacheManager] GetAll error:', error);
            return [];
        }
    }

    /**
     * Delete all cached containers
     * @returns {Promise<number>} Count of deleted entries
     */
    async clear() {
        const store = await this._getStore('readwrite');
        if (!store) {
            return 0;
        }

        try {
            // Get count before clearing
            const entries = await this._wrapRequest(store.getAll(), []);
            const count = entries.length;

            await this._wrapRequest(store.clear());
            return count;
        } catch (error) {
            console.error('[CatalogCacheManager] Clear error:', error);
            return 0;
        }
    }

    // ========================================
    // Statistics & Size Management
    // ========================================

    /**
     * Get cache statistics
     * @returns {Promise<Object>} Statistics object
     *
     * @example
     * const stats = await cache.getStats();
     * // Returns: { entryCount, totalSize, oldestEntry, newestEntry }
     */
    async getStats() {
        const entries = await this.getAll();

        if (entries.length === 0) {
            return {
                entryCount: 0,
                totalSize: 0,
                oldestEntry: null,
                newestEntry: null
            };
        }

        const totalSize = entries.reduce((sum, entry) => sum + (entry.size || 0), 0);
        const timestamps = entries.map(e => e.cachedAt).filter(t => t);
        const oldestEntry = timestamps.length > 0 ? new Date(Math.min(...timestamps)) : null;
        const newestEntry = timestamps.length > 0 ? new Date(Math.max(...timestamps)) : null;

        return {
            entryCount: entries.length,
            totalSize: totalSize,
            oldestEntry: oldestEntry,
            newestEntry: newestEntry
        };
    }

    /**
     * Get total cache size in bytes
     * @returns {Promise<number>} Total size in bytes
     */
    async getSize() {
        const store = await this._getStore('readonly');
        if (!store) {
            return 0;
        }

        try {
            const entries = await this._wrapRequest(store.getAll(), []);
            return entries.reduce((sum, entry) => sum + (entry.size || 0), 0);
        } catch (error) {
            console.error('[CatalogCacheManager] GetSize error:', error);
            return 0;
        }
    }

    /**
     * Get the maximum cache size limit in bytes
     * Reads from localStorage, defaults to 500MB
     * @returns {number} Maximum size in bytes
     */
    getMaxSize() {
        try {
            const stored = localStorage.getItem(CatalogCacheManager.MAX_SIZE_KEY);
            if (stored) {
                return parseInt(stored, 10);
            }
        } catch (error) {
            console.error('[CatalogCacheManager] getMaxSize error:', error);
        }
        return CatalogCacheManager.DEFAULT_MAX_SIZE;
    }

    /**
     * Set the maximum cache size limit in bytes
     * Persists to localStorage
     * @param {number} bytes - Maximum size in bytes
     */
    setMaxSize(bytes) {
        try {
            localStorage.setItem(CatalogCacheManager.MAX_SIZE_KEY, bytes.toString());
        } catch (error) {
            console.error('[CatalogCacheManager] setMaxSize error:', error);
        }
    }

    // ========================================
    // LRU Eviction
    // ========================================

    /**
     * Evict entries using LRU (Least Recently Used) policy to make room
     * @param {number} bytesNeeded - Number of bytes needed for new entry
     * @returns {Promise<string[]>} Array of evicted entry IDs
     *
     * @example
     * const evicted = await cache.evictLRU(1024000);
     * // Evicts oldest entries until there's room for 1MB
     */
    async evictLRU(bytesNeeded) {
        const store = await this._getStore('readwrite');
        if (!store) {
            return [];
        }

        try {
            const maxSize = this.getMaxSize();
            const currentSize = await this.getSize();
            const targetSize = maxSize - bytesNeeded;

            // Check if eviction is needed
            if (currentSize <= targetSize) {
                console.log('[CatalogCacheManager] No eviction needed, current size:', currentSize, 'max:', maxSize);
                return [];
            }

            // Get all entries sorted by lastAccessed (oldest first)
            const entries = await this._wrapRequest(store.getAll(), []);
            const sortedEntries = entries.sort((a, b) => (a.lastAccessed || 0) - (b.lastAccessed || 0));

            const evictedIds = [];
            let freedBytes = 0;
            let runningSize = currentSize;

            for (const entry of sortedEntries) {
                if (runningSize <= targetSize) {
                    break;
                }

                const entrySize = entry.size || 0;
                await this._wrapRequest(store.delete(entry.id));
                evictedIds.push(entry.id);
                freedBytes += entrySize;
                runningSize -= entrySize;

                console.log('[CatalogCacheManager] Evicted LRU entry:', entry.id, 'freed:', entrySize, 'bytes');
            }

            // Emit eviction event
            if (evictedIds.length > 0) {
                this.emit('cache-evicted', { entryIds: evictedIds, freedBytes: freedBytes });
                console.log('[CatalogCacheManager] LRU eviction complete. Evicted:', evictedIds.length, 'entries, freed:', freedBytes, 'bytes');
            }

            return evictedIds;
        } catch (error) {
            console.error('[CatalogCacheManager] evictLRU error:', error);
            return [];
        }
    }

    /**
     * Get the next N entries that would be evicted by LRU policy
     * Useful for UI showing "low space" warnings
     * @param {number} count - Number of candidates to return
     * @returns {Promise<Array<Object>>} Array of entry metadata (without data)
     *
     * @example
     * const candidates = await cache.getEvictionCandidates(5);
     * // Returns next 5 entries that would be evicted
     */
    async getEvictionCandidates(count = 5) {
        const store = await this._getStore('readonly');
        if (!store) {
            return [];
        }

        try {
            const entries = await this._wrapRequest(store.getAll(), []);

            // Sort by lastAccessed (oldest first) and take first N
            const sortedEntries = entries
                .sort((a, b) => (a.lastAccessed || 0) - (b.lastAccessed || 0))
                .slice(0, count);

            // Return entries without the full data payload
            return sortedEntries.map(entry => ({
                id: entry.id,
                metadata: entry.metadata,
                size: entry.size,
                cachedAt: entry.cachedAt,
                lastAccessed: entry.lastAccessed,
                hash: entry.hash,
                verificationStatus: entry.verificationStatus
            }));
        } catch (error) {
            console.error('[CatalogCacheManager] getEvictionCandidates error:', error);
            return [];
        }
    }

    // ========================================
    // Stale Detection & Revalidation
    // ========================================

    /**
     * Check if a cache entry is stale based on cachedAt timestamp
     * An entry is stale if it exceeds the maxAge configuration
     * @param {Object} entry - Cache entry object
     * @returns {boolean} True if entry is stale
     *
     * @example
     * const entry = await cache.get('ubuntu-22.04');
     * if (cache.isStale(entry)) {
     *   // Consider revalidation
     * }
     */
    isStale(entry) {
        if (!entry || !entry.cachedAt) {
            return true; // Missing entry or timestamp is considered stale
        }

        const age = Date.now() - entry.cachedAt;
        return age > this.maxAge;
    }

    /**
     * Check if a cache entry needs revalidation with the server
     * Returns true if entry is stale AND past the staleWhileRevalidate window
     * Returns false if entry is fresh or within staleWhileRevalidate grace period
     * @param {Object} entry - Cache entry object
     * @returns {boolean} True if entry needs server revalidation
     *
     * @example
     * const entry = await cache.get('ubuntu-22.04');
     * if (cache.needsRevalidation(entry)) {
     *   // Must fetch fresh data before use
     * }
     */
    needsRevalidation(entry) {
        if (!entry || !entry.cachedAt) {
            return true; // Missing entry needs revalidation
        }

        const age = Date.now() - entry.cachedAt;
        const revalidationThreshold = this.maxAge + this.staleWhileRevalidate;
        return age > revalidationThreshold;
    }

    /**
     * Get detailed staleness information for a cache entry
     * @param {string} entryId - The entry ID to check
     * @returns {Promise<Object|null>} Staleness info or null if entry not found
     *
     * @example
     * const status = await cache.getStaleStatus('ubuntu-22.04');
     * // Returns: { isStale: true, needsRevalidation: false, age: 650000000, maxAge: 604800000, remainingTTL: 43200000 }
     */
    async getStaleStatus(entryId) {
        const store = await this._getStore('readonly');
        if (!store) {
            return null;
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));

            if (!entry) {
                return null;
            }

            const now = Date.now();
            const age = entry.cachedAt ? (now - entry.cachedAt) : Infinity;
            const revalidationThreshold = this.maxAge + this.staleWhileRevalidate;

            // Calculate remaining TTL (time until revalidation required)
            let remainingTTL = revalidationThreshold - age;
            if (remainingTTL < 0) {
                remainingTTL = 0; // Already past threshold
            }

            return {
                isStale: this.isStale(entry),
                needsRevalidation: this.needsRevalidation(entry),
                age: age,
                maxAge: this.maxAge,
                staleWhileRevalidate: this.staleWhileRevalidate,
                remainingTTL: remainingTTL,
                cachedAt: entry.cachedAt
            };
        } catch (error) {
            console.error('[CatalogCacheManager] getStaleStatus error:', error);
            return null;
        }
    }

    // ========================================
    // ETag-based Revalidation
    // ========================================

    /**
     * Revalidate a cache entry with the server using ETag
     * Implements conditional fetch pattern (If-None-Match header)
     * @param {string} entryId - The entry ID to revalidate
     * @param {Function} fetchCallback - Async function that performs conditional fetch
     * @param {string} fetchCallback.etag - The stored ETag to send
     * @returns {Promise<{revalidated: boolean, updated: boolean, entry?: Object}>} Result object
     *
     * fetchCallback signature: async (etag) => { data, metadata, changed: boolean }
     * - If server returns 304 (not changed): return { changed: false }
     * - If server returns new data: return { data: ArrayBuffer, metadata: {...}, changed: true }
     *
     * @example
     * const result = await cache.revalidate('ubuntu-22.04', async (etag) => {
     *   const response = await fetch(url, { headers: { 'If-None-Match': etag } });
     *   if (response.status === 304) return { changed: false };
     *   return { data: await response.arrayBuffer(), metadata: { etag: response.headers.get('ETag') }, changed: true };
     * });
     */
    async revalidate(entryId, fetchCallback) {
        const store = await this._getStore('readwrite');
        if (!store) {
            return { revalidated: false, updated: false };
        }

        try {
            const entry = await this._wrapRequest(store.get(entryId));

            if (!entry) {
                console.warn('[CatalogCacheManager] Cannot revalidate: entry not found:', entryId);
                return { revalidated: false, updated: false };
            }

            const etag = entry.metadata?.etag || entry.etag || null;

            // Call the fetch callback with the stored ETag
            const fetchResult = await fetchCallback(etag);

            if (!fetchResult.changed) {
                // Server returned 304 - not modified
                // Update cachedAt timestamp to extend freshness
                entry.cachedAt = Date.now();
                entry.verificationStatus = 'verified';
                await this._wrapRequest(store.put(entry));

                this.emit('entry-revalidated', { entryId: entryId, updated: false });

                console.log('[CatalogCacheManager] Entry revalidated (not modified):', entryId);

                return {
                    revalidated: true,
                    updated: false,
                    entry: entry
                };
            }

            // Server returned new data - update cache
            if (fetchResult.data) {
                const setMetadata = {
                    etag: fetchResult.metadata?.etag || etag,
                    hash: fetchResult.metadata?.hash,
                    size: fetchResult.metadata?.size,
                    source: fetchResult.metadata?.source
                };

                const setResult = await this.set(entryId, fetchResult.data, setMetadata);

                if (setResult.success) {
                    this.emit('entry-revalidated', { entryId: entryId, updated: true });

                    console.log('[CatalogCacheManager] Entry revalidated and updated:', entryId);

                    // Get the updated entry
                    const updatedEntry = await this._wrapRequest(store.get(entryId));

                    return {
                        revalidated: true,
                        updated: true,
                        entry: updatedEntry
                    };
                }
            }

            return { revalidated: false, updated: false };
        } catch (error) {
            console.error('[CatalogCacheManager] revalidate error:', error);
            return { revalidated: false, updated: false };
        }
    }

    /**
     * Get entry with automatic revalidation based on staleness
     * Implements stale-while-revalidate pattern
     * @param {string} entryId - The entry ID to retrieve
     * @param {Function} fetchCallback - Async function for conditional fetch (see revalidate)
     * @returns {Promise<Object|null>} Entry data (stale or fresh) or null if not found
     *
     * @example
     * const entry = await cache.getOrRevalidate('ubuntu-22.04', async (etag) => {
     *   // ... conditional fetch logic
     * });
     */
    async getOrRevalidate(entryId, fetchCallback) {
        // First, get the entry (this also updates lastAccessed)
        const entry = await this.get(entryId);

        if (!entry) {
            return null;
        }

        // Check if entry needs revalidation
        if (this.needsRevalidation(entry)) {
            // Entry is past grace period - must fetch fresh data
            console.log('[CatalogCacheManager] Entry needs revalidation:', entryId);

            const result = await this.revalidate(entryId, fetchCallback);

            if (result.revalidated) {
                return result.entry || entry;
            }

            // If revalidation failed, return stale entry anyway
            console.warn('[CatalogCacheManager] Revalidation failed, returning stale entry:', entryId);
            return entry;
        }

        // Entry is fresh or within staleWhileRevalidate window
        // Return immediately (background revalidation is optional and handled by caller)
        return entry;
    }

    /**
     * Create a revalidation fetcher function for CatalogBridge integration
     * Helper to create fetchCallback for use with revalidate() or getOrRevalidate()
     * @param {Object} catalogBridge - CatalogBridge instance with fetchContainer method
     * @param {string} entryId - The entry ID to fetch
     * @returns {Function} Async fetchCallback function
     *
     * @example
     * const fetcher = cache.createRevalidationFetcher(catalogBridge, 'ubuntu-22.04');
     * const result = await cache.revalidate('ubuntu-22.04', fetcher);
     */
    createRevalidationFetcher(catalogBridge, entryId) {
        return async (etag) => {
            try {
                // CatalogBridge should support conditional fetch with If-None-Match
                // If it returns null/304, data is not modified
                const result = await catalogBridge.fetchContainer(entryId, {
                    headers: etag ? { 'If-None-Match': etag } : {}
                });

                // Check if not modified (304)
                if (result && result.notModified) {
                    return { changed: false };
                }

                // Check if we got new data
                if (result && result.data) {
                    return {
                        data: result.data,
                        metadata: {
                            etag: result.etag || result.metadata?.etag,
                            hash: result.hash || result.metadata?.hash,
                            size: result.size || result.metadata?.size,
                            source: result.source || result.metadata?.source
                        },
                        changed: true
                    };
                }

                // Fallback: assume not modified if no data
                return { changed: false };
            } catch (error) {
                console.error('[CatalogCacheManager] Revalidation fetcher error:', error);
                return { changed: false };
            }
        };
    }

    // ========================================
    // Cache Management Utilities
    // ========================================

    /**
     * Remove all stale entries that need revalidation
     * @returns {Promise<number>} Count of deleted entries
     *
     * @example
     * const deleted = await cache.evictAllStale();
     * console.log('Removed', deleted, 'stale entries');
     */
    async evictAllStale() {
        const store = await this._getStore('readwrite');
        if (!store) {
            return 0;
        }

        try {
            const entries = await this._wrapRequest(store.getAll(), []);
            let deletedCount = 0;
            const deletedIds = [];
            let freedBytes = 0;

            for (const entry of entries) {
                if (this.needsRevalidation(entry)) {
                    const entrySize = entry.size || 0;
                    await this._wrapRequest(store.delete(entry.id));
                    deletedIds.push(entry.id);
                    freedBytes += entrySize;
                    deletedCount++;
                }
            }

            if (deletedCount > 0) {
                this.emit('cache-evicted', { entryIds: deletedIds, freedBytes: freedBytes });
                console.log('[CatalogCacheManager] Evicted all stale entries:', deletedCount, 'freed:', freedBytes, 'bytes');
            }

            return deletedCount;
        } catch (error) {
            console.error('[CatalogCacheManager] evictAllStale error:', error);
            return 0;
        }
    }

    /**
     * Get a comprehensive cache status report for UI display
     * @returns {Promise<Object>} Cache report object
     *
     * @example
     * const report = await cache.getCacheReport();
     * // Returns: {
     * //   entryCount: 5,
     * //   totalSize: 524288000,
     * //   maxSize: 524288000,
     * //   percentUsed: 100,
     * //   staleCount: 2,
     * //   pendingRevalidationCount: 1,
     * //   oldestEntry: Date,
     * //   averageAge: 345600000
     * // }
     */
    async getCacheReport() {
        const store = await this._getStore('readonly');
        if (!store) {
            return {
                entryCount: 0,
                totalSize: 0,
                maxSize: this.getMaxSize(),
                percentUsed: 0,
                staleCount: 0,
                pendingRevalidationCount: 0,
                oldestEntry: null,
                averageAge: 0
            };
        }

        try {
            const entries = await this._wrapRequest(store.getAll(), []);
            const now = Date.now();

            const totalSize = entries.reduce((sum, entry) => sum + (entry.size || 0), 0);
            const maxSize = this.getMaxSize();

            // Count stale and pending revalidation
            let staleCount = 0;
            let pendingRevalidationCount = 0;
            let totalAge = 0;
            let oldestTimestamp = Infinity;

            for (const entry of entries) {
                if (this.isStale(entry)) {
                    staleCount++;
                }
                if (this.needsRevalidation(entry)) {
                    pendingRevalidationCount++;
                }

                if (entry.cachedAt) {
                    totalAge += (now - entry.cachedAt);
                    if (entry.cachedAt < oldestTimestamp) {
                        oldestTimestamp = entry.cachedAt;
                    }
                }
            }

            const averageAge = entries.length > 0 ? Math.round(totalAge / entries.length) : 0;

            return {
                entryCount: entries.length,
                totalSize: totalSize,
                maxSize: maxSize,
                percentUsed: maxSize > 0 ? Math.round((totalSize / maxSize) * 100) : 0,
                staleCount: staleCount,
                pendingRevalidationCount: pendingRevalidationCount,
                oldestEntry: oldestTimestamp !== Infinity ? new Date(oldestTimestamp) : null,
                averageAge: averageAge
            };
        } catch (error) {
            console.error('[CatalogCacheManager] getCacheReport error:', error);
            return {
                entryCount: 0,
                totalSize: 0,
                maxSize: this.getMaxSize(),
                percentUsed: 0,
                staleCount: 0,
                pendingRevalidationCount: 0,
                oldestEntry: null,
                averageAge: 0
            };
        }
    }

    /**
     * Update cache configuration settings
     * Persists settings to localStorage for session continuity
     * @param {Object} options - Configuration options to update
     * @param {number} options.maxSize - Maximum cache size in bytes
     * @param {number} options.maxAge - Maximum cache age in milliseconds
     * @param {number} options.staleWhileRevalidate - Grace period for stale entries in milliseconds
     * @param {boolean} options.verifyOnRead - Verify hash on every read
     *
     * @example
     * cache.configure({ maxSize: 1024 * 1024 * 1024, maxAge: 14 * 24 * 60 * 60 * 1000 });
     */
    configure(options = {}) {
        try {
            // Update instance properties
            if (options.maxSize !== undefined) {
                this.setMaxSize(options.maxSize);
            }
            if (options.maxAge !== undefined) {
                this.maxAge = options.maxAge;
            }
            if (options.staleWhileRevalidate !== undefined) {
                this.staleWhileRevalidate = options.staleWhileRevalidate;
            }
            if (options.verifyOnRead !== undefined) {
                this.verifyOnRead = options.verifyOnRead;
            }

            // Persist to localStorage
            const config = {
                maxAge: this.maxAge,
                staleWhileRevalidate: this.staleWhileRevalidate
            };
            localStorage.setItem(CatalogCacheManager.CONFIG_KEY, JSON.stringify(config));

            console.log('[CatalogCacheManager] Configuration updated:', {
                maxSize: this.getMaxSize(),
                maxAge: this.maxAge,
                staleWhileRevalidate: this.staleWhileRevalidate,
                verifyOnRead: this.verifyOnRead
            });
        } catch (error) {
            console.error('[CatalogCacheManager] configure error:', error);
        }
    }
