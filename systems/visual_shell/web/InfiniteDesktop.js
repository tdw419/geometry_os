/**
 * Geometry OS: Infinite Desktop
 *
 * Running full Linux environments, web browsers, and media
 * suites as interactive, holographic "Tiles" within the
 * Geometry OS visual shell.
 *
 * Architecture:
 * - DesktopTile: Visual container for cartridges
 * - TileManager: Layout and interaction management
 * - DesktopRenderer: PixiJS visualization
 * - InputBridge: Mouse/keyboard to cartridge
 *
 * Epoch 4: The Cartridge Ecosystem
 */

import { LinuxCartridge } from './LinuxCartridge.js';

// ============================================
// CONSTANTS
// ============================================

const TILE_SIZE = { width: 640, height: 480 };
const TILE_MARGIN = 20;
const GRID_COLS = 4;

// Tile states
const TILE_STATE = {
    IDLE: 'idle',
    LOADING: 'loading',
    RUNNING: 'running',
    PAUSED: 'paused',
    ERROR: 'error'
};

// ============================================
// DESKTOP TILE
// ============================================

export class DesktopTile {
    /**
     * @param {Object} config - Tile configuration
     */
    constructor(config) {
        this.id = config.id || `tile_${Date.now()}`;
        this.title = config.title || 'Untitled';
        this.type = config.type || 'cartridge';  // cartridge, browser, media

        // Position and size
        this.x = config.x || 0;
        this.y = config.y || 0;
        this.width = config.width || TILE_SIZE.width;
        this.height = config.height || TILE_SIZE.height;

        // State
        this.state = TILE_STATE.IDLE;
        this.zIndex = 0;
        this.focused = false;
        this.minimized = false;

        // Cartridge reference
        this.cartridge = config.cartridge || null;
        this.output = '';

        // Visual elements
        this.container = null;  // PIXI.Container
        this.graphics = null;   // PIXI.Graphics
        this.textDisplay = null; // PIXI.Text for output

        // Callbacks
        this.onFocus = null;
        this.onClose = null;
        this.onOutput = null;
    }

    // ============================================
    // LIFECYCLE
    // ============================================

    /**
     * Load a cartridge into this tile.
     * @param {string} url - Cartridge URL
     */
    async loadCartridge(url) {
        this.state = TILE_STATE.LOADING;
        this._updateVisual();

        try {
            this.cartridge = new LinuxCartridge();
            await this.cartridge.createDemo();  // Demo for now

            this.state = TILE_STATE.RUNNING;
            this._updateVisual();

            console.log(`[DesktopTile ${this.id}] Cartridge loaded`);
            return true;
        } catch (e) {
            this.state = TILE_STATE.ERROR;
            this._updateVisual();
            console.error(`[DesktopTile ${this.id}] Load failed:`, e);
            return false;
        }
    }

    /**
     * Start the cartridge.
     */
    async start() {
        if (!this.cartridge || this.state === TILE_STATE.RUNNING) {
            return false;
        }

        this.state = TILE_STATE.RUNNING;
        this._updateVisual();

        return true;
    }

    /**
     * Pause the cartridge.
     */
    pause() {
        if (this.state !== TILE_STATE.RUNNING) return false;

        this.state = TILE_STATE.PAUSED;
        if (this.cartridge?.hypervisor) {
            this.cartridge.hypervisor.pause();
        }
        this._updateVisual();
        return true;
    }

    /**
     * Resume the cartridge.
     */
    resume() {
        if (this.state !== TILE_STATE.PAUSED) return false;

        this.state = TILE_STATE.RUNNING;
        this._updateVisual();
        return true;
    }

    /**
     * Close and destroy this tile.
     */
    close() {
        this.state = TILE_STATE.IDLE;

        if (this.cartridge?.hypervisor) {
            this.cartridge.hypervisor.reset();
        }

        if (this.container) {
            this.container.destroy({ children: true });
            this.container = null;
        }

        if (this.onClose) {
            this.onClose(this);
        }
    }

    // ============================================
    // INPUT HANDLING
    // ============================================

