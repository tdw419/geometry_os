/**
 * FoveatedRenderer
 *
 * Orchestrates foveated (multi-resolution) rendering for Geometry OS.
 * Combines:
 * - SaccadeEngine for biological focus tracking
 * - PeripheralSubsampler for resolution scaling
 * - GPULoadMonitor for performance measurement
 *
 * Goal: Prove 50%+ GPU load reduction in peripheral regions.
 */

// ============================================================================
// FALLBACK DEPENDENCIES (will be replaced by actual implementations)
// ============================================================================

// Fallback PeripheralSubsampler (inline for Task 3 independence)
class PeripheralSubsampler {
    constructor(config = {}) {
        this.config = {
            fovealRadius: config.fovealRadius || 50,
            parafovealRadius: config.parafovealRadius || 150,
            peripheralRadius: config.peripheralRadius || 400,
            fovealResolution: config.fovealResolution || 1.0,
            parafovealResolution: config.parafovealResolution || 0.5,
            peripheralResolution: config.peripheralResolution || 0.25,
            transitionSmoothing: config.transitionSmoothing || 0.1
        };
        this.focusX = 0;
        this.focusY = 0;
        this.stats = {
            fovealPixels: 0,
            parafovealPixels: 0,
            peripheralPixels: 0,
            totalPixels: 0
        };
    }

    setFocus(x, y) {
        this.focusX = x;
        this.focusY = y;
    }

    getRegion(x, y, focusX, focusY) {
        const dx = x - focusX;
        const dy = y - focusY;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance <= this.config.fovealRadius) {
            return 'foveal';
        } else if (distance <= this.config.parafovealRadius) {
            return 'parafoveal';
        } else {
            return 'peripheral';
        }
    }

    getResolution(x, y, focusX, focusY) {
        const region = this.getRegion(x, y, focusX, focusY);

        switch (region) {
            case 'foveal':
                return this.config.fovealResolution;
            case 'parafoveal':
                return this.config.parafovealResolution;
            case 'peripheral':
            default:
                return this.config.peripheralResolution;
        }
    }

    calculateLoadReduction(tiles, focusX, focusY) {
        let fovealPixels = 0;
        let parafovealPixels = 0;
        let peripheralPixels = 0;
        let totalPixels = 0;
        let weightedPixels = 0;

        for (const tile of tiles) {
            const centerX = tile.x + tile.width / 2;
            const centerY = tile.y + tile.height / 2;
            const pixels = tile.width * tile.height;

            const region = this.getRegion(centerX, centerY, focusX, focusY);
            const resolution = this.getResolution(centerX, centerY, focusX, focusY);

            totalPixels += pixels;
            weightedPixels += pixels * resolution;

            if (region === 'foveal') {
                fovealPixels += pixels;
            } else if (region === 'parafoveal') {
                parafovealPixels += pixels;
            } else {
                peripheralPixels += pixels;
            }
        }

        const loadReduction = 1 - (weightedPixels / totalPixels);

        return {
            totalPixels,
            weightedPixels,
            loadReduction: loadReduction * 100,
            fovealPixels,
            parafovealPixels,
            peripheralPixels,
            meetsTarget: loadReduction >= 0.5
        };
    }

    getStats() {
        return {
            ...this.stats,
            config: this.config,
            focus: { x: this.focusX, y: this.focusY }
        };
    }
}

// Fallback GPULoadMonitor (inline for Task 3 independence)
class GPULoadMonitor {
    constructor(config = {}) {
        this.config = {
            sampleWindow: config.sampleWindow || 100,
            baselineGpuTime: config.baselineGpuTime || 16.0,
            ...config
        };

        this.isMeasuring = false;
        this.frameStartTime = 0;
        this.supportsTimestampQueries = false;
        this.gpuTimes = [];
        this.frameCount = 0;
        this.device = null;
        this.querySet = null;
    }

    async initializeWebGPU(device) {
        this.device = device;

        if (device.features && device.features.has('timestamp-query')) {
            this.supportsTimestampQueries = true;
            this.querySet = device.createQuerySet({
                type: 'timestamp',
                count: 2
            });
        }
    }

    startFrame() {
        this.frameStartTime = performance.now();
        this.isMeasuring = true;
    }

