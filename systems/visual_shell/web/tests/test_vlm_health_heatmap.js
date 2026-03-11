/**
 * Tests for VLM Health Heatmap visualization
 *
 * Tests the VLMHealthHeatmap class which provides visual feedback
 * for VLM (Vision-Language Model) health monitoring of PixelRTS images.
 *
 * @class VLMHealthHeatmapTests
 */

class VLMHealthHeatmapTests {
    constructor() {
        this.results = [];
        this.mockContainer = null;
        this.heatmap = null;
    }

    /**
     * Create mock DOM elements for testing
     */
    static createMockObjects() {
        // Mock document.createElement
        if (typeof document === 'undefined') {
            global.document = {
                createElement: function(tag) {
                    return {
                        tagName: tag,
                        id: null,
                        className: '',
                        style: {},
                        childNodes: [],
                        appendChild: function(child) { this.childNodes.push(child); },
                        removeChild: function(child) {
                            this.childNodes = this.childNodes.filter(c => c !== child);
                        },
                        getContext: function() {
                            return {
                                fillStyle: '#000000',
                                fillRect: function() {},
                                strokeRect: function() {},
                                clearRect: function() {},
                                fillText: function() {},
                                measureText: function(text) { return { width: text.length * 8 }; },
                                beginPath: function() {},
                                moveTo: function() {},
                                lineTo: function() {},
                                stroke: function() {},
                                fill: function() {},
                                arc: function() {},
                                createLinearGradient: function() {
                                    return {
                                        addColorStop: function() {}
                                    };
                                }
                            };
                        },
                        width: 800,
                        height: 600,
                        addEventListener: function() {},
                        removeEventListener: function() {}
                    };
                },
                getElementById: function(id) {
                    const el = this.createElement('div');
                    el.id = id;
                    return el;
                },
                body: {
                    appendChild: function(child) {},
                    removeChild: function(child) {}
                }
            };
        }
    }

    /**
     * Initialize mock container for testing
     */
    setupMockContainer() {
        this.mockContainer = {
            tagName: 'DIV',
            id: 'test-heatmap-container',
            className: '',
            style: { width: '800px', height: '600px' },
            childNodes: [],
            appendChild: function(child) { this.childNodes.push(child); },
            removeChild: function(child) { this.childNodes = this.childNodes.filter(c => c !== child); }
        };
        return this.mockContainer;
    }

    /**
     * Clean up after tests
     */
    teardown() {
        this.heatmap = null;
        this.mockContainer = null;
    }

    /**
     * Test 1: Verify heatmap initializes with container
     */
    testInitialization() {
        const container = this.setupMockContainer();

        try {
            this.heatmap = new VLMHealthHeatmap(container);

            const passed = this.heatmap.container === container &&
                          this.heatmap.canvas !== undefined &&
                          this.heatmap.ctx !== undefined;

            return {
                name: 'testInitialization',
                description: 'Verify heatmap initializes with container',
                passed: passed ? 1 : 0,
                failed: passed ? 0 : 1,
                total: 1,
                message: passed ? 'Container and canvas initialized correctly' : 'Initialization failed'
            };
        } catch (error) {
            return {
                name: 'testInitialization',
                description: 'Verify heatmap initializes with container',
                passed: 0,
                failed: 1,
                total: 1,
                message: `Error: ${error.message}`
            };
        }
    }

    /**
     * Test 2: Verify health status renders correctly
     */
    testHealthStatusRender() {
        const container = this.setupMockContainer();

        try {
            this.heatmap = new VLMHealthHeatmap(container);

            const healthData = {
                status: 'healthy',
                confidence: 0.85,
                anomalies: [],
                metadata: { entropy_mean: 45.2 }
            };

            this.heatmap.renderHealthStatus(healthData);

            const canvas = this.heatmap.canvas;
            const hasCanvas = canvas && canvas.width > 0 && canvas.height > 0;
            const hasCurrentStatus = this.heatmap.currentStatus === 'healthy';

            const passed = hasCanvas && hasCurrentStatus;

            return {
                name: 'testHealthStatusRender',
                description: 'Verify health status renders correctly',
                passed: passed ? 1 : 0,
                failed: passed ? 0 : 1,
                total: 1,
                message: passed ? 'Health status rendered successfully' : 'Health status render failed'
            };
        } catch (error) {
            return {
                name: 'testHealthStatusRender',
                description: 'Verify health status renders correctly',
                passed: 0,
                failed: 1,
                total: 1,
                message: `Error: ${error.message}`
            };
        }
    }

