/**
 * GravityWellRenderer - Visualizes code gravity for World of Rectification
 *
 * Renders the spatial tectonics of the codebase:
 * - Axion Core files as glowing gravity wells at center (0,0)
 * - High-value files gravitating toward center
 * - Stale husks drifting to the periphery (to be reclaimed)
 *
 * The gravity visualization represents "Tikkun Olam" (World Repair):
 * - Bright center = healthy, foundational code
 * - Drifting particles = code that needs rectification
 *
 * Integration:
 * - Reads from .geometry/gravity_report.json via WebSocket
 * - Overlays on the Infinite Map
 * - Toggle with Ctrl+Shift+G
 *
 * @class GravityWellRenderer
 */

// Color configuration
const GRAVITY_COLORS = {
    axionCore: 0xFFD700,      // Gold - highest value
    highValue: 0x00FF88,      // Green - healthy
    mediumValue: 0x88FFFF,    // Cyan - stable
    lowValue: 0xFF8844,       // Orange - needs attention
    staleHusk: 0x664422,      // Brown - needs rectification
    gravityField: 0x4444FF,   // Blue - gravitational pull
};

class GravityWellRenderer {
    /**
     * Create a new GravityWellRenderer
     * @param {PIXI.Application} app - The PixiJS application
     * @param {Object} viewport - The viewport manager
     * @param {PIXI.Container} worldContainer - World container to add overlay
     * @param {Object} options - Configuration options
     */
    constructor(app, viewport, worldContainer, options = {}) {
        this.app = app;
        this.viewport = viewport;
        this.worldContainer = worldContainer;

        // Configuration
        this.config = {
            wsPort: options.wsPort || 8765,
            centerOffset: options.centerOffset || { x: 0, y: 0 },
            maxOrbitRadius: options.maxOrbitRadius || 800,
            particleSize: options.particleSize || 8,
            showGravityField: options.showGravityField !== false,
            showLabels: options.showLabels !== false,
            animationSpeed: options.animationSpeed || 1.0,
            ...options
        };

        // Gravity data
        this.gravityData = null;
        this.axionCore = [];
        this.highValueFiles = [];
        this.staleHusks = [];

        // Graphics containers
        this.container = new PIXI.Container();
        this.container.name = 'GravityWellOverlay';
        this.container.visible = false;
        this.container.sortableChildren = true;

        // Particle containers
        this.particles = new Map(); // file -> particle graphics
        this.gravityField = null;
        this.orbitRings = [];

        // Animation state
        this.time = 0;
        this.lastUpdate = 0;
        this._needsRender = false;

        // WebSocket connection
        this.ws = null;
        this.reconnectAttempts = 0;
        this.maxReconnectAttempts = 10;

        // Bind methods
        this._animate = this._animate.bind(this);
        this._onMessage = this._onMessage.bind(this);

        // Initialize
        this._init();
    }

    /**
     * Initialize the renderer
     */
    _init() {
        // Create gravity field background
        if (this.config.showGravityField) {
            this._createGravityField();
        }

        // Create orbit rings
        this._createOrbitRings();

        // Add to world container
        this.worldContainer.addChild(this.container);

        // Start animation loop
        this.app.ticker.add(this._animate);

        // Connect to WebSocket
        this._connectWebSocket();

        console.log('🌌 GravityWellRenderer initialized');
    }

    /**
     * Create the central gravity field visualization
     */
    _createGravityField() {
        this.gravityField = new PIXI.Graphics();

        // Draw concentric gradient circles
        const maxRadius = 200;
        const rings = 20;

        for (let i = rings; i > 0; i--) {
            const radius = (i / rings) * maxRadius;
            const alpha = 0.02 + (1 - i / rings) * 0.08;

            this.gravityField.circle(0, 0, radius);
            this.gravityField.fill({ color: GRAVITY_COLORS.gravityField, alpha });
        }

        this.container.addChild(this.gravityField);
    }

