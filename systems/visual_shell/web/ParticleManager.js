/**
 * ParticleManager.js
 * Manages lifecycle of all particles in the infinite canvas.
 * Handles creation, destruction, focus management, and spatial indexing.
 */

class ParticleManager {
    // Grid cell size for spatial indexing
    static SPATIAL_CELL_SIZE = 100;

    constructor(worldContainer, options = {}) {
        // Core particle storage
        this.particles = new Map(); // particleId -> particle

        // Reference to the world container (PIXI.Container)
        this.worldContainer = worldContainer;

        // Dedicated layer for all particles
        this.particleLayer = new PIXI.Container();
        this.particleLayer.label = 'particleLayer';
        this.particleLayer.sortableChildren = true;
        this.worldContainer.addChild(this.particleLayer);

        // Focus tracking
        this.focusedParticle = null;

        // Spatial index for fast position queries
        // Map<spatialKey, Set<particleId>>
        this.spatialIndex = new Map();

        // NEB integration
        this._nebSocket = options.nebSocket || null;

        // Event callbacks
        this._onParticleCreated = options.onParticleCreated || null;
        this._onParticleDestroyed = options.onParticleDestroyed || null;
        this._onParticleFocused = options.onParticleFocused || null;

        // Counter for generating IDs
        this._particleCounter = 0;

        // Debounced save timer
        this._saveTimer = null;
    }

    // === Particle Creation ===

    /**
     * Create a terminal window particle
     * @param {Object} options - Particle options
     * @returns {TerminalWindowParticle} The created particle
     */
    createTerminalParticle(options = {}) {
        // Generate ID if not provided
        if (!options.particleId) {
            options.particleId = `terminal-${++this._particleCounter}-${Date.now()}`;
        }

        // Create the particle
        const particle = new TerminalWindowParticle({
            ...options,
            nebSocket: this._nebSocket,
            nebEnabled: !!this._nebSocket
        });

        // Add to tracking
        this.particles.set(particle.particleId, particle);

        // Add to particle layer
        this.particleLayer.addChild(particle);

        // Update spatial index
        this._addToSpatialIndex(particle);

        // Setup event listeners
        this._setupParticleEvents(particle);

        // Publish creation event
        this._publishNebEvent('terminal.particle.created', {
            particleId: particle.particleId,
            particleType: particle.constructor.PARTICLE_TYPE || 'unknown',
            position: particle.particlePosition
        });

        // Callback
        if (this._onParticleCreated) {
            this._onParticleCreated(particle);
        }

        // Focus the new particle
        this.focusParticle(particle.particleId);

        return particle;
    }

    /**
     * Setup event listeners for a particle
     */
    _setupParticleEvents(particle) {
        // Handle focus events
        particle.on('particle-focused', (p) => this._onParticleFocus(p));

        // Handle close events
        particle.on('particle-closed', (p) => this._onParticleClosed(p));
    }

    // === Particle Destruction ===

    /**
     * Destroy a particle by ID
     * @param {string} particleId - The particle ID to destroy
     * @returns {boolean} True if destroyed, false if not found
     */
    destroyParticle(particleId) {
        const particle = this.particles.get(particleId);
        if (!particle) {
            console.warn(`[ParticleManager] Particle not found: ${particleId}`);
            return false;
        }

        // Publish destruction event before removing
        this._publishNebEvent('terminal.particle.destroyed', {
            particleId: particle.particleId,
            particleType: particle.constructor.PARTICLE_TYPE || 'unknown'
        });

        // Remove from spatial index
        this._removeFromSpatialIndex(particle);

        // Remove from particle layer
        this.particleLayer.removeChild(particle);

        // Remove from tracking
        this.particles.delete(particleId);

        // Update focus if this was focused
        if (this.focusedParticle === particle) {
            this.focusedParticle = null;
            // Focus next available particle
            this._focusNextAvailable();
        }

        // Callback
        if (this._onParticleDestroyed) {
            this._onParticleDestroyed(particle);
        }

        // Destroy the particle
        particle.destroy();

        return true;
    }

    /**
     * Destroy the currently focused particle
     * @returns {boolean} True if destroyed
     */
    destroyFocused() {
        if (!this.focusedParticle) {
            return false;
        }
        return this.destroyParticle(this.focusedParticle.particleId);
    }

    // === Particle Retrieval ===

    /**
     * Get a particle by ID
     * @param {string} particleId
     * @returns {TerminalWindowParticle|undefined}
     */
    getParticle(particleId) {
        return this.particles.get(particleId);
    }

    /**
     * Get all particles as an array
     * @returns {Array<TerminalWindowParticle>}
     */
    getAllParticles() {
        return Array.from(this.particles.values());
    }

    /**
     * Get particles by type
     * @param {string} type - Particle type (e.g., 'terminal')
     * @returns {Array<TerminalWindowParticle>}
     */
    getParticlesByType(type) {
        return this.getAllParticles().filter(p => {
            return p.constructor.PARTICLE_TYPE === type;
        });
    }

    /**
     * Get particle count
     * @returns {number}
     */
    getParticleCount() {
        return this.particles.size;
    }

