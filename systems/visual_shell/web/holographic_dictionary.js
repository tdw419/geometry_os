/**
 * Geometry OS: Holographic Dictionary Manager
 *
 * Implements the browser-side Geometric Codebook for semantic pixel expansion.
 *
 * This is the VRAM-native dictionary that enables "Infinite Code Density" —
 * where a single pixel can represent entire code blocks through semantic tokens.
 *
 * Architecture:
 *   - Python (semantic_color_mapper.py): Creates codebook and encodes pixels
 *   - Browser (HolographicDictionary): Loads codebook and decodes pixels
 *   - GPU (future): WebGPU compute shader for parallel token expansion
 *
 * @module holographic_dictionary
 */

class SemanticToken {
    /**
     * @param {Object} data - Token data from codebook
     * @param {number} data.token_id - Unique token identifier
     * @param {string} data.name - Token name/description
     * @param {number} data.category - Semantic category (RED block)
     * @param {number} data.complexity - Complexity score (0-1)
     * @param {number} data.stability - Stability score (0-1)
     * @param {string} data.code_bytes - Hex-encoded instruction bytes
     * @param {number} data.frequency - Usage frequency (for optimization)
     */
    constructor(data) {
        this.tokenId = data.token_id;
        this.name = data.name || `Token_${data.token_id.toString(16)}`;
        this.category = data.category || 0;
        this.complexity = data.complexity || 0.5;
        this.stability = data.stability || 0.5;
        this.frequency = data.frequency || 0;

        // Decode hex to instruction array
        this.instructions = this._decodeInstructions(data.code_bytes || '');
        this.instructionCount = this.instructions.length;
    }

    /**
     * Decode hex string to Uint32Array of RISC-V instructions
     * @private
     */
    _decodeInstructions(hex) {
        if (!hex || hex.length === 0) {
            return new Uint32Array(0);
        }

        // Remove '0x' prefix if present
        hex = hex.replace(/^0x/i, '');

        // Ensure even length
        if (hex.length % 2 !== 0) {
            hex = '0' + hex;
        }

        // Convert hex to bytes
        const bytes = new Uint8Array(hex.length / 2);
        for (let i = 0; i < hex.length; i += 2) {
            bytes[i / 2] = parseInt(hex.substr(i, 2), 16);
        }

        // Convert bytes to 32-bit instructions (little-endian)
        const instructionCount = Math.floor(bytes.length / 4);
        const instructions = new Uint32Array(instructionCount);

        const dataView = new DataView(bytes.buffer);
        for (let i = 0; i < instructionCount; i++) {
            instructions[i] = dataView.getUint32(i * 4, true);
        }

        return instructions;
    }

    /**
     * Get the compression ratio achieved by this token
     * @returns {number} Ratio of (instructions * 4) / 4 bytes per pixel
     */
    getCompressionRatio() {
        return this.instructionCount; // Instructions per pixel
    }

    /**
     * Get token color for visualization
     * @returns {Object} RGBA color object
     */
    toColor() {
        // Encode token_id as RGB
        return {
            r: (this.tokenId >> 16) & 0xFF,
            g: (this.tokenId >> 8) & 0xFF,
            b: this.tokenId & 0xFF,
            a: 255
        };
    }

    /**
     * Create pixel data from this token
     * @returns {Uint8Array} RGBA pixel data
     */
    toPixelData() {
        const color = this.toColor();
        return new Uint8Array([color.r, color.g, color.b, color.a]);
    }
}

/**
 * GeometricDictionary - Main dictionary manager
 *
 * Manages the semantic token codebook for VRAM-native execution.
 */
class GeometricDictionary {
    /**
     * Create a new GeometricDictionary
     * @param {Object} options - Configuration options
     * @param {boolean} options.cacheVRAM - Prepare VRAM texture for GPU (default: false)
     * @param {number} options.maxCacheSize - Maximum tokens to cache (default: 4096)
     */
    constructor(options = {}) {
        this.options = {
            cacheVRAM: false,
            maxCacheSize: 4096,
            ...options
        };

        // Token storage
        this.tokens = new Map(); // tokenId -> SemanticToken
        this.tokensByCategory = new Map(); // categoryId -> Set of tokenIds

        // Category metadata
        this.categories = new Map(); // categoryId -> category info

        // Statistics
        this.stats = {
            tokensLoaded: 0,
            totalInstructions: 0,
            avgCompressionRatio: 0,
            totalBytes: 0,
            compressedBytes: 0
        };

        // VRAM texture cache (for future WebGPU)
        this.vramTexture = null;
        this.vramTextureData = null;

        this.isLoaded = false;

        console.log('📖 GeometricDictionary initialized', this.options);
    }