    /**
     * Create orbit reference rings
     */
    _createOrbitRings() {
        const radii = [100, 200, 400, 600, 800];

        radii.forEach((radius, index) => {
            const ring = new PIXI.Graphics();
            ring.circle(0, 0, radius);
            ring.stroke({ width: 1, color: 0x333344, alpha: 0.3 });
            this.container.addChild(ring);
            this.orbitRings.push(ring);
        });
    }

    /**
     * Load gravity data from static JSON file (same-origin, no CORS issues)
     */
    async _loadGravityData() {
        try {
            const response = await fetch('gravity_data.json');
            if (response.ok) {
                const data = await response.json();
                this._updateGravityData(data);
                console.log('🌌 Gravity data loaded:', data.axion_core?.length || 0, 'core files');
                return;
            }
        } catch (e) {
            console.warn('🌌 Failed to load gravity_data.json:', e);
        }
        // Fallback to mock data
        this._loadMockData();
    }

    /**
     * Load mock data for development/fallback
     */
    _loadMockData() {
        const mockData = {
            axion_core: [
                { file: 'NORTH_STAR.md', value: 1.0 },
                { file: 'ARCHITECTURE.md', value: 1.0 },
                { file: 'OPERATIONS.md', value: 0.95 },
                { file: 'ROADMAP.md', value: 0.9 },
                { file: 'AGENTS.md', value: 0.85 },
            ],
            high_value: [],
            stale_husks: [
                { file: 'systems/build/orchestrator.py', staleness: 1.0 },
                { file: 'systems/build/job_queue.py', staleness: 1.0 },
                { file: 'systems/build/worker.py', staleness: 1.0 },
            ]
        };
        this._updateGravityData(mockData);
        console.log('🌌 Using mock gravity data');
    }

    /**
     * Connect to the WebSocket server for gravity data (legacy, unused)
     */
    _connectWebSocket() {
        // WebSocket disabled - using static JSON file instead
        this._loadGravityData();
    }

    /**
     * Schedule WebSocket reconnection (legacy, unused)
     */
    _scheduleReconnect() {
        if (this.reconnectAttempts < this.maxReconnectAttempts) {
            this.reconnectAttempts++;
            const delay = Math.min(1000 * this.reconnectAttempts, 10000);
            setTimeout(() => this._connectWebSocket(), delay);
        }
    }

    /**
     * Handle WebSocket messages
     */
    _onMessage(event) {
        try {
            const msg = JSON.parse(event.data);

            if (msg.type === 'gravity_update') {
                this._updateGravityData(msg.data);
            }
        } catch (error) {
            console.warn('🌌 Failed to parse gravity message:', error);
        }
    }

    /**
     * Update gravity data from server
     */
    _updateGravityData(data) {
        this.gravityData = data;
        this.axionCore = data.axion_core || [];
        this.highValueFiles = data.high_value || [];
        this.staleHusks = data.stale_husks || [];

        this._needsRender = true;
        this._renderParticles();
    }

    /**
     * Load gravity data directly (for testing without WebSocket)
     */
    loadGravityData(data) {
        this._updateGravityData(data);
    }

    /**
     * Render all particles
     */
    _renderParticles() {
        // Clear existing particles
        this.particles.forEach(p => p.destroy());
        this.particles.clear();

        // Render Axion Core (center, high glow)
        this.axionCore.forEach((file, index) => {
            this._createParticle(file, 'axion_core', index);
        });

        // Render high-value files (inner orbit)
        this.highValueFiles.forEach((file, index) => {
            this._createParticle(file, 'high_value', index);
        });

        // Render stale husks (outer orbit)
        this.staleHusks.slice(0, 50).forEach((file, index) => {
            this._createParticle(file, 'stale_husk', index);
        });
    }

