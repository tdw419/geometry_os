/**
 * CanvasFallback - Graceful degradation for older browsers
 *
 * Provides fallback rendering when WebGL/WebGPU is not available.
 * Automatically detects available rendering APIs and selects best mode.
 *
 * API Requirements:
 * - detectSupport(): Detect available rendering APIs
 * - getBestMode(): Return best available rendering mode
 * - createCanvasRenderer(): Create Canvas 2D renderer instance
 * - createFallbackFilter(): Create CPU-based filter alternative
 * - showCompatibilityNotice(): Display user-friendly notice
 * - isSupported(feature): Check if feature is supported
 */

class CanvasFallback {
    constructor(options = {}) {
        this.options = {
            showNotices: true,
            noticeDuration: 5000,
            logWarnings: true,
            ...options
        };

        this.support = this._detectAllSupport();
        this.currentMode = null;
        this.noticeElement = null;

        if (this.options.logWarnings) {
            this._logSupportStatus();
        }
    }

    /**
     * Detect available rendering APIs
     * @returns {Object} Support status for each API
     */
    detectSupport() {
        return this.support;
    }

    /**
     * Detect all supported rendering APIs and features
     * @private
     */
    _detectAllSupport() {
        const canvas = document.createElement('canvas');

        return {
            webgpu: this._detectWebGPU(),
            webgl2: this._detectWebGL2(canvas),
            webgl: this._detectWebGL(canvas),
            canvas2d: true, // Always available
            workers: typeof Worker !== 'undefined',
            offscreenCanvas: typeof OffscreenCanvas !== 'undefined',
            requestVideoFrameCallback: typeof HTMLVideoElement.prototype.requestVideoFrameCallback === 'function',
            performanceMemory: typeof performance !== 'undefined' && !!performance.memory,
            imageBitmap: typeof createImageBitmap !== 'undefined',
            WebGL2RenderingContext: typeof WebGL2RenderingContext !== 'undefined',
            WebGLRenderingContext: typeof WebGLRenderingContext !== 'undefined'
        };
    }

    /**
     * Detect WebGPU support
     * @private
     */
    _detectWebGPU() {
        return typeof navigator !== 'undefined' && 'gpu' in navigator;
    }

    /**
     * Detect WebGL2 support
     * @private
     */
    _detectWebGL2(canvas) {
        try {
            return !!canvas.getContext('webgl2');
        } catch (e) {
            return false;
        }
    }

    /**
     * Detect WebGL support
     * @private
     */
    _detectWebGL(canvas) {
        try {
            return !!(canvas.getContext('webgl') || canvas.getContext('experimental-webgl'));
        } catch (e) {
            return false;
        }
    }

    /**
     * Get best available rendering mode
     * @returns {string} Best rendering mode: 'webgpu', 'webgl2', 'webgl', or 'canvas2d'
     */
    getBestMode() {
        if (this.support.webgpu) return 'webgpu';
        if (this.support.webgl2) return 'webgl2';
        if (this.support.webgl) return 'webgl';
        return 'canvas2d';
    }

    /**
     * Create Canvas 2D renderer instance
     * @param {Object} options - Renderer configuration
     * @returns {Object} Canvas 2D renderer configuration
     */
    createCanvasRenderer(options = {}) {
        const canvas = options.view || document.createElement('canvas');
        const context = canvas.getContext('2d');

        if (!context) {
            throw new Error('Canvas 2D context not available');
        }

        this.currentMode = 'canvas2d';

        // Return PIXI-compatible CanvasRenderer if available
        if (typeof PIXI !== 'undefined' && PIXI.CanvasRenderer) {
            return new PIXI.CanvasRenderer({
                view: canvas,
                backgroundColor: options.backgroundColor || 0x000000,
                resolution: options.resolution || 1,
                autoDensity: true
            });
        }

        // Fallback: return raw canvas context
        return {
            canvas,
            context,
            view: canvas,
            width: options.width || canvas.width,
            height: options.height || canvas.height,
            clear: (color = 0x000000) => {
                const r = (color >> 16) & 0xFF;
                const g = (color >> 8) & 0xFF;
                const b = color & 0xFF;
                context.fillStyle = `rgb(${r}, ${g}, ${b})`;
                context.fillRect(0, 0, canvas.width, canvas.height);
            },
            resize: (width, height) => {
                canvas.width = width;
                canvas.height = height;
            }
        };
    }