    /**
     * Send keyboard input to cartridge.
     * @param {string} key - Key pressed
     * @param {boolean} shift - Shift modifier
     * @param {boolean} ctrl - Ctrl modifier
     */
    sendKey(key, shift = false, ctrl = false) {
        if (this.state !== TILE_STATE.RUNNING || !this.cartridge) {
            return;
        }

        // Convert to character code
        let charCode = key.charCodeAt(0);

        if (ctrl) {
            // Control characters
            charCode = charCode & 0x1F;
        }

        // Send to hypervisor input buffer
        // (Would be actual input handling in production)
        console.log(`[DesktopTile ${this.id}] Key: ${key} (code=${charCode})`);
    }

    /**
     * Send mouse input.
     * @param {number} x - Relative X position
     * @param {number} y - Relative Y position
     * @param {string} action - 'click', 'move', 'down', 'up'
     */
    sendMouse(x, y, action) {
        if (this.state !== TILE_STATE.RUNNING) {
            return;
        }

        // Clamp to tile bounds
        const relX = Math.max(0, Math.min(this.width, x));
        const relY = Math.max(0, Math.min(this.height, y));

        console.log(`[DesktopTile ${this.id}] Mouse: ${action} at (${relX}, ${relY})`);
    }

    // ============================================
    // OUTPUT HANDLING
    // ============================================

    /**
     * Append output from cartridge.
     * @param {string} text - Output text
     */
    appendOutput(text) {
        this.output += text;

        if (this.textDisplay) {
            // Limit output buffer
            const maxLines = 100;
            const lines = this.output.split('\n');
            if (lines.length > maxLines) {
                this.output = lines.slice(-maxLines).join('\n');
            }

            this.textDisplay.text = this.output;
        }

        if (this.onOutput) {
            this.onOutput(text);
        }
    }

    // ============================================
    // VISUAL RENDERING
    // ============================================

    /**
     * Create PIXI visual elements.
     * @param {PIXI.Container} parent - Parent container
     */
    createVisual(parent) {
        this.container = new PIXI.Container();
        this.container.position.set(this.x, this.y);
        this.container.interactive = true;

        // Background
        this.graphics = new PIXI.Graphics();
        this._updateVisual();
        this.container.addChild(this.graphics);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x222222);
        titleBar.drawRect(0, 0, this.width, 24);
        titleBar.endFill();
        this.container.addChild(titleBar);

        // Title text
        const titleStyle = new PIXI.TextStyle({
            fontFamily: 'monospace',
            fontSize: 12,
            fill: 0xFFFFFF
        });
        const titleText = new PIXI.Text(this.title, titleStyle);
        titleText.position.set(8, 4);
        this.container.addChild(titleText);

        // Close button
        const closeBtn = new PIXI.Graphics();
        closeBtn.beginFill(0xFF4444);
        closeBtn.drawRect(this.width - 20, 4, 16, 16);
        closeBtn.endFill();
        closeBtn.interactive = true;
        closeBtn.on('pointerdown', () => this.close());
        this.container.addChild(closeBtn);

        // Output display
        const outputStyle = new PIXI.TextStyle({
            fontFamily: 'monospace',
            fontSize: 11,
            fill: 0x00FF88,
            wordWrap: true,
            wordWrapWidth: this.width - 20
        });
        this.textDisplay = new PIXI.Text('', outputStyle);
        this.textDisplay.position.set(10, 30);
        this.container.addChild(this.textDisplay);

        // Event handlers
        this.container.on('pointerdown', () => this._handleFocus());

