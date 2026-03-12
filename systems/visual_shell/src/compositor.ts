// Geometry OS Visual Shell Compositor
// Entry point for the PixiJS-based infinite map compositor

import * as PIXI from 'pixi.js';

// Create the application
const app = new PIXI.Application({
    width: 800,
    height: 600,
    backgroundColor: 0x1099bb,
    resolution: window.devicePixelRatio || 1,
});

// Add the canvas to the HTML document
document.body.appendChild(app.view);

// Load a simple texture to verify PixiJS is working
PIXI.Loader.shared
    .add('test', 'assets/test.png')
    .load((loader, resources) => {
        const sprite = new PIXI.Sprite(resources.test.texture);
        sprite.x = app.screen.width / 2;
        sprite.y = app.screen.height / 2;
        sprite.anchor.set(0.5);
        app.stage.addChild(sprite);
    });

// Add ticker for animation loop
app.ticker.add((delta) => {
    // Update game logic here
});

// Export for use in other modules
export { app };