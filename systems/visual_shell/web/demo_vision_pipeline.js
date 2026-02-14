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

console.log('[VisionPipeline] Module loaded');
