/**
 * Geometry OS: LLM Inference Tracker
 *
 * Monitors LM Studio API calls and extracts layer activity data for neural
 * heatmap visualization. Intercepts fetch requests to localhost:1234 and
 * simulates layer activations during inference.
 *
 * Emits events:
 * - inference:start: Fired when inference begins
 * - inference:complete: Fired when inference ends
 * - inference:layer: Fired for each simulated layer activation
 *
 * @class LLMInferenceTracker
 * @example
 * const tracker = new LLMInferenceTracker();
 * tracker.startIntercepting();
 * tracker.on('inference:layer', (data) => console.log('Layer:', data.layer));
 */

class LLMInferenceTracker {
    /**
     * Create a new LLMInferenceTracker
     * @param {Object} options - Configuration options
     * @param {string[]} options.layerSequence - Custom layer sequence (default: typical transformer)
     * @param {number} options.simulationInterval - Interval between layer simulations in ms (default: 50)
     * @param {boolean} options.enableSimulation - Enable layer simulation (default: true)
     */
    constructor(options = {}) {
        this.options = {
            simulationInterval: 50,
            enableSimulation: true,
            ...options
        };

        // Map to track intercepted fetch requests
        this.interceptedFetches = new Map();

        // Typical transformer layer sequence for visualization
        this.layerSequence = options.layerSequence || [
            'tok_embeddings',
            'layers.0.self_attn',
            'layers.0.mlp',
            'layers.1.self_attn',
            'layers.1.mlp',
            'layers.2.self_attn',
            'layers.2.mlp',
            'layers.3.self_attn',
            'layers.3.mlp',
            'layers.4.self_attn',
            'layers.4.mlp',
            'layers.5.self_attn',
            'layers.5.mlp',
            'layers.6.self_attn',
            'layers.6.mlp',
            'layers.7.self_attn',
            'layers.7.mlp',
            'layers.8.self_attn',
            'layers.8.mlp',
            'layers.9.self_attn',
            'layers.9.mlp',
            'layers.10.self_attn',
            'layers.10.mlp',
            'layers.11.self_attn',
            'layers.11.mlp',
            'layers.12.self_attn',
            'layers.12.mlp',
            'layers.13.self_attn',
            'layers.13.mlp',
            'layers.14.self_attn',
            'layers.14.mlp',
            'layers.15.self_attn',
            'layers.15.mlp',
            'layers.16.self_attn',
            'layers.16.mlp',
            'layers.17.self_attn',
            'layers.17.mlp',
            'layers.18.self_attn',
            'layers.18.mlp',
            'layers.19.self_attn',
            'layers.19.mlp',
            'layers.20.self_attn',
            'layers.20.mlp',
            'layers.21.self_attn',
            'layers.21.mlp',
            'layers.22.self_attn',
            'layers.22.mlp',
            'layers.23.self_attn',
            'layers.23.mlp',
            'layers.24.self_attn',
            'layers.24.mlp',
            'layers.25.self_attn',
            'layers.25.mlp',
            'layers.26.self_attn',
            'layers.26.mlp',
            'layers.27.self_attn',
            'layers.27.mlp',
            'layers.28.self_attn',
            'layers.28.mlp',
            'layers.29.self_attn',
            'layers.29.mlp',
            'layers.30.self_attn',
            'layers.30.mlp',
            'layers.31.self_attn',
            'layers.31.mlp',
            'norm',
            'lm_head'
        ];

        // Current simulation state
        this.currentLayerIndex = 0;
        this.simulationIntervals = new Set();

        // Event listeners: Map<eventName, Set<callback>>
        this.inferenceEvents = new Map();

        // Statistics
        this.stats = {
            totalInferences: 0,
            totalLayersSimulated: 0,
            lastInferenceTime: null,
            averageInferenceDuration: 0
        };

        // Interception state
        this.isIntercepting = false;
        this.originalFetch = null;

        console.log('[InferenceTracker] Initialized with', this.layerSequence.length, 'layers');
    }

    /**
     * Start intercepting fetch calls to LM Studio API
     * Wraps window.fetch to monitor localhost:1234 API calls
     *
     * @throws {Error} If already intercepting
     * @example
     * tracker.startIntercepting();
     */
    startIntercepting() {
        if (this.isIntercepting) {
            console.warn('[InferenceTracker] Already intercepting fetch calls');
            return;
        }

        this.originalFetch = window.fetch;
        const self = this;

        // Wrap window.fetch
        window.fetch = async function(...args) {
            const url = typeof args[0] === 'string' ? args[0] : args[0]?.url;

            // Intercept LM Studio API calls
            if (self.isLMStudioRequest(url)) {
                return self.interceptInference(self.originalFetch, ...args);
            }

            // Pass through non-LM Studio requests
            return self.originalFetch.apply(this, args);
        };

        this.isIntercepting = true;
        console.log('[InferenceTracker] Fetch interception started for LM Studio API');
    }

