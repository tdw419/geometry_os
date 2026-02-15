/**
 * IDEAssemblyEngine - AI-Driven IDE Construction Engine
 * Phase J.2: Neural IDE Visual Builder
 *
 * Provides programmatic IDE construction capabilities for AI agents.
 * Manages tile placement, connection validation, and action logging.
 *
 * @module ide_assembly_engine
 */

/**
 * IDEAssemblyEngine class for AI-driven IDE construction
 */
class IDEAssemblyEngine {
    // ─────────────────────────────────────────────────────────────
    // Private Fields
    // ─────────────────────────────────────────────────────────────

    /** @type {Object|null} - BuilderPanel reference */
    #builderPanel = null;

    /** @type {Object|null} - TileConnectionManager reference */
    #connectionManager = null;

    /** @type {Object|null} - IDESemanticOverlay reference */
    #semanticOverlay = null;

    /** @type {Object|null} - IDETileRenderer reference */
    #tileRenderer = null;

    /** @type {Map<string, Object>} - IDE tiles indexed by tileId */
    #tiles = new Map();

    /** @type {Object[]} - Action log for audit trail */
    #actionLog = [];

    /** @type {string[]} - Valid IDE tile types */
    #validIDETileTypes = [
        'code_editor',
        'file_browser',
        'terminal',
        'debugger',
        'output_panel',
        'semantic_nav'
    ];

    /** @type {Object} - Connection validation rules by source type */
    #connectionRules = {
        'file_browser': {
            'data_flow': ['code_editor', 'output_panel']
        },
        'code_editor': {
            'command_flow': ['terminal'],
            'debug_flow': ['debugger'],
            'data_flow': ['output_panel']
        },
        'semantic_nav': {
            'nav_flow': ['code_editor', 'file_browser']
        },
        'terminal': {
            'data_flow': ['output_panel']
        }
    };

    /** @type {number} - Counter for generating unique tile IDs */
    #tileCounter = 0;

    // ─────────────────────────────────────────────────────────────
    // Constructor
    // ─────────────────────────────────────────────────────────────

    /**
     * Create a new IDEAssemblyEngine
     * @param {Object} builderPanel - BuilderPanel instance for tile placement
     * @param {Object} connectionManager - TileConnectionManager for connections
     * @param {Object} semanticOverlay - IDESemanticOverlay for state tracking
     * @param {Object} tileRenderer - IDETileRenderer for rendering
     */
    constructor(builderPanel, connectionManager, semanticOverlay, tileRenderer) {
        this.#builderPanel = builderPanel;
        this.#connectionManager = connectionManager;
        this.#semanticOverlay = semanticOverlay;
        this.#tileRenderer = tileRenderer;
    }

    // ─────────────────────────────────────────────────────────────
    // Public Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Place an IDE tile on the canvas
     * @param {string} type - IDE tile type (code_editor, file_browser, etc.)
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @param {Object} config - Optional configuration (content, metadata)
     * @returns {Object} - Result with success, tile_id, type, position
     */
    placeIDETile(type, x, y, config = {}) {
        // Validate tile type
        if (!this.#isValidIDEType(type)) {
            const error = `Invalid IDE tile type: ${type}. Valid types: ${this.#validIDETileTypes.join(', ')}`;
            this.#logAction('placeIDETile', 'error', { error, type, x, y });
            return { success: false, error };
        }

        // Validate coordinates
        if (typeof x !== 'number' || typeof y !== 'number' || isNaN(x) || isNaN(y)) {
            const error = `Invalid coordinates: x=${x}, y=${y}`;
            this.#logAction('placeIDETile', 'error', { error, type, x, y });
            return { success: false, error };
        }

        // Generate unique tile ID
        const tileId = this.#generateTileId(type);

        // Create tile data
        const tile = {
            tile_id: tileId,
            type: type,
            x: x,
            y: y,
            width: config.width || 200,
            height: config.height || 150,
            content: config.content || null,
            metadata: config.metadata || {},
            created_at: new Date().toISOString()
        };

        // Store tile
        this.#tiles.set(tileId, tile);

        // Render tile if renderer available
        if (this.#tileRenderer) {
            const renderResult = this.#tileRenderer.renderTile(
                tileId,
                type,
                { x, y, width: tile.width, height: tile.height },
                config.content
            );
            if (!renderResult.success) {
                console.warn(`IDESemanticOverlay: Render warning: ${renderResult.error}`);
            }
        }

        // Update semantic state if overlay available
        if (this.#semanticOverlay) {
            const semanticState = {
                type: type,
                position: { x, y },
                content: config.content,
                definitions: config.definitions || [],
                openFiles: config.openFiles || [],
                ...config.semanticState
            };
            this.#semanticOverlay.setComponentState(tileId, semanticState);
        }

        // Log successful action
        this.#logAction('placeIDETile', 'success', {
            tile_id: tileId,
            type: type,
            x: x,
            y: y
        });

        return {
            success: true,
            tile_id: tileId,
            type: type,
            position: { x, y }
        };
    }

    /**
     * Connect two IDE tiles with validation
     * @param {string} sourceId - Source tile ID
     * @param {string} targetId - Target tile ID
     * @param {string} connectionType - Type: data_flow, command_flow, debug_flow, nav_flow
     * @returns {Object} - Result with success and connection_id
     */
    connectIDETiles(sourceId, targetId, connectionType) {
        // Validate source tile exists
        const sourceTile = this.#tiles.get(sourceId);
        if (!sourceTile) {
            const error = `Source tile not found: ${sourceId}`;
            this.#logAction('connectIDETiles', 'error', { error, sourceId, targetId, connectionType });
            return { success: false, error };
        }

        // Validate target tile exists
        const targetTile = this.#tiles.get(targetId);
        if (!targetTile) {
            const error = `Target tile not found: ${targetId}`;
            this.#logAction('connectIDETiles', 'error', { error, sourceId, targetId, connectionType });
            return { success: false, error };
        }

        // Validate connection rules
        const validationResult = this.#validateConnection(sourceTile.type, targetTile.type, connectionType);
        if (!validationResult.valid) {
            this.#logAction('connectIDETiles', 'error', {
                error: validationResult.error,
                sourceId,
                targetId,
                connectionType
            });
            return { success: false, error: validationResult.error };
        }

        // Create connection if manager available
        let connectionResult = { success: true, connection_id: null };
        if (this.#connectionManager) {
            connectionResult = this.#connectionManager.addConnection(sourceId, targetId, connectionType);
            if (!connectionResult.success) {
                this.#logAction('connectIDETiles', 'error', {
                    error: connectionResult.error,
                    sourceId,
                    targetId,
                    connectionType
                });
                return connectionResult;
            }
        }

        // Log successful connection
        this.#logAction('connectIDETiles', 'success', {
            source_id: sourceId,
            target_id: targetId,
            connection_type: connectionType,
            connection_id: connectionResult.connection_id
        });

        return {
            success: true,
            connection_id: connectionResult.connection_id,
            source_id: sourceId,
            target_id: targetId,
            connection_type: connectionType
        };
    }

    /**
     * Set content for a tile
     * @param {string} tileId - Tile identifier
     * @param {Object} content - Content to set
     * @returns {Object} - Result with success
     */
    setTileContent(tileId, content) {
        const tile = this.#tiles.get(tileId);
        if (!tile) {
            const error = `Tile not found: ${tileId}`;
            this.#logAction('setTileContent', 'error', { error, tileId });
            return { success: false, error };
        }

        // Update tile content
        tile.content = content;
        tile.updated_at = new Date().toISOString();

        // Update renderer if available
        if (this.#tileRenderer) {
            this.#tileRenderer.updateTileContent(tileId, content);
        }

        // Update semantic state if overlay available
        if (this.#semanticOverlay) {
            const currentState = this.#semanticOverlay.getComponentState(tileId) || {};
            this.#semanticOverlay.setComponentState(tileId, {
                ...currentState,
                content: content
            });
        }

        this.#logAction('setTileContent', 'success', { tile_id: tileId });

        return { success: true, tile_id: tileId };
    }

    /**
     * Get current assembly state preview
     * @returns {Object} - Assembly state with tiles, connections, semanticState, actionLog
     */
    preview() {
        const tiles = Array.from(this.#tiles.values()).map(t => ({
            tile_id: t.tile_id,
            type: t.type,
            position: { x: t.x, y: t.y },
            width: t.width,
            height: t.height,
            content: t.content
        }));

        const connections = this.#connectionManager
            ? this.#connectionManager.getAllConnections()
            : [];

        const semanticState = this.#semanticOverlay
            ? this.#semanticOverlay.exportState()
            : null;

        return {
            tiles: tiles,
            connections: connections,
            semanticState: semanticState,
            actionLog: [...this.#actionLog],
            tile_count: tiles.length,
            connection_count: connections.length
        };
    }

    /**
     * Get action log for audit trail
     * @returns {Object[]} - Array of action log entries
     */
    getActionLog() {
        return [...this.#actionLog];
    }

    /**
     * Clear all tiles and reset state
     */
    clear() {
        // Clear tiles
        this.#tiles.clear();

        // Clear connection manager if available
        if (this.#connectionManager) {
            this.#connectionManager.clear();
        }

        // Clear semantic overlay if available
        if (this.#semanticOverlay) {
            this.#semanticOverlay.clear();
        }

        // Clear tile renderer if available
        if (this.#tileRenderer) {
            this.#tileRenderer.clear();
        }

        // Reset tile counter
        this.#tileCounter = 0;

        // Log the clear action
        this.#logAction('clear', 'success', { message: 'All tiles and state cleared' });
    }

    /**
     * Get a tile by ID
     * @param {string} tileId - Tile identifier
     * @returns {Object|null} - Tile data or null if not found
     */
    getTile(tileId) {
        const tile = this.#tiles.get(tileId);
        return tile ? { ...tile } : null;
    }

    /**
     * Get all tile IDs
     * @returns {string[]} - Array of tile IDs
     */
    getTileIds() {
        return Array.from(this.#tiles.keys());
    }

    /**
     * Get tile count
     * @returns {number} - Number of tiles
     */
    get tileCount() {
        return this.#tiles.size;
    }

    /**
     * Check if tile type is valid for IDE
     * @param {string} type - Tile type to check
     * @returns {boolean} - True if valid
     */
    isValidTileType(type) {
        return this.#isValidIDEType(type);
    }

    /**
     * Get valid IDE tile types
     * @returns {string[]} - Array of valid tile types
     */
    getValidTileTypes() {
        return [...this.#validIDETileTypes];
    }

    // ─────────────────────────────────────────────────────────────
    // Private Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Check if type is valid IDE tile type
     * @private
     * @param {string} type - Tile type
     * @returns {boolean} - True if valid
     */
    #isValidIDEType(type) {
        return this.#validIDETileTypes.includes(type);
    }

    /**
     * Generate unique tile ID
     * @private
     * @param {string} type - Tile type
     * @returns {string} - Unique tile ID
     */
    #generateTileId(type) {
        this.#tileCounter++;
        return `ide_${type}_${Date.now()}_${this.#tileCounter}`;
    }

    /**
     * Validate connection between tile types
     * @private
     * @param {string} sourceType - Source tile type
     * @param {string} targetType - Target tile type
     * @param {string} connectionType - Connection type
     * @returns {Object} - Validation result with valid and optional error
     */
    #validateConnection(sourceType, targetType, connectionType) {
        // If no rules defined for source, allow connection
        if (!this.#connectionRules[sourceType]) {
            return { valid: true };
        }

        const sourceRules = this.#connectionRules[sourceType];

        // Check if connection type is allowed for this source
        if (!sourceRules[connectionType]) {
            const allowedTypes = Object.keys(sourceRules);
            return {
                valid: false,
                error: `Connection type '${connectionType}' not allowed for source type '${sourceType}'. Allowed: ${allowedTypes.join(', ')}`
            };
        }

        // Check if target type is allowed for this connection type
        const allowedTargets = sourceRules[connectionType];
        if (!allowedTargets.includes(targetType)) {
            return {
                valid: false,
                error: `Connection from '${sourceType}' to '${targetType}' with type '${connectionType}' not allowed. Allowed targets: ${allowedTargets.join(', ')}`
            };
        }

        return { valid: true };
    }

    /**
     * Log an action for audit trail
     * @private
     * @param {string} action - Action name
     * @param {string} status - Status: 'success' or 'error'
     * @param {Object} details - Action details
     */
    #logAction(action, status, details = {}) {
        const entry = {
            timestamp: new Date().toISOString(),
            action: action,
            status: status,
            details: details
        };
        this.#actionLog.push(entry);
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { IDEAssemblyEngine };
}
