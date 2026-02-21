/**
 * VisualDebugOverlay - Phase 50: Advanced Visual Tools
 *
 * Glass Box AI debugging overlay that renders the AI's internal vision
 * as a live overlay in the visual_shell.
 *
 * Features:
 * - Bounding box visualization (from VisualVerificationService)
 * - Layout diff overlays (showing intent vs actual)
 * - OCR confidence display
 * - Verification metadata HUD
 * - Integration with Journeyman Stage VisualVerificationService
 *
 * @class VisualDebugOverlay
 */

class VisualDebugOverlay {
    constructor(config = {}) {
        this.config = {
            enabled: false,
            showBoundingboxes: true,
            showLayoutDiffs: true,
            showOCRConfidence: true,
            showVerificationHUD: true,
            showSpatialRelations: true,
            hudPosition: 'top-right', // top-left, top-right, bottom-left, bottom-right
            colors: {
                boundingBox: '#00ff00',
                boundingBoxFill: 'rgba(0, 255, 0, 0.1)',
                mismatch: '#ff4444',
                mismatchFill: 'rgba(255, 68, 68, 0.2)',
                success: '#44ff44',
                warning: '#ffaa00',
                critical: '#ff0000',
                spatial: '#00aaff',
                text: '#ffffff',
                hudBackground: 'rgba(0, 0, 0, 0.8)',
                ...config.colors
            },
            ...config
        };

        // State
        this.verificationResults = [];
        this.mirrorValidationResults = [];
        this.currentIntent = null;
        this.elementOverlays = new Map();
        this.lastVerification = null;

        // RISC-V UART state (Neuro-Silicon Bridge)
        this.uartBuffer = [];
        this.uartMaxLines = 50;
        this.lastUartTimestamp = null;

        // Swarm Health state
        this.swarmHealth = null;

        // Task DAG state (Distributed Task Visualization)
        this.taskDag = {
            tasks: {},           // task_id -> {status, assigned_to, transitions, ...}
            activeFlows: [],     // Animated flow lines
            summary: null        // Latest DAG summary
        };

        // District zones for agent relocation
        this.districtZones = {
            cognitive: { name: 'Cognitive', color: '#00aaff', y: 0, height: 0 },
            metabolic: { name: 'Metabolic', color: '#44ff44', y: 0, height: 0 },
            substrate: { name: 'Substrate', color: '#ff8844', y: 0, height: 0 }
        };

        // Agent positions for drag-and-drop
        this.agentPositions = {};
        this.draggedAgent = null;
        this.dropTarget = null;

        // ASCII Scene Graph state
        this.asciiSceneFiles = {};
        this.asciiSceneExpanded = false;
        this.asciiSceneSelectedFile = null;

        // Neural City renderer state
        this.neuralCityRenderer = null;
        this.neuralCityFocus = { x: 0, y: 0 };
        this.neuralCityZoom = 1.0;

        // Mutation HUD state
        this.mutationStats = {
            totalMutations: 0,
            lastMutationTime: null,
            activeUpgrades: [],  // Array of {districtId, fromMaterial, toMaterial, startTime}
            recentMutations: []  // Last 20 mutations for display
        };

        // Tectonic state (Phase 28: Spatial Tectonics)
        this.tectonicState = {
            status: 'idle',          // 'idle' | 'processing' | 'complete' | 'error'
            proposalId: null,
            lastCycle: 0,
            topBond: null,           // {source, dest, strength}
            lastRealignment: null,
            totalMovements: 0,
            recentPulses: [],        // Last 20 pulses for visualization
            pulseCount: 0
        };

        // Shotcut Visual HUD state
        this.shotcutHud = {
            enabled: false,
            frame: null,        // Base64 PNG data
            clusters: [],
            widgets: [],
            layout: { lines: [] },
            diagnostic: null,
            lastUpdate: null,
            aiThought: "Watching Shotcut system..."
        };

        // Memory Ghost state
        this.ghostState = {
            enabled: false,
            ghosts: [],
            lastUpdate: null,
            ghostCount: 0
        };
        this.ghostRenderer = null;

        // Ambient Narrative state (Phase R: V2.0)
        this.narrativeState = {
            enabled: false,
            sessionId: null,
            state: 'IDLE',        // MONITORING, SUGGESTING, STEERING, IDLE
            lastThought: '',
            lastThoughtCategory: '',
            steeringActions: [],
            lastUpdate: null,
            evolutionCount: 0
        };

        // Heat Map state (Visual Hotspot Debugger)
        this.heatmapState = {
            visible: false,
            hotspotCount: 0,
            avgHeat: 0,
            maxHeat: 0,
            lastUpdate: null
        };

        // Canvas layers
        this.hudCanvas = null;
        this.hudCtx = null;
        this.overlayCanvas = null;
        this.overlayCtx = null;

        // Performance tracking
        this.renderTime = 0;
        this.frameCount = 0;

        // Initialize
        this._initCanvases();
        this._bindEvents();
        this._bindKeyboard();
    }

