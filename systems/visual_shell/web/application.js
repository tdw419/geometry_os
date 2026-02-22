/**
 * Geometry OS: Main Application (Web-First Infinite Map)
 * 
 * The entry point for the new browser-native Infinite Map.
 * Orchestrates the Viewport, ChunkManager, and SpritePool.
 */

// Import dependent modules
// In a real build step we would use ES modules, but for now we assume they are loaded globally
// or we use a simple loader.

class GeometryOSApplication {
    constructor() {
        // Core configuration
        this.config = {
            gridSize: 100,
            chunkSize: 16,
            backgroundColor: 0x111111,
            enableAntigravity: true,
            isElectron: typeof window !== 'undefined' && window.process && window.process.type === 'renderer'
        };

        // Application state
        this.app = null;
        this.viewport = null;
        this.chunkManager = null;
        this.tileManager = null;
        this.cameraController = null;
        this.spatialIndex = null;
        this.visualBootLoader = null;
        this.infiniteMap = null; // Manifest-based infinite map with LLM chat
        this.windowManager = null; // Desktop Environment

        // System components
        this.cognitiveLayer = null; // Antigravity Prime
        this.computeSystem = null;  // WebGPU Native Substrate
        this.linuxKernelLoader = null; // Penguin Kernel Loader
        this.workbench = null; // Morphological Workbench (Geometric IDE)

        // Creative tool layers
        this.drawingLayer = null;
        this.spriteLayer = null;
        this.managedSprites = new Map();

        // Area Agent state
        this.areaAgentSocket = null;
        this.areaAgents = new Map();
        this.agentInputOverlay = null;
        this.activeAgentId = null;

        // Goal Management
        this.goalPanel = null;
        this.activeGoals = new Map();

        // Evolution Safety Dashboards (V13)
        this.metabolismDashboard = null;

        // Neural City Renderer (P1 PIXI.js Layer)
        this.neuralCity = null;

        // Visual Hotspot Debugger (Heat Map Overlay)
        this.heatmapOverlay = null;

        // World Persistence
        this.localArtifacts = [];

        // V2.0: Ambient Narrative System
        this.ambientNarrative = null;
        this.ambientNarrativeHUD = null;
        this._sceneStreamInterval = null;
        this._fpsMonitorInterval = null;
    }

    /**
     * Serializes the main world container into a structured JSON object.
     * This is the data source for the `render_visual_layout` WebMCP tool.
     * @returns {Object|null} A JSON representation of the scene graph.
     */
    getSceneGraphAsJSON() {
        // Helper function to recursively serialize a PIXI container.
        const serializeNode = (node) => {
            if (!node.visible || node.alpha === 0 || !node.renderable) {
                return null;
            }

            const bounds = node.getBounds();
            const nodeInfo = {
                type: node.constructor.name,
                x: Math.round(bounds.x),
                y: Math.round(bounds.y),
                width: Math.round(bounds.width),
                height: Math.round(bounds.height),
                details: {},
                children: []
            };

            // --- Type-specific details ---
            if (node instanceof PIXI.Text) {
                nodeInfo.type = 'Text';
                nodeInfo.details.text = node.text;
            } else if (node instanceof PIXI.Sprite) {
                nodeInfo.type = 'Sprite';
                if (node.texture && node.texture.textureCacheIds) {
                    nodeInfo.details.texture = node.texture.textureCacheIds[0] || 'unknown';
                }
            }

            // --- App-specific semantic inference ---
            // Assumption: The WindowManager adds a 'isWindow' flag and a 'title' property to window containers.
            if (node.isWindow) {
                nodeInfo.type = 'Window';
                nodeInfo.details.title = node.title || 'Untitled';
            }
            // Assumption: Buttons have a 'isButton' flag and contain a PIXI.Text child for the label.
            if (node.isButton) {
                nodeInfo.type = 'Button';
                const textChild = node.children.find(c => c instanceof PIXI.Text);
                nodeInfo.details.label = textChild ? textChild.text : '';
            }

            // Recursively serialize children
            if (node.children && node.children.length > 0) {
                for (const child of node.children) {
                    const childInfo = serializeNode(child);
                    if (childInfo) {
                        nodeInfo.children.push(childInfo);
                    }
                }
            }
            
            // Don't return containers that only have a single graphics object of the same size (e.g. window background)
            if (nodeInfo.type === 'Container' && nodeInfo.children.length === 1 && nodeInfo.children[0].type === 'Graphics' &&
                nodeInfo.children[0].width === nodeInfo.width && nodeInfo.children[0].height === nodeInfo.height) {
                return null;
            }


            return nodeInfo;
        };

        return serializeNode(this.worldContainer);
    }


