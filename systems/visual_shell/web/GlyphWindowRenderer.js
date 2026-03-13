/**
 * GlyphWindowRenderer.js
 *
 * Renders GPU Glyph VM apps as PixiJS windows with live glyph display.
 * Each app has a glyph grid that displays the app's visual output.
 *
 * Usage:
 *   import { GlyphWindowRenderer } from './GlyphWindowRenderer.js';
 *   const renderer = new GlyphWindowRenderer(client, pixiContainer);
 */

import { SpatialCoordinatorClient } from './SpatialCoordinatorClient.js';

export class GlyphWindowRenderer {
    constructor(client, container, options = {}, windowManager = null) {
        this.client = client;
        this.container = container;
        this.windowManager = windowManager;  // NEW: Optional WindowManager

        this.options = {
            borderWidth: 2,
            focusedBorderColor: 0x00FF00,
            unfocusedBorderColor: 0x444444,
            backgroundColor: 0x0a0a0f,
            titleBarHeight: 24,
            glyphWidth: 10,
            glyphHeight: 16,
            fontFamily: 'Courier New, monospace',
            fontSize: 12,
            textColor: 0x00ff88,
            ...options
        };

        this.windows = new Map();
        this.focusedAppId = null;

        this._setupEventHandlers();
        this._setupWindowManagerListeners();  // NEW
    }

    _setupEventHandlers() {
        // Handle app loading
        this.client.on('app_loaded', (app) => {
            this._createWindow(app);
        });

        // Handle app unloading
        this.client.on('app_unloaded', ({ appId }) => {
            this._destroyWindow(appId);
        });

        // Handle glyph updates (full grid)
        this.client.on('app_render', (data) => {
            this._renderGlyphs(data.app_id, data.glyphs);
        });

        // Handle single glyph update
        this.client.on('glyph_update', (data) => {
            this._updateGlyph(data.app_id, data.x, data.y, data.glyph);
        });

        // Handle frame ticks
        this.client.on('frame_tick', (data) => {
            // Could add visual feedback here
        });
    }

    // NEW: Listen to WindowManager events
    _setupWindowManagerListeners() {
        if (!this.windowManager) return;

        this.windowManager.on('window_moved', ({ appId, x, y }) => {
            const win = this.windows.get(appId);
            if (win) {
                win.container.x = x;
                win.container.y = y;
            }
        });

        this.windowManager.on('window_focused', ({ appId }) => {
            this._updateAllBorders();
        });

        this.windowManager.on('window_removed', ({ appId }) => {
            // Use existing _destroyWindow method
            this._destroyWindow(appId);
        });
    }

    _createWindow(app) {
        const { appId, x, y, width, height, flags, name } = app;
        const { titleBarHeight, backgroundColor, glyphWidth, glyphHeight } = this.options;

        // Get position from WindowManager if available
        let windowX = x;
        let windowY = y;
        if (this.windowManager) {
            const wmState = this.windowManager.addWindow(appId, width, height);
            windowX = wmState.x;
            windowY = wmState.y;
        }

        // Create container
        const windowContainer = new PIXI.Container();
        windowContainer.x = windowX;
        windowContainer.y = windowY;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(backgroundColor);
        bg.drawRect(0, 0, width * glyphWidth, height * glyphHeight + titleBarHeight);
        bg.endFill();
        windowContainer.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x16213e);
        titleBar.drawRect(0, 0, width * glyphWidth, titleBarHeight);
        titleBar.endFill();
        titleBar.eventMode = 'static';
        windowContainer.addChild(titleBar);

        // Title text
        const displayName = name || `App ${appId}`;
        const titleText = new PIXI.Text(displayName, {
            fontFamily: this.options.fontFamily,
            fontSize: 12,
            fill: 0xFFFFFF,
        });
        titleText.x = 8;
        titleText.y = (titleBarHeight - titleText.height) / 2;
        windowContainer.addChild(titleText);

