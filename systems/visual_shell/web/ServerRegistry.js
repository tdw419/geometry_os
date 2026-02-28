/**
 * ServerRegistry - Manages remote catalog server configurations
 *
 * Provides localStorage persistence for server configurations including
 * URL, display name, color, enabled status, and connection status.
 *
 * @module ServerRegistry
 */

class ServerRegistry {
    /**
     * Storage key for localStorage
     * @private
     */
    static STORAGE_KEY = 'remote-catalog-servers';

    /**
     * Create a ServerRegistry instance
     * Loads existing servers from localStorage or initializes empty registry
     */
    constructor() {
        this.servers = [];
        this._loadFromStorage();
    }

    /**
     * Load servers from localStorage
     * @private
     */
    _loadFromStorage() {
        try {
            const stored = localStorage.getItem(ServerRegistry.STORAGE_KEY);
            if (stored) {
                const data = JSON.parse(stored);
                this.servers = Array.isArray(data.servers) ? data.servers : [];
            } else {
                this.servers = [];
            }
        } catch (error) {
            console.error('[ServerRegistry] Failed to load from localStorage:', error.message);
            this.servers = [];
        }
    }

    /**
     * Persist servers to localStorage
     * @private
     */
    _saveToStorage() {
        try {
            const data = { servers: this.servers };
            localStorage.setItem(ServerRegistry.STORAGE_KEY, JSON.stringify(data));
        } catch (error) {
            console.error('[ServerRegistry] Failed to save to localStorage:', error.message);
        }
    }

