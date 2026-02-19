/**
 * NeuralPulseSystem - Visualizes memory synchronization as animated particle beams.
 *
 * Creates colored pulse effects that flow between buildings representing
 * shared memory tiles in the distributed neural memory system.
 */

/**
 * Event type color mapping for pulse visualization.
 */
const PulseEventType = {
    CODE_DISCOVERY: 'CODE_DISCOVERY',   // Cyan - code pattern discovered
    RESOURCE_PRESSURE: 'RESOURCE_PRESSURE', // Orange - memory pressure detected
    DISTRICT_SYNC: 'DISTRICT_SYNC'      // Violet - district synchronization
};

/**
 * Color definitions for event types (RGBA format for PIXI compatibility).
 */
const PulseColors = {
    [PulseEventType.CODE_DISCOVERY]: {
        r: 0, g: 255, b: 255,      // Cyan
        hex: 0x00FFFF
    },
    [PulseEventType.RESOURCE_PRESSURE]: {
        r: 255, g: 165, b: 0,      // Orange
        hex: 0xFFA500
    },
    [PulseEventType.DISTRICT_SYNC]: {
        r: 148, g: 0, b: 211,      // Violet
        hex: 0x9400D3
    }
};

/**
 * NeuralPulse - Represents a single animated pulse traveling between buildings.
 */
