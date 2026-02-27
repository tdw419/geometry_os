/**
 * Geometry OS: GeometricCodeEditor
 *
 * Full code editor extending GeometricCodeViewer.
 * - Text editing with cursor management
 * - Selection handling (shift+arrow, click, drag)
 * - Clipboard operations (Ctrl+C/V/X)
 * - Undo/Redo with geometric timestamps
 * - Auto-save with debounced writes
 * - Git integration (stage/unstage, commit)
 * - Code folding (geometric collapse)
 * - Syntax tree visualization
 * - Git diff with morphological glyphs
 *
 * Architecture:
 * [Keyboard Input]
 *        ↓
 * [GeometricCodeEditor]
 *        ↓ ANSI Parse
 * [Morphological Shader]
 *        ↓ SDF Render
 * [Neural Cell Grid]
 */

import { GeometricCodeViewer } from './GeometricCodeViewer.js';

export class GeometricCodeEditor extends GeometricCodeViewer {
    constructor(app, options = {}) {
        super(app, options);

        // Editor state
        this.editable = options.editable !== false;
        this.cursorVisible = true;
        this.cursorBlinkInterval = null;

        // Selection state
        this.selectionStart = null;
        this.selectionEnd = null;
        this.selectionActive = false;

        // Edit history (undo/redo)
        this.editHistory = [];
        this.historyIndex = -1;
        this.maxHistorySize = 100;

        // Auto-save
        this.autoSaveEnabled = options.autoSaveEnabled !== false;
        this.autoSaveDelay = options.autoSaveDelay || 2000;
        this.autoSaveTimeout = null;
        this.hasUnsavedChanges = false;

        // Clipboard
        this.clipboard = '';

        // Code folding state
        this.foldedRegions = new Map(); // startLine -> { endLine, collapsed }
        this.foldMarkers = []; // Detected fold regions
        this.foldGutter = null;

        // Syntax tree state
        this.syntaxTree = null;
        this.syntaxHighlights = new Map(); // line -> syntax nodes
        this.showSyntaxTree = options.showSyntaxTree || false;

        // Git diff state
        this.gitDiff = null;
        this.diffHunks = [];
        this.showDiff = options.showDiff || false;
        this.diffGraphics = null;

        // Initialize editor components
        this._initEditor();
    }

    /**
     * Initialize editor-specific components.
     */
    _initEditor() {
        // Create main cursor
        this.cursor = new PIXI.Graphics();
        this.cursor.lineStyle(2, 0x00ff88);
        this.cursor.moveTo(0, 0);
        this.cursor.lineTo(0, this.lineHeight);
        this.codeArea.addChild(this.cursor);
        this._startCursorBlink();

        // Selection highlight layer (behind text)
        this.selectionGraphics = new PIXI.Graphics();
        this.codeArea.addChildAt(this.selectionGraphics, 0);

        // Setup keyboard events
        if (this.editable) {
            this.container.eventMode = 'static';
            this.container.on('keydown', (e) => this._handleKeyDown(e));

            // Make container focusable
            this.container.interactive = true;
            this.container.on('pointerdown', () => this._focus());
        }

        console.log('[CodeEditor] Initialized with editing capabilities');
    }

    /**
     * Start cursor blink animation.
     */
    _startCursorBlink() {
        this.cursorBlinkInterval = setInterval(() => {
            this.cursorVisible = !this.cursorVisible;
            this.cursor.alpha = this.cursorVisible ? 1.0 : 0.3;
        }, 530);
    }

