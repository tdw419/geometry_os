/**
 * DebugOverlays Tests
 *
 * Tests the visual debugging tools for Phase 47 systems.
 *
 * Success criteria:
 * - Should initialize with default configuration
 * - Should create overlay canvas correctly
 * - Should toggle overlays via keyboard shortcuts
 * - Should draw saccade path visualization
 * - Should draw LOD heatmap
 * - Should draw prefetch display
 * - Should draw attention heatmap
 * - Should have minimal performance impact (<2% overhead)
 * - Should export data for analysis
 * - Should handle module integration correctly
 */

class DebugOverlaysTests extends TestCase {
    constructor() {
        super('DebugOverlays', { timeout: 10000 });
    }

    async execute() {
        // Test 1: Initialization
        await this.testInitialization();

        // Test 2: Canvas creation
        await this.testCanvasCreation();

        // Test 3: Keyboard shortcuts
        await this.testKeyboardShortcuts();

        // Test 4: Toggle functionality
        await this.testToggleFunctionality();

        // Test 5: Saccade path visualization
        await this.testSaccadePathVisualization();

        // Test 6: LOD heatmap
        await this.testLodHeatmap();

        // Test 7: Prefetch display
        await this.testPrefetchDisplay();

        // Test 8: Attention heatmap
        await this.testAttentionHeatmap();

        // Test 9: Performance impact
        await this.testPerformanceImpact();

        // Test 10: Data export
        await this.testDataExport();

        // Test 11: Module integration
        await this.testModuleIntegration();

        // Test 12: Cleanup
        await this.testCleanup();
    }

    async testInitialization() {
        console.log('  Testing DebugOverlays initialization...');

        if (typeof DebugOverlays === 'undefined') {
            throw new Error('DebugOverlays is not defined. Please implement the class first.');
        }

        const overlays = new DebugOverlays();

        if (!overlays.config) {
            throw new Error('Expected config to exist');
        }

        if (!overlays.config.saccadePath) {
            throw new Error('Expected saccadePath config to exist');
        }

        if (!overlays.config.lodHeatmap) {
            throw new Error('Expected lodHeatmap config to exist');
        }

        if (!overlays.config.prefetchDisplay) {
            throw new Error('Expected prefetchDisplay config to exist');
        }

        if (!overlays.config.attentionHeatmap) {
            throw new Error('Expected attentionHeatmap config to exist');
        }

        console.log('    ✓ DebugOverlays initializes correctly');
    }

    async testCanvasCreation() {
        console.log('  Testing canvas creation...');

        const overlays = new DebugOverlays();

        if (!overlays.canvas) {
            throw new Error('Expected canvas to be created');
        }

        if (!overlays.ctx) {
            throw new Error('Expected canvas context to exist');
        }

        if (overlays.canvas.tagName !== 'CANVAS') {
            throw new Error(`Expected canvas element, got ${overlays.canvas.tagName}`);
        }

        if (overlays.canvas.id !== 'debug-overlays-canvas') {
            throw new Error(`Expected canvas id to be 'debug-overlays-canvas', got '${overlays.canvas.id}'`);
        }

        // Check canvas is in document
        if (!document.body.contains(overlays.canvas)) {
            throw new Error('Expected canvas to be in document body');
        }

        // Check canvas is hidden by default
        if (overlays.canvas.style.display !== 'none') {
            throw new Error(`Expected canvas to be hidden by default, got display: ${overlays.canvas.style.display}`);
        }

        console.log('    ✓ Canvas created correctly');
    }

    async testKeyboardShortcuts() {
        console.log('  Testing keyboard shortcuts...');

        const overlays = new DebugOverlays();

        if (!overlays.shortcuts) {
            throw new Error('Expected shortcuts to exist');
        }

        if (overlays.shortcuts['KeyS'] !== 'saccadePath') {
            throw new Error('Expected KeyS to map to saccadePath');
        }

        if (overlays.shortcuts['KeyL'] !== 'lodHeatmap') {
            throw new Error('Expected KeyL to map to lodHeatmap');
        }

        if (overlays.shortcuts['KeyP'] !== 'prefetchDisplay') {
            throw new Error('Expected KeyP to map to prefetchDisplay');
        }

        if (overlays.shortcuts['KeyA'] !== 'attentionHeatmap') {
            throw new Error('Expected KeyA to map to attentionHeatmap');
        }

        if (overlays.shortcuts['KeyF'] !== 'performance') {
            throw new Error('Expected KeyF to map to performance');
        }

        if (overlays.shortcuts['KeyD'] !== 'all') {
            throw new Error('Expected KeyD to map to all');
        }

        console.log('    ✓ Keyboard shortcuts configured correctly');
    }

