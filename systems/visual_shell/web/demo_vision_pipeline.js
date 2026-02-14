/**
 * Vision Analysis Pipeline Demo
 *
 * Implements Phase 1 of PixelRTS Boot Improvement:
 * - Boot .rts.png container
 * - Verify boot messages via OCR
 * - Return structured result
 */

window.VisionPipeline = {
    config: {
        bootTimeout: 60000,      // 60 seconds max boot time
        pollInterval: 500,        // Check OCR every 500ms
        defaultMemory: 256        // Default memory in MB
    },

    state: {
        status: 'idle',           // idle | booting | verifying | success | failed
        startTime: null,
        capturedText: [],
        result: null
    },

    // Expected boot messages for known containers
    expectedMessages: {
        'alpine': ['Welcome to Alpine Linux', 'login:'],
        'ubuntu': ['Ubuntu', 'login:'],
        'default': ['login:', '#']
    }
};

/**
 * Main entry point - run vision pipeline on a container
 * @param {string} kernelUrl - URL to .rts.png kernel
 * @param {Object} options - Optional configuration
 * @returns {Promise<Object>} Result object
 */
window.VisionPipeline.run = async function(kernelUrl, options = {}) {
    console.log(`[VisionPipeline] Starting analysis: ${kernelUrl}`);

    this.state = {
        status: 'booting',
        startTime: Date.now(),
        capturedText: [],
        result: null
    };

    const expectedMessages = options.expectedMessages ||
        this.detectExpectedMessages(kernelUrl);

    try {
        // Step 1: Boot the container
        const bootResult = await this.bootContainer(kernelUrl, options);
        if (!bootResult.success) {
            return this.createResult(false, 'boot_failed', bootResult.error);
        }

        // Step 2: Verify boot messages via OCR
        this.state.status = 'verifying';
        const verifyResult = await this.verifyBoot(expectedMessages);

        this.state.status = verifyResult.success ? 'success' : 'failed';
        return verifyResult;

    } catch (error) {
        this.state.status = 'failed';
        return this.createResult(false, 'error', error.message);
    }
};

/**
 * Detect expected messages based on filename
 */
window.VisionPipeline.detectExpectedMessages = function(kernelUrl) {
    const filename = kernelUrl.toLowerCase();
    for (const [os, messages] of Object.entries(this.expectedMessages)) {
        if (filename.includes(os)) {
            return messages;
        }
    }
    return this.expectedMessages.default;
};

/**
 * Create standardized result object
 */
window.VisionPipeline.createResult = function(success, status, message, extra = {}) {
    return {
        success,
        status,
        message,
        timestamp: new Date().toISOString(),
        duration_ms: this.state.startTime ? Date.now() - this.state.startTime : 0,
        capturedText: this.state.capturedText,
        ...extra
    };
};

/**
 * Boot the container using WebMCP hypervisor
 */
window.VisionPipeline.bootContainer = async function(kernelUrl, options = {}) {
    console.log(`[VisionPipeline] Booting: ${kernelUrl}`);

    if (!navigator.modelContext || !navigator.modelContext.toolHandlers) {
        return { success: false, error: 'WebMCP not available' };
    }

    const bootParams = {
        kernel_url: kernelUrl,
        memory_mb: options.memoryMb || this.config.defaultMemory
    };

    // Add mounts if provided
    if (options.mounts) {
        bootParams.mounts = options.mounts;
    }

    try {
        const result = await navigator.modelContext.toolHandlers['hypervisor_boot'](bootParams);

        if (result.success) {
            console.log(`[VisionPipeline] Boot successful: ${result.status}`);
        } else {
            console.error(`[VisionPipeline] Boot failed: ${result.error}`);
        }

        return result;
    } catch (error) {
        console.error(`[VisionPipeline] Boot error:`, error);
        return { success: false, error: error.message };
    }
};

/**
 * Verify boot by polling OCR and checking for expected messages
 */
