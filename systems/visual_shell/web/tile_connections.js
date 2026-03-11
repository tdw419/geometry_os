/**
 * Tile Connection System
 *
 * Manages semantic connections between placed tiles on the Infinite Map.
 * Enables AI agents to wire IDE components together visually.
 *
 * @module tile_connections
 * @phase Phase J.2: Neural IDE
 */

/**
 * Connection type definitions
 * @enum {Object}
 */
const ConnectionTypes = {
    DATA_FLOW: {
        name: 'data_flow',
        description: 'File or data flows from source to target',
        color: 0x00ffff,
        pattern: 'solid'
    },
    COMMAND_FLOW: {
        name: 'command_flow',
        description: 'Command execution request',
        color: 0xff8800,
        pattern: 'dashed'
    },
    DEBUG_FLOW: {
        name: 'debug_flow',
        description: 'Debug information (breakpoints, variables)',
        color: 0xff00ff,
        pattern: 'dotted'
    },
    NAV_FLOW: {
        name: 'nav_flow',
        description: 'Navigation/jump to location',
        color: 0x88ff88,
        pattern: 'solid'
    }
};

/**
 * TileConnectionManager - Manages connections between tiles
 */
class TileConnectionManager {
    /** @type {Map<string, Object>} */
    #connections = new Map();

    /** @type {Map<string, Set<string>>} */
    #tileConnections = new Map();

    /**
     * Add a connection between two tiles
     * @param {string} sourceTileId - Source tile ID
     * @param {string} targetTileId - Target tile ID
     * @param {string} connectionType - Type from ConnectionTypes
     * @returns {Object} Result with success and connection_id
     */
    addConnection(sourceTileId, targetTileId, connectionType) {
        // Validate connection type
        if (!this.isValidConnectionType(connectionType)) {
            return { success: false, error: `Invalid connection type: ${connectionType}` };
        }

        // Check for duplicate
        const existingKey = `${sourceTileId}:${targetTileId}:${connectionType}`;
        for (const [id, conn] of this.#connections) {
            if (conn.key === existingKey) {
                return { success: false, error: 'Connection already exists' };
            }
        }

        // Create connection
        const connectionId = `conn_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        const connection = {
            connection_id: connectionId,
            source: sourceTileId,
            target: targetTileId,
            type: connectionType,
            key: existingKey,
            created_at: new Date().toISOString()
        };

        this.#connections.set(connectionId, connection);

        // Index by tile
        this.#addToTileIndex(sourceTileId, connectionId);
        this.#addToTileIndex(targetTileId, connectionId);

        return { success: true, connection_id: connectionId, connection };
    }

    /**
     * Add connection ID to tile index
     * @param {string} tileId
     * @param {string} connectionId
     */
    #addToTileIndex(tileId, connectionId) {
        if (!this.#tileConnections.has(tileId)) {
            this.#tileConnections.set(tileId, new Set());
        }
        this.#tileConnections.get(tileId).add(connectionId);
    }

    /**
     * Remove a connection by ID
     * @param {string} connectionId
     * @returns {Object} Result with success
     */
    removeConnection(connectionId) {
        const connection = this.#connections.get(connectionId);
        if (!connection) {
            return { success: false, error: 'Connection not found' };
        }

        // Remove from tile index
        this.#tileConnections.get(connection.source)?.delete(connectionId);
        this.#tileConnections.get(connection.target)?.delete(connectionId);

        // Remove connection
        this.#connections.delete(connectionId);

        return { success: true };
    }

    /**
     * Get all connections for a specific tile
     * @param {string} tileId
     * @returns {Object[]} Array of connections
     */
    getTileConnections(tileId) {
        const connectionIds = this.#tileConnections.get(tileId);
        if (!connectionIds) return [];

        return Array.from(connectionIds)
            .map(id => this.#connections.get(id))
            .filter(Boolean);
    }

    /**
     * Get all connections
     * @returns {Object[]} Array of all connections
     */
    getAllConnections() {
        return Array.from(this.#connections.values());
    }

    /**
     * Check if connection type is valid
     * @param {string} type
     * @returns {boolean}
     */
    isValidConnectionType(type) {
        return Object.values(ConnectionTypes).some(ct => ct.name === type);
    }

    /**
     * Get connection type info
     * @param {string} type
     * @returns {Object|null}
     */
    getConnectionTypeInfo(type) {
        return Object.values(ConnectionTypes).find(ct => ct.name === type) || null;
    }

    /**
     * Clear all connections
     */
    clear() {
        this.#connections.clear();
        this.#tileConnections.clear();
    }

    /**
     * Get connection count
     * @returns {number}
     */
    get connectionCount() {
        return this.#connections.size;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        TileConnectionManager,
        ConnectionTypes
    };
}
