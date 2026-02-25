/**
 * GeometricTerminalParticle.js
 *
 * A spatial particle wrapping GeometricTerminal for the infinite canvas.
 * Uses pure PixiJS rendering with neural-geometric text synthesis.
 * No font files - all text rendered as geometry via Hilbert sequences.
 *
 * Architecture:
 * [GeometricTerminalParticle]
 *   ├── extends PIXI.Container
 *   ├── spatial props: x, y, scale, zIndex
 *   ├── GeometricTerminal (internal, renders geometric text)
 *   ├── GeometricTextRenderer (WebSocket connection for text synthesis)
 *   └── Shell execution via WebSocket
 *
 * @module GeometricTerminalParticle
 */

class GeometricTerminalParticle extends PIXI.Container {
    static PARTICLE_TYPE = 'geometric-terminal';

    // Scale limits
    static MIN_SCALE = 0.25;
    static MAX_SCALE = 3.0;

    constructor(options = {}) {
        super();

        // Particle identity
        this.particleId = options.particleId || `geo-term-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;

        // Spatial properties (use internal names to avoid PIXI's x/y)
        this._particlePosition = { x: options.x ?? 100, y: options.y ?? 100 };
        this._particleScale = Math.max(
            GeometricTerminalParticle.MIN_SCALE,
            Math.min(GeometricTerminalParticle.MAX_SCALE, options.scale ?? 1.0)
        );
        this._particleZIndex = options.zIndex ?? 0;

        // Terminal grid config
        this._config = {
            cols: options.cols || 80,
            rows: options.rows || 24,
            cellSize: options.cellSize || 16,
            wsUrl: options.wsUrl || `ws://${window.location.hostname}:8765`
        };

        // NEB integration
        this._nebSocket = options.nebSocket || null;
        this._nebEnabled = options.nebEnabled ?? false;

        // Focus state
        this._focused = false;

        // PIXI Application reference (required for GeometricTerminal)
        this._app = options.app || window.pixiApp;

        // Set PIXI container properties
        this.x = this._particlePosition.x;
        this.y = this._particlePosition.y;
        this.scale.set(this._particleScale);
        this.zIndex = this._particleZIndex;

        // Create GeometricTextRenderer bridge
        this._textRenderer = new GeometricTextRenderer(this._app, this._config.wsUrl);

        // Create internal GeometricTerminal
        this._geometricTerminal = new GeometricTerminal(this._app, {
            cols: this._config.cols,
            rows: this._config.rows,
            cellSize: this._config.cellSize,
            x: 0,  // Position relative to particle container
            y: 0,
            bridge: this._textRenderer,
            useSDF: true
        });

        // Move terminal container into this particle
        this._app.stage.removeChild(this._geometricTerminal.container);
        this.addChild(this._geometricTerminal.container);

        // Setup event handlers
        this._setupTerminalEvents();
        this._setupShellOutputHandler();

        // Interactive for focus
        this.interactive = true;
        this.on('pointerdown', () => this.focus());

        // Hit area for interaction
        const width = this._config.cols * (this._config.cellSize + 2);
        const height = this._config.rows * (this._config.cellSize + 2);
        this.hitArea = new PIXI.Rectangle(-10, -10, width + 20, height + 20);

        // Track state for change detection
        this._lastPosition = { ...this._particlePosition };
        this._lastScale = this._particleScale;

