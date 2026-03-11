/**
 * Geometry OS - Optimized Unified Desktop Substrate
 *
 * Optimizations:
 * - Batched state updates
 * - Cached DOM references
 * - Throttled render loop
 * - Event delegation
 * - Change detection for stats
 */

import { GeometryKernel } from './GeometryKernel.js';
import { GeometryFont } from './GeometryFont.js';
import { AgentManager } from './AgentManager.js';
import { InteractionManager } from './InteractionManager.js';
import { createStore, batch } from './lib/hooks.js';

// Hilbert Sector Map (frozen constant)
const HILBERT_SECTORS = Object.freeze({
    KERNEL: { base: 0, size: 1024 },
    MAILBOX: { base: 1024, size: 512 },
    SHELL: { base: 2048, size: 4096 },
    FILES: { base: 8192, size: 16384 },
    MEMORY: { base: 32768, size: 32768 },
    AGENTS: { base: 65536, size: 16384 },
    USER: { base: 100000, size: 100000 }
});

const WINDOW_STATES = Object.freeze({
    NORMAL: 0,
    MINIMIZED: 1,
    MAXIMIZED: 2,
    DRAGGING: 3,
    RESIZING: 4
});

/**
 * DesktopWindow - Optimized with cached position calculations
 */
class DesktopWindow {
    constructor(options) {
        this.id = options.id || `window-${Date.now()}`;
        this.title = options.title || 'Untitled';
        this.type = options.type || 'generic';

        // 3D position and size (flat objects for performance)
        this.position = { ...options.position } || { x: 0, y: 0, z: 0 };
        this.size = { ...options.size } || { width: 400, height: 300 };

        // State
        this.state = WINDOW_STATES.NORMAL;
        this.zIndex = options.zIndex || 0;
        this.visible = true;
        this.focused = false;

        // Content
        this.content = options.content || null;
        this.manager = options.manager || null;

        // Interaction flags
        this.draggable = options.draggable !== false;
        this.resizable = options.resizable !== false;

        // Cached bounds (updated on position change)
        this._cachedBounds = null;
    }

    /**
     * Get cached bounds, recalculate if needed
     */
    getBounds() {
        if (!this._cachedBounds) {
            const hw = this.size.width / 2;
            const hh = this.size.height / 2;
            this._cachedBounds = {
                minX: this.position.x - hw,
                maxX: this.position.x + hw,
                minY: this.position.y - hh,
                maxY: this.position.y + hh
            };
        }
        return this._cachedBounds;
    }

    containsPoint(x, y) {
        const bounds = this.getBounds();
        return x >= bounds.minX && x <= bounds.maxX &&
               y >= bounds.minY && y <= bounds.maxY;
    }

    /**
     * Update position and invalidate cache
     */
    setPosition(x, y, z) {
        this.position.x = x;
        this.position.y = y;
        if (z !== undefined) this.position.z = z;
        this._cachedBounds = null;
    }
}

/**
 * GeometryOS - Optimized root controller
 */
export class GeometryOSOptimized {
    constructor(canvas) {
        this.canvas = canvas;

        // Core systems
        this.device = null;
        this.context = null;
        this.format = null;
        this.kernel = null;
        this.font = null;

        // Reactive store for stats
        this.store = createStore({
            fps: 0,
            windowCount: 0,
            processCount: 0,
            agentCount: 0,
            agentCycles: 0,
            agentReads: 0,
            agentWrites: 0,
            interactionMode: 'SELECT',
            grabbedEntity: null,
            ipcEventCount: 0,
            cameraPosition: { x: 64, y: 64, z: 50 }
        });

        // Desktop state
        this.windows = new Map();
        this.activeWindow = null;
        this.windowZCounter = 0;

        // Hilbert landscape
        this.hilbertSize = 128;
        this.cameraPosition = { x: 64, y: 64, z: 50 };
        this.cameraTarget = { x: 64, y: 64, z: 0 };

        // Interaction state
        this.dragging = null;
        this.dragOffset = { x: 0, y: 0 };

        // Agents
        this.agents = [];
        this.agentPositions = new Map();
        this.agentManager = null;
        this.interactionManager = null;

        // Stats (internal tracking)
        this.frameCount = 0;
        this.lastFrameTime = 0;
        this.fps = 0;
        this.fpsHistory = new Array(10).fill(0);
        this.fpsIndex = 0;

        // IPC event log (limited size)
        this.ipcEvents = [];
        this.maxIPCEvents = 100;

        // Event listeners map (for cleanup)
        this._listeners = new Map();

        // Throttle state
        this._statsUpdatePending = false;
        this._lastStatsUpdate = 0;
        this._statsUpdateInterval = 100; // ms

        // Cached uniform data
        this._uniformData = new Float32Array(16);
        this._windowData = new Float32Array(64 * 4);
    }

