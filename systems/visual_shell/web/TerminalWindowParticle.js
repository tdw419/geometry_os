/**
 * TerminalWindowParticle.js
 * A spatial particle wrapping TerminalWindow for the infinite canvas.
 * Extends PIXI.Container with position, scale, and zIndex management.
 * Provides serialization for persistence and NEB event publishing.
 */

class TerminalWindowParticle extends PIXI.Container {
    static PARTICLE_TYPE = 'terminal';

    // Scale limits
    static MIN_SCALE = 0.25;
    static MAX_SCALE = 3.0;

    constructor(options = {}) {
        super();

        // Particle identity
        this.particleId = options.particleId || `terminal-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;

        // Spatial properties (use internal names to avoid PIXI's x/y)
        this._particlePosition = { x: options.x ?? 100, y: options.y ?? 100 };
        this._particleScale = Math.max(
            TerminalWindowParticle.MIN_SCALE,
            Math.min(TerminalWindowParticle.MAX_SCALE, options.scale ?? 1.0)
        );
        this._particleZIndex = options.zIndex ?? 0;

        // Terminal config
        this._config = {
            width: options.width || 800,
            height: options.height || 500,
            title: options.title || 'Terminal',
            wsUrl: options.wsUrl || 'ws://localhost:8769/terminal'
        };

        // NEB integration
        this._nebSocket = options.nebSocket || null;
        this._nebEnabled = options.nebEnabled ?? false;

        // Focus state
        this._focused = false;

        // Set PIXI container position
        this.x = this._particlePosition.x;
        this.y = this._particlePosition.y;
        this.scale.set(this._particleScale);
        this.zIndex = this._particleZIndex;

        // Create resize handles first (before TerminalWindow)
        this._resizeHandles = [];
        this._createResizeHandles();

        // Create internal TerminalWindow (use compat version)
        const TerminalWindowClass = typeof TerminalWindowCompat !== 'undefined'
            ? TerminalWindowCompat
            : (typeof TerminalWindow !== 'undefined' ? TerminalWindow : null);

        if (TerminalWindowClass) {
            this._terminalWindow = new TerminalWindowClass({
                ...this._config,
                x: 0,  // Position relative to particle container
                y: 0
            });
            this.addChild(this._terminalWindow);
        } else {
            console.warn('[TerminalWindowParticle] No TerminalWindow class available');
            this._terminalWindow = null;
        }

        // Override terminal's focus/blur to use particle methods
        this._setupTerminalEvents();

        // Setup mouse wheel zoom
        this._setupMouseWheel();

        // Interactive for focus
        this.interactive = true;
        this.on('pointerdown', () => this.focus());

        // Track last position for movement detection
        this._lastPosition = { ...this._particlePosition };
        this._lastScale = this._particleScale;
    }

    /**
     * Create resize handles on all four corners
     */
    _createResizeHandles() {
        const handleSize = 12;
        const positions = [
            { name: 'nw', cursor: 'nwse-resize', getX: () => -handleSize/2, getY: () => -handleSize/2 },
            { name: 'ne', cursor: 'nesw-resize', getX: (w) => w - handleSize/2, getY: () => -handleSize/2 },
            { name: 'sw', cursor: 'nesw-resize', getX: () => -handleSize/2, getY: (h) => h - handleSize/2 },
            { name: 'se', cursor: 'nwse-resize', getX: (w) => w - handleSize/2, getY: (h) => h - handleSize/2 }
        ];

        positions.forEach(pos => {
            const handle = new PIXI.Container();
            handle.interactive = true;
            handle.cursor = pos.cursor;

            const graphics = new PIXI.Graphics()
                .beginFill(0x00ff00, 0.6)
                .lineStyle(1, 0x00ff00, 1)
                .drawRect(0, 0, handleSize, handleSize)
                .endFill();
            handle.addChild(graphics);

            handle.alpha = 0;
            handle.handleName = pos.name;

            // Hover effect
            handle.on('pointerover', () => { handle.alpha = 1; });
            handle.on('pointerout', () => {
                if (!handle._dragging) handle.alpha = 0;
            });

            // Resize drag
            handle.on('pointerdown', (e) => {
                e.stopPropagation();
                handle._dragging = true;
                handle._dragStart = e.data.getLocalPosition(this.parent);
                handle._startBounds = {
                    x: this._particlePosition.x,
                    y: this._particlePosition.y,
                    width: this._config.width,
                    height: this._config.height
                };
                this.focus();
            });

            this.on('pointermove', (e) => {
                if (!handle._dragging) return;

                const current = e.data.getLocalPosition(this.parent);
                const dx = current.x - handle._dragStart.x;
                const dy = current.y - handle._dragStart.y;

                // Resize based on corner
                if (pos.name.includes('e')) {
                    this._config.width = Math.max(300, handle._startBounds.width + dx);
                }
                if (pos.name.includes('w')) {
                    const newWidth = Math.max(300, handle._startBounds.width - dx);
                    if (newWidth !== this._config.width) {
                        this._particlePosition.x = handle._startBounds.x + (handle._startBounds.width - newWidth);
                        this._config.width = newWidth;
                    }
                }
                if (pos.name.includes('s')) {
                    this._config.height = Math.max(200, handle._startBounds.height + dy);
                }
                if (pos.name.includes('n')) {
                    const newHeight = Math.max(200, handle._startBounds.height - dy);
                    if (newHeight !== this._config.height) {
                        this._particlePosition.y = handle._startBounds.y + (handle._startBounds.height - newHeight);
                        this._config.height = newHeight;
                    }
                }

                this._updateFromState();
                this._publishNebEvent('terminal.particle.resized', {
                    particleId: this.particleId,
                    width: this._config.width,
                    height: this._config.height
                });
            });

            this.on('pointerup', () => {
                if (handle._dragging) {
                    handle._dragging = false;
                    handle.alpha = 0;
                }
            });
            this.on('pointerupoutside', () => {
                if (handle._dragging) {
                    handle._dragging = false;
                    handle.alpha = 0;
                }
            });

            this._resizeHandles.push({ container: handle, getPosition: pos });
            this.addChild(handle);
        });
    }

    /**
     * Update handle positions after resize
     */
    _updateHandlePositions() {
        const w = this._config.width;
        const h = this._config.height;

        this._resizeHandles.forEach(({ container, getPosition }) => {
            const pos = getPosition;
            container.x = pos.getX(w);
            container.y = pos.getY(h);
        });
    }

    /**
     * Setup terminal window event forwarding
     */
    _setupTerminalEvents() {
        // Forward focus to particle
        this._terminalWindow.on('focus', () => {
            this.focus();
        });

        // Forward close event
        this._terminalWindow.on('closed', () => {
            this.emit('particle-closed', this);
        });

        // Track position changes from drag
        this._terminalWindow.on('moved', () => {
            // TerminalWindow handles its own drag, sync our state
            this._particlePosition.x = this._terminalWindow.x;
            this._particlePosition.y = this._terminalWindow.y;
            this._publishNebEvent('terminal.particle.moved', {
                particleId: this.particleId,
                position: this._particlePosition
            });
        });
    }

    /**
     * Setup mouse wheel zoom
     */
    _setupMouseWheel() {
        // Mouse wheel needs to be on a hit area
        this.hitArea = new PIXI.Rectangle(0, 0, this._config.width, this._config.height);

        // We'll handle wheel events from the parent stage
        this._wheelHandler = (e) => {
            if (!this._focused) return;

            const delta = e.deltaY > 0 ? -0.1 : 0.1;
            this.setScale(this._particleScale + delta);
        };
    }

    /**
     * Update PIXI properties from internal state
     */
    _updateFromState() {
        this.x = this._particlePosition.x;
        this.y = this._particlePosition.y;
        this.scale.set(this._particleScale);
        this.zIndex = this._particleZIndex;

        // Update terminal window dimensions
        this._terminalWindow.windowWidth = this._config.width;
        this._terminalWindow.windowHeight = this._config.height;

        // Redraw terminal frame
        this._terminalWindow.background.clear()
            .beginFill(0x1a1a2e, 0.95)
            .drawRoundedRect(0, 0, this._config.width, this._config.height, 8)
            .endFill();

        this._terminalWindow.border.clear()
            .lineStyle(2, this._focused ? 0x00ffff : 0x00ff00, 1)
            .drawRoundedRect(0, 0, this._config.width, this._config.height, 8);

        // Update handle positions
        this._updateHandlePositions();

        // Update hit area
        this.hitArea = new PIXI.Rectangle(0, 0, this._config.width, this._config.height);

        // Update terminal overlay
        if (this._terminalWindow._updateOverlayPosition) {
            this._terminalWindow._updateOverlayPosition();
        }
    }

    /**
     * Publish event to NEB if enabled
     */
    _publishNebEvent(topic, payload) {
        if (!this._nebEnabled || !this._nebSocket) return;

        try {
            const message = JSON.stringify({
                topic,
                payload: {
                    ...payload,
                    timestamp: Date.now()
                }
            });

            if (this._nebSocket.readyState === WebSocket.OPEN) {
                this._nebSocket.send(message);
            }
        } catch (e) {
            console.warn('[TerminalWindowParticle] Failed to publish NEB event:', e);
        }
    }

    // === Public API ===

    /**
     * Serialize particle state for persistence
     */
    serialize() {
        return {
            particleId: this.particleId,
            particleType: TerminalWindowParticle.PARTICLE_TYPE,
            position: { ...this._particlePosition },
            scale: this._particleScale,
            zIndex: this._particleZIndex,
            config: { ...this._config }
        };
    }

    /**
     * Deserialize factory method
     */
    static deserialize(data, nebSocket = null) {
        return new TerminalWindowParticle({
            particleId: data.particleId,
            x: data.position?.x ?? data.x ?? 100,
            y: data.position?.y ?? data.y ?? 100,
            scale: data.scale ?? 1.0,
            zIndex: data.zIndex ?? 0,
            width: data.config?.width ?? 800,
            height: data.config?.height ?? 500,
            title: data.config?.title ?? 'Terminal',
            wsUrl: data.config?.wsUrl ?? 'ws://localhost:8769/terminal',
            nebSocket: nebSocket,
            nebEnabled: !!nebSocket
        });
    }

    /**
     * Set particle position
     */
    setPosition(x, y) {
        this._particlePosition.x = x;
        this._particlePosition.y = y;
        this._updateFromState();
        this._publishNebEvent('terminal.particle.moved', {
            particleId: this.particleId,
            position: this._particlePosition
        });
    }

    /**
     * Set particle scale with clamping
     */
    setScale(scale) {
        this._particleScale = Math.max(
            TerminalWindowParticle.MIN_SCALE,
            Math.min(TerminalWindowParticle.MAX_SCALE, scale)
        );
        this._updateFromState();
        this._publishNebEvent('terminal.particle.scaled', {
            particleId: this.particleId,
            scale: this._particleScale
        });
    }

    /**
     * Focus this particle
     */
    focus() {
        if (this._focused) return;

        this._focused = true;
        this.bringToFront();
        this._terminalWindow.focus();
        this._updateFromState();

        this._publishNebEvent('terminal.particle.focused', {
            particleId: this.particleId
        });

        this.emit('particle-focused', this);
    }

    /**
     * Blur (unfocus) this particle
     */
    blur() {
        if (!this._focused) return;

        this._focused = false;
        this._terminalWindow.blur();
        this._updateFromState();

        this.emit('particle-blurred', this);
    }

    /**
     * Bring to front (highest zIndex)
     */
    bringToFront() {
        if (this.parent) {
            // Find highest zIndex among siblings
            let maxZ = 0;
            this.parent.children.forEach(child => {
                if (child !== this && child.zIndex !== undefined) {
                    maxZ = Math.max(maxZ, child.zIndex);
                }
            });
            this._particleZIndex = maxZ + 1;
            this.zIndex = this._particleZIndex;

            // Sort parent children by zIndex
            this.parent.children.sort((a, b) => (a.zIndex || 0) - (b.zIndex || 0));
        }
    }

    /**
     * Update for render loop
     */
    update() {
        // Check for position changes
        if (this._lastPosition.x !== this._particlePosition.x ||
            this._lastPosition.y !== this._particlePosition.y) {
            this._lastPosition = { ...this._particlePosition };
        }

        // Check for scale changes
        if (this._lastScale !== this._particleScale) {
            this._lastScale = this._particleScale;
        }

        // Update terminal window
        if (this._terminalWindow.update) {
            this._terminalWindow.update();
        }
    }

    /**
     * Destroy particle and cleanup
     */
    destroy(options = {}) {
        this._publishNebEvent('terminal.particle.destroyed', {
            particleId: this.particleId
        });

        // Destroy terminal window
        if (this._terminalWindow) {
            this._terminalWindow.close();
            this._terminalWindow.destroy();
            this._terminalWindow = null;
        }

        // Clear handles
        this._resizeHandles.forEach(h => {
            h.container.destroy();
        });
        this._resizeHandles = [];

        // Call parent destroy
        super.destroy(options);
    }

    // === Getters ===

    get particlePosition() {
        return { ...this._particlePosition };
    }

    get particleScale() {
        return this._particleScale;
    }

    get particleZIndex() {
        return this._particleZIndex;
    }

    get focused() {
        return this._focused;
    }

    get terminalWindow() {
        return this._terminalWindow;
    }
}

// Export for use in application
if (typeof window !== 'undefined') {
    window.TerminalWindowParticle = TerminalWindowParticle;
}
