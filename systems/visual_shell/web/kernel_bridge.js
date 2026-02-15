/**
 * KernelBridgeStub - JavaScript bridge stub for browser environment
 * Mimics the Python bridge API for kernel management in web applications
 */

class KernelBridgeStub {
    constructor() {
        this.kernels = new Map();
        this.activeKernel = null;
        this.swapHistory = [];
    }

    /**
     * List all registered kernels
     * @returns {Promise<Object>} Object containing kernels array, active kernel name, and total count
     */
    async listKernels() {
        const kernels = Array.from(this.kernels.entries()).map(([name, data]) => ({
            name,
            type: data.type,
            version: data.version,
            status: data.status,
            state: data.state,
            use_count: data.useCount,
            error_count: data.errorCount,
            tags: data.tags,
        }));
        return { success: true, kernels, active: this.activeKernel, total: kernels.length };
    }

    /**
     * Create a new kernel
     * @param {string} name - Unique kernel name
     * @param {string} type - Kernel type (e.g., 'compute', 'render', 'neural')
     * @param {boolean} gpuEnabled - Whether GPU acceleration is enabled
     * @param {string} version - Kernel version string
     * @param {Array<string>} tags - Array of tags for categorization
     * @param {boolean} makeActive - Whether to set this kernel as active
     * @returns {Promise<Object>} Creation result with kernel info
     */
    async createKernel(name, type = 'compute', gpuEnabled = false, version = '1.0.0', tags = [], makeActive = false) {
        if (this.kernels.has(name)) {
            return { success: false, error: `Kernel '${name}' already exists` };
        }

        const kernelData = {
            type,
            version,
            status: 'healthy',
            state: 'idle',
            gpuEnabled,
            useCount: 0,
            errorCount: 0,
            tags: tags || [],
            createdAt: Date.now(),
            lastUsed: null,
            metrics: {
                executions: 0,
                avgLatencyMs: 0,
                totalErrors: 0,
            },
        };

        this.kernels.set(name, kernelData);

        if (makeActive) {
            this.activeKernel = name;
        }

        return {
            success: true,
            kernel: {
                name,
                type,
                version,
                status: kernelData.status,
                state: kernelData.state,
                gpuEnabled,
                tags: kernelData.tags,
            },
        };
    }

    /**
     * Swap to a different kernel
     * @param {string} name - Name of kernel to activate
     * @returns {Promise<Object>} Swap result with previous and new active kernel
     */
    async swapKernel(name) {
        if (!this.kernels.has(name)) {
            return { success: false, error: `Kernel '${name}' not found` };
        }

        const previousKernel = this.activeKernel;

        // Track swap history
        if (previousKernel) {
            this.swapHistory.push({
                from: previousKernel,
                to: name,
                timestamp: Date.now(),
            });

            // Keep history limited to last 50 swaps
            if (this.swapHistory.length > 50) {
                this.swapHistory.shift();
            }

            // Update previous kernel state
            const prevData = this.kernels.get(previousKernel);
            if (prevData) {
                prevData.state = 'idle';
            }
        }

        this.activeKernel = name;

        // Update new kernel state and use count
        const kernelData = this.kernels.get(name);
        kernelData.state = 'active';
        kernelData.useCount++;
        kernelData.lastUsed = Date.now();

        return {
            success: true,
            previousKernel,
            activeKernel: name,
            swapHistoryLength: this.swapHistory.length,
        };
    }

    /**
     * Check health of a kernel or all kernels
     * @param {string|null} name - Kernel name to check, or null for all
     * @returns {Promise<Object>} Health status report
     */
    async healthCheck(name = null) {
        if (name !== null) {
            if (!this.kernels.has(name)) {
                return { success: false, error: `Kernel '${name}' not found` };
            }

            const data = this.kernels.get(name);
            const isHealthy = data.status === 'healthy' && data.errorCount < 10;

            return {
                success: true,
                name,
                healthy: isHealthy,
                status: data.status,
                state: data.state,
                errorCount: data.errorCount,
                lastUsed: data.lastUsed,
            };
        }

        // Health check all kernels
        const results = [];
        let healthyCount = 0;
        let unhealthyCount = 0;

        for (const [kernelName, data] of this.kernels.entries()) {
            const isHealthy = data.status === 'healthy' && data.errorCount < 10;
            if (isHealthy) {
                healthyCount++;
            } else {
                unhealthyCount++;
            }
            results.push({
                name: kernelName,
                healthy: isHealthy,
                status: data.status,
                errorCount: data.errorCount,
            });
        }

        return {
            success: true,
            total: this.kernels.size,
            healthy: healthyCount,
            unhealthy: unhealthyCount,
            activeKernel: this.activeKernel,
            kernels: results,
        };
    }

