/**
 * Geometry OS - Glyph Terminal (Optimized)
 *
 * Optimizations:
 * - Batched output rendering with DocumentFragment
 * - Cached DOM references
 * - Throttled status updates
 * - Virtual scrolling for large output
 * - Memoized command completions
 */

import { GeometryKernel } from './GeometryKernel.js';
import { Component, h, batch } from './lib/hooks.js';

// Terminal colors (frozen for performance)
const COLORS = Object.freeze({
    prompt: '#00ff88',
    input: '#ffffff',
    output: '#888888',
    error: '#ff4444',
    highlight: '#00ffcc',
    pipe: '#ff00ff'
});

// Built-in commands (static lookup)
const COMMANDS = Object.freeze({
    help: 'Show available commands',
    ps: 'List running processes',
    spawn: 'Spawn a new process from .spv file',
    kill: 'Kill a process by PID',
    ipc: 'Show IPC message queues',
    cat: 'Display memory/process output',
    pipe: 'Connect two processes (a | b)',
    mem: 'Show memory usage',
    clear: 'Clear terminal',
    run: 'Execute a .spv program',
    compile: 'Compile and run code',
    agents: 'Show agent status',
    sectors: 'Show Hilbert sector map',
    tether: 'Create visual tether between entities',
    exit: 'Shutdown terminal'
});

// Command names for autocomplete (cached)
const COMMAND_NAMES = Object.keys(COMMANDS);

/**
 * Optimized output buffer with virtual scrolling support
 */
class OutputBuffer {
    constructor(maxLines = 1000) {
        this.lines = [];
        this.maxLines = maxLines;
        this.fragment = null;
    }

    add(text, className = 'output') {
        this.lines.push({ text, className, timestamp: Date.now() });

        // Trim if over limit
        if (this.lines.length > this.maxLines) {
            this.lines = this.lines.slice(-this.maxLines);
            return true; // Signal that trim occurred
        }
        return false;
    }

    render(container) {
        // Use DocumentFragment for batched insert
        const fragment = document.createDocumentFragment();

        for (const line of this.lines) {
            const el = document.createElement('div');
            el.className = `terminal-line ${line.className}`;
            el.textContent = line.text;
            fragment.appendChild(el);
        }

        container.innerHTML = '';
        container.appendChild(fragment);

        // Auto-scroll
        container.scrollTop = container.scrollHeight;
    }

    appendLast(container) {
        // Append only the last line (more efficient than full re-render)
        if (this.lines.length === 0) return;

        const line = this.lines[this.lines.length - 1];
        const el = document.createElement('div');
        el.className = `terminal-line ${line.className}`;
        el.textContent = line.text;

        container.appendChild(el);

        // Check if we need to trim old lines from DOM
        while (container.children.length > this.maxLines) {
            container.removeChild(container.firstChild);
        }

        container.scrollTop = container.scrollHeight;
    }

    clear() {
        this.lines = [];
    }

    getText() {
        return this.lines.map(l => l.text).join('\n');
    }
}

/**
 * Optimized GlyphTerminal with minimal DOM operations
 */
export class GlyphTerminalOptimized {
    constructor(container, options = {}) {
        this.container = container;
        this.kernel = options.kernel || new GeometryKernel();

        // Terminal state
        this.history = [];
        this.historyIndex = 0;
        this.inputBuffer = '';
        this.cursorPosition = 0;

        // Process registry
        this.processes = new Map();
        this.pipes = [];

        // Optimized output buffer
        this.outputBuffer = new OutputBuffer(1000);

        // UI element cache
        this.elements = {
            output: null,
            input: null,
            cursor: null,
            mode: null,
            procs: null
        };

        // Cached welcome message
        this._welcomeText = `
╔══════════════════════════════════════════════════════════════╗
║                    GEOMETRY OS TERMINAL                       ║
║                    Glyph Interface v1.0                       ║
╚══════════════════════════════════════════════════════════════╝

Type 'help' for available commands.
Type 'process_a | process_b' to visually pipe between processes.

`;

        // Callbacks
        this.onPipe = options.onPipe || (() => {});
        this.onCommand = options.onCommand || (() => {});

        // Throttle state
        this._statusUpdatePending = false;
    }