    /**
     * Test 3: Verify anomaly regions are highlighted
     */
    testAnomalyHighlight() {
        const container = this.setupMockContainer();

        try {
            this.heatmap = new VLMHealthHeatmap(container);

            const healthData = {
                status: 'unhealthy',
                confidence: 0.9,
                anomalies: [
                    {
                        region: '(0, 0) to (256, 256)',
                        severity: 'high',
                        type: 'data_corruption'
                    }
                ]
            };

            this.heatmap.renderHealthStatus(healthData);

            const highlights = this.heatmap.getAnomalyHighlights();
            const hasHighlight = highlights && highlights.length === 1;
            const correctRegion = hasHighlight && highlights[0].region === '(0, 0) to (256, 256)';

            const passed = hasHighlight && correctRegion;

            return {
                name: 'testAnomalyHighlight',
                description: 'Verify anomaly regions are highlighted',
                passed: passed ? 1 : 0,
                failed: passed ? 0 : 1,
                total: 1,
                message: passed ? 'Anomaly highlighted correctly' : 'Anomaly highlight failed'
            };
        } catch (error) {
            return {
                name: 'testAnomalyHighlight',
                description: 'Verify anomaly regions are highlighted',
                passed: 0,
                failed: 1,
                total: 1,
                message: `Error: ${error.message}`
            };
        }
    }

    /**
     * Test 4: Verify heatmap updates on new data
     */
    testUpdateOnNewData() {
        const container = this.setupMockContainer();

        try {
            this.heatmap = new VLMHealthHeatmap(container);

            const initialData = { status: 'healthy', anomalies: [] };
            this.heatmap.renderHealthStatus(initialData);

            const updatedData = {
                status: 'degraded',
                anomalies: [{
                    region: '(100, 100) to (200, 200)',
                    severity: 'medium'
                }]
            };

            this.heatmap.renderHealthStatus(updatedData);

            const statusUpdated = this.heatmap.currentStatus === 'degraded';
            const anomalyCountCorrect = this.heatmap.anomalyCount === 1;

            const passed = statusUpdated && anomalyCountCorrect;

            return {
                name: 'testUpdateOnNewData',
                description: 'Verify heatmap updates on new data',
                passed: passed ? 1 : 0,
                failed: passed ? 0 : 1,
                total: 1,
                message: passed ? 'Heatmap updated successfully' : 'Heatmap update failed'
            };
        } catch (error) {
            return {
                name: 'testUpdateOnNewData',
                description: 'Verify heatmap updates on new data',
                passed: 0,
                failed: 1,
                total: 1,
                message: `Error: ${error.message}`
            };
        }
    }

    /**
     * Test 5: Verify getHighlights returns correct data
     */
    testGetHighlights() {
        const container = this.setupMockContainer();

        try {
            this.heatmap = new VLMHealthHeatmap(container);

            const healthData = {
                status: 'unhealthy',
                confidence: 0.95,
                anomalies: [
                    {
                        region: '(0, 0) to (128, 128)',
                        severity: 'critical',
                        type: 'header_corruption'
                    },
                    {
                        region: '(256, 256) to (384, 384)',
                        severity: 'low',
                        type: 'artifact'
                    }
                ]
            };

            this.heatmap.renderHealthStatus(healthData);

            const highlights = this.heatmap.getAnomalyHighlights();
            const hasCorrectCount = highlights && highlights.length === 2;
            const hasFirstRegion = hasCorrectCount && highlights[0].region === '(0, 0) to (128, 128)';
            const hasSecondRegion = hasCorrectCount && highlights[1].region === '(256, 256) to (384, 384)';

            const passed = hasCorrectCount && hasFirstRegion && hasSecondRegion;

            return {
                name: 'testGetHighlights',
                description: 'Verify getHighlights returns correct data',
                passed: passed ? 1 : 0,
                failed: passed ? 0 : 1,
                total: 1,
                message: passed ? 'GetHighlights returned correct data' : 'GetHighlights failed'
            };
        } catch (error) {
            return {
                name: 'testGetHighlights',
                description: 'Verify getHighlights returns correct data',
                passed: 0,
                failed: 1,
                total: 1,
                message: `Error: ${error.message}`
            };
        }
    }

    /**
     * Run all tests and return aggregated results
     */
    async runAll() {
        // Setup mock environment if needed
        VLMHealthHeatmapTests.createMockObjects();

        this.results = [];

        // Run all tests
        this.results.push(this.testInitialization());
        this.teardown();

        this.results.push(this.testHealthStatusRender());
        this.teardown();

        this.results.push(this.testAnomalyHighlight());
        this.teardown();

        this.results.push(this.testUpdateOnNewData());
        this.teardown();

        this.results.push(this.testGetHighlights());
        this.teardown();

        // Aggregate results
        const total = this.results.length;
        const passed = this.results.filter(r => r.passed > 0).length;
        const failed = this.results.filter(r => r.failed > 0).length;

        return {
            total,
            passed,
            failed,
            tests: this.results
        };
    }
}

// Export for use in test runner
if (typeof module !== 'undefined' && module.exports) {
    module.exports = VLMHealthHeatmapTests;
}

// Also attach to window for browser test runner
if (typeof window !== 'undefined') {
    window.VLMHealthHeatmapTests = VLMHealthHeatmapTests;
}
