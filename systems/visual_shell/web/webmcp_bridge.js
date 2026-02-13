/**
 * WebMCP Bridge for Geometry OS
 * ============================================================
 *
 * "The Screen is the Hard Drive — and now the API surface."
 *
 * Exposes Geometry OS capabilities as structured WebMCP tools
 * that any AI agent (Gemini, Claude, GPT, local LLM) can invoke
 * directly — no screenshotting, no DOM scraping, no pixel-guessing.
 *
 * Architecture: Event-Driven Bridge (Approach A)
 *   - Listens for 'geometry-os-ready' event from application.js
 *   - Calls window.geometryOSApp methods via WebMCP tool handlers
 *   - Zero modifications to application.js
 *   - Silent fallback if WebMCP (navigator.modelContext) unavailable
 *
 * Core Tools (Phase A — Initial 4):
 *   1. navigate_map          — Pan/zoom the infinite canvas
 *   2. get_os_state          — Read-only OS context snapshot
 *   3. execute_pixel_program — Run code on the Pixel CPU
 *   4. load_rts_cartridge    — Mount .rts.png visual containers
 *
 * Phase B Tools:
 *   5. query_hilbert_address — Convert 1D Hilbert index to 2D coordinates
 *   6. trigger_evolution    — Trigger WGSL kernel evolution cycle
 *
 * Requirements: Chrome 146+ with WebMCP support
 * Fallback: Logs warning, app runs normally without WebMCP
 *
 * @version 1.2.0
 * @phase Phase B: Spatial Query Tools & Evolution Bridge
 * @date 2026-02-13
 */

class WebMCPBridge {

    /** @type {GeometryOSApplication|null} */
    #app = null;

    /** @type {boolean} */
    #registered = false;

    /** @type {boolean} */
    #webmcpAvailable = false;

    /** @type {string[]} */
    #registeredTools = [];

    /** @type {number} */
    #callCount = 0;

    /** @type {Object<string, number>} */
    #toolCallCounts = {};

    /** @type {WebSocket|null} */
    #evolutionSocket = null;

