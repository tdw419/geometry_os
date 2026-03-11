/**
 * Terminal Tile Renderer for PixiJS Infinite Map
 *
 * Renders G-Shell terminal output as a live, glowing tile on the visual substrate.
 * Connects to TerminalWebSocketBridge for real-time updates.
 *
 * Architecture:
 * ┌─────────────────────────────────────────────────────────────────┐
 * │ TerminalWebSocketBridge (ws://localhost:8766)                   │
 * │   ↓ broadcasts terminal_content events                          │
 * │ PixiJS Stage                                                    │
 * │   └─ TerminalTile (this class)                                  │
 * │       ├─ Background (with glow shader)                          │
 * │       ├─ Text content (monospace)                               │
 * │       └─ Hilbert entropy overlay (optional)                     │
 * └─────────────────────────────────────────────────────────────────┘
 *
 * Usage:
 *   const terminalTile = new TerminalTile({
 *     x: 100, y: 100,
 *     width: 800, height: 600,
 *     websocketUrl: 'ws://localhost:8766'
 *   });
 *   app.stage.addChild(terminalTile.container);
 */

import * as PIXI from 'pixi.js';

export class TerminalTile {
    constructor(options = {}) {
        this.options = {
            x: options.x || 0,
            y: options.y || 0,
            width: options.width || 800,
            height: options.height || 600,
            websocketUrl: options.websocketUrl || 'ws://localhost:8766',
            fontSize: options.fontSize || 14,
            fontFamily: options.fontFamily || 'monospace',
            backgroundColor: options.backgroundColor || 0x0a0a0a,
            textColor: options.textColor || 0x00ff00,
            glowColor: options.glowColor || 0x00ff88,
            glowIntensity: options.glowIntensity || 0.5,
            autoConnect: options.autoConnect !== false,
            tileId: options.tileId || 0
        };

        this.container = new PIXI.Container();
        this.container.x = this.options.x;
        this.container.y = this.options.y;

        this.content = '';
        this.ws = null;
        this.connected = false;
        this.lastUpdate = 0;

        this._init();
    }

    _init() {
        // Background with glow
        this.background = new PIXI.Graphics();
        this.container.addChild(this.background);

        // Text content container
        this.textContainer = new PIXI.Container();
        this.container.addChild(this.textContainer);

        // Content text
        const textStyle = new PIXI.TextStyle({
            fontFamily: this.options.fontFamily,
            fontSize: this.options.fontSize,
            fill: this.options.textColor,
            wordWrap: true,
            wordWrapWidth: this.options.width - 20,
            leading: 2
        });

        this.textDisplay = new PIXI.Text('', textStyle);
        this.textDisplay.x = 10;
        this.textDisplay.y = 10;
        this.textContainer.addChild(this.textDisplay);

        // Title bar
        this.titleBar = new PIXI.Graphics();
        this.container.addChild(this.titleBar);

        // Status indicator
        this.statusIndicator = new PIXI.Graphics();
        this.container.addChild(this.statusIndicator);

        // Draw initial state
        this._drawBackground();
        this._drawTitleBar();
        this._updateStatusIndicator();

        // Connect to WebSocket
        if (this.options.autoConnect) {
            this.connect();
        }
    }

    _drawBackground() {
        const { width, height, backgroundColor, glowColor, glowIntensity } = this.options;

        this.background.clear();

        // Outer glow (multiple passes for blur effect)
        const glowLayers = 5;
        for (let i = glowLayers; i > 0; i--) {
            const alpha = (glowIntensity * 0.1) * (i / glowLayers);
            const expand = i * 4;

            this.background.beginFill(glowColor, alpha);
            this.background.drawRoundedRect(
                -expand, -expand,
                width + expand * 2, height + expand * 2,
                8 + expand
            );
            this.background.endFill();
        }

        // Main background
        this.background.beginFill(backgroundColor, 0.95);
        this.background.drawRoundedRect(0, 0, width, height, 8);
        this.background.endFill();

        // Border
        this.background.lineStyle(2, glowColor, glowIntensity);
        this.background.drawRoundedRect(0, 0, width, height, 8);

        // Scan lines effect (optional)
        this.background.lineStyle(1, 0x00ff00, 0.03);
        for (let y = 0; y < height; y += 3) {
            this.background.moveTo(0, y);
            this.background.lineTo(width, y);
        }
    }