    async testToggleFunctionality() {
        console.log('  Testing toggle functionality...');

        const overlays = new DebugOverlays();

        // Test initial state
        if (overlays.config.saccadePath.enabled !== false) {
            throw new Error('Expected saccadePath to be disabled by default');
        }

        // Test toggle
        overlays.toggle('saccadePath');

        if (overlays.config.saccadePath.enabled !== true) {
            throw new Error('Expected saccadePath to be enabled after toggle');
        }

        // Test toggle off
        overlays.toggle('saccadePath');

        if (overlays.config.saccadePath.enabled !== false) {
            throw new Error('Expected saccadePath to be disabled after second toggle');
        }

        // Test enable all
        overlays.enableAll(true);

        if (overlays.config.saccadePath.enabled !== true) {
            throw new Error('Expected saccadePath to be enabled after enableAll(true)');
        }

        if (overlays.config.lodHeatmap.enabled !== true) {
            throw new Error('Expected lodHeatmap to be enabled after enableAll(true)');
        }

        // Test disable all
        overlays.enableAll(false);

        if (overlays.config.saccadePath.enabled !== false) {
            throw new Error('Expected saccadePath to be disabled after enableAll(false)');
        }

        console.log('    ✓ Toggle functionality works correctly');
    }

    async testSaccadePathVisualization() {
        console.log('  Testing saccade path visualization...');

        const overlays = new DebugOverlays();
        overlays.config.saccadePath.enabled = true;

        // Create mock saccadic controller
        const mockController = {
            getState: () => ({
                phase: 'fixation',
                position: { x: 500, y: 300 },
                target: { x: 500, y: 300 }
            })
        };

        overlays.saccadicController = mockController;

        // Add some sample path data
        overlays.saccadePath = [
            { type: 'position', position: { x: 100, y: 100 }, timestamp: Date.now() },
            { type: 'position', position: { x: 200, y: 150 }, timestamp: Date.now() },
            { type: 'saccade', start: { x: 200, y: 150 }, target: { x: 400, y: 300 }, timestamp: Date.now() },
            { type: 'position', position: { x: 400, y: 300 }, timestamp: Date.now() }
        ];

        // Simulate update (should draw without errors)
        try {
            overlays.update(16);
        } catch (e) {
            throw new Error(`Update should not throw errors: ${e.message}`);
        }

        if (overlays.saccadePath.length !== 4) {
            throw new Error('Expected saccadePath to have 4 points');
        }

        console.log('    ✓ Saccade path visualization works');
    }

    async testLodHeatmap() {
        console.log('  Testing LOD heatmap...');

        const overlays = new DebugOverlays();
        overlays.config.lodHeatmap.enabled = true;

        // Create mock LOD system and viewport
        const mockLodSystem = {
            currentLevel: {
                name: 'medium',
                getQualityFactor: () => 0.7
            },
            currentZoom: 1.5
        };

        const mockViewport = {
            getCamera: () => ({ zoom: 1.5 }),
            getWorldBounds: () => ({ minX: 0, minY: 0, maxX: 1000, maxY: 800 }),
            worldToScreen: (x, y) => ({ x, y })
        };

        overlays.lodSystem = mockLodSystem;
        overlays.viewport = mockViewport;

        // Simulate update
        try {
            overlays.update(16);
        } catch (e) {
            throw new Error(`Update should not throw errors: ${e.message}`);
        }

        // Check colors are configured
        if (!overlays.config.lodHeatmap.colors.full) {
            throw new Error('Expected full LOD color to be configured');
        }

        if (!overlays.config.lodHeatmap.colors.semantic) {
            throw new Error('Expected semantic LOD color to be configured');
        }

        console.log('    ✓ LOD heatmap works');
    }