    constructor() {
        // Feature detection — is WebMCP available?
        this.#webmcpAvailable = typeof navigator !== 'undefined'
            && 'modelContext' in navigator;

        if (!this.#webmcpAvailable) {
            console.log('🔌 WebMCP: Not available (Chrome 146+ required). ' +
                'Visual Shell running in standard mode.');
            return;
        }

        console.log('🔌 WebMCP: API detected — waiting for Geometry OS initialization...');

        // Event-Driven: Wait for the OS to be fully initialized
        window.addEventListener('geometry-os-ready', () => {
            this.#app = window.geometryOSApp;
            if (this.#app) {
                this.#register();
            } else {
                console.warn('🔌 WebMCP: geometry-os-ready fired but window.geometryOSApp is null');
            }
        });

        // Safety: If the event already fired (late script loading), check immediately
        if (window.geometryOSApp && !this.#registered) {
            this.#app = window.geometryOSApp;
            this.#register();
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Registration
    // ─────────────────────────────────────────────────────────────

    async #register() {
        if (this.#registered) return;
        this.#registered = true;

        console.log('🔌 WebMCP: Registering Geometry OS tools...');

        try {
            await this.#registerNavigateMap();
            await this.#registerGetOSState();
            await this.#registerExecutePixelProgram();
            await this.#registerLoadRTSCartridge();

            // Phase B tools
            await this.#registerQueryHilbertAddress();
            await this.#registerTriggerEvolution();

            // Publish OS context alongside tools
            await this.#publishContext();

            console.log(`🔌 WebMCP: ✅ ${this.#registeredTools.length} tools registered:`);
            this.#registeredTools.forEach(name =>
                console.log(`   • ${name}`)
            );

        } catch (err) {
            console.error('🔌 WebMCP: Registration failed:', err);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 1: navigate_map
    // ─────────────────────────────────────────────────────────────

    async #registerNavigateMap() {
        const tool = {
            name: 'navigate_map',
            description:
                'Pan and zoom the Geometry OS infinite canvas to a specific ' +
                'spatial coordinate or named region. The infinite map uses a ' +
                'Hilbert curve spatial layout where each tile is 100x100 pixels.',
            inputSchema: {
                type: 'object',
                properties: {
                    x: {
                        type: 'number',
                        description: 'World X coordinate to center on (in grid units, 1 unit = 100px)'
                    },
                    y: {
                        type: 'number',
                        description: 'World Y coordinate to center on (in grid units, 1 unit = 100px)'
                    },
                    zoom: {
                        type: 'number',
                        description: 'Zoom level (0.1 = zoomed out, 1.0 = default, 5.0 = zoomed in)',
                        minimum: 0.05,
                        maximum: 10.0
                    },
                    region: {
                        type: 'string',
                        description: 'Named region shortcut (overrides x/y if provided)',
                        enum: [
                            'origin',
                            'antigravity_prime',
                            'neural_nursery',
                            'system_console'
                        ]
                    }
                }
            },
            handler: async (params) => {
                return this.#handleNavigateMap(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    #handleNavigateMap({ x, y, zoom, region }) {
        this.#trackCall('navigate_map');

        const viewport = this.#app.viewport;
        if (!viewport) {
            return { error: 'Viewport not initialized', success: false };
        }

        // Named region resolution
        const REGIONS = {
            origin: { x: 0, y: 0, zoom: 1.0 },
            antigravity_prime: { x: 8192, y: 8192, zoom: 0.5 },
            neural_nursery: { x: 1024, y: 1024, zoom: 1.0 },
            system_console: { x: 2, y: 2, zoom: 2.0 }
        };

        let targetX, targetY, targetZoom;

        if (region && REGIONS[region]) {
            const r = REGIONS[region];
            targetX = r.x * (this.#app.config?.gridSize || 100);
            targetY = r.y * (this.#app.config?.gridSize || 100);
            targetZoom = zoom ?? r.zoom;
        } else {
            const gridSize = this.#app.config?.gridSize || 100;
            targetX = (x ?? 0) * gridSize;
            targetY = (y ?? 0) * gridSize;
            targetZoom = zoom ?? 1.0;
        }

        // Apply navigation
        viewport.moveTo(targetX, targetY);
        if (typeof viewport.zoomTo === 'function') {
            viewport.zoomTo(targetZoom);
        }

        // Read back actual state
        const camera = viewport.getCamera();
        const bounds = viewport.getVisibleBoundsWithPadding
            ? viewport.getVisibleBoundsWithPadding(1.0)
            : null;

        return {
            success: true,
            camera: {
                x: camera.x,
                y: camera.y,
                zoom: camera.zoom
            },
            visibleBounds: bounds ? {
                left: bounds.left,
                top: bounds.top,
                right: bounds.right,
                bottom: bounds.bottom
            } : null,
            region: region || 'custom'
        };
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 2: get_os_state
    // ─────────────────────────────────────────────────────────────

    async #registerGetOSState() {
        const tool = {
            name: 'get_os_state',
            description:
                'Get a comprehensive read-only snapshot of the Geometry OS state. ' +
                'Returns camera position, active windows, loaded tiles, subsystem ' +
                'status, performance metrics, and evolution state. Use this to ' +
                'understand the current state before taking actions.',
            inputSchema: {
                type: 'object',
                properties: {
                    include: {
                        type: 'array',
                        items: {
                            type: 'string',
                            enum: [
                                'camera',
                                'windows',
                                'subsystems',
                                'performance',
                                'evolution',
                                'all'
                            ]
                        },
                        description: 'Which state sections to include (default: ["all"])'
                    }
                }
            },
            handler: async (params) => {
                return this.#handleGetOSState(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    #handleGetOSState({ include } = {}) {
        this.#trackCall('get_os_state');

        const sections = include && include.length > 0
            ? (include.includes('all') ? ['camera', 'windows', 'subsystems', 'performance', 'evolution'] : include)
            : ['camera', 'windows', 'subsystems', 'performance', 'evolution'];

        const state = {
            os: 'Geometry OS',
            paradigm: 'The Screen is the Hard Drive',
            timestamp: new Date().toISOString(),
            webmcp: {
                toolsRegistered: this.#registeredTools.length,
                totalCalls: this.#callCount,
                callBreakdown: { ...this.#toolCallCounts }
            }
        };

        // Camera state
        if (sections.includes('camera') && this.#app.viewport) {
            const camera = this.#app.viewport.getCamera();
            state.camera = {
                x: camera.x,
                y: camera.y,
                zoom: camera.zoom,
                gridX: Math.floor(camera.x / (this.#app.config?.gridSize || 100)),
                gridY: Math.floor(camera.y / (this.#app.config?.gridSize || 100))
            };
        }

        // Window Manager state
        if (sections.includes('windows') && this.#app.windowManager) {
            const wm = this.#app.windowManager;
            state.windows = {
                count: wm.windows ? wm.windows.length : 0,
                list: (wm.windows || []).map(w => ({
                    title: w.title || 'Untitled',
                    x: w.x,
                    y: w.y,
                    width: w.width,
                    height: w.height,
                    visible: w.visible !== false
                }))
            };
        }

        // Subsystem availability
        if (sections.includes('subsystems')) {
            state.subsystems = {
                viewport: !!this.#app.viewport,
                infiniteMap: !!this.#app.infiniteMap,
                computeSystem: !!this.#app.computeSystem,
                windowManager: !!this.#app.windowManager,
                cognitiveLayer: !!this.#app.cognitiveLayer,
                visualBootLoader: !!this.#app.visualBootLoader,
                linuxKernelLoader: !!this.#app.linuxKernelLoader,
                workbench: !!this.#app.workbench,
                tectonicManager: !!window.tectonicManager,
                saccadicPresets: !!window.saccadicPresets,
                evolutionEngine: typeof VisualEvolutionEngine !== 'undefined',
                holodeck: !!window.holodeck,
                tutorialManager: !!window.tutorialManager
            };
        }

        // Performance metrics
        if (sections.includes('performance')) {
            const ticker = this.#app.app?.ticker;
            state.performance = {
                fps: ticker ? Math.round(ticker.FPS) : null,
                deltaTime: ticker ? ticker.deltaMS : null,
                renderer: this.#app.app?.renderer?.type === 1 ? 'WebGPU' : 'WebGL',
                stageChildren: this.#app.app?.stage?.children?.length || 0,
                worldChildren: this.#app.worldContainer?.children?.length || 0
            };

            // Tectonic stats if available
            if (window.tectonicManager && typeof window.tectonicManager.getStats === 'function') {
                state.performance.tectonic = window.tectonicManager.getStats();
            }
        }

        // Evolution state
        if (sections.includes('evolution')) {
            state.evolution = {
                nurserySprite: !!this.#app.nurserySprite,
                engineAvailable: typeof VisualEvolutionEngine !== 'undefined'
            };
        }

        return state;
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 3: execute_pixel_program
    // ─────────────────────────────────────────────────────────────

    async #registerExecutePixelProgram() {
        const tool = {
            name: 'execute_pixel_program',
            description:
                'Execute a program on the Geometry OS Pixel CPU or GPU execution ' +
                'system. Can run brick programs (.brick), WASM modules, or inline ' +
                'RISC-V instructions. Returns execution trace and output.',
            inputSchema: {
                type: 'object',
                properties: {
                    mode: {
                        type: 'string',
                        enum: ['cpu', 'gpu', 'auto'],
                        description: 'Execution target (default: "auto" — GPU if available, else CPU)'
                    },
                    program: {
                        type: 'string',
                        description: 'Inline program source (RISC-V assembly, WGSL, or hex bytecode)'
                    },
                    brick_url: {
                        type: 'string',
                        description: 'URL to a .brick file to load and execute (alternative to inline program)'
                    },
                    entrypoint: {
                        type: 'string',
                        description: 'Function name to call as entry point (default: "main")'
                    },
                    args: {
                        type: 'array',
                        items: { type: 'number' },
                        description: 'Numeric arguments to pass to the program entry point'
                    },
                    trace: {
                        type: 'boolean',
                        description: 'Whether to return execution trace (default: true)'
                    }
                }
            },
            handler: async (params) => {
                return this.#handleExecutePixelProgram(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleExecutePixelProgram({
        mode = 'auto',
        program,
        brick_url,
        entrypoint = 'main',
        args = [],
        trace = true
    }) {
        this.#trackCall('execute_pixel_program');

        // Determine execution target
        const hasGPU = !!this.#app.computeSystem;
        const useCPU = mode === 'cpu' || (mode === 'auto' && !hasGPU);
        const useGPU = mode === 'gpu' || (mode === 'auto' && hasGPU);

        // Attempt GPU execution
        if (useGPU && this.#app.computeSystem) {
            try {
                const result = await this.#executeOnGPU(program, brick_url, entrypoint, args, trace);
                return { success: true, target: 'gpu', ...result };
            } catch (gpuErr) {
                if (mode === 'gpu') {
                    return { success: false, error: `GPU execution failed: ${gpuErr.message}`, target: 'gpu' };
                }
                // Auto mode: fall through to CPU
                console.warn('🔌 WebMCP: GPU execution failed, falling back to CPU:', gpuErr.message);
            }
        }

        // CPU fallback
        if (typeof PixelCPU !== 'undefined') {
            try {
                const result = await this.#executeOnCPU(program, brick_url, entrypoint, args, trace);
                return { success: true, target: 'cpu', ...result };
            } catch (cpuErr) {
                return { success: false, error: `CPU execution failed: ${cpuErr.message}`, target: 'cpu' };
            }
        }

        return {
            success: false,
            error: 'No execution system available (neither GPU ComputeSystem nor PixelCPU found)',
            target: 'none'
        };
    }

    async #executeOnGPU(program, brick_url, entrypoint, args, trace) {
        const cs = this.#app.computeSystem;

        if (brick_url) {
            // Load brick file and execute
            const response = await fetch(brick_url);
            const buffer = await response.arrayBuffer();
            const result = cs.executeBrick
                ? await cs.executeBrick(buffer, entrypoint, args)
                : { output: 'executeBrick not yet implemented' };
            return {
                output: result.output,
                trace: trace ? (result.trace || []) : undefined,
                instructions: result.instructionCount || 0
            };
        }

        if (program) {
            // Execute inline program
            const result = cs.executeInline
                ? await cs.executeInline(program, entrypoint, args)
                : { output: 'executeInline not yet implemented' };
            return {
                output: result.output,
                trace: trace ? (result.trace || []) : undefined,
                instructions: result.instructionCount || 0
            };
        }

        return { output: null, error: 'No program or brick_url provided' };
    }

    async #executeOnCPU(program, brick_url, entrypoint, args, trace) {
        const cpu = new PixelCPU();

        if (brick_url) {
            const response = await fetch(brick_url);
            const buffer = await response.arrayBuffer();
            cpu.loadCode(new Uint8Array(buffer));
        } else if (program) {
            // Attempt to parse as hex bytecode
            const bytes = this.#parseProgram(program);
            cpu.loadCode(bytes);
        } else {
            return { output: null, error: 'No program or brick_url provided' };
        }

        const result = cpu.execute(entrypoint, args);
        return {
            output: result?.result ?? result,
            trace: trace ? (cpu.getTrace?.() || []) : undefined,
            instructions: cpu.instructionCount || 0
        };
    }

    #parseProgram(source) {
        // Try hex first
        if (/^[0-9a-fA-F\s]+$/.test(source.trim())) {
            const hex = source.replace(/\s+/g, '');
            const bytes = new Uint8Array(hex.length / 2);
            for (let i = 0; i < bytes.length; i++) {
                bytes[i] = parseInt(hex.substr(i * 2, 2), 16);
            }
            return bytes;
        }
        // Otherwise treat as text source — encode as UTF-8
        return new TextEncoder().encode(source);
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 4: load_rts_cartridge
    // ─────────────────────────────────────────────────────────────

    async #registerLoadRTSCartridge() {
        const tool = {
            name: 'load_rts_cartridge',
            description:
                'Load and mount a PixelRTS v2 cartridge (.rts.png) into the infinite ' +
                'map for visual inspection and execution. The cartridge is decoded ' +
                'from its RGBA Hilbert-mapped encoding and placed at the specified ' +
                'grid position. Returns metadata including SHA256 hash, dimensions, ' +
                'and embedded file list.',
            inputSchema: {
                type: 'object',
                properties: {
                    url: {
                        type: 'string',
                        description: 'URL to the .rts.png file (can be relative or absolute)'
                    },
                    position: {
                        type: 'object',
                        description: 'Grid position to place the cartridge on the infinite map',
                        properties: {
                            x: { type: 'number', description: 'Grid X coordinate' },
                            y: { type: 'number', description: 'Grid Y coordinate' }
                        }
                    },
                    autoNavigate: {
                        type: 'boolean',
                        description: 'Whether to pan the view to the loaded cartridge (default: true)'
                    }
                },
                required: ['url']
            },
            handler: async (params) => {
                return this.#handleLoadRTSCartridge(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleLoadRTSCartridge({ url, position, autoNavigate = true }) {
        this.#trackCall('load_rts_cartridge');

        try {
            // Load the image
            const response = await fetch(url);
            if (!response.ok) {
                return { success: false, error: `Failed to fetch ${url}: ${response.status} ${response.statusText}` };
            }

            const blob = await response.blob();
            const imageBitmap = await createImageBitmap(blob);

            // Create PixiJS texture from the loaded image
            const canvas = document.createElement('canvas');
            canvas.width = imageBitmap.width;
            canvas.height = imageBitmap.height;
            const ctx = canvas.getContext('2d');
            ctx.drawImage(imageBitmap, 0, 0);

            // Extract pixel data for analysis
            const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
            const pixelCount = canvas.width * canvas.height;
            const byteCount = pixelCount * 4; // RGBA

            // Calculate simple hash for verification
            const hashBuffer = await crypto.subtle.digest('SHA-256',
                imageData.data.buffer
            );
            const hashArray = Array.from(new Uint8Array(hashBuffer));
            const sha256 = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

            // Calculate entropy (color distribution)
            const colorCounts = {};
            for (let i = 0; i < imageData.data.length; i += 4) {
                const key = `${imageData.data[i]},${imageData.data[i + 1]},${imageData.data[i + 2]}`;
                colorCounts[key] = (colorCounts[key] || 0) + 1;
            }
            const uniqueColors = Object.keys(colorCounts).length;

            // Create PixiJS sprite and place on map
            const texture = PIXI.Texture.from(canvas);
            const sprite = new PIXI.Sprite(texture);

            const gridSize = this.#app.config?.gridSize || 100;
            const posX = (position?.x ?? 0) * gridSize;
            const posY = (position?.y ?? 0) * gridSize;
            sprite.x = posX;
            sprite.y = posY;

            // Scale to reasonable size on the map
            const maxDim = Math.max(canvas.width, canvas.height);
            const scale = (gridSize * 4) / maxDim; // 4 tiles wide
            sprite.scale.set(scale);

            // Add label
            const label = new PIXI.Text(url.split('/').pop(), {
                fontFamily: 'Courier New',
                fontSize: 14,
                fill: 0x00FFFF,
                dropShadow: true,
                dropShadowColor: 0x000000,
                dropShadowDistance: 1
            });
            label.y = -20;
            sprite.addChild(label);

            // Add to world
            if (this.#app.worldContainer) {
                this.#app.worldContainer.addChild(sprite);
            }

            // Auto-navigate to the cartridge
            if (autoNavigate && this.#app.viewport) {
                this.#handleNavigateMap({
                    x: position?.x ?? 0,
                    y: position?.y ?? 0,
                    zoom: 1.5
                });
            }

            return {
                success: true,
                url: url,
                dimensions: `${canvas.width}x${canvas.height}`,
                pixelCount: pixelCount,
                byteCount: byteCount,
                sha256: sha256,
                uniqueColors: uniqueColors,
                position: { x: posX, y: posY },
                gridPosition: { x: position?.x ?? 0, y: position?.y ?? 0 },
                scale: scale
            };

        } catch (err) {
            return {
                success: false,
                error: `Failed to load RTS cartridge: ${err.message}`,
                url: url
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 5: query_hilbert_address (Phase B)
    // ─────────────────────────────────────────────────────────────

    async #registerQueryHilbertAddress() {
        const tool = {
            name: 'query_hilbert_address',
            description:
                'Convert a 1D Hilbert curve index to 2D (x, y) coordinates and ' +
                'optionally read pixel data at that location. The Hilbert curve ' +
                'preserves spatial locality, making nearby indices map to nearby ' +
                'coordinates. This is fundamental to Geometry OS spatial addressing.',
            inputSchema: {
                type: 'object',
                properties: {
                    hilbert_index: {
                        type: 'number',
                        description: 'The 1D Hilbert curve index to convert (must be non-negative)'
                    },
                    grid_size: {
                        type: 'number',
                        description: 'Size of the Hilbert curve grid (must be power of 2, default: 256)',
                        default: 256
                    },
                    read_pixels: {
                        type: 'boolean',
                        description: 'Whether to read pixel data at the computed coordinates (default: true)',
                        default: true
                    },
                    context_range: {
                        type: 'number',
                        description: 'Radius of surrounding pixels to include when reading (0-10, default: 0)',
                        default: 0,
                        minimum: 0,
                        maximum: 10
                    }
                },
                required: ['hilbert_index']
            },
            handler: async (params) => {
                return this.#handleQueryHilbertAddress(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleQueryHilbertAddress({
        hilbert_index,
        grid_size = 256,
        read_pixels = true,
        context_range = 0
    }) {
        this.#trackCall('query_hilbert_address');

        // Validate hilbert_index is a non-negative number
        if (typeof hilbert_index !== 'number' || !Number.isFinite(hilbert_index)) {
            return {
                success: false,
                error: 'hilbert_index must be a finite number',
                error_code: 'INVALID_INPUT'
            };
        }

        if (hilbert_index < 0) {
            return {
                success: false,
                error: 'hilbert_index must be non-negative',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate index is within grid bounds
        const maxIndex = grid_size * grid_size;
        if (hilbert_index >= maxIndex) {
            return {
                success: false,
                error: `hilbert_index ${hilbert_index} exceeds grid capacity (${maxIndex} for ${grid_size}x${grid_size})`,
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate grid_size is power of 2
        if (!Number.isInteger(grid_size) || grid_size < 1 || (grid_size & (grid_size - 1)) !== 0) {
            return {
                success: false,
                error: 'grid_size must be a positive power of 2 (e.g., 64, 128, 256, 512)',
                error_code: 'INVALID_INPUT'
            };
        }

        // Check HilbertLUT is available
        if (typeof HilbertLUT === 'undefined' || !HilbertLUT.d2xy) {
            return {
                success: false,
                error: 'HilbertLUT not available — ensure hilbert_lut.js is loaded',
                error_code: 'BACKEND_UNAVAILABLE'
            };
        }

        try {
            // Convert 1D Hilbert index to 2D coordinates
            const [x, y] = HilbertLUT.d2xy(grid_size, hilbert_index);

            const result = {
                success: true,
                hilbert_index: hilbert_index,
                grid_size: grid_size,
                coordinates: { x, y }
            };

            // Optionally read pixel data at the world position
            if (read_pixels && this.#app.worldContainer) {
                const pixelData = this.#readPixelAtWorld(x, y, context_range);
                result.rgba = pixelData.center;
                if (context_range > 0) {
                    result.context = pixelData.context || [];
                }
            }

            return result;

        } catch (err) {
            return {
                success: false,
                error: `Hilbert conversion failed: ${err.message}`,
                error_code: 'INVALID_INPUT'
            };
        }
    }

    /**
     * Read pixel data at world coordinates (stub implementation)
     *
     * NOTE: This is a placeholder. Actual GPU framebuffer reading requires
     * integration with the extract plugin or PixiJS renderer.extract API.
     *
     * @param {number} x - World X coordinate
     * @param {number} y - World Y coordinate
     * @param {number} range - Radius of surrounding pixels to include
     * @returns {Object} Pixel data (currently placeholder)
     */
    #readPixelAtWorld(x, y, range = 0) {
        // Placeholder implementation
        // Full implementation would use:
        // - renderer.extract.pixels() for GPU readback
        // - Or worldContainer.toDataURL() for canvas capture
        // - With Hilbert inverse mapping for dense storage

        return {
            center: { r: 0, g: 0, b: 0, a: 0 },
            context: []  // Placeholder for surrounding pixel values when range > 0
        };
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 6: trigger_evolution (Phase B)
    // ─────────────────────────────────────────────────────────────

    /**
     * Connect to the evolution WebSocket backend
     * @returns {Promise<WebSocket>}
     */
    #connectEvolutionSocket() {
        return new Promise((resolve, reject) => {
            if (this.#evolutionSocket?.readyState === WebSocket.OPEN) {
                resolve(this.#evolutionSocket);
                return;
            }

            const ws = new WebSocket('ws://localhost:8765/evolution');

            ws.onopen = () => {
                this.#evolutionSocket = ws;
                resolve(ws);
            };

            ws.onerror = () => {
                reject(new Error('Evolution backend not running at ws://localhost:8765'));
            };

            // 5 second timeout
            setTimeout(() => {
                if (ws.readyState !== WebSocket.OPEN) {
                    reject(new Error('Evolution backend connection timeout'));
                }
            }, 5000);
        });
    }

    async #registerTriggerEvolution() {
        const tool = {
            name: 'trigger_evolution',
            description:
                'Trigger a WGSL kernel evolution cycle on the visual evolution engine. ' +
                'This connects to a WebSocket backend that runs genetic algorithm optimization ' +
                'on shader code, evolving for performance, visual quality, correctness, or entropy. ' +
                'Returns the best evolved shader along with fitness metrics and cartridge ID.',
            inputSchema: {
                type: 'object',
                properties: {
                    seed_shader: {
                        type: 'string',
                        description: 'Initial WGSL shader code to evolve (required)'
                    },
                    generations: {
                        type: 'number',
                        description: 'Number of evolution generations to run (default: 10)',
                        default: 10,
                        minimum: 1,
                        maximum: 100
                    },
                    fitness_metric: {
                        type: 'string',
                        description: 'Fitness function to optimize (default: "performance")',
                        enum: ['performance', 'visual_quality', 'correctness', 'entropy'],
                        default: 'performance'
                    },
                    mutation_rate: {
                        type: 'number',
                        description: 'Mutation rate for genetic algorithm (default: 0.1)',
                        default: 0.1,
                        minimum: 0.01,
                        maximum: 0.5
                    },
                    population_size: {
                        type: 'number',
                        description: 'Population size per generation (default: 20)',
                        default: 20
                    }
                },
                required: ['seed_shader']
            },
            handler: async (params) => {
                return this.#handleTriggerEvolution(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleTriggerEvolution({
        seed_shader,
        generations = 10,
        fitness_metric = 'performance',
        mutation_rate = 0.1,
        population_size = 20
    }) {
        this.#trackCall('trigger_evolution');

        // Validate seed_shader is required and is a string
        if (typeof seed_shader !== 'string' || seed_shader.trim().length === 0) {
            return {
                success: false,
                error: 'seed_shader is required and must be a non-empty string',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate generations
        if (!Number.isInteger(generations) || generations < 1 || generations > 100) {
            return {
                success: false,
                error: 'generations must be an integer between 1 and 100',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate mutation_rate
        if (typeof mutation_rate !== 'number' || mutation_rate < 0.01 || mutation_rate > 0.5) {
            return {
                success: false,
                error: 'mutation_rate must be a number between 0.01 and 0.5',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Connect to WebSocket backend
            const ws = await this.#connectEvolutionSocket();

            // Generate unique request ID
            const requestId = `evo_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;

            // Create promise for response with matching requestId
            const responsePromise = new Promise((resolve, reject) => {
                const timeoutId = setTimeout(() => {
                    reject(new Error('Evolution execution timeout (60s)'));
                }, 60000);

                const messageHandler = (event) => {
                    try {
                        const response = JSON.parse(event.data);
                        if (response.requestId === requestId) {
                            clearTimeout(timeoutId);
                            ws.removeEventListener('message', messageHandler);
                            resolve(response);
                        }
                    } catch (parseErr) {
                        // Ignore parse errors for non-matching messages
                    }
                };

                ws.addEventListener('message', messageHandler);
            });

            // Send evolution request
            const request = {
                requestId,
                action: 'evolve',
                seed_shader,
                generations,
                fitness_metric,
                mutation_rate,
                population_size
            };

            ws.send(JSON.stringify(request));

            // Wait for response
            const response = await responsePromise;

            // Check for backend errors
            if (!response.success) {
                return {
                    success: false,
                    error: response.error || 'Evolution backend returned failure',
                    error_code: 'EXECUTION_FAILED'
                };
            }

            // Return successful evolution result
            return {
                success: true,
                bestFitness: response.bestFitness,
                generationsCompleted: response.generationsCompleted || generations,
                evolvedShader: response.evolvedShader,
                cartridgeId: response.cartridgeId
            };

        } catch (err) {
            // Determine error code based on error type
            let errorCode = 'EXECUTION_FAILED';
            if (err.message.includes('backend not running') || err.message.includes('connection')) {
                errorCode = 'BACKEND_UNAVAILABLE';
            } else if (err.message.includes('timeout')) {
                errorCode = 'EXECUTION_FAILED';
            }

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Context Publisher
    // ─────────────────────────────────────────────────────────────

    async #publishContext() {
        if (!navigator.modelContext?.provideContext) {
            // provideContext may not be available in all WebMCP implementations
            console.log('🔌 WebMCP: provideContext not available — tools-only mode');
            return;
        }

        try {
            await navigator.modelContext.provideContext({
                name: 'Geometry OS',
                description:
                    'A visual operating system where the screen is the hard drive. ' +
                    'Software is stored as PixelRTS v2 visual containers (.rts.png) ' +
                    'with Hilbert curve spatial mapping. The infinite canvas is ' +
                    'navigable in 2D with pan/zoom controls.',
                context: {
                    os_name: 'Geometry OS',
                    paradigm: 'The Screen is the Hard Drive',
                    rendering_engine: 'PixiJS v8 (WebGPU)',
                    spatial_mapping: 'Hilbert Curve (1D→2D locality preserving)',
                    file_format: 'PixelRTS v2 (.rts.png)',
                    encoding: 'RGBA 4 bytes/pixel dense packing',
                    verification: 'SHA256 embedded hashes',
                    grid_size: this.#app.config?.gridSize || 100,
                    named_regions: {
                        origin: { x: 0, y: 0, description: 'Map origin' },
                        antigravity_prime: { x: 8192, y: 8192, description: 'Core cognitive layer' },
                        neural_nursery: { x: 1024, y: 1024, description: 'Evolution spawn point' },
                        system_console: { x: 2, y: 2, description: 'System console window' }
                    },
                    controls: {
                        pan: 'Middle mouse drag',
                        zoom: 'Mouse wheel',
                        drag_window: 'Left click + drag on title bar'
                    }
                }
            });

            console.log('🔌 WebMCP: Context published successfully');
        } catch (err) {
            console.warn('🔌 WebMCP: Failed to publish context:', err.message);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Observability
    // ─────────────────────────────────────────────────────────────

    #trackCall(toolName) {
        this.#callCount++;
        this.#toolCallCounts[toolName] = (this.#toolCallCounts[toolName] || 0) + 1;
    }

    /**
     * Get bridge diagnostics (callable from DevTools console)
     * @returns {Object} Bridge status and metrics
     */
    getStatus() {
        return {
            available: this.#webmcpAvailable,
            registered: this.#registered,
            tools: [...this.#registeredTools],
            totalCalls: this.#callCount,
            callBreakdown: { ...this.#toolCallCounts },
            appConnected: !!this.#app
        };
    }
}

// ─────────────────────────────────────────────────────────────────
// Auto-Initialize
// ─────────────────────────────────────────────────────────────────

// Expose globally for DevTools inspection
window.webmcpBridge = new WebMCPBridge();

console.log('📡 WebMCP Bridge loaded — "The Screen is the Hard Drive, and now the API surface."');
