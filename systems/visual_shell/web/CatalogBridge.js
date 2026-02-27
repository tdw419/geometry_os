/**
 * CatalogBridge - API client for communicating with the catalog server
 *
 * Provides methods to fetch catalog entries, boot containers, update layout,
 * and refresh the catalog. Uses native fetch API with error handling.
 *
 * @module CatalogBridge
 */

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
}

// ES6 module export
export { CatalogBridge };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.CatalogBridge = CatalogBridge;
}
