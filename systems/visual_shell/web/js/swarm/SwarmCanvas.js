/**
 * SwarmCanvas - Core visualization engine for the Geometry OS Swarm.
 * Uses PixiJS v8 for high-performance particle rendering on the infinite map.
 */

class SwarmCanvas {
    constructor(container, config = {}) {
        this.container = container;
        this.config = {
            backgroundColor: 0x0a0a1a,
            particleSize: 8,
            gridSize: 100,
            ...config
        };

        this.app = null;
        this.viewport = null;
        this.agentParticles = new Map(); // agent_id -> PIXI.Container (particle)
        this.nodeRegions = new Map(); // node_id -> PIXI.Graphics
        this.taskArrows = new Map(); // task_id -> PIXI.Graphics

        this.running = false;
        this.lastUpdateTime = 0;
    }

    /**
     * Initialize PixiJS Application and Viewport
     */
    async initialize() {
        if (this.app) return;

        this.app = new PIXI.Application();
        await this.app.init({
            width: this.container.clientWidth || 800,
            height: this.container.clientHeight || 600,
            backgroundColor: this.config.backgroundColor,
            antialias: true,
            resizeTo: this.container
        });

        this.container.appendChild(this.app.canvas);

        // Create Viewport (simulated if pixi-viewport is not loaded)
        this.viewport = new PIXI.Container();
        this.app.stage.addChild(this.viewport);

        // Interaction for pan/zoom
        this.app.stage.interactive = true;
        this._setupInteraction();

        // Start render loop
        this.running = true;
        this.app.ticker.add(this.update, this);

        console.log('🐝 SwarmCanvas initialized');
    }

    _setupInteraction() {
        // Simple pan implementation
        let dragging = false;
        let lastPos = { x: 0, y: 0 };

        this.app.stage.on('pointerdown', (e) => {
            dragging = true;
            lastPos = { x: e.global.x, y: e.global.y };
        });

        this.app.stage.on('pointermove', (e) => {
            if (dragging) {
                const dx = e.global.x - lastPos.x;
                const dy = e.global.y - lastPos.y;
                this.pan(dx, dy);
                lastPos = { x: e.global.x, y: e.global.y };
            }
        });

        this.app.stage.on('pointerup', () => dragging = false);
        this.app.stage.on('pointerupoutside', () => dragging = false);

        // Simple zoom implementation via wheel
        this.container.addEventListener('wheel', (e) => {
            e.preventDefault();
            const factor = e.deltaY > 0 ? 0.9 : 1.1;
            this.zoom(this.viewport.scale.x * factor);
        }, { passive: false });
    }

    /**
     * Pan the viewport
     */
    pan(dx, dy) {
        if (!this.viewport) return;
        this.viewport.x += dx;
        this.viewport.y += dy;
    }

    /**
     * Zoom the viewport
     */
    zoom(scale) {
        if (!this.viewport) return;
        // Clamp zoom
        const clampedScale = Math.max(0.1, Math.min(scale, 5));
        this.viewport.scale.set(clampedScale);
    }

    /**
     * Add an agent particle to the canvas
     */
    addAgent(agentId, data = {}) {
        if (this.agentParticles.has(agentId)) return;

        const particle = new PIXI.Container();
        particle.x = data.x || 0;
        particle.y = data.y || 0;
        particle.agentId = agentId;
        particle.state = data.state || 'idle';

        // Visual representation
        const graphics = new PIXI.Graphics();
        this._drawAgentGraphics(graphics, particle.state);
        particle.addChild(graphics);
        particle.graphics = graphics;

        this.viewport.addChild(particle);
        this.agentParticles.set(agentId, particle);
        
        return particle;
    }

    /**
     * Update agent particle state or position
     */
    updateAgent(agentId, data = {}) {
        const particle = this.agentParticles.get(agentId);
        if (!particle) return;

        if (data.x !== undefined) particle.x = data.x;
        if (data.y !== undefined) particle.y = data.y;
        
        if (data.state !== undefined && data.state !== particle.state) {
            particle.state = data.state;
            this._drawAgentGraphics(particle.graphics, particle.state);
        }
    }

    /**
     * Draw agent graphics based on state
     */
    _drawAgentGraphics(graphics, state) {
        graphics.clear();
        
        let color = 0x00FFFF; // Cyan (Idle)
        if (state === 'working') color = 0x00FF00; // Green
        if (state === 'error') color = 0xFF0000; // Red
        
        graphics.beginFill(color);
        graphics.drawCircle(0, 0, this.config.particleSize);
        graphics.endFill();
        
        // Add glow
        graphics.lineStyle(2, color, 0.5);
        graphics.drawCircle(0, 0, this.config.particleSize + 2);
    }

    /**
     * Get agent particle by ID
     */
    getAgentParticle(agentId) {
        return this.agentParticles.get(agentId);
    }

    /**
     * Main update/render loop
     */
    update(ticker) {
        if (!this.running) return;
        
        const delta = ticker.deltaTime;
        // Logic for animations could go here
    }

    /**
     * Cleanup resources
     */
    destroy() {
        this.running = false;
        if (this.app) {
            this.app.destroy(true, { children: true, texture: true });
            this.app = null;
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SwarmCanvas = SwarmCanvas;
}
