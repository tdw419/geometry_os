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

        // 2. Initialize Low-Level Systems
        this.spatialIndex = new SpatialIndex({ type: 'hash', cellSize: this.config.gridSize });

        // 3. Create Scene Graph
        this.worldContainer = new PIXI.Container();
        this.app.stage.addChild(this.worldContainer);

        // 3a. Initialize Compute System (Native WebAssembly Substrate)
        // Must be done before loading tiles if they need execution
        if (typeof ComputeIntegrationSystem !== 'undefined') {
            this.computeSystem = new ComputeIntegrationSystem(this.app);
            // Auto-boot test kernel
            // this.computeSystem.bootKernel('assets/test_minimal.rts.png', 'kernel_0');
        }

        // 4. Initialize Desktop Environment
        this.windowManager = new WindowManager(this.worldContainer);
        const demoWindow = this.windowManager.createWindow("System Console", 200, 150, 400, 250);
        const demoText = new PIXI.Text("Welcome to Geometry OS.\n- Drag this window by its title bar.", {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xffffff,
            wordWrap: true,
            wordWrapWidth: 380,
        });
        demoWindow.setContent(demoText);

        // 5. Initialize Managers
        this.viewport = new ViewportManager({
            target: this.app.view,
            initialX: 0, // Start at origin to see tiles
            initialY: 0,
            initialZoom: 1.0,
            websocketUrl: 'ws://127.0.0.1:8765' // Connect to Rust data daemon
        });

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

        // 9. Start Render Loop
        this.app.ticker.add(this.update.bind(this));

        // 10. Bind Viewport Events
        this.viewport.on('move', () => this.onViewChange());
        this.viewport.on('zoom', () => this.onViewChange());
        this.viewport.on('resize', () => this.onViewChange());

        // 11. Initial load
        this.onViewChange();

        console.log("✅ Geometry OS initialized at Antigravity Prime");

        // Phase 26: Signal readiness for external modules (like PixelLang IDE)
        window.geometryOSApp = this;
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
    }


    createMutationCanvas() {
        if (!this.windowManager) return;

        // Create a floating window for the "AI Brain"
        const mutationWindow = this.windowManager.createWindow("Neural Quine: Visual Evolution", 650, 150, 400, 400);

        // Create the visualization container
        const vizContainer = new PIXI.Container();

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000);
        bg.drawRect(0, 0, 380, 360);
        bg.endFill();
        vizContainer.addChild(bg);

        // The "Pixel Grid" (32x32 upscaled)
        const gridSize = 32;
        const pixelSize = 10;
        const grid = new PIXI.Graphics();
        grid.x = 30;
        grid.y = 30;
        vizContainer.addChild(grid);

        // HUD Text
        const hud = new PIXI.Text("GEN: 0 | FITNESS: 0.0%", {
            fontFamily: "Courier New",
            fontSize: 14,
            fill: 0x00FF00
        });
        hud.x = 30;
        hud.y = 10;
        vizContainer.addChild(hud);

        mutationWindow.setContent(vizContainer);

        // Simulate evolution loop (since we don't have websocket for this specific demo yet)
        // In the real system, this listens to 'evolution-step' events from the backend
        let gen = 0;
        let fitness = 0.0;

        this.app.ticker.add(() => {
            if (gen % 5 === 0) { // Update every 5 frames
                gen++;
                fitness = Math.min(100, fitness + Math.random() * 0.5);

                // Update text
                hud.text = `GEN: ${gen} | FITNESS: ${fitness.toFixed(2)}% | TARGET: WASM`;

                // Mutate grid visual
                grid.clear();
                for (let y = 0; y < gridSize; y++) {
                    for (let x = 0; x < gridSize; x++) {
                        // Generate colors that look like the 'evolved' header structures
                        // Mostly noise, but stabilizing over time
                        const isHeader = (y * gridSize + x) < 8; // First 8 bytes

                        let color;
                        if (isHeader && fitness > 50) {
                            // Stable header colors (approx)
                            const headerColors = [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]; // \0asm...
                            const byte = headerColors[(y * gridSize + x)];
                            color = (byte << 16) | (byte << 8) | byte; // Grayscale for simplicity or map to palette
                            // Actually let's use a "Code Palette"
                            color = 0x00FF00;
                        } else {
                            // Random mutation
                            color = Math.random() * 0xFFFFFF;
                        }

                        grid.beginFill(color);
                        grid.drawRect(x * pixelSize, y * pixelSize, pixelSize, pixelSize);
                        grid.endFill();
                    }
                }
            }
        });

        console.log("🧠 Mutation Canvas created - AI Visual Programming Interface active");
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
}

// Global Export
window.GeometryOSApplication = GeometryOSApplication;
