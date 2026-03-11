/**
 * Geometry OS Visual Shell - Optimized Version
 *
 * Uses hooks-based state management with:
 * - Batched DOM updates
 * - Change detection (only update what changed)
 * - Cached DOM references
 * - Virtual DOM diffing
 * - Throttled updates
 */

import { MemoryBrowser } from './MemoryBrowser.js';
import { SyscallManager } from "./SyscallManager.js";
import { GeometryKernel } from './GeometryKernel.js';
import { Component, createStore, batch, h } from './lib/hooks.js';
import { PROC_STATE } from './agents/index.js';

// State colors (static, no need to recreate)
const STATE_COLORS = Object.freeze({
    [PROC_STATE.IDLE]: '#888888',
    [PROC_STATE.RUNNING]: '#00ff88',
    [PROC_STATE.WAITING]: '#ffaa00',
    [PROC_STATE.DONE]: '#00aaff',
    [PROC_STATE.ERROR]: '#ff4444'
});

const STATE_NAMES = Object.freeze({
    [PROC_STATE.IDLE]: 'IDLE',
    [PROC_STATE.RUNNING]: 'RUNNING',
    [PROC_STATE.WAITING]: 'WAITING',
    [PROC_STATE.DONE]: 'DONE',
    [PROC_STATE.ERROR]: 'ERROR'
});

/**
 * Optimized dashboard component with minimal DOM updates
 */
class DashboardComponent extends Component {
    constructor(container, store) {
        super(container);
        this.store = store;

        // Subscribe to store changes
        this.unsubscribe = store.subscribe((state, changed) => {
            this._updateFromStore(state, changed);
        });
    }

    render() {
        const state = this.store.getState();

        return h('div', { className: 'dashboard-panel' },
            h('div', { className: 'panel-header' }, 'System Dashboard'),
            this._renderRAMBar(state),
            this._renderStatRow('Processes:', state.processCount, 'process-count'),
            this._renderStatRow('Neural Pulse:', state.pulseRate, 'neural-pulse', ' iter/s'),
            this._renderStatRow('IPC Messages:', state.ipcCount, 'ipc-count'),
            this._renderStatRow('Uptime:', state.uptime, 'uptime'),
            h('div', { className: 'divider' }),
            this._renderSaccadeToggle(state),
            h('div', { className: 'divider' }),
            h('div', { className: 'panel-subheader' }, 'IPC Channels'),
            this._renderIPCMonitor(state)
        );
    }

    _renderRAMBar(state) {
        const ramPercent = state.ramPercent;
        const barColor = ramPercent > 80 ? '#ff4444' : '#00ff88';

        return h('div', { className: 'stat-row' },
            h('span', null, 'Visual RAM:'),
            h('div', { className: 'bar-container' },
                h('div', {
                    className: 'bar-fill',
                    id: 'ram-bar',
                    style: { width: `${ramPercent}%`, background: barColor }
                })
            ),
            h('span', { id: 'ram-text' }, state.ramText)
        );
    }

    _renderStatRow(label, value, id, suffix = '') {
        return h('div', { className: 'stat-row' },
            h('span', null, label),
            h('span', { id }, value),
            suffix ? h('span', null, suffix) : null
        );
    }

    _renderSaccadeToggle(state) {
        return h('div', { className: 'stat-row' },
            h('label', null,
                h('input', {
                    type: 'checkbox',
                    id: 'saccade-toggle',
                    checked: state.saccadeEnabled
                }),
                ' Kernel Saccades'
            )
        );
    }

    _renderIPCMonitor(state) {
        if (state.ipcChannels.length === 0) {
            return h('div', { id: 'ipc-monitor', className: 'ipc-monitor' },
                h('div', { className: 'ipc-empty' }, 'No active channels')
            );
        }

        return h('div', { id: 'ipc-monitor', className: 'ipc-monitor' },
            ...state.ipcChannels.map(ch =>
                h('div', { className: 'ipc-channel' },
                    h('span', { className: 'ipc-from' }, ch.fromName),
                    h('span', { className: 'ipc-arrow' }, '→'),
                    h('span', { className: 'ipc-to' }, ch.toName),
                    h('span', { className: 'ipc-count' }, ch.count)
                )
            )
        );
    }

