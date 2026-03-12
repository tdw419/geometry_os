// Geometry OS Infinite Map
// Implements the infinite scrolling/tile-based map visualization

import * as PIXI from 'pixi.js';

/**
 * Infinite map that loads and displays tiles as needed
 */
export class InfiniteMap {
    private app: PIXI.Application;
    private tileSize: number = 256;
    private loadedTiles: Map<string, PIXI.Sprite> = new Map();
    
    constructor(app: PIXI.Application) {
        this.app = app;
        this.init();
    }
    
    private init(): void {
        // Create a placeholder for now
        const graphics = new PIXI.Graphics();
        graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, this.app.screen.width, this.app.screen.height);
        graphics.endFill();
        this.app.stage.addChild(graphics);
        
        // Add some debug text
        const style = new PIXI.TextStyle({
            fontFamily: 'Arial',
            fontSize: 24,
            fill: 0xffffff,
            align: 'center'
        });
        
        const text = new PIXI.Text('Infinite Map Placeholder\nTile-based visualization coming soon', style);
        text.x = this.app.screen.width / 2;
        text.y = this.app.screen.height / 2;
        text.anchor.set(0.5);
        this.app.stage.addChild(text);
    }
    
    /**
     * Load a tile at the specified coordinates
     */
    public async loadTile(x: number, y: number): Promise<void> {
        const tileKey = `${x},${y}`;
        if (this.loadedTiles.has(tileKey)) {
            return; // Already loaded
        }
        
        // For now, create a colored square based on coordinates
        const graphics = new PIXI.Graphics();
        const hue = ((x * 123 + y * 456) % 360); // Simple hash for color
        graphics.beginFill(`hsl(${hue}, 70%, 40%)`);
        graphics.drawRect(0, 0, this.tileSize, this.tileSize);
        graphics.endFill();
        
        // Add coordinate text
        const style = new PIXI.TextStyle({
            fontFamily: 'Arial',
            fontSize: 16,
            fill: 0xffffff,
            align: 'center'
        });
        
        const label = new PIXI.Text(`(${x}, ${y})`, style);
        label.x = this.tileSize / 2;
        label.y = this.tileSize / 2;
        label.anchor.set(0.5);
        graphics.addChild(label);
        
        const sprite = new PIXI.Sprite(graphics.generateCanvasTexture());
        sprite.x = x * this.tileSize;
        sprite.y = y * this.tileSize;
        
        this.loadedTiles.set(tileKey, sprite);
        this.app.stage.addChild(sprite);
    }
    
    /**
     * Update visible tiles based on current viewport
     */
    public updateViewport(viewX: number, viewY: number, width: number, height: number): void {
        // Calculate which tiles are visible
        const startX = Math.floor(viewX / this.tileSize) - 1;
        const endX = Math.ceil((viewX + width) / this.tileSize) + 1;
        const startY = Math.floor(viewY / this.tileSize) - 1;
        const endY = Math.ceil((viewY + height) / this.tileSize) + 1;
        
        // Load visible tiles
        for (let x = startX; x <= endX; x++) {
            for (let y = startY; y <= endY; y++) {
                this.loadTile(x, y);
            }
        }
    }
}

// Export for use in other modules
export { InfiniteMap };