/**
 * Geometry OS: Terminal Input Client
 * Phase 50.1: Keyboard Input Capture for On-Map Terminal
 *
 * Captures keyboard events in the browser and sends them to the Python
 * backend via WebSocket for real-time terminal input.
 *
 * Usage:
 *   const client = new TerminalInputClient();
 *   await client.connect();
 *   // Keyboard events are automatically captured and sent to terminal
 *
 * Protocol (WebSocket JSON messages):
 *   { type: 'key', key: 'a' }           - Keystroke
 *   { type: 'focus_change', toId: 1 }   - Terminal focus switch
 *   { type: 'new_terminal' }            - Create new terminal
 *   { type: 'close_terminal', id: 1 }   - Close terminal
 */

export class TerminalInputClient {
    /**
     * @param {Object} options - Configuration options
     * @param {number} options.port - WebSocket port (default: 8767)
     * @param {HTMLElement} options.targetElement - Element to capture keyboard events from
     * @param {Function} options.onOutput - Callback for terminal output updates
     * @param {Function} options.onStatusChange - Callback for connection status changes
     */
    constructor(options = {}) {
        this.port = options.port || 8767;
        this.targetElement = options.targetElement || document.body;
        this.onOutput = options.onOutput || (() => {});
        this.onStatusChange = options.onStatusChange || (() => {});

        this.ws = null;
        this.connected = false;
        this.focusedTerminalId = 1;
        this.enabled = true;

        // Bind event handlers
        this._onKeyDown = this._onKeyDown.bind(this);
        this._onFocus = this._onFocus.bind(this);
        this._onBlur = this._onBlur.bind(this);
    }

    /**
     * Connect to the terminal input WebSocket server
     */
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(`ws://localhost:${this.port}`);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.onStatusChange('connected');
                    console.log(`[TerminalInput] Connected to ws://localhost:${this.port}`);
                    this._bindKeyboardEvents();
                    resolve();
                };

                this.ws.onclose = () => {
                    this.connected = false;
                    this.onStatusChange('disconnected');
                    console.log('[TerminalInput] Disconnected');
                };

                this.ws.onerror = (error) => {
                    this.connected = false;
                    this.onStatusChange('error');
                    console.error('[TerminalInput] WebSocket error:', error);
                    reject(error);
                };

                this.ws.onmessage = (event) => {
                    try {
                        const data = JSON.parse(event.data);
                        this._handleMessage(data);
                    } catch (e) {
                        console.warn('[TerminalInput] Failed to parse message:', e);
                    }
                };

                // Timeout for connection
                setTimeout(() => {
                    if (!this.connected) {
                        reject(new Error('Connection timeout'));
                    }
                }, 5000);
            } catch (e) {
                reject(e);
            }
        });
    }

    /**
     * Disconnect from the WebSocket server
     */
    disconnect() {
        this._unbindKeyboardEvents();
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }

    /**
     * Bind keyboard event listeners
     */
    _bindKeyboardEvents() {
        this.targetElement.addEventListener('keydown', this._onKeyDown);
        this.targetElement.addEventListener('focus', this._onFocus);
        this.targetElement.addEventListener('blur', this._onBlur);
        this.targetElement.tabIndex = 0; // Make focusable
        console.log('[TerminalInput] Keyboard events bound');
    }

    /**
     * Unbind keyboard event listeners
     */
    _unbindKeyboardEvents() {
        this.targetElement.removeEventListener('keydown', this._onKeyDown);
        this.targetElement.removeEventListener('focus', this._onFocus);
        this.targetElement.removeEventListener('blur', this._onBlur);
    }

    /**
     * Handle keydown events
     */
    _onKeyDown(event) {
        if (!this.enabled || !this.connected) return;

        // Don't capture if typing in an input field
        if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
            return;
        }

        // Send keystroke to backend
        this.sendKey(event.key, {
            code: event.code,
            shiftKey: event.shiftKey,
            ctrlKey: event.ctrlKey,
            altKey: event.altKey,
            metaKey: event.metaKey
        });

        // Prevent default for terminal keys
        const terminalKeys = ['Enter', 'Backspace', 'Escape', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'Tab'];
        if (terminalKeys.includes(event.key) || event.ctrlKey) {
            event.preventDefault();
        }
    }

    /**
     * Handle focus events
     */
    _onFocus() {
        this.send({ type: 'focus', focused: true });
    }

    /**
     * Handle blur events
     */
    _onBlur() {
        this.send({ type: 'focus', focused: false });
    }

    /**
     * Send a keystroke to the backend
     * @param {string} key - The key that was pressed
     * @param {Object} modifiers - Key modifiers (shift, ctrl, alt, meta)
     */
    sendKey(key, modifiers = {}) {
        this.send({
            type: 'key',
            key: key,
            terminalId: this.focusedTerminalId,
            ...modifiers
        });
    }

    /**
     * Request focus change to a different terminal
     * @param {number} terminalId - Terminal to focus
     */
    focusTerminal(terminalId) {
        const fromId = this.focusedTerminalId;
        this.focusedTerminalId = terminalId;
        this.send({
            type: 'focus_change',
            fromId: fromId,
            toId: terminalId
        });
    }

    /**
     * Create a new terminal
     * @param {Object} options - Terminal options (x, y, width, height)
     */
    createTerminal(options = {}) {
        this.send({
            type: 'new_terminal',
            ...options
        });
    }

    /**
     * Close a terminal
     * @param {number} terminalId - Terminal to close
     */
    closeTerminal(terminalId) {
        this.send({
            type: 'close_terminal',
            id: terminalId
        });
    }

    /**
     * Send a command directly (non-interactive)
     * @param {string} command - Command to execute
     */
    sendCommand(command) {
        this.send({
            type: 'command',
            command: command,
            terminalId: this.focusedTerminalId
        });
    }

    /**
     * Send raw message to WebSocket
     * @param {Object} data - Data to send
     */
    send(data) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(data));
        } else {
            console.warn('[TerminalInput] Cannot send - not connected');
        }
    }

    /**
     * Handle incoming message from backend
     * @param {Object} data - Message data
     */
    _handleMessage(data) {
        switch (data.type) {
            case 'output':
                // Terminal output update
                this.onOutput(data.content, data.terminalId);
                break;

            case 'terminal_created':
                console.log(`[TerminalInput] Terminal #${data.id} created`);
                this.focusedTerminalId = data.id;
                break;

            case 'terminal_closed':
                console.log(`[TerminalInput] Terminal #${data.id} closed`);
                break;

            case 'error':
                console.error('[TerminalInput] Backend error:', data.message);
                break;

            default:
                console.log('[TerminalInput] Unknown message:', data);
        }
    }

    /**
     * Enable keyboard capture
     */
    enable() {
        this.enabled = true;
    }

    /**
     * Disable keyboard capture
     */
    disable() {
        this.enabled = false;
    }
}

// Also export as global for non-module usage
if (typeof window !== 'undefined') {
    window.TerminalInputClient = TerminalInputClient;
}
