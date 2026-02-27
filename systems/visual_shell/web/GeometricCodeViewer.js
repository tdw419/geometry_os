/**
 * Geometry OS: GeometricCodeViewer
 *
 * Read-only code viewer with morphological glyphs.
 * - Syntax highlighting via geometric displacement
 * - Git diff visualization (additions/deletions)
 * - Line numbers in Hilbert gutter
 */

import { TerminalWindow } from './TerminalWindow.js';

export class GeometricCodeViewer extends TerminalWindow {
    constructor(app, options = {}) {
        // Create mock terminal for TerminalWindow
        const mockTerminal = {
            container: new PIXI.Container(),
            width: options.width || 800,
            height: options.height || 600
        };

        super(mockTerminal, {
            ...options,
            id: options.id || `code-${Date.now()}`
        });

        this.filePath = options.filePath || null;
        this.codeContent = '';
        this.lineCount = 0;
        this.diffData = null;
        this.lineGlyphs = [];
        this.scrollOffset = 0;
        this.visibleLines = 30;
        this.charWidth = 10;
        this.lineHeight = 18;

        // Syntax theme colors (geometric encoding)
        this.syntaxTheme = {
            keyword: 0x00FFFF,    // Cyan - geometric displacement
            string: 0xFFAA00,     // Orange - elongated curves
            comment: 0x666677,    // Dim gray - muted
            number: 0x00FF88,     // Green - Hilbert texture
            function: 0xFFFF00,   // Yellow - angular edges
            operator: 0xFF00FF,   // Magenta - vibration
            default: 0xCCCCCC      // Light gray - normal
        };

        // Diff colors
        this.diffTheme = {
            addition: 0x00FF00,  // Green glow
            deletion: 0xFF4444,  // Red vibration
            normal: 0xFFFFFF      // White
        };

        this._initCodeContent();
        this.setTitle('Code Viewer');

        if (options.filePath) {
            this.loadFile(options.filePath);
        }
    }

    _initCodeContent() {
        // Code container (below title bar)
        this.codeContainer = new PIXI.Container();
        this.codeContainer.y = 30;
        this.container.addChild(this.codeContainer);

        // Line number gutter
        this.gutter = new PIXI.Container();
        this.gutter.x = 5;
        this.codeContainer.addChild(this.gutter);

        // Code area
        this.codeArea = new PIXI.Container();
        this.codeArea.x = 50;
        this.codeContainer.addChild(this.codeArea);

        // Scrollbar
        this.scrollbar = new PIXI.Graphics();
        this.codeContainer.addChild(this.scrollbar);
        this._drawScrollbar();

        // Interaction for scroll
        this.codeContainer.eventMode = 'static';
        this.codeContainer.on('wheel', (e) => this._onScroll(e));
    }

    async loadFile(path) {
        this.filePath = path;

        try {
            const response = await fetch(path);
            if (!response.ok) throw new Error(`Failed to load: ${path}`);

            this.codeContent = await response.text();
            this.lineCount = this.codeContent.split('\n').length;

            this.setTitle(path.split('/').pop());
            this._renderCode();

            console.log(`[CodeViewer] Loaded ${this.lineCount} lines from ${path}`);

        } catch (e) {
            console.error('[CodeViewer] Load error:', e);
            this._showError(e.message);
        }
    }

    async loadGitDiff(path, baseRef = 'HEAD') {
        try {
            const response = await fetch(`/api/git/diff?path=${encodeURIComponent(path)}&base=${baseRef}`);

            if (!response.ok) {
                console.warn('[CodeViewer] Git diff unavailable');
                return;
            }

            this.diffData = await response.json();
            this._renderCode();

            console.log(`[CodeViewer] Git diff loaded for ${path}`);

        } catch (e) {
            console.warn('[CodeViewer] Git diff unavailable, showing plain code');
        }
    }

    _renderCode() {
        // Clear existing
        this.codeArea.removeChildren();
        this.gutter.removeChildren();
        this.lineGlyphs = [];

        const lines = this.codeContent.split('\n');
        const startLine = Math.max(0, this.scrollOffset);
        const endLine = Math.min(lines.length, startLine + this.visibleLines);

        for (let i = startLine; i < endLine; i++) {
            const line = lines[i];
            const y = (i - startLine) * this.lineHeight;

            // Line number
            this._renderLineNumber(i + 1, y);

            // Code line with syntax highlighting
            this._renderCodeLine(line, i, y);
        }

        this._drawScrollbar();
    }

