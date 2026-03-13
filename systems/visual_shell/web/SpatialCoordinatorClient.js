/**
 * SpatialCoordinatorClient.js
 *
 * WebSocket client for the Spatial Program Coordinator.
 * Manages app regions as visual windows on the PixiJS desktop.
 *
 * Usage:
 *   const client = new SpatialCoordinatorClient('ws://localhost:8769');
 *   client.connect();
 *   client.on('app_loaded', (app) => {
 *     // Create visual window for app
 *   });
 */

export class SpatialCoordinatorClient extends PIXI.utils.EventEmitter {
    constructor(url = 'ws://localhost:8769') {
        super();

        this.url = url;
        this.ws = null;
        this.connected = false;
        this.apps = new Map();  // app_id -> {x, y, width, height, flags}
        this.focusedAppId = null;
        this.frameCount = 0;

        // Reconnection settings
        this._reconnectDelay = 1000;
        this._maxReconnectDelay = 30000;
        this._reconnectAttempts = 0;
    }

    connect() {
        if (this.ws) {
            this.ws.close();
        }

        try {
            this.ws = new WebSocket(this.url);

            this.ws.onopen = () => {
                this.connected = true;
                this._reconnectAttempts = 0;
                this._reconnectDelay = 1000;
                console.log('[SpatialCoordinator] Connected to', this.url);
                this.emit('connected');
            };

            this.ws.onmessage = (event) => {
                try {
                    const message = JSON.parse(event.data);
                    this._handleMessage(message);
                } catch (e) {
                    console.error('[SpatialCoordinator] Failed to parse message:', e);
                }
            };

            this.ws.onclose = () => {
                this.connected = false;
                this.emit('disconnected');
                console.log('[SpatialCoordinator] Disconnected');

                // Auto-reconnect
                this._scheduleReconnect();
            };

            this.ws.onerror = (error) => {
                console.error('[SpatialCoordinator] WebSocket error:', error);
                this.emit('error', error);
            };

        } catch (e) {
            console.error('[SpatialCoordinator] Failed to connect:', e);
            this._scheduleReconnect();
        }
    }

    _scheduleReconnect() {
        if (this._reconnectTimer) return;

        this._reconnectAttempts++;
        const delay = Math.min(
            this._reconnectDelay * Math.pow(2, this._reconnectAttempts - 1),
            this._maxReconnectDelay
        );

        console.log(`[SpatialCoordinator] Reconnecting in ${delay}ms (attempt ${this._reconnectAttempts})`);

        this._reconnectTimer = setTimeout(() => {
            this._reconnectTimer = null;
            this.connect();
        }, delay);
    }

    _handleMessage(message) {
        const { type, data } = message;

        switch (type) {
            case 'app_loaded':
                this._onAppLoaded(data);
                break;

            case 'app_unloaded':
                this._onAppUnloaded(data);
                break;

            case 'focus_changed':
                this._onFocusChanged(data);
                break;

            case 'frame_tick':
                this._onFrameTick(data);
                break;

            default:
                console.debug('[SpatialCoordinator] Unknown message type:', type);
        }
    }

    _onAppLoaded(data) {
        const { app_id, x, y, width, height, flags } = data;

        this.apps.set(app_id, { x, y, width, height, flags });

        console.log(`[SpatialCoordinator] App ${app_id} loaded at (${x}, ${y}) ${width}x${height}`);

        this.emit('app_loaded', {
            appId: app_id,
            x, y, width, height,
            flags,
            wantsKeyboard: !!(flags & 0x01),
            wantsMouse: !!(flags & 0x02),
        });
    }

    _onAppUnloaded(data) {
        const { app_id } = data;

        if (this.apps.has(app_id)) {
            this.apps.delete(app_id);
            console.log(`[SpatialCoordinator] App ${app_id} unloaded`);
            this.emit('app_unloaded', { appId: app_id });
        }
    }

    _onFocusChanged(data) {
        const { app_id } = data;
        const oldFocus = this.focusedAppId;

        this.focusedAppId = app_id;

        console.log(`[SpatialCoordinator] Focus changed: ${oldFocus} -> ${app_id}`);

        this.emit('focus_changed', {
            appId: app_id,
            previousId: oldFocus,
        });
    }

    _onFrameTick(data) {
        const { frame, app_count } = data;
        this.frameCount = frame;
        this.emit('frame_tick', { frame, appCount: app_count });
    }

    // --- Outgoing messages ---

    sendInterrupt(type, payload, x, y, source = 0) {
        if (!this.connected) return false;

        const message = {
            type: 'interrupt',
            data: {
                interrupt_type: type,  // 'keyboard' or 'mouse'
                payload,
                x,
                y,
                source,
            }
        };

        this.ws.send(JSON.stringify(message));
        return true;
    }

    sendKeyboardEvent(keyCode, x, y) {
        return this.sendInterrupt('keyboard', keyCode, x, y);
    }

    sendMouseButton(button, x, y) {
        return this.sendInterrupt('mouse', button, x, y);
    }

    requestTick() {
        if (!this.connected) return false;

        this.ws.send(JSON.stringify({ type: 'tick' }));
        return true;
    }

    loadApp(binaryBase64) {
        if (!this.connected) return false;

        this.ws.send(JSON.stringify({
            type: 'load_app',
            data: { binary: binaryBase64 }
        }));
        return true;
    }

