/**
 * Geometry OS: Geometric Canvas IDE
 *
 * Phase 26: The Morphological Workbench
 *
 * A drawing surface where users "paint" programs that execute in real-time.
 * Software is not text. Software is morphological texture.
 *
 * @module geometric_canvas
 */

class GeometricCanvas {
    /**
     * Create a new GeometricCanvas
     * @param {PIXI.Application} app - PixiJS application instance
     * @param {Object} options - Configuration options
     * @param {number} options.width - Canvas width (default: 2048)
     * @param {number} options.height - Canvas height (default: 2048)
     * @param {number} options.pixelSize - Size of each pixel (default: 16)
     * @param {boolean} options.gridEnabled - Show pixel grid (default: true)
     * @param {boolean} options.liveExecution - Enable instant execution (default: true)
     */
    constructor(app, options = {}) {
        this.app = app;
        this.options = {
            width: 2048,
            height: 2048,
            pixelSize: 16,
            gridEnabled: true,
            liveExecution: true,
            ...options
        };

        // Canvas dimensions (in pixels, not grid cells)
        this.gridWidth = this.options.width / this.options.pixelSize;
        this.gridHeight = this.options.height / this.options.pixelSize;

        // Current brush/operation
        this.currentBrush = {
            color: 0xFF0000, // Default: RED (Foundation)
            category: 'foundation',
            operation: 'SYSTEM_INIT',
            size: 1  // Brush size in grid cells
        };

        // Canvas state
        this.pixels = new Map(); // "x,y" -> {color, operation, category}
        this.isDrawing = false;
        this.lastDrawPosition = null;

        // Graphics containers
        this.container = null;
        this.pixelGraphics = null;
        this.gridGraphics = null;
        this.cursorGraphics = null;

        // Event callbacks
        this.onPixelPainted = null;
        this.onPixelCleared = null;
        this.onCanvasChanged = null;

        // GPU Execution integration
        this.gpuSystem = null;
        this.executionActive = false;

        // PAS Oracle integration
        this.pasOracle = null;
        this.pasScore = 1.0;

        console.log('🎨 GeometricCanvas initialized', {
            gridSize: `${this.gridWidth}×${this.gridHeight}`,
            pixelSize: this.options.pixelSize
        });
    }

    /**
     * Initialize the canvas
     */
    initialize() {
        // Create main container
        this.container = new PIXI.Container();
        this.container.sortableChildren = true;

        // Create pixel graphics layer
        this.pixelGraphics = new PIXI.Graphics();
        this.container.addChild(this.pixelGraphics);

        // Create grid layer (behind pixels)
        if (this.options.gridEnabled) {
            this.gridGraphics = new PIXI.Graphics();
            this._drawGrid();
            this.container.addChildAt(this.gridGraphics, 0);
        }

        // Create cursor/overlay layer
        this.cursorGraphics = new PIXI.Graphics();
        this.container.addChild(this.cursorGraphics);

        // Enable interactivity
        this.container.eventMode = 'static';
        this.container.hitArea = new PIXI.Rectangle(0, 0, this.options.width, this.options.height);

        // Attach event listeners
        this.container.on('pointerdown', this._onPointerDown.bind(this));
        this.container.on('pointermove', this._onPointerMove.bind(this));
        this.container.on('pointerup', this._onPointerUp.bind(this));
        this.container.on('pointerupoutside', this._onPointerUp.bind(this));

        return this.container;
    }

    /**
     * Draw the pixel grid
     * @private
     */
    _drawGrid() {
        this.gridGraphics.clear();
        this.gridGraphics.lineStyle(1, 0x333333, 0.3);

        // Vertical lines
        for (let x = 0; x <= this.gridWidth; x++) {
            const xPos = x * this.options.pixelSize;
            this.gridGraphics.moveTo(xPos, 0);
            this.gridGraphics.lineTo(xPos, this.options.height);
        }

        // Horizontal lines
        for (let y = 0; y <= this.gridHeight; y++) {
            const yPos = y * this.options.pixelSize;
            this.gridGraphics.moveTo(0, yPos);
            this.gridGraphics.lineTo(this.options.width, yPos);
        }
    }

    /**
     * Handle pointer down (start drawing)
     * @private
     */
    _onPointerDown(event) {
        this.isDrawing = true;
        this.lastDrawPosition = this._getGridPosition(event.global);

        // Paint the initial pixel
        this._paintPixel(this.lastDrawPosition.x, this.lastDrawPosition.y);
    }

