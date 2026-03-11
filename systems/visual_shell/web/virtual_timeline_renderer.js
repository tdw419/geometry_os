/**
 * VirtualTimelineRenderer - Efficient rendering for large temporal datasets
 *
 * Implements virtual scrolling for temporal data visualization in the
 * Neural Heatmap system. Maintains constant memory usage regardless
 * of dataset size by rendering only visible time windows.
 *
 * Features:
 * - Virtual scrolling with buffer zones
 * - Dynamic point sizing based on zoom level
 * - Graphics pooling for efficient reuse
 * - Smooth scrolling with hardware acceleration
 * - Performance statistics tracking
 *
 * Part of: Neural Heatmap Phase 2.2 - Scalability & Virtualization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2.2-scalability.md
 */

class VirtualTimelineRenderer {
    /**
     * Create a new VirtualTimelineRenderer
     * @param {Object} options - Configuration options
     * @param {number} options.width - Viewport width (default: 350)
     * @param {number} options.height - Viewport height (default: 100)
     * @param {number} options.pointSize - Base point size in pixels (default: 4)
     * @param {number} options.bufferSize - Buffer zone in data points (default: 10)
     * @param {number} options.minPointSize - Minimum point size (default: 2)
     * @param {number} options.maxPointSize - Maximum point size (default: 8)
     * @param {number} options.maxVisiblePoints - Maximum points to render (default: 200)
     */
    constructor(options = {}) {
        this.options = {
            width: 350,
            height: 100,
            pointSize: 4,
            bufferSize: 10,
            minPointSize: 2,
            maxPointSize: 8,
            maxVisiblePoints: 200,
            ...options
        };

        // State
        this.scrollOffset = 0; // In data points
        this.zoom = 1.0;

        // Data
        this.timeWindows = [];
        this.dataCount = 0;

        // Rendering
        this.container = null;
        this.pointsContainer = null;
        this.viewportMask = null;
        this.scrollbar = null;

        // Graphics pooling
        this.pointPool = [];
        this.activePoints = new Map(); // key: index -> PIXI.Graphics

        // Performance tracking
        this.renderStats = {
            lastRenderTime: 0,
            visiblePointCount: 0,
            totalPointCount: 0,
            poolUtilization: 0
        };

        // Color scheme for intensity levels
        this.intensityColors = {
            low: 0x00FF00,      // Green for low
            medium: 0xFFFF00,   // Yellow for medium
            high: 0xFF0000      // Red for high
        };

        // Event handlers
        this.onPointClick = null;
        this.onPointHover = null;

        console.log('[VirtualTimelineRenderer] Initialized');
    }

    /**
     * Create the renderer UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[VirtualTimelineRenderer] PIXI not available');
            return { addChild: () => {}, visible: true };
        }

        this.container = new PIXI.Container();
        this.container.zIndex = 1000;

        // Viewport mask for clipping
        this.viewportMask = new PIXI.Graphics();
        this.viewportMask.beginFill(0xFFFFFF);
        this.viewportMask.drawRect(0, 0, this.options.width, this.options.height);
        this.viewportMask.endFill();
        this.container.addChild(this.viewportMask);

        // Scrollable content container
        this.pointsContainer = new PIXI.Container();
        this.pointsContainer.mask = this.viewportMask;
        this.container.addChild(this.pointsContainer);

        // Baseline
        this._createBaseline();

        // Scrollbar
        this._createScrollbar();

        // Make interactive
        this.container.eventMode = 'static';
        this.container.hitArea = new PIXI.Rectangle(0, 0, this.options.width, this.options.height);

        // Setup interaction
        this._setupInteraction();

        console.log('[VirtualTimelineRenderer] Created');

        return this.container;
    }

    /**
     * Create baseline
     * @private
     */
    _createBaseline() {
        const baseline = new PIXI.Graphics();
        baseline.lineStyle(1, 0x666666, 0.5);
        baseline.moveTo(0, 30);
        baseline.lineTo(this.options.width, 30);
        this.container.addChild(baseline);
    }