    async init() {
        console.log('[GeometryOSOptimized] Igniting Unified Desktop Substrate...');

        // Initialize WebGPU
        if (!navigator.gpu) throw new Error('WebGPU not supported');

        const adapter = await navigator.gpu.requestAdapter();
        this.device = await adapter.requestDevice();
        this.context = this.canvas.getContext('webgpu');
        this.format = navigator.gpu.getPreferredCanvasFormat();

        this.context.configure({
            device: this.device,
            format: this.format,
            alphaMode: 'premultiplied',
        });

        // Initialize shared kernel
        this.kernel = new GeometryKernel();
        this.kernel.device = this.device;
        await this._initKernelBuffers();

        // Load font
        this.font = new GeometryFont();
        await this.font.load();

        // Initialize rendering pipeline
        await this._initPipelines();

        // Create default windows
        this._createDefaultWindows();

        // Initialize managers
        this.agentManager = new AgentManager(this);
        await this.agentManager.init();

        this.interactionManager = new InteractionManager(this);
        await this.interactionManager.init();

        // Wire interactions (optimized)
        this._wireInteractions();

        // Start render loop
        requestAnimationFrame((t) => this._render(t));

        console.log('[GeometryOSOptimized] Desktop Environment ready');
        return this;
    }

    async _initKernelBuffers() {
        // Create kernel buffers
        this.kernel.programBuffer = this.device.createBuffer({
            size: 65536 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        });

        this.kernel.stackBuffer = this.device.createBuffer({
            size: 1024 * 16 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        });

        this.kernel.ramBuffer = this.device.createBuffer({
            size: 256 * 1024 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST | GPUBufferUsage.COPY_SRC,
        });

        this.kernel.pcbBuffer = this.device.createBuffer({
            size: 16 * 16 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST | GPUBufferUsage.COPY_SRC,
        });

        this.kernel.labelsBuffer = this.device.createBuffer({
            size: 1024 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        });

        this.kernel.resultBuffer = this.device.createBuffer({
            size: 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
        });

        // Load kernel shader
        const response = await fetch('kernel.wgsl');
        const code = await response.text();

        this.kernel.pipeline = this.device.createComputePipeline({
            layout: 'auto',
            compute: {
                module: this.device.createShaderModule({ code }),
                entryPoint: 'main',
            },
        });

        console.log('[GeometryOSOptimized] Kernel buffers initialized');
    }

