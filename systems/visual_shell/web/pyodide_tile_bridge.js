/**
 * Geometry OS: Pyodide Tile Bridge
 *
 * Bridges Python execution output to tile placement on the Infinite Map.
 * Python scripts can return structured data that gets rendered as map tiles.
 *
 * @module pyodide_tile_bridge
 */

class PyodideTileBridge {
    /**
     * @param {InfiniteMapV2} map - The Infinite Map instance
     * @param {PyodideExecutor} executor - The Pyodide executor
     * @param {Object} config - Configuration options
     */
    constructor(map, executor, config = {}) {
        this.map = map;
        this.executor = executor;
        this.config = {
            autoPlace: true,
            defaultTileType: 'python_output',
            maxTileSize: 256,
            ...config
        };

        this.executionHistory = [];
        console.log(' PyodideTileBridge initialized');
    }

    /**
     * Execute Python code and place result as tile on map.
     * @param {string} code - Python code to execute
     * @param {Object} position - {x, y} world coordinates for tile placement
     * @param {Object} options - Execution options
     * @returns {Promise<{success: boolean, result: any, tilePlaced: boolean, position: Object}>}
     */
    async executeAndPlace(code, position, options = {}) {
        console.log(' Executing Python and placing tile...');

        // Execute Python
        const execResult = await this.executor.runPythonSafe(code);

        // Record execution
        const record = {
            timestamp: Date.now(),
            code: code.substring(0, 500),
            success: execResult.success,
            position: position,
            stdout: execResult.stdout,
            stderr: execResult.stderr
        };
        this.executionHistory.push(record);

        if (!execResult.success) {
            return {
                success: false,
                result: null,
                tilePlaced: false,
                error: execResult.error,
                position: position
            };
        }

        // Determine tile data
        const tileData = this._extractTileData(execResult.result);

        // Place tile on map if autoPlace enabled
        let tilePlaced = false;
        if (this.config.autoPlace && tileData) {
            tilePlaced = await this._placeTile(tileData, position, execResult);
        }

        return {
            success: true,
            result: execResult.result,
            tilePlaced: tilePlaced,
            position: position,
            stdout: execResult.stdout,
            stderr: execResult.stderr
        };
    }

    /**
     * Extract tile-relevant data from Python result.
     * @param {any} result - Python execution result
     * @returns {Object|null} - Tile data or null
     */
    _extractTileData(result) {
        if (!result) return null;

        // Handle dict/object results with tile metadata
        if (typeof result === 'object') {
            // Check for explicit tile type
            if (result.type) {
                return {
                    type: result.type,
                    data: result.values || result.data || result,
                    label: result.label || 'Python Output',
                    metadata: result.metadata || {}
                };
            }

            // Check for array/matrix data (heatmap)
            if (Array.isArray(result) || (result.length !== undefined)) {
                return {
                    type: 'matrix',
                    data: result,
                    label: 'Matrix Output'
                };
            }

            // Generic object
            return {
                type: 'object',
                data: result,
                label: 'Python Object'
            };
        }

        // Primitive value
        return {
            type: 'value',
            data: result,
            label: 'Python Result'
        };
    }

    /**
     * Place a tile on the Infinite Map.
     * @param {Object} tileData - Tile data to place
     * @param {Object} position - {x, y} position
     * @param {Object} execResult - Full execution result
     * @returns {Promise<boolean>}
     */
    async _placeTile(tileData, position, execResult) {
        try {
            const gridSize = this.map.config?.gridSize || 100;
            const gridX = Math.floor(position.x / gridSize);
            const gridY = Math.floor(position.y / gridSize);

            const metadata = {
                type: this.config.defaultTileType,
                pythonType: tileData.type,
                label: tileData.label,
                timestamp: Date.now(),
                stdout: execResult.stdout?.substring(0, 500),
                dataPreview: JSON.stringify(tileData.data).substring(0, 200)
            };

            // Use map's writeTile API if available
            if (this.map.writeTile) {
                await this.map.writeTile(gridX, gridY, tileData.type, metadata);
                console.log(` Tile placed at (${gridX}, ${gridY})`);
                return true;
            }

            // Fallback: just log
            console.log(` Map writeTile not available, tile data:`, metadata);
            return false;

        } catch (error) {
            console.error(' Failed to place tile:', error);
            return false;
        }
    }

    /**
     * Get execution history.
     * @returns {Array}
     */
    getHistory() {
        return [...this.executionHistory];
    }

    /**
     * Clear execution history.
     */
    clearHistory() {
        this.executionHistory = [];
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PyodideTileBridge = PyodideTileBridge;
}

export { PyodideTileBridge };
