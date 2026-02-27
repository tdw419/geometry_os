/**
 * Geometry OS: Geometric Terminal Emulator
 *
 * The first Post-Symbolic Terminal.
 * Every character is a neural-geometric extrusion.
 * No font files. No ASCII codes in the render path.
 *
 * Architecture:
 * [Keyboard] → [GeometricTextBridge] → [Hilbert Sequences] → [Neural Cell Grid]
 *
 * @module GeometricTerminal
 */

class GeometricCell {
    /**
     * A single cell in the terminal grid.
     * Instead of storing a character code, we store:
     * - The Hilbert texture (if rendered)
     * - The semantic state (bold, highlight, etc.)
     */
    constructor(x, y, size = 16) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.sprite = null;      // PIXI.Sprite
        this.char = ' ';         // Logical character (for copy/paste)
        this.texture = null;     // Cached texture
        this.dirty = true;       // Needs re-render?

        // Semantic state (geometric highlighting)
        this.bold = false;       // SDF offset
        this.highlight = false;  // Background glow
        this.error = false;      // Vibration/frequency
        this.keyword = false;    // Geometric displacement
        this.ansiColor = null;   // ANSI color code
    }

    /**
     * Apply semantic state as geometric transformations.
     */
    applySemanticTransforms() {
        if (!this.sprite) return;

        // Bold = scale up slightly (SDF offset approximation)
        if (this.bold) {
            this.sprite.scale.set(1.1);
            this.sprite.alpha = 1.0;
            if (this.sprite.shader) {
                this.sprite.shader.resources.uniforms.sdfOffset = 0.1;
            }
        } else {
            this.sprite.scale.set(1.0);
            this.sprite.alpha = 0.9;
            if (this.sprite.shader) {
                this.sprite.shader.resources.uniforms.sdfOffset = 0.0;
            }
        }

        // Error = red tint + slight vibration
        let color = [1, 1, 1, 1];
        if (this.error) {
            this.sprite.tint = 0xFF4444;
            this.sprite.rotation = Math.sin(Date.now() / 100) * 0.02;
            color = [1, 0.2, 0.2, 1];
        } else if (this.ansiColor !== null) {
            // Priority to ANSI color
            this.sprite.tint = this.ansiColor;
            this.sprite.rotation = 0;
            // Convert hex to rgb for shader
            const r = ((this.ansiColor >> 16) & 0xFF) / 255;
            const g = ((this.ansiColor >> 8) & 0xFF) / 255;
            const b = (this.ansiColor & 0xFF) / 255;
            color = [r, g, b, 1];
        } else if (this.keyword) {
            // Keyword = cyan tint
            this.sprite.tint = 0x44FFFF;
            this.sprite.rotation = 0;
            color = [0.2, 1, 1, 1];
        } else if (this.highlight) {
            // Highlight = yellow tint
            this.sprite.tint = 0xFFFF44;
            this.sprite.rotation = 0;
            color = [1, 1, 0.2, 1];
        } else {
            this.sprite.tint = 0xFFFFFF;
            this.sprite.rotation = 0;
            color = [1, 1, 1, 1];
        }

        if (this.sprite.shader) {
            this.sprite.shader.resources.uniforms.color = color;
        }
    }
}

