/**
 * Geometry OS: Morphological Diff Viewer
 *
 * Visualizes git diffs using morphological glyphs:
 * - Additions: Expanding Hilbert patterns (growth)
 * - Deletions: Contracting patterns (decay)
 * - Modifications: Transform patterns
 * - Context: Stable patterns
 */

class MorphologicalDiffViewer {
    constructor(options = {}) {
        this.container = options.container || document.body;
        this.fontSize = options.fontSize || 14;
        this.lineHeight = options.lineHeight || 20;

        // Morphological font system
        this.font = options.font || null;
        this.classifier = options.classifier || null;

        // Diff state
        this.diffData = null;
        this.selectedHunk = null;

        // Canvas for rendering
        this.canvas = null;
        this.ctx = null;

        // Glyph patterns for diff types
        this.glyphPatterns = {
            addition: {
                category: 'growth',
                color: '#44ff44',
                bgPattern: 'expanding-hilbert',
                transform: 'scale(1.1)'
            },
            deletion: {
                category: 'decay',
                color: '#ff4444',
                bgPattern: 'contracting-hilbert',
                transform: 'scale(0.9)'
            },
            modification: {
                category: 'transform',
                color: '#ffff44',
                bgPattern: 'morphing-hilbert',
                transform: 'rotate(5deg)'
            },
            context: {
                category: 'stable',
                color: '#888888',
                bgPattern: 'stable-hilbert',
                transform: 'none'
            },
            header: {
                category: 'meta',
                color: '#44ffff',
                bgPattern: 'info-hilbert',
                transform: 'none'
            }
        };

        console.log('[MorphologicalDiffViewer] Initialized');
    }

    /**
     * Initialize the viewer with a target container.
     */
    async init() {
        // Create canvas
        this.canvas = document.createElement('canvas');
        this.canvas.style.width = '100%';
        this.canvas.style.height = '100%';
        this.container.appendChild(this.canvas);

        this.ctx = this.canvas.getContext('2d');

        // Initialize morphological font if not provided
        if (!this.font && typeof MorphologicalFont !== 'undefined') {
            this.font = new MorphologicalFont({ size: this.fontSize });
            await this.font.init();
        }

        // Initialize classifier
        if (!this.classifier && typeof SemanticClassifier !== 'undefined') {
            this.classifier = new SemanticClassifier();
            if (typeof PatternLibrary !== 'undefined') {
                this.classifier.setPatternLibrary(PatternLibrary);
            }
        }

        this._resizeCanvas();
        window.addEventListener('resize', () => this._resizeCanvas());

        console.log('[MorphologicalDiffViewer] Ready');
    }

    /**
     * Resize canvas to match container.
     */
    _resizeCanvas() {
        const rect = this.container.getBoundingClientRect();
        const dpr = window.devicePixelRatio || 1;

        this.canvas.width = rect.width * dpr;
        this.canvas.height = rect.height * dpr;
        this.ctx.scale(dpr, dpr);

        if (this.diffData) {
            this.render();
        }
    }

    /**
     * Parse unified diff format.
     */
    parseDiff(diffText) {
        const lines = diffText.split('\n');
        const hunks = [];
        let currentHunk = null;
        let lineNumber = { old: 0, new: 0 };

        for (const line of lines) {
            // Hunk header
            if (line.startsWith('@@')) {
                if (currentHunk) {
                    hunks.push(currentHunk);
                }

                const match = line.match(/@@ -(\d+),?\d* \+(\d+),?\d* @@/);
                if (match) {
                    currentHunk = {
                        header: line,
                        oldStart: parseInt(match[1]),
                        newStart: parseInt(match[2]),
                        lines: [],
                        additions: 0,
                        deletions: 0
                    };
                    lineNumber.old = currentHunk.oldStart;
                    lineNumber.new = currentHunk.newStart;
                }
                continue;
            }

            if (!currentHunk) continue;

            // Diff line types
            let type = 'context';
            let content = line;

            if (line.startsWith('+')) {
                type = 'addition';
                content = line.substring(1);
                lineNumber.new++;
                currentHunk.additions++;
            } else if (line.startsWith('-')) {
                type = 'deletion';
                content = line.substring(1);
                lineNumber.old++;
                currentHunk.deletions++;
            } else if (line.startsWith('diff ') || line.startsWith('index ') ||
                       line.startsWith('---') || line.startsWith('+++')) {
                type = 'header';
                content = line;
            } else {
                content = line.substring(1);
                lineNumber.old++;
                lineNumber.new++;
            }

            currentHunk.lines.push({
                type,
                content,
                oldLine: type !== 'addition' ? lineNumber.old : null,
                newLine: type !== 'deletion' ? lineNumber.new : null,
                raw: line
            });
        }

        if (currentHunk) {
            hunks.push(currentHunk);
        }

        this.diffData = {
            raw: diffText,
            hunks,
            stats: {
                additions: hunks.reduce((sum, h) => sum + h.additions, 0),
                deletions: hunks.reduce((sum, h) => sum + h.deletions, 0),
                hunks: hunks.length
            }
        };

        return this.diffData;
    }