        parent.addChild(this.container);
        return this.container;
    }

    /**
     * Update visual appearance based on state.
     */
    _updateVisual() {
        if (!this.graphics) return;

        this.graphics.clear();

        // Background color based on state
        const colors = {
            [TILE_STATE.IDLE]: 0x333333,
            [TILE_STATE.LOADING]: 0x444466,
            [TILE_STATE.RUNNING]: 0x1a1a2e,
            [TILE_STATE.PAUSED]: 0x2a2a4e,
            [TILE_STATE.ERROR]: 0x4a1a1a
        };

        const bgColor = colors[this.state] || 0x333333;
        this.graphics.beginFill(bgColor);
        this.graphics.drawRect(0, 0, this.width, this.height);
        this.graphics.endFill();

        // Border
        const borderColor = this.focused ? 0x00FF88 : 0x666666;
        this.graphics.lineStyle(2, borderColor);
        this.graphics.drawRect(0, 0, this.width, this.height);

        // State indicator
        const stateColors = {
            [TILE_STATE.IDLE]: 0x666666,
            [TILE_STATE.LOADING]: 0xFFAA00,
            [TILE_STATE.RUNNING]: 0x00FF00,
            [TILE_STATE.PAUSED]: 0xFFAA00,
            [TILE_STATE.ERROR]: 0xFF0000
        };

        this.graphics.beginFill(stateColors[this.state]);
        this.graphics.drawCircle(this.width - 10, this.height - 10, 5);
        this.graphics.endFill();
    }

    /**
     * Handle focus event.
     */
    _handleFocus() {
        this.focused = true;
        this._updateVisual();

        if (this.onFocus) {
            this.onFocus(this);
        }
    }

    /**
     * Blur (lose focus).
     */
    blur() {
        this.focused = false;
        this._updateVisual();
    }

    // ============================================
    // SERIALIZATION
    // ============================================

    serialize() {
        return {
            id: this.id,
            title: this.title,
            type: this.type,
            x: this.x,
            y: this.y,
            width: this.width,
            height: this.height,
            state: this.state
        };
    }

    static deserialize(data) {
        return new DesktopTile(data);
    }
}

// ============================================
// TILE MANAGER
// ============================================

export class TileManager {
    /**
     * @param {PIXI.Container} container - Parent container
     */
    constructor(container) {
        this.container = container;
        this.tiles = new Map();
        this.focusedTile = null;
        this.zIndexCounter = 0;

        // Layout settings
        this.gridX = 0;
        this.gridY = 0;
        this.cellWidth = TILE_SIZE.width + TILE_MARGIN;
        this.cellHeight = TILE_SIZE.height + TILE_MARGIN;
    }

    // ============================================
    // TILE MANAGEMENT
    // ============================================

    /**
     * Create a new tile.
     * @param {Object} config - Tile configuration
     * @returns {DesktopTile} Created tile
     */
    createTile(config = {}) {
        // Auto-position if not specified
        if (config.x === undefined || config.y === undefined) {
            const pos = this._getNextPosition();
            config.x = pos.x;
            config.y = pos.y;
        }

        const tile = new DesktopTile({
            ...config,
            id: config.id || `tile_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`
        });

        // Set up callbacks
        tile.onFocus = (t) => this._handleTileFocus(t);
        tile.onClose = (t) => this._handleTileClose(t);

        // Create visual
        tile.createVisual(this.container);

        // Track
        this.tiles.set(tile.id, tile);

        console.log(`[TileManager] Created tile: ${tile.id}`);
        return tile;
    }

    /**
     * Get tile by ID.
     * @param {string} id - Tile ID
     * @returns {DesktopTile|null}
     */
    getTile(id) {
        return this.tiles.get(id) || null;
    }

    /**
     * Get all tiles.
     * @returns {Array<DesktopTile>}
     */
    getAllTiles() {
        return Array.from(this.tiles.values());
    }

    /**
     * Get focused tile.
     * @returns {DesktopTile|null}
     */
    getFocusedTile() {
        return this.focusedTile;
    }

    /**
     * Close a tile.
     * @param {string} id - Tile ID
     */
    closeTile(id) {
        const tile = this.tiles.get(id);
        if (tile) {
            tile.close();
        }
    }

    /**
     * Close all tiles.
     */
    closeAll() {
        for (const tile of this.tiles.values()) {
            tile.close();
        }
        this.tiles.clear();
        this.focusedTile = null;
    }

    // ============================================
    // LAYOUT
    // ============================================

    /**
     * Get next position in grid layout.
     */
    _getNextPosition() {
        const x = TILE_MARGIN + this.gridX * this.cellWidth;
        const y = TILE_MARGIN + this.gridY * this.cellHeight;

        this.gridX++;
        if (this.gridX >= GRID_COLS) {
            this.gridX = 0;
            this.gridY++;
        }

        return { x, y };
    }

    /**
     * Arrange tiles in grid.
     */
    arrangeGrid() {
        let x = 0, y = 0;

        for (const tile of this.tiles.values()) {
            tile.x = TILE_MARGIN + x * this.cellWidth;
            tile.y = TILE_MARGIN + y * this.cellHeight;

            if (tile.container) {
                tile.container.position.set(tile.x, tile.y);
            }

            x++;
            if (x >= GRID_COLS) {
                x = 0;
                y++;
            }
        }

        this.gridX = x;
        this.gridY = y;
    }