class GeometricTerminal {
    /**
     * Post-Symbolic Terminal Emulator.
     *
     * @param {PIXI.Application} app - PixiJS application
     * @param {Object} options - Configuration options
     */
    constructor(app, options = {}) {
        this.app = app;

        // Grid configuration
        this.cols = options.cols || 80;
        this.rows = options.rows || 24;
        this.cellSize = options.cellSize || 16;
        this.spacing = options.spacing || 2;

        // Calculate dimensions
        this.width = this.cols * (this.cellSize + this.spacing);
        this.height = this.rows * (this.cellSize + this.spacing);

        // Cell grid (2D array of GeometricCells)
        this.grid = [];
        this._initGrid();

        // Container for all cells
        this.container = new PIXI.Container();
        this.container.x = options.x || 20;
        this.container.y = options.y || 20;

        // Cursor state
        this.cursorX = 0;
        this.cursorY = 0;
        this.cursorVisible = true;
        this.cursorSprite = null;
        this._initCursor();

        // Text bridge connection
        this.bridge = options.bridge || null;
        this.textureCache = new Map();  // char → PIXI.Texture

        // Phase 4: SDF Rendering
        this.useSDF = options.useSDF !== undefined ? options.useSDF : true;
        this.glyphShader = null;
        this._initShader();

        // Phase 5: Morphological Font System
        this.useMorphFont = options.useMorphFont !== undefined ? options.useMorphFont : true;
        this.morphFont = null;
        this.semanticClassifier = null;
        this._initMorphologicalFont();

        // Command history
        this.commandHistory = [];
        this.historyIndex = -1;

        // Current line buffer
        this.lineBuffer = '';

        // ANSI state
        this.currentBold = false;
        this.currentColor = null;

        // Semantic highlighting rules
        this.semanticRules = this._getDefaultSemanticRules();

        // WebSocket connection for live shell
        this.ws = null;
        this.wsConnected = false;
        this.wsUrl = options.wsUrl || 'ws://localhost:8767';
        this.terminalId = options.terminalId || `term-${Date.now()}`;
        this.shellConnected = false;

        // Background
        this._initBackground();

        // Add to stage
        this.app.stage.addChild(this.container);

        // Start cursor blink
        this._startCursorBlink();

        console.log(`[GeometricTerminal] Initialized: ${this.cols}x${this.rows} cells`);
    }

    _initGrid() {
        for (let y = 0; y < this.rows; y++) {
            this.grid[y] = [];
            for (let x = 0; x < this.cols; x++) {
                this.grid[y][x] = new GeometricCell(x, y, this.cellSize);
            }
        }
    }

    _initBackground() {
        const graphics = new PIXI.Graphics();
        graphics.beginFill(0x0a0a0a);
        graphics.drawRoundedRect(-10, -10, this.width + 20, this.height + 20, 8);
        graphics.endFill();
        this.container.addChild(graphics);
    }

    _initCursor() {
        this.cursorSprite = new PIXI.Graphics();
        this.cursorSprite.beginFill(0x00FF00, 0.7);
        this.cursorSprite.drawRect(0, 0, this.cellSize, this.cellSize);
        this.cursorSprite.endFill();
        this._updateCursorPosition();
        this.container.addChild(this.cursorSprite);
    }

    _updateCursorPosition() {
        if (this.cursorSprite) {
            this.cursorSprite.x = this.cursorX * (this.cellSize + this.spacing);
            this.cursorSprite.y = this.cursorY * (this.cellSize + this.spacing);
        }
    }

    _startCursorBlink() {
        setInterval(() => {
            this.cursorVisible = !this.cursorVisible;
            if (this.cursorSprite) {
                this.cursorSprite.alpha = this.cursorVisible ? 0.7 : 0.2;
            }
        }, 530);
    }

