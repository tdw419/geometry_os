/**
 * Geometry OS: Infinite Canvas Multiplayer
 *
 * Real-time collaborative terminal editing with presence awareness.
 * Multiple users can navigate, edit, and see each other's cursors.
 *
 * Architecture:
 * [WebSocket Server] ←→ [InfiniteCanvasMultiplayer] ←→ [PIXI.js Canvas]
 *                              ↓
 *                    [Presence Manager]
 *                              ↓
 *              [User Cursors, Selections, Edits]
 */

class InfiniteCanvasMultiplayer {
    constructor(options = {}) {
        // Canvas configuration
        this.container = options.container || document.body;
        this.width = options.width || 1200;
        this.height = options.height || 800;

        // User identity
        this.userId = options.userId || this._generateId();
        this.userName = options.userName || `User-${this.userId.slice(0, 4)}`;
        this.userColor = options.userColor || this._generateColor();

        // WebSocket connection
        this.wsUrl = options.wsUrl || 'ws://localhost:8770/ws';
        this.ws = null;
        this.connected = false;
        this.reconnectAttempts = 0;
        this.maxReconnectAttempts = 5;

        // Presence state
        this.users = new Map(); // userId → UserState
        this.localState = {
            position: { x: 0, y: 0 },
            viewport: { x: 0, y: 0, zoom: 1 },
            selection: null,
            editing: null
        };

        // PIXI components
        this.app = null;
        this.canvas = null;
        this.terminalLayer = null;
        this.presenceLayer = null;
        this.cursorSprites = new Map();

        // Animation
        this.animationFrame = null;
        this.lastBroadcast = 0;
        this.broadcastInterval = 50; // ms

        // Event handlers
        this.onUserJoin = options.onUserJoin || (() => {});
        this.onUserLeave = options.onUserLeave || (() => {});
        this.onUserUpdate = options.onUserUpdate || (() => {});
        this.onRemoteEdit = options.onRemoteEdit || (() => {});

        console.log('[InfiniteCanvasMultiplayer] Initialized', this.userId);
    }

    /**
     * Generate unique ID.
     */
    _generateId() {
        return 'user-' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Generate user color.
     */
    _generateColor() {
        const hue = Math.random() * 360;
        return `hsl(${hue}, 70%, 60%)`;
    }

    /**
     * Initialize the multiplayer canvas.
     */
    async init() {
        // Create PIXI application
        this.app = new PIXI.Application({
            width: this.width,
            height: this.height,
            backgroundColor: 0x0a0a0a,
            resolution: window.devicePixelRatio || 1,
            autoDensity: true
        });

        this.container.appendChild(this.app.view);
        this.canvas = this.app.view;

        // Create layers
        this.terminalLayer = new PIXI.Container();
        this.presenceLayer = new PIXI.Container();
        this.uiLayer = new PIXI.Container();

        this.app.stage.addChild(this.terminalLayer);
        this.app.stage.addChild(this.presenceLayer);
        this.app.stage.addChild(this.uiLayer);

        // Setup interaction
        this._setupInteraction();

        // Create local cursor
        this._createLocalCursor();

        // Connect to server
        await this._connect();

        // Start animation loop
        this._startAnimationLoop();

        console.log('[InfiniteCanvasMultiplayer] Ready');
    }

    /**
     * Setup mouse/touch interaction.
     */
    _setupInteraction() {
        let isDragging = false;
        let lastPos = { x: 0, y: 0 };

        this.canvas.addEventListener('mousedown', (e) => {
            if (e.button === 1 || e.shiftKey) { // Middle click or shift+click for pan
                isDragging = true;
                lastPos = { x: e.clientX, y: e.clientY };
                this.canvas.style.cursor = 'grabbing';
            }
        });

        this.canvas.addEventListener('mousemove', (e) => {
            const rect = this.canvas.getBoundingClientRect();
            const x = (e.clientX - rect.left) / this.localState.viewport.zoom + this.localState.viewport.x;
            const y = (e.clientY - rect.top) / this.localState.viewport.zoom + this.localState.viewport.y;

            this.localState.position = { x, y };

            if (isDragging) {
                const dx = (e.clientX - lastPos.x) / this.localState.viewport.zoom;
                const dy = (e.clientY - lastPos.y) / this.localState.viewport.zoom;

                this.localState.viewport.x -= dx;
                this.localState.viewport.y -= dy;

                lastPos = { x: e.clientX, y: e.clientY };
                this._updateViewport();
            }
        });

        this.canvas.addEventListener('mouseup', () => {
            isDragging = false;
            this.canvas.style.cursor = 'default';
        });

        this.canvas.addEventListener('wheel', (e) => {
            e.preventDefault();

            const zoomFactor = e.deltaY > 0 ? 0.9 : 1.1;
            const newZoom = Math.max(0.1, Math.min(5, this.localState.viewport.zoom * zoomFactor));

            this.localState.viewport.zoom = newZoom;
            this._updateViewport();
        });
    }

    /**
     * Update viewport transform.
     */
    _updateViewport() {
        const { x, y, zoom } = this.localState.viewport;

        this.terminalLayer.position.set(-x * zoom, -y * zoom);
        this.terminalLayer.scale.set(zoom);

        this.presenceLayer.position.set(-x * zoom, -y * zoom);
        this.presenceLayer.scale.set(zoom);
    }

    /**
     * Create local user cursor.
     */
    _createLocalCursor() {
        // Local cursor indicator (subtle)
        this.localCursor = new PIXI.Graphics();
        this.localCursor.lineStyle(2, 0x00ff88, 0.5);
        this.localCursor.drawCircle(0, 0, 10);
        this.uiLayer.addChild(this.localCursor);
    }

    /**
     * Connect to WebSocket server.
     */
    async _connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.wsUrl);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.reconnectAttempts = 0;