    async init() {
        this._createUI();

        if (!this.kernel.device) {
            await this.kernel.init();
        }

        // Print welcome using buffer
        this._print(this._welcomeText, 'highlight');
        this._renderOutput();

        this._wireEvents();

        console.log('[GlyphTerminalOptimized] Terminal ready');
        return this;
    }

    _createUI() {
        // Create terminal element once
        this.element = document.createElement('div');
        this.element.className = 'glyph-terminal';

        // Use a single innerHTML set for initial structure
        this.element.innerHTML = `
            <div class="terminal-header">
                <span class="terminal-title">Glyph Terminal</span>
                <span class="terminal-controls">
                    <button class="term-btn" data-action="clear">Clear</button>
                    <button class="term-btn" data-action="export">Export</button>
                </span>
            </div>
            <div class="terminal-output" id="terminal-output"></div>
            <div class="terminal-input-line">
                <span class="terminal-prompt">$</span>
                <input type="text" class="terminal-input" id="terminal-input"
                       autofocus autocomplete="off" spellcheck="false">
            </div>
            <div class="terminal-status">
                <span id="term-cursor">1:1</span>
                <span id="term-mode">INSERT</span>
                <span id="term-processes">0 processes</span>
            </div>
        `;

        // Apply styles (single set)
        this.element.style.cssText = `
            position: absolute;
            bottom: 60px;
            left: 50%;
            transform: translateX(-50%);
            width: 600px;
            height: 300px;
            background: rgba(0, 10, 10, 0.95);
            border: 1px solid ${COLORS.highlight};
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            display: flex;
            flex-direction: column;
            z-index: 200;
            box-shadow: 0 0 20px rgba(0, 255, 204, 0.3);
        `;

        // Add embedded styles (once)
        const style = document.createElement('style');
        style.textContent = `
            .glyph-terminal * { box-sizing: border-box; }
            .glyph-terminal .terminal-header {
                display: flex;
                justify-content: space-between;
                padding: 8px 12px;
                border-bottom: 1px solid ${COLORS.highlight}44;
                background: rgba(0, 50, 50, 0.3);
            }
            .glyph-terminal .terminal-title { color: ${COLORS.highlight}; font-weight: bold; }
            .glyph-terminal .terminal-controls { display: flex; gap: 8px; }
            .glyph-terminal .term-btn {
                background: transparent;
                border: 1px solid ${COLORS.highlight}66;
                color: ${COLORS.highlight};
                padding: 2px 8px;
                cursor: pointer;
                font-size: 10px;
                border-radius: 3px;
            }
            .glyph-terminal .term-btn:hover { background: ${COLORS.highlight}33; }
            .glyph-terminal .terminal-output {
                flex: 1;
                padding: 10px;
                overflow-y: auto;
                background: rgba(0, 0, 0, 0.3);
            }
            .glyph-terminal .terminal-line { margin: 2px 0; white-space: pre-wrap; }
            .glyph-terminal .terminal-line.prompt { color: ${COLORS.prompt}; }
            .glyph-terminal .terminal-line.input { color: ${COLORS.input}; }
            .glyph-terminal .terminal-line.output { color: ${COLORS.output}; }
            .glyph-terminal .terminal-line.error { color: ${COLORS.error}; }
            .glyph-terminal .terminal-line.highlight { color: ${COLORS.highlight}; }
            .glyph-terminal .terminal-line.pipe { color: ${COLORS.pipe}; font-weight: bold; }
            .glyph-terminal .terminal-input-line {
                display: flex;
                align-items: center;
                padding: 8px 12px;
                border-top: 1px solid ${COLORS.highlight}44;
                background: rgba(0, 30, 30, 0.3);
            }
            .glyph-terminal .terminal-prompt { color: ${COLORS.prompt}; margin-right: 8px; }
            .glyph-terminal .terminal-input {
                flex: 1;
                background: transparent;
                border: none;
                color: ${COLORS.input};
                font-family: inherit;
                font-size: inherit;
                outline: none;
            }
            .glyph-terminal .terminal-status {
                display: flex;
                justify-content: space-between;
                padding: 4px 12px;
                font-size: 10px;
                color: #666;
                border-top: 1px solid ${COLORS.highlight}22;
            }
        `;
        document.head.appendChild(style);

        this.container.appendChild(this.element);

        // Cache element references (no more querySelector calls)
        this.elements.output = document.getElementById('terminal-output');
        this.elements.input = document.getElementById('terminal-input');
        this.elements.cursor = document.getElementById('term-cursor');
        this.elements.mode = document.getElementById('term-mode');
        this.elements.procs = document.getElementById('term-processes');
    }

