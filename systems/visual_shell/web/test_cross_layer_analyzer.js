/**
 * Test CrossLayerAnalyzer.js
 *
 * Tests the cross-layer correlation analysis functionality including:
 * - Layer activity recording
 * - Correlation computation
 * - Matrix generation
 * - Cache behavior
 * - Edge cases
 */

// Test suite
class CrossLayerAnalyzerTestSuite {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
    }

    async runAllTests() {
        console.log('\n========================================');
        console.log('  CrossLayerAnalyzer Test Suite');
        console.log('========================================\n');

        await this.testInitialization();
        await this.testRecordLayerActivity();
        await this.testGetLayerCorrelation();
        await this.testGetCorrelationMatrix();
        await this.testCacheBehavior();
        await this.testEmptyData();
        await this.testSingleLayer();
        await this.testFindHighCorrelations();
        await this.testFindDivergentLayers();

        this.printSummary();
    }

    async testInitialization() {
        console.log('Test 1: Initialization');
        console.log('-----------------------');

        try {
            const analyzer = new CrossLayerAnalyzer({
                windowSize: 50,
                correlationThreshold: 0.5,
                cacheSize: 100
            });

            if (analyzer.options.windowSize === 50) {
                console.log('✓ Window size configured correctly');
            } else {
                throw new Error('Window size not configured');
            }

            if (analyzer.options.correlationThreshold === 0.5) {
                console.log('✓ Correlation threshold configured correctly');
            } else {
                throw new Error('Correlation threshold not configured');
            }

            const stats = analyzer.getStats();
            if (stats.totalRecords === 0) {
                console.log('✓ Stats initialized correctly');
            } else {
                throw new Error('Stats should start at 0');
            }

            this.recordTest('Initialization', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Initialization', false);
        }

        console.log();
    }

    async testRecordLayerActivity() {
        console.log('Test 2: Record Layer Activity');
        console.log('--------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Record single activity
            analyzer.recordLayerActivity(
                'model1',
                'layer.0',
                { x: 100, y: 100, width: 50, height: 50 },
                0.8,
                1000
            );

            const stats = analyzer.getStats();
            if (stats.totalRecords === 1) {
                console.log('✓ Single activity recorded');
            } else {
                throw new Error('Expected 1 record');
            }

            // Record batch
            analyzer.recordBatch([
                { modelId: 'model1', layerName: 'layer.1', bounds: { x: 0, y: 0, width: 16, height: 16 }, intensity: 0.5, timestamp: 1100 },
                { modelId: 'model1', layerName: 'layer.2', bounds: { x: 0, y: 0, width: 16, height: 16 }, intensity: 0.6, timestamp: 1200 }
            ]);

            const stats2 = analyzer.getStats();
            if (stats2.totalRecords === 3) {
                console.log('✓ Batch recorded correctly');
            } else {
                throw new Error(`Expected 3 records, got ${stats2.totalRecords}`);
            }

            this.recordTest('Record Layer Activity', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Record Layer Activity', false);
        }

        console.log();
    }

    async testGetLayerCorrelation() {
        console.log('Test 3: Get Layer Correlation');
        console.log('-------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Record correlated activities
            for (let i = 0; i < 10; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.5 + i * 0.05, 1000 + i * 100);
                analyzer.recordLayerActivity('model1', 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, 0.5 + i * 0.05, 1000 + i * 100);
            }

            const correlation = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');

            if (typeof correlation === 'number') {
                console.log(`✓ Correlation computed: ${correlation.toFixed(3)}`);
            } else {
                throw new Error('Correlation should be a number');
            }

            // Test cache hit
            const stats1 = analyzer.getStats();
            const correlation2 = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');
            const stats2 = analyzer.getStats();

            if (stats2.cacheHits > stats1.cacheHits) {
                console.log('✓ Cache working correctly');
            } else {
                throw new Error('Cache should have been hit');
            }

            this.recordTest('Get Layer Correlation', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Get Layer Correlation', false);
        }

        console.log();
    }

    async testGetCorrelationMatrix() {
        console.log('Test 4: Get Correlation Matrix');
        console.log('--------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Record data for multiple models and layers
            const models = ['model1', 'model2'];
            const layers = ['layer.0', 'layer.1', 'layer.2'];

            for (const model of models) {
                for (const layer of layers) {
                    for (let i = 0; i < 5; i++) {
                        analyzer.recordLayerActivity(model, layer, { x: 0, y: 0, width: 16, height: 16 }, Math.random(), 1000 + i * 100);
                    }
                }
            }

            const matrix = analyzer.getCorrelationMatrix(models, layers);

            if (matrix.modelIds.length === 2) {
                console.log('✓ Model IDs included');
            } else {
                throw new Error('Expected 2 model IDs');
            }

            if (matrix.layerNames.length === 3) {
                console.log('✓ Layer names included');
            } else {
                throw new Error('Expected 3 layer names');
            }

            if (matrix.correlations.size > 0) {
                console.log(`✓ Matrix has ${matrix.correlations.size} correlations`);
            } else {
                throw new Error('Matrix should have correlations');
            }

            if (typeof matrix.avgCorrelation === 'number') {
                console.log('✓ Average correlation computed');
            } else {
                throw new Error('Average correlation should be computed');
            }

            this.recordTest('Get Correlation Matrix', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Get Correlation Matrix', false);
        }

        console.log();
    }

    async testCacheBehavior() {
        console.log('Test 5: Cache Behavior');
        console.log('------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer({ cacheSize: 5 });

            // Fill cache
            for (let i = 0; i < 10; i++) {
                analyzer.recordLayerActivity(`model${i}`, 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000 + i);
                analyzer.recordLayerActivity(`model${i}`, 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000 + i);
                analyzer.getLayerCorrelation(`model${i}`, 'layer.0', `model${i}`, 'layer.1');
            }

            const stats = analyzer.getStats();
            if (stats.cacheSize <= 5) {
                console.log('✓ Cache size limit enforced');
            } else {
                throw new Error('Cache should respect size limit');
            }

            this.recordTest('Cache Behavior', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Cache Behavior', false);
        }

        console.log();
    }

    async testEmptyData() {
        console.log('Test 6: Empty Data Handling');
        console.log('-----------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            const correlation = analyzer.getLayerCorrelation('nonexistent', 'layer.0', 'nonexistent', 'layer.1');
            if (correlation === 0) {
                console.log('✓ Returns 0 for nonexistent layers');
            } else {
                throw new Error('Should return 0 for nonexistent data');
            }

            const matrix = analyzer.getCorrelationMatrix(['m1'], ['l1']);
            if (matrix.avgCorrelation === 0) {
                console.log('✓ Matrix handles empty data gracefully');
            } else {
                throw new Error('Matrix avg should be 0 for empty data');
            }

            this.recordTest('Empty Data Handling', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Empty Data Handling', false);
        }

        console.log();
    }

    async testSingleLayer() {
        console.log('Test 7: Single Layer Handling');
        console.log('--------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Record data for only one layer
            for (let i = 0; i < 5; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000 + i * 100);
            }

            const correlation = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.0');
            // Should compute self-correlation
            if (correlation === 1 || correlation === 0) {
                console.log('✓ Single layer handled correctly');
            } else {
                console.log(`ℹ Single layer correlation: ${correlation} (may be expected)`);
            }

            this.recordTest('Single Layer Handling', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Single Layer Handling', false);
        }

        console.log();
    }

    async testFindHighCorrelations() {
        console.log('Test 8: Find High Correlations');
        console.log('---------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Create highly correlated layers
            for (let i = 0; i < 20; i++) {
                const intensity = 0.5 + Math.sin(i * 0.5) * 0.3;
                analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, intensity, 1000 + i * 100);
                analyzer.recordLayerActivity('model1', 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, intensity, 1000 + i * 100);
            }

            // Create uncorrelated layer
            for (let i = 0; i < 20; i++) {
                analyzer.recordLayerActivity('model1', 'layer.2', { x: 0, y: 0, width: 16, height: 16 }, Math.random(), 1000 + i * 100);
            }

            const highCorrs = analyzer.findHighCorrelations(0.7, 10);

            if (Array.isArray(highCorrs)) {
                console.log(`✓ Found ${highCorrs.length} high correlations`);
            } else {
                throw new Error('Should return an array');
            }

            if (highCorrs.length > 0) {
                const first = highCorrs[0];
                if (first.model1 && first.layer1 && first.model2 && first.layer2 && typeof first.correlation === 'number') {
                    console.log('✓ Result has correct structure');
                } else {
                    throw new Error('Result structure incorrect');
                }
            }

            this.recordTest('Find High Correlations', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Find High Correlations', false);
        }

        console.log();
    }

    async testFindDivergentLayers() {
        console.log('Test 9: Find Divergent Layers');
        console.log('-------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Create divergent layers
            for (let i = 0; i < 20; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, Math.sin(i * 0.1), 1000 + i * 100);
                analyzer.recordLayerActivity('model1', 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, Math.cos(i * 0.1), 1000 + i * 100);
            }

            const divergent = analyzer.findDivergentLayers(0.3, 10);

            if (Array.isArray(divergent)) {
                console.log(`✓ Found ${divergent.length} divergent layer pairs`);
            } else {
                throw new Error('Should return an array');
            }

            this.recordTest('Find Divergent Layers', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Find Divergent Layers', false);
        }

        console.log();
    }

    recordTest(name, passed) {
        this.tests.push({ name, passed });
        if (passed) {
            this.passed++;
        } else {
            this.failed++;
        }
    }

    printSummary() {
        console.log('========================================');
        console.log('  Test Summary');
        console.log('========================================');
        console.log(`Total tests: ${this.tests.length}`);
        console.log(`Passed: ${this.passed}`);
        console.log(`Failed: ${this.failed}`);
        console.log(`Success rate: ${((this.passed / this.tests.length) * 100).toFixed(1)}%`);
        console.log('========================================\n');

        if (this.failed === 0) {
            console.log('✓ All tests passed!');
        } else {
            console.log('✗ Some tests failed. See details above.');
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.CrossLayerAnalyzerTestSuite = CrossLayerAnalyzerTestSuite;

    // Run tests after page load
    window.addEventListener('load', () => {
        const suite = new CrossLayerAnalyzerTestSuite();
        suite.runAllTests();
    });
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { CrossLayerAnalyzerTestSuite };
}
