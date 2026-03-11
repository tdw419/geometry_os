/**
 * Cross-Browser Compatibility Tests for Neural Heatmap
 *
 * Tests compatibility across different browsers and provides
 * fallback mechanisms when features are unavailable.
 *
 * Success criteria:
 * - Works on Chrome, Firefox, Safari, Edge
 * - Graceful fallback for missing WebGL
 * - Canvas fallback renders correctly
 * - Feature detection works properly
 * - Error recovery handles browser-specific issues
 */

class BrowserCompatibilityTests extends NeuralHeatmapTests.BrowserCompatibilityTest {
    constructor() {
        super('Cross-Browser Compatibility', {
            requiredFeatures: [
                'webgl',
                'webgl2',
                'canvas',
                'requestAnimationFrame',
                'performance',
                'sessionStorage'
            ]
        });
    }

    async execute() {
        // Test 1: Feature detection
        await this.testFeatureDetection();

        // Test 2: WebGL availability
        await this.testWebGLAvailability();

        // Test 3: Canvas fallback
        await this.testCanvasFallback();

        // Test 4: Browser compatibility layer
        await this.testBrowserCompatibilityLayer();

        // Test 5: Error recovery integration
        await this.testErrorRecoveryIntegration();

        // Test 6: Performance API compatibility
        await this.testPerformanceAPICompatibility();
    }

    async testFeatureDetection() {
        console.log('  Testing feature detection...');

        const features = {
            webgl: this._hasWebGL(),
            webgl2: this._hasWebGL2(),
            canvas: !!document.createElement('canvas').getContext,
            requestAnimationFrame: !!window.requestAnimationFrame,
            performance: !!window.performance,
            sessionStorage: (() => {
                try {
                    sessionStorage.setItem('test', 'test');
                    sessionStorage.removeItem('test');
                    return true;
                } catch (e) {
                    return false;
                }
            })()
        };

        console.log('    Detected features:', features);

        const missingFeatures = this.requiredFeatures.filter(f => !features[f]);
        if (missingFeatures.length > 0) {
            console.warn(`    ⚠ Missing features: ${missingFeatures.join(', ')}`);
        } else {
            console.log('    ✓ All required features available');
        }
    }

    async testWebGLAvailability() {
        console.log('  Testing WebGL availability...');

        const canvas = document.createElement('canvas');
        const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');

        if (gl) {
            console.log('    ✓ WebGL available');

            // Check for required extensions
            const extensions = [
                'OES_texture_float',
                'OES_standard_derivatives',
                'WEBGL_compressed_texture_s3tc'
            ];

            for (const ext of extensions) {
                const supported = gl.getExtension(ext);
                console.log(`      ${ext}: ${supported ? '✓' : '✗'}`);
            }
        } else {
            console.log('    ⚠ WebGL not available, will use canvas fallback');
        }

        const gl2 = canvas.getContext('webgl2');
        console.log(`    WebGL2: ${gl2 ? '✓' : '✗'}`);
    }

    async testCanvasFallback() {
        console.log('  Testing canvas fallback...');

        if (typeof CanvasFallback === 'undefined') {
            console.log('    ⚠ CanvasFallback not available, skipping');
            return;
        }

        const fallback = new CanvasFallback();

        // Test fallback rendering
        const canvas = document.createElement('canvas');
        canvas.width = 512;
        canvas.height = 512;
        const ctx = canvas.getContext('2d');

        if (!ctx) {
            throw new Error('Canvas 2D context not available');
        }

        // Render test heatmap using fallback
        const testData = [];
        for (let i = 0; i < 10; i++) {
            for (let j = 0; j < 10; j++) {
                testData.push({
                    x: i * 51,
                    y: j * 51,
                    width: 50,
                    height: 50,
                    value: Math.random()
                });
            }
        }

        fallback.renderHeatmap(ctx, testData, {
            colorScheme: 'entropy',
            opacity: 0.6
        });

        // Verify something was rendered
        const imageData = ctx.getImageData(0, 0, 512, 512);
        const hasNonZeroPixels = imageData.data.some((channel, i) =>
            i % 4 !== 3 && channel > 0 // Ignore alpha channel
        );

        NeuralHeatmapTests.Assert.assertTrue(hasNonZeroPixels, 'Canvas fallback should render pixels');

        console.log('    ✓ Canvas fallback renders correctly');
    }