    _wireEvents() {
        const input = this.elements.input;
        const header = this.element.querySelector('.terminal-header');

        // Input handling
        input.addEventListener('keydown', (e) => this._onKeyDown(e));
        input.addEventListener('input', () => this._updateCursor());

        // Delegated event handling for buttons
        header.addEventListener('click', (e) => {
            const action = e.target.dataset.action;
            if (action === 'clear') this.clear();
            else if (action === 'export') this._exportLog();
        });

        // Focus on click
        this.element.addEventListener('click', () => input.focus());
    }

    _onKeyDown(e) {
        switch (e.key) {
            case 'Enter':
                this._executeCommand();
                break;
            case 'ArrowUp':
                e.preventDefault();
                this._historyPrev();
                break;
            case 'ArrowDown':
                e.preventDefault();
                this._historyNext();
                break;
            case 'Tab':
                e.preventDefault();
                this._autocomplete();
                break;
            case 'Escape':
                this.elements.input.value = '';
                break;
        }
    }

    _executeCommand() {
        const input = this.elements.input.value.trim();
        this.elements.input.value = '';

        if (!input) return;

        // Add to history
        this.history.push(input);
        this.historyIndex = this.history.length;

        // Echo input
        this._print(`$ ${input}`, 'prompt');
        this._renderLastLine();

        // Parse and execute
        this._parseCommand(input);
    }

    _parseCommand(input) {
        const parts = input.split(/\s+/);
        const cmd = parts[0].toLowerCase();

        // Check for pipe operator
        if (input.includes('|')) {
            this._handlePipe(input);
            return;
        }

        // Command dispatch (using lookup table for performance)
        const handlers = {
            help: () => this._cmdHelp(),
            ps: () => this._cmdPs(),
            spawn: () => this._cmdSpawn(parts.slice(1)),
            kill: () => this._cmdKill(parts[1]),
            ipc: () => this._cmdIpc(),
            cat: () => this._cmdCat(parts[1]),
            mem: () => this._cmdMem(),
            clear: () => this.clear(),
            run: () => this._cmdRun(parts[1]),
            compile: () => this._cmdCompile(parts.slice(1).join(' ')),
            agents: () => this._cmdAgents(),
            sectors: () => this._cmdSectors(),
            tether: () => this._cmdTether(parts[1], parts[2]),
            exit: () => this._cmdExit()
        };

        const handler = handlers[cmd];
        if (handler) {
            handler();
        } else {
            this._print(`Unknown command: ${cmd}. Type 'help' for available commands.`, 'error');
            this._renderLastLine();
        }

        this.onCommand(cmd, parts.slice(1));
    }

    _handlePipe(input) {
        const [left, right] = input.split('|').map(s => s.trim());

        this._print(`Creating pipe: ${left} → ${right}`, 'pipe');
        this._renderLastLine();

        const sourcePid = this._resolveProcess(left);
        const destPid = this._resolveProcess(right);

        if (sourcePid !== null && destPid !== null) {
            this.pipes.push({
                from: sourcePid,
                to: destPid,
                created: Date.now()
            });

            this.onPipe({ from: sourcePid, to: destPid, visual: true });

            this._print(`Pipe established: process ${sourcePid} → process ${destPid}`, 'highlight');
        } else {
            this._print('Could not resolve process names', 'error');
        }
        this._renderLastLine();
    }

