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

        // ... (existing texture loading code) ...
        const brainTexture = await PIXI.Assets.load(this.config.brainAtlasPath);
        const fontTexture = await PIXI.Assets.load(this.config.fontAtlasPath);

        // ... (existing metrics buffer code) ...
        const metricsData = new Float32Array(256 * 12);
        for (let i = 0; i < 256; i++) {
            const offset = i * 12;
            const col = i % 16;
            const row = Math.floor(i / 16);
            
            metricsData[offset] = i; 
            metricsData[offset + 1] = col / 16; 
            metricsData[offset + 2] = row / 16; 
            metricsData[offset + 3] = (col + 1) / 16; 
            metricsData[offset + 4] = (row + 1) / 16; 
            metricsData[offset + 5] = 64; 
            metricsData[offset + 6] = 64; 
            metricsData[offset + 7] = 0;  
            metricsData[offset + 8] = 0;  
            metricsData[offset + 9] = 64; 
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

        // 4. Create Interactive Quad
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000);
        bg.drawRect(0, 0, this.app.screen.width, this.app.screen.height);
        bg.endFill();
        bg.filters = [this.filter];
        
        // Enable interaction for the Synaptic Query Interface
        bg.eventMode = 'static';
        bg.on('pointerdown', (e) => this.handleSynapticQuery(e));
        
        this.container.addChild(bg);
        this.isInitialized = true;
        
        console.log('✅ Legible Brain Renderer ready. Synaptic Query Interface active.');
        return this.container;
    }

    /**
     * Synaptic Query: Map → Code
     * Translates a click on the map into a Live GlyphStratum DAG.
     * Now accepts sampled brain data for "Live Weight Topology".
     */
    handleSynapticQuery(event, sampledData = null) {
        const x = event.global.x / this.app.screen.width;
        const y = event.global.y / this.app.screen.height;
        const sectorId = Math.floor(x * 5);
        
        const sectorNames = ["EMBEDDING", "ATTENTION", "FEED_FORWARD", "LAYER_NORM", "HEAD"];
        const sector = sectorNames[sectorId];
        
        // Use provided sampled data (R=activation, G=entropy, B=sector) 
        // or fallback to defaults
        const r = sampledData ? sampledData.r : 0.5;
        const g = sampledData ? sampledData.g : 0.2;
        const b = sampledData ? sampledData.b : x;

        console.log(`🔍 Probing Synaptic Territory: ${sector} (A:${r.toFixed(2)}, E:${g.toFixed(2)})`);
        
        // Generate a UNIQUE GlyphStratum DAG based on the actual weights (Live Topology)
        const dag = this.reconstructLogic(sector, r, g, b);
        
        // Emit event for the UI/Overlay to display the "Source Code"
        const queryEvent = new CustomEvent('SYNAPTIC_QUERY_RESULT', {
            detail: {
                sector: sector,
                activation: r,
                entropy: g,
                dag: dag,
                coords: { x: event.global.x, y: event.global.y }
            }
        });
        window.dispatchEvent(queryEvent);
    }

    reconstructLogic(sector, activation, entropy, sectorId) {
        // "Live Weight Topology": Reconstruct a unique, executable DAG
        // Format is compatible with systems/glyph_stratum/core/executor.py
        
        const dag = {
            name: `${sector}_Unit_${Math.floor(activation * 1000)}`,
            entry: 0,
            glyphs: {}
        };

        // Node 1: The Input Data (Substrate)
        dag.glyphs[1] = {
            index: 1,
            opcode: "DATA",
            stratum: "Substrate",
            metadata: {
                rationale: `Neural Weight Data (Coord: ${Math.floor(sectorId * 1024)})`,
                dependencies: [],
                invariants: { value: activation },
                provenance: "PixelBrain_Probe"
            }
        };

        // Node 0: The Functional Core
        let primaryOp = "NOP";
        let rationale = "Idle Substrate";

        if (sector === "ATTENTION") primaryOp = "CALL";
        else if (sector === "EMBEDDING") primaryOp = "DATA";
        else if (sector === "FEED_FORWARD") primaryOp = "LOAD";
        else if (sector === "LAYER_NORM") primaryOp = "TYPE";
        else if (sector === "HEAD") primaryOp = "EXPORT";

        dag.glyphs[0] = { 
            index: 0,
            opcode: primaryOp, 
            stratum: activation > 0.8 ? "Intent" : (activation > 0.5 ? "Logic" : "Memory"),
            metadata: {
                rationale: `${sector} Unit Execution (Energy: ${activation.toFixed(4)})`,
                dependencies: [1], // Depends on Node 1 (Data)
                invariants: { weight: activation },
                provenance: "PixelBrain_Probe"
            }
        };

        // High-Entropy branching logic (Ouroboros Repair path)
        if (entropy > 0.6) {
            dag.glyphs[2] = {
                index: 2,
                opcode: "BRANCH",
                stratum: "Logic",
                metadata: {
                    rationale: "Uncertainty Path: Entropy > 0.6",
                    dependencies: [0, 3], // Branch between core and fallback
                    invariants: { condition: entropy },
                    provenance: "PixelBrain_Probe"
                }
            };
            dag.glyphs[3] = {
                index: 3,
                opcode: "CALL",
                stratum: "Logic",
                metadata: {
                    rationale: "Secondary Stochastic Synapse",
                    dependencies: [1],
                    invariants: {},
                    provenance: "PixelBrain_Probe"
                }
            };
            dag.entry = 2; // Entry point shifts to the Branch
        }
        
        return dag;
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

    /**
     * Phase 41: Ouroboros Repair - Heal a fracture
     */
    async heal(coords, sampledData) {
        if (!this.mutationClient) {
            console.warn('MutationClient not connected');
            return { success: false, error: 'MutationClient not connected' };
        }

        const x = coords.x;
        const y = coords.y;
        const sectorId = Math.floor(sampledData.b * 5);

        const sectorNames = ["EMBEDDING", "ATTENTION", "FEED_FORWARD", "LAYER_NORM", "HEAD"];
        const sector = sectorNames[sectorId];

        const activation = sampledData.r;
        const entropy = sampledData.g;;

        // Create fracture object
        const fracture = {
            x: x,
            y: y,
            entropy: entropy,
            activation: activation,
            sector: sector,
            severity: entropy > 0.8 ? 'critical' : entropy > 0.6 ? 'medium' : 'low'
        };

        // Heal the fracture
        const result = await this.mutationClient.heal(fracture);

        return result;
    }

    /**
     * Phase 41: Scan for high-entropy regions
     */
    async scanForFractures(threshold = 0.6) {
        if (!this.mutationClient) {
            console.warn('MutationClient not connected');
            return [];
        }

        try {
            const result = await this.mutationClient.scanForFaults(threshold);
            return result.fractures || [];
        } catch (err) {
            console.error('Fault scan failed:', err);
            return [];
        }
    }

    /**
     * Phase 41: Run a full repair cycle
     */
    async runRepairCycle(threshold = 0.6) {
        if (!this.mutationClient) {
            console.warn('MutationClient not connected');
            return { success: false, error: 'Not connected' };
        }

        try {
            const result = await this.mutationClient.repairCycle(threshold);
            console.log('🔄 Repair cycle complete:', result);
            return result;
        } catch (err) {
            console.error('Repair cycle failed:', err);
            return { success: false, error: err.message };
        }
    }

    /**
     * Phase 42: Deploy a functional district
     */
    async deployDistrict(districtName = "Syntactic") {
        if (!this.mutationClient) {
            console.warn('MutationClient not connected');
            return { success: false, error: 'Not connected' };
        }

        try {
            const result = await this.mutationClient.colonize(districtName);
            console.log(`🏗️ District Deployed: ${districtName}`, result);
            return result;
        } catch (err) {
            console.error('District deployment failed:', err);
            return { success: false, error: err.message };
        }
    }

    /**
     * Set the mutation client for Phase 41
     */
    setMutationClient(client) {
        this.mutationClient = client;
    }
}

if (typeof module !== 'undefined') {
    module.exports = { LegibleBrainRenderer };
}
