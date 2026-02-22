/**
 * LMStudioBridge - Real-time connection to LM Studio
 *
 * Connects to LM Studio's WebSocket API to receive:
 * - Inference events
 * - Token generation
 * - Layer activations
 * - Model metadata
 */

class LMStudioBridge {
    constructor(options = {}) {
        this.options = {
            url: 'ws://localhost:1234/v1',
            reconnectInterval: 5000,
            maxReconnectAttempts: 10,
            ...options
        };

        this.ws = null;
        this.connected = false;
        this.reconnectAttempts = 0;
        this.eventHandlers = new Map();

        // Activity recording
        this.activityBuffer = [];
        this.activityBufferSize = 1000;

        console.log('[LMStudioBridge] Initialized');
    }

    /**
     * Connect to LM Studio
     * @returns {Promise<void>}
     */
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.options.url);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.reconnectAttempts = 0;
                    console.log('[LMStudioBridge] Connected to', this.options.url);
                    this._emit('connected', { url: this.options.url });
                    resolve();
                };

                this.ws.onmessage = (event) => {
                    this._handleMessage(event.data);
                };

                this.ws.onerror = (error) => {
                    console.error('[LMStudioBridge] Error:', error);
                    this._emit('error', { error });
                };

                this.ws.onclose = () => {
                    this.connected = false;
                    console.log('[LMStudioBridge] Disconnected');
                    this._emit('disconnected');

                    // Attempt reconnection
                    if (this.reconnectAttempts < this.options.maxReconnectAttempts) {
                        this.reconnectAttempts++;
                        setTimeout(() => {
                            console.log(`[LMStudioBridge] Reconnecting (${this.reconnectAttempts}/${this.options.maxReconnectAttempts})...`);
                            this.connect();
                        }, this.options.reconnectInterval);
                    }
                };
            } catch (error) {
                reject(error);
            }
        });
    }

    /**
     * Disconnect from LM Studio
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }

    /**
     * Handle incoming message
     * @private
     */
    _handleMessage(data) {
        try {
            const message = JSON.parse(data);

            switch (message.type) {
                case 'inference_start':
                    this._handleInferenceStart(message);
                    break;

                case 'inference_end':
                    this._handleInferenceEnd(message);
                    break;

                case 'token':
                    this._handleToken(message);
                    break;

                case 'activation':
                    this._handleActivation(message);
                    break;

                default:
                    console.log('[LMStudioBridge] Unknown message type:', message.type);
            }
        } catch (error) {
            console.error('[LMStudioBridge] Failed to parse message:', error);
        }
    }

    /**
     * Handle inference start
     * @private
     */
    _handleInferenceStart(message) {
        const data = {
            model: message.model,
            timestamp: performance.now(),
            input: message.input
        };

        this._emit('inferenceStart', data);
    }

    /**
     * Handle inference end
     * @private
     */
    _handleInferenceEnd(message) {
        const data = {
            model: message.model,
            timestamp: performance.now(),
            tokens: message.tokens,
            duration: message.duration
        };

        this._emit('inferenceComplete', data);
    }

    /**
     * Handle token generation
     * @private
     */
    _handleToken(message) {
        const data = {
            token: message.token,
            position: message.position,
            logprob: message.logprob,
            timestamp: performance.now()
        };

        this._emit('token', data);
    }

    /**
     * Handle layer activation
     * @private
     */
    _handleActivation(message) {
        const data = {
            layer: message.layer,
            neurons: message.neurons,
            intensity: message.intensity || 1.0,
            timestamp: performance.now()
        };

        // Buffer activity for heatmap
        this.activityBuffer.push(data);
        if (this.activityBuffer.length > this.activityBufferSize) {
            this.activityBuffer.shift();
        }

        this._emit('activation', data);
    }

    /**
     * Get recent activations
     * @param {number} count - Number of recent activations
     * @returns {Array} Recent activations
     */
    getRecentActivations(count = 100) {
        return this.activityBuffer.slice(-count);
    }

    /**
     * Register event handler
     * @param {string} event - Event name
     * @param {Function} handler - Event handler
     */
    on(event, handler) {
        if (!this.eventHandlers.has(event)) {
            this.eventHandlers.set(event, []);
        }
        this.eventHandlers.get(event).push(handler);
    }

    /**
     * Remove event handler
     * @param {string} event - Event name
     * @param {Function} handler - Event handler
     */
    off(event, handler) {
        const handlers = this.eventHandlers.get(event);
        if (handlers) {
            const index = handlers.indexOf(handler);
            if (index > -1) {
                handlers.splice(index, 1);
            }
        }
    }

    /**
     * Emit event
     * @private
     */
    _emit(event, data) {
        const handlers = this.eventHandlers.get(event);
        if (handlers) {
            for (const handler of handlers) {
                try {
                    handler(data);
                } catch (error) {
                    console.error(`[LMStudioBridge] Handler error for ${event}:`, error);
                }
            }
        }
    }

    /**
     * Test connection with mock data
     */
    testMode() {
        console.log('[LMStudioBridge] Entering test mode');

        // Simulate inference
        setInterval(() => {
            if (!this.connected) {
                this._handleInferenceStart({
                    model: 'test-model',
                    input: 'test input'
                });

                // Simulate activations
                for (let i = 0; i < 10; i++) {
                    this._handleActivation({
                        layer: `layer_${Math.floor(Math.random() * 32)}`,
                        neurons: Math.floor(Math.random() * 1000),
                        intensity: Math.random()
                    });
                }

                this._handleInferenceEnd({
                    model: 'test-model',
                    tokens: 10,
                    duration: 100
                });
            }
        }, 2000);
    }

    /**
     * Clear activity buffer
     */
    clearActivity() {
        this.activityBuffer = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.LMStudioBridge = LMStudioBridge;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LMStudioBridge };
}
