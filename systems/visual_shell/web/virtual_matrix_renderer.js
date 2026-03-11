/**
 * VirtualMatrixRenderer - Efficient rendering for large correlation matrices
 *
 * Implements lazy loading and virtual scrolling for handling large datasets
 * in the Neural Heatmap system. Maintains constant memory usage regardless
 * of dataset size by rendering only visible cells.
 *
 * Features:
 * - Virtual scrolling with buffer zones
 * - Dynamic cell sizing based on zoom level
 * - Graphics pooling for efficient reuse
 * - Pagination support for 50+ layers
 * - Smooth scrolling with hardware acceleration
 *
 * Part of: Neural Heatmap Phase 2.2 - Scalability & Virtualization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2.2-scalability.md
 */

class VirtualMatrixRenderer {
    /**
     * Create a new VirtualMatrixRenderer
     * @param {Object} options - Configuration options
     * @param {number} options.width - Viewport width (default: 400)
     * @param {number} options.height - Viewport height (default: 300)
     * @param {number} options.cellSize - Base cell size in pixels (default: 20)
     * @param {number} options.bufferSize - Buffer zone in cells (default: 2)
     * @param {number} options.minCellSize - Minimum cell size (default: 5)
     * @param {number} options.maxCellSize - Maximum cell size (default: 50)
     * @param {boolean} options.enablePagination - Enable pagination mode (default: false)
     * @param {number} options.pageSize - Page size for pagination (default: 50)
     */
    constructor(options = {}) {
        this.options = {
            width: 400,
            height: 300,
            cellSize: 20,
            bufferSize: 2,
            minCellSize: 5,
            maxCellSize: 50,
            enablePagination: false,
            pageSize: 50,
            ...options
        };

        // State
        this.viewport = { x: 0, y: 0 };
        this.zoom = 1.0;
        this.currentPage = 0;
        this.totalPages = 1;

        // Data
        this.matrixData = null;
        this.rowCount = 0;
        this.colCount = 0;
        this.rowLabels = [];
        this.colLabels = [];

        // Rendering
        this.container = null;
        this.cellContainer = null;
        this.labelContainer = null;
        this.viewportMask = null;
        this.scrollbarH = null;
        this.scrollbarV = null;

        // Graphics pooling
        this.cellPool = [];
        this.labelPool = [];
        this.activeCells = new Map(); // key: "row,col" -> PIXI.Graphics
        this.activeLabels = new Map();

        // Performance tracking
        this.renderStats = {
            lastRenderTime: 0,
            visibleCellCount: 0,
            totalCellCount: 0,
            poolUtilization: 0
        };

        // Color scheme
        this.colorScale = {
            negative: { r: 0, g: 100, b: 255 },
            neutral: { r: 240, g: 240, b: 240 },
            positive: { r: 255, g: 50, b: 50 }
        };

        // Event handlers
        this.onCellClick = null;
        this.onCellHover = null;

        console.log('[VirtualMatrixRenderer] Initialized');
    }

    /**
     * Create the renderer UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[VirtualMatrixRenderer] PIXI not available');
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
        this.cellContainer = new PIXI.Container();
        this.cellContainer.mask = this.viewportMask;
        this.container.addChild(this.cellContainer);

        // Label container (separate for better layering)
        this.labelContainer = new PIXI.Container();
        this.container.addChild(this.labelContainer);

        // Scrollbars
        this._createScrollbars();

        // Make interactive
        this.container.eventMode = 'static';
        this.container.hitArea = new PIXI.Rectangle(0, 0, this.options.width, this.options.height);

        // Setup interaction
        this._setupInteraction();

        console.log('[VirtualMatrixRenderer] Created');

        return this.container;
    }

    /**
     * Create scrollbar controls
     * @private
     */
    _createScrollbars() {
        const scrollbarSize = 12;

        // Horizontal scrollbar
        this.scrollbarH = new PIXI.Graphics();
        this.scrollbarH.y = this.options.height - scrollbarSize;
        this.scrollbarH.visible = false;
        this.container.addChild(this.scrollbarH);

        // Vertical scrollbar
        this.scrollbarV = new PIXI.Graphics();
        this.scrollbarV.x = this.options.width - scrollbarSize;
        this.scrollbarV.visible = false;
        this.container.addChild(this.scrollbarV);
    }

