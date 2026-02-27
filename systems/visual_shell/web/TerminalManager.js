/**
 * Geometry OS: TerminalManager
 *
 * Manages multiple TerminalWindow instances on the infinite map.
 * - Create/destroy terminals
 * - Focus management
 * - Z-index ordering
 * - Keyboard shortcuts
 * - Server persistence
 * - Neural Event Bus integration
 * - Viewport pan/zoom navigation
 */

import { TerminalWindow } from './TerminalWindow.js';
import { WindowParticle, ParticleManager } from './WindowParticle.js';
import { NeuralEventBus } from './NeuralEventBus.js';

export class TerminalManager {
    constructor(app, viewport, options = {}) {
        this.app = app;
        this.viewport = viewport;
        this.container = viewport.worldContainer || app.stage;

        // Window tracking
        this.windows = new Map();
        this.particles = new Map(); // WindowParticle wrappers
        this.focusedWindowId = null;
        this.nextId = 1;

        // Neural Event Bus
        this.eventBus = options.eventBus || new NeuralEventBus({
            debug: options.debug || false,
            wsUrl: options.nebUrl || null
        });

        // Particle Manager
        this.particleManager = new ParticleManager(this.eventBus);

        // Server sync
        this.serverUrl = options.serverUrl || 'ws://localhost:8765';
        this.ws = null;
        this.connected = false;

        // Viewport navigation state
        this.panSpeed = options.panSpeed || 20;
        this.zoomSpeed = options.zoomSpeed || 0.1;
        this.minZoom = options.minZoom || 0.25;
        this.maxZoom = options.maxZoom || 3.0;

        // Debounced save
        this._saveTimeout = null;

        // Keyboard shortcuts
        this.shortcutsEnabled = true;
        this._initKeyboardShortcuts();
        this._initViewportNavigation();

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
            const text = new PIXI.Text('$ ' + id, {
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

        // Wrap in WindowParticle for NEB integration
        const particle = new WindowParticle(window.container, {
            id,
            type: 'terminal',
            x: window.container.x,
            y: window.container.y,
            width: window.width || terminal.width,
            height: window.height || terminal.height,
            scale: 1.0,
            zIndex: this.windows.size
        });

        // Register particle with event bus
        particle.register(this.eventBus);
        this.particleManager.add(particle);

        // Add to container (use particle container)
        this.container.addChild(particle.container);

        // Track
        this.windows.set(id, window);
        this.particles.set(id, particle);

        // Focus new window
        this.focusTerminal(id);

        // Emit creation event
        this.eventBus.emit('terminal:created', { id, particle: particle.serialize() });

        console.log(`[TerminalManager] Created terminal: ${id}`);
        return { id, terminal, window, particle };
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
        const particle = this.particles.get(id);
        if (!window) return;

        // Emit destruction event before cleanup
        this.eventBus.emit('terminal:destroyed', { id });

        // Remove particle from manager (handles unregistration)
        if (particle) {
            this.particleManager.remove(id);
            this.particles.delete(id);
        }

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
        const particle = this.particles.get(id);
        if (!particle) return;

        // Use particle manager to get top z-index
        const topZ = this.particleManager.getTopZIndex();
        particle.setZIndex(topZ + 1);

        // Also sort the container
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

    /**
     * Initialize viewport pan/zoom navigation.
     */
    _initViewportNavigation() {
        if (!this.viewport) return;

        // Mouse wheel zoom
        this.viewport.on('wheel', (e) => {
            const delta = -Math.sign(e.deltaY) * this.zoomSpeed;
            const newZoom = Math.max(this.minZoom, Math.min(this.maxZoom, this.viewport.scale.x + delta));

            // Zoom toward mouse position
            const worldPos = this.viewport.toWorld(e.global);
            this.viewport.setZoom(newZoom, true);
            this.viewport.moveCenter(worldPos.x, worldPos.y);
        });

        // Middle mouse pan
        this.viewport.on('pointerdown', (e) => {
            if (e.button === 1) { // Middle mouse
                this.viewport.drag({ wheel: false });
            }
        });

        // Arrow key pan (when no window focused)
        window.addEventListener('keydown', (e) => {
            if (this.focusedWindowId) return; // Let terminal handle keys

            const pan = this.panSpeed / this.viewport.scale.x;

            switch (e.key) {
                case 'ArrowLeft':
                    this.viewport.moveCorner(this.viewport.x + pan, this.viewport.y);
                    break;
                case 'ArrowRight':
                    this.viewport.moveCorner(this.viewport.x - pan, this.viewport.y);
                    break;
                case 'ArrowUp':
                    this.viewport.moveCorner(this.viewport.x, this.viewport.y + pan);
                    break;
                case 'ArrowDown':
                    this.viewport.moveCorner(this.viewport.x, this.viewport.y - pan);
                    break;
            }
        });

        console.log('[TerminalManager] Viewport navigation initialized');
    }

    /**
     * Get current viewport bounds in world coordinates.
     */
    getViewportBounds() {
        if (!this.viewport) return { x: 0, y: 0, width: 800, height: 600 };

        const worldVisible = this.viewport.getVisibleBounds();
        return {
            x: worldVisible.x,
            y: worldVisible.y,
            width: worldVisible.width,
            height: worldVisible.height
        };
    }

    /**
     * Pan viewport to show a specific window.
     * @param {string} windowId
     */
    focusWindowInView(windowId) {
        const particle = this.particles.get(windowId);
        if (!particle || !this.viewport) return;

        const bounds = particle.getBounds();
        const viewBounds = this.getViewportBounds();

        // Center the window in viewport
        const targetX = bounds.x - viewBounds.width / 2 + bounds.width / 2;
        const targetY = bounds.y - viewBounds.height / 2 + bounds.height / 2;

        this.viewport.moveCenter(targetX, targetY);
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
