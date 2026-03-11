/**
 * Geometry OS: Layer Mapper Module
 *
 * Parses .rts.meta.json files and maps layer offsets to pixel regions
 * using Hilbert curve spatial encoding. Enables visual heatmap overlays
 * for neural network activations stored in PixelRTS format.
 *
 * @module layer_mapper
 */

class LayerMapper {
    /**
     * Create a new LayerMapper
     * @param {Object} options - Configuration options
     * @param {number} options.gridSize - Grid size (must be power of 2)
     * @param {number} options.bytesPerPixel - Bytes per pixel (default: 4)
     */
    constructor(options = {}) {
        this.gridSize = options.gridSize || 2048;
        this.bytesPerPixel = options.bytesPerPixel || 4;
        this.metadata = null;
        this.layers = new Map();
        this.boundaries = [];
        this._hilbertOrder = Math.ceil(Math.log2(this.gridSize));
        this._hilbertCache = new Map();

        console.log(`[LayerMapper] Initialized with grid ${this.gridSize}×${this.gridSize}, ` +
                   `Hilbert order ${this._hilbertOrder}`);
    }

    /**
     * Load and parse metadata JSON
     * @param {string|Object} pathOrData - File path or pre-parsed metadata object
     * @returns {Promise<Object>} The parsed metadata
     * @async
     */
    async loadMetadata(pathOrData) {
        let metadata;

        if (typeof pathOrData === 'string') {
            // Load from file path
            console.log(`[LayerMapper] Loading metadata from: ${pathOrData}`);
            const response = await fetch(pathOrData);
            if (!response.ok) {
                throw new Error(`Failed to load metadata: ${response.statusText}`);
            }
            metadata = await response.json();
        } else {
            // Use provided object
            metadata = pathOrData;
        }

        // Validate metadata format
        if (!metadata.format || !metadata.format.startsWith('PixelRTS')) {
            console.warn('[LayerMapper] Warning: Unknown format:', metadata.format);
        }

        // Extract grid size from metadata if available
        if (metadata.grid_size) {
            this.gridSize = metadata.grid_size;
            this._hilbertOrder = Math.ceil(Math.log2(this.gridSize));
            console.log(`[LayerMapper] Updated grid size to ${this.gridSize} (order ${this._hilbertOrder})`);
        }

        // Extract encoding info
        if (metadata.encoding) {
            this.bytesPerPixel = metadata.encoding.bytes_per_pixel || 4;
        }

        this.metadata = metadata;

        // Parse layers from offsets
        this._parseLayers();

        console.log(`[LayerMapper] Loaded ${this.layers.size} layers`);
        return metadata;
    }

    /**
     * Parse layer information from metadata offsets
     * @private
     */
    _parseLayers() {
        if (!this.metadata || !this.metadata.offsets) {
            console.warn('[LayerMapper] No offsets found in metadata');
            return;
        }

        this.layers.clear();

        for (const [path, offsetInfo] of Object.entries(this.metadata.offsets)) {
            const layer = {
                path: path,
                name: this._extractLayerName(path),
                start: offsetInfo.start,
                end: offsetInfo.end,
                size: offsetInfo.size,
                sha256: offsetInfo.sha256,
                type: this.classifyLayer(path)
            };

            // Convert byte offsets to pixel indices
            layer.startPixel = Math.floor(layer.start / this.bytesPerPixel);
            layer.endPixel = Math.ceil(layer.end / this.bytesPerPixel);
            layer.pixelCount = layer.endPixel - layer.startPixel;

            this.layers.set(path, layer);
        }
    }

    /**
     * Extract layer name from file path
     * @param {string} path - Full file path
     * @returns {string} Simplified layer name
     * @private
     */
    _extractLayerName(path) {
        // Get filename from path
        const parts = path.split('/');
        const filename = parts[parts.length - 1];

        // Remove extension
        const nameWithoutExt = filename.replace(/\.(meta\.)?(json|png|rts|wgsl|wasm|md|txt)$/i, '');

        return nameWithoutExt || filename;
    }

