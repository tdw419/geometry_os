/**
 * IDESemanticOverlay - Semantic state tracking for IDE tiles
 * Phase J.2: Neural IDE Visual Builder
 *
 * Tracks component state across IDE tiles and enables semantic queries
 * for definitions, related tiles, and flow tracing.
 */

export class IDESemanticOverlay {
    // Private fields for encapsulation
    #connectionManager;
    #tileRenderer;
    #components;         // Map<tileId, componentState>
    #semanticIndex;      // Map<concept, Set<tileId>>
    #timestamp;

    /**
     * Create a new IDESemanticOverlay
     * @param {Object} connectionManager - Connection manager for flow tracing
     * @param {Object} tileRenderer - Tile renderer for tile info access
     */
    constructor(connectionManager = null, tileRenderer = null) {
        this.#connectionManager = connectionManager;
        this.#tileRenderer = tileRenderer;
        this.#components = new Map();
        this.#semanticIndex = new Map();
        this.#timestamp = Date.now();
    }

    /**
     * Set component state for a tile
     * Updates semantic index based on state content
     * @param {string} tileId - Unique tile identifier
     * @param {Object} state - Component state object
     * @returns {IDESemanticOverlay} this for chaining
     */
    setComponentState(tileId, state) {
        if (!tileId || typeof tileId !== 'string') {
            throw new Error('Invalid tileId: must be a non-empty string');
        }

        // Remove old state from semantic index if exists
        if (this.#components.has(tileId)) {
            this.#removeFromSemanticIndex(tileId, this.#components.get(tileId));
        }

        // Store new state
        this.#components.set(tileId, { ...state });

        // Add to semantic index
        this.#addToSemanticIndex(tileId, state);

        // Update timestamp
        this.#timestamp = Date.now();

        return this;
    }

    /**
     * Get component state for a tile
     * @param {string} tileId - Tile identifier
     * @returns {Object|null} Component state or null if not found
     */
    getComponentState(tileId) {
        if (!tileId) return null;
        const state = this.#components.get(tileId);
        return state ? { ...state } : null;
    }

    /**
     * Query for tiles containing a concept definition
     * @param {string} concept - Concept name to search for
     * @returns {Array<string>} Array of tile IDs with the definition
     */
    queryDefinition(concept) {
        if (!concept || typeof concept !== 'string') {
            return [];
        }

        const normalizedConcept = concept.toLowerCase().trim();
        const results = [];

        for (const [tileId, state] of this.#components) {
            // Check definitions array
            if (state.definitions && Array.isArray(state.definitions)) {
                const hasDefinition = state.definitions.some(def =>
                    def && def.toLowerCase().includes(normalizedConcept)
                );
                if (hasDefinition) {
                    results.push(tileId);
                }
            }

            // Check openFiles for concept matches (filename without extension)
            if (state.openFiles && Array.isArray(state.openFiles)) {
                const hasFile = state.openFiles.some(file => {
                    if (!file) return false;
                    const baseName = this.#extractConceptFromFilename(file);
                    return baseName === normalizedConcept;
                });
                if (hasFile && !results.includes(tileId)) {
                    results.push(tileId);
                }
            }
        }

        return results;
    }

    /**
     * Query for tiles related to a concept (fuzzy match)
     * @param {string} concept - Concept to search for
     * @returns {Array<string>} Array of related tile IDs
     */
    queryRelated(concept) {
        if (!concept || typeof concept !== 'string') {
            return [];
        }

        const normalizedConcept = concept.toLowerCase().trim();
        const exactMatches = this.queryDefinition(concept);
        const results = [...exactMatches];

        // Check semantic index for partial matches
        for (const [indexedConcept, tileIds] of this.#semanticIndex) {
            if (indexedConcept.includes(normalizedConcept) ||
                normalizedConcept.includes(indexedConcept)) {
                for (const tileId of tileIds) {
                    if (!results.includes(tileId)) {
                        results.push(tileId);
                    }
                }
            }
        }

        return results;
    }

    /**
     * Trace data flow from a source tile via connection manager
     * @param {string} sourceTileId - Starting tile ID
     * @returns {Object} Flow trace result with path and connected tiles
     */
    traceFlow(sourceTileId) {
        const result = {
            source: sourceTileId,
            path: [sourceTileId],
            connections: [],
            connectedTiles: []
        };

        if (!sourceTileId || !this.#connectionManager) {
            return result;
        }

        // Get connections from connection manager
        try {
            // Check if connection manager has the expected methods
            if (typeof this.#connectionManager.getConnections === 'function') {
                const connections = this.#connectionManager.getConnections(sourceTileId);
                if (Array.isArray(connections)) {
                    result.connections = connections;
                    result.connectedTiles = connections
                        .map(conn => conn.targetId || conn.to || conn.target)
                        .filter(id => id && typeof id === 'string');
                    result.path = [sourceTileId, ...result.connectedTiles];
                }
            } else if (typeof this.#connectionManager.getOutgoingConnections === 'function') {
                const outgoing = this.#connectionManager.getOutgoingConnections(sourceTileId);
                if (Array.isArray(outgoing)) {
                    result.connections = outgoing;
                    result.connectedTiles = outgoing
                        .map(conn => conn.targetId || conn.to || conn.target)
                        .filter(id => id && typeof id === 'string');
                    result.path = [sourceTileId, ...result.connectedTiles];
                }
            }
        } catch (e) {
            // Connection manager call failed, return basic result
            console.warn('IDESemanticOverlay: Flow trace error:', e.message);
        }

        return result;
    }

