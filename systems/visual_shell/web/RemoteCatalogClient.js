/**
 * RemoteCatalogClient - Multi-server catalog aggregation with stale-while-revalidate
 *
 * Fetches and aggregates container catalogs from multiple remote servers.
 * Provides cached responses for immediate UI display while fetching fresh
 * data in the background.
 *
 * Features:
 * - Parallel fetching from multiple servers
 * - 10-second timeout per server request
 * - Stale-while-revalidate pattern for responsive UI
 * - Source tagging for entries (sourceServerId, sourceServerName)
 * - Error tracking per server
 *
 * @module RemoteCatalogClient
 */

import { ServerRegistry } from './ServerRegistry.js';

class RemoteCatalogClient {
    /**
     * Default request timeout in milliseconds
     * @static
     */
    static DEFAULT_TIMEOUT = 10000;

    /**
     * Catalog API endpoint path
     * @static
     */
    static CATALOG_ENDPOINT = '/api/v1/catalog';

    /**
     * Create a RemoteCatalogClient instance
     * @param {Object} options - Configuration options
     * @param {number} options.timeout - Request timeout in ms (default: 10000)
     */
    constructor(options = {}) {
        this.timeout = options.timeout || RemoteCatalogClient.DEFAULT_TIMEOUT;
        this.registry = new ServerRegistry();

        // Catalog cache: serverId -> { entries, fetchedAt, etag }
        this._cache = new Map();

        // Aggregated catalog from last fetchAllCatalogs
        this._aggregatedCatalog = {
            entries: [],
            errors: [],
            fetchedAt: null
        };

        // Pending background fetches
        this._pendingFetches = new Map();
    }