    /**
     * Determine layer type from name/path
     * @param {string} layerName - Layer name or path
     * @returns {string} Layer type: 'embedding', 'attention', 'mlp', 'output', or 'unknown'
     */
    classifyLayer(layerName) {
        const name = layerName.toLowerCase();

        // Neural network layer types
        if (name.includes('embed') || name.includes('token') || name.includes('input')) {
            return 'embedding';
        }
        if (name.includes('attn') || name.includes('attention') || name.includes('qkv') ||
            name.includes('key') || name.includes('query') || name.includes('value') ||
            name.includes('self_attn') || name.includes('cross_attn')) {
            return 'attention';
        }
        if (name.includes('mlp') || name.includes('ffn') || name.includes('feed') ||
            name.includes('linear') || name.includes('dense') || name.includes('gate')) {
            return 'mlp';
        }
        if (name.includes('output') || name.includes('logits') || name.includes('head') ||
            name.includes('lm_head') || name.includes('final')) {
            return 'output';
        }

        // File-based layer types
        if (name.includes('kernel') || name.includes('boot') || name.includes('initrd')) {
            return 'kernel';
        }
        if (name.includes('app') || name.includes('tool')) {
            return 'application';
        }
        if (name.includes('doc') || name.includes('readme') || name.includes('guide')) {
            return 'documentation';
        }
        if (name.includes('config') || name.includes('json') || name.includes('toml')) {
            return 'config';
        }
        if (name.includes('test') || name.includes('spec')) {
            return 'test';
        }
        if (name.includes('shader') || name.includes('wgsl') || name.includes('glsl')) {
            return 'shader';
        }
        if (name.includes('source') || name.includes('src/') || name.match(/\.(js|py|rs|cpp|c|h)$/)) {
            return 'source';
        }

        return 'unknown';
    }

