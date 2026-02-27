/**
 * Geometry OS: TerminalWindow
 *
 * Wraps GeometricTerminal with window management capabilities.
 * - Draggable on infinite map
 * - Resizable with handle
 * - Minimize/maximize
 * - Focus management
 * - Visual state feedback
 * - NEB integration for coordination
 *
 * Architecture:
 * [InfiniteMap] → [WindowParticle] → [TerminalWindow] → [GeometricTerminal]
 *                           ↓
 *                    [Neural Event Bus]
 */

export class TerminalWindow {
    static nextId = 1;

    constructor(terminal, options = {}) {
        this.id = options.id || `terminal-${TerminalWindow.nextId++}`;
        this.terminal = terminal;
        this.type = 'terminal';

        // Position and size
        this.x = options.x ?? 100;
        this.y = options.y ?? 100;
        this.width = options.width ?? (terminal.width ? terminal.width + 20 : 800);
        this.height = options.height ?? (terminal.height ? terminal.height + 40 : 500);
        this.scale = options.scale ?? 1.0;

        // State
        this.zIndex = 0;
        this.minimized = false;
        this.focused = false;
        this.closed = false;
        this.maximized = false;
        this.restoreSize = null;
        this.restorePos = null;

        // Drag state
        this.dragging = false;
        this.resizing = false;
        this.dragOffset = { x: 0, y: 0 };

        // Physics (when moving)
        this.velocity = { x: 0, y: 0 };
        this.physicsEnabled = false;

        // NEB integration
        this.nebBus = options.nebBus || null;
        this.subscriptions = [];

        // Callbacks
        this.onFocusRequest = null;
        this.onPositionChange = null;
        this.onResize = null;
        this.onClose = null;

        // Container setup
        this.container = new PIXI.Container();
        this.container.x = this.x;
        this.container.y = this.y;
        this.container.sortableChildren = true;

        // Create window chrome (title bar, borders)
        this._createChrome();

        // Add terminal content
        this.contentContainer = new PIXI.Container();
        this.contentContainer.y = 30; // Below title bar
        if (terminal && terminal.container) {
            this.contentContainer.addChild(terminal.container);
        }
        this.container.addChild(this.contentContainer);

        // Setup interaction
        this._initInteraction();

        // Register with NEB
        if (this.nebBus) {
            this._registerWithNEB();
        }
    }

    _createChrome() {
        // Title bar background
        this.titleBar = new PIXI.Graphics();
        this._drawTitleBar();
        this.container.addChild(this.titleBar);

        // Title text
        this.titleText = new PIXI.Text(this.id, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xffffff
        });
        this.titleText.x = 10;
        this.titleText.y = 8;
        this.container.addChild(this.titleText);

        // Window control buttons
        this._createWindowControls();

        // Resize handle
        this.resizeHandle = new PIXI.Graphics();
        this._drawResizeHandle();
        this.container.addChild(this.resizeHandle);