    /**
     * Update only changed elements from store
     */
    _updateFromStore(state, changed) {
        // Direct DOM updates for simple values (faster than vdom for text)
        if (changed.has('ramPercent')) {
            const ramBar = this.$('#ram-bar');
            if (ramBar) {
                ramBar.style.width = `${state.ramPercent}%`;
                ramBar.style.background = state.ramPercent > 80 ? '#ff4444' : '#00ff88';
            }
        }

        if (changed.has('ramText')) {
            const ramText = this.$('#ram-text');
            if (ramText) ramText.textContent = state.ramText;
        }

        if (changed.has('processCount')) {
            const el = this.$('#process-count');
            if (el) el.textContent = state.processCount;
        }

        if (changed.has('pulseRate')) {
            const el = this.$('#neural-pulse');
            if (el) el.textContent = state.pulseRate;
        }

        if (changed.has('ipcCount')) {
            const el = this.$('#ipc-count');
            if (el) el.textContent = state.ipcCount;
        }

        if (changed.has('uptime')) {
            const el = this.$('#uptime');
            if (el) el.textContent = state.uptime;
        }

        if (changed.has('ipcChannels')) {
            this._updateIPCMonitor(state.ipcChannels);
        }
    }

    /**
     * Efficient IPC monitor update
     */
    _updateIPCMonitor(channels) {
        const monitor = this.$('#ipc-monitor');
        if (!monitor) return;

        if (channels.length === 0) {
            monitor.innerHTML = '<div class="ipc-empty">No active channels</div>';
            return;
        }

        // Use DocumentFragment for batched DOM insert
        const fragment = document.createDocumentFragment();

        for (const ch of channels) {
            const row = document.createElement('div');
            row.className = 'ipc-channel';
            row.innerHTML = `
                <span class="ipc-from">${this._escapeHtml(ch.fromName)}</span>
                <span class="ipc-arrow">→</span>
                <span class="ipc-to">${this._escapeHtml(ch.toName)}</span>
                <span class="ipc-count">${ch.count}</span>
            `;
            fragment.appendChild(row);
        }

        monitor.innerHTML = '';
        monitor.appendChild(fragment);
    }

    _escapeHtml(str) {
        const div = document.createElement('div');
        div.textContent = str;
        return div.innerHTML;
    }

    unmount() {
        super.unmount();
        this.unsubscribe?.();
    }
}

/**
 * Process list component with key-based reconciliation
 */
class ProcessListComponent extends Component {
    constructor(container, shell) {
        super(container);
        this.shell = shell;
        this.processes = new Map();
        this._processElements = new Map();
    }

    /**
     * Add or update a process
     */
    updateProcess(pid, data) {
        const existing = this.processes.get(pid);
        const changed = !existing ||
            existing.state !== data.state ||
            existing.name !== data.name;

        this.processes.set(pid, data);

        if (changed) {
            this._renderProcess(pid, data);
        }
    }

    /**
     * Remove a process
     */
    removeProcess(pid) {
        this.processes.delete(pid);
        const el = this._processElements.get(pid);
        if (el) {
            el.remove();
            this._processElements.delete(pid);
        }
    }

    /**
     * Render or update a single process item
     */
    _renderProcess(pid, data) {
        let el = this._processElements.get(pid);

        if (!el) {
            el = document.createElement('div');
            el.className = 'process-item';
            el.id = `process-${pid}`;
            el.addEventListener('click', () => this.shell._focusProcess(pid));
            this.container?.appendChild(el);
            this._processElements.set(pid, el);
        }

        // Update only changed content
        const stateColor = STATE_COLORS[data.state] || STATE_COLORS[PROC_STATE.IDLE];
        const stateName = STATE_NAMES[data.state] || 'UNKNOWN';

        el.innerHTML = `
            <span class="pid">#${pid}</span>
            <span class="pname">${this._escapeHtml(data.name)}</span>
            <span class="pstate" style="color: ${stateColor}">${stateName}</span>
        `;
    }

