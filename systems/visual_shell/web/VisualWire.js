/**
 * Geometry OS: Visual Wire
 *
 * A "Wire" is a visual connection between buildings that represents
 * data flow in the visual computation substrate.
 *
 * Architecture:
 * - Bezier curves connecting output port to input port
 * - Animated particles showing data flow direction
 * - Integration with Neural Event Bus for state sync
 * - Supports multiple data types (i32, f32, ptr)
 *
 * Epoch 2: Tectonic Architecture
 */

export class VisualWire {
    /**
     * @param {Object} config - Wire configuration
     * @param {string} config.id - Unique wire identifier
     * @param {Object} config.sourceBuilding - Source building
     * @param {Object} config.sourcePort - Source port
     * @param {Object} config.targetBuilding - Target building
     * @param {Object} config.targetPort - Target port
     * @param {string} config.dataType - Data type (i32, f32, ptr)
     */
    constructor(config) {
        this.id = config.id || `wire_${Date.now()}`;
        this.sourceBuilding = config.sourceBuilding;
        this.sourcePort = config.sourcePort;
        this.targetBuilding = config.targetBuilding;
        this.targetPort = config.targetPort;
        this.dataType = config.dataType || 'i32';

        // State
        this.active = false;
        this.dataFlow = 0; // Amount of data flowing
        this.lastTransfer = null;

        // Visual elements
        this.graphics = null; // PIXI.Graphics
        this.particles = []; // Animated particles
        this.particleContainer = null;

        // Animation
        this.animationSpeed = 0.02;
        this.particleCount = 5;

        // Event handlers
        this.onDataTransfer = null;
    }

    // ============================================
    // WIRE OPERATIONS
    // ============================================

    /**
     * Activate wire (data flowing).
     * @param {*} data - Data being transferred
     */
    activate(data) {
        this.active = true;
        this.dataFlow++;
        this.lastTransfer = {
            timestamp: Date.now(),
            data: data
        };

        // Spawn particle animation
        this._spawnParticle(data);

        // Callback
        if (this.onDataTransfer) {
            this.onDataTransfer(data);
        }
    }

    /**
     * Deactivate wire.
     */
    deactivate() {
        this.active = false;
    }

    /**
     * Get wire path points.
     * @returns {Array} Array of {x, y} points forming the path
     */
    getPath() {
        const start = this.sourceBuilding.getPortPosition(this.sourcePort);
        const end = this.targetBuilding.getPortPosition(this.targetPort);

        // Calculate control points for Bezier curve
        const midX = (start.x + end.x) / 2;
        const midY = (start.y + end.y) / 2;

        // Add offset based on port sides
        const offset = Math.abs(end.x - start.x) * 0.3;

        let cp1, cp2;

        if (this.sourcePort.side === 'right') {
            cp1 = { x: start.x + offset, y: start.y };
        } else if (this.sourcePort.side === 'left') {
            cp1 = { x: start.x - offset, y: start.y };
        } else {
            cp1 = { x: start.x, y: start.y + (this.sourcePort.side === 'bottom' ? offset : -offset) };
        }

        if (this.targetPort.side === 'left') {
            cp2 = { x: end.x - offset, y: end.y };
        } else if (this.targetPort.side === 'right') {
            cp2 = { x: end.x + offset, y: end.y };
        } else {
            cp2 = { x: end.x, y: end.y + (this.targetPort.side === 'top' ? -offset : offset) };
        }

        return { start, cp1, cp2, end };
    }

    /**
     * Get point along wire path at parameter t.
     * @param {number} t - Parameter (0 to 1)
     * @returns {Object} {x, y} point
     */
    getPointAt(t) {
        const { start, cp1, cp2, end } = this.getPath();

        // Cubic Bezier formula
        const t2 = t * t;
        const t3 = t2 * t;
        const mt = 1 - t;
        const mt2 = mt * mt;
        const mt3 = mt2 * mt;

        return {
            x: mt3 * start.x + 3 * mt2 * t * cp1.x + 3 * mt * t2 * cp2.x + t3 * end.x,
            y: mt3 * start.y + 3 * mt2 * t * cp1.y + 3 * mt * t2 * cp2.y + t3 * end.y
        };
    }

    // ============================================
    // VISUAL RENDERING
    // ============================================

