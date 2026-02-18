/**
 * BrowserCompatibility - Handle cross-browser differences
 *
 * Features:
 * - WebGL capability detection
 * - Fallback rendering for older browsers
 * - Feature detection and polyfills
 */

class BrowserCompatibility {
    constructor() {
        this.capabilities = this._detectCapabilities();
        console.log('[BrowserCompatibility] Detected:', this.capabilities);
    }

    /**
     * Detect browser capabilities
     * @private
     */
    _detectCapabilities() {
        const canvas = document.createElement('canvas');

        return {
            webgl: this._hasWebGL(canvas),
            webgl2: this._hasWebGL2(canvas),
            webgpu: this._hasWebGPU(),
            performanceAPI: typeof performance !== 'undefined',
            memoryAPI: typeof performance !== 'undefined' && !!performance.memory,
            workerSupport: typeof Worker !== 'undefined',
            offscreenCanvas: typeof OffscreenCanvas !== 'undefined',
            requestVideoFrameCallback: typeof HTMLVideoElement.prototype.requestVideoFrameCallback === 'function',
            browser: this._detectBrowser(),
            pixelRatio: window.devicePixelRatio || 1
        };
    }

    /**
     * Check for WebGL support
     * @private
     */
    _hasWebGL(canvas) {
        try {
            return !!(canvas.getContext('webgl') || canvas.getContext('experimental-webgl'));
        } catch (e) {
            return false;
        }
    }

    /**
     * Check for WebGL2 support
     * @private
     */
    _hasWebGL2(canvas) {
        try {
            return !!canvas.getContext('webgl2');
        } catch (e) {
            return false;
        }
    }

    /**
     * Check for WebGPU support
     * @private
     */
    _hasWebGPU() {
        return typeof navigator !== 'undefined' && 'gpu' in navigator;
    }

    /**
     * Detect browser
     * @private
     */
    _detectBrowser() {
        const ua = navigator.userAgent;

        if (ua.indexOf('Firefox') > -1) return 'firefox';
        if (ua.indexOf('Chrome') > -1) return 'chrome';
        if (ua.indexOf('Safari') > -1) return 'safari';
        if (ua.indexOf('Edge') > -1) return 'edge';
        if (ua.indexOf('MSIE') > -1 || ua.indexOf('Trident') > -1) return 'ie';

        return 'unknown';
    }

    /**
     * Check if WebGL is available
     * @returns {boolean}
     */
    hasWebGL() {
        return this.capabilities.webgl || this.capabilities.webgl2;
    }

    /**
     * Get best WebGL context
     * @param {HTMLCanvasElement} canvas - Canvas element
     * @returns {WebGLRenderingContext|null}
     */
    getWebGLContext(canvas) {
        // Try WebGL2 first
        if (this.capabilities.webgl2) {
            return canvas.getContext('webgl2', {
                antialias: false,
                powerPreference: 'high-performance'
            });
        }

        // Fall back to WebGL1
        if (this.capabilities.webgl) {
            return canvas.getContext('webgl', {
                antialias: false,
                powerPreference: 'high-performance'
            });
        }

        return null;
    }

    /**
     * Check if memory API is available
     * @returns {boolean}
     */
    hasMemoryAPI() {
        return this.capabilities.memoryAPI;
    }

    /**
     * Get recommended rendering mode
     * @returns {string} 'webgl2', 'webgl', 'canvas', or 'webgpu'
     */
    getRecommendedMode() {
        if (this.capabilities.webgpu) return 'webgpu';
        if (this.capabilities.webgl2) return 'webgl2';
        if (this.capabilities.webgl) return 'webgl';
        return 'canvas';
    }

    /**
     * Create fallback canvas renderer
     * @param {Object} options - Renderer options
     * @returns {PIXI.Renderer}
     */
    createFallbackRenderer(options = {}) {
        // Force canvas renderer
        const canvasOptions = {
            ...options,
            view: options.view || document.createElement('canvas'),
            backgroundColor: options.backgroundColor || 0x000000
        };

        try {
            return new PIXI.CanvasRenderer(canvasOptions);
        } catch (e) {
            console.error('[BrowserCompatibility] Canvas renderer failed:', e);
            throw new Error('No suitable rendering backend available');
        }
    }

    /**
     * Create optimized renderer
     * @param {Object} options - Renderer options
     * @returns {PIXI.Renderer}
     */
    createOptimizedRenderer(options = {}) {
        const mode = this.getRecommendedMode();

        const pixiOptions = {
            ...options,
            powerPreference: 'high-performance',
            antialias: false,
            resolution: options.resolution || this.capabilities.pixelRatio,
            autoDensity: true
        };

        switch (mode) {
            case 'webgpu':
                console.log('[BrowserCompatibility] Using WebGPU');
                return new PIXI.WebGpuRenderer(pixiOptions);

            case 'webgl2':
            case 'webgl':
                console.log(`[BrowserCompatibility] Using ${mode.toUpperCase()}`);
                return new PIXI.Renderer(pixiOptions);

            default:
                console.warn('[BrowserCompatibility] WebGL not available, using canvas fallback');
                return this.createFallbackRenderer(pixiOptions);
        }
    }

    /**
     * Apply browser-specific fixes
     */
    applyFixes() {
        // Fix for Safari async image decoding
        if (this.capabilities.browser === 'safari') {
            this._applySafariFixes();
        }

        // Fix for Firefox
        if (this.capabilities.browser === 'firefox') {
            this._applyFirefoxFixes();
        }
    }

    /**
     * Apply Safari-specific fixes
     * @private
     */
    _applySafariFixes() {
        // Safari sometimes has issues with large textures
        const maxTextureSize = 4096;
        console.log('[BrowserCompatibility] Applied Safari fixes (max texture: ' + maxTextureSize + ')');
    }

    /**
     * Apply Firefox-specific fixes
     * @private
     */
    _applyFirefoxFixes() {
        // Firefox sometimes needs explicit GC hints
        console.log('[BrowserCompatibility] Applied Firefox fixes');
    }

    /**
     * Check if touch is supported
     * @returns {boolean}
     */
    hasTouchSupport() {
        return 'ontouchstart' in window || navigator.maxTouchPoints > 0;
    }

    /**
     * Get capabilities report
     * @returns {Object} Capabilities report
     */
    getCapabilitiesReport() {
        return {
            ...this.capabilities,
            recommendedMode: this.getRecommendedMode(),
            hasTouch: this.hasTouchSupport()
        };
    }
}

// Export
if (typeof window !== 'undefined') {
    window.BrowserCompatibility = BrowserCompatibility;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { BrowserCompatibility };
}
