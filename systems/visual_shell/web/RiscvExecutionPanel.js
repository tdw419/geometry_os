/**
 * Geometry OS: RISC-V Execution Panel
 *
 * Visual UI panel for interacting with the RISC-V GPU executor.
 * Allows users to load programs, execute them, and inspect results.
 *
 * Phase 17-04: User-facing interface for GPU execution verification.
 * Phase 18-05: SBI console output and privilege mode indicator.
 */

import { SbiBridge } from './SbiBridge.js';

export class RiscvExecutionPanel {
    /**
     * @param {HTMLElement} container - DOM container for the panel
     * @param {GPUDevice} device - WebGPU device instance
     * @param {GPUQueue} queue - WebGPU queue instance
     */
    constructor(container, device, queue) {
        this.container = container;
        this.device = device;
        this.queue = queue;

        // State
        this.program = null;           // Uint32Array of instructions
        this.stateBuffer = null;       // GPU state buffer
        this.codeBuffer = null;        // GPU code buffer
        this.memoryBuffer = null;      // GPU memory buffer
        this.computePipeline = null;   // GPU compute pipeline
        this.bindGroup = null;         // GPU bind group
        this.verifier = null;          // CoreExecutionVerifier instance
        this.currentState = null;      // Last read state
        this.sbiBridge = null;         // SBI bridge for GPU-JS communication

        // CSR indices (matching shader)
        this.CSR_MODE = 37;            // Privilege mode (0=U, 1=S, 3=M)
        this.CSR_SATP = 34;            // satp CSR (MMU control)

        // ABI names for registers
        this.registerNames = [
            'zero', 'ra', 'sp', 'gp', 'tp',
            't0', 't1', 't2', 's0', 's1',
            'a0', 'a1', 'a2', 'a3', 'a4',
            'a5', 'a6', 'a7', 's2', 's3',
            's4', 's5', 's6', 's7', 's8',
            's9', 's10', 's11', 't3', 't4',
            't5', 't6'
        ];

        // Example program: ADD x1 = x2 + x3 (10 + 32 = 42)
        this.exampleProgram = [
            0x00a00093,  // addi x1, x0, 10    (x1 = 10)
            0x02000113,  // addi x2, x0, 32    (x2 = 32)
            0x001081b3,  // add  x3, x1, x2    (x3 = x1 + x2 = 42)
            0x0000006f   // jal  x0, 0         (halt - infinite loop)
        ];

        this.init();
    }

    /**
     * Initialize the panel
     */
    async init() {
        // Import CoreExecutionVerifier
        const { CoreExecutionVerifier } = await import('./CoreExecutionVerifier.js');
        this.verifier = new CoreExecutionVerifier(this.device);

        this.render();
        this.setupEventListeners();
        this.log('Panel initialized');
        this.log('Click "Load Example" to load a test program');
    }