class NeuralPulse {
    constructor(config) {
        this.id = config.id || `pulse-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
        this.fromTileId = config.fromTileId;
        this.toTileId = config.toTileId;
        this.eventType = config.eventType || PulseEventType.DISTRICT_SYNC;
        this.confidence = config.confidence || 1.0;

        // Position tracking
        this.startPos = config.startPos || { x: 0, y: 0 };
        this.endPos = config.endPos || { x: 100, y: 100 };
        this.currentPos = { x: this.startPos.x, y: this.startPos.y };

        // Animation state
        this.progress = 0;          // 0 to 1
        this.speed = config.speed || 0.02;
        this.trail = [];           // Trail points for fading effect
        this.maxTrailLength = config.maxTrailLength || 10;
        this.completed = false;

        // Visual properties
        this.width = this._calculateWidth();
        this.alpha = 1.0;
        this.color = PulseColors[this.eventType] || PulseColors[PulseEventType.DISTRICT_SYNC];

        // Graphics container (for PIXI rendering)
        this.graphics = null;
    }

    /**
     * Calculate pulse width based on confidence score.
     * Higher confidence = thicker beam.
     * @private
     */
    _calculateWidth() {
        const baseWidth = 2;
        const maxWidth = 8;
        return baseWidth + (this.confidence * (maxWidth - baseWidth));
    }

    /**
     * Update pulse animation.
     * @param {number} deltaTime - Time since last update in ms
     * @returns {boolean} True if pulse is still active
     */
    update(deltaTime) {
        if (this.completed) return false;

        // Store current position in trail
        this.trail.unshift({ ...this.currentPos, alpha: 1.0 });
        if (this.trail.length > this.maxTrailLength) {
            this.trail.pop();
        }

        // Fade trail points
        this.trail.forEach((point, index) => {
            point.alpha = 1.0 - (index / this.maxTrailLength);
        });

        // Advance progress
        this.progress += this.speed;

        if (this.progress >= 1) {
            this.progress = 1;
            this.completed = true;
            this.alpha = 0;
            return false;
        }

        // Calculate current position with easing
        const easedProgress = this._easeOutCubic(this.progress);
        this.currentPos.x = this.startPos.x + (this.endPos.x - this.startPos.x) * easedProgress;
        this.currentPos.y = this.startPos.y + (this.endPos.y - this.startPos.y) * easedProgress;

        // Fade out near completion
        if (this.progress > 0.8) {
            this.alpha = 1.0 - ((this.progress - 0.8) / 0.2);
        }

        return true;
    }

    /**
     * Ease out cubic function for smooth animation.
     * @private
     */
    _easeOutCubic(t) {
        return 1 - Math.pow(1 - t, 3);
    }

    /**
     * Get the trail points for rendering.
     * @returns {Array} Array of trail points with position and alpha
     */
    getTrailPoints() {
        return this.trail.map((point, index) => ({
            x: point.x,
            y: point.y,
            alpha: point.alpha * this.alpha,
            size: this.width * (1 - index * 0.08)
        }));
    }

    /**
     * Get pulse head info for rendering.
     */
    getHead() {
        return {
            x: this.currentPos.x,
            y: this.currentPos.y,
            alpha: this.alpha,
            size: this.width * 1.5,
            glowSize: this.width * 3,
            color: this.color
        };
    }

    /**
     * Mark pulse as completed.
     */
    complete() {
        this.completed = true;
        this.alpha = 0;
    }
}

/**
 * NeuralPulseSystem - Manages pulse creation, animation, and rendering.
 */
class NeuralPulseSystem {
    /**
     * @param {Object} config - System configuration
     * @param {Object} config.app - PIXI Application instance (optional)
     * @param {Object} config.orchestrator - BuildingOrchestrator for position resolution
     * @param {Object} config.telemetryBus - TelemetryBus for event handling
     */
    constructor(config = {}) {
        this.config = {
            maxPulses: 100,
            defaultSpeed: 0.02,
            ...config
        };

        this.app = config.app || null;
        this.orchestrator = config.orchestrator || null;
        this.telemetryBus = config.telemetryBus || null;

        // Pulse management
        this.pulses = new Map();
        this.pulseCount = 0;

        // Graphics layer
        this.graphicsLayer = null;

        // Event type mapping
        this.eventColors = PulseColors;
        this.eventTypes = PulseEventType;

        // Connected state
        this.connected = false;
    }

    /**
     * Connect to a TelemetryBus for automatic pulse creation.
     * @param {Object} telemetryBus - TelemetryBus instance with event subscription
     */
    connectToTelemetry(telemetryBus) {
        if (!telemetryBus) {
            console.warn('NeuralPulseSystem: No TelemetryBus provided');
            return;
        }

        this.telemetryBus = telemetryBus;

        // Subscribe to neural events - prefer 'on' method
        if (typeof telemetryBus.on === 'function') {
            telemetryBus.on('neural_event', (data) => this._handleNeuralEvent(data));
            telemetryBus.on('memory_broadcast', (data) => this._handleMemoryBroadcast(data));
        } else if (typeof telemetryBus.addEventListener === 'function') {
            // Fallback: Check for addEventListener style (DOM-style)
            telemetryBus.addEventListener('neural_event', (e) => this._handleNeuralEvent(e.detail || e));
            telemetryBus.addEventListener('memory_broadcast', (e) => this._handleMemoryBroadcast(e.detail || e));
        }

        this.connected = true;
        console.log('NeuralPulseSystem connected to TelemetryBus');
    }

    /**
     * Handle neural_event from TelemetryBus.
     * Creates pulses to similar tiles based on event type.
     * @private
     */
    _handleNeuralEvent(data) {
        if (!data || !data.sourceTileId) return;

        const targetTiles = data.targetTileIds || [];
        const eventType = this._mapEventType(data.eventType);

        targetTiles.forEach(targetId => {
            this.createPulse(data.sourceTileId, targetId, eventType, {
                confidence: data.confidence || 0.8
            });
        });
    }

    /**
     * Handle memory_broadcast from TelemetryBus.
     * Creates pulses from source to all subscribers.
     * @private
     */
    _handleMemoryBroadcast(data) {
        if (!data || !data.sourceTileId) return;

        const subscribers = data.subscribers || [];
        const eventType = PulseEventType.DISTRICT_SYNC;

        subscribers.forEach(targetId => {
            this.createPulse(data.sourceTileId, targetId, eventType, {
                confidence: 1.0
            });
        });
    }

    /**
     * Map string event type to PulseEventType enum.
     * @private
     */
    _mapEventType(eventTypeStr) {
        if (!eventTypeStr) return PulseEventType.DISTRICT_SYNC;

        const upper = eventTypeStr.toUpperCase();
        if (upper.includes('CODE') || upper.includes('DISCOVERY')) {
            return PulseEventType.CODE_DISCOVERY;
        }
        if (upper.includes('RESOURCE') || upper.includes('PRESSURE')) {
            return PulseEventType.RESOURCE_PRESSURE;
        }
        if (upper.includes('SYNC') || upper.includes('DISTRICT')) {
            return PulseEventType.DISTRICT_SYNC;
        }
        return PulseEventType.DISTRICT_SYNC;
    }

    /**
     * Resolve building position from tile ID.
     * @param {string} tileId - Tile/building identifier
     * @returns {Object|null} Position {x, y} or null if not found
     */
    resolvePosition(tileId) {
        // Try orchestrator first
        if (this.orchestrator && typeof this.orchestrator.getBuilding === 'function') {
            const building = this.orchestrator.getBuilding(tileId);
            if (building) {
                return {
                    x: building.x + (building.width || 64) / 2,
                    y: building.y + (building.height || 64) / 2
                };
            }
        }

        // Fallback to position resolver function if set
        if (typeof this.positionResolver === 'function') {
            return this.positionResolver(tileId);
        }

        return null;
    }

    /**
     * Set a custom position resolver function.
     * @param {Function} resolver - Function that takes tileId and returns {x, y}
     */
    setPositionResolver(resolver) {
        this.positionResolver = resolver;
    }

    /**
     * Create a new pulse between two tiles.
     * @param {string} fromTileId - Source tile ID
     * @param {string} toTileId - Target tile ID
     * @param {string} eventType - Event type (CODE_DISCOVERY, RESOURCE_PRESSURE, DISTRICT_SYNC)
     * @param {Object} options - Additional options (confidence, speed)
     * @returns {NeuralPulse|null} Created pulse or null if positions couldn't be resolved
     */
    createPulse(fromTileId, toTileId, eventType, options = {}) {
        // Limit active pulses
        if (this.pulses.size >= this.config.maxPulses) {
            this._cleanupCompletedPulses();
            if (this.pulses.size >= this.config.maxPulses) {
                console.warn('NeuralPulseSystem: Max pulses reached');
                return null;
            }
        }

        // Resolve positions
        const startPos = this.resolvePosition(fromTileId);
        const endPos = this.resolvePosition(toTileId);

        if (!startPos || !endPos) {
            console.warn(`NeuralPulseSystem: Could not resolve positions for ${fromTileId} -> ${toTileId}`);
            return null;
        }

        // Create pulse
        const pulse = new NeuralPulse({
            id: `pulse-${++this.pulseCount}`,
            fromTileId,
            toTileId,
            eventType: eventType || PulseEventType.DISTRICT_SYNC,
            startPos,
            endPos,
            confidence: options.confidence || 1.0,
            speed: options.speed || this.config.defaultSpeed
        });

        this.pulses.set(pulse.id, pulse);

        // Initialize graphics if PIXI available
        if (typeof PIXI !== 'undefined' && this.app) {
            this._initPulseGraphics(pulse);
        }

        return pulse;
    }

    /**
     * Initialize PIXI graphics for a pulse.
     * @private
     */
    _initPulseGraphics(pulse) {
        if (!this.graphicsLayer) {
            this.graphicsLayer = new PIXI.Container();
            this.app.stage.addChild(this.graphicsLayer);
        }

        pulse.graphics = new PIXI.Graphics();
        this.graphicsLayer.addChild(pulse.graphics);
    }

    /**
     * Update all active pulses.
     * @param {number} deltaTime - Time since last update in ms
     */
    update(deltaTime) {
        const completedIds = [];

        this.pulses.forEach((pulse, id) => {
            const isActive = pulse.update(deltaTime);

            // Render if PIXI available
            if (pulse.graphics && typeof PIXI !== 'undefined') {
                this._renderPulse(pulse);
            }

            if (!isActive) {
                completedIds.push(id);
            }
        });

        // Cleanup completed pulses
        completedIds.forEach(id => {
            this.removePulse(id);
        });
    }

    /**
     * Render a pulse using PIXI Graphics.
     * @private
     */
    _renderPulse(pulse) {
        const g = pulse.graphics;
        g.clear();

        if (pulse.completed) return;

        const color = pulse.color;

        // Draw trail (fading gradient effect)
        const trailPoints = pulse.getTrailPoints();
        if (trailPoints.length > 1) {
            for (let i = 1; i < trailPoints.length; i++) {
                const point = trailPoints[i];
                const prevPoint = trailPoints[i - 1];

                g.lineStyle(point.size, color.hex, point.alpha * 0.5);
                g.moveTo(prevPoint.x, prevPoint.y);
                g.lineTo(point.x, point.y);
            }
        }

        // Draw pulse head with glow
        const head = pulse.getHead();

        // Outer glow
        g.beginFill(color.hex, head.alpha * 0.3);
        g.drawCircle(head.x, head.y, head.glowSize);
        g.endFill();

        // Inner bright dot
        g.beginFill(color.hex, head.alpha);
        g.drawCircle(head.x, head.y, head.size);
        g.endFill();

        // White hot center
        g.beginFill(0xFFFFFF, head.alpha * 0.8);
        g.drawCircle(head.x, head.y, head.size * 0.4);
        g.endFill();
    }

    /**
     * Remove a pulse by ID.
     * @param {string} pulseId - Pulse ID to remove
     */
    removePulse(pulseId) {
        const pulse = this.pulses.get(pulseId);
        if (pulse) {
            // Cleanup graphics
            if (pulse.graphics) {
                pulse.graphics.destroy();
            }
            this.pulses.delete(pulseId);
        }
    }

    /**
     * Remove all completed pulses.
     * @private
     */
    _cleanupCompletedPulses() {
        const completedIds = [];
        this.pulses.forEach((pulse, id) => {
            if (pulse.completed) {
                completedIds.push(id);
            }
        });
        completedIds.forEach(id => this.removePulse(id));
    }

    /**
     * Clear all pulses.
     */
    clearAll() {
        this.pulses.forEach((pulse, id) => {
            this.removePulse(id);
        });
        this.pulses.clear();
    }

    /**
     * Get active pulse count.
     * @returns {number} Number of active pulses
     */
    getActiveCount() {
        return this.pulses.size;
    }

    /**
     * Get pulse by ID.
     * @param {string} pulseId - Pulse ID
     * @returns {NeuralPulse|undefined}
     */
    getPulse(pulseId) {
        return this.pulses.get(pulseId);
    }

    /**
     * Get all active pulses.
     * @returns {Map} Map of pulse ID to NeuralPulse
     */
    getAllPulses() {
        return this.pulses;
    }

    /**
     * Get color for event type.
     * @param {string} eventType - Event type string
     * @returns {Object} Color object with r, g, b, hex properties
     */
    getColorForEvent(eventType) {
        return this.eventColors[eventType] || this.eventColors[PulseEventType.DISTRICT_SYNC];
    }

    /**
     * Destroy the pulse system and cleanup resources.
     */
    destroy() {
        this.clearAll();
        if (this.graphicsLayer) {
            this.graphicsLayer.destroy();
            this.graphicsLayer = null;
        }
        this.connected = false;
    }
}

// Export for browser environment
if (typeof window !== 'undefined') {
    window.NeuralPulseSystem = NeuralPulseSystem;
    window.NeuralPulse = NeuralPulse;
    window.PulseEventType = PulseEventType;
    window.PulseColors = PulseColors;
}

// Export for CommonJS (Node.js) environment
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        NeuralPulseSystem,
        NeuralPulse,
        PulseEventType,
        PulseColors
    };
}

// Export for ES modules
if (typeof exports !== 'undefined') {
    exports.NeuralPulseSystem = NeuralPulseSystem;
    exports.NeuralPulse = NeuralPulse;
    exports.PulseEventType = PulseEventType;
    exports.PulseColors = PulseColors;
}
