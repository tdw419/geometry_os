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
            nodeBorderColor: 0x333344,
            ...config
        };

        this.app = null;
        this.viewport = null;
        this.agentParticles = new Map(); // agent_id -> PIXI.Container (particle)
        this.nodeRegions = new Map(); // node_id -> PIXI.Container
        this.taskArrows = new Map(); // task_id -> PIXI.Graphics

        this.running = false;
        this.time = 0;
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

        // Create Viewport
        this.viewport = new PIXI.Container();
        this.app.stage.addChild(this.viewport);

        // Layers
        this.nodeLayer = new PIXI.Container();
        this.taskLayer = new PIXI.Container();
        this.agentLayer = new PIXI.Container();
        
        this.viewport.addChild(this.nodeLayer);
        this.viewport.addChild(this.taskLayer);
        this.viewport.addChild(this.agentLayer);

        // Interaction for pan/zoom
        this.app.stage.interactive = true;
        this._setupInteraction();

        // Start render loop
        this.running = true;
        this.app.ticker.add(this.update, this);

        console.log('🐝 SwarmCanvas initialized');
    }

    _setupInteraction() {
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

        this.container.addEventListener('wheel', (e) => {
            e.preventDefault();
            const factor = e.deltaY > 0 ? 0.9 : 1.1;
            this.zoom(this.viewport.scale.x * factor);
        }, { passive: false });
    }

    pan(dx, dy) {
        if (!this.viewport) return;
        this.viewport.x += dx;
        this.viewport.y += dy;
    }

    zoom(scale) {
        if (!this.viewport) return;
        const clampedScale = Math.max(0.1, Math.min(scale, 5));
        this.viewport.scale.set(clampedScale);
    }

    /**
     * Add a node region to the canvas
     */
    addNode(nodeId, data = {}) {
        if (this.nodeRegions.has(nodeId)) return;

        const container = new PIXI.Container();
        container.x = data.x || 0;
        container.y = data.y || 0;
        container.width = data.width || 200;
        container.height = data.height || 200;

        const graphics = new PIXI.Graphics();
        this._drawNodeRegion(graphics, container.width, container.height);
        container.addChild(graphics);
        container.graphics = graphics;

        // Label
        const label = new PIXI.Text(nodeId, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x888899
        });
        label.y = -20;
        container.addChild(label);

        this.nodeLayer.addChild(container);
        this.nodeRegions.set(nodeId, container);
        return container;
    }

    _drawNodeRegion(graphics, width, height) {
        graphics.clear();
        graphics.lineStyle(2, this.config.nodeBorderColor, 0.5);
        graphics.beginFill(0x1a1a2a, 0.3);
        graphics.drawRoundedRect(0, 0, width, height, 8);
        graphics.endFill();
    }

    getNodeRegion(nodeId) {
        return this.nodeRegions.get(nodeId);
    }

    /**
     * Add an agent particle to the canvas
     */
    addAgent(agentId, data = {}) {
        if (this.agentParticles.has(agentId)) return;

        const particle = new PIXI.Container();
        particle.agentId = agentId;
        particle.state = data.state || 'idle';
        particle.nodeId = data.nodeId;
        particle.taskCount = data.taskCount || 0;

        // Position
        if (data.nodeId && this.nodeRegions.has(data.nodeId)) {
            const node = this.nodeRegions.get(data.nodeId);
            // Random position within node if not specified
            particle.x = data.x !== undefined ? data.x : node.x + 20 + Math.random() * (node.width - 40);
            particle.y = data.y !== undefined ? data.y : node.y + 20 + Math.random() * (node.height - 40);
        } else {
            particle.x = data.x || 0;
            particle.y = data.y || 0;
        }

        // Visual representation
        const graphics = new PIXI.Graphics();
        this._drawAgentGraphics(graphics, particle.state);
        particle.addChild(graphics);
        particle.graphics = graphics;

        this._updateAgentScale(particle);

        this.agentLayer.addChild(particle);
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

        if (data.taskCount !== undefined) {
            particle.taskCount = data.taskCount;
            this._updateAgentScale(particle);
        }
    }

    _updateAgentScale(particle) {
        const baseScale = 1.0;
        const taskScale = Math.min(particle.taskCount / 100, 2.0);
        particle.scale.set(baseScale + taskScale);
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
        graphics.lineStyle(2, color, 0.3);
        graphics.drawCircle(0, 0, this.config.particleSize + 2);
    }

    getAgentParticle(agentId) {
        return this.agentParticles.get(agentId);
    }

    /**
     * Main update/render loop
     */
    update(ticker) {
        if (!this.running) return;
        
        const delta = ticker.deltaTime;
        this.time += delta * 0.05;

        // Animations: Pulsing for working agents
        for (const particle of this.agentParticles.values()) {
            if (particle.state === 'working') {
                particle.alpha = 0.7 + Math.sin(this.time) * 0.3;
            } else if (particle.state === 'error') {
                particle.alpha = 0.5 + Math.sin(this.time * 2) * 0.5; // Rapid blink
            } else {
                particle.alpha = 1.0;
            }
        }
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