    /**
     * Render the diff with morphological glyphs.
     */
    render() {
        if (!this.diffData) return;

        const ctx = this.ctx;
        const width = this.canvas.width / (window.devicePixelRatio || 1);
        const height = this.canvas.height / (window.devicePixelRatio || 1);

        // Clear
        ctx.fillStyle = '#0a0a0a';
        ctx.fillRect(0, 0, width, height);

        // Layout
        const gutterWidth = 50;
        const codeStartX = gutterWidth * 2 + 10;
        let y = 20;

        // Render stats header
        this._renderStats(ctx, 10, y);
        y += 40;

        // Render hunks
        for (let hunkIndex = 0; hunkIndex < this.diffData.hunks.length; hunkIndex++) {
            const hunk = this.diffData.hunks[hunkIndex];

            // Hunk header
            ctx.fillStyle = '#252535';
            ctx.fillRect(0, y - 2, width, this.lineHeight);
            ctx.fillStyle = '#44ffff';
            ctx.font = '12px Courier New';
            ctx.fillText(hunk.header, codeStartX, y + 12);
            y += this.lineHeight + 5;

            // Render lines
            for (const line of hunk.lines) {
                if (y > height - 20) break; // Stop if past viewport

                this._renderLine(ctx, line, 0, y, gutterWidth, codeStartX, width);
                y += this.lineHeight;
            }

            y += 10; // Space between hunks
        }
    }

    /**
     * Render stats header with morphological summary.
     */
    _renderStats(ctx, x, y) {
        const stats = this.diffData.stats;

        // Draw summary glyphs
        const glyphSize = 20;

        // Additions glyph
        ctx.fillStyle = '#44ff44';
        this._drawMorphologicalGlyph(ctx, x, y, glyphSize, 'addition', stats.additions);
        ctx.font = '11px Courier New';
        ctx.fillText(`+${stats.additions}`, x + glyphSize + 5, y + 14);

        // Deletions glyph
        ctx.fillStyle = '#ff4444';
        this._drawMorphologicalGlyph(ctx, x + 80, y, glyphSize, 'deletion', stats.deletions);
        ctx.fillText(`-${stats.deletions}`, x + 80 + glyphSize + 5, y + 14);

        // Hunks count
        ctx.fillStyle = '#888';
        ctx.fillText(`${stats.hunks} hunks`, x + 160, y + 14);

        // Visual diff indicator
        this._drawDiffIndicator(ctx, x + 250, y, 100, glyphSize, stats);
    }

    /**
     * Draw morphological glyph for diff type.
     */
    _drawMorphologicalGlyph(ctx, x, y, size, type, count) {
        const pattern = this.glyphPatterns[type];
        if (!pattern) return;

        const intensity = Math.min(1, count / 50);

        switch (type) {
            case 'addition':
                // Expanding concentric squares (growth pattern)
                this._drawExpandingPattern(ctx, x, y, size, intensity, '#44ff44');
                break;

            case 'deletion':
                // Contracting pattern (decay)
                this._drawContractingPattern(ctx, x, y, size, intensity, '#ff4444');
                break;

            case 'modification':
                // Morphing pattern
                this._drawMorphingPattern(ctx, x, y, size, intensity, '#ffff44');
                break;

            default:
                // Stable pattern
                this._drawStablePattern(ctx, x, y, size, '#888');
        }
    }

