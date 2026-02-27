/**
 * CatalogCacheManager - IndexedDB-based caching for container data
 *
 * Provides persistent browser storage for downloaded containers,
 * enabling offline access to previously downloaded containers.
 *
 * Uses native IndexedDB API with no external dependencies.
 *
 * @module CatalogCacheManager
 */

class CatalogCacheManager {
    /**
     * Database configuration
     * @private
     */
    static DB_NAME = 'gos-cache';
    static DB_VERSION = 1;
    static STORE_NAME = 'containers';
    static DEFAULT_MAX_SIZE = 500 * 1024 * 1024; // 500MB

    /**
     * Create a CatalogCacheManager instance
     * @param {Object} options - Configuration options
     * @param {string} options.dbName - Database name (default: 'gos-cache')
     * @param {number} options.dbVersion - Database version (default: 1)
     */
    constructor(options = {}) {
        this.dbName = options.dbName || CatalogCacheManager.DB_NAME;
        this.dbVersion = options.dbVersion || CatalogCacheManager.DB_VERSION;
        this.db = null;
        this._initPromise = null;
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
}

// ES6 module export
export { CatalogCacheManager };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.CatalogCacheManager = CatalogCacheManager;
}