    async initialize(containerId) {
        console.log("🚀 Initializing Geometry OS (Web Kernel)...");

        // 1. Initialize PixiJS
        this.app = new PIXI.Application();
        await this.app.init({
            resizeTo: window,
            backgroundColor: this.config.backgroundColor,
            antialias: true,
            resolution: window.devicePixelRatio || 1,
            autoDensity: true
        });
        document.getElementById(containerId).appendChild(this.app.view);

        // Handle window resize for neural city
        window.addEventListener('resize', () => {
            if (this.neuralCity) {
                this.neuralCity.resize(window.innerWidth, window.innerHeight);
            }
        });

        // 2. Initialize Accessibility Manager (Phase 2.3)
        if (typeof AccessibilityManager !== 'undefined') {
            window.accessibilityManager = new AccessibilityManager({
                rootElement: document.body,
                enabled: true,
                highContrastMode: false,
                reducedMotion: window.matchMedia('(prefers-reduced-motion: reduce)').matches
            });
            window.accessibilityManager.initialize();
            console.log("♿ Accessibility Manager initialized");
        }

        // 2b. Initialize Semantic Overlay ("AI Buttons")
        if (typeof SemanticOverlay !== 'undefined') {
            this.semanticOverlay = new SemanticOverlay(this.app);
            console.log("👁️ Semantic Overlay initialized");
        }

        // 3. Initialize Low-Level Systems
        this.spatialIndex = new SpatialIndex({ type: 'hash', cellSize: this.config.gridSize });

        // 4. Create Scene Graph
        this.worldContainer = new PIXI.Container();
        this.app.stage.addChild(this.worldContainer);

        // --- Phase 50: Advanced Visual Tools ---
        if (typeof VisualVerificationBridge !== 'undefined') {
            this.visualBridge = new VisualVerificationBridge();
            this.visualBridge.initialize();
            console.log("👁️ Visual Verification Bridge active (Glass Box AI)");
        }

        // --- PixelRTS Phase 4: Visual Catalog ---
        if (typeof SpatialCatalog !== 'undefined') {
            this.catalog = new SpatialCatalog(this);
            this.catalog.initialize();
            console.log("📂 Spatial Catalog integrated");
        }

        // --- Path 2: Memory Beams (Hippocampus Integration) ---
        if (typeof MemoryBeamRenderer !== 'undefined') {
            this.memoryBeams = new MemoryBeamRenderer(this.app, {
                maxBeams: 50,
                beamColor: 0x00d4ff,  // Cyan
                glowAlpha: 0.6
            });
            console.log("🔮 Memory Beam Renderer initialized");
            this._setupMemoryBeamGestures();
            this._connectMemoryBridge();
        }

        // --- Visual Hotspot Debugger: Heat Map Overlay ---
        if (typeof HeatmapOverlay !== 'undefined') {
            this.heatmapOverlay = new HeatmapOverlay(this.app, this.viewport, this.worldContainer);
            this._setupHeatmapKeyboard();
            console.log("🔥 Heatmap Overlay initialized (Ctrl+Shift+M to toggle)");
        }

        // 4b. Initialize Creative Layers
        this.drawingLayer = new PIXI.Graphics();
        this.worldContainer.addChild(this.drawingLayer);
        this.spriteLayer = new PIXI.Container();
        this.worldContainer.addChild(this.spriteLayer);

        // 4a. Initialize Compute System (Native WebAssembly Substrate)
        // Must be done before loading tiles if they need execution
        if (typeof ComputeIntegrationSystem !== 'undefined') {
            this.computeSystem = new ComputeIntegrationSystem(this.app);
            // Auto-boot test kernel
            // this.computeSystem.bootKernel('assets/test_minimal.rts.png', 'kernel_0');
        }

        // 5. Initialize Desktop Environment
        this.windowManager = new WindowManager(this.worldContainer);
        const demoWindow = this.windowManager.createWindow("System Console", 200, 150, 400, 250);
        
        // 5.1 Initialize VM Monitor Tile (connects to vision_bridge.py)
        if (typeof VMMonitorTile !== 'undefined') {
            const vmMonitor = new VMMonitorTile("VM Monitor: Live Feed", 650, 150, 640, 430);
            this.worldContainer.addChild(vmMonitor);
            console.log("📺 VM Monitor Tile initialized.");
            
            // 5.2 Initialize WebGPU Native Boot Demo
            this.setupWebGPUDemo();
        }
        
        const demoText = new PIXI.Text("Welcome to Geometry OS.\n- Drag this window by its title bar.", {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xffffff,
            wordWrap: true,
            wordWrapWidth: 380,
        });
        demoWindow.setContent(demoText);

        // 11. Initialize In-Memory Virtual File System (VFS) for AI Agents
        this.vfs = {
            "/vfs/hello.py": "print('Hello from Pyodide VFS!')\ndef greet():\n    return 'Hello, Pyodide!'",
            "/vfs/test_dir/another.py": "import os\nprint(f'Current working dir: {os.getcwd()}')",
            "/vfs/README.md": "# Virtual File System for AI Agents\n\nThis is an in-memory VFS. Agents can read, write, and list files here.\n\n## Example Files\n- `/vfs/hello.py`: A simple Python script.\n- `/vfs/test_dir/another.py`: Another Python script.",
            "/vfs/config.json": "{\n    \"agent_name\": \"Alpha\",\n    \"version\": \"1.0\"\n}"
        };
        console.log("🗄️ In-memory VFS initialized for AI agents.");

        // Initialize Area Agent Subsystem
        this.initializeAreaAgentConnection();

        // 6. Initialize Managers
        this.viewport = new ViewportManager({
            target: this.app.view,
            initialX: 0, // Start at origin to see tiles
            initialY: 0,
            initialZoom: 1.0,
            websocketUrl: 'ws://127.0.0.1:8765' // Connect to Rust data daemon
        });

        // Phase 47: Tectonic Saccadic Optimization - Initialize all subsystems
        this.initializePhase47();

        this.chunkManager = new ChunkManager({
            chunkSize: this.config.chunkSize,
            apiEndpoint: 'http://localhost:8080/api/chunk' // Connect to Rust backend
        });

        this.tileManager = new TileSpriteManager({
            container: this.worldContainer,
            gridSize: this.config.gridSize
        });
        this.tileManager.initialize();

        this.cameraController = new CameraController(this.viewport, {
            panSpeed: 20
        });

        // 6. Initialize Layers
        if (this.config.enableAntigravity) {
            this.initializeCognitiveLayer();
        }


        // 7. Initialize Spatial Bootloader
        this.visualBootLoader = new VisualBootLoader(this.viewport, this.tileManager);

        // 7b. Initialize Python Transmutation (Phase 34.1)
        if (typeof PythonTransmutationLoader !== 'undefined') {
            this.pythonLoader = new PythonTransmutationLoader(this.infiniteMap || this);

            // Setup global drag-and-drop
            document.addEventListener('dragover', (e) => e.preventDefault());
            document.addEventListener('drop', async (e) => {
                e.preventDefault();
                const files = e.dataTransfer.files;
                if (files.length > 0) {
                    const rect = this.app.view.getBoundingClientRect();
                    const dropX = e.clientX - rect.left;
                    const dropY = e.clientY - rect.top;

                    // Convert screen to world coordinates using viewport
                    const worldPos = this.viewport.screenToWorld(dropX, dropY);

                    for (const file of files) {
                        try {
                            if (file.name.endsWith('.py')) {
                                await this.pythonLoader.handleDrop(file, { x: worldPos.x, y: worldPos.y });
                            }
                        } catch (err) {
                            console.error("Drop handling failed:", err);
                        }
                    }
                }
            });
            console.log('🐍 Python Transmutation Loader active');
        }

        // 7c. Create Mutation Canvas (AI Visual Programming Interface)
        // This answers the user's request to "see" the AI programming with pixels
        this.createMutationCanvas();

        // 7d. Initialize ACE Evolution Bridge
        this.integrateEvolutionBridge();

        // 8. Initialize InfiniteMap (manifest-based tile loading with LLM chat)
        if (typeof InfiniteMap !== 'undefined') {
            this.infiniteMap = new InfiniteMap(this.worldContainer, {
                gridSize: this.config.gridSize,
                manifestPath: '/builder/map/manifest.json',
                enableLLMChat: false
            });
            console.log('🗺️  InfiniteMap initialized with LLM chat support');

            // Phase 6: Create CPU controls
            this.infiniteMap.createCPUControls();

            // Phase 6: Setup drag-drop for brick files
            this.infiniteMap.setupDragDrop();

            // Phase 8: Initialize Linux Kernel Loader
            if (typeof LinuxKernelLoader !== 'undefined') {
                this.linuxKernelLoader = new LinuxKernelLoader(this.infiniteMap);
                this.linuxKernelLoader.loadKernel(2, 2); // Place at (2, 2) on the grid
                console.log('🐧 Linux Kernel Loader initialized and kernel tile placed');
            }

            // Phase 25.1: Initialize Morphological Workbench (Geometric IDE)
            if (typeof MorphologicalWorkbench !== 'undefined' && this.computeSystem) {
                // We use computeSystem's internal GPUExecutionSystem if available, 
                // or create a new one. For now, let's assume we need to pass a 
                // dictionary and a GPU device.

                const dictionary = new GeometricDictionary({ cacheVRAM: true });
                // We'll load the default codebook
                dictionary.loadFromManifest('geometric_codebook.json').then(() => {
                    const gpuExecution = new GPUExecutionSystem(this.app.renderer.device, dictionary);
                    this.workbench = new MorphologicalWorkbench(this.app, gpuExecution, dictionary);
                    this.worldContainer.addChild(this.workbench.container);

                    // Show it near the origin
                    this.workbench.show(200, 200);
                    console.log('🎨 Morphological Workbench (Geometric IDE) integrated');
                });
            }
        }

        // --- Neural City Renderer (P1 PIXI.js Layer) ---
        if (typeof NeuralCityRenderer !== 'undefined') {
            try {
                this.neuralCity = new NeuralCityRenderer({
                    app: this.app,
                    districtSize: 512,
                    maxCacheSize: 64
                });

                const neuralCityContainer = await this.neuralCity.initialize();

                // Add as overlay layer above tiles
                if (this.worldContainer) {
                    this.worldContainer.addChild(neuralCityContainer);
                }

                // Apply filter
                this.neuralCity.applyFilter();

                // Wire up telemetry events
                window.addEventListener('NEURAL_CITY_PULSE', (e) => {
                    this.neuralCity.addPulse(e.detail.x, e.detail.y, e.detail.timestamp, 0.0);
                });

                window.addEventListener('TECTONIC_DRIFT_UPDATE', (e) => {
                    if (e.detail && e.detail.data) {
                        // Decode base64 to Float32Array
                        const binaryString = atob(e.detail.data);
                        const bytes = new Uint8Array(binaryString.length);
                        for (let i = 0; i < binaryString.length; i++) {
                            bytes[i] = binaryString.charCodeAt(i);
                        }
                        const floatData = new Float32Array(bytes.buffer);
                        this.neuralCity.setDriftOffsets(floatData);
                    }
                });

                window.addEventListener('METABOLISM_UPDATE', (e) => {
                    this.neuralCity.updateMetabolism(e.detail);
                });

                window.addEventListener('QUARANTINE_UPDATE', (e) => {
                    if (e.detail) {
                        this.neuralCity.setQuarantineStatus(e.detail.dx, e.detail.dy, e.detail.quarantined);
                    }
                });

                console.log('✓ Neural City initialized and wired to TelemetryBus');
            } catch (err) {
                console.warn('Failed to initialize Neural City:', err.message);
            }
        }

        // 9. Start Render Loop
        this.app.ticker.add(this.update.bind(this));

        // 10. Bind Viewport Events
        this.viewport.on('move', () => this.onViewChange());
        this.viewport.on('zoom', () => this.onViewChange());
        this.viewport.on('resize', () => this.onViewChange());

        // 11. Initial load
        this.onViewChange();

        console.log("✅ Geometry OS initialized at Antigravity Prime");

        // 12. Initialize Pyodide for in-browser Python execution (AI Agent VFS prerequisite)
        console.log("🐍 Initializing Pyodide...");
        try {
            window.pyodide = await loadPyodide({
                indexURL: "https://cdn.jsdelivr.net/pyodide/v0.25.0/full/"
            });
            console.log("✅ Pyodide initialized.");

            // Redirect stdout/stderr to the console and a visible div
            const pyodideOutputDiv = document.getElementById('pyodide-output');
            if (pyodideOutputDiv) {
                // Clear initial content
                pyodideOutputDiv.innerHTML = '';
                pyodideOutputDiv.style.display = 'block'; // Make it visible

                window.pyodide.setStdout({
                    write: (text) => {
                        console.log("Pyodide stdout:", text);
                        pyodideOutputDiv.textContent += text;
                        pyodideOutputDiv.scrollTop = pyodideOutputDiv.scrollHeight;
                    }
                });
                window.pyodide.setStderr({
                    write: (text) => {
                        console.error("Pyodide stderr:", text);
                        pyodideOutputDiv.textContent += text;
                        pyodideOutputDiv.scrollTop = pyodideOutputDiv.scrollHeight;
                    }
                });
            } else {
                console.warn("Pyodide output div not found.");
            }

            // Expose a helper function to run Python code
            window.runPython = async (code) => {
                try {
                    return await window.pyodide.runPythonAsync(code);
                } catch (err) {
                    console.error("Error running Python in Pyodide:", err);
                    pyodideOutputDiv.textContent += `Error: ${err}\n`;
                    pyodideOutputDiv.scrollTop = pyodideOutputDiv.scrollHeight;
                    return null;
                }
            };

            // Register vfs_pyodide_bridge.js as a Pyodide module
            try {
                // Dynamically import the module
                const vfsModule = await import('./vfs_pyodide_bridge.js');
                if (vfsModule && vfsModule.vfs) {
                    window.pyodide.registerJsModule("js_vfs", vfsModule.vfs);
                    console.log("✅ Pyodide module 'js_vfs' (VFS bridge) registered.");
                } else {
                    console.warn("❌ Failed to load vfs_pyodide_bridge.js or its 'vfs' export.");
                }
            } catch (err) {
                console.error("❌ Error registering 'js_vfs' module with Pyodide:", err);
            }

        } catch (err) {
            console.error("❌ Failed to initialize Pyodide:", err);
            this.showNotification("Failed to load Pyodide. Python features unavailable.", 'error');
        }

        // Initialize Metabolism Dashboard (V13)
        if (typeof MetabolismDashboard !== 'undefined' && window.EvolutionSafetyBridge) {
            this.metabolismDashboard = new MetabolismDashboard({
                safetyBridge: window.EvolutionSafetyBridge,
                position: { x: 20, y: 310 },
                pollInterval: 3000
            });
            const metabolismContainer = this.metabolismDashboard.create();
            this.worldContainer.addChild(metabolismContainer);
            console.log('[GeometryOSApplication] Metabolism Dashboard initialized');
        }

        // Phase 26: Signal readiness for external modules (like PixelLang IDE)
        window.geometryOSApp = this;

        // --- WordPress Integration Bridge ---
        // Initialize MetricsCollector for health monitoring
        window.geometryOSMetrics = new MetricsCollector();

        window.geometryOS = {
            tileRegistry: new Map(),
            regions: {
                origin: { x: 0, y: 0, zoom: 1.0 },
                antigravity_prime: { x: 8192, y: 8192, zoom: 0.5 },
                neural_nursery: { x: 1024, y: 1024, zoom: 1.0 },
                system_console: { x: 2, y: 2, zoom: 2.0 },
                wordpress_zone: { x: 3200, y: 1200, zoom: 1.0 }
            },
            registerTile: (tileId, data) => {
                window.geometryOS.tileRegistry.set(tileId, data);
                window.dispatchEvent(new CustomEvent('geometryOS:registryUpdate', {
                    detail: { tileId, data, action: 'register' }
                }));
                // Update metrics tile count
                window.geometryOSMetrics.setTileCount(window.geometryOS.tileRegistry.size);
            },
            navigateTo: (tileId) => {
                const entry = window.geometryOS.tileRegistry.get(tileId);
                if (entry && this.viewport) {
                    const gridSize = this.config.gridSize || 100;
                    this.viewport.moveTo(entry.x * gridSize, entry.y * gridSize);
                    if (entry.zoom) this.viewport.zoomTo(entry.zoom);
                    
                    window.dispatchEvent(new CustomEvent('geometryOS:navigated', { 
                        detail: { tileId, x: entry.x, y: entry.y } 
                    }));
                    return true;
                }
                return false;
            },
            navigateToRegion: (regionId) => {
                const r = window.geometryOS.regions[regionId];
                if (r && this.viewport) {
                    const gridSize = this.config.gridSize || 100;
                    this.viewport.moveTo(r.x * gridSize, r.y * gridSize);
                    this.viewport.zoomTo(r.zoom || 1.0);
                    return true;
                }
                return false;
            },
            startTile: (tileId) => {
                const entry = window.geometryOS.tileRegistry.get(tileId);
                if (entry && this.neuralCity?.liveTileManager) {
                    this.neuralCity.liveTileManager.bootTile(tileId, entry.rtsPath || 'assets/alpine_v2.rts.png', entry.x, entry.y);
                    return true;
                }
                return false;
            },
            stopTile: (tileId) => {
                if (this.neuralCity?.liveTileManager) {
                    this.neuralCity.liveTileManager.stopTile(tileId);
                    return true;
                }
                return false;
            },
            restartTile: (tileId) => {
                const entry = window.geometryOS.tileRegistry.get(tileId);
                if (entry && this.neuralCity?.liveTileManager) {
                    this.neuralCity.liveTileManager.stopTile(tileId);
                    setTimeout(() => {
                        this.neuralCity.liveTileManager.bootTile(tileId, entry.rtsPath || 'assets/alpine_v2.rts.png', entry.x, entry.y);
                    }, 1000);
                    return true;
                }
                return false;
            },
            sendCommand: (tileId, command) => {
                if (this.neuralCity?.liveTileManager) {
                    // Start latency measurement
                    const measureId = `cmd-${tileId}-${Date.now()}`;
                    const t0 = window.geometryOSMetrics.startLatencyMeasure(measureId);

                    this.neuralCity.liveTileManager.sendCommand(tileId, command);

                    // Listen for first output to end latency measurement
                    const outputListener = (e) => {
                        if (e.detail.tileId === tileId) {
                            window.geometryOSMetrics.endLatencyMeasure(measureId, t0);
                            window.geometryOSMetrics.recordSync();
                            window.geometryOSMetrics.emitUpdate();
                            window.removeEventListener('geometryOS:consoleOutput', outputListener);
                        }
                    };
                    window.addEventListener('geometryOS:consoleOutput', outputListener);

                    return true;
                }
                return false;
            },
            broadcastCommand: (command) => {
                let count = 0;
                if (this.neuralCity?.liveTileManager) {
                    const tiles = this.neuralCity.liveTileManager.getAllTiles();
                    tiles.forEach((tile, id) => {
                        if (tile.state === 'running') {
                            this.neuralCity.liveTileManager.sendCommand(id, command);
                            count++;
                        }
                    });
                }
                return count;
            },
            getConsoleOutput: (tileId, limit = 5) => {
                if (this.neuralCity?.liveTileManager) {
                    const tile = this.neuralCity.liveTileManager.getTile(tileId);
                    if (tile && tile.consoleOutput) {
                        return tile.consoleOutput.slice(-limit).map(l => l.text);
                    }
                }
                return [];
            },
            getTiles: () => Array.from(window.geometryOS.tileRegistry.entries()).map(([id, data]) => ({ id, ...data })),
            // Metrics accessor
            get metrics() {
                return window.geometryOSMetrics;
            }
        };

        window.dispatchEvent(new CustomEvent('geometry-os-ready'));
    }

    initializeCognitiveLayer() {
        this.cognitiveLayer = new PIXI.Container();
        this.cognitiveLayer.zIndex = 1000;
        this.worldContainer.addChild(this.cognitiveLayer);

        // Draw Spire Placeholder
        const spire = new PIXI.Graphics();
        spire.lineStyle(20, 0x00FFFF, 0.5);
        spire.drawCircle(0, 0, 1024); // 1024px radius
        spire.beginFill(0x00FFFF, 0.1);
        spire.drawCircle(0, 0, 256);
        spire.endFill();

        // Position at Antigravity Prime
        spire.x = 8192 * 100;
        spire.y = 8192 * 100;

        this.cognitiveLayer.addChild(spire);

        // Add text
        const text = new PIXI.Text('ANTIGRAVITY PRIME', {
            fontFamily: 'Courier New',
            fontSize: 64,
            fill: 0x00FFFF,
            align: 'center'
        });
        text.anchor.set(0.5);
        text.x = 8192 * 100;
        text.y = 8192 * 100 - 400;
        this.cognitiveLayer.addChild(text);
    }

    /**
     * Phase 47: Tectonic Saccadic Optimization - Initialize all subsystems
     *
     * Initializes:
     * - TectonicSaccadicManager (main coordinator)
     * - VergenceController (binocular vision)
     * - PursuitController (smooth pursuit)
     * - MicrosaccadeDetector (visual stability)
     * - PerTileLOD (individual tile LOD)
     * - TemporalUpscaler (DLSS-like upscaling)
     * - HLODSystem (hierarchical clustering)
     * - SaccadicPresets (configuration presets)
     * - PresetSharing (preset import/export)
     */
    initializePhase47() {
        console.log('🎯 Phase 47: Tectonic Saccadic Optimization...');

        // Check if Phase 47 modules are available
        if (typeof TectonicSaccadicManager === 'undefined') {
            console.warn('⚠️ TectonicSaccadicManager not available - Phase 47 modules may not be loaded');
            return;
        }

        // Initialize main TectonicSaccadicManager
        window.tectonicManager = new TectonicSaccadicManager({
            viewport: this.viewport,
            gridSize: this.config.gridSize,
            enableSaccadic: true,
            enableSmoothLOD: true,
            enablePrefetch: true,
            enableQualityScaling: true,
            enableFocusTracking: true,
            enableVergence: true  // Phase 47 Advanced: Enable vergence
        });

        // Initialize VergenceController (binocular vision)
        if (typeof VergenceController !== 'undefined') {
            window.vergenceController = new VergenceController({
                eyeSeparation: 50,
                convergenceDistance: 500,
                enableStereo: false
            });
            console.log('👀 VergenceController initialized');
        }

        // Initialize PursuitController (smooth pursuit)
        if (typeof PursuitController !== 'undefined') {
            window.pursuitController = new PursuitController({
                maxVelocity: 1000,
                predictionEnabled: true,
                catchUpThreshold: 50
            });
            console.log('🎯 PursuitController initialized');
        }

        // Initialize MicrosaccadeDetector (visual stability)
        if (typeof MicrosaccadeDetector !== 'undefined') {
            window.microsaccadeDetector = new MicrosaccadeDetector({
                detectionThreshold: 5,
                compensationStrength: 0.8,
                tremorEnabled: true
            });
            console.log('🔍 MicrosaccadeDetector initialized');
        }

        // Initialize PerTileLOD (individual tile LOD)
        if (typeof PerTileLOD !== 'undefined') {
            window.perTileLOD = new PerTileLOD({
                tileSize: this.config.gridSize,
                maxLOD: 4,
                screenSpaceError: 2.0,
                focusBoost: 0.3
            });
            console.log('📐 PerTileLOD initialized');
        }

        // Initialize TemporalUpscaler (DLSS-like upscaling)
        if (typeof TemporalUpscaler !== 'undefined') {
            window.temporalUpscaler = new TemporalUpscaler({
                quality: 'balanced',
                frameCount: 4,
                motionVectors: true
            });
            console.log('⏱️ TemporalUpscaler initialized');
        }

        // Initialize HLODSystem (hierarchical clustering)
        if (typeof HLODSystem !== 'undefined') {
            window.hlodSystem = new HLODSystem({
                clusterSize: 4,
                cullDistance: 2000,
                autoGenerate: true
            });
            console.log('🗂️ HLODSystem initialized');
        }

        // Initialize SaccadicPresets (configuration presets)
        if (typeof SaccadicPresets !== 'undefined') {
            window.saccadicPresets = new SaccadicPresets();

            // Apply default preset
            const defaultPreset = 'balanced';
            window.saccadicPresets.applyPreset(defaultPreset, window.tectonicManager);
            console.log(`⚙️ SaccadicPresets initialized - applied: ${defaultPreset}`);
        }

        // Initialize PresetSharing (preset import/export)
        if (typeof PresetSharing !== 'undefined') {
            window.presetSharing = new PresetSharing();
            console.log('📦 PresetSharing initialized');
        }

        // Connect subsystems to main manager
        if (window.tectonicManager) {
            // Add update callback to render loop
            this.app.ticker.add((delta) => {
                window.tectonicManager.update();
            });

            // Bind viewport events
            this.viewport.on('move', () => {
                if (window.tectonicManager) {
                    window.tectonicManager.onViewportMove();
                }
            });

            this.viewport.on('zoom', () => {
                if (window.tectonicManager) {
                    window.tectonicManager.onViewportZoom();
                }
            });
        }

        console.log('✅ Phase 47: All subsystems initialized');
        console.log('📊 Available commands:');
        console.log('  - window.tectonicManager.getStats()');
        console.log('  - window.saccadicPresets.applyPreset("quality")');
        console.log('  - window.presetSharing.listAllPresets()');
        console.log('  - window.vergenceController.setFocalDepth(500)');
        console.log('  - window.pursuitController.trackTarget({x, y})');
    }