    /**
     * Stop intercepting fetch calls and restore original fetch
     *
     * @example
     * tracker.stopIntercepting();
     */
    stopIntercepting() {
        if (!this.isIntercepting) {
            console.warn('[InferenceTracker] Not currently intercepting');
            return;
        }

        if (this.originalFetch) {
            window.fetch = this.originalFetch;
            this.originalFetch = null;
        }

        // Clear any running simulations
        this.clearAllSimulations();

        this.isIntercepting = false;
        console.log('[InferenceTracker] Fetch interception stopped');
    }

    /**
     * Check if a URL is an LM Studio API request
     * @param {string} url - The URL to check
     * @returns {boolean} True if this is an LM Studio request
     * @private
     */
    isLMStudioRequest(url) {
        if (!url) return false;

        const LMStudioPatterns = [
            'localhost:1234',
            '127.0.0.1:1234',
            '/v1/chat/completions',
            '/v1/completions',
            '/v1/embeddings'
        ];

        return LMStudioPatterns.some(pattern => url.includes(pattern));
    }

    /**
     * Intercept and track inference requests
     * Emits inference:start, simulates layer activations, emits inference:complete
     *
     * @param {Function} originalFetch - The original fetch function
     * @param {...*} args - Fetch arguments
     * @returns {Promise<Response>} The fetch response
     * @private
     */
    async interceptInference(originalFetch, ...args) {
        const startTime = performance.now();

        // Parse request info
        const url = typeof args[0] === 'string' ? args[0] : args[0]?.url;
        const body = typeof args[1] === 'object' ? args[1]?.body : null;
        let requestData = null;

        try {
            requestData = body ? JSON.parse(body) : null;
        } catch (e) {
            // Ignore parse errors
        }

        // Emit inference start event
        this.emit('inference:start', {
            url: url,
            model: requestData?.model || 'unknown',
            timestamp: startTime,
            promptTokens: requestData?.messages?.length || 0
        });

        // Simulate layer activations during inference
        const simulationId = this.simulateLayerActivations();

        try {
            // Execute the actual fetch
            const response = await originalFetch.apply(window.fetch, args);
            const endTime = performance.now();
            const duration = endTime - startTime;

            // Parse response data if possible
            let responseData = null;
            const clonedResponse = response.clone();
            try {
                responseData = await clonedResponse.json();
            } catch (e) {
                // Not JSON or empty response
            }

            // Update statistics
            this.stats.totalInferences++;
            this.stats.lastInferenceTime = endTime;
            this.stats.averageInferenceDuration =
                (this.stats.averageInferenceDuration * (this.stats.totalInferences - 1) + duration) /
                this.stats.totalInferences;

            // Emit inference complete event
            this.emit('inference:complete', {
                url: url,
                model: requestData?.model || responseData?.model || 'unknown',
                timestamp: endTime,
                duration: duration,
                tokens: responseData?.usage?.total_tokens || 0,
                promptTokens: responseData?.usage?.prompt_tokens || 0,
                completionTokens: responseData?.usage?.completion_tokens || 0,
                finishReason: responseData?.choices?.[0]?.finish_reason || 'unknown'
            });

            return response;

        } catch (error) {
            const endTime = performance.now();

            // Emit inference error event
            this.emit('inference:error', {
                url: url,
                model: requestData?.model || 'unknown',
                timestamp: endTime,
                duration: endTime - startTime,
                error: error.message
            });

            throw error;

        } finally {
            // Clear simulation for this inference
            if (simulationId !== null) {
                this.clearSimulation(simulationId);
            }
        }
    }

    /**
     * Simulate layer activations based on typical transformer flow
     * Emits inference:layer events at regular intervals during inference
     *
     * @returns {number|null} Simulation interval ID for cleanup, or null if simulation disabled
     * @example
     * const simId = tracker.simulateLayerActivations();
     * // Later: clearInterval(simId);
     */
    simulateLayerActivations() {
        if (!this.options.enableSimulation) {
            return null;
        }

        const self = this;
        let index = 0;
        const intervalId = Symbol('simulation');

        const interval = setInterval(() => {
            if (index >= self.layerSequence.length) {
                clearInterval(interval);
                self.simulationIntervals.delete(intervalId);
                return;
            }

            const layerName = self.layerSequence[index];
            self.currentLayerIndex = index;

            // Calculate intensity based on layer type and position
            const intensity = self.calculateLayerIntensity(layerName, index);

            // Emit layer activation event
            self.emit('inference:layer', {
                layer: layerName,
                layerIndex: index,
                intensity: intensity,
                timestamp: performance.now(),
                totalLayers: self.layerSequence.length
            });

            self.stats.totalLayersSimulated++;
            index++;
        }, this.options.simulationInterval);

        this.simulationIntervals.set(intervalId, interval);
        return intervalId;
    }

