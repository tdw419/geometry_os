/**
 * InteractiveAnalysis - Click-based interactive analysis for neural heatmaps
 *
 * Part of: Neural Heatmap Phase 2.1.2 - Enhanced Visualization Modes
 * @see docs/plans/2026-02-07-neural-heatmap-phase-2-1-2-enhanced-modes.md
 *
 * Features:
 * - Click-to-zoom on specific regions
 * - Multi-region selection and comparison (up to 5 regions)
 * - Activity tracing through time with temporal history
 * - Cross-model token alignment visualization
 * - Event handling for user interaction
 */

class InteractiveAnalysis {
    constructor(options = {}) {
        this.options = {
            zoomLevel: 2.0,
            maxZoom: 4.0,
            minZoom: 1.0,
            selectionColor: 0x00FFFF,
            showTraces: true,
            traceDuration: 2000, // ms
            maxSelectedRegions: 5, // Phase 2.1.2: Multi-region selection
            selectionRadius: 30, // Phase 2.1.2: Selection radius for regions
            maxHistorySize: 100, // Phase 2.1.2: Max temporal history samples
            ...options
        };

        // Current zoom state
        this.zoomLevel = 1.0;
        this.zoomCenter = { x: 0, y: 0 };
        this.isZoomed = false;

        // Selection state - Phase 2.1.2: Enhanced multi-region selection
        this.selection = null;
        this.selectedRegions = []; // Array of region objects
        this.selectionHistory = [];
        this.selectionColors = [0xFFFF00, 0xFF00FF, 0x00FFFF, 0xFF8800, 0x00FF88];

        // Activity traces - Phase 2.1.2: Enhanced temporal tracking
        this.traces = new Map();
        this.traceAnimations = new Map();
        this.activityHistory = new Map(); // regionId -> Array of {timestamp, activity}
        this.traceUpdateInterval = 100; // ms
        this.lastTraceUpdate = 0;

        // Event handlers
        this.onSelectionCallback = null;
        this.onZoomCallback = null;

        console.log('[InteractiveAnalysis] Initialized');
    }

    /**
     * Enable interactive mode on a container
     * @param {PIXI.Container} container - Container to enable interaction on
     * @param {NeuralHeatmapOverlay} heatmap - Associated heatmap
     */
    enable(container, heatmap) {
        if (!container) {
            console.error('[InteractiveAnalysis] Container required');
            return;
        }

        this.container = container;
        this.heatmap = heatmap;

        // Enable pointer events
        container.eventMode = 'static';
        container.cursor = 'crosshair';

        // Set up hit area
        if (this.container.hitArea) {
            // Use existing hit area
        } else {
            this.container.hitArea = new PIXI.Rectangle(
                -10000, -10000, 20000, 20000
            );
        }

        // Wire up event handlers
        this._setupEventHandlers();

        console.log('[InteractiveAnalysis] Interactive mode enabled');
    }

    /**
     * Set up event handlers
     * @private
     */
    _setupEventHandlers() {
        // Click to select/zoom
        this.container.on('pointerdown', (event) => {
            this._handlePointerDown(event);
        });

        // Double-click to reset zoom
        this.container.on('dblclick', (event) => {
            this._handleDoubleClick(event);
        });

        // Pointer move for traces
        this.container.on('pointermove', (event) => {
            this._handlePointerMove(event);
        });

        // Wheel for zoom
        this.container.on('wheel', (event) => {
            this._handleWheel(event);
        });
    }

    /**
     * Handle pointer down (click)
     * Phase 2.1.2: Enhanced with multi-region selection support
     * @private
     */
    _handlePointerDown(event) {
        const position = event.data.global;

        // Check if clicking on existing selection (toggle) - Phase 2.1.2
        const clickedRegionIndex = this.selectedRegions.findIndex(
            region => this._isPointInRegion(position.x, position.y, region)
        );

        if (clickedRegionIndex !== -1) {
            // Remove selection (toggle off)
            const removed = this.selectedRegions.splice(clickedRegionIndex, 1)[0];
            this.activityHistory.delete(removed.id);
            this._drawSelectionIndicators();
            return;
        }

        // Find tile at position
        const tile = this._getTileAtPosition(position);
        if (!tile) return;

        if (this.isZoomed) {
            // Phase 2.1.2: Multi-region selection
            if (this.selectedRegions.length < this.options.maxSelectedRegions) {
                this._addRegionSelection(tile, position);
            } else {
                console.warn('[InteractiveAnalysis] Max selections reached');
            }
        } else {
            // Otherwise, zoom in on region
            this._zoomToRegion(tile, position);
        }
    }