    /**
     * Create scrollbar
     * @private
     */
    _createScrollbar() {
        const scrollbarSize = 12;
        const scrollbarY = this.options.height - scrollbarSize;

        this.scrollbar = new PIXI.Graphics();
        this.scrollbar.y = scrollbarY;
        this.scrollbar.visible = false;
        this.container.addChild(this.scrollbar);
    }

    /**
     * Setup mouse/touch interaction for scrolling
     * @private
     */
    _setupInteraction() {
        let isDragging = false;
        let dragStart = { x: 0 };
        let scrollStart = 0;

        this.container.on('pointerdown', (event) => {
            isDragging = true;
            dragStart.x = event.global.x;
            scrollStart = this.scrollOffset;
        });

        this.container.on('pointermove', (event) => {
            if (!isDragging) return;

            const dx = event.global.x - dragStart.x;
            const pointsPerPx = this.dataCount / (this.options.width * this.zoom);

            this.scrollTo(
                scrollStart - dx * pointsPerPx
            );
        });

        this.container.on('pointerup', () => {
            isDragging = false;
        });

        this.container.on('pointerupoutside', () => {
            isDragging = false;
        });

        // Mouse wheel support
        this.container.on('wheel', (event) => {
            event.stopPropagation();
            const pointsPerPx = this.dataCount / (this.options.width * this.zoom);
            this.scrollTo(
                this.scrollOffset + event.deltaX * pointsPerPx
            );
        });
    }

    /**
     * Set temporal data
     * @param {Array} timeWindows - Array of time window data
     */
    setTimeWindows(timeWindows) {
        this.timeWindows = timeWindows || [];
        this.dataCount = this.timeWindows.length;

        // Update scrollbar
        this._updateScrollbar();

        // Initial render
        this.render();

        console.log('[VirtualTimelineRenderer] Data set:', {
            count: this.dataCount
        });
    }

    /**
     * Scroll to position
     * @param {number} offset - Scroll offset in data points
     */
    scrollTo(offset) {
        const maxOffset = Math.max(0, this.dataCount - this.options.maxVisiblePoints);
        this.scrollOffset = Math.max(0, Math.min(offset, maxOffset));

        this._updateScrollbar();
        this.render();
    }

    /**
     * Set zoom level
     * @param {number} zoom - Zoom factor (1.0 = 100%)
     */
    setZoom(zoom) {
        const clampedZoom = Math.max(0.5, Math.min(zoom, 3.0));
        this.zoom = clampedZoom;

        // Recalculate point size
        const newPointSize = this.options.pointSize * this.zoom;

        // Ensure within bounds
        if (newPointSize < this.options.minPointSize || newPointSize > this.options.maxPointSize) {
            return;
        }

        this.render();
    }

    /**
     * Render visible points
     */
    render() {
        if (!this.timeWindows.length || !this.pointsContainer) return;

        const startTime = performance.now();

        const pointSpacing = (this.options.width * this.zoom) / Math.max(this.dataCount, 1);
        const buffer = this.options.bufferSize;

        // Calculate visible range with buffer
        const startIndex = Math.floor(this.scrollOffset) - buffer;
        const endIndex = Math.ceil(this.scrollOffset + this.options.maxVisiblePoints / this.zoom) + buffer;

        // Clamp to data bounds
        const visibleStart = Math.max(0, startIndex);
        const visibleEnd = Math.min(this.dataCount, endIndex);

        // Track which points should be visible
        const visiblePoints = new Set();

        // Render points
        for (let i = visibleStart; i < visibleEnd; i++) {
            visiblePoints.add(i);

            // Get or create point
            let point = this.activePoints.get(i);
            if (!point) {
                point = this._getPooledPoint();
                this._configurePoint(point, i);
                this.activePoints.set(i, point);
                this.pointsContainer.addChild(point);
            }

            // Update position
            const x = (i - this.scrollOffset) * pointSpacing;
            const height = (this.timeWindows[i].avgIntensity / (this.timeWindows[i].maxIntensity || 1)) * 25;

            point.x = x;
            point.y = 30 - height;

            // Update visibility
            point.visible = true;
        }

        // Hide and pool invisible points
        for (const [index, point] of this.activePoints) {
            if (!visiblePoints.has(index)) {
                point.visible = false;
                this._returnPointToPool(point);
                this.activePoints.delete(index);
                this.pointsContainer.removeChild(point);
            }
        }

        // Update stats
        this.renderStats.lastRenderTime = performance.now() - startTime;
        this.renderStats.visiblePointCount = visiblePoints.size;
        this.renderStats.totalPointCount = this.dataCount;
        this.renderStats.poolUtilization = this.pointPool.length / (this.activePoints.size + this.pointPool.length);
    }

