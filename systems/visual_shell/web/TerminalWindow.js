/**
 * Geometry OS: TerminalWindow
 *
 * Wraps GeometricTerminal with window management capabilities.
 * - Draggable on infinite map
 * - Minimize/maximize
 * - Focus management
 * - Visual state feedback
 */

export class TerminalWindow {
    static nextId = 1;

    constructor(terminal, options = {}) {
        this.id = options.id || `terminal-${TerminalWindow.nextId++}`;
        this.terminal = terminal;

        // Position and size
        this.x = options.x ?? 100;
        this.y = options.y ?? 100;
        this.width = options.width ?? (terminal.width ? terminal.width + 20 : 800);
        this.height = options.height ?? (terminal.height ? terminal.height + 40 : 500);

        // State
        this.zIndex = 0;
        this.minimized = false;
        this.focused = false;
        this.closed = false;

        // Drag state
        this.dragging = false;
        this.dragOffset = { x: 0, y: 0 };

        // Physics (when moving)
        this.velocity = { x: 0, y: 0 };
        this.physicsEnabled = false;

        // Callbacks
        this.onFocusRequest = null;
        this.onPositionChange = null;

        // Container setup
        this.container = new PIXI.Container();
        this.container.x = this.x;
        this.container.y = this.y;

        // Create window chrome (title bar, borders)
        this._createChrome();

        // Add terminal content
        this.contentContainer = new PIXI.Container();
        this.contentContainer.y = 30; // Below title bar
        this.contentContainer.addChild(terminal.container);
        this.container.addChild(this.contentContainer);

        // Setup interaction
        this._initInteraction();
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

        // Border
        this.border = new PIXI.Graphics();
        this._drawBorder();
        this.container.addChild(this.border);
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
        if (!this.dragging) return;

        const pos = e.data.global;
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

    _onDragEnd() {
        if (!this.dragging) return;
        this.dragging = false;
        this._updateVisualState(this.focused ? 'focused' : 'normal');

        // Notify position change
        if (this.onPositionChange) {
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
            this.height = 30; // Title bar only
        } else {
            this.contentContainer.visible = true;
            this.height = this.terminal.height ? this.terminal.height + 40 : 500;
        }

        this._drawBorder();
    }

    focus() {
        this.focused = true;
        this._updateVisualState('focused');
    }

    blur() {
        this.focused = false;
        this._updateVisualState('normal');
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

    destroy() {
        this.container.destroy({ children: true });
        this.closed = true;
    }
}