    /**
     * Create CPU-based filter alternative for GPU shaders
     * @param {string} filterType - Type of filter (heatmap, blur, etc.)
     * @param {Object} params - Filter parameters
     * @returns {Function} CPU-based filter function
     */
    createFallbackFilter(filterType, params = {}) {
        switch (filterType) {
            case 'heatmap':
                return this._createHeatmapFilter(params);
            case 'blur':
                return this._createBlurFilter(params);
            case 'colorize':
                return this._createColorizeFilter(params);
            default:
                console.warn(`[CanvasFallback] Unknown filter type: ${filterType}`);
                return null;
        }
    }

    /**
     * Create CPU-based heatmap filter
     * @private
     */
    _createHeatmapFilter(params) {
        const {
            colorLow = { r: 0, g: 0, b: 255 },
            colorMedium = { r: 0, g: 255, b: 0 },
            colorHigh = { r: 255, g: 0, b: 0 },
            opacity = 0.6
        } = params;

        return (context, x, y, width, height, intensity) => {
            const t = Math.min(Math.max(intensity, 0), 1);

            let r, g, b;
            if (t < 0.5) {
                const factor = t * 2;
                r = colorLow.r + (colorMedium.r - colorLow.r) * factor;
                g = colorLow.g + (colorMedium.g - colorLow.g) * factor;
                b = colorLow.b + (colorMedium.b - colorLow.b) * factor;
            } else {
                const factor = (t - 0.5) * 2;
                r = colorMedium.r + (colorHigh.r - colorMedium.r) * factor;
                g = colorMedium.g + (colorHigh.g - colorMedium.g) * factor;
                b = colorMedium.b + (colorHigh.b - colorMedium.b) * factor;
            }

            context.fillStyle = `rgba(${Math.round(r)}, ${Math.round(g)}, ${Math.round(b)}, ${opacity})`;
            context.fillRect(x, y, width, height);
        };
    }

    /**
     * Create CPU-based blur filter
     * @private
     */
    _createBlurFilter(params) {
        const { radius = 5 } = params;
        return (imageData) => {
            // Simple box blur implementation
            const data = imageData.data;
            const width = imageData.width;
            const height = imageData.height;
            const output = new ImageData(width, height);

            for (let y = 0; y < height; y++) {
                for (let x = 0; x < width; x++) {
                    let r = 0, g = 0, b = 0, a = 0, count = 0;

                    for (let dy = -radius; dy <= radius; dy++) {
                        for (let dx = -radius; dx <= radius; dx++) {
                            const nx = x + dx;
                            const ny = y + dy;
                            if (nx >= 0 && nx < width && ny >= 0 && ny < height) {
                                const i = (ny * width + nx) * 4;
                                r += data[i];
                                g += data[i + 1];
                                b += data[i + 2];
                                a += data[i + 3];
                                count++;
                            }
                        }
                    }

                    const i = (y * width + x) * 4;
                    output.data[i] = r / count;
                    output.data[i + 1] = g / count;
                    output.data[i + 2] = b / count;
                    output.data[i + 3] = a / count;
                }
            }

            return output;
        };
    }

    /**
     * Create CPU-based colorize filter
     * @private
     */
    _createColorizeFilter(params) {
        const { color = 0xFF0000, opacity = 0.5 } = params;
        const r = (color >> 16) & 0xFF;
        const g = (color >> 8) & 0xFF;
        const b = color & 0xFF;

        return (context, x, y, width, height) => {
            context.fillStyle = `rgba(${r}, ${g}, ${b}, ${opacity})`;
            context.fillRect(x, y, width, height);
        };
    }