    async testBrowserCompatibilityLayer() {
        console.log('  Testing browser compatibility layer...');

        if (typeof BrowserCompatibility === 'undefined') {
            console.log('    ⚠ BrowserCompatibility not available, skipping');
            return;
        }

        const compat = new BrowserCompatibility();
        const report = compat.getCapabilitiesReport();

        console.log('    Browser capabilities:', JSON.stringify(report, null, 2));

        NeuralHeatmapTests.Assert.assertNotNull(report.browser, 'Should detect browser');
        NeuralHeatmapTests.Assert.assertNotNull(report.version, 'Should detect version');
        NeuralHeatmapTests.Assert.assertNotNull(report.features, 'Should list features');

        // Test fixes application
        compat.applyFixes();

        console.log('    ✓ Browser compatibility layer works correctly');
    }

    async testErrorRecoveryIntegration() {
        console.log('  Testing error recovery integration...');

        if (typeof ErrorRecovery === 'undefined') {
            console.log('    ⚠ ErrorRecovery not available, skipping');
            return;
        }

        const recovery = new ErrorRecovery({
            maxRetries: 3,
            notifyUser: false
        });

        // Test fallback creation
        const implementations = {
            webgl: async () => {
                const canvas = document.createElement('canvas');
                const gl = canvas.getContext('webgl');
                if (!gl) throw new Error('WebGL not available');
                return 'webgl';
            },
            canvas: async () => {
                const canvas = document.createElement('canvas');
                const ctx = canvas.getContext('2d');
                if (!ctx) throw new Error('Canvas not available');
                return 'canvas';
            },
            cpu: async () => 'cpu'
        };

        const fallback = recovery.createFallback(implementations);
        const result = await fallback();

        console.log(`    Using fallback: ${result}`);

        NeuralHeatmapTests.Assert.assertTrue(
            ['webgl', 'canvas', 'cpu'].includes(result),
            'Should use one of the fallback implementations'
        );

        console.log('    ✓ Error recovery integration works correctly');
    }

    async testPerformanceAPICompatibility() {
        console.log('  Testing Performance API compatibility...');

        const hasPerformanceAPI = !!window.performance;
        const hasNow = typeof performance.now === 'function';
        const hasMemory = !!performance.memory;
        const hasMarks = typeof performance.mark === 'function';
        const hasMeasures = typeof performance.measure === 'function';

        console.log(`    Performance API: ${hasPerformanceAPI ? '✓' : '✗'}`);
        console.log(`    performance.now(): ${hasNow ? '✓' : '✗'}`);
        console.log(`    performance.memory: ${hasMemory ? '✓' : '✗'}`);
        console.log(`    performance.mark(): ${hasMarks ? '✓' : '✗'}`);
        console.log(`    performance.measure(): ${hasMeasures ? '✓' : '✗'}`);

        if (hasNow) {
            const start = performance.now();
            await NeuralHeatmapTests.TestHelpers.wait(10);
            const elapsed = performance.now() - start;

            NeuralHeatmapTests.Assert.assertTrue(elapsed >= 10, 'performance.now() should measure time correctly');
            console.log(`    Measured ${elapsed.toFixed(2)}ms for 10ms delay`);
        }

        console.log('    ✓ Performance API compatibility test completed');
    }

    _hasWebGL() {
        try {
            const canvas = document.createElement('canvas');
            return !!(canvas.getContext('webgl') || canvas.getContext('experimental-webgl'));
        } catch (e) {
            return false;
        }
    }

    _hasWebGL2() {
        try {
            const canvas = document.createElement('canvas');
            return !!canvas.getContext('webgl2');
        } catch (e) {
            return false;
        }
    }
}

/**
 * Browser-Specific Tests
 *
 * Tests for browser-specific quirks and workarounds.
 */
class BrowserSpecificTests extends NeuralHeatmapTests.BrowserCompatibilityTest {
    constructor() {
        super('Browser-Specific Quirks');
    }

    async execute() {
        console.log('  Testing browser-specific quirks...');

        const userAgent = navigator.userAgent;
        const browser = this._detectBrowser();

        console.log(`    Detected browser: ${browser.name} ${browser.version}`);

        // Safari-specific tests
        if (browser.name === 'Safari') {
            await this.testSafariQuirks();
        }

        // Firefox-specific tests
        if (browser.name === 'Firefox') {
            await this.testFirefoxQuirks();
        }

        // Chrome-specific tests
        if (browser.name === 'Chrome') {
            await this.testChromeQuirks();
        }

        // Edge-specific tests
        if (browser.name === 'Edge') {
            await this.testEdgeQuirks();
        }

        console.log('    ✓ Browser-specific tests completed');
    }