    /**
     * Handle pointer move (continue drawing)
     * @private
     */
    _onPointerMove(event) {
        // Update cursor position
        const gridPos = this._getGridPosition(event.global);
        this._updateCursor(gridPos.x, gridPos.y);

        // Continue drawing if mouse is down
        if (!this.isDrawing) return;

        // Interpolate between last position and current (for smooth strokes)
        const points = this._interpolateLine(
            this.lastDrawPosition.x,
            this.lastDrawPosition.y,
            gridPos.x,
            gridPos.y
        );

        for (const point of points) {
            this._paintPixel(point.x, point.y);
        }

        this.lastDrawPosition = gridPos;
    }

    /**
     * Handle pointer up (stop drawing)
     * @private
     */
    _onPointerUp() {
        if (this.isDrawing) {
            this.isDrawing = false;
            this._onCanvasChanged();
        }
    }

    /**
     * Get grid position from global coordinates
     * @private
     */
    _getGridPosition(globalPos) {
        const localPos = this.container.toLocal(globalPos);
        return {
            x: Math.floor(localPos.x / this.options.pixelSize),
            y: Math.floor(localPos.y / this.options.pixelSize)
        };
    }

    /**
     * Interpolate pixels between two points (for smooth drawing)
     * @private
     */
    _interpolateLine(x0, y0, x1, y1) {
        const points = [];
        const dx = Math.abs(x1 - x0);
        const dy = Math.abs(y1 - y0);
        const sx = x0 < x1 ? 1 : -1;
        const sy = y0 < y1 ? 1 : -1;
        let err = dx - dy;

        let x = x0;
        let y = y0;

        while (true) {
            points.push({ x, y });

            if (x === x1 && y === y1) break;

            const e2 = 2 * err;
            if (e2 > -dy) {
                err -= dy;
                x += sx;
            }
            if (e2 < dx) {
                err += dx;
                y += sy;
            }
        }

        return points;
    }

    /**
     * Paint a pixel at the given grid coordinates
     * @private
     */
    _paintPixel(gridX, gridY) {
        // Bounds check
        if (gridX < 0 || gridX >= this.gridWidth || gridY < 0 || gridY >= this.gridHeight) {
            return;
        }

        const key = `${gridX},${gridY}`;

        // Store pixel data
        this.pixels.set(key, {
            x: gridX,
            y: gridY,
            color: this.currentBrush.color,
            category: this.currentBrush.category,
            operation: this.currentBrush.operation
        });

        // Draw the pixel
        this._drawPixel(gridX, gridY, this.currentBrush.color);

        // Trigger callback
        if (this.onPixelPainted) {
            this.onPixelPainted(gridX, gridY, this.currentBrush);
        }

        // Trigger execution if live execution is enabled
        if (this.options.liveExecution && this.gpuSystem) {
            this._executeLive();
        }
    }

    /**
     * Draw a pixel on the graphics layer
     * @private
     */
    _drawPixel(gridX, gridY, color) {
        const x = gridX * this.options.pixelSize;
        const y = gridY * this.options.pixelSize;
        const size = this.options.pixelSize;

        // Convert hex color to RGB
        const r = (color >> 16) & 0xFF;
        const g = (color >> 8) & 0xFF;
        const b = color & 0xFF;

        this.pixelGraphics.beginFill(`rgb(${r},${g},${b})`);
        this.pixelGraphics.drawRect(x, y, size, size);
        this.pixelGraphics.endFill();
    }

    /**
     * Update the cursor indicator
     * @private
     */
    _updateCursor(gridX, gridY) {
        this.cursorGraphics.clear();

        // Skip if out of bounds
        if (gridX < 0 || gridX >= this.gridWidth || gridY < 0 || gridY >= this.gridHeight) {
            return;
        }

        const x = gridX * this.options.pixelSize;
        const y = gridY * this.options.pixelSize;
        const size = this.options.pixelSize;

        // Draw cursor outline
        this.cursorGraphics.lineStyle(2, 0xFFFFFF, 0.8);
        this.cursorGraphics.drawRect(x, y, size, size);

        // Draw brush size indicator
        if (this.currentBrush.size > 1) {
            const brushSize = this.currentBrush.size * size;
            const offset = (brushSize - size) / 2;
            this.cursorGraphics.lineStyle(1, 0xFFFF00, 0.5);
            this.cursorGraphics.drawRect(x - offset, y - offset, brushSize, brushSize);
        }
    }

