/**
 * Geometry OS: Morphological Pattern Library
 *
 * Defines base Hilbert patterns and semantic transformation parameters.
 * Each category maps to a distinct geometric signature.
 */

const PatternLibrary = {
    /**
     * Semantic categories and their geometric properties.
     */
    categories: {
        control: {
            name: 'control',
            description: 'Branching patterns for control flow keywords',
            keywords: ['if', 'else', 'for', 'while', 'switch', 'case', 'default', 'try', 'catch', 'finally'],
            pattern: 'branch',
            params: {
                branchAngle: 45,
                branchDepth: 0.3,
                branchPosition: 0.5,
                symmetry: 'bilateral'
            }
        },
        function: {
            name: 'function',
            description: 'Enclosed loop patterns for function/class definitions',
            keywords: ['def', 'function', 'class', 'lambda', 'fn', 'func', 'method', 'constructor'],
            pattern: 'enclose',
            params: {
                enclosureDepth: 2,
                cornerRadius: 0.2,
                innerPadding: 0.15,
                symmetry: 'radial'
            }
        },
        return: {
            name: 'return',
            description: 'Outward arrow patterns for return/exit keywords',
            keywords: ['return', 'yield', 'break', 'continue', 'exit', 'raise', 'throw'],
            pattern: 'direct',
            params: {
                direction: 'outward',
                arrowSize: 0.4,
                shaftWidth: 0.15,
                arrowStyle: 'double'
            }
        },
        data: {
            name: 'data',
            description: 'Stable rectangular patterns for data declarations',
            keywords: ['const', 'let', 'var', 'int', 'string', 'bool', 'float', 'number', 'array', 'object'],
            pattern: 'stabilize',
            params: {
                aspectRatio: 1.0,
                cornerRadius: 0.1,
                stability: 1.0,
                fill: 'solid'
            }
        },
        operator: {
            name: 'operator',
            description: 'Symmetric cross patterns for operators',
            keywords: ['+', '-', '*', '/', '=', '==', '!=', '<', '>', '<=', '>=', '&&', '||'],
            pattern: 'cross',
            params: {
                armLength: 0.4,
                armWidth: 0.15,
                centerSize: 0.2,
                symmetry: 'quad'
            }
        },
        literal: {
            name: 'literal',
            description: 'Dense spiral patterns for literals',
            keywords: [],
            pattern: 'spiral',
            params: {
                turns: 3,
                spacing: 0.1,
                direction: 'clockwise',
                density: 'high'
            }
        },
        default: {
            name: 'default',
            description: 'Standard Hilbert pattern for general characters',
            keywords: [],
            pattern: 'standard',
            params: {
                order: 4,
                rotation: 0,
                scale: 1.0
            }
        }
    },

    /**
     * Character-specific modifiers for uniqueness within categories.
     */
    characterModifiers: {
        // Control flow
        'if': { startOffset: 0, rotation: 0, scale: 1.0, length: 1.0, branchPosition: 0.5 },
        'else': { startOffset: 64, rotation: 90, scale: 0.95, length: 1.0, branchPosition: 0.3 },
        'for': { startOffset: 32, rotation: 90, scale: 1.0, length: 1.0, branchPosition: 0.25 },
        'while': { startOffset: 128, rotation: 180, scale: 1.0, length: 1.0, branchPosition: 0.6 },

        // Functions
        'def': { startOffset: 0, rotation: 0, scale: 1.0, enclosureDepth: 2 },
        'function': { startOffset: 64, rotation: 0, scale: 1.1, enclosureDepth: 3 },
        'class': { startOffset: 128, rotation: 90, scale: 1.2, enclosureDepth: 3 },

        // Returns
        'return': { startOffset: 0, rotation: 0, scale: 1.0, arrowSize: 0.4 },
        'yield': { startOffset: 64, rotation: 45, scale: 0.9, arrowSize: 0.3 },
        'break': { startOffset: 128, rotation: 0, scale: 1.0, arrowSize: 0.5 },

        // Data
        'const': { startOffset: 0, rotation: 0, scale: 1.0, aspectRatio: 1.0 },
        'let': { startOffset: 64, rotation: 0, scale: 0.95, aspectRatio: 0.8 },
        'var': { startOffset: 128, rotation: 0, scale: 0.95, aspectRatio: 1.2 }
    },

    /**
     * Generate Hilbert curve lookup table.
     */
    generateHilbertLUT(order = 4) {
        const size = Math.pow(2, order);
        const lut = new Array(size * size);

        for (let i = 0; i < size * size; i++) {
            const [x, y] = this._hilbertD2XY(size, i);
            lut[i] = { x, y, d: i };
        }

        return lut;
    },

    /**
     * Convert Hilbert distance to (x, y) coordinates.
     */
    _hilbertD2XY(n, d) {
        let x = 0, y = 0, s = 1, rx, ry, t = d;

        while (s < n) {
            rx = 1 & (t / 2);
            ry = 1 & (t ^ rx);

            [x, y] = this._hilbertRot(s, x, y, rx, ry);

            x += s * rx;
            y += s * ry;
            t = Math.floor(t / 4);
            s *= 2;
        }

        return [x, y];
    },

    /**
     * Rotate Hilbert quadrant.
     */
    _hilbertRot(n, x, y, rx, ry) {
        if (ry === 0) {
            if (rx === 1) {
                x = n - 1 - x;
                y = n - 1 - y;
            }
            return [y, x];
        }
        return [x, y];
    },

    /**
     * Get pattern for a category.
     */
    getPattern(categoryName) {
        return this.categories[categoryName] || this.categories.default;
    },

    /**
     * Get character modifier or default.
     */
    getModifier(char) {
        return this.characterModifiers[char] || {
            startOffset: char.charCodeAt(0) % 256,
            rotation: 0,
            scale: 1.0,
            length: 1.0
        };
    }
};

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = PatternLibrary;
}
