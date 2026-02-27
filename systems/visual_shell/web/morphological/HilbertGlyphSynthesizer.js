/**
 * Geometry OS: Hilbert Glyph Synthesizer
 *
 * Synthesizes 16x16 SDF textures from semantic parameters
 * using Hilbert curve transformations.
 */

class HilbertGlyphSynthesizer {
    constructor() {
        this.size = 16;  // 16x16 grid
        this.hilbertLUT = null;
    }

    /**
     * Initialize the Hilbert lookup table.
     */
    init() {
        if (typeof PatternLibrary !== 'undefined') {
            this.hilbertLUT = PatternLibrary.generateHilbertLUT(4);
        } else {
            this.hilbertLUT = this._generateHilbertLUT(4);
        }
    }

    /**
     * Synthesize a 16x16 SDF texture.
     *
     * @param {string} char - Character to synthesize
     * @param {string} category - Semantic category
     * @param {Object} params - Pattern parameters
     * @param {Object} modifier - Character-specific modifier
     * @returns {Float32Array} 256-element distance field
     */
    synthesize(char, category, params, modifier = {}) {
        if (!this.hilbertLUT) this.init();

        // Start with base Hilbert pattern
        let sequence = this._generateBaseSequence(modifier);

        // Apply category-specific transformation
        switch (category) {
            case 'control':
                sequence = this._applyBranch(sequence, params);
                break;
            case 'function':
                sequence = this._applyEnclose(sequence, params);
                break;
            case 'return':
                sequence = this._applyDirect(sequence, params);
                break;
            case 'data':
                sequence = this._applyStabilize(sequence, params);
                break;
            case 'operator':
                sequence = this._applyCross(sequence, params);
                break;
            case 'literal':
                sequence = this._applySpiral(sequence, params);
                break;
            default:
                // Standard Hilbert, no modification
                break;
        }

        // Convert sequence to distance field
        return this._sequenceToDistanceField(sequence);
    }

    /**
     * Generate base Hilbert sequence with modifier applied.
     */
    _generateBaseSequence(modifier) {
        const offset = modifier.startOffset || 0;
        const rotation = modifier.rotation || 0;
        const scale = modifier.scale || 1.0;
        const length = modifier.length || 1.0;

        const sequence = [];
        const totalPoints = Math.floor(256 * length);

        for (let i = 0; i < totalPoints; i++) {
            const lutIndex = (i + offset) % 256;
            const point = this.hilbertLUT[lutIndex];

            // Apply rotation
            const rotated = this._rotatePoint(point, rotation);

            // Apply scale
            const scaled = {
                x: 8 + (rotated.x - 8) * scale,
                y: 8 + (rotated.y - 8) * scale
            };

            sequence.push(scaled);
        }

        return sequence;
    }

    /**
     * Rotate a point around the center (8, 8).
     */
    _rotatePoint(point, degrees) {
        const rad = degrees * Math.PI / 180;
        const cx = 8, cy = 8;
        const dx = point.x - cx;
        const dy = point.y - cy;

        return {
            x: cx + dx * Math.cos(rad) - dy * Math.sin(rad),
            y: cy + dx * Math.sin(rad) + dy * Math.cos(rad)
        };
    }

    /**
     * Apply branching pattern for control flow.
     */
    _applyBranch(sequence, params) {
        const branchPos = params.branchPosition || 0.5;
        const branchAngle = params.branchAngle || 45;

        const result = [];
        const splitIndex = Math.floor(sequence.length * branchPos);

        // First part: original path
        for (let i = 0; i < splitIndex; i++) {
            result.push(sequence[i]);
        }

        // Branch point
        const branchPoint = sequence[splitIndex];

        // Left branch
        const leftBranch = this._createBranch(branchPoint, branchAngle, sequence.length - splitIndex, -1);

        // Right branch
        const rightBranch = this._createBranch(branchPoint, branchAngle, sequence.length - splitIndex, 1);

        // Interleave branches
        for (let i = 0; i < leftBranch.length; i++) {
            result.push(leftBranch[i]);
            if (rightBranch[i]) result.push(rightBranch[i]);
        }

        return result;
    }

    /**
     * Create a branch from a point.
     */
    _createBranch(start, angle, length, direction) {
        const branch = [];
        const rad = (angle * direction * Math.PI) / 180;
        const step = 0.5;

        for (let i = 0; i < length; i++) {
            branch.push({
                x: start.x + Math.cos(rad) * i * step,
                y: start.y + Math.sin(rad) * i * step
            });
        }

        return branch;
    }

    /**
     * Apply enclosure pattern for functions.
     */
    _applyEnclose(sequence, params) {
        const depth = params.enclosureDepth || 2;
        const padding = params.innerPadding || 0.15;

        // Create nested rectangular paths
        const result = [];

        for (let d = 0; d < depth; d++) {
            const inset = padding * d * 16;
            const rect = this._createRectPath(inset, 16 - inset * 2);
            result.push(...rect);
        }

        return result.length > 0 ? result : sequence;
    }