    /**
     * Load codebook from a JSON manifest
     * @param {string} url - URL to geometric_codebook.json
     * @returns {Promise<Object>} - Loading statistics
     */
    async loadFromManifest(url) {
        console.log(`📖 Loading Geometric Dictionary from: ${url}`);

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const manifest = await response.json();

            // Load version and metadata
            console.log(`    Dictionary version: ${manifest.version || 'unknown'}`);
            console.log(`    Created: ${manifest.created_at || 'unknown'}`);

            // Load tokens
            if (manifest.tokens && Array.isArray(manifest.tokens)) {
                for (const tokenData of manifest.tokens) {
                    this._addToken(new SemanticToken(tokenData));
                }
            }

            // Load categories
            if (manifest.categories) {
                for (const [catId, catData] of Object.entries(manifest.categories)) {
                    this.categories.set(parseInt(catId), catData);
                }
            }

            this.isLoaded = true;
            this._calculateStats();

            // Prepare VRAM texture if enabled
            if (this.options.cacheVRAM) {
                this._prepareVRAMTexture();
            }

            console.log(`✅ Loaded ${this.tokens.size} semantic tokens`);
            console.log(`   Total instructions: ${this.stats.totalInstructions}`);
            console.log(`   Avg compression: ${this.stats.avgCompressionRatio.toFixed(2)}x`);

            return {
                success: true,
                tokensLoaded: this.tokens.size,
                stats: this.stats
            };

        } catch (error) {
            console.error('❌ Failed to load dictionary:', error);
            return {
                success: false,
                error: error.message
            };
        }
    }

    /**
     * Register a new token in the dictionary
     * @param {Object} tokenData - Data for the new token
     * @returns {SemanticToken} The created token
     */
    registerToken(tokenData) {
        const token = new SemanticToken(tokenData);
        this._addToken(token);

        // Update stats and VRAM
        this._calculateStats();
        if (this.options.cacheVRAM) {
            this._prepareVRAMTexture();
        }

        return token;
    }

    /**
     * Add a token to the dictionary
     * @private
     */
    _addToken(token) {
        this.tokens.set(token.tokenId, token);

        // Track by category
        if (!this.tokensByCategory.has(token.category)) {
            this.tokensByCategory.set(token.category, new Set());
        }
        this.tokensByCategory.get(token.category).add(token.tokenId);
    }

    /**
     * Calculate dictionary statistics
     * @private
     */
    _calculateStats() {
        let totalInstructions = 0;
        let totalPixels = 0;

        for (const token of this.tokens.values()) {
            totalInstructions += token.instructionCount;
            totalPixels += 1; // Each token = 1 pixel
        }

        this.stats = {
            tokensLoaded: this.tokens.size,
            totalInstructions: totalInstructions,
            avgCompressionRatio: totalPixels > 0 ? totalInstructions / totalPixels : 0,
            totalBytes: totalInstructions * 4, // 4 bytes per instruction
            compressedBytes: totalPixels * 4    // 4 bytes per pixel
        };
    }

    /**
     * Prepare VRAM texture for GPU lookup
     * Creates a texture where each pixel represents a token
     * @private
     */
    _prepareVRAMTexture() {
        console.log('🎨 Preparing VRAM texture for GPU dictionary...');

        // Create a square texture large enough for all tokens
        const textureSize = Math.ceil(Math.sqrt(this.tokens.size));
        const textureData = new Uint8Array(textureSize * textureSize * 4);

        // Fill texture with token data
        for (const [tokenId, token] of this.tokens.entries()) {
            if (tokenId >= textureSize * textureSize) {
                console.warn(`Token ID ${tokenId} exceeds texture size`);
                continue;
            }

            // Encode token info into texture
            // We'll use RGBA to store metadata for quick GPU lookup
            const pixel = token.toPixelData();
            const offset = tokenId * 4;

            textureData[offset + 0] = pixel[0]; // R = tokenId high
            textureData[offset + 1] = pixel[1]; // G = tokenId mid
            textureData[offset + 2] = pixel[2]; // B = tokenId low
            textureData[offset + 3] = pixel[3]; // A = category
        }

        this.vramTextureData = textureData;
        this.vramTexture = {
            width: textureSize,
            height: textureSize,
            data: textureData
        };

        console.log(`   VRAM texture: ${textureSize}×${textureSize}`);
        console.log(`   Memory: ${(textureData.length / 1024).toFixed(2)} KB`);
    }

    /**
     * Get instructions from a semantic pixel
     * @param {number} r - Red channel (0-255)
     * @param {number} g - Green channel (0-255)
     * @param {number} b - Blue channel (0-255)
     * @param {number} a - Alpha channel (0-255)
     * @returns {Uint32Array} - RISC-V instructions
     */
    getInstructionsFromPixel(r, g, b, a = 255) {
        // Decode token ID from RGB
        const tokenId = (r << 16) | (g << 8) | b;

        const token = this.tokens.get(tokenId);
        if (token) {
            return token.instructions;
        }

        // Fallback: Literal 4-byte extraction (for non-semantic pixels)
        return new Uint32Array([(r << 24) | (g << 16) | (b << 8) | a]);
    }

    /**
     * Get a token by ID
     * @param {number} tokenId - Token identifier
     * @returns {SemanticToken|null} - Token object or null
     */
    getToken(tokenId) {
        return this.tokens.get(tokenId) || null;
    }

    /**
     * Get all tokens in a category
     * @param {number} categoryId - Category identifier
     * @returns {Array<SemanticToken>} - Array of tokens
     */
    getTokensByCategory(categoryId) {
        const tokenIds = this.tokensByCategory.get(categoryId);
        if (!tokenIds) {
            return [];
        }

        return Array.from(tokenIds).map(id => this.tokens.get(id));
    }

    /**
     * Get category metadata
     * @param {number} categoryId - Category identifier
     * @returns {Object|null} - Category metadata
     */
    getCategory(categoryId) {
        return this.categories.get(categoryId) || null;
    }

    /**
     * Check if a pixel value is a semantic token
     * @param {number} r - Red channel
     * @param {number} g - Green channel
     * @param {number} b - Blue channel
     * @returns {boolean} - True if pixel matches a known token
     */
    isSemanticPixel(r, g, b) {
        const tokenId = (r << 16) | (g << 8) | b;
        return this.tokens.has(tokenId);
    }

    /**
     * Get dictionary statistics
     * @returns {Object} - Dictionary statistics
     */
    getStats() {
        return {
            ...this.stats,
            isLoaded: this.isLoaded,
            categoryCount: this.categories.size,
            hasVRAMTexture: this.vramTexture !== null
        };
    }

    /**
     * Create a codebook manifest from current tokens
     * @returns {Object} - Codebook manifest JSON
     */
    createManifest() {
        const tokens = [];

        for (const token of this.tokens.values()) {
            // Encode instructions back to hex
            const code_bytes = this._encodeInstructions(token.instructions);

            tokens.push({
                token_id: token.tokenId,
                name: token.name,
                category: token.category,
                complexity: token.complexity,
                stability: token.stability,
                code_bytes: code_bytes,
                frequency: token.frequency
            });
        }

        return {
            version: '1.0',
            created_at: new Date().toISOString(),
            tokens: tokens,
            categories: Object.fromEntries(this.categories)
        };
    }

    /**
     * Encode instructions to hex string
     * @private
     */
    _encodeInstructions(instructions) {
        if (!instructions || instructions.length === 0) {
            return '';
        }

        const bytes = new Uint8Array(instructions.length * 4);
        const dataView = new DataView(bytes.buffer);

        for (let i = 0; i < instructions.length; i++) {
            dataView.setUint32(i * 4, instructions[i], true); // Little-endian
        }

        return Array.from(bytes)
            .map(b => b.toString(16).padStart(2, '0'))
            .join('');
    }

    /**
     * Clear the dictionary
     */
    clear() {
        this.tokens.clear();
        this.tokensByCategory.clear();
        this.categories.clear();
        this.vramTexture = null;
        this.vramTextureData = null;
        this.isLoaded = false;

        console.log('🗑️ Dictionary cleared');
    }

    /**
     * Export dictionary for WebGPU use
     * 
     * Generates a flattened instruction buffer and a metadata map.
     * 
     * @returns {Object} - GPU-ready dictionary data
     */
    exportForWebGPU() {
        if (!this.isLoaded) return null;

        // 1. Calculate total instruction count and offsets
        let totalInstructions = 0;
        const metadata = new Map(); // tokenId -> {offset, length}

        // Sort tokens by ID for consistent mapping if needed, 
        // but we'll use tokenId directly as the key in the metadata map.
        for (const [tokenId, token] of this.tokens.entries()) {
            metadata.set(tokenId, {
                offset: totalInstructions,
                length: token.instructionCount
            });
            totalInstructions += token.instructionCount;
        }

        // 2. Create flattened instruction buffer
        const instructionBuffer = new Uint32Array(totalInstructions);
        for (const [tokenId, token] of this.tokens.entries()) {
            const meta = metadata.get(tokenId);
            instructionBuffer.set(token.instructions, meta.offset);
        }

        // 3. Create metadata texture data (4096x4096 for 24-bit token IDs)
        // Note: For now we'll use a more compact version if token count is small,
        // but the shader will expect a specific mapping.
        // Let's use a 1D buffer for metadata if tokenId mapping is handled.
        // If we use tokenId as index, we need a large buffer.

        return {
            instructionBuffer,
            metadata,
            totalInstructions,
            tokenCount: this.tokens.size
        };
    }
}

/**
 * GeometricDictionaryFactory - Utility for creating dictionaries
 */
class GeometricDictionaryFactory {
    /**
     * Create a default dictionary
     * @returns {GeometricDictionary}
     */
    static createDefault() {
        return new GeometricDictionary({
            cacheVRAM: true,
            maxCacheSize: 4096
        });
    }

    /**
     * Create a lightweight dictionary (no VRAM caching)
     * @returns {GeometricDictionary}
     */
    static createLightweight() {
        return new GeometricDictionary({
            cacheVRAM: false,
            maxCacheSize: 1024
        });
    }

    /**
     * Create a GPU-optimized dictionary
     * @returns {GeometricDictionary}
     */
    static createGPUOptimized() {
        return new GeometricDictionary({
            cacheVRAM: true,
            maxCacheSize: 16384
        });
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.GeometricDictionary = GeometricDictionary;
    window.SemanticToken = SemanticToken;
    window.GeometricDictionaryFactory = GeometricDictionaryFactory;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        GeometricDictionary,
        SemanticToken,
        GeometricDictionaryFactory
    };
}