    /**
     * Generate a unique ID for new servers
     * Uses crypto.randomUUID() with fallback to timestamp-based ID
     * @returns {string} UUID v4 string
     */
    generateId() {
        if (typeof crypto !== 'undefined' && crypto.randomUUID) {
            return crypto.randomUUID();
        }
        // Fallback: timestamp + random string
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
            const r = Math.random() * 16 | 0;
            const v = c === 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    /**
     * Get all registered servers
     * @returns {Array<Object>} Array of server objects
     */
    getServers() {
        return [...this.servers]; // Return copy to prevent external mutation
    }

    /**
     * Get only enabled servers
     * @returns {Array<Object>} Array of enabled server objects
     */
    getEnabledServers() {
        return this.servers.filter(server => server.enabled === true);
    }

    /**
     * Get a server by ID
     * @param {string} id - Server ID
     * @returns {Object|null} Server object or null if not found
     */
    getServer(id) {
        return this.servers.find(server => server.id === id) || null;
    }

    /**
     * Add a new server to the registry
     * @param {string} url - Server URL (e.g., 'https://catalog.example.com')
     * @param {string} name - Display name for the server
     * @param {string} color - Hex color for UI badges (e.g., '#00aaff')
     * @returns {Object} The newly created server object
     *
     * @example
     * const server = registry.addServer('https://catalog.example.com', 'Company Catalog', '#00aaff');
     * // Returns: { id: 'uuid-...', url: 'https://catalog.example.com', name: 'Company Catalog', ... }
     */
    addServer(url, name, color = '#00aaff') {
        const server = {
            id: this.generateId(),
            url: url.replace(/\/$/, ''), // Remove trailing slash
            name: name || url,
            color: color,
            enabled: true,
            addedAt: Date.now(),
            lastStatus: 'unknown',
            lastError: null
        };

        this.servers.push(server);
        this._saveToStorage();

        console.log(`[ServerRegistry] Added server: ${server.name} (${server.url})`);
        return server;
    }

    /**
     * Update an existing server's properties
     * @param {string} id - Server ID to update
     * @param {Object} updates - Object containing fields to update
     * @returns {Object|null} Updated server object or null if not found
     *
     * @example
     * registry.updateServer('uuid-...', { name: 'New Name', enabled: false });
     */
    updateServer(id, updates) {
        const index = this.servers.findIndex(s => s.id === id);
        if (index === -1) {
            console.warn(`[ServerRegistry] Server not found: ${id}`);
            return null;
        }

        // Apply updates (excluding protected fields)
        const protectedFields = ['id', 'addedAt'];
        const server = this.servers[index];

        for (const [key, value] of Object.entries(updates)) {
            if (!protectedFields.includes(key)) {
                server[key] = value;
            }
        }

        // Clean URL if updated
        if (updates.url) {
            server.url = updates.url.replace(/\/$/, '');
        }

        this._saveToStorage();
        console.log(`[ServerRegistry] Updated server: ${server.name}`);
        return server;
    }

    /**
     * Remove a server from the registry
     * @param {string} id - Server ID to remove
     * @returns {boolean} True if removed, false if not found
     */
    removeServer(id) {
        const index = this.servers.findIndex(s => s.id === id);
        if (index === -1) {
            console.warn(`[ServerRegistry] Server not found for removal: ${id}`);
            return false;
        }

        const removed = this.servers.splice(index, 1)[0];
        this._saveToStorage();

        console.log(`[ServerRegistry] Removed server: ${removed.name}`);
        return true;
    }

    /**
     * Update server connection status
     * @param {string} id - Server ID
     * @param {string} status - Status: 'ok' | 'error' | 'unknown'
     * @param {string|null} error - Error message if status is 'error'
     * @returns {boolean} True if updated, false if server not found
     */
    setServerStatus(id, status, error = null) {
        const server = this.servers.find(s => s.id === id);
        if (!server) {
            return false;
        }

        server.lastStatus = status;
        server.lastError = error;

        this._saveToStorage();
        return true;
    }

    /**
     * Enable a server
     * @param {string} id - Server ID
     * @returns {boolean} True if enabled, false if not found
     */
    enableServer(id) {
        return this.updateServer(id, { enabled: true }) !== null;
    }

    /**
     * Disable a server
     * @param {string} id - Server ID
     * @returns {boolean} True if disabled, false if not found
     */
    disableServer(id) {
        return this.updateServer(id, { enabled: false }) !== null;
    }

    /**
     * Toggle server enabled state
     * @param {string} id - Server ID
     * @returns {boolean|null} New enabled state, or null if not found
     */
    toggleServer(id) {
        const server = this.getServer(id);
        if (!server) return null;

        const newState = !server.enabled;
        this.updateServer(id, { enabled: newState });
        return newState;
    }

    /**
     * Clear all servers from the registry
     */
    clearAll() {
        this.servers = [];
        this._saveToStorage();
        console.log('[ServerRegistry] Cleared all servers');
    }

    /**
     * Get count of servers
     * @returns {Object} Object with total and enabled counts
     */
    getCount() {
        return {
            total: this.servers.length,
            enabled: this.getEnabledServers().length
        };
    }

    /**
     * Check if a server URL already exists
     * @param {string} url - URL to check
     * @returns {boolean} True if URL exists
     */
    urlExists(url) {
        const normalizedUrl = url.replace(/\/$/, '');
        return this.servers.some(s => s.url === normalizedUrl);
    }

    /**
     * Import servers from an array (for backup restore)
     * @param {Array<Object>} serversData - Array of server objects
     * @param {boolean} merge - If true, merge with existing; if false, replace
     * @returns {number} Number of servers imported
     */
    importServers(serversData, merge = true) {
        if (!Array.isArray(serversData)) {
            console.error('[ServerRegistry] Invalid import data: expected array');
            return 0;
        }

        if (!merge) {
            this.servers = [];
        }

        let imported = 0;
        for (const server of serversData) {
            // Validate required fields
            if (!server.url) continue;

            // Skip if URL already exists
            if (this.urlExists(server.url)) continue;

            // Create new server with validated data
            const newServer = {
                id: server.id || this.generateId(),
                url: server.url.replace(/\/$/, ''),
                name: server.name || server.url,
                color: server.color || '#00aaff',
                enabled: server.enabled !== false,
                addedAt: server.addedAt || Date.now(),
                lastStatus: server.lastStatus || 'unknown',
                lastError: server.lastError || null
            };

            this.servers.push(newServer);
            imported++;
        }

        this._saveToStorage();
        console.log(`[ServerRegistry] Imported ${imported} servers`);
        return imported;
    }

    /**
     * Export servers for backup
     * @returns {Array<Object>} Array of server objects
     */
    exportServers() {
        return this.getServers();
    }
}

// ES6 module export
export { ServerRegistry };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.ServerRegistry = ServerRegistry;
}