    // === Spatial Queries ===

    /**
     * Get spatial key for a position
     * @param {number} x
     * @param {number} y
     * @returns {string} Spatial key like "10,5"
     */
    _getSpatialKey(x, y) {
        const cellX = Math.floor(x / ParticleManager.SPATIAL_CELL_SIZE);
        const cellY = Math.floor(y / ParticleManager.SPATIAL_CELL_SIZE);
        return `${cellX},${cellY}`;
    }

    /**
     * Add particle to spatial index
     */
    _addToSpatialIndex(particle) {
        const pos = particle.particlePosition;
        const key = this._getSpatialKey(pos.x, pos.y);

        if (!this.spatialIndex.has(key)) {
            this.spatialIndex.set(key, new Set());
        }
        this.spatialIndex.get(key).add(particle.particleId);
    }

    /**
     * Remove particle from spatial index
     */
    _removeFromSpatialIndex(particle) {
        const pos = particle.particlePosition;
        const key = this._getSpatialKey(pos.x, pos.y);

        const cell = this.spatialIndex.get(key);
        if (cell) {
            cell.delete(particle.particleId);
            if (cell.size === 0) {
                this.spatialIndex.delete(key);
            }
        }
    }

    /**
     * Update particle position in spatial index
     */
    _updateSpatialIndex(particle, oldPos) {
        const oldKey = this._getSpatialKey(oldPos.x, oldPos.y);
        const newKey = this._getSpatialKey(particle.particlePosition.x, particle.particlePosition.y);

        if (oldKey !== newKey) {
            // Remove from old cell
            const oldCell = this.spatialIndex.get(oldKey);
            if (oldCell) {
                oldCell.delete(particle.particleId);
                if (oldCell.size === 0) {
                    this.spatialIndex.delete(oldKey);
                }
            }

            // Add to new cell
            if (!this.spatialIndex.has(newKey)) {
                this.spatialIndex.set(newKey, new Set());
            }
            this.spatialIndex.get(newKey).add(particle.particleId);
        }
    }

    /**
     * Find particle at position within radius
     * @param {number} x - World X position
     * @param {number} y - World Y position
     * @param {number} radius - Search radius in pixels
     * @returns {TerminalWindowParticle|null}
     */
    getParticleAtPosition(x, y, radius = 50) {
        // Check nearby cells
        const cellRadius = Math.ceil(radius / ParticleManager.SPATIAL_CELL_SIZE);
        const centerCellX = Math.floor(x / ParticleManager.SPATIAL_CELL_SIZE);
        const centerCellY = Math.floor(y / ParticleManager.SPATIAL_CELL_SIZE);

        let closest = null;
        let closestDist = radius * radius;

        for (let dx = -cellRadius; dx <= cellRadius; dx++) {
            for (let dy = -cellRadius; dy <= cellRadius; dy++) {
                const key = `${centerCellX + dx},${centerCellY + dy}`;
                const cell = this.spatialIndex.get(key);

                if (!cell) continue;

                for (const particleId of cell) {
                    const particle = this.particles.get(particleId);
                    if (!particle) continue;

                    const pos = particle.particlePosition;
                    const distSq = (pos.x - x) ** 2 + (pos.y - y) ** 2;

                    if (distSq < closestDist) {
                        closest = particle;
                        closestDist = distSq;
                    }
                }
            }
        }

        return closest;
    }

    // === Focus Management ===

    /**
     * Focus a specific particle
     * @param {string} particleId
     * @returns {boolean} True if focused
     */
    focusParticle(particleId) {
        const particle = this.particles.get(particleId);
        if (!particle) {
            console.warn(`[ParticleManager] Cannot focus: particle not found ${particleId}`);
            return false;
        }

        // Blur current focused particle
        if (this.focusedParticle && this.focusedParticle !== particle) {
            this.focusedParticle.blur();
        }

        // Set new focus
        this.focusedParticle = particle;
        particle.focus();

        // Callback
        if (this._onParticleFocused) {
            this._onParticleFocused(particle);
        }

        return true;
    }

    /**
     * Handle particle focus event
     */
    _onParticleFocus(particle) {
        // Blur previous if different
        if (this.focusedParticle && this.focusedParticle !== particle) {
            this.focusedParticle.blur();
        }

        // Update focused reference
        this.focusedParticle = particle;

        // Bring to front
        this._bringToFront(particle);

        // Callback
        if (this._onParticleFocused) {
            this._onParticleFocused(particle);
        }
    }

    /**
     * Handle particle closed event
     */
    _onParticleClosed(particle) {
        this.destroyParticle(particle.particleId);
    }

    /**
     * Cycle focus to next particle
     * @returns {TerminalWindowParticle|null} The newly focused particle
     */
    cycleFocus() {
        const particles = this.getAllParticles();
        if (particles.length === 0) {
            return null;
        }

        if (particles.length === 1) {
            this.focusParticle(particles[0].particleId);
            return particles[0];
        }

        // Find current index
        let currentIndex = -1;
        if (this.focusedParticle) {
            currentIndex = particles.findIndex(p => p.particleId === this.focusedParticle.particleId);
        }

        // Move to next (wrap around)
        const nextIndex = (currentIndex + 1) % particles.length;
        const nextParticle = particles[nextIndex];

        this.focusParticle(nextParticle.particleId);

        return nextParticle;
    }