    /**
     * Convert Hilbert distance to (x, y) coordinates
     * Uses existing HilbertLUT for coordinate conversion
     * @param {number} d - Distance along the curve (0 to n²-1)
     * @returns {[number, number]} [x, y] coordinates
     */
    hilbertD2xy(d) {
        // Check cache first
        if (this._hilbertCache.has(d)) {
            return this._hilbertCache.get(d);
        }

        // Use HilbertLUT if available
        if (typeof HilbertLUT !== 'undefined') {
            const coords = HilbertLUT.d2xy(this.gridSize, d);
            this._hilbertCache.set(d, coords);
            return coords;
        }

        // Fallback: compute directly
        let x = 0, y = 0;
        let s = 1;
        let tempD = d;

        while (s < this.gridSize) {
            const rx = 1 & (tempD >> 1);
            const ry = 1 & (tempD ^ rx);

            if (ry === 0) {
                if (rx === 1) {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                [x, y] = [y, x];
            }

            x += s * rx;
            y += s * ry;

            tempD = tempD >> 2;
            s = s * 2;
        }

        const coords = [x, y];
        this._hilbertCache.set(d, coords);
        return coords;
    }

    /**
     * Convert (x, y) coordinates to Hilbert distance
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {number} Distance along the curve
     */
    hilbertXy2d(x, y) {
        if (typeof HilbertLUT !== 'undefined') {
            return HilbertLUT.xy2d(this.gridSize, x, y);
        }

        let d = 0;
        let s = 1;
        let tempX = x;
        let tempY = y;

        while (s < this.gridSize) {
            const rx = (tempX & s) > 0 ? 1 : 0;
            const ry = (tempY & s) > 0 ? 1 : 0;

            d += s * s * ((3 * rx) ^ ry);

            if (ry === 0) {
                if (rx === 1) {
                    tempX = s - 1 - tempX;
                    tempY = s - 1 - tempY;
                }
                [tempX, tempY] = [tempY, tempX];
            }

            s = s * 2;
        }

        return d;
    }

    /**
     * Generate bounding rectangles for all layers
     * Converts byte offsets to pixel regions using Hilbert curve
     * @returns {Array<Object>} Array of boundary objects
     */
    generateBoundaries() {
        if (this.layers.size === 0) {
            console.warn('[LayerMapper] No layers to generate boundaries for');
            return [];
        }

        this.boundaries = [];

        for (const [path, layer] of this.layers) {
            const boundary = this._generateLayerBoundary(layer);
            if (boundary) {
                this.boundaries.push(boundary);
            }
        }

        console.log(`[LayerMapper] Generated ${this.boundaries.length} layer boundaries`);
        return this.boundaries;
    }

    /**
     * Generate boundary for a single layer
     * @param {Object} layer - Layer object
     * @returns {Object|null} Boundary object with rect and layer info
     * @private
     */
    _generateLayerBoundary(layer) {
        const points = [];

        // Get coordinates for start and end pixels
        const [startX, startY] = this.hilbertD2xy(layer.startPixel);
        const [endX, endY] = this.hilbertD2xy(layer.endPixel - 1);

        // For small layers, just add the start point
        if (layer.pixelCount <= 4) {
            points.push({ x: startX, y: startY });
        } else {
            // Sample points along the Hilbert curve for this layer
            const sampleCount = Math.min(64, layer.pixelCount);
            const step = Math.floor(layer.pixelCount / sampleCount);

            for (let i = 0; i < layer.pixelCount; i += step) {
                const [x, y] = this.hilbertD2xy(layer.startPixel + i);
                points.push({ x, y });
            }

            // Ensure we include the end point
            const lastIdx = layer.endPixel - 1;
            const [lastX, lastY] = this.hilbertD2xy(lastIdx);
            points.push({ x: lastX, y: lastY });
        }

        // Calculate bounding box
        let minX = Infinity, minY = Infinity;
        let maxX = -Infinity, maxY = -Infinity;

        for (const pt of points) {
            minX = Math.min(minX, pt.x);
            minY = Math.min(minY, pt.y);
            maxX = Math.max(maxX, pt.x);
            maxY = Math.max(maxY, pt.y);
        }

        // Create boundary rectangle
        const boundary = {
            path: layer.path,
            name: layer.name,
            type: layer.type,
            rect: {
                x: minX,
                y: minY,
                width: maxX - minX + 1,
                height: maxY - minY + 1
            },
            start: { x: startX, y: startY },
            end: { x: endX, y: endY },
            byteRange: { start: layer.start, end: layer.end },
            pixelRange: { start: layer.startPixel, end: layer.endPixel },
            size: layer.size,
            pixelCount: layer.pixelCount,
            sha256: layer.sha256,
            points: points.length > 100 ? null : points  // Store points for small layers
        };

        return boundary;
    }

    /**
     * Find which layer is at a specific coordinate
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {Object|null} Layer information or null if no layer found
     */
    getLayerAtPoint(x, y) {
        // Convert pixel coordinate to Hilbert distance
        const d = this.hilbertXy2d(x, y);
        const byteOffset = d * this.bytesPerPixel;

        // Search for layer containing this byte offset
        for (const [path, layer] of this.layers) {
            if (byteOffset >= layer.start && byteOffset < layer.end) {
                return {
                    path: layer.path,
                    name: layer.name,
                    type: layer.type,
                    byteOffset: byteOffset - layer.start,
                    relativePixel: d - layer.startPixel,
                    layer: layer
                };
            }
        }

        return null;
    }

    /**
     * Get all layers of a specific type
     * @param {string} type - Layer type to filter by
     * @returns {Array<Object>} Array of layer objects
     */
    getLayersByType(type) {
        const results = [];
        for (const [path, layer] of this.layers) {
            if (layer.type === type) {
                results.push(layer);
            }
        }
        return results;
    }

    /**
     * Get layer by path
     * @param {string} path - Layer path
     * @returns {Object|undefined} Layer object or undefined
     */
    getLayer(path) {
        return this.layers.get(path);
    }

    /**
     * Get all layer paths
     * @returns {Array<string>} Array of layer paths
     */
    getLayerPaths() {
        return Array.from(this.layers.keys());
    }

    /**
     * Get layer statistics
     * @returns {Object} Statistics about layers
     */
    getStatistics() {
        const stats = {
            totalLayers: this.layers.size,
            totalBytes: 0,
            totalPixels: 0,
            byType: {},
            averageLayerSize: 0,
            largestLayer: null,
            smallestLayer: null
        };

        let maxSize = 0;
        let minSize = Infinity;

        for (const [path, layer] of this.layers) {
            stats.totalBytes += layer.size;
            stats.totalPixels += layer.pixelCount;

            // Count by type
            if (!stats.byType[layer.type]) {
                stats.byType[layer.type] = { count: 0, bytes: 0 };
            }
            stats.byType[layer.type].count++;
            stats.byType[layer.type].bytes += layer.size;

            // Track extremes
            if (layer.size > maxSize) {
                maxSize = layer.size;
                stats.largestLayer = { path, name: layer.name, size: layer.size };
            }
            if (layer.size < minSize) {
                minSize = layer.size;
                stats.smallestLayer = { path, name: layer.name, size: layer.size };
            }
        }

        stats.averageLayerSize = stats.totalLayers > 0 ?
            Math.round(stats.totalBytes / stats.totalLayers) : 0;

        return stats;
    }

    /**
     * Clear cached data
     */
    clear() {
        this.metadata = null;
        this.layers.clear();
        this.boundaries = [];
        this._hilbertCache.clear();
        console.log('[LayerMapper] Cleared all cached data');
    }

    /**
     * Export boundaries as JSON
     * @returns {string} JSON string of boundaries
     */
    exportBoundaries() {
        return JSON.stringify({
            gridSize: this.gridSize,
            hilbertOrder: this._hilbertOrder,
            bytesPerPixel: this.bytesPerPixel,
            boundaries: this.boundaries
        }, null, 2);
    }

    /**
     * Import boundaries from JSON
     * @param {string} json - JSON string of boundaries
     * @returns {boolean} Success status
     */
    importBoundaries(json) {
        try {
            const data = JSON.parse(json);
            this.gridSize = data.gridSize;
            this._hilbertOrder = data.hilbertOrder;
            this.bytesPerPixel = data.bytesPerPixel;
            this.boundaries = data.boundaries || [];
            console.log(`[LayerMapper] Imported ${this.boundaries.length} boundaries`);
            return true;
        } catch (e) {
            console.error('[LayerMapper] Failed to import boundaries:', e);
            return false;
        }
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.LayerMapper = LayerMapper;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LayerMapper };
}