    _resolveProcess(name) {
        const pid = parseInt(name);
        if (!isNaN(pid)) return pid;

        for (const [pid, proc] of this.processes) {
            if (proc.name?.includes(name)) return pid;
        }
        return null;
    }

    // Command handlers (optimized)
    _cmdHelp() {
        this._print('\nAvailable commands:', 'highlight');
        for (const [cmd, desc] of Object.entries(COMMANDS)) {
            this._print(`  ${cmd.padEnd(12)} - ${desc}`);
        }
        this._print('\nPiping:', 'highlight');
        this._print('  process_a | process_b  - Connect processes visually');
        this._print('');
        this._renderOutput();
    }

    _cmdPs() {
        this._print('\nPID   STATUS    NAME                 CYCLES', 'highlight');
        this._print('─'.repeat(45));

        for (const [pid, proc] of this.processes) {
            const status = STATE_NAMES[proc.state || 0];
            this._print(`${String(pid).padEnd(6)}${status.padEnd(10)}${(proc.name || 'unnamed').padEnd(21)}${proc.cycles || 0}`);
        }

        if (this.processes.size === 0) {
            this._print('No running processes');
        }
        this._print('');
        this._renderOutput();
    }

    async _cmdSpawn(args) {
        if (args.length === 0) {
            this._print('Usage: spawn <file.spv>', 'error');
            this._renderLastLine();
            return;
        }

        const file = args[0];
        this._print(`Spawning process from ${file}...`);
        this._renderLastLine();

        try {
            const response = await fetch(file);
            if (!response.ok) throw new Error(`File not found: ${file}`);

            const buffer = await response.arrayBuffer();
            const pid = await this.kernel.spawnProcess(buffer, file);

            this.processes.set(pid, { name: file, state: 1, cycles: 0 });

            this._print(`Process spawned with PID ${pid}`, 'highlight');
            this._scheduleStatusUpdate();
        } catch (e) {
            this._print(`Error: ${e.message}`, 'error');
        }
        this._renderLastLine();
    }

    _cmdKill(pidStr) {
        const pid = parseInt(pidStr);
        if (isNaN(pid)) {
            this._print('Usage: kill <pid>', 'error');
            this._renderLastLine();
            return;
        }

        if (this.processes.has(pid)) {
            this.processes.get(pid).state = 3;
            this._print(`Process ${pid} killed`, 'highlight');
            this._scheduleStatusUpdate();
        } else {
            this._print(`Process ${pid} not found`, 'error');
        }
        this._renderLastLine();
    }

    _cmdIpc() {
        this._print('\nIPC Message Queues:', 'highlight');
        this._print('─'.repeat(30));
        for (let i = 0; i < 16; i++) {
            this._print(`Mailbox[${i}]: Offset ${i * 32}`);
        }
        this._print('');
        this._renderOutput();
    }

    _cmdCat(target) {
        if (!target) {
            this._print('Usage: cat <pid|memory>', 'error');
            this._renderLastLine();
            return;
        }
        this._print(`Output from ${target}:`, 'highlight');
        this._print('(Process output would appear here)');
        this._renderLastLine();
    }

    _cmdMem() {
        const used = this.processes.size * 512 * 4;
        const total = 256 * 1024;

        this._print('\nMemory Usage:', 'highlight');
        this._print(`  Processes: ${this.processes.size}`);
        this._print(`  Used: ${(used / 1024).toFixed(1)} KB`);
        this._print(`  Total: ${(total / 1024).toFixed(0)} KB`);
        this._print(`  Free: ${((total - used) / 1024).toFixed(1)} KB`);
        this._print('');
        this._renderOutput();
    }

    _cmdRun(file) {
        if (!file) {
            this._print('Usage: run <file.spv>', 'error');
            this._renderLastLine();
            return;
        }
        this._print(`Running ${file}...`);
        this._renderLastLine();
    }

    _cmdCompile(code) {
        if (!code) {
            this._print('Usage: compile <code>', 'error');
            this._renderLastLine();
            return;
        }
        this._print(`Compiling: ${code}`, 'highlight');
        this._print('(VisualCompiler would process this)');
        this._renderLastLine();
    }