    /**
     * Calculate activation intensity for a layer
     * Uses heuristics based on layer type and position
     *
     * @param {string} layerName - Name of the layer
     * @param {number} layerIndex - Index in the layer sequence
     * @returns {number} Intensity value between 0 and 1
     * @private
     */
    calculateLayerIntensity(layerName, layerIndex) {
        // Base intensity with some randomness
        let baseIntensity = 0.5 + Math.random() * 0.3;

        // Adjust based on layer type
        if (layerName.includes('tok_embeddings')) {
            baseIntensity = 0.3 + Math.random() * 0.2;
        } else if (layerName.includes('self_attn')) {
            baseIntensity = 0.6 + Math.random() * 0.3;
        } else if (layerName.includes('mlp')) {
            baseIntensity = 0.5 + Math.random() * 0.4;
        } else if (layerName.includes('norm')) {
            baseIntensity = 0.2 + Math.random() * 0.1;
        } else if (layerName.includes('lm_head')) {
            baseIntensity = 0.7 + Math.random() * 0.3;
        }

        // Adjust based on position (later layers often more active)
        const positionFactor = 1 + (layerIndex / this.layerSequence.length) * 0.3;

        return Math.min(1, baseIntensity * positionFactor);
    }

    /**
     * Clear a specific simulation interval
     * @param {symbol} simulationId - The simulation ID to clear
     * @private
     */
    clearSimulation(simulationId) {
        const interval = this.simulationIntervals.get(simulationId);
        if (interval) {
            clearInterval(interval);
            this.simulationIntervals.delete(simulationId);
        }
    }

    /**
     * Clear all running simulation intervals
     * @private
     */
    clearAllSimulations() {
        for (const interval of this.simulationIntervals.values()) {
            clearInterval(interval);
        }
        this.simulationIntervals.clear();
    }

    /**
     * Register an event listener
     * @param {string} eventName - Name of the event ('inference:start', 'inference:complete', 'inference:layer', 'inference:error')
     * @param {Function} callback - Callback function to invoke when event is emitted
     * @example
     * tracker.on('inference:layer', (data) => {
     *     console.log('Layer:', data.layer, 'Intensity:', data.intensity);
     * });
     */
    on(eventName, callback) {
        if (!this.inferenceEvents.has(eventName)) {
            this.inferenceEvents.set(eventName, new Set());
        }
        this.inferenceEvents.get(eventName).add(callback);
    }

    /**
     * Remove an event listener
     * @param {string} eventName - Name of the event
     * @param {Function} callback - Callback function to remove
     * @example
     * tracker.off('inference:layer', myCallback);
     */
    off(eventName, callback) {
        const callbacks = this.inferenceEvents.get(eventName);
        if (callbacks) {
            callbacks.delete(callback);
        }
    }

    /**
     * Emit an event to all registered listeners
     * @param {string} eventName - Name of the event to emit
     * @param {Object} data - Event data to pass to callbacks
     * @private
     */
    emit(eventName, data) {
        const callbacks = this.inferenceEvents.get(eventName);
        if (callbacks) {
            callbacks.forEach(cb => {
                try {
                    cb(data);
                } catch (e) {
                    console.error(`[InferenceTracker] Error in ${eventName} handler:`, e);
                }
            });
        }
    }

    /**
     * Get current statistics
     * @returns {Object} Statistics object with inference counts, durations, etc.
     * @example
     * const stats = tracker.getStats();
     * console.log('Total inferences:', stats.totalInferences);
     */
    getStats() {
        return {
            ...this.stats,
            isIntercepting: this.isIntercepting,
            activeSimulations: this.simulationIntervals.size,
            layerSequenceLength: this.layerSequence.length
        };
    }

    /**
     * Reset statistics
     * @example
     * tracker.resetStats();
     */
    resetStats() {
        this.stats = {
            totalInferences: 0,
            totalLayersSimulated: 0,
            lastInferenceTime: null,
            averageInferenceDuration: 0
        };
        console.log('[InferenceTracker] Statistics reset');
    }

    /**
     * Set a custom layer sequence
     * @param {string[]} layers - Array of layer names
     * @example
     * tracker.setLayerSequence(['embed', 'layer1', 'layer2', 'output']);
     */
    setLayerSequence(layers) {
        this.layerSequence = layers;
        console.log('[InferenceTracker] Layer sequence updated to', layers.length, 'layers');
    }

    /**
     * Set simulation options
     * @param {Object} options - Options to update
     * @param {number} options.simulationInterval - Interval between layer simulations in ms
     * @param {boolean} options.enableSimulation - Enable/disable layer simulation
     * @example
     * tracker.setOptions({ simulationInterval: 25, enableSimulation: true });
     */
    setOptions(options) {
        this.options = { ...this.options, ...options };
        console.log('[InferenceTracker] Options updated:', this.options);
    }

    /**
     * Destroy the tracker and clean up resources
     * @example
     * tracker.destroy();
     */
    destroy() {
        this.stopIntercepting();
        this.inferenceEvents.clear();
        this.interceptedFetches.clear();
        console.log('[InferenceTracker] Destroyed');
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LLMInferenceTracker };
}

// Also expose globally for browser usage
if (typeof window !== 'undefined') {
    window.LLMInferenceTracker = LLMInferenceTracker;
}
