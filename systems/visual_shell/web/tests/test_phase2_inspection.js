/**
 * Test Suite for Phase 2: Deep Inspection & Interaction
 * 
 * Tests the following features:
 * - LayerMapper integration
 * - Neural address resolution
 * - LayerTooltip with neural address display
 * - Poke interaction
 * - Layer isolation
 */

class Phase2InspectionTests {
    constructor() {
        this.results = [];
        this.mockContainer = null;
        this.overlay = null;
    }

    /**
     * Create mock PIXI objects for testing
     */
    static createMockObjects() {
        // Mock PIXI.Container
        if (typeof PIXI === 'undefined') {
            global.PIXI = {
                Container: class Container {
                    constructor() {
                        this.children = [];
                        this.parent = null;
                        this.visible = true;
                        this.alpha = 1;
                        this.zIndex = 0;
                        this.x = 0;
                        this.y = 0;
                        this.width = 800;
                        this.height = 600;
                        this.hitArea = null;
                        this.eventMode = 'static';
                    }
                    addChild(child) { this.children.push(child); child.parent = this; }
                    removeChild(child) { this.children = this.children.filter(c => c !== child); }
                    on() { }
                    emit() { }
                },
                Graphics: class Graphics {
                    constructor() {
                        this.children = [];
                        this.visible = true;
                        this.alpha = 1;
                        this.zIndex = 0;
                        this.x = 0;
                        this.y = 0;
                    }
                    beginFill() { return this; }
                    endFill() { return this; }
                    lineStyle() { return this; }
                    drawRoundedRect() { return this; }
                    drawCircle() { return this; }
                    clear() { }
                    destroy() { }
                },
                Text: class Text {
                    constructor(text, style) {
                        this.text = text;
                        this.style = style;
                        this.x = 0;
                        this.y = 0;
                        this.width = 100;
                        this.height = 20;
                    }
                    destroy() { }
                },
                Rectangle: class Rectangle {
                    constructor(x, y, width, height) {
                        this.x = x;
                        this.y = y;
                        this.width = width;
                        this.height = height;
                    }
                }
            };
        }

        return new PIXI.Container();
    }

    /**
     * Run all Phase 2 tests
     */
    async runAll() {
        console.log('\n🧪 Phase 2: Deep Inspection & Interaction Tests');
        console.log('='.repeat(60));

        // Setup
        this.mockContainer = Phase2InspectionTests.createMockObjects();

        // Test 1: LayerMapper Initialization
        await this.testLayerMapperInitialization();

        // Test 2: Neural Address Resolution
        await this.testNeuralAddressResolution();

        // Test 3: LayerTooltip Neural Address Display
        await this.testLayerTooltipNeuralAddress();

        // Test 4: Poke Button Creation
        await this.testPokeButtonCreation();

        // Test 5: Poke Callback
        await this.testPokeCallback();

        // Test 6: Layer Metadata Loading
        await this.testLayerMetadataLoading();

        // Test 7: Hilbert Index Calculation
        await this.testHilbertIndexCalculation();

        // Test 8: Layer Isolation
        await this.testLayerIsolation();

        // Generate report
        return this.generateReport();
    }

    /**
     * Test 1: LayerMapper Initialization
     */
    async testLayerMapperInitialization() {
        const testName = 'LayerMapper Initialization';
        try {
            if (typeof NeuralHeatmapOverlay === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'NeuralHeatmapOverlay not available' });
                return;
            }

            const overlay = new NeuralHeatmapOverlay({ container: this.mockContainer });
            const layerMapper = overlay.getLayerMapper();

            if (layerMapper && typeof layerMapper.hilbertXy2d === 'function') {
                this.results.push({ name: testName, passed: true, message: 'LayerMapper initialized correctly' });
            } else {
                this.results.push({ name: testName, passed: false, message: 'LayerMapper not initialized or missing methods' });
            }
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 2: Neural Address Resolution
     */
    async testNeuralAddressResolution() {
        const testName = 'Neural Address Resolution';
        try {
            if (typeof NeuralHeatmapOverlay === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'NeuralHeatmapOverlay not available' });
                return;
            }

            const overlay = new NeuralHeatmapOverlay({ container: this.mockContainer });

