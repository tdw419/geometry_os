/**
 * Geometry OS: Morphological Font
 *
 * Main API for client-side glyph synthesis using Hilbert patterns.
 * Provides cached texture generation for terminal rendering.
 */

class MorphologicalFont {
    constructor(options = {}) {
        this.device = options.device || null;
        this.size = options.size || 16;

        // Texture cache: "char:category" → canvas
        this.cache = new Map();
        this.cacheHits = 0;
        this.cacheMisses = 0;

        // Initialize components
        this.classifier = options.classifier || null;
        this.synthesizer = options.synthesizer || null;

        // Fallback canvas for non-WebGPU rendering
        this.fallbackCanvas = null;
        this.fallbackCtx = null;

        console.log('[MorphologicalFont] Initialized');
    }

    /**
     * Initialize with WebGPU device.
     */
    async init(device) {
        this.device = device;

        // Initialize classifier
        if (typeof SemanticClassifier !== 'undefined') {
            this.classifier = new SemanticClassifier();
            if (typeof PatternLibrary !== 'undefined') {
                this.classifier.setPatternLibrary(PatternLibrary);
            }
        }

        // Initialize synthesizer
        if (typeof HilbertGlyphSynthesizer !== 'undefined') {
            this.synthesizer = new HilbertGlyphSynthesizer();
            this.synthesizer.init();
        }

        // Create fallback canvas
        this._initFallbackCanvas();

        console.log('[MorphologicalFont] Ready');
    }

    /**
     * Initialize fallback canvas for non-WebGPU environments.
     */
    _initFallbackCanvas() {
        this.fallbackCanvas = document.createElement('canvas');
        this.fallbackCanvas.width = this.size;
        this.fallbackCanvas.height = this.size;
        this.fallbackCtx = this.fallbackCanvas.getContext('2d');
    }

    /**
     * Get or create glyph texture.
     *
     * @param {string} char - Character to render
     * @param {Object} context - Semantic context { category, bold, error, etc. }
     * @returns {Promise<HTMLCanvasElement>} Glyph canvas
     */
    async getGlyphTexture(char, context = {}) {
        // Build cache key
        const category = context.category || 'default';
        const key = `${char}:${category}`;

        // Check cache
        if (this.cache.has(key)) {
            this.cacheHits++;
            return this.cache.get(key);
        }

        this.cacheMisses++;

        // Synthesize glyph
        const canvas = await this._synthesizeGlyph(char, context);

        // Cache and return
        this.cache.set(key, canvas);
        return canvas;
    }

    /**
     * Synthesize a glyph texture.
     */
    async _synthesizeGlyph(char, context) {
        // Classify if not provided
        let classification;
        if (context.category && this.classifier) {
            classification = this.classifier.classify(char, context);
        } else if (this.classifier) {
            classification = this.classifier.classify(char);
        } else {
            classification = {
                category: context.category || 'default',
                params: {},
                modifier: {}
            };
        }

        // Synthesize distance field
        let sdfData;
        if (this.synthesizer) {
            sdfData = this.synthesizer.synthesize(
                char,
                classification.category,
                classification.params,
                classification.modifier
            );
        } else {
            sdfData = this._fallbackSDF(char);
        }

        // Convert to texture
        return this._createCanvasTexture(sdfData);
    }

    /**
     * Create canvas-based texture from SDF data.
     */
    _createCanvasTexture(sdfData) {
        const canvas = document.createElement('canvas');
        canvas.width = this.size;
        canvas.height = this.size;
        const ctx = canvas.getContext('2d');

        const imageData = ctx.createImageData(this.size, this.size);

        for (let i = 0; i < sdfData.length; i++) {
            const value = Math.floor(sdfData[i] * 255);
            imageData.data[i * 4] = 255;     // R
            imageData.data[i * 4 + 1] = 255; // G
            imageData.data[i * 4 + 2] = 255; // B
            imageData.data[i * 4 + 3] = value; // A (distance)
        }

        ctx.putImageData(imageData, 0, 0);

        return canvas;
    }

    /**
     * Fallback SDF for when synthesizer is not available.
     */
    _fallbackSDF(char) {
        const sdf = new Float32Array(256);

        // Use char code to seed variation
        const seed = char.charCodeAt(0);
        const cx = 8 + Math.sin(seed) * 3;
        const cy = 8 + Math.cos(seed * 1.3) * 3;

        // Simple circular gradient as fallback
        for (let y = 0; y < 16; y++) {
            for (let x = 0; x < 16; x++) {
                const dx = x - cx;
                const dy = y - cy;
                const dist = Math.sqrt(dx * dx + dy * dy);
                sdf[y * 16 + x] = Math.max(0, 1 - dist / 8);
            }
        }

        return sdf;
    }

    /**
     * Batch synthesis for a line of tokens.
     *
     * @param {Object[]} tokens - Array of { char, category } objects
     * @returns {Promise<HTMLCanvasElement[]>} Array of canvases
     */
    async synthesizeLine(tokens) {
        return Promise.all(tokens.map(t =>
            this.getGlyphTexture(t.char, { category: t.category })
        ));
    }

    /**
     * Get cache statistics.
     */
    getStats() {
        const total = this.cacheHits + this.cacheMisses;
        return {
            cacheSize: this.cache.size,
            cacheHits: this.cacheHits,
            cacheMisses: this.cacheMisses,
            hitRate: total > 0 ? (this.cacheHits / total * 100).toFixed(1) + '%' : 'N/A'
        };
    }

    /**
     * Clear the texture cache.
     */
    clearCache() {
        this.cache.clear();
        this.cacheHits = 0;
        this.cacheMisses = 0;
        console.log('[MorphologicalFont] Cache cleared');
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MorphologicalFont;
}