    /**
     * Create a single particle
     */
    _createParticle(file, type, index) {
        const particle = new PIXI.Container();

        // Determine visual properties based on type
        let color, size, orbitRadius, alpha;

        switch (type) {
            case 'axion_core':
                color = GRAVITY_COLORS.axionCore;
                size = this.config.particleSize * 2;
                orbitRadius = 0; // Center
                alpha = 1.0;
                break;
            case 'high_value':
                color = GRAVITY_COLORS.highValue;
                size = this.config.particleSize * 1.5;
                orbitRadius = 100 + Math.random() * 100;
                alpha = 0.9;
                break;
            case 'stale_husk':
                color = GRAVITY_COLORS.staleHusk;
                size = this.config.particleSize;
                orbitRadius = this.config.maxOrbitRadius * (0.6 + Math.random() * 0.4);
                alpha = 0.5;
                break;
            default:
                color = GRAVITY_COLORS.mediumValue;
                size = this.config.particleSize;
                orbitRadius = 200 + Math.random() * 200;
                alpha = 0.7;
        }

        // Create glow effect
        const glow = new PIXI.Graphics();
        glow.circle(0, 0, size * 1.5);
        glow.fill({ color, alpha: alpha * 0.3 });
        particle.addChild(glow);

        // Create core
        const core = new PIXI.Graphics();
        core.circle(0, 0, size);
        core.fill({ color, alpha });
        particle.addChild(core);

        // Add label for Axion Core files
        if (type === 'axion_core' && this.config.showLabels) {
            const label = new PIXI.Text({
                text: file.file || file,
                style: {
                    fontFamily: 'monospace',
                    fontSize: 10,
                    fill: color,
                    align: 'center'
                }
            });
            label.anchor.set(0.5, -1.5);
            particle.addChild(label);
        }

        // Position based on orbit
        const angle = (index / (type === 'axion_core' ? 5 : 20)) * Math.PI * 2;
        particle.x = Math.cos(angle) * orbitRadius;
        particle.y = Math.sin(angle) * orbitRadius;

        // Store metadata for animation
        particle._orbitRadius = orbitRadius;
        particle._orbitAngle = angle;
        particle._orbitSpeed = type === 'axion_core' ? 0 : (0.001 + Math.random() * 0.002);
        particle._type = type;
        particle._value = file.value || 1.0;

        this.container.addChild(particle);
        this.particles.set(file.file || file, particle);

        return particle;
    }

    /**
     * Animation loop
     */
    _animate(ticker) {
        if (!this.container.visible) return;

        this.time += ticker.deltaTime * this.config.animationSpeed;

        // Animate particles
        this.particles.forEach((particle, file) => {
            if (particle._orbitRadius > 0) {
                // Orbit around center
                particle._orbitAngle += particle._orbitSpeed * ticker.deltaTime;
                particle.x = Math.cos(particle._orbitAngle) * particle._orbitRadius;
                particle.y = Math.sin(particle._orbitAngle) * particle._orbitRadius;
            }

            // Pulse effect for Axion Core
            if (particle._type === 'axion_core') {
                const pulse = 1.0 + Math.sin(this.time * 2) * 0.1;
                particle.scale.set(pulse);
            }
        });

        // Animate gravity field
        if (this.gravityField) {
            this.gravityField.alpha = 0.5 + Math.sin(this.time) * 0.1;
        }
    }

    /**
     * Toggle visibility
     */
    toggle() {
        this.container.visible = !this.container.visible;
        console.log(`🌌 Gravity wells ${this.container.visible ? 'visible' : 'hidden'}`);
        return this.container.visible;
    }

    /**
     * Show the overlay
     */
    show() {
        this.container.visible = true;
    }

    /**
     * Hide the overlay
     */
    hide() {
        this.container.visible = false;
    }

    /**
     * Get current gravity status
     */
    getStatus() {
        return {
            visible: this.container.visible,
            axionCoreCount: this.axionCore.length,
            highValueCount: this.highValueFiles.length,
            staleHuskCount: this.staleHusks.length,
            totalParticles: this.particles.size,
            connected: this.ws && this.ws.readyState === WebSocket.OPEN
        };
    }

    /**
     * Destroy the renderer
     */
    destroy() {
        this.app.ticker.remove(this._animate);

        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        this.particles.forEach(p => p.destroy());
        this.particles.clear();

        if (this.gravityField) {
            this.gravityField.destroy();
        }

        this.orbitRings.forEach(r => r.destroy());
        this.orbitRings = [];

        this.container.destroy();
    }
}

// Export for use in application.js
if (typeof window !== 'undefined') {
    window.GravityWellRenderer = GravityWellRenderer;
}
