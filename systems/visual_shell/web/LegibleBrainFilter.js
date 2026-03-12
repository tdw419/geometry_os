/**
 * LegibleBrainFilter - PIXI.js filter for Glyph-based Neural Introspection
 * 
 * Renders the PixelBrain atlas as a field of glyphs from the font system.
 * Part of the Geography OS Phase 40 "The Legible Brain".
 */

class LegibleBrainFilter extends PIXI.Filter {
    constructor(options = {}) {
        const vertexShader = `
            struct VertexOutput {
                @builtin(position) position: vec4<f32>,
                @location(0) uv: vec2<f32>,
            };

            @vertex
            fn main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
                var positions = array<vec2<f32>, 4>(
                    vec2<f32>(-1.0, -1.0),
                    vec2<f32>(1.0, -1.0),
                    vec2<f32>(-1.0, 1.0),
                    vec2<f32>(1.0, 1.0)
                );
                
                var out: VertexOutput;
                out.position = vec4<f32>(positions[vertex_index], 0.0, 1.0);
                out.uv = (positions[vertex_index] + 1.0) * 0.5;
                out.uv.y = 1.0 - out.uv.y;
                return out;
            }
        `;

        const fragmentShader = `
            struct Uniforms {
                uResolution: vec2<f32>,
                uTime: f32,
                uZoom: f32,
                uCameraPos: vec2<f32>,
                uLayerFocus: f32,
                uConfidenceThreshold: f32,
            };

            struct GlyphMetrics {
                char_code: u32,
                uv_min_x: f32, uv_min_y: f32,
                uv_max_x: f32, uv_max_y: f32,
                width: f32, height: f32,
                bearing_x: f32, bearing_y: f32,
                advance: f32,
                _padding: f32,
            };

            @group(0) @binding(0) var<uniform> u: Uniforms;
            @group(0) @binding(1) var uBrainAtlas: texture_2d<f32>;
            @group(0) @binding(2) var uBrainSampler: sampler;
            @group(0) @binding(3) var uFontAtlas: texture_2d<f32>;
            @group(0) @binding(4) var uFontSampler: sampler;
            @group(0) @binding(5) var<storage, read> uGlyphMetrics: array<GlyphMetrics>;

            fn get_glyph_id(activation: f32, entropy: f32, cluster: f32) -> u32 {
                // Stratum mapping:
                // 0: Substrate (simple)
                // 1: Memory
                // 2: Logic
                // 3: Spec
                // 4: Intent (complex)
                let stratum = clamp(u32(activation * 5.0), 0u, 4u);
                let base_offset = stratum * 32u;
                
                // Use entropy to select variation within stratum
                let entropy_idx = u32(entropy * 31.0);
                
                // Return ASCII 32 + offset (starting from space)
                return 32u + (base_offset + entropy_idx) % 224u;
            }

            @fragment
            fn main(@location(0) uv: vec2<f32>, @builtin(position) fragCoord: vec4<f32>) -> @location(0) vec4<f32> {
                // 1. Grid-based Glyph Selection
                let grid_size = 24.0 / u.uZoom; 
                let cell_coord = floor(fragCoord.xy / grid_size);
                let pixel_in_cell = fract(fragCoord.xy / grid_size);
                
                // Map cell to brain atlas
                let cell_center_uv = (cell_coord * grid_size + grid_size * 0.5) / u.uResolution;
                let brain_sample = textureSample(uBrainAtlas, uBrainSampler, cell_center_uv);
                
                let activation = brain_sample.r;
                let entropy = brain_sample.g;
                let cluster = brain_sample.b;
                
                // 2. Glyph Lookup
                let glyph_id = get_glyph_id(activation, entropy, cluster);
                let m = uGlyphMetrics[glyph_id];
                
                // 3. Sample Font Atlas
                let glyph_uv = mix(
                    vec2<f32>(m.uv_min_x, m.uv_min_y),
                    vec2<f32>(m.uv_max_x, m.uv_max_y),
                    pixel_in_cell
                );
                
                let font_sample = textureSample(uFontAtlas, uFontSampler, glyph_uv);
                let mask = font_sample.a;

                // 4. Color & Glow
                var color = vec3<f32>(0.2, 0.4, 1.0); // Default Blue (Substrate)
                
                if (activation > 0.8) {
                    color = vec3<f32>(1.0, 0.3, 0.3); // High: Red
                } else if (activation > 0.5) {
                    color = vec3<f32>(0.0, 1.0, 0.8); // Med: Cyan
                }
                
                // Pulse based on time
                let pulse = (sin(u.uTime * 5.0 + activation * 10.0) * 0.5 + 0.5) * activation;
                let final_color = color * (mask + pulse * 0.3);
                
                // Subtle background grid
                let grid_line = step(0.95, max(pixel_in_cell.x, pixel_in_cell.y));
                let bg = vec3<f32>(0.01, 0.02, 0.05) + grid_line * 0.02;
                
                return vec4<f32>(mix(bg, final_color, mask), 1.0);
            }
        `;

        const uniforms = {
            uResolution: [window.innerWidth, window.innerHeight],
            uTime: 0,
            uZoom: options.zoom || 1.0,
            uCameraPos: options.cameraPos || [0, 0],
            uLayerFocus: options.layerFocus || 0.0,
            uConfidenceThreshold: options.confidenceThreshold || 0.5,
            uBrainAtlas: options.brainAtlas || null,
            uFontAtlas: options.fontAtlas || null,
        };

        super({
            gl: null, // We're using WebGPU
            gpu: {
                vertex: { entryPoint: 'main', source: vertexShader },
                fragment: { entryPoint: 'main', source: fragmentShader },
            },
            resources: {
                u: new PIXI.UniformGroup(uniforms),
                uBrainAtlas: options.brainAtlas.source,
                uBrainSampler: options.brainAtlas.style,
                uFontAtlas: options.fontAtlas.source,
                uFontSampler: options.fontAtlas.style,
                uGlyphMetrics: options.glyphMetricsBuffer
            }
        });

        this.uniforms = uniforms;
    }

    update(time, zoom, cameraPos) {
        this.uniforms.uTime = time;
        this.uniforms.uZoom = zoom;
        this.uniforms.uCameraPos = cameraPos;
    }
}

if (typeof module !== 'undefined') {
    module.exports = { LegibleBrainFilter };
}