    /**
     * Create visual representation.
     * @param {PIXI.Container} parent - Parent container
     * @param {number} tileSize - Tile size for scaling
     */
    createVisual(parent, tileSize = 16) {
        this.graphics = new PIXI.Graphics();
        this.particleContainer = new PIXI.Container();

        this._drawWire(tileSize);

        parent.addChild(this.graphics);
        parent.addChild(this.particleContainer);

        return this.graphics;
    }

    /**
     * Draw the wire path.
     */
    _drawWire(tileSize) {
        const { start, cp1, cp2, end } = this.getPath();

        this.graphics.clear();

        // Draw glow (active state)
        if (this.active) {
            this.graphics.lineStyle(6, this._getColor(), 0.3);
            this.graphics.moveTo(start.x * tileSize, start.y * tileSize);
            this.graphics.bezierCurveTo(
                cp1.x * tileSize, cp1.y * tileSize,
                cp2.x * tileSize, cp2.y * tileSize,
                end.x * tileSize, end.y * tileSize
            );
        }

        // Draw main line
        const alpha = this.active ? 1.0 : 0.6;
        this.graphics.lineStyle(2, this._getColor(), alpha);
        this.graphics.moveTo(start.x * tileSize, start.y * tileSize);
        this.graphics.bezierCurveTo(
            cp1.x * tileSize, cp1.y * tileSize,
            cp2.x * tileSize, cp2.y * tileSize,
            end.x * tileSize, end.y * tileSize
        );

        // Draw arrow at end
        this._drawArrow(end, cp2, tileSize);
    }

    /**
     * Draw arrow at wire end.
     */
    _drawArrow(end, cp2, tileSize) {
        const angle = Math.atan2(end.y - cp2.y, end.x - cp2.x);
        const arrowSize = 6;

        this.graphics.beginFill(this._getColor(), 0.8);

        const tipX = end.x * tileSize;
        const tipY = end.y * tileSize;

        this.graphics.moveTo(tipX, tipY);
        this.graphics.lineTo(
            tipX - arrowSize * Math.cos(angle - 0.4),
            tipY - arrowSize * Math.sin(angle - 0.4)
        );
        this.graphics.lineTo(
            tipX - arrowSize * Math.cos(angle + 0.4),
            tipY - arrowSize * Math.sin(angle + 0.4)
        );
        this.graphics.closePath();
        this.graphics.endFill();
    }

    /**
     * Get color based on data type.
     */
    _getColor() {
        const colors = {
            i32: 0x00FF88,  // Green for integers
            f32: 0x88FF00,  // Yellow-green for floats
            ptr: 0xFF88FF,  // Pink for pointers
            default: 0x4488FF // Blue default
        };
        return colors[this.dataType] || colors.default;
    }

    // ============================================
    // PARTICLE ANIMATION
    // ============================================

    /**
     * Spawn a data particle.
     */
    _spawnParticle(data) {
        if (!this.particleContainer) return;

        const particle = new PIXI.Graphics();
        particle.beginFill(this._getColor(), 0.9);
        particle.drawCircle(0, 0, 4);
        particle.endFill();

        particle.t = 0;
        particle.data = data;
        particle.tileSize = 16;

        this.particleContainer.addChild(particle);
        this.particles.push(particle);
    }

    /**
     * Update particle animations.
     * @param {number} deltaTime - Time since last update
     */
    update(deltaTime) {
        // Update wire visual
        if (this.graphics) {
            this._drawWire(16);
        }

        // Update particles
        for (let i = this.particles.length - 1; i >= 0; i--) {
            const particle = this.particles[i];
            particle.t += this.animationSpeed;

            if (particle.t >= 1) {
                // Particle reached destination
                this.particleContainer.removeChild(particle);
                this.particles.splice(i, 1);
                particle.destroy();
            } else {
                // Update position
                const pos = this.getPointAt(particle.t);
                particle.position.set(pos.x * particle.tileSize, pos.y * particle.tileSize);
            }
        }
    }

    /**
     * Check if wire has active particles.
     */
    hasActiveParticles() {
        return this.particles.length > 0;
    }

    // ============================================
    // SERIALIZATION
    // ============================================

    /**
     * Serialize wire for persistence.
     */
    serialize() {
        return {
            id: this.id,
            sourceBuildingId: this.sourceBuilding?.id,
            sourcePortName: this.sourcePort?.name,
            targetBuildingId: this.targetBuilding?.id,
            targetPortName: this.targetPort?.name,
            dataType: this.dataType,
            dataFlow: this.dataFlow
        };
    }