                    // Send join message
                    this._send({
                        type: 'join',
                        userId: this.userId,
                        userName: this.userName,
                        userColor: this.userColor,
                        state: this.localState
                    });

                    console.log('[InfiniteCanvasMultiplayer] Connected');
                    resolve();
                };

                this.ws.onmessage = (event) => {
                    try {
                        const message = JSON.parse(event.data);
                        this._handleMessage(message);
                    } catch (e) {
                        console.error('[InfiniteCanvasMultiplayer] Parse error:', e);
                    }
                };

                this.ws.onclose = () => {
                    this.connected = false;
                    console.log('[InfiniteCanvasMultiplayer] Disconnected');

                    // Attempt reconnect
                    if (this.reconnectAttempts < this.maxReconnectAttempts) {
                        this.reconnectAttempts++;
                        setTimeout(() => this._connect(), 1000 * this.reconnectAttempts);
                    }
                };

                this.ws.onerror = (error) => {
                    console.error('[InfiniteCanvasMultiplayer] WebSocket error:', error);
                    reject(error);
                };

            } catch (e) {
                reject(e);
            }
        });
    }

    /**
     * Handle incoming WebSocket message.
     */
    _handleMessage(message) {
        switch (message.type) {
            case 'user_joined':
                this._handleUserJoined(message);
                break;

            case 'user_left':
                this._handleUserLeft(message);
                break;

            case 'user_update':
                this._handleUserUpdate(message);
                break;

            case 'remote_edit':
                this._handleRemoteEdit(message);
                break;

            case 'presence_sync':
                this._handlePresenceSync(message);
                break;
        }
    }

    /**
     * Handle user joined event.
     */
    _handleUserJoined(message) {
        const { userId, userName, userColor, state } = message;

        if (userId === this.userId) return;

        const user = {
            id: userId,
            name: userName,
            color: userColor,
            state,
            lastUpdate: Date.now()
        };

        this.users.set(userId, user);
        this._createUserCursor(user);

        this.onUserJoin(user);
        console.log('[InfiniteCanvasMultiplayer] User joined:', userName);
    }

    /**
     * Handle user left event.
     */
    _handleUserLeft(message) {
        const { userId } = message;

        const user = this.users.get(userId);
        if (user) {
            this.users.delete(userId);
            this._removeUserCursor(userId);
            this.onUserLeave(user);
            console.log('[InfiniteCanvasMultiplayer] User left:', user.name);
        }
    }

    /**
     * Handle user update event.
     */
    _handleUserUpdate(message) {
        const { userId, state } = message;

        if (userId === this.userId) return;

        const user = this.users.get(userId);
        if (user) {
            user.state = state;
            user.lastUpdate = Date.now();
            this._updateUserCursor(user);
            this.onUserUpdate(user);
        }
    }

    /**
     * Handle remote edit event.
     */
    _handleRemoteEdit(message) {
        const { userId, edit } = message;

        if (userId === this.userId) return;

        const user = this.users.get(userId);
        if (user) {
            this.onRemoteEdit(user, edit);
        }
    }

    /**
     * Handle presence sync (initial state on join).
     */
    _handlePresenceSync(message) {
        const { users } = message;

        for (const userData of users) {
            if (userData.userId !== this.userId) {
                const user = {
                    id: userData.userId,
                    name: userData.userName,
                    color: userData.userColor,
                    state: userData.state,
                    lastUpdate: Date.now()
                };

                this.users.set(userData.userId, user);
                this._createUserCursor(user);
            }
        }

        console.log('[InfiniteCanvasMultiplayer] Synced with', users.length, 'users');
    }

    /**
     * Create cursor sprite for user.
     */
    _createUserCursor(user) {
        const container = new PIXI.Container();

        // Cursor body
        const cursor = new PIXI.Graphics();
        const color = this._colorToNumber(user.color);

        // Draw cursor arrow
        cursor.beginFill(color, 0.8);
        cursor.moveTo(0, 0);
        cursor.lineTo(0, 20);
        cursor.lineTo(5, 15);
        cursor.lineTo(10, 25);
        cursor.lineTo(13, 23);
        cursor.lineTo(8, 13);
        cursor.lineTo(15, 10);
        cursor.lineTo(0, 0);
        cursor.endFill();

        // Outline
        cursor.lineStyle(1, 0xffffff, 0.5);
        cursor.moveTo(0, 0);
        cursor.lineTo(0, 20);
        cursor.lineTo(5, 15);
        cursor.lineTo(10, 25);
        cursor.lineTo(13, 23);
        cursor.lineTo(8, 13);
        cursor.lineTo(15, 10);
        cursor.lineTo(0, 0);

        container.addChild(cursor);

        // Name label
        const nameText = new PIXI.Text(user.name, {
            fontFamily: 'Courier New',
            fontSize: 11,
            fill: color,
            fontWeight: 'bold'
        });
        nameText.x = 16;
        nameText.y = 2;
        container.addChild(nameText);

        // Background for name
        const nameBg = new PIXI.Graphics();
        nameBg.beginFill(0x000000, 0.7);
        nameBg.drawRoundedRect(14, 0, nameText.width + 6, 16, 3);
        nameBg.endFill();
        container.addChildAt(nameBg, 1);

        // Position
        container.x = user.state.position.x;
        container.y = user.state.position.y;

        // Add to presence layer
        this.presenceLayer.addChild(container);
        this.cursorSprites.set(user.id, container);
    }

    /**
     * Update user cursor position.
     */
    _updateUserCursor(user) {
        const sprite = this.cursorSprites.get(user.id);
        if (sprite) {
            // Smooth interpolation
            const targetX = user.state.position.x;
            const targetY = user.state.position.y;

            sprite.targetX = targetX;
            sprite.targetY = targetY;
        }
    }

    /**
     * Remove user cursor.
     */
    _removeUserCursor(userId) {
        const sprite = this.cursorSprites.get(userId);
        if (sprite) {
            this.presenceLayer.removeChild(sprite);
            sprite.destroy();
            this.cursorSprites.delete(userId);
        }
    }

    /**
     * Convert CSS color to number.
     */
    _colorToNumber(color) {
        if (color.startsWith('#')) {
            return parseInt(color.slice(1), 16);
        }
        if (color.startsWith('hsl')) {
            // Create temporary element to convert
            const temp = document.createElement('div');
            temp.style.color = color;
            document.body.appendChild(temp);
            const computed = getComputedStyle(temp).color;
            document.body.removeChild(temp);

            const match = computed.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/);
            if (match) {
                return (parseInt(match[1]) << 16) + (parseInt(match[2]) << 8) + parseInt(match[3]);
            }
        }
        return 0x888888;
    }

    /**
     * Send message through WebSocket.
     */
    _send(message) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(message));
        }
    }

    /**
     * Broadcast local state.
     */
    broadcastState() {
        const now = Date.now();
        if (now - this.lastBroadcast >= this.broadcastInterval) {
            this._send({
                type: 'state_update',
                userId: this.userId,
                state: this.localState
            });
            this.lastBroadcast = now;
        }
    }

    /**
     * Send edit to collaborators.
     */
    sendEdit(edit) {
        this._send({
            type: 'edit',
            userId: this.userId,
            edit
        });
    }

    /**
     * Start animation loop.
     */
    _startAnimationLoop() {
        const animate = () => {
            // Update local cursor position in UI layer
            const screenX = (this.localState.position.x - this.localState.viewport.x) * this.localState.viewport.zoom;
            const screenY = (this.localState.position.y - this.localState.viewport.y) * this.localState.viewport.zoom;
            this.localCursor.position.set(screenX, screenY);

            // Smoothly interpolate remote cursors
            for (const [userId, sprite] of this.cursorSprites) {
                if (sprite.targetX !== undefined) {
                    sprite.x += (sprite.targetX - sprite.x) * 0.2;
                    sprite.y += (sprite.targetY - sprite.y) * 0.2;
                }
            }

            // Broadcast state periodically
            this.broadcastState();

            this.animationFrame = requestAnimationFrame(animate);
        };

        animate();
    }

    /**
     * Set selection range.
     */
    setSelection(selection) {
        this.localState.selection = selection;
        this.broadcastState();
    }

    /**
     * Set editing state.
     */
    setEditing(editing) {
        this.localState.editing = editing;
        this.broadcastState();
    }

    /**
     * Move viewport to position.
     */
    moveTo(x, y, animate = true) {
        if (animate) {
            // Smooth animation
            const startX = this.localState.viewport.x;
            const startY = this.localState.viewport.y;
            const duration = 500;
            const startTime = Date.now();

            const animateMove = () => {
                const elapsed = Date.now() - startTime;
                const progress = Math.min(1, elapsed / duration);
                const eased = 1 - Math.pow(1 - progress, 3);

                this.localState.viewport.x = startX + (x - startX) * eased;
                this.localState.viewport.y = startY + (y - startY) * eased;
                this._updateViewport();

                if (progress < 1) {
                    requestAnimationFrame(animateMove);
                }
            };

            animateMove();
        } else {
            this.localState.viewport.x = x;
            this.localState.viewport.y = y;
            this._updateViewport();
        }
    }

    /**
     * Get all connected users.
     */
    getUsers() {
        return Array.from(this.users.values());
    }

    /**
     * Get connection status.
     */
    isConnected() {
        return this.connected;
    }

    /**
     * Disconnect from server.
     */
    disconnect() {
        if (this.ws) {
            this._send({
                type: 'leave',
                userId: this.userId
            });
            this.ws.close();
            this.ws = null;
        }

        if (this.animationFrame) {
            cancelAnimationFrame(this.animationFrame);
        }
    }

    /**
     * Destroy the multiplayer instance.
     */
    destroy() {
        this.disconnect();

        if (this.app) {
            this.app.destroy(true);
        }

        this.users.clear();
        this.cursorSprites.clear();
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = InfiniteCanvasMultiplayer;
}