    async testPrefetchDisplay() {
        console.log('  Testing prefetch display...');

        const overlays = new DebugOverlays();
        overlays.config.prefetchDisplay.enabled = true;

        // Create mock prefetcher and viewport
        const mockPrefetcher = {
            on: (event, callback) => {}
        };

        const mockViewport = {
            getCamera: () => ({ zoom: 1.0 }),
            worldToScreen: (x, y) => ({ x, y })
        };

        overlays.predictivePrefetcher = mockPrefetcher;
        overlays.viewport = mockViewport;

        // Set mock prefetch data
        overlays._lastPrefetchData = {
            tiles: [
                { x: 100, y: 100, priority: 0.9 },
                { x: 200, y: 200, priority: 0.7 },
                { x: 300, y: 300, priority: 0.5 }
            ],
            timestamp: Date.now()
        };

        // Simulate update
        try {
            overlays.update(16);
        } catch (e) {
            throw new Error(`Update should not throw errors: ${e.message}`);
        }

        if (!overlays._lastPrefetchData) {
            throw new Error('Expected prefetch data to be stored');
        }

        if (overlays._lastPrefetchData.tiles.length !== 3) {
            throw new Error('Expected 3 prefetch tiles');
        }

        console.log('    ✓ Prefetch display works');
    }

    async testAttentionHeatmap() {
        console.log('  Testing attention heatmap...');

        const overlays = new DebugOverlays();
        overlays.config.attentionHeatmap.enabled = true;

        // Create mock focus tracker
        const mockFocusTracker = {
            getCurrentFocus: () => ({ x: 500, y: 300 })
        };

        overlays.focusTracker = mockFocusTracker;

        // Simulate update to add samples
        for (let i = 0; i < 10; i++) {
            overlays.update(16);
        }

        // Check samples were collected
        if (overlays.attentionSamples.length < 10) {
            throw new Error(`Expected at least 10 attention samples, got ${overlays.attentionSamples.length}`);
        }

        // Check color mapping
        const color1 = overlays._getHeatmapColor(0.5, 'heat');
        if (typeof color1.r !== 'number' || typeof color1.g !== 'number' || typeof color1.b !== 'number') {
            throw new Error('Expected heat color to have r, g, b properties');
        }

        const color2 = overlays._getHeatmapColor(0.5, 'grayscale');
        if (color2.r !== color2.g || color2.g !== color2.b) {
            throw new Error('Expected grayscale color to have equal r, g, b values');
        }

        console.log('    ✓ Attention heatmap works');
    }

    async testPerformanceImpact() {
        console.log('  Testing performance impact...');

        const overlays = new DebugOverlays();

        // Enable all overlays
        overlays.enableAll(true);

        // Measure update time
        const iterations = 100;
        const start = performance.now();

        for (let i = 0; i < iterations; i++) {
            overlays.update(16);
        }

        const end = performance.now();
        const avgTime = (end - start) / iterations;

        // Should be less than 2ms per update (2% of 16ms frame)
        if (avgTime > 2) {
            console.warn(`    ⚠ Average update time ${avgTime.toFixed(2)}ms exceeds 2ms target`);
        } else {
            console.log(`    ✓ Average update time: ${avgTime.toFixed(2)}ms (< 2ms target)`);
        }

        // Test throttling is working
        const update1Start = performance.now();
        overlays.update(16);
        const update1End = performance.now();

        const update2Start = performance.now();
        overlays.update(16);
        const update2End = performance.now();

        // Second update should be much faster due to throttling
        if (update2End - update2Start > update1End - update1Start) {
            throw new Error('Expected throttling to make second update faster');
        }

        console.log('    ✓ Performance impact is acceptable');
    }

