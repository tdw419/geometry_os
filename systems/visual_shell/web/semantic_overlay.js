/**
 * SemanticOverlay - Visualizes what the AI "sees" on the PixelRTS surface
 * 
 * Draws bounding boxes and labels over the hypervisor cartridge to show
 * detected UI elements (VisionCortex output). This creates the "AI Buttons"
 * visualization.
 */

class SemanticOverlay {
    constructor(app) {
        this.app = app;
        this.container = new PIXI.Container();
        this.container.zIndex = 1000; // Float above everything
        this.app.stage.addChild(this.container);

        this.graphics = new PIXI.Graphics();
        this.textContainer = new PIXI.Container();
        this.container.addChild(this.graphics);
        this.container.addChild(this.textContainer);

        this.visible = false;
        this.fadeTimeout = null;

        // Listen for semantic updates from WebMCP bridge
        window.addEventListener('hypervisor-semantic-update', (e) => {
            this.render(e.detail);
        });
    }

    /**
     * Render semantic frame data
     * @param {Object} frame - Structured VisionCortex output
     */
    render(frame) {
        this.graphics.clear();
        this.textContainer.removeChildren();

        if (!frame || !frame.success) return;

        this.visible = true;
        this.container.alpha = 1;

        // Style: "Cyberpunk HUD"
        const colors = {
            window: 0x00FFFF, // Cyan
            button: 0xFF00FF, // Magenta
            text_field: 0x00FF00, // Green
            text: 0xAAAAAA   // Gray
        };

        // Draw Windows
        if (frame.windows) {
            frame.windows.forEach(win => {
                this.#drawBox(win.bounds, colors.window, 2, 0.1);
                this.#drawLabel(win.bounds, win.title || 'Window', colors.window);
            });
        }

        // Draw Buttons (The "AI Buttons")
        if (frame.buttons) {
            frame.buttons.forEach(btn => {
                this.#drawBox(btn.bounds, colors.button, 2, 0.2);
                // this.#drawLabel(btn.bounds, btn.label, colors.button);
            });
        }

        // Draw Text Fields
        if (frame.text_fields) {
            frame.text_fields.forEach(field => {
                this.#drawBox(field.bounds, colors.text_field, 1, 0.1);
            });
        }

        // Auto-fade after 3 seconds
        if (this.fadeTimeout) clearTimeout(this.fadeTimeout);
        this.fadeTimeout = setTimeout(() => {
            this.#fadeOut();
        }, 3000);
    }

    #drawBox(bounds, color, thick = 1, fillAlpha = 0) {
        this.graphics.lineStyle(thick, color, 0.8);
        if (fillAlpha > 0) {
            this.graphics.beginFill(color, fillAlpha);
        }

        // Scale/Project coordinates if necessary (assuming 1:1 mapping for now)
        // In a real infinite map, we'd need to project from Cartridge UVs to World Space
        // For this demo, we assume the overlay sits directly on the cartridge sprite
        this.graphics.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);

        if (fillAlpha > 0) {
            this.graphics.endFill();
        }
    }

    #drawLabel(bounds, text, color) {
        if (!text) return;

        const style = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: color,
            padding: 2,
            background: 0x000000,
            dropShadow: true,
            dropShadowAlpha: 0.5
        });

        const label = new PIXI.Text(text.substring(0, 20), style);
        label.x = bounds.x;
        label.y = bounds.y - 12;
        this.textContainer.addChild(label);
    }

    #fadeOut() {
        // Simple tween logic
        const fade = setInterval(() => {
            this.container.alpha -= 0.1;
            if (this.container.alpha <= 0) {
                this.container.alpha = 0;
                this.visible = false;
                clearInterval(fade);
            }
        }, 50);
    }
}

// Export for usage
window.SemanticOverlay = SemanticOverlay;
