/**
 * LegibleBrainRenderer - Glyph-based Neural Introspection Manager
 * 
 * Orchestrates the LegibleBrainFilter and connects it to the 
 * global TelemetryBus and Font System.
 */

class LegibleBrainRenderer {
    constructor(app, options = {}) {
        this.app = app;
        this.container = new PIXI.Container();
        this.filter = null;
        this.isInitialized = false;

        this.config = {
            brainAtlasPath: options.brainAtlasPath || 'systems/pixel_brain/atlases/default.rts.png',
            fontAtlasPath: options.fontAtlasPath || 'assets/font_atlas_mono.png',
            ...options
        };
    }

    async initialize() {
        if (this.isInitialized) return;

        console.log('🧠 Initializing Legible Brain Renderer...');

        // 1. Load Textures
        const brainTexture = await PIXI.Assets.load(this.config.brainAtlasPath);
        const fontTexture = await PIXI.Assets.load(this.config.fontAtlasPath);

        // 2. Mock Glyph Metrics (in production, these come from font_atlas.rs metadata)
        // We'll create a Buffer with 256 GlyphMetrics entries
        const metricsData = new Float32Array(256 * 12); // 12 floats per struct (including padding)
        for (let i = 0; i < 256; i++) {
            const offset = i * 12;
            const col = i % 16;
            const row = Math.floor(i / 16);
            
            metricsData[offset] = i; // char_code
            metricsData[offset + 1] = col / 16; // uv_min_x
            metricsData[offset + 2] = row / 16; // uv_min_y
            metricsData[offset + 3] = (col + 1) / 16; // uv_max_x
            metricsData[offset + 4] = (row + 1) / 16; // uv_max_y
            metricsData[offset + 5] = 64; // width
            metricsData[offset + 6] = 64; // height
            metricsData[offset + 7] = 0;  // bearing_x
            metricsData[offset + 8] = 0;  // bearing_y
            metricsData[offset + 9] = 64; // advance
        }

        const metricsBuffer = new PIXI.Buffer({
            data: metricsData,
            usage: PIXI.BufferUsage.STORAGE | PIXI.BufferUsage.COPY_DST,
        });

        // 3. Create Filter
        this.filter = new LegibleBrainFilter({
            brainAtlas: brainTexture,
            fontAtlas: fontTexture,
            glyphMetricsBuffer: metricsBuffer,
            zoom: 1.0,
            cameraPos: [0, 0]
        });

        // 4. Create a full-screen quad to apply the filter to
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000);
        bg.drawRect(0, 0, this.app.screen.width, this.app.screen.height);
        bg.endFill();
        bg.filters = [this.filter];
        
        this.container.addChild(bg);
        this.isInitialized = true;
        
        console.log('✅ Legible Brain Renderer ready');
        return this.container;
    }

    update(ticker) {
        if (!this.isInitialized) return;
        
        const time = ticker.lastTime / 1000;
        // In a real app, zoom and cameraPos would come from the viewport
        this.filter.update(time, 1.0, [0, 0]);
    }
    
    toggle(visible) {
        this.container.visible = visible;
    }
}

if (typeof module !== 'undefined') {
    module.exports = { LegibleBrainRenderer };
}
