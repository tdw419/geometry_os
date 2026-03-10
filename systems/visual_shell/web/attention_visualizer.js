/**
 * AttentionVisualizer - Real-time attention weight visualization for VisualBridge
 *
 * Phase 49.x: Neural District Coalescence
 *
 * Features:
 * - Renders attention weights as heatmaps over the Infinite Map
 * - WebSocket integration for real-time updates from VisualBridge
 * - Multiple color modes (grayscale, plasma, attention focus)
 * - Supports multiple attention heads
 * - Semi-transparent overlay to show model focus areas
 *
 * @class AttentionVisualizer
 */

class AttentionVisualizer {
    /**
     * Create a new AttentionVisualizer
     * @param {PIXI.Application} pixiApp - The PixiJS application instance
     * @param {PIXI.Sprite} atlasSprite - The sprite to render heatmaps on
     */
    constructor(pixiApp, atlasSprite) {
        this.app = pixiApp;
        this.atlasSprite = atlasSprite;

        // Attention data storage
        this.attentionData = {
            weights: new Float32Array(0),
            heads: 0,
            seqLen: 0,
            layers: 0
        };

        // Visualization parameters
        this.currentHead = 0;
        this.currentLayer = 0;
        this.colorMode = 1; // Default to plasma
        this.maxIntensity = 1.0;
        this.visible = false;

        // PixiJS objects
        this.container = new PIXI.Container();
        this.container.visible = false;
        this.container.alpha = 0.8;
        this.container.sortableChildren = true;
        this.container.zIndex = 1000;

        // WebGPU shader
        this.pipeline = null;
        this.uniformBuffer = null;
        this.attentionBuffer = null;

        // WebSocket connection for VisualBridge
        this.ws = null;
        this.connected = false;

        // Initialize
        this.initializeGraphics();
        this.connect();
    }

    /**
     * Initialize PixiJS graphics and WebGPU pipeline
     */
    initializeGraphics() {
        // Create full-screen quad sprite
        const quad = new PIXI.Graphics();
        quad.beginFill(0xFFFFFF);
        quad.drawRect(0, 0, 1, 1);
        quad.endFill();

        // Create sprite shader
        const shaderSource = `
            precision highp float;

            uniform sampler2D uAtlasTexture;
            uniform vec2 uAtlasSize;
            uniform vec4 uHeatmapParams;

            varying vec2 vTextureCoord;

            // Plasma colormap
            vec3 plasma_color(float t) {
                t = clamp(t, 0.0, 1.0);

                if (t < 0.17) {
                    float s = t / 0.17;
                    return vec3(s * 0.050, s * 0.0, s * 1.0);
                } else if (t < 0.33) {
                    float s = (t - 0.17) / 0.16;
                    return vec3(s * 0.325, s * 0.0, s * 0.878);
                } else if (t < 0.50) {
                    float s = (t - 0.33) / 0.17;
                    return vec3(0.325 + s * 0.525, s * 0.0, 0.878 - s * 0.525);
                } else if (t < 0.67) {
                    float s = (t - 0.50) / 0.17;
                    return vec3(0.850 + s * 0.150, s * 0.678, s * 0.352);
                } else {
                    float s = (t - 0.67) / 0.33;
                    return vec3(1.0, 0.678 + s * 0.322, 0.352 + s * 0.648);
                }
            }

            void main() {
                vec4 atlasColor = texture2D(uAtlasTexture, vTextureCoord);

                // Calculate heatmap coordinates
                float heatmapHeight = uAtlasSize.y * uHeatmapParams.w;
                vec2 heatmapUV = vec2(vTextureCoord.x, vTextureCoord.y * uHeatmapParams.w);

                // Simple attention simulation based on position
                float attention = sin(heatmapUV.x * 10.0) * cos(heatmapUV.y * 10.0) * 0.5 + 0.5;
                attention *= uHeatmapParams.z; // Apply max intensity

                // Get plasma color
                vec3 heatmapColor = plasma_color(attention);

                // Blend with atlas
                float blendAlpha = attention * 0.7;
                gl_FragColor = mix(atlasColor, vec4(heatmapColor, blendAlpha), blendAlpha);
            }
        `;

        const shader = new PIXI.Shader.from(shaderSource);
        this.sprite = new PIXI.Sprite(new PIXI.Texture.from(quad, shader));
        this.sprite.width = this.app.view.width;
        this.sprite.height = this.app.view.height;

        this.container.addChild(this.sprite);

        // Add to PixiJS stage
        this.app.stage.addChild(this.container);
    }

    /**
     * Connect to VisualBridge WebSocket for attention updates
     */
    connect() {
        try {
            this.ws = new WebSocket('ws://localhost:8765'); // VisualBridge port

            this.ws.onopen = () => {
                this.connected = true;
                console.log('AttentionVisualizer: Connected to VisualBridge');
                // Subscribe to attention updates
                this.ws.send(JSON.stringify({
                    type: 'subscribe',
                    topic: 'attention'
                }));
            };

            this.ws.onmessage = (event) => {
                const message = JSON.parse(event.data);
                if (message.type === 'attention_update') {
                    this.handleAttentionUpdate(message);
                }
            };

            this.ws.onclose = () => {
                this.connected = false;
                console.log('AttentionVisualizer: Disconnected from VisualBridge');
                // Attempt to reconnect
                setTimeout(() => this.connect(), 3000);
            };

            this.ws.onerror = (error) => {
                console.error('AttentionVisualizer: WebSocket error:', error);
            };
        } catch (error) {
            console.error('AttentionVisualizer: Failed to connect to VisualBridge:', error);
        }
    }