        console.log(`[GeometricTerminalParticle] Created: ${this.particleId}`);
    }

    /**
     * Setup terminal event forwarding
     */
    _setupTerminalEvents() {
        // Listen for command events from GeometricTerminal
        window.addEventListener('geometric-terminal-command', (event) => {
            if (event.detail.terminal === this._geometricTerminal) {
                const command = event.detail.command;
                this._executeCommand(command);
            }
        });

        // Keyboard input forwarding
        this._keydownHandler = (event) => {
            if (this._focused) {
                this._geometricTerminal.handleKeyDown(event);
            }
        };
        window.addEventListener('keydown', this._keydownHandler);
    }

    /**
     * Setup shell output handler
     */
    _setupShellOutputHandler() {
        window.addEventListener('shell-command-event', (event) => {
            const data = event.detail;
            if (data.type === 'COMMAND_OUTPUT' && this._focused) {
                // Write output to terminal
                this._geometricTerminal.write(data.output);
            } else if (data.type === 'COMMAND_COMPLETE' && this._focused) {
                this._geometricTerminal.write('\n$ ');
            } else if (data.type === 'COMMAND_ERROR' && this._focused) {
                this._geometricTerminal.write(`\x1b[31m${data.error}\x1b[0m\n$ `);
            }
        });
    }

    /**
     * Execute a shell command via the GeometricTextRenderer WebSocket
     */
    executeCommand(cmd) {
        return this._executeCommand(cmd);
    }

    _executeCommand(cmd) {
        const requestId = this._textRenderer.executeCommand(cmd);
        if (requestId) {
            this._publishNebEvent('geometric-terminal.command', {
                particleId: this.particleId,
                command: cmd,
                requestId: requestId
            });
        }
        return requestId;
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
            console.warn('[GeometricTerminalParticle] Failed to publish NEB event:', e);
        }
    }

    // === Public API ===

    /**
     * Serialize particle state for persistence
     */
    serialize() {
        return {
            particleId: this.particleId,
            particleType: GeometricTerminalParticle.PARTICLE_TYPE,
            position: { ...this._particlePosition },
            scale: this._particleScale,
            zIndex: this._particleZIndex,
            config: { ...this._config }
        };
    }

    /**
     * Deserialize factory method
     */
    static deserialize(data, nebSocket = null, app = null) {
        return new GeometricTerminalParticle({
            particleId: data.particleId,
            x: data.position?.x ?? data.x ?? 100,
            y: data.position?.y ?? data.y ?? 100,
            scale: data.scale ?? 1.0,
            zIndex: data.zIndex ?? 0,
            cols: data.config?.cols ?? 80,
            rows: data.config?.rows ?? 24,
            cellSize: data.config?.cellSize ?? 16,
            wsUrl: data.config?.wsUrl ?? `ws://${window.location.hostname}:8765`,
            nebSocket: nebSocket,
            nebEnabled: !!nebSocket,
            app: app || window.pixiApp
        });
    }

    /**
     * Set particle position
     */
    setPosition(x, y) {
        this._particlePosition.x = x;
        this._particlePosition.y = y;
        this.x = x;
        this.y = y;

        this._publishNebEvent('geometric-terminal.particle.moved', {
            particleId: this.particleId,
            position: this._particlePosition
        });
    }

    /**
     * Set particle scale with clamping
     */
    setScale(scale) {
        this._particleScale = Math.max(
            GeometricTerminalParticle.MIN_SCALE,
            Math.min(GeometricTerminalParticle.MAX_SCALE, scale)
        );
        this.scale.set(this._particleScale);

        this._publishNebEvent('geometric-terminal.particle.scaled', {
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

        // Visual feedback - update border if needed
        this._updateFocusState();

        this._publishNebEvent('geometric-terminal.particle.focused', {
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
        this._updateFocusState();

        this.emit('particle-blurred', this);
    }

    /**
     * Update visual focus state
     */
    _updateFocusState() {
        // The GeometricTerminal draws its own background
        // We can add a focus indicator around it
        if (this._focusIndicator) {
            this.removeChild(this._focusIndicator);
        }

        const width = this._config.cols * (this._config.cellSize + 2);
        const height = this._config.rows * (this._config.cellSize + 2);

        this._focusIndicator = new PIXI.Graphics();
        const color = this._focused ? 0x00FFFF : 0x00FF00;
        const alpha = this._focused ? 1.0 : 0.5;

        this._focusIndicator.lineStyle(2, color, alpha);
        this._focusIndicator.drawRoundedRect(-12, -12, width + 24, height + 24, 10);

        this.addChildAt(this._focusIndicator, 0);
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
    update(deltaTime) {
        // Check for position changes
        if (this._lastPosition.x !== this._particlePosition.x ||
            this._lastPosition.y !== this._particlePosition.y) {
            this._lastPosition = { ...this._particlePosition };
        }

        // Check for scale changes
        if (this._lastScale !== this._particleScale) {
            this._lastScale = this._particleScale;
        }
    }

    /**
     * Write text to the terminal
     */
    write(text) {
        return this._geometricTerminal.write(text);
    }

    /**
     * Clear the terminal
     */
    clear() {
        this._geometricTerminal.clear();
    }

    /**
     * Get current line content
     */
    getCurrentLine() {
        return this._geometricTerminal.getCurrentLine();
    }

    /**
     * Destroy particle and cleanup
     */
    destroy(options = {}) {
        this._publishNebEvent('geometric-terminal.particle.destroyed', {
            particleId: this.particleId
        });

        // Remove event listeners
        window.removeEventListener('keydown', this._keydownHandler);

        // Destroy GeometricTerminal
        if (this._geometricTerminal) {
            this._geometricTerminal.destroy();
            this._geometricTerminal = null;
        }

        // Destroy focus indicator
        if (this._focusIndicator) {
            this._focusIndicator.destroy();
            this._focusIndicator = null;
        }

        // Note: We don't destroy _textRenderer as it may be shared
        // If needed, add a cleanup flag in options

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

    get geometricTerminal() {
        return this._geometricTerminal;
    }

    get textRenderer() {
        return this._textRenderer;
    }

    get config() {
        return { ...this._config };
    }

    get dimensions() {
        return {
            width: this._config.cols * (this._config.cellSize + 2),
            height: this._config.rows * (this._config.cellSize + 2)
        };
    }
}

// Export for use in application
if (typeof window !== 'undefined') {
    window.GeometricTerminalParticle = GeometricTerminalParticle;
}
