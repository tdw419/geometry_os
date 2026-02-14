/**
 * BuilderPanel - AI-Driven Visual Builder UI
 *
 * Provides the visual interface for AI agents to build Geometry OS
 * by triggering UI controls through WebMCP tools.
 *
 * Components:
 * - Tile Palette: Select and place tiles on Infinite Map
 * - Shader Editor: Load, evolve, preview WGSL shaders
 * - Cartridge Rack: Assemble PixelRTS cartridges
 * - Action Log: Real-time log of AI building actions
 *
 * @version 1.0.0
 * @phase Phase F: AI-Driven Visual Builder
 */

class BuilderPanel {
    /** @type {HTMLElement|null} */
    #container = null;

    /** @type {string} */
    #selectedTileType = 'system';

    /** @type {Object[]} */
    #actionLog = [];

    /** @type {Map<string, Object>} */
    #placedTiles = new Map();

    /** @type {Object|null} */
    #currentShader = null;

    /** @type {boolean} */
    #minimized = false;

    /** @type {Object|null} */
    #app = null;

    constructor() {
        // Wait for Geometry OS to be ready
        if (window.geometryOSApp) {
            this.#app = window.geometryOSApp;
            this.#init();
        } else {
            window.addEventListener('geometry-os-ready', () => {
                this.#app = window.geometryOSApp;
                this.#init();
            });
        }
    }

    #init() {
        this.#createContainer();
        this.#injectStyles();
        this.#render();
        this.#setupEventListeners();