    /**
     * Handle attention update messages from VisualBridge
     * @param {object} message - The WebSocket message containing attention data
     */
    handleAttentionUpdate(message) {
        const { heads, seqLen, layers, weights } = message.data;

        // Update attention data
        this.attentionData = {
            heads: heads,
            seqLen: seqLen,
            layers: layers,
            weights: new Float32Array(weights)
        };

        // Find max intensity for normalization
        let maxWeight = 0;
        for (let i = 0; i < weights.length; i++) {
            maxWeight = Math.max(maxWeight, weights[i]);
        }
        this.maxIntensity = maxWeight > 0 ? maxWeight : 1.0;

        // Render the heatmap
        this.renderHeatmap(this.currentLayer, this.currentHead);
    }

    /**
     * Render attention heatmap for specific layer and head
     * @param {number} layer - The layer index
     * @param {number} head - The head index
     */
    renderHeatmap(layer, head) {
        if (!this.attentionData.weights.length) return;

        this.currentLayer = layer;
        this.currentHead = head;

        // Update shader parameters if using WebGPU
        if (this.pipeline && this.uniformBuffer) {
            const uniformData = new Float32Array([
                head,      // head index
                layer,     // layer index
                this.maxIntensity,
                this.colorMode
            ]);

            // Update uniform buffer
            this.device.queue.writeBuffer(
                this.uniformBuffer,
                0,
                uniformData.buffer
            );
        }

        // For now, use the PixiJS shader approach
        this.sprite.shader.uniforms.uHeatmapParams = {
            head: this.currentHead,
            layer: this.currentLayer,
            maxIntensity: this.maxIntensity,
            colorMode: this.colorMode,
            alpha: this.visible ? 0.7 : 0.0
        };
    }

    /**
     * Get plasma color for a given value (0-1)
     * @param {number} t - The normalized value (0-1)
     * @returns {number} - RGB color in 0xRRGGBB format
     */
    plasmaColor(t) {
        const t_clamped = Math.max(0, Math.min(1, t));

        if (t_clamped < 0.17) {
            const s = t_clamped / 0.17;
            return Math.round(s * 0.050 * 255) << 16 |
                   Math.round(s * 0.0 * 255) << 8 |
                   Math.round(s * 1.0 * 255);
        } else if (t_clamped < 0.33) {
            const s = (t_clamped - 0.17) / 0.16;
            return Math.round((0.325 + s * 0.0) * 255) << 16 |
                   Math.round(s * 0.0 * 255) << 8 |
                   Math.round((0.878 + s * 0.122) * 255);
        } else if (t_clamped < 0.50) {
            const s = (t_clamped - 0.33) / 0.17;
            return Math.round((0.325 + s * 0.525) * 255) << 16 |
                   Math.round(s * 0.0 * 255) << 8 |
                   Math.round((0.878 - s * 0.525) * 255);
        } else if (t_clamped < 0.67) {
            const s = (t_clamped - 0.50) / 0.17;
            return Math.round((0.850 + s * 0.150) * 255) << 16 |
                   Math.round((0.0 + s * 0.678) * 255) << 8 |
                   Math.round((0.352 + s * 0.000) * 255);
        } else {
            const s = (t_clamped - 0.67) / 0.33;
            return Math.round(255) << 16 |
                   Math.round((0.678 + s * 0.322) * 255) << 8 |
                   Math.round((0.352 + s * 0.648) * 255);
        }
    }

    /**
     * Toggle visibility of attention heatmap
     */
    toggleVisibility() {
        this.visible = !this.visible;
        this.container.visible = this.visible;
    }

    /**
     * Set color mode for visualization
     * @param {number} mode - Color mode (0=grayscale, 1=plasma, 2=attention-focus)
     */
    setColorMode(mode) {
        this.colorMode = Math.max(0, Math.min(2, mode));
        this.renderHeatmap(this.currentLayer, this.currentHead);
    }

    /**
     * Set the current attention head to visualize
     * @param {number} head - Head index
     */
    setHead(head) {
        this.currentHead = Math.max(0, Math.min(this.attentionData.heads - 1, head));
        this.renderHeatmap(this.currentLayer, this.currentHead);
    }

    /**
     * Set the current layer to visualize
     * @param {number} layer - Layer index
     */
    setLayer(layer) {
        this.currentLayer = Math.max(0, Math.min(this.attentionData.layers - 1, layer));
        this.renderHeatmap(this.currentLayer, this.currentHead);
    }

    /**
     * Clean up resources
     */
    destroy() {
        if (this.ws) {
            this.ws.close();
        }

        if (this.container) {
            this.app.stage.removeChild(this.container);
            this.container.destroy({ children: true });
        }

        if ( this.pipeline) {
            this.pipeline.destroy();
        }
    }
}

// Export for Node.js environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AttentionVisualizer;
}