    _escapeHtml(str) {
        const div = document.createElement('div');
        div.textContent = str;
        return div.innerHTML;
    }

    /**
     * Get all PIDs
     */
    getPIDs() {
        return Array.from(this.processes.keys());
    }

    /**
     * Clear all processes
     */
    clear() {
        this.processes.clear();
        this._processElements.clear();
        if (this.container) this.container.innerHTML = '';
    }
}

/**
 * Optimized VisualShell with hooks-based state
 */
export class VisualShellOptimized extends MemoryBrowser {
    constructor(canvas, options = {}) {
        super(canvas);

        // Core systems
        this.kernel = options.kernel || new GeometryKernel();
        this.syscalls = new SyscallManager(this.kernel);
        this.overlayCanvas = options.overlayCanvas || null;
        this.overlayCtx = this.overlayCanvas ? this.overlayCanvas.getContext("2d") : null;
        this.activePID = 0;
        this.saccadeEnabled = false;
        this.cameraTarget = { x: 0, y: 0, z: 0 };

        // Create reactive store for dashboard state
        this.store = createStore({
            ramPercent: 0,
            ramText: '0 / 64 KB',
            processCount: '0 (0 running)',
            pulseRate: 0,
            ipcCount: 0,
            uptime: '00:00:00',
            saccadeEnabled: false,
            ipcChannels: []
        });

        // UI components
        this.spawnerPanel = null;
        this.dashboardPanel = null;
        this.dashboardComponent = null;
        this.processListComponent = null;
        this.pcbOverlays = new Map();

        // Tracking
        this.lastIterationCount = 0;
        this.ipcChannels = new Map();

        // Throttle state
        this._updatePending = false;
        this._lastUpdateTime = 0;
        this._updateThrottle = 100; // ms

        // Start time
        this._startTime = Date.now();
    }

    async init() {
        await this.kernel.init();
        await super.init();
        this.syscalls.attach(this.canvas, this.overlayCtx);

        // Build optimized UI
        this._initOptimizedUI();

        // Start loops
        this._startPCBReader();
        this._startUptimeCounter();

        console.log('[VisualShellOptimized] OS Interface ready (optimized mode)');
    }

    _initOptimizedUI() {
        // Create spawner panel
        this.spawnerPanel = document.createElement('div');
        this.spawnerPanel.id = 'spawner-panel';
        this.spawnerPanel.innerHTML = `
            <div class="panel-header">Process Spawner</div>
            <div class="drop-zone" id="spv-drop-zone">
                <span>Drop .spv files here</span>
                <input type="file" id="spv-file-input" accept=".spv" multiple hidden>
            </div>
            <button class="btn" id="spawn-from-brain">Spawn from Brain</button>
            <div class="process-list" id="process-list"></div>
        `;
        this.spawnerPanel.style.cssText = `
            position: absolute; top: 80px; left: 20px; width: 250px;
            background: rgba(0, 20, 20, 0.9); border: 1px solid #00ffcc;
            padding: 15px; color: #00ffcc; font-family: monospace;
        `;

        // Create dashboard panel (component will manage contents)
        this.dashboardPanel = document.createElement('div');
        this.dashboardPanel.id = 'dashboard-panel';
        this.dashboardPanel.style.cssText = `
            position: absolute; top: 80px; right: 20px; width: 250px;
            background: rgba(0, 20, 20, 0.9); border: 1px solid #00ffcc;
            padding: 15px; color: #00ffcc; font-family: monospace;
        `;

        this.canvas.parentElement.appendChild(this.spawnerPanel);
        this.canvas.parentElement.appendChild(this.dashboardPanel);

        // Initialize components
        this.processListComponent = new ProcessListComponent(
            document.getElementById('process-list'),
            this
        );

        this.dashboardComponent = new DashboardComponent(
            this.dashboardPanel,
            this.store
        );
        this.dashboardComponent.mount();

        // Wire events (only once)
        this._wireEvents();
    }

