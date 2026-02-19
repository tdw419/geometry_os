/**
 * DesktopWindow.js
 * A draggable window component for the Geometry OS desktop environment.
 */

class DesktopWindow extends PIXI.Container {
    constructor(title, x, y, width, height) {
        super();
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;

        this.interactive = true;
        this.dragging = false;
        this.dragData = null;
        this.minimized = false;
        this.originalHeight = height;

        // Make the entire window interactive for z-index management
        this.hitArea = new PIXI.Rectangle(0, 0, width, height);
        this.on('pointerdown', () => this.emit('pointerdown'));

        // Create the window frame using pixi-ui's MaskedFrame
        this.frame = new PIXI.Container();
        this.addChild(this.frame);

        // Background
        const bg = new PIXI.Graphics()
            .beginFill(0x2a2a2a, 0.9)
            .drawRect(0, 0, width, height)
            .endFill();
        this.frame.addChild(bg);

        // Title Bar
        const titleBar = new PIXI.Graphics()
            .beginFill(0x000000, 0.8)
            .drawRect(0, 0, width, 30)
            .endFill();
        titleBar.interactive = true;

        titleBar.on('pointerdown', this.onDragStart.bind(this));
        titleBar.on('pointerup', this.onDragEnd.bind(this));
        titleBar.on('pointerupoutside', this.onDragEnd.bind(this));
        titleBar.on('pointermove', this.onDragMove.bind(this));

        this.frame.addChild(titleBar);

        // Title Text
        this.titleText = new PIXI.Text(title, {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00ffff,
        });
        this.titleText.x = 10;
        this.titleText.y = 7;
        titleBar.addChild(this.titleText);

        // Window Control Buttons
        this.buttons = new PIXI.Container();
        this.buttons.x = width - 80;
        this.buttons.y = 5;
        titleBar.addChild(this.buttons);

        // Minimize button
        const minimizeBtn = this.createButton('_', 0x00ff00, this.minimize.bind(this));
        minimizeBtn.x = 0;
        this.buttons.addChild(minimizeBtn);

        // Maximize button
        const maximizeBtn = this.createButton('□', 0xffff00, this.toggleMaximize.bind(this));
        maximizeBtn.x = 25;
        this.buttons.addChild(maximizeBtn);

        // Close button
        const closeBtn = this.createButton('×', 0xff0000, this.close.bind(this));
        closeBtn.x = 50;
        this.buttons.addChild(closeBtn);

        // Content Area
        this.content = new PIXI.Container();
        this.content.x = 10;
        this.content.y = 40;
        this.frame.addChild(this.content);
    }

    createButton(label, color, onClick) {
        const button = new PIXI.Container();
        button.interactive = true;
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics()
            .beginFill(color, 0.8)
            .drawRect(0, 0, 20, 20)
            .endFill();
        button.addChild(bg);

        const text = new PIXI.Text(label, {
            fontFamily: 'Arial',
            fontSize: 14,
            fill: 0x000000,
            fontWeight: 'bold'
        });
        text.x = 6;
        text.y = 2;
        button.addChild(text);

        button.on('pointerdown', onClick);
        button.on('pointerover', () => bg.alpha = 1);
        button.on('pointerout', () => bg.alpha = 0.8);

        return button;
    }

    minimize() {
        this.minimized = !this.minimized;
        if (this.minimized) {
            this.content.visible = false;
            this.height = 30;
        } else {
            this.content.visible = true;
            this.height = this.originalHeight;
        }
        this.emit('minimized', this.minimized);
    }

    toggleMaximize() {
        // Simple maximize: just emit event for now
        // Full implementation would resize to screen dimensions
        this.emit('maximized');
    }

    close() {
        this.emit('closed');
        if (this.parent) {
            this.parent.removeChild(this);
        }
    }

    onDragStart(event) {
        this.dragData = event.data;
        this.alpha = 0.9;
        this.dragging = true;
        this.dragPoint = event.data.getLocalPosition(this.parent);
        this.dragPoint.x -= this.x;
        this.dragPoint.y -= this.y;
    }

    onDragEnd() {
        this.alpha = 1;
        this.dragging = false;
        this.dragData = null;
    }

    onDragMove() {
        if (this.dragging) {
            const newPoint = this.dragData.getLocalPosition(this.parent);
            this.x = newPoint.x - this.dragPoint.x;
            this.y = newPoint.y - this.dragPoint.y;
        }
    }

    setContent(pixiObject) {
        this.content.removeChildren();
        this.content.addChild(pixiObject);
    }
}