    _drawTitleBar() {
        const { width } = this.options;

        this.titleBar.clear();

        // Title bar background
        this.titleBar.beginFill(0x1a1a1a, 0.9);
        this.titleBar.drawRoundedRect(0, 0, width, 30, 8, 8, 0, 0);
        this.titleBar.endFill();

        // Title text
        if (!this.titleText) {
            this.titleText = new PIXI.Text('G-SHELL', {
                fontFamily: 'monospace',
                fontSize: 12,
                fill: 0x00ff88
            });
            this.titleText.x = 10;
            this.titleText.y = 8;
            this.titleBar.addChild(this.titleText);
        }
    }

    _updateStatusIndicator() {
        this.statusIndicator.clear();

        const color = this.connected ? 0x00ff00 : 0xff4444;
        const alpha = this.connected ? 0.8 : 0.5;

        this.statusIndicator.beginFill(color, alpha);
        this.statusIndicator.drawCircle(this.options.width - 15, 15, 5);
        this.statusIndicator.endFill();
    }

    connect() {
        if (this.ws) {
            this.ws.close();
        }

        try {
            this.ws = new WebSocket(this.options.websocketUrl);

            this.ws.onopen = () => {
                this.connected = true;
                this._updateStatusIndicator();
                console.log('✅ Terminal Tile connected to WS bridge');

                // Request initial state
                this.ws.send(JSON.stringify({ action: 'get_terminal_state' }));
            };

            this.ws.onmessage = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    this._handleMessage(data);
                } catch (e) {
                    console.error('Failed to parse terminal message:', e);
                }
            };

            this.ws.onclose = () => {
                this.connected = false;
                this._updateStatusIndicator();
                console.log('❌ Terminal Tile disconnected from WS bridge');

                // Reconnect after delay
                setTimeout(() => {
                    if (this.options.autoConnect) {
                        this.connect();
                    }
                }, 3000);
            };

            this.ws.onerror = (error) => {
                console.error('Terminal Tile WS error:', error);
            };

        } catch (error) {
            console.error('Failed to connect Terminal Tile:', error);
        }
    }

    _handleMessage(data) {
        const { action } = data;

        if (action === 'terminal_state') {
            // Full state update
            if (data.fragment_content) {
                this.updateContent(data.fragment_content);
            }
            if (data.tiles) {
                this._handleTiles(data.tiles);
            }
        } else if (action === 'terminal_content') {
            // Content-only update
            this.updateContent(data.content);
        } else if (action === 'tile_update') {
            // Single tile update
            this._handleTileUpdate(data.tile);
        }
    }

    _handleTiles(tiles) {
        // Handle multiple tiles (future: multiple terminal sessions)
        for (const [tid, tile] of Object.entries(tiles)) {
            if (parseInt(tid) === this.options.tileId) {
                this.updateContent(tile.content);
                this._updateGlow(tile.glow_intensity);
            }
        }
    }

    _handleTileUpdate(tile) {
        if (tile.tile_id === this.options.tileId) {
            this.updateContent(tile.content);
            this._updateGlow(tile.glow_intensity);
        }
    }

    updateContent(content) {
        this.content = content;
        this.lastUpdate = Date.now();

        // Clean up ANSI codes for display
        const cleanContent = this._stripAnsi(content);

        // Update text display
        this.textDisplay.text = cleanContent;

        // Scroll to bottom (show most recent content)
        const textHeight = this.textDisplay.height;
        const maxHeight = this.options.height - 50;

        if (textHeight > maxHeight) {
            this.textDisplay.y = 40 - (textHeight - maxHeight);
        } else {
            this.textDisplay.y = 40;
        }

        // Pulse glow on update
        this._pulseGlow();
    }

    _stripAnsi(text) {
        // Remove ANSI escape codes
        return text.replace(/\x1b\[[0-9;]*m/g, '')
                   .replace(/\x1b\][^\x07]*\x07/g, '')
                   .replace(/\[.*?m/g, '');
    }

    _updateGlow(intensity) {
        this.options.glowIntensity = intensity;
        this._drawBackground();
    }

    _pulseGlow() {
        // Brief glow pulse on content update
        const originalIntensity = this.options.glowIntensity;
        this.options.glowIntensity = Math.min(1.0, originalIntensity + 0.3);
        this._drawBackground();

        // Fade back
        setTimeout(() => {
            this.options.glowIntensity = originalIntensity;
            this._drawBackground();
        }, 200);
    }

    setPosition(x, y) {
        this.container.x = x;
        this.container.y = y;
        this.options.x = x;
        this.options.y = y;
    }

    resize(width, height) {
        this.options.width = width;
        this.options.height = height;

        this.textDisplay.style.wordWrapWidth = width - 20;
        this._drawBackground();
        this._drawTitleBar();
    }

    destroy() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        this.container.destroy({ children: true });
    }
}

export default TerminalTile;
