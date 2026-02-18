/**
 * Blueprint Loader Component
 * 
 * Auto-detects and loads blueprints into the PixiJS Infinite Map.
 * Provides a UI for dragging and dropping blueprints onto neural nodes.
 */

class BlueprintLoader {
    constructor(app, infiniteMap) {
        this.app = app;
        this.infiniteMap = infiniteMap;
        this.blueprints = [];
        this.activeBlueprints = new Set();

        // Configuration
        this.config = {
            blueprintsPath: '/vectoros_v2/blueprints_gguf/',
            pollInterval: 10000,
            apiEndpoint: 'http://localhost:8766/api/blueprints' // Python backend
        };

        this.container = new PIXI.Container();
        this.app.stage.addChild(this.container);
        this.container.zIndex = 500; // Above map, below UI (which is HTML)

        this.init();
    }

    async init() {
        console.log('📜 Blueprint Loader initialized');
        this.createBlueprintPanel();
        this.startPolling();
    }

    createBlueprintPanel() {
        // Create a collapsible panel on the right side
        this.panel = new PIXI.Container();
        this.panel.x = window.innerWidth - 260;
        this.panel.y = 80;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.8);
        bg.lineStyle(1, 0x00ccff, 0.5);
        bg.drawRoundedRect(0, 0, 250, 400, 10);
        bg.endFill();
        this.panel.addChild(bg);

        // Header
        const header = new PIXI.Text('BLUEPRINTS', {
            fontFamily: 'Courier New',
            fontSize: 16,
            fontWeight: 'bold',
            fill: 0x00ccff
        });
        header.x = 20;
        header.y = 15;
        this.panel.addChild(header);

        // List container
        this.listContainer = new PIXI.Container();
        this.listContainer.x = 10;
        this.listContainer.y = 50;
        this.panel.addChild(this.listContainer);

        // Add to main container
        this.container.addChild(this.panel);

        // Make draggable
        this.panel.interactive = true;
        this.panel.cursor = 'move';

        let dragData = null;
        let dragging = false;

        this.panel.on('pointerdown', (event) => {
            dragData = event.data;
            this.panel.alpha = 0.5;
            dragging = true;
        });

        this.panel.on('pointerup', () => {
            this.panel.alpha = 1;
            dragging = false;
            dragData = null;
        });

        this.panel.on('pointermove', () => {
            if (dragging) {
                const newPosition = dragData.getLocalPosition(this.panel.parent);
                this.panel.x = newPosition.x - 125;
                this.panel.y = newPosition.y - 15;
            }
        });
    }

    async startPolling() {
        // Initial load
        await this.loadBlueprints();

        // Poll for new blueprints
        setInterval(() => this.loadBlueprints(), this.config.pollInterval);
    }

    async loadBlueprints() {
        try {
            // In a real implementation this would hit the API
            // For now we'll simulate based on known files or use a manifest
            // Mocking the API response based on file system knowledge
            const mockBlueprints = [
                { id: 'bp_reasoning', name: 'Reasoning_Cortex_v1', type: 'Logic', color: 0x00ff00 },
                { id: 'bp_coding', name: 'Coding_Qwen2.5_Coder', type: 'Coding', color: 0x0088ff },
                { id: 'bp_creative', name: 'Creative_Phi_3', type: 'Creative', color: 0xff00ff }
            ];

            this.updateBlueprintList(mockBlueprints);

        } catch (e) {
            console.warn('Failed to load blueprints:', e);
        }
    }

    updateBlueprintList(blueprints) {
        // Clear current list
        this.listContainer.removeChildren();
        this.blueprints = blueprints;

        let yOffset = 0;

        blueprints.forEach(bp => {
            const item = new PIXI.Container();
            item.y = yOffset;

            // Item Background
            const itemBg = new PIXI.Graphics();
            itemBg.beginFill(0x222222, 0.5);
            itemBg.drawRoundedRect(0, 0, 230, 40, 5);
            itemBg.endFill();
            item.addChild(itemBg);

            // Icon
            const icon = new PIXI.Graphics();
            icon.beginFill(bp.color, 1);
            icon.drawCircle(20, 20, 8);
            icon.endFill();
            item.addChild(icon);

            // Name
            const name = new PIXI.Text(bp.name.substring(0, 18), {
                fontFamily: 'Arial',
                fontSize: 12,
                fill: 0xffffff
            });
            name.x = 40;
            name.y = 12;
            item.addChild(name);

            // Drag interaction
            item.interactive = true;
            item.cursor = 'grab';

            // Setup drag logic
            this.setupItemDrag(item, bp);

            this.listContainer.addChild(item);
            yOffset += 45;
        });
    }

    setupItemDrag(item, blueprint) {
        let dragGhost = null;
        let dragging = false;
        let startPos = null;

        item.on('pointerdown', (event) => {
            dragging = true;
            startPos = event.data.global.clone();

            // Create ghost
            dragGhost = new PIXI.Container();

            const bg = new PIXI.Graphics();
            bg.beginFill(blueprint.color, 0.4);
            bg.lineStyle(2, blueprint.color, 1);
            bg.drawCircle(0, 0, 30);
            bg.endFill();
            dragGhost.addChild(bg);

            const glint = new PIXI.Text('⚡', { fontSize: 20 });
            glint.anchor.set(0.5);
            dragGhost.addChild(glint);

            dragGhost.x = startPos.x;
            dragGhost.y = startPos.y;

            this.app.stage.addChild(dragGhost);
        });

        item.on('pointermove', (event) => {
            if (dragging && dragGhost) {
                const pos = event.data.global;
                dragGhost.x = pos.x;
                dragGhost.y = pos.y;
            }
        });

        item.on('pointerup', (event) => {
            if (!dragging) return;
            dragging = false;

            const dropPos = event.data.global;

            // Check if dropped on map
            // For now, let's just assume dropping anywhere on the screen triggers "Imprint" attempt
            // ideally we check collision with "Neural Nodes"

            this.triggerImprint(blueprint, dropPos);

            if (dragGhost) {
                this.app.stage.removeChild(dragGhost);
                dragGhost = null;
            }
        });

        item.on('pointerupoutside', (event) => {
            if (dragging) {
                dragging = false;
                if (dragGhost) {
                    this.app.stage.removeChild(dragGhost);
                    dragGhost = null;
                }
            }
        });
    }

    triggerImprint(blueprint, position) {
        console.log(`⚡ IMPRINTING ${blueprint.name} at ${position.x}, ${position.y}`);

        // Show visual effect
        const shockwave = new PIXI.Graphics();
        shockwave.lineStyle(5, blueprint.color, 1);
        shockwave.drawCircle(0, 0, 10);
        shockwave.x = position.x;
        shockwave.y = position.y;
        this.app.stage.addChild(shockwave);

        let radius = 10;
        const expand = () => {
            radius += 15;
            shockwave.clear();
            shockwave.lineStyle(5, blueprint.color, 1 - (radius / 300));
            shockwave.drawCircle(0, 0, radius);

            if (radius < 300) {
                requestAnimationFrame(expand);
            } else {
                this.app.stage.removeChild(shockwave);
            }
        };
        expand();

        // Send command to backend (if connected)
        // In this simulation, we'll log it. 
        // Real implementation: POST /api/imprint { blueprint: id, x: x, y: y }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.BlueprintLoader = BlueprintLoader;
}
