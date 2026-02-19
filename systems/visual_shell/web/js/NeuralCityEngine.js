/**
 * NeuralCityEngine - Main controller for Neural City visualization.
 *
 * Orchestrates TelemetryBus, CityOrchestrator, and PixiJS rendering.
 * Creates a living urban landscape representing agent cognition,
 * metabolism, and system state.
 */

class NeuralCityEngine {
    constructor(config = {}) {
        this.config = {
            wsUrl: config.wsUrl || 'ws://localhost:8768',
            app: config.app || null,
            container: config.container || null,
            cityConfig: config.cityConfig || {},
            ...config
        };

        // Core components
        this.telemetryBus = new TelemetryBus(this.config.wsUrl);
        this.orchestrator = new CityOrchestrator(this.config.cityConfig);

        // Render layers
        this.staticLayer = null;   // District geometry, spire
        this.dynamicLayer = null;  // Buildings, bridges
        this.particleLayer = null; // Ambient traffic, effects

        // Central spire state
        this.spire = {
            ipc: 0.5,
            throttleLevel: 'NONE',
            tectonicActive: false
        };

        // Running state
        this.running = false;
        this.lastUpdate = 0;

        // Track graphics for updates
        this.buildingGraphics = new Map();
        this.bridgeGraphics = new Map();

        // Glass Box introspection
        this.glassBox = null;
        this._setupGlassBox();

        // Saccadic Eye-Tracking state
        this.saccades = new Map();

        // Live Tile Manager
        this.liveTileManager = null;

        // Instanced City Mesh (WebGPU)
        this.cityMesh = new InstancedCityMesh(this.config.app);

        // Neural Pulse System (Phase 27)
        this.neuralPulseSystem = null;
    }

    /**
     * Start the Neural City engine.
     * Initializes render layers, connects telemetry, starts render loop.
     */
    async start() {
        console.log('NeuralCityEngine starting...');

        this._setupOrchestratorCallbacks();
        this._setupTelemetryHandlers();
        this._createRenderLayers();

        // Connect telemetry bus
        try {
            await this.telemetryBus.connect();
        } catch (e) {
            console.warn('TelemetryBus connection failed, running in standalone mode:', e);
        }

        // Setup Live Tile Manager
        this._setupLiveTileManager();

        this.running = true;
        this._startRenderLoop();

        console.log('NeuralCityEngine started');
    }

    /**
     * Stop the engine.
     */
    stop() {
        this.running = false;
        this.telemetryBus.disconnect();
        console.log('NeuralCityEngine stopped');
    }

    /**
     * Connect to telemetry bus (can be called after start if connection failed).
     */
    async connectTelemetry() {
        try {
            await this.telemetryBus.connect();
            return true;
        } catch (e) {
            console.warn('connectTelemetry failed:', e);
            return false;
        }
    }

    /**
     * Get current city state for debugging/HUD.
     */
    getState() {
        return {
            buildings: this.orchestrator.buildings.size,
            bridges: this.orchestrator.bridges.length,
            spire: { ...this.spire },
            connected: this.telemetryBus.isConnected(),
            running: this.running
        };
    }

    // =====================================================
    // Private Methods - Setup
    // =====================================================