    /**
     * Display user-friendly compatibility notice
     * @param {string} mode - The mode being used
     * @param {Object} options - Notice options
     */
    showCompatibilityNotice(mode = null, options = {}) {
        if (!this.options.showNotices) return;

        const actualMode = mode || this.getBestMode();
        const isFallback = actualMode === 'canvas2d';

        if (!isFallback && !options.force) {
            return; // Don't show notice if using hardware acceleration
        }

        // Remove existing notice
        if (this.noticeElement) {
            this.noticeElement.remove();
        }

        // Create notice element
        this.noticeElement = document.createElement('div');
        this.noticeElement.style.cssText = `
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(255, 200, 0, 0.95);
            color: #000;
            padding: 12px 20px;
            border-radius: 8px;
            font-family: system-ui, -apple-system, sans-serif;
            font-size: 14px;
            z-index: 10000;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            max-width: 400px;
            text-align: center;
        `;

        const message = options.message || this._getNoticeMessage(actualMode);
        this.noticeElement.innerHTML = message;

        document.body.appendChild(this.noticeElement);

        // Auto-hide after duration
        if (!options.persistent) {
            setTimeout(() => {
                if (this.noticeElement) {
                    this.noticeElement.style.opacity = '0';
                    this.noticeElement.style.transition = 'opacity 0.5s';
                    setTimeout(() => this.noticeElement?.remove(), 500);
                }
            }, this.options.noticeDuration);
        }
    }

    /**
     * Get notice message based on mode
     * @private
     */
    _getNoticeMessage(mode) {
        switch (mode) {
            case 'canvas2d':
                return `
                    <strong>Performance Notice</strong><br>
                    Using software rendering. For best performance,<br>
                    please use a browser with WebGL support.
                `;
            case 'webgl':
                return `
                    <strong>Tip</strong><br>
                    WebGL is available. For even better performance,<br>
                    try a browser with WebGPU support.
                `;
            default:
                return '';
        }
    }

    /**
     * Check if a specific feature is supported
     * @param {string} feature - Feature name to check
     * @returns {boolean} True if feature is supported
     */
    isSupported(feature) {
        return !!this.support[feature];
    }

    /**
     * Log support status to console
     * @private
     */
    _logSupportStatus() {
        const mode = this.getBestMode();
        const isFallback = mode === 'canvas2d';

        console.group('[CanvasFallback] Browser Compatibility');
        console.log('Best available mode:', mode);
        console.log('Support status:', this.support);

        if (isFallback) {
            console.warn('⚠️  Using software rendering - performance may be reduced');
            console.warn('   Consider upgrading to a browser with WebGL support');
        } else {
            console.log('✓ Hardware acceleration available');
        }

        console.groupEnd();
    }

    /**
     * Get performance-aware warning based on current mode
     * @returns {Object|null} Warning object or null if no warning
     */
    getPerformanceWarning() {
        const mode = this.getBestMode();

        if (mode === 'canvas2d') {
            return {
                level: 'warning',
                message: 'Software rendering is active. Visualizations may run slowly.',
                recommendation: 'Use a browser with WebGL support for better performance.',
                affectedFeatures: ['Heatmap overlay', 'Real-time updates', 'Large datasets']
            };
        }

        if (mode === 'webgl') {
            return {
                level: 'info',
                message: 'WebGL is active. Good performance.',
                recommendation: 'For best performance, use a browser with WebGPU support.',
                affectedFeatures: []
            };
        }

        return null;
    }

    /**
     * Clean up resources
     */
    destroy() {
        if (this.noticeElement) {
            this.noticeElement.remove();
            this.noticeElement = null;
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.CanvasFallback = CanvasFallback;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { CanvasFallback };
}