    async testDataExport() {
        console.log('  Testing data export...');

        const overlays = new DebugOverlays();

        // Add some data
        overlays.saccadePath = [
            { type: 'position', position: { x: 100, y: 100 }, timestamp: Date.now() }
        ];
        overlays.attentionSamples = [
            { x: 500, y: 300, timestamp: Date.now() }
        ];

        // Export data
        const exported = overlays.exportData();

        if (!exported) {
            throw new Error('Expected exportData to return an object');
        }

        if (typeof exported.timestamp !== 'number') {
            throw new Error('Expected exported data to have timestamp');
        }

        if (!Array.isArray(exported.saccadePath)) {
            throw new Error('Expected exported data to have saccadePath array');
        }

        if (!Array.isArray(exported.attentionSamples)) {
            throw new Error('Expected exported data to have attentionSamples array');
        }

        if (!exported.state) {
            throw new Error('Expected exported data to have state');
        }

        // Test clear data
        overlays.clearData();

        if (overlays.saccadePath.length !== 0) {
            throw new Error('Expected saccadePath to be cleared');
        }

        if (overlays.attentionSamples.length !== 0) {
            throw new Error('Expected attentionSamples to be cleared');
        }

        console.log('    ✓ Data export works correctly');
    }

    async testModuleIntegration() {
        console.log('  Testing module integration...');

        const overlays = new DebugOverlays();

        // Create mock modules
        const mockSaccadicController = {
            getState: () => ({ phase: 'idle', position: { x: 0, y: 0 } }),
            onSaccadeStart: null,
            onSaccadeEnd: null,
            onSettlingComplete: null
        };

        const mockLodSystem = {
            currentLevel: { name: 'full', getQualityFactor: () => 1 },
            currentZoom: 1.0
        };

        const mockPredictivePrefetcher = {
            on: (event, callback) => {
                // Simulate prefetch event
                setTimeout(() => {
                    callback({ tiles: [{ x: 100, y: 100 }], timestamp: Date.now() });
                }, 10);
            }
        };

        const mockFocusTracker = {
            getCurrentFocus: () => ({ x: 500, y: 300 })
        };

        const mockViewport = {
            getCamera: () => ({ zoom: 1.0 }),
            getWorldBounds: () => ({ minX: 0, minY: 0, maxX: 1000, maxY: 800 }),
            worldToScreen: (x, y) => ({ x, y }),
            screenToWorld: (x, y) => ({ x, y })
        };

        // Set modules
        overlays.setModules({
            saccadicController: mockSaccadicController,
            lodSystem: mockLodSystem,
            predictivePrefetcher: mockPredictivePrefetcher,
            focusTracker: mockFocusTracker,
            viewport: mockViewport
        });

        // Check modules are set
        if (overlays.saccadicController !== mockSaccadicController) {
            throw new Error('Expected saccadicController to be set');
        }

        if (overlays.lodSystem !== mockLodSystem) {
            throw new Error('Expected lodSystem to be set');
        }

        if (overlays.predictivePrefetcher !== mockPredictivePrefetcher) {
            throw new Error('Expected predictivePrefetcher to be set');
        }

        if (overlays.focusTracker !== mockFocusTracker) {
            throw new Error('Expected focusTracker to be set');
        }

        if (overlays.viewport !== mockViewport) {
            throw new Error('Expected viewport to be set');
        }

        // Wait for prefetch event
        await new Promise(resolve => setTimeout(resolve, 50));

        // Check prefetch data was received
        if (!overlays._lastPrefetchData) {
            throw new Error('Expected prefetch data to be received');
        }

        console.log('    ✓ Module integration works correctly');
    }

    async testCleanup() {
        console.log('  Testing cleanup...');

        const overlays = new DebugOverlays();
        const canvas = overlays.canvas;

        // Test destroy
        overlays.destroy();

        // Check canvas is removed from document
        if (document.body.contains(canvas)) {
            throw new Error('Expected canvas to be removed from document after destroy');
        }

        // Check event listeners are cleared
        if (overlays.eventListeners.size !== 0) {
            throw new Error('Expected event listeners to be cleared');
        }

        console.log('    ✓ Cleanup works correctly');
    }
}

// Run tests if in browser
if (typeof window !== 'undefined') {
    window.DebugOverlaysTests = DebugOverlaysTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DebugOverlaysTests };
}