    update(delta) {
        // Run Native Substrate (CPU Tick)
        if (this.computeSystem) {
            this.computeSystem.tick();
        }

        // Smooth camera
        this.viewport.update(delta);

        // Sync world container with camera
        const camera = this.viewport.getCamera();
        const center = { x: this.app.screen.width / 2, y: this.app.screen.height / 2 };

        this.worldContainer.scale.set(camera.zoom);
        this.worldContainer.x = center.x - camera.x * camera.zoom;
        this.worldContainer.y = center.y - camera.y * camera.zoom;

        // Custom updates
        if (this.cognitiveLayer) {
            this.cognitiveLayer.alpha = 0.8 + Math.sin(Date.now() / 500) * 0.2;
        }

        // Update Bootloader
        if (this.visualBootLoader) {
            this.visualBootLoader.update();
        }

        // Update Memory Beams (Semantic Memory Visualization)
        if (this.memoryBeams) {
            this.memoryBeams.render(delta);
        }

        // Update Neural City Renderer - sync focus with viewport
        if (this.neuralCity) {
            this.neuralCity.tick(delta / 60);
            // Sync focus to camera center
            if (this.viewport) {
                const camera = this.viewport.getCamera();
                this.neuralCity.setFocus(camera.x, camera.y);
            }
        }

        // Update Heatmap Overlay (Visual Hotspot Debugger)
        if (this.heatmapOverlay) {
            this.heatmapOverlay.tick(delta / 16.67); // Normalize to ~60fps
        }
    }


    createMutationCanvas() {
        if (!this.windowManager) return;

        // Create a floating window for the "AI Brain"
        const mutationWindow = this.windowManager.createWindow("Neural Quine: Self-Hosting Evolution", 650, 150, 400, 400);

        // Create the visualization container
        const vizContainer = new PIXI.Container();

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000);
        bg.drawRect(0, 0, 380, 360);
        bg.endFill();
        vizContainer.addChild(bg);

        // The "Pixel Grid" - native canvas for real-time pixel manipulation
        const pixelCanvas = document.createElement('canvas');
        pixelCanvas.width = 32;
        pixelCanvas.height = 32;
        const pixelCtx = pixelCanvas.getContext('2d');
        const pixelTexture = new PIXI.Texture(new PIXI.BaseTexture(pixelCanvas));
        const pixelSprite = new PIXI.Sprite(pixelTexture);
        pixelSprite.x = 30;
        pixelSprite.y = 30;
        pixelSprite.width = 320;
        pixelSprite.height = 320;
        vizContainer.addChild(pixelSprite);

        // Status indicator
        const statusIndicator = new PIXI.Graphics();
        statusIndicator.beginFill(0xFFFF00); // Yellow = initializing
        statusIndicator.drawCircle(360, 20, 8);
        statusIndicator.endFill();
        vizContainer.addChild(statusIndicator);

        // HUD Text
        const hud = new PIXI.Text("INITIALIZING NEURAL QUINE...", {
            fontFamily: "Courier New",
            fontSize: 12,
            fill: 0x00FF00
        });
        hud.x = 30;
        hud.y = 10;
        vizContainer.addChild(hud);

        // Fitness meter
        const fitnessBar = new PIXI.Graphics();
        fitnessBar.x = 30;
        fitnessBar.y = 355;
        fitnessBar.lineStyle(1, 0x00FF00);
        fitnessBar.drawRect(0, 0, 320, 5);
        fitnessBar.beginFill(0x00FF00);
        fitnessBar.drawRect(0, 0, 0, 5);
        fitnessBar.endFill();
        vizContainer.addChild(fitnessBar);

        // Control buttons
        const startBtn = this.createEvolutionButton('START', 0x00FF00, 30, 368);
        const stopBtn = this.createEvolutionButton('STOP', 0xFF0000, 100, 368);
        const saveBtn = this.createEvolutionButton('SAVE', 0x0088FF, 170, 368);
        vizContainer.addChild(startBtn, stopBtn, saveBtn);

        // Initialize Engine
        let evolutionEngine = null;
        let isRunning = false;

        if (typeof VisualEvolutionEngine !== 'undefined') {
            evolutionEngine = new VisualEvolutionEngine({ gridSize: 32 });

            // Link to Pixel Canvas
            evolutionEngine.onEvolution((data) => {
                // Update Canvas
                pixelCtx.putImageData(data.imageData, 0, 0);
                pixelSprite.texture.update();

                // Update HUD
                hud.text = `GEN: ${data.generation} | FIT: ${Math.floor(data.fitness)}`;

                // Update Fitness Bar
                const width = Math.min(320, (data.fitness / 50000) * 320);
                fitnessBar.clear();
                fitnessBar.beginFill(0x00FF00);
                fitnessBar.drawRect(0, 0, width, 5);
                fitnessBar.endFill();

                // Update Status
                statusIndicator.clear();
                statusIndicator.beginFill(0x00FF00); // Green = Running
                statusIndicator.drawCircle(360, 20, 8);
                statusIndicator.endFill();
            });

            hud.text = 'READY: Waiting for signal...';
        } else {
            hud.text = 'ERROR: Engine Missing';
            statusIndicator.beginFill(0xFF0000);
            statusIndicator.drawCircle(360, 20, 8);
        }

