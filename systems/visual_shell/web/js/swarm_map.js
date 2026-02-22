
// Swarm Map Visualization for Geometry OS Visual Shell
// Integrates Swarm Heatmap RTS into PixiJS v8

export class SwarmMap {
    constructor(app, container) {
        this.app = app;
        this.container = container;
        this.heatmapSprite = null;
        this.updateInterval = 2000;
        this.heatmapUrl = "swarm_heatmap.rts.png";
    }

    async init() {
        console.log("Initializing Swarm Map Visualization...");
        
        // Load initial heatmap
        const texture = await PIXI.Assets.load(this.heatmapUrl);
        this.heatmapSprite = new PIXI.Sprite(texture);
        
        // Position on the infinite map (e.g., as a background or overlay)
        this.heatmapSprite.alpha = 0.6; // Semi-transparent overlay
        this.heatmapSprite.scale.set(2); // Scale to fit a larger region
        
        this.container.addChild(this.heatmapSprite);
        
        // Start polling for updates
        setInterval(() => this.update(), this.updateInterval);
    }

    async update() {
        try {
            // Unload and reload to force refresh from disk
            // In a production setup, we'd use a WebSocket stream of the buffer
            PIXI.Assets.unload(this.heatmapUrl);
            const texture = await PIXI.Assets.load(`${this.heatmapUrl}?t=${Date.now()}`);
            this.heatmapSprite.texture = texture;
        } catch (e) {
            console.warn("Heatmap update failed:", e);
        }
    }
}
