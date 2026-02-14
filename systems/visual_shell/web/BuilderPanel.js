/**
 * BuilderPanel - AI-Driven Visual Builder UI
 *
 * Provides the visual interface for AI agents to build Geometry OS
 * by triggering UI controls through WebMCP tools.
 *
 * Paradigm: "The AI doesn't write code - it clicks buttons and watches the canvas."
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
    // ─────────────────────────────────────────────────────────────
    // Private Fields
    // ─────────────────────────────────────────────────────────────

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

    /** @type {Object} */
    #tileColors = {
        empty: 0x444444,
        system: 0x00ff88,
        data: 0x00ffff,
        code: 0xffff00,
        cartridge: 0xff00ff,
        nursery: 0x88ff88
    };

    /** @type {TileConnectionManager|null} */
    #connectionManager = null;

    /** @type {string[]} */
    #validTileTypes = ['empty', 'system', 'data', 'code', 'cartridge', 'nursery'];

    // ─────────────────────────────────────────────────────────────
    // Constructor
    // ─────────────────────────────────────────────────────────────

    constructor() {
        // Wait for Geometry OS app to be ready
        if (window.geometryOSApp) {
            this.#app = window.geometryOSApp;
            this.#init();
        } else {
            // Listen for the geometry-os-ready event
            window.addEventListener('geometry-os-ready', () => {
                this.#app = window.geometryOSApp;
                this.#init();
            });

            // Also check periodically as fallback
            const checkInterval = setInterval(() => {
                if (window.geometryOSApp) {
                    this.#app = window.geometryOSApp;
                    this.#init();
                    clearInterval(checkInterval);
                }
            }, 100);

            // Stop checking after 5 seconds
            setTimeout(() => clearInterval(checkInterval), 5000);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Private Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Initialize the BuilderPanel
     * @private
     */
    #init() {
        this.#createContainer();
        this.#injectStyles();
        this.#render();
        this.#setupEventListeners();

        // Initialize connection manager (Phase J.2)
        if (typeof TileConnectionManager !== 'undefined') {
            this.#connectionManager = new TileConnectionManager();
            console.log('BuilderPanel: TileConnectionManager initialized');
        }

        this.logAction('Builder Panel initialized', 'success');
        console.log('BuilderPanel: Initialized successfully');
    }

    /**
     * Create the main container element
     * @private
     */
    #createContainer() {
        this.#container = document.createElement('div');
        this.#container.id = 'builder-panel';
        this.#container.className = 'builder-panel';
        document.body.appendChild(this.#container);
    }

    /**
     * Inject the CSS stylesheet
     * @private
     */
    #injectStyles() {
        // Check if styles already injected
        if (document.getElementById('builder-panel-styles')) {
            return;
        }

        const link = document.createElement('link');
        link.id = 'builder-panel-styles';
        link.rel = 'stylesheet';
        link.href = 'BuilderPanel.css';
        document.head.appendChild(link);
    }

    /**
     * Render the panel HTML
     * @private
     */
    #render() {
        this.#container.innerHTML = `
            <div class="builder-panel-header">
                <h3><span class="status-indicator ready"></span>AI Builder Panel</h3>
                <div class="builder-panel-controls">
                    <button class="builder-panel-btn" id="builder-minimize" title="Minimize">_</button>
                    <button class="builder-panel-btn" id="builder-close" title="Close">&times;</button>
                </div>
            </div>

            <div class="builder-tabs">
                <div class="builder-tab active" data-tab="tiles" tabindex="0">Tiles</div>
                <div class="builder-tab" data-tab="shaders" tabindex="0">Shaders</div>
                <div class="builder-tab" data-tab="cartridges" tabindex="0">Cartridges</div>
            </div>

            <div class="builder-tab-content active" data-content="tiles">
                <div class="tile-palette">
                    <div class="tile-button" data-tile="empty" tabindex="0">
                        <span class="tile-icon">&#11036;</span>
                        <span class="tile-label">Empty</span>
                    </div>
                    <div class="tile-button selected" data-tile="system" tabindex="0">
                        <span class="tile-icon">&#9881;</span>
                        <span class="tile-label">System</span>
                    </div>
                    <div class="tile-button" data-tile="data" tabindex="0">
                        <span class="tile-icon">&#128202;</span>
                        <span class="tile-label">Data</span>
                    </div>
                    <div class="tile-button" data-tile="code" tabindex="0">
                        <span class="tile-icon">&#128187;</span>
                        <span class="tile-label">Code</span>
                    </div>
                    <div class="tile-button" data-tile="cartridge" tabindex="0">
                        <span class="tile-icon">&#128230;</span>
                        <span class="tile-label">Cartridge</span>
                    </div>
                    <div class="tile-button" data-tile="nursery" tabindex="0">
                        <span class="tile-icon">&#127807;</span>
                        <span class="tile-label">Nursery</span>
                    </div>
                </div>
                <div class="tile-hint">
                    <strong>Tip:</strong> Click on the Infinite Map to place selected tile type
                </div>
            </div>

            <div class="builder-tab-content" data-content="shaders">
                <div class="shader-controls">
                    <button id="builder-load-shader" tabindex="0">Load WGSL Shader</button>
                    <button id="builder-evolve-shader" tabindex="0">Evolve Shader</button>
                    <button id="builder-preview-shader" tabindex="0">Preview</button>
                </div>
                <div class="shader-status">
                    Current Shader: <span id="current-shader-name">none</span><br>
                    Status: <span id="shader-status-text">No shader loaded</span>
                </div>
            </div>

            <div class="builder-tab-content" data-content="cartridges">
                <div class="cartridge-controls">
                    <button id="builder-select-region" tabindex="0">Select Region</button>
                    <button id="builder-add-files" tabindex="0">Add Files</button>
                    <button id="builder-assemble" tabindex="0">Assemble Cartridge</button>
                    <button id="builder-boot-test" tabindex="0">Boot Test</button>
                </div>
                <div class="cartridge-status">
                    Files: <span id="cartridge-file-count">0</span> |
                    Size: <span id="cartridge-size">0 KB</span>
                </div>
            </div>

            <div class="action-log" id="builder-action-log">
                <div class="action-log-title">Action Log</div>
            </div>

            <div class="quick-actions">
                <button class="quick-action-btn primary" id="builder-preview" tabindex="0">Preview</button>
                <button class="quick-action-btn" id="builder-undo" tabindex="0">Undo</button>
                <button class="quick-action-btn danger" id="builder-clear" tabindex="0">Clear</button>
                <button class="quick-action-btn" id="builder-save" tabindex="0">Save</button>
            </div>
        `;
    }

    /**
     * Set up event listeners for UI interactions
     * @private
     */
    #setupEventListeners() {
        // Tab switching
        this.#container.querySelectorAll('.builder-tab').forEach(tab => {
            tab.addEventListener('click', () => this.#switchTab(tab.dataset.tab));
            tab.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.#switchTab(tab.dataset.tab);
                }
            });
        });

        // Tile selection
        this.#container.querySelectorAll('.tile-button').forEach(btn => {
            btn.addEventListener('click', () => this.#selectTile(btn.dataset.tile));
            btn.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.#selectTile(btn.dataset.tile);
                }
            });
        });

        // Header buttons
        const minimizeBtn = document.getElementById('builder-minimize');
        const closeBtn = document.getElementById('builder-close');
        if (minimizeBtn) {
            minimizeBtn.addEventListener('click', () => this.#toggleMinimize());
        }
        if (closeBtn) {
            closeBtn.addEventListener('click', () => this.#hide());
        }

        // Quick actions
        const previewBtn = document.getElementById('builder-preview');
        const undoBtn = document.getElementById('builder-undo');
        const clearBtn = document.getElementById('builder-clear');
        const saveBtn = document.getElementById('builder-save');

        if (previewBtn) previewBtn.addEventListener('click', () => this.preview());
        if (undoBtn) undoBtn.addEventListener('click', () => this.undo());
        if (clearBtn) clearBtn.addEventListener('click', () => this.clear());
        if (saveBtn) saveBtn.addEventListener('click', () => this.save());

        // Shader buttons
        const loadShaderBtn = document.getElementById('builder-load-shader');
        const evolveShaderBtn = document.getElementById('builder-evolve-shader');
        const previewShaderBtn = document.getElementById('builder-preview-shader');

        if (loadShaderBtn) {
            loadShaderBtn.addEventListener('click', () => {
                this.logAction('Load shader button clicked (use WebMCP builder_load_shader tool)', 'info');
            });
        }
        if (evolveShaderBtn) {
            evolveShaderBtn.addEventListener('click', () => {
                this.logAction('Evolve shader button clicked (use WebMCP builder_evolve_shader tool)', 'info');
            });
        }
        if (previewShaderBtn) {
            previewShaderBtn.addEventListener('click', () => {
                this.preview();
            });
        }

        // Cartridge buttons
        const selectRegionBtn = document.getElementById('builder-select-region');
        const addFilesBtn = document.getElementById('builder-add-files');
        const assembleBtn = document.getElementById('builder-assemble');
        const bootTestBtn = document.getElementById('builder-boot-test');

        if (selectRegionBtn) {
            selectRegionBtn.addEventListener('click', () => {
                this.logAction('Select region button clicked', 'info');
            });
        }
        if (addFilesBtn) {
            addFilesBtn.addEventListener('click', () => {
                this.logAction('Add files button clicked', 'info');
            });
        }
        if (assembleBtn) {
            assembleBtn.addEventListener('click', () => {
                this.logAction('Assemble cartridge button clicked', 'info');
            });
        }
        if (bootTestBtn) {
            bootTestBtn.addEventListener('click', async () => {
                this.logAction('Boot test initiated...', 'info');

                if (typeof window.GPUExecutionSystem === 'undefined') {
                    this.logAction('Error: GPUExecutionSystem not found. Is gpu_execution_system.js loaded?', 'error');
                    return;
                }

                try {
                    // Check for WebGPUSemanticManager dependnecy
                    if (typeof window.WebGPUSemanticManager === 'undefined') {
                        this.logAction('Error: WebGPUSemanticManager not found.', 'error');
                        return;
                    }

                    // Get WebGPU device from app
                    if (!this.#app?.renderer?.device) {
                        // Fallback: Try to get device if app isn't explicitly exposing it yet
                        // In a real scenario, we'd ensure the app exposes the device. 
                        // For now, let's assume if we are here, we might need to rely on the system to provide it or fail.
                        // But actually, we can try to init one if needed, but GPUExecutionSystem expects one.
                        // Let's assume window.geometryOSApp.renderer.device exists as per architecture.
                        this.logAction('Warning: WebGPU Device not found in #app.renderer.device. Attempting fallback...', 'warn');
                    }

                    const device = this.#app?.renderer?.device;
                    if (!device) {
                        this.logAction('Critical: No WebGPU Device available.', 'error');
                        return;
                    }

                    // Initialize System
                    // Note: dictionary is required by constructor but we might pass null for now if not using semantic features immediately
                    const gpuSystem = new window.GPUExecutionSystem(device, null);
                    await gpuSystem.initialize();

                    // Deploy Kernel
                    // We assume 'linux_kernel.rts.png' is available in the root or accessible path
                    const kernelUrl = 'linux_kernel.rts.png';
                    this.logAction(`Deploying kernel from ${kernelUrl}...`, 'info');

                    await gpuSystem.deploy(kernelUrl, 'linux_kernel_0');

                    this.logAction('Kernel Deployed! Starting execution tick...', 'success');

                    // Run a few ticks to verify
                    await gpuSystem.tick('linux_kernel_0', 10);

                    const state = await gpuSystem.readState('linux_kernel_0');
                    this.logAction(`CPU State: PC=${state.pc}, Halted=${state.halted}`, 'info');

                } catch (e) {
                    this.logAction(`Boot failed: ${e.message}`, 'error');
                    console.error(e);
                }
            });
        }

        // Map click for tile placement
        if (this.#app?.worldContainer) {
            this.#app.worldContainer.eventMode = 'static';
            this.#app.worldContainer.on('pointerdown', (e) => {
                if (this.#selectedTileType) {
                    const pos = e.data.global;
                    const gridSize = this.#app.config?.gridSize || 100;
                    const gridX = Math.floor(pos.x / gridSize);
                    const gridY = Math.floor(pos.y / gridSize);
                    this.placeTile(this.#selectedTileType, gridX, gridY);
                }
            });
        }
    }

    /**
     * Switch to a different tab
     * @param {string} tabName
     * @private
     */
    #switchTab(tabName) {
        // Update tab buttons
        this.#container.querySelectorAll('.builder-tab').forEach(t => {
            t.classList.remove('active');
        });
        const activeTab = this.#container.querySelector(`.builder-tab[data-tab="${tabName}"]`);
        if (activeTab) {
            activeTab.classList.add('active');
        }

        // Update tab content
        this.#container.querySelectorAll('.builder-tab-content').forEach(c => {
            c.classList.remove('active');
        });
        const activeContent = this.#container.querySelector(`.builder-tab-content[data-content="${tabName}"]`);
        if (activeContent) {
            activeContent.classList.add('active');
        }

        this.logAction(`Switched to ${tabName} tab`, 'info');
    }

    /**
     * Select a tile type
     * @param {string} tileType
     * @private
     */
    #selectTile(tileType) {
        this.#selectedTileType = tileType;

        // Update UI
        this.#container.querySelectorAll('.tile-button').forEach(b => {
            b.classList.remove('selected');
        });
        const selectedBtn = this.#container.querySelector(`.tile-button[data-tile="${tileType}"]`);
        if (selectedBtn) {
            selectedBtn.classList.add('selected');
        }

        this.logAction(`Selected tile type: ${tileType}`, 'info');
    }

    /**
     * Toggle minimized state
     * @private
     */
    #toggleMinimize() {
        this.#minimized = !this.#minimized;
        this.#container.classList.toggle('minimized', this.#minimized);

        const btn = document.getElementById('builder-minimize');
        if (btn) {
            btn.textContent = this.#minimized ? '+' : '_';
        }
    }

    /**
     * Hide the panel
     * @private
     */
    #hide() {
        this.#container.style.display = 'none';
        this.logAction('Panel hidden (call show() to restore)', 'info');
    }

    /**
     * Render a tile on the PixiJS canvas
     * @param {Object} tile
     * @private
     */
    #renderTile(tile) {
        if (!this.#app?.worldContainer) {
            console.warn('BuilderPanel: No world container available for tile rendering');
            return;
        }

        // Check for PIXI availability
        if (typeof PIXI === 'undefined') {
            console.warn('BuilderPanel: PIXI not available');
            return;
        }

        // Create a PixiJS Graphics object for the tile
        const graphics = new PIXI.Graphics();

        const color = this.#tileColors[tile.type] || 0x666666;
        const gridSize = this.#app.config?.gridSize || 100;
        const x = tile.x * gridSize;
        const y = tile.y * gridSize;
        const size = tile.size || gridSize;

        // Draw tile rectangle with border
        graphics.rect(x, y, size, size);
        graphics.fill({ color: color, alpha: 0.3 });
        graphics.stroke({ color: color, width: 2, alpha: 1 });

        // Add label using PIXI.Text (v8 API)
        const label = new PIXI.Text({
            text: tile.type,
            style: {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: color
            }
        });
        label.x = x + 5;
        label.y = y + 5;
        graphics.addChild(label);

        // Store reference for later removal
        graphics.tileId = tile.tile_id;
        this.#app.worldContainer.addChild(graphics);

        // Keep reference in tile data
        tile.graphics = graphics;
    }

    // ─────────────────────────────────────────────────────────────
    // Public API Methods (called by WebMCP tools)
    // ─────────────────────────────────────────────────────────────

    /**
     * Show the panel
     * @returns {Object}
     */
    show() {
        this.#container.style.display = 'flex';
        this.logAction('Panel shown', 'success');
        return { success: true, message: 'BuilderPanel visible' };
    }

    /**
     * Place a tile on the map
     * @param {string} tileType - Type of tile to place
     * @param {number} x - Grid X position
     * @param {number} y - Grid Y position
     * @param {Object} options - Optional settings (size, metadata)
     * @returns {Object} - Result with success, tile_id, position, size
     */
    placeTile(tileType, x, y, options = {}) {
        // Validate tile type
        if (!this.#validTileTypes.includes(tileType)) {
            const error = `Invalid tile_type: ${tileType}. Valid types: ${this.#validTileTypes.join(', ')}`;
            this.logAction(error, 'error');
            return { success: false, error };
        }

        // Validate coordinates
        if (typeof x !== 'number' || typeof y !== 'number' || isNaN(x) || isNaN(y)) {
            const error = `Invalid coordinates: x=${x}, y=${y}`;
            this.logAction(error, 'error');
            return { success: false, error };
        }

        // Generate unique tile ID
        const tileId = `tile_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        const size = options.size || (this.#app?.config?.gridSize || 100);

        // Create tile data
        const tile = {
            tile_id: tileId,
            type: tileType,
            x: x,
            y: y,
            size: size,
            metadata: options.metadata || {},
            created_at: new Date().toISOString()
        };

        // Store tile
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
            size: size
        };
    }

    /**
     * Load a shader into the editor
     * @param {string} name - Shader name
     * @param {string} wgslCode - WGSL shader code
     * @returns {Object} - Result with success, shader_id, name, preview_ready
     */
    loadShader(name, wgslCode) {
        if (!name || typeof name !== 'string') {
            const error = 'Invalid shader name';
            this.logAction(error, 'error');
            return { success: false, error };
        }

        if (!wgslCode || typeof wgslCode !== 'string') {
            const error = 'Invalid WGSL code';
            this.logAction(error, 'error');
            return { success: false, error };
        }

        const shaderId = `shader_${Date.now()}`;

        this.#currentShader = {
            shader_id: shaderId,
            name: name,
            code: wgslCode,
            evolved: false,
            loaded_at: new Date().toISOString()
        };

        // Update UI
        const nameEl = document.getElementById('current-shader-name');
        const statusEl = document.getElementById('shader-status-text');
        if (nameEl) nameEl.textContent = name;
        if (statusEl) statusEl.textContent = 'Loaded, ready to preview';

        this.logAction(`Loaded shader '${name}' (${wgslCode.length} chars)`, 'success');

        return {
            success: true,
            shader_id: shaderId,
            name: name,
            preview_ready: true
        };
    }

    /**
     * Log an action to the Action Log
     * @param {string} message - Action message
     * @param {string} status - Status: 'success', 'error', or 'info'
     */
    logAction(message, status = 'info') {
        const timestamp = new Date().toLocaleTimeString();
        const entry = { timestamp, message, status };
        this.#actionLog.push(entry);

        // Update UI
        const logContainer = document.getElementById('builder-action-log');
        if (logContainer) {
            const div = document.createElement('div');
            div.className = `action-log-entry ${status}`;

            const timestampSpan = document.createElement('span');
            timestampSpan.className = 'timestamp';
            timestampSpan.textContent = timestamp;
            div.appendChild(timestampSpan);

            div.appendChild(document.createTextNode(message));
            logContainer.appendChild(div);

            // Auto-scroll to bottom
            logContainer.scrollTop = logContainer.scrollHeight;

            // Limit log entries
            while (logContainer.children.length > 50) {
                logContainer.removeChild(logContainer.children[1]); // Keep title
            }
        }

        console.log(`BuilderPanel [${status}]: ${message}`);
    }

    /**
     * Get current builder state
     * @returns {Object} - State with tiles, current_shader, selected_tile_type
     */
    getState() {
        return {
            tiles: Array.from(this.#placedTiles.values()).map(t => ({
                tile_id: t.tile_id,
                type: t.type,
                position: { x: t.x, y: t.y },
                size: t.size
            })),
            current_shader: this.#currentShader ? {
                shader_id: this.#currentShader.shader_id,
                name: this.#currentShader.name,
                evolved: this.#currentShader.evolved
            } : null,
            selected_tile_type: this.#selectedTileType,
            tile_count: this.#placedTiles.size
        };
    }

    /**
     * Preview current build
     * @returns {Object} - Result with success, message
     */
    preview() {
        const state = this.getState();
        this.logAction(`Preview: ${state.tile_count} tiles, shader: ${state.current_shader?.name || 'none'}`, 'success');
        return {
            success: true,
            message: `Preview captured - ${state.tile_count} tiles visible`,
            tile_count: state.tile_count
        };
    }

    /**
     * Undo last tile placement
     * @returns {Object} - Result with success
     */
    undo() {
        const tiles = Array.from(this.#placedTiles.values());
        if (tiles.length > 0) {
            const lastTile = tiles[tiles.length - 1];
            this.#placedTiles.delete(lastTile.tile_id);

            // Remove visual
            if (lastTile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(lastTile.graphics);
            }

            this.logAction(`Undid tile '${lastTile.type}' at (${lastTile.x}, ${lastTile.y})`, 'info');
            return { success: true, removed_tile: lastTile.tile_id };
        }

        this.logAction('Nothing to undo', 'info');
        return { success: false, message: 'Nothing to undo' };
    }

    /**
     * Clear all placed tiles
     * @returns {Object} - Result with success, cleared_count
     */
    clear() {
        const count = this.#placedTiles.size;

        // Remove all visuals
        this.#placedTiles.forEach(tile => {
            if (tile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(tile.graphics);
            }
        });

        // Clear storage
        this.#placedTiles.clear();

        this.logAction(`Cleared ${count} tiles`, 'info');
        return { success: true, cleared_count: count };
    }

    /**
     * Save current build state as JSON download
     * @returns {Object} - Result with success, tiles_saved
     */
    save() {
        const state = this.getState();
        const saveData = {
            version: '1.0.0',
            saved_at: new Date().toISOString(),
            ...state
        };

        const json = JSON.stringify(saveData, null, 2);

        // Create download
        const blob = new Blob([json], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `builder_state_${Date.now()}.json`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        this.logAction(`Saved build state (${state.tile_count} tiles)`, 'success');
        return { success: true, tiles_saved: state.tile_count };
    }

    // ─────────────────────────────────────────────────────
    // Phase J.2: Neural IDE - Tile Connections
    // ─────────────────────────────────────────────────────

    /**
     * Connect two tiles
     * @param {string} sourceTileId - Source tile ID
     * @param {string} targetTileId - Target tile ID
     * @param {string} connectionType - Type: data_flow, command_flow, debug_flow, nav_flow
     * @returns {Object} - Result with success and connection_id
     */
    connectTiles(sourceTileId, targetTileId, connectionType) {
        if (!this.#connectionManager) {
            const error = 'TileConnectionManager not initialized';
            this.logAction(error, 'error');
            return { success: false, error };
        }

        // Verify tiles exist
        if (!this.#placedTiles.has(sourceTileId)) {
            const error = `Source tile not found: ${sourceTileId}`;
            this.logAction(error, 'error');
            return { success: false, error };
        }

        if (!this.#placedTiles.has(targetTileId)) {
            const error = `Target tile not found: ${targetTileId}`;
            this.logAction(error, 'error');
            return { success: false, error };
        }

        const result = this.#connectionManager.addConnection(sourceTileId, targetTileId, connectionType);

        if (result.success) {
            this.logAction(`Connected ${sourceTileId} → ${targetTileId} (${connectionType})`, 'success');
        } else {
            this.logAction(`Connection failed: ${result.error}`, 'error');
        }

        return result;
    }

    /**
     * Remove a connection between tiles
     * @param {string} connectionId - Connection ID to remove
     * @returns {Object} - Result with success
     */
    removeConnection(connectionId) {
        if (!this.#connectionManager) {
            return { success: false, error: 'TileConnectionManager not initialized' };
        }

        const result = this.#connectionManager.removeConnection(connectionId);

        if (result.success) {
            this.logAction(`Removed connection ${connectionId}`, 'success');
        }

        return result;
    }

    /**
     * Get all connections for a tile
     * @param {string} tileId - Tile ID
     * @returns {Object[]} - Array of connections
     */
    getTileConnections(tileId) {
        if (!this.#connectionManager) {
            return [];
        }
        return this.#connectionManager.getTileConnections(tileId);
    }

    /**
     * Get full IDE state including connections
     * @returns {Object} - Complete IDE state
     */
    getIDEState() {
        return {
            tiles: Array.from(this.#placedTiles.values()),
            connections: this.#connectionManager?.getAllConnections() || [],
            tile_count: this.#placedTiles.size,
            connection_count: this.#connectionManager?.connectionCount || 0
        };
    }
}

// ─────────────────────────────────────────────────────────────
// Auto-initialize
// ─────────────────────────────────────────────────────────────

window.builderPanel = new BuilderPanel();

console.log('BuilderPanel loaded - AI-Driven Visual Builder ready.');
console.log('Access via: window.builderPanel');