    /**
     * Get a point from the pool or create new one
     * @private
     */
    _getPooledPoint() {
        if (this.pointPool.length > 0) {
            return this.pointPool.pop();
        }

        const point = new PIXI.Graphics();
        point.eventMode = 'static';
        point.cursor = 'pointer';

        // Add interaction
        point.on('click', (event) => {
            if (this.onPointClick && point.pointData) {
                this.onPointClick(point.pointData, event);
            }
        });

        point.on('pointerover', () => {
            if (this.onPointHover && point.pointData) {
                this.onPointHover(point.pointData);
            }
        });

        return point;
    }

    /**
     * Return a point to the pool
     * @private
     */
    _returnPointToPool(point) {
        if (this.pointPool.length < 500) { // Limit pool size
            this.pointPool.push(point);
        } else {
            point.destroy();
        }
    }

    /**
     * Configure point appearance
     * @private
     */
    _configurePoint(point, index) {
        const data = this.timeWindows[index];
        const intensity = data.avgIntensity || 0;
        const color = this._intensityToColor(intensity);
        const pointSize = this.options.pointSize * this.zoom;

        // Clear and redraw
        point.clear();
        point.beginFill(color, 0.8);
        point.drawCircle(0, 0, pointSize);
        point.endFill();

        // Store data for interaction
        point.pointData = {
            index,
            intensity,
            avgIntensity: data.avgIntensity,
            maxIntensity: data.maxIntensity,
            timestamp: data.timestamp
        };
    }

    /**
     * Update scrollbar appearance
     * @private
     */
    _updateScrollbar() {
        const scrollbarSize = 12;
        const visibleRatio = Math.min(1, this.options.maxVisiblePoints / this.dataCount);

        if (visibleRatio < 1) {
            this.scrollbar.clear();
            this.scrollbar.beginFill(0x333333, 0.8);
            this.scrollbar.lineStyle(1, 0x00FFFF, 0.5);
            this.scrollbar.drawRect(0, 0, this.options.width, scrollbarSize);
            this.scrollbar.endFill();

            const thumbWidth = Math.max(20, this.options.width * visibleRatio);
            const thumbX = (this.scrollOffset / this.dataCount) * this.options.width;

            this.scrollbar.beginFill(0x00FFFF, 0.6);
            this.scrollbar.drawRect(thumbX, 2, thumbWidth, scrollbarSize - 4);
            this.scrollbar.endFill();

            this.scrollbar.visible = true;
        } else {
            this.scrollbar.visible = false;
        }
    }

    /**
     * Convert intensity to color
     * @private
     */
    _intensityToColor(intensity) {
        // Green for low, yellow for medium, red for high
        if (intensity < 0.3) {
            return this.intensityColors.low;
        } else if (intensity < 0.7) {
            return this.intensityColors.medium;
        } else {
            return this.intensityColors.high;
        }
    }

    /**
     * Get rendering statistics
     * @returns {Object} Performance statistics
     */
    getStats() {
        return {
            ...this.renderStats,
            scrollOffset: this.scrollOffset,
            zoom: this.zoom,
            activePoints: this.activePoints.size,
            pooledPoints: this.pointPool.length
        };
    }

    /**
     * Destroy the renderer and cleanup resources
     */
    destroy() {
        // Destroy all points
        for (const point of this.activePoints.values()) {
            point.destroy();
        }
        this.activePoints.clear();

        // Destroy pooled points
        for (const point of this.pointPool) {
            point.destroy();
        }
        this.pointPool = [];

        // Destroy containers
        if (this.container) {
            this.container.destroy();
            this.container = null;
        }

        this.timeWindows = [];
        this.dataCount = 0;

        console.log('[VirtualTimelineRenderer] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.VirtualTimelineRenderer = VirtualTimelineRenderer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VirtualTimelineRenderer };
}
