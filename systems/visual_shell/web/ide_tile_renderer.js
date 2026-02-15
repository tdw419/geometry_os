/**
 * IDETileRenderer - WGSL Shader-Based IDE Tile Rendering
 *
 * Renders IDE tiles on the PixiJS canvas using WGSL shaders.
 * Supports LOD (Level of Detail) for efficient rendering at different zoom levels.
 *
 * @module ide_tile_renderer
 * @phase Phase J.2: Neural IDE Visual Builder
 */

/**
 * IDETileRenderer class for rendering IDE tiles with shader support
 */
class IDETileRenderer {
    // ─────────────────────────────────────────────────────────────
    // Private Fields
    // ─────────────────────────────────────────────────────────────

    /** @type {Object|null} - PixiJS Application */
    #pixiApp = null;

    /** @type {Object|null} - BuilderPanel reference */
    #builderPanel = null;

    /** @type {Map<string, Object>} - Rendered tiles indexed by tileId */
    #renderedTiles = new Map();

    /** @type {Map<string, Object>} - Tile content storage */
    #tileContent = new Map();

    /** @type {string[]} - Valid IDE tile types */
    #validIDETileTypes = [
        'code_editor',
        'file_browser',
        'terminal',
        'debugger',
        'output_panel',
        'semantic_nav'
    ];

    /** @type {Object} - Shader cache for loaded WGSL shaders */
    #shaderCache = new Map();

    // ─────────────────────────────────────────────────────────────
    // Constructor
    // ─────────────────────────────────────────────────────────────

    /**
     * Create a new IDETileRenderer
     * @param {Object} pixiApp - PixiJS Application instance
     * @param {Object} builderPanel - BuilderPanel reference
     */
    constructor(pixiApp, builderPanel) {
        this.#pixiApp = pixiApp;
        this.#builderPanel = builderPanel;
    }

    // ─────────────────────────────────────────────────────────────
    // Public Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Get the WGSL shader path for a tile type
     * @param {string} tileType - IDE tile type
     * @returns {string} - Path to WGSL shader file
     */
    getShaderPath(tileType) {
        return `shaders/ide/${tileType}.wgsl`;
    }

    /**
     * Check if a tile type is a valid IDE tile type
     * @param {string} tileType - Tile type to validate
     * @returns {boolean} - True if valid IDE tile type
     */
    isValidTileType(tileType) {
        return this.#validIDETileTypes.includes(tileType);
    }

    /**
     * Calculate LOD (Level of Detail) based on zoom level
     * @param {number} zoomLevel - Current zoom level (1.0 = 100%)
     * @returns {string} - LOD level: 'full', 'medium', or 'low'
     */
    calculateLOD(zoomLevel) {
        if (zoomLevel >= 1.0) {
            return 'full';
        } else if (zoomLevel >= 0.5) {
            return 'medium';
        } else {
            return 'low';
        }
    }

    /**
     * Render a tile on the canvas
     * @param {string} tileId - Unique tile identifier
     * @param {string} tileType - IDE tile type
     * @param {Object} bounds - Tile bounds {x, y, width, height}
     * @param {Object} content - Tile content (optional)
     * @returns {Object} - Render result with success, tile_id, shader_path, lod
     */
    renderTile(tileId, tileType, bounds, content = null) {
        // Validate tile type
        if (!this.isValidTileType(tileType)) {
            return {
                success: false,
                error: `Invalid tile type: ${tileType}`,
                valid_types: this.#validIDETileTypes
            };
        }

        // Validate bounds
        if (!bounds || typeof bounds.x !== 'number' || typeof bounds.y !== 'number') {
            return {
                success: false,
                error: 'Invalid bounds: must include x and y coordinates'
            };
        }

        // Store content if provided
        if (content !== null) {
            this.#tileContent.set(tileId, content);
        }

        // Calculate LOD from current zoom (default to 1.0 if no app)
        const zoomLevel = this.#pixiApp?.stage?.scale?.x || 1.0;
        const lod = this.calculateLOD(zoomLevel);

        // Get shader path
        const shaderPath = this.getShaderPath(tileType);

        // Create tile render data
        const tileData = {
            tile_id: tileId,
            tile_type: tileType,
            bounds: {
                x: bounds.x,
                y: bounds.y,
                width: bounds.width || 100,
                height: bounds.height || 100
            },
            shader_path: shaderPath,
            lod: lod,
            content: content,
            rendered_at: new Date().toISOString()
        };

        // Store rendered tile
        this.#renderedTiles.set(tileId, tileData);

        return {
            success: true,
            tile_id: tileId,
            shader_path: shaderPath,
            lod: lod
        };
    }

    /**
     * Update content for a rendered tile
     * @param {string} tileId - Tile identifier
     * @param {Object} content - New content
     * @returns {Object} - Result with success
     */
    updateTileContent(tileId, content) {
        if (!this.#renderedTiles.has(tileId)) {
            return {
                success: false,
                error: `Tile not found: ${tileId}`
            };
        }

        // Update content storage
        this.#tileContent.set(tileId, content);

        // Update rendered tile data
        const tileData = this.#renderedTiles.get(tileId);
        tileData.content = content;
        tileData.updated_at = new Date().toISOString();

        return {
            success: true,
            tile_id: tileId,
            message: 'Content updated'
        };
    }

    /**
     * Get content for a tile
     * @param {string} tileId - Tile identifier
     * @returns {Object|null} - Tile content or null if not found
     */
    getTileContent(tileId) {
        return this.#tileContent.get(tileId) || null;
    }

    /**
     * Remove a tile from rendering
     * @param {string} tileId - Tile identifier
     * @returns {Object} - Result with success
     */
    removeTile(tileId) {
        if (!this.#renderedTiles.has(tileId)) {
            return {
                success: false,
                error: `Tile not found: ${tileId}`
            };
        }

        // Remove from rendered tiles
        this.#renderedTiles.delete(tileId);

        // Remove content
        this.#tileContent.delete(tileId);

        return {
            success: true,
            tile_id: tileId,
            message: 'Tile removed'
        };
    }

    /**
     * Get all rendered tile IDs
     * @returns {string[]} - Array of tile IDs
     */
    getRenderedTileIds() {
        return Array.from(this.#renderedTiles.keys());
    }

    /**
     * Get tile render data
     * @param {string} tileId - Tile identifier
     * @returns {Object|null} - Tile data or null if not found
     */
    getTileData(tileId) {
        return this.#renderedTiles.get(tileId) || null;
    }

    /**
     * Get all rendered tiles data
     * @returns {Object[]} - Array of all tile data
     */
    getAllTiles() {
        return Array.from(this.#renderedTiles.values());
    }

    /**
     * Get count of rendered tiles
     * @returns {number} - Number of rendered tiles
     */
    get tileCount() {
        return this.#renderedTiles.size;
    }

    /**
     * Clear all rendered tiles
     */
    clear() {
        this.#renderedTiles.clear();
        this.#tileContent.clear();
        this.#shaderCache.clear();
    }

    /**
     * Get valid IDE tile types
     * @returns {string[]} - Array of valid tile types
     */
    getValidTileTypes() {
        return [...this.#validIDETileTypes];
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { IDETileRenderer };
}