            // Create mock tile
            const mockTile = {
                sprite: { x: 0, y: 0, width: 100, height: 100, name: 'test_attention_layer' },
                attachment: { data: { name: 'layer.0.self_attn.q_proj' } }
            };
            const mockPosition = { x: 50, y: 50 };

            const layerInfo = overlay.getLayerInfoAt(mockTile, mockPosition);

            if (layerInfo && layerInfo.neuralAddress) {
                const hasLayer = layerInfo.neuralAddress.layer !== null;
                const hasHead = layerInfo.neuralAddress.head !== null;
                const hasNeuron = layerInfo.neuralAddress.neuron !== null;

                if (hasLayer || hasHead || hasNeuron) {
                    this.results.push({
                        name: testName,
                        passed: true,
                        message: `Neural address resolved: L=${layerInfo.neuralAddress.layer}, H=${layerInfo.neuralAddress.head}, N=${layerInfo.neuralAddress.neuron}`
                    });
                } else {
                    this.results.push({ name: testName, passed: false, message: 'Neural address fields are all null' });
                }
            } else {
                this.results.push({ name: testName, passed: false, message: 'getLayerInfoAt did not return neural address' });
            }
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 3: LayerTooltip Neural Address Display
     */
    async testLayerTooltipNeuralAddress() {
        const testName = 'LayerTooltip Neural Address Display';
        try {
            if (typeof LayerTooltip === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'LayerTooltip not available' });
                return;
            }

            const tooltip = new LayerTooltip({ showNeuralAddress: true });
            const container = tooltip.create();

            const testData = {
                name: 'layer.0.self_attn.q_proj',
                type: 'attention',
                shape: [32, 32, 128],
                activity: 0.75,
                neuralAddress: { layer: 0, head: 5, neuron: 1234 },
                hilbertIndex: 50000
            };

            tooltip.updateContent(testData);

            // Check if info text contains neural address info
            const infoText = tooltip.infoText.text;
            const hasNeuralAddress = infoText.includes('Neural Address') || infoText.includes('Layer:');

            if (hasNeuralAddress) {
                this.results.push({ name: testName, passed: true, message: 'LayerTooltip displays neural address' });
            } else {
                this.results.push({ name: testName, passed: false, message: 'LayerTooltip missing neural address display' });
            }

            tooltip.destroy();
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 4: Poke Button Creation
     */
    async testPokeButtonCreation() {
        const testName = 'Poke Button Creation';
        try {
            if (typeof LayerTooltip === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'LayerTooltip not available' });
                return;
            }

            const tooltip = new LayerTooltip({ showPokeButton: true });
            const container = tooltip.create();

            const testData = {
                name: 'test_layer',
                type: 'attention',
                neuralAddress: { layer: 0, head: 5, neuron: 1234 }
            };

            tooltip.updateContent(testData);

            // Check if poke button was created
            if (tooltip.pokeButton) {
                this.results.push({ name: testName, passed: true, message: 'Poke button created successfully' });
            } else {
                this.results.push({ name: testName, passed: false, message: 'Poke button not created' });
            }

            tooltip.destroy();
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 5: Poke Callback
     */
    async testPokeCallback() {
        const testName = 'Poke Callback';
        try {
            if (typeof LayerTooltip === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'LayerTooltip not available' });
                return;
            }

            const tooltip = new LayerTooltip({ showPokeButton: true });
            const container = tooltip.create();

            let pokeReceived = false;
            let receivedAddress = null;

            tooltip.onPoke = (address) => {
                pokeReceived = true;
                receivedAddress = address;
            };

            const testData = {
                name: 'test_layer',
                type: 'attention',
                neuralAddress: { layer: 0, head: 5, neuron: 1234 }
            };

            tooltip.updateContent(testData);

            // Simulate poke callback
            if (tooltip.pokeButton && tooltip.onPoke) {
                tooltip.onPoke(testData.neuralAddress);

                if (pokeReceived && receivedAddress.layer === 0) {
                    this.results.push({ name: testName, passed: true, message: 'Poke callback triggered correctly' });
                } else {
                    this.results.push({ name: testName, passed: false, message: 'Poke callback did not receive correct address' });
                }
            } else {
                this.results.push({ name: testName, passed: false, message: 'Poke callback not set up' });
            }

            tooltip.destroy();
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 6: Layer Metadata Loading
     */
    async testLayerMetadataLoading() {
        const testName = 'Layer Metadata Loading';
        try {
            if (typeof NeuralHeatmapOverlay === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'NeuralHeatmapOverlay not available' });
                return;
            }