    /**
     * Cascade tiles.
     */
    arrangeCascade() {
        let offset = 0;

        for (const tile of this.tiles.values()) {
            tile.x = TILE_MARGIN + offset;
            tile.y = TILE_MARGIN + offset;

            if (tile.container) {
                tile.container.position.set(tile.x, tile.y);
            }

            offset += 30;
        }
    }

    // ============================================
    // EVENT HANDLERS
    // ============================================

    /**
     * Handle tile focus.
     */
    _handleTileFocus(tile) {
        // Blur previous
        if (this.focusedTile && this.focusedTile !== tile) {
            this.focusedTile.blur();
        }

        // Update z-index
        tile.zIndex = ++this.zIndexCounter;
        if (tile.container) {
            this.container.addChild(tile.container);  // Bring to front
        }

        this.focusedTile = tile;
    }

    /**
     * Handle tile close.
     */
    _handleTileClose(tile) {
        this.tiles.delete(tile.id);

        if (this.focusedTile === tile) {
            this.focusedTile = null;
        }
    }

    // ============================================
    // INPUT ROUTING
    // ============================================

    /**
     * Route keyboard input to focused tile.
     * @param {KeyboardEvent} event - Keyboard event
     */
    handleKeyboard(event) {
        if (!this.focusedTile) return;

        this.focusedTile.sendKey(
            event.key,
            event.shiftKey,
            event.ctrlKey
        );
    }

    /**
     * Route mouse input to tile at position.
     * @param {number} x - Global X
     * @param {number} y - Global Y
     * @param {string} action - Mouse action
     */
    handleMouse(x, y, action) {
        const tile = this._getTileAt(x, y);
        if (tile) {
            const relX = x - tile.x;
            const relY = y - tile.y;
            tile.sendMouse(relX, relY, action);
        }
    }

    /**
     * Get tile at global position.
     */
    _getTileAt(x, y) {
        for (const tile of this.tiles.values()) {
            if (x >= tile.x && x < tile.x + tile.width &&
                y >= tile.y && y < tile.y + tile.height) {
                return tile;
            }
        }
        return null;
    }

    // ============================================
    // SERIALIZATION
    // ============================================

    serialize() {
        return {
            tiles: Array.from(this.tiles.values()).map(t => t.serialize()),
            gridX: this.gridX,
            gridY: this.gridY
        };
    }

    deserialize(data) {
        this.closeAll();

        for (const tileData of data.tiles) {
            this.createTile(DesktopTile.deserialize(tileData));
        }

        this.gridX = data.gridX || 0;
        this.gridY = data.gridY || 0;
    }
}

// ============================================
// INFINITE DESKTOP
// ============================================

export class InfiniteDesktop {
    /**
     * @param {Object} options - Configuration
     */
    constructor(options = {}) {
        this.options = {
            width: options.width || 1920,
            height: options.height || 1080,
            backgroundColor: options.backgroundColor || 0x0a0a14,
            ...options
        };

        // PixiJS application (would be initialized externally)
        this.app = null;
        this.stage = null;

        // Components
        this.tileManager = null;

        // Viewport
        this.viewportX = 0;
        this.viewportY = 0;
        this.zoom = 1.0;

        // State
        this.initialized = false;
    }

    // ============================================
    // INITIALIZATION
    // ============================================

    /**
     * Initialize with PixiJS application.
     * @param {PIXI.Application} app - PixiJS app
     */
    init(app) {
        this.app = app;
        this.stage = app.stage;

        // Create tile manager
        this.tileManager = new TileManager(this.stage);

        // Set up event handlers
        this._setupEvents();

        this.initialized = true;
        console.log('[InfiniteDesktop] Initialized');
    }