    /**
     * Focus the editor for keyboard input.
     */
    _focus() {
        // Request keyboard focus
        if (this.container.getCanvas) && this.container.getCanvas().focus) {
            this.container.getCanvas().focus();
        }
    }

    /**
     * Handle keyboard input.
     */
    _handleKeyDown(e) {
        const key = e.key;

        // Handle keyboard shortcuts
        if (e.ctrlKey || e.metaKey) {
            switch (key.toLowerCase()) {
                case 'c':
                    e.preventDefault();
                    this.copy();
                    break;
                case 'v':
                    e.preventDefault();
                    this.paste();
                    break;
                case 'x':
                    e.preventDefault();
                    this.cut();
                    break;
                case 'z':
                    e.preventDefault();
                    this.undo();
                    break;
                case 'y':
                    e.preventDefault();
                    this.redo();
                    break;
                case 's':
                    e.preventDefault();
                    this.save();
                    break;
                case 'a':
                    e.preventDefault();
                    this.selectAll();
                    break;
            }
            return;
        }

        // Navigation
        switch (key) {
            case 'ArrowLeft':
                e.preventDefault();
                this.moveCursor(e.shiftKey ? 'selectLeft' : 'left');
                break;
            case 'ArrowRight':
                e.preventDefault();
                this.moveCursor(e.shiftKey ? 'selectRight' : 'right');
                break;
            case 'ArrowUp':
                e.preventDefault();
                this.moveCursor(e.shiftKey ? 'selectUp' : 'up');
                break;
            case 'ArrowDown':
                e.preventDefault();
                this.moveCursor(e.shiftKey ? 'selectDown' : 'down');
                break;
            case 'Home':
                e.preventDefault();
                this.moveCursor('home');
                break;
            case 'End':
                e.preventDefault();
                this.moveCursor('end');
                break;
            case 'PageUp':
                e.preventDefault();
                this.scrollOffset = Math.max(0, this.scrollOffset - this.visibleLines / 2);
                this._renderCode();
                break;
            case 'PageDown':
                e.preventDefault();
                this.scrollOffset = Math.min(
                    this.lineCount - this.visibleLines,
                    this.scrollOffset + this.visibleLines / 2
                );
                this._renderCode();
                break;
        }

        // Text input
        if (key === 'Enter') {
            e.preventDefault();
            this.insertCharacter('\n');
        } else if (key === 'Backspace') {
            e.preventDefault();
            this.deleteCharacter('backspace');
        } else if (key === 'Delete') {
            e.preventDefault();
            this.deleteCharacter('delete');
        } else if (key === 'Tab') {
            e.preventDefault();
            this.insertCharacter('    '); // 4 spaces
        } else if (key.length === 1) {
            e.preventDefault();
            this.insertCharacter(key);
        }
    }

    /**
     * Move cursor in specified direction.
     */
    moveCursor(direction) {
        const lines = this.codeContent.split('\n');
        const currentLine = lines[this.cursorY] || '';

        switch (direction) {
            case 'left':
            if (this.cursorX > 0) {
                this.cursorX--;
            } else if (this.cursorY > 0) {
                this.cursorY--;
                this.cursorX = (lines[this.cursorY] || '').length;
            }
            break;
            case 'right':
                if (this.cursorX < currentLine.length) {
                    this.cursorX++;
                } else if (this.cursorY < lines.length - 1) {
                this.cursorY++;
                this.cursorX = 0;
            }
            break;
            case 'up':
                if (this.cursorY > 0) {
                    this.cursorY--;
                    this.cursorX = Math.min(this.cursorX, (lines[this.cursorY] || '').length);
                }
                break;
            case 'down':
                if (this.cursorY < lines.length - 1) {
                    this.cursorY++;
                    this.cursorX = Math.min(this.cursorX, (lines[this.cursorY] || '').length);
                }
                break;
            case 'home':
                this.cursorX = 0;
                break;
            case 'end':
                this.cursorX = currentLine.length;
                break;
            case 'selectLeft':
                this._extendSelection();
                this.moveCursor('left');
                break;
            case 'selectRight':
                this._extendSelection();
                this.moveCursor('right');
                break;
            case 'selectUp':
                this._extendSelection();
                this.moveCursor('up');
                break;
            case 'selectDown':
                this._extendSelection();
                this.moveCursor('down');
                break;
        }

        // Handle scroll
        if (this.cursorY < this.scrollOffset) {
            this.scrollOffset = this.cursorY;
        } else if (this.cursorY >= this.scrollOffset + this.visibleLines) {
            this.scrollOffset = this.cursorY - this.visibleLines + 1;
        }

        this._updateCursorPosition();
    }

    /**
     * Extend selection from current position.
     */
    _extendSelection() {
        if (!this.selectionActive) {
            this.selectionActive = true;
            this.selectionStart = { x: this.cursorX, y: this.cursorY };
        }
        this.selectionEnd = { x: this.cursorX, y: this.cursorY };
    }

    /**
     * Insert character at cursor position.
     */
    insertCharacter(char) {
        // Save to history
        this._saveToHistory();

        const lines = this.codeContent.split('\n');
        const currentLine = lines[this.cursorY] || '';

        if (char === '\n') {
            // Split line
            const beforeCursor = currentLine.substring(0, this.cursorX);
            const afterCursor = currentLine.substring(this.cursorX);
            lines[this.cursorY] = beforeCursor;
            lines.splice(this.cursorY + 1, 0, afterCursor);
            this.cursorY++;
            this.cursorX = 0;
        } else {
            // Insert in current line
            lines[this.cursorY] =
                currentLine.substring(0, this.cursorX) +
                char +
                currentLine.substring(this.cursorX);
            this.cursorX += char.length;
        }

        this.codeContent = lines.join('\n');
        this.lineCount = lines.length;

        // Clear selection
        this._clearSelection();

        // Re-render
        this._renderCode();
        this._updateCursorPosition();

        // Mark unsaved
        this.hasUnsavedChanges = true;
        this._scheduleAutoSave();
    }

    /**
     * Delete character at cursor position.
     */
    deleteCharacter(mode) {
        // Save to history
        this._saveToHistory();

        const lines = this.codeContent.split('\n');
        const currentLine = lines[this.cursorY] || '';

        if (mode === 'backspace') {
            if (this.cursorX > 0) {
                // Delete character before cursor
                lines[this.cursorY] =
                    currentLine.substring(0, this.cursorX - 1) +
                    currentLine.substring(this.cursorX);
                this.cursorX--;
            } else if (this.cursorY > 0) {
                // Merge with previous line
                const prevLine = lines[this.cursorY - 1];
                this.cursorX = prevLine.length;
                lines[this.cursorY - 1] = prevLine + currentLine;
                lines.splice(this.cursorY, 1);
                this.cursorY--;
            }
        } else if (mode === 'delete') {
            if (this.cursorX < currentLine.length) {
                // Delete character after cursor
                lines[this.cursorY] =
                    currentLine.substring(0, this.cursorX) +
                    currentLine.substring(this.cursorX + 1);
            } else if (this.cursorY < lines.length - 1) {
                // Merge with next line
                const nextLine = lines[this.cursorY + 1];
                lines[this.cursorY] = currentLine + nextLine;
                lines.splice(this.cursorY + 1, 1);
            }
        }

        this.codeContent = lines.join('\n');
        this.lineCount = lines.length;

        // Re-render
        this._renderCode();
        this._updateCursorPosition();

        // Mark unsaved
        this.hasUnsavedChanges = true;
        this._scheduleAutoSave();
    }

    /**
     * Copy selected text to clipboard.
     */
    copy() {
        const selectedText = this.getSelectedText();
        if (selectedText) {
            this.clipboard = selectedText;
            navigator.clipboard.writeText(selectedText).catch(() => {});
            console.log('[CodeEditor] Copied to clipboard');
        }
    }

    /**
     * Cut selected text to clipboard.
     */
    cut() {
        this.copy();
        if (this.selectionActive) {
            this._deleteSelection();
        }
    }

    /**
     * Paste clipboard content at cursor.
     */
    async paste() {
        try {
            let text = this.clipboard;
            if (navigator.clipboard && navigator.clipboard.readText) {
                text = await navigator.clipboard.readText();
            }

            if (text) {
                this._saveToHistory();
                this._deleteSelection(); // Delete selection if any

                const lines = this.codeContent.split('\n');
                const currentLine = lines[this.cursorY] || '';

                lines[this.cursorY] =
                    currentLine.substring(0, this.cursorX) +
                    text +
                    currentLine.substring(this.cursorX);

                this.codeContent = lines.join('\n');
                this.lineCount = lines.length;

                // Move cursor past inserted text
                const textLines = text.split('\n');
                if (textLines.length > 1) {
                    this.cursorY += textLines.length - 1;
                    this.cursorX = textLines[textLines.length - 1].length;
                } else {
                    this.cursorX += text.length;
                }

                this._renderCode();
                this._updateCursorPosition();

                this.hasUnsavedChanges = true;
                this._scheduleAutoSave();
            }
        } catch (e) {
            console.error('[CodeEditor] Paste failed:', e);
        }
    }

    /**
     * Get currently selected text.
     */
    getSelectedText() {
        if (!this.selectionActive || !this.selectionStart || !this.selectionEnd) {
            return null;
        }

        const lines = this.codeContent.split('\n');
        const start = this._normalizeSelection(this.selectionStart, this.selectionEnd).start;
        const end = this._normalizeSelection(this.selectionStart, this.selectionEnd).end;

        if (start.y === end.y) {
            return lines[start.y].substring(start.x, end.x);
        }

        // Multi-line selection
        let text = lines[start.y].substring(start.x) + '\n';
        for (let y = start.y + 1; y < end.y; y++) {
            text += lines[y] + '\n';
        }
        text += lines[end.y].substring(0, end.x);

        return text;
    }

    /**
     * Delete current selection.
     */
    _deleteSelection() {
        if (!this.selectionActive) return;

        this._saveToHistory();

        const lines = this.codeContent.split('\n');
        const { start, end } = this._normalizeSelection(this.selectionStart, this.selectionEnd);

        if (start.y === end.y) {
            lines[start.y] =
                lines[start.y].substring(0, start.x) +
                lines[start.y].substring(end.x);
        } else {
            lines[start.y] =
                lines[start.y].substring(0, start.x) +
                lines[end.y].substring(end.x);
            lines.splice(start.y + 1, end.y - start.y);
        }

        this.codeContent = lines.join('\n');
        this.lineCount = lines.length;

        this.cursorX = start.x;
        this.cursorY = start.y;
        this._clearSelection();

        this._renderCode();
        this._updateCursorPosition();

        this.hasUnsavedChanges = true;
    }

    /**
     * Normalize selection (ensure start <= end).
     */
    _normalizeSelection(start, end) {
        if (start.y < end.y || (start.y === end.y && start.x <= end.x)) {
            return { start, end };
        }
        return { start: end, end: start };
    }

    /**
     * Clear selection state.
     */
    _clearSelection() {
        this.selectionActive = false;
        this.selectionStart = null;
        this.selectionEnd = null;
        this.selectionGraphics.clear();
    }

    /**
     * Select all text.
     */
    selectAll() {
        this.selectionActive = true;
        this.selectionStart = { x: 0, y: 0 };
        this.selectionEnd = { x: (this.codeContent.split('\n')[this.lineCount - 1] || '').length, y: this.lineCount - 1 };
        this._renderCode();
    }

    /**
     * Save to undo history.
     */
    _saveToHistory() {
        // Remove any redo states
        if (this.historyIndex < this.editHistory.length - 1) {
            this.editHistory = this.editHistory.slice(0, this.historyIndex + 1);
        }

        // Add current state
        this.editHistory.push({
            content: this.codeContent,
            cursorX: this.cursorX,
            cursorY: this.cursorY,
            timestamp: Date.now()
        });

        // Limit history size
        if (this.editHistory.length > this.maxHistorySize) {
            this.editHistory.shift();
        }

        this.historyIndex = this.editHistory.length - 1;
    }

    /**
     * Undo last edit.
     */
    undo() {
        if (this.historyIndex > 0) {
            this.historyIndex--;
            const state = this.editHistory[this.historyIndex];
            this.codeContent = state.content;
            this.cursorX = state.cursorX;
            this.cursorY = state.cursorY;
            this.lineCount = this.codeContent.split('\n').length;
            this._renderCode();
            this._updateCursorPosition();
            console.log('[CodeEditor] Undo');
        }
    }

    /**
     * Redo previously undone edit.
     */
    redo() {
        if (this.historyIndex < this.editHistory.length - 1) {
            this.historyIndex++;
            const state = this.editHistory[this.historyIndex];
            this.codeContent = state.content;
            this.cursorX = state.cursorX;
            this.cursorY = state.cursorY;
            this.lineCount = this.codeContent.split('\n').length;
            this._renderCode();
            this._updateCursorPosition();
            console.log('[CodeEditor] Redo');
        }
    }

    /**
     * Schedule auto-save.
     */
    _scheduleAutoSave() {
        if (!this.autoSaveEnabled) return;

        if (this.autoSaveTimeout) {
            clearTimeout(this.autoSaveTimeout);
        }

        this.autoSaveTimeout = setTimeout(() => {
            if (this.hasUnsavedChanges && this.filePath) {
                this.save();
            }
        }, this.autoSaveDelay);
    }

    /**
     * Save file to backend.
     */
    async save() {
        if (!this.filePath) {
            console.warn('[CodeEditor] No file path set');
            return false;
        }

        try {
            const response = await fetch('/api/file/save', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    path: this.filePath,
                    content: this.codeContent
                })
            });

            const result = await response.json();

            if (result.success) {
                this.hasUnsavedChanges = false;
                console.log(`[CodeEditor] Saved: ${this.filePath}`);
                this.setTitle(this.filePath.split('/').pop() + ' (saved)');
                return true;
            } else {
                console.error('[CodeEditor] Save failed:', result.error);
                return false;
            }
        } catch (e) {
            console.error('[CodeEditor] Save error:', e);
            return false;
        }
    }

    /**
     * Update cursor position in render.
     */
    _updateCursorPosition() {
        const x = this.cursorX * this.charWidth;
        const y = (this.cursorY - this.scrollOffset) * this.lineHeight;

        this.cursor.clear();
        this.cursor.lineStyle(2, 0x00ff88);
        this.cursor.moveTo(x, y);
        this.cursor.lineTo(x, y + this.lineHeight);

        // Draw selection highlight
        if (this.selectionActive && this.selectionStart && this.selectionEnd) {
            this._drawSelection();
        }
    }

    /**
     * Draw selection highlight.
     */
    _drawSelection() {
        this.selectionGraphics.clear();

        if (!this.selectionStart || !this.selectionEnd) return;

        const { start, end } = this._normalizeSelection(this.selectionStart, this.selectionEnd);
        const lines = this.codeContent.split('\n');

        this.selectionGraphics.beginFill(0x00ff88, 0.2);

        if (start.y === end.y) {
            // Single line selection
            const x = start.x * this.charWidth;
            const width = (end.x - start.x) * this.charWidth;
            const y = (start.y - this.scrollOffset) * this.lineHeight;
            this.selectionGraphics.drawRect(x, y - 2, width, this.lineHeight);
        } else {
            // Multi-line selection
            // First line
            const firstX = start.x * this.charWidth;
            const firstWidth = (lines[start.y].length - start.x) * this.charWidth;
            const firstY = (start.y - this.scrollOffset) * this.lineHeight;
            this.selectionGraphics.drawRect(firstX, firstY - 2, firstWidth, this.lineHeight);

            // Middle lines
            for (let y = start.y + 1; y < end.y; y++) {
                const lineY = (y - this.scrollOffset) * this.lineHeight;
                this.selectionGraphics.drawRect(0, lineY - 2, lines[y].length * this.charWidth, this.lineHeight);
            }

            // Last line
            const lastX = 0;
            const lastWidth = end.x * this.charWidth;
            const lastY = (end.y - this.scrollOffset) * this.lineHeight;
            this.selectionGraphics.drawRect(lastX, lastY - 2, lastWidth, this.lineHeight);
        }

        this.selectionGraphics.endFill();
    }

    /**
     * Override _renderCode to include cursor position.
     */
    _renderCode() {
        // Clear existing
        this.codeArea.removeChildren();
        this.gutter.removeChildren();

        // Re-add selection graphics and cursor
        this.codeArea.addChild(this.selectionGraphics);
        this.codeArea.addChild(this.cursor);

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
        this._updateCursorPosition();
    }

    /**
     * Check if editor has unsaved changes.
     */
    isDirty() {
        return this.hasUnsavedChanges;
    }

    /**
     * Destroy editor.
     */
    destroy() {
        if (this.cursorBlinkInterval) {
            clearInterval(this.cursorBlinkInterval);
        }
        if (this.autoSaveTimeout) {
            clearTimeout(this.autoSaveTimeout);
        }
        super.destroy?.();
    }

    // ========================================
    // CODE FOLDING (Geometric Collapse)
    // ========================================

    /**
     * Initialize code folding.
     */
    _initCodeFolding() {
        // Create fold gutter
        this.foldGutter = new PIXI.Container();
        this.foldGutter.x = -20; // Left of line numbers
        this.container.addChild(this.foldGutter);

        // Detect foldable regions
        this._detectFoldRegions();
    }

    /**
     * Detect foldable regions based on indentation.
     */
    _detectFoldRegions() {
        this.foldMarkers = [];
        const lines = this.codeContent.split('\n');
        const stack = [];

        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const indent = line.search(/\S|$/);

            // Check for foldable start (function, class, if, etc.)
            const foldStart = /^\s*(def |class |if |for |while |with |try |async def )/;
            if (foldStart.test(line) && !line.trim().endsWith(':') === false) {
                stack.push({ start: i, indent, end: null });
            }

            // Check for end of foldable region
            while (stack.length > 0 && indent < stack[stack.length - 1].indent) {
                const region = stack.pop();
                region.end = i - 1;
                if (region.end > region.start) {
                    this.foldMarkers.push(region);
                }
            }
        }

        // Close remaining regions
        while (stack.length > 0) {
            const region = stack.pop();
            region.end = lines.length - 1;
            if (region.end > region.start) {
                this.foldMarkers.push(region);
            }
        }
    }

    /**
     * Toggle fold at line.
     */
    toggleFold(line) {
        // Find fold region containing this line
        const region = this.foldMarkers.find(r => r.start === line);
        if (!region) return;

        if (this.foldedRegions.has(region.start)) {
            this._unfoldRegion(region);
        } else {
            this._foldRegion(region);
        }
    }

    /**
     * Fold a code region (geometric collapse).
     */
    _foldRegion(region) {
        this.foldedRegions.set(region.start, {
            endLine: region.end,
            collapsed: true,
            previewText: this._getFoldPreview(region)
        });

        // Visual feedback - collapsed region becomes a geometric glyph
        this._renderFoldGlyph(region);
        this._renderCode();

        console.log(`[CodeEditor] Folded lines ${region.start}-${region.end}`);
    }

    /**
     * Unfold a code region.
     */
    _unfoldRegion(region) {
        this.foldedRegions.delete(region.start);
        this._renderCode();

        console.log(`[CodeEditor] Unfolded lines ${region.start}-${region.end}`);
    }

    /**
     * Get preview text for folded region.
     */
    _getFoldPreview(region) {
        const lines = this.codeContent.split('\n');
        const startLine = lines[region.start] || '';
        // Return first line with ellipsis glyph
        return startLine.trim() + ' ⋯';
    }

    /**
     * Render fold glyph as geometric shape.
     */
    _renderFoldGlyph(region) {
        // Create collapsed region visual
        const glyph = new PIXI.Graphics();
        glyph.beginFill(0x1a1a2e, 0.9);
        glyph.drawRoundedRect(0, 0, this.width - 60, this.lineHeight, 4);
        glyph.endFill();

        // Fold indicator (triangular collapse symbol)
        glyph.beginFill(0x00ff88, 0.6);
        glyph.moveTo(5, 4);
        glyph.lineTo(15, 4);
        glyph.lineTo(10, 12);
        glyph.lineTo(5, 4);
        glyph.endFill();

        // Preview text
        const preview = new PIXI.Text(this._getFoldPreview(region), {
            fontFamily: 'Courier New',
            fontSize: this.fontSize,
            fill: 0x888888
        });
        preview.x = 25;
        preview.y = 2;
        glyph.addChild(preview);

        // Store for later removal
        region.glyph = glyph;
    }

    /**
     * Check if line is in a folded region.
     */
    _isLineFolded(line) {
        for (const [start, fold] of this.foldedRegions) {
            if (line > start && line <= fold.endLine) {
                return true;
            }
        }
        return false;
    }

    /**
     * Render fold indicators in gutter.
     */
    _renderFoldGutter() {
        this.foldGutter.removeChildren();

        for (const region of this.foldMarkers) {
            const isFolded = this.foldedRegions.has(region.start);
            const y = (region.start - this.scrollOffset) * this.lineHeight;

            if (y < 0 || y > this.height) continue;

            // Fold toggle indicator
            const indicator = new PIXI.Graphics();
            indicator.beginFill(isFolded ? 0x00ff88 : 0x333333);
            indicator.drawRect(0, y + 2, 12, this.lineHeight - 4);
            indicator.endFill();

            // Arrow direction
            indicator.beginFill(isFolded ? 0x0a0a0a : 0x888888);
            if (isFolded) {
                indicator.moveTo(3, y + 6);
                indicator.lineTo(9, y + 6);
                indicator.lineTo(6, y + 12);
            } else {
                indicator.moveTo(3, y + 5);
                indicator.lineTo(9, y + 10);
                indicator.lineTo(3, y + 15);
            }
            indicator.endFill();

            indicator.eventMode = 'static';
            indicator.cursor = 'pointer';
            indicator.on('pointerdown', () => this.toggleFold(region.start));

            this.foldGutter.addChild(indicator);
        }
    }

    // ========================================
    // SYNTAX TREE VISUALIZATION
    // ========================================

    /**
     * Parse syntax tree from code.
     */
    parseSyntaxTree() {
        try {
            // Simple AST-like structure for demo
            this.syntaxTree = this._parseCodeToTree(this.codeContent);
            this._buildSyntaxHighlights();
            console.log('[CodeEditor] Syntax tree parsed');
        } catch (e) {
            console.error('[CodeEditor] Syntax parse error:', e);
        }
    }

    /**
     * Parse code into tree structure.
     */
    _parseCodeToTree(code) {
        const lines = code.split('\n');
        const root = { type: 'module', children: [], start: 0, end: lines.length - 1 };
        const stack = [root];
        let currentIndent = 0;

        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const indent = line.search(/\S|$/);
            const trimmed = line.trim();

            // Skip empty lines
            if (!trimmed) continue;

            // Determine node type
            let nodeType = 'statement';
            if (trimmed.startsWith('def ')) nodeType = 'function';
            else if (trimmed.startsWith('class ')) nodeType = 'class';
            else if (trimmed.startsWith('import ')) nodeType = 'import';
            else if (trimmed.startsWith('if ')) nodeType = 'if';
            else if (trimmed.startsWith('for ')) nodeType = 'for';
            else if (trimmed.startsWith('while ')) nodeType = 'while';
            else if (trimmed.startsWith('return ')) nodeType = 'return';

            const node = {
                type: nodeType,
                line: i,
                indent,
                text: trimmed,
                children: []
            };

            // Find parent based on indentation
            while (stack.length > 1 && stack[stack.length - 1].indent >= indent) {
                stack.pop();
            }

            stack[stack.length - 1].children.push(node);

            if (trimmed.endsWith(':')) {
                stack.push(node);
            }
        }

        return root;
    }

    /**
     * Build syntax highlights from tree.
     */
    _buildSyntaxHighlights() {
        this.syntaxHighlights.clear();

        const traverse = (node) => {
            if (!this.syntaxHighlights.has(node.line)) {
                this.syntaxHighlights.set(node.line, []);
            }
            this.syntaxHighlights.get(node.line).push({
                type: node.type,
                indent: node.indent,
                text: node.text
            });

            for (const child of node.children) {
                traverse(child);
            }
        };

        if (this.syntaxTree) {
            traverse(this.syntaxTree);
        }
    }

    /**
     * Get syntax node geometry for line.
     */
    _getSyntaxGeometry(line) {
        const nodes = this.syntaxHighlights.get(line);
        if (!nodes || nodes.length === 0) return null;

        const node = nodes[0];
        const geometry = {
            // Glyph shape based on node type
            shape: this._getSyntaxShape(node.type),
            color: this._getSyntaxColor(node.type),
            expansion: node.children.length > 0 ? 1.2 : 1.0
        };

        return geometry;
    }

    /**
     * Get geometric shape for syntax node type.
     */
    _getSyntaxShape(type) {
        const shapes = {
            'function': 'triangle-up',      // Expansion
            'class': 'hexagon',             // Structure
            'import': 'arrow-right',        // Incoming
            'if': 'diamond',                // Branch
            'for': 'spiral',                // Iteration
            'while': 'infinity',            // Loop
            'return': 'arrow-up',           // Output
            'statement': 'square'           // Default
        };
        return shapes[type] || 'circle';
    }

    /**
     * Get color for syntax node type.
     */
    _getSyntaxColor(type) {
        const colors = {
            'function': 0x44ffff,
            'class': 0xff44ff,
            'import': 0xffff44,
            'if': 0xff8844,
            'for': 0x44ff44,
            'while': 0x88ff44,
            'return': 0xff4444,
            'statement': 0x888888
        };
        return colors[type] || 0x888888;
    }

    // ========================================
    // GIT DIFF INTEGRATION
    // ========================================

    /**
     * Load git diff for current file.
     */
    async loadGitDiff() {
        if (!this.filePath) {
            console.warn('[CodeEditor] No file path for diff');
            return;
        }

        try {
            const response = await fetch(`/api/git/diff?path=${encodeURIComponent(this.filePath)}`);
            const result = await response.json();

            if (result.success) {
                this.gitDiff = result.diff;
                this._parseDiffHunks();
                this._renderDiffOverlay();
                console.log('[CodeEditor] Git diff loaded');
            }
        } catch (e) {
            console.error('[CodeEditor] Failed to load diff:', e);
        }
    }

    /**
     * Parse diff into hunks.
     */
    _parseDiffHunks() {
        this.diffHunks = [];

        if (!this.gitDiff) return;

        const lines = this.gitDiff.split('\n');
        let currentHunk = null;

        for (const line of lines) {
            // Hunk header: @@ -start,count +start,count @@ context
            const hunkMatch = line.match(/^@@ -(\d+),?\d* \+(\d+),?\d* @@/);
            if (hunkMatch) {
                if (currentHunk) {
                    this.diffHunks.push(currentHunk);
                }
                currentHunk = {
                    oldStart: parseInt(hunkMatch[1]),
                    newStart: parseInt(hunkMatch[2]),
                    additions: [],
                    deletions: [],
                    context: []
                };
                continue;
            }

            if (!currentHunk) continue;

            if (line.startsWith('+') && !line.startsWith('++')) {
                currentHunk.additions.push(line.substring(1));
            } else if (line.startsWith('-') && !line.startsWith('--')) {
                currentHunk.deletions.push(line.substring(1));
            } else if (line.startsWith(' ')) {
                currentHunk.context.push(line.substring(1));
            }
        }

        if (currentHunk) {
            this.diffHunks.push(currentHunk);
        }
    }

    /**
     * Render diff overlay with morphological glyphs.
     */
    _renderDiffOverlay() {
        if (!this.diffGraphics) {
            this.diffGraphics = new PIXI.Graphics();
            this.codeArea.addChildAt(this.diffGraphics, 0);
        }

        this.diffGraphics.clear();

        if (!this.showDiff) return;

        for (const hunk of this.diffHunks) {
            // Render additions with expanding glyphs
            for (let i = 0; i < hunk.additions.length; i++) {
                const lineNum = hunk.newStart + i;
                const y = (lineNum - this.scrollOffset) * this.lineHeight;

                if (y < 0 || y > this.height) continue;

                // Green expanding glyph background
                this.diffGraphics.beginFill(0x00ff88, 0.15);
                this.diffGraphics.drawRect(0, y - 2, this.width - 60, this.lineHeight);
                this.diffGraphics.endFill();

                // Expanding morphological indicator
                this._drawExpandingGlyph(5, y + this.lineHeight / 2, 0x00ff88);
            }

            // Render deletions with contracting glyphs
            for (let i = 0; i < hunk.deletions.length; i++) {
                const lineNum = hunk.oldStart + i;
                const y = (lineNum - this.scrollOffset) * this.lineHeight;

                if (y < 0 || y > this.height) continue;

                // Red contracting glyph background
                this.diffGraphics.beginFill(0xff4444, 0.15);
                this.diffGraphics.drawRect(0, y - 2, this.width - 60, this.lineHeight);
                this.diffGraphics.endFill();

                // Contracting morphological indicator
                this._drawContractingGlyph(5, y + this.lineHeight / 2, 0xff4444);
            }
        }
    }

    /**
     * Draw expanding glyph (addition indicator).
     */
    _drawExpandingGlyph(x, y, color) {
        // Hilbert-inspired expanding pattern
        const g = this.diffGraphics;
        g.lineStyle(1, color, 0.8);

        // Outward spiral
        const size = 6;
        g.moveTo(x - size, y - size);
        g.lineTo(x + size, y - size);
        g.lineTo(x + size, y + size);
        g.lineTo(x - size, y + size);
        g.lineTo(x - size, y);
    }

    /**
     * Draw contracting glyph (deletion indicator).
     */
    _drawContractingGlyph(x, y, color) {
        // Inward contracting pattern
        const g = this.diffGraphics;
        g.lineStyle(1, color, 0.8);

        // Inward arrows
        const size = 6;
        g.moveTo(x - size, y - size);
        g.lineTo(x, y);
        g.lineTo(x + size, y - size);

        g.moveTo(x - size, y + size);
        g.lineTo(x, y);
        g.lineTo(x + size, y + size);
    }

    /**
     * Toggle diff view.
     */
    toggleDiff() {
        this.showDiff = !this.showDiff;
        if (this.showDiff && !this.gitDiff) {
            this.loadGitDiff();
        } else {
            this._renderDiffOverlay();
        }
        this._renderCode();
    }

    /**
     * Stage current hunk.
     */
    async stageHunk(hunkIndex) {
        if (!this.filePath || hunkIndex >= this.diffHunks.length) return;

        try {
            const response = await fetch('/api/git/stage-hunk', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    path: this.filePath,
                    hunkIndex
                })
            });

            const result = await response.json();
            if (result.success) {
                console.log(`[CodeEditor] Staged hunk ${hunkIndex}`);
                this.loadGitDiff(); // Refresh diff
            }
        } catch (e) {
            console.error('[CodeEditor] Failed to stage hunk:', e);
        }
    }
}