            const overlay = new NeuralHeatmapOverlay({ container: this.mockContainer });

            // Check if method exists
            if (typeof overlay.loadLayerMetadata !== 'function') {
                this.results.push({ name: testName, passed: false, message: 'loadLayerMetadata method not found' });
                return;
            }

            // Create mock metadata
            const mockMetadata = {
                format: 'PixelRTS 1.0',
                grid_size: 2048,
                encoding: { bytes_per_pixel: 4 },
                offsets: {
                    'layer.0.self_attn.q_proj': { start: 0, end: 10000, size: 10000 },
                    'layer.0.mlp.fc1': { start: 10000, end: 25000, size: 15000 }
                }
            };

            const result = await overlay.loadLayerMetadata(mockMetadata);

            if (result) {
                const boundaries = overlay.getLayerBoundaries();
                if (boundaries.size >= 2) {
                    this.results.push({ name: testName, passed: true, message: `Loaded ${boundaries.size} layer boundaries` });
                } else {
                    this.results.push({ name: testName, passed: false, message: 'Layer boundaries not generated' });
                }
            } else {
                this.results.push({ name: testName, passed: false, message: 'loadLayerMetadata returned false' });
            }
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 7: Hilbert Index Calculation
     */
    async testHilbertIndexCalculation() {
        const testName = 'Hilbert Index Calculation';
        try {
            if (typeof NeuralHeatmapOverlay === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'NeuralHeatmapOverlay not available' });
                return;
            }

            const overlay = new NeuralHeatmapOverlay({ container: this.mockContainer, gridSize: 2048 });

            // Test Hilbert index calculation
            const hilbertIndex = overlay._calculateHilbertIndex(100, 200);

            if (typeof hilbertIndex === 'number' && hilbertIndex >= 0) {
                this.results.push({ name: testName, passed: true, message: `Hilbert index calculated: ${hilbertIndex}` });
            } else {
                this.results.push({ name: testName, passed: false, message: 'Invalid Hilbert index' });
            }
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Test 8: Layer Isolation
     */
    async testLayerIsolation() {
        const testName = 'Layer Isolation';
        try {
            if (typeof NeuralHeatmapOverlay === 'undefined') {
                this.results.push({ name: testName, passed: false, skipped: true, message: 'NeuralHeatmapOverlay not available' });
                return;
            }

            const overlay = new NeuralHeatmapOverlay({ container: this.mockContainer });

            // Check if isolation methods exist
            if (typeof overlay.setLayerIsolation === 'function' && typeof overlay.clearLayerIsolation === 'function') {
                // Test setting isolation
                overlay.setLayerIsolation('attention');

                if (overlay.isolatedLayerType === 'attention') {
                    // Test clearing isolation
                    overlay.clearLayerIsolation();

                    if (overlay.isolatedLayerType === null) {
                        this.results.push({ name: testName, passed: true, message: 'Layer isolation works correctly' });
                    } else {
                        this.results.push({ name: testName, passed: false, message: 'Layer isolation not cleared' });
                    }
                } else {
                    this.results.push({ name: testName, passed: false, message: 'Layer isolation not set' });
                }
            } else {
                this.results.push({ name: testName, passed: false, message: 'Layer isolation methods not found' });
            }
        } catch (error) {
            this.results.push({ name: testName, passed: false, message: `Error: ${error.message}` });
        }
    }

    /**
     * Generate test report
     */
    generateReport() {
        const passed = this.results.filter(r => r.passed).length;
        const failed = this.results.filter(r => !r.passed && !r.skipped).length;
        const skipped = this.results.filter(r => r.skipped).length;

        console.log('\n' + '='.repeat(60));
        console.log(`📊 Phase 2 Test Results: ${passed} passed, ${failed} failed, ${skipped} skipped`);
        console.log('='.repeat(60));

        for (const result of this.results) {
            const icon = result.passed ? '✅' : result.skipped ? '⏭️' : '❌';
            console.log(`${icon} ${result.name}: ${result.message}`);
        }

        return {
            phase: 'Phase 2: Deep Inspection & Interaction',
            passed,
            failed,
            skipped,
            total: this.results.length,
            results: this.results
        };
    }
}

// Export for use in test runner
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { Phase2InspectionTests };
}