    _getDefaultSemanticRules() {
        return {
            // Commands (geometric: bold)
            commands: ['ls', 'cd', 'pwd', 'cat', 'echo', 'grep', 'find', 'mkdir', 'rm', 'cp', 'mv', 'chmod', 'sudo', 'apt', 'npm', 'python', 'node', 'git'],
            // Keywords (geometric: cyan displacement)
            keywords: ['if', 'else', 'for', 'while', 'def', 'class', 'import', 'from', 'return', 'async', 'await', 'function', 'const', 'let', 'var'],
            // Errors (geometric: red vibration)
            errors: ['error', 'Error', 'ERROR', 'fail', 'Fail', 'FAIL', 'exception', 'Exception'],
            // Paths (geometric: highlight)
            paths: [/^\//, /^\.\//, /^\.\.\//, /^~/],
        };
    }

    /**
     * Connect to the GeometricTextBridge.
     * @param {GeometricTextRenderer} bridge
     */
    setBridge(bridge) {
        this.bridge = bridge;
        console.log('[GeometricTerminal] Bridge connected');
    }

    /**
     * Write text to the terminal.
     * This is the main output method.
     * @param {string} text
     */
    async write(text) {
        // Basic ANSI color code support (e.g. \x1b[31m)
        let i = 0;
        while (i < text.length) {
            const char = text[i];
            
            if (char === '\x1b' && text[i+1] === '[') {
                // Parse escape sequence
                let j = i + 2;
                let seq = '';
                while (j < text.length && !/[a-zA-Z]/.test(text[j])) {
                    seq += text[j];
                    j++;
                }
                const command = text[j];
                this._handleAnsi(seq, command);
                i = j + 1;
                continue;
            }

            if (char === '\n') {
                this._newline();
            } else if (char === '\r') {
                this.cursorX = 0;
            } else if (char === '\t') {
                this._tab();
            } else if (char === '\b') {
                this._backspace();
            } else {
                await this._writeChar(char);
            }
            i++;
        }
        this._applySemanticHighlighting();
        this._updateCursorPosition();
    }

    _handleAnsi(seq, command) {
        if (command === 'm') {
            // Select Graphic Rendition
            const codes = seq.split(';').map(c => parseInt(c));
            for (const code of codes) {
                if (code === 0) {
                    this.currentBold = false;
                    this.currentColor = null;
                } else if (code === 1) {
                    this.currentBold = true;
                } else if (code >= 30 && code <= 37) {
                    // Standard colors
                    const colors = [0x000000, 0xFF0000, 0x00FF00, 0xFFFF00, 0x0000FF, 0xFF00FF, 0x00FFFF, 0xFFFFFF];
                    this.currentColor = colors[code - 30];
                } else if (code === 39) {
                    this.currentColor = null;
                }
            }
        }
    }

    async _initShader() {
        if (!this.useSDF) return;

        try {
            const response = await fetch('shaders/morphological_glyph.wgsl');
            const wgsl = await response.text();

            this.glyphShader = PIXI.Shader.from({
                gl: {
                    vertex: `
                        attribute vec2 aVertexPosition;
                        attribute vec2 aTextureCoord;
                        uniform mat3 projectionMatrix;
                        uniform mat3 worldTransformMatrix;
                        varying vec2 vTextureCoord;
                        void main() {
                            gl_Position = vec4((projectionMatrix * worldTransformMatrix * vec3(aVertexPosition, 1.0)).xy, 0.0, 1.0);
                            vTextureCoord = aTextureCoord;
                        }
                    `,
                    fragment: `
                        varying vec2 vTextureCoord;
                        uniform sampler2D uSampler;
                        uniform vec4 uColor;
                        uniform float uSdfOffset;
                        void main() {
                            float distance = texture2D(uSampler, vTextureCoord).r;
                            float threshold = 0.5 - uSdfOffset;
                            float afwidth = fwidth(distance) * 0.707;
                            float alpha = smoothstep(threshold - afwidth, threshold + afwidth, distance);
                            gl_FragColor = vec4(uColor.rgb, alpha * uColor.a);
                        }
                    `
                },
                gpu: {
                    vertex: {
                        entryPoint: 'vertexMain',
                        source: wgsl
                    },
                    fragment: {
                        entryPoint: 'fragmentMain',
                        source: wgsl
                    }
                },
                resources: {
                    uniforms: {
                        projectionMatrix: { type: 'mat3x3<f32>', value: new Float32Array(9) },
                        worldTransformMatrix: { type: 'mat3x3<f32>', value: new Float32Array(9) },
                        color: { type: 'vec4<f32>', value: [1, 1, 1, 1] },
                        sdfOffset: { type: 'f32', value: 0.0 },
                        smoothing: { type: 'f32', value: 0.05 }
                    }
                }
            });
            console.log('[GeometricTerminal] Morphological SDF Shader initialized');
        } catch (e) {
            console.error('[GeometricTerminal] Failed to load SDF shader:', e);
            this.useSDF = false;
        }
    }

    /**
     * Initialize morphological font system for glyph synthesis.
     */
    async _initMorphologicalFont() {
        if (!this.useMorphFont) return;

        try {
            // Check if MorphologicalFont is available
            if (typeof MorphologicalFont === 'undefined') {
                console.warn('[GeometricTerminal] MorphologicalFont not loaded, using fallback');
                this.useMorphFont = false;
                return;
            }

            // Initialize morphological font
            this.morphFont = new MorphologicalFont({ size: this.cellSize });
            await this.morphFont.init();

            // Initialize semantic classifier if available
            if (typeof SemanticClassifier !== 'undefined') {
                this.semanticClassifier = new SemanticClassifier();
                if (typeof PatternLibrary !== 'undefined') {
                    this.semanticClassifier.setPatternLibrary(PatternLibrary);
                }
            }

            console.log('[GeometricTerminal] Morphological Font Layer initialized');
        } catch (e) {
            console.error('[GeometricTerminal] Failed to initialize morphological font:', e);
            this.useMorphFont = false;
        }
    }

    /**
     * Classify a token into semantic category for glyph synthesis.
     */
    _classifyToken(token, context = {}) {
        if (!this.semanticClassifier) {
            return { category: 'default' };
        }
        return this.semanticClassifier.classify(token, context);
    }

    async _writeChar(char) {
        if (this.cursorX >= this.cols) {
            this._newline();
        }

        const cell = this.grid[this.cursorY][this.cursorX];
        cell.char = char;
        cell.dirty = true;
        cell.bold = this.currentBold;
        cell.ansiColor = this.currentColor;

        // Get or create texture
        if (this.bridge) {
            const texture = await this._getTexture(char);
            if (texture) {
                if (!cell.sprite) {
                    if (this.useSDF && this.glyphShader) {
                        // Use Mesh for custom shader
                        const geometry = new PIXI.PlaneGeometry(this.cellSize, this.cellSize);
                        cell.sprite = new PIXI.Mesh({
                            geometry,
                            shader: this.glyphShader,
                            texture
                        });
                    } else {
                        cell.sprite = new PIXI.Sprite(texture);
                    }
                    cell.sprite.x = this.cursorX * (this.cellSize + this.spacing);
                    cell.sprite.y = this.cursorY * (this.cellSize + this.spacing);
                    this.container.addChild(cell.sprite);
                } else {
                    cell.sprite.texture = texture;
                }
                cell.texture = texture;
            }
        }

        this.cursorX++;
    }

    async _getTexture(char) {
        // Build cache key with semantic context
        const category = this._getCurrentCategory();
        const cacheKey = `${char}:${category}`;

        if (this.textureCache.has(cacheKey)) {
            return this.textureCache.get(cacheKey);
        }

        // Try morphological font first (client-side synthesis)
        if (this.useMorphFont && this.morphFont) {
            try {
                const glyphCanvas = await this.morphFont.getGlyphTexture(char, {
                    category: category,
                    bold: this.currentBold,
                    error: this.currentError || false
                });

                if (glyphCanvas) {
                    const texture = PIXI.Texture.from(glyphCanvas);
                    this.textureCache.set(cacheKey, texture);
                    return texture;
                }
            } catch (e) {
                console.warn('[GeometricTerminal] Morphological font failed, using fallback:', e);
            }
        }

        // Fallback to bridge (server-side rendering)
        if (this.bridge) {
            try {
                const textures = await this.bridge.createTextTextures(char);
                if (textures && textures.length > 0) {
                    this.textureCache.set(cacheKey, textures[0]);
                    return textures[0];
                }
            } catch (e) {
                console.error('[GeometricTerminal] Failed to get texture:', e);
            }
        }

        return null;
    }

    /**
     * Get current semantic category based on terminal state.
     */
    _getCurrentCategory() {
        // Check if current line contains keywords
        const line = this._getCurrentLine();
        if (!line) return 'default';

        // Simple keyword detection
        const tokens = line.trim().split(/\s+/);
        const lastToken = tokens[tokens.length - 1];

        if (this.semanticClassifier) {
            const result = this.semanticClassifier.classify(lastToken);
            return result.category;
        }

        // Fallback keyword detection
        const keywordCategories = {
            control: ['if', 'else', 'for', 'while', 'switch', 'case', 'try', 'catch'],
            function: ['def', 'function', 'class', 'fn', 'func', 'lambda'],
            return: ['return', 'yield', 'break', 'continue', 'exit'],
            data: ['const', 'let', 'var', 'int', 'string', 'bool', 'float'],
            operator: ['+', '-', '*', '/', '=', '==', '!=', '<', '>', '&&', '||']
        };

        for (const [category, keywords] of Object.entries(keywordCategories)) {
            if (keywords.includes(lastToken)) {
                return category;
            }
        }

        return 'default';
    }

    /**
     * Get the current line being edited.
     */
    _getCurrentLine() {
        let line = '';
        for (let x = 0; x < this.cursorX; x++) {
            const cell = this.grid[this.cursorY]?.[x];
            if (cell && cell.char !== ' ') {
                line += cell.char;
            }
        }
        return line;
    }

    _newline() {
        this.cursorX = 0;
        this.cursorY++;

        // Scroll if needed
        if (this.cursorY >= this.rows) {
            this._scroll();
        }
    }

    _tab() {
        const tabSize = 4;
        const spaces = tabSize - (this.cursorX % tabSize);
        for (let i = 0; i < spaces; i++) {
            this._writeChar(' ');
        }
    }

    _backspace() {
        if (this.cursorX > 0) {
            this.cursorX--;
            const cell = this.grid[this.cursorY][this.cursorX];
            cell.char = ' ';
            cell.dirty = true;
            if (cell.sprite) {
                cell.sprite.visible = false;
            }
        }
    }

    /**
     * Scroll the terminal up by one line.
     * Instead of moving sprites, we shift Hilbert indices.
     */
    _scroll() {
        // Move all rows up
        for (let y = 0; y < this.rows - 1; y++) {
            for (let x = 0; x < this.cols; x++) {
                const sourceCell = this.grid[y + 1][x];
                const targetCell = this.grid[y][x];

                // Copy cell state
                targetCell.char = sourceCell.char;
                targetCell.bold = sourceCell.bold;
                targetCell.highlight = sourceCell.highlight;
                targetCell.error = sourceCell.error;
                targetCell.keyword = sourceCell.keyword;
                targetCell.dirty = true;

                // Swap textures (Hilbert index shift, not sprite movement)
                if (targetCell.sprite && sourceCell.texture) {
                    targetCell.sprite.texture = sourceCell.texture;
                    targetCell.texture = sourceCell.texture;
                    targetCell.sprite.visible = sourceCell.char !== ' ';
                }
            }
        }

        // Clear last row
        const lastRow = this.grid[this.rows - 1];
        for (let x = 0; x < this.cols; x++) {
            lastRow[x].char = ' ';
            lastRow[x].bold = false;
            lastRow[x].highlight = false;
            lastRow[x].error = false;
            lastRow[x].keyword = false;
            lastRow[x].dirty = true;
            if (lastRow[x].sprite) {
                lastRow[x].sprite.visible = false;
            }
        }

        this.cursorY = this.rows - 1;
    }

    /**
     * Apply semantic highlighting as geometric transformations.
     * This is where "syntax highlighting" becomes "morphological highlighting."
     */
    _applySemanticHighlighting() {
        // Build word boundaries per line
        for (let y = 0; y < this.rows; y++) {
            let wordStart = 0;
            let currentWord = '';

            for (let x = 0; x <= this.cols; x++) {
                const cell = this.grid[y][x];
                const char = cell.char;

                if (char === ' ' || x === this.cols) {
                    // End of word - apply semantic rules
                    if (currentWord.length > 0) {
                        this._applyWordSemantics(y, wordStart, currentWord);
                    }
                    currentWord = '';
                    wordStart = x + 1;
                } else {
                    currentWord += char;
                }
            }
        }

        // Apply transforms to all cells
        for (let y = 0; y < this.rows; y++) {
            for (let x = 0; x < this.cols; x++) {
                this.grid[y][x].applySemanticTransforms();
            }
        }
    }

    _applyWordSemantics(row, startX, word) {
        // Check semantic rules
        let isCommand = this.semanticRules.commands.includes(word);
        let isKeyword = this.semanticRules.keywords.includes(word);
        let isError = this.semanticRules.errors.includes(word);
        let isPath = this.semanticRules.paths.some(regex => regex.test(word));

        // Apply to cells
        for (let x = startX; x < startX + word.length && x < this.cols; x++) {
            const cell = this.grid[row][x];
            cell.bold = isCommand;
            cell.keyword = isKeyword;
            cell.error = isError;
            cell.highlight = isPath;
        }
    }

    /**
     * Clear the terminal.
     */
    clear() {
        for (let y = 0; y < this.rows; y++) {
            for (let x = 0; x < this.cols; x++) {
                const cell = this.grid[y][x];
                cell.char = ' ';
                cell.bold = false;
                cell.highlight = false;
                cell.error = false;
                cell.keyword = false;
                if (cell.sprite) {
                    cell.sprite.visible = false;
                }
            }
        }
        this.cursorX = 0;
        this.cursorY = 0;
        this._updateCursorPosition();
    }

    /**
     * Handle keyboard input.
     * @param {KeyboardEvent} event
     */
    handleKeyDown(event) {
        const key = event.key;

        // If connected to live shell, send all input there
        if (this.shellConnected) {
            if (key === 'Enter') {
                this._sendInput('\r');
                event.preventDefault();
            } else if (key === 'Backspace') {
                this._sendInput('\x7f'); // DEL character
                event.preventDefault();
            } else if (key === 'Tab') {
                this._sendInput('\t');
                event.preventDefault();
            } else if (key === 'ArrowUp') {
                this._sendInput('\x1b[A');
                event.preventDefault();
            } else if (key === 'ArrowDown') {
                this._sendInput('\x1b[B');
                event.preventDefault();
            } else if (key === 'ArrowLeft') {
                this._sendInput('\x1b[D');
                event.preventDefault();
            } else if (key === 'ArrowRight') {
                this._sendInput('\x1b[C');
                event.preventDefault();
            } else if (key === 'Escape') {
                this._sendInput('\x1b');
                event.preventDefault();
            } else if (key.length === 1 && !event.ctrlKey && !event.metaKey) {
                this._sendInput(key);
                event.preventDefault();
            } else if (event.ctrlKey && key.length === 1) {
                // Ctrl+C, Ctrl+D, etc.
                const ctrlChar = String.fromCharCode(key.charCodeAt(0) - 96);
                this._sendInput(ctrlChar);
                event.preventDefault();
            }
            return;
        }

        // Local mode (not connected to shell)
        if (key === 'Enter') {
            this._executeCommand();
        } else if (key === 'Backspace') {
            if (this.lineBuffer.length > 0) {
                this.lineBuffer = this.lineBuffer.slice(0, -1);
                this._backspace();
                this._updateCursorPosition();
            }
        } else if (key === 'ArrowUp') {
            this._historyUp();
        } else if (key === 'ArrowDown') {
            this._historyDown();
        } else if (key.length === 1 && !event.ctrlKey && !event.metaKey) {
            this.lineBuffer += key;
            this.write(key);
        }
    }

    _executeCommand() {
        const command = this.lineBuffer.trim();
        this.write('\n');

        if (command) {
            this.commandHistory.push(command);
            this.historyIndex = this.commandHistory.length;

            // If connected to shell, send command
            if (this.shellConnected) {
                this._sendInput(command + '\r');
            } else {
                // Emit command event for local handling
                this._emitCommand(command);
            }
        }

        this.lineBuffer = '';
    }

    _historyUp() {
        if (this.historyIndex > 0) {
            this.historyIndex--;
            this._loadHistoryItem();
        }
    }

    _historyDown() {
        if (this.historyIndex < this.commandHistory.length - 1) {
            this.historyIndex++;
            this._loadHistoryItem();
        }
    }

    _loadHistoryItem() {
        // Clear current line
        while (this.lineBuffer.length > 0) {
            this.lineBuffer = this.lineBuffer.slice(0, -1);
            this._backspace();
        }

        // Load history item
        const item = this.commandHistory[this.historyIndex];
        if (item) {
            this.lineBuffer = item;
            this.write(item);
        }
        this._updateCursorPosition();
    }

    _emitCommand(command) {
        // Dispatch custom event for external handlers
        const event = new CustomEvent('geometric-terminal-command', {
            detail: { command, terminal: this }
        });
        window.dispatchEvent(event);
    }

    /**
     * Get the current line content.
     */
    getCurrentLine() {
        let line = '';
        for (let x = 0; x < this.cols; x++) {
            line += this.grid[this.cursorY][x].char;
        }
        return line.trim();
    }

    /**
     * Destroy the terminal.
     */
    destroy() {
        this.disconnectShell();
        this.container.destroy({ children: true });
    }

    /**
     * Connect to live shell via WebSocket.
     * @param {string} url - WebSocket URL (optional, uses default)
     */
    connectToShell(url = null) {
        if (this.ws) {
            console.warn('[GeometricTerminal] Already connected to shell');
            return;
        }

        const wsUrl = url || `${this.wsUrl}/ws/shell/${this.terminalId}`;
        console.log(`[GeometricTerminal] Connecting to shell: ${wsUrl}`);

        try {
            this.ws = new WebSocket(wsUrl);

            this.ws.onopen = () => {
                console.log('[GeometricTerminal] WebSocket connected');
                this.wsConnected = true;
            };

            this.ws.onmessage = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    this._handleShellMessage(data);
                } catch (e) {
                    console.error('[GeometricTerminal] Failed to parse shell message:', e);
                }
            };

            this.ws.onclose = (event) => {
                console.log(`[GeometricTerminal] WebSocket closed: code=${event.code}`);
                this.wsConnected = false;
                this.shellConnected = false;
                this.ws = null;

                // Show disconnect message
                this.write('\r\n\x1b[33m[Shell disconnected]\x1b[0m\r\n');
            };

            this.ws.onerror = (error) => {
                console.error('[GeometricTerminal] WebSocket error:', error);
                this.wsConnected = false;
            };

        } catch (e) {
            console.error('[GeometricTerminal] Failed to connect:', e);
        }
    }

    /**
     * Disconnect from shell.
     */
    disconnectShell() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
            this.wsConnected = false;
            this.shellConnected = false;
        }
    }

    /**
     * Handle incoming shell message.
     * @param {Object} data - Parsed message from server
     */
    _handleShellMessage(data) {
        switch (data.type) {
            case 'ready':
                console.log(`[GeometricTerminal] Shell ready: PID ${data.pid}`);
                this.shellConnected = true;
                // Send resize to confirm terminal size
                this._sendResize();
                break;

            case 'output':
                // Write shell output to terminal
                this.write(data.data);
                break;

            case 'exit':
                console.log(`[GeometricTerminal] Shell exited: code ${data.code}`);
                this.shellConnected = false;
                this.write(`\r\n\x1b[33m[Shell exited: ${data.code}]\x1b[0m\r\n`);
                break;

            case 'ping':
                // Respond to keepalive
                if (this.ws && this.ws.readyState === WebSocket.OPEN) {
                    this.ws.send(JSON.stringify({ type: 'pong' }));
                }
                break;

            case 'pong':
                // Keepalive response
                break;

            default:
                console.warn('[GeometricTerminal] Unknown message type:', data.type);
        }
    }

    /**
     * Send input to shell.
     * @param {string} input
     */
    _sendInput(input) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN && this.shellConnected) {
            this.ws.send(JSON.stringify({
                type: 'input',
                data: input
            }));
        }
    }

    /**
     * Send resize to shell.
     */
    _sendResize() {
        if (this.ws && this.ws.readyState === WebSocket.OPEN && this.shellConnected) {
            this.ws.send(JSON.stringify({
                type: 'resize',
                cols: this.cols,
                rows: this.rows
            }));
        }
    }

    /**
     * Check if shell is connected.
     */
    isShellConnected() {
        return this.shellConnected;
    }

// Export for browser
if (typeof window !== 'undefined') {
    window.GeometricTerminal = GeometricTerminal;
    window.GeometricCell = GeometricCell;
}