    /**
     * Draw expanding Hilbert pattern (for additions).
     */
    _drawExpandingPattern(ctx, x, y, size, intensity, color) {
        ctx.strokeStyle = color;
        ctx.lineWidth = 1;

        const levels = Math.floor(intensity * 4) + 1;

        for (let i = 0; i < levels; i++) {
            const scale = 0.3 + (i * 0.2);
            const s = size * scale;
            const offset = (size - s) / 2;

            ctx.globalAlpha = 1 - (i * 0.2);
            ctx.strokeRect(x + offset, y + offset, s, s);

            // Inner expanding squares
            if (i < levels - 1) {
                ctx.beginPath();
                ctx.moveTo(x + offset, y + offset + s/2);
                ctx.lineTo(x + offset + s/2, y + offset);
                ctx.lineTo(x + offset + s, y + offset + s/2);
                ctx.lineTo(x + offset + s/2, y + offset + s);
                ctx.closePath();
                ctx.stroke();
            }
        }

        ctx.globalAlpha = 1;
    }

    /**
     * Draw contracting pattern (for deletions).
     */
    _drawContractingPattern(ctx, x, y, size, intensity, color) {
        ctx.strokeStyle = color;
        ctx.lineWidth = 1;

        const levels = Math.floor(intensity * 4) + 1;

        for (let i = levels - 1; i >= 0; i--) {
            const scale = 0.3 + (i * 0.2);
            const s = size * scale;
            const offset = (size - s) / 2;

            ctx.globalAlpha = 0.3 + (i * 0.2);
            ctx.strokeRect(x + offset, y + offset, s, s);

            // X marks for deletion
            if (i === 0) {
                ctx.beginPath();
                ctx.moveTo(x + offset, y + offset);
                ctx.lineTo(x + offset + s, y + offset + s);
                ctx.moveTo(x + offset + s, y + offset);
                ctx.lineTo(x + offset, y + offset + s);
                ctx.stroke();
            }
        }

        ctx.globalAlpha = 1;
    }

    /**
     * Draw morphing pattern (for modifications).
     */
    _drawMorphingPattern(ctx, x, y, size, intensity, color) {
        ctx.strokeStyle = color;
        ctx.lineWidth = 1.5;
        ctx.globalAlpha = 0.5 + intensity * 0.5;

        // Diamond morphing to square
        const cx = x + size / 2;
        const cy = y + size / 2;
        const r = size * 0.4;

        ctx.beginPath();
        for (let i = 0; i <= 4; i++) {
            const angle = (i / 4) * Math.PI * 2 - Math.PI / 4;
            const px = cx + Math.cos(angle) * r;
            const py = cy + Math.sin(angle) * r;

            if (i === 0) ctx.moveTo(px, py);
            else ctx.lineTo(px, py);
        }
        ctx.stroke();

        // Inner rotating element
        ctx.save();
        ctx.translate(cx, cy);
        ctx.rotate(intensity * Math.PI / 8);
        ctx.strokeRect(-r * 0.4, -r * 0.4, r * 0.8, r * 0.8);
        ctx.restore();

        ctx.globalAlpha = 1;
    }

    /**
     * Draw stable pattern (for context).
     */
    _drawStablePattern(ctx, x, y, size, color) {
        ctx.strokeStyle = color;
        ctx.lineWidth = 1;
        ctx.globalAlpha = 0.5;

        ctx.strokeRect(x + 4, y + 4, size - 8, size - 8);

        ctx.globalAlpha = 1;
    }

    /**
     * Draw visual diff indicator bar.
     */
    _drawDiffIndicator(ctx, x, y, width, height, stats) {
        const total = stats.additions + stats.deletions;
        if (total === 0) return;

        const addRatio = stats.additions / total;

        // Background
        ctx.fillStyle = '#1a1a1a';
        ctx.fillRect(x, y, width, height);

        // Additions bar
        ctx.fillStyle = '#44ff44';
        ctx.fillRect(x, y, width * addRatio, height);

        // Deletions bar
        ctx.fillStyle = '#ff4444';
        ctx.fillRect(x + width * addRatio, y, width * (1 - addRatio), height);

        // Border
        ctx.strokeStyle = '#333';
        ctx.strokeRect(x, y, width, height);
    }