    /**
     * Check if point is within a region - Phase 2.1.2
     * @private
     */
    _isPointInRegion(x, y, region) {
        if (!region) return false;
        const dx = x - region.x;
        const dy = y - region.y;
        const distance = Math.sqrt(dx * dx + dy * dy);
        return distance <= (region.radius || this.options.selectionRadius);
    }

    /**
     * Add a region selection - Phase 2.1.2
     * @private
     */
    _addRegionSelection(tile, position) {
        const regionId = `region_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        const colorIndex = this.selectedRegions.length % this.selectionColors.length;

        const region = {
            id: regionId,
            tile,
            x: position.x,
            y: position.y,
            radius: this.options.selectionRadius,
            color: this.selectionColors[colorIndex],
            createdAt: performance.now()
        };

        this.selectedRegions.push(region);

        // Initialize activity history for this region
        this.activityHistory.set(regionId, []);

        // Show selection indicator
        this._drawSelectionIndicators();

        // Notify callback
        if (this.onSelectionCallback) {
            this.onSelectionCallback({
                type: 'region-selected',
                region,
                allRegions: this.selectedRegions
            });
        }

        console.log('[InteractiveAnalysis] Region selected:', regionId);
    }

    /**
     * Draw all selection indicators - Phase 2.1.2
     * @private
     */
    _drawSelectionIndicators() {
        if (!this.container) return;

        // Remove existing indicators
        const existing = this.container.getChildByName('multiSelectionIndicator');
        if (existing) {
            this.container.removeChild(existing);
            existing.destroy();
        }

        if (this.selectedRegions.length === 0) return;

        // Create new indicator container
        const indicator = new PIXI.Container();
        indicator.name = 'multiSelectionIndicator';

        // Draw each region
        this.selectedRegions.forEach((region, index) => {
            const graphics = new PIXI.Graphics();

            // Draw selection circle
            graphics.lineStyle(2, region.color, 0.8);
            graphics.drawCircle(region.x, region.y, region.radius);

            // Draw filled semi-transparent overlay
            graphics.beginFill(region.color, 0.2);
            graphics.drawCircle(region.x, region.y, region.radius);
            graphics.endFill();

            // Draw label number
            const label = new PIXI.Text(`${index + 1}`, {
                fontFamily: 'Arial, sans-serif',
                fontSize: 14,
                fontWeight: 'bold',
                fill: region.color
            });
            label.x = region.x - 5;
            label.y = region.y - 7;

            indicator.addChild(graphics);
            indicator.addChild(label);
        });

        this.container.addChild(indicator);
    }

    /**
     * Handle double click
     * @private
     */
    _handleDoubleClick(event) {
        this.resetZoom();
    }

    /**
     * Handle pointer move
     * @private
     */
    _handlePointerMove(event) {
        const position = event.data.global;

        // Show activity trace if enabled
        if (this.options.showTraces && this.heatmap?.multiModelTracker) {
            this._showActivityTrace(position);
        }
    }

    /**
     * Handle wheel for zoom
     * @private
     */
    _handleWheel(event) {
        event.preventDefault();

        const delta = event.deltaY;
        const zoomFactor = delta > 0 ? 0.9 : 1.1;

        this.zoom(zoomFactor);
    }

    /**
     * Zoom to a specific region
     * @param {Object} tile - Tile to zoom to
     * @param {Object} position - Click position
     */
    _zoomToRegion(tile, position) {
        if (!tile.sprite) return;

        this.isZoomed = true;
        this.zoomCenter = { x: tile.sprite.x, y: tile.sprite.y };

        // Animate zoom
        this._animateZoom(this.options.zoomLevel);

        // Notify callback
        if (this.onZoomCallback) {
            this.onZoomCallback({
                type: 'zoom',
                center: this.zoomCenter,
                level: this.zoomLevel
            });
        }

        console.log('[InteractiveAnalysis] Zoomed to region:', this.zoomCenter);
    }

    /**
     * Animate zoom transition
     * @private
     */
    _animateZoom(targetLevel) {
        const startLevel = this.zoomLevel;
        const duration = 300; // ms
        const startTime = performance.now();

        const animate = () => {
            const elapsed = performance.now() - startTime;
            const progress = Math.min(elapsed / duration, 1);

            // Ease out function
            const eased = 1 - Math.pow(1 - progress, 3);

            this.zoomLevel = startLevel + (targetLevel - startLevel) * eased;

            // Apply zoom
            if (this.container) {
                this.container.scale.set(this.zoomLevel);
                this.container.pivot.set(this.zoomCenter.x, this.zoomCenter.y);
                this.container.position.set(
                    -this.zoomCenter.x * this.zoomLevel,
                    -this.zoomCenter.y * this.zoomLevel
                );
            }

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }

    /**
     * Reset zoom to default
     */
    resetZoom() {
        this.isZoomed = false;
        this.zoomLevel = 1.0;

        if (this.container) {
            this.container.scale.set(1);
            this.container.pivot.set(0, 0);
            this.container.position.set(0, 0);
        }

        console.log('[InteractiveAnalysis] Zoom reset');
    }

    /**
     * Zoom by factor
     * @param {number} factor - Zoom factor
     */
    zoom(factor) {
        const newLevel = Math.max(
            this.options.minZoom,
            Math.min(this.options.maxZoom, this.zoomLevel * factor)
        );

        if (newLevel !== this.zoomLevel) {
            this.zoomLevel = newLevel;

            if (this.isZoomed) {
                this._animateZoom(newLevel);
            } else {
                this.container.scale.set(newLevel);
            }
        }
    }

    /**
     * Select a region for detailed analysis
     * @param {Object} tile - Selected tile
     * @param {Object} position - Click position
     */
    _selectRegion(tile, position) {
        this.selection = {
            tile,
            position,
            timestamp: performance.now()
        };

        this.selectionHistory.push(this.selection);

        // Show selection indicator
        this._showSelectionIndicator(tile);

        // Notify callback
        if (this.onSelectionCallback) {
            this.onSelectionCallback(this.selection);
        }

        console.log('[InteractiveAnalysis] Region selected:', tile.attachment?.data?.name);
    }

    /**
     * Show selection indicator
     * @private
     */
    _showSelectionIndicator(tile) {
        if (!this.container) return;

        // Remove existing indicator
        const existing = this.container.getChildByName('selectionIndicator');
        if (existing) {
            this.container.removeChild(existing);
            existing.destroy();
        }

        // Create new indicator
        const indicator = new PIXI.Graphics();
        indicator.name = 'selectionIndicator';

        const bounds = tile.bounds || tile.sprite.getBounds();

        // Draw selection rectangle
        indicator.lineStyle(3, this.options.selectionColor, 0.8);
        indicator.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);

        // Add corner accents
        const cornerSize = 10;
        indicator.lineStyle(2, this.options.selectionColor, 1);

        // Top-left corner
        indicator.moveTo(bounds.x, bounds.y + cornerSize);
        indicator.lineTo(bounds.x, bounds.y);
        indicator.lineTo(bounds.x + cornerSize, bounds.y);

        // Top-right corner
        indicator.moveTo(bounds.x + bounds.width - cornerSize, bounds.y);
        indicator.lineTo(bounds.x + bounds.width, bounds.y);
        indicator.lineTo(bounds.x + bounds.width, bounds.y + cornerSize);

        // Bottom-right corner
        indicator.moveTo(bounds.x + bounds.width, bounds.y + bounds.height - cornerSize);
        indicator.lineTo(bounds.x + bounds.width, bounds.y + bounds.height);
        indicator.lineTo(bounds.x + bounds.width - cornerSize, bounds.y + bounds.height);

        // Bottom-left corner
        indicator.moveTo(bounds.x, bounds.y + bounds.height - cornerSize);
        indicator.lineTo(bounds.x, bounds.y + bounds.height);
        indicator.lineTo(bounds.x + cornerSize, bounds.y + bounds.height);

        this.container.addChild(indicator);
    }

    /**
     * Show activity trace at position
     * @private
     */
    _showActivityTrace(position) {
        if (!this.heatmap?.multiModelTracker) return;

        const models = this.heatmap.multiModelTracker.getAllModels();
        if (models.length === 0) return;

        // Get activity at position for all models
        const activities = [];
        for (const model of models) {
            const activity = this.heatmap.multiModelTracker.getModelActivityAt(
                model.id,
                position.x,
                position.y
            );
            activities.push({
                model: model.name,
                activity,
                color: model.color
            });
        }

        // Show trace if any activity
        const maxActivity = Math.max(...activities.map(a => a.activity));
        if (maxActivity > 0.1) {
            this._createTraceEffect(position, activities);
        }
    }

    /**
     * Create trace effect at position
     * @private
     */
    _createTraceEffect(position, activities) {
        const traceId = `trace_${Date.now()}_${Math.random()}`;

        // Create trace graphics
        const trace = new PIXI.Graphics();
        trace.name = traceId;

        // Draw activity indicators
        for (const activity of activities) {
            if (activity.activity > 0.1) {
                const radius = 5 + activity.activity * 10;
                trace.beginFill(activity.color, activity.activity * 0.5);
                trace.drawCircle(position.x, position.y, radius);
                trace.endFill();
            }
        }

        this.container.addChild(trace);

        // Animate and remove
        const startTime = performance.now();
        const animate = () => {
            const elapsed = performance.now() - startTime;
            const alpha = 1 - (elapsed / this.options.traceDuration);

            if (alpha <= 0) {
                // Remove trace
                this.container.removeChild(trace);
                trace.destroy();
                return;
            }

            trace.alpha = alpha;
            requestAnimationFrame(animate);
        };

        requestAnimationFrame(animate);
    }

    /**
     * Get tile at position
     * @private
     */
    _getTileAtPosition(position) {
        if (!this.heatmap) return null;

        // Check attachments
        for (const [spriteId, attachment] of this.heatmap.attachments) {
            const sprite = attachment.sprite;
            if (!sprite) continue;

            const bounds = sprite.getBounds();
            if (position.x >= bounds.x && position.x <= bounds.x + bounds.width &&
                position.y >= bounds.y && position.y <= bounds.y + bounds.height) {
                return { spriteId, sprite, attachment, bounds };
            }
        }

        return null;
    }

    /**
     * Trace activity across models
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @param {Object} startPosition - Starting position
     * @returns {Array} Traced path
     */
    traceActivity(modelId1, modelId2, startPosition) {
        if (!this.heatmap?.multiModelTracker) return [];

        const trace = [];
        const visited = new Set();

        // BFS to find connected activity
        const queue = [{ ...startPosition, depth: 0 }];
        const maxDepth = 10;

        while (queue.length > 0 && trace.length < 100) {
            const current = queue.shift();
            const key = `${current.x}_${current.y}`;

            if (visited.has(key)) continue;
            visited.add(key);

            // Get activity at this position
            const activity1 = this.heatmap.multiModelTracker.getModelActivityAt(modelId1, current.x, current.y);
            const activity2 = this.heatmap.multiModelTracker.getModelActivityAt(modelId2, current.x, current.y);

            if (activity1 > 0.1 || activity2 > 0.1) {
                trace.push({
                    x: current.x,
                    y: current.y,
                    activity1,
                    activity2,
                    depth: current.depth
                });
            }

            // Add neighbors
            if (current.depth < maxDepth) {
                const neighbors = [
                    { x: current.x + 10, y: current.y, depth: current.depth + 1 },
                    { x: current.x - 10, y: current.y, depth: current.depth + 1 },
                    { x: current.x, y: current.y + 10, depth: current.depth + 1 },
                    { x: current.x, y: current.y - 10, depth: current.depth + 1 }
                ];

                for (const neighbor of neighbors) {
                    const nKey = `${neighbor.x}_${neighbor.y}`;
                    if (!visited.has(nKey)) {
                        queue.push(neighbor);
                    }
                }
            }
        }

        return trace;
    }

    /**
     * Get aligned tokens for comparison
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @returns {Array} Aligned token pairs
     */
    getAlignedTokens(modelId1, modelId2) {
        if (!this.heatmap?.multiModelTracker) return [];

        const activities1 = this.heatmap.multiModelTracker.getModelActivity(modelId1);
        const activities2 = this.heatmap.multiModelTracker.getModelActivity(modelId2);

        // Simple alignment by position proximity
        const aligned = [];
        const used2 = new Set();

        for (const act1 of activities1) {
            let bestMatch = null;
            let bestDist = Infinity;

            for (let i = 0; i < activities2.length; i++) {
                if (used2.has(i)) continue;

                const dist = Math.sqrt(
                    Math.pow(act1.x - activities2[i].x, 2) +
                    Math.pow(act1.y - activities2[i].y, 2)
                );

                if (dist < bestDist && dist < 50) {
                    bestMatch = i;
                    bestDist = dist;
                }
            }

            if (bestMatch !== null) {
                aligned.push({
                    activity1: act1,
                    activity2: activities2[bestMatch],
                    distance: bestDist
                });
                used2.add(bestMatch);
            }
        }

        return aligned;
    }

    /**
     * Set callback for selection events
     * @param {Function} callback - Selection callback
     */
    onSelection(callback) {
        this.onSelectionCallback = callback;
    }

    /**
     * Set callback for zoom events
     * @param {Function} callback - Zoom callback
     */
    onZoom(callback) {
        this.onZoomCallback = callback;
    }

    /**
     * Clear selection
     * Phase 2.1.2: Enhanced to clear all multi-region selections
     */
    clearSelection() {
        this.selection = null;
        this.selectedRegions = [];
        this.activityHistory.clear();

        // Remove indicators
        const existing = this.container?.getChildByName('selectionIndicator');
        if (existing) {
            this.container.removeChild(existing);
            existing.destroy();
        }
        const multiExisting = this.container?.getChildByName('multiSelectionIndicator');
        if (multiExisting) {
            this.container.removeChild(multiExisting);
            multiExisting.destroy();
        }
    }

    /**
     * Update activity traces for all selected regions - Phase 2.1.2
     * @param {number} timestamp - Current timestamp
     */
    updateActivityTraces(timestamp = performance.now()) {
        // Throttle trace updates
        if (timestamp - this.lastTraceUpdate < this.traceUpdateInterval) {
            return;
        }
        this.lastTraceUpdate = timestamp;

        if (!this.heatmap?.multiModelTracker) return;

        this.selectedRegions.forEach(region => {
            const history = this.activityHistory.get(region.id) || [];

            // Sample activity from all models at this region
            const models = this.heatmap.multiModelTracker.getAllModels();
            const activityByModel = {};

            models.forEach(model => {
                const intensity = this.heatmap.multiModelTracker.getModelActivityAt(
                    model.id,
                    region.x,
                    region.y
                );
                activityByModel[model.id] = {
                    intensity,
                    color: model.color,
                    name: model.name
                };
            });

            // Add to history
            history.push({
                timestamp,
                activity: activityByModel
            });

            // Trim history
            if (history.length > this.options.maxHistorySize) {
                history.shift();
            }

            this.activityHistory.set(region.id, history);
        });
    }

    /**
     * Get activity history for a region - Phase 2.1.2
     * @param {string} regionId - Region ID
     * @returns {Array} Activity history
     */
    getActivityHistory(regionId) {
        return this.activityHistory.get(regionId) || [];
    }

    /**
     * Get all selected regions - Phase 2.1.2
     * @returns {Array} Selected regions
     */
    getSelectedRegions() {
        return [...this.selectedRegions];
    }

    /**
     * Get current state
     * @returns {Object} Current state
     */
    getState() {
        return {
            isZoomed: this.isZoomed,
            zoomLevel: this.zoomLevel,
            zoomCenter: { ...this.zoomCenter },
            selection: this.selection ? { ...this.selection } : null,
            selectionCount: this.selectionHistory.length
        };
    }

    /**
     * Destroy interactive analysis
     */
    destroy() {
        // Remove event handlers
        if (this.container) {
            this.container.off('pointerdown');
            this.container.off('dblclick');
            this.container.off('pointermove');
            this.container.off('wheel');
        }

        // Clear traces
        this.traces.clear();
        this.traceAnimations.clear();

        console.log('[InteractiveAnalysis] Destroyed');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.InteractiveAnalysis = InteractiveAnalysis;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { InteractiveAnalysis };
}