    /**
     * Set up input events.
     */
    _setupEvents() {
        // Keyboard
        window.addEventListener('keydown', (e) => {
            this.tileManager.handleKeyboard(e);
        });

        // Mouse
        this.app.view.addEventListener('pointerdown', (e) => {
            const rect = e.target.getBoundingClientRect();
            const x = (e.clientX - rect.left) / this.zoom + this.viewportX;
            const y = (e.clientY - rect.top) / this.zoom + this.viewportY;

            this.tileManager.handleMouse(x, y, 'down');
        });

        this.app.view.addEventListener('pointermove', (e) => {
            const rect = e.target.getBoundingClientRect();
            const x = (e.clientX - rect.left) / this.zoom + this.viewportX;
            const y = (e.clientY - rect.top) / this.zoom + this.viewportY;

            this.tileManager.handleMouse(x, y, 'move');
        });
    }

    // ============================================
    // TILE OPERATIONS
    // ============================================

    /**
     * Create a new tile.
     * @param {Object} config - Tile configuration
     * @returns {DesktopTile}
     */
    createTile(config = {}) {
        return this.tileManager.createTile(config);
    }

    /**
     * Create a Linux cartridge tile.
     * @param {string} title - Tile title
     * @param {string} url - Cartridge URL (optional)
     */
    async createLinuxTile(title = 'Linux', url = null) {
        const tile = this.createTile({ title, type: 'cartridge' });

        if (url) {
            await tile.loadCartridge(url);
        }

        return tile;
    }

    /**
     * Create a browser tile.
     * @param {string} url - Initial URL
     */
    createBrowserTile(url = 'about:blank') {
        return this.createTile({
            title: `Browser: ${url}`,
            type: 'browser'
        });
    }

    /**
     * Create a media tile.
     * @param {string} source - Media source
     */
    createMediaTile(source = '') {
        return this.createTile({
            title: 'Media Player',
            type: 'media'
        });
    }

    // ============================================
    // VIEWPORT CONTROL
    // ============================================

    /**
     * Pan viewport.
     * @param {number} dx - X delta
     * @param {number} dy - Y delta
     */
    pan(dx, dy) {
        this.viewportX += dx;
        this.viewportY += dy;

        if (this.stage) {
            this.stage.position.set(-this.viewportX, -this.viewportY);
        }
    }

    /**
     * Zoom viewport.
     * @param {number} factor - Zoom factor
     * @param {number} centerX - Zoom center X
     * @param {number} centerY - Zoom center Y
     */
    zoomTo(factor, centerX = 0, centerY = 0) {
        this.zoom = Math.max(0.1, Math.min(4.0, factor));

        if (this.stage) {
            this.stage.scale.set(this.zoom);
        }
    }

    /**
     * Center viewport on position.
     * @param {number} x - X center
     * @param {number} y - Y center
     */
    centerOn(x, y) {
        this.viewportX = x - this.options.width / 2;
        this.viewportY = y - this.options.height / 2;

        if (this.stage) {
            this.stage.position.set(-this.viewportX, -this.viewportY);
        }
    }

    // ============================================
    // LAYOUT
    // ============================================

    /**
     * Arrange tiles in grid.
     */
    arrangeGrid() {
        this.tileManager.arrangeGrid();
    }

    /**
     * Cascade tiles.
     */
    arrangeCascade() {
        this.tileManager.arrangeCascade();
    }

    // ============================================
    // STATE
    // ============================================

    /**
     * Get desktop state.
     */
    getState() {
        return {
            viewport: {
                x: this.viewportX,
                y: this.viewportY,
                zoom: this.zoom
            },
            tiles: this.tileManager.serialize()
        };
    }

    /**
     * Restore desktop state.
     */
    setState(state) {
        if (state.viewport) {
            this.viewportX = state.viewport.x || 0;
            this.viewportY = state.viewport.y || 0;
            this.zoom = state.viewport.zoom || 1.0;

            if (this.stage) {
                this.stage.position.set(-this.viewportX, -this.viewportY);
                this.stage.scale.set(this.zoom);
            }
        }

        if (state.tiles) {
            this.tileManager.deserialize(state.tiles);
        }
    }

    /**
     * Get statistics.
     */
    getStats() {
        const tiles = this.tileManager.getAllTiles();
        const states = {};

        for (const tile of tiles) {
            states[tile.state] = (states[tile.state] || 0) + 1;
        }

        return {
            totalTiles: tiles.length,
            states,
            viewport: {
                x: this.viewportX,
                y: this.viewportY,
                zoom: this.zoom
            }
        };
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        DesktopTile,
        TileManager,
        InfiniteDesktop,
        TILE_STATE,
        TILE_SIZE
    };
}
