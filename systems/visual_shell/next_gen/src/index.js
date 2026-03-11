import { Application } from 'pixi.js';
import { HyperContext, SpatialEntity } from '@geometry-os/hsml';
import { HSMLRenderer } from './hsml-renderer.js';

(async () => {
    console.log("Initializing Geometry OS Kernel (HSML-Native)...");

    // 1. Initialize Spatial Kernel (The Brain)
    const udg = new HyperContext();

    // 2. Initialize PixiJS v8 with WebGPU (The Visual Cortex)
    const app = new Application();
    await app.init({ 
        background: '#050505', 
        resizeTo: window,
        preference: 'webgpu',
        antialias: true
    });
    document.body.appendChild(app.canvas);

    // 3. Connect HSML to Rendering
    const renderer = new HSMLRenderer(app);

    // 4. Seed Initial Spatial Entities (Bootstrap the World)
    const entities = [
        new SpatialEntity({
            id: 'root-nexus',
            type: 'agent',
            position: { x: window.innerWidth / 2, y: window.innerHeight / 2, z: 0 },
            volume: { width: 64, height: 64 }
        }),
        new SpatialEntity({
            id: 'readme',
            type: 'document',
            position: { x: window.innerWidth / 2 + 100, y: window.innerHeight / 2 - 50, z: 0 },
            volume: { width: 24, height: 24 }
        }),
        new SpatialEntity({
            id: 'kernel',
            type: 'data',
            position: { x: window.innerWidth / 2 - 100, y: window.innerHeight / 2 + 50, z: 0 },
            volume: { width: 32, height: 32 }
        })
    ];

    entities.forEach(e => {
        udg.register(e);
        renderer.addEntity(e);
    });

    console.log("UDG Seeded with", entities.length, "Spatial Entities.");

    // 5. Set up Spatial Interactions (Hyper-Reflexes)
    app.stage.eventMode = 'static';
    app.stage.on('pointerdown', (event) => {
        const spatialPos = {
            x: event.global.x,
            y: event.global.y,
            z: 0
        };
        
        console.log("Spatial Query at", spatialPos);
        const nearby = udg.query(spatialPos, 50.0);
        
        if (nearby.length > 0) {
            console.log("Interacted with:", nearby.map(e => e.id));
            // Interaction logic here
        } else {
            // Create new entity logic?
        }
    });

})();