    endFrame() {
        if (!this.isMeasuring) {
            return 0;
        }

        const cpuTime = performance.now() - this.frameStartTime;
        this.isMeasuring = false;
        let gpuTime = cpuTime;

        this.gpuTimes.push(gpuTime);
        if (this.gpuTimes.length > this.config.sampleWindow) {
            this.gpuTimes.shift();
        }

        this.frameCount++;
        return gpuTime;
    }

    setBaseline(baselineMs) {
        this.config.baselineGpuTime = baselineMs;
    }

    getStats() {
        if (this.gpuTimes.length === 0) {
            return {
                meanGpuTime: 0,
                minGpuTime: 0,
                maxGpuTime: 0,
                frameCount: this.frameCount
            };
        }

        const sum = this.gpuTimes.reduce((a, b) => a + b, 0);
        const mean = sum / this.gpuTimes.length;

        return {
            meanGpuTime: mean,
            minGpuTime: Math.min(...this.gpuTimes),
            maxGpuTime: Math.max(...this.gpuTimes),
            frameCount: this.frameCount,
            samples: this.gpuTimes.length
        };
    }

    getLoadReduction() {
        const stats = this.getStats();
        const baseline = this.config.baselineGpuTime;
        const current = stats.meanGpuTime;

        const reduction = baseline - current;
        const percentReduction = (reduction / baseline) * 100;

        return {
            baselineMs: baseline,
            currentMs: current,
            reductionMs: reduction,
            percentReduction: Math.max(0, percentReduction),
            meetsTarget: percentReduction >= 50
        };
    }

    reset() {
        this.gpuTimes = [];
        this.frameCount = 0;
        this.isMeasuring = false;
    }
}

// ============================================================================
// FoveatedRenderer (main orchestrator)
// ============================================================================

class FoveatedRenderer {
    constructor(config = {}) {
        this.config = {
            viewportWidth: config.viewportWidth || 1920,
            viewportHeight: config.viewportHeight || 1080,
            ...config
        };

        // Use existing SaccadeEngine or create a minimal mock
        if (typeof SaccadeEngine !== 'undefined') {
            this.saccadeEngine = new SaccadeEngine({
                fovealRadius: 50,
                parafovealRadius: 150,
                peripheralRadius: 400
            });
        } else {
            // Minimal SaccadeEngine mock
            this.saccadeEngine = {
                config: {
                    fovealRadius: 50,
                    parafovealRadius: 150,
                    peripheralRadius: 400
                },
                state: {
                    currentFocus: { x: config.viewportWidth / 2 || 960, y: config.viewportHeight / 2 || 540 }
                }
            };
        }

        this.subsampler = new PeripheralSubsampler({
            fovealRadius: 50,
            parafovealRadius: 150,
            peripheralRadius: 400
        });

        this.loadMonitor = new GPULoadMonitor();

        // Current focus state
        this.focusX = this.config.viewportWidth / 2;
        this.focusY = this.config.viewportHeight / 2;
        this.targetX = this.focusX;
        this.targetY = this.focusY;

        // Saccade state
        this.isSaccading = false;
        this.saccadeProgress = 0;

        // Rendering statistics
        this.stats = {
            framesRendered: 0,
            fovealPasses: 0,
            peripheralPasses: 0,
            totalLoadReduction: 0
        };

        console.log('✓ FoveatedRenderer initialized');
    }

    /**
     * Set the current focus point.
     * @param {number} x - Focus X coordinate
     * @param {number} y - Focus Y coordinate
     */
    setFocus(x, y) {
        this.focusX = x;
        this.focusY = y;
        this.subsampler.setFocus(x, y);

        // Update SaccadeEngine if available
        if (this.saccadeEngine.state) {
            this.saccadeEngine.state.currentFocus = { x, y };
        }
    }

    /**
     * Get current focus point.
     * @returns {Object} Focus coordinates {x, y}
     */
    getFocus() {
        return { x: this.focusX, y: this.focusY };
    }