    /**
     * Clear a pixel at the given grid coordinates
     */
    clearPixel(gridX, gridY) {
        const key = `${gridX},${gridY}`;

        if (this.pixels.has(key)) {
            this.pixels.delete(key);
            this._redrawPixelArea(gridX, gridY);

            if (this.onPixelCleared) {
                this.onPixelCleared(gridX, gridY);
            }

            this._onCanvasChanged();
        }
    }

    /**
     * Redraw a pixel area (used when clearing)
     * @private
     */
    _redrawPixelArea(gridX, gridY) {
        // This would need to redraw the entire graphics or just the affected area
        // For simplicity, we'll clear and redraw all pixels
        // In production, use a more efficient approach
        this.pixelGraphics.clear();
        this._redrawAllPixels();
    }

    /**
     * Redraw all pixels
     * @private
     */
    _redrawAllPixels() {
        for (const pixel of this.pixels.values()) {
            this._drawPixel(pixel.x, pixel.y, pixel.color);
        }
    }

    /**
     * Trigger canvas change event
     * @private
     */
    _onCanvasChanged() {
        if (this.onCanvasChanged) {
            this.onCanvasChanged(this.pixels);
        }

        // Update PAS score if oracle is available
        if (this.pasOracle) {
            this._updatePAS();
        }
    }

    /**
     * Update PAS score from oracle
     * @private
     */
    async _updatePAS() {
        if (!this.pasOracle) return;

        // Generate a temporary texture for analysis
        const textureData = this._generateTextureData();

        // Run PAS analysis (would integrate with TectonicCanary)
        // For now, use a simple heuristic
        const pixelCount = this.pixels.size;
        const totalPixels = this.gridWidth * this.gridHeight;
        const density = pixelCount / totalPixels;

        // Ideal density is around 0.3-0.7
        this.pasScore = 1.0 - Math.abs(density - 0.5) * 2;
        this.pasScore = Math.max(0, Math.min(1, this.pasScore));

        console.log(`📊 PAS Score: ${this.pasScore.toFixed(2)} (Density: ${(density * 100).toFixed(1)}%)`);
    }

    /**
     * Generate texture data from painted pixels
     * @private
     */
    _generateTextureData() {
        // Create a canvas to render the pixel data
        const canvas = document.createElement('canvas');
        canvas.width = this.gridWidth;
        canvas.height = this.gridHeight;
        const ctx = canvas.getContext('2d');

        const imageData = ctx.createImageData(this.gridWidth, this.gridHeight);

        for (const pixel of this.pixels.values()) {
            const offset = (pixel.y * this.gridWidth + pixel.x) * 4;

            const r = (pixel.color >> 16) & 0xFF;
            const g = (pixel.color >> 8) & 0xFF;
            const b = pixel.color & 0xFF;

            imageData.data[offset] = r;
            imageData.data[offset + 1] = g;
            imageData.data[offset + 2] = b;
            imageData.data[offset + 3] = 255;
        }

        return imageData;
    }

    /**
     * Execute the canvas on GPU (live execution mode)
     * @private
     */
    async _executeLive() {
        if (!this.gpuSystem || !this.executionActive) return;

        // Generate texture from canvas
        const textureData = this._generateTextureData();

        // This would integrate with GPUExecutionSystem to execute the painted code
        // For now, just log
        console.log('⚡ Live execution triggered', {
            pixelCount: this.pixels.size,
            textureSize: `${this.gridWidth}×${this.gridHeight}`
        });
    }

    /**
     * Set the current brush
     * @param {Object} brush - Brush configuration
     * @param {number} brush.color - Hex color value
     * @param {string} brush.category - Category (foundation, movement, computation, logic)
     * @param {string} brush.operation - Operation name
     * @param {number} brush.size - Brush size (default: 1)
     */
    setBrush(brush) {
        this.currentBrush = {
            color: brush.color || 0xFF0000,
            category: brush.category || 'foundation',
            operation: brush.operation || 'UNKNOWN',
            size: brush.size || 1
        };

        console.log('🖌️ Brush set to', {
            color: `0x${this.currentBrush.color.toString(16).padStart(6, '0')}`,
            category: this.currentBrush.category,
            operation: this.currentBrush.operation,
            size: this.currentBrush.size
        });
    }