    /**
     * Focus next available particle (used after destroying focused)
     */
    _focusNextAvailable() {
        const particles = this.getAllParticles();
        if (particles.length > 0) {
            this.focusParticle(particles[0].particleId);
        }
    }

    /**
     * Bring particle to front (highest zIndex)
     */
    _bringToFront(particle) {
        if (!particle || !this.particleLayer) return;

        // Find highest zIndex among siblings
        let maxZ = 0;
        this.particleLayer.children.forEach(child => {
            if (child !== particle && child.zIndex !== undefined) {
                maxZ = Math.max(maxZ, child.zIndex);
            }
        });

        // Set particle to highest + 1
        particle.zIndex = maxZ + 1;
        particle._particleZIndex = particle.zIndex;

        // Sort children by zIndex
        this.particleLayer.children.sort((a, b) => (a.zIndex || 0) - (b.zIndex || 0));
    }

    // === NEB Integration ===

    /**
     * Set the NEB WebSocket connection
     * @param {WebSocket} socket
     */
    setNebSocket(socket) {
        this._nebSocket = socket;

        // Update all existing particles
        this.particles.forEach(particle => {
            particle._nebSocket = socket;
            particle._nebEnabled = !!socket;
        });
    }

    /**
     * Publish event to NEB
     */
    _publishNebEvent(topic, payload) {
        if (!this._nebSocket) return;

        try {
            const message = JSON.stringify({
                topic,
                payload: {
                    ...payload,
                    timestamp: Date.now()
                }
            });

            if (this._nebSocket.readyState === WebSocket.OPEN) {
                this._nebSocket.send(message);
            }
        } catch (e) {
            console.warn('[ParticleManager] Failed to publish NEB event:', e);
        }
    }

    // === Update Loop ===

    /**
     * Update all particles (call from render loop)
     */
    update() {
        this.particles.forEach(particle => {
            // Track old position for spatial index updates
            const oldPos = { ...particle.particlePosition };

            // Update particle
            particle.update();

            // Update spatial index if position changed
            const newPos = particle.particlePosition;
            if (oldPos.x !== newPos.x || oldPos.y !== newPos.y) {
                this._updateSpatialIndex(particle, oldPos);
            }
        });
    }

    // === Serialization ===

    /**
     * Serialize all particles for persistence
     * @returns {Object} {particles: [...], timestamp}
     */
    serialize() {
        const particles = this.getAllParticles().map(p => p.serialize());

        return {
            particles,
            timestamp: Date.now(),
            version: 1
        };
    }

    /**
     * Deserialize and restore particles
     * @param {Object} data - Serialized data from serialize()
     */
    deserialize(data) {
        if (!data || !data.particles || !Array.isArray(data.particles)) {
            console.warn('[ParticleManager] Invalid deserialize data');
            return;
        }

        // Clear existing particles
        this.clearAll();

        // Restore particles
        data.particles.forEach(particleData => {
            try {
                const particle = TerminalWindowParticle.deserialize(particleData, this._nebSocket);

                // Add to tracking
                this.particles.set(particle.particleId, particle);
                this.particleLayer.addChild(particle);
                this._addToSpatialIndex(particle);
                this._setupParticleEvents(particle);

                // Update counter to avoid ID collisions
                const match = particle.particleId.match(/terminal-(\d+)-/);
                if (match) {
                    const num = parseInt(match[1], 10);
                    if (num > this._particleCounter) {
                        this._particleCounter = num;
                    }
                }
            } catch (e) {
                console.warn('[ParticleManager] Failed to deserialize particle:', e, particleData);
            }
        });

        // Focus first particle if any
        const particles = this.getAllParticles();
        if (particles.length > 0) {
            this.focusParticle(particles[0].particleId);
        }
    }

    /**
     * Clear all particles
     */
    clearAll() {
        // Destroy all particles
        this.particles.forEach(particle => {
            this.particleLayer.removeChild(particle);
            particle.destroy();
        });

        // Clear tracking
        this.particles.clear();
        this.spatialIndex.clear();
        this.focusedParticle = null;
    }

    // === Debug ===

    /**
     * Get debug info
     */
    getDebugInfo() {
        return {
            particleCount: this.particles.size,
            focusedParticleId: this.focusedParticle?.particleId || null,
            spatialCells: this.spatialIndex.size,
            nebConnected: this._nebSocket?.readyState === WebSocket.OPEN
        };
    }

    /**
     * Log current state (for debugging)
     */
    logState() {
        console.log('[ParticleManager] State:', {
            particles: this.getAllParticles().map(p => ({
                id: p.particleId,
                position: p.particlePosition,
                focused: p.focused
            })),
            focused: this.focusedParticle?.particleId,
            spatialCells: this.spatialIndex.size
        });
    }
}

// Export for use in application
if (typeof window !== 'undefined') {
    window.ParticleManager = ParticleManager;
}
