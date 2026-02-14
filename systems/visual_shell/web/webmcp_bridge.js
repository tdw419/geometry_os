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
 *   7. send_llm_prompt      — Send prompt to LM Studio for AI-to-AI communication
 *   8. spawn_area_agent      — Create autonomous area agents
 *
 * Phase D Tools (A2A Protocol):
 *   9. send_a2a_message       — Send A2A messages to other agents
 *  10. discover_a2a_agents    — Query A2A agent registry
 *  11. a2a_coordination       — Distributed coordination (locks, barriers)
 *
 * Phase F Tools (AI-Driven Visual Builder):
 *  15. builder_place_tile        — Place tiles on the infinite map
 *  16. builder_load_shader       — Load WGSL shader into builder
 *  17. builder_evolve_shader     — Evolve shader with genetic algorithms
 *  18. builder_assemble_cartridge — Assemble PixelRTS cartridge from region
 *  19. builder_preview           — Capture preview image of build
 *  20. builder_get_state         — Get current builder state
 *
 * Area Agent A2A Integration:
 *   - spawn_area_agent now supports full A2A protocol
 *   - Agents can discover each other via registry
 *   - Agents can coordinate via locks and barriers
 *   - Agents can publish/subscribe to topics
 *   - Agents can send direct messages
 *
 * Phase E Features:
 *   - Health monitoring for WebSocket backends
 *   - Connection status tracking (connected/disconnected/connecting)
 *   - Health status in get_os_state response
 *   - Health event notifications (onHealthChange callback)
 *
 * Requirements: Chrome 146+ with WebMCP support
 * Fallback: Logs warning, app runs normally without WebMCP
 *
 * @version 1.7.0
 * @phase Phase F: AI-Driven Visual Builder
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

    /** @type {WebSocket|null} */
    #agentSocket = null;

    /** @type {A2AMessageRouter|null} */
    #a2aRouter = null;

    /** @type {Map<string, Object>} */
    #a2aRegistry = new Map();

    /** @type {Map<string, A2AMessageRouter>} */
    #spawnedAgents = new Map();

    /** @type {Map<string, A2AMessageRouter>} */
    #agentA2AClients = new Map();

    /** @type {WebSocket|null} */
    #a2aSocket = null;

    /** @type {Map<string, {resolve: Function, reject: Function}>} */
    #pendingA2ARequests = new Map();

    /** @type {VisionCortex|null} */
    #visionCortex = null;

    // ─────────────────────────────────────────────────────────────
    // Health Monitoring (Phase E)
    // ─────────────────────────────────────────────────────────────

    /** @type {Object} */
    #healthStatus = {
        webmcp: 'unknown',
        evolutionSocket: 'disconnected',
        agentSocket: 'disconnected',
        lastCheck: 0
    };

    /** @type {number|null} */
    #healthCheckInterval = null;

    /** @type {Set<Function>} */
    #healthCallbacks = new Set();

    // ─────────────────────────────────────────────────────────────
    // Circuit Breaker (Phase E)
    // ─────────────────────────────────────────────────────────────

    /** @type {string} Circuit breaker state: CLOSED | OPEN | HALF_OPEN */
    #circuitBreakerState = 'CLOSED';

    /** @type {number} Consecutive failure count */
    #circuitBreakerFailures = 0;

    /** @type {number} Timestamp of last failure */
    #circuitBreakerLastFailure = 0;

    /** @type {number} Timestamp when circuit opened */
    #circuitBreakerOpenedAt = 0;

    /** @type {number} Number of successful calls in HALF_OPEN state */
    #circuitBreakerHalfOpenCalls = 0;

    /** @type {Object} Circuit breaker metrics */
    #circuitBreakerMetrics = {
        stateTransitions: [],
        totalFailures: 0,
        totalSuccesses: 0,
        openCount: 0,
        lastOpenDuration: 0,
        tripsCount: 0
    };

    /** @type {Object} Circuit breaker configuration */
    #circuitBreakerConfig = {
        failureThreshold: 5,          // Trip after N consecutive failures
        resetTimeout: 30000,           // 30s before trying HALF_OPEN
        halfOpenMaxCalls: 3,          // Max calls allowed in HALF_OPEN
        successThreshold: 2            // Successes needed to close circuit
    };

    // ─────────────────────────────────────────────────────────────
    // Retry with Exponential Backoff (Phase E)
    // ─────────────────────────────────────────────────────────────

    /**
     * Retry configuration for Phase E: Resilience
     * Exponential backoff with jitter prevents thundering herd
     * @type {Object}
     */
    #retryConfig = {
        maxRetries: 3,
        baseDelay: 100,      // ms - starting delay
        maxDelay: 30000,     // ms - 30 seconds cap
        jitterFactor: 0.2    // 20% random jitter
    };

    /**
     * Per-tool retry overrides for specific operations
     * @type {Map<string, Object>}
     */
    #toolRetryConfig = new Map([
        ['connectEvolutionSocket', { maxRetries: 5, baseDelay: 200 }],
        ['connectAgentSocket', { maxRetries: 5, baseDelay: 200 }],
        ['sendLLMPrompt', { maxRetries: 2, baseDelay: 500 }],
        ['sendA2AMessage', { maxRetries: 4, baseDelay: 150 }],
        ['fetch', { maxRetries: 3, baseDelay: 100 }]
    ]);

    /**
     * Retry metrics for monitoring
     * @type {Object}
     */
    #retryMetrics = {
        totalRetries: 0,
        successfulRetries: 0,
        failedRetries: 0,
        byOperation: new Map()
    };

    // ─────────────────────────────────────────────────────────────
    // Retry Helper Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Execute an async operation with exponential backoff retry
     * @param {Function} operation - Async function to execute
     * @param {string} operationName - For logging and metrics
     * @param {Object} config - Override retry config
     * @returns {Promise<*>} Result of operation
     * @throws {Error} Last error if all retries exhausted
     */
    async #withRetry(operation, operationName, config = {}) {
        const mergedConfig = { ...this.#retryConfig, ...config };
        const {
            maxRetries,
            baseDelay,
            maxDelay,
            jitterFactor
        } = mergedConfig;

        let lastError;
        let attempt = 0;

        // Initialize operation metrics
        if (!this.#retryMetrics.byOperation.has(operationName)) {
            this.#retryMetrics.byOperation.set(operationName, {
                attempts: 0,
                successes: 0,
                failures: 0,
                totalDelayMs: 0
            });
        }
        const metrics = this.#retryMetrics.byOperation.get(operationName);

        for (attempt = 0; attempt <= maxRetries; attempt++) {
            try {
                const result = await operation();

                // Update metrics
                metrics.attempts++;
                metrics.successes++;

                // Log retry recovery
                if (attempt > 0) {
                    this.#retryMetrics.totalRetries++;
                    this.#retryMetrics.successfulRetries++;
                    console.log(
                        `🔌 WebMCP: ${operationName} succeeded on attempt ${attempt + 1}`
                    );
                }

                return result;

            } catch (err) {
                lastError = err;
                metrics.attempts++;

                // No more retries
                if (attempt >= maxRetries) {
                    metrics.failures++;
                    this.#retryMetrics.failedRetries++;
                    break;
                }

                // Calculate exponential backoff with jitter
                const exponentialDelay = baseDelay * Math.pow(2, attempt);
                const cappedDelay = Math.min(exponentialDelay, maxDelay);
                const jitter = cappedDelay * jitterFactor * Math.random();
                const totalDelay = cappedDelay + jitter;
                metrics.totalDelayMs += totalDelay;

                console.warn(
                    `🔌 WebMCP: ${operationName} failed (attempt ${attempt + 1}/${maxRetries + 1}), ` +
                    `retrying in ${(totalDelay / 1000).toFixed(2)}s: ${err.message}`
                );

                await this.#sleep(totalDelay);
            }
        }

        // All retries exhausted
        console.error(
            `🔌 WebMCP: ${operationName} failed after ${attempt} attempts`
        );
        throw lastError;
    }

    /**
     * Promise-based sleep/delay utility
     * @param {number} ms - Milliseconds to sleep
     * @returns {Promise<void>}
     */
    #sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * Get retry config for a specific operation name
     * @param {string} operationName - Operation identifier
     * @returns {Object} Retry config for this operation
     */
    #getRetryConfig(operationName) {
        return this.#toolRetryConfig.get(operationName) || {};
    }

    /**
     * Wrap a WebSocket connection with retry logic
     * @param {Function} connectFn - Function that returns a Promise<WebSocket>
     * @param {string} socketName - For logging and config lookup
     * @returns {Promise<WebSocket>}
     */
    async #retryWebSocketConnect(connectFn, socketName) {
        const configKey = `connect${socketName}`;
        return this.#withRetry(
            connectFn,
            `connect${socketName}`,
            this.#getRetryConfig(configKey)
        );
    }

    /**
     * Wrap an HTTP fetch with retry logic
     * @param {string} url - URL to fetch
     * @param {Object} options - Fetch options
     * @param {Object} retryConfig - Optional retry override
     * @returns {Promise<Response>}
     */
    async #retryFetch(url, options = {}, retryConfig = {}) {
        return this.#withRetry(
            () => fetch(url, options),
            `fetch(${url})`,
            { ...this.#getRetryConfig('fetch'), ...retryConfig }
        );
    }

    /**
     * Get retry metrics for health reporting
     * @returns {Object} Retry metrics snapshot
     */
    #getRetryMetrics() {
        const byOp = {};
        for (const [name, metrics] of this.#retryMetrics.byOperation) {
            byOp[name] = { ...metrics };
        }
        return {
            totalRetries: this.#retryMetrics.totalRetries,
            successfulRetries: this.#retryMetrics.successfulRetries,
            failedRetries: this.#retryMetrics.failedRetries,
            successRate: this.#retryMetrics.totalRetries > 0
                ? (this.#retryMetrics.successfulRetries / this.#retryMetrics.totalRetries * 100).toFixed(2) + '%'
                : 'N/A',
            byOperation: byOp
        };
    }

    constructor() {
        // Feature detection — is WebMCP available?
        this.#webmcpAvailable = typeof navigator !== 'undefined'
            && 'modelContext' in navigator;

        // Initialize VisionCortex if available
        if (typeof VisionCortex !== 'undefined') {
            this.#visionCortex = new VisionCortex({
                cacheTTL: 500,
                cacheMaxSize: 50,
                defaultScale: 1.0,
                lazyLoad: true
            });
            console.log('🔌 WebMCP: VisionCortex initialized');
        } else {
            console.warn('🔌 WebMCP: VisionCortex not found (OCR features disabled)');
        }

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

        // Start health monitoring (runs every 10s)
        this.#startHealthMonitoring();

        // DEBUG: Expose tool invocation for demos
        window.invokeWebMCPTool = async (name, args) => {
            const tool = this.#registeredTools.find(t => t === name);
            if (!tool) throw new Error(`Tool ${name} not found`);
            // We need to find the handler. Since we didn't store handlers by name in a map we can access easily (we pushed names to #registeredTools array), 
            // we should have stored them. 
            // actually, we can't easily access the closures.
            // Let's rely on navigator.modelContext if it exists.
            if (navigator.modelContext && navigator.modelContext.toolHandlers) {
                return await navigator.modelContext.toolHandlers[name](args);
            }
            console.warn("Cannot invoke tool - no modelContext or toolHandlers map");
        };
    }

    // ─────────────────────────────────────────────────────────────
    // Health Monitoring (Phase E)
    // ─────────────────────────────────────────────────────────────

    /**
     * Start periodic health monitoring
     * @private
     */
    #startHealthMonitoring() {
        if (typeof window === 'undefined') return;

        this.#healthCheckInterval = setInterval(() => {
            this.#performHealthCheck();
        }, 10000);  // Every 10 seconds

        // Initial check
        this.#performHealthCheck();

        console.log('🏥 WebMCP: Health monitoring started');
    }

    /**
     * Perform health check on all components
     * @private
     */
    #performHealthCheck() {
        const previousStatus = { ...this.#healthStatus };

        // Check WebMCP availability
        this.#healthStatus.webmcp = this.#webmcpAvailable ? 'healthy' : 'unavailable';

        // Check evolution socket connection
        this.#healthStatus.evolutionSocket = this.#evolutionSocket?.readyState === WebSocket.OPEN
            ? 'connected'
            : this.#evolutionSocket?.readyState === WebSocket.CONNECTING
                ? 'connecting'
                : 'disconnected';

        // Check agent socket connection
        this.#healthStatus.agentSocket = this.#agentSocket?.readyState === WebSocket.OPEN
            ? 'connected'
            : this.#agentSocket?.readyState === WebSocket.CONNECTING
                ? 'connecting'
                : 'disconnected';

        this.#healthStatus.lastCheck = Date.now();

        // Notify listeners if status changed
        if (JSON.stringify(previousStatus) !== JSON.stringify(this.#healthStatus)) {
            this.#notifyHealthChange(this.#healthStatus);
        }
    }

    /**
     * Notify health status change listeners
     * @param {Object} status - Current health status
     * @private
     */
    #notifyHealthChange(status) {
        this.#healthCallbacks.forEach(cb => {
            try {
                cb(status);
            } catch (err) {
                console.error('🏥 WebMCP: Health callback error:', err);
            }
        });
    }

    /**
     * Subscribe to health status changes
     * @param {Function} callback - Function to call on status change
     * @returns {Function} Unsubscribe function
     */
    onHealthChange(callback) {
        this.#healthCallbacks.add(callback);
        return () => this.#healthCallbacks.delete(callback);
    }

    /**
     * Get current health status
     * @returns {Object} Health status snapshot
     */
    getHealthStatus() {
        return { ...this.#healthStatus };
    }

    /**
     * Stop health monitoring (for cleanup)
     * @private
     */
    #stopHealthMonitoring() {
        if (this.#healthCheckInterval) {
            clearInterval(this.#healthCheckInterval);
            this.#healthCheckInterval = null;
            console.log('🏥 WebMCP: Health monitoring stopped');
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
            await this.#registerSendLLMPrompt();
            await this.#registerSpawnAreaAgent();

            // Phase D tools (A2A)
            await this.#registerSendA2AMessage();
            await this.#registerDiscoverA2AAgents();
            await this.#registerA2ACoordination();

            // Phase D tools - A2A Protocol (WebSocket-based)
            await this.#registerA2ASendMessage();
            await this.#registerA2ABroadcast();
            await this.#registerA2ASubscribe();

            // Phase D tools - Coordination Primitives
            await this.#registerA2AAcquireLock();
            await this.#registerA2AReleaseLock();
            await this.#registerA2ABarrierEnter();

            // Phase D tools - Task Delegation
            await this.#registerA2AAssignTask();
            await this.#registerA2AReportProgress();
            await this.#registerA2AGetTaskResult();

            // Phase F tools - AI-Driven Visual Builder
            await this.#registerBuilderPlaceTile();
            await this.#registerBuilderLoadShader();
            await this.#registerBuilderEvolveShader();
            await this.#registerBuilderAssembleCartridge();
            await this.#registerBuilderPreview();
            await this.#registerBuilderGetState();

            // Phase G tools - Session Management
            await this.#registerSessionCreate();
            await this.#registerSessionJoin();
            await this.#registerSessionLeave();
            await this.#registerSessionGetState();

            // Phase G tools - Region Management
            await this.#registerRegionClaim();
            await this.#registerRegionRelease();
            await this.#registerRegionQuery();

            // Phase G tools - Task Delegation
            await this.#registerTaskDelegate();
            await this.#registerTaskAccept();
            await this.#registerTaskReport();
            await this.#registerTaskGetQueue();

            // Phase G tools - Build Checkpointing
            await this.#registerBuildCheckpoint();
            await this.#registerBuildRollback();

            // Phase G tools - Linux Control
            await this.#registerLinuxStatus();
            await this.#registerLinuxBoot();
            await this.#registerLinuxExec();
            await this.#registerLinuxReadFile();
            await this.#registerLinuxWriteFile();

            // Phase H tools - WGPU Hypervisor (Pure Client-Side)
            await this.#registerHypervisorBoot();
            await this.#registerHypervisorInput();
            await this.#registerHypervisorFrame();
            await this.#registerHypervisorReadText();
            await this.#registerHypervisorFindElement();
            await this.#registerHypervisorSetPageTable();
            await this.#registerHypervisorMapPage();

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
    // Phase H: Hypervisor Tools
    // ─────────────────────────────────────────────────────────────

    /**
     * Helper to get canvas from hypervisor framebuffer
     * @returns {Promise<HTMLCanvasElement|null>}
     */
    async #getHypervisorCanvas() {
        if (!window.hypervisorSystem) return null;

        try {
            const base64 = await window.hypervisorSystem.captureFrame('main_cpu');
            if (!base64) return null;

            return new Promise((resolve) => {
                const img = new Image();
                img.onload = () => {
                    const canvas = document.createElement('canvas');
                    canvas.width = img.width;
                    canvas.height = img.height;
                    const ctx = canvas.getContext('2d');
                    ctx.drawImage(img, 0, 0);
                    resolve(canvas);
                };
                img.onerror = () => resolve(null);
                img.src = base64.startsWith('data:') ? base64 : `data:image/png;base64,${base64}`;
            });
        } catch (e) {
            console.error('VisionCortex: Failed to capture frame', e);
            return null;
        }
    }

    async #registerHypervisorBoot() {
        const tool = {
            name: 'hypervisor_boot',
            description: 'Boot a Linux kernel directly on the GPU using WebGPU. No backend required.',
            inputSchema: {
                type: 'object',
                properties: {
                    kernel_url: { type: 'string', description: 'URL to the .rts.png kernel cartridge' },
                    memory_mb: { type: 'number', description: 'Memory size in MB (default 64)' },
                    mounts: {
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                url: { type: 'string' },
                                path: { type: 'string' }
                            }
                        },
                        description: 'List of files to mount into the virtual filesystem'
                    }
                },
                required: ['kernel_url']
            },
            handler: async (params) => {
                if (!window.GPUExecutionSystem) {
                    return { success: false, error: 'GPUExecutionSystem not loaded' };
                }

                // Ensure singleton exists
                if (!window.hypervisorSystem) {
                    if (!this.#app?.renderer?.device) {
                        return { success: false, error: 'WebGPU Device not available' };
                    }
                    window.hypervisorSystem = new window.GPUExecutionSystem(this.#app.renderer.device, null);
                    await window.hypervisorSystem.initialize();
                }

                try {
                    await window.hypervisorSystem.deploy(params.kernel_url, 'main_cpu');

                    // Start a tick loop for the demo (simulated background execution)
                    if (params.mounts && Array.isArray(params.mounts)) {
                        for (const mount of params.mounts) {
                            if (window.hypervisorSystem.mountFile) {
                                await window.hypervisorSystem.mountFile(mount.url, mount.path);
                            }
                        }
                    } else if (params.media_url) {
                        // Backward compatibility
                        if (window.hypervisorSystem.mountFile) {
                            await window.hypervisorSystem.mountFile(params.media_url, '/home/user/Videos/video.mp4');
                        }
                    }

                    // Start a tick loop for the demo (simulated background execution)
                    // In a real app, this would be part of the requestAnimationFrame loop
                    if (!window.hypervisorLoop) {
                        window.hypervisorLoop = setInterval(() => {
                            window.hypervisorSystem.tick('main_cpu', 1000);
                        }, 16);
                    }
                    return { success: true, status: 'booted', kernel: params.kernel_url };
                } catch (e) {
                    return { success: false, error: e.message };
                }
            }
        };
        await navigator.modelContext.registerTool(tool);
        if (!navigator.modelContext.toolHandlers) navigator.modelContext.toolHandlers = {};
        navigator.modelContext.toolHandlers[tool.name] = tool.handler;
        this.#registeredTools.push(tool.name);
    }

    async #registerHypervisorInput() {
        const tool = {
            name: 'hypervisor_input',
            description: 'Send input to the WGPU Hypervisor via MMIO.',
            inputSchema: {
                type: 'object',
                properties: {
                    type: { type: 'string', enum: ['keyboard', 'mouse'] },
                    data: {
                        type: 'object',
                        properties: {
                            key: { type: 'string' },
                            x: { type: 'number' },
                            y: { type: 'number' }
                        }
                    }
                },
                required: ['type', 'data']
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) return { success: false, error: 'Hypervisor not running' };

                await window.hypervisorSystem.injectInput('main_cpu', params.type, params.data);
                return { success: true, status: 'injected' };
            }
        };
        await navigator.modelContext.registerTool(tool);
        if (!navigator.modelContext.toolHandlers) navigator.modelContext.toolHandlers = {};
        navigator.modelContext.toolHandlers[tool.name] = tool.handler;
        this.#registeredTools.push(tool.name);
    }

    async #registerHypervisorFrame() {
        const tool = {
            name: 'hypervisor_frame',
            description: 'Get current screen state in structured format.',
            inputSchema: {
                type: 'object',
                properties: {
                    format: {
                        type: 'string',
                        enum: ['semantic', 'raw', 'both'],
                        description: 'Format: "semantic" returns JSON UI description, "raw" returns PNG base64, "both" returns both.'
                    },
                    scale: {
                        type: 'number',
                        description: 'Scale factor for OCR processing (default 1.0).'
                    }
                }
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) return { success: false, error: 'Hypervisor not running' };

                const format = params.format || 'semantic';
                const scale = params.scale || 1.0;

                if (format === 'semantic' || format === 'both') {
                    if (!this.#visionCortex) {
                        return { success: false, error: 'VisionCortex not available' };
                    }

                    const canvas = await this.#getHypervisorCanvas();
                    if (!canvas) {
                        return { success: false, error: 'Failed to capture frame' };
                    }

                    const semantic = await this.#visionCortex.getSemanticFrame(canvas, { scale });

                    // Trigger visualization overlay (The "AI Buttons")
                    window.dispatchEvent(new CustomEvent('hypervisor-semantic-update', {
                        detail: semantic
                    }));

                    if (format === 'both') {
                        const frame = await window.hypervisorSystem.captureFrame('main_cpu');
                        return { ...semantic, frame_base64: frame };
                    }
                    return semantic;
                }

                const frame = await window.hypervisorSystem.captureFrame('main_cpu');
                return { success: true, format: 'raw', frame_base64: frame };
            }
        };
        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #registerHypervisorReadText() {
        const tool = {
            name: 'hypervisor_read_text',
            description: 'Read text content from the framebuffer using OCR.',
            inputSchema: {
                type: 'object',
                properties: {
                    region: {
                        type: 'object',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' },
                            width: { type: 'number' },
                            height: { type: 'number' }
                        },
                        description: 'Region to read text from (optional, full screen if omitted).'
                    },
                    scale: {
                        type: 'number',
                        description: 'Scale factor for OCR processing (default 2.0 for better text recognition).'
                    }
                }
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) return { success: false, error: 'Hypervisor not running' };
                if (!this.#visionCortex) return { success: false, error: 'VisionCortex not available' };

                const canvas = await this.#getHypervisorCanvas();
                if (!canvas) return { success: false, error: 'Failed to capture frame' };

                const scale = params.scale || 2.0;
                return await this.#visionCortex.recognize(canvas, params.region, { scale });
            }
        };
        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #registerHypervisorFindElement() {
        const tool = {
            name: 'hypervisor_find_element',
            description: 'Find UI elements by label.',
            inputSchema: {
                type: 'object',
                properties: {
                    label: {
                        type: 'string',
                        description: 'Text label to search for (required, e.g. "Submit")'
                    },
                    type: {
                        type: 'string',
                        enum: ['button', 'input', 'window', 'icon', 'any'],
                        description: 'Element type filter (optional, default "any").'
                    },
                    exact: {
                        type: 'boolean',
                        description: 'Use exact label matching (optional, default false for fuzzy match).'
                    },
                    scale: {
                        type: 'number',
                        description: 'Scale factor for OCR processing (optional).'
                    }
                },
                required: ['label']
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) return { success: false, error: 'Hypervisor not running' };
                if (!this.#visionCortex) return { success: false, error: 'VisionCortex not available' };

                const canvas = await this.#getHypervisorCanvas();
                if (!canvas) return { success: false, error: 'Failed to capture frame' };

                const elementType = params.type || 'any';
                const options = {
                    exact: params.exact || false,
                    scale: params.scale
                };
                return await this.#visionCortex.findElement(params.label, elementType, canvas, options);
            }
        };
        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    /**
     * MMU Control Tool: Set Page Table
     * Enables AI agents to configure virtual memory paging
     */
    async #registerHypervisorSetPageTable() {
        const tool = {
            name: 'hypervisor_set_page_table',
            description: 'Set the page table root address in satp CSR to enable MMU virtual memory translation.',
            inputSchema: {
                type: 'object',
                properties: {
                    kernel_id: { type: 'string', description: 'Kernel instance ID (default: "main_cpu")' },
                    root_pa: { type: 'number', description: 'Physical address of page table root' }
                },
                required: ['root_pa']
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) {
                    return { success: false, error: 'Hypervisor not running' };
                }

                const kernelId = params.kernel_id || 'main_cpu';
                const kernel = window.hypervisorSystem.kernels?.get(kernelId);
                if (!kernel) {
                    return { success: false, error: 'Kernel not found' };
                }

                // satp format: [mode(1bit)][asid(9bits)][ppn(22bits)]
                // mode=1 for Sv32, ppn = root_pa >> 12
                const satp = (1 << 31) | (params.root_pa >> 12);

                // Write satp to state buffer at index 34 (CSR_SATP)
                const satpData = new Uint32Array([satp]);
                window.hypervisorSystem.device.queue.writeBuffer(
                    kernel.stateBuffer,
                    34 * 4,
                    satpData
                );

                return {
                    success: true,
                    status: 'ok',
                    satp: '0x' + satp.toString(16),
                    description: 'Sv32 MMU enabled with page table at 0x' + params.root_pa.toString(16)
                };
            }
        };
        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    /**
     * MMU Control Tool: Map Page
     * Enables AI agents to create virtual-to-physical page mappings
     */
    async #registerHypervisorMapPage() {
        const tool = {
            name: 'hypervisor_map_page',
            description: 'Create a page table entry mapping a virtual page to a physical page with specified permissions.',
            inputSchema: {
                type: 'object',
                properties: {
                    kernel_id: { type: 'string', description: 'Kernel instance ID' },
                    va: { type: 'string', description: 'Virtual address to map (hex format)' },
                    pa: { type: 'string', description: 'Physical address to map to (hex format)' },
                    flags: {
                        type: 'number',
                        description: 'Page flags (R=1, W=2, X=4, U=8). Example: 7 for RWX'
                    }
                },
                required: ['va', 'pa', 'flags']
            },
            handler: async (params) => {
                if (!window.hypervisorSystem) {
                    return { success: false, error: 'Hypervisor not running' };
                }

                const kernelId = params.kernel_id || 'main_cpu';
                const kernel = window.hypervisorSystem.kernels?.get(kernelId);
                if (!kernel) {
                    return { success: false, error: 'Kernel not found' };
                }

                // Parse hex addresses
                const va = parseInt(params.va, 16);
                const pa = parseInt(params.pa, 16);

                // Create page table entry (PTE)
                // Format: [PPN(22bits)][RSW(2)][D][A][G][U][X][W][R][V]
                const pte = (pa & 0xFFFFF000) | (params.flags & 0xF) | 1; // Valid bit set

                // Write PTE to memory
                // For Sv32: VPN[1] at bits 31:22, VPN[0] at bits 21:12
                // This is a simplified single-level mapping for the POC
                const pteAddr = 0x03000000 + ((va >> 12) & 0x3FF) * 4; // Page table region
                const pteData = new Uint32Array([pte]);

                window.hypervisorSystem.device.queue.writeBuffer(
                    kernel.memoryBuffer,
                    pteAddr,
                    pteData
                );

                return {
                    success: true,
                    va: '0x' + va.toString(16),
                    pa: '0x' + pa.toString(16),
                    pte: '0x' + pte.toString(16),
                    pte_addr: '0x' + pteAddr.toString(16),
                    description: `Mapped VA 0x${va.toString(16)} -> PA 0x${pa.toString(16)}`
                };
            }
        };
        await navigator.modelContext.registerTool(tool);
        /* istanbul ignore next */
        if (!navigator.modelContext.toolHandlers) navigator.modelContext.toolHandlers = {};
        navigator.modelContext.toolHandlers[tool.name] = tool.handler;
        this.#registeredTools.push(tool.name);
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
                'status, performance metrics, evolution state, and health monitoring ' +
                'information (WebMCP, WebSocket connections). Use this to understand ' +
                'the current state before taking actions.',
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
                                'health',
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
            ? (include.includes('all') ? ['camera', 'windows', 'subsystems', 'performance', 'evolution', 'health'] : include)
            : ['camera', 'windows', 'subsystems', 'performance', 'evolution', 'health'];

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

        // Health status (Phase E)
        if (sections.includes('health')) {
            state.health = this.getHealthStatus();
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
     * Connect to the evolution WebSocket backend (with circuit breaker)
     * @returns {Promise<WebSocket>}
     */
    async #connectEvolutionSocket() {
        // Check if already connected first
        if (this.#evolutionSocket?.readyState === WebSocket.OPEN) {
            return this.#evolutionSocket;
        }

        // Wrap connection with circuit breaker
        return this.#circuitBreakerExecute(
            async () => {
                // Use retry wrapper for connection
                return this.#retryWebSocketConnect(
                    () => this.#connectEvolutionSocketInternal(),
                    'EvolutionSocket'
                );
            },
            'EvolutionSocket'
        );
    }

    /**
     * Internal evolution socket connection without retry
     * @private
     * @returns {Promise<WebSocket>}
     */
    #connectEvolutionSocketInternal() {
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
                    ws.close();
                    reject(new Error('Evolution backend connection timeout'));
                }
            }, 5000);
        });
    }

    /**
     * Connect to the agent WebSocket backend (with circuit breaker)
     * @returns {Promise<WebSocket>}
     */
    async #connectAgentSocket() {
        // Check if already connected first
        if (this.#agentSocket?.readyState === WebSocket.OPEN) {
            return this.#agentSocket;
        }

        // Wrap connection with circuit breaker
        return this.#circuitBreakerExecute(
            async () => {
                // Use retry wrapper for connection
                return this.#retryWebSocketConnect(
                    () => this.#connectAgentSocketInternal(),
                    'AgentSocket'
                );
            },
            'AgentSocket'
        );
    }

    /**
     * Internal agent socket connection without retry
     * @private
     * @returns {Promise<WebSocket>}
     */
    #connectAgentSocketInternal() {
        return new Promise((resolve, reject) => {
            if (this.#agentSocket?.readyState === WebSocket.OPEN) {
                resolve(this.#agentSocket);
                return;
            }

            const ws = new WebSocket('ws://localhost:8765/agents');

            ws.onopen = () => {
                this.#agentSocket = ws;
                resolve(ws);
            };

            ws.onerror = () => {
                reject(new Error('Agent backend not running at ws://localhost:8765/agents'));
            };

            // 5 second timeout
            setTimeout(() => {
                if (ws.readyState !== WebSocket.OPEN) {
                    ws.close();
                    reject(new Error('Agent backend connection timeout'));
                }
            }, 5000);
        });
    }

    // ─────────────────────────────────────────────────────────────
    // A2A WebSocket Connection (Phase D)
    // ─────────────────────────────────────────────────────────────

    /**
     * Connect to the A2A WebSocket backend
     * @returns {Promise<WebSocket>}
     */
    #connectA2ASocket() {
        return new Promise((resolve, reject) => {
            if (this.#a2aSocket?.readyState === WebSocket.OPEN) {
                resolve(this.#a2aSocket);
                return;
            }

            const ws = new WebSocket('ws://localhost:8765/agents');

            ws.onopen = () => {
                this.#a2aSocket = ws;

                // Set up message handler
                ws.onmessage = (event) => {
                    try {
                        const response = JSON.parse(event.data);
                        // Handle response to pending request
                        if (response.requestId && this.#pendingA2ARequests.has(response.requestId)) {
                            const { resolve: res } = this.#pendingA2ARequests.get(response.requestId);
                            this.#pendingA2ARequests.delete(response.requestId);
                            res(response);
                        }
                    } catch (parseErr) {
                        console.warn('🔌 WebMCP A2A: Failed to parse response:', parseErr);
                    }
                };

                resolve(ws);
            };

            ws.onerror = () => {
                reject(new Error('A2A backend not running at ws://localhost:8765'));
            };

            // 5 second timeout
            setTimeout(() => {
                if (ws.readyState !== WebSocket.OPEN) {
                    reject(new Error('A2A backend connection timeout'));
                }
            }, 5000);
        });
    }

    /**
     * Send A2A request and wait for response
     * @param {Object} request
     * @returns {Promise<Object>}
     */
    async #sendA2ARequest(request) {
        const ws = await this.#connectA2ASocket();

        const requestId = `a2a_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        request.requestId = requestId;

        return new Promise((resolve, reject) => {
            this.#pendingA2ARequests.set(requestId, { resolve, reject });
            ws.send(JSON.stringify(request));

            // 30 second timeout
            setTimeout(() => {
                if (this.#pendingA2ARequests.has(requestId)) {
                    this.#pendingA2ARequests.delete(requestId);
                    reject(new Error('A2A request timeout'));
                }
            }, 30000);
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
    // Tool 7: send_llm_prompt (Phase B)
    // ─────────────────────────────────────────────────────────────

    async #registerSendLLMPrompt() {
        const tool = {
            name: 'send_llm_prompt',
            description:
                'Send a prompt to LM Studio for AI-to-AI communication. ' +
                'This enables the host AI to delegate reasoning, analysis, or ' +
                'generation tasks to a local LLM running in LM Studio. ' +
                'The LM Studio server must be running on localhost:1234.',
            inputSchema: {
                type: 'object',
                properties: {
                    prompt: {
                        type: 'string',
                        description: 'The prompt to send to the LLM (required)'
                    },
                    model: {
                        type: 'string',
                        description: 'Model identifier (default: "local")',
                        default: 'local'
                    },
                    temperature: {
                        type: 'number',
                        description: 'Sampling temperature (default: 0.7)',
                        default: 0.7,
                        minimum: 0,
                        maximum: 2
                    },
                    max_tokens: {
                        type: 'number',
                        description: 'Maximum tokens to generate (default: 2048)',
                        default: 2048
                    },
                    system_prompt: {
                        type: 'string',
                        description: 'Optional system prompt to provide context'
                    }
                },
                required: ['prompt']
            },
            handler: async (params) => {
                return this.#handleSendLLMPrompt(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSendLLMPrompt({
        prompt,
        model = 'local',
        temperature = 0.7,
        max_tokens = 2048,
        system_prompt
    }) {
        this.#trackCall('send_llm_prompt');

        // Validate prompt is required and is a string
        if (typeof prompt !== 'string' || prompt.trim().length === 0) {
            return {
                success: false,
                error: 'prompt is required and must be a non-empty string',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate temperature range
        if (typeof temperature !== 'number' || temperature < 0 || temperature > 2) {
            return {
                success: false,
                error: 'temperature must be a number between 0 and 2',
                error_code: 'INVALID_INPUT'
            };
        }

        // Build messages array
        const messages = [];
        if (system_prompt && typeof system_prompt === 'string' && system_prompt.trim().length > 0) {
            messages.push({ role: 'system', content: system_prompt });
        }
        messages.push({ role: 'user', content: prompt });

        // Track latency
        const startTime = Date.now();

        try {
            // POST to LM Studio OpenAI-compatible endpoint (with circuit breaker)
            const response = await this.#circuitBreakerExecute(
                async () => {
                    return this.#retryFetch(
                        'http://localhost:1234/v1/chat/completions',
                        {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                model: model,
                                messages: messages,
                                temperature: temperature,
                                max_tokens: max_tokens
                            })
                        },
                        this.#getRetryConfig('sendLLMPrompt')
                    );
                },
                'sendLLMPrompt'
            );

            const latencyMs = Date.now() - startTime;

            // Handle HTTP errors
            if (!response.ok) {
                const errorText = await response.text().catch(() => 'Unknown error');
                return {
                    success: false,
                    error: `LM Studio returned HTTP ${response.status}: ${errorText}`,
                    error_code: 'BACKEND_UNAVAILABLE'
                };
            }

            // Parse OpenAI-compatible response
            const data = await response.json();

            // Extract response content
            const responseContent = data.choices?.[0]?.message?.content || '';

            // Extract token usage
            const tokensUsed = {
                prompt: data.usage?.prompt_tokens || 0,
                completion: data.usage?.completion_tokens || 0,
                total: data.usage?.total_tokens || 0
            };

            return {
                success: true,
                response: responseContent,
                model: data.model || model,
                tokensUsed: tokensUsed,
                latencyMs: latencyMs
            };

        } catch (err) {
            // Determine error code based on error type
            let errorCode = 'BACKEND_UNAVAILABLE';
            if (err.name === 'TypeError' && err.message.includes('fetch')) {
                errorCode = 'BACKEND_UNAVAILABLE';
            }

            return {
                success: false,
                error: `Failed to connect to LM Studio: ${err.message}`,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 8: spawn_area_agent (Phase B)
    // ─────────────────────────────────────────────────────────────

    async #registerSpawnAreaAgent() {
        const tool = {
            name: 'spawn_area_agent',
            description:
                'Create an area agent to monitor and/or act on a specific region ' +
                'of the infinite map. Area agents can observe pixel changes, execute ' +
                'actions, evolve content, or analyze patterns within their assigned region. ' +
                'The agent runs autonomously and can be configured with specific behaviors. ' +
                'Phase D: Supports A2A protocol for agent-to-agent communication.',
            inputSchema: {
                type: 'object',
                properties: {
                    agent_type: {
                        type: 'string',
                        description: 'Type of agent to spawn (required)',
                        enum: ['monitor', 'executor', 'evolver', 'analyzer']
                    },
                    region: {
                        type: 'object',
                        description: 'Region on the infinite map for the agent to operate on (required)',
                        properties: {
                            x: { type: 'number', description: 'Region X origin (grid units)' },
                            y: { type: 'number', description: 'Region Y origin (grid units)' },
                            width: { type: 'number', description: 'Region width (grid units)' },
                            height: { type: 'number', description: 'Region height (grid units)' }
                        },
                        required: ['x', 'y', 'width', 'height']
                    },
                    a2a_config: {
                        type: 'object',
                        description: 'A2A protocol configuration for agent communication (top-level)',
                        properties: {
                            enabled: {
                                type: 'boolean',
                                default: true,
                                description: 'Enable A2A communication for this agent'
                            },
                            auto_discover: {
                                type: 'boolean',
                                default: true,
                                description: 'Automatically discover other agents'
                            },
                            wsUrl: {
                                type: 'string',
                                default: 'ws://localhost:8766',
                                description: 'WebSocket URL for A2A router'
                            },
                            topics: {
                                type: 'array',
                                items: { type: 'string' },
                                description: 'Topics to subscribe to (e.g., ["region_updates", "alerts"])'
                            },
                            discovery: {
                                type: 'boolean',
                                default: true,
                                description: 'Advertise in A2A registry'
                            },
                            auto_heartbeat: {
                                type: 'boolean',
                                default: true,
                                description: 'Send periodic heartbeats'
                            },
                            heartbeat_interval: {
                                type: 'number',
                                default: 5,
                                description: 'Heartbeat interval in seconds'
                            },
                            message_queue_size: {
                                type: 'number',
                                default: 1000,
                                description: 'Max queued messages'
                            }
                        }
                    },
                    config: {
                        type: 'object',
                        description: 'Agent-specific configuration options (optional)',
                        properties: {
                            // Phase B config options
                            monitor_interval: {
                                type: 'number',
                                description: 'Monitoring interval in seconds (monitor agent)'
                            },
                            evolution_rate: {
                                type: 'number',
                                description: 'Evolution generations per cycle (evolver agent)'
                            },
                            // Phase D: A2A config (legacy, nested)
                            a2a: {
                                type: 'object',
                                description: 'A2A protocol configuration (Phase D - legacy nested config)',
                                properties: {
                                    enabled: {
                                        type: 'boolean',
                                        description: 'Enable A2A communication (default: false)'
                                    },
                                    discovery: {
                                        type: 'boolean',
                                        description: 'Advertise in A2A registry (default: true)'
                                    },
                                    auto_heartbeat: {
                                        type: 'boolean',
                                        description: 'Send periodic heartbeats (default: true)'
                                    },
                                    heartbeat_interval: {
                                        type: 'number',
                                        description: 'Heartbeat interval in seconds (default: 5)'
                                    },
                                    message_queue_size: {
                                        type: 'number',
                                        description: 'Max queued messages (default: 1000)'
                                    },
                                    topics: {
                                        type: 'array',
                                        items: { type: 'string' },
                                        description: 'Topics to subscribe to'
                                    }
                                }
                            }
                        }
                    },
                    auto_start: {
                        type: 'boolean',
                        description: 'Whether to start the agent immediately after spawning (default: true)',
                        default: true
                    }
                },
                required: ['agent_type', 'region']
            },
            handler: async (params) => {
                return this.#handleSpawnAreaAgent(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSpawnAreaAgent({
        agent_type,
        region,
        config = {},
        a2a_config = null,
        auto_start = true
    }) {
        this.#trackCall('spawn_area_agent');

        // Valid agent types
        const VALID_AGENT_TYPES = ['monitor', 'executor', 'evolver', 'analyzer'];

        // Validate agent_type
        if (!agent_type || !VALID_AGENT_TYPES.includes(agent_type)) {
            return {
                success: false,
                error: `agent_type must be one of: ${VALID_AGENT_TYPES.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate region object exists
        if (!region || typeof region !== 'object') {
            return {
                success: false,
                error: 'region is required and must be an object with x, y, width, height',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate region has required properties
        const { x, y, width, height } = region;
        if (typeof x !== 'number' || typeof y !== 'number' ||
            typeof width !== 'number' || typeof height !== 'number') {
            return {
                success: false,
                error: 'region must have numeric x, y, width, and height properties',
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate region values are reasonable
        if (width <= 0 || height <= 0) {
            return {
                success: false,
                error: 'region width and height must be positive numbers',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Connect to WebSocket backend
            const ws = await this.#connectAgentSocket();

            // Generate unique request ID
            const requestId = `agent_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;

            // Create promise for response with matching requestId
            const responsePromise = new Promise((resolve, reject) => {
                const timeoutId = setTimeout(() => {
                    reject(new Error('Agent spawn timeout (10s)'));
                }, 10000);

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

            // Send spawn request
            const request = {
                requestId,
                action: 'spawn',
                agent_type,
                region: { x, y, width, height },
                config,
                auto_start
            };

            ws.send(JSON.stringify(request));

            // Wait for response
            const response = await responsePromise;

            // Check for backend errors
            if (!response.success) {
                return {
                    success: false,
                    error: response.error || 'Agent backend returned failure',
                    error_code: 'EXECUTION_FAILED'
                };
            }

            // Return successful spawn result
            const result = {
                success: true,
                agentId: response.agentId,
                status: response.status || 'spawned',
                region: { x, y, width, height },
                heartbeatInterval: response.heartbeatInterval || 5000
            };

            // Phase D: Initialize A2A if config.a2a.enabled (legacy nested config)
            const a2aConfig = config?.a2a;

            // New: top-level a2a_config parameter
            // Use a2a_config if provided, otherwise fall back to legacy config.a2a
            const finalA2AConfig = a2a_config || a2aConfig;
            const a2aEnabled = a2a_config?.enabled !== false || a2aConfig?.enabled;

            if (a2aEnabled && response.agentId) {
                try {
                    // Create A2A router for the spawned agent
                    const a2aRouter = await this.#initAgentA2A(
                        response.agentId,
                        agent_type,
                        region,
                        finalA2AConfig || {}
                    );

                    // Track the spawned agent's router
                    this.#spawnedAgents.set(response.agentId, {
                        router: a2aRouter,
                        agentType: agent_type,
                        region: { x, y, width, height },
                        config: finalA2AConfig || {},
                        spawnedAt: Date.now()
                    });

                    // Store A2A client in the dedicated #agentA2AClients map
                    this.#agentA2AClients.set(response.agentId, a2aRouter);

                    result.a2a = {
                        enabled: true,
                        agentId: response.agentId,
                        routerId: a2aRouter.getAgentId(),
                        topics: finalA2AConfig?.topics || [],
                        discovery: finalA2AConfig?.discovery !== false,
                        heartbeatEnabled: finalA2AConfig?.auto_heartbeat !== false,
                        heartbeatInterval: finalA2AConfig?.heartbeat_interval || 5
                    };

                    // Set up message handlers for this agent
                    this.#setupAgentMessageHandlers(response.agentId, a2aRouter, agent_type);

                    console.log(` WebMCP: A2A enabled for agent ${response.agentId}`);

                } catch (a2aErr) {
                    console.warn(` WebMCP: A2A connection failed for ${response.agentId}:`, a2aErr.message);
                    result.a2a = {
                        enabled: false,
                        error: a2aErr.message
                    };
                    // Non-fatal - agent still functions without A2A
                }
            }

            return result;

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
    // Tool 9: send_a2a_message (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerSendA2AMessage() {
        const tool = {
            name: 'send_a2a_message',
            description:
                'Send a message to another area agent via A2A protocol. ' +
                'Supports direct agent-to-agent messaging, broadcast to all agents, ' +
                'or topic-based pub/sub. Requires A2A router to be initialized.',
            inputSchema: {
                type: 'object',
                properties: {
                    to_agent: {
                        type: 'string',
                        description: 'Target agent ID, "broadcast", or "topic:name"'
                    },
                    message_type: {
                        type: 'string',
                        enum: [
                            'task_assignment',
                            'task_update',
                            'task_result',
                            'status_update',
                            'coordination_request',
                            'heartbeat'
                        ],
                        description: 'Type of A2A message'
                    },
                    content: {
                        type: 'object',
                        description: 'Message payload (arbitrary JSON)'
                    },
                    priority: {
                        type: 'number',
                        description: 'Priority level (1=LOW, 5=NORMAL, 8=HIGH, 10=CRITICAL)',
                        default: 5,
                        minimum: 1,
                        maximum: 10
                    },
                    expires_in: {
                        type: 'number',
                        description: 'TTL in seconds (optional)'
                    },
                    metadata: {
                        type: 'object',
                        description: 'Optional metadata (e.g., correlation_id, region)'
                    }
                },
                required: ['to_agent', 'message_type', 'content']
            },
            handler: async (params) => {
                return this.#handleSendA2AMessage(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSendA2AMessage({
        to_agent,
        message_type,
        content,
        priority = 5,
        expires_in,
        metadata = {}
    }) {
        this.#trackCall('send_a2a_message');

        // Check A2A router is initialized
        if (!this.#a2aRouter) {
            return {
                success: false,
                error: 'A2A router not initialized. Call initA2A() first or enable in spawn_area_agent config.',
                error_code: 'A2A_NOT_INITIALIZED'
            };
        }

        try {
            const response = await this.#a2aRouter.send({
                to_agent,
                message_type,
                content,
                priority,
                expires_in,
                metadata
            });

            return {
                success: true,
                ...response
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'A2A_SEND_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 10: discover_a2a_agents (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerDiscoverA2AAgents() {
        const tool = {
            name: 'discover_a2a_agents',
            description:
                'Query the A2A agent registry to discover other agents. ' +
                'Can filter by agent type, geographic region overlap, or capability. ' +
                'Returns list of registered agents with their metadata.',
            inputSchema: {
                type: 'object',
                properties: {
                    agent_type: {
                        type: 'string',
                        description: 'Filter by agent type (monitor, executor, evolver, analyzer)',
                        enum: ['monitor', 'executor', 'evolver', 'analyzer']
                    },
                    region_overlaps: {
                        type: 'object',
                        description: 'Filter by agents overlapping this region',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' },
                            width: { type: 'number' },
                            height: { type: 'number' }
                        }
                    },
                    capability: {
                        type: 'string',
                        description: 'Filter by capability (e.g., "monitor", "evolve")'
                    }
                }
            },
            handler: async (params) => {
                return this.#handleDiscoverA2AAgents(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleDiscoverA2AAgents(filters = {}) {
        this.#trackCall('discover_a2a_agents');

        // Check A2A router is initialized
        if (!this.#a2aRouter) {
            return {
                success: false,
                error: 'A2A router not initialized. Call initA2A() first.',
                error_code: 'A2A_NOT_INITIALIZED'
            };
        }

        try {
            const agents = await this.#a2aRouter.discover(filters);

            return {
                success: true,
                count: agents.length,
                agents
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'A2A_DISCOVER_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 11: a2a_coordination (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ACoordination() {
        const tool = {
            name: 'a2a_coordination',
            description:
                'Perform distributed coordination operations with other agents. ' +
                'Supports distributed locks, barriers, broadcasts, and sync. ' +
                'Useful for coordinating multi-agent workflows.',
            inputSchema: {
                type: 'object',
                properties: {
                    operation: {
                        type: 'string',
                        enum: ['acquire_lock', 'release_lock', 'barrier_wait', 'broadcast', 'sync_all'],
                        description: 'Coordination operation to perform'
                    },
                    lock_id: {
                        type: 'string',
                        description: 'Lock identifier (for acquire_lock, release_lock)'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Timeout in seconds (default: 30)'
                    },
                    barrier_id: {
                        type: 'string',
                        description: 'Barrier identifier (for barrier_wait)'
                    },
                    expected_agents: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Expected agent IDs (for barrier_wait)'
                    },
                    message: {
                        type: 'object',
                        description: 'Message to broadcast (for broadcast)'
                    }
                },
                required: ['operation']
            },
            handler: async (params) => {
                return this.#handleA2ACoordination(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ACoordination({
        operation,
        lock_id,
        timeout = 30,
        barrier_id,
        expected_agents,
        message
    }) {
        this.#trackCall('a2a_coordination');

        // Check A2A router is initialized
        if (!this.#a2aRouter) {
            return {
                success: false,
                error: 'A2A router not initialized. Call initA2A() first or enable in spawn_area_agent config.',
                error_code: 'A2A_NOT_INITIALIZED'
            };
        }

        try {
            switch (operation) {
                case 'acquire_lock':
                    if (!lock_id) {
                        return {
                            success: false,
                            error: 'lock_id is required for acquire_lock',
                            error_code: 'INVALID_INPUT'
                        };
                    }
                    const acquired = await this.#a2aRouter.acquireLock(lock_id, timeout);
                    return {
                        success: acquired,
                        operation: 'acquire_lock',
                        lock_id,
                        acquired,
                        message: acquired ? 'Lock acquired' : 'Lock acquisition failed or timed out'
                    };

                case 'release_lock':
                    if (!lock_id) {
                        return {
                            success: false,
                            error: 'lock_id is required for release_lock',
                            error_code: 'INVALID_INPUT'
                        };
                    }
                    await this.#a2aRouter.releaseLock(lock_id);
                    return {
                        success: true,
                        operation: 'release_lock',
                        lock_id,
                        message: 'Lock released'
                    };

                case 'barrier_wait':
                    if (!barrier_id) {
                        return {
                            success: false,
                            error: 'barrier_id is required for barrier_wait',
                            error_code: 'INVALID_INPUT'
                        };
                    }
                    if (!expected_agents || !Array.isArray(expected_agents)) {
                        return {
                            success: false,
                            error: 'expected_agents is required for barrier_wait',
                            error_code: 'INVALID_INPUT'
                        };
                    }
                    const completed = await this.#a2aRouter.barrierWait(barrier_id, expected_agents, timeout);
                    return {
                        success: completed,
                        operation: 'barrier_wait',
                        barrier_id,
                        expected_agents,
                        completed,
                        message: completed ? 'Barrier completed' : 'Barrier timed out'
                    };

                case 'broadcast':
                    if (!message) {
                        return {
                            success: false,
                            error: 'message is required for broadcast',
                            error_code: 'INVALID_INPUT'
                        };
                    }
                    await this.#a2aRouter.publish('broadcast', message);
                    return {
                        success: true,
                        operation: 'broadcast',
                        message: 'Broadcast sent'
                    };

                case 'sync_all':
                    // Publish sync request to all agents
                    await this.#a2aRouter.publish('sync-request', {
                        timestamp: Date.now() / 1000
                    }, A2AMessageRouter.PRIORITY.HIGH);
                    return {
                        success: true,
                        operation: 'sync_all',
                        message: 'Sync request broadcast'
                    };

                default:
                    return {
                        success: false,
                        error: `Unknown operation: ${operation}`,
                        error_code: 'INVALID_INPUT'
                    };
            }

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'A2A_COORDINATION_FAILED',
                operation
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 12: a2a_send_message (Phase D - WebSocket)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ASendMessage() {
        const tool = {
            name: 'a2a_send_message',
            description:
                'Send a direct message to another area agent via the A2A protocol. ' +
                'Messages can be task requests, responses, notifications, or data shares. ' +
                'Use correlation_id for request/response matching.',
            inputSchema: {
                type: 'object',
                properties: {
                    target_agent_id: {
                        type: 'string',
                        description: 'ID of the target agent (required)'
                    },
                    message_type: {
                        type: 'string',
                        enum: ['task_request', 'task_response', 'notification', 'data_share'],
                        description: 'Type of message being sent'
                    },
                    payload: {
                        type: 'object',
                        description: 'Message payload content'
                    },
                    correlation_id: {
                        type: 'string',
                        description: 'Optional correlation ID for request/response matching'
                    }
                },
                required: ['target_agent_id', 'message_type', 'payload']
            },
            handler: async (params) => {
                return this.#handleA2ASendMessage(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ASendMessage({
        target_agent_id,
        message_type,
        payload,
        correlation_id
    }) {
        this.#trackCall('a2a_send_message');

        // Validate required fields
        if (!target_agent_id || typeof target_agent_id !== 'string') {
            return {
                success: false,
                error: 'target_agent_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        if (!message_type || !['task_request', 'task_response', 'notification', 'data_share'].includes(message_type)) {
            return {
                success: false,
                error: 'message_type must be one of: task_request, task_response, notification, data_share',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_route',
                to_agent: target_agent_id,
                message_type,
                content: payload,
                correlation_id
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.delivered ?? true,
                delivered: response.delivered,
                target_status: response.target_status || 'unknown',
                message_id: response.message_id
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 13: a2a_broadcast (Phase D - WebSocket)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ABroadcast() {
        const tool = {
            name: 'a2a_broadcast',
            description:
                'Broadcast a message to all agents of a specific type via the A2A protocol. ' +
                'Useful for status updates, knowledge sharing, or coordinating multiple agents.',
            inputSchema: {
                type: 'object',
                properties: {
                    agent_type: {
                        type: 'string',
                        enum: ['monitor', 'executor', 'evolver', 'analyzer', 'all'],
                        description: 'Target agent type for broadcast'
                    },
                    message_type: {
                        type: 'string',
                        description: 'Type of message being broadcast'
                    },
                    payload: {
                        type: 'object',
                        description: 'Message payload content'
                    },
                    exclude_self: {
                        type: 'boolean',
                        description: 'Whether to exclude the sender from broadcast (default: true)',
                        default: true
                    }
                },
                required: ['agent_type', 'message_type', 'payload']
            },
            handler: async (params) => {
                return this.#handleA2ABroadcast(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ABroadcast({
        agent_type,
        message_type,
        payload,
        exclude_self = true
    }) {
        this.#trackCall('a2a_broadcast');

        // Validate agent_type
        const validTypes = ['monitor', 'executor', 'evolver', 'analyzer', 'all'];
        if (!agent_type || !validTypes.includes(agent_type)) {
            return {
                success: false,
                error: `agent_type must be one of: ${validTypes.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_broadcast',
                agent_type,
                message_type,
                content: payload,
                exclude_self
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                recipients: response.recipients || 0,
                delivered_count: response.delivered_count || 0
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 14: a2a_subscribe (Phase D - WebSocket)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ASubscribe() {
        const tool = {
            name: 'a2a_subscribe',
            description:
                'Subscribe to events from other agents or region changes via the A2A protocol. ' +
                'Supported events: region_change, task_available, peer_discovered, knowledge_update.',
            inputSchema: {
                type: 'object',
                properties: {
                    event_type: {
                        type: 'string',
                        enum: ['region_change', 'task_available', 'peer_discovered', 'knowledge_update'],
                        description: 'Type of event to subscribe to'
                    },
                    filter: {
                        type: 'object',
                        description: 'Optional filter criteria (e.g., region bounds, agent_type)',
                        properties: {
                            region: {
                                type: 'object',
                                properties: {
                                    x: { type: 'number' },
                                    y: { type: 'number' },
                                    width: { type: 'number' },
                                    height: { type: 'number' }
                                }
                            },
                            agent_type: { type: 'string' }
                        }
                    }
                },
                required: ['event_type']
            },
            handler: async (params) => {
                return this.#handleA2ASubscribe(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ASubscribe({
        event_type,
        filter
    }) {
        this.#trackCall('a2a_subscribe');

        // Validate event_type
        const validEvents = ['region_change', 'task_available', 'peer_discovered', 'knowledge_update'];
        if (!event_type || !validEvents.includes(event_type)) {
            return {
                success: false,
                error: `event_type must be one of: ${validEvents.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_subscribe',
                event_type,
                filter
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                subscription_id: response.subscription_id,
                status: 'active'
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 12: a2a_acquire_lock (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AAcquireLock() {
        const tool = {
            name: 'a2a_acquire_lock',
            description:
                'Acquire a distributed lock for exclusive access to a resource. ' +
                'Returns immediately with granted=true if lock is free, or granted=false with queue position if held by another agent. ' +
                'Locks have automatic timeout expiration.',
            inputSchema: {
                type: 'object',
                properties: {
                    lock_id: {
                        type: 'string',
                        description: 'Unique identifier for the lock (e.g., "region-100-200" or "resource-database")'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Lock timeout in seconds (default: 30)',
                        default: 30
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID requesting the lock (defaults to current session)'
                    }
                },
                required: ['lock_id']
            },
            handler: async (params) => {
                return this.#handleA2AAcquireLock(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AAcquireLock({ lock_id, timeout = 30, agent_id }) {
        this.#trackCall('a2a_acquire_lock');

        if (!lock_id || typeof lock_id !== 'string') {
            return {
                success: false,
                error: 'lock_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'lock_request',
                lock_id,
                timeout,
                agent_id: agent_id || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                lock_id,
                granted: response.granted ?? false,
                expires_at: response.expires_at,
                queue_position: response.queue_position
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 13: a2a_release_lock (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AReleaseLock() {
        const tool = {
            name: 'a2a_release_lock',
            description:
                'Release a distributed lock that was previously acquired. ' +
                'The next agent in the queue (if any) will be automatically granted the lock.',
            inputSchema: {
                type: 'object',
                properties: {
                    lock_id: {
                        type: 'string',
                        description: 'Unique identifier for the lock to release'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID releasing the lock (defaults to current session)'
                    }
                },
                required: ['lock_id']
            },
            handler: async (params) => {
                return this.#handleA2AReleaseLock(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AReleaseLock({ lock_id, agent_id }) {
        this.#trackCall('a2a_release_lock');

        if (!lock_id || typeof lock_id !== 'string') {
            return {
                success: false,
                error: 'lock_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'lock_release',
                lock_id,
                agent_id: agent_id || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.released ?? true,
                lock_id,
                released: response.released,
                error: response.error
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 14: a2a_barrier_enter (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ABarrierEnter() {
        const tool = {
            name: 'a2a_barrier_enter',
            description:
                'Enter a synchronization barrier and wait for other agents. ' +
                'When the expected number of agents have entered, all are released simultaneously. ' +
                'Useful for coordinating multi-agent workflows at specific checkpoints.',
            inputSchema: {
                type: 'object',
                properties: {
                    barrier_id: {
                        type: 'string',
                        description: 'Unique identifier for the barrier (e.g., "phase-1-complete")'
                    },
                    expected_count: {
                        type: 'number',
                        description: 'Number of agents that must enter before release (default: 2)',
                        default: 2
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID entering the barrier (defaults to current session)'
                    }
                },
                required: ['barrier_id']
            },
            handler: async (params) => {
                return this.#handleA2ABarrierEnter(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ABarrierEnter({ barrier_id, expected_count = 2, agent_id }) {
        this.#trackCall('a2a_barrier_enter');

        if (!barrier_id || typeof barrier_id !== 'string') {
            return {
                success: false,
                error: 'barrier_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'barrier_enter',
                barrier_id,
                expected_count,
                agent_id: agent_id || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                barrier_id,
                released: response.released ?? false,
                arrived_count: response.arrived_count,
                expected_count: response.expected_count ?? expected_count
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 15: a2a_assign_task (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AAssignTask() {
        const tool = {
            name: 'a2a_assign_task',
            description:
                'Assign a task to another agent for asynchronous execution. ' +
                'The target agent receives a task_assigned event and can report progress. ' +
                'Use a2a_get_task_result to retrieve final result.',
            inputSchema: {
                type: 'object',
                properties: {
                    to_agent: {
                        type: 'string',
                        description: 'Agent ID to assign task to'
                    },
                    task_type: {
                        type: 'string',
                        description: 'Type of task (e.g., "scan_region", "analyze_data")'
                    },
                    params: {
                        type: 'object',
                        description: 'Task parameters specific to task_type'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Task timeout in seconds (default: 300)',
                        default: 300
                    }
                },
                required: ['to_agent', 'task_type', 'params']
            },
            handler: async (params) => {
                return this.#handleA2AAssignTask(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AAssignTask({ to_agent, task_type, params, timeout = 300 }) {
        this.#trackCall('a2a_assign_task');

        if (!to_agent || !task_type) {
            return {
                success: false,
                error: 'to_agent and task_type are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'assign_task',
                from_agent: 'default-agent',
                to_agent,
                task_type,
                params: params || {},
                timeout
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: !response.error,
                task_id: response.task_id,
                status: response.status,
                assigned_to: response.assigned_to,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 16: a2a_report_progress (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AReportProgress() {
        const tool = {
            name: 'a2a_report_progress',
            description:
                'Report progress on an assigned task. ' +
                'The task owner receives progress updates via task_progress events.',
            inputSchema: {
                type: 'object',
                properties: {
                    task_id: {
                        type: 'string',
                        description: 'Task ID to report progress on'
                    },
                    progress: {
                        type: 'number',
                        description: 'Progress value from 0.0 to 1.0',
                        minimum: 0,
                        maximum: 1
                    },
                    status: {
                        type: 'string',
                        description: 'Optional status update (in_progress, waiting, etc.)'
                    },
                    message: {
                        type: 'string',
                        description: 'Optional progress message'
                    }
                },
                required: ['task_id', 'progress']
            },
            handler: async (params) => {
                return this.#handleA2AReportProgress(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AReportProgress({ task_id, progress, status, message }) {
        this.#trackCall('a2a_report_progress');

        if (!task_id) {
            return {
                success: false,
                error: 'task_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'report_progress',
                task_id,
                agent_id: 'default-agent',
                progress: Math.max(0, Math.min(1, progress)),
                status,
                message
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: !response.error,
                task_id: response.task_id,
                progress: response.progress,
                status: response.status,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 17: a2a_get_task_result (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AGetTaskResult() {
        const tool = {
            name: 'a2a_get_task_result',
            description:
                'Get status and result of an assigned task. ' +
                'Poll this to check if a task has completed and retrieve result.',
            inputSchema: {
                type: 'object',
                properties: {
                    task_id: {
                        type: 'string',
                        description: 'Task ID to query'
                    }
                },
                required: ['task_id']
            },
            handler: async (params) => {
                return this.#handleA2AGetTaskResult(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AGetTaskResult({ task_id }) {
        this.#trackCall('a2a_get_task_result');

        if (!task_id) {
            return {
                success: false,
                error: 'task_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'get_task',
                task_id
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    task_id,
                    error: response.error,
                    error_code: 'TASK_NOT_FOUND'
                };
            }

            return {
                success: true,
                task_id: response.task_id,
                status: response.status,
                progress: response.progress,
                result: response.result,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 18: builder_place_tile (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderPlaceTile() {
        const tool = {
            name: 'builder_place_tile',
            description:
                'Place a tile on the infinite map at specific coordinates. ' +
                'The AI uses this to visually construct Geometry OS by placing ' +
                'system, code, data, or cartridge tiles.',
            inputSchema: {
                type: 'object',
                properties: {
                    tile_type: {
                        type: 'string',
                        enum: ['empty', 'system', 'data', 'code', 'cartridge', 'nursery'],
                        description: 'Type of tile to place'
                    },
                    x: {
                        type: 'number',
                        description: 'Grid X coordinate'
                    },
                    y: {
                        type: 'number',
                        description: 'Grid Y coordinate'
                    },
                    size: {
                        type: 'number',
                        description: 'Tile size in pixels (default: 100)',
                        default: 100
                    },
                    metadata: {
                        type: 'object',
                        description: 'Optional tile metadata'
                    }
                },
                required: ['tile_type', 'x', 'y']
            },
            handler: async (params) => {
                return this.#handleBuilderPlaceTile(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderPlaceTile({ tile_type, x, y, size = 100, metadata = {} }) {
        this.#trackCall('builder_place_tile');

        // Validate tile_type
        const validTypes = ['empty', 'system', 'data', 'code', 'cartridge', 'nursery'];
        if (!tile_type || !validTypes.includes(tile_type)) {
            return {
                success: false,
                error: `tile_type must be one of: ${validTypes.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate coordinates
        if (typeof x !== 'number' || typeof y !== 'number') {
            return {
                success: false,
                error: 'x and y must be numbers',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Use BuilderPanel if available
            if (window.builderPanel) {
                const result = window.builderPanel.placeTile(tile_type, x, y, { size, metadata });
                return result;
            }

            // Fallback if panel not available
            return {
                success: true,
                tile_id: `tile_${Date.now()}`,
                position: { x, y },
                size,
                note: 'BuilderPanel not initialized - tile placed virtually'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 16: builder_load_shader (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderLoadShader() {
        const tool = {
            name: 'builder_load_shader',
            description:
                'Load a WGSL shader into the builder for preview and evolution. ' +
                'The shader can be applied to tiles or evolved by the AI.',
            inputSchema: {
                type: 'object',
                properties: {
                    name: {
                        type: 'string',
                        description: 'Shader name for identification'
                    },
                    wgsl_code: {
                        type: 'string',
                        description: 'WGSL shader source code'
                    }
                },
                required: ['name', 'wgsl_code']
            },
            handler: async (params) => {
                return this.#handleBuilderLoadShader(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderLoadShader({ name, wgsl_code }) {
        this.#trackCall('builder_load_shader');

        if (!name || typeof name !== 'string') {
            return {
                success: false,
                error: 'name must be a non-empty string',
                error_code: 'INVALID_INPUT'
            };
        }

        if (!wgsl_code || typeof wgsl_code !== 'string') {
            return {
                success: false,
                error: 'wgsl_code must be a non-empty string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            if (window.builderPanel) {
                const result = window.builderPanel.loadShader(name, wgsl_code);
                return result;
            }

            return {
                success: true,
                shader_id: `shader_${Date.now()}`,
                name,
                preview_ready: false,
                note: 'BuilderPanel not initialized'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 17: builder_evolve_shader (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderEvolveShader() {
        const tool = {
            name: 'builder_evolve_shader',
            description:
                'Evolve the currently loaded shader using genetic algorithms. ' +
                'Returns evolved shader code for preview and selection.',
            inputSchema: {
                type: 'object',
                properties: {
                    shader_id: {
                        type: 'string',
                        description: 'ID of shader to evolve'
                    },
                    evolution_params: {
                        type: 'object',
                        description: 'Evolution parameters (mutation_rate, generations, etc.)',
                        properties: {
                            mutation_rate: { type: 'number' },
                            generations: { type: 'number' }
                        }
                    }
                },
                required: ['shader_id']
            },
            handler: async (params) => {
                return this.#handleBuilderEvolveShader(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderEvolveShader({ shader_id, evolution_params = {} }) {
        this.#trackCall('builder_evolve_shader');

        if (!shader_id) {
            return {
                success: false,
                error: 'shader_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Get current shader from builderPanel
            const state = window.builderPanel?.getState();
            const currentShader = state?.current_shader;

            if (!currentShader || currentShader.shader_id !== shader_id) {
                return {
                    success: false,
                    error: `Shader ${shader_id} not found in builder`,
                    error_code: 'NOT_FOUND'
                };
            }

            // Log evolution action
            window.builderPanel?.logAction(`Evolving shader ${shader_id}`, 'info');

            // Return evolution result (placeholder for actual evolution)
            return {
                success: true,
                original_shader_id: shader_id,
                evolved_shader_id: `evolved_${shader_id}`,
                generations: evolution_params.generations || 10,
                fitness_score: 0.85,
                note: 'Shader evolution completed (stub - connect to evolution backend)'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 18: builder_assemble_cartridge (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderAssembleCartridge() {
        const tool = {
            name: 'builder_assemble_cartridge',
            description:
                'Assemble a PixelRTS cartridge from a region of the infinite map. ' +
                'Collects all tiles in the region into a bootable cartridge.',
            inputSchema: {
                type: 'object',
                properties: {
                    region: {
                        type: 'object',
                        description: 'Region to assemble',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' },
                            width: { type: 'number' },
                            height: { type: 'number' }
                        }
                    },
                    files: {
                        type: 'array',
                        description: 'Additional files to include',
                        items: { type: 'string' }
                    },
                    name: {
                        type: 'string',
                        description: 'Cartridge name'
                    }
                },
                required: ['region', 'name']
            },
            handler: async (params) => {
                return this.#handleBuilderAssembleCartridge(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderAssembleCartridge({ region, files = [], name }) {
        this.#trackCall('builder_assemble_cartridge');

        if (!region || typeof region.x !== 'number') {
            return {
                success: false,
                error: 'region must have x, y, width, height properties',
                error_code: 'INVALID_INPUT'
            };
        }

        if (!name) {
            return {
                success: false,
                error: 'name is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Get tiles from builderPanel
            const state = window.builderPanel?.getState();
            const tiles = state?.tiles || [];

            // Filter tiles in region
            const regionTiles = tiles.filter(t => {
                const tx = t.position.x;
                const ty = t.position.y;
                return tx >= region.x && tx < region.x + (region.width || 10) &&
                    ty >= region.y && ty < region.y + (region.height || 10);
            });

            window.builderPanel?.logAction(`Assembling cartridge '${name}' with ${regionTiles.length} tiles`, 'info');

            // Return assembly result
            return {
                success: true,
                cartridge_id: `cart_${Date.now()}`,
                name,
                tiles_included: regionTiles.length,
                files_included: files.length,
                estimated_size: `${(regionTiles.length * 0.5 + files.length * 0.1).toFixed(1)} KB`,
                note: 'Cartridge assembled (stub - connect to cartridge builder)'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 19: builder_preview (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderPreview() {
        const tool = {
            name: 'builder_preview',
            description:
                'Capture a preview image of the current build or a specific region. ' +
                'Returns image data URL for display or download.',
            inputSchema: {
                type: 'object',
                properties: {
                    region: {
                        type: 'object',
                        description: 'Optional region to preview (defaults to all)',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' },
                            width: { type: 'number' },
                            height: { type: 'number' }
                        }
                    }
                }
            },
            handler: async (params) => {
                return this.#handleBuilderPreview(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderPreview({ region } = {}) {
        this.#trackCall('builder_preview');

        try {
            if (window.builderPanel) {
                const result = window.builderPanel.preview();
                return {
                    success: true,
                    message: result.message,
                    tiles_previewed: window.builderPanel.getState().tiles.length,
                    region: region || 'all'
                };
            }

            return {
                success: true,
                message: 'Preview captured (no visual output - BuilderPanel not available)',
                region: region || 'all'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 20: builder_get_state (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderGetState() {
        const tool = {
            name: 'builder_get_state',
            description:
                'Get the current state of the AI builder including all placed tiles, ' +
                'loaded shaders, and current selection.',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            handler: async (params) => {
                return this.#handleBuilderGetState(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderGetState() {
        this.#trackCall('builder_get_state');

        try {
            if (window.builderPanel) {
                const state = window.builderPanel.getState();
                return {
                    success: true,
                    ...state
                };
            }

            return {
                success: true,
                tiles: [],
                current_shader: null,
                selected_tile_type: 'system',
                note: 'BuilderPanel not initialized'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 21: session_create (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionCreate() {
        const tool = {
            name: 'session_create',
            description:
                'Create a new collaborative build session for multiple AI agents. ' +
                'Returns session_id and invite_token for other agents to join.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_name: {
                        type: 'string',
                        description: 'Human-readable session name'
                    },
                    max_agents: {
                        type: 'number',
                        description: 'Maximum concurrent agents (default: 10)',
                        default: 10
                    },
                    grid_size: {
                        type: 'number',
                        description: 'Map grid size (default: 1000)',
                        default: 1000
                    },
                    coordination_mode: {
                        type: 'string',
                        enum: ['free', 'coordinated', 'sequential'],
                        description: 'Coordination mode (default: coordinated)',
                        default: 'coordinated'
                    },
                    config: {
                        type: 'object',
                        description: 'Optional session configuration'
                    }
                },
                required: ['session_name']
            },
            handler: async (params) => {
                return this.#handleSessionCreate(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionCreate({ session_name, max_agents = 10, grid_size = 1000, coordination_mode = 'coordinated', config }) {
        this.#trackCall('session_create');

        if (!session_name) {
            return {
                success: false,
                error: 'session_name is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'create_session',
                session_name,
                max_agents,
                grid_size,
                coordination_mode,
                config: config || {}
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                session_id: response.session_id,
                session_name: response.session_name,
                invite_token: response.invite_token,
                state: response.state,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 22: session_join (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionJoin() {
        const tool = {
            name: 'session_join',
            description:
                'Join an existing collaborative build session. ' +
                'Specify role (architect, builder, tester, observer) and capabilities.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to join'
                    },
                    agent_name: {
                        type: 'string',
                        description: 'Unique agent name in session'
                    },
                    role: {
                        type: 'string',
                        enum: ['architect', 'builder', 'tester', 'observer'],
                        description: 'Agent role (default: builder)',
                        default: 'builder'
                    },
                    capabilities: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Agent capabilities (e.g., ["wgsl", "kernel"])'
                    },
                    invite_token: {
                        type: 'string',
                        description: 'Invite token for private sessions'
                    }
                },
                required: ['session_id', 'agent_name']
            },
            handler: async (params) => {
                return this.#handleSessionJoin(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionJoin({ session_id, agent_name, role = 'builder', capabilities, invite_token }) {
        this.#trackCall('session_join');

        if (!session_id || !agent_name) {
            return {
                success: false,
                error: 'session_id and agent_name are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'join_session',
                session_id,
                agent_name,
                role,
                capabilities: capabilities || [],
                invite_token
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                agent_id: response.agent_id,
                session_id: response.session_id,
                role: response.role,
                assigned_color: response.assigned_color,
                session_state: response.session_state,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 23: session_leave (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionLeave() {
        const tool = {
            name: 'session_leave',
            description:
                'Leave a collaborative build session. ' +
                'Releases all claimed regions. Optionally hand off regions to another agent.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to leave'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Your agent ID'
                    },
                    handoff_to: {
                        type: 'string',
                        description: 'Optional agent ID to transfer claimed regions to'
                    }
                },
                required: ['session_id', 'agent_id']
            },
            handler: async (params) => {
                return this.#handleSessionLeave(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionLeave({ session_id, agent_id, handoff_to }) {
        this.#trackCall('session_leave');

        if (!session_id || !agent_id) {
            return {
                success: false,
                error: 'session_id and agent_id are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'leave_session',
                session_id,
                agent_id,
                handoff_to
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                agent_id: response.agent_id,
                released_regions: response.released_regions || [],
                transferred_to: response.transferred_to,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 24: session_get_state (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionGetState() {
        const tool = {
            name: 'session_get_state',
            description:
                'Get the current state of a collaborative build session. ' +
                'Returns agents, claimed regions, and progress metrics.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to query'
                    },
                    include: {
                        type: 'array',
                        items: { enum: ['agents', 'regions', 'tasks', 'progress', 'all'] },
                        description: 'What to include in response (default: all)'
                    }
                },
                required: ['session_id']
            },
            handler: async (params) => {
                return this.#handleSessionGetState(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionGetState({ session_id, include }) {
        this.#trackCall('session_get_state');

        if (!session_id) {
            return {
                success: false,
                error: 'session_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'get_session_state',
                session_id,
                include: include || ['all']
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    session_id,
                    error: response.error,
                    error_code: 'SESSION_NOT_FOUND'
                };
            }

            return {
                success: true,
                session_id: response.session_id,
                session_name: response.session_name,
                status: response.status,
                agents: response.agents || [],
                regions: response.regions || [],
                progress: response.progress || {},
                coordination_mode: response.coordination_mode
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 25: region_claim (Phase G - Region Management)
    // ─────────────────────────────────────────────────────────────

    async #registerRegionClaim() {
        const tool = {
            name: 'region_claim',
            description:
                'Claim exclusive ownership of a map region for building. ' +
                'Returns claim_id if successful, or conflict info if region overlaps with existing claim.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Your agent ID'
                    },
                    region: {
                        type: 'object',
                        properties: {
                            x: { type: 'number', description: 'X coordinate' },
                            y: { type: 'number', description: 'Y coordinate' },
                            width: { type: 'number', description: 'Region width' },
                            height: { type: 'number', description: 'Region height' }
                        },
                        required: ['x', 'y', 'width', 'height']
                    },
                    purpose: {
                        type: 'string',
                        description: 'Why this region is being claimed'
                    },
                    exclusive: {
                        type: 'boolean',
                        description: 'Exclusive claim (default: true)',
                        default: true
                    },
                    timeout: {
                        type: 'number',
                        description: 'Claim expiration in seconds (default: 300)',
                        default: 300
                    }
                },
                required: ['session_id', 'agent_id', 'region']
            },
            handler: async (params) => {
                return this.#handleRegionClaim(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleRegionClaim({ session_id, agent_id, region, purpose = '', exclusive = true, timeout = 300 }) {
        this.#trackCall('region_claim');

        if (!session_id || !agent_id || !region) {
            return {
                success: false,
                error: 'session_id, agent_id, and region are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'claim_region',
                session_id,
                agent_id,
                region,
                purpose,
                exclusive,
                timeout
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                claim_id: response.claim_id,
                bounds: response.bounds,
                expires_at: response.expires_at,
                error: response.error,
                conflicting_claim: response.conflicting_claim,
                conflicting_agent: response.conflicting_agent
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 26: region_release (Phase G - Region Management)
    // ─────────────────────────────────────────────────────────────

    async #registerRegionRelease() {
        const tool = {
            name: 'region_release',
            description:
                'Release a previously claimed region. ' +
                'Optionally transfer ownership to another agent.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    claim_id: {
                        type: 'string',
                        description: 'Claim ID to release'
                    },
                    transfer_to: {
                        type: 'string',
                        description: 'Optional agent ID to transfer claim to'
                    }
                },
                required: ['session_id', 'claim_id']
            },
            handler: async (params) => {
                return this.#handleRegionRelease(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleRegionRelease({ session_id, claim_id, transfer_to }) {
        this.#trackCall('region_release');

        if (!session_id || !claim_id) {
            return {
                success: false,
                error: 'session_id and claim_id are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'release_region',
                session_id,
                claim_id,
                transfer_to
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                claim_id: response.claim_id,
                released: response.released,
                transferred_to: response.transferred_to,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 27: region_query (Phase G - Region Management)
    // ─────────────────────────────────────────────────────────────

    async #registerRegionQuery() {
        const tool = {
            name: 'region_query',
            description:
                'Query region ownership and check if a region is free or claimed. ' +
                'Returns list of overlapping claims if region is not free.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    region: {
                        type: 'object',
                        properties: {
                            x: { type: 'number', description: 'X coordinate' },
                            y: { type: 'number', description: 'Y coordinate' },
                            width: { type: 'number', description: 'Region width' },
                            height: { type: 'number', description: 'Region height' }
                        },
                        required: ['x', 'y', 'width', 'height']
                    }
                },
                required: ['session_id', 'region']
            },
            handler: async (params) => {
                return this.#handleRegionQuery(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleRegionQuery({ session_id, region }) {
        this.#trackCall('region_query');

        if (!session_id || !region) {
            return {
                success: false,
                error: 'session_id and region are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'query_region',
                session_id,
                region
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    error: response.error,
                    error_code: 'SESSION_NOT_FOUND'
                };
            }

            return {
                success: true,
                query_region: response.query_region,
                is_free: response.is_free,
                claims: response.claims || [],
                claims_count: response.claims_count
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 28: task_delegate (Phase G - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerTaskDelegate() {
        const tool = {
            name: 'task_delegate',
            description:
                'Delegate a task to another agent in the session. ' +
                'Use target_agent_id="any" for next available agent. ' +
                'Tasks can have dependencies on other tasks.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    from_agent: {
                        type: 'string',
                        description: 'Your agent ID'
                    },
                    target_agent_id: {
                        type: 'string',
                        description: 'Target agent ID or "any" for next available'
                    },
                    task_type: {
                        type: 'string',
                        enum: ['build', 'test', 'review', 'evolve', 'assemble', 'migrate'],
                        description: 'Type of task'
                    },
                    description: {
                        type: 'string',
                        description: 'Detailed task description'
                    },
                    region: {
                        type: 'object',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' },
                            width: { type: 'number' },
                            height: { type: 'number' }
                        },
                        description: 'Optional region for the task'
                    },
                    priority: {
                        type: 'string',
                        enum: ['low', 'medium', 'high', 'critical'],
                        description: 'Task priority (default: medium)',
                        default: 'medium'
                    },
                    dependencies: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Task IDs that must complete first'
                    }
                },
                required: ['session_id', 'from_agent', 'target_agent_id', 'task_type', 'description']
            },
            handler: async (params) => {
                return this.#handleTaskDelegate(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleTaskDelegate({ session_id, from_agent, target_agent_id, task_type, description, region, priority = 'medium', dependencies }) {
        this.#trackCall('task_delegate');

        if (!session_id || !from_agent || !task_type || !description) {
            return {
                success: false,
                error: 'session_id, from_agent, task_type, and description are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'delegate_task',
                session_id,
                from_agent,
                target_agent_id: target_agent_id || 'any',
                task_type,
                description,
                region,
                priority,
                dependencies
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                task_id: response.task_id,
                status: response.status,
                assigned_to: response.assigned_to,
                blocked_by: response.blocked_by,
                position_in_queue: response.position_in_queue,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 29: task_accept (Phase G - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerTaskAccept() {
        const tool = {
            name: 'task_accept',
            description:
                'Accept a delegated task to start working on it. ' +
                'Cannot accept tasks that are blocked by incomplete dependencies.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    task_id: {
                        type: 'string',
                        description: 'Task ID to accept'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Your agent ID'
                    }
                },
                required: ['session_id', 'task_id', 'agent_id']
            },
            handler: async (params) => {
                return this.#handleTaskAccept(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleTaskAccept({ session_id, task_id, agent_id }) {
        this.#trackCall('task_accept');

        if (!session_id || !task_id || !agent_id) {
            return {
                success: false,
                error: 'session_id, task_id, and agent_id are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'accept_task',
                session_id,
                task_id,
                agent_id
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                task_id: response.task_id,
                status: response.status,
                assigned_to: response.assigned_to,
                error: response.error,
                blocked_by: response.blocked_by
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 30: task_report (Phase G - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerTaskReport() {
        const tool = {
            name: 'task_report',
            description:
                'Report task completion or status update. ' +
                'Completing a task automatically unblocks dependent tasks.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    task_id: {
                        type: 'string',
                        description: 'Task ID'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Your agent ID'
                    },
                    status: {
                        type: 'string',
                        enum: ['completed', 'failed', 'blocked', 'cancelled'],
                        description: 'New task status'
                    },
                    result: {
                        type: 'object',
                        description: 'Task result data'
                    },
                    artifacts: {
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                type: { enum: ['tile', 'shader', 'cartridge', 'screenshot'] },
                                id: { type: 'string' }
                            }
                        },
                        description: 'Artifacts produced by the task'
                    },
                    message: {
                        type: 'string',
                        description: 'Optional status message'
                    }
                },
                required: ['session_id', 'task_id', 'agent_id', 'status']
            },
            handler: async (params) => {
                return this.#handleTaskReport(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleTaskReport({ session_id, task_id, agent_id, status, result, artifacts, message }) {
        this.#trackCall('task_report');

        if (!session_id || !task_id || !agent_id || !status) {
            return {
                success: false,
                error: 'session_id, task_id, agent_id, and status are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'report_task',
                session_id,
                task_id,
                agent_id,
                status,
                result,
                artifacts,
                message
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                task_id: response.task_id,
                status: response.status,
                unblocked_tasks: response.unblocked_tasks || [],
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 31: task_get_queue (Phase G - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerTaskGetQueue() {
        const tool = {
            name: 'task_get_queue',
            description:
                'View pending and in-progress tasks in a session. ' +
                'Returns filtered task list and summary statistics.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    filter: {
                        type: 'object',
                        properties: {
                            assigned_to: { type: 'string', description: 'Filter by assigned agent' },
                            status: { enum: ['pending', 'in_progress', 'blocked', 'all'], description: 'Filter by status' },
                            priority: { type: 'string', description: 'Filter by priority' }
                        }
                    }
                },
                required: ['session_id']
            },
            handler: async (params) => {
                return this.#handleTaskGetQueue(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleTaskGetQueue({ session_id, filter }) {
        this.#trackCall('task_get_queue');

        if (!session_id) {
            return {
                success: false,
                error: 'session_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'get_task_queue',
                session_id,
                filter: filter || {}
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    error: response.error,
                    error_code: 'SESSION_NOT_FOUND'
                };
            }

            return {
                success: true,
                tasks: response.tasks || [],
                summary: response.summary || {}
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 32: build_checkpoint (Phase G - Build Checkpointing)
    // ─────────────────────────────────────────────────────────────

    async #registerBuildCheckpoint() {
        const tool = {
            name: 'build_checkpoint',
            description:
                'Create a checkpoint of the current build session state. ' +
                'Checkpoints can be used to rollback to a known good state.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    checkpoint_name: {
                        type: 'string',
                        description: 'Human-readable checkpoint name'
                    },
                    description: {
                        type: 'string',
                        description: 'Checkpoint description'
                    },
                    created_by: {
                        type: 'string',
                        description: 'Agent ID creating checkpoint'
                    },
                    include: {
                        type: 'array',
                        items: { enum: ['tiles', 'shaders', 'cartridges', 'session_state'] },
                        description: 'What to include (default: all)'
                    }
                },
                required: ['session_id', 'checkpoint_name', 'created_by']
            },
            handler: async (params) => {
                return this.#handleBuildCheckpoint(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuildCheckpoint({ session_id, checkpoint_name, description = '', created_by, include }) {
        this.#trackCall('build_checkpoint');

        if (!session_id || !checkpoint_name || !created_by) {
            return {
                success: false,
                error: 'session_id, checkpoint_name, and created_by are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'create_checkpoint',
                session_id,
                checkpoint_name,
                description,
                created_by,
                include
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                checkpoint_id: response.checkpoint_id,
                checkpoint_name: response.checkpoint_name,
                created_at: response.created_at,
                size_kb: response.size_kb,
                contents: response.contents,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Tool 33: build_rollback (Phase G - Build Checkpointing)
    // ─────────────────────────────────────────────────────────────

    async #registerBuildRollback() {
        const tool = {
            name: 'build_rollback',
            description:
                'Rollback the build session to a previous checkpoint. ' +
                'This will restore the session state to when the checkpoint was created.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID'
                    },
                    checkpoint_id: {
                        type: 'string',
                        description: 'Checkpoint ID to rollback to'
                    },
                    notify_agents: {
                        type: 'boolean',
                        description: 'Notify all agents about rollback (default: true)',
                        default: true
                    }
                },
                required: ['session_id', 'checkpoint_id']
            },
            handler: async (params) => {
                return this.#handleBuildRollback(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuildRollback({ session_id, checkpoint_id, notify_agents = true }) {
        this.#trackCall('build_rollback');

        if (!session_id || !checkpoint_id) {
            return {
                success: false,
                error: 'session_id and checkpoint_id are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'rollback_checkpoint',
                session_id,
                checkpoint_id,
                notify_agents
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                rolled_back_to: response.rolled_back_to,
                rolled_back_at: response.rolled_back_at,
                restored: response.restored,
                lost: response.lost,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Phase G: Linux Control Tools
    // ─────────────────────────────────────────────────────────────

    async #registerLinuxStatus() {
        const tool = {
            name: 'linux_status',
            description:
                'Get the current status of the Linux bridge. ' +
                'Returns session ID, running state, and process info.',
            inputSchema: {
                type: 'object',
                properties: {}
            }
        };

        await navigator.modelContext.registerTool(tool, async (params) => {
            return await this.#callLinuxBridge('status', {});
        });
        this.#registeredTools.push(tool.name);
    }

    async #registerLinuxBoot() {
        const tool = {
            name: 'linux_boot',
            description:
                'Boot a Linux instance (Alpine via QEMU). ' +
                'Returns session ID and boot status.',
            inputSchema: {
                type: 'object',
                properties: {
                    timeout: {
                        type: 'number',
                        description: 'Seconds to wait for boot (default: 30)'
                    }
                }
            }
        };

        await navigator.modelContext.registerTool(tool, async (params) => {
            return await this.#callLinuxBridge('boot', params);
        });
        this.#registeredTools.push(tool.name);
    }

    async #registerLinuxExec() {
        const tool = {
            name: 'linux_exec',
            description:
                'Execute a shell command in the Linux instance. ' +
                'Returns stdout, stderr, and exit code.',
            inputSchema: {
                type: 'object',
                properties: {
                    command: {
                        type: 'string',
                        description: 'Shell command to execute'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Timeout in seconds (default: 30)'
                    }
                },
                required: ['command']
            }
        };

        await navigator.modelContext.registerTool(tool, async (params) => {
            return await this.#callLinuxBridge('exec', {
                cmd: params.command,
                timeout: params.timeout
            });
        });
        this.#registeredTools.push(tool.name);
    }

    async #registerLinuxReadFile() {
        const tool = {
            name: 'linux_read_file',
            description:
                'Read a file from the Linux filesystem. ' +
                'Returns file contents.',
            inputSchema: {
                type: 'object',
                properties: {
                    path: {
                        type: 'string',
                        description: 'Absolute file path'
                    }
                },
                required: ['path']
            }
        };

        await navigator.modelContext.registerTool(tool, async (params) => {
            return await this.#callLinuxBridge('read_file', params);
        });
        this.#registeredTools.push(tool.name);
    }

    async #registerLinuxWriteFile() {
        const tool = {
            name: 'linux_write_file',
            description:
                'Write a file to the Linux filesystem.',
            inputSchema: {
                type: 'object',
                properties: {
                    path: {
                        type: 'string',
                        description: 'Absolute file path'
                    },
                    content: {
                        type: 'string',
                        description: 'File content to write'
                    }
                },
                required: ['path', 'content']
            }
        };

        await navigator.modelContext.registerTool(tool, async (params) => {
            return await this.#callLinuxBridge('write_file', params);
        });
        this.#registeredTools.push(tool.name);
    }

    async #callLinuxBridge(command, params) {
        const wsUrl = 'ws://localhost:8767';

        return new Promise((resolve, reject) => {
            const ws = new WebSocket(wsUrl);
            const timeout = setTimeout(() => {
                ws.close();
                reject(new Error('Linux bridge connection timeout'));
            }, 60000);

            ws.onopen = () => {
                ws.send(JSON.stringify({ command, ...params }));
            };

            ws.onmessage = (event) => {
                clearTimeout(timeout);
                try {
                    const response = JSON.parse(event.data);
                    ws.close();
                    resolve(response);
                } catch (e) {
                    ws.close();
                    reject(e);
                }
            };

            ws.onerror = (error) => {
                clearTimeout(timeout);
                reject(new Error('Linux bridge connection failed. Is the bridge running?'));
            };
        });
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
    // A2A Router Integration (Phase D)
    // ─────────────────────────────────────────────────────────────

    /**
     * Initialize A2A Message Router for this bridge
     *
     * @param {string} agentId - Agent ID for this bridge
     * @param {Object} options - A2A configuration
     * @returns {Promise<A2AMessageRouter>}
     */
    async initA2A(agentId = null, options = {}) {
        if (this.#a2aRouter) {
            console.warn('🔌 WebMCP: A2A router already initialized');
            return this.#a2aRouter;
        }

        // Generate agent ID if not provided
        const id = agentId || `webmcp-${this.#generateAgentId()}`;

        // Create router
        this.#a2aRouter = new A2AMessageRouter(
            id,
            options.wsUrl || 'ws://localhost:8765/a2a',
            {
                maxQueueSize: options.maxQueueSize || 1000,
                mockMode: options.mockMode || false
            }
        );

        // Connect to backend
        try {
            await this.#a2aRouter.connect();
            console.log(`🔌 WebMCP: A2A router ready as ${id}`);
        } catch (err) {
            console.warn(`🔌 WebMCP: A2A connection failed, running in degraded mode:`, err.message);
            // Router still usable for mock/local operations
        }

        // Set up default message handlers
        this.#setupA2AHandlers();

        return this.#a2aRouter;
    }

    /**
     * Get the A2A router instance
     *
     * @returns {A2AMessageRouter|null}
     */
    get a2a() {
        return this.#a2aRouter;
    }

    /**
     * Initialize A2A for a spawned area agent
     * @private
     */
    async #initAgentA2A(agentId, agentType, region, a2aConfig) {
        // Create a dedicated A2A router for this agent
        const a2aRouter = new A2AMessageRouter(
            agentId,
            a2aConfig.wsUrl || 'ws://localhost:8765/a2a',
            {
                maxQueueSize: a2aConfig.message_queue_size || 1000,
                mockMode: a2aConfig.mock_mode || false
            }
        );

        // Connect to backend
        try {
            await a2aRouter.connect();
            console.log(`🔌 WebMCP: Agent ${agentId} A2A connected`);
        } catch (err) {
            console.warn(`🔌 WebMCP: Agent ${agentId} A2A connection failed:`, err.message);
            // Router still usable for mock/local operations
        }

        // Subscribe to configured topics
        if (a2aConfig.topics && Array.isArray(a2aConfig.topics)) {
            for (const topic of a2aConfig.topics) {
                await a2aRouter.subscribe(topic);
            }
        }

        // Register with A2A registry if discovery enabled
        if (a2aConfig.discovery !== false) {
            await a2aRouter.send({
                to_agent: 'registry',
                message_type: 'registry_query',
                content: {
                    query: 'register_agent',
                    agent_id: agentId,
                    agent_type: agentType,
                    region: region,
                    capabilities: this.#getCapabilitiesForAgentType(agentType)
                },
                priority: A2AMessageRouter.PRIORITY.NORMAL
            });
        }

        // Publish agent spawn announcement
        await a2aRouter.publish('agent-spawned', {
            agent_id: agentId,
            agent_type: agentType,
            region: region,
            timestamp: Date.now() / 1000
        }, A2AMessageRouter.PRIORITY.NORMAL);

        return a2aRouter;
    }

    /**
     * Get capabilities for an agent type
     * @private
     */
    #getCapabilitiesForAgentType(agentType) {
        const CAPABILITIES = {
            monitor: ['monitor', 'observe', 'detect_changes', 'pixel_analysis'],
            executor: ['execute', 'modify_pixels', 'run_programs', 'state_mutation'],
            evolver: ['evolve', 'wgsl_kernels', 'genetic_algorithm', 'mutation'],
            analyzer: ['analyze', 'pattern_detection', 'statistics', 'report']
        };
        return CAPABILITIES[agentType] || [];
    }

    /**
     * Set up message handlers for a spawned agent
     * @private
     */
    #setupAgentMessageHandlers(agentId, a2aRouter, agentType) {
        // Handle incoming task assignments for this agent
        a2aRouter.onMessage('task_assignment', (message) => {
            console.log(`🔌 WebMCP: Agent ${agentId} received task:`, message.content);

            // Route based on agent type
            if (agentType === 'monitor' && message.content?.task === 'query_region') {
                // Monitor agents can query their region
                this.#handleAgentQueryRegion(agentId, message, a2aRouter);
            } else if (agentType === 'executor' && message.content?.task === 'execute') {
                // Executor agents handle execute commands
                this.#handleAgentExecute(agentId, message, a2aRouter);
            }
        });

        // Handle coordination requests
        a2aRouter.onMessage('coordination_request', (message) => {
            const operation = message.content?.operation;

            if (operation === 'ping') {
                a2aRouter.send({
                    to_agent: message.from_agent,
                    message_type: 'coordination_response',
                    content: {
                        operation: 'pong',
                        agent_id: agentId,
                        timestamp: Date.now() / 1000
                    },
                    priority: A2AMessageRouter.PRIORITY.NORMAL,
                    metadata: {
                        correlation_id: message.message_id
                    }
                });
            } else if (operation === 'sync_region') {
                // Respond with region state
                const agentData = this.#spawnedAgents.get(agentId);
                a2aRouter.send({
                    to_agent: message.from_agent,
                    message_type: 'coordination_response',
                    content: {
                        operation: 'region_state',
                        agent_id: agentId,
                        region: agentData?.region || {},
                        timestamp: Date.now() / 1000
                    },
                    priority: A2AMessageRouter.PRIORITY.NORMAL,
                    metadata: {
                        correlation_id: message.message_id
                    }
                });
            }
        });

        // Handle barrier synchronization
        a2aRouter.onMessage('coordination_response', async (message) => {
            const operation = message.content?.operation;
            if (operation === 'barrier_ready') {
                console.log(`🔌 WebMCP: Agent ${agentId} barrier ready`);
            }
        });

        console.log(`🔌 WebMCP: Agent ${agentId} (${agentType}) message handlers configured`);
    }

    /**
     * Handle agent region query
     * @private
     */
    async #handleAgentQueryRegion(agentId, message, a2aRouter) {
        const agentData = this.#spawnedAgents.get(agentId);
        const region = agentData?.region || {};

        await a2aRouter.send({
            to_agent: message.from_agent,
            message_type: 'task_result',
            content: {
                task: 'query_region',
                agent_id: agentId,
                region: region,
                timestamp: Date.now() / 1000
            },
            priority: A2AMessageRouter.PRIORITY.NORMAL,
            metadata: {
                correlation_id: message.message_id
            }
        });
    }

    /**
     * Handle agent execute command
     * @private
     */
    async #handleAgentExecute(agentId, message, a2aRouter) {
        const params = message.content?.params || {};

        // Execute via the Pixel CPU
        const result = this.#handleExecutePixelProgram(params);

        await a2aRouter.send({
            to_agent: message.from_agent,
            message_type: 'task_result',
            content: {
                task: 'execute',
                agent_id: agentId,
                result: result,
                timestamp: Date.now() / 1000
            },
            priority: A2AMessageRouter.PRIORITY.NORMAL,
            metadata: {
                correlation_id: message.message_id
            }
        });
    }

    /**
     * Set up default A2A message handlers
     * @private
     */
    #setupA2AHandlers() {
        if (!this.#a2aRouter) return;

        // Handle incoming task assignments
        this.#a2aRouter.onMessage('task_assignment', (message) => {
            console.log('🔌 WebMCP A2A: Task assignment received:', message.content);

            // Route to appropriate tool based on task
            const task = message.content?.task;
            if (task === 'navigate') {
                this.#handleNavigateMap(message.content?.params || {});
            } else if (task === 'get_state') {
                this.#handleGetOSState({});
            } else if (task === 'execute_pixel_program') {
                this.#handleExecutePixelProgram(message.content?.params || {});
            } else if (task === 'load_rts_cartridge') {
                this.#handleLoadRTSCartridge(message.content?.params || {});
            }
        });

        // Handle coordination requests
        this.#a2aRouter.onMessage('coordination_request', (message) => {
            const operation = message.content?.operation;

            if (operation === 'query_state') {
                // Respond with OS state
                this.#a2aRouter?.send({
                    to_agent: message.from_agent,
                    message_type: 'coordination_response',
                    content: {
                        operation: 'state_response',
                        state: this.#handleGetOSState({})
                    },
                    priority: A2AMessageRouter.PRIORITY.NORMAL,
                    metadata: {
                        correlation_id: message.message_id
                    }
                });
            } else if (operation === 'acquire_lock') {
                // Handle lock requests with proper state tracking
                const lockId = message.content?.lock_id;
                console.log(`🔌 WebMCP A2A: Lock request for ${lockId}`);
                // Default: grant lock (backend would validate)
                this.#a2aRouter?.send({
                    to_agent: message.from_agent,
                    message_type: 'coordination_response',
                    content: {
                        operation: 'lock_granted',
                        lock_id: lockId,
                        granted: true
                    },
                    priority: A2AMessageRouter.PRIORITY.HIGH,
                    metadata: {
                        correlation_id: message.message_id
                    }
                });
            } else if (operation === 'release_lock') {
                const lockId = message.content?.lock_id;
                console.log(`🔌 WebMCP A2A: Lock release for ${lockId}`);
            } else if (operation === 'barrier_wait') {
                const barrierId = message.content?.barrier_id;
                console.log(`🔌 WebMCP A2A: Barrier wait for ${barrierId}`);
            }
        });

        // Handle coordination responses
        this.#a2aRouter.onMessage('coordination_response', (message) => {
            const operation = message.content?.operation;
            console.log(`🔌 WebMCP A2A: Coordination response - ${operation}`);
        });

        // Handle status updates (log only)
        this.#a2aRouter.onMessage('status_update', (message) => {
            console.log(`🔌 WebMCP A2A: Status from ${message.from_agent}:`,
                message.content?.status || 'unknown');
        });

        // Handle heartbeats from other agents
        this.#a2aRouter.onMessage('heartbeat', (message) => {
            // Track alive agents for discovery
            const fromAgent = message.from_agent;
            if (!this.#a2aRegistry.has(fromAgent)) {
                this.#a2aRegistry.set(fromAgent, {
                    agent_id: fromAgent,
                    last_seen: Date.now(),
                    status: 'alive'
                });
            } else {
                const entry = this.#a2aRegistry.get(fromAgent);
                entry.last_seen = Date.now();
                entry.status = 'alive';
            }
        });

        // Handle registry responses
        this.#a2aRouter.onMessage('registry_response', (message) => {
            const agents = message.content?.agents || [];
            console.log(`🔌 WebMCP A2A: Registry update - ${agents.length} agents`);
            for (const agent of agents) {
                this.#a2aRegistry.set(agent.agent_id, agent);
            }
        });
    }

    /**
     * Generate a short agent ID
     * @private
     */
    #generateAgentId() {
        return Math.random().toString(36).substr(2, 8);
    }

    // ─────────────────────────────────────────────────────────────
    // Observability
    // ─────────────────────────────────────────────────────────────

    #trackCall(toolName) {
        this.#callCount++;
        this.#toolCallCounts[toolName] = (this.#toolCallCounts[toolName] || 0) + 1;
    }

    // ─────────────────────────────────────────────────────────────
    // Circuit Breaker (Phase E)
    // ─────────────────────────────────────────────────────────────

    /**
     * Record a successful operation
     * @private
     */
    #circuitBreakerRecordSuccess() {
        this.#circuitBreakerMetrics.totalSuccesses++;

        switch (this.#circuitBreakerState) {
            case 'CLOSED':
                // Reset failure count on success in CLOSED state
                this.#circuitBreakerFailures = 0;
                break;

            case 'HALF_OPEN':
                // Track successful calls in HALF_OPEN state
                this.#circuitBreakerHalfOpenCalls++;

                // If we've had enough successes, close the circuit
                if (this.#circuitBreakerHalfOpenCalls >= this.#circuitBreakerConfig.successThreshold) {
                    this.#circuitBreakerTransition('CLOSED');
                    this.#circuitBreakerFailures = 0;
                    this.#circuitBreakerHalfOpenCalls = 0;
                    console.log('🔌 WebMCP: Circuit breaker CLOSED after successful recovery');
                }
                break;

            case 'OPEN':
                // Should not happen - requests should be blocked in OPEN state
                console.warn('🔌 WebMCP: Success recorded while circuit is OPEN');
                break;
        }
    }

    /**
     * Record a failed operation
     * @private
     * @param {Error} error - The error that caused the failure
     */
    #circuitBreakerRecordFailure(error) {
        this.#circuitBreakerMetrics.totalFailures++;
        this.#circuitBreakerLastFailure = Date.now();

        switch (this.#circuitBreakerState) {
            case 'CLOSED':
            case 'HALF_OPEN':
                this.#circuitBreakerFailures++;

                // Check if we should trip the circuit
                const threshold = this.#circuitBreakerConfig.failureThreshold;
                if (this.#circuitBreakerFailures >= threshold) {
                    this.#circuitBreakerTransition('OPEN');
                    console.error(`🔌 WebMCP: Circuit breaker OPEN after ${this.#circuitBreakerFailures} consecutive failures:`, error.message);
                }
                break;

            case 'OPEN':
                // Circuit already open - just log
                console.warn('🔌 WebMCP: Failure recorded while circuit is OPEN:', error.message);
                break;
        }
    }

    /**
     * Check if a request should be allowed based on circuit state
     * @private
     * @returns {Object} { allowed: boolean, reason?: string }
     */
    #circuitBreakerAllowRequest() {
        const now = Date.now();

        switch (this.#circuitBreakerState) {
            case 'CLOSED':
                return { allowed: true };

            case 'OPEN':
                // Check if reset timeout has elapsed
                const timeSinceOpen = now - this.#circuitBreakerOpenedAt;
                if (timeSinceOpen >= this.#circuitBreakerConfig.resetTimeout) {
                    // Transition to HALF_OPEN to test recovery
                    this.#circuitBreakerTransition('HALF_OPEN');
                    this.#circuitBreakerHalfOpenCalls = 0;
                    console.log('🔌 WebMCP: Circuit breaker HALF_OPEN - testing recovery');
                    return { allowed: true };
                }
                // Calculate remaining cooldown
                const remainingCooldown = Math.ceil((this.#circuitBreakerConfig.resetTimeout - timeSinceOpen) / 1000);
                return {
                    allowed: false,
                    reason: `Circuit is OPEN. Retry in ${remainingCooldown}s`
                };

            case 'HALF_OPEN':
                // Allow limited number of calls in HALF_OPEN state
                if (this.#circuitBreakerHalfOpenCalls >= this.#circuitBreakerConfig.halfOpenMaxCalls) {
                    // Too many calls in HALF_OPEN - trip back to OPEN
                    this.#circuitBreakerTransition('OPEN');
                    return {
                        allowed: false,
                        reason: 'Circuit is OPEN. HALF_OPEN test exceeded max calls'
                    };
                }
                return { allowed: true };

            default:
                return { allowed: true };
        }
    }

    /**
     * Transition circuit to a new state
     * @private
     * @param {string} newState - The new state (CLOSED | OPEN | HALF_OPEN)
     */
    #circuitBreakerTransition(newState) {
        const oldState = this.#circuitBreakerState;
        const now = Date.now();

        // Track state transition
        this.#circuitBreakerMetrics.stateTransitions.push({
            from: oldState,
            to: newState,
            timestamp: now
        });

        // Keep only last 100 transitions
        if (this.#circuitBreakerMetrics.stateTransitions.length > 100) {
            this.#circuitBreakerMetrics.stateTransitions.shift();
        }

        // Update metrics
        if (newState === 'OPEN') {
            this.#circuitBreakerOpenedAt = now;
            this.#circuitBreakerMetrics.openCount++;
            this.#circuitBreakerMetrics.tripsCount++;
        } else if (oldState === 'OPEN' && newState === 'HALF_OPEN') {
            // Calculate how long circuit was open
            this.#circuitBreakerMetrics.lastOpenDuration = now - this.#circuitBreakerOpenedAt;
        }

        this.#circuitBreakerState = newState;
    }

    /**
     * Get current circuit breaker state
     * @returns {Object} Circuit breaker status
     */
    #circuitBreakerGetState() {
        const now = Date.now();
        let timeInState = 0;

        if (this.#circuitBreakerState === 'OPEN' && this.#circuitBreakerOpenedAt > 0) {
            timeInState = now - this.#circuitBreakerOpenedAt;
        }

        return {
            state: this.#circuitBreakerState,
            failures: this.#circuitBreakerFailures,
            lastFailure: this.#circuitBreakerLastFailure,
            timeInState,
            metrics: {
                ...this.#circuitBreakerMetrics,
                transitionCount: this.#circuitBreakerMetrics.stateTransitions.length
            },
            config: this.#circuitBreakerConfig
        };
    }

    /**
     * Manually reset the circuit breaker (for testing/recovery)
     * @param {string} [newState='CLOSED'] - Target state
     */
    resetCircuitBreaker(newState = 'CLOSED') {
        this.#circuitBreakerTransition(newState);
        this.#circuitBreakerFailures = 0;
        this.#circuitBreakerHalfOpenCalls = 0;
        console.log(`🔌 WebMCP: Circuit breaker manually reset to ${newState}`);
    }

    /**
     * Wrap an async operation with circuit breaker protection
     * @private
     * @param {Function} operation - Async function to execute
     * @param {string} [operationName='operation'] - Name for logging
     * @returns {Promise<*>} Result of the operation
     */
    async #circuitBreakerExecute(operation, operationName = 'operation') {
        // Check if request is allowed
        const check = this.#circuitBreakerAllowRequest();
        if (!check.allowed) {
            throw new Error(`Circuit breaker: ${check.reason}`);
        }

        try {
            const result = await operation();
            this.#circuitBreakerRecordSuccess();
            return result;
        } catch (error) {
            this.#circuitBreakerRecordFailure(error);
            throw error;
        }
    }

    /**
     * Get bridge diagnostics (callable from DevTools console)
     * @returns {Object} Bridge status and metrics
     */
    getStatus() {
        const status = {
            available: this.#webmcpAvailable,
            registered: this.#registered,
            tools: [...this.#registeredTools],
            totalCalls: this.#callCount,
            callBreakdown: { ...this.#toolCallCounts },
            appConnected: !!this.#app,
            phaseE: {
                circuitBreaker: this.#circuitBreakerGetState()
            },
            phaseD: {
                a2aEnabled: !!this.#a2aRouter,
                a2aStatus: this.#a2aRouter?.getStatus() || null,
                spawnedAgentsCount: this.#spawnedAgents.size
            }
        };
        return status;
    }

    /**
     * Get the A2A client (router) for a specific spawned agent
     * @param {string} agentId - Agent ID
     * @returns {A2AMessageRouter|null} A2A router or null if not found
     */
    getAgentA2AClient(agentId) {
        const agentData = this.#spawnedAgents.get(agentId);
        return agentData?.router || null;
    }

    /**
     * Get all agents with active A2A connections
     * @returns {string[]} List of agent IDs with A2A enabled
     */
    getAgentsWithA2A() {
        return Array.from(this.#spawnedAgents.keys());
    }

    /**
     * Get detailed info for a spawned agent
     * @param {string} agentId - Agent ID
     * @returns {Object|null} Agent info or null if not found
     */
    getAgentInfo(agentId) {
        const agentData = this.#spawnedAgents.get(agentId);
        if (!agentData) return null;

        return {
            agentId,
            agentType: agentData.agentType,
            region: agentData.region,
            config: agentData.config,
            spawnedAt: agentData.spawnedAt,
            a2aEnabled: !!agentData.router,
            a2aStatus: agentData.router?.getStatus() || null
        };
    }
}

// ─────────────────────────────────────────────────────────────────
// Auto-Initialize
// ─────────────────────────────────────────────────────────────────

// Expose globally for DevTools inspection
window.webmcpBridge = new WebMCPBridge();

console.log('📡 WebMCP Bridge loaded — "The Screen is the Hard Drive, and now the API surface."');

// ─────────────────────────────────────────────────────────────────
// Phase D: A2A Message Router
// ─────────────────────────────────────────────────────────────────

/**
 * A2A Message Router for Agent2Agent Communication
 *
 * Implements Geometry OS A2A protocol for horizontal agent-to-agent
 * communication. Handles WebSocket connection, message routing, agent
 * discovery, and coordination primitives.
 *
 * @see docs/plans/2026-02-13-webmcp-phase-d-design.md
 * @version 1.0.0
 * @phase Phase D: A2A Protocol for Agent Coordination
 */
class A2AMessageRouter {

    /** @type {WebSocket|null} */
    #ws = null;

    /** @type {string|null} */
    #agentId = null;

    /** @type {string} */
    #wsUrl;

    /** @type {Map<string, Object>} */
    #registry = new Map();

    /** @type {Map<string, Function>} */
    #messageHandlers = new Map();

    /** @type {Map<string, {resolve: Function, reject: Function}>} */
    #pendingRequests = new Map();

    /** @type {Array<{message: Object, priority: number}>} */
    #messageQueue = [];

    /** @type {number} */
    #maxQueueSize = 1000;

    /** @type {Map<string, string>} */
    #subscriptions = new Map();

    /** @type {NodeJS.Timeout|null} */
    #heartbeatInterval = null;

    /** @type {boolean} */
    #connected = false;

    /** @type {boolean} */
    #mockMode = false;

    /**
     * A2A Priority Levels
     */
    static PRIORITY = {
        CRITICAL: 10,  // System alerts, errors
        HIGH: 8,       // Coordination requests
        NORMAL: 5,     // Regular messages
        LOW: 1         // Background updates
    };

    /**
     * A2A Message Types
     */
    static MESSAGE_TYPES = [
        'task_assignment',
        'task_update',
        'task_result',
        'status_update',
        'coordination_request',
        'coordination_response',
        'heartbeat',
        'error_report',
        'registry_query',
        'registry_response',
        'subscription'
    ];

    /**
     * Create a new A2A Message Router
     *
     * @param {string} agentId - This agent's unique identifier
     * @param {string} wsUrl - WebSocket URL for A2A backend (default: ws://localhost:8765/a2a)
     * @param {Object} options - Configuration options
     */
    constructor(agentId, wsUrl = 'ws://localhost:8765/a2a', options = {}) {
        this.#agentId = agentId;
        this.#wsUrl = wsUrl;
        this.#maxQueueSize = options.maxQueueSize || 1000;
        this.#mockMode = options.mockMode || false;

        if (this.#mockMode) {
            console.log(`🔀 A2A: Running in mock mode (no WebSocket)`);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Connection Management
    // ─────────────────────────────────────────────────────────────

    /**
     * Connect to A2A WebSocket backend
     *
     * @returns {Promise<boolean>} True if connection successful
     */
    async connect() {
        if (this.#connected) {
            console.warn('🔀 A2A: Already connected');
            return true;
        }

        if (this.#mockMode) {
            this.#connected = true;
            this.#startMockHeartbeat();
            console.log('🔀 A2A: Mock mode connected');
            return true;
        }

        return new Promise((resolve, reject) => {
            try {
                this.#ws = new WebSocket(this.#wsUrl);

                this.#ws.onopen = () => {
                    this.#connected = true;
                    this.#registerWithBackend();
                    this.#startHeartbeat();
                    this.#processMessageQueue();
                    console.log(`🔀 A2A: Connected to ${this.#wsUrl} as ${this.#agentId}`);
                    resolve(true);
                };

                this.#ws.onmessage = (event) => {
                    this.#handleIncomingMessage(event.data);
                };

                this.#ws.onerror = (error) => {
                    console.error('🔀 A2A: WebSocket error:', error);
                };

                this.#ws.onclose = (event) => {
                    this.#connected = false;
                    this.#stopHeartbeat();
                    console.log(`🔀 A2A: Disconnected (code: ${event.code})`);
                };

                // Connection timeout
                setTimeout(() => {
                    if (this.#ws?.readyState !== WebSocket.OPEN) {
                        this.#ws?.close();
                        reject(new Error('A2A connection timeout (5s)'));
                    }
                }, 5000);

            } catch (err) {
                reject(new Error(`A2A connection failed: ${err.message}`));
            }
        });
    }

    /**
     * Register this agent with backend registry
     * @private
     */
    #registerWithBackend() {
        const registration = {
            message_type: 'registry_query',
            content: {
                query: 'register_agent',
                agent_id: this.#agentId,
                capabilities: ['webmcp', 'monitor', 'executor']
            }
        };

        this.#sendToBackend(registration);
    }

    /**
     * Disconnect from A2A backend
     */
    disconnect() {
        this.#stopHeartbeat();

        if (this.#ws && this.#ws.readyState === WebSocket.OPEN) {
            // Send goodbye message
            try {
                this.#ws.send(JSON.stringify({
                    message_type: 'status_update',
                    content: { status: 'disconnecting' },
                    from_agent: this.#agentId
                }));
            } catch (e) {
                // Ignore send errors on disconnect
            }

            this.#ws.close();
        }

        this.#connected = false;
        this.#ws = null;
        console.log(`🔀 A2A: Disconnected ${this.#agentId}`);
    }

    // ─────────────────────────────────────────────────────────────
    // Message Sending
    // ─────────────────────────────────────────────────────────────

    /**
     * Send an A2A message
     *
     * @param {Object} params - Message parameters
     * @param {string} params.to_agent - Target agent ID or "broadcast" or "topic:name"
     * @param {string} params.message_type - Type of message
     * @param {Object} params.content - Message payload
     * @param {number} [params.priority=5] - Message priority (1-10)
     * @param {number} [params.expires_in] - TTL in seconds
     * @param {Object} [params.metadata] - Optional metadata
     * @returns {Promise<Object>} Response from recipient
     */
    async send({
        to_agent,
        message_type,
        content,
        priority = A2AMessageRouter.PRIORITY.NORMAL,
        expires_in,
        metadata = {}
    }) {
        // Validate message_type
        if (!A2AMessageRouter.MESSAGE_TYPES.includes(message_type)) {
            throw new Error(`Invalid message_type: ${message_type}`);
        }

        // Validate priority
        if (typeof priority !== 'number' || priority < 1 || priority > 10) {
            throw new Error('Priority must be between 1 and 10');
        }

        // Validate to_agent format
        if (typeof to_agent !== 'string' || to_agent.trim().length === 0) {
            throw new Error('to_agent must be a non-empty string');
        }

        const message = this.#createMessage({
            to_agent,
            message_type,
            content,
            priority,
            expires_in,
            metadata
        });

        // If not connected, queue message
        if (!this.#connected) {
            return this.#enqueueMessage(message);
        }

        // Send immediately
        return this.#sendMessageWithAck(message);
    }

    /**
     * Create a properly formatted A2A message
     * @private
     */
    #createMessage({ to_agent, message_type, content, priority, expires_in, metadata }) {
        const now = Date.now() / 1000;
        const correlationId = metadata?.correlation_id || this.#generateUUID();

        const message = {
            $schema: 'https://geometry.os/a2a/message/v1',
            message_id: this.#generateUUID(),
            timestamp: now,
            from_agent: this.#agentId,
            to_agent,
            message_type,
            priority,
            content,
            metadata: {
                ...metadata,
                correlation_id: correlationId
            }
        };

        // Add expiration if specified
        if (expires_in) {
            message.expires_at = now + expires_in;
        }

        // Add signature placeholder (backend would sign this)
        message.signature = 'sha256-hmac'; // Placeholder

        return message;
    }

    /**
     * Send message and wait for acknowledgment
     * @private
     */
    async #sendMessageWithAck(message) {
        if (message.message_type !== 'registry_query' &&
            message.message_type !== 'heartbeat' &&
            message.message_type !== 'status_update') {

            // Create promise for response
            const responsePromise = new Promise((resolve, reject) => {
                const timeoutId = setTimeout(() => {
                    this.#pendingRequests.delete(message.message_id);
                    reject(new Error(`A2A message timeout: ${message.message_id}`));
                }, 30000); // 30 second timeout

                this.#pendingRequests.set(message.message_id, {
                    resolve,
                    reject,
                    timeoutId,
                    correlationId: message.metadata?.correlation_id
                });
            });

            // Send message
            this.#sendToBackend(message);

            // Wait for response
            return await responsePromise;
        }

        // Fire-and-forget messages
        this.#sendToBackend(message);
        return { success: true, message_id: message.message_id };
    }

    /**
     * Send message to backend
     * @private
     */
    #sendToBackend(message) {
        if (this.#mockMode) {
            // Mock mode: just log
            console.log('🔀 A2A [mock]:', JSON.stringify(message, null, 2));
            return;
        }

        if (this.#ws?.readyState === WebSocket.OPEN) {
            this.#ws.send(JSON.stringify(message));
        } else {
            console.warn('🔀 A2A: WebSocket not ready, queuing message');
            this.#enqueueMessage(message);
        }
    }

    /**
     * Queue a message for later delivery
     * @private
     */
    #enqueueMessage(message) {
        if (this.#messageQueue.length >= this.#maxQueueSize) {
            // Remove oldest low-priority message
            const idx = this.#messageQueue.findIndex(m => m.priority < 5);
            if (idx !== -1) {
                this.#messageQueue.splice(idx, 1);
            } else {
                console.warn('🔀 A2A: Message queue full, dropping message');
                return { success: false, error: 'queue_full' };
            }
        }

        this.#messageQueue.push({
            message,
            priority: message.priority || 5,
            timestamp: Date.now()
        });

        // Sort by priority (descending)
        this.#messageQueue.sort((a, b) => b.priority - a.priority);

        return { success: true, queued: true, queue_length: this.#messageQueue.length };
    }

    /**
     * Process queued messages
     * @private
     */
    #processMessageQueue() {
        while (this.#messageQueue.length > 0 && this.#connected) {
            const { message } = this.#messageQueue.shift();
            try {
                this.#sendToBackend(message);
            } catch (err) {
                console.error('🔀 A2A: Failed to send queued message:', err);
                // Re-queue on failure
                this.#enqueueMessage(message);
                break;
            }
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Message Receiving
    // ─────────────────────────────────────────────────────────────

    /**
     * Handle incoming message from backend
     * @private
     */
    #handleIncomingMessage(data) {
        try {
            const message = JSON.parse(data);

            // Validate message schema
            if (!this.#validateMessage(message)) {
                console.warn('🔀 A2A: Invalid message received:', message);
                return;
            }

            // Check if this is a response to a pending request
            const correlationId = message.metadata?.correlation_id ||
                message.metadata?.in_reply_to;

            if (correlationId) {
                for (const [msgId, pending] of this.#pendingRequests.entries()) {
                    if (pending.correlationId === correlationId) {
                        clearTimeout(pending.timeoutId);
                        this.#pendingRequests.delete(msgId);
                        pending.resolve(message);
                        return;
                    }
                }
            }

            // Route to handler
            const handler = this.#messageHandlers.get(message.message_type);
            if (handler) {
                handler(message);
            } else {
                // Default handler
                this.#defaultMessageHandler(message);
            }

        } catch (err) {
            console.error('🔀 A2A: Failed to parse incoming message:', err);
        }
    }

    /**
     * Validate A2A message schema
     * @private
     */
    #validateMessage(message) {
        if (!message || typeof message !== 'object') {
            return false;
        }

        // Required fields
        const required = ['message_id', 'timestamp', 'from_agent', 'message_type', 'content'];
        for (const field of required) {
            if (!(field in message)) {
                console.warn(`🔀 A2A: Missing required field: ${field}`);
                return false;
            }
        }

        // Validate message_type
        if (!A2AMessageRouter.MESSAGE_TYPES.includes(message.message_type)) {
            console.warn(`🔀 A2A: Unknown message_type: ${message.message_type}`);
            return false;
        }

        return true;
    }

    /**
     * Default message handler (logs unknown messages)
     * @private
     */
    #defaultMessageHandler(message) {
        const from = message.from_agent || 'unknown';
        const type = message.message_type;

        console.log(`🔀 A2A: Received ${type} from ${from}`);

        // Auto-respond to coordination requests with default behavior
        if (type === 'coordination_request') {
            const operation = message.content?.operation;
            if (operation === 'acquire_lock') {
                // Default: grant lock (in production, check lock state)
                this.#sendToBackend({
                    message_type: 'coordination_response',
                    content: {
                        operation: 'lock_granted',
                        lock_id: message.content?.lock_id,
                        granted: true
                    },
                    to_agent: message.from_agent,
                    metadata: {
                        correlation_id: message.message_id
                    }
                });
            }
        }
    }

    /**
     * Register a message handler
     *
     * @param {string} message_type - Type to handle
     * @param {Function} handler - Handler function
     */
    onMessage(message_type, handler) {
        if (typeof handler !== 'function') {
            throw new Error('Handler must be a function');
        }
        this.#messageHandlers.set(message_type, handler);
    }

    // ─────────────────────────────────────────────────────────────
    // Agent Discovery
    // ─────────────────────────────────────────────────────────────

    /**
     * Query A2A agent registry
     *
     * @param {Object} filters - Optional filters
     * @param {string} [filters.agent_type] - Filter by agent type
     * @param {Object} [filters.region_overlaps] - Filter by overlapping region
     * @param {string} [filters.capability] - Filter by capability
     * @returns {Promise<Array>} List of matching agents
     */
    async discover(filters = {}) {
        const query = {
            message_type: 'registry_query',
            content: {
                query: 'list_agents',
                filters: filters || {}
            }
        };

        const response = await this.send({
            to_agent: 'registry',
            message_type: 'registry_query',
            content: query.content,
            priority: A2AMessageRouter.PRIORITY.NORMAL
        });

        if (response.success !== false && response.content?.agents) {
            // Update local cache
            for (const agent of response.content.agents) {
                this.#registry.set(agent.agent_id, agent);
            }
            return response.content.agents;
        }

        // Return cached agents if query fails
        return Array.from(this.#registry.values());
    }

    // ─────────────────────────────────────────────────────────────
    // Pub/Sub
    // ─────────────────────────────────────────────────────────────

    /**
     * Subscribe to a topic
     *
     * @param {string} topic - Topic name (e.g., "region-updates", "alerts")
     * @returns {Promise<boolean>} True if subscribed successfully
     */
    async subscribe(topic) {
        const topicName = topic.startsWith('topic:') ? topic : `topic:${topic}`;

        // Send subscription message
        await this.send({
            to_agent: topicName,
            message_type: 'subscription',
            content: {
                operation: 'subscribe',
                topic: topicName
            },
            priority: A2AMessageRouter.PRIORITY.LOW
        });

        this.#subscriptions.set(topicName, Date.now());
        console.log(`🔀 A2A: Subscribed to ${topicName}`);
        return true;
    }

    /**
     * Unsubscribe from a topic
     *
     * @param {string} topic - Topic name
     */
    unsubscribe(topic) {
        const topicName = topic.startsWith('topic') ? topic : `topic:${topic}`;
        this.#subscriptions.delete(topicName);
        console.log(`🔀 A2A: Unsubscribed from ${topicName}`);
    }

    /**
     * Publish to a topic
     *
     * @param {string} topic - Topic name
     * @param {Object} content - Message content
     * @param {number} [priority] - Message priority
     */
    async publish(topic, content, priority = A2AMessageRouter.PRIORITY.NORMAL) {
        const topicName = topic.startsWith('topic:') ? topic : `topic:${topic}`;

        return await this.send({
            to_agent: topicName,
            message_type: 'status_update',
            content,
            priority
        });
    }

    // ─────────────────────────────────────────────────────────────
    // Coordination Primitives
    // ─────────────────────────────────────────────────────────────

    /**
     * Request a distributed lock
     *
     * @param {string} lockId - Unique lock identifier
     * @param {number} [timeout=30] - Wait timeout in seconds
     * @returns {Promise<boolean>} True if lock acquired
     */
    async acquireLock(lockId, timeout = 30) {
        const response = await this.send({
            to_agent: 'broadcast',
            message_type: 'coordination_request',
            content: {
                operation: 'acquire_lock',
                lock_id: lockId,
                timeout
            },
            priority: A2AMessageRouter.PRIORITY.HIGH
        });

        return response?.content?.granted === true;
    }

    /**
     * Release a distributed lock
     *
     * @param {string} lockId - Lock identifier to release
     */
    async releaseLock(lockId) {
        return await this.send({
            to_agent: 'broadcast',
            message_type: 'coordination_request',
            content: {
                operation: 'release_lock',
                lock_id: lockId
            },
            priority: A2AMessageRouter.PRIORITY.HIGH
        });
    }

    /**
     * Wait at a barrier until all agents arrive
     *
     * @param {string} barrierId - Barrier identifier
     * @param {Array<string>} expectedAgents - Expected agent IDs
     * @param {number} [timeout=60] - Wait timeout in seconds
     * @returns {Promise<boolean>} True if barrier completed
     */
    async barrierWait(barrierId, expectedAgents, timeout = 60) {
        const response = await this.send({
            to_agent: 'broadcast',
            message_type: 'coordination_request',
            content: {
                operation: 'barrier_wait',
                barrier_id: barrierId,
                expected_agents: expectedAgents
            },
            priority: A2AMessageRouter.PRIORITY.HIGH,
            expires_in: timeout
        });

        return response?.content?.released === true;
    }

    // ─────────────────────────────────────────────────────────────
    // Heartbeat
    // ─────────────────────────────────────────────────────────────

    /**
     * Start periodic heartbeat
     * @private
     */
    #startHeartbeat() {
        if (this.#heartbeatInterval) return;

        this.#heartbeatInterval = setInterval(() => {
            this.send({
                to_agent: 'broadcast',
                message_type: 'heartbeat',
                content: {
                    status: 'alive',
                    timestamp: Date.now() / 1000
                },
                priority: A2AMessageRouter.PRIORITY.LOW
            }).catch(() => {
                // Ignore heartbeat failures
            });
        }, 5000); // 5 second heartbeat
    }

    /**
     * Stop periodic heartbeat
     * @private
     */
    #stopHeartbeat() {
        if (this.#heartbeatInterval) {
            clearInterval(this.#heartbeatInterval);
            this.#heartbeatInterval = null;
        }
    }

    /**
     * Mock heartbeat for testing
     * @private
     */
    #startMockHeartbeat() {
        this.#heartbeatInterval = setInterval(() => {
            console.log('🔀 A2A [mock]: heartbeat');
        }, 5000);
    }

    // ─────────────────────────────────────────────────────────────
    // Utilities
    // ─────────────────────────────────────────────────────────────

    /**
     * Generate UUID v4
     * @private
     */
    #generateUUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
            const r = Math.random() * 16 | 0;
            const v = c === 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    /**
     * Get router status
     * @returns {Object} Status information
     */
    getStatus() {
        return {
            agentId: this.#agentId,
            connected: this.#connected,
            mockMode: this.#mockMode,
            wsUrl: this.#wsUrl,
            registrySize: this.#registry.size,
            queuedMessages: this.#messageQueue.length,
            pendingRequests: this.#pendingRequests.size,
            subscriptions: Array.from(this.#subscriptions.keys()),
            handlers: Array.from(this.#messageHandlers.keys())
        };
    }

    /**
     * Get this agent's ID
     * @returns {string} Agent ID
     */
    getAgentId() {
        return this.#agentId;
    }

    /**
     * Check if connected to backend
     * @returns {boolean} Connection status
     */
    isConnected() {
        return this.#connected;
    }
}
