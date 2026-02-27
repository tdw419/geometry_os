/**
 * Geometry OS: WindowParticle
 *
 * A window wrapper that registers with the Neural Event Bus as a particle.
 * Enables infinite map integration with position tracking and event emission.
 *
 * Architecture:
 * [TerminalWindow/CodeViewer]
 *         ↓ wrapped by
 * [WindowParticle]
 *         ↓ registers with
 * [NeuralEventBus]
 *         ↓ coordinates
 * [Infinite Viewport]
 */

export class WindowParticle {
    /**
     * Create a window particle.
     * @param {PIXI.Container} windowContent - The window content (TerminalWindow.container, etc.)
     * @param {Object} options - Configuration options
     */
    constructor(windowContent, options = {}) {
        this.id = options.id || `particle-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
        this.type = options.type || 'window'; // 'terminal', 'code-viewer', 'window'
        this.windowContent = windowContent;

        // Particle properties (NEB coordinates)
        this.x = options.x || 0;
        this.y = options.y || 0;
        this.scale = options.scale || 1.0;
        this.zIndex = options.zIndex || 0;
        this.width = options.width || 800;
        this.height = options.height || 600;

        // State
        this.focused = false;
        this.minimized = false;
        this.visible = true;

        // Event bus reference (set via registration)
        this.eventBus = null;

        // Create particle container
        this.container = new PIXI.Container();
        this.container.label = `WindowParticle:${this.id}`;

        // Add window content to particle container
        if (this.windowContent) {
            this.container.addChild(this.windowContent);
        }

        // Apply initial transform
        this._applyTransform();

        // Setup interaction
        this._initInteraction();
    }

    /**
     * Initialize mouse/touch interaction.
     */
    _initInteraction() {
        this.container.eventMode = 'static';
        this.container.interactiveChildren = true;

        // Focus on click
        this.container.on('pointerdown', () => {
            this.focus();
        });
    }

    /**
     * Apply current transform to container.
     */
    _applyTransform() {
        this.container.x = this.x;
        this.container.y = this.y;
        this.container.scale.set(this.scale);
        this.container.zIndex = this.zIndex;
    }

    /**
     * Set particle position.
     * @param {number} x
     * @param {number} y
     */
    setPosition(x, y) {
        this.x = x;
        this.y = y;
        this._applyTransform();
        this._emit('move', { x, y });
    }

    /**
     * Set particle scale.
     * @param {number} scale
     */
    setScale(scale) {
        this.scale = Math.max(0.25, Math.min(3.0, scale));
        this._applyTransform();
        this._emit('scale', { scale: this.scale });
    }

    /**
     * Set particle z-index (depth).
     * @param {number} zIndex
     */
    setZIndex(zIndex) {
        this.zIndex = zIndex;
        this._applyTransform();
        this._emit('depth', { zIndex });
    }

    /**
     * Bring to front (increment z-index).
     */
    bringToFront() {
        if (this.eventBus) {
            const topZ = this.eventBus.getTopZIndex();
            this.setZIndex(topZ + 1);
        } else {
            this.setZIndex(this.zIndex + 100);
        }
    }

    /**
     * Focus this particle.
     */
    focus() {
        if (!this.focused) {
            this.focused = true;
            this.bringToFront();
            this._emit('focus', { focused: true });
        }
    }

    /**
     * Blur (unfocus) this particle.
     */
    blur() {
        if (this.focused) {
            this.focused = false;
            this._emit('focus', { focused: false });
        }
    }

    /**
     * Toggle minimize state.
     */
    toggleMinimize() {
        this.minimized = !this.minimized;
        this.container.visible = !this.minimized;
        this._emit('minimize', { minimized: this.minimized });
    }

    /**
     * Show particle.
     */
    show() {
        this.visible = true;
        this.container.visible = true;
        this._emit('visibility', { visible: true });
    }

    /**
     * Hide particle.
     */
    hide() {
        this.visible = false;
        this.container.visible = false;
        this._emit('visibility', { visible: false });
    }

    /**
     * Get bounding box in world coordinates.
     */
    getBounds() {
        return {
            x: this.x,
            y: this.y,
            width: this.width * this.scale,
            height: this.height * this.scale,
            right: this.x + this.width * this.scale,
            bottom: this.y + this.height * this.scale
        };
    }

    /**
     * Check if point is inside particle bounds.
     * @param {number} x
     * @param {number} y
     */
    containsPoint(x, y) {
        const bounds = this.getBounds();
        return x >= bounds.x && x <= bounds.right &&
               y >= bounds.y && y <= bounds.bottom;
    }

    /**
     * Register with event bus.
     * @param {NeuralEventBus} eventBus
     */
    register(eventBus) {
        this.eventBus = eventBus;
        this._emit('register', { particle: this });
    }

    /**
     * Unregister from event bus.
     */
    unregister() {
        this._emit('unregister', { particleId: this.id });
        this.eventBus = null;
    }

    /**
     * Emit event to bus.
     * @param {string} eventType
     * @param {Object} data
     */
    _emit(eventType, data) {
        if (this.eventBus) {
            this.eventBus.emit('window-particle:' + eventType, {
                particleId: this.id,
                type: this.type,
                ...data
            });
        }
    }

    /**
     * Serialize particle state for persistence.
     */
    serialize() {
        return {
            id: this.id,
            type: this.type,
            x: this.x,
            y: this.y,
            scale: this.scale,
            zIndex: this.zIndex,
            width: this.width,
            height: this.height,
            focused: this.focused,
            minimized: this.minimized,
            visible: this.visible
        };
    }

    /**
     * Restore particle state from serialized data.
     * @param {Object} data
     */
    restore(data) {
        if (data.x !== undefined) this.x = data.x;
        if (data.y !== undefined) this.y = data.y;
        if (data.scale !== undefined) this.scale = data.scale;
        if (data.zIndex !== undefined) this.zIndex = data.zIndex;
        if (data.width !== undefined) this.width = data.width;
        if (data.height !== undefined) this.height = data.height;
        if (data.minimized !== undefined) this.minimized = data.minimized;
        if (data.visible !== undefined) this.visible = data.visible;

        this._applyTransform();
        this.container.visible = this.visible && !this.minimized;
    }

    /**
     * Destroy particle.
     */
    destroy() {
        this.unregister();
        this.container.destroy({ children: true });
        this.windowContent = null;
    }
}


// Particle Manager for tracking all particles
export class ParticleManager {
    /**
     * Manages all window particles in the infinite map.
     */
    constructor(eventBus) {
        this.eventBus = eventBus;
        this.particles = new Map();
        this.focusedParticleId = null;
        this._topZIndex = 0;

        // Listen to particle events
        if (eventBus) {
            eventBus.on('window-particle:focus', this._onParticleFocus.bind(this));
            eventBus.on('window-particle:register', this._onParticleRegister.bind(this));
            eventBus.on('window-particle:unregister', this._onParticleUnregister.bind(this));
        }
    }

    /**
     * Add a particle.
     * @param {WindowParticle} particle
     */
    add(particle) {
        this.particles.set(particle.id, particle);
        particle.register(this.eventBus);

        if (particle.zIndex > this._topZIndex) {
            this._topZIndex = particle.zIndex;
        }
    }

    /**
     * Remove a particle.
     * @param {string} particleId
     */
    remove(particleId) {
        const particle = this.particles.get(particleId);
        if (particle) {
            particle.destroy();
            this.particles.delete(particleId);
        }
    }

    /**
     * Get particle by ID.
     * @param {string} particleId
     */
    get(particleId) {
        return this.particles.get(particleId);
    }

    /**
     * Get all particles.
     */
    getAll() {
        return Array.from(this.particles.values());
    }

    /**
     * Get top z-index.
     */
    getTopZIndex() {
        return this._topZIndex;
    }

    /**
     * Get focused particle.
     */
    getFocused() {
        return this.focusedParticleId ? this.particles.get(this.focusedParticleId) : null;
    }

    /**
     * Find particle at world coordinates.
     * @param {number} x
     * @param {number} y
     */
    findAtPoint(x, y) {
        // Search in reverse z-order (top first)
        const sorted = this.getAll().sort((a, b) => b.zIndex - a.zIndex);
        for (const particle of sorted) {
            if (particle.containsPoint(x, y)) {
                return particle;
            }
        }
        return null;
    }

    /**
     * Handle particle focus event.
     */
    _onParticleFocus(data) {
        // Blur previous focused particle
        if (this.focusedParticleId && this.focusedParticleId !== data.particleId) {
            const prev = this.particles.get(this.focusedParticleId);
            if (prev && prev.focused) {
                prev.focused = false;
            }
        }
        this.focusedParticleId = data.particleId;
    }

    /**
     * Handle particle register event.
     */
    _onParticleRegister(data) {
        if (data.particle.zIndex > this._topZIndex) {
            this._topZIndex = data.particle.zIndex;
        }
    }

    /**
     * Handle particle unregister event.
     */
    _onParticleUnregister(data) {
        if (this.focusedParticleId === data.particleId) {
            this.focusedParticleId = null;
        }
    }

    /**
     * Serialize all particles.
     */
    serialize() {
        const state = {};
        for (const [id, particle] of this.particles) {
            state[id] = particle.serialize();
        }
        return state;
    }

    /**
     * Restore particles from serialized state.
     * @param {Object} state
     */
    restore(state) {
        for (const [id, data] of Object.entries(state)) {
            const particle = this.particles.get(id);
            if (particle) {
                particle.restore(data);
            }
        }
    }
}