    /**
     * Render a single diff line.
     */
    _renderLine(ctx, line, x, y, gutterWidth, codeStartX, totalWidth) {
        const pattern = this.glyphPatterns[line.type] || this.glyphPatterns.context;

        // Background
        ctx.fillStyle = this._getLineBackground(line.type);
        ctx.fillRect(0, y, totalWidth, this.lineHeight);

        // Left gutter (old line number)
        ctx.fillStyle = '#444';
        ctx.font = '10px Courier New';
        if (line.oldLine !== null) {
            ctx.textAlign = 'right';
            ctx.fillText(line.oldLine.toString(), gutterWidth - 5, y + 14);
        }

        // Right gutter (new line number)
        if (line.newLine !== null) {
            ctx.fillText(line.newLine.toString(), gutterWidth * 2 - 5, y + 14);
        }

        // Diff type indicator
        ctx.fillStyle = pattern.color;
        ctx.fillRect(gutterWidth * 2, y, 3, this.lineHeight);

        // Line content with morphological rendering
        ctx.textAlign = 'left';
        this._renderMorphologicalText(ctx, line.content, codeStartX, y + 14, line.type);

        // Mini glyph at end of line
        const textWidth = ctx.measureText(line.content).width;
        if (line.type !== 'context' && line.type !== 'header') {
            this._drawMorphologicalGlyph(
                ctx,
                codeStartX + textWidth + 10,
                y,
                12,
                line.type,
                1
            );
        }
    }

    /**
     * Get background color for line type.
     */
    _getLineBackground(type) {
        const backgrounds = {
            addition: 'rgba(0, 68, 0, 0.3)',
            deletion: 'rgba(68, 0, 0, 0.3)',
            modification: 'rgba(68, 68, 0, 0.3)',
            header: '#1a1a2e',
            context: 'transparent'
        };
        return backgrounds[type] || 'transparent';
    }

    /**
     * Render text with morphological enhancements.
     */
    _renderMorphologicalText(ctx, text, x, y, diffType) {
        const pattern = this.glyphPatterns[diffType];

        // Tokenize for semantic coloring
        const tokens = this._tokenize(text);

        let currentX = x;
        for (const token of tokens) {
            // Get semantic classification
            let category = 'default';
            if (this.classifier) {
                const result = this.classifier.classify(token);
                category = result.category;
            }

            // Get color based on both diff type and semantic category
            ctx.fillStyle = this._getMorphologicalColor(diffType, category);

            ctx.fillText(token, currentX, y);
            currentX += ctx.measureText(token).width;
        }
    }

    /**
     * Tokenize text for rendering.
     */
    _tokenize(text) {
        const tokens = [];
        const regex = /(\s+|[{}()\[\];,.]|[a-zA-Z_][a-zA-Z0-9_]*|\d+\.?\d*|"[^"]*"|'[^']*'|[+\-*/=<>!&|]+)/g;
        let match;

        while ((match = regex.exec(text)) !== null) {
            tokens.push(match[0]);
        }

        return tokens.length > 0 ? tokens : [text];
    }

    /**
     * Get morphological color combining diff type and semantic category.
     */
    _getMorphologicalColor(diffType, semanticCategory) {
        const diffColor = this.glyphPatterns[diffType]?.color || '#888';

        // Blend with semantic color
        const semanticColors = {
            control: '#44ffff',
            function: '#ff44ff',
            return: '#ffff44',
            data: '#44ff44',
            operator: '#ff8844',
            literal: '#8888ff',
            default: '#ccc'
        };

        const semanticColor = semanticColors[semanticCategory] || semanticColors.default;

        // For additions/deletions, prioritize diff color
        if (diffType === 'addition' || diffType === 'deletion') {
            return diffColor;
        }

        // For context, use semantic coloring
        return semanticColor;
    }

    /**
     * Get diff statistics.
     */
    getStats() {
        if (!this.diffData) return null;
        return this.diffData.stats;
    }

    /**
     * Export diff as image.
     */
    exportAsImage(format = 'png') {
        if (!this.canvas) return null;
        return this.canvas.toDataURL(`image/${format}`);
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MorphologicalDiffViewer;
}