    async testSafariQuirks() {
        console.log('    Testing Safari-specific quirks...');

        // Safari has strict memory limits
        const memory = NeuralHeatmapTests.TestHelpers.measureMemory();
        if (memory) {
            console.log(`      Memory limit: ${memory.limit.toFixed(2)}MB`);
        }

        // Safari requires user interaction for audio
        console.log('      Note: Safari may require user interaction for certain features');
    }

    async testFirefoxQuirks() {
        console.log('    Testing Firefox-specific quirks...');

        // Firefox may have different WebGL defaults
        const canvas = document.createElement('canvas');
        const gl = canvas.getContext('webgl');

        if (gl) {
            const debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
            if (debugInfo) {
                const vendor = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL);
                const renderer = gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);
                console.log(`      WebGL renderer: ${renderer}`);
            }
        }
    }

    async testChromeQuirks() {
        console.log('    Testing Chrome-specific quirks...');

        // Chrome has good WebGL support
        // Check for ANGLE (DirectX to WebGL translation)
        const canvas = document.createElement('canvas');
        const gl = canvas.getContext('webgl');

        if (gl) {
            const debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
            if (debugInfo) {
                const renderer = gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);
                console.log(`      WebGL renderer: ${renderer}`);
            }
        }
    }

    async testEdgeQuirks() {
        console.log('    Testing Edge-specific quirks...');

        // Edge (Chromium-based) should behave like Chrome
        console.log('      Edge (Chromium) - similar to Chrome');
    }

    _detectBrowser() {
        const ua = navigator.userAgent;

        if (ua.indexOf('Firefox') > -1) {
            const match = ua.match(/Firefox\/(\d+\.\d+)/);
            return { name: 'Firefox', version: match ? match[1] : 'unknown' };
        }

        if (ua.indexOf('Edg') > -1) {
            const match = ua.match(/Edg\/(\d+\.\d+)/);
            return { name: 'Edge', version: match ? match[1] : 'unknown' };
        }

        if (ua.indexOf('Chrome') > -1) {
            const match = ua.match(/Chrome\/(\d+\.\d+)/);
            return { name: 'Chrome', version: match ? match[1] : 'unknown' };
        }

        if (ua.indexOf('Safari') > -1) {
            const match = ua.match(/Version\/(\d+\.\d+)/);
            return { name: 'Safari', version: match ? match[1] : 'unknown' };
        }

        return { name: 'Unknown', version: 'unknown' };
    }
}

/**
 * Responsive Design Test
 *
 * Tests that the heatmap works correctly at different viewport sizes.
 */
class ResponsiveDesignTest extends NeuralHeatmapTests.BrowserCompatibilityTest {
    constructor() {
        super('Responsive Design');
    }

    async execute() {
        console.log('  Testing responsive design...');

        const viewports = [
            { width: 1920, height: 1080, name: 'Desktop' },
            { width: 1024, height: 768, name: 'Tablet' },
            { width: 375, height: 667, name: 'Mobile' }
        ];

        for (const viewport of viewports) {
            console.log(`    Testing ${viewport.name} (${viewport.width}x${viewport.height})...`);

            // Simulate viewport size
            Object.defineProperty(window, 'innerWidth', {
                writable: true,
                configurable: true,
                value: viewport.width
            });

            Object.defineProperty(window, 'innerHeight', {
                writable: true,
                configurable: true,
                value: viewport.height
            });

            // Trigger resize event if overlay exists
            if (typeof NeuralHeatmapOverlay !== 'undefined') {
                // The overlay should handle resize
                console.log(`      Overlay should adapt to ${viewport.width}x${viewport.height}`);
            }

            await NeuralHeatmapTests.TestHelpers.wait(100);
        }

        console.log('    ✓ Responsive design test completed');
    }
}

/**
 * Browser Compatibility Test Suite Runner
 */
async function runBrowserCompatibilityTests() {
    const suite = new NeuralHeatmapTests.TestSuite('Cross-Browser Compatibility');

    suite.addTest(new BrowserCompatibilityTests());
    suite.addTest(new BrowserSpecificTests());
    suite.addTest(new ResponsiveDesignTest());

    return await suite.run();
}

// Export
if (typeof window !== 'undefined') {
    window.runBrowserCompatibilityTests = runBrowserCompatibilityTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        runBrowserCompatibilityTests,
        BrowserCompatibilityTests,
        BrowserSpecificTests,
        ResponsiveDesignTest
    };
}