    _cmdAgents() {
        this._print('\nAgent Status:', 'highlight');
        this._print('  ◇ Loop Orchestrator: Active');
        this._print('  △ Bridge Planner: Idle');
        this._print('  □ Bridge Worker: Active');
        this._print('  ○ Memory Agent: Reading');
        this._print('');
        this._renderOutput();
    }

    _cmdSectors() {
        this._print('\nHilbert Sector Map:', 'highlight');
        this._print('  KERNEL  │ 0-1023      │ PCBs, Scheduler');
        this._print('  MAILBOX │ 1024-1535   │ IPC Queues');
        this._print('  SHELL   │ 2048-6143   │ Process RAM');
        this._print('  FILES   │ 8192-24575  │ Filesystem');
        this._print('  MEMORY  │ 32768-65535 │ Substrate');
        this._print('  AGENTS  │ 65536-81919 │ Avatar Space');
        this._print('');
        this._renderOutput();
    }

    _cmdTether(from, to) {
        if (!from || !to) {
            this._print('Usage: tether <from> <to>', 'error');
            this._renderLastLine();
            return;
        }
        this._print(`Creating tether: ${from} ↔ ${to}`, 'pipe');
        this._renderLastLine();
    }

    _cmdExit() {
        this._print('Shutting down terminal...', 'highlight');
        this._renderLastLine();
        this.element.style.display = 'none';
    }

    _historyPrev() {
        if (this.historyIndex > 0) {
            this.historyIndex--;
            this.elements.input.value = this.history[this.historyIndex];
        }
    }

    _historyNext() {
        if (this.historyIndex < this.history.length - 1) {
            this.historyIndex++;
            this.elements.input.value = this.history[this.historyIndex];
        } else {
            this.historyIndex = this.history.length;
            this.elements.input.value = '';
        }
    }

    _autocomplete() {
        const input = this.elements.input.value;
        const parts = input.split(/\s+/);
        const last = parts[parts.length - 1].toLowerCase();

        // Binary search would be faster for large command lists
        for (const cmd of COMMAND_NAMES) {
            if (cmd.startsWith(last)) {
                parts[parts.length - 1] = cmd;
                this.elements.input.value = parts.join(' ');
                break;
            }
        }
    }

    _updateCursor() {
        const pos = this.elements.input.selectionStart + 1;
        this.elements.cursor.textContent = `1:${pos}`;
    }

    _scheduleStatusUpdate() {
        if (!this._statusUpdatePending) {
            this._statusUpdatePending = true;
            requestAnimationFrame(() => {
                this._updateStatus();
                this._statusUpdatePending = false;
            });
        }
    }

    _updateStatus() {
        this.elements.procs.textContent = `${this.processes.size} processes`;
    }

    _print(text, className = 'output') {
        this.outputBuffer.add(text, className);
    }

    _renderOutput() {
        this.outputBuffer.render(this.elements.output);
    }

    _renderLastLine() {
        this.outputBuffer.appendLast(this.elements.output);
    }

    _exportLog() {
        const log = this.outputBuffer.getText();
        const blob = new Blob([log], { type: 'text/plain' });
        const url = URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = `terminal-${Date.now()}.log`;
        a.click();

        URL.revokeObjectURL(url);
        this._print('Log exported', 'highlight');
        this._renderLastLine();
    }

    clear() {
        this.outputBuffer.clear();
        this.elements.output.innerHTML = '';
        this._print(this._welcomeText, 'highlight');
        this._renderOutput();
    }

    show() {
        this.element.style.display = 'flex';
        this.elements.input.focus();
    }

    hide() {
        this.element.style.display = 'none';
    }

    toggle() {
        if (this.element.style.display === 'none') {
            this.show();
        } else {
            this.hide();
        }
    }
}

// State name lookup (for performance)
const STATE_NAMES = ['IDLE', 'RUNNING', 'WAITING', 'DONE', 'ERROR'];
