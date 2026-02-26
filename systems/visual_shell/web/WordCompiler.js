/**
 * WordCompiler - Compiles Words from Dictionary manifests into executable glyphs
 *
 * A Word is a named sequence of glyphs that performs computation.
 * Words are stored in Dictionaries and placed on the InfiniteMap.
 *
 * Part of the Holographic Dictionary system for Geometry OS.
 */

class WordCompiler {
    /**
     * Create a new WordCompiler
     * @param {InfiniteMap} infiniteMap - Reference to the InfiniteMap for glyph placement
     * @param {GlyphExecutor} glyphExecutor - Reference to the GlyphExecutor for registration
     */
    constructor(infiniteMap, glyphExecutor) {
        this.infiniteMap = infiniteMap;
        this.glyphExecutor = glyphExecutor;
        this.wordIndex = new Map(); // wordName -> WordDefinition
        this.glyphExpander = null; // Set by setGlyphExpander()
        this.dictionaryStorage = null; // Set by setDictionaryStorage()

        console.log('[WordCompiler] Created');
    }

    /**
     * Set the GlyphExpander instance
     * @param {GlyphExpander} expander - The GlyphExpander to use for opcode expansion
     */
    setGlyphExpander(expander) {
        this.glyphExpander = expander;
    }

    /**
     * Set the DictionaryStorage instance
     * @param {DictionaryStorage} storage - The DictionaryStorage to use for manifest loading
     */
    setDictionaryStorage(storage) {
        this.dictionaryStorage = storage;
    }

    /**
     * Load a Dictionary manifest and index all Words
     * @param {string} dictionaryName - Name of the dictionary to load (e.g., 'standard')
     * @returns {Promise<number>} Number of words loaded
     */
    async loadDictionary(dictionaryName) {
        // Placeholder - will be implemented in task 1.4
        console.log(`[WordCompiler] loadDictionary(${dictionaryName}) - placeholder`);
        return 0;
    }

    /**
     * Expand a Word into its constituent glyphs
     * @param {string} wordName - Name of the word to expand
     * @returns {Array<GlyphRef>} Array of glyph references
     */
    expandWord(wordName) {
        // Placeholder - will be implemented in task 1.4
        console.log(`[WordCompiler] expandWord(${wordName}) - placeholder`);
        return [];
    }

    /**
     * Place a Word's glyphs on the InfiniteMap and register with GlyphExecutor
     * @param {string} wordName - Name of the word to place
     * @returns {Promise<boolean>} True if placement succeeded
     */
    async placeWord(wordName) {
        // Placeholder - will be implemented in task 1.5
        console.log(`[WordCompiler] placeWord(${wordName}) - placeholder`);
        return false;
    }

    /**
     * Get a Word definition by name
     * @param {string} wordName - Name of the word
     * @returns {WordDefinition|null} The word definition or null if not found
     */
    getWord(wordName) {
        return this.wordIndex.get(wordName) || null;
    }

    /**
     * Get all loaded words
     * @returns {Array<string>} Array of word names
     */
    getLoadedWords() {
        return Array.from(this.wordIndex.keys());
    }
}

// ES6 module export for browser
if (typeof window !== 'undefined') {
    window.WordCompiler = WordCompiler;
}

// CommonJS export for Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WordCompiler };
}