        // Close button [X]
        const closeBtn = new PIXI.Text('[X]', {
            fontFamily: this.options.fontFamily,
            fontSize: 12,
            fill: 0xff4444,
        });
        closeBtn.x = width * glyphWidth - closeBtn.width - 8;
        closeBtn.y = (titleBarHeight - closeBtn.height) / 2;
        closeBtn.eventMode = 'static';
        closeBtn.cursor = 'pointer';
        closeBtn.on('pointerover', () => { closeBtn.style.fill = 0xff0000; });
        closeBtn.on('pointerout', () => { closeBtn.style.fill = 0xff4444; });
        closeBtn.on('pointerdown', (e) => { e.stopPropagation(); this._closeWindow(appId); });
        windowContainer.addChild(closeBtn);

        // Capability indicators
        const wantsKeyboard = flags & 0x01;
        const wantsMouse = flags & 0x02;
        const caps = [];
        if (wantsKeyboard) caps.push('K');
        if (wantsMouse) caps.push('M');
        if (caps.length > 0) {
            const capsText = new PIXI.Text(caps.join(' '), {
                fontFamily: this.options.fontFamily,
                fontSize: 10,
                fill: 0x88ff88,
            });
            capsText.x = width * glyphWidth - capsText.width - 40;
            capsText.y = (titleBarHeight - capsText.height) / 2;
            windowContainer.addChild(capsText);
        }

        // Glyph display area
        const glyphArea = new PIXI.Container();
        glyphArea.y = titleBarHeight;
        const glyphText = new PIXI.Text('', {
            fontFamily: this.options.fontFamily,
            fontSize: this.options.fontSize,
            fill: this.options.textColor,
            leading: 2,
        });
        glyphArea.addChild(glyphText);
        windowContainer.addChild(glyphArea);

        // Border
        const border = new PIXI.Graphics();
        const isFocused = this.windowManager?.getWindow(appId)?.focused ?? (this.focusedAppId === appId);
        this._drawBorder(border, width * glyphWidth, height * glyphHeight + titleBarHeight, isFocused);
        windowContainer.addChild(border);

        // Add to container
        this.container.addChild(windowContainer);

        // Interactive - title bar drag
        titleBar.on('pointerdown', (e) => {
            if (this.windowManager) {
                this.windowManager.startDrag(appId, e.global.x, e.global.y);
            } else {
                this._focusWindow(appId);
            }
        });

        // Interactive - window click
        windowContainer.eventMode = 'static';
        windowContainer.on('pointerdown', (e) => {
            if (this.windowManager) {
                this.windowManager.focusWindow(appId);
            } else {
                this._focusWindow(appId);
            }
            if (wantsMouse) {
                const localX = Math.floor((e.global.x - windowX) / glyphWidth);
                const localY = Math.floor((e.global.y - windowY - titleBarHeight) / glyphHeight);
                if (localY >= 0 && localY < height && localX >= 0 && localX < width) {
                    this.client.sendMouseButton(0, localX, localY);
                }
            }
        });

        // Store reference
        this.windows.set(appId, {
            container: windowContainer,
            border,
            glyphText,
            closeBtn,
            app,
            glyphGrid: [],
        });