    /**
     * Create a rectangular path.
     */
    _createRectPath(inset, size) {
        const path = [];
        const steps = Math.floor(64 / 4);

        // Top edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + (size * i / steps), y: inset });
        }
        // Right edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + size, y: inset + (size * i / steps) });
        }
        // Bottom edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + size - (size * i / steps), y: inset + size });
        }
        // Left edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset, y: inset + size - (size * i / steps) });
        }

        return path;
    }

    /**
     * Apply arrow/direction pattern for returns.
     */
    _applyDirect(sequence, params) {
        const arrowSize = params.arrowSize || 0.4;
        const shaftWidth = params.shaftWidth || 0.15;

        const result = [];
        const centerX = 8;
        const centerY = 8;
        const arrowLength = arrowSize * 16;
        const shaftLen = (1 - arrowSize) * 16;

        // Shaft (vertical line through center)
        for (let i = 0; i < shaftLen; i++) {
            result.push({ x: centerX, y: 16 - i * 0.5 });
        }

        // Arrow head
        const headStart = 16 - shaftLen;
        for (let i = 0; i < arrowLength; i++) {
            // Left side of arrow
            result.push({
                x: centerX - i * 0.5,
                y: headStart - i * 0.5
            });
            // Right side of arrow
            result.push({
                x: centerX + i * 0.5,
                y: headStart - i * 0.5
            });
        }

        return result;
    }

    /**
     * Apply stabilization for data declarations.
     */
    _applyStabilize(sequence, params) {
        const aspectRatio = params.aspectRatio || 1.0;
        const cornerRadius = params.cornerRadius || 0.1;

        // Create stable rectangular shape
        const width = 12 * aspectRatio;
        const height = 12;
        const x = 8 - width / 2;
        const y = 8 - height / 2;

        return this._createRectPath(x, width > height ? height : width);
    }

    /**
     * Apply cross pattern for operators.
     */
    _applyCross(sequence, params) {
        const armLength = params.armLength || 0.4;
        const armWidth = params.armWidth || 0.15;

        const result = [];
        const len = armLength * 16;

        // Horizontal arm
        for (let i = -len; i <= len; i++) {
            result.push({ x: 8 + i, y: 8 });
        }

        // Vertical arm
        for (let i = -len; i <= len; i++) {
            result.push({ x: 8, y: 8 + i });
        }

        return result;
    }

    /**
     * Apply spiral pattern for literals.
     */
    _applySpiral(sequence, params) {
        const turns = params.turns || 3;
        const spacing = params.spacing || 0.1;

        const result = [];
        const totalAngle = turns * 2 * Math.PI;
        const steps = 256;

        for (let i = 0; i < steps; i++) {
            const t = i / steps;
            const angle = t * totalAngle;
            const radius = t * 6 + 1;

            result.push({
                x: 8 + Math.cos(angle) * radius,
                y: 8 + Math.sin(angle) * radius
            });
        }

        return result;
    }

    /**
     * Convert sequence to distance field.
     */
    _sequenceToDistanceField(sequence) {
        const df = new Float32Array(256);

        for (let y = 0; y < 16; y++) {
            for (let x = 0; x < 16; x++) {
                const idx = y * 16 + x;
                df[idx] = this._computeDistance(x, y, sequence);
            }
        }

        // Normalize to [0, 1] range
        const maxDist = Math.max(...df);
        if (maxDist > 0) {
            for (let i = 0; i < 256; i++) {
                df[i] = 1.0 - (df[i] / maxDist);
            }
        }

        return df;
    }

    /**
     * Compute distance from point to nearest curve point.
     */
    _computeDistance(px, py, sequence) {
        let minDist = Infinity;

        for (const point of sequence) {
            const dx = px - point.x;
            const dy = py - point.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < minDist) {
                minDist = dist;
            }
        }

        return minDist;
    }

    /**
     * Generate Hilbert LUT internally if PatternLibrary not available.
     */
    _generateHilbertLUT(order) {
        const size = Math.pow(2, order);
        const lut = [];

        for (let d = 0; d < size * size; d++) {
            lut.push(this._hilbertD2XY(size, d));
        }

        return lut;
    }

    _hilbertD2XY(n, d) {
        let x = 0, y = 0, s = 1, rx, ry, t = d;

        while (s < n) {
            rx = 1 & (t / 2);
            ry = 1 & (t ^ rx);
            [x, y] = this._rot(s, x, y, rx, ry);
            x += s * rx;
            y += s * ry;
            t = Math.floor(t / 4);
            s *= 2;
        }

        return { x, y, d };
    }

    _rot(n, x, y, rx, ry) {
        if (ry === 0) {
            if (rx === 1) {
                x = n - 1 - x;
                y = n - 1 - y;
            }
            return [y, x];
        }
        return [x, y];
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = HilbertGlyphSynthesizer;
}