    /**
     * Render the panel DOM structure
     */
    render() {
        this.container.innerHTML = `
            <div class="riscv-panel">
                <div class="panel-section">
                    <h2>Program Input</h2>
                    <textarea id="riscv-program-input" rows="8" placeholder="Enter RISC-V instructions in hex (one per line)&#10;Example:&#10;00a00093  # addi x1, x0, 10&#10;02000113  # addi x2, x0, 32&#10;001081b3  # add x3, x1, x2"></textarea>
                    <div class="button-row">
                        <button id="riscv-load-btn" class="btn">Load Program</button>
                        <button id="riscv-example-btn" class="btn btn-primary">Load Example</button>
                        <button id="riscv-clear-btn" class="btn">Clear</button>
                    </div>
                </div>

                <div class="panel-section">
                    <h2>Execution</h2>
                    <div class="button-row">
                        <button id="riscv-execute-btn" class="btn btn-success" disabled>Execute</button>
                        <button id="riscv-reset-btn" class="btn btn-danger">Reset</button>
                    </div>
                    <div class="status-display">
                        <div class="status-item">
                            <span class="label">PC:</span>
                            <span id="riscv-pc-value" class="value">0x00000000</span>
                        </div>
                        <div class="status-item">
                            <span class="label">Status:</span>
                            <span id="riscv-status-value" class="value">Idle</span>
                        </div>
                        <div class="status-item privilege-indicator">
                            <span class="label">Mode:</span>
                            <span id="priv-mode" class="mode-badge mode-m">M</span>
                        </div>
                        <div class="status-item mmu-indicator">
                            <span class="label">MMU:</span>
                            <span id="mmu-status" class="mmu-badge mmu-off">OFF</span>
                        </div>
                    </div>
                </div>

                <div class="panel-section">
                    <h2>Registers (x0-x31)</h2>
                    <div id="riscv-register-grid" class="register-grid">
                        ${this.renderRegisterGrid()}
                    </div>
                </div>

                <div class="panel-section">
                    <h2>Memory Inspector</h2>
                    <div class="memory-controls">
                        <label>Address (hex):</label>
                        <input type="text" id="riscv-mem-addr" value="0x00000000" size="10">
                        <label>Length:</label>
                        <input type="number" id="riscv-mem-len" value="16" min="4" max="256">
                        <button id="riscv-mem-read-btn" class="btn">Read</button>
                    </div>
                    <div id="riscv-memory-display" class="memory-display">
                        <span class="placeholder">Memory will appear here after execution</span>
                    </div>
                </div>

                <div class="panel-section">
                    <h2>SBI Console</h2>
                    <div id="sbi-output" class="console-output">
                        <span class="placeholder">Console output from SBI calls will appear here</span>
                    </div>
                </div>

                <div class="panel-section">
                    <h2>Execution Log</h2>
                    <div id="riscv-log" class="log-display"></div>
                </div>
            </div>
        `;

        this.addStyles();
    }

    /**
     * Render register grid (32 registers)
     */
    renderRegisterGrid() {
        let html = '';
        for (let i = 0; i < 32; i++) {
            const name = this.registerNames[i];
            const displayName = i === 0 ? 'zero' : `x${i} (${name})`;
            html += `
                <div class="register-item" data-reg="${i}">
                    <span class="reg-name">${displayName}</span>
                    <span class="reg-value" id="reg-${i}">0x00000000</span>
                </div>
            `;
        }
        return html;
    }