    _renderLineNumber(num, y) {
        const text = new PIXI.Text(String(num).padStart(4, ' '), {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x444466
        });
        text.y = y;
        this.gutter.addChild(text);
    }

    _renderCodeLine(line, lineIndex, y) {
        // Check diff status
        let diffStatus = 'normal';
        if (this.diffData && this.diffData.diff) {
            if (this.diffData.diff.includes(`+${line}`)) {
                diffStatus = 'addition';
            } else if (this.diffData.diff.includes(`-${line}`)) {
                diffStatus = 'deletion';
            }
        }

        // Get syntax highlights
        const highlights = this._highlightSyntax(line, lineIndex);

        // Render with diff background if needed
        if (diffStatus !== 'normal') {
            const bg = new PIXI.Graphics();
            const bgColor = diffStatus === 'addition' ? 0x003300 : 0x330000;
            bg.beginFill(bgColor, 0.3);
            bg.drawRect(0, y - 2, 700, this.lineHeight);
            bg.endFill();
            this.codeArea.addChild(bg);
        }

        // Render text with syntax highlighting
        let xPos = 0;
        for (let i = 0; i < line.length; i++) {
            const char = line[i];
            const highlight = highlights.find(h => i >= h.start && i < h.end);

            let color;
            if (highlight) {
                color = this.syntaxTheme[highlight.type] || this.syntaxTheme.default;
            } else if (this.diffTheme[diffStatus] !== 0xFFFFFF) {
                color = this.diffTheme[diffStatus];
            } else {
                color = this.syntaxTheme.default;
            }

            const charText = new PIXI.Text(char, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: color
            });
            charText.x = xPos;
            charText.y = y;
            this.codeArea.addChild(charText);
            xPos += this.charWidth;
        }
    }

    _highlightSyntax(line, lineIndex) {
        const tokens = this._tokenize(line);
        return tokens.map(t => ({
            start: t.start,
            end: t.end,
            type: t.type
        }));
    }

    _tokenize(line) {
        const tokens = [];
        const patterns = [
            { regex: /\/\/.*/g, type: 'comment' },
            { regex: /#.*$/g, type: 'comment' },
            { regex: /"[^"]*"/g, type: 'string' },
            { regex: /'[^']*'/g, type: 'string' },
            { regex: /`[^`]*`/g, type: 'string' },
            { regex: /\b\d+\.?\d*\b/g, type: 'number' },
            { regex: /\b(const|let|var|function|class|if|else|for|while|return|import|export|async|await|from|def|new|try|catch|throw)\b/g, type: 'keyword' },
            { regex: /\b(print|console|log|document|window)\b/g, type: 'function' }
        ];

        for (const { regex, type } of patterns) {
            let match;
            regex.lastIndex = 0;

            while ((match = regex.exec(line)) !== null) {
                tokens.push({
                    value: match[0],
                    start: match.index,
                    end: match.index + match[0].length,
                    type
                });
            }
        }

        return tokens.sort((a, b) => a.start - b.start);
    }

    _onScroll(e) {
        const delta = Math.sign(e.deltaY);
        this.scrollOffset = Math.max(0, Math.min(
            this.lineCount - this.visibleLines,
            this.scrollOffset + delta
        ));
        this._renderCode();
    }

    _drawScrollbar() {
        this.scrollbar.clear();

        if (this.lineCount <= this.visibleLines) return;

        const trackHeight = this.height - 60;
        const thumbHeight = Math.max(20, (this.visibleLines / this.lineCount) * trackHeight);
        const thumbY = (this.scrollOffset / (this.lineCount - this.visibleLines)) * (trackHeight - thumbHeight);

        this.scrollbar.beginFill(0x333344);
        this.scrollbar.drawRoundedRect(this.width - 20, 30 + thumbY, 10, thumbHeight, 5);
        this.scrollbar.endFill();
    }

    _showError(message) {
        this.codeArea.removeChildren();

        const errorText = new PIXI.Text(`Error: ${message}`, {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0xFF4444
        });
        errorText.y = 50;
        this.codeArea.addChild(errorText);
    }

    getContent() {
        return this.codeContent;
    }

    getFilePath() {
        return this.filePath;
    }

    isModified() {
        return this.diffData !== null;
    }
}
