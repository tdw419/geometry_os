/**
 * Geometry OS: TerminalManager
 *
 * Manages multiple TerminalWindow instances on the infinite map.
 * - Create/destroy terminals
 * - Focus management
 * - Z-index ordering
 * - Keyboard shortcuts
 * - Server persistence
 */

import { TerminalWindow } from './TerminalWindow.js';

export class TerminalManager {
    constructor(app, viewport, options = {}) {
        this.app = app;
        this.viewport = viewport;
        this.container = viewport.worldContainer || app.stage;

        // Window tracking
        this.windows = new Map();
        this.focusedWindowId = null;
        this.nextId = 1;

        // Server sync
        this.serverUrl = options.serverUrl || 'ws://localhost:8765';
        this.ws = null;
        this.connected = false;

        // Debounced save
        this._saveTimeout = null;

        // Keyboard shortcuts
        this.shortcutsEnabled = true;
        this._initKeyboardShortcuts();

        // Auto-connect to server
        if (options.autoConnect !== false) {
            this.connect();
        }
    }

    connect() {
        if (this.ws) return;

        try {
            this.ws = new WebSocket(this.serverUrl);

            this.ws.onopen = () => {
                this.connected = true;
                console.log('[TerminalManager] Connected to server');
                this.loadPositions();
            };

            this.ws.onclose = () => {
                this.connected = false;
                console.log('[TerminalManager] Disconnected from server');
                this._loadFromLocalStorage();
            };

            this.ws.onerror = (err) => {
                console.warn('[TerminalManager] WebSocket error, using localStorage fallback');
                this._loadFromLocalStorage();
            };

            this.ws.onmessage = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    this._handleServerMessage(data);
                } catch (e) {
                    console.error('[TerminalManager] Failed to parse server message:', e);
                }
            };
        } catch (e) {
            console.warn('[TerminalManager] WebSocket unavailable, using localStorage');
            this._loadFromLocalStorage();
        }
    }

    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }

    createTerminal(options = {}) {
        const id = `term-${this.nextId++}`;

        // Create GeometricTerminal - NOTE: We need to import it
        // For now, create a mock terminal container if GeometricTerminal isn't available
        let terminal;
        if (typeof GeometricTerminal !== 'undefined') {
            terminal = new GeometricTerminal(this.app, {
                cols: options.cols || 80,
                rows: options.rows || 24,
                cellSize: options.cellSize || 16,
                ...options
            });
        } else {
            // Mock terminal for testing
            terminal = {
                container: new PIXI.Container(),
                width: (options.cols || 80) * (options.cellSize || 16),
                height: (options.rows || 24) * (options.cellSize || 16)
            };
            // Add mock content
            const bg = new PIXI.Graphics();
            bg.beginFill(0x0a0a0a);
            bg.drawRect(0, 1, terminal.width - 2, terminal.height - 2);
            bg.endFill();
            terminal.container.addChild(bg);

            // Add mock text
            const text = new PIXI.Text('$ ' + this.id, {
                fontFamily: 'Courier New',
                fontSize: 14,
                fill: 0x00ff88
            });
            text.x = 5;
            text.y = 5;
            terminal.container.addChild(text);
        }

        // Create TerminalWindow wrapper
        const window = new TerminalWindow(terminal, {
            id,
            x: options.x ?? 100 + (this.windows.size * 30),
            y: options.y ?? 100 + (this.windows.size * 30),
            width: options.width,
            height: options.height
        });

        // Setup callbacks
        window.onFocusRequest = (w) => this.focusTerminal(w.id);
        window.onPositionChange = (w) => this._onWindowPositionChange(w);

        // Add to container
        this.container.addChild(window.container);

        // Track
        this.windows.set(id, window);

        // Focus new window
        this.focusTerminal(id);

        console.log(`[TerminalManager] Created terminal: ${id}`);
        return { id, terminal, window };
    }

    focusTerminal(id) {
        // Blur previous
        if (this.focusedWindowId) {
            const prev = this.windows.get(this.focusedWindowId);
            if (prev) prev.blur();
        }

        // Focus new
        const window = this.windows.get(id);
        if (!window) return;

        this.focusedWindowId = id;
        window.focus();

        // Bring to front
        this._bringToFront(id);
    }

    blurTerminal(id) {
        const window = this.windows.get(id);
        if (window) {
            window.blur();
            if (this.focusedWindowId === id) {
                this.focusedWindowId = null;
            }
        }
    }

    destroyTerminal(id) {
        const window = this.windows.get(id);
        if (!window) return;

        window.destroy();
        this.windows.delete(id);

        if (this.focusedWindowId === id) {
            this.focusedWindowId = null;
            // Focus next available
            const nextId = this.windows.keys().next().value;
            if (nextId) this.focusTerminal(nextId);
        }

        console.log(`[TerminalManager] Destroyed terminal: ${id}`);
    }

    _bringToFront(id) {
        const window = this.windows.get(id);
        if (!window) return;

        // Update z-indices
        let maxZ = 0;
        for (const [wid, w] of this.windows) {
            if (w.container.zIndex > maxZ) maxZ = w.container.zIndex;
        }
        window.container.zIndex = maxZ + 1;
        this.container.sortChildren();
    }

    _initKeyboardShortcuts() {
        window.addEventListener('keydown', (e) => {
            if (!this.shortcutsEnabled) return;

            // Ctrl+T: Create new terminal
            if (e.ctrlKey && e.key === 't') {
                e.preventDefault();
                this.createTerminal();
            }

            // Ctrl+W: Close focused terminal
            if (e.ctrlKey && e.key === 'w') {
                e.preventDefault();
                if (this.focusedWindowId) {
                    this.destroyTerminal(this.focusedWindowId);
                }
            }

            // Ctrl+M: Toggle minimize
            if (e.ctrlKey && e.key === 'm') {
                e.preventDefault();
                const window = this.windows.get(this.focusedWindowId);
                if (window) window.toggleMinimize();
            }

            // Tab: Focus next terminal
            if (e.key === 'Tab' && !e.ctrlKey) {
                e.preventDefault();
                this._focusNext(e.shiftKey ? -1 : 1);
            }
        });
    }

    _focusNext(direction = 1) {
        const ids = Array.from(this.windows.keys());
        if (ids.length === 0) return;

        const currentIndex = ids.indexOf(this.focusedWindowId);
        let nextIndex = currentIndex + direction;

        if (nextIndex < 0) nextIndex = ids.length - 1;
        if (nextIndex >= ids.length) nextIndex = 0;

        this.focusTerminal(ids[nextIndex]);
    }

    loadPositions() {
        if (!this.connected) {
            this._loadFromLocalStorage();
            return;
        }

        this.ws.send(JSON.stringify({ type: 'load_positions' }));
    }

    savePositions() {
        const positions = {};
        for (const [id, window] of this.windows) {
            positions[id] = window.getPosition();
        }

        if (this.connected) {
            this.ws.send(JSON.stringify({
                type: 'save_positions',
                positions
            }));
        }

        // Always save to localStorage as backup
        this._saveToLocalStorage(positions);
    }

    _handleServerMessage(data) {
        if (data.type === 'positions') {
            this._restorePositions(data.positions);
        }
    }

    _loadFromLocalStorage() {
        try {
            const saved = localStorage.getItem('terminal_positions');
            if (saved) {
                const positions = JSON.parse(saved);
                this._restorePositions(positions);
            }
        } catch (e) {
            console.warn('[TerminalManager] Failed to load from localStorage:', e);
        }
    }

    _saveToLocalStorage(positions) {
        try {
            localStorage.setItem('terminal_positions', JSON.stringify(positions));
        } catch (e) {
            console.warn('[TerminalManager] Failed to save to localStorage:', e);
        }
    }

    _restorePositions(positions) {
        for (const [id, pos] of Object.entries(positions)) {
            const window = this.windows.get(id);
            if (window) {
                window.setPosition(pos.x, pos.y);
            }
        }
    }

    _onWindowPositionChange(window) {
        // Debounce position saves (500ms)
        if (this._saveTimeout) {
            clearTimeout(this._saveTimeout);
        }

        this._saveTimeout = setTimeout(() => {
            this.savePositions();
        }, 500);
    }
}