    /**
     * Destroy visual elements.
     */
    destroy() {
        if (this.graphics) {
            this.graphics.destroy();
            this.graphics = null;
        }

        if (this.particleContainer) {
            this.particleContainer.destroy({ children: true });
            this.particleContainer = null;
        }

        this.particles = [];
    }
}

// ============================================
// WIRE MANAGER
// ============================================

export class WireManager {
    constructor() {
        this.wires = new Map();
        this.graphicsLayer = null;
    }

    /**
     * Set the graphics layer for wire rendering.
     * @param {PIXI.Container} layer - Container for wire graphics
     */
    setGraphicsLayer(layer) {
        this.graphicsLayer = layer;
    }

    /**
     * Connect two buildings.
     * @param {Object} sourceBuilding - Source building
     * @param {string} sourcePortName - Source port name
     * @param {Object} targetBuilding - Target building
     * @param {string} targetPortName - Target port name
     * @param {string} dataType - Data type
     * @returns {VisualWire} Created wire
     */
    connect(sourceBuilding, sourcePortName, targetBuilding, targetPortName, dataType = 'i32') {
        const sourcePort = sourceBuilding.outputPorts.find(p => p.name === sourcePortName);
        const targetPort = targetBuilding.inputPorts.find(p => p.name === targetPortName);

        if (!sourcePort) {
            throw new Error(`Source port '${sourcePortName}' not found on building ${sourceBuilding.id}`);
        }
        if (!targetPort) {
            throw new Error(`Target port '${targetPortName}' not found on building ${targetBuilding.id}`);
        }

        const wire = new VisualWire({
            id: `wire_${sourceBuilding.id}_${sourcePortName}_${targetBuilding.id}_${targetPortName}`,
            sourceBuilding,
            sourcePort,
            targetBuilding,
            targetPort,
            dataType
        });

        // Create visual if layer exists
        if (this.graphicsLayer) {
            wire.createVisual(this.graphicsLayer);
        }

        // Register
        this.wires.set(wire.id, wire);

        // Update port connections
        sourcePort.connected = true;
        sourcePort.wire = wire;
        targetPort.connected = true;
        targetPort.wire = wire;

        // Track in buildings
        sourceBuilding.outgoingWires.push(wire);
        targetBuilding.incomingWires.push(wire);

        return wire;
    }

    /**
     * Disconnect a wire.
     * @param {string} wireId - Wire ID to disconnect
     */
    disconnect(wireId) {
        const wire = this.wires.get(wireId);
        if (!wire) return;

        // Update port connections
        if (wire.sourcePort) {
            wire.sourcePort.connected = false;
            wire.sourcePort.wire = null;
        }
        if (wire.targetPort) {
            wire.targetPort.connected = false;
            wire.targetPort.wire = null;
        }

        // Remove from buildings
        if (wire.sourceBuilding) {
            wire.sourceBuilding.outgoingWires =
                wire.sourceBuilding.outgoingWires.filter(w => w.id !== wireId);
        }
        if (wire.targetBuilding) {
            wire.targetBuilding.incomingWires =
                wire.targetBuilding.incomingWires.filter(w => w.id !== wireId);
        }

        // Destroy visual
        wire.destroy();

        // Remove
        this.wires.delete(wireId);
    }

    /**
     * Get wire by ID.
     */
    getWire(wireId) {
        return this.wires.get(wireId);
    }

    /**
     * Get all wires.
     */
    getAllWires() {
        return Array.from(this.wires.values());
    }

    /**
     * Update all wire animations.
     */
    update(deltaTime) {
        for (const wire of this.wires.values()) {
            wire.update(deltaTime);
        }
    }

    /**
     * Transfer data through a wire.
     * @param {string} wireId - Wire ID
     * @param {*} data - Data to transfer
     */
    transferData(wireId, data) {
        const wire = this.wires.get(wireId);
        if (wire) {
            wire.activate(data);
        }
    }

    /**
     * Serialize all wires.
     */
    serialize() {
        return Array.from(this.wires.values()).map(w => w.serialize());
    }

    /**
     * Destroy all wires.
     */
    destroy() {
        for (const wire of this.wires.values()) {
            wire.destroy();
        }
        this.wires.clear();
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VisualWire, WireManager };
}
