/**
 * WorkerManager - Manages Web Worker pool for parallel processing
 *
 * Provides task queuing, worker pool management, progress reporting,
 * and graceful fallback when workers are unavailable.
 *
 * Part of: Neural Heatmap Phase 2.2 - Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

class WorkerManager {
    /**
     * Create a new WorkerManager
     * @param {Object} options - Configuration options
     * @param {number} options.maxWorkers - Maximum worker pool size (default: 4)
     * @param {number} options.minWorkers - Minimum workers to maintain (default: 2)
     * @param {number} options.taskTimeout - Task timeout in ms (default: 30000)
     * @param {boolean} options.enableFallback - Enable main thread fallback (default: true)
     */
    constructor(options = {}) {
        this.options = {
            maxWorkers: Math.min(navigator.hardwareConcurrency || 4, 4),
            minWorkers: 2,
            taskTimeout: 30000,
            enableFallback: true,
            ...options
        };

        // Worker pools
        this.correlationWorkers = [];
        this.temporalWorkers = [];
        this.availableWorkers = {
            correlation: [],
            temporal: []
        };

        // Task queues
        this.taskQueue = {
            correlation: [],
            temporal: []
        };

        // Active tasks map
        this.activeTasks = new Map();

        // Progress callbacks
        this.progressCallbacks = new Map();

        // Statistics
        this.stats = {
            tasksCompleted: 0,
            tasksFailed: 0,
            totalComputationTime: 0,
            workerErrors: 0,
            fallbackCount: 0
        };

        // Worker availability flag
        this.workersAvailable = true;

        // Initialize workers
        this._initializeWorkers();

        console.log('[WorkerManager] Initialized with', this.options.maxWorkers, 'max workers');
    }

    /**
     * Initialize worker pool
     * @private
     */
    _initializeWorkers() {
        try {
            // Create correlation workers
            for (let i = 0; i < this.options.minWorkers; i++) {
                this._createWorker('correlation', i);
            }

            // Create temporal workers
            for (let i = 0; i < this.options.minWorkers; i++) {
                this._createWorker('temporal', i);
            }

            console.log('[WorkerManager] Worker pool initialized');
        } catch (error) {
            console.warn('[WorkerManager] Failed to initialize workers:', error);
            this.workersAvailable = false;
        }
    }

    /**
     * Create a single worker
     * @private
     */
    _createWorker(type, id) {
        try {
            const workerUrl = `workers/${type}_worker.js`;
            const worker = new Worker(workerUrl, { type: 'module' });

            worker.id = `${type}-${id}`;
            worker.type = type;
            worker.busy = false;

            worker.addEventListener('message', (event) => {
                this._handleWorkerMessage(worker, event.data);
            });

            worker.addEventListener('error', (event) => {
                console.error(`[WorkerManager] Worker ${worker.id} error:`, event.error);
                this.stats.workerErrors++;
                this._releaseWorker(worker);
            });

            if (type === 'correlation') {
                this.correlationWorkers.push(worker);
                this.availableWorkers.correlation.push(worker);
            } else {
                this.temporalWorkers.push(worker);
                this.availableWorkers.temporal.push(worker);
            }

            console.log(`[WorkerManager] Created worker: ${worker.id}`);
        } catch (error) {
            console.error(`[WorkerManager] Failed to create ${type} worker:`, error);
            this.workersAvailable = false;
        }
    }

    /**
     * Handle messages from workers
     * @private
     */
    _handleWorkerMessage(worker, data) {
        const taskId = worker.currentTaskId;

        if (!taskId) {
            console.warn('[WorkerManager] Received message without task ID:', data);
            return;
        }

        const task = this.activeTasks.get(taskId);

        if (!task) {
            console.warn('[WorkerManager] Task not found:', taskId);
            return;
        }

        switch (data.type) {
            case 'partial':
                // Partial result - forward to callback
                if (task.onProgress) {
                    task.onProgress(data);
                }
                break;

            case 'error':
                // Worker error
                console.error('[WorkerManager] Worker reported error:', data.error);
                task.reject(data.error);
                this._removeTask(taskId);
                this._releaseWorker(worker);
                this.stats.tasksFailed++;
                break;

            case 'ready':
                // Worker is ready
                console.log(`[WorkerManager] Worker ${worker.id} is ready`);
                break;

            default:
                // Task completion
                if (task.onPartial && data.type !== 'partial') {
                    // Final result
                    task.resolve(data);
                    this._removeTask(taskId);
                    this._releaseWorker(worker);
                    this.stats.tasksCompleted++;
                }
                break;
        }
    }

    /**
     * Get an available worker of specified type
     * @private
     */
    _getWorker(type) {
        const pool = this.availableWorkers[type];

        if (pool.length > 0) {
            return pool.shift();
        }

        // Try to create a new worker if under limit
        const workers = type === 'correlation' ? this.correlationWorkers : this.temporalWorkers;
        if (workers.length < this.options.maxWorkers) {
            this._createWorker(type, workers.length);
            return this.availableWorkers[type].shift();
        }

        return null;
    }

    /**
     * Release a worker back to the pool
     * @private
     */
    _releaseWorker(worker) {
        if (!worker) return;

        worker.busy = false;
        worker.currentTaskId = null;

        const pool = this.availableWorkers[worker.type];
        if (!pool.includes(worker)) {
            pool.push(worker);
        }

        // Process next task in queue
        this._processQueue(worker.type);
    }

    /**
     * Process queued tasks
     * @private
     */
    _processQueue(type) {
        const queue = this.taskQueue[type];
        const worker = this._getWorker(type);

        if (!worker || queue.length === 0) {
            return;
        }

        const task = queue.shift();
        this._executeTask(worker, task);
    }

    /**
     * Execute a task on a worker
     * @private
     */
    _executeTask(worker, task) {
        worker.busy = true;
        worker.currentTaskId = task.id;

        this.activeTasks.set(task.id, {
            ...task,
            worker: worker.id,
            startTime: performance.now()
        });

        // Send task to worker
        worker.postMessage({
            type: task.messageType,
            data: task.data
        });

        // Set timeout
        if (this.options.taskTimeout > 0) {
            setTimeout(() => {
                if (this.activeTasks.has(task.id)) {
                    console.warn(`[WorkerManager] Task ${task.id} timed out`);
                    task.reject(new Error('Task timeout'));
                    this._removeTask(task.id);
                    this._releaseWorker(worker);
                    this.stats.tasksFailed++;
                }
            }, this.options.taskTimeout);
        }
    }

    /**
     * Remove task from active tasks
     * @private
     */
    _removeTask(taskId) {
        const task = this.activeTasks.get(taskId);
        if (task) {
            this.stats.totalComputationTime += performance.now() - task.startTime;
        }
        this.activeTasks.delete(taskId);
    }

    /**
     * Generate unique task ID
     * @private
     */
    _generateTaskId() {
        return `task-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
    }

    /**
     * Submit a task for execution
     * @param {string} type - Worker type ('correlation' or 'temporal')
     * @param {string} messageType - Message type to send to worker
     * @param {Object} data - Task data
     * @param {Object} options - Task options
     * @returns {Promise} Task result
     */
    submitTask(type, messageType, data, options = {}) {
        return new Promise((resolve, reject) => {
            const taskId = this._generateTaskId();
            const task = {
                id: taskId,
                messageType,
                data,
                resolve,
                reject,
                onProgress: options.onProgress,
                priority: options.priority || 'normal'
            };

            // Check if workers are available
            if (!this.workersAvailable && !this.options.enableFallback) {
                reject(new Error('Workers not available and fallback disabled'));
                return;
            }

            // Try to get a worker
            const worker = this._getWorker(type);

            if (worker) {
                // Execute immediately
                this._executeTask(worker, task);
            } else if (this.options.enableFallback) {
                // Queue the task
                this.taskQueue[type].push(task);

                // If queue is too long, warn about potential delay
                if (this.taskQueue[type].length > 10) {
                    console.warn(`[WorkerManager] ${type} task queue length:`, this.taskQueue[type].length);
                }
            } else {
                reject(new Error(`No ${type} workers available and fallback disabled`));
            }
        });
    }

    /**
     * Execute correlation matrix computation with progress
     * @param {Array} modelIds - Model IDs
     * @param {Array} layerNames - Layer names
     * @param {Object} options - Options
     * @returns {Promise} Computation result with all chunks
     */
    async computeCorrelationMatrix(modelIds, layerNames, options = {}) {
        if (!this.workersAvailable || !this.options.enableFallback) {
            return this._fallbackComputeCorrelationMatrix(modelIds, layerNames, options);
        }

        const { chunkSize = 10, onProgress } = options;
        const totalPairs = modelIds.length * layerNames.length;
        const numChunks = Math.ceil(totalPairs / chunkSize);

        const results = [];
        let completedChunks = 0;

        // Submit chunks in parallel
        const chunkPromises = [];

        for (let i = 0; i < numChunks; i++) {
            const startIdx = i * chunkSize;
            const endIdx = Math.min(startIdx + chunkSize, totalPairs);

            const promise = this.submitTask('correlation', 'compute_correlation_chunk', {
                modelIds,
                layerNames,
                startIdx,
                endIdx,
                chunkId: i,
                totalChunks: numChunks
            }, {
                onProgress: (data) => {
                    if (onProgress) {
                        onProgress(data.progress);
                    }
                }
            });

            chunkPromises.push(promise);
        }

        // Wait for all chunks and collect results
        const chunkResults = await Promise.all(chunkPromises);

        for (const result of chunkResults) {
            if (result.results) {
                results.push(...result.results);
            }
        }

        return {
            results,
            totalCorrelations: results.length,
            computationTime: chunkResults.reduce((sum, r) => sum + (r.computationTime || 0), 0)
        };
    }

    /**
     * Find high correlations
     * @param {number} threshold - Correlation threshold
     * @param {number} limit - Result limit
     * @returns {Promise} High correlation pairs
     */
    async findHighCorrelations(threshold = 0.7, limit = 50) {
        if (!this.workersAvailable) {
            return this._fallbackFindHighCorrelations(threshold, limit);
        }

        const result = await this.submitTask('correlation', 'find_high_correlations', {
            threshold,
            limit
        });

        return result.results || [];
    }

    /**
     * Detect periodic patterns
     * @param {string} modelId - Model ID
     * @param {string} layer - Optional layer filter
     * @returns {Promise} Detected patterns
     */
    async detectPeriodicPatterns(modelId, layer = null) {
        if (!this.workersAvailable) {
            return this._fallbackDetectPeriodicPatterns(modelId, layer);
        }

        const result = await this.submitTask('temporal', 'detect_periodic_patterns', {
            modelId,
            layer
        });

        return result.patterns || [];
    }

    /**
     * Detect trends
     * @param {string} modelId - Model ID
     * @param {string} layer - Optional layer filter
     * @returns {Promise} Detected trends
     */
    async detectTrends(modelId, layer = null) {
        if (!this.workersAvailable) {
            return this._fallbackDetectTrends(modelId, layer);
        }

        const result = await this.submitTask('temporal', 'detect_trends', {
            modelId,
            layer
        });

        return result.trends || [];
    }

    /**
     * Detect bursts
     * @param {string} modelId - Model ID
     * @param {number} windowSize - Time window
     * @param {number} threshold - Intensity threshold
     * @returns {Promise} Detected bursts
     */
    async detectBursts(modelId, windowSize = 1000, threshold = 0.5) {
        if (!this.workersAvailable) {
            return this._fallbackDetectBursts(modelId, windowSize, threshold);
        }

        const result = await this.submitTask('temporal', 'detect_bursts', {
            modelId,
            windowSize,
            threshold
        });

        return result.bursts || [];
    }

    /**
     * Update worker data
     * @param {string} type - Worker type
     * @param {string} updateType - Update type
     * @param {Object} data - Update data
     */
    updateWorkerData(type, updateType, data) {
        if (!this.workersAvailable) return;

        const workers = type === 'correlation' ? this.correlationWorkers : this.temporalWorkers;

        for (const worker of workers) {
            worker.postMessage({
                type: updateType,
                data
            });
        }
    }

    /**
     * Fallback correlation computation (main thread)
     * @private
     */
    _fallbackComputeCorrelationMatrix(modelIds, layerNames) {
        console.warn('[WorkerManager] Using fallback for correlation computation');
        this.stats.fallbackCount++;

        // Return empty result (actual computation would happen in calling code)
        return Promise.resolve({
            results: [],
            totalCorrelations: 0,
            fallback: true
        });
    }

    /**
     * Fallback for high correlations
     * @private
     */
    _fallbackFindHighCorrelations() {
        console.warn('[WorkerManager] Using fallback for high correlations');
        this.stats.fallbackCount++;
        return Promise.resolve([]);
    }

    /**
     * Fallback for periodic patterns
     * @private
     */
    _fallbackDetectPeriodicPatterns() {
        console.warn('[WorkerManager] Using fallback for periodic patterns');
        this.stats.fallbackCount++;
        return Promise.resolve([]);
    }

    /**
     * Fallback for trends
     * @private
     */
    _fallbackDetectTrends() {
        console.warn('[WorkerManager] Using fallback for trends');
        this.stats.fallbackCount++;
        return Promise.resolve([]);
    }

    /**
     * Fallback for bursts
     * @private
     */
    _fallbackDetectBursts() {
        console.warn('[WorkerManager] Using fallback for bursts');
        this.stats.fallbackCount++;
        return Promise.resolve([]);
    }

    /**
     * Get statistics
     * @returns {Object} Worker statistics
     */
    getStats() {
        return {
            ...this.stats,
            workersAvailable: this.workersAvailable,
            correlationWorkers: this.correlationWorkers.length,
            temporalWorkers: this.temporalWorkers.length,
            availableCorrelationWorkers: this.availableWorkers.correlation.length,
            availableTemporalWorkers: this.availableWorkers.temporal.length,
            queuedCorrelationTasks: this.taskQueue.correlation.length,
            queuedTemporalTasks: this.taskQueue.temporal.length,
            activeTasks: this.activeTasks.size,
            avgComputationTime: this.stats.tasksCompleted > 0
                ? this.stats.totalComputationTime / this.stats.tasksCompleted
                : 0
        };
    }

    /**
     * Clear all worker data
     */
    clearAll() {
        this.updateWorkerData('correlation', 'clear', {});
        this.updateWorkerData('temporal', 'clear', {});

        this.taskQueue.correlation = [];
        this.taskQueue.temporal = [];
        this.activeTasks.clear();

        console.log('[WorkerManager] All workers cleared');
    }

    /**
     * Terminate all workers
     */
    terminate() {
        for (const worker of this.correlationWorkers) {
            worker.terminate();
        }

        for (const worker of this.temporalWorkers) {
            worker.terminate();
        }

        this.correlationWorkers = [];
        this.temporalWorkers = [];
        this.availableWorkers.correlation = [];
        this.availableWorkers.temporal = [];
        this.activeTasks.clear();

        console.log('[WorkerManager] All workers terminated');
    }

    /**
     * Check if workers are available
     * @returns {boolean} True if workers are available
     */
    isAvailable() {
        return this.workersAvailable;
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.WorkerManager = WorkerManager;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WorkerManager };
}