    /**
     * Get metrics for a kernel or all kernels
     * @param {string|null} name - Kernel name, or null for all
     * @returns {Promise<Object>} Metrics data
     */
    async getMetrics(name = null) {
        if (name !== null) {
            if (!this.kernels.has(name)) {
                return { success: false, error: `Kernel '${name}' not found` };
            }

            const data = this.kernels.get(name);
            return {
                success: true,
                name,
                metrics: {
                    ...data.metrics,
                    useCount: data.useCount,
                    errorCount: data.errorCount,
                    state: data.state,
                    lastUsed: data.lastUsed,
                    uptime: Date.now() - data.createdAt,
                },
            };
        }

        // Get metrics for all kernels
        const allMetrics = {};
        for (const [kernelName, data] of this.kernels.entries()) {
            allMetrics[kernelName] = {
                ...data.metrics,
                useCount: data.useCount,
                errorCount: data.errorCount,
                state: data.state,
                lastUsed: data.lastUsed,
                uptime: Date.now() - data.createdAt,
            };
        }

        return {
            success: true,
            totalKernels: this.kernels.size,
            activeKernel: this.activeKernel,
            swapHistoryLength: this.swapHistory.length,
            metrics: allMetrics,
        };
    }

    /**
     * Unregister and remove a kernel
     * @param {string} name - Kernel name to remove
     * @returns {Promise<Object>} Removal result
     */
    async unregisterKernel(name) {
        if (!this.kernels.has(name)) {
            return { success: false, error: `Kernel '${name}' not found` };
        }

        const wasActive = this.activeKernel === name;

        this.kernels.delete(name);

        if (wasActive) {
            this.activeKernel = null;
        }

        return {
            success: true,
            removed: name,
            wasActive,
            remainingKernels: this.kernels.size,
        };
    }

    /**
     * Rollback to the previous kernel
     * @returns {Promise<Object>} Rollback result
     */
    async rollback() {
        if (this.swapHistory.length === 0) {
            return { success: false, error: 'No swap history available for rollback' };
        }

        const lastSwap = this.swapHistory.pop();
        const targetKernel = lastSwap.from;

        if (!this.kernels.has(targetKernel)) {
            // Restore the swap history since rollback failed
            this.swapHistory.push(lastSwap);
            return {
                success: false,
                error: `Previous kernel '${targetKernel}' no longer exists`,
            };
        }

        const currentKernel = this.activeKernel;

        // Update current kernel state
        if (currentKernel) {
            const currentData = this.kernels.get(currentKernel);
            if (currentData) {
                currentData.state = 'idle';
            }
        }

        // Activate previous kernel
        this.activeKernel = targetKernel;
        const targetData = this.kernels.get(targetKernel);
        targetData.state = 'active';
        targetData.useCount++;
        targetData.lastUsed = Date.now();

        return {
            success: true,
            previousKernel: currentKernel,
            activeKernel: targetKernel,
            swapHistoryLength: this.swapHistory.length,
        };
    }

    /**
     * Get swap history
     * @returns {Array} Array of swap records
     */
    getSwapHistory() {
        return [...this.swapHistory];
    }

    /**
     * Clear all kernels and reset state
     */
    clear() {
        this.kernels.clear();
        this.activeKernel = null;
        this.swapHistory = [];
    }
}

// Export for browser environment
if (typeof window !== 'undefined') {
    window.KernelBridgeStub = KernelBridgeStub;
    if (!window.kernelBridge) {
        window.kernelBridge = new KernelBridgeStub();
    }
}

// Export for CommonJS (Node.js) environment
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { KernelBridgeStub };
}

// Export for ES modules
if (typeof exports !== 'undefined') {
    exports.KernelBridgeStub = KernelBridgeStub;
}
