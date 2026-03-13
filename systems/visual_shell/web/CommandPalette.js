/**
 * CommandPalette.js
 *
 * App launcher triggered by backtick (`) key.
 * Filters available apps and sends load request to bridge.
 */

export class CommandPalette {
    constructor(client, options = {}) {
        this.client = client;
        this.options = {
            triggerKey: 192,  // Backtick
            fontFamily: 'Courier New, monospace',
            fontSize: 14,
            ...options
        };

        this.visible = false;
        this.filter = '';
        this.apps = [];
        this.selectedIndex = 0;
        this.container = null;
        this.inputText = null;
        this.listContainer = null;

        this._createUI();
        this._setupKeyHandler();
    }

    _createUI() {
        // Main container (hidden by default)
        this.container = new PIXI.Container();
        this.container.visible = false;

        const width = 400;
        const height = 300;

        // Background overlay (semi-transparent)
        const overlay = new PIXI.Graphics();
        overlay.beginFill(0x000000, 0.7);
        overlay.drawRect(0, 0, globalThis.innerWidth || 800, globalThis.innerHeight || 600);
        overlay.endFill();
        overlay.eventMode = 'static';
        overlay.on('pointerdown', () => this.hide());
        this.container.addChild(overlay);

        // Palette box
        const boxX = ((globalThis.innerWidth || 800) - width) / 2;
        const boxY = 100;

        const box = new PIXI.Graphics();
        box.beginFill(0x1a1a2e);
        box.lineStyle(2, 0x00ff88);
        box.drawRoundedRect(boxX, boxY, width, height, 8);
        box.endFill();
        this.container.addChild(box);

        // Input field background
        const inputBg = new PIXI.Graphics();
        inputBg.beginFill(0x0f0f1a);
        inputBg.drawRoundedRect(boxX + 10, boxY + 10, width - 20, 40, 4);
        inputBg.endFill();
        this.container.addChild(inputBg);

        // Input text (shows filter)
        this.inputText = new PIXI.Text('>', {
            fontFamily: this.options.fontFamily,
            fontSize: this.options.fontSize,
            fill: 0x00ff88,
        });
        this.inputText.x = boxX + 20;
        this.inputText.y = boxY + 20;
        this.container.addChild(this.inputText);

        // List container
        this.listContainer = new PIXI.Container();
        this.listContainer.x = boxX + 10;
        this.listContainer.y = boxY + 60;
        this.container.addChild(this.listContainer);

        // Instructions
        const instructions = new PIXI.Text('Type to filter, Enter to launch, Esc to close', {
            fontFamily: this.options.fontFamily,
            fontSize: 10,
            fill: 0x666666,
        });
        instructions.x = boxX + 10;
        instructions.y = boxY + height - 25;
        this.container.addChild(instructions);
    }

    _setupKeyHandler() {
        globalThis.addEventListener('keydown', (e) => {
            // Toggle on backtick
            if (e.keyCode === this.options.triggerKey) {
                e.preventDefault();
                this.toggle();
                return;
            }

            if (!this.visible) return;

            // Escape closes
            if (e.keyCode === 27) {
                this.hide();
                return;
            }

            // Enter launches selected
            if (e.keyCode === 13) {
                this._launchSelected();
                return;
            }

            // Up/Down navigation
            if (e.keyCode === 38) {  // Up
                e.preventDefault();
                this._selectPrevious();
                return;
            }
            if (e.keyCode === 40) {  // Down
                e.preventDefault();
                this._selectNext();
                return;
            }

            // Typing updates filter
            if (e.key.length === 1 && !e.ctrlKey && !e.metaKey) {
                this.filter += e.key.toLowerCase();
                this._updateList();
            } else if (e.keyCode === 8) {  // Backspace
                this.filter = this.filter.slice(0, -1);
                this._updateList();
            }
        });
    }

    setApps(apps) {
        this.apps = apps;
        this._updateList();
    }

    toggle() {
        if (this.visible) {
            this.hide();
        } else {
            this.show();
        }
    }

    show() {
        this.visible = true;
        this.filter = '';
        this.selectedIndex = 0;
        this.container.visible = true;
        this._updateList();

        // Request app list from server
        this.client.send({ type: 'list_apps', data: {} });
    }

    hide() {
        this.visible = false;
        this.container.visible = false;
    }

    _getFilteredApps() {
        if (!this.filter) return this.apps;

        return this.apps.filter(app => {
            const name = app.toLowerCase();
            // Simple substring match
            return name.includes(this.filter);
        });
    }

    _updateList() {
        // Clear existing list items
        while (this.listContainer.children.length > 0) {
            this.listContainer.removeChildAt(0);
        }

        // Update input text
        this.inputText.text = `> ${this.filter}_`;

        // Get filtered apps
        const filtered = this._getFilteredApps();

        // Clamp selection
        if (this.selectedIndex >= filtered.length) {
            this.selectedIndex = Math.max(0, filtered.length - 1);
        }

        // Draw list items
        filtered.slice(0, 8).forEach((app, i) => {
            const isSelected = i === this.selectedIndex;

            const itemBg = new PIXI.Graphics();
            itemBg.beginFill(isSelected ? 0x00ff88 : 0x1a1a2e);
            itemBg.drawRoundedRect(0, i * 28, 380, 26, 4);
            itemBg.endFill();
            itemBg.eventMode = 'static';
            itemBg.on('pointerdown', () => {
                this.selectedIndex = i;
                this._launchSelected();
            });
            this.listContainer.addChild(itemBg);

            const itemText = new PIXI.Text(app, {
                fontFamily: this.options.fontFamily,
                fontSize: this.options.fontSize,
                fill: isSelected ? 0x000000 : 0xffffff,
            });
            itemText.x = 10;
            itemText.y = i * 28 + 5;
            this.listContainer.addChild(itemText);
        });
    }

    _selectNext() {
        const filtered = this._getFilteredApps();
        if (this.selectedIndex < filtered.length - 1) {
            this.selectedIndex++;
            this._updateList();
        }
    }

    _selectPrevious() {
        if (this.selectedIndex > 0) {
            this.selectedIndex--;
            this._updateList();
        }
    }

    _launchSelected() {
        const filtered = this._getFilteredApps();
        if (filtered.length === 0) return;

        const appName = filtered[this.selectedIndex];
        this.client.send({
            type: 'load_app_by_name',
            data: { name: appName }
        });
        this.hide();
    }

    addToContainer(container) {
        container.addChild(this.container);
    }
}
