/**
 * NeuralWindow.js
 * An SDF-based Organic Window for the Geometry OS "Vector Native" environment.
 * Replaces legacy DesktopWindow with a mathematically defined, neural-reactive shell.
 */

class NeuralWindow extends PIXI.Container {
    constructor(title, x, y, width, height, sdfParams = {}) {
        super();
        this.x = x;
        this.y = y;
        this._width = width;
        this._height = height;
        
        // Agency-Architect defined SDF parameters
        this.sdfParams = {
            roundness: sdfParams.roundness || 15.0,
            morphSpeed: sdfParams.morphSpeed || 0.02,
            neuralReactive: sdfParams.neuralReactive !== false,
            tension: sdfParams.tension || 1.0,
            glowColor: sdfParams.glowColor || [0.0, 0.6, 1.0, 1.0], // Cyan
            ...sdfParams
        };

        this.interactive = true;
        this.dragging = false;
        
        // Initialize the WebGPU/Shader-based shell
        this._initSDFShell();
        this._initTitle(title);
        
        // Listen for pointer events
        this.on('pointerdown', this.onDragStart.bind(this));
        this.on('pointermove', this.onDragMove.bind(this));
        this.on('pointerup', this.onDragEnd.bind(this));
        this.on('pointerupoutside', this.onDragEnd.bind(this));
    }

    _initSDFShell() {
        // In PixiJS v8, we use a custom shader filter for the SDF effect
        const sdfShaderSource = `
            struct SDFUniforms {
                size: vec2<f32>,
                roundness: f32,
                time: f32,
                tension: f32,
                glowColor: vec4<f32>,
            };
            
            @group(0) @binding(1) var<uniform> g_sdf: SDFUniforms;

            // Rounded Box SDF
            fn sdRoundedBox(p: vec2<f32>, b: vec2<f32>, r: f32) -> f32 {
                let q = abs(p) - b + r;
                return length(max(q, vec2<f32>(0.0))) + min(max(q.x, q.y), 0.0) - r;
            }

            @fragment
            fn main(@location(0) uv: vec2<f32>) -> @location(0) vec4<f32> {
                let p = (uv - 0.5) * g_sdf.size;
                
                // Morphing effect based on time and tension
                let r = g_sdf.roundness + sin(g_sdf.time * g_sdf.morphSpeed) * g_sdf.tension;
                let d = sdRoundedBox(p, g_sdf.size * 0.5, r);
                
                // Organic bloom/glow
                let glow = exp(-abs(d) * 0.1);
                
                if (d < 0.0) {
                    // Inside: Frosted glass effect
                    return vec4<f32>(0.1, 0.1, 0.1, 0.8) + g_sdf.glowColor * glow * 0.2;
                } else {
                    // Outside: Glow trail
                    let alpha = clamp(glow - 0.1, 0.0, 1.0);
                    return g_sdf.glowColor * alpha;
                }
            }
        `;

        // Create a Graphics object to act as the window body
        this.body = new PIXI.Graphics();
        this.body.rect(-this._width/2, -this._height/2, this._width, this._height);
        this.body.fill({ color: 0xffffff, alpha: 0.01 }); // Almost transparent, let shader handle visual
        
        // Apply the SDF Filter (Mocking Filter creation for PixiJS v8)
        // In real PixiJS v8, we'd use Filter.from(...)
        // this.body.filters = [new PIXI.Filter({ glsl: ..., gpu: sdfShaderSource, ... })];
        
        this.addChild(this.body);
    }

    _initTitle(title) {
        this.titleText = new PIXI.Text(title, {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00ffff,
            align: 'center'
        });
        this.titleText.anchor.set(0.5);
        this.titleText.y = -this._height / 2 + 15;
        this.addChild(this.titleText);
    }

    onDragStart(event) {
        this.dragging = true;
        this.dragData = event.data;
        this.dragOffset = event.data.getLocalPosition(this.parent);
        this.dragOffset.x -= this.x;
        this.dragOffset.y -= this.y;
        this.parent.addChild(this); // Bring to front
    }

    onDragMove() {
        if (this.dragging) {
            const newPos = this.dragData.getLocalPosition(this.parent);
            this.x = newPos.x - this.dragOffset.x;
            this.y = newPos.y - this.dragOffset.y;
            
            // Interaction: Increase tension during drag (organic wobble)
            this.sdfParams.tension = 5.0;
        }
    }

    onDragEnd() {
        this.dragging = false;
        this.dragData = null;
        this.sdfParams.tension = 1.0; // Return to stability
    }

    update(time) {
        // Update shader uniforms (Mock behavior)
        // this.body.filters[0].resources.g_sdf.time = time;
    }
}