    /**
     * Add panel-specific styles
     */
    addStyles() {
        if (document.getElementById('riscv-panel-styles')) return;

        const style = document.createElement('style');
        style.id = 'riscv-panel-styles';
        style.textContent = `
            .riscv-panel {
                display: flex;
                flex-direction: column;
                gap: 15px;
                font-family: 'Courier New', monospace;
            }

            .panel-section {
                background: #1a1a2e;
                border: 1px solid #333;
                border-radius: 8px;
                padding: 15px;
            }

            .panel-section h2 {
                color: #00FFFF;
                font-size: 12px;
                text-transform: uppercase;
                margin: 0 0 10px 0;
                padding-bottom: 8px;
                border-bottom: 1px solid #333;
            }

            .button-row {
                display: flex;
                gap: 8px;
                margin-top: 10px;
            }

            .btn {
                background: #2a2a3e;
                border: 1px solid #444;
                color: #fff;
                padding: 8px 16px;
                font-family: 'Courier New', monospace;
                font-size: 12px;
                cursor: pointer;
                border-radius: 4px;
                transition: all 0.2s;
            }

            .btn:hover:not(:disabled) {
                background: #3a3a4e;
                border-color: #00FFFF;
            }

            .btn:disabled {
                opacity: 0.5;
                cursor: not-allowed;
            }

            .btn-primary {
                background: #0066aa;
                border-color: #0088cc;
            }

            .btn-primary:hover:not(:disabled) {
                background: #0088cc;
            }

            .btn-success {
                background: #006600;
                border-color: #008800;
            }

            .btn-success:hover:not(:disabled) {
                background: #008800;
            }

            .btn-danger {
                background: #660000;
                border-color: #880000;
            }

            .btn-danger:hover:not(:disabled) {
                background: #880000;
            }

            #riscv-program-input {
                width: 100%;
                background: #0a0a1a;
                border: 1px solid #333;
                color: #00FF88;
                font-family: 'Courier New', monospace;
                font-size: 12px;
                padding: 10px;
                resize: vertical;
            }

            .status-display {
                display: flex;
                gap: 20px;
                margin-top: 10px;
            }

            .status-item {
                display: flex;
                gap: 8px;
            }

            .status-item .label {
                color: #888;
            }

            .status-item .value {
                color: #00FF88;
                font-weight: bold;
            }

            .register-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 4px;
                max-height: 300px;
                overflow-y: auto;
            }

            .register-item {
                display: flex;
                justify-content: space-between;
                background: #0a0a1a;
                padding: 4px 8px;
                border-radius: 3px;
                font-size: 11px;
            }

            .register-item[data-reg="0"] {
                opacity: 0.5;
            }

            .register-item.changed .reg-value {
                color: #FFFF00;
            }

            .reg-name {
                color: #888;
            }

            .reg-value {
                color: #00FF88;
            }

            .memory-controls {
                display: flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 10px;
                flex-wrap: wrap;
            }

            .memory-controls label {
                color: #888;
                font-size: 11px;
            }

            .memory-controls input {
                background: #0a0a1a;
                border: 1px solid #333;
                color: #00FF88;
                font-family: 'Courier New', monospace;
                padding: 4px 8px;
                border-radius: 3px;
            }

            .memory-display {
                background: #0a0a1a;
                border: 1px solid #333;
                padding: 10px;
                font-size: 11px;
                min-height: 60px;
                overflow-x: auto;
                white-space: pre;
            }

            .memory-display .placeholder {
                color: #666;
            }

            .log-display {
                background: #0a0a1a;
                border: 1px solid #333;
                padding: 10px;
                height: 120px;
                overflow-y: auto;
                font-size: 11px;
            }

            .log-entry {
                margin-bottom: 2px;
            }

            .log-entry.info { color: #88ccff; }
            .log-entry.success { color: #00ff00; }
            .log-entry.error { color: #ff6666; }
            .log-entry.warning { color: #ffaa00; }

            /* Privilege mode badge styles */
            .privilege-indicator {
                display: flex;
                align-items: center;
            }

            .mode-badge {
                display: inline-block;
                padding: 2px 8px;
                border-radius: 4px;
                font-weight: bold;
                font-size: 11px;
                min-width: 24px;
                text-align: center;
            }

            .mode-m {
                background: #ff6600;
                color: white;
            }

            .mode-s {
                background: #0066ff;
                color: white;
            }

            .mode-u {
                background: #666;
                color: white;
            }

            /* MMU status badge styles */
            .mmu-indicator {
                display: flex;
                align-items: center;
            }

            .mmu-badge {
                display: inline-block;
                padding: 2px 8px;
                border-radius: 4px;
                font-weight: bold;
                font-size: 11px;
                min-width: 80px;
                text-align: center;
            }

            .mmu-off {
                background: #666;
                color: white;
            }

            .mmu-sv32 {
                background: #00aa44;
                color: white;
            }

            /* SBI Console output styles */
            .console-output {
                background: #0a0a0a;
                border: 1px solid #333;
                padding: 8px;
                font-family: 'Courier New', monospace;
                font-size: 12px;
                height: 150px;
                overflow-y: auto;
                white-space: pre-wrap;
                color: #00FF88;
            }

            .console-output .placeholder {
                color: #666;
            }
        `;
        document.head.appendChild(style);
    }