window.VisionPipeline.verifyBoot = async function(expectedMessages) {
    console.log(`[VisionPipeline] Verifying boot, looking for:`, expectedMessages);

    const maxIterations = Math.ceil(this.config.bootTimeout / this.config.pollInterval);
    const detectedMessages = [];

    for (let i = 0; i < maxIterations; i++) {
        // Capture current screen text via OCR
        const ocrResult = await this.captureOCR();

        if (ocrResult.success && ocrResult.text) {
            this.state.capturedText.push({
                time: Date.now() - this.state.startTime,
                text: ocrResult.text
            });

            // Check for each expected message
            for (const expected of expectedMessages) {
                if (ocrResult.text.includes(expected) && !detectedMessages.includes(expected)) {
                    detectedMessages.push(expected);
                    console.log(`[VisionPipeline] Detected: "${expected}"`);

                    // If all messages found, success!
                    if (detectedMessages.length === expectedMessages.length) {
                        return this.createResult(true, 'verified', 'All expected messages detected', {
                            detectedMessages,
                            bootTime_ms: Date.now() - this.state.startTime,
                            metadata: this.extractMetadata(ocrResult.text)
                        });
                    }
                }
            }
        }

        // Wait before next poll
        await this.wait(this.config.pollInterval);
    }

    // Timeout - return partial results
    return this.createResult(false, 'timeout', 'Boot verification timeout', {
        detectedMessages,
        suggestion: 'Container may be corrupted or boot sequence changed'
    });
};

/**
 * Capture screen text using OCR
 */
window.VisionPipeline.captureOCR = async function() {
    if (!navigator.modelContext || !navigator.modelContext.toolHandlers) {
        return { success: false, error: 'WebMCP not available' };
    }

    try {
        const result = await navigator.modelContext.toolHandlers['hypervisor_read_text']({
            scale: 2.0  // Higher scale for better OCR accuracy
        });
        return result;
    } catch (error) {
        return { success: false, error: error.message };
    }
};

/**
 * Extract metadata from boot text (OS, version, kernel)
 */
window.VisionPipeline.extractMetadata = function(text) {
    const metadata = {};

    // Alpine detection
    const alpineMatch = text.match(/Alpine Linux (\d+\.\d+)/i);
    if (alpineMatch) {
        metadata.os = 'Alpine Linux';
        metadata.version = alpineMatch[1];
    }

    // Ubuntu detection
    const ubuntuMatch = text.match(/Ubuntu (\d+\.\d+)/i);
    if (ubuntuMatch) {
        metadata.os = 'Ubuntu';
        metadata.version = ubuntuMatch[1];
    }

    // Kernel version
    const kernelMatch = text.match(/Linux (\d+\.\d+\.\d+)/i);
    if (kernelMatch) {
        metadata.kernel = kernelMatch[1];
    }

    // Architecture
    if (text.includes('x86_64') || text.includes('amd64')) {
        metadata.architecture = 'x86_64';
    } else if (text.includes('aarch64') || text.includes('arm64')) {
        metadata.architecture = 'aarch64';
    }

    return metadata;
};

/**
 * Promise-based wait helper
 */
window.VisionPipeline.wait = function(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
};

console.log('[VisionPipeline] Module loaded');

/**
 * Setup demo UI and event handlers
 */
window.setupVisionPipelineDemo = async function() {
    console.log("[VisionPipeline] Setting up demo...");

    // Wait for WebMCP
    if (!navigator.modelContext || !navigator.modelContext.toolHandlers) {
        console.warn("WebMCP not ready, retrying in 1s...");
        setTimeout(window.setupVisionPipelineDemo, 1000);
        return;
    }

    console.log("[VisionPipeline] WebMCP ready, demo available");
    console.log("Usage: VisionPipeline.run('alpine_v2.rts.png')");
    console.log("       VisionPipeline.run('alpine_corrupted.rts.png')");

    // Auto-run if URL param present
    const params = new URLSearchParams(window.location.search);
    const autoAnalyze = params.get('analyze');
    if (autoAnalyze) {
        console.log(`[VisionPipeline] Auto-analyzing: ${autoAnalyze}`);
        const result = await window.VisionPipeline.run(autoAnalyze);
        console.log("[VisionPipeline] Result:", JSON.stringify(result, null, 2));
    }
};

/**
 * Quick test function for console
 */
window.testVisionPipeline = async function() {
    // Test with Alpine container
    console.log("=== Testing Vision Pipeline ===");

    // Test 1: Valid container
    console.log("\n[Test 1] Analyzing alpine_v2.rts.png...");
    const result1 = await window.VisionPipeline.run('alpine_v2.rts.png');
    console.log("Result:", result1.success ? "PASS" : "FAIL");

    return result1;
};

// Initialize when Geometry OS is ready
if (new URLSearchParams(window.location.search).has('demo_vision')) {
    window.addEventListener('geometry-os-ready', () => {
        setTimeout(window.setupVisionPipelineDemo, 3000);
    });
}

// Also initialize on load for console access
window.addEventListener('load', () => {
    setTimeout(window.setupVisionPipelineDemo, 5000);
});

console.log("[VisionPipeline] Demo setup loaded. Use: testVisionPipeline()");
