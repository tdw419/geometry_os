/**
 * Geometry OS: TerminalWindowCompat
 *
 * A PIXI-based terminal window compatible with TerminalWindowParticle.
 * Provides visual window chrome with simulated terminal content.
 */

class TerminalWindowCompat extends PIXI.Container {
    static nextId = 1;

    constructor(options = {}) {
        super();

        this.id = options.id || `term-${TerminalWindowCompat.nextId++}`;

        // Dimensions
        this.windowWidth = options.width || 800;
        this.windowHeight = options.height || 500;

        // State
        this.focused = false;
        this.closed = false;

        // Graphics
        this.background = new PIXI.Graphics();
        this.border = new PIXI.Graphics();
        this.titleBar = new PIXI.Graphics();
        this.content = new PIXI.Graphics();

        // Add to container
        this.addChild(this.background);
        this.addChild(this.border);
        this.addChild(this.titleBar);
        this.addChild(this.content);

        // Title text
        this.titleText = new PIXI.Text(options.title || 'Terminal', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xffffff
        });
        this.titleText.x = 10;
        this.titleText.y = 8;
        this.addChild(this.titleText);

        // Simulated terminal lines
        this._lines = [
            '$ Geometry OS Terminal',
            '$ Ready.',
            ''
        ];
        this._lineTexts = [];

        // Draw initial state
        this._draw();

        // Setup interaction
        this.eventMode = 'static';
        this.interactive = true;

        // Simulate typing
        this._typeIndex = 0;
        this._typeTimer = null;
    }

    _draw() {
        const w = this.windowWidth;
        const h = this.windowHeight;

        // Background
        this.background.clear();
        this.background.beginFill(0x1a1a2e, 0.95);
        this.background.drawRoundedRect(0, 0, w, h, 8);
        this.background.endFill();

        // Border
        const borderColor = this.focused ? 0x00ffff : 0x00ff00;
        this.border.clear();
        this.border.lineStyle(2, borderColor, 1);
        this.border.drawRoundedRect(0, 0, w, h, 8);

        // Title bar
        const titleColor = this.focused ? 0x005577 : 0x333344;
        this.titleBar.clear();
        this.titleBar.beginFill(titleColor);
        this.titleBar.drawRoundedRect(0, 0, w, 28, 8);
        this.titleBar.endFill();
        // Cover bottom corners of title bar
        this.titleBar.beginFill(titleColor);
        this.titleBar.drawRect(0, 14, w, 14);
        this.titleBar.endFill();

        // Content area
        this._drawContent();
    }

    _drawContent() {
        const startY = 35;
        const lineHeight = 18;
        const padding = 10;

        this.content.clear();
        this.content.beginFill(0x0a0a14, 1);
        this.content.drawRoundedRect(4, startY, this.windowWidth - 8, this.windowHeight - startY - 4, 4);
        this.content.endFill();

        // Remove old line texts
        this._lineTexts.forEach(t => t.destroy());
        this._lineTexts = [];

        // Draw lines
        this._lines.forEach((line, i) => {
            const text = new PIXI.Text(line, {
                fontFamily: 'Courier New',
                fontSize: 13,
                fill: this._getLineColor(line)
            });
            text.x = padding + 4;
            text.y = startY + 5 + i * lineHeight;
            this.addChild(text);
            this._lineTexts.push(text);
        });
    }

    _getLineColor(line) {
        if (line.startsWith('$')) return 0x00ff88;
        if (line.includes('error') || line.includes('Error')) return 0xff4444;
        if (line.includes('warning') || line.includes('Warning')) return 0xffff44;
        return 0xaaaaaa;
    }

    _updateOverlayPosition() {
        // Placeholder for compatibility
    }

    focus() {
        if (this.focused) return;
        this.focused = true;
        this._draw();
        this.emit('focus');
    }

    blur() {
        if (!this.focused) return;
        this.focused = false;
        this._draw();
        this.emit('blur');
    }

    close() {
        if (this.closed) return;
        this.closed = true;
        this.emit('closed');
        this.destroy();
    }

    setTitle(title) {
        this.titleText.text = title;
    }

    // Simulate receiving output
    write(text) {
        const lines = text.split('\n');
        lines.forEach(line => {
            if (this._lines.length > 20) {
                this._lines.shift();
            }
            this._lines.push(line);
        });
        this._drawContent();
    }

    // Simulate typing demo
    startTypingDemo() {
        const commands = [
            'ls -la',
            'cat manifest.json',
            'echo "Hello, Geometry OS!"',
            'pwd',
            'date'
        ];

        let cmdIndex = 0;

        this._typeTimer = setInterval(() => {
            if (cmdIndex >= commands.length) {
                clearInterval(this._typeTimer);
                return;
            }

            this.write(`$ ${commands[cmdIndex]}`);
            this._simulateOutput(commands[cmdIndex]);
            cmdIndex++;
        }, 2000);
    }

    _simulateOutput(cmd) {
        setTimeout(() => {
            if (cmd === 'ls -la') {
                this.write('total 48\ndrwxr-xr-x  2 user user 4096 Feb 27 .\ndrwxr-xr-x  3 user user 4096 Feb 26 ..\n-rw-r--r--  1 user user 1234 Feb 27 manifest.json');
            } else if (cmd.startsWith('cat')) {
                this.write('{\n  "name": "geometry-os",\n  "version": "1.0.0",\n  "terminal": "morphological"\n}');
            } else if (cmd.startsWith('echo')) {
                this.write('Hello, Geometry OS!');
            } else if (cmd === 'pwd') {
                this.write('/home/user/geometry-os');
            } else if (cmd === 'date') {
                this.write(new Date().toString());
            }
        }, 500);
    }

    stopTypingDemo() {
        if (this._typeTimer) {
            clearInterval(this._typeTimer);
            this._typeTimer = null;
        }
    }

    destroy(options) {
        this.stopTypingDemo();
        this._lineTexts.forEach(t => t.destroy());
        this._lineTexts = [];
        super.destroy(options);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.TerminalWindowCompat = TerminalWindowCompat;
}