    /**
     * Setup mouse/touch interaction for scrolling
     * @private
     */
    _setupInteraction() {
        let isDragging = false;
        let dragStart = { x: 0, y: 0 };
        let viewportStart = { x: 0, y: 0 };

        this.container.on('pointerdown', (event) => {
            isDragging = true;
            dragStart.x = event.global.x;
            dragStart.y = event.global.y;
            viewportStart.x = this.viewport.x;
            viewportStart.y = this.viewport.y;
        });

        this.container.on('pointermove', (event) => {
            if (!isDragging) return;

            const dx = event.global.x - dragStart.x;
            const dy = event.global.y - dragStart.y;

            this.scrollTo(
                viewportStart.x - dx,
                viewportStart.y - dy
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
            const scrollSpeed = this.options.cellSize * this.zoom;
            this.scrollTo(
                this.viewport.x + event.deltaX,
                this.viewport.y + event.deltaY
            );
        });
    }

    /**
     * Set matrix data
     * @param {Object} matrix - Correlation matrix data
     * @param {Array} matrix.layerNames - Layer names
     * @param {Map} matrix.correlations - Correlation data map
     * @param {Array} matrix.modelIds - Model IDs
     */
    setMatrixData(matrix) {
        this.matrixData = matrix;
        this.rowLabels = matrix.layerNames || [];
        this.colLabels = matrix.layerNames || [];
        this.rowCount = this.rowLabels.length;
        this.colCount = this.colLabels.length;

        // Calculate total pages if pagination enabled
        if (this.options.enablePagination) {
            this.totalPages = Math.ceil(this.rowCount / this.options.pageSize);
            this.currentPage = 0;
        }

        // Update scrollbars
        this._updateScrollbars();

        // Initial render
        this.render();

        console.log('[VirtualMatrixRenderer] Matrix data set:', {
            rows: this.rowCount,
            cols: this.colCount,
            pages: this.totalPages
        });
    }

    /**
     * Scroll to position
     * @param {number} x - X position in pixels
     * @param {number} y - Y position in pixels
     */
    scrollTo(x, y) {
        const cellSize = this.options.cellSize * this.zoom;
        const totalWidth = this.colCount * cellSize;
        const totalHeight = this.rowCount * cellSize;

        // Clamp to bounds
        const maxX = Math.max(0, totalWidth - this.options.width);
        const maxY = Math.max(0, totalHeight - this.options.height);

        this.viewport.x = Math.max(0, Math.min(x, maxX));
        this.viewport.y = Math.max(0, Math.min(y, maxY));

        this._updateScrollbars();
        this.render();
    }

    /**
     * Set zoom level
     * @param {number} zoom - Zoom factor (1.0 = 100%)
     */
    setZoom(zoom) {
        const clampedZoom = Math.max(0.2, Math.min(zoom, 5.0));
        this.zoom = clampedZoom;

        // Recalculate cell size
        const newCellSize = this.options.cellSize * this.zoom;

        // Ensure within bounds
        if (newCellSize < this.options.minCellSize || newCellSize > this.options.maxCellSize) {
            return;
        }

        this.render();
    }

    /**
     * Go to specific page (pagination mode)
     * @param {number} page - Page number (0-indexed)
     */
    goToPage(page) {
        if (!this.options.enablePagination) return;

        this.currentPage = Math.max(0, Math.min(page, this.totalPages - 1));
        this.render();
    }

    /**
     * Render visible cells
     */
    render() {
        if (!this.matrixData || !this.cellContainer) return;

        const startTime = performance.now();

        const cellSize = this.options.cellSize * this.zoom;
        const buffer = this.options.bufferSize;

        // Calculate visible range with buffer
        const startCol = Math.floor(this.viewport.x / cellSize) - buffer;
        const endCol = Math.ceil((this.viewport.x + this.options.width) / cellSize) + buffer;
        const startRow = Math.floor(this.viewport.y / cellSize) - buffer;
        const endRow = Math.ceil((this.viewport.y + this.options.height) / cellSize) + buffer;

        // Apply pagination bounds
        const pageStartRow = this.options.enablePagination ?
            this.currentPage * this.options.pageSize : 0;
        const pageEndRow = this.options.enablePagination ?
            Math.min(pageStartRow + this.options.pageSize, this.rowCount) : this.rowCount;

        // Clamp to data bounds
        const visibleStartCol = Math.max(0, startCol);
        const visibleEndCol = Math.min(this.colCount, endCol);
        const visibleStartRow = Math.max(pageStartRow, startRow);
        const visibleEndRow = Math.min(pageEndRow, endRow);

        // Track which cells should be visible
        const visibleCells = new Set();

        // Render cells
        for (let row = visibleStartRow; row < visibleEndRow; row++) {
            for (let col = visibleStartCol; col < visibleEndCol; col++) {
                const key = `${row},${col}`;
                visibleCells.add(key);

                // Get or create cell
                let cell = this.activeCells.get(key);
                if (!cell) {
                    cell = this._getPooledCell();
                    this._configureCell(cell, row, col, cellSize);
                    this.activeCells.set(key, cell);
                    this.cellContainer.addChild(cell);
                }

                // Update position
                cell.x = col * cellSize;
                cell.y = (row - pageStartRow) * cellSize;

                // Update visibility
                cell.visible = true;
            }
        }

        // Hide and pool invisible cells
        for (const [key, cell] of this.activeCells) {
            if (!visibleCells.has(key)) {
                cell.visible = false;
                this._returnCellToPool(cell);
                this.activeCells.delete(key);
                this.cellContainer.removeChild(cell);
            }
        }

        // Render labels
        this._renderLabels(visibleStartRow, visibleEndRow, visibleStartCol, visibleEndCol, cellSize);

        // Update stats
        this.renderStats.lastRenderTime = performance.now() - startTime;
        this.renderStats.visibleCellCount = visibleCells.size;
        this.renderStats.totalCellCount = this.rowCount * this.colCount;
        this.renderStats.poolUtilization = this.cellPool.length / (this.activeCells.size + this.cellPool.length);
    }

    /**
     * Get a cell from the pool or create new one
     * @private
     */
    _getPooledCell() {
        if (this.cellPool.length > 0) {
            return this.cellPool.pop();
        }

        const cell = new PIXI.Graphics();
        cell.eventMode = 'static';
        cell.cursor = 'pointer';

        // Add interaction
        cell.on('click', (event) => {
            if (this.onCellClick && cell.cellData) {
                this.onCellClick(cell.cellData, event);
            }
        });

        cell.on('pointerover', () => {
            if (this.onCellHover && cell.cellData) {
                this.onCellHover(cell.cellData);
            }
        });

        return cell;
    }

    /**
     * Return a cell to the pool
     * @private
     */
    _returnCellToPool(cell) {
        if (this.cellPool.length < 1000) { // Limit pool size
            this.cellPool.push(cell);
        } else {
            cell.destroy();
        }
    }

    /**
     * Configure cell appearance
     * @private
     */
    _configureCell(cell, row, col, cellSize) {
        // Get correlation value
        const key = `${this.matrixData.modelIds[0]}:${this.rowLabels[row]}|${this.matrixData.modelIds[1] || this.matrixData.modelIds[0]}:${this.colLabels[col]}`;
        const data = this.matrixData.correlations.get(key);
        const correlation = data ? data.correlation : 0;

        // Clear and redraw
        cell.clear();
        cell.beginFill(this._correlationToColor(correlation), 0.9);
        cell.drawRect(0, 0, cellSize - 1, cellSize - 1);
        cell.endFill();

        // Store data for interaction
        cell.cellData = {
            correlation,
            row: this.rowLabels[row],
            col: this.colLabels[col],
            rowIndex: row,
            colIndex: col
        };
    }

    /**
     * Render labels
     * @private
     */
    _renderLabels(startRow, endRow, startCol, endCol, cellSize) {
        // Row labels
        const pageStartRow = this.options.enablePagination ?
            this.currentPage * this.options.pageSize : 0;

        for (let row = startRow; row < endRow; row++) {
            const key = `row:${row}`;
            let label = this.activeLabels.get(key);

            if (!label) {
                label = this._getPooledLabel();
                label.text = this._shortenLabel(this.rowLabels[row]);
                label.style.fontSize = Math.max(8, Math.floor(10 * this.zoom));
                this.activeLabels.set(key, label);
                this.labelContainer.addChild(label);
            }

            label.x = -cellSize - 5;
            label.y = (row - pageStartRow) * cellSize;
            label.visible = true;
        }

        // Column labels
        for (let col = startCol; col < endCol; col++) {
            const key = `col:${col}`;
            let label = this.activeLabels.get(key);

            if (!label) {
                label = this._getPooledLabel();
                label.text = this._shortenLabel(this.colLabels[col]);
                label.style.fontSize = Math.max(8, Math.floor(10 * this.zoom));
                label.rotation = Math.PI / 4;
                this.activeLabels.set(key, label);
                this.labelContainer.addChild(label);
            }

            label.x = col * cellSize;
            label.y = -cellSize - 5;
            label.visible = true;
        }

        // Hide invisible labels
        this._cleanupLabels(startRow, endRow, startCol, endCol);
    }

    /**
     * Get label from pool
     * @private
     */
    _getPooledLabel() {
        if (this.labelPool.length > 0) {
            return this.labelPool.pop();
        }

        return new PIXI.Text('', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: 0xCCCCCC
        });
    }

