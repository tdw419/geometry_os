/**
 * Geometry OS: Thinking Field - Thought Vector Visualization
 * 
 * Renders 512-dimensional thought vectors as 32x32 RGBA tiles.
 * Integrates with CALMAdapter thought streams.
 */

class ThinkingField {
    /**
     * @param {PIXI.Container} parentContainer - Container to add thoughts to
     * @param {Object} config - Configuration options
     */
    constructor(parentContainer, config = {}) {
        this.container = new PIXI.Container();
        this.container.name = "ThinkingField";
        this.container.zIndex = 200; // Above tiles (100) but below UI (1000)
        parentContainer.addChild(this.container);

        this.thoughts = new Map(); // thoughtId -> { sprite, data }
        this.config = {
            tileSize: 32,
            ...config
        };

        console.log('🧠 ThinkingField initialized');
    }

    /**
     * Add or update a thought visualization
     * @param {Object} thought - Thought data
     * @param {string} thought.thought_id - Unique identifier
     * @param {Array} thought.pixel_data - 32x32x4 RGBA array (flat or nested)
     * @param {number} thought.x - World X position
     * @param {number} thought.y - World Y position
     */
    renderThought(thought) {
        const { thought_id, pixel_data, x, y, label } = thought;

        // Clean up existing thought if present
        if (this.thoughts.has(thought_id)) {
            this.removeThought(thought_id);
        }

        // Create texture from pixel data
        const texture = this._createTextureFromData(pixel_data);
        const sprite = new PIXI.Sprite(texture);

        // Position sprite
        sprite.x = x;
        sprite.y = y;
        sprite.width = this.config.tileSize;
        sprite.height = this.config.tileSize;

        // Add interactivity
        sprite.interactive = true;
        sprite.cursor = 'pointer';

        // Hover effects
        sprite.on('pointerover', () => {
            sprite.alpha = 0.8;
            if (label) this._showLabel(sprite, label);
        });
        sprite.on('pointerout', () => {
            sprite.alpha = 1.0;
            this._hideLabel();
        });

        // Add to container
        this.container.addChild(sprite);

        // Track thought
        this.thoughts.set(thought_id, {
            sprite,
            data: thought,
            timestamp: Date.now()
        });

        console.debug(`🧠 Rendered thought: ${thought_id} at (${x}, ${y})`);
    }

    /**
     * Remove a thought visualization
     * @param {string} thought_id 
     */
    removeThought(thought_id) {
        const item = this.thoughts.get(thought_id);
        if (item) {
            this.container.removeChild(item.sprite);
            item.sprite.destroy({ texture: true }); // Destroy texture to free GPU memory
            this.thoughts.delete(thought_id);
        }
    }

    /**
     * Clear all thoughts
     */
    clear() {
        for (const [id, item] of this.thoughts) {
            this.container.removeChild(item.sprite);
            item.sprite.destroy({ texture: true });
        }
        this.thoughts.clear();
        console.log('🧠 ThinkingField cleared');
    }

    /**
     * Create PIXI Texture from raw RGBA data
     * @param {Array} data - Pixel data (nested or flat)
     * @returns {PIXI.Texture}
     */
    _createTextureFromData(data) {
        const size = 32;
        const buffer = new Uint8ClampedArray(size * size * 4);

        // Handle nested array [[R,G,B,A], ...] or flat array
        let flatIndex = 0;

        // If data is just a flat array/list
        if (Array.isArray(data) && typeof data[0] === 'number') {
            for (let i = 0; i < data.length; i++) {
                buffer[i] = data[i];
            }
        }
        // If data is nested array (e.g. from Python lists)
        else if (Array.isArray(data)) {
            // Assuming [32][32][4] structure from CALMAdapter
            for (let row = 0; row < size; row++) {
                for (let col = 0; col < size; col++) {
                    const pixel = data[row][col];
                    const offset = (row * size + col) * 4;
                    buffer[offset] = pixel[0];     // R
                    buffer[offset + 1] = pixel[1]; // G
                    buffer[offset + 2] = pixel[2]; // B
                    buffer[offset + 3] = pixel[3]; // A
                }
            }
        }

        // Create canvas to draw pixels (PIXI v5+ compatible way)
        // Alternatively, use BufferResource if using WebGL directly, but Canvas is robust fallback
        const canvas = document.createElement('canvas');
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');
        const imageData = new ImageData(buffer, size, size);
        ctx.putImageData(imageData, 0, 0);

        return PIXI.Texture.from(canvas);
    }

    _showLabel(sprite, text) {
        // TODO: Emit event or use global tooltip system
        // For now, simple console log or temporary text
        console.log(`Thought: ${text}`);
    }

    _hideLabel() {
        // TODO: Hide tooltip
    }
}

// Export for usage
if (typeof window !== 'undefined') {
    window.ThinkingField = ThinkingField;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = ThinkingField;
}