    /**
     * Setup Glass Box overlay and wire callbacks.
     * @private
     */
    _setupGlassBox() {
        if (typeof GlassBoxOverlay === 'undefined') {
            console.warn('GlassBoxOverlay not available, introspection disabled');
            return;
        }

        this.glassBox = new GlassBoxOverlay({
            width: 400
        });

        // Wire up control callbacks
        this.glassBox.controller.onRelocate = (agentId, district) => {
            const building = this.orchestrator.relocateAgent(agentId, district);
            if (building) {
                this._updateBuildingRender(building);
            }
        };

        this.glassBox.controller.onEvict = (agentId) => {
            this.orchestrator.evictAgent(agentId);
            this.glassBox.close();
        };

        this.glassBox.controller.onDebug = (agentId) => {
            const building = this.orchestrator.getBuilding(agentId);
            console.log('Agent Debug Dump:', building);
            if (building) {
                const graphics = this.buildingGraphics.get(agentId);
                console.log('Building graphics:', graphics);
            }
        };

        this.glassBox.controller.onCommand = (agentId, command) => {
            console.log(`Sending command to ${agentId}: ${command}`);
            // Emit command via telemetry bus if connected
            if (this.telemetryBus.isConnected()) {
                this.telemetryBus.emit('agent_command', {
                    agent_id: agentId,
                    command: command
                });
            }
        };

        // Wire up live tile controls
        this.glassBox.controller.onStart = (agentId) => {
            const building = this.orchestrator.getBuilding(agentId);
            if (building && building.liveTile && this.liveTileManager) {
                this.liveTileManager.bootTile(agentId, building.liveTile.rtsPath);
            }
        };

        this.glassBox.controller.onStop = (agentId) => {
            if (this.liveTileManager) {
                this.liveTileManager.stopTile(agentId);
            }
        };

        this.glassBox.controller.onRestart = (agentId) => {
            const building = this.orchestrator.getBuilding(agentId);
            if (building && building.liveTile && this.liveTileManager) {
                this.liveTileManager.stopTile(agentId);
                setTimeout(() => {
                    this.liveTileManager.bootTile(agentId, building.liveTile.rtsPath);
                }, 1000);
            }
        };
    }

    /**
     * Wire up orchestrator callbacks to render methods.
     * @private
     */
    _setupOrchestratorCallbacks() {
        this.orchestrator.onBuildingSpawn = (building) => {
            this._renderBuilding(building);
        };

        this.orchestrator.onBuildingUpdate = (building) => {
            this._updateBuildingRender(building);
        };

        this.orchestrator.onBridgeCreate = (bridge) => {
            this._renderBridge(bridge);
        };

        this.orchestrator.onDistrictPulse = (district) => {
            this._animateDistrictPulse(district);
        };
    }

    /**
     * Subscribe to telemetry events and wire to orchestrator.
     */
    _setupTelemetryHandlers() {
        // Metabolism updates -> Spire state
        this.telemetryBus.subscribe('metabolism_update', (data) => {
            this._updateFromTelemetry('metabolism_update', data);
        });

        // Tectonic shifts -> Metabolic district pulse
        this.telemetryBus.subscribe('tectonic_shift', (data) => {
            this._updateFromTelemetry('tectonic_shift', data);
        });

        // Agent spawn -> New building
        this.telemetryBus.subscribe('agent_spawn', (data) => {
            this._updateFromTelemetry('agent_spawn', data);
        });

        // Agent communication -> Bridge arc
        this.telemetryBus.subscribe('agent_comm', (data) => {
            this._updateFromTelemetry('agent_comm', data);
        });

        // Building updates
        this.telemetryBus.subscribe('agent_metrics', (data) => {
            this._updateFromTelemetry('agent_metrics', data);
        });

        // Live Tile framebuffer updates
        this.telemetryBus.subscribe('tile_framebuffer', (data) => {
            this._updateFromTelemetry('tile_framebuffer', data);
        });

        // Neural Events (Phase 27: Distributed Neural Memory)
        this.telemetryBus.subscribe('neural_event', (data) => {
            this._updateFromTelemetry('neural_event', data);
        });

        // Memory broadcasts from NeuralMemoryHub
        this.telemetryBus.subscribe('memory_broadcast', (data) => {
            this._updateFromTelemetry('memory_broadcast', data);
        });

        // Collective context updates
        this.telemetryBus.subscribe('collective_context', (data) => {
            this._updateFromTelemetry('collective_context', data);
        });
    }