    /**
     * Cleanup invisible labels
     * @private
     */
    _cleanupLabels(startRow, endRow, startCol, endCol) {
        for (const [key, label] of this.activeLabels) {
            const [type, index] = key.split(':');
            const idx = parseInt(index);

            if (type === 'row' && (idx < startRow || idx >= endRow)) {
                label.visible = false;
                this.labelContainer.removeChild(label);
                this.activeLabels.delete(key);
                if (this.labelPool.length < 500) {
                    this.labelPool.push(label);
                }
            } else if (type === 'col' && (idx < startCol || idx >= endCol)) {
                label.visible = false;
                this.labelContainer.removeChild(label);
                this.activeLabels.delete(key);
                if (this.labelPool.length < 500) {
                    this.labelPool.push(label);
                }
            }
        }
    }

    /**
     * Update scrollbar appearance
     * @private
     */
    _updateScrollbars() {
        const cellSize = this.options.cellSize * this.zoom;
        const totalWidth = this.colCount * cellSize;
        const totalHeight = this.rowCount * cellSize;
        const scrollbarSize = 12;

        // Horizontal scrollbar
        if (totalWidth > this.options.width) {
            this.scrollbarH.clear();
            this.scrollbarH.beginFill(0x333333, 0.8);
            this.scrollbarH.lineStyle(1, 0x00FF00, 0.5);
            this.scrollbarH.drawRect(0, 0, this.options.width, scrollbarSize);
            this.scrollbarH.endFill();

            const thumbWidth = (this.options.width / totalWidth) * this.options.width;
            const thumbX = (this.viewport.x / totalWidth) * this.options.width;

            this.scrollbarH.beginFill(0x00FF00, 0.6);
            this.scrollbarH.drawRect(thumbX, 2, thumbWidth, scrollbarSize - 4);
            this.scrollbarH.endFill();

            this.scrollbarH.visible = true;
        } else {
            this.scrollbarH.visible = false;
        }

        // Vertical scrollbar
        if (totalHeight > this.options.height) {
            this.scrollbarV.clear();
            this.scrollbarV.beginFill(0x333333, 0.8);
            this.scrollbarV.lineStyle(1, 0x00FF00, 0.5);
            this.scrollbarV.drawRect(0, 0, scrollbarSize, this.options.height);
            this.scrollbarV.endFill();

            const thumbHeight = (this.options.height / totalHeight) * this.options.height;
            const thumbY = (this.viewport.y / totalHeight) * this.options.height;

            this.scrollbarV.beginFill(0x00FF00, 0.6);
            this.scrollbarV.drawRect(2, thumbY, scrollbarSize - 4, thumbHeight);
            this.scrollbarV.endFill();

            this.scrollbarV.visible = true;
        } else {
            this.scrollbarV.visible = false;
        }
    }

