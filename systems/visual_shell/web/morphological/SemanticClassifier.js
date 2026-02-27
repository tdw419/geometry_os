/**
 * Geometry OS: Semantic Classifier
 *
 * Classifies tokens/characters into semantic categories
 * for morphological glyph synthesis.
 */

class SemanticClassifier {
    constructor() {
        this.patternLibrary = null;  // Injected or imported
        this.literalPatterns = {
            number: /^-?\d+\.?\d*$/,
            string: /^['"`].*['"`]$/,
            boolean: /^(true|false)$/
        };
    }

    /**
     * Set the pattern library reference.
     */
    setPatternLibrary(library) {
        this.patternLibrary = library;
    }

    /**
     * Classify a token/character into a semantic category.
     *
     * @param {string} token - The token to classify
     * @param {Object} context - Additional context (previous/next tokens, etc.)
     * @returns {Object} Classification result with category and params
     */
    classify(token, context = {}) {
        if (!this.patternLibrary) {
            console.warn('[SemanticClassifier] PatternLibrary not set, using default');
            return this._defaultResult(token);
        }

        // Check each category for keyword match
        for (const [categoryName, category] of Object.entries(this.patternLibrary.categories)) {
            if (category.keywords && category.keywords.includes(token)) {
                return {
                    category: categoryName,
                    pattern: category.pattern,
                    params: { ...category.params },
                    modifier: this.patternLibrary.getModifier(token)
                };
            }
        }

        // Check for literal patterns
        const literalType = this._classifyLiteral(token);
        if (literalType) {
            const category = this.patternLibrary.categories.literal;
            return {
                category: 'literal',
                pattern: category.pattern,
                params: { ...category.params, literalType },
                modifier: this.patternLibrary.getModifier(token)
            };
        }

        // Check context for hints
        if (context.nextToken && this._isOperatorContext(token, context)) {
            return this._classifyOperator(token);
        }

        // Default category
        return this._defaultResult(token);
    }

    /**
     * Check if token is a literal (number, string, boolean).
     */
    _classifyLiteral(token) {
        for (const [type, pattern] of Object.entries(this.literalPatterns)) {
            if (pattern.test(token)) {
                return type;
            }
        }
        return null;
    }

    /**
     * Check if token should be classified as operator.
     */
    _isOperatorContext(token, context) {
        const operators = this.patternLibrary.categories.operator?.keywords || [];
        return operators.includes(token);
    }

    /**
     * Classify an operator.
     */
    _classifyOperator(token) {
        const category = this.patternLibrary.categories.operator;
        return {
            category: 'operator',
            pattern: category.pattern,
            params: { ...category.params },
            modifier: this.patternLibrary.getModifier(token)
        };
    }

    /**
     * Default classification result.
     */
    _defaultResult(token) {
        const category = this.patternLibrary?.categories?.default || {
            name: 'default',
            pattern: 'standard',
            params: { order: 4, rotation: 0, scale: 1.0 }
        };

        return {
            category: 'default',
            pattern: category.pattern,
            params: { ...category.params },
            modifier: this.patternLibrary?.getModifier(token) || {
                startOffset: token.charCodeAt(0) % 256,
                rotation: 0,
                scale: 1.0,
                length: 1.0
            }
        };
    }

    /**
     * Batch classify multiple tokens.
     *
     * @param {string[]} tokens - Array of tokens
     * @returns {Object[]} Array of classification results
     */
    classifyBatch(tokens) {
        return tokens.map((token, index) => {
            const context = {
                prevToken: tokens[index - 1],
                nextToken: tokens[index + 1]
            };
            return this.classify(token, context);
        });
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SemanticClassifier;
}