    _wireEvents() {
        // Cache DOM elements for events
        const dropZone = this.$('#spv-drop-zone');
        const fileInput = this.$('#spv-file-input');
        const brainBtn = this.$('#spawn-from-brain');
        const saccadeToggle = this.$('#saccade-toggle');

        dropZone?.addEventListener('click', () => fileInput?.click());

        dropZone?.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('drag-over');
        });

        dropZone?.addEventListener('dragleave', () => {
            dropZone.classList.remove('drag-over');
        });

        dropZone?.addEventListener('drop', async (e) => {
            e.preventDefault();
            dropZone.classList.remove('drag-over');
            const files = Array.from(e.dataTransfer.files).filter(f => f.name.endsWith('.spv'));
            for (const file of files) {
                await this.spawnFromFile(file);
            }
        });

        fileInput?.addEventListener('change', async (e) => {
            const files = Array.from(e.target.files);
            for (const file of files) {
                await this.spawnFromFile(file);
            }
        });

        brainBtn?.addEventListener('click', () => this._showBrainPicker());

        // Saccade toggle (delegated)
        this.dashboardPanel?.addEventListener('change', (e) => {
            if (e.target.id === 'saccade-toggle') {
                this.saccadeEnabled = e.target.checked;
                console.log(`[VisualShellOptimized] Saccades ${this.saccadeEnabled ? 'enabled' : 'disabled'}`);
            }
        });
    }

    /**
     * Cached DOM query helper
     */
    $(selector) {
        return this.canvas.parentElement?.querySelector(selector);
    }

    async spawnFromFile(file) {
        console.log(`[VisualShellOptimized] Spawning process from ${file.name}`);

        try {
            const buffer = await file.arrayBuffer();
            const pid = await this.kernel.spawnProcess(buffer, file.name);

            // Add to process list component
            this.processListComponent.updateProcess(pid, {
                name: file.name,
                state: PROC_STATE.IDLE,
                pc: 0,
                sp: 0,
                cycles: 0
            });

            this._scheduleStoreUpdate();

            console.log(`[VisualShellOptimized] Process ${pid} spawned`);
        } catch (e) {
            console.error(`[VisualShellOptimized] Failed to spawn: ${e.message}`);
        }
    }

    _focusProcess(pid) {
        const pos = this._hilbertDecode(pid);
        this.cameraTarget = { x: pos.x, y: pos.y, z: 5 };
        this.activePID = pid;
        console.log(`[VisualShellOptimized] Focus on process ${pid}`);
    }

    _hilbertDecode(index) {
        let x = 0, y = 0;
        let s = 1;
        let d = index;

        while (s < 32) {
            const rx = 1 & (d / 2);
            const ry = 1 & (d ^ rx);

            if (ry === 0) {
                if (rx === 1) {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                [x, y] = [y, x];
            }

            x += s * rx;
            y += s * ry;
            d = Math.floor(d / 4);
            s *= 2;
        }

        return { x, y };
    }

    _startPCBReader() {
        const readPCBs = async () => {
            if (!this.kernel || !this.device) return;

            try {
                await this.syscalls.syncToGPU();
                await this.kernel.step();
                await this.syscalls.processSyscalls();

                const pcbs = await this.kernel.readPCBs();
                this._updateProcessStates(pcbs);

                // Update pulse rate
                const totalCycles = this.processListComponent.getPIDs()
                    .reduce((sum, pid) => {
                        const proc = this.processListComponent.processes.get(pid);
                        return sum + (proc?.cycles || 0);
                    }, 0);

                const pulseRate = totalCycles - this.lastIterationCount;
                this.lastIterationCount = totalCycles;

                this.store.setState(s => ({
                    ...s,
                    pulseRate
                }));

                if (this.saccadeEnabled) {
                    this._applySaccade();
                }
            } catch (e) {
                // Kernel not ready
            }

            requestAnimationFrame(readPCBs);
        };

        requestAnimationFrame(readPCBs);
    }

    _updateProcessStates(pcbs) {
        for (const pcb of pcbs) {
            const { pid, pc, sp, state, cycles } = pcb;
            const existing = this.processListComponent.processes.get(pid);

            if (existing) {
                // Only update if state changed
                if (existing.state !== state || existing.cycles !== cycles) {
                    this.processListComponent.updateProcess(pid, {
                        ...existing,
                        pc, sp, state, cycles
                    });
                }
            }
        }
    }

    _applySaccade() {
        let maxCycles = 0;
        let activePID = 0;

        for (const [pid, proc] of this.processListComponent.processes) {
            if (proc.state === PROC_STATE.RUNNING && proc.cycles > maxCycles) {
                maxCycles = proc.cycles;
                activePID = pid;
            }
        }

        if (activePID !== this.activePID && activePID > 0) {
            this._focusProcess(activePID);
        }
    }

    _startUptimeCounter() {
        setInterval(() => {
            const elapsed = Math.floor((Date.now() - this._startTime) / 1000);
            const hours = Math.floor(elapsed / 3600).toString().padStart(2, '0');
            const minutes = Math.floor((elapsed % 3600) / 60).toString().padStart(2, '0');
            const seconds = (elapsed % 60).toString().padStart(2, '0');

            this.store.setState(s => ({
                ...s,
                uptime: `${hours}:${minutes}:${seconds}`
            }));
        }, 1000);
    }

    /**
     * Schedule a throttled store update for dashboard stats
     */
    _scheduleStoreUpdate() {
        const now = Date.now();
        if (now - this._lastUpdateTime < this._updateThrottle) {
            if (!this._updatePending) {
                this._updatePending = true;
                setTimeout(() => {
                    this._performStoreUpdate();
                    this._updatePending = false;
                }, this._updateThrottle);
            }
            return;
        }
        this._performStoreUpdate();
    }

    _performStoreUpdate() {
        this._lastUpdateTime = Date.now();

        const processCount = this.processListComponent.processes.size;
        const running = Array.from(this.processListComponent.processes.values())
            .filter(p => p.state === PROC_STATE.RUNNING).length;

        const usedRAM = processCount * 512 * 4;
        const totalRAM = 64 * 1024;

        // Build IPC channels array
        const ipcChannels = Array.from(this.ipcChannels.values()).map(ch => ({
            ...ch,
            fromName: this.processListComponent.processes.get(ch.from)?.name || `#${ch.from}`,
            toName: this.processListComponent.processes.get(ch.to)?.name || `#${ch.to}`
        }));

        this.store.setState(s => ({
            ...s,
            ramPercent: (usedRAM / totalRAM) * 100,
            ramText: `${(usedRAM / 1024).toFixed(1)} / ${totalRAM / 1024} KB`,
            processCount: `${processCount} (${running} running)`,
            ipcCount: this.ipcCount,
            ipcChannels
        }));
    }

    /**
     * Record IPC (optimized)
     */
    recordIPC(fromPid, toPid, msgType = 0) {
        this.ipcCount++;

        const key = `${fromPid}->${toPid}`;
        const channel = this.ipcChannels.get(key) || {
            from: fromPid,
            to: toPid,
            count: 0,
            lastMsg: 0
        };
        channel.count++;
        channel.lastMsg = msgType;
        this.ipcChannels.set(key, channel);

        this._scheduleStoreUpdate();
    }

    _showBrainPicker() {
        console.log('[VisualShellOptimized] Opening Brain Picker...');
        // Implementation similar to original
    }
}