    /**
     * Initialize overlay canvases
     */
    _initCanvases() {
        if (typeof window === 'undefined') return;

        // HUD canvas (fixed position, top layer)
        this.hudCanvas = document.createElement('canvas');
        this.hudCanvas.id = 'visual-debug-hud';
        this.hudCanvas.style.cssText = `
            position: fixed;
            top: 0;
            right: 0;
            width: 320px;
            height: 100%;
            pointer-events: none;
            z-index: 10001;
            display: none;
        `;
        document.body.appendChild(this.hudCanvas);
        this.hudCtx = this.hudCanvas.getContext('2d');

        // Overlay canvas (full screen, for bounding boxes)
        this.overlayCanvas = document.createElement('canvas');
        this.overlayCanvas.id = 'visual-debug-overlay';
        this.overlayCanvas.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 10000;
            display: none;
        `;
        document.body.appendChild(this.overlayCanvas);
        this.overlayCtx = this.overlayCanvas.getContext('2d');

        // Resize handler
        window.addEventListener('resize', () => this._resizeCanvases());
        this._resizeCanvases();
    }

    /**
     * Resize canvases
     */
    _resizeCanvases() {
        if (!this.hudCanvas) return;

        this.hudCanvas.width = 320;
        this.hudCanvas.height = window.innerHeight;
        this.overlayCanvas.width = window.innerWidth;
        this.overlayCanvas.height = window.innerHeight;
    }

    /**
     * Bind keyboard shortcuts
     */
    _bindKeyboard() {
        if (typeof window === 'undefined') return;

        window.addEventListener('keydown', (e) => {
            // Ctrl+Shift+V to toggle visual debug overlay
            if (e.ctrlKey && e.shiftKey && e.key === 'V') {
                e.preventDefault();
                this.toggle();
            }
            // Ctrl+Shift+B to toggle bounding boxes
            if (e.ctrlKey && e.shiftKey && e.key === 'B') {
                e.preventDefault();
                this.config.showBoundingboxes = !this.config.showBoundingboxes;
                console.log(`Bounding boxes: ${this.config.showBoundingboxes ? 'ON' : 'OFF'}`);
            }
            // Ctrl+Shift+H to toggle HUD
            if (e.ctrlKey && e.shiftKey && e.key === 'H') {
                e.preventDefault();
                this.config.showVerificationHUD = !this.config.showVerificationHUD;
                console.log(`Verification HUD: ${this.config.showVerificationHUD ? 'ON' : 'OFF'}`);
            }
            // Ctrl+Shift+S to toggle Shotcut Visual HUD
            if (e.ctrlKey && e.shiftKey && e.key === 'S') {
                e.preventDefault();
                this.shotcutHud.enabled = !this.shotcutHud.enabled;
                console.log(`Shotcut HUD: ${this.shotcutHud.enabled ? 'ON' : 'OFF'}`);
                this._scheduleRender();
            }
            // Ctrl+Shift+G to toggle Memory Ghost overlay
            if (e.ctrlKey && e.shiftKey && e.key === 'G') {
                e.preventDefault();
                this.toggleGhostOverlay();
            }
        });
    }

    /**
     * Toggle Memory Ghost overlay
     */
    toggleGhostOverlay() {
        this.ghostState.enabled = !this.ghostState.enabled;

        if (this.ghostRenderer) {
            this.ghostRenderer.setVisible(this.ghostState.enabled);
        }

        console.log(`👻 Ghost overlay: ${this.ghostState.enabled ? 'ENABLED' : 'DISABLED'}`);
        this._scheduleRender();
    }

    /**
     * Bind events for integration
     */
    _bindEvents() {
        // Listen for verification results from EvolutionDaemon
        window.addEventListener('VISUAL_VERIFICATION_RESULT', (e) => {
            this.handleVerificationResult(e.detail);
        });

        // Listen for mirror validation results (Master Stage)
        window.addEventListener('MIRROR_VALIDATION_RESULT', (e) => {
            this.handleMirrorValidationResult(e.detail);
        });

        // Listen for intent updates
        window.addEventListener('VISUAL_INTENT_UPDATE', (e) => {
            this.handleIntentUpdate(e.detail);
        });

        // Listen for scene updates
        window.addEventListener('VISUAL_SCENE_UPDATE', (e) => {
            this.handleSceneUpdate(e.detail);
        });

        // Listen for RISC-V UART output (Neuro-Silicon Bridge)
        window.addEventListener('RISCV_UART_OUTPUT', (e) => {
            this.handleRiscvUart(e.detail);
        });

        // Listen for RISC-V execution state (Neuro-Silicon Bridge)
        window.addEventListener('RISCV_STATE_UPDATE', (e) => {
            this.handleRiscvState(e.detail);
        });

        // Listen for Swarm Health updates
        window.addEventListener('SWARM_HEALTH_UPDATE', (e) => {
            this.swarmHealth = e.detail;
            this._scheduleRender();
        });

        // Listen for V16 Diagnostic Pulses (Perceptual Bridge)
        window.addEventListener('DIAGNOSTIC_PULSE', (e) => {
            this.handleDiagnosticPulse(e.detail);
        });

        // Listen for Shotcut Visual HUD updates
        window.addEventListener('SHOTCUT_FRAME_UPDATE', (e) => {
            this.handleShotcutFrame(e.detail);
        });

        // Listen for Memory Ghost updates
        window.addEventListener('MEMORY_GHOST_UPDATE', (e) => {
            this.handleGhostUpdate(e.detail);
        });

        // Listen for Narrative events (Phase R: V2.0)
        window.addEventListener('NARRATIVE_EVENT', (e) => {
            this.handleNarrativeEvent(e.detail);
        });

        // Listen for Narrative state changes
        window.addEventListener('NARRATIVE_STATE_CHANGE', (e) => {
            this.handleNarrativeStateChange(e.detail);
        });

        // Listen for Narrative steering actions
        window.addEventListener('NARRATIVE_STEERING', (e) => {
            this.handleNarrativeSteering(e.detail);
        });

        // Listen for Daemon heartbeat for narrative sync
        window.addEventListener('DAEMON_HEARTBEAT', (e) => {
            this.handleDaemonHeartbeat(e.detail);
        });

        // Listen for Task DAG updates from TelemetryBus
        window.addEventListener('TASK_DAG_UPDATE', (e) => {
            this.processTaskDagUpdate(e.detail);
        });

        // Listen for agent relocation events
        window.addEventListener('AGENT_RELOCATED', (e) => {
            this.processAgentRelocation(e.detail);
        });

        // Listen for Neural City focus updates
        window.addEventListener('neural_city_focus', (e) => {
            this.neuralCityFocus = e.detail;
            this._scheduleRender();
        });

        // Listen for ASCII Scene Graph updates
        window.addEventListener('ascii_scene_update', (e) => {
            this.handleAsciiSceneUpdate(e.detail);
        });

        // Listen for ASCII Scene file list
        window.addEventListener('ascii_scene_list', (e) => {
            this.handleAsciiSceneList(e.detail);
        });

        // Listen for Neural City events
        window.addEventListener('NEURAL_CITY_EVENT', (e) => {
            this.handleNeuralCityEvent(e.detail);
        });

        // Listen for Visual Shell events
        window.addEventListener('VISUAL_SHELL_EVENT', (e) => {
            this.handleVisualShellEvent(e.detail);
        });

        // Listen for Evolution events
        window.addEventListener('EVOLUTION_EVENT', (e) => {
            this.handleEvolutionEvent(e.detail);
        });

        // Listen for mutation events from NeuralCityFilter/Evolution Daemon
        window.addEventListener('WEIGHT_MUTATION_BATCH', (e) => {
            this.processMutationBatch(e.detail);
        });

        window.addEventListener('DISTRICT_UPGRADE', (e) => {
            this.processDistrictUpgrade(e.detail);
        });

        // Listen for Tectonic events (Phase 28: Spatial Tectonics)
        window.addEventListener('TECTONIC_PULSE', (e) => {
            this.handleTectonicPulse(e.detail);
        });

        window.addEventListener('TECTONIC_PROPOSAL', (e) => {
            this.handleTectonicProposal(e.detail);
        });

        // Listen for Heat Map events (Visual Hotspot Debugger)
        window.addEventListener('HEATMAP_TOGGLED', (e) => {
            this.handleHeatmapToggle(e.detail);
        });

        window.addEventListener('heat_map_update', (e) => {
            this.handleHeatmapUpdate(e.detail);
        });

        // Drag and drop handlers for canvas
        if (this.hudCanvas) {
            this.hudCanvas.style.pointerEvents = 'auto';
            this.hudCanvas.addEventListener('mousedown', (e) => this._handleDragStart(e));
            this.hudCanvas.addEventListener('mousemove', (e) => this._handleDragMove(e));
            this.hudCanvas.addEventListener('mouseup', (e) => this._handleDragEnd(e));
        }
    }

    /**
     * Handle verification result from VisualVerificationService
     */
    handleVerificationResult(result) {
        this.lastVerification = {
            ...result,
            timestamp: Date.now()
        };

        if (!this.config.enabled) return;

        // Store result for overlay rendering
        this.verificationResults.push(this.lastVerification);

        // Keep only last 100 results
        if (this.verificationResults.length > 100) {
            this.verificationResults.shift();
        }

        // Trigger render
        this._scheduleRender();
    }

    /**
     * Handle mirror validation result from Master Stage shadow brain
     */
    handleMirrorValidationResult(result) {
        this.lastMirrorValidation = {
            ...result,
            timestamp: Date.now()
        };

        if (!this.config.enabled) {
            // Auto-enable if high priority result comes in
            if (result.success === false || result.immortality === false) {
                this.toggle();
            } else {
                return;
            }
        }

        this.mirrorValidationResults.push(this.lastMirrorValidation);
        if (this.mirrorValidationResults.length > 10) {
            this.mirrorValidationResults.shift();
        }

        this._scheduleRender();
    }

    /**
     * Handle intent update from EvolutionDaemon
     */
    handleIntentUpdate(intent) {
        this.currentIntent = intent;

        // Clear previous element overlays
        this.elementOverlays.clear();

        // Create overlay for this intent
        if (intent) {
            this.elementOverlays.set(intent.element_id || 'current', {
                type: intent.element_type,
                position: intent.position,
                size: intent.size,
                text: intent.properties?.text,
                critical: intent.critical,
                spatialRelations: intent.spatial_relations || []
            });
        }

        this._scheduleRender();
    }

    /**
     * Handle RISC-V execution state from Neuro-Silicon Bridge
     */
    handleRiscvState(data) {
        if (!data) return;
        
        this.lastRiscvState = {
            ...data,
            timestamp: Date.now()
        };

        // Map PC to Silicon District coordinate
        // The Silicon District is anchored at (-5120, -5120) tiles relative to Antigravity Prime
        // Each tile is 512x512. 
        // For visualization, we treat a 1024x1024 region as the core logic gate map.
        const pc = data.pc || 0;
        
        // Order 10 Hilbert curve (1024x1024)
        // Divide by 4 because RISC-V instructions are 4 bytes aligned
        const [hx, hy] = (typeof HilbertLUT !== 'undefined') ? 
            HilbertLUT.d2xy(1024, Math.floor(pc / 4) % (1024 * 1024)) : 
            [0, 0];
            
        // Final world position
        const worldX = -5120 + hx;
        const worldY = -5120 + hy;

        // Trigger Silicon Pulse (Green = 1.0)
        const app = window.geometryOSApp;
        if (app && app.neuralCity) {
            app.neuralCity.addPulse(worldX, worldY, Date.now(), 1.0);
        }

        this._scheduleRender();
    }

    /**
     * Handle V16 Diagnostic Pulse from Perceptual Bridge
     */
    handleDiagnosticPulse(data) {
        if (!data) return;
        
        this.lastDiagnostic = {
            ...data,
            timestamp: Date.now()
        };

        // Show notification for critical events
        if (data.severity === 'CRITICAL') {
            this._showNotification(`🚨 SUBSTRATE PANIC: ${data.message}`, '#ff0000');
            
            // Auto-enable overlay to show the panic
            if (!this.config.enabled) {
                this.toggle();
            }
        }

        this._scheduleRender();
    }

    /**
     * Handle Shotcut Visual HUD update
     */
    handleShotcutFrame(data) {
        if (!data) return;

        this.shotcutHud.frame = data.frame;
        this.shotcutHud.clusters = data.clusters || [];
        this.shotcutHud.widgets = data.widgets || [];
        this.shotcutHud.layout = data.layout || { lines: [] };
        this.shotcutHud.diagnostic = data.diagnostic;
        this.shotcutHud.lastUpdate = Date.now();
        this.shotcutHud.aiThought = data.ai_thought || "Analyzing Shotcut interface...";

        // Handle ghosts if present in frame data
        if (data.ghosts) {
            this.handleGhostUpdate(data.ghosts);
        }

        // Auto-enable Shotcut HUD if frames start arriving
        if (!this.shotcutHud.enabled && this.config.enabled) {
            this.shotcutHud.enabled = true;
        }

        this._scheduleRender();
    }

    /**
     * Handle Memory Ghost update
     */
    handleGhostUpdate(data) {
        if (!data) return;

        // Handle array of ghosts
        const ghosts = Array.isArray(data) ? data : (data.ghosts || [data]);
        this.ghostState.ghosts = ghosts;
        this.ghostState.lastUpdate = Date.now();
        this.ghostState.ghostCount = ghosts.length;

        // Update ghost renderer if initialized
        if (this.ghostRenderer) {
            this.ghostRenderer.updateGhosts(ghosts);
        }

        // Request redraw
        this._scheduleRender();
    }

    /**
     * Handle scene update from mirror neuron
     */
    handleSceneUpdate(scene) {
        this.currentScene = scene;
        this._scheduleRender();
    }

    /**
     * Handle RISC-V UART output from Neuro-Silicon Bridge
     */
    handleRiscvUart(data) {
        const text = data.text || '';
        const timestamp = data.timestamp || Date.now();

        // Split text into lines and add to buffer
        const lines = text.split('\n');
        for (const line of lines) {
            if (line.trim()) {
                this.uartBuffer.push({
                    text: line,
                    timestamp: timestamp,
                    vm_id: data.vm_id || 'default'
                });
            }
        }

        // Keep buffer limited
        while (this.uartBuffer.length > this.uartMaxLines) {
            this.uartBuffer.shift();
        }

        this.lastUartTimestamp = timestamp;

        // Auto-enable HUD if UART output comes in
        if (!this.config.enabled) {
            this.toggle();
        }

        this._scheduleRender();
    }

    /**
     * Handle ASCII Scene Graph file update
     */
    handleAsciiSceneUpdate(data) {
        if (!data || !data.filename) return;

        this.asciiSceneFiles[data.filename] = {
            content: data.content || '',
            timestamp: data.timestamp || Date.now()
        };

        // Auto-select first file if none selected
        if (!this.asciiSceneSelectedFile) {
            this.asciiSceneSelectedFile = data.filename;
        }

        this._scheduleRender();
    }

    /**
     * Handle ASCII Scene file list
     */
    handleAsciiSceneList(data) {
        if (!data || !data.files) return;

        // Initialize files that don't exist
        for (const filename of data.files) {
            if (!this.asciiSceneFiles[filename]) {
                this.asciiSceneFiles[filename] = {
                    content: '',
                    timestamp: Date.now()
                };
            }
        }

        // Select first file if none selected
        if (!this.asciiSceneSelectedFile && data.files.length > 0) {
            this.asciiSceneSelectedFile = data.files[0];
        }

        this._scheduleRender();
    }

    /**
     * Handle Neural City event
     */
    handleNeuralCityEvent(data) {
        // Could add specific handling here
        this._scheduleRender();
    }

    /**
     * Handle Visual Shell event
     */
    handleVisualShellEvent(data) {
        // Could add specific handling here
        this._scheduleRender();
    }

    /**
     * Handle Evolution event
     */
    handleEvolutionEvent(data) {
        // Could add specific handling here
        this._scheduleRender();
    }

    /**
     * Handle tectonic pulse event (Phase 28: Spatial Tectonics)
     * @param {Object} data - Pulse data {source, dest, pulse_type, volume}
     */
    handleTectonicPulse(data) {
        if (!data) return;

        // Add to recent pulses (keep last 20)
        this.tectonicState.recentPulses.unshift({
            source: data.source,
            dest: data.dest,
            pulseType: data.pulse_type || 'violet',
            volume: data.volume || 1.0,
            timestamp: Date.now()
        });

        if (this.tectonicState.recentPulses.length > 20) {
            this.tectonicState.recentPulses.pop();
        }

        this.tectonicState.pulseCount++;
        this._scheduleRender();
    }

    /**
     * Handle tectonic proposal event (Phase 28: Spatial Tectonics)
     * @param {Object} data - Proposal data {proposal_id, bonds, status}
     */
    handleTectonicProposal(data) {
        if (!data) return;

        const status = data.status || {};

        this.tectonicState.status = status.state || 'processing';
        this.tectonicState.proposalId = data.proposal_id;
        this.tectonicState.lastCycle = status.last_cycle || this.tectonicState.lastCycle;
        this.tectonicState.totalMovements = status.total_movements || this.tectonicState.totalMovements;
        this.tectonicState.lastRealignment = Date.now();

        // Extract top bond from status or bonds array
        if (status.top_bond && Array.isArray(status.top_bond)) {
            this.tectonicState.topBond = {
                source: status.top_bond[0],
                dest: status.top_bond[1],
                strength: status.top_bond[2]
            };
        } else if (data.bonds && data.bonds.length > 0) {
            const top = data.bonds.reduce((a, b) =>
                (a.strength || 0) > (b.strength || 0) ? a : b
            );
            this.tectonicState.topBond = {
                source: top.source,
                dest: top.dest,
                strength: top.strength
            };
        }

        this._scheduleRender();
    }

    /**
     * Process mutation batch event from NeuralCityFilter
     * @param {Object} data - Mutation batch data
     * @param {Array} data.mutations - Array of {x, y, weight, oldValue, newValue}
     * @param {number} data.timestamp - Batch timestamp
     */
    processMutationBatch(data) {
        if (!data || !data.mutations) return;

        const mutations = data.mutations;
        const count = mutations.length;

        // Update total mutation count
        this.mutationStats.totalMutations += count;
        this.mutationStats.lastMutationTime = data.timestamp || Date.now();

        // Store recent mutations (keep last 20)
        for (const m of mutations) {
            this.mutationStats.recentMutations.push({
                x: m.x,
                y: m.y,
                weight: m.weight,
                oldWeight: m.oldWeight,
                newWeight: m.newWeight,
                timestamp: this.mutationStats.lastMutationTime
            });
        }
        if (this.mutationStats.recentMutations.length > 20) {
            this.mutationStats.recentMutations = this.mutationStats.recentMutations.slice(-20);
        }

        // Trigger pulse animations on NeuralCityFilter for each mutation
        const app = window.geometryOSApp;
        if (app && app.neuralCity && app.neuralCity.neuralCityFilter) {
            for (const m of mutations) {
                app.neuralCity.neuralCityFilter.triggerMutation(m.x, m.y);
            }
        }

        // Show notification for large batches
        if (count >= 10) {
            this._showNotification(`🧬 ${count} mutations applied`, '#ff00ff');
        }

        this._scheduleRender();
    }

    /**
     * Process district upgrade event
     * @param {Object} data - Upgrade data
     * @param {string} data.districtId - District identifier
     * @param {string} data.fromMaterial - Original material
     * @param {string} data.toMaterial - Target material
     * @param {number} data.timestamp - Upgrade start time
     * @param {boolean} data.complete - Whether upgrade is complete
     */
    processDistrictUpgrade(data) {
        if (!data || !data.districtId) return;

        const upgrade = {
            districtId: data.districtId,
            fromMaterial: data.fromMaterial || 'unknown',
            toMaterial: data.toMaterial || 'unknown',
            startTime: data.timestamp || Date.now(),
            complete: data.complete || false
        };

        if (upgrade.complete) {
            // Remove from active upgrades
            this.mutationStats.activeUpgrades = this.mutationStats.activeUpgrades.filter(
                u => u.districtId !== upgrade.districtId
            );
            this._showNotification(
                `✨ District ${upgrade.districtId} upgraded to ${upgrade.toMaterial}`,
                '#FFD700'
            );
        } else {
            // Add to active upgrades (avoid duplicates)
            const existingIdx = this.mutationStats.activeUpgrades.findIndex(
                u => u.districtId === upgrade.districtId
            );
            if (existingIdx >= 0) {
                this.mutationStats.activeUpgrades[existingIdx] = upgrade;
            } else {
                this.mutationStats.activeUpgrades.push(upgrade);

                // Trigger district upgrade animation on NeuralCityFilter
                const app = window.geometryOSApp;
                if (app && app.neuralCity && app.neuralCity.neuralCityFilter) {
                    app.neuralCity.neuralCityFilter.startDistrictUpgrade(
                        upgrade.districtId,
                        upgrade.fromMaterial,
                        upgrade.toMaterial
                    );
                }
            }
        }

        this._scheduleRender();
    }

    /**
     * Handle Narrative events from the Ambient Narrative System.
     * @param {Object} data - Event data with event_type and payload
     */
    handleNarrativeEvent(data) {
        if (!data) return;

        this.narrativeState.enabled = true;
        this.narrativeState.lastUpdate = Date.now();

        switch (data.event_type) {
            case 'thought':
                this.narrativeState.lastThought = data.data?.thought || '';
                this.narrativeState.lastThoughtCategory = data.data?.category || 'observation';
                if (data.data?.state) {
                    this.narrativeState.state = data.data.state;
                }
                break;

            case 'steering':
                this.narrativeState.state = 'STEERING';
                const action = {
                    action: data.data?.action || 'unknown',
                    target: data.data?.target || null,
                    timestamp: Date.now()
                };
                this.narrativeState.steeringActions.unshift(action);
                // Keep only last 10 actions
                if (this.narrativeState.steeringActions.length > 10) {
                    this.narrativeState.steeringActions.pop();
                }
                break;

            case 'state_change':
                this.narrativeState.state = data.new_state || 'IDLE';
                break;
        }

        this._scheduleRender();
    }

    /**
     * Handle narrative state changes.
     * @param {Object} data - { oldState, newState, rationale }
     */
    handleNarrativeStateChange(data) {
        if (!data) return;

        this.narrativeState.enabled = true;
        this.narrativeState.state = data.newState || 'IDLE';
        this.narrativeState.lastUpdate = Date.now();

        console.log(`📖 HUD: State change ${data.oldState} → ${data.newState}`);
        if (data.rationale) {
            this.narrativeState.lastThought = `[State] ${data.rationale}`;
        }

        this._scheduleRender();
    }

    /**
     * Handle narrative steering actions.
     * @param {Object} data - { action, target, details }
     */
    handleNarrativeSteering(data) {
        if (!data) return;

        this.narrativeState.enabled = true;
        this.narrativeState.state = 'STEERING';
        this.narrativeState.lastUpdate = Date.now();

        const action = {
            action: data.action || 'unknown',
            target: data.target || null,
            details: data.details || null,
            timestamp: Date.now()
        };
        this.narrativeState.steeringActions.unshift(action);

        if (this.narrativeState.steeringActions.length > 10) {
            this.narrativeState.steeringActions.pop();
        }

        this._scheduleRender();
    }

    /**
     * Handle daemon heartbeat for narrative sync.
     * @param {Object} data - { state, evolution_count, visual_connected }
     */
    handleDaemonHeartbeat(data) {
        if (!data) return;

        this.narrativeState.enabled = true;
        this.narrativeState.evolutionCount = data.evolution_count || 0;
        this.narrativeState.lastUpdate = Date.now();

        if (data.state) {
            this.narrativeState.state = data.state;
        }

        this._scheduleRender();
    }

    /**
     * Schedule render on next animation frame
     */
    _scheduleRender() {
        if (this._renderScheduled) return;
        this._renderScheduled = true;

        requestAnimationFrame(() => {
            this._renderScheduled = false;
            this.render();
        });
    }

    // ========================================
    // Module Registration System (V16)
    // ========================================

    /** @type {Map<string, Function>} Registered HUD module classes */
    static registeredModules = new Map();

    /** @type {Map<string, Object>} Instantiated module instances */
    modules = new Map();

    /**
     * Register a HUD module class.
     * Modules are instantiated when the overlay is enabled.
     * @param {string} name - Module name
     * @param {Function} ModuleClass - Module class constructor
     */
    static registerModule(name, ModuleClass) {
        VisualDebugOverlay.registeredModules.set(name, ModuleClass);
        console.log(`📦 HUD Module registered: ${name}`);

        // If there's an existing global instance, instantiate immediately
        if (window.visualDebugOverlay && window.visualDebugOverlay.config.enabled) {
            window.visualDebugOverlay._instantiateModule(name, ModuleClass);
        }
    }

    /**
     * Instantiate a registered module.
     * @param {string} name - Module name
     * @param {Function} ModuleClass - Module class constructor
     */
    _instantiateModule(name, ModuleClass) {
        if (this.modules.has(name)) return; // Already instantiated

        try {
            const instance = new ModuleClass(this.hudCanvas?.parentElement || document.body);
            this.modules.set(name, instance);
            console.log(`✅ HUD Module instantiated: ${name}`);
        } catch (e) {
            console.error(`Failed to instantiate HUD module ${name}:`, e);
        }
    }

    /**
     * Initialize all registered modules.
     */
    _initModules() {
        for (const [name, ModuleClass] of VisualDebugOverlay.registeredModules) {
            this._instantiateModule(name, ModuleClass);
        }
    }

    /**
     * Destroy all module instances.
     */
    _destroyModules() {
        for (const [name, instance] of this.modules) {
            if (instance && typeof instance.destroy === 'function') {
                instance.destroy();
            }
        }
        this.modules.clear();
    }

    /**
     * Toggle overlay
     */
    toggle() {
        this.config.enabled = !this.config.enabled;

        if (this.hudCanvas) {
            this.hudCanvas.style.display = this.config.enabled ? 'block' : 'none';
        }
        if (this.overlayCanvas) {
            this.overlayCanvas.style.display = this.config.enabled ? 'block' : 'none';
        }

        // Initialize modules when enabling
        if (this.config.enabled) {
            this._initModules();
        }

        console.log(`Visual Debug Overlay ${this.config.enabled ? 'ENABLED' : 'DISABLED'}`);
        console.log('Shortcuts: Ctrl+Shift+V (toggle), Ctrl+Shift+B (boxes), Ctrl+Shift+H (HUD)');

        return this.config.enabled;
    }

    /**
     * Main render function
     */
    render() {
        if (!this.config.enabled) return;

        const startTime = performance.now();

        // Clear canvases
        this._clearCanvases();

        // Render overlays
        if (this.config.showBoundingboxes || this.config.showSpatialRelations) {
            this._renderElementOverlays();
        }

        // Render HUD
        if (this.config.showVerificationHUD) {
            this._renderHUD();
        }

        // Track performance
        this.renderTime = performance.now() - startTime;
        this.frameCount++;
    }

    /**
     * Clear canvases
     */
    _clearCanvases() {
        if (this.overlayCtx) {
            this.overlayCtx.clearRect(0, 0, this.overlayCanvas.width, this.overlayCanvas.height);
        }
        if (this.hudCtx) {
            this.hudCtx.clearRect(0, 0, this.hudCanvas.width, this.hudCanvas.height);
        }
    }

    /**
     * Render element overlays (bounding boxes, spatial relations)
     */
    _renderElementOverlays() {
        const ctx = this.overlayCtx;
        if (!ctx) return;

        // Render each element overlay
        for (const [id, overlay] of this.elementOverlays) {
            const { position, size, type, critical, spatialRelations } = overlay;

            if (!position || !size) continue;

            const [x, y] = position;
            const [width, height] = size;

            // Determine color based on verification status
            let boxColor = this.config.colors.boundingBox;
            let fillColor = this.config.colors.boundingBoxFill;

            if (this.lastVerification && !this.lastVerification.success) {
                boxColor = this.config.colors.mismatch;
                fillColor = this.config.colors.mismatchFill;
            } else if (this.lastVerification && this.lastVerification.success) {
                boxColor = this.config.colors.success;
                fillColor = 'rgba(68, 255, 68, 0.1)';
            }

            // Draw bounding box
            if (this.config.showBoundingboxes) {
                ctx.strokeStyle = boxColor;
                ctx.lineWidth = critical ? 3 : 2;
                ctx.setLineDash(critical ? [] : [5, 5]);
                ctx.strokeRect(x, y, width, height);

                // Fill
                ctx.fillStyle = fillColor;
                ctx.fillRect(x, y, width, height);

                // Label
                ctx.fillStyle = this.config.colors.text;
                ctx.font = '12px monospace';
                ctx.fillText(`${type}${critical ? ' [CRITICAL]' : ''}`, x, y - 5);

                // Confidence if available
                if (this.lastVerification) {
                    const conf = this.lastVerification.overall_confidence;
                    if (conf !== undefined) {
                        ctx.fillStyle = conf >= 0.8 ? this.config.colors.success :
                                       conf >= 0.6 ? this.config.colors.warning :
                                       this.config.colors.critical;
                        ctx.fillText(`${(conf * 100).toFixed(0)}%`, x + width - 30, y - 5);
                    }
                }
            }

            // Draw spatial relations
            if (this.config.showSpatialRelations && spatialRelations) {
                this._renderSpatialRelations(ctx, overlay);
            }
        }

        ctx.setLineDash([]);
    }

    /**
     * Render spatial relation lines
     */
    _renderSpatialRelations(ctx, overlay) {
        if (!this.currentScene?.children) return;

        const { position, size, spatialRelations } = overlay;
        const [sx, sy] = position;
        const [sw, sh] = size;
        const subjectCenter = { x: sx + sw / 2, y: sy + sh / 2 };

        for (const relation of spatialRelations) {
            // Find target element in scene
            const target = this._findElementInScene(relation.target_element);

            if (target) {
                const targetCenter = {
                    x: target.x + (target.width || 0) / 2,
                    y: target.y + (target.height || 0) / 2
                };

                // Draw relation line
                ctx.strokeStyle = this.config.colors.spatial;
                ctx.lineWidth = 1;
                ctx.setLineDash([3, 3]);

                ctx.beginPath();
                ctx.moveTo(subjectCenter.x, subjectCenter.y);
                ctx.lineTo(targetCenter.x, targetCenter.y);
                ctx.stroke();

                // Draw relation label at midpoint
                const midX = (subjectCenter.x + targetCenter.x) / 2;
                const midY = (subjectCenter.y + targetCenter.y) / 2;

                ctx.fillStyle = this.config.colors.spatial;
                ctx.font = '10px monospace';
                ctx.fillText(relation.relation_type, midX, midY);
            }
        }

        ctx.setLineDash([]);
    }

    /**
     * Find element in scene by type
     */
    _findElementInScene(targetType) {
        if (!this.currentScene?.children) return null;

        const targetLower = targetType.toLowerCase();
        return this.currentScene.children.find(child => {
            const childType = (child.type || '').toLowerCase();
            return childType.includes(targetLower) || targetLower.includes(childType);
        });
    }

    /**
     * Render HUD (Heads-Up Display)
     */
    _renderHUD() {
        const ctx = this.hudCtx;
        if (!ctx) return;

        const width = this.hudCanvas.width;
        const padding = 10;
        let y = padding;

        // Background
        ctx.fillStyle = this.config.colors.hudBackground;
        ctx.fillRect(0, 0, width, this.hudCanvas.height);

        // Title
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 14px monospace';
        ctx.fillText('🔍 VISUAL DEBUG OVERLAY', padding, y + 14);
        y += 30;

        // Divider
        ctx.strokeStyle = '#333';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Current Intent
        ctx.fillStyle = this.config.colors.text;
        ctx.font = '12px monospace';
        ctx.fillText('INTENT:', padding, y);
        y += 18;

        if (this.currentIntent) {
            ctx.fillStyle = '#888';
            ctx.fillText(`  Type: ${this.currentIntent.element_type}`, padding, y);
            y += 16;
            ctx.fillText(`  Pos: (${this.currentIntent.position?.[0]}, ${this.currentIntent.position?.[1]})`, padding, y);
            y += 16;
            ctx.fillText(`  Size: ${this.currentIntent.size?.[0]}x${this.currentIntent.size?.[1]}`, padding, y);
            y += 16;
            if (this.currentIntent.critical) {
                ctx.fillStyle = this.config.colors.critical;
                ctx.fillText('  ⚠ CRITICAL', padding, y);
                y += 16;
            }
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  No active intent', padding, y);
            y += 16;
        }

        y += 10;

        // Verification Status
        ctx.fillStyle = this.config.colors.text;
        ctx.font = '12px monospace';
        ctx.fillText('VERIFICATION:', padding, y);
        y += 18;

        if (this.lastVerification) {
            const age = (Date.now() - this.lastVerification.timestamp) / 1000;

            // Success indicator
            if (this.lastVerification.success) {
                ctx.fillStyle = this.config.colors.success;
                ctx.fillText('  ✓ PASSED', padding, y);
            } else {
                ctx.fillStyle = this.config.colors.mismatch;
                ctx.fillText('  ✗ FAILED', padding, y);
            }
            y += 16;

            // Confidence
            const conf = this.lastVerification.overall_confidence;
            ctx.fillStyle = conf >= 0.8 ? this.config.colors.success :
                           conf >= 0.6 ? this.config.colors.warning :
                           this.config.colors.critical;
            ctx.fillText(`  Confidence: ${(conf * 100).toFixed(1)}%`, padding, y);
            y += 16;

            // Retry status
            ctx.fillStyle = '#888';
            if (this.lastVerification.should_retry) {
                ctx.fillStyle = this.config.colors.warning;
                ctx.fillText(`  ↻ Retry suggested (${this.lastVerification.retry_suggestions?.length || 0} hints)`, padding, y);
            } else {
                ctx.fillText('  No retry needed', padding, y);
            }
            y += 16;

            // Escalation
            if (this.lastVerification.should_escalate) {
                ctx.fillStyle = this.config.colors.critical;
                ctx.fillText('  🚨 HUMAN REVIEW REQUIRED', padding, y);
                y += 16;
            }

            // Age
            ctx.fillStyle = '#666';
            ctx.fillText(`  Age: ${age.toFixed(1)}s ago`, padding, y);
            y += 16;

            // Summary
            if (this.lastVerification.summary) {
                ctx.fillStyle = '#888';
                const lines = this._wrapText(this.lastVerification.summary, width - padding * 2 - 10);
                for (const line of lines) {
                    ctx.fillText(`  ${line}`, padding, y);
                    y += 14;
                }
            }
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  No verification data', padding, y);
            y += 16;
        }

        y += 10;

        // Retry suggestions
        if (this.lastVerification?.retry_suggestions?.length > 0) {
            ctx.fillStyle = this.config.colors.text;
            ctx.font = '12px monospace';
            ctx.fillText('SUGGESTIONS:', padding, y);
            y += 18;

            ctx.fillStyle = this.config.colors.warning;
            for (const suggestion of this.lastVerification.retry_suggestions.slice(0, 3)) {
                const lines = this._wrapText(suggestion, width - padding * 2 - 10);
                for (const line of lines) {
                    ctx.fillText(`  • ${line}`, padding, y);
                    y += 14;
                }
                y += 4;
            }
        }

        // Performance stats at bottom
        ctx.fillStyle = '#444';
        ctx.font = '10px monospace';
        ctx.fillText(`Render: ${this.renderTime.toFixed(2)}ms | Frames: ${this.frameCount}`, padding, this.hudCanvas.height - 10);

        // Mirror Neuron Status (Master Stage)
        if (this.lastMirrorValidation) {
            this._renderMirrorHUD(ctx, width, padding);
        }

        // Silicon Terminal (RISC-V UART)
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            this._renderSiliconTerminal(ctx, width, padding);
        }

        // Swarm Health section
        if (this.swarmHealth) {
            this._renderSwarmHealth(ctx, width, padding);
        }

        // Task Graph section
        if (Object.keys(this.taskDag.tasks).length > 0 || this.taskDag.activeFlows.length > 0) {
            this._renderTaskGraphSection(ctx, width, padding);
        }

        // Neural City HUD
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) {
            this._renderNeuralCityHUD(ctx, width, padding);
        }

        // ASCII Scene Graph HUD
        if (Object.keys(this.asciiSceneFiles).length > 0) {
            this._renderAsciiSceneSection(ctx, width, padding);
        }

        // Mutation HUD (always show if there's activity)
        if (this.mutationStats.totalMutations > 0 || this.mutationStats.activeUpgrades.length > 0) {
            this._renderMutationHUD(ctx, width, padding);
        }

        // Tectonic Activity HUD (Phase 28: Spatial Tectonics)
        if (this.tectonicState.pulseCount > 0 || this.tectonicState.totalMovements > 0) {
            this._renderTectonicSection(ctx, width, padding);
        }

        // Shotcut Visual HUD (Phase 50)
        if (this.shotcutHud.enabled) {
            this._renderShotcutHUD(ctx, width, padding);
        }

        // Heat Map HUD (Visual Hotspot Debugger)
        if (window.geometryOSApp && window.geometryOSApp.heatmapOverlay) {
            this._renderHeatmapSection(ctx, width, padding);
        }
    }

    /**
     * Render Mirror Neuron specific HUD section
     */
    _renderMirrorHUD(ctx, width, padding) {
        let y = this.hudCanvas.height - 180;
        
        // Background for section
        ctx.fillStyle = 'rgba(0, 40, 60, 0.9)';
        ctx.fillRect(0, y, width, 160);
        
        y += 20;
        ctx.fillStyle = '#00d4ff';
        ctx.font = 'bold 12px monospace';
        ctx.fillText('🪞 MIRROR NEURON (V14)', padding, y);
        y += 20;
        
        const res = this.lastMirrorValidation;
        
        // Task ID
        ctx.fillStyle = '#aaa';
        ctx.font = '10px monospace';
        ctx.fillText(`Task: ${res.task_id?.substring(0, 20)}...`, padding, y);
        y += 15;
        
        // Success / Failure
        if (res.success) {
            ctx.fillStyle = this.config.colors.success;
            ctx.fillText('✓ VALIDATION PASSED', padding, y);
        } else {
            ctx.fillStyle = this.config.colors.mismatch;
            ctx.fillText('✗ VALIDATION FAILED', padding, y);
        }
        y += 15;
        
        // Accuracy
        ctx.fillStyle = '#fff';
        const acc = (res.accuracy * 100).toFixed(1);
        ctx.fillText(`Accuracy: ${acc}%`, padding, y);
        
        // Progress bar for accuracy
        ctx.fillStyle = '#333';
        ctx.fillRect(padding + 100, y - 8, 150, 10);
        ctx.fillStyle = res.accuracy >= 0.8 ? this.config.colors.success : this.config.colors.warning;
        ctx.fillRect(padding + 100, y - 8, 150 * res.accuracy, 10);
        y += 20;
        
        // Immortality
        if (res.immortality) {
            ctx.fillStyle = this.config.colors.success;
            ctx.fillText('🛡️ IMMORTALITY: SECURE', padding, y);
        } else {
            ctx.fillStyle = this.config.colors.critical;
            ctx.fillText('💀 IMMORTALITY: BREACHED', padding, y);
        }
        y += 20;
        
        // Issues
        if (res.issues && res.issues.length > 0) {
            ctx.fillStyle = '#ffaa00';
            ctx.fillText(`Issues: ${res.issues[0].substring(0, 40)}`, padding, y);
        }
    }

    /**
     * Render Silicon Terminal HUD section for RISC-V UART output
     */
    _renderSiliconTerminal(ctx, width, padding) {
        if (!this.uartBuffer || this.uartBuffer.length === 0) return;

        // Position on left side of screen
        const termHeight = 200;
        let y = this.hudCanvas.height - termHeight - 10;

        // Background for terminal
        ctx.fillStyle = 'rgba(0, 20, 40, 0.95)';
        ctx.fillRect(10, y, width - 20, termHeight);

        // Border
        ctx.strokeStyle = '#00ff88';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, termHeight);

        y += 18;
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🦾 SILICON TERMINAL (RISC-V UART)', padding, y);
        y += 5;

        // Divider line
        ctx.strokeStyle = '#00ff8844';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();

        y += 15;

        // Render last N lines of UART output
        const visibleLines = Math.min(this.uartBuffer.length, 10);
        const startIdx = Math.max(0, this.uartBuffer.length - visibleLines);

        ctx.font = '10px monospace';
        for (let i = startIdx; i < this.uartBuffer.length; i++) {
            const line = this.uartBuffer[i];

            // Color based on content
            if (line.text.includes('ERROR') || line.text.includes('FAIL')) {
                ctx.fillStyle = '#ff4444';
            } else if (line.text.includes('WARN')) {
                ctx.fillStyle = '#ffaa00';
            } else if (line.text.includes('OK') || line.text.includes('SUCCESS')) {
                ctx.fillStyle = '#44ff44';
            } else {
                ctx.fillStyle = '#00ff88';
            }

            // Truncate line to fit
            const maxChars = Math.floor((width - padding * 2 - 20) / 6);
            const displayText = line.text.length > maxChars
                ? line.text.substring(0, maxChars - 3) + '...'
                : line.text;

            ctx.fillText(displayText, padding, y);
            y += 12;
        }

        // Status line at bottom
        y = this.hudCanvas.height - 15;
        ctx.fillStyle = '#666';
        ctx.font = '9px monospace';
        const lineCount = this.uartBuffer.length;
        const lastTime = this.lastUartTimestamp
            ? new Date(this.lastUartTimestamp).toLocaleTimeString()
            : 'N/A';
        ctx.fillText(`Lines: ${lineCount} | Last: ${lastTime}`, padding, y);
    }

    /**
     * Render Swarm Health section
     */
    _renderSwarmHealth(ctx, width, padding) {
        if (!this.swarmHealth || !this.swarmHealth.agents) return;

        const agents = this.swarmHealth.agents;
        const agentIds = Object.keys(agents);
        if (agentIds.length === 0) return;

        // Position - place on left side, above Silicon Terminal if present
        const sectionHeight = 40 + (agentIds.length * 15);
        let startY = this.hudCanvas.height - sectionHeight - 10;
        
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            startY -= 210; // Shift up to avoid Silicon Terminal
        }

        let y = startY;

        // Background
        ctx.fillStyle = 'rgba(20, 0, 40, 0.95)';
        ctx.fillRect(10, y, width - 20, sectionHeight);

        // Border
        ctx.strokeStyle = '#aa00ff';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, sectionHeight);

        y += 18;
        ctx.fillStyle = '#aa00ff';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🐝 SWARM HEALTH MONITOR', padding, y);
        y += 5;

        // Divider
        ctx.strokeStyle = '#aa00ff44';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Render each agent
        ctx.font = '10px monospace';
        for (const aid of agentIds) {
            const h = agents[aid];
            
            // Status icon and color
            let statusChar = '●';
            if (h.status === 'healthy') ctx.fillStyle = '#44ff44';
            else if (h.status === 'stale') ctx.fillStyle = '#ffaa00';
            else if (h.status === 'offline') ctx.fillStyle = '#ff4444';
            else ctx.fillStyle = '#888';

            ctx.fillText(statusChar, padding, y);
            
            ctx.fillStyle = '#fff';
            const name = aid.length > 15 ? aid.substring(0, 12) + '...' : aid;
            ctx.fillText(`${name} [${h.type}]`, padding + 15, y);
            
            // Task count
            ctx.fillStyle = '#888';
            ctx.fillText(`C:${h.tasks_completed} F:${h.tasks_failed}`, width - padding - 60, y);
            
            y += 15;
        }
    }

    /**
     * Render Shotcut Visual HUD section
     */
    _renderShotcutHUD(ctx, width, padding) {
        const hudHeight = 300;
        let y = this.hudCanvas.height - hudHeight - 20;
        
        // Background
        ctx.fillStyle = 'rgba(0, 20, 30, 0.95)';
        ctx.fillRect(10, y, width - 20, hudHeight);
        
        // Border
        ctx.strokeStyle = '#00ffcc';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, hudHeight);
        
        y += 20;
        ctx.fillStyle = '#00ffcc';
        ctx.font = 'bold 12px monospace';
        ctx.fillText('🎬 SHOTCUT VISUAL HUD', padding + 10, y);
        y += 20;
        
        // AI Thought
        ctx.fillStyle = '#fff';
        ctx.font = 'italic 10px monospace';
        ctx.fillText(`THOUGHT: ${this.shotcutHud.aiThought}`, padding + 10, y);
        y += 25;
        
        // Panels/Clusters
        ctx.fillStyle = '#aaa';
        ctx.font = 'bold 10px monospace';
        ctx.fillText('DETECTED PANELS:', padding + 10, y);
        y += 15;
        
        const clusterColors = {
            'timeline_panel': '#00ff88',
            'menu_bar': '#ff8800',
            'playback_controls': '#8800ff',
            'filters_panel': '#ff0088',
            'media_panel': '#00ffff',
            'properties_panel': '#ffff00'
        };
        
        if (this.shotcutHud.clusters.length === 0) {
            ctx.fillStyle = '#666';
            ctx.fillText('  No panels detected', padding + 10, y);
            y += 15;
        } else {
            this.shotcutHud.clusters.forEach(c => {
                const color = clusterColors[c.label] || '#ffffff';
                ctx.fillStyle = color;
                ctx.fillText(`■ ${c.label} (${c.element_count} elements)`, padding + 15, y);
                y += 15;
            });
        }
        
        y += 10;
        
        // Widgets
        ctx.fillStyle = '#aaa';
        ctx.font = 'bold 10px monospace';
        ctx.fillText('CLICKABLE TARGETS:', padding + 10, y);
        y += 15;
        
        const widgets = this.shotcutHud.widgets.filter(w => w.action).slice(0, 8);
        if (widgets.length === 0) {
            ctx.fillStyle = '#666';
            ctx.fillText('  No targets found', padding + 10, y);
            y += 15;
        } else {
            widgets.forEach(w => {
                ctx.fillStyle = '#00ffcc';
                ctx.fillText(`• ${w.text} → ${w.action}`, padding + 15, y);
                y += 12;
            });
        }

        // Memory Ghosts
        if (this.ghostState.ghostCount > 0) {
            y += 10;
            ctx.fillStyle = '#aaa';
            ctx.font = 'bold 10px monospace';
            ctx.fillText('MEMORY GHOSTS:', padding + 10, y);
            y += 15;

            const ghosts = this.ghostState.ghosts;
            const highConf = ghosts.filter(g => g.confidence === 'HIGH').length;
            const medConf = ghosts.filter(g => g.confidence === 'MEDIUM').length;

            ctx.fillStyle = '#00FF00';
            ctx.fillText(`HIGH: ${highConf}`, padding + 15, y);
            ctx.fillStyle = '#FFFF00';
            ctx.fillText(`MED: ${medConf}`, padding + 80, y);
            ctx.fillStyle = '#fff';
            ctx.fillText(`Total: ${ghosts.length}`, padding + 145, y);
        }

        // Diagnostic
        y = this.hudCanvas.height - 40;
        if (this.shotcutHud.diagnostic) {
            const diag = this.shotcutHud.diagnostic;
            ctx.fillStyle = diag.severity === 'SUCCESS' ? '#00ff00' : '#ff0000';
            ctx.font = 'bold 9px monospace';
            ctx.fillText(`STATUS: ${diag.severity} - ${diag.message}`, padding + 10, y);
        }
        
        // Call overlay render (draw boxes on main canvas)
        this._renderShotcutOverlay();
    }

    /**
     * Render Shotcut bounding boxes on the overlay canvas
     */
    _renderShotcutOverlay() {
        if (!this.overlayCtx || !this.shotcutHud.enabled) return;
        
        const ctx = this.overlayCtx;
        const scaleX = window.innerWidth / 800; // Assuming 800x600 source
        const scaleY = window.innerHeight / 600;
        
        const clusterColors = {
            'timeline_panel': 'rgba(0, 255, 136, 0.3)',
            'menu_bar': 'rgba(255, 136, 0, 0.3)',
            'media_panel': 'rgba(0, 255, 255, 0.3)'
        };
        
        // 1. Draw Clusters
        this.shotcutHud.clusters.forEach(c => {
            const [x1, y1, x2, y2] = c.bounds;
            const color = clusterColors[c.label] || 'rgba(255, 255, 255, 0.1)';
            
            ctx.strokeStyle = color.replace('0.3', '1.0');
            ctx.fillStyle = color;
            ctx.lineWidth = 2;
            
            const rx = x1 * scaleX;
            const ry = y1 * scaleY;
            const rw = (x2 - x1) * scaleX;
            const rh = (y2 - y1) * scaleY;
            
            ctx.strokeRect(rx, ry, rw, rh);
            ctx.fillRect(rx, ry, rw, rh);
            
            // Label
            ctx.fillStyle = '#fff';
            ctx.font = '10px monospace';
            ctx.fillText(c.label, rx + 5, ry + 12);
        });
        
        // 2. Draw Widgets
        this.shotcutHud.widgets.forEach(w => {
            if (!w.action) return;
            const [x1, y1, x2, y2] = w.bbox;
            
            ctx.strokeStyle = '#00ffcc';
            ctx.lineWidth = 1;
            
            const rx = x1 * scaleX;
            const ry = y1 * scaleY;
            const rw = (x2 - x1) * scaleX;
            const rh = (y2 - y1) * scaleY;
            
            ctx.strokeRect(rx, ry, rw, rh);
            
            // Action indicator
            ctx.fillStyle = 'rgba(0, 255, 204, 0.2)';
            ctx.fillRect(rx, ry, rw, rh);
        });

        // 3. Draw Layout Lines
        if (this.shotcutHud.layout && this.shotcutHud.layout.lines) {
            this.shotcutHud.layout.lines.forEach(line => {
                const isHorizontal = Math.abs(line.y1 - line.y2) < Math.abs(line.x1 - line.x2);
                ctx.strokeStyle = isHorizontal ? '#00ff88' : '#00aaff';
                ctx.lineWidth = 1;
                ctx.globalAlpha = 0.6;

                ctx.beginPath();
                ctx.moveTo(line.x1 * scaleX, line.y1 * scaleY);
                ctx.lineTo(line.x2 * scaleX, line.y2 * scaleY);
                ctx.stroke();
            });
            ctx.globalAlpha = 1.0;
        }

        // 4. Draw Memory Ghosts (semi-transparent overlays)
        if (this.ghostState.enabled && this.ghostState.ghosts.length > 0) {
            this._drawGhostOverlays(ctx, scaleX, scaleY);
        }
    }

    /**
     * Draw Memory Ghost overlays
     */
    _drawGhostOverlays(ctx, scaleX, scaleY) {
        for (const ghost of this.ghostState.ghosts) {
            const alpha = ghost.opacity || 0.5;
            const color = ghost.color || '#00FF00';

            // Draw ghost panels (dashed outline)
            ctx.globalAlpha = alpha * 0.3;
            ctx.strokeStyle = color;
            ctx.lineWidth = 2;
            ctx.setLineDash([8, 4]);

            for (const panel of (ghost.panels || [])) {
                const [x1, y1, x2, y2] = panel.bbox || [0, 0, 0, 0];
                ctx.strokeRect(x1 * scaleX, y1 * scaleY, (x2 - x1) * scaleX, (y2 - y1) * scaleY);
            }

            // Draw ghost buttons (solid outline)
            ctx.setLineDash([]);
            ctx.globalAlpha = alpha * 0.5;

            for (const button of (ghost.buttons || [])) {
                const [x1, y1, x2, y2] = button.bbox || [0, 0, 0, 0];
                ctx.strokeRect(x1 * scaleX, y1 * scaleY, (x2 - x1) * scaleX, (y2 - y1) * scaleY);
            }

            // Draw ghost lines
            ctx.globalAlpha = alpha * 0.4;
            ctx.strokeStyle = '#FFFF00';

            for (const line of (ghost.lines || [])) {
                ctx.beginPath();
                ctx.moveTo(line.x1 * scaleX, line.y1 * scaleY);
                ctx.lineTo(line.x2 * scaleX, line.y2 * scaleY);
                ctx.stroke();
            }
        }

        ctx.globalAlpha = 1.0;
        ctx.setLineDash([]);
    }

    /**
     * Process Task DAG update from Visual Bridge
     */
     */
    processTaskDagUpdate(update) {
        if (!update || !update.task_id) return;

        const taskId = update.task_id;
        const previousStatus = this.taskDag.tasks[taskId]?.status;

        // Update or create task entry
        this.taskDag.tasks[taskId] = {
            ...this.taskDag.tasks[taskId],
            ...update,
            lastUpdate: Date.now()
        };

        // Create flow animation if assignment changed
        if (update.assigned_to && previousStatus !== update.status) {
            this._createTaskFlow(taskId, update);
        }

        this._scheduleRender();
    }

    /**
     * Create animated flow for task assignment
     */
    _createTaskFlow(taskId, update) {
        const flow = {
            id: `${taskId}-${Date.now()}`,
            taskId: taskId,
            from: 'coordinator',
            to: update.assigned_to,
            progress: 0,
            startTime: Date.now(),
            color: this._getTaskStatusColor(update.status)
        };

        this.taskDag.activeFlows.push(flow);

        // Animate for 1 second
        const animate = () => {
            flow.progress = Math.min(1, (Date.now() - flow.startTime) / 1000);
            if (flow.progress < 1) {
                requestAnimationFrame(animate);
            } else {
                // Remove completed flow
                const idx = this.taskDag.activeFlows.indexOf(flow);
                if (idx >= 0) this.taskDag.activeFlows.splice(idx, 1);
            }
            this._scheduleRender();
        };
        requestAnimationFrame(animate);
    }

    /**
     * Get color for task status
     */
    _getTaskStatusColor(status) {
        const colors = {
            'pending': '#ffaa00',    // Yellow-orange
            'assigned': '#00aaff',   // Cyan
            'completed': '#44ff44',  // Green
            'failed': '#ff4444',     // Red
            'retry': '#ff8800'       // Orange
        };
        return colors[status] || '#888888';
    }

    /**
     * Render Task Graph section in HUD
     */
    _renderTaskGraph(ctx, x, y, width) {
        const lineHeight = 18;
        const padding = 10;
        let currentY = y + padding;

        // Section header
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 14px monospace';
        ctx.fillText('TASK PULSE', x + padding, currentY);
        currentY += lineHeight + 5;

        // Count by status
        const statusCounts = { pending: 0, assigned: 0, completed: 0, failed: 0 };
        const taskList = Object.values(this.taskDag.tasks);

        for (const task of taskList) {
            const status = task.status || 'pending';
            if (statusCounts.hasOwnProperty(status)) {
                statusCounts[status]++;
            }
        }

        // Status summary bar
        ctx.font = '12px monospace';
        const statusText = `P:${statusCounts.pending} A:${statusCounts.assigned} C:${statusCounts.completed} F:${statusCounts.failed}`;
        ctx.fillStyle = '#cccccc';
        ctx.fillText(statusText, x + padding, currentY);
        currentY += lineHeight + 8;

        // Divider
        ctx.strokeStyle = '#333333';
        ctx.beginPath();
        ctx.moveTo(x + padding, currentY);
        ctx.lineTo(x + width - padding, currentY);
        ctx.stroke();
        currentY += 10;

        // Active tasks list (max 5)
        const activeTasks = taskList
            .filter(t => t.status === 'pending' || t.status === 'assigned')
            .slice(0, 5);

        for (const task of activeTasks) {
            const statusColor = this._getTaskStatusColor(task.status);

            // Status dot
            ctx.fillStyle = statusColor;
            ctx.beginPath();
            ctx.arc(x + padding + 6, currentY - 4, 5, 0, Math.PI * 2);
            ctx.fill();

            // Task info
            ctx.fillStyle = '#ffffff';
            ctx.font = '11px monospace';
            const taskText = `${task.task_type || 'task'} -> ${task.assigned_to || 'unassigned'}`;
            ctx.fillText(taskText, x + padding + 16, currentY);

            // Duration if available
            if (task.duration) {
                ctx.fillStyle = '#888888';
                ctx.fillText(`${task.duration.toFixed(1)}s`, x + width - 50, currentY);
            }

            currentY += lineHeight;
        }

        // Render active flows (animated lines)
        this._renderTaskFlows(ctx, x, currentY + 10, width);

        return currentY + 50;
    }

    /**
     * Render animated task flow lines
     */
    _renderTaskFlows(ctx, x, y, width) {
        for (const flow of this.taskDag.activeFlows) {
            const startX = x + 20;
            const endX = x + width - 40;
            const currentX = startX + (endX - startX) * flow.progress;

            // Draw flow line
            ctx.strokeStyle = flow.color;
            ctx.lineWidth = 2;
            ctx.setLineDash([4, 4]);

            ctx.beginPath();
            ctx.moveTo(startX, y);
            ctx.lineTo(currentX, y);
            ctx.stroke();

            // Draw arrow head
            if (flow.progress > 0.1) {
                ctx.fillStyle = flow.color;
                ctx.beginPath();
                ctx.moveTo(currentX, y);
                ctx.lineTo(currentX - 8, y - 4);
                ctx.lineTo(currentX - 8, y + 4);
                ctx.closePath();
                ctx.fill();
            }

            // Flow label
            ctx.fillStyle = flow.color;
            ctx.font = '10px monospace';
            ctx.fillText(flow.taskId.slice(0, 12), startX, y - 8);
        }

        ctx.setLineDash([]);
    }

    /**
     * Get color for district
     */
    _getDistrictColor(district) {
        const colors = {
            'cognitive': '#00aaff',
            'metabolic': '#44ff44',
            'substrate': '#ff8844'
        };
        return colors[district] || '#888888';
    }

    /**
     * Process agent relocation event
     */
    processAgentRelocation(data) {
        if (!data || !data.agent_id) return;

        const agentId = data.agent_id;

        // Update agent position if tracked
        if (this.agentPositions[agentId]) {
            this.agentPositions[agentId].district = data.to_district;
        }

        // Show relocation notification
        this._showNotification(
            `🔀 ${agentId}: ${data.from_district} → ${data.to_district}`,
            this._getDistrictColor(data.to_district)
        );

        this._scheduleRender();
    }

    /**
     * Show temporary notification
     */
    _showNotification(message, color = '#ffffff') {
        // Add to UART buffer as notification
        this.uartBuffer.push({
            type: 'notification',
            text: message,
            color: color,
            timestamp: Date.now()
        });

        // Keep buffer size limited
        if (this.uartBuffer.length > this.uartMaxLines) {
            this.uartBuffer.shift();
        }
    }

    /**
     * Request ASCII scene file refresh from backend
     */
    _requestAsciiRefresh() {
        // Dispatch event to trigger WebSocket request
        window.dispatchEvent(new CustomEvent('REQUEST_ASCII_REFRESH'));

        // Also show notification
        this._showNotification('📄 Refreshing ASCII scene files...', '#00aaff');
    }

    /**
     * Handle drag start on agent
     */
    _handleDragStart(e) {
        const rect = this.hudCanvas.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        // Check for ASCII Scene section click (toggle expand)
        if (this._asciiSectionY !== undefined &&
            y >= this._asciiSectionY && y <= this._asciiSectionY + this._asciiSectionHeight) {
            // Check if clicking on title area
            if (y >= this._asciiSectionY + 10 && y <= this._asciiSectionY + 30) {
                this.asciiSceneExpanded = !this.asciiSceneExpanded;
                this._scheduleRender();
                return;
            }

            // Check for tab clicks (in expanded mode)
            if (this.asciiSceneExpanded) {
                const files = Object.keys(this.asciiSceneFiles);
                let tabX = 10;
                for (const filename of files.slice(0, 5)) {
                    const displayName = filename.replace('.ascii', '').substring(0, 12);
                    const tabWidth = displayName.length * 7 + 15;
                    if (x >= tabX && x <= tabX + tabWidth) {
                        this.asciiSceneSelectedFile = filename;
                        this._scheduleRender();
                        return;
                    }
                    tabX += tabWidth;
                }

                // Check for refresh button click
                if (x >= this.hudCanvas.width - 80 && y >= this._asciiSectionY + this._asciiSectionHeight - 95) {
                    this._requestAsciiRefresh();
                    return;
                }
            }
        }

        // Check if clicking on an agent
        for (const [agentId, pos] of Object.entries(this.agentPositions)) {
            const dx = x - pos.x;
            const dy = y - pos.y;
            if (dx * dx + dy * dy < 100) { // 10px radius
                this.draggedAgent = agentId;
                this.hudCanvas.style.cursor = 'grabbing';
                return;
            }
        }
    }

    /**
     * Handle drag move
     */
    _handleDragMove(e) {
        if (!this.draggedAgent) return;

        const rect = this.hudCanvas.getBoundingClientRect();
        const y = e.clientY - rect.top;

        // Determine drop target district
        const third = this.hudCanvas.height / 3;
        if (y < third) {
            this.dropTarget = 'cognitive';
        } else if (y < third * 2) {
            this.dropTarget = 'metabolic';
        } else {
            this.dropTarget = 'substrate';
        }

        this._scheduleRender();
    }

    /**
     * Handle drag end - trigger relocation
     */
    _handleDragEnd(e) {
        if (!this.draggedAgent || !this.dropTarget) {
            this.draggedAgent = null;
            this.dropTarget = null;
            this.hudCanvas.style.cursor = 'default';
            return;
        }

        const agent = this.agentPositions[this.draggedAgent];
        const fromDistrict = agent?.district || 'substrate';

        // Only relocate if district changed
        if (fromDistrict !== this.dropTarget) {
            // Send relocation command via WebSocket
            this._sendRelocationCommand(this.draggedAgent, this.dropTarget);
        }

        this.draggedAgent = null;
        this.dropTarget = null;
        this.hudCanvas.style.cursor = 'default';
    }

    /**
     * Send relocation command to backend
     */
    _sendRelocationCommand(agentId, targetDistrict) {
        // Dispatch event for TelemetryBus to pick up
        window.dispatchEvent(new CustomEvent('RELOCATE_AGENT', {
            detail: {
                agent_id: agentId,
                target_district: targetDistrict
            }
        }));

        // Show pending notification
        this._showNotification(`⏳ Relocating ${agentId} to ${targetDistrict}...`, '#ffaa00');
    }

    /**
     * Render district zones in HUD
     */
    _renderDistrictZones(ctx, x, y, width, height) {
        const padding = 10;
        const zoneHeight = (height - padding * 4) / 3;

        let currentY = y + padding;

        for (const [district, zone] of Object.entries(this.districtZones)) {
            zone.y = currentY;
            zone.height = zoneHeight;

            // Zone background
            const isDropTarget = this.dropTarget === district;
            ctx.fillStyle = isDropTarget ? zone.color + '40' : zone.color + '10';
            ctx.fillRect(x + padding, currentY, width - padding * 2, zoneHeight);

            // Zone border
            ctx.strokeStyle = isDropTarget ? zone.color : zone.color + '60';
            ctx.lineWidth = isDropTarget ? 2 : 1;
            ctx.strokeRect(x + padding, currentY, width - padding * 2, zoneHeight);

            // Zone label
            ctx.fillStyle = zone.color;
            ctx.font = 'bold 12px monospace';
            ctx.fillText(zone.name.toUpperCase(), x + padding + 5, currentY + 16);

            // Agent count
            const agentCount = Object.values(this.agentPositions)
                .filter(a => a.district === district).length;
            ctx.fillStyle = '#888888';
            ctx.font = '10px monospace';
            ctx.fillText(`(${agentCount} agents)`, x + width - 80, currentY + 16);

            currentY += zoneHeight + padding;
        }

        return currentY;
    }

    /**
     * Render agents in district zones
     */
    _renderAgentsInZones(ctx, x, width) {
        for (const [agentId, pos] of Object.entries(this.agentPositions)) {
            const zone = this.districtZones[pos.district];
            if (!zone) continue;

            // Calculate position within zone
            const agentX = x + 30 + (Math.random() * (width - 80));
            const agentY = zone.y + 30 + (Math.random() * (zone.height - 60));
            pos.x = agentX;
            pos.y = agentY;

            // Draw agent dot
            const isDragged = this.draggedAgent === agentId;
            ctx.fillStyle = isDragged ? '#ffffff' : zone.color;
            ctx.beginPath();
            ctx.arc(agentX, agentY, isDragged ? 8 : 6, 0, Math.PI * 2);
            ctx.fill();

            // Agent label
            ctx.fillStyle = '#cccccc';
            ctx.font = '9px monospace';
            ctx.fillText(agentId.slice(0, 10), agentX - 20, agentY + 15);
        }
    }

    /**
     * Initialize AgentController integration
     */
    _initAgentController() {
        if (typeof AgentController === 'undefined') return;

        this.agentController = new AgentController();

        // Wire up relocation callback
        this.agentController.onRelocate = (agentId, targetDistrict) => {
            this._sendRelocationCommand(agentId, targetDistrict);
        };

        // Wire up evict callback
        this.agentController.onEvict = (agentId) => {
            this._showNotification(`🚫 Evicting ${agentId}...`, '#ff4444');
            window.dispatchEvent(new CustomEvent('EVICT_AGENT', {
                detail: { agent_id: agentId }
            }));
        };

        // Wire up debug callback
        this.agentController.onDebug = (agentId) => {
            this._showNotification(`🔍 Debug dump: ${agentId}`, '#00aaff');
            console.log('Agent debug:', this.agentPositions[agentId]);
        };
    }

    /**
     * Show AgentController for clicked agent
     */
    _showAgentController(agentId) {
        if (!this.agentController) {
            this._initAgentController();
        }

        this.agentController.setAgent(agentId);
        this.agentController.element.style.display = 'block';
    }

    /**
     * Render Neural City HUD section
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderNeuralCityHUD(ctx, width, padding) {
        const neuralCity = window.geometryOSApp.neuralCity;
        if (!neuralCity) return;

        const stats = neuralCity.getStats();
        const focus = neuralCity.focusDistrict;

        // Calculate position - place between Silicon Terminal and bottom
        // or at bottom if Silicon Terminal is not showing
        let startY;
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            // Place above Silicon Terminal
            startY = this.hudCanvas.height - 520;
        } else {
            // Place at bottom
            startY = this.hudCanvas.height - 320;
        }

        const sectionHeight = 310;
        let y = startY;

        // Background for section
        ctx.fillStyle = 'rgba(40, 30, 0, 0.9)';
        ctx.fillRect(0, y, width, sectionHeight);

        // Border
        ctx.strokeStyle = '#FFD700';
        ctx.lineWidth = 1;
        ctx.strokeRect(0, y, width, sectionHeight);

        y += 20;

        // Title
        ctx.fillStyle = '#FFD700';
        ctx.font = 'bold 12px monospace';
        ctx.fillText('🏛️ NEURAL CITY (V14)', padding, y);
        y += 20;

        // District info
        ctx.fillStyle = '#FFFFFF';
        ctx.font = '11px monospace';
        ctx.fillText(`District: (${focus.x}, ${focus.y})`, padding, y);
        y += 16;

        // Material at focus
        ctx.fillText(`Material: ${stats.focusMaterial}`, padding, y);
        y += 16;

        // Metabolism - Health Monitoring
        const ipc = stats.metabolismIPC;
        const ipcColor = ipc >= 0.7 ? '#44ff44' : ipc >= 0.4 ? '#ffaa00' : '#ff4444';
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText('Metabolism:', padding, y);
        ctx.fillStyle = ipcColor;
        ctx.fillText(` ${ipc.toFixed(2)} IPC`, padding + 80, y);
        
        // IPC Bar
        ctx.fillStyle = '#333';
        ctx.fillRect(padding + 150, y - 8, 100, 10);
        ctx.fillStyle = ipcColor;
        ctx.fillRect(padding + 150, y - 8, 100 * ipc, 10);
        y += 16;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillText('Throttle:', padding, y);
        ctx.fillStyle = stats.throttleLevel === 'NONE' ? '#44ff44' : '#ff4444';
        ctx.fillText(` ${stats.throttleLevel}`, padding + 80, y);
        y += 16;

        // Inference Activity
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText(`Active Pulses: ${stats.pulseCount}`, padding, y);
        y += 16;

        // Cache status
        const cachePercent = stats.total > 0 ? Math.round((stats.loaded / stats.total) * 100) : 0;
        ctx.fillText(`Atlas Cache: ${stats.loaded}/${stats.total} (${cachePercent}%)`, padding, y);
        y += 16;

        // Diagnostic Status (V16)
        if (this.lastDiagnostic) {
            const diag = this.lastDiagnostic;
            const color = diag.severity === 'CRITICAL' ? '#ff4444' : 
                         diag.severity === 'WARNING' ? '#ffaa00' : '#44ff44';
            
            ctx.fillStyle = color;
            ctx.font = 'bold 11px monospace';
            ctx.fillText(`👁️ PERCEPTION: ${diag.severity}`, padding, y);
            y += 14;
            ctx.fillStyle = '#FFFFFF';
            ctx.font = '10px monospace';
            const lines = this._wrapText(diag.message, width - padding * 2);
            for (const line of lines) {
                ctx.fillText(`  ${line}`, padding, y);
                y += 12;
            }
            y += 4;
        }

        // Silicon District Section (V14)
        ctx.strokeStyle = '#00ff8844';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('⚡ SILICON DISTRICT', padding, y);
        y += 16;

        if (this.lastRiscvState) {
            const rs = this.lastRiscvState;
            ctx.fillStyle = '#FFFFFF';
            ctx.font = '10px monospace';
            ctx.fillText(`PC: 0x${(rs.pc || 0).toString(16).padStart(8, '0')}`, padding, y);
            y += 14;
            ctx.fillText(`Cycles: ${rs.cycles || 0}`, padding, y);
            y += 14;
            ctx.fillText(`Status: ${rs.running ? 'RUNNING' : 'HALTED'}`, padding, y);
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  (No execution active)', padding, y);
        }
        y += 16;

        // VRAM usage
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText(`VRAM: ${stats.vramMB}MB`, padding, y);
        y += 20;

        // Material legend (compact)
        ctx.font = '10px monospace';
        ctx.fillStyle = '#FFD700';
        ctx.fillText('■ Gold', padding, y);
        ctx.fillStyle = '#4169E1';
        ctx.fillText('  ■ Steel', 60, y);
        ctx.fillStyle = '#B7410E';
        ctx.fillText('  ■ Rust', 120, y);
        ctx.fillStyle = '#666666';
        ctx.fillText('  ■ Dust', 175, y);
    }

    /**
     * Render ASCII Scene Graph HUD section
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderAsciiSceneSection(ctx, width, padding) {
        const files = Object.keys(this.asciiSceneFiles);
        if (files.length === 0) return;

        // Calculate position - stack above other sections
        let offset = 0;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 260;

        const sectionHeight = this.asciiSceneExpanded ? 300 : 80;
        let startY = this.hudCanvas.height - sectionHeight - offset - 10;

        let y = startY;

        // Background for section
        ctx.fillStyle = 'rgba(0, 30, 60, 0.95)';
        ctx.fillRect(10, y, width - 20, sectionHeight);

        // Border
        ctx.strokeStyle = '#00aaff';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, sectionHeight);

        y += 18;
        ctx.fillStyle = '#00aaff';
        ctx.font = 'bold 11px monospace';
        const expandIcon = this.asciiSceneExpanded ? '▼' : '▶';
        ctx.fillText(`📄 ASCII SCENE GRAPH ${expandIcon}`, padding, y);

        // Click detection for expand/collapse
        this._asciiSectionY = startY;
        this._asciiSectionHeight = sectionHeight;

        y += 5;

        // Divider
        ctx.strokeStyle = '#00aaff44';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();

        y += 15;

        if (this.asciiSceneExpanded) {
            // File tabs
            ctx.font = '10px monospace';
            let tabX = padding;
            for (const filename of files.slice(0, 5)) {  // Max 5 tabs
                const isActive = filename === this.asciiSceneSelectedFile;
                const displayName = filename.replace('.ascii', '').substring(0, 12);

                if (isActive) {
                    ctx.fillStyle = '#00aaff';
                    ctx.fillRect(tabX, y - 10, displayName.length * 7 + 10, 14);
                    ctx.fillStyle = '#000';
                } else {
                    ctx.fillStyle = '#666';
                }

                ctx.fillText(displayName, tabX + 5, y);
                tabX += displayName.length * 7 + 15;
            }

            y += 20;

            // Content area
            const selectedFile = this.asciiSceneFiles[this.asciiSceneSelectedFile];
            if (selectedFile && selectedFile.content) {
                ctx.fillStyle = '#0a0a0a';
                ctx.fillRect(padding, y, width - padding * 2, sectionHeight - 80);

                ctx.fillStyle = '#00ff88';
                ctx.font = '9px monospace';

                // Render content (truncate to fit)
                const lines = selectedFile.content.split('\n');
                const maxLines = Math.floor((sectionHeight - 90) / 11);
                const displayLines = lines.slice(0, maxLines);

                for (let i = 0; i < displayLines.length; i++) {
                    const line = displayLines[i].substring(0, 42);  // Truncate long lines
                    ctx.fillText(line, padding + 5, y + 10 + i * 11);
                }

                // Show truncation indicator
                if (lines.length > maxLines) {
                    ctx.fillStyle = '#666';
                    ctx.fillText(`... (${lines.length - maxLines} more lines)`, padding + 5, y + 10 + maxLines * 11);
                }
            } else {
                ctx.fillStyle = '#666';
                ctx.font = '10px monospace';
                ctx.fillText('(No content)', padding + 5, y + 15);
            }

            // Refresh button
            ctx.fillStyle = '#00aaff';
            ctx.font = '10px monospace';
            ctx.fillText('[Refresh]', width - 70, y + sectionHeight - 85);

        } else {
            // Collapsed view - show file list
            ctx.font = '10px monospace';
            ctx.fillStyle = '#888';

            const fileList = files.map(f => f.replace('.ascii', '')).join(', ');
            const truncated = fileList.length > 35 ? fileList.substring(0, 35) + '...' : fileList;
            ctx.fillText(`Files: ${truncated}`, padding, y);
            y += 16;

            // Show selected file content preview
            const selectedFile = this.asciiSceneFiles[this.asciiSceneSelectedFile];
            if (selectedFile && selectedFile.content) {
                const preview = selectedFile.content.split('\n')[0].substring(0, 38);
                ctx.fillStyle = '#00ff88';
                ctx.fillText(`Preview: ${preview}`, padding, y);
            }
        }

        // Status line at bottom
        ctx.fillStyle = '#666';
        ctx.font = '9px monospace';
        const fileCount = files.length;
        const lastUpdate = this.asciiSceneFiles[this.asciiSceneSelectedFile]?.timestamp;
        const timeStr = lastUpdate ? new Date(lastUpdate * 1000).toLocaleTimeString() : 'N/A';
        ctx.fillText(`Files: ${fileCount} | Last: ${timeStr}`, padding, startY + sectionHeight - 5);
    }

    /**
     * Render Task Graph section with proper positioning in HUD
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderTaskGraphSection(ctx, width, padding) {
        // Calculate position - stack above other bottom sections
        let offset = 0;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 130;

        const sectionHeight = 150;
        let startY = this.hudCanvas.height - sectionHeight - offset - 10;

        // Background for section
        ctx.fillStyle = 'rgba(0, 60, 40, 0.95)';
        ctx.fillRect(10, startY, width - 20, sectionHeight);

        // Border
        ctx.strokeStyle = '#00ff88';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, startY, width - 20, sectionHeight);

        // Render task graph content
        this._renderTaskGraph(ctx, 10, startY, width - 20);
    }

    /**
     * Render Mutation HUD section
     * Displays mutation activity: total count, last mutation time, active upgrades
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderMutationHUD(ctx, width, padding) {
        const stats = this.mutationStats;
        const activeUpgrades = stats.activeUpgrades || [];
        const recentMutations = stats.recentMutations || [];

        // Calculate section height based on content
        const baseHeight = 80;
        const upgradeHeight = activeUpgrades.length * 18;
        const sectionHeight = baseHeight + upgradeHeight;

        // Calculate position - stack above other bottom sections
        let offset = sectionHeight + 20;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 260;

        let startY = this.hudCanvas.height - offset;

        // Background for section
        ctx.fillStyle = 'rgba(60, 0, 60, 0.95)';
        ctx.fillRect(10, startY, width - 20, sectionHeight);

        // Border with pulsing effect if mutations are recent
        ctx.strokeStyle = '#ff00ff';
        ctx.lineWidth = 1;

        // Pulse border if mutation was recent (within 2 seconds)
        if (stats.lastMutationTime && (Date.now() - stats.lastMutationTime) < 2000) {
            const pulse = Math.sin(Date.now() / 100) * 0.5 + 0.5;
            ctx.strokeStyle = `rgba(255, 0, 255, ${0.5 + pulse * 0.5})`;
            ctx.lineWidth = 2;
        }
        ctx.strokeRect(10, startY, width - 20, sectionHeight);

        let y = startY + 18;

        // Title
        ctx.fillStyle = '#ff00ff';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🧬 MUTATION HUD', padding, y);
        y += 5;

        // Divider
        ctx.strokeStyle = '#ff00ff44';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Total mutations
        ctx.fillStyle = '#ffffff';
        ctx.font = '11px monospace';
        ctx.fillText(`Total Mutations: ${stats.totalMutations}`, padding, y);
        y += 16;

        // Last mutation time
        if (stats.lastMutationTime) {
            const age = (Date.now() - stats.lastMutationTime) / 1000;
            let timeStr;
            if (age < 60) {
                timeStr = `${age.toFixed(1)}s ago`;
            } else if (age < 3600) {
                timeStr = `${Math.floor(age / 60)}m ago`;
            } else {
                timeStr = `${Math.floor(age / 3600)}h ago`;
            }
            ctx.fillStyle = age < 5 ? '#ff00ff' : age < 30 ? '#ff88ff' : '#888888';
            ctx.fillText(`Last Mutation: ${timeStr}`, padding, y);
        } else {
            ctx.fillStyle = '#666666';
            ctx.fillText('Last Mutation: N/A', padding, y);
        }
        y += 16;

        // Recent mutation count
        ctx.fillStyle = '#aaaaaa';
        ctx.fillText(`Recent (last 20): ${recentMutations.length}`, padding, y);
        y += 18;

        // Active upgrades section
        if (activeUpgrades.length > 0) {
            ctx.fillStyle = '#FFD700';
            ctx.font = 'bold 10px monospace';
            ctx.fillText('ACTIVE UPGRADES:', padding, y);
            y += 14;

            ctx.font = '10px monospace';
            for (const upgrade of activeUpgrades) {
                const duration = ((Date.now() - upgrade.startTime) / 1000).toFixed(1);

                // Material colors
                const toMaterialColors = {
                    'gold': '#FFD700',
                    'steel': '#4169E1',
                    'rust': '#B7410E',
                    'dust': '#666666'
                };
                ctx.fillStyle = toMaterialColors[upgrade.toMaterial] || '#ffffff';
                ctx.fillText(`  ${upgrade.districtId}: ${upgrade.fromMaterial} → ${upgrade.toMaterial} (${duration}s)`, padding, y);
                y += 16;
            }
        } else {
            ctx.fillStyle = '#666666';
            ctx.font = '10px monospace';
            ctx.fillText('No active upgrades', padding, y);
        }
    }

    /**
     * Render Tectonic Activity HUD section (Phase 28: Spatial Tectonics)
     * Shows layout realignment status and pulse activity.
     */
    _renderTectonicSection(ctx, width, padding) {
        const state = this.tectonicState;

        // Calculate section height
        const baseHeight = 100;
        const sectionHeight = baseHeight;

        // Calculate position - stack above other bottom sections
        let offset = sectionHeight + 20;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 260;
        if (this.mutationStats.totalMutations > 0) offset += 100;

        let startY = this.hudCanvas.height - offset;

        // Background for section - earth tones for tectonics
        ctx.fillStyle = 'rgba(40, 30, 20, 0.95)';
        ctx.fillRect(10, startY, width - 20, sectionHeight);

        // Border with activity indicator
        ctx.strokeStyle = state.status === 'processing' ? '#ff6600' : '#8B4513';
        ctx.lineWidth = state.status === 'processing' ? 2 : 1;
        ctx.strokeRect(10, startY, width - 20, sectionHeight);

        let y = startY + 18;

        // Title with emoji
        ctx.fillStyle = '#ff9944';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🌍 TECTONIC ACTIVITY', padding, y);
        y += 5;

        // Divider
        ctx.strokeStyle = '#8B451344';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Status with indicator
        const statusColors = {
            'idle': '#888888',
            'processing': '#ff6600',
            'complete': '#44ff44',
            'error': '#ff4444'
        };
        const statusIcons = {
            'idle': '○',
            'processing': '◐',
            'complete': '●',
            'error': '✗'
        };

        ctx.fillStyle = statusColors[state.status] || '#888888';
        ctx.font = '11px monospace';
        const icon = statusIcons[state.status] || '○';
        ctx.fillText(`Status: ${icon} ${state.status.toUpperCase()}`, padding, y);
        y += 16;

        // Cycle count
        ctx.fillStyle = '#aaaaaa';
        ctx.fillText(`Cycle: ${state.lastCycle}`, padding, y);
        y += 14;

        // Top bond if available
        if (state.topBond) {
            ctx.fillStyle = '#ffcc00';
            ctx.fillText(
                `Top Bond: ${state.topBond.source} ↔ ${state.topBond.dest} (${(state.topBond.strength * 100).toFixed(0)}%)`,
                padding, y
            );
        } else {
            ctx.fillStyle = '#666666';
            ctx.fillText('Top Bond: N/A', padding, y);
        }
        y += 14;

        // Last realignment
        if (state.lastRealignment) {
            const age = (Date.now() - state.lastRealignment) / 1000;
            let timeStr;
            if (age < 60) {
                timeStr = `${age.toFixed(0)}s ago`;
            } else if (age < 3600) {
                timeStr = `${Math.floor(age / 60)}m ago`;
            } else {
                timeStr = `${Math.floor(age / 3600)}h ago`;
            }
            ctx.fillStyle = age < 30 ? '#44ff44' : '#888888';
            ctx.fillText(`Last Realignment: ${timeStr}`, padding, y);
        } else {
            ctx.fillStyle = '#666666';
            ctx.fillText('Last Realignment: Never', padding, y);
        }
        y += 14;

        // Total movements and pulse count
        ctx.fillStyle = '#888888';
        ctx.font = '10px monospace';
        ctx.fillText(
            `Movements: ${state.totalMovements} | Pulses: ${state.pulseCount}`,
            padding, y
        );
    }

    /**
     * Render Ambient Narrative section in the HUD.
     * Shows state, session info, and AI thoughts.
     */
    _renderNarrativeSection(ctx, width, padding) {
        const state = this.narrativeState;
        if (!state.enabled && state.state === 'IDLE') return;

        let y = this._getNextSectionY();

        // Background for section
        ctx.fillStyle = 'rgba(0, 30, 50, 0.9)';
        ctx.fillRect(0, y, width, 140);

        y += 20;

        // Header with state color
        const stateColors = {
            'MONITORING': '#00ffff',   // Cyan
            'SUGGESTING': '#ffff00',    // Yellow
            'STEERING': '#ff6600',      // Orange/Red
            'IDLE': '#888888'           // Gray
        };
        const stateColor = stateColors[state.state] || '#888888';

        ctx.fillStyle = stateColor;
        ctx.font = 'bold 12px monospace';
        ctx.fillText('📖 AMBIENT NARRATIVE', padding, y);
        y += 20;

        // State indicator with colored dot
        ctx.fillStyle = stateColor;
        ctx.beginPath();
        ctx.arc(padding + 5, y - 4, 4, 0, Math.PI * 2);
        ctx.fill();

        ctx.fillStyle = '#fff';
        ctx.font = '11px monospace';
        ctx.fillText(`State: ${state.state}`, padding + 15, y);
        y += 16;

        // Session info
        ctx.fillStyle = '#aaa';
        if (state.sessionId) {
            ctx.fillText(`Session: ${String(state.sessionId).substring(0, 12)}...`, padding, y);
        } else {
            ctx.fillText('Session: (not connected)', padding, y);
        }
        y += 16;

        // Evolution count
        ctx.fillText(`Evolutions: ${state.evolutionCount}`, padding, y);
        y += 16;

        // Last thought (if any)
        if (state.lastThought) {
            ctx.fillStyle = '#888';
            ctx.fillText('Last Thought:', padding, y);
            y += 14;

            ctx.fillStyle = '#ccc';
            ctx.font = '10px monospace';
            const lines = this._wrapText(state.lastThought, width - padding * 2 - 10);
            for (const line of lines.slice(0, 2)) { // Max 2 lines
                ctx.fillText(`  ${line}`, padding, y);
                y += 12;
            }
            y += 4;
        }

        // Steering actions (if any)
        if (state.steeringActions.length > 0) {
            ctx.fillStyle = '#ff6600';
            ctx.font = '10px monospace';
            const lastAction = state.steeringActions[0];
            ctx.fillText(`🎯 ${lastAction.action}${lastAction.target ? ` → ${lastAction.target}` : ''}`, padding, y);
        }

        // Last update timestamp
        if (state.lastUpdate) {
            const age = ((Date.now() - state.lastUpdate) / 1000).toFixed(1);
            ctx.fillStyle = '#555';
            ctx.font = '9px monospace';
            ctx.fillText(`Updated: ${age}s ago`, padding, y + 16);
        }

        this._lastSectionY = y + 30;
    }

    /**
     * Handle heat map toggle event
     */
    handleHeatmapToggle(detail) {
        if (detail) {
            this.heatmapState.visible = detail.visible;
        }
        this._scheduleRender();
    }

    /**
     * Handle heat map update event
     */
    handleHeatmapUpdate(data) {
        if (!data) return;

        // Update state from the data
        this.heatmapState.hotspotCount = (data.hotspots || []).length;
        this.heatmapState.lastUpdate = data.timestamp || Date.now();

        // Calculate average heat from grid if available
        if (data.grid) {
            try {
                const hexString = data.grid;
                const bytes = new Uint8Array(
                    hexString.match(/.{2}/g).map(b => parseInt(b, 16))
                );
                const grid = new Float32Array(bytes.buffer);
                const sum = grid.reduce((a, b) => a + b, 0);
                this.heatmapState.avgHeat = sum / grid.length;
                this.heatmapState.maxHeat = Math.max(...grid);
            } catch (e) {
                // Ignore parsing errors
            }
        }

        this._scheduleRender();
    }

    /**
     * Render Heat Map HUD section (Visual Hotspot Debugger)
     * Shows heat map status, hotspots, and color legend.
     */
    _renderHeatmapSection(ctx, width, padding) {
        const heatmap = window.geometryOSApp?.heatmapOverlay;
        if (!heatmap) return 0;

        const stats = heatmap.getStats ? heatmap.getStats() : this.heatmapState;

        const lineHeight = 16;
        const sectionHeight = 110;
        let currentY = 10;

        // Position - stack with other sections from top
        // Find the last bottom-positioned section offset
        let offset = sectionHeight + 30;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 260;
        if (this.mutationStats.totalMutations > 0) offset += 100;
        if (this.tectonicState.pulseCount > 0 || this.tectonicState.totalMovements > 0) offset += 100;

        const startY = this.hudCanvas.height - offset;

        // Background for section - warm colors for heat map
        ctx.fillStyle = 'rgba(60, 20, 0, 0.95)';
        ctx.fillRect(10, startY, width - 20, sectionHeight);

        // Border with activity indicator (glowing when visible)
        ctx.strokeStyle = stats.visible ? '#ff6600' : '#8B4513';
        ctx.lineWidth = stats.visible ? 2 : 1;
        ctx.strokeRect(10, startY, width - 20, sectionHeight);

        currentY = startY + 18;

        // Header with emoji
        ctx.fillStyle = '#ff6600';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🔥 HEAT MAP', padding, currentY);
        currentY += 5;

        // Divider
        ctx.strokeStyle = '#ff660044';
        ctx.beginPath();
        ctx.moveTo(padding, currentY);
        ctx.lineTo(width - padding, currentY);
        ctx.stroke();
        currentY += 15;

        // Stats
        ctx.font = '11px monospace';

        // Visible status
        ctx.fillStyle = stats.visible ? '#44ff44' : '#888888';
        const statusIcon = stats.visible ? '●' : '○';
        ctx.fillText(`Visible: ${statusIcon} ${stats.visible ? 'ON' : 'OFF'}`, padding, currentY);
        currentY += lineHeight;

        // Hotspot count
        ctx.fillStyle = '#ff4444';
        ctx.fillText(`Hotspots: ${stats.hotspotCount}`, padding, currentY);
        currentY += lineHeight;

        // Average heat with progress bar
        const avgPercent = (stats.avgHeat * 100).toFixed(1);
        ctx.fillStyle = '#cccccc';
        ctx.fillText(`Avg Heat: ${avgPercent}%`, padding, currentY);

        // Progress bar
        const barX = padding + 100;
        const barWidth = width - barX - padding - 10;
        ctx.fillStyle = '#333333';
        ctx.fillRect(barX, currentY - 10, barWidth, 8);

        // Fill bar with heat color
        const heatColor = this._getHeatColor(stats.avgHeat);
        ctx.fillStyle = heatColor;
        ctx.fillRect(barX, currentY - 10, barWidth * stats.avgHeat, 8);
        currentY += lineHeight;

        // Color gradient legend
        ctx.fillStyle = '#888888';
        ctx.font = '10px monospace';
        ctx.fillText('Legend:', padding, currentY);
        currentY += 14;

        // Draw gradient bar
        const legendX = padding + 10;
        const legendWidth = width - padding * 2 - 20;
        for (let i = 0; i < legendWidth; i++) {
            const t = i / legendWidth;
            ctx.fillStyle = this._getHeatColor(t);
            ctx.fillRect(legendX + i, currentY, 1, 10);
        }

        // Legend labels
        ctx.fillStyle = '#666666';
        ctx.font = '8px monospace';
        ctx.fillText('Cold', legendX, currentY + 18);
        ctx.fillText('Hot', legendX + legendWidth - 20, currentY + 18);

        return sectionHeight;
    }

    /**
     * Get color string for heat value (0-1)
     */
    _getHeatColor(value) {
        const v = Math.max(0, Math.min(1, value));

        // Interpolate through heat colors
        const colors = [
            { r: 0, g: 0, b: 255 },    // Cold (blue)
            { r: 0, g: 255, b: 255 },  // Cool (cyan)
            { r: 0, g: 255, b: 0 },    // Warm (green)
            { r: 255, g: 255, b: 0 },  // Hot (yellow)
            { r: 255, g: 0, b: 0 }     // Very hot (red)
        ];

        const scaled = v * (colors.length - 1);
        const index = Math.floor(scaled);
        const t = scaled - index;

        const c1 = colors[Math.min(index, colors.length - 1)];
        const c2 = colors[Math.min(index + 1, colors.length - 1)];

        const r = Math.round(c1.r + (c2.r - c1.r) * t);
        const g = Math.round(c1.g + (c2.g - c1.g) * t);
        const b = Math.round(c1.b + (c2.b - c1.b) * t);

        return `rgb(${r},${g},${b})`;
    }

    /**
     * Get the Y position for the next HUD section.
     * @returns {number} Y coordinate
     */
    _getNextSectionY() {
        return this._lastSectionY || 100;
    }

    /**
     * Wrap text to fit width
     */
    _wrapText(text, maxWidth) {
        const words = text.split(' ');
        const lines = [];
        let currentLine = '';

        for (const word of words) {
            const testLine = currentLine ? `${currentLine} ${word}` : word;
            const metrics = this.hudCtx.measureText(testLine);

            if (metrics.width > maxWidth && currentLine) {
                lines.push(currentLine);
                currentLine = word;
            } else {
                currentLine = testLine;
            }
        }

        if (currentLine) {
            lines.push(currentLine);
        }

        return lines;
    }

    /**
     * Update configuration
     */
    updateConfig(newConfig) {
        this.config = { ...this.config, ...newConfig };
    }

    /**
     * Get statistics
     */
    getStats() {
        const neuralCityStats = (window.geometryOSApp && window.geometryOSApp.neuralCity)
            ? window.geometryOSApp.neuralCity.getStats()
            : null;

        return {
            enabled: this.config.enabled,
            showBoundingboxes: this.config.showBoundingboxes,
            showLayoutDiffs: this.config.showLayoutDiffs,
            showOCRConfidence: this.config.showOCRConfidence,
            showVerificationHUD: this.config.showVerificationHUD,
            showSpatialRelations: this.config.showSpatialRelations,
            elementOverlaysCount: this.elementOverlays.size,
            verificationResultsCount: this.verificationResults.length,
            renderTimeMs: this.renderTime.toFixed(2),
            frameCount: this.frameCount,
            lastVerificationSuccess: this.lastVerification?.success,
            lastVerificationConfidence: this.lastVerification?.overall_confidence,
            taskDagCount: Object.keys(this.taskDag.tasks).length,
            taskDagActiveFlows: this.taskDag.activeFlows.length,
            // ASCII Scene Graph stats
            asciiSceneFilesCount: Object.keys(this.asciiSceneFiles).length,
            asciiSceneSelectedFile: this.asciiSceneSelectedFile,
            asciiSceneExpanded: this.asciiSceneExpanded,
            // Mutation stats
            mutationStats: {
                totalMutations: this.mutationStats.totalMutations,
                lastMutationTime: this.mutationStats.lastMutationTime,
                activeUpgradesCount: this.mutationStats.activeUpgrades.length,
                recentMutationsCount: this.mutationStats.recentMutations.length
            },
            // Neural City stats
            neuralCity: neuralCityStats ? {
                focus: this.neuralCityFocus,
                zoom: this.neuralCityZoom,
                loaded: neuralCityStats.loaded,
                total: neuralCityStats.total,
                vramMB: neuralCityStats.vramMB,
                focusMaterial: neuralCityStats.focusMaterial,
                metabolismIPC: neuralCityStats.metabolismIPC,
                throttleLevel: neuralCityStats.throttleLevel,
                pulseCount: neuralCityStats.pulseCount
            } : null
        };
    }

    /**
     * Clear all data
     */
    clearData() {
        this.verificationResults = [];
        this.mirrorValidationResults = [];
        this.currentIntent = null;
        this.lastVerification = null;
        this.lastMirrorValidation = null;
        this.elementOverlays.clear();
        this.currentScene = null;
        this.uartBuffer = [];
        this.lastUartTimestamp = null;
        this.taskDag = {
            tasks: {},
            activeFlows: [],
            summary: null
        };
        // Clear ASCII Scene Graph state
        this.asciiSceneFiles = {};
        this.asciiSceneSelectedFile = null;
        this.asciiSceneExpanded = false;
        // Clear mutation stats
        this.mutationStats = {
            totalMutations: 0,
            lastMutationTime: null,
            activeUpgrades: [],
            recentMutations: []
        };
    }

    /**
     * Destroy overlay
     */
    destroy() {
        if (this.hudCanvas && this.hudCanvas.parentNode) {
            this.hudCanvas.parentNode.removeChild(this.hudCanvas);
        }
        if (this.overlayCanvas && this.overlayCanvas.parentNode) {
            this.overlayCanvas.parentNode.removeChild(this.overlayCanvas);
        }
        this.clearData();
    }
}

// ========================================
// PERCEPTUAL BRIDGE V16 - Diagnostic HUD
// ========================================

class PerceptualBridgeHUD {
    constructor(container) {
        this.container = container;
        this.section = null;
        this.lastPulse = null;
        this.anomalyCount = 0;
        this.lastScanTime = null;
        this.pcValue = null;
        this._updateTimer = null;
        this.createSection();
        this._bindEvents();
        // Register global instance for external access
        window.perceptualBridgeHUD = this;
    }

    createSection() {
        this.section = document.createElement('div');
        this.section.className = 'hud-section perceptual-bridge';
        this.section.innerHTML = `
            <div class="hud-header">🔮 PERCEPTUAL BRIDGE V16</div>
            <div class="hud-content">
                <div class="status-row">
                    <span class="label">Status:</span>
                    <span class="value status-healthy" id="pb-status">✓ HEALTHY</span>
                </div>
                <div class="status-row">
                    <span class="label">Last Scan:</span>
                    <span class="value" id="pb-last-scan">--</span>
                </div>
                <div class="status-row">
                    <span class="label">PC:</span>
                    <span class="value" id="pb-pc">--</span>
                </div>
                <div class="status-row">
                    <span class="label">Anomalies:</span>
                    <span class="value" id="pb-anomalies">0</span>
                </div>
                <div class="anomaly-detail" id="pb-anomaly-detail" style="display:none;">
                    <span class="warning-text" id="pb-warning"></span>
                </div>
            </div>
        `;
        this.container.appendChild(this.section);
        this.statusEl = this.section.querySelector('#pb-status');
        this.lastScanEl = this.section.querySelector('#pb-last-scan');
        this.pcEl = this.section.querySelector('#pb-pc');
        this.anomaliesEl = this.section.querySelector('#pb-anomalies');
        this.anomalyDetailEl = this.section.querySelector('#pb-anomaly-detail');
        this.warningEl = this.section.querySelector('#pb-warning');

        // Inject styles if not already present
        this._injectStyles();
    }

    _bindEvents() {
        // Listen for DIAGNOSTIC_PULSE events from TelemetryBus/VisualBridge
        window.addEventListener('DIAGNOSTIC_PULSE', (e) => {
            this.updateFromPulse(e.detail);
        });

        // Listen for RISCV_STATE_UPDATE events for PC tracking
        window.addEventListener('RISCV_STATE_UPDATE', (e) => {
            if (e.detail && e.detail.pc !== undefined) {
                this.updatePC(e.detail.pc);
            }
        });

        // Start update timer for "time ago" display
        this._startUpdateTimer();
    }

    _startUpdateTimer() {
        // Update "time ago" display every second
        this._updateTimer = setInterval(() => {
            if (this.lastScanTime) {
                const secs = Math.floor((Date.now() - this.lastScanTime.getTime()) / 1000);
                this.lastScanEl.textContent = `${secs}s ago`;
            }
        }, 1000);
    }

    _injectStyles() {
        const styleId = 'perceptual-bridge-styles';
        if (document.getElementById(styleId)) return;

        const style = document.createElement('style');
        style.id = styleId;
        style.textContent = `
            .status-healthy { color: #00ff88; }
            .status-warning { color: #ffaa00; }
            .status-critical { color: #ff4444; font-weight: bold; }

            .perceptual-bridge.alerting {
                border: 2px solid #ff4444;
                animation: pulse-alert 1s infinite;
            }

            @keyframes pulse-alert {
                0%, 100% { background-color: rgba(255, 68, 68, 0.1); }
                50% { background-color: rgba(255, 68, 68, 0.3); }
            }

            .anomaly-detail {
                margin-top: 8px;
                padding: 6px;
                background: rgba(255, 68, 68, 0.2);
                border-radius: 4px;
            }

            .warning-text {
                color: #ff6666;
                font-size: 11px;
            }
        `;
        document.head.appendChild(style);
    }

    updateFromPulse(data) {
        this.lastPulse = data;
        this.lastScanTime = new Date();
        this.updateDisplay();
    }

    updatePC(pcValue) {
        this.pcValue = pcValue;
        this.updateDisplay();
    }

    updateDisplay() {
        if (!this.lastPulse) return;
        const { status, matched_pattern } = this.lastPulse;

        if (status === 'CRITICAL') {
            this.statusEl.textContent = '✗ CRITICAL';
            this.statusEl.className = 'value status-critical';
            this.anomalyCount++;
            this.showAnomalyDetail(matched_pattern);
        } else if (status === 'WARNING') {
            this.statusEl.textContent = '⚠ WARNING';
            this.statusEl.className = 'value status-warning';
            this.anomalyCount++;
            this.showAnomalyDetail(matched_pattern);
        } else {
            this.statusEl.textContent = '✓ HEALTHY';
            this.statusEl.className = 'value status-healthy';
            this.hideAnomalyDetail();
        }

        if (this.lastScanTime) {
            const secs = Math.floor((Date.now() - this.lastScanTime.getTime()) / 1000);
            this.lastScanEl.textContent = `${secs}s ago`;
        }
        if (this.pcValue !== null) {
            this.pcEl.textContent = `0x${this.pcValue.toString(16).padStart(8, '0')}`;
        }
        this.anomaliesEl.textContent = this.anomalyCount;
    }

    showAnomalyDetail(pattern) {
        this.anomalyDetailEl.style.display = 'block';
        this.warningEl.textContent = `⚠ ${pattern}`;
        this.section.classList.add('alerting');
    }

    hideAnomalyDetail() {
        this.anomalyDetailEl.style.display = 'none';
        this.section.classList.remove('alerting');
    }

    destroy() {
        // Stop update timer
        if (this._updateTimer) {
            clearInterval(this._updateTimer);
            this._updateTimer = null;
        }
        // Remove global reference
        if (window.perceptualBridgeHUD === this) {
            window.perceptualBridgeHUD = null;
        }
        // Remove section from DOM
        if (this.section && this.section.parentNode) {
            this.section.parentNode.removeChild(this.section);
        }
    }
}

// Register with main HUD
if (typeof VisualDebugOverlay !== 'undefined') {
    VisualDebugOverlay.registerModule('perceptualBridge', PerceptualBridgeHUD);
}

// Export
if (typeof window !== 'undefined') {
    window.VisualDebugOverlay = VisualDebugOverlay;
    window.PerceptualBridgeHUD = PerceptualBridgeHUD;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VisualDebugOverlay, PerceptualBridgeHUD };
}
