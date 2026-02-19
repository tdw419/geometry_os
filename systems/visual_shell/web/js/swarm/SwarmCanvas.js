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
            arrowHeadSize: 6,
            ...config
        };

        this.app = null;
        this.viewport = null;
        this.agentParticles = new Map(); // agent_id -> PIXI.Container
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

        if (data.nodeId && this.nodeRegions.has(data.nodeId)) {
            const node = this.nodeRegions.get(data.nodeId);
            particle.x = data.x !== undefined ? data.x : node.x + 20 + Math.random() * (node.width - 40);
            particle.y = data.y !== undefined ? data.y : node.y + 20 + Math.random() * (node.height - 40);
        } else {
            particle.x = data.x || 0;
            particle.y = data.y || 0;
        }

        const graphics = new PIXI.Graphics();
        this._drawAgentGraphics(graphics, particle.state);
        particle.addChild(graphics);
        particle.graphics = graphics;

        this._updateAgentScale(particle);

        this.agentLayer.addChild(particle);
        this.agentParticles.set(agentId, particle);
        
        return particle;
    }

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

    _drawAgentGraphics(graphics, state) {
        graphics.clear();
        let color = 0x00FFFF;
        if (state === 'working') color = 0x00FF00;
        if (state === 'error') color = 0xFF0000;
        
        graphics.beginFill(color);
        graphics.drawCircle(0, 0, this.config.particleSize);
        graphics.endFill();
        graphics.lineStyle(2, color, 0.3);
        graphics.drawCircle(0, 0, this.config.particleSize + 2);
    }

    getAgentParticle(agentId) {
        return this.agentParticles.get(agentId);
    }

    /**
     * Add a task flow arrow between agents
     */
    addTask(taskId, data = {}) {
        if (this.taskArrows.has(taskId)) return;

        const arrow = new PIXI.Graphics();
        arrow.taskId = taskId;
        arrow.fromAgent = data.from;
        arrow.toAgent = data.to;
        arrow.taskType = data.type || 'generic';
        arrow.rate = data.rate || 1;
        arrow.thickness = 1 + Math.min(arrow.rate / 10, 5);
        arrow.offset = 0;
        arrow.completed = false;

        this._drawTaskArrow(arrow);
        this.taskLayer.addChild(arrow);
        this.taskArrows.set(taskId, arrow);
        return arrow;
    }

    updateTask(taskId, data = {}) {
        const arrow = this.taskArrows.get(taskId);
        if (!arrow) return;

        if (data.rate !== undefined) {
            arrow.rate = data.rate;
            arrow.thickness = 1 + Math.min(arrow.rate / 10, 5);
        }
        
        if (data.type !== undefined) arrow.taskType = data.type;
    }

    completeTask(taskId) {
        const arrow = this.taskArrows.get(taskId);
        if (arrow) {
            arrow.completed = true;
        }
    }

    getTaskArrow(taskId) {
        return this.taskArrows.get(taskId);
    }

    _drawTaskArrow(arrow) {
        const from = this.agentParticles.get(arrow.fromAgent);
        const to = this.agentParticles.get(arrow.toAgent);
        if (!from || !to) return;

        arrow.clear();
        
        let color = 0x00AAFF; // Blue (Scan)
        if (arrow.taskType === 'compute') color = 0xAA00FF; // Purple
        if (arrow.taskType === 'migrate') color = 0xFFAA00; // Orange
        
        arrow.lineStyle(arrow.thickness, color, arrow.alpha);
        arrow.moveTo(from.x, from.y);
        arrow.lineTo(to.x, to.y);

        // Arrow head at 'to' position
        const angle = Math.atan2(to.y - from.y, to.x - from.x);
        const headLen = this.config.arrowHeadSize;
        arrow.moveTo(to.x, to.y);
        arrow.lineTo(to.x - headLen * Math.cos(angle - Math.PI/6), to.y - headLen * Math.sin(angle - Math.PI/6));
        arrow.moveTo(to.x, to.y);
        arrow.lineTo(to.x - headLen * Math.cos(angle + Math.PI/6), to.y - headLen * Math.sin(angle + Math.PI/6));
        
        // Animated pulse along the line
        const dist = Math.sqrt((to.x-from.x)**2 + (to.y-from.y)**2);
        const segments = 10;
        const pos = (this.time * 2 + arrow.offset) % 1.0;
        
        const px = from.x + (to.x - from.x) * pos;
        const py = from.y + (to.y - from.y) * pos;
        
        arrow.beginFill(0xFFFFFF, 0.8 * arrow.alpha);
        arrow.drawCircle(px, py, arrow.thickness + 1);
        arrow.endFill();
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
                particle.alpha = 0.5 + Math.sin(this.time * 2) * 0.5;
            } else {
                particle.alpha = 1.0;
            }
        }

        // Update task arrows
        for (const [taskId, arrow] of this.taskArrows.entries()) {
            this._drawTaskArrow(arrow);
            
            if (arrow.completed) {
                arrow.alpha -= delta * 0.01;
                if (arrow.alpha <= 0) {
                    this.taskLayer.removeChild(arrow);
                    this.taskArrows.delete(taskId);
                }
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