        // Button handlers
        if (evolutionEngine) {
            startBtn.on('pointerdown', () => {
                if (!isRunning) {
                    isRunning = true;
                    evolutionEngine.start();
                    hud.text = 'EVOLUTION RUNNING...';
                }
            });

            stopBtn.on('pointerdown', () => {
                if (isRunning) {
                    isRunning = false;
                    evolutionEngine.stop();
                    hud.text = 'EVOLUTION PAUSED';
                    statusIndicator.beginFill(0xFFFF00);
                    statusIndicator.drawCircle(360, 20, 8);
                }
            });

            saveBtn.on('pointerdown', () => {
                if (evolutionEngine.bestOrganism) {
                    const dataUrl = evolutionEngine.saveOrganism(evolutionEngine.bestOrganism);
                    const link = document.createElement('a');
                    link.download = `evolved_gen_${evolutionEngine.generation}.rts.png`;
                    link.href = dataUrl;
                    link.click();
                    hud.text = 'SAVED TO DISK';
                }
            });

            // Cleanup on window destroy
            mutationWindow.onDestroy = () => {
                evolutionEngine.stop();
            };

            console.log("🧠 Neural Quine initialized - Self-hosting evolution active");
        }
    }

    createEvolutionButton(label, color, x, y) {
        const container = new PIXI.Container();
        container.x = x;
        container.y = y;
        container.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(color, 0.8);
        bg.lineStyle(1, 0xFFFFFF);
        bg.drawRoundedRect(0, 0, 60, 25, 5);
        bg.endFill();
        container.addChild(bg);

        const text = new PIXI.Text(label, {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0xFFFFFF,
            fontWeight: 'bold'
        });
        text.anchor.set(0.5);
        text.x = 30;
        text.y = 12;
        container.addChild(text);

        container.interactive = true;

        return container;
    }

    async transmute_and_place(source_code, language, x = 0, y = 0) {
        console.log(`Transmuting ${language} code...`);
        try {
            const response = await fetch('http://localhost:8080/api/transmute', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ code: source_code, language: language, cursor_x: x, cursor_y: y }),
            });

            const result = await response.json();

            if (result.success) {
                this.windowManager.createNotification(`Transmutation Success: ${result.message}`, 0x00FF00, 5000); // Green for success
                console.log("Transmutation successful:", result.artifact_path);
                if (result.artifact_path && typeof this.visualBootLoader !== 'undefined') {
                    this.visualBootLoader.loadArtifactAtPosition(result.artifact_path, result.x, result.y);
                }
            } else {
                this.windowManager.createNotification(`Transmutation Failed: ${result.message}`, 0xFF0000, 5000); // Red for failure
                console.error("Transmutation failed:", result.message);
            }
        } catch (error) {
            this.windowManager.createNotification(`Transmutation Error: ${error.message}`, 0xFF0000, 5000); // Red for error
            console.error("Error during transmutation API call:", error);
        }
    }

    async onViewChange() {

        const bounds = this.viewport.getVisibleBoundsWithPadding(1.2);

        // 1. Calculate needed chunks
        const neededChunks = this.chunkManager.getChunksForViewport(bounds);

        // 2. Load them (async)
        // For now, we just log. In real impl, we call load
        // await this.chunkManager.loadChunks(neededChunks);

        // 3. Update Visuals
        // Here we would get visible tiles from chunks and tell tileManager to render them
        // const visibleTiles = this.chunkManager.getVisibleTiles(bounds);
        // this.tileManager.updateVisibleTiles(visibleTiles);

        // MOCK: Generate tiles around Antigravity Prime
        // If we are near 8192, 8192, show some dummy tiles
        if (this.viewport.isVisible(819200, 819200)) {
            // Draw a grid pattern
            const mockTiles = [];
            const cx = 8192;
            const cy = 8192;
            for (let x = cx - 5; x <= cx + 5; x++) {
                for (let y = cy - 5; y <= cy + 5; y++) {
                    mockTiles.push({
                        x: x,
                        y: y,
                        brick: 'system_core',
                        timestamp: Date.now()
                    });
                }
            }
            // this.tileManager.updateVisibleTiles(mockTiles); 
        }

        // 4. Prune
        this.chunkManager.pruneChunks(bounds);
    }

    // ---------------------------------------------------------
    // OPTION B: INFINITE MAP RENDER BRIDGE
    // ---------------------------------------------------------
    integrateEvolutionBridge() {
        console.log("🌉 Initializing Evolution -> Infinite Map Bridge...");

        // Nursery Coordinates: Where new code is born
        // Let's place it at (1024, 1024) - visible but distinct from Antigravity Prime
        const NURSERY_X = 1024;
        const NURSERY_Y = 1024;

        // Create a visual marker for the "Vat" or "Nursery"
        const nurseryMarker = new PIXI.Graphics();
        nurseryMarker.lineStyle(2, 0x00FF00); // Green for growth
        nurseryMarker.drawRect(0, 0, 320, 320); // 10x scale of 32x32
        nurseryMarker.x = NURSERY_X * this.config.gridSize; // World coordinates
        nurseryMarker.y = NURSERY_Y * this.config.gridSize;

        // Label
        const label = new PIXI.Text("NEURAL NURSERY\n(Evolution Active)", {
            fontFamily: "Courier New",
            fontSize: 24,
            fill: 0x00FF00
        });
        label.y = -40;
        nurseryMarker.addChild(label);

        this.worldContainer.addChild(nurseryMarker);

        // Listen to the Northbound Bus
        window.addEventListener('ace-telemetry', (e) => {
            const detail = e.detail;

            if (detail.type === 'EVOLUTION_UPDATE' && detail.data.imageData) {
                // RENDER TO MAP
                this.renderOrganismToMap(detail.data.imageData, NURSERY_X, NURSERY_Y);
            }
        });
    }

    renderOrganismToMap(imageData, gridX, gridY) {
        // Create a texture from the ImageData
        const canvas = document.createElement('canvas');
        canvas.width = imageData.width;
        canvas.height = imageData.height;
        const ctx = canvas.getContext('2d');
        ctx.putImageData(imageData, 0, 0);

        const texture = PIXI.Texture.from(canvas);

        // Check if sprite exists, update it; otherwise create new
        // Ideally we use TileManager, but for this direct bridge, we manage the nursery sprite directly
        if (!this.nurserySprite) {
            this.nurserySprite = new PIXI.Sprite(texture);
            this.nurserySprite.x = gridX * this.config.gridSize;
            this.nurserySprite.y = gridY * this.config.gridSize;
            this.nurserySprite.width = 320; // Scale up for visibility
            this.nurserySprite.height = 320;
            this.worldContainer.addChild(this.nurserySprite);
        } else {
            this.nurserySprite.texture = texture;
        }
    }

    // ---------------------------------------------------------
    // AREA AGENT INTEGRATION
    // ---------------------------------------------------------

    initializeAreaAgentConnection() {
        console.log("🤝 Initializing Area Agent connection...");
        
        try {
            this.areaAgentSocket = new WebSocket('ws://localhost:8765');

            this.areaAgentSocket.onopen = () => {
                console.log("✅ Area Agent WebSocket connection established.");
                // Create goal panel
                this.createGoalPanel();
            };

            this.areaAgentSocket.onmessage = (event) => {
                try {
                    const message = JSON.parse(event.data);
                    switch (message.type) {
                        case 'state_update':
                            this.handleAgentStateUpdate(message.agent_state);
                            break;
                        case 'autonomous_action':
                            this.handleAgentAutonomousAction(message);
                            break;
                        case 'perception_request':
                            this.sendMapPerception(message.agent_id);
                            break;
                        case 'agent_communication':
                            this.handleAgentCommunication(message);
                            break;
                        case 'agent_to_agent_message':
                            // Echo back to server for routing to target agent
                            this.areaAgentSocket.send(JSON.stringify(message));
                            break;
                        case 'agent_broadcast':
                            // Echo broadcast to server for routing to all agents
                            this.areaAgentSocket.send(JSON.stringify(message));
                            break;
                        case 'goal_update':
                            this.handleGoalUpdate(message.goal);
                            break;
                        case 'world_state':
                            this.restoreWorldState(message.state);
                            break;
                        case 'save_result':
                            console.log(`💾 ${message.message}`);
                            if (this.goalPanel) {
                                this.showNotification(message.message, message.success ? 'success' : 'error');
                            }
                            break;
                        case 'world_cleared':
                            this.clearWorldVisuals();
                            break;
                        // VFS (Virtual File System) handlers
                        case 'vfs_file_content':
                            this.handleFileContent(message);
                            break;
                        case 'vfs_file_list':
                            this.handleFileList(message);
                            break;
                        case 'vfs_search_results':
                            this.handleSearchResults(message);
                            break;
                        case 'vfs_codebase_summary':
                            this.handleCodebaseSummary(message);
                            break;
                        case 'vfs_write_result':
                            if (message.success) {
                                this.showNotification(`✅ Saved: ${message.path}`, 'success');
                            } else {
                                this.showNotification(`❌ Error: ${message.error}`, 'error');
                            }
                            break;
                        case 'vfs_modification_history':
                            this.handleModificationHistory(message);
                            break;
                    }
                } catch (e) {
                    console.error("Error parsing agent message:", e);
                }
            };

            this.areaAgentSocket.onclose = () => {
                console.log("🔴 Area Agent WebSocket connection closed. Retrying in 3s...");
                // Clean up visuals for all agents
                this.areaAgents.forEach(agent => this.removeAgentVisuals(agent.id));
                this.areaAgents.clear();
                setTimeout(() => this.initializeAreaAgentConnection(), 3000);
            };

            this.areaAgentSocket.onerror = (error) => {
                console.error("- Area Agent WebSocket error:", error);
                // The onclose event will likely fire next, triggering the retry logic.
            };
        } catch (e) {
            console.error("Could not create WebSocket for Area Agent:", e);
        }
    }

    handleAgentStateUpdate(state) {
        if (!this.areaAgents.has(state.id)) {
            // First time seeing this agent, create its container
            const agentContainer = new PIXI.Container();
            agentContainer.x = state.position.x;
            agentContainer.y = state.position.y;
            this.worldContainer.addChild(agentContainer);

            const agentGraphics = new PIXI.Graphics();
            const agentTextName = new PIXI.Text('', { fontFamily: 'Courier New', fontSize: 16, fill: 0xffffff, fontWeight: 'bold' });
            const agentTextRole = new PIXI.Text('', { fontFamily: 'Courier New', fontSize: 11, fill: 0x888888 });
            const agentTextLog = new PIXI.Text('', { fontFamily: 'Courier New', fontSize: 11, fill: 0x00ffff, wordWrap: true, wordWrapWidth: 340 });
            const agentTextStreaming = new PIXI.Text('', { fontFamily: 'Courier New', fontSize: 12, fill: 0x90EE90, wordWrap: true, wordWrapWidth: 340 });

            agentContainer.addChild(agentGraphics, agentTextName, agentTextRole, agentTextLog, agentTextStreaming);

            agentContainer.interactive = true;
            agentContainer.cursor = 'pointer';

            // Click handler - show/focus input overlay
            agentContainer.on('pointerdown', () => {
                if (this.activeAgentId === state.id && this.agentInputOverlay?.style.display === 'block') {
                    // Already open for this agent - just focus input
                    document.getElementById('agent-input-field')?.focus();
                } else {
                    this.showAgentInputOverlay(state.id, state.name, agentContainer.x, agentContainer.y);
                }
            });

            this.areaAgents.set(state.id, {
                id: state.id,
                container: agentContainer,
                graphics: agentGraphics,
                textName: agentTextName,
                textRole: agentTextRole,
                textLog: agentTextLog,
                textStreaming: agentTextStreaming,
                color: state.color || 0x4488FF
            });
        }

        const agent = this.areaAgents.get(state.id);

        // Update position
        agent.container.x = state.position.x;
        agent.container.y = state.position.y;
        agent.color = state.color || agent.color;

        // Update visuals based on state
        const g = agent.graphics;
        g.clear();

        // Use agent's unique color, adjust based on status
        let borderColor = agent.color;
        let glowAlpha = 0;
        let pulseScale = 1;

        if (state.status === 'thinking') {
            glowAlpha = 0.4;
            pulseScale = 1 + Math.sin(Date.now() / 200) * 0.02; // Subtle pulse
        }
        if (state.status === 'responding') {
            glowAlpha = 0.6;
            pulseScale = 1 + Math.sin(Date.now() / 100) * 0.03; // Faster pulse
        }

        // Glow effect for active states
        if (glowAlpha > 0) {
            g.beginFill(borderColor, glowAlpha);
            g.drawRoundedRect(-6, -6, 362, 222, 14);
            g.endFill();
        }

        // Main card
        g.lineStyle(2, borderColor, 1);
        g.beginFill(0x0d0d15, 0.95);
        g.drawRoundedRect(0, 0, 350, 210, 10);
        g.endFill();

        // Color accent bar at top
        g.beginFill(borderColor, 0.8);
        g.drawRoundedRect(0, 0, 350, 4, 10);
        g.endFill();

        // Update text
        agent.textName.text = state.name;
        agent.textName.x = 12;
        agent.textName.y = 14;

        // Role subtitle
        agent.textRole.text = state.role || 'Agent';
        agent.textRole.x = 12;
        agent.textRole.y = 34;

        // Conversation log
        const logText = state.log.slice(-3).map(l => `[${l.source}] ${l.text}`).join('\n');
        agent.textLog.text = logText;
        agent.textLog.x = 12;
        agent.textLog.y = 55;

        // Show streaming response if available
        if (state.current_response && state.current_response.length > 0) {
            agent.textStreaming.text = `💭 ${state.current_response}`;
            agent.textStreaming.x = 12;
            agent.textStreaming.y = 130;
            agent.textStreaming.visible = true;
        } else {
            agent.textStreaming.visible = false;
        }

        // Update input overlay status if this is the active agent
        if (this.activeAgentId === state.id) {
            switch (state.status) {
                case 'thinking':
                    this.updateAgentInputStatus('🧠 Thinking...', 'thinking');
                    break;
                case 'responding':
                    this.updateAgentInputStatus(`💬 ${state.current_response || ''}`, 'responding');
                    break;
                case 'idle':
                    this.updateAgentInputStatus('✅ Ready', 'normal');
                    break;
            }
        }
    }

    sendAgentCommand(agentId, commandPayload) {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                agent_id: agentId,
                ...commandPayload
            }));
        } else {
            console.warn("Cannot send command, Area Agent socket is not open.");
        }
    }

    // ---------------------------------------------------------
    // AUTONOMOUS AGENT ACTIONS
    // ---------------------------------------------------------

    handleAgentAutonomousAction(message) {
        const { agent_id, action, params } = message;
        console.log(`🤖 Agent '${agent_id}' autonomous action: ${action}`);

        switch (action) {
            case 'draw_rect':
                this.agentDrawRect(agent_id, params);
                break;
            case 'place_text':
                this.agentPlaceText(agent_id, params);
                break;
            case 'draw_line':
                this.agentDrawLine(agent_id, params);
                break;
            case 'move_to':
                this.agentMoveSelf(agent_id, params);
                break;
            case 'create_sprite':
                this.agentCreateSprite(agent_id, params);
                break;
            case 'log_thought':
                this.agentLogThought(agent_id, params);
                break;
        }
    }

    // ---------------------------------------------------------
    // AGENT-TO-AGENT COMMUNICATION
    // ---------------------------------------------------------

    handleAgentCommunication(message) {
        const { from_agent, to_agent, message_type, content, from_position } = message;

        // Log the communication
        console.log(`💬 ${from_agent} → ${to_agent}: ${message_type}`);

        // Visualize the communication on the map
        this.visualizeAgentCommunication(from_agent, to_agent, message_type, from_position);

        // Record as activity
        this.recordActivity('agent_communication', {
            from_agent,
            to_agent,
            message_type,
            content
        });
    }

    visualizeAgentCommunication(fromAgent, toAgent, messageType, fromPosition) {
        if (!this.drawingLayer) return;

        // Get positions
        const fromPos = fromPosition || (this.areaAgents.get(fromAgent)?.container);
        const toAgentData = this.areaAgents.get(toAgent);
        const toPos = toAgentData?.container;

        if (!fromPos || !toPos) return;

        // Create a fading communication line
        const commLine = new PIXI.Graphics();
        commLine.lineStyle(2, 0xFFFF00, 0.8);
        commLine.moveTo(fromPos.x + 175, fromPos.y + 105); // Center of agent card
        commLine.lineTo(toPos.x + 175, toPos.y + 105);

        // Add a message bubble at midpoint
        const midX = (fromPos.x + toPos.x) / 2 + 175;
        const midY = (fromPos.y + toPos.y) / 2 + 105;

        const bubble = new PIXI.Graphics();
        bubble.beginFill(0xFFFF00, 0.9);
        bubble.drawRoundedRect(midX - 40, midY - 12, 80, 24, 12);
        bubble.endFill();

        const iconMap = {
            'request_security': '🔒',
            'request_design': '📐',
            'request_implementation': '⚡',
            'analyze_performance': '📊',
            'design_complete': '✅',
            'implementation_complete': '✅',
            'security_complete': '🛡️',
            'analysis_result': '📈',
            'acknowledged': '👍'
        };

        const bubbleText = new PIXI.Text(iconMap[message_type] || '💬', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x000000
        });
        bubbleText.x = midX - 35;
        bubbleText.y = midY - 8;

        this.drawingLayer.addChild(commLine);
        this.drawingLayer.addChild(bubble);
        this.drawingLayer.addChild(bubbleText);

        // Fade out after 2 seconds
        const fadeOut = () => {
            const startAlpha = commLine.alpha;
            const fade = () => {
                commLine.alpha -= 0.05;
                bubble.alpha -= 0.05;
                bubbleText.alpha -= 0.05;
                if (commLine.alpha > 0) {
                    requestAnimationFrame(fade);
                } else {
                    this.drawingLayer.removeChild(commLine);
                    this.drawingLayer.removeChild(bubble);
                    this.drawingLayer.removeChild(bubbleText);
                    commLine.destroy();
                    bubble.destroy();
                    bubbleText.destroy();
                }
            };
            setTimeout(fade, 2000);
        };
        fadeOut();
    }

    agentDrawRect(agentId, params) {
        const { x, y, width, height, color, fill } = params;
        if (!this.drawingLayer) return;

        const rect = new PIXI.Graphics();

        // Fill
        if (fill) {
            rect.beginFill(color || 0xFFFFFF, 0.6);
        } else {
            rect.beginFill(0x000000, 0);
        }

        rect.lineStyle(2, color || 0xFFFFFF, 1);
        rect.drawRoundedRect(x, y, width || 100, height || 50, 5);
        rect.endFill();

        this.drawingLayer.addChild(rect);

        // Store reference for potential removal
        if (!this.agentDrawings) this.agentDrawings = new Map();
        if (!this.agentDrawings.has(agentId)) this.agentDrawings.set(agentId, []);
        this.agentDrawings.get(agentId).push(rect);

        // Record activity for perception
        this.recordActivity('draw_rect', { agent_id: agentId, x, y, width, height });

        console.log(`📐 Agent ${agentId} drew rect at (${x}, ${y})`);
    }

    agentPlaceText(agentId, params) {
        const { x, y, text, color, size } = params;
        if (!this.drawingLayer) return;

        const textObj = new PIXI.Text(text || '', {
            fontFamily: 'Courier New',
            fontSize: size || 14,
            fill: color || 0xFFFFFF,
            wordWrap: true,
            wordWrapWidth: 300
        });
        textObj.x = x;
        textObj.y = y;

        this.drawingLayer.addChild(textObj);

        if (!this.agentDrawings) this.agentDrawings = new Map();
        if (!this.agentDrawings.has(agentId)) this.agentDrawings.set(agentId, []);
        this.agentDrawings.get(agentId).push(textObj);

        this.recordActivity('place_text', { agent_id: agentId, x, y, text });

        console.log(`📝 Agent ${agentId} placed text at (${x}, ${y})`);
    }

    agentDrawLine(agentId, params) {
        const { x1, y1, x2, y2, color, width } = params;
        if (!this.drawingLayer) return;

        const line = new PIXI.Graphics();
        line.lineStyle(width || 2, color || 0xFFFFFF, 1);
        line.moveTo(x1, y1);
        line.lineTo(x2, y2);

        this.drawingLayer.addChild(line);

        if (!this.agentDrawings) this.agentDrawings = new Map();
        if (!this.agentDrawings.has(agentId)) this.agentDrawings.set(agentId, []);
        this.agentDrawings.get(agentId).push(line);

        this.recordActivity('draw_line', { agent_id: agentId, x1, y1, x2, y2 });

        console.log(`📏 Agent ${agentId} drew line from (${x1}, ${y1}) to (${x2}, ${y2})`);
    }

    agentMoveSelf(agentId, params) {
        const { x, y } = params;
        if (this.areaAgents.has(agentId)) {
            const agent = this.areaAgents.get(agentId);
            const oldX = agent.container.x;
            const oldY = agent.container.y;
            agent.container.x = x;
            agent.container.y = y;

            this.recordActivity('move', { agent_id: agentId, from: { x: oldX, y: oldY }, to: { x, y } });

            console.log(`🚶 Agent ${agentId} moved to (${x}, ${y})`);
        }
    }

    agentCreateSprite(agentId, params) {
        const { x, y, texture, scale } = params;
        // Simplified sprite creation - creates a colored circle as placeholder
        if (!this.drawingLayer) return;

        const sprite = new PIXI.Graphics();
        const colors = {
            'node': 0x4488FF,
            'data': 0x00FF88,
            'warning': 0xFFAA00,
            'error': 0xFF4444
        };
        sprite.beginFill(colors[texture] || 0xFFFFFF, 0.8);
        sprite.drawCircle(0, 0, (scale || 1) * 20);
        sprite.endFill();
        sprite.x = x;
        sprite.y = y;

        this.drawingLayer.addChild(sprite);

        if (!this.agentDrawings) this.agentDrawings = new Map();
        if (!this.agentDrawings.has(agentId)) this.agentDrawings.set(agentId, []);
        this.agentDrawings.get(agentId).push(sprite);

        this.recordActivity('create_sprite', { agent_id: agentId, x, y, texture });

        console.log(`🎨 Agent ${agentId} created sprite at (${x}, ${y})`);
    }

    agentLogThought(agentId, params) {
        const { thought } = params;
        if (this.areaAgents.has(agentId)) {
            const agent = this.areaAgents.get(agentId);
            // Add thought to agent's log for visualization
            console.log(`💭 [${agentId}]: ${thought}`);
        }
    }

    sendMapPerception(agentId) {
        // Get the requesting agent's position for spatial queries
        const agent = this.areaAgents.get(agentId);
        const agentX = agent ? agent.container.x : 0;
        const agentY = agent ? agent.container.y : 0;
        const perceptionRadius = 500; // How far the agent can "see"

        // Gather detailed drawings data
        const drawings = [];
        if (this.agentDrawings) {
            this.agentDrawings.forEach((agentDrawings, creatorId) => {
                agentDrawings.forEach(drawing => {
                    // Get position from various PIXI object types
                    let x = drawing.x || drawing.getBounds?.()?.x || 0;
                    let y = drawing.y || drawing.getBounds?.()?.y || 0;
                    let type = 'unknown';

                    if (drawing.text !== undefined) type = 'text';
                    else if (drawing.geometry?.graphicsData?.length > 0) {
                        const gd = drawing.geometry.graphicsData[0];
                        if (gd.shape?.radius !== undefined) type = 'circle';
                        else if (gd.shape?.width !== undefined) type = 'rect';
                        else type = 'graphics';
                    }

                    // Check if within perception radius
                    const dist = Math.sqrt((x - agentX) ** 2 + (y - agentY) ** 2);
                    if (dist <= perceptionRadius) {
                        drawings.push({
                            creator: creatorId,
                            type,
                            x, y,
                            distance: Math.round(dist)
                        });
                    }
                });
            });
        }

        // Gather agent states (what other agents are doing)
        const agentStates = Array.from(this.areaAgents.entries()).map(([id, a]) => ({
            id,
            name: a.textName?.text || id,
            role: a.textRole?.text || 'Agent',
            position: { x: a.container.x, y: a.container.y },
            color: a.color,
            status: a.status || 'idle',
            distance: Math.round(Math.sqrt(
                (a.container.x - agentX) ** 2 + (a.container.y - agentY) ** 2
            ))
        }));

        // Recent activity tracking (for reactivity)
        if (!this.recentActivity) this.recentActivity = [];
        const recentActivity = this.recentActivity.slice(-10);

        // Count elements by type
        const drawingCounts = {
            total: drawings.length,
            by_type: drawings.reduce((acc, d) => {
                acc[d.type] = (acc[d.type] || 0) + 1;
                return acc;
            }, {}),
            by_creator: drawings.reduce((acc, d) => {
                acc[d.creator] = (acc[d.creator] || 0) + 1;
                return acc;
            }, {})
        };

        const perception = {
            type: 'perception_response',
            agent_id: agentId,
            perception: {
                // Self awareness
                self: {
                    position: { x: agentX, y: agentY }
                },
                // Other agents
                agents: agentStates,
                // Visible drawings
                drawings: drawings.slice(0, 50), // Limit to prevent overload
                drawing_counts: drawingCounts,
                // Recent changes
                recent_activity: recentActivity,
                // Viewport
                viewport: this.viewport ? {
                    x: this.viewport.viewport?.x || 0,
                    y: this.viewport.viewport?.y || 0,
                    scale: this.viewport.viewport?.scale?.x || 1
                } : null,
                // Metadata
                perception_radius: perceptionRadius,
                timestamp: Date.now()
            }
        };

        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify(perception));
        }
    }

    // Track recent activity for agent perception
    recordActivity(type, data) {
        if (!this.recentActivity) this.recentActivity = [];
        this.recentActivity.push({
            type,
            ...data,
            timestamp: Date.now()
        });
        // Keep last 50 activities
        if (this.recentActivity.length > 50) {
            this.recentActivity = this.recentActivity.slice(-50);
        }
    }

    clearAgentDrawings(agentId) {
        if (this.agentDrawings && this.agentDrawings.has(agentId)) {
            const drawings = this.agentDrawings.get(agentId);
            drawings.forEach(d => {
                if (d.parent) d.parent.removeChild(d);
                d.destroy();
            });
            this.agentDrawings.delete(agentId);
        }
    }

    // ---------------------------------------------------------
    // AGENT INPUT OVERLAY
    // ---------------------------------------------------------

    createAgentInputOverlay() {
        // Create overlay container if it doesn't exist
        if (this.agentInputOverlay) return;

        const overlay = document.createElement('div');
        overlay.id = 'agent-input-overlay';
        overlay.style.cssText = `
            position: fixed;
            z-index: 10000;
            display: none;
            background: rgba(20, 20, 35, 0.95);
            border: 2px solid #4488FF;
            border-radius: 12px;
            padding: 16px;
            box-shadow: 0 8px 32px rgba(0, 100, 255, 0.3);
            min-width: 320px;
            font-family: 'Courier New', monospace;
        `;

        // Header
        const header = document.createElement('div');
        header.style.cssText = `
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            color: #fff;
            font-size: 14px;
        `;
        header.innerHTML = `
            <span id="agent-overlay-title">Agent Chat</span>
            <button id="agent-overlay-close" style="
                background: transparent;
                border: 1px solid #666;
                color: #888;
                cursor: pointer;
                font-size: 16px;
                padding: 2px 8px;
                border-radius: 4px;
            ">×</button>
        `;

        // Input area
        const inputArea = document.createElement('div');
        inputArea.style.cssText = `display: flex; gap: 8px;`;

        const input = document.createElement('input');
        input.type = 'text';
        input.id = 'agent-input-field';
        input.placeholder = 'Type your message...';
        input.style.cssText = `
            flex: 1;
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid #444;
            color: #00ffff;
            padding: 10px 14px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            outline: none;
        `;

        const sendBtn = document.createElement('button');
        sendBtn.id = 'agent-send-btn';
        sendBtn.textContent = 'Send';
        sendBtn.style.cssText = `
            background: linear-gradient(135deg, #4488FF, #00FF88);
            border: none;
            color: #000;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
        `;

        inputArea.appendChild(input);
        inputArea.appendChild(sendBtn);

        // Status indicator
        const status = document.createElement('div');
        status.id = 'agent-status';
        status.style.cssText = `
            margin-top: 10px;
            font-size: 12px;
            color: #888;
        `;
        status.textContent = 'Ready';

        overlay.appendChild(header);
        overlay.appendChild(inputArea);
        overlay.appendChild(status);
        document.body.appendChild(overlay);

        this.agentInputOverlay = overlay;

        // Event handlers
        document.getElementById('agent-overlay-close').addEventListener('click', () => {
            this.hideAgentInputOverlay();
        });

        sendBtn.addEventListener('click', () => {
            this.sendAgentMessage();
        });

        input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.sendAgentMessage();
            }
        });

        // Close on click outside (using mousedown for better UX)
        const closeHandler = (e) => {
            if (overlay.style.display === 'block' && !overlay.contains(e.target)) {
                // Check if click is on canvas (not on an agent tile)
                const canvas = document.querySelector('canvas');
                if (canvas && canvas.contains(e.target)) {
                    // Click was on canvas - check if it's on an agent tile by position
                    // For simplicity, just hide the overlay on canvas clicks
                    this.hideAgentInputOverlay();
                } else if (!overlay.contains(e.target)) {
                    this.hideAgentInputOverlay();
                }
            }
        };
        document.addEventListener('mousedown', closeHandler);
    }

    showAgentInputOverlay(agentId, agentName, x, y) {
        this.createAgentInputOverlay();
        this.activeAgentId = agentId;

        // Update title
        document.getElementById('agent-overlay-title').textContent = `💬 ${agentName}`;

        // Position near the agent tile (convert world coords to screen)
        const screenPos = this.worldToScreen(x, y + 260); // Below the agent tile

        const overlay = this.agentInputOverlay;
        overlay.style.left = `${Math.min(screenPos.x, window.innerWidth - 360)}px`;
        overlay.style.top = `${Math.min(screenPos.y, window.innerHeight - 150)}px`;
        overlay.style.display = 'block';

        // Focus input
        setTimeout(() => {
            document.getElementById('agent-input-field').focus();
        }, 50);
    }

    hideAgentInputOverlay() {
        if (this.agentInputOverlay) {
            this.agentInputOverlay.style.display = 'none';
        }
        this.activeAgentId = null;
    }

    // ─────────────────────────────────────────────────────────────
    // GOAL MANAGEMENT UI
    // ─────────────────────────────────────────────────────────────

    createGoalPanel() {
        if (this.goalPanel) return;

        const panel = document.createElement('div');
        panel.id = 'goal-panel';
        panel.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            background: rgba(15, 15, 30, 0.95);
            border: 2px solid #00FF88;
            border-radius: 12px;
            padding: 16px;
            min-width: 300px;
            max-width: 400px;
            font-family: 'Courier New', monospace;
            box-shadow: 0 8px 32px rgba(0, 255, 136, 0.2);
        `;

        // Header
        const header = document.createElement('div');
        header.style.cssText = `
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            color: #00FF88;
            font-size: 16px;
            font-weight: bold;
        `;
        header.innerHTML = `
            <span>🎯 Goal Director</span>
            <button id="goal-panel-toggle" style="
                background: transparent;
                border: 1px solid #666;
                color: #888;
                cursor: pointer;
                font-size: 14px;
                padding: 2px 8px;
                border-radius: 4px;
            ">−</button>
        `;

        // Goal input
        const goalInput = document.createElement('div');
        goalInput.id = 'goal-input-section';
        goalInput.innerHTML = `
            <input type="text" id="goal-input-field" placeholder="Enter a goal for the agents..."
                style="
                    width: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    border: 1px solid #444;
                    color: #00FF88;
                    padding: 10px;
                    border-radius: 8px;
                    font-family: 'Courier New', monospace;
                    font-size: 13px;
                    outline: none;
                    box-sizing: border-box;
                ">
            <button id="goal-submit-btn" style="
                width: 100%;
                margin-top: 8px;
                background: linear-gradient(135deg, #00FF88, #4488FF);
                border: none;
                color: #000;
                padding: 10px;
                border-radius: 8px;
                cursor: pointer;
                font-weight: bold;
                font-size: 13px;
            ">🚀 Deploy Goal</button>
            <div style="display: flex; gap: 8px; margin-top: 8px;">
                <button id="save-world-btn" style="
                    flex: 1;
                    background: rgba(68, 136, 255, 0.3);
                    border: 1px solid #4488FF;
                    color: #4488FF;
                    padding: 8px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 12px;
                ">💾 Save</button>
                <button id="load-world-btn" style="
                    flex: 1;
                    background: rgba(255, 170, 0, 0.3);
                    border: 1px solid #FFAA00;
                    color: #FFAA00;
                    padding: 8px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 12px;
                ">📂 Load</button>
                <button id="clear-world-btn" style="
                    flex: 1;
                    background: rgba(255, 68, 68, 0.3);
                    border: 1px solid #FF4444;
                    color: #FF4444;
                    padding: 8px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 12px;
                ">🗑️ Clear</button>
            </div>
            <div style="display: flex; gap: 8px; margin-top: 8px;">
                <button id="code-panel-btn" style="
                    flex: 1;
                    background: rgba(255, 136, 255, 0.3);
                    border: 1px solid #FF88FF;
                    color: #FF88FF;
                    padding: 8px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 12px;
                ">📝 Code</button>
            </div>
        `;

        // Active goals list
        const goalsList = document.createElement('div');
        goalsList.id = 'active-goals-list';
        goalsList.style.cssText = `
            margin-top: 12px;
            max-height: 200px;
            overflow-y: auto;
        `;

        panel.appendChild(header);
        panel.appendChild(goalInput);
        panel.appendChild(goalsList);
        document.body.appendChild(panel);

        this.goalPanel = panel;
        this.activeGoals = new Map();

        // Event handlers
        document.getElementById('goal-panel-toggle').addEventListener('click', () => {
            const inputSection = document.getElementById('goal-input-section');
            const list = document.getElementById('active-goals-list');
            const btn = document.getElementById('goal-panel-toggle');
            if (inputSection.style.display === 'none') {
                inputSection.style.display = 'block';
                list.style.display = 'block';
                btn.textContent = '−';
            } else {
                inputSection.style.display = 'none';
                list.style.display = 'none';
                btn.textContent = '+';
            }
        });

        document.getElementById('goal-submit-btn').addEventListener('click', () => {
            this.submitGoal();
        });

        document.getElementById('goal-input-field').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.submitGoal();
            }
        });

        // Persistence buttons
        document.getElementById('save-world-btn').addEventListener('click', () => {
            this.saveWorld();
        });

        document.getElementById('load-world-btn').addEventListener('click', () => {
            this.loadWorld();
        });

        document.getElementById('clear-world-btn').addEventListener('click', () => {
            if (confirm('Clear all artifacts from the world?')) {
                this.clearWorld();
            }
        });

        // Code panel button
        document.getElementById('code-panel-btn').addEventListener('click', () => {
            this.toggleCodePanel();
        });
    }

    submitGoal() {
        const input = document.getElementById('goal-input-field');
        const goal = input.value.trim();

        if (!goal) return;

        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'create_goal',
                goal: goal
            }));

            input.value = '';
            console.log(`🎯 Goal submitted: ${goal}`);
        }
    }

    handleGoalUpdate(goalData) {
        const { id, description, status, progress, subtasks } = goalData;

        // Store goal
        this.activeGoals.set(id, goalData);

        // Update UI
        const goalsList = document.getElementById('active-goals-list');
        if (!goalsList) return;

        // Find or create goal element
        let goalEl = document.getElementById(`goal-${id}`);
        if (!goalEl) {
            goalEl = document.createElement('div');
            goalEl.id = `goal-${id}`;
            goalEl.style.cssText = `
                background: rgba(0, 0, 0, 0.3);
                border: 1px solid #333;
                border-radius: 8px;
                padding: 10px;
                margin-bottom: 8px;
            `;
            goalsList.appendChild(goalEl);
        }

        // Status color
        const statusColors = {
            'pending': '#888',
            'active': '#4488FF',
            'completed': '#00FF88',
            'partial': '#FFAA00',
            'failed': '#FF4444'
        };
        const statusColor = statusColors[status] || '#888';

        // Build subtasks HTML
        const subtaskHtml = subtasks.map(st => {
            const stColor = statusColors[st.status] || '#666';
            const agentEmoji = {
                'architect': '🏛️',
                'coder': '⚡',
                'oracle': '🔮',
                'guardian': '🛡️'
            }[st.assigned_agent] || '🤖';
            return `
                <div style="font-size: 11px; color: ${stColor}; margin: 2px 0;">
                    ${agentEmoji} ${st.description}
                    <span style="color: #666;">[${st.status}]</span>
                </div>
            `;
        }).join('');

        // Progress bar
        const progressPercent = Math.round(progress * 100);

        goalEl.innerHTML = `
            <div style="color: ${statusColor}; font-size: 13px; margin-bottom: 6px;">
                ${status === 'completed' ? '✅' : status === 'active' ? '🔄' : '📋'} ${description}
            </div>
            <div style="background: #222; border-radius: 4px; height: 6px; margin-bottom: 6px;">
                <div style="background: ${statusColor}; width: ${progressPercent}%; height: 100%; border-radius: 4px;"></div>
            </div>
            <div style="font-size: 10px; color: #666;">${progressPercent}% complete</div>
            <div style="margin-top: 6px;">${subtaskHtml}</div>
        `;

        // Visualize on map if goal is active
        if (status === 'active') {
            this.visualizeGoalProgress(goalData);
        }
    }

    visualizeGoalProgress(goalData) {
        // Draw a subtle indicator on the map showing goal activity
        if (!this.drawingLayer) return;

        // This is handled by agents' actions, but we can add a central goal indicator
        // For now, just log the progress
        console.log(`🎯 Goal "${goalData.description}": ${Math.round(goalData.progress * 100)}%`);
    }

    // ─────────────────────────────────────────────────────────────
    // WORLD PERSISTENCE
    // ─────────────────────────────────────────────────────────────

    restoreWorldState(state) {
        if (!this.drawingLayer) return;

        console.log(`📂 Restoring world state...`);
        let restored = 0;

        // Restore drawings
        for (const drawing of (state.drawings || [])) {
            this.restoreDrawing(drawing);
            restored++;
        }

        // Restore texts
        for (const text of (state.texts || [])) {
            this.restoreText(text);
            restored++;
        }

        // Restore sprites
        for (const sprite of (state.sprites || [])) {
            this.restoreSprite(sprite);
            restored++;
        }

        console.log(`✅ Restored ${restored} artifacts`);
        this.showNotification(`Restored ${restored} artifacts`, 'success');
    }

    restoreDrawing(drawing) {
        const params = drawing.params || {};
        const type = drawing.type;

        if (type === 'rect' || params.drawing_type === 'rect') {
            this.drawingLayer.beginFill(params.color || 0x4488FF, params.fill ? 0.8 : 0);
            this.drawingLayer.lineStyle(2, params.color || 0x4488FF);
            this.drawingLayer.drawRect(params.x || 0, params.y || 0, params.width || 100, params.height || 60);
            this.drawingLayer.endFill();
        } else if (type === 'line' || params.drawing_type === 'line') {
            this.drawingLayer.lineStyle(params.width || 2, params.color || 0xFFFFFF);
            this.drawingLayer.moveTo(params.x1 || 0, params.y1 || 0);
            this.drawingLayer.lineTo(params.x2 || 0, params.y2 || 0);
        }

        // Track for persistence
        this.recordArtifact('drawing', { ...params, drawing_type: type }, drawing.creator);
    }

    restoreText(textData) {
        const text = new PIXI.Text(textData.text || '', {
            fontFamily: 'Courier New',
            fontSize: textData.size || 12,
            fill: textData.color || 0xFFFFFF
        });
        text.x = textData.x || 0;
        text.y = textData.y || 0;
        this.spriteLayer.addChild(text);

        // Track for persistence
        this.recordArtifact('text', textData, textData.creator);
    }

    restoreSprite(spriteData) {
        // Create a placeholder sprite since we don't have the actual textures
        const graphics = new PIXI.Graphics();
        graphics.beginFill(0x666666, 0.5);
        graphics.drawRoundedRect(0, 0, 40, 40, 8);
        graphics.endFill();
        graphics.x = spriteData.x || 0;
        graphics.y = spriteData.y || 0;
        graphics.scale.set(spriteData.scale || 1);
        this.spriteLayer.addChild(graphics);

        // Track for persistence
        this.recordArtifact('sprite', spriteData, spriteData.creator);
    }

    recordArtifact(artifactType, params, creator = 'user') {
        // Track locally for auto-save
        if (!this.localArtifacts) {
            this.localArtifacts = [];
        }
        this.localArtifacts.push({ type: artifactType, params, creator });
    }

    saveWorld() {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'save_world'
            }));
            console.log('💾 Save command sent');
        }
    }

    loadWorld() {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'load_world'
            }));
            console.log('📂 Load command sent');
        }
    }

    clearWorld() {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'clear_world'
            }));
        }
        this.clearWorldVisuals();
    }

    clearWorldVisuals() {
        if (this.drawingLayer) {
            this.drawingLayer.clear();
        }
        if (this.spriteLayer) {
            // Remove all children except agent visuals
            const toRemove = [];
            this.spriteLayer.children.forEach(child => {
                if (!child._isAgentVisual) {
                    toRemove.push(child);
                }
            });
            toRemove.forEach(child => this.spriteLayer.removeChild(child));
        }
        this.localArtifacts = [];
        console.log('🧹 World visuals cleared');
    }

    showNotification(message, type = 'info') {
        // Create a temporary notification
        const notification = document.createElement('div');
        notification.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: ${type === 'success' ? 'rgba(0, 255, 136, 0.9)' : type === 'error' ? 'rgba(255, 68, 68, 0.9)' : 'rgba(68, 136, 255, 0.9)'};
            color: ${type === 'success' ? '#000' : '#fff'};
            padding: 12px 20px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            z-index: 99999;
            animation: fadeInOut 3s forwards;
        `;
        notification.textContent = message;

        // Add animation style
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeInOut {
                0% { opacity: 0; transform: translateY(20px); }
                10% { opacity: 1; transform: translateY(0); }
                90% { opacity: 1; transform: translateY(0); }
                100% { opacity: 0; transform: translateY(-20px); }
            }
        `;
        document.head.appendChild(style);
        document.body.appendChild(notification);

        setTimeout(() => {
            notification.remove();
            style.remove();
        }, 3000);
    }

    // ─────────────────────────────────────────────────────────────
    // VIRTUAL FILE SYSTEM (Self-Modification Layer)
    // ─────────────────────────────────────────────────────────────

    createCodePanel() {
        if (this.codePanel) return;

        const panel = document.createElement('div');
        panel.id = 'code-panel';
        panel.style.cssText = `
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 9998;
            background: rgba(15, 15, 30, 0.95);
            border: 2px solid #FF88FF;
            border-radius: 12px;
            padding: 16px;
            width: 500px;
            max-height: 600px;
            font-family: 'Courier New', monospace;
            box-shadow: 0 8px 32px rgba(255, 136, 255, 0.2);
            display: none;
        `;

        panel.innerHTML = `
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
                <span style="color: #FF88FF; font-size: 16px; font-weight: bold;">📝 Code Explorer</span>
                <button id="code-panel-close" style="background: transparent; border: 1px solid #666; color: #888; cursor: pointer; font-size: 14px; padding: 2px 8px; border-radius: 4px;">×</button>
            </div>

            <div style="display: flex; gap: 8px; margin-bottom: 12px;">
                <input type="text" id="vfs-path-input" placeholder="Path (e.g., area_agent.py)"
                    style="flex: 1; background: rgba(0,0,0,0.5); border: 1px solid #444; color: #FF88FF; padding: 8px; border-radius: 6px; font-family: 'Courier New'; font-size: 12px;">
                <button id="vfs-read-btn" style="background: rgba(255,136,255,0.3); border: 1px solid #FF88FF; color: #FF88FF; padding: 8px 12px; border-radius: 6px; cursor: pointer;">Read</button>
                <button id="vfs-list-btn" style="background: rgba(68,136,255,0.3); border: 1px solid #4488FF; color: #4488FF; padding: 8px 12px; border-radius: 6px; cursor: pointer;">List</button>
            </div>

            <div style="display: flex; gap: 8px; margin-bottom: 12px;">
                <input type="text" id="vfs-search-input" placeholder="Search in code..."
                    style="flex: 1; background: rgba(0,0,0,0.5); border: 1px solid #444; color: #00FF88; padding: 8px; border-radius: 6px; font-family: 'Courier New'; font-size: 12px;">
                <button id="vfs-search-btn" style="background: rgba(0,255,136,0.3); border: 1px solid #00FF88; color: #00FF88; padding: 8px 12px; border-radius: 6px; cursor: pointer;">Search</button>
            </div>

            <div id="vfs-file-info" style="font-size: 11px; color: #888; margin-bottom: 8px;"></div>

            <div id="vfs-content-area" style="
                background: rgba(0,0,0,0.4);
                border: 1px solid #333;
                border-radius: 8px;
                padding: 12px;
                max-height: 350px;
                overflow-y: auto;
                font-size: 11px;
                line-height: 1.4;
                white-space: pre-wrap;
                color: #ccc;
            ">Select a file to view...</div>

            <div style="display: flex; gap: 8px; margin-top: 12px;">
                <button id="vfs-save-btn" style="flex: 1; background: linear-gradient(135deg, #00FF88, #4488FF); border: none; color: #000; padding: 8px; border-radius: 6px; cursor: pointer; font-weight: bold;">💾 Save Changes</button>
                <button id="vfs-summary-btn" style="background: rgba(255,170,0,0.3); border: 1px solid #FFAA00; color: #FFAA00; padding: 8px 12px; border-radius: 6px; cursor: pointer;">📊 Summary</button>
            </div>
        `;

        document.body.appendChild(panel);
        this.codePanel = panel;
        this.currentFilePath = null;

        // Event handlers
        document.getElementById('code-panel-close').addEventListener('click', () => {
            this.codePanel.style.display = 'none';
        });

        document.getElementById('vfs-read-btn').addEventListener('click', () => {
            this.vfsReadFile();
        });

        document.getElementById('vfs-list-btn').addEventListener('click', () => {
            this.vfsListFiles();
        });

        document.getElementById('vfs-search-btn').addEventListener('click', () => {
            this.vfsSearch();
        });

        document.getElementById('vfs-save-btn').addEventListener('click', () => {
            this.vfsSaveFile();
        });

        document.getElementById('vfs-summary-btn').addEventListener('click', () => {
            this.vfsGetSummary();
        });

        document.getElementById('vfs-path-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.vfsReadFile();
        });

        document.getElementById('vfs-search-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.vfsSearch();
        });
    }

    toggleCodePanel() {
        this.createCodePanel();
        if (this.codePanel.style.display === 'none') {
            this.codePanel.style.display = 'block';
        } else {
            this.codePanel.style.display = 'none';
        }
    }

    vfsReadFile() {
        const path = document.getElementById('vfs-path-input').value.trim();
        if (!path) return;

        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'vfs_read',
                path: path
            }));
        }
    }

    vfsListFiles() {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'vfs_list',
                pattern: '**/*.py'
            }));
        }
    }

    vfsSearch() {
        const query = document.getElementById('vfs-search-input').value.trim();
        if (!query) return;

        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'vfs_search',
                query: query,
                file_pattern: '*.py'
            }));
        }
    }

    vfsSaveFile() {
        const path = this.currentFilePath || document.getElementById('vfs-path-input').value.trim();
        const content = document.getElementById('vfs-content-area').textContent;

        if (!path) {
            this.showNotification('No file selected', 'error');
            return;
        }

        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'vfs_write',
                path: path,
                content: content,
                agent_id: 'user'
            }));
        }
    }

    vfsGetSummary() {
        if (this.areaAgentSocket && this.areaAgentSocket.readyState === WebSocket.OPEN) {
            this.areaAgentSocket.send(JSON.stringify({
                command: 'vfs_summary'
            }));
        }
    }

    handleFileContent(data) {
        if (!data.success) {
            document.getElementById('vfs-content-area').textContent = `Error: ${data.error}`;
            document.getElementById('vfs-file-info').textContent = '';
            return;
        }

        this.currentFilePath = data.path;
        document.getElementById('vfs-content-area').textContent = data.content;
        document.getElementById('vfs-file-info').innerHTML = `
            <span style="color: #FF88FF;">📄 ${data.path}</span>
            <span style="color: #666;"> | ${data.lines} lines | ${data.size} bytes | ${data.language}</span>
        `;
        document.getElementById('vfs-path-input').value = data.path;
    }

    handleFileList(data) {
        if (!data.success) {
            document.getElementById('vfs-content-area').textContent = `Error: ${data.error}`;
            return;
        }

        let html = `<div style="color: #4488FF; margin-bottom: 8px;">📁 ${data.count} files found:</div>`;

        for (const file of data.files) {
            const sizeKB = Math.round(file.size / 1024);
            html += `<div style="color: #00FF88; cursor: pointer; padding: 2px 0;" onclick="document.getElementById('vfs-path-input').value='${file.path}'; app.vfsReadFile();">📄 ${file.path} <span style="color: #666;">(${sizeKB}KB)</span></div>`;
        }

        document.getElementById('vfs-content-area').innerHTML = html;
        document.getElementById('vfs-file-info').textContent = '';
    }

    handleSearchResults(data) {
        if (!data.success) {
            document.getElementById('vfs-content-area').textContent = `Error: ${data.error}`;
            return;
        }

        let html = `<div style="color: #00FF88; margin-bottom: 8px;">🔍 Found ${data.count} results for "${data.query}":</div>`;

        for (const result of data.results) {
            html += `<div style="margin: 4px 0; padding: 4px; background: rgba(0,255,136,0.1); border-radius: 4px;">
                <div style="color: #FF88FF; cursor: pointer;" onclick="document.getElementById('vfs-path-input').value='${result.file}'; app.vfsReadFile();">📄 ${result.file}:${result.line}</div>
                <div style="color: #888; font-size: 10px;">${result.content}</div>
            </div>`;
        }

        document.getElementById('vfs-content-area').innerHTML = html;
        document.getElementById('vfs-file-info').textContent = '';
    }

    handleCodebaseSummary(data) {
        if (!data.success) {
            document.getElementById('vfs-content-area').textContent = `Error: ${data.error}`;
            return;
        }

        const s = data.summary;
        let html = `<div style="color: #FFAA00; margin-bottom: 12px; font-size: 14px;">📊 Codebase Summary</div>`;

        html += `<div style="margin: 8px 0;">
            <span style="color: #4488FF;">🐍 Python files:</span> <span style="color: #fff;">${s.python_files}</span>
        </div>`;
        html += `<div style="margin: 8px 0;">
            <span style="color: #00FF88;">📜 JavaScript files:</span> <span style="color: #fff;">${s.javascript_files}</span>
        </div>`;
        html += `<div style="margin: 8px 0;">
            <span style="color: #FF88FF;">📏 Total lines:</span> <span style="color: #fff;">${s.total_lines.toLocaleString()}</span>
        </div>`;

        if (s.main_files && s.main_files.length > 0) {
            html += `<div style="margin-top: 12px; color: #888;">Main files:</div>`;
            for (const f of s.main_files) {
                html += `<div style="color: #00FF88; cursor: pointer;" onclick="document.getElementById('vfs-path-input').value='${f.name}'; app.vfsReadFile();">📄 ${f.name} (${f.lines} lines)</div>`;
            }
        }

        document.getElementById('vfs-content-area').innerHTML = html;
        document.getElementById('vfs-file-info').textContent = '';
    }

    handleModificationHistory(data) {
        let html = `<div style="color: #FFAA00; margin-bottom: 8px;">📝 Recent Modifications (${data.count}):</div>`;

        for (const mod of data.history) {
            const actionColor = mod.action === 'create' ? '#00FF88' : '#4488FF';
            html += `<div style="margin: 4px 0; padding: 4px; background: rgba(68,136,255,0.1); border-radius: 4px;">
                <span style="color: ${actionColor};">[${mod.action}]</span>
                <span style="color: #FF88FF;">${mod.path}</span>
                <span style="color: #666;"> by ${mod.agent_id}</span>
                <div style="color: #888; font-size: 10px;">${mod.old_lines} → ${mod.new_lines} lines</div>
            </div>`;
        }

        document.getElementById('vfs-content-area').innerHTML = html;
    }

    sendAgentMessage() {
        const input = document.getElementById('agent-input-field');
        const message = input.value.trim();

        if (!message || !this.activeAgentId) return;

        this.sendAgentCommand(this.activeAgentId, {
            command: 'update_prompt',
            prompt: message
        });

        // Update status
        document.getElementById('agent-status').textContent = '⏳ Sending...';

        // Clear input
        input.value = '';
    }

    worldToScreen(worldX, worldY) {
        // Convert world coordinates to screen coordinates
        if (this.viewport && this.viewport.viewport) {
            const v = this.viewport.viewport;
            return {
                x: (worldX * v.scale.x) + v.x,
                y: (worldY * v.scale.y) + v.y
            };
        }
        // Fallback - assume 1:1 mapping
        return { x: worldX, y: worldY };
    }

    updateAgentInputStatus(status, statusType = 'normal') {
        const statusEl = document.getElementById('agent-status');
        if (!statusEl) return;

        statusEl.textContent = status;

        // Color by status type
        switch (statusType) {
            case 'thinking':
                statusEl.style.color = '#4488FF';
                break;
            case 'responding':
                statusEl.style.color = '#00FF88';
                break;
            case 'error':
                statusEl.style.color = '#FF4444';
                break;
            default:
                statusEl.style.color = '#888';
        }
    }
    
    removeAgentVisuals(agentId) {
        if (this.areaAgents.has(agentId)) {
            const agent = this.areaAgents.get(agentId);
            this.worldContainer.removeChild(agent.container);
            agent.container.destroy({ children: true });
            this.areaAgents.delete(agentId);
        }
    }

    // ─────────────────────────────────────────────────────────────────
    // WebMCP Creative Tools API
    // ─────────────────────────────────────────────────────────────────

    /**
     * Draw a rectangle on the dedicated drawing layer.
     * @param {number} x - X coordinate in world space.
     * @param {number} y - Y coordinate in world space.
     * @param {number} width - Rectangle width.
     * @param {number} height - Rectangle height.
     * @param {number} color - Fill color (e.g., 0xFF0000).
     * @param {number} alpha - Fill alpha (0-1).
     */
    drawRect(x, y, width, height, color = 0xFFFFFF, alpha = 1.0) {
        if (!this.drawingLayer) return;
        this.drawingLayer.beginFill(color, alpha);
        this.drawingLayer.drawRect(x, y, width, height);
        this.drawingLayer.endFill();
    }

    /**
     * Draw a circle on the dedicated drawing layer.
     * @param {number} x - Center X coordinate in world space.
     * @param {number} y - Center Y coordinate in world space.
     * @param {number} radius - Circle radius.
     * @param {number} color - Fill color.
     * @param {number} alpha - Fill alpha.
     */
    drawCircle(x, y, radius, color = 0xFFFFFF, alpha = 1.0) {
        if (!this.drawingLayer) return;
        this.drawingLayer.beginFill(color, alpha);
        this.drawingLayer.drawCircle(x, y, radius);
        this.drawingLayer.endFill();
    }

    /**
     * Clear all graphics from the drawing layer.
     */
    clearGraphics() {
        if (!this.drawingLayer) return;
        this.drawingLayer.clear();
    }

    /**
     * Place a new text object on the sprite layer.
     * @param {string} id - Unique ID for the text object.
     * @param {string} text - The text content.
     * @param {number} x - X coordinate in world space.
     * @param {number} y - Y coordinate in world space.
     * @param {object} style - A PIXI.TextStyle object.
     * @returns {boolean} - True if successful.
     */
    placeText(id, text, x, y, style = {}) {
        if (!this.spriteLayer || this.managedSprites.has(id)) return false;

        const defaultStyle = { fontFamily: 'Arial', fontSize: 24, fill: 0xffffff };
        const textObject = new PIXI.Text(text, { ...defaultStyle, ...style });
        textObject.x = x;
        textObject.y = y;
        textObject.anchor.set(0.5); // Center anchor by default
        
        this.spriteLayer.addChild(textObject);
        this.managedSprites.set(id, textObject);
        return true;
    }

    /**
     * Update an existing text object.
     * @param {string} id - ID of the text object to update.
     * @param {string} text - New text content.
     * @param {object} style - New PIXI.TextStyle to apply.
     * @returns {boolean} - True if successful.
     */
    updateText(id, text, style) {
        if (!this.managedSprites.has(id)) return false;
        
        const textObject = this.managedSprites.get(id);
        if (!(textObject instanceof PIXI.Text)) return false;

        if (text) textObject.text = text;
        if (style) textObject.style = new PIXI.TextStyle({ ...textObject.style, ...style });
        
        return true;
    }

    /**
     * Create a new sprite on the sprite layer.
     * @param {string} id - Unique ID for the sprite.
     * @param {string} imageUrl - URL of the image for the sprite texture.
     * @param {number} x - X coordinate in world space.
     * @param {number} y - Y coordinate in world space.
     * @returns {boolean} - True if successful.
     */
    async createSprite(id, imageUrl, x, y) {
        if (!this.spriteLayer || this.managedSprites.has(id)) return false;
        try {
            const texture = await PIXI.Assets.load(imageUrl);
            const sprite = new PIXI.Sprite(texture);
            sprite.x = x;
            sprite.y = y;
            sprite.anchor.set(0.5); // Center anchor

            this.spriteLayer.addChild(sprite);
            this.managedSprites.set(id, sprite);
            return true;
        } catch (err) {
            console.error(`[CreativeTools] Failed to load texture for sprite ${id}:`, err);
            return false;
        }
    }

    /**
     * Move an existing sprite or text object.
     * @param {string} id - ID of the object to move.
     * @param {number} x - New X coordinate.
     * @param {number} y - New Y coordinate.
     * @returns {boolean} - True if successful.
     */
    moveSprite(id, x, y) {
        if (!this.managedSprites.has(id)) return false;

        const sprite = this.managedSprites.get(id);
        if (x !== undefined) sprite.x = x;
        if (y !== undefined) sprite.y = y;

        return true;
    }
    
    /**
     * Remove a sprite or text object.
     * @param {string} id - ID of the object to remove.
     * @returns {boolean} - True if successful.
     */
    removeSprite(id) {
        if (!this.managedSprites.has(id)) return false;
        
        const sprite = this.managedSprites.get(id);
        this.spriteLayer.removeChild(sprite);
        sprite.destroy();
        this.managedSprites.delete(id);

        return true;
    }

    /**
     * Set up the WebGPU Native Boot Demo
     */
    async setupWebGPUDemo() {
        if (typeof WGPULinuxHypervisor === 'undefined') {
            console.warn('[WebGPUDemo] WGPULinuxHypervisor not found');
            return;
        }

        try {
            console.log('🐧 Initializing WebGPU Native Boot Demo...');
            
            // 1. Create Hypervisor
            const hypervisor = new WGPULinuxHypervisor({
                width: 1024,
                height: 768,
                cyclesPerFrame: 1000
            });
            
            await hypervisor.init();
            
            // 2. Create specialized monitor window
            const gpuMonitor = new VMMonitorTile(
                "WEBGPU BOOT: Alpine Linux", 
                1300, 150, 640, 430, 
                { hypervisor: hypervisor }
            );
            this.worldContainer.addChild(gpuMonitor);
            
            // 3. Load Kernel from RTS
            // We'll use the linux_kernel.rts.png we found earlier
            const kernelUrl = 'linux_kernel.rts.png';
            await hypervisor.loadKernelFromRTS(kernelUrl);
            
            // 3.1 Setup MMU (identity map 16MB)
            await hypervisor.setupMMU();
            
            // 4. Start execution
            hypervisor.start();
            
            console.log('✅ WebGPU Native Boot Demo started');
            
        } catch (e) {
            console.error('[WebGPUDemo] Failed to initialize:', e);
        }
    }

    /**
     * Setup input gestures for Memory Beams visualization.
     * Semantic Drag: Middle Mouse Button + Shift
     */
    _setupMemoryBeamGestures() {
        if (!this.memoryBeams) return;

        let isSemanticDragActive = false;
        let wasShiftPressed = false;

        // Track shift key state
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Shift' && !wasShiftPressed) {
                wasShiftPressed = true;
                console.log('🔮 Shift pressed - Semantic Drag ready');
            }
        });

        document.addEventListener('keyup', (e) => {
            if (e.key === 'Shift') {
                wasShiftPressed = false;
                if (isSemanticDragActive) {
                    this.memoryBeams.deactivate();
                    isSemanticDragActive = false;
                    console.log('🔮 Semantic Drag deactivated');
                }
            }
        });

        // Middle mouse button handler on canvas
        const canvas = this.app.view;

        canvas.addEventListener('mousedown', (e) => {
            // Button 1 = middle mouse
            if (e.button === 1 && wasShiftPressed) {
                e.preventDefault();

                // Get world coordinates from screen
                const rect = canvas.getBoundingClientRect();
                const screenX = e.clientX - rect.left;
                const screenY = e.clientY - rect.top;

                // Convert to world coordinates
                const camera = this.viewport.getCamera();
                const worldX = (screenX - this.app.screen.width / 2) / camera.zoom + camera.x;
                const worldY = (screenY - this.app.screen.height / 2) / camera.zoom + camera.y;

                // Activate memory beams
                this.memoryBeams.activate(worldX, worldY);

                // Query real Hippocampus backend via bridge
                this.recallMemories(worldX, worldY);

                isSemanticDragActive = true;
                console.log(`🔮 Semantic Drag activated at world (${worldX.toFixed(0)}, ${worldY.toFixed(0)})`);
            }
        });

        canvas.addEventListener('mousemove', (e) => {
            if (isSemanticDragActive) {
                const rect = canvas.getBoundingClientRect();
                const screenX = e.clientX - rect.left;
                const screenY = e.clientY - rect.top;

                // Convert to world coordinates
                const camera = this.viewport.getCamera();
                const worldX = (screenX - this.app.screen.width / 2) / camera.zoom + camera.x;
                const worldY = (screenY - this.app.screen.height / 2) / camera.zoom + camera.y;

                this.memoryBeams.updateCursor(worldX, worldY);
            }
        });

        canvas.addEventListener('mouseup', (e) => {
            if (e.button === 1 && isSemanticDragActive) {
                this.memoryBeams.deactivate();
                isSemanticDragActive = false;
                console.log('🔮 Semantic Drag deactivated');
            }
        });

        // Prevent context menu on middle-click
        canvas.addEventListener('contextmenu', (e) => {
            if (wasShiftPressed) {
                e.preventDefault();
            }
        });

        console.log('🔮 Memory Beam gestures configured (Shift + Middle Mouse to activate)');
    }

    /**
     * Setup keyboard shortcuts for Heatmap Overlay.
     * Ctrl+Shift+M: Toggle heat map visibility
     */
    _setupHeatmapKeyboard() {
        if (!this.heatmapOverlay) return;

        document.addEventListener('keydown', (e) => {
            // Ctrl+Shift+M: Toggle Heat Map
            if (e.ctrlKey && e.shiftKey && (e.key === 'M' || e.key === 'm')) {
                e.preventDefault();
                const visible = this.heatmapOverlay.toggle();

                // Dispatch event for HUD integration
                window.dispatchEvent(new CustomEvent('HEATMAP_TOGGLED', {
                    detail: { visible }
                }));
            }
        });

        console.log('🔥 Heatmap keyboard shortcuts configured (Ctrl+Shift+M to toggle)');
    }

    /**
     * Connect to the Memory Visual Bridge for semantic memory retrieval.
     */
    _connectMemoryBridge() {
        const port = 8768;
        try {
            console.log('🔮 Connecting to Memory Bridge...');
            this.memoryBridgeSocket = new WebSocket(`ws://localhost:${port}`);
            
            this.memoryBridgeSocket.onopen = () => {
                console.log('🔮 Memory Bridge connected');
            };
            
            this.memoryBridgeSocket.onmessage = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    if (data.type === 'memory_beam_results') {
                        if (this.memoryBeams) {
                            this.memoryBeams.updateMemories(data.memories);
                        }
                    } else if (data.type === 'mirror_validation_result') {
                        console.log('🪞 Received Mirror Validation Result:', data);
                        // Dispatch to VisualDebugOverlay
                        window.dispatchEvent(new CustomEvent('MIRROR_VALIDATION_RESULT', { detail: data }));
                    } else if (data.type === 'SHOTCUT_FRAME_UPDATE') {
                        // Dispatch Shotcut Visual HUD update
                        window.dispatchEvent(new CustomEvent('SHOTCUT_FRAME_UPDATE', { detail: data.data }));
                    } else if (data.type === 'NARRATIVE_EVENT') {
                        // V2.0: Handle narrative events
                        this._handleNarrativeEvent(data);
                    } else if (data.type === 'DAEMON_HEARTBEAT') {
                        // V2.0: Handle daemon heartbeat
                        window.dispatchEvent(new CustomEvent('DAEMON_HEARTBEAT', { detail: data }));
                    } else if (data.type === 'radio_broadcast') {
                        // GOSR Radio: Dispatch radio broadcast events to HUD
                        window.dispatchEvent(new CustomEvent('RADIO_BROADCAST', { detail: data }));
                    } else if (data.type === 'narrative_session') {
                        // V2.0: Session info response
                        if (this.ambientNarrative) {
                            this.ambientNarrative.sessionId = data.session_id;
                            this.ambientNarrative.state = data.ambient_state || 'MONITORING';
                            
                            // Update HUD if available
                            if (this.ambientNarrativeHUD) {
                                this.ambientNarrativeHUD.updateState(this.ambientNarrative.state);
                            }
                        }
                    } else if (data.type === 'error') {
                        console.warn('🔮 Memory Bridge error:', data.message);
                    }
                } catch (e) {
                    console.error('Failed to parse Memory Bridge message:', e);
                }
            };
            
            this.memoryBridgeSocket.onerror = (e) => {
                // Connection error log is noisy, handled by onclose
            };
            
            this.memoryBridgeSocket.onclose = () => {
                console.log('🔮 Memory Bridge disconnected');
                // Auto-reconnect after 5s
                if (!this.destroyed) {
                    setTimeout(() => this._connectMemoryBridge(), 5000);
                }
            };
        } catch (e) {
            console.error('Failed to connect to Memory Bridge:', e);
        }
    }

    /**
     * Query the semantic memory bridge for thoughts near a location.
     */
    recallMemories(worldX, worldY) {
        if (this.memoryBridgeSocket && this.memoryBridgeSocket.readyState === WebSocket.OPEN) {
            this.memoryBridgeSocket.send(JSON.stringify({
                type: 'recall_memories',
                x: worldX,
                y: worldY
            }));
        } else {
            // Fallback to mock data if bridge unavailable
            if (this.memoryBeams) {
                const mockMemories = this.memoryBeams.generateMockMemories(15, worldX, worldY, 500);
                this.memoryBeams.updateMemories(mockMemories);
            }
        }
    }

    // =========================================================================
    // V2.0: AMBIENT NARRATIVE SYSTEM
    // =========================================================================

    /**
     * Enable Ambient Narrative Mode for scene graph streaming.
     *
     * @param {Object} options - Configuration options
     * @param {number} options.streamInterval - Scene graph stream interval in ms (default: 1000)
     * @param {string} options.wordpressUrl - WordPress REST API URL
     */
    enableAmbientNarrative(options = {}) {
        this.ambientNarrative = {
            enabled: true,
            streamInterval: options.streamInterval || 1000,
            wordpressUrl: options.wordpressUrl || 'http://localhost:8080',
            sessionId: null,
            state: 'MONITORING',
            lastSceneHash: null,
            highlightedObjects: new Set()
        };

        // Get session from WordPress
        this._fetchNarrativeSession();

        // Start scene graph streaming
        this._startSceneGraphStreaming();

        // Start FPS monitoring
        this._startFPSMonitoring();

        // Initialize HUD (V2.0)
        if (typeof AmbientNarrativeHUD !== 'undefined') {
            this.ambientNarrativeHUD = new AmbientNarrativeHUD({
                x: 20,
                y: 20
            });
            this.worldContainer.addChild(this.ambientNarrativeHUD.create());
        }

        console.log('📖 Ambient Narrative System enabled');
    }

    /**
     * Disable Ambient Narrative Mode.
     */
    disableAmbientNarrative() {
        if (this.ambientNarrative) {
            this.ambientNarrative.enabled = false;
            
            // Cleanup HUD (V2.0)
            if (this.ambientNarrativeHUD) {
                this.worldContainer.removeChild(this.ambientNarrativeHUD.container);
                this.ambientNarrativeHUD = null;
            }

            if (this._sceneStreamInterval) {
                clearInterval(this._sceneStreamInterval);
            }
            if (this._fpsMonitorInterval) {
                clearInterval(this._fpsMonitorInterval);
            }
            this._clearNarrativeHighlights();
        }
        console.log('📖 Ambient Narrative System disabled');
    }

    /**
     * Fetch the active narrative session from WordPress.
     */
    async _fetchNarrativeSession() {
        if (!this.ambientNarrative?.enabled) return;

        try {
            const response = await fetch(`${this.ambientNarrative.wordpressUrl}/wp-json/geometry-os/v1/narrative-session`, {
                method: 'GET',
                headers: { 'Content-Type': 'application/json' }
            });

            if (response.ok) {
                const data = await response.json();
                if (data.success && data.session) {
                    this.ambientNarrative.sessionId = data.session.id;
                    this.ambientNarrative.state = data.session.ambient_state || 'MONITORING';
                    
                    // Update HUD if available
                    if (this.ambientNarrativeHUD) {
                        this.ambientNarrativeHUD.updateState(this.ambientNarrative.state);
                    }
                    
                    console.log(`📖 Narrative session: ${this.ambientNarrative.sessionId} (${this.ambientNarrative.state})`);
                }
            }
        } catch (e) {
            console.warn('Failed to fetch narrative session:', e);
        }
    }

    /**
     * Start periodic scene graph streaming.
     */
    _startSceneGraphStreaming() {
        if (this._sceneStreamInterval) {
            clearInterval(this._sceneStreamInterval);
        }

        this._sceneStreamInterval = setInterval(() => {
            if (!this.ambientNarrative?.enabled || !this.ambientNarrative.sessionId) return;

            const sceneGraph = this.getSceneGraphAsJSON();
            if (!sceneGraph) return;

            // Simple hash check to avoid unnecessary sends
            const hash = JSON.stringify(sceneGraph).length; // Simplified hash
            if (hash === this.ambientNarrative.lastSceneHash) return;
            this.ambientNarrative.lastSceneHash = hash;

            // Send to visual bridge via WebSocket
            if (this.memoryBridgeSocket && this.memoryBridgeSocket.readyState === WebSocket.OPEN) {
                this.memoryBridgeSocket.send(JSON.stringify({
                    type: 'scene_graph_update',
                    session_id: this.ambientNarrative.sessionId,
                    scene_graph: sceneGraph,
                    fps: this.app.ticker.FPS || 60,
                    draw_calls: this.app.renderer.rendering.stats?.drawCalls || 0
                }));
            }
        }, this.ambientNarrative.streamInterval);
    }

    /**
     * Start FPS monitoring for HUD updates.
     */
    _startFPSMonitoring() {
        if (this._fpsMonitorInterval) {
            clearInterval(this._fpsMonitorInterval);
        }

        this._fpsMonitorInterval = setInterval(() => {
            if (!this.ambientNarrative?.enabled) return;

            // Update FPS data for potential HUD display
            const fps = Math.round(this.app.ticker.FPS || 60);
            window.dispatchEvent(new CustomEvent('GEOMETRY_OS_FPS_UPDATE', {
                detail: { fps, state: this.ambientNarrative.state }
            }));
        }, 500);
    }

    /**
     * Handle incoming narrative events from the bridge.
     * @param {Object} data - Narrative event data
     */
    _handleNarrativeEvent(data) {
        if (!this.ambientNarrative?.enabled) return;

        switch (data.event_type) {
            case 'thought':
                console.log(`💭 AI Thought: ${data.data?.thought?.substring(0, 100)}...`);
                if (data.data?.state) {
                    this.ambientNarrative.state = data.data.state;
                }
                break;

            case 'steering':
                console.log(`🎯 Steering Action: ${data.data?.action}`);
                this.ambientNarrative.state = 'STEERING';
                // Highlight affected objects
                if (data.data?.target) {
                    this._highlightNarrativeObject(data.data.target);
                }
                break;

            case 'state_change':
                this.ambientNarrative.state = data.new_state;
                console.log(`📖 State: ${data.old_state} → ${data.new_state}`);
                break;
        }

        // Dispatch for UI components
        window.dispatchEvent(new CustomEvent('NARRATIVE_EVENT', { detail: data }));
    }

    /**
     * Highlight an object being discussed by the AI.
     * @param {string} targetId - Target object identifier
     */
    _highlightNarrativeObject(targetId) {
        // Find the object in the scene
        const target = this._findObjectById(targetId);
        if (!target) return;

        // Create highlight effect
        const highlight = new PIXI.Graphics();
        highlight.lineStyle(3, 0xffcc00, 0.8);

        const bounds = target.getBounds();
        highlight.drawRect(bounds.x - 5, bounds.y - 5, bounds.width + 10, bounds.height + 10);

        this.worldContainer.addChild(highlight);
        this.ambientNarrative.highlightedObjects.add(highlight);

        // Auto-remove after 3 seconds
        setTimeout(() => {
            this.worldContainer.removeChild(highlight);
            this.ambientNarrative.highlightedObjects.delete(highlight);
            highlight.destroy();
        }, 3000);
    }

    /**
     * Find a scene object by ID or name.
     * @param {string} id - Object identifier
     * @returns {PIXI.DisplayObject|null}
     */
    _findObjectById(id) {
        // Recursive search
        const search = (container) => {
            for (const child of container.children) {
                if (child.name === id || child.id === id) {
                    return child;
                }
                if (child.children?.length > 0) {
                    const found = search(child);
                    if (found) return found;
                }
            }
            return null;
        };
        return search(this.worldContainer);
    }

    /**
     * Clear all narrative highlight effects.
     */
    _clearNarrativeHighlights() {
        for (const highlight of this.ambientNarrative.highlightedObjects) {
            this.worldContainer.removeChild(highlight);
            highlight.destroy();
        }
        this.ambientNarrative.highlightedObjects.clear();
    }

    /**
     * Cleanup method for application shutdown.
     * Destroys dashboard components and releases resources.
     */
    destroy() {
        // Cleanup Ambient Narrative System (V2.0)
        this.disableAmbientNarrative();

        // Cleanup Metabolism Dashboard (V13)
        if (this.metabolismDashboard) {
            this.metabolismDashboard.destroy();
            this.metabolismDashboard = null;
        }

        // Cleanup Memory Beams (Path 2: Hippocampus)
        if (this.memoryBeams) {
            this.memoryBeams.destroy();
            this.memoryBeams = null;
        }

        // TODO: Add cleanup for other components as needed
        console.log('[GeometryOSApplication] Application cleanup completed');
    }
}

// Global Export
window.GeometryOSApplication = GeometryOSApplication;
