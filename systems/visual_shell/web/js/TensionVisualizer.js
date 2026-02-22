/**
 * TensionVisualizer - Renders tension lines and anchor tethers.
 *
 * Phase 28: Tectonic Realignment
 * Visualizes the force-directed graph connections.
 */
class TensionVisualizer {
    constructor(config = {}) {
        this.container = config.container || (typeof PIXI !== 'undefined' ? new PIXI.Container() : null);
        this.app = config.app || null;

        // Tension lines: "id1-id2" -> { graphics, fromPos, toPos, magnitude }
        this.tensionLines = new Map();

        // Anchor tethers: buildingId -> graphics
        this.anchorTethers = new Map();

        // Configuration
        this.maxAlpha = 0.6;
        this.tetherColor = 0x00ffff; // Cyan for anchor tethers
        this.tensionColor = 0xff00ff; // Magenta for tension
    }

    /**
     * Render a tension line between two positions.
     */
    renderTension(id1, id2, fromPos, toPos, magnitude) {
        const key = this._makeKey(id1, id2);

        // Remove existing if any
        this.removeTension(id1, id2);

        if (!this.container) return null;

        const graphics = typeof PIXI !== 'undefined' ? new PIXI.Graphics() : { name: key };
        graphics.name = key;

        // Alpha based on magnitude (0-1 normalized)
        const alpha = Math.min(this.maxAlpha, magnitude / 10);

        // Draw line
        if (graphics.moveTo && graphics.lineTo && graphics.stroke) {
            graphics.moveTo(fromPos.x, fromPos.y);
            graphics.lineTo(toPos.x, toPos.y);
            graphics.stroke({ color: this.tensionColor, width: 1, alpha });
        }

        this.container.addChild(graphics);
        this.tensionLines.set(key, {
            graphics,
            fromPos: { ...fromPos },
            toPos: { ...toPos },
            magnitude
        });

        return graphics;
    }

    /**
     * Remove a tension line.
     */
    removeTension(id1, id2) {
        const key = this._makeKey(id1, id2);
        const line = this.tensionLines.get(key);

        if (line) {
            if (this.container && line.graphics) {
                this.container.removeChild(line.graphics);
                if (line.graphics.destroy) {
                    line.graphics.destroy();
                }
            }
            this.tensionLines.delete(key);
        }
    }

    /**
     * Render an anchor tether (dashed line to district center).
     */
    renderAnchorTether(buildingId, buildingPos, anchorPos) {
        // Remove existing
        this.removeAnchorTether(buildingId);

        if (!this.container) return null;

        // Calculate distance - if far, show tether
        const dx = buildingPos.x - anchorPos.x;
        const dy = buildingPos.y - anchorPos.y;
        const distance = Math.sqrt(dx*dx + dy*dy);

        // Only show if drifting significantly
        if (distance < 50) return null;

        const graphics = typeof PIXI !== 'undefined' ? new PIXI.Graphics() : {};
        graphics.name = `tether-${buildingId}`;

        // Draw dashed line
        const segments = 10;
        const segLen = distance / (segments * 2);

        if (graphics.moveTo && graphics.lineTo && graphics.stroke) {
            for (let i = 0; i < segments; i++) {
                const t1 = (i * 2) / (segments * 2);
                const t2 = (i * 2 + 1) / (segments * 2);

                const x1 = anchorPos.x + (buildingPos.x - anchorPos.x) * t1;
                const y1 = anchorPos.y + (buildingPos.y - anchorPos.y) * t1;
                const x2 = anchorPos.x + (buildingPos.x - anchorPos.x) * t2;
                const y2 = anchorPos.y + (buildingPos.y - anchorPos.y) * t2;

                graphics.moveTo(x1, y1);
                graphics.lineTo(x2, y2);
            }

            graphics.stroke({ color: this.tetherColor, width: 1, alpha: 0.3 });
        }

        this.container.addChild(graphics);
        this.anchorTethers.set(buildingId, graphics);

        return graphics;
    }

    /**
     * Remove an anchor tether.
     */
    removeAnchorTether(buildingId) {
        const tether = this.anchorTethers.get(buildingId);

        if (tether) {
            if (this.container && tether) {
                this.container.removeChild(tether);
                if (tether.destroy) {
                    tether.destroy();
                }
            }
            this.anchorTethers.delete(buildingId);
        }
    }

    /**
     * Update all visualizations from drift data.
     */
    updateFromDrifts(drifts) {
        // Clear old visualizations
        this.clear();
    }

    /**
     * Clear all visualizations.
     */
    clear() {
        const keys = Array.from(this.tensionLines.keys());
        for (const key of keys) {
            const [id1, id2] = key.split('-');
            this.removeTension(id1, id2);
        }

        const tetherIds = Array.from(this.anchorTethers.keys());
        for (const id of tetherIds) {
            this.removeAnchorTether(id);
        }
    }

    /**
     * Make consistent key for tension line.
     */
    _makeKey(id1, id2) {
        const min = (a, b) => a < b ? a : b;
        const max = (a, b) => a > b ? a : b;
        return `${min(id1, id2)}-${max(id1, id2)}`;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.TensionVisualizer = TensionVisualizer;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = TensionVisualizer;
}