    /**
     * Set up event listeners for buttons
     */
    setupEventListeners() {
        // Load program button
        document.getElementById('riscv-load-btn').addEventListener('click', () => {
            this.loadProgram();
        });

        // Load example button
        document.getElementById('riscv-example-btn').addEventListener('click', () => {
            this.loadExample();
        });

        // Clear button
        document.getElementById('riscv-clear-btn').addEventListener('click', () => {
            this.reset();
        });

        // Execute button
        document.getElementById('riscv-execute-btn').addEventListener('click', () => {
            this.execute();
        });

        // Reset button
        document.getElementById('riscv-reset-btn').addEventListener('click', () => {
            this.reset();
        });

        // Memory read button
        document.getElementById('riscv-mem-read-btn').addEventListener('click', () => {
            this.readMemory();
        });
    }

    /**
     * Parse hex instructions from textarea
     */
    loadProgram() {
        const textarea = document.getElementById('riscv-program-input');
        const text = textarea.value.trim();

        if (!text) {
            this.log('No program to load', 'error');
            return;
        }

        const instructions = [];
        const lines = text.split('\n');

        for (const line of lines) {
            // Remove comments
            const code = line.split('#')[0].trim();
            if (!code) continue;

            // Parse hex
            const match = code.match(/^0x([0-9a-fA-F]+)$|^([0-9a-fA-F]+)$/);
            if (match) {
                const hex = match[1] || match[2];
                const value = parseInt(hex, 16);
                if (!isNaN(value) && value >= 0 && value <= 0xFFFFFFFF) {
                    instructions.push(value);
                }
            }
        }

        if (instructions.length === 0) {
            this.log('No valid instructions found', 'error');
            return;
        }

        this.program = new Uint32Array(instructions);
        this.log(`Loaded ${instructions.length} instruction(s)`, 'success');
        document.getElementById('riscv-execute-btn').disabled = false;

        // Create buffers
        this.createBuffers();
    }

    /**
     * Load example program (ADD: 10 + 32 = 42)
     */
    loadExample() {
        const textarea = document.getElementById('riscv-program-input');
        const exampleText = this.exampleProgram.map((inst, i) => {
            const comments = [
                '  # addi x1, x0, 10    (x1 = 10)',
                '  # addi x2, x0, 32    (x2 = 32)',
                '  # add  x3, x1, x2    (x3 = 42)',
                '  # jal  x0, 0         (halt)'
            ];
            return '0x' + inst.toString(16).padStart(8, '0') + (comments[i] || '');
        }).join('\n');

        textarea.value = exampleText;
        this.log('Example program loaded (ADD: 10 + 32 = 42)', 'info');
        this.loadProgram();
    }

    /**
     * Create GPU buffers for execution
     */
    createBuffers() {
        // Clean up old buffers
        if (this.codeBuffer) this.codeBuffer.destroy();
        if (this.stateBuffer) this.stateBuffer.destroy();
        if (this.memoryBuffer) this.memoryBuffer.destroy();

        // Create buffers using verifier helper
        const buffers = this.verifier.createTestBuffers(this.program, 64 * 1024 * 1024);
        this.codeBuffer = buffers.codeBuffer;
        this.memoryBuffer = buffers.memoryBuffer;
        this.stateBuffer = buffers.stateBuffer;

        // Initialize SBI bridge with memory buffer
        this.sbiBridge = new SbiBridge(this.device, this.memoryBuffer);

        this.log('GPU buffers created', 'info');
    }

    /**
     * Execute the loaded program on GPU
     */
    async execute() {
        if (!this.program || !this.stateBuffer) {
            this.log('No program loaded', 'error');
            return;
        }

        this.log('Starting GPU execution...', 'info');
        document.getElementById('riscv-status-value').textContent = 'Running';

        try {
            // Load shader
            await this.loadShader();

            // Create bind group
            this.createBindGroup();

            // Dispatch compute shader
            this.dispatchExecute();

            // Wait for GPU to complete
            await this.device.queue.onSubmittedWorkDone();

            // Poll for SBI calls (console output, etc.)
            await this.pollSBICalls();

            // Read back state
            this.currentState = await this.verifier.readState(this.stateBuffer);

            // Update display
            this.updateRegisterDisplay();
            this.updateStatusDisplay();
            this.updatePrivilegeMode();
            this.updateMMUStatus();

            this.log('Execution complete', 'success');

            // Highlight changed registers
            this.highlightChangedRegisters();

        } catch (error) {
            this.log(`Execution error: ${error.message}`, 'error');
            console.error(error);
        }
    }