    /**
     * Trigger a saccade to a new target.
     * @param {number} x - Target X coordinate
     * @param {number} y - Target Y coordinate
     */
    triggerSaccade(x, y) {
        const dx = x - this.focusX;
        const dy = y - this.focusY;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance > 20) { // Minimum saccade threshold
            this.targetX = x;
            this.targetY = y;
            this.isSaccading = true;
            this.saccadeProgress = 0;
        }
    }

    /**
     * Update the renderer state (call each frame).
     * @param {number} deltaTime - Time since last update in ms
     */
    update(deltaTime) {
        // Update saccade if in progress
        if (this.isSaccading) {
            this.saccadeProgress += deltaTime / 100; // ~100ms saccade duration

            if (this.saccadeProgress >= 1) {
                this.focusX = this.targetX;
                this.focusY = this.targetY;
                this.isSaccading = false;
                this.saccadeProgress = 0;
            } else {
                // Ease-out cubic interpolation
                const t = 1 - Math.pow(1 - this.saccadeProgress, 3);
                this.focusX = this.focusX + (this.targetX - this.focusX) * t;
                this.focusY = this.focusY + (this.targetY - this.focusY) * t;
            }

            this.subsampler.setFocus(this.focusX, this.focusY);

            // Update SaccadeEngine if available
            if (this.saccadeEngine.state) {
                this.saccadeEngine.state.currentFocus = { x: this.focusX, y: this.focusY };
            }
        }
    }

    /**
     * Calculate multi-resolution passes for a set of tiles.
     * @param {Array} tiles - Array of tile objects
     * @returns {Object} Pass assignments
     */
    calculatePasses(tiles) {
        const foveal = [];
        const parafoveal = [];
        const peripheral = [];

        for (const tile of tiles) {
            const centerX = tile.x + tile.width / 2;
            const centerY = tile.y + tile.height / 2;

            const region = this.subsampler.getRegion(centerX, centerY, this.focusX, this.focusY);

            if (region === 'foveal') {
                foveal.push(tile);
            } else if (region === 'parafoveal') {
                parafoveal.push(tile);
            } else {
                peripheral.push(tile);
            }
        }

        return { foveal, parafoveal, peripheral };
    }

    /**
     * Calculate load reduction for a set of tiles.
     * @param {Array} tiles - Array of tile objects
     * @returns {Object} Load reduction statistics
     */
    calculateLoadReduction(tiles) {
        return this.subsampler.calculateLoadReduction(tiles, this.focusX, this.focusY);
    }

    /**
     * Render a frame with foveated optimization.
     * @param {Array} tiles - Tiles to render
     * @returns {Object} Render statistics
     */
    render(tiles) {
        this.loadMonitor.startFrame();

        const passes = this.calculatePasses(tiles);

        // Simulate rendering at different resolutions
        // In real implementation, this would dispatch GPU work
        let gpuWork = 0;

        // Foveal pass: full resolution
        gpuWork += passes.foveal.length * 1.0;

        // Parafoveal pass: 0.5 resolution
        gpuWork += passes.parafoveal.length * 0.5;

        // Peripheral pass: 0.25 resolution
        gpuWork += passes.peripheral.length * 0.25;

        this.loadMonitor.endFrame();

        this.stats.framesRendered++;
        this.stats.fovealPasses += passes.foveal.length;
        this.stats.peripheralPasses += passes.peripheral.length;

        return {
            fovealTiles: passes.foveal.length,
            parafovealTiles: passes.parafoveal.length,
            peripheralTiles: passes.peripheral.length,
            gpuWork
        };
    }

    /**
     * Get renderer statistics.
     * @returns {Object} Statistics object
     */
    getStats() {
        return {
            ...this.stats,
            focus: this.getFocus(),
            isSaccading: this.isSaccading,
            loadMonitor: this.loadMonitor.getStats()
        };
    }

    /**
     * Verify the 50% load reduction target.
     * @param {Array} tiles - Tiles to test
     * @returns {Object} Verification result
     */
    verify50PercentReduction(tiles) {
        const reduction = this.calculateLoadReduction(tiles);
        const loadStats = this.loadMonitor.getStats();

        return {
            passed: reduction.loadReduction >= 50,
            loadReduction: reduction.loadReduction,
            targetReduction: 50,
            details: {
                totalPixels: reduction.totalPixels,
                weightedPixels: reduction.weightedPixels,
                fovealPixels: reduction.fovealPixels,
                parafovealPixels: reduction.parafovealPixels,
                peripheralPixels: reduction.peripheralPixels
            }
        };
    }
}

// Export
if (typeof window !== 'undefined') {
    window.FoveatedRenderer = FoveatedRenderer;
    window.PeripheralSubsampler = PeripheralSubsampler;
    window.GPULoadMonitor = GPULoadMonitor;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { FoveatedRenderer, PeripheralSubsampler, GPULoadMonitor };
}