    /**
     * Attach GPU execution system
     * @param {GPUExecutionSystem} gpuSystem - GPU execution system instance
     */
    attachGPUExecution(gpuSystem) {
        this.gpuSystem = gpuSystem;
        this.executionActive = true;
        console.log('⚡ GPU Execution attached to canvas');
    }

    /**
     * Attach PAS Oracle
     * @param {TectonicCanary} oracle - PAS Oracle instance
     */
    attachPASOracle(oracle) {
        this.pasOracle = oracle;
        console.log('📊 PAS Oracle attached to canvas');
    }

    /**
     * Enable/disable live execution
     * @param {boolean} enabled
     */
    setLiveExecution(enabled) {
        this.options.liveExecution = enabled;
        console.log(`⚡ Live execution: ${enabled ? 'ENABLED' : 'DISABLED'}`);
    }

    /**
     * Export the canvas as a texture URL
     * @returns {string} Data URL of the canvas as PNG
     */
    exportTexture() {
        const canvas = document.createElement('canvas');
        canvas.width = this.gridWidth;
        canvas.height = this.gridHeight;
        const ctx = canvas.getContext('2d');

        const imageData = this._generateTextureData();
        ctx.putImageData(imageData, 0, 0);

        return canvas.toDataURL('image/png');
    }

    /**
     * Clear the entire canvas
     */
    clear() {
        this.pixels.clear();
        this.pixelGraphics.clear();
        this._onCanvasChanged();
        console.log('🗑️ Canvas cleared');
    }

    /**
     * Get canvas statistics
     * @returns {Object} Canvas statistics
     */
    getStats() {
        const categoryCounts = {
            foundation: 0,
            movement: 0,
            computation: 0,
            logic: 0,
            unknown: 0
        };

        for (const pixel of this.pixels.values()) {
            const cat = pixel.category || 'unknown';
            if (categoryCounts[cat] !== undefined) {
                categoryCounts[cat]++;
            } else {
                categoryCounts.unknown++;
            }
        }

        return {
            totalPixels: this.pixels.size,
            gridSize: `${this.gridWidth}×${this.gridHeight}`,
            fillRatio: this.pixels.size / (this.gridWidth * this.gridHeight),
            categoryCounts,
            pasScore: this.pasScore
        };
    }
}

/**
 * GeometricBrush - Brush definitions for PixelLang
 */
class GeometricBrush {
    static BRUSHES = {
        // Foundation (RED block)
        SYSTEM_INIT: { color: 0xFF0000, category: 'foundation', operation: 'SYSTEM_INIT' },
        STACK_FRAME: { color: 0xDC143C, category: 'foundation', operation: 'STACK_FRAME' },
        MEMORY_BLOCK: { color: 0x800000, category: 'foundation', operation: 'MEMORY_BLOCK' },

        // Movement/I/O (GREEN block)
        FILE_READ: { color: 0x228B22, category: 'movement', operation: 'FILE_READ' },
        FILE_WRITE: { color: 0x32CD32, category: 'movement', operation: 'FILE_WRITE' },
        NETWORK_IO: { color: 0x2E8B57, category: 'movement', operation: 'NETWORK_IO' },

        // Computation (BLUE block)
        ADD: { color: 0x00BFFF, category: 'computation', operation: 'ADD' },
        SUB: { color: 0x1E90FF, category: 'computation', operation: 'SUB' },
        MUL: { color: 0x4169E1, category: 'computation', operation: 'MUL' },
        DIV: { color: 0x007FFF, category: 'computation', operation: 'DIV' },

        // Logic/Control (PURPLE block)
        BRANCH: { color: 0x4B0082, category: 'logic', operation: 'BRANCH' },
        LOOP: { color: 0x800080, category: 'logic', operation: 'LOOP' },
        FUNCTION: { color: 0xFF00FF, category: 'logic', operation: 'FUNCTION' },
        RETURN: { color: 0xEE82EE, category: 'logic', operation: 'RETURN' }
    };

    /**
     * Get a brush by name
     */
    static get(name) {
        return this.BRUSHES[name] || this.BRUSHES.SYSTEM_INIT;
    }

    /**
     * Get all brushes in a category
     */
    static getByCategory(category) {
        return Object.values(this.BRUSHES).filter(b => b.category === category);
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.GeometricCanvas = GeometricCanvas;
    window.GeometricBrush = GeometricBrush;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        GeometricCanvas,
        GeometricBrush
    };
}