    /**
     * Unified handler for all telemetry events.
     */
    _updateFromTelemetry(eventType, data) {
        switch (eventType) {
            case 'metabolism_update':
                this.spire.ipc = data.ipc || 0.5;
                this.spire.throttleLevel = data.throttle_level || 'NONE';
                this._updateSpireVisual();
                break;

            case 'tectonic_shift':
                this.spire.tectonicActive = data.success || false;
                this.orchestrator.pulseDistrict('metabolic');
                break;

            case 'agent_spawn':
                this.orchestrator.spawnBuilding(
                    data.agent_id,
                    data.role,
                    data.metrics || {}
                );
                break;

            case 'agent_comm':
                this.orchestrator.createBridge(
                    data.from,
                    data.to,
                    data.event_type
                );
                break;

            case 'agent_metrics':
                this.orchestrator.updateBuilding(data.agent_id, data);
                break;

            case 'tile_framebuffer':
                this._updateBuildingFramebuffer(data.tile_id, data.data);
                break;

            case 'neural_event':
                // Trigger neural pulse visualization
                if (this.neuralPulseSystem && data.tile_id) {
                    const sourceBuilding = this.orchestrator.getBuilding(data.tile_id);
                    if (sourceBuilding) {
                        this.neuralPulseSystem.emitPulse(
                            sourceBuilding.position,
                            data.event_type || 'CODE_DISCOVERY',
                            data.confidence || 0.5,
                            data.tile_id
                        );
                    }
                }
                // Update Glass Box with collective context if open
                if (this.glassBox && this.glassBox.agentId !== data.tile_id) {
                    this._refreshCollectiveContext(this.glassBox.agentId);
                }
                break;

            case 'memory_broadcast':
                // Memory hub shared an event - could show in HUD
                console.log('🧠 Memory broadcast:', data.event_type, 'from', data.tile_id);
                break;

            case 'collective_context':
                // Update Glass Box with new collective context
                if (this.glassBox && this.glassBox.agentId === data.tile_id) {
                    this.glassBox.panel.setCollectiveContext(data);
                }
                break;
        }
    }

    /**
     * Refresh collective context for a tile from the neural memory hub.
     * @private
     */
    async _refreshCollectiveContext(tileId) {
        // This would typically call back to the backend via WebSocket
        // For now, just emit a request event
        if (this.telemetryBus.isConnected()) {
            this.telemetryBus.emit('get_collective_context', { tile_id: tileId });
        }
    }

    /**
     * Create PixiJS render layers.
     */
    _createRenderLayers() {
        if (!this.config.app) return;

        // Static layer (districts, terrain, spire)
        this.staticLayer = new PIXI.Container();
        this.staticLayer.name = 'neural_city_static';
        this._createDistrictGeometry();

        // Dynamic layer (buildings, bridges)
        this.dynamicLayer = new PIXI.Container();
        this.dynamicLayer.name = 'neural_city_dynamic';

        // Add City Mesh to static layer or dedicated layer
        if (this.cityMesh && this.staticLayer) {
            this.staticLayer.addChild(this.cityMesh.container);
        }

        // Saccadic layer (eye-tracking beams and reticles)
        this.saccadicLayer = new PIXI.Container();
        this.saccadicLayer.name = 'neural_city_saccadic';

        // Particle layer (ambient traffic)
        this.particleLayer = new PIXI.Container();
        this.particleLayer.name = 'neural_city_particles';

        // Neural Pulse layer (Phase 27: distributed memory visualization)
        if (typeof NeuralPulseSystem !== 'undefined') {
            this.neuralPulseSystem = new NeuralPulseSystem(this.config.app);
            this.neuralPulseSystem.connectToTelemetry(this.telemetryBus);
        }

        // Add to app stage
        if (this.config.container) {
            this.config.container.addChild(this.staticLayer);
            this.config.container.addChild(this.dynamicLayer);
            this.config.container.addChild(this.saccadicLayer);
            this.config.container.addChild(this.particleLayer);
        }
    }

    // =====================================================
    // Private Methods - Rendering
    // =====================================================