    /**
     * Load the RISC-V compute shader
     */
    async loadShader() {
        if (this.computePipeline) return;

        // Fetch shader source
        const response = await fetch('shaders/visual_cpu_riscv.wgsl');
        const shaderCode = await response.text();

        const shaderModule = this.device.createShaderModule({
            code: shaderCode,
            label: 'RISC-V Execution Shader'
        });

        this.computePipeline = this.device.createComputePipeline({
            layout: 'auto',
            compute: {
                module: shaderModule,
                entryPoint: 'main'
            }
        });

        this.log('Shader loaded', 'info');
    }

    /**
     * Create bind group for compute shader
     */
    createBindGroup() {
        this.bindGroup = this.device.createBindGroup({
            layout: this.computePipeline.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: { buffer: this.codeBuffer } },
                { binding: 1, resource: { buffer: this.memoryBuffer } },
                { binding: 2, resource: { buffer: this.stateBuffer } }
            ]
        });
    }

    /**
     * Dispatch the compute shader for execution
     */
    dispatchExecute() {
        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.computePipeline);
        passEncoder.setBindGroup(0, this.bindGroup);

        // Execute one workgroup (one core)
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();

        this.device.queue.submit([commandEncoder.finish()]);
        this.log('Compute dispatch submitted', 'info');
    }

    /**
     * Update register display with current values
     */
    updateRegisterDisplay() {
        if (!this.currentState) return;

        for (let i = 0; i < 32; i++) {
            const elem = document.getElementById(`reg-${i}`);
            if (elem) {
                const value = this.currentState.registers[i];
                elem.textContent = '0x' + value.toString(16).padStart(8, '0');
            }
        }
    }

    /**
     * Update status display (PC, halted, etc.)
     */
    updateStatusDisplay() {
        if (!this.currentState) return;

        // PC is instruction index, multiply by 4 for byte address
        const pcBytes = this.currentState.pc * 4;
        document.getElementById('riscv-pc-value').textContent =
            '0x' + pcBytes.toString(16).padStart(8, '0');

        const status = this.currentState.halted ? 'Halted' : 'Running';
        document.getElementById('riscv-status-value').textContent = status;
    }

    /**
     * Highlight registers that changed from zero
     */
    highlightChangedRegisters() {
        if (!this.currentState) return;

        for (let i = 0; i < 32; i++) {
            const item = document.querySelector(`.register-item[data-reg="${i}"]`);
            if (item && this.currentState.registers[i] !== 0) {
                item.classList.add('changed');
            }
        }
    }

    /**
     * Poll for SBI calls and handle console output
     */
    async pollSBICalls() {
        if (!this.sbiBridge) return;

        try {
            const hasPending = await this.sbiBridge.poll();
            if (hasPending) {
                const callInfo = await this.sbiBridge.handleCall();
                this.handleSBIOutput(callInfo);
            }
        } catch (error) {
            this.log(`SBI poll error: ${error.message}`, 'warning');
        }
    }

    /**
     * Handle SBI output and display in console
     * @param {Object} callInfo - SBI call information from handleCall
     */
    handleSBIOutput(callInfo) {
        const outputDiv = document.getElementById('sbi-output');

        // Clear placeholder on first output
        if (outputDiv.querySelector('.placeholder')) {
            outputDiv.innerHTML = '';
        }

        const { eid, fid, args, result } = callInfo;

        // Handle console output (EID 0x01)
        if (eid === 0x01) {  // SBI_EID_CONSOLE
            if (fid === 0x00) {  // putchar
                const ch = args[0] & 0xFF;
                const charStr = String.fromCharCode(ch);
                outputDiv.textContent += charStr;
                outputDiv.scrollTop = outputDiv.scrollHeight;
                this.log(`SBI putchar: '${charStr}' (0x${ch.toString(16).padStart(2, '0')})`, 'info');
            }
        } else if (eid === 0x08) {  // SBI_EID_SRST - System Reset
            const resetType = args[0];
            const resetReason = args[1];
            outputDiv.textContent += `\n[System Reset: type=${resetType}, reason=${resetReason}]`;
            this.log(`SBI system reset: type=${resetType}, reason=${resetReason}`, 'warning');
        } else if (eid === 0x10) {  // SBI_EID_BASE
            this.log(`SBI base call: fid=${fid}, result=${result.value}`, 'info');
        } else {
            this.log(`SBI call: eid=0x${eid.toString(16).padStart(2, '0')}, fid=${fid}`, 'info');
        }
    }

    /**
     * Update privilege mode indicator based on CSR_MODE
     */
    updatePrivilegeMode() {
        if (!this.currentState) return;

        // Get raw state array to access CSR_MODE at index 37
        // The currentState from verifier may have structured access
        const rawState = this.currentState.rawState || this.currentState;
        const mode = rawState[this.CSR_MODE] !== undefined
            ? rawState[this.CSR_MODE]
            : (this.currentState.mode !== undefined ? this.currentState.mode : 3);

        const modeSpan = document.getElementById('priv-mode');
        if (!modeSpan) return;

        if (mode === 3) {
            modeSpan.textContent = 'M';
            modeSpan.className = 'mode-badge mode-m';
            modeSpan.title = 'Machine Mode';
        } else if (mode === 1) {
            modeSpan.textContent = 'S';
            modeSpan.className = 'mode-badge mode-s';
            modeSpan.title = 'Supervisor Mode';
        } else {
            modeSpan.textContent = 'U';
            modeSpan.className = 'mode-badge mode-u';
            modeSpan.title = 'User Mode';
        }
    }

    /**
     * Update MMU status indicator based on satp CSR
     */
    updateMMUStatus() {
        if (!this.currentState) return;

        // Get raw state array to access satp at index 34
        const rawState = this.currentState.rawState || this.currentState;
        const satp = rawState[this.CSR_SATP] !== undefined
            ? rawState[this.CSR_SATP]
            : 0;

        const mmuSpan = document.getElementById('mmu-status');
        if (!mmuSpan) return;

        // satp mode bit is bit 31 (1 = Sv32, 0 = bare)
        const satpMode = (satp >>> 31) & 1;

        if (satpMode === 1) {
            // Sv32 mode enabled
            const ppn = satp & 0x3FFFFF;  // PPN is bits 0-21
            const pageTableAddr = ppn << 12;  // Convert PPN to physical address
            mmuSpan.textContent = `Sv32 (PT@0x${pageTableAddr.toString(16).toUpperCase().padStart(8, '0')})`;
            mmuSpan.className = 'mmu-badge mmu-sv32';
            mmuSpan.title = `MMU enabled in Sv32 mode\nPage table root: 0x${pageTableAddr.toString(16).toUpperCase().padStart(8, '0')}`;
        } else {
            // Bare mode (MMU off)
            mmuSpan.textContent = 'OFF';
            mmuSpan.className = 'mmu-badge mmu-off';
            mmuSpan.title = 'MMU disabled (bare mode)\nVirtual addresses = Physical addresses';
        }
    }

    /**
     * Read memory at specified address
     */
    async readMemory() {
        if (!this.memoryBuffer) {
            this.log('No memory buffer - execute a program first', 'warning');
            return;
        }

        const addrInput = document.getElementById('riscv-mem-addr').value;
        const lenInput = document.getElementById('riscv-mem-len').value;

        let addr = parseInt(addrInput, 16);
        let len = parseInt(lenInput, 10);

        if (isNaN(addr) || isNaN(len)) {
            this.log('Invalid address or length', 'error');
            return;
        }

        // Align to 4 bytes
        addr = addr & ~3;
        len = Math.max(4, Math.min(256, len));

        try {
            const data = await this.verifier.readMemory(this.memoryBuffer, addr, len);
            this.displayMemory(addr, data);
            this.log(`Read ${len} bytes from 0x${addr.toString(16).padStart(8, '0')}`, 'info');
        } catch (error) {
            this.log(`Memory read error: ${error.message}`, 'error');
        }
    }

    /**
     * Display memory contents
     */
    displayMemory(baseAddr, data) {
        const display = document.getElementById('riscv-memory-display');
        const view = new DataView(data.buffer, data.byteOffset, data.byteLength);

        let html = '';
        for (let i = 0; i < data.length; i += 16) {
            const addr = baseAddr + i;
            let line = addr.toString(16).padStart(8, '0') + ': ';

            // Hex dump
            for (let j = 0; j < 16 && i + j < data.length; j++) {
                line += data[i + j].toString(16).padStart(2, '0') + ' ';
            }

            // ASCII
            line += ' |';
            for (let j = 0; j < 16 && i + j < data.length; j++) {
                const ch = data[i + j];
                line += (ch >= 32 && ch < 127) ? String.fromCharCode(ch) : '.';
            }
            line += '|';

            html += line + '\n';
        }

        display.innerHTML = `<pre>${html}</pre>`;
    }

    /**
     * Reset program and state
     */
    reset() {
        // Clear program
        this.program = null;

        // Clear buffers
        if (this.codeBuffer) {
            this.codeBuffer.destroy();
            this.codeBuffer = null;
        }
        if (this.stateBuffer) {
            this.stateBuffer.destroy();
            this.stateBuffer = null;
        }
        if (this.memoryBuffer) {
            this.memoryBuffer.destroy();
            this.memoryBuffer = null;
        }

        // Clear SBI bridge
        if (this.sbiBridge) {
            this.sbiBridge.clearConsole();
            this.sbiBridge = null;
        }

        // Clear UI
        document.getElementById('riscv-program-input').value = '';
        document.getElementById('riscv-execute-btn').disabled = true;
        document.getElementById('riscv-pc-value').textContent = '0x00000000';
        document.getElementById('riscv-status-value').textContent = 'Idle';
        document.getElementById('riscv-memory-display').innerHTML =
            '<span class="placeholder">Memory will appear here after execution</span>';

        // Clear SBI console
        document.getElementById('sbi-output').innerHTML =
            '<span class="placeholder">Console output from SBI calls will appear here</span>';

        // Reset privilege mode to M
        const modeSpan = document.getElementById('priv-mode');
        if (modeSpan) {
            modeSpan.textContent = 'M';
            modeSpan.className = 'mode-badge mode-m';
        }

        // Reset MMU status to OFF
        const mmuSpan = document.getElementById('mmu-status');
        if (mmuSpan) {
            mmuSpan.textContent = 'OFF';
            mmuSpan.className = 'mmu-badge mmu-off';
        }

        // Reset register display
        for (let i = 0; i < 32; i++) {
            const elem = document.getElementById(`reg-${i}`);
            if (elem) {
                elem.textContent = '0x00000000';
            }
            const item = document.querySelector(`.register-item[data-reg="${i}"]`);
            if (item) {
                item.classList.remove('changed');
            }
        }

        this.currentState = null;
        this.log('Reset complete', 'info');
    }

    /**
     * Log a message to the execution log
     */
    log(message, type = 'info') {
        const logDisplay = document.getElementById('riscv-log');
        const entry = document.createElement('div');
        entry.className = `log-entry ${type}`;

        const time = new Date().toLocaleTimeString();
        entry.textContent = `[${time}] ${message}`;

        logDisplay.appendChild(entry);
        logDisplay.scrollTop = logDisplay.scrollHeight;
    }
}

// Export for global scope
if (typeof window !== 'undefined') {
    window.RiscvExecutionPanel = RiscvExecutionPanel;
}