        // Border
        this.border = new PIXI.Graphics();
        this._drawBorder();
        this.container.addChild(this.border);
    }

    _createWindowControls() {
        const btnY = 8;
        const startX = this.width - 50;

        // Close button
        this.closeBtn = new PIXI.Graphics();
        this.closeBtn.beginFill(0xff4444);
        this.closeBtn.drawCircle(startX + 8, btnY + 6, 5);
        this.closeBtn.endFill();
        this.closeBtn.eventMode = 'static';
        this.closeBtn.cursor = 'pointer';
        this.closeBtn.on('pointerdown', (e) => {
            e.stopPropagation();
            this.destroy();
        });
        this.container.addChild(this.closeBtn);

        // Minimize button
        this.minBtn = new PIXI.Graphics();
        this.minBtn.beginFill(0xffff44);
        this.minBtn.drawCircle(startX + 24, btnY + 6, 5);
        this.minBtn.endFill();
        this.minBtn.eventMode = 'static';
        this.minBtn.cursor = 'pointer';
        this.minBtn.on('pointerdown', (e) => {
            e.stopPropagation();
            this.toggleMinimize();
        });
        this.container.addChild(this.minBtn);

        // Maximize button
        this.maxBtn = new PIXI.Graphics();
        this.maxBtn.beginFill(0x44ff44);
        this.maxBtn.drawCircle(startX + 40, btnY + 6, 5);
        this.maxBtn.endFill();
        this.maxBtn.eventMode = 'static';
        this.maxBtn.cursor = 'pointer';
        this.maxBtn.on('pointerdown', (e) => {
            e.stopPropagation();
            this.toggleMaximize();
        });
        this.container.addChild(this.maxBtn);
    }

    _drawResizeHandle() {
        this.resizeHandle.clear();
        this.resizeHandle.beginFill(0x00ff88, 0.3);
        this.resizeHandle.moveTo(this.width - 16, this.height - 4);
        this.resizeHandle.lineTo(this.width - 4, this.height - 4);
        this.resizeHandle.lineTo(this.width - 4, this.height - 16);
        this.resizeHandle.lineTo(this.width - 16, this.height - 4);
        this.resizeHandle.endFill();
        this.resizeHandle.eventMode = 'static';
        this.resizeHandle.cursor = 'nwse-resize';
    }

    _drawTitleBar() {
        this.titleBar.clear();
        const color = this.focused ? 0x00AAFF : 0x333344;
        this.titleBar.beginFill(color);
        this.titleBar.drawRoundedRect(0, 1, this.width - 2, 25, 8);
        this.titleBar.endFill();

        // Keep rounded corners only on top
        this.titleBar.beginFill(color);
        this.titleBar.drawRect(1, 15, this.width - 2, 10);
        this.titleBar.endFill();
    }

    _drawBorder() {
        this.border.clear();
        const borderColor = this.focused ? 0x00FFFF : 0x444455;
        this.border.lineStyle(2, borderColor, 0.8);
        this.border.drawRoundedRect(0, 1, this.width - 2, this.height - 2, 8);
    }

    _initInteraction() {
        this.container.eventMode = 'static';
        this.container.cursor = 'default';

        // Title bar is draggable
        this.titleBar.eventMode = 'static';
        this.titleBar.cursor = 'move';

        this.titleBar.on('pointerdown', (e) => this._onDragStart(e));
        this.container.on('pointerup', () => this._onDragEnd());
        this.container.on('pointerupoutside', () => this._onDragEnd());
        this.container.on('pointermove', (e) => this._onDragMove(e));

        // Resize handle
        this.resizeHandle.on('pointerdown', (e) => {
            this.resizing = true;
            this.dragOffset = { x: this.width, y: this.height };
            e.stopPropagation();
        });

        // Focus on click
        this.container.on('pointerdown', () => {
            if (this.onFocusRequest) this.onFocusRequest(this);
        });
    }

    _onDragStart(e) {
        this.dragging = true;
        this.physicsEnabled = true;
        const pos = e.data.global;
        this.dragOffset = {
            x: pos.x - this.container.x,
            y: pos.y - this.container.y
        };
        this._updateVisualState('dragging');
    }

    _onDragMove(e) {
        const pos = e.data.global;

        if (this.dragging) {
            const newX = pos.x - this.dragOffset.x;
            const newY = pos.y - this.dragOffset.y;

            // Calculate velocity for physics
            this.velocity = {
                x: newX - this.container.x,
                y: newY - this.container.y
            };

            this.container.x = newX;
            this.container.y = newY;
            this.x = newX;
            this.y = newY;
        }

        if (this.resizing) {
            const newWidth = Math.max(300, pos.x - this.container.x);
            const newHeight = Math.max(200, pos.y - this.container.y);
            this.resize(newWidth, newHeight);
        }
    }

    _onDragEnd() {
        const wasDragging = this.dragging;
        const wasResizing = this.resizing;

        this.dragging = false;
        this.resizing = false;
        this._updateVisualState(this.focused ? 'focused' : 'normal');

        // Notify position change
        if (wasDragging && this.onPositionChange) {
            this.onPositionChange(this);
        }
    }

    _updateVisualState(state) {
        switch (state) {
            case 'dragging':
                this.container.alpha = 0.85;
                this._drawBorder();
                break;
            case 'focused':
                this.container.alpha = 1;
                this.focused = true;
                this._drawTitleBar();
                this._drawBorder();
                break;
            case 'normal':
                this.container.alpha = 1;
                this.focused = false;
                this._drawTitleBar();
                this._drawBorder();
                break;
        }
    }

    toggleMinimize() {
        this.minimized = !this.minimized;

        if (this.minimized) {
            this.contentContainer.visible = false;
            this.resizeHandle.visible = false;
            this.height = 30; // Title bar only
        } else {
            this.contentContainer.visible = true;
            this.resizeHandle.visible = true;
            this.height = this.terminal.height ? this.terminal.height + 40 : 500;
        }

        this._drawBorder();
        this._drawResizeHandle();
    }

    toggleMaximize() {
        if (this.maximized) {
            // Restore
            this.resize(this.restoreSize.width, this.restoreSize.height);
            this.setPosition(this.restorePos.x, this.restorePos.y);
            this.maximized = false;
        } else {
            // Maximize
            this.restoreSize = { width: this.width, height: this.height };
            this.restorePos = { x: this.x, y: this.y };
            const screen = this.container.parent?.parent?.screen || { width: 1920, height: 1080 };
            this.resize(screen.width, screen.height);
            this.setPosition(0, 0);
            this.maximized = true;
        }
    }

    resize(width, height) {
        this.width = width;
        this.height = height;

        // Redraw chrome
        this._drawTitleBar();
        this._drawBorder();
        this._drawResizeHandle();
        this._updateControlPositions();

        // Resize terminal content
        if (this.terminal && this.terminal.resize) {
            this.terminal.resize(width - 20, height - 40);
        }

        if (this.onResize) {
            this.onResize(width, height);
        }

        // Notify NEB
        if (this.nebBus) {
            this.nebBus.publish('window.resized', {
                windowId: this.id,
                size: { width, height }
            });
        }
    }

    _updateControlPositions() {
        const btnY = 8;
        const startX = this.width - 50;

        this.closeBtn.clear();
        this.closeBtn.beginFill(0xff4444);
        this.closeBtn.drawCircle(startX + 8, btnY + 6, 5);
        this.closeBtn.endFill();

        this.minBtn.clear();
        this.minBtn.beginFill(0xffff44);
        this.minBtn.drawCircle(startX + 24, btnY + 6, 5);
        this.minBtn.endFill();

        this.maxBtn.clear();
        this.maxBtn.beginFill(0x44ff44);
        this.maxBtn.drawCircle(startX + 40, btnY + 6, 5);
        this.maxBtn.endFill();
    }

    focus() {
        this.focused = true;
        this._updateVisualState('focused');
        this.container.zIndex = 100;

        // Notify NEB
        if (this.nebBus) {
            this.nebBus.publish('window.focus', {
                windowId: this.id
            });
        }
    }

    blur() {
        this.focused = false;
        this._updateVisualState('normal');
        this.container.zIndex = 0;
    }

    /**
     * Register with Neural Event Bus.
     */
    _registerWithNEB() {
        // Subscribe to window events
        this.subscriptions.push(
            this.nebBus.subscribe('window.focus', (signal) => {
                if (signal.payload.windowId !== this.id) {
                    this.blur();
                }
            })
        );

        this.subscriptions.push(
            this.nebBus.subscribe('window.move', (signal) => {
                if (signal.payload.windowId === this.id) {
                    this.setPosition(signal.payload.x, signal.payload.y);
                }
            })
        );

        this.subscriptions.push(
            this.nebBus.subscribe('window.resize', (signal) => {
                if (signal.payload.windowId === this.id) {
                    this.resize(signal.payload.width, signal.payload.height);
                }
            })
        );

        // Publish creation
        this.nebBus.publish('window.created', {
            windowId: this.id,
            type: this.type,
            position: { x: this.x, y: this.y },
            size: { width: this.width, height: this.height }
        });
    }

    setTitle(title) {
        this.titleText.text = title;
    }

    getPosition() {
        return { x: this.x, y: this.y, width: this.width, height: this.height };
    }

    setPosition(x, y) {
        this.x = x;
        this.y = y;
        this.container.x = x;
        this.container.y = y;
    }

    /**
     * Get particle state for serialization.
     */
    getState() {
        return {
            id: this.id,
            type: this.type,
            position: { x: this.x, y: this.y },
            size: { width: this.width, height: this.height },
            scale: this.scale,
            zIndex: this.zIndex,
            title: this.titleText.text,
            focused: this.focused,
            minimized: this.minimized,
            maximized: this.maximized
        };
    }

    /**
     * Restore from state.
     */
    restoreState(state) {
        this.setPosition(state.position.x, state.position.y);
        this.resize(state.size.width, state.size.height);
        this.setTitle(state.title);
        if (state.focused) this.focus();
        if (state.minimized) this.toggleMinimize();
    }

    destroy() {
        // Notify NEB
        if (this.nebBus) {
            this.nebBus.publish('window.closed', {
                windowId: this.id
            });
        }

        // Cleanup subscriptions
        for (const unsub of this.subscriptions) {
            if (typeof unsub === 'function') unsub();
        }

        // Callback
        if (this.onClose) {
            this.onClose(this);
        }

        this.container.destroy({ children: true });
        this.closed = true;
    }
}