        // Initialize with empty grid
        this._initializeGlyphGrid(appId, width, height);
    }

    _initializeGlyphGrid(appId, width, height) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Fill with spaces
        win.glyphGrid = Array(height).fill(null).map(() =>
            Array(width).fill(32)  // Space character
        );
        this._updateGlyphText(appId);
    }

    _destroyWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        this.container.removeChild(win.container);
        win.container.destroy({ children: true });
        this.windows.delete(appId);
    }

    _closeWindow(appId) {
        if (this.windowManager) {
            this.windowManager.removeWindow(appId);
        }
        this.client.send({ type: 'unload_app', app_id: appId });
    }

    _updateAllBorders() {
        for (const [appId, win] of this.windows) {
            const isFocused = this.windowManager?.getWindow(appId)?.focused ?? (this.focusedAppId === appId);
            this._updateBorder(appId, isFocused);
        }
    }

    _renderGlyphs(appId, glyphs) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Update glyph grid from 2D array
        win.glyphGrid = glyphs.map(row => [...row]);
        this._updateGlyphText(appId);
    }

    _updateGlyph(appId, x, y, glyph) {
        const win = this.windows.get(appId);
        if (!win) return;

        if (y >= 0 && y < win.glyphGrid.length &&
            x >= 0 && x < win.glyphGrid[0].length) {
            win.glyphGrid[y][x] = glyph;
            this._updateGlyphText(appId);
        }
    }

    _updateGlyphText(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Convert grid to string
        const lines = win.glyphGrid.map(row =>
            row.map(code => String.fromCharCode(code)).join('')
        );
        win.glyphText.text = lines.join('\n');
    }

    _focusWindow(appId) {
        const oldFocus = this.focusedAppId;
        this.focusedAppId = appId;

        // Update border styles
        if (oldFocus !== null) {
            this._updateBorder(oldFocus, false);
        }
        this._updateBorder(appId, true);

        // Bring to front
        const win = this.windows.get(appId);
        if (win) {
            this.container.removeChild(win.container);
            this.container.addChild(win.container);
        }
    }

    _updateBorder(appId, focused) {
        const win = this.windows.get(appId);
        if (!win) return;

        const { glyphWidth, glyphHeight, titleBarHeight } = this.options;
        const { width, height } = win.app;

        win.border.clear();
        this._drawBorder(
            win.border,
            width * glyphWidth,
            height * glyphHeight + titleBarHeight,
            focused
        );
    }

    _drawBorder(graphics, w, h, focused) {
        const { borderWidth, focusedBorderColor, unfocusedBorderColor } = this.options;
        graphics.lineStyle(
            borderWidth,
            focused ? focusedBorderColor : unfocusedBorderColor
        );
        graphics.drawRect(0, 0, w, h);
    }

    /**
     * Route keyboard event to focused app.
     */
    handleKeyboard(event) {
        // Let command palette handle backtick
        if (event.keyCode === 192) {  // Backtick
            return;
        }

        // Use WindowManager focus if available
        const focusedId = this.windowManager?.getFocusedApp() ?? this.focusedAppId;
        if (focusedId === null) return;

        const win = this.windows.get(focusedId);
        if (!win) return;

        if (!(win.app.flags & 0x01)) return;

        this.client.sendKeyboardEvent(event.keyCode, 0, 0);
    }

    destroy() {
        for (const appId of this.windows.keys()) {
            this._destroyWindow(appId);
        }
    }
}


/**
 * Create a complete glyph app visualization.
 * Connects to the Glyph VM Bridge and renders all apps.
 */
export async function createGlyphDesktop(containerId, bridgeUrl = 'ws://localhost:8770') {
    // Import PixiJS
    const PIXI = await import('https://cdn.skypack.dev/pixi.js@7');

    // Import components
    const { WindowManager } = await import('./WindowManager.js');
    const { CommandPalette } = await import('./CommandPalette.js');

    // Create PixiJS application
    const app = new PIXI.Application({
        width: window.innerWidth,
        height: window.innerHeight,
        backgroundColor: 0x0f0f1a,
        antialias: true,
    });

    const container = document.getElementById(containerId);
    if (container) {
        container.appendChild(app.view);
    }

    // Create client
    const client = new SpatialCoordinatorClient(bridgeUrl);

    // Create WindowManager
    const windowManager = new WindowManager();

    // Create renderer with WindowManager
    const renderer = new GlyphWindowRenderer(client, app.stage, {}, windowManager);

    // Create CommandPalette
    const commandPalette = new CommandPalette(client);
    commandPalette.addToContainer(app.stage);

    // Handle app list from server
    client.on('app_list', (data) => {
        commandPalette.setApps(data.apps);
    });

    // Handle window dragging
    app.stage.eventMode = 'static';
    app.stage.hitArea = app.screen;

    app.stage.on('pointermove', (e) => {
        if (windowManager.isDragging()) {
            windowManager.updateDrag(e.global.x, e.global.y);
        }
    });

    app.stage.on('pointerup', () => {
        windowManager.endDrag();
    });

    app.stage.on('pointerupoutside', () => {
        windowManager.endDrag();
    });

    // Connect
    client.connect();

    // Handle keyboard (skip if command palette is visible)
    window.addEventListener('keydown', (e) => {
        if (commandPalette.visible && e.keyCode !== 27 && e.keyCode !== 192) {
            return; // Let command palette handle it
        }
        renderer.handleKeyboard(e);
    });

    // Handle resize
    window.addEventListener('resize', () => {
        app.renderer.resize(window.innerWidth, window.innerHeight);
    });

    return { app, client, renderer, windowManager, commandPalette };
}