    /**
     * Convert correlation value to color
     * @private
     */
    _correlationToColor(correlation) {
        const c = Math.max(-1, Math.min(1, correlation));

        if (c < 0) {
            const t = Math.abs(c);
            return this._lerpColor(
                this.colorScale.neutral,
                this.colorScale.negative,
                t
            );
        } else {
            const t = c;
            return this._lerpColor(
                this.colorScale.neutral,
                this.colorScale.positive,
                t
            );
        }
    }

    /**
     * Linear interpolation between colors
     * @private
     */
    _lerpColor(color1, color2, t) {
        const r = Math.round(color1.r + (color2.r - color1.r) * t);
        const g = Math.round(color1.g + (color2.g - color1.g) * t);
        const b = Math.round(color1.b + (color2.b - color1.b) * t);
        return (0xFF << 24) | (r << 16) | (g << 8) | b;
    }

    /**
     * Shorten label for display
     * @private
     */
    _shortenLabel(label) {
        if (!label) return '';
        if (label.length > 12) {
            return label.substring(0, 10) + '..';
        }
        return label;
    }

    /**
     * Get rendering statistics
     * @returns {Object} Performance statistics
     */
    getStats() {
        return {
            ...this.renderStats,
            viewport: { ...this.viewport },
            zoom: this.zoom,
            currentPage: this.currentPage,
            totalPages: this.totalPages,
            activeCells: this.activeCells.size,
            pooledCells: this.cellPool.length,
            activeLabels: this.activeLabels.size,
            pooledLabels: this.labelPool.length
        };
    }

    /**
     * Destroy the renderer and cleanup resources
     */
    destroy() {
        // Destroy all cells
        for (const cell of this.activeCells.values()) {
            cell.destroy();
        }
        this.activeCells.clear();

        // Destroy pooled cells
        for (const cell of this.cellPool) {
            cell.destroy();
        }
        this.cellPool = [];

        // Destroy all labels
        for (const label of this.activeLabels.values()) {
            label.destroy();
        }
        this.activeLabels.clear();

        // Destroy pooled labels
        for (const label of this.labelPool) {
            label.destroy();
        }
        this.labelPool = [];

        // Destroy containers
        if (this.container) {
            this.container.destroy();
            this.container = null;
        }

        this.matrixData = null;
        this.rowLabels = [];
        this.colLabels = [];

        console.log('[VirtualMatrixRenderer] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.VirtualMatrixRenderer = VirtualMatrixRenderer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VirtualMatrixRenderer };
}