        console.log('BuilderPanel: Initialized');
    }

    #createContainer() {
        this.#container = document.createElement('div');
        this.#container.id = 'builder-panel';
        this.#container.className = 'builder-panel';
        document.body.appendChild(this.#container);
    }

    #injectStyles() {
        if (document.getElementById('builder-panel-styles')) return;

        const link = document.createElement('link');
        link.id = 'builder-panel-styles';
        link.rel = 'stylesheet';
        link.href = 'BuilderPanel.css';
        document.head.appendChild(link);
    }

    #render() {
        this.#container.innerHTML = `
            <div class="builder-panel-header">
                <h3>AI Builder Panel</h3>
                <div>
                    <button id="builder-minimize">_</button>
                    <button id="builder-close">×</button>
                </div>
            </div>

            <div class="builder-tabs">
                <div class="builder-tab active" data-tab="tiles">Tiles</div>
                <div class="builder-tab" data-tab="shaders">Shaders</div>
                <div class="builder-tab" data-tab="cartridges">Cartridges</div>
            </div>

            <div class="builder-tab-content active" data-content="tiles">
                <div class="tile-palette">
                    <div class="tile-button" data-tile="empty">
                        <span class="icon">⬜</span>
                        <span class="label">Empty</span>
                    </div>
                    <div class="tile-button selected" data-tile="system">
                        <span class="icon">⚙️</span>
                        <span class="label">System</span>
                    </div>
                    <div class="tile-button" data-tile="data">
                        <span class="icon">📊</span>
                        <span class="label">Data</span>
                    </div>
                    <div class="tile-button" data-tile="code">
                        <span class="icon">💻</span>
                        <span class="label">Code</span>
                    </div>
                    <div class="tile-button" data-tile="cartridge">
                        <span class="icon">📦</span>
                        <span class="label">Cartridge</span>
                    </div>
                    <div class="tile-button" data-tile="nursery">
                        <span class="icon">🌿</span>
                        <span class="label">Nursery</span>
                    </div>
                </div>
                <p style="font-size: 10px; color: #666; margin-top: 10px;">
                    Click map to place selected tile type
                </p>
            </div>

            <div class="builder-tab-content" data-content="shaders">
                <div class="shader-controls">
                    <button id="builder-load-shader">Load WGSL Shader</button>
                    <button id="builder-evolve-shader">Evolve Shader</button>
                    <button id="builder-preview-shader">Preview</button>
                </div>
                <div class="shader-status">
                    Current: <span id="current-shader-name">none</span>
                </div>
            </div>

            <div class="builder-tab-content" data-content="cartridges">
                <div class="cartridge-controls">
                    <button id="builder-select-region">Select Region</button>
                    <button id="builder-add-files">Add Files</button>
                    <button id="builder-assemble">Assemble Cartridge</button>
                    <button id="builder-boot-test">Boot Test</button>
                </div>
                <div class="cartridge-status">
                    Files: <span id="cartridge-file-count">0</span> |
                    Size: <span id="cartridge-size">0 KB</span>
                </div>
            </div>

            <div class="action-log" id="builder-action-log">
                <div class="action-log-entry success">
                    <span class="timestamp">--:--:--</span>
                    Builder Panel initialized
                </div>
            </div>

            <div class="quick-actions">
                <button id="builder-preview">Preview</button>
                <button id="builder-undo">Undo</button>
                <button id="builder-clear">Clear</button>
                <button id="builder-save">Save</button>
            </div>
        `;
    }

    #setupEventListeners() {
        // Tab switching
        this.#container.querySelectorAll('.builder-tab').forEach(tab => {
            tab.addEventListener('click', () => this.#switchTab(tab.dataset.tab));
        });

        // Tile selection
        this.#container.querySelectorAll('.tile-button').forEach(btn => {
            btn.addEventListener('click', () => this.#selectTile(btn.dataset.tile));
        });

        // Header buttons
        document.getElementById('builder-minimize').addEventListener('click', () => this.#toggleMinimize());
        document.getElementById('builder-close').addEventListener('click', () => this.#hide());

        // Quick actions
        document.getElementById('builder-preview').addEventListener('click', () => this.preview());
        document.getElementById('builder-undo').addEventListener('click', () => this.undo());
        document.getElementById('builder-clear').addEventListener('click', () => this.clear());
        document.getElementById('builder-save').addEventListener('click', () => this.save());

        // Shader buttons
        document.getElementById('builder-load-shader').addEventListener('click', () => {
            this.logAction('Load shader button clicked (use WebMCP tool)', 'info');
        });
        document.getElementById('builder-evolve-shader').addEventListener('click', () => {
            this.logAction('Evolve shader button clicked (use WebMCP tool)', 'info');
        });
    }

    #switchTab(tabName) {
        this.#container.querySelectorAll('.builder-tab').forEach(t => t.classList.remove('active'));
        this.#container.querySelectorAll('.builder-tab-content').forEach(c => c.classList.remove('active'));

        this.#container.querySelector(`.builder-tab[data-tab="${tabName}"]`).classList.add('active');
        this.#container.querySelector(`.builder-tab-content[data-content="${tabName}"]`).classList.add('active');
    }

    #selectTile(tileType) {
        this.#selectedTileType = tileType;
        this.#container.querySelectorAll('.tile-button').forEach(b => b.classList.remove('selected'));
        this.#container.querySelector(`.tile-button[data-tile="${tileType}"]`).classList.add('selected');
        this.logAction(`Selected tile type: ${tileType}`, 'info');
    }

    #toggleMinimize() {
        this.#minimized = !this.#minimized;
        this.#container.classList.toggle('minimized', this.#minimized);
    }

    #hide() {
        this.#container.style.display = 'none';
    }

    show() {
        this.#container.style.display = 'block';
    }

    // ─────────────────────────────────────────────────────────────
    // Public API (called by WebMCP tools)
    // ─────────────────────────────────────────────────────────────

    /**
     * Place a tile on the map
     * @param {string} tileType
     * @param {number} x
     * @param {number} y
     * @param {Object} options
     * @returns {Object}
     */
    placeTile(tileType, x, y, options = {}) {
        const tileId = `tile_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        const size = options.size || 100;

        // Create tile data
        const tile = {
            tile_id: tileId,
            type: tileType,
            x,
            y,
            size,
            metadata: options.metadata || {},
            created_at: new Date().toISOString()
        };

        this.#placedTiles.set(tileId, tile);

        // Visual placement on Infinite Map (if available)
        if (this.#app?.worldContainer) {
            this.#renderTile(tile);
        }

        this.logAction(`Placed '${tileType}' tile at (${x}, ${y})`, 'success');

        return {
            success: true,
            tile_id: tileId,
            position: { x, y },
            size
        };
    }

    #renderTile(tile) {
        // Create a PixiJS sprite/graphics for the tile
        const graphics = new PIXI.Graphics();

        // Color based on type
        const colors = {
            empty: 0x444444,
            system: 0x00ff88,
            data: 0x00ffff,
            code: 0xffff00,
            cartridge: 0xff00ff,
            nursery: 0x88ff88
        };

        const color = colors[tile.type] || 0x666666;
        const gridSize = this.#app.config?.gridSize || 100;
        const x = tile.x * gridSize;
        const y = tile.y * gridSize;

        graphics.beginFill(color, 0.3);
        graphics.lineStyle(2, color, 1);
        graphics.drawRect(x, y, tile.size, tile.size);
        graphics.endFill();

        // Add label
        const label = new PIXI.Text(tile.type, {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: color
        });
        label.x = x + 5;
        label.y = y + 5;
        graphics.addChild(label);

        graphics.tileId = tile.tileId;
        this.#app.worldContainer.addChild(graphics);

        tile.graphics = graphics;
    }

    /**
     * Load a shader into the editor
     * @param {string} name
     * @param {string} wgslCode
     * @returns {Object}
     */
    loadShader(name, wgslCode) {
        const shaderId = `shader_${Date.now()}`;

        this.#currentShader = {
            shader_id: shaderId,
            name,
            code: wgslCode,
            evolved: false,
            loaded_at: new Date().toISOString()
        };

        document.getElementById('current-shader-name').textContent = name;
        this.logAction(`Loaded shader '${name}' (${wgslCode.length} chars)`, 'success');

        return {
            success: true,
            shader_id: shaderId,
            name,
            preview_ready: true
        };
    }

    /**
     * Log an action to the Action Log
     * @param {string} message
     * @param {string} status - 'success', 'error', 'info'
     */
    logAction(message, status = 'info') {
        const timestamp = new Date().toLocaleTimeString();
        const entry = { timestamp, message, status };
        this.#actionLog.push(entry);

        const logContainer = document.getElementById('builder-action-log');
        if (logContainer) {
            const div = document.createElement('div');
            div.className = `action-log-entry ${status}`;
            div.innerHTML = `<span class="timestamp">${timestamp}</span>${message}`;
            logContainer.appendChild(div);
            logContainer.scrollTop = logContainer.scrollHeight;
        }

        console.log(`BuilderPanel: ${message}`);
    }

    /**
     * Get current builder state
     * @returns {Object}
     */
    getState() {
        return {
            tiles: Array.from(this.#placedTiles.values()).map(t => ({
                tile_id: t.tile_id,
                type: t.type,
                position: { x: t.x, y: t.y }
            })),
            current_shader: this.#currentShader ? {
                shader_id: this.#currentShader.shader_id,
                name: this.#currentShader.name,
                evolved: this.#currentShader.evolved
            } : null,
            selected_tile_type: this.#selectedTileType
        };
    }

    /**
     * Preview current build
     */
    preview() {
        this.logAction('Preview captured', 'success');
        return { success: true, message: 'Preview captured (use builder_preview tool for image)' };
    }

    /**
     * Undo last action
     */
    undo() {
        // Remove last placed tile
        const tiles = Array.from(this.#placedTiles.values());
        if (tiles.length > 0) {
            const lastTile = tiles[tiles.length - 1];
            this.#placedTiles.delete(lastTile.tile_id);

            if (lastTile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(lastTile.graphics);
            }

            this.logAction(`Undid tile at (${lastTile.x}, ${lastTile.y})`, 'info');
            return { success: true };
        }

        this.logAction('Nothing to undo', 'info');
        return { success: false, message: 'Nothing to undo' };
    }

    /**
     * Clear all placed tiles
     */
    clear() {
        const count = this.#placedTiles.size;

        this.#placedTiles.forEach(tile => {
            if (tile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(tile.graphics);
            }
        });

        this.#placedTiles.clear();
        this.logAction(`Cleared ${count} tiles`, 'info');

        return { success: true, cleared_count: count };
    }

    /**
     * Save current build
     */
    save() {
        const state = this.getState();
        const json = JSON.stringify(state, null, 2);

        // Create download
        const blob = new Blob([json], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `builder_state_${Date.now()}.json`;
        a.click();
        URL.revokeObjectURL(url);

        this.logAction('Build state saved', 'success');
        return { success: true, tiles_saved: state.tiles.length };
    }
}

// Auto-initialize
window.builderPanel = new BuilderPanel();

console.log('BuilderPanel loaded - AI-Driven Visual Builder ready.');