    /**
     * Create an AbortController with timeout
     * @private
     * @returns {Object} Object containing signal and timeoutId
     */
    _createTimeoutSignal() {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), this.timeout);
        return { signal: controller.signal, timeoutId };
    }

    /**
     * Fetch catalog from a single server
     * @param {Object} server - Server object from ServerRegistry
     * @returns {Promise<Object>} Result object { success, entries, error, serverId }
     *
     * @example
     * const result = await client.fetchServerCatalog(server);
     * // { success: true, entries: [...], error: null, serverId: 'uuid' }
     */
    async fetchServerCatalog(server) {
        const { signal, timeoutId } = this._createTimeoutSignal();
        const url = `${server.url}${RemoteCatalogClient.CATALOG_ENDPOINT}`;

        try {
            console.log(`[RemoteCatalogClient] Fetching catalog from ${server.name}...`);

            const response = await fetch(url, {
                method: 'GET',
                signal,
                headers: {
                    'Accept': 'application/json'
                }
            });

            clearTimeout(timeoutId);

            if (!response.ok) {
                const errorMsg = `HTTP ${response.status}: ${response.statusText}`;
                this.registry.setServerStatus(server.id, 'error', errorMsg);

                return {
                    success: false,
                    entries: [],
                    error: errorMsg,
                    serverId: server.id,
                    serverName: server.name
                };
            }

            const data = await response.json();
            const entries = data.entries || [];

            // Tag each entry with source server metadata
            const taggedEntries = entries.map(entry => ({
                ...entry,
                sourceServerId: server.id,
                sourceServerName: server.name,
                sourceServerColor: server.color,
                sourceServerUrl: server.url
            }));

            // Update cache
            const etag = response.headers.get('ETag');
            this._cache.set(server.id, {
                entries: taggedEntries,
                fetchedAt: Date.now(),
                etag: etag
            });

            // Update server status
            this.registry.setServerStatus(server.id, 'ok', null);

            console.log(`[RemoteCatalogClient] Fetched ${taggedEntries.length} entries from ${server.name}`);

            return {
                success: true,
                entries: taggedEntries,
                error: null,
                serverId: server.id,
                serverName: server.name
            };

        } catch (error) {
            clearTimeout(timeoutId);

            let errorMsg;
            if (error.name === 'AbortError') {
                errorMsg = `Request timeout after ${this.timeout}ms`;
            } else {
                errorMsg = error.message || 'Network error';
            }

            this.registry.setServerStatus(server.id, 'error', errorMsg);

            console.error(`[RemoteCatalogClient] Failed to fetch from ${server.name}:`, errorMsg);

            return {
                success: false,
                entries: [],
                error: errorMsg,
                serverId: server.id,
                serverName: server.name
            };
        }
    }

    /**
     * Fetch catalogs from all enabled servers in parallel
     * @param {Object} options - Fetch options
     * @param {boolean} options.forceRefresh - Bypass cache and fetch fresh
     * @returns {Promise<Object>} Aggregated result { entries, errors, fetchedAt }
     *
     * @example
     * const result = await client.fetchAllCatalogs();
     * // { entries: [...], errors: [{serverId, serverName, error}], fetchedAt: timestamp }
     */
    async fetchAllCatalogs(options = {}) {
        const servers = this.registry.getEnabledServers();

        if (servers.length === 0) {
            console.log('[RemoteCatalogClient] No enabled servers to fetch from');
            this._aggregatedCatalog = {
                entries: [],
                errors: [],
                fetchedAt: Date.now()
            };
            return this._aggregatedCatalog;
        }

        console.log(`[RemoteCatalogClient] Fetching from ${servers.length} enabled servers...`);

        // Fetch all servers in parallel
        const results = await Promise.allSettled(
            servers.map(server => this.fetchServerCatalog(server))
        );

        // Aggregate results
        const allEntries = [];
        const errors = [];

        for (const result of results) {
            if (result.status === 'fulfilled') {
                const { success, entries, error, serverId, serverName } = result.value;

                if (success) {
                    allEntries.push(...entries);
                } else if (error) {
                    errors.push({ serverId, serverName, error });
                }
            } else {
                // Promise rejected (shouldn't happen with our error handling, but be safe)
                console.error('[RemoteCatalogClient] Unexpected promise rejection:', result.reason);
            }
        }

        // Update aggregated catalog
        this._aggregatedCatalog = {
            entries: allEntries,
            errors: errors,
            fetchedAt: Date.now()
        };

        console.log(`[RemoteCatalogClient] Aggregated ${allEntries.length} entries, ${errors.length} errors`);

        return this._aggregatedCatalog;
    }

    /**
     * Get cached aggregated catalog (no network request)
     * Returns data from last fetchAllCatalogs call
     * @returns {Object} Cached catalog { entries, errors, fetchedAt }
     */
    getAggregatedCatalog() {
        return this._aggregatedCatalog;
    }

    /**
     * Get cached entries for a specific server
     * @param {string} serverId - Server ID
     * @returns {Array|null} Cached entries or null if not cached
     */
    getCachedEntries(serverId) {
        const cached = this._cache.get(serverId);
        return cached ? cached.entries : null;
    }

    /**
     * Get cache info for all servers
     * @returns {Array<Object>} Array of { serverId, entryCount, fetchedAt, age }
     */
    getCacheInfo() {
        const info = [];
        const now = Date.now();

        for (const [serverId, cached] of this._cache.entries()) {
            info.push({
                serverId,
                entryCount: cached.entries.length,
                fetchedAt: cached.fetchedAt,
                age: now - cached.fetchedAt,
                etag: cached.etag
            });
        }

        return info;
    }

    /**
     * Check if cached data is stale (older than threshold)
     * @param {number} maxAge - Maximum age in milliseconds
     * @returns {boolean} True if cache is stale or empty
     */
    isCacheStale(maxAge = 60000) {
        if (!this._aggregatedCatalog.fetchedAt) {
            return true;
        }
        return (Date.now() - this._aggregatedCatalog.fetchedAt) > maxAge;
    }

    /**
     * Fetch with stale-while-revalidate pattern
     *
     * Immediately invokes callback with cached data (if any), then fetches
     * fresh data in background and invokes callback again when complete.
     *
     * @param {Function} callback - Called with (data, isStale) => {}
     * @param {Object} options - Fetch options
     * @param {number} options.maxAge - Cache max age before considering stale (default: 60000ms)
     * @returns {Promise<void>} Resolves when background fetch completes
     *
     * @example
     * await client.fetchWithStaleWhileRevalidate((data, isStale) => {
     *     if (isStale) {
     *         console.log('Showing cached data while refreshing...');
     *     }
     *     updateUI(data.entries);
     * });
     */
    async fetchWithStaleWhileRevalidate(callback, options = {}) {
        const maxAge = options.maxAge || 60000;
        const hasCache = this._aggregatedCatalog.fetchedAt !== null;
        const isStale = this.isCacheStale(maxAge);

        // If we have cached data, return it immediately
        if (hasCache) {
            callback(this._aggregatedCatalog, isStale);
        }

        // If cache is fresh, no need to revalidate
        if (!isStale && hasCache) {
            console.log('[RemoteCatalogClient] Cache is fresh, skipping revalidation');
            return;
        }

        // Fetch fresh data in background
        console.log('[RemoteCatalogClient] Fetching fresh data (stale-while-revalidate)...');

        try {
            const freshData = await this.fetchAllCatalogs();

            // Only notify if we didn't have cache (first load) or data changed
            if (!hasCache) {
                callback(freshData, false);
            } else {
                // Compare entry counts as simple change detection
                // UI can choose to update or not based on isStale flag
                callback(freshData, false);
            }
        } catch (error) {
            console.error('[RemoteCatalogClient] Background fetch failed:', error.message);

            // If we don't have cache, report error
            if (!hasCache) {
                callback({
                    entries: [],
                    errors: [{ serverId: null, serverName: null, error: error.message }],
                    fetchedAt: Date.now()
                }, false);
            }
        }
    }

    /**
     * Clear all cached data
     */
    clearCache() {
        this._cache.clear();
        this._aggregatedCatalog = {
            entries: [],
            errors: [],
            fetchedAt: null
        };
        console.log('[RemoteCatalogClient] Cache cleared');
    }

    /**
     * Clear cache for a specific server
     * @param {string} serverId - Server ID
     */
    clearServerCache(serverId) {
        this._cache.delete(serverId);
        console.log(`[RemoteCatalogClient] Cache cleared for server ${serverId}`);
    }

    /**
     * Get the ServerRegistry instance for direct manipulation
     * @returns {ServerRegistry} The registry instance
     */
    getRegistry() {
        return this.registry;
    }

    /**
     * Get total entry count across all cached servers
     * @returns {number} Total cached entries
     */
    getTotalCachedEntries() {
        let total = 0;
        for (const cached of this._cache.values()) {
            total += cached.entries.length;
        }
        return total;
    }

    /**
     * Find entries matching a query across all cached catalogs
     * @param {Object} query - Query object
     * @param {string} query.name - Filter by name (partial match)
     * @param {string} query.id - Filter by exact ID
     * @param {string} query.serverId - Filter by source server ID
     * @returns {Array<Object>} Matching entries
     */
    searchEntries(query = {}) {
        let entries = [...this._aggregatedCatalog.entries];

        if (query.id) {
            entries = entries.filter(e => e.id === query.id);
        }

        if (query.name) {
            const nameLower = query.name.toLowerCase();
            entries = entries.filter(e =>
                e.name && e.name.toLowerCase().includes(nameLower)
            );
        }

        if (query.serverId) {
            entries = entries.filter(e => e.sourceServerId === query.serverId);
        }

        return entries;
    }

    /**
     * Group entries by source server
     * @returns {Object} Map of serverId -> entries[]
     */
    getEntriesByServer() {
        const grouped = {};

        for (const entry of this._aggregatedCatalog.entries) {
            const serverId = entry.sourceServerId;
            if (!grouped[serverId]) {
                grouped[serverId] = {
                    serverName: entry.sourceServerName,
                    serverColor: entry.sourceServerColor,
                    entries: []
                };
            }
            grouped[serverId].entries.push(entry);
        }

        return grouped;
    }

    /**
     * Check health of all servers (lightweight ping)
     * @returns {Promise<Object>} Health status per server
     */
    async checkServersHealth() {
        const servers = this.registry.getServers();
        const results = {};

        await Promise.allSettled(
            servers.map(async (server) => {
                try {
                    // Use a short timeout for health check
                    const controller = new AbortController();
                    const timeoutId = setTimeout(() => controller.abort(), 5000);

                    const response = await fetch(`${server.url}/api/v1/health`, {
                        method: 'GET',
                        signal: controller.signal
                    });

                    clearTimeout(timeoutId);

                    if (response.ok) {
                        results[server.id] = { healthy: true, status: response.status };
                        this.registry.setServerStatus(server.id, 'ok', null);
                    } else {
                        results[server.id] = { healthy: false, status: response.status };
                        this.registry.setServerStatus(server.id, 'error', `HTTP ${response.status}`);
                    }
                } catch (error) {
                    results[server.id] = { healthy: false, error: error.message };
                    this.registry.setServerStatus(server.id, 'error', error.message);
                }
            })
        );

        return results;
    }
}

// ES6 module export
export { RemoteCatalogClient };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.RemoteCatalogClient = RemoteCatalogClient;
}