    /**
     * Export state for cartridge serialization
     * @returns {Object} Serializable state object
     */
    exportState() {
        const components = {};
        for (const [tileId, state] of this.#components) {
            components[tileId] = state;
        }

        const semanticIndex = {};
        for (const [concept, tileIds] of this.#semanticIndex) {
            semanticIndex[concept] = Array.from(tileIds);
        }

        return {
            version: '1.0.0',
            timestamp: this.#timestamp,
            components,
            semanticIndex
        };
    }

    /**
     * Import state from cartridge
     * @param {Object} state - State object from exportState
     * @returns {IDESemanticOverlay} this for chaining
     */
    importState(state) {
        if (!state || typeof state !== 'object') {
            throw new Error('Invalid state: must be an object');
        }

        // Clear existing state
        this.clear();

        // Import components
        if (state.components) {
            for (const [tileId, componentState] of Object.entries(state.components)) {
                this.#components.set(tileId, { ...componentState });
            }
        }

        // Import semantic index
        if (state.semanticIndex) {
            for (const [concept, tileIds] of Object.entries(state.semanticIndex)) {
                if (Array.isArray(tileIds)) {
                    this.#semanticIndex.set(concept, new Set(tileIds));
                }
            }
        }

        // Import timestamp if available
        if (state.timestamp && typeof state.timestamp === 'number') {
            this.#timestamp = state.timestamp;
        }

        return this;
    }

    /**
     * Clear all state
     */
    clear() {
        this.#components.clear();
        this.#semanticIndex.clear();
        this.#timestamp = Date.now();
    }

    /**
     * Get count of tracked components
     * @returns {number} Number of components
     */
    getComponentCount() {
        return this.#components.size;
    }

    /**
     * Get all tracked tile IDs
     * @returns {Array<string>} Array of tile IDs
     */
    getTileIds() {
        return Array.from(this.#components.keys());
    }

    /**
     * Check if a tile has state
     * @param {string} tileId - Tile identifier
     * @returns {boolean} True if tile has state
     */
    hasComponentState(tileId) {
        return this.#components.has(tileId);
    }

    /**
     * Get current timestamp
     * @returns {number} Timestamp
     */
    getTimestamp() {
        return this.#timestamp;
    }

    // Private helper methods

    /**
     * Extract concept from filename (without extension)
     * @private
     * @param {string} filename - File path or name
     * @returns {string} Concept name
     */
    #extractConceptFromFilename(filename) {
        if (!filename) return '';

        // Get basename
        const parts = filename.split('/');
        const basename = parts[parts.length - 1];

        // Remove extension
        const dotIndex = basename.lastIndexOf('.');
        const concept = dotIndex > 0 ? basename.substring(0, dotIndex) : basename;

        return concept.toLowerCase().trim();
    }

    /**
     * Add tile state to semantic index
     * @private
     * @param {string} tileId - Tile identifier
     * @param {Object} state - Component state
     */
    #addToSemanticIndex(tileId, state) {
        // Index by openFiles
        if (state.openFiles && Array.isArray(state.openFiles)) {
            for (const file of state.openFiles) {
                const concept = this.#extractConceptFromFilename(file);
                if (concept) {
                    if (!this.#semanticIndex.has(concept)) {
                        this.#semanticIndex.set(concept, new Set());
                    }
                    this.#semanticIndex.get(concept).add(tileId);
                }
            }
        }

        // Index by definitions
        if (state.definitions && Array.isArray(state.definitions)) {
            for (const def of state.definitions) {
                if (def && typeof def === 'string') {
                    const concept = def.toLowerCase().trim();
                    if (concept) {
                        if (!this.#semanticIndex.has(concept)) {
                            this.#semanticIndex.set(concept, new Set());
                        }
                        this.#semanticIndex.get(concept).add(tileId);
                    }
                }
            }
        }
    }

    /**
     * Remove tile state from semantic index
     * @private
     * @param {string} tileId - Tile identifier
     * @param {Object} state - Component state to remove
     */
    #removeFromSemanticIndex(tileId, state) {
        // Remove from openFiles index
        if (state.openFiles && Array.isArray(state.openFiles)) {
            for (const file of state.openFiles) {
                const concept = this.#extractConceptFromFilename(file);
                if (concept && this.#semanticIndex.has(concept)) {
                    this.#semanticIndex.get(concept).delete(tileId);
                    if (this.#semanticIndex.get(concept).size === 0) {
                        this.#semanticIndex.delete(concept);
                    }
                }
            }
        }

        // Remove from definitions index
        if (state.definitions && Array.isArray(state.definitions)) {
            for (const def of state.definitions) {
                if (def && typeof def === 'string') {
                    const concept = def.toLowerCase().trim();
                    if (concept && this.#semanticIndex.has(concept)) {
                        this.#semanticIndex.get(concept).delete(tileId);
                        if (this.#semanticIndex.get(concept).size === 0) {
                            this.#semanticIndex.delete(concept);
                        }
                    }
                }
            }
        }
    }
}

// Also export as default for ES module compatibility
export default IDESemanticOverlay;