    async _initPipelines() {
        // Desktop rendering shader (same as original)
        const shaderCode = `
struct Uniforms {
    cameraPos: vec4f,
    cameraTarget: vec4f,
    time: f32,
    windowCount: f32,
    padding: vec2f,
}

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var<storage, read> windowData: array<vec4f>;

struct VertexOutput {
    @builtin(position) pos: vec4f,
    @location(0) uv: vec2f,
    @location(1) windowId: f32,
}

@vertex
fn vs_main(@builtin(vertex_index) vi: u32, @builtin(instance_index) ii: u32) -> VertexOutput {
    var out: VertexOutput;
    let quad = array<vec2f, 6>(
        vec2f(-0.5, -0.5), vec2f(0.5, -0.5), vec2f(-0.5, 0.5),
        vec2f(0.5, -0.5), vec2f(0.5, 0.5), vec2f(-0.5, 0.5)
    );

    let vertex = quad[vi];
    let win = windowData[ii];
    let winPos = win.xy;
    let winSize = win.zw;

    let worldPos = vec3f(
        winPos.x + vertex.x * winSize.x,
        winPos.y + vertex.y * winSize.y,
        -5.0 + f32(ii) * 0.1
    );

    let scale = 0.01;
    out.pos = vec4f(
        (worldPos.x - uniforms.cameraPos.x) * scale,
        (worldPos.y - uniforms.cameraPos.y) * scale,
        worldPos.z * 0.1,
        1.0
    );

    out.uv = vertex + 0.5;
    out.windowId = f32(ii);
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4f {
    let borderDist = min(min(in.uv.x, 1.0 - in.uv.x), min(in.uv.y, 1.0 - in.uv.y));
    let borderColor = vec3f(0.0, 1.0, 0.8);
    let bgColor = vec3f(0.02, 0.08, 0.08);
    let borderGlow = smoothstep(0.02, 0.0, borderDist) * borderColor;
    let bg = bgColor * (1.0 - in.uv.y * 0.3);
    return vec4f(bg + borderGlow, 0.95);
}
`;

        this.desktopShader = this.device.createShaderModule({ code: shaderCode });

        this.uniformBuffer = this.device.createBuffer({
            size: 64,
            usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
        });

        this.windowDataBuffer = this.device.createBuffer({
            size: 16 * 64,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        });

        this.desktopPipeline = this.device.createRenderPipeline({
            layout: 'auto',
            vertex: { module: this.desktopShader, entryPoint: 'vs_main' },
            fragment: {
                module: this.desktopShader,
                entryPoint: 'fs_main',
                targets: [{
                    format: this.format,
                    blend: {
                        color: { srcFactor: 'src-alpha', dstFactor: 'one-minus-src-alpha' },
                        alpha: { srcFactor: 'one', dstFactor: 'one-minus-src-alpha' }
                    }
                }]
            },
            primitive: { topology: 'triangle-list' }
        });

        this.desktopBindGroup = this.device.createBindGroup({
            layout: this.desktopPipeline.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: { buffer: this.uniformBuffer } },
                { binding: 1, resource: { buffer: this.windowDataBuffer } }
            ]
        });

        this.depthTexture = this.device.createTexture({
            size: [this.canvas.width, this.canvas.height],
            format: 'depth24plus',
            usage: GPUBufferUsage.RENDER_ATTACHMENT,
        });
    }

    _createDefaultWindows() {
        this.createWindow({
            id: 'shell',
            title: 'Visual Shell',
            type: 'shell',
            position: { x: 200, y: 300, z: 0 },
            size: { width: 350, height: 450 }
        });

        this.createWindow({
            id: 'files',
            title: 'File Manager',
            type: 'files',
            position: { x: 600, y: 300, z: 0 },
            size: { width: 400, height: 400 }
        });

        this.createWindow({
            id: 'memory',
            title: 'Memory Browser',
            type: 'memory',
            position: { x: 1000, y: 300, z: 0 },
            size: { width: 350, height: 450 }
        });

        this.createWindow({
            id: 'ipc',
            title: 'IPC Monitor',
            type: 'ipc',
            position: { x: 600, y: 600, z: 0 },
            size: { width: 400, height: 200 }
        });
    }

    createWindow(options) {
        const win = new DesktopWindow({
            ...options,
            zIndex: this.windowZCounter++
        });

        this.windows.set(win.id, win);
        this.activeWindow = win;

        console.log(`[GeometryOSOptimized] Created window: ${win.title}`);
        return win;
    }

    focusWindow(windowId) {
        const win = this.windows.get(windowId);
        if (!win) return;

        for (const w of this.windows.values()) {
            w.focused = false;
        }

        win.focused = true;
        win.zIndex = this.windowZCounter++;
        this.activeWindow = win;
    }

    closeWindow(windowId) {
        this.windows.delete(windowId);
        if (this.activeWindow?.id === windowId) {
            this.activeWindow = this.windows.values().next().value || null;
        }
    }

    async spawnFromFile(filePath, spirvBinary) {
        const pid = await this.kernel.spawnProcess(spirvBinary, filePath);

        // Record IPC event (with size limit)
        if (this.ipcEvents.length >= this.maxIPCEvents) {
            this.ipcEvents.shift();
        }
        this.ipcEvents.push({
            type: 'spawn',
            from: 'files',
            to: 'shell',
            data: { pid, path: filePath },
            timestamp: Date.now()
        });

        console.log(`[GeometryOSOptimized] Spawned process ${pid} from ${filePath}`);
        return pid;
    }

    registerAgent(agent) {
        this.agents.push(agent);
        this.agentPositions.set(agent.id, {
            x: Math.random() * 200 + 100,
            y: Math.random() * 200 + 100,
            z: 0
        });

        console.log(`[GeometryOSOptimized] Registered agent: ${agent.name || agent.id}`);
    }

    _wireInteractions() {
        // Use event delegation and cached handlers
        const handlers = {
            mousedown: (e) => this._onMouseDown(e),
            mousemove: (e) => this._onMouseMove(e),
            mouseup: (e) => this._onMouseUp(e),
            wheel: (e) => this._onWheel(e),
            keydown: (e) => this._onKeyDown(e)
        };

        for (const [event, handler] of Object.entries(handlers)) {
            const target = event === 'keydown' ? window : this.canvas;
            target.addEventListener(event, handler);
            this._listeners.set(`${event}-${target === window ? 'window' : 'canvas'}`, { target, event, handler });
        }
    }

    _onMouseDown(e) {
        const rect = this.canvas.getBoundingClientRect();
        const x = ((e.clientX - rect.left) / rect.width - 0.5) * 100 + this.cameraPosition.x;
        const y = ((e.clientY - rect.top) / rect.height - 0.5) * 100 + this.cameraPosition.y;

        const sortedWindows = Array.from(this.windows.values())
            .sort((a, b) => b.zIndex - a.zIndex);

        for (const win of sortedWindows) {
            if (win.visible && win.containsPoint(x, y)) {
                this.focusWindow(win.id);

                if (win.draggable) {
                    this.dragging = win;
                    this.dragOffset = {
                        x: x - win.position.x,
                        y: y - win.position.y
                    };
                }
                break;
            }
        }
    }

    _onMouseMove(e) {
        if (!this.dragging) return;

        const rect = this.canvas.getBoundingClientRect();
        const x = ((e.clientX - rect.left) / rect.width - 0.5) * 100 + this.cameraPosition.x;
        const y = ((e.clientY - rect.top) / rect.height - 0.5) * 100 + this.cameraPosition.y;

        this.dragging.setPosition(x - this.dragOffset.x, y - this.dragOffset.y);
    }

    _onMouseUp(e) {
        if (this.dragging) {
            const dropTarget = this._findDropTarget(this.dragging);
            if (dropTarget && dropTarget !== this.dragging) {
                this._handleDrop(this.dragging, dropTarget);
            }
        }

        this.dragging = null;
    }

    _findDropTarget(source) {
        for (const win of this.windows.values()) {
            if (win.id === source.id) continue;
            if (win.containsPoint(source.position.x, source.position.y)) {
                return win;
            }
        }
        return null;
    }

    _handleDrop(source, target) {
        console.log(`[GeometryOSOptimized] Drop: ${source.title} -> ${target.title}`);
        this.emit('drop', { source, target });

        if (this.ipcEvents.length >= this.maxIPCEvents) {
            this.ipcEvents.shift();
        }
        this.ipcEvents.push({
            type: 'drop',
            from: source.id,
            to: target.id,
            timestamp: Date.now()
        });
    }

    _onWheel(e) {
        e.preventDefault();
        this.cameraPosition.z += e.deltaY * 0.05;
        this.cameraPosition.z = Math.max(10, Math.min(200, this.cameraPosition.z));
    }

    _onKeyDown(e) {
        if (e.key === 'Escape') {
            this.dragging = null;
        }
    }

    // Event system
    on(event, callback) {
        if (!this._eventListeners) this._eventListeners = new Map();
        if (!this._eventListeners.has(event)) this._eventListeners.set(event, []);
        this._eventListeners.get(event).push(callback);
    }

    emit(event, data) {
        if (this._eventListeners?.has(event)) {
            this._eventListeners.get(event).forEach(cb => cb(data));
        }
    }

    _updateUniforms(time) {
        // Reuse typed array
        this._uniformData[0] = this.cameraPosition.x;
        this._uniformData[1] = this.cameraPosition.y;
        this._uniformData[2] = this.cameraPosition.z;
        this._uniformData[3] = 0;
        this._uniformData[4] = this.cameraTarget.x;
        this._uniformData[5] = this.cameraTarget.y;
        this._uniformData[6] = this.cameraTarget.z;
        this._uniformData[7] = 0;
        this._uniformData[8] = time * 0.001;
        this._uniformData[9] = this.windows.size;

        this.device.queue.writeBuffer(this.uniformBuffer, 0, this._uniformData);
    }

    _updateWindowData() {
        let i = 0;

        for (const win of this.windows.values()) {
            if (!win.visible) continue;

            this._windowData[i++] = win.position.x;
            this._windowData[i++] = win.position.y;
            this._windowData[i++] = win.size.width;
            this._windowData[i++] = win.size.height;
        }

        this.device.queue.writeBuffer(this.windowDataBuffer, 0, this._windowData, 0, i);
    }

    async _stepKernel() {
        if (this.kernel.processes.length === 0) return;
        await this.kernel.step();
    }

    _render(time) {
        if (!this.device) return;

        // FPS calculation with smoothing
        const dt = time - this.lastFrameTime;
        this.lastFrameTime = time;

        // Rolling average FPS
        this.fpsHistory[this.fpsIndex] = 1000 / dt;
        this.fpsIndex = (this.fpsIndex + 1) % this.fpsHistory.length;
        this.fps = this.fpsHistory.reduce((a, b) => a + b, 0) / this.fpsHistory.length;

        this.frameCount++;

        // Update GPU state
        this._updateUniforms(time);
        this._updateWindowData();

        // Step kernel occasionally
        if (this.frameCount % 3 === 0) {
            this._stepKernel();
        }

        // Update managers
        if (this.agentManager) {
            this.agentManager.update(dt);
            if (this.frameCount % 60 === 0) {
                this.agentManager.simulateActivity();
            }
        }

        if (this.interactionManager) {
            this.interactionManager.update(dt);
        }

        // Throttled stats update
        this._scheduleStatsUpdate(time);

        // Render
        const encoder = this.device.createCommandEncoder();

        const renderPass = encoder.beginRenderPass({
            colorAttachments: [{
                view: this.context.getCurrentTexture().createView(),
                clearValue: { r: 0.02, g: 0.02, b: 0.04, a: 1.0 },
                loadOp: 'clear',
                storeOp: 'store'
            }],
            depthStencilAttachment: {
                view: this.depthTexture.createView(),
                depthClearValue: 1.0,
                depthLoadOp: 'clear',
                depthStoreOp: 'store'
            }
        });

        renderPass.setPipeline(this.desktopPipeline);
        renderPass.setBindGroup(0, this.desktopBindGroup);

        const visibleWindows = Array.from(this.windows.values()).filter(w => w.visible);
        if (visibleWindows.length > 0) {
            renderPass.draw(6, visibleWindows.length);
        }

        if (this.agentManager) {
            this.agentManager.render(encoder, renderPass);
        }

        renderPass.end();

        this.device.queue.submit([encoder.finish()]);

        requestAnimationFrame((t) => this._render(t));
    }

    /**
     * Schedule throttled stats update
     */
    _scheduleStatsUpdate(time) {
        if (time - this._lastStatsUpdate < this._statsUpdateInterval) {
            return;
        }

        this._lastStatsUpdate = time;

        const agentStats = this.agentManager?.getStats() || {};
        const interactionStats = this.interactionManager?.getStats() || {};

        // Update store (will notify subscribers)
        this.store.setState(s => ({
            ...s,
            fps: Math.round(this.fps),
            windowCount: this.windows.size,
            processCount: this.kernel.processes.length,
            agentCount: agentStats.agentCount || 0,
            agentCycles: agentStats.totalCycles || 0,
            agentReads: agentStats.totalReads || 0,
            agentWrites: agentStats.totalWrites || 0,
            interactionMode: interactionStats.mode || 'SELECT',
            grabbedEntity: interactionStats.grabbed,
            ipcEventCount: this.ipcEvents.length,
            cameraPosition: { ...this.cameraPosition }
        }));
    }

    getStats() {
        return this.store.getState();
    }

    /**
     * Cleanup
     */
    destroy() {
        // Remove event listeners
        for (const { target, event, handler } of this._listeners.values()) {
            target.removeEventListener(event, handler);
        }
        this._listeners.clear();

        // Cleanup managers
        this.agentManager?.destroy?.();
        this.interactionManager?.destroy?.();
    }
}

export { HILBERT_SECTORS, WINDOW_STATES, DesktopWindow };