    unloadApp(appId) {
        if (!this.connected) return false;

        this.ws.send(JSON.stringify({
            type: 'unload_app',
            data: { app_id: appId }
        }));
        return true;
    }

    // --- Utility methods ---

    getAppAt(x, y) {
        for (const [appId, region] of this.apps) {
            if (x >= region.x && x < region.x + region.width &&
                y >= region.y && y < region.y + region.height) {
                return appId;
            }
        }
        return null;
    }

    getAppRegion(appId) {
        return this.apps.get(appId) || null;
    }

    disconnect() {
        if (this._reconnectTimer) {
            clearTimeout(this._reconnectTimer);
            this._reconnectTimer = null;
        }

        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        this.connected = false;
    }
}


/**
 * SpatialWindowRenderer
 *
 * Renders Spatial Coordinator apps as PixiJS windows.
 * Attach to a SpatialCoordinatorClient to auto-render.
 */
export class SpatialWindowRenderer {
    constructor(client, container, options = {}) {
        this.client = client;
        this.container = container;
        this.options = {
            borderWidth: 2,
            focusedBorderColor: 0x00FF00,
            unfocusedBorderColor: 0x444444,
            backgroundColor: 0x1a1a2e,
            titleBarHeight: 24,
            ...options
        };

        this.windows = new Map();  // appId -> { graphics, app }

        this._setupEventHandlers();
    }

    _setupEventHandlers() {
        this.client.on('app_loaded', (app) => {
            this._createWindow(app);
        });

        this.client.on('app_unloaded', ({ appId }) => {
            this._destroyWindow(appId);
        });

        this.client.on('focus_changed', ({ appId }) => {
            this._updateFocus(appId);
        });
    }

    _createWindow(app) {
        const { appId, x, y, width, height, wantsKeyboard, wantsMouse } = app;
        const { borderWidth, titleBarHeight, backgroundColor } = this.options;

        const graphics = new PIXI.Graphics();

        // Background
        graphics.beginFill(backgroundColor);
        graphics.drawRect(0, 0, width, height);
        graphics.endFill();

        // Title bar
        graphics.beginFill(0x16213e);
        graphics.drawRect(0, 0, width, titleBarHeight);
        graphics.endFill();

        // Title text
        const titleText = new PIXI.Text(`App ${appId}`, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xFFFFFF,
        });
        titleText.x = 8;
        titleText.y = (titleBarHeight - titleText.height) / 2;
        graphics.addChild(titleText);

        // Capability indicators
        const caps = [];
        if (wantsKeyboard) caps.push('K');
        if (wantsMouse) caps.push('M');
        if (caps.length > 0) {
            const capsText = new PIXI.Text(caps.join(' '), {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: 0x88ff88,
            });
            capsText.x = width - capsText.width - 8;
            capsText.y = (titleBarHeight - capsText.height) / 2;
            graphics.addChild(capsText);
        }

        // Position
        graphics.x = x;
        graphics.y = y;

        // Add to container
        this.container.addChild(graphics);

        // Store reference
        this.windows.set(appId, {
            graphics,
            app,
        });

        // Draw initial border
        this._drawBorder(appId, false);

        // Interactive
        graphics.eventMode = 'static';
        graphics.cursor = 'pointer';

        graphics.on('pointerdown', (e) => {
            // Convert global coords to app-local coords
            const localX = Math.floor(e.global.x - x);
            const localY = Math.floor(e.global.y - y);

            // If clicked in title bar, bring to front
            if (localY < titleBarHeight) {
                this._bringToFront(appId);
            }

            // Send mouse interrupt if app wants it
            if (wantsMouse) {
                this.client.sendMouseButton(0, x + localX, y + localY);
            }
        });
    }

    _destroyWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        this.container.removeChild(win.graphics);
        win.graphics.destroy();
        this.windows.delete(appId);
    }

    _updateFocus(focusedAppId) {
        // Update all window borders
        for (const [appId, win] of this.windows) {
            const isFocused = appId === focusedAppId;
            this._drawBorder(appId, isFocused);
        }
    }

    _drawBorder(appId, focused) {
        const win = this.windows.get(appId);
        if (!win) return;

        const { graphics, app } = win;
        const { width, height } = app;
        const { borderWidth, focusedBorderColor, unfocusedBorderColor } = this.options;

        // Remove old border
        const border = graphics.getChildByName('border');
        if (border) {
            graphics.removeChild(border);
            border.destroy();
        }

        // Draw new border
        const borderGraphics = new PIXI.Graphics();
        borderGraphics.name = 'border';
        borderGraphics.lineStyle(borderWidth, focused ? focusedBorderColor : unfocusedBorderColor);
        borderGraphics.drawRect(0, 0, width, height);

        graphics.addChild(borderGraphics);
    }

    _bringToFront(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Move to top of container
        this.container.removeChild(win.graphics);
        this.container.addChild(win.graphics);
    }

    /**
     * Route keyboard event to focused app.
     */
    handleKeyboard(event) {
        const focusedId = this.client.focusedAppId;
        if (focusedId === null) return;

        const region = this.client.getAppRegion(focusedId);
        if (!region) return;

        // Only send if app wants keyboard
        if (!(region.flags & 0x01)) return;

        this.client.sendKeyboardEvent(
            event.keyCode,
            region.x,
            region.y
        );
    }

    destroy() {
        for (const appId of this.windows.keys()) {
            this._destroyWindow(appId);
        }
    }
}