    /**
     * Trigger a Saccadic Eye-Tracking event for an agent.
     * Visualizes a beam of attention scanning the building.
     */
    triggerSaccade(agentId) {
        if (!this.saccadicLayer) return;

        const building = this.orchestrator.getBuilding(agentId);
        if (!building) return;

        const saccade = {
            id: `saccade_${agentId}_${Date.now()}`,
            agentId: agentId,
            targetPos: building.position,
            createdAt: Date.now(),
            ttl: 1500, // Visible for 1.5s
            color: 0xff00ff // Default magenta scan color
        };

        this._renderSaccade(saccade);
    }

    /**
     * Render the visual elements of a saccade (beam + reticle).
     * @private
     */
    _renderSaccade(saccade) {
        const graphics = new PIXI.Graphics();
        graphics.name = saccade.id;

        // "Eye" position (simulated as coming from top-center/sky)
        // We can randomize or calculate based on viewport
        const eyeX = saccade.targetPos.x; // Straight down for now, or offset? Let's offset slightly for drama
        const eyeY = -600; // From "the cloud"

        // Draw Beam (fades out towards bottom)
        graphics.moveTo(eyeX, eyeY);
        graphics.lineTo(saccade.targetPos.x, saccade.targetPos.y);
        graphics.stroke({ color: saccade.color, width: 2, alpha: 0.6 });

        // Draw Reticle around target
        const size = 40;
        const cornerLen = 10;
        
        // Top-left
        graphics.moveTo(saccade.targetPos.x - size/2, saccade.targetPos.y - size/2 + cornerLen);
        graphics.lineTo(saccade.targetPos.x - size/2, saccade.targetPos.y - size/2);
        graphics.lineTo(saccade.targetPos.x - size/2 + cornerLen, saccade.targetPos.y - size/2);

        // Top-right
        graphics.moveTo(saccade.targetPos.x + size/2 - cornerLen, saccade.targetPos.y - size/2);
        graphics.lineTo(saccade.targetPos.x + size/2, saccade.targetPos.y - size/2);
        graphics.lineTo(saccade.targetPos.x + size/2, saccade.targetPos.y - size/2 + cornerLen);

        // Bottom-right
        graphics.moveTo(saccade.targetPos.x + size/2, saccade.targetPos.y + size/2 - cornerLen);
        graphics.lineTo(saccade.targetPos.x + size/2, saccade.targetPos.y + size/2);
        graphics.lineTo(saccade.targetPos.x + size/2 - cornerLen, saccade.targetPos.y + size/2);

        // Bottom-left
        graphics.moveTo(saccade.targetPos.x - size/2 + cornerLen, saccade.targetPos.y + size/2);
        graphics.lineTo(saccade.targetPos.x - size/2, saccade.targetPos.y + size/2);
        graphics.lineTo(saccade.targetPos.x - size/2, saccade.targetPos.y + size/2 - cornerLen);

        graphics.stroke({ color: saccade.color, width: 2, alpha: 0.9 });

        // Add "ANALYZING" text label
        const style = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: saccade.color,
            align: 'center',
        });
        const text = new PIXI.Text({ text: 'SCANNING', style });
        text.x = saccade.targetPos.x - text.width / 2;
        text.y = saccade.targetPos.y - size / 2 - 15;
        graphics.addChild(text);

        // Store reference
        if (!this.saccades) this.saccades = new Map();
        this.saccades.set(saccade.id, { data: saccade, graphics: graphics });
        this.saccadicLayer.addChild(graphics);

        // Schedule removal
        setTimeout(() => {
            this._removeSaccade(saccade.id);
        }, saccade.ttl);
    }

    /**
     * Remove a saccade graphic.
     * @private
     */
    _removeSaccade(saccadeId) {
        if (!this.saccades || !this.saccades.has(saccadeId)) return;
        
        const entry = this.saccades.get(saccadeId);
        if (entry.graphics && entry.graphics.parent) {
            entry.graphics.parent.removeChild(entry.graphics);
        }
        this.saccades.delete(saccadeId);
    }

    /**
     * Update active saccades (animations, fades).
     * @private
     */
    _updateSaccades(now) {
        if (!this.saccades) return;

        this.saccades.forEach((entry, id) => {
            const age = now - entry.data.createdAt;
            const progress = age / entry.data.ttl;

            if (progress >= 1) {
                // Saccade finished (timeout handles removal, but we can set alpha to 0)
                entry.graphics.alpha = 0;
                return;
            }

            // Animate alpha: Fade in quickly, hold, then fade out
            let alpha = 1.0;
            if (progress < 0.1) alpha = progress * 10;
            else if (progress > 0.8) alpha = (1 - progress) * 5;

            entry.graphics.alpha = alpha;
        });
    }

    /**
     * Create district geometry and central spire.
     */
    _createDistrictGeometry() {
        if (!this.staticLayer) return;

        const districts = ['cognitive', 'metabolic', 'substrate'];
        const colors = [0x00aaff, 0xff8800, 0x00ff88];

        districts.forEach((name, i) => {
            const state = this.orchestrator.getDistrictState(name);
            if (!state.config) return;

            const graphics = new PIXI.Graphics();
            graphics.name = `district_${name}`;

            // District base circle
            graphics.circle(0, 0, 300);
            graphics.fill({ color: colors[i], alpha: 0.1 });
            graphics.stroke({ color: colors[i], width: 2, alpha: 0.3 });

            // Position based on district angle
            const angleRad = (state.config.angle * Math.PI) / 180;
            graphics.x = Math.cos(angleRad) * 200;
            graphics.y = Math.sin(angleRad) * 200;

            this.staticLayer.addChild(graphics);
        });

        // Create central spire
        this._createSpire();
    }

    /**
     * Create the central Tectonic Spire.
     */
    _createSpire() {
        if (!this.staticLayer) return;

        this.spireGraphic = new PIXI.Graphics();
        this.spireGraphic.name = 'tectonic_spire';
        this._updateSpireVisual();
        this.staticLayer.addChild(this.spireGraphic);
    }

    /**
     * Update a building's texture with a live framebuffer screenshot.
     * Uses the high-performance WebGPU Texture Array.
     * @private
     * @param {string} agentId - The agent/building ID
     * @param {string|HTMLImageElement} source - Base64 string or Image element
     */
    async _updateBuildingFramebuffer(agentId, source) {
        if (!this.cityMesh) return;

        try {
            // Update the live tile in the GPU texture array
            this.cityMesh.updateLiveTile(agentId, source);
        } catch (e) {
            console.debug(`Failed to update framebuffer for ${agentId}:`, e.message);
        }
    }

    /**
     * Update spire visual based on current state.
     */
    _updateSpireVisual() {
        if (!this.spireGraphic) return;

        const color = this._getSpireColor();

        this.spireGraphic.clear();

        // Spire base
        this.spireGraphic.rect(-20, -150, 40, 150);
        this.spireGraphic.fill({ color: 0x333333 });

        // Spire glow (color indicates health)
        this.spireGraphic.rect(-15, -145, 30, 140);
        this.spireGraphic.fill({ color: color, alpha: 0.6 });

        // Spire top (beacon)
        this.spireGraphic.circle(0, -150, 15);
        this.spireGraphic.fill({ color: color, alpha: 0.9 });

        // Glow ring
        this.spireGraphic.circle(0, -150, 20);
        this.spireGraphic.stroke({ color: color, width: 2, alpha: 0.5 });
    }

    /**
     * Get spire color based on throttle level and tectonic state.
     */
    _getSpireColor() {
        if (this.spire.tectonicActive) return 0xff4400;
        if (this.spire.throttleLevel === 'AGGRESSIVE') return 0xff0000;
        if (this.spire.throttleLevel === 'MODERATE') return 0xff8800;
        return 0x00ffff; // Healthy cyan
    }

    /**
     * Render a building graphics object.
     * Uses InstancedCityMesh for high-performance visual rendering.
     * Creates a lightweight proxy container for user interaction.
     * @private
     */
    async _renderBuilding(building) {
        if (!this.dynamicLayer) return;

        // 1. Update the GPU City Mesh
        this.cityMesh.updateAgent(building.id, {
            position: building.position,
            height: building.height,
            activity: building.activity,
            district: building.district,
            pasScore: building.stability?.pas || 1.0,
            textureIndex: -1 // Default to Hilbert
        });

        // 2. Create interaction proxy
        const proxy = new PIXI.Container();
        proxy.name = `proxy_${building.id}`;
        proxy.x = building.position.x;
        proxy.y = building.position.y;

        // Invisible hit area
        const hitArea = new PIXI.Graphics();
        hitArea.rect(-15, -building.height, 30, building.height);
        hitArea.fill({ color: 0xffffff, alpha: 0.001 }); // Almost invisible but hit-testable
        proxy.addChild(hitArea);

        // Enable click interaction for Glass Box introspection
        proxy.eventMode = 'static';
        proxy.cursor = 'pointer';
        proxy.on('click', (e) => this._handleBuildingClick(building.id, e));

        // Store proxy reference for updates (height changes)
        this.buildingGraphics.set(building.id, proxy);
        this.dynamicLayer.addChild(proxy);
    }

    /**
     * Handle building click to open Glass Box introspection.
     * @private
     * @param {string} agentId - The agent/building ID
     * @param {PIXI.FederatedEvent} event - The click event
     */
    _handleBuildingClick(agentId, event) {
        event.stopPropagation();

        const building = this.orchestrator.getBuilding(agentId);
        if (!building) return;

        // Get mock data for this agent (or real data when integrated)
        const agentData = this._getAgentData(agentId);

        // Open Glass Box with agent data
        if (this.glassBox) {
            this.glassBox.open({
                agentId: agentId,
                role: building.role,
                district: building.district,
                rtsPath: building.rtsPath,
                ...agentData
            });

            // Update controller with current agent
            if (this.glassBox.controller) {
                this.glassBox.controller.setAgent(agentId);
            }
        }

        // Highlight building briefly
        this._highlightBuilding(agentId);
    }

    /**
     * Get agent data for Glass Box display.
     * Uses MockAgentData for demo; will be replaced with real telemetry.
     * @private
     * @param {string} agentId - The agent ID
     * @returns {Object} Agent data with thoughts, intent, metabolism, communications
     */
    _getAgentData(agentId) {
        // Use MockAgentData if available (demo mode)
        if (typeof MockAgentData !== 'undefined') {
            return MockAgentData.generate(agentId);
        }

        // Fallback to minimal data
        return {
            thoughts: [],
            intent: { goal: 'No data available', steps: [] },
            metabolism: { ipc: 0, memory: { used: 0, total: 512 }, activity: 0 },
            communications: []
        };
    }

    /**
     * Highlight a building briefly to indicate selection.
     * @private
     * @param {string} agentId - The agent/building ID
     */
    _highlightBuilding(agentId) {
        const graphics = this.buildingGraphics.get(agentId);
        if (!graphics) return;

        // Store original alpha
        const originalAlpha = graphics.alpha;

        // Flash effect
        graphics.alpha = 1.0;
        setTimeout(() => {
            graphics.alpha = originalAlpha;
        }, 200);
    }

    /**
     * Update building render when metrics change.
     */
    _updateBuildingRender(building) {
        // 1. Update the GPU City Mesh
        this.cityMesh.updateAgent(building.id, {
            height: building.height,
            activity: building.activity,
            district: building.district,
            pasScore: building.stability?.pas || 1.0
        });

        // 2. Update interaction proxy
        const proxy = this.buildingGraphics.get(building.id);
        if (proxy) {
            proxy.children.forEach(child => {
                if (child instanceof PIXI.Graphics) {
                    child.clear();
                    child.rect(-15, -building.height, 30, building.height);
                    child.fill({ color: 0xffffff, alpha: 0.001 });
                }
            });
        }
    }

    /**
     * Render a bridge arc between two buildings.
     */
    _renderBridge(bridge) {
        if (!this.dynamicLayer) return;

        const graphics = new PIXI.Graphics();
        graphics.name = `bridge_${bridge.id}`;

        // Draw arc line
        graphics.moveTo(bridge.fromPos.x, bridge.fromPos.y);

        // Curved arc (quadratic bezier midpoint elevated)
        const midX = (bridge.fromPos.x + bridge.toPos.x) / 2;
        const midY = (bridge.fromPos.y + bridge.toPos.y) / 2 - 30; // Arc up

        graphics.quadraticCurveTo(midX, midY, bridge.toPos.x, bridge.toPos.y);
        graphics.stroke({ color: bridge.color, width: 3, alpha: 0.8 });

        // Bridge dots at endpoints
        graphics.circle(bridge.fromPos.x, bridge.fromPos.y, 4);
        graphics.fill({ color: bridge.color, alpha: 1.0 });
        graphics.circle(bridge.toPos.x, bridge.toPos.y, 4);
        graphics.fill({ color: bridge.color, alpha: 1.0 });

        bridge.graphics = graphics;
        this.bridgeGraphics.set(bridge.id, graphics);

        this.dynamicLayer.addChild(graphics);

        // Schedule fade out
        setTimeout(() => {
            this._removeBridge(bridge);
        }, bridge.ttl);
    }

    /**
     * Remove bridge graphics after TTL expires.
     */
    _removeBridge(bridge) {
        const graphics = this.bridgeGraphics.get(bridge.id);
        if (graphics && this.dynamicLayer) {
            this.dynamicLayer.removeChild(graphics);
            this.bridgeGraphics.delete(bridge.id);
        }
    }

    /**
     * Animate district pulse effect.
     */
    _animateDistrictPulse(districtName) {
        if (!this.dynamicLayer) return;

        const state = this.orchestrator.getDistrictState(districtName);
        if (!state.config) return;

        const pulseGraphics = new PIXI.Graphics();
        pulseGraphics.name = `pulse_${districtName}_${Date.now()}`;

        const color = state.config.color;

        // Expanding ring animation
        pulseGraphics.circle(0, 0, 50);
        pulseGraphics.stroke({ color: color, width: 3, alpha: 0.8 });

        const angleRad = (state.config.angle * Math.PI) / 180;
        pulseGraphics.x = Math.cos(angleRad) * 200;
        pulseGraphics.y = Math.sin(angleRad) * 200;

        this.dynamicLayer.addChild(pulseGraphics);

        // Animate expansion and fade
        const startTime = Date.now();
        const duration = 1000;

        const animate = () => {
            const elapsed = Date.now() - startTime;
            const progress = elapsed / duration;

            if (progress >= 1) {
                this.dynamicLayer.removeChild(pulseGraphics);
                return;
            }

            const scale = 1 + progress * 3;
            const alpha = 0.8 * (1 - progress);

            pulseGraphics.clear();
            pulseGraphics.circle(0, 0, 50 * scale);
            pulseGraphics.stroke({ color: color, width: 3, alpha });

            requestAnimationFrame(animate);
        };

        animate();
    }

    /**
     * Get district color constant.
     */
    _getDistrictColor(district) {
        const colors = {
            cognitive: 0x00aaff,
            metabolic: 0xff8800,
            substrate: 0x00ff88
        };
        return colors[district] || 0xffffff;
    }

    /**
     * Get stability color based on PAS score.
     * Green (0.7+) = Stable, Yellow (0.5-0.7) = Degraded, Red (<0.5) = Critical.
     * @private
     * @param {number} pas - PAS score (0-1)
     * @returns {number} Hex color value
     */
    _getStabilityColor(pas) {
        if (pas >= 0.7) return 0x00ff00;  // Green - Stable
        if (pas >= 0.5) return 0xffff00;  // Yellow - Degraded
        return 0xff0000;                   // Red - Critical
    }

    // =====================================================
    // Live Tile Management
    // =====================================================

    /**
     * Setup Live Tile Manager and wire callbacks.
     * @private
     */
    _setupLiveTileManager() {
        if (typeof LiveTileManager === 'undefined') {
            console.warn('LiveTileManager not available, live tiles disabled');
            return;
        }

        this.liveTileManager = new LiveTileManager(this.config.wsUrl);

        this.liveTileManager.onTileBooted = (tile) => {
            console.log(`🏙️ Live tile booted: ${tile.id}`);
            // Create building for tile if not exists
            if (!this.orchestrator.getBuilding(tile.id)) {
                this.orchestrator.spawnBuilding(tile.id, 'substrate', { memory: 256 });
            }
            this.orchestrator.setLiveTile(tile.id, tile);
        };

        this.liveTileManager.onFramebufferUpdate = (tile) => {
            this._updateLiveTexture(tile);
        };

        this.liveTileManager.connect().catch(e => {
            console.warn('LiveTileManager connection failed:', e);
        });
    }

    /**
     * Update live texture for a tile.
     * @private
     * @param {LiveTile} tile - The tile with framebuffer data
     */
    _updateLiveTexture(tile) {
        const building = this.orchestrator.getBuilding(tile.id);
        if (!building || !tile.framebuffer) return;

        // Create or update live texture
        if (!building.liveTexture) {
            // Create texture from framebuffer dimensions
            building.liveTexture = PIXI.Texture.fromBuffer(
                tile.framebuffer.data,
                tile.framebuffer.width,
                tile.framebuffer.height
            );
        } else {
            // Update existing texture
            building.liveTexture.baseTexture.resource.update(tile.framebuffer.data);
        }

        // Update building sprite to show live texture
        if (building.graphics) {
            const skin = building.graphics.children.find(c => c instanceof PIXI.Sprite);
            if (skin) {
                skin.texture = building.liveTexture;
            }
        }
    }

    /**
     * Update all live framebuffers.
     * @private
     */
    _updateLiveFramebuffers() {
        this.orchestrator.buildings.forEach(building => {
            if (building.liveTile && building.liveTile.isRunning()) {
                this._updateLiveTexture(building.liveTile);
            }
        });
    }

    // =====================================================
    // Private Methods - Render Loop
    // =====================================================

    /**
     * Start the main render loop.
     */
    _startRenderLoop() {
        const update = () => {
            if (!this.running) return;

            const now = Date.now();

            // Update bridge fade effects
            this._updateBridgeFades(now);

            // Update district pulses
            this._updateDistrictPulses(now);

            // Update saccadic eye-tracking
            this._updateSaccades(now);

            // Update neural pulse effects (Phase 27)
            if (this.neuralPulseSystem) {
                this.neuralPulseSystem.update();
            }

            // Update City Mesh uniforms (time, camera)
            if (this.cityMesh) {
                const camera = { x: 0, y: 0 };
                this.cityMesh.tick(0, now / 1000, camera);
            }

            requestAnimationFrame(update);
        };

        update();
    }

    /**
     * Update bridge alpha based on age.
     */
    _updateBridgeFades(now) {
        this.orchestrator.bridges.forEach(bridge => {
            const age = now - bridge.createdAt;
            const alpha = Math.max(0, 1 - (age / bridge.ttl));

            const graphics = this.bridgeGraphics.get(bridge.id);
            if (graphics) {
                graphics.alpha = alpha;
            }
        });
    }

    /**
     * Update district pulse states.
     */
    _updateDistrictPulses(now) {
        const districts = ['cognitive', 'metabolic', 'substrate'];

        districts.forEach(name => {
            const pulse = this.orchestrator.districtPulses.get(name);
            if (pulse) {
                const age = now - pulse.startedAt;
                if (age > 2000) {
                    this.orchestrator.districtPulses.delete(name);
                }
            }
        });
    }
}

// Export for browser and module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = NeuralCityEngine;
}
if (typeof window !== 'undefined') {
    window.NeuralCityEngine = NeuralCityEngine;
}
