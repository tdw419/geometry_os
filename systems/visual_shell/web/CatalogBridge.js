/**
 * CatalogBridge - API client for communicating with the catalog server
 *
 * Provides methods to fetch catalog entries, boot containers, update layout,
 * and refresh the catalog. Uses native fetch API with error handling.
 *
 * Features:
 * - Cache-first fetching with stale-while-revalidate pattern
 * - Offline access to previously downloaded containers
 * - Background revalidation for stale cache entries
 *
 * @module CatalogBridge
 */

import { CatalogCacheManager } from './CatalogCacheManager.js';

class CatalogBridge {
    /**
     * Create a CatalogBridge instance
     * @param {string} baseUrl - Base URL of the catalog server (default: http://localhost:8080)
     * @param {Object} options - Configuration options
     * @param {number} options.timeout - Request timeout in milliseconds (default: 5000)
     */
    constructor(baseUrl = 'http://localhost:8080', options = {}) {
        this.baseUrl = baseUrl.replace(/\/$/, ''); // Remove trailing slash
        this.timeout = options.timeout || 5000;
        this.lastFetchTime = null;
        this.cachedCatalog = null;
        this._activePolls = new Map(); // pollId -> { entryId, callback, interval }
        this.cache = new CatalogCacheManager(); // IndexedDB cache for offline access
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
     * Make a fetch request with timeout and error handling
     * @private
     * @param {string} endpoint - API endpoint path
     * @param {Object} options - Fetch options
     * @returns {Promise<Object|null>} Response data or null on failure
     */
    async _fetch(endpoint, options = {}) {
        const { signal, timeoutId } = this._createTimeoutSignal();

        try {
            const response = await fetch(`${this.baseUrl}${endpoint}`, {
                ...options,
                signal,
                headers: {
                    'Content-Type': 'application/json',
                    ...options.headers
                }
            });

            clearTimeout(timeoutId);

            if (!response.ok) {
                console.error(`[CatalogBridge] HTTP ${response.status}: ${response.statusText} for ${endpoint}`);
                return null;
            }

            const data = await response.json();
            return data;
        } catch (error) {
            clearTimeout(timeoutId);

            if (error.name === 'AbortError') {
                console.error(`[CatalogBridge] Request timeout for ${endpoint}`);
            } else {
                console.error(`[CatalogBridge] Network error for ${endpoint}:`, error.message);
            }
            return null;
        }
    }

    /**
     * Fetch the full catalog from the server
     * @returns {Promise<Object|null>} Catalog data with entries array, or null on failure
     *
     * @example
     * const catalog = await bridge.getCatalog();
     * // Returns: { entries: [{ id, name, thumbnail, status, layout, ... }], version: "1.0" }
     */
    async getCatalog() {
        const data = await this._fetch('/api/v1/catalog');

        if (data) {
            this.lastFetchTime = Date.now();
            this.cachedCatalog = data;

            // Map server's position.{x,y} to client's expected layout.{gridX,gridY}
            if (data.entries) {
                data.entries = data.entries.map(entry => ({
                    ...entry,
                    layout: {
                        gridX: entry.position?.x || 0,
                        gridY: entry.position?.y || 0
                    }
                }));
            }
        }

        return data;
    }

    /**
     * Get a single catalog entry by ID
     * @param {string} entryId - The entry ID to fetch
     * @returns {Promise<Object|null>} Entry data or null if not found
     */
    async getEntry(entryId) {
        // First check cache
        if (this.cachedCatalog?.entries) {
            const cached = this.cachedCatalog.entries.find(e => e.id === entryId);
            if (cached) return cached;
        }

        // Fetch from server
        const data = await this._fetch(`/api/v1/catalog/${encodeURIComponent(entryId)}`);
        return data;
    }

    /**
     * Get container data with cache-first strategy and stale-while-revalidate
     *
     * This method implements a cache-first fetching pattern:
     * 1. Try to get data from IndexedDB cache
     * 2. If cached and fresh, return immediately
     * 3. If cached but stale, return cached data AND trigger background revalidation
     * 4. If not cached, fetch from network and store in cache
     *
     * @param {string} entryId - The entry ID to fetch
     * @param {Object} options - Fetch options
     * @param {boolean} options.forceRefresh - Bypass cache and fetch fresh data
     * @returns {Promise<Object|null>} Container data or null on failure
     *
     * @example
     * // Normal cache-first fetch
     * const data = await bridge.getContainerData('ubuntu-22.04');
     *
     * // Force refresh from network
     * const freshData = await bridge.getContainerData('ubuntu-22.04', { forceRefresh: true });
     */
    async getContainerData(entryId, options = {}) {
        // Initialize cache if needed
        if (!this.cache._initialized) {
            await this.cache.init();
        }

        // Force refresh bypasses cache
        if (!options.forceRefresh) {
            // Check if we have a cache hit
            const cachedData = await this.cache.get(entryId);

            if (cachedData) {
                // Check staleness
                const staleStatus = await this.cache.getStaleStatus(entryId);

                if (staleStatus.isStale && !staleStatus.isExpired) {
                    // Stale but usable - trigger background revalidation
                    this._revalidateInBackground(entryId);
                }

                // Return cached data immediately (stale-while-revalidate pattern)
                return cachedData;
            }
        }

        // Cache miss or force refresh - fetch from network
        const networkData = await this._fetchContainerData(entryId);

        if (networkData) {
            // Store in cache for future offline access
            await this.cache.set(entryId, networkData.data, {
                etag: networkData.etag,
                hash: networkData.hash,
                source: 'network'
            });
            return networkData.data;
        }

        // Network failed - try to return stale cached data as last resort
        const staleFallback = await this.cache.get(entryId);
        if (staleFallback) {
            console.warn(`[CatalogBridge] Network fetch failed, returning stale cache for ${entryId}`);
        }
        return staleFallback;
    }

    /**
     * Fetch container data from the network
     * @private
     * @param {string} entryId - The entry ID to fetch
     * @returns {Promise<Object|null>} Object with data, etag, and hash or null on failure
     */
    async _fetchContainerData(entryId) {
        try {
            const response = await fetch(`${this.baseUrl}/api/v1/catalog/${encodeURIComponent(entryId)}/data`, {
                headers: {
                    'Accept': 'application/octet-stream'
                }
            });

            if (!response.ok) {
                console.error(`[CatalogBridge] Failed to fetch container data: HTTP ${response.status}`);
                return null;
            }

            const etag = response.headers.get('ETag');
            const data = await response.arrayBuffer();

            return {
                data: data,
                etag: etag,
                hash: null // Will be computed by cache.set if needed
            };
        } catch (error) {
            console.error(`[CatalogBridge] Network error fetching container data:`, error.message);
            return null;
        }
    }

    /**
     * Trigger background revalidation for a stale cache entry
     * @private
     * @param {string} entryId - The entry ID to revalidate
     */
    _revalidateInBackground(entryId) {
        // Use the cache's built-in revalidation with ETag support
        this.cache.revalidate(entryId, async () => {
            const result = await this._fetchContainerData(entryId);
            return result;
        }).catch(error => {
            console.warn(`[CatalogBridge] Background revalidation failed for ${entryId}:`, error.message);
        });
    }

    /**
     * Boot a catalog entry (start the container)
     * @param {string} entryId - The entry ID to boot
     * @param {Object} options - Boot options
     * @param {string} options.mode - Boot mode ('normal', 'safe', 'debug')
     * @param {boolean} options.headless - Run in headless mode
     * @returns {Promise<Object|null>} Boot result with status and VM info, or null on failure
     *
     * @example
     * const result = await bridge.bootEntry('ubuntu-22.04', { mode: 'normal' });
     * // Returns: { success: true, vmId: 'vm-123', status: 'booting' }
     */
    async bootEntry(entryId, options = {}) {
        // Transform client options to server's expected format
        const bootOptions = {
            memory: options.memory || '2G',
            cpus: options.cpus || 2,
            cmdline: options.cmdline || null
        };

        const data = await this._fetch(`/api/v1/catalog/${encodeURIComponent(entryId)}/boot`, {
            method: 'POST',
            body: JSON.stringify(bootOptions)
        });

        return data;
    }

    /**
     * Stop a running container
     * @param {string} entryId - The entry ID to stop
     * @returns {Promise<Object|null>} Stop result or null on failure
     */
    async stopEntry(entryId) {
        const data = await this._fetch(`/api/v1/catalog/${encodeURIComponent(entryId)}/stop`, {
            method: 'POST'
        });

        return data;
    }

    /**
     * Update the layout position for a catalog entry
     * @param {string} entryId - The entry ID to update
     * @param {Object} position - New position data
     * @param {number} position.gridX - Grid X coordinate
     * @param {number} position.gridY - Grid Y coordinate
     * @param {number} position.worldX - World X coordinate (optional, calculated from grid)
     * @param {number} position.worldY - World Y coordinate (optional, calculated from grid)
     * @returns {Promise<Object|null>} Update result or null on failure
     *
     * @example
     * await bridge.updateLayout('ubuntu-22.04', { gridX: 3, gridY: 2 });
     */
    async updateLayout(entryId, position) {
        // Transform gridX/gridY to server's expected format: {entry_id, new_position: {x, y}}
        const body = {
            entry_id: entryId,
            new_position: {
                x: position.gridX,
                y: position.gridY
            }
        };

        const data = await this._fetch('/api/v1/catalog/layout', {
            method: 'POST',
            body: JSON.stringify(body)
        });

        return data;
    }

    /**
     * Batch update layout for multiple entries
     * @param {Array<Object>} updates - Array of { entryId, position } objects
     * @returns {Promise<Object|null>} Batch update result or null on failure
     */
    async batchUpdateLayout(updates) {
        const data = await this._fetch('/api/v1/catalog/layout/batch', {
            method: 'POST',
            body: JSON.stringify({ updates })
        });

        return data;
    }

    /**
     * Refresh the catalog (rescan filesystem for new containers)
     * @returns {Promise<Object|null>} Refresh result with count of new entries, or null on failure
     *
     * @example
     * const result = await bridge.refresh();
     * // Returns: { success: true, newEntries: 2, totalEntries: 15 }
     */
    async refresh() {
        const data = await this._fetch('/api/v1/catalog/refresh', {
            method: 'POST'
        });

        // Clear cache after refresh
        if (data) {
            this.cachedCatalog = null;
        }

        return data;
    }

    /**
     * Get cached catalog data (no network request)
     * @returns {Object|null} Cached catalog or null if not fetched yet
     */
    getCachedCatalog() {
        return this.cachedCatalog;
    }

    /**
     * Check if the catalog server is reachable
     * @returns {Promise<boolean>} True if server is healthy
     */
    async healthCheck() {
        try {
            const data = await this._fetch('/api/v1/health');
            return data?.status === 'ok';
        } catch {
            return false;
        }
    }

    /**
     * Clear the cached catalog data
     */
    clearCache() {
        this.cachedCatalog = null;
        this.lastFetchTime = null;
    }

    /**
     * Get the current status of a catalog entry
     * @param {string} entryId - The entry ID to check
     * @returns {Promise<Object|null>} Status data or null on failure
     *
     * @example
     * const status = await bridge.getStatus('ubuntu-22.04');
     * // Returns: { status: 'running', pid: 12345, uptime_seconds: 3600, ... }
     */
    async getStatus(entryId) {
        const data = await this._fetch(`/api/v1/catalog/${encodeURIComponent(entryId)}/status`);
        return data;
    }

    /**
     * Poll the status of an entry at regular intervals
     * @param {string} entryId - The entry ID to poll
     * @param {Function} callback - Called with each status update (status) => {}
     * @param {Object} options - Polling options
     * @param {number} options.interval - Polling interval in ms (default: 1000)
     * @param {number} options.maxAttempts - Maximum polling attempts (default: 60)
     * @returns {number} Poll ID for use with stopPolling()
     *
     * @example
     * const pollId = bridge.pollStatus('ubuntu-22.04', (status) => {
     *   console.log('Status:', status.status);
     *   if (status.status === 'running') {
     *     bridge.stopPolling(pollId);
     *   }
     * });
     */
    pollStatus(entryId, callback, options = {}) {
        const interval = options.interval || 1000;
        const maxAttempts = options.maxAttempts || 60;

        let attempts = 0;
        let pollId = null;

        const poll = async () => {
            attempts++;

            const status = await this.getStatus(entryId);

            if (status) {
                callback(status);

                // Stop polling if no longer booting
                if (status.status !== 'booting') {
                    this.stopPolling(pollId);
                    return;
                }
            }

            // Stop polling after max attempts
            if (attempts >= maxAttempts) {
                console.warn(`[CatalogBridge] Polling stopped after ${maxAttempts} attempts for ${entryId}`);
                this.stopPolling(pollId);
                return;
            }

            // Continue polling
            pollId = setTimeout(poll, interval);
            this._activePolls.set(pollId, { entryId, callback, interval });
        };

        // Start polling
        pollId = setTimeout(poll, 0);
        this._activePolls = this._activePolls || new Map();
        this._activePolls.set(pollId, { entryId, callback, interval });

        return pollId;
    }

    /**
     * Stop a polling loop
     * @param {number} pollId - The poll ID returned by pollStatus()
     */
    stopPolling(pollId) {
        if (this._activePolls && this._activePolls.has(pollId)) {
            clearTimeout(pollId);
            this._activePolls.delete(pollId);
        }
    }

    /**
     * Stop all active polling loops
     */
    stopAllPolling() {
        if (this._activePolls) {
            for (const pollId of this._activePolls.keys()) {
                clearTimeout(pollId);
            }
            this._activePolls.clear();
        }
    }

    /**
     * Fetch PXE-enabled containers from the server
     * @returns {Promise<Object|null>} Object with pxe_containers array and count, or null on failure
     *
     * @example
     * const pxeData = await bridge.getPXEContainers();
     * // Returns: { pxe_containers: [{ entry_id, pxe_enabled, boot_order }], count: N }
     */
    async getPXEContainers() {
        // Return cached data if available
        if (this._cachedPXEContainers) {
            return this._cachedPXEContainers;
        }

        const data = await this._fetch('/pxe');

        if (data) {
            this._cachedPXEContainers = data;
        }

        return data;
    }

    /**
     * Toggle PXE availability for a container
     * @param {string} entryId - The entry ID to toggle PXE for
     * @param {boolean} enabled - Whether to enable or disable PXE
     * @returns {Promise<Object|null>} Result with updated status, or null on failure
     *
     * @example
     * const result = await bridge.setPXEAvailability('ubuntu-22.04', true);
     * // Returns: { success: true, entry_id: 'ubuntu-22.04', pxe_enabled: true }
     */
    async setPXEAvailability(entryId, enabled) {
        const data = await this._fetch(`/pxe/${encodeURIComponent(entryId)}/toggle`, {
            method: 'POST',
            body: JSON.stringify({ enabled })
        });

        // Clear PXE cache after toggle to force refresh
        if (data) {
            this._cachedPXEContainers = null;
        }

        return data;
    }

    /**
     * Clear the PXE containers cache
     */
    clearPXECache() {
        this._cachedPXEContainers = null;
    }
}

// ES6 module export
export { CatalogBridge };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.CatalogBridge = CatalogBridge;
}
