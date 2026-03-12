/**
 * SynapticClient - WebSocket client for Legible Brain execution
 *
 * Connects the visual morphological substrate to the Python GlyphStratum executor.
 * When you click on the brain map, this client sends the DAG to the bridge.
 *
 * Usage:
 *     const client = new SynapticClient();
 *     await client.connect();
 *     const result = await client.probe(dag, coords);
 */

class SynapticClient {
    constructor(options = {}) {
        this.url = options.url || 'ws://localhost:8765';
        this.ws = null;
        this.connected = false;
        this.pendingRequests = new Map();
        this.requestId = 0;
        this.reconnectAttempts = 0;
        this.maxReconnectAttempts = 5;
        this.reconnectDelay = 1000;
        this.eventHandlers = {
            'connect': [],
            'disconnect': [],
            'execution_result': [],
            'error': []
        };
    }

    /**
     * Connect to the Synaptic Bridge
     */
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.url);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.reconnectAttempts = 0;
                    console.log('🧠 SynapticClient connected to', this.url);
                    this.emit('connect', { url: this.url });
                    resolve();
                };

                this.ws.onclose = (event) => {
                    this.connected = false;
                    console.log('SynapticClient disconnected:', event.reason);
                    this.emit('disconnect', { reason: event.reason });

                    // Attempt reconnect
                    if (this.reconnectAttempts < this.maxReconnectAttempts) {
                        this.reconnectAttempts++;
                        console.log(`Reconnecting in ${this.reconnectDelay}ms (attempt ${this.reconnectAttempts})`);
                        setTimeout(() => this.connect(), this.reconnectDelay);
                    }
                };

                this.ws.onerror = (error) => {
                    console.error('SynapticClient error:', error);
                    this.emit('error', { error });
                    reject(error);
                };

                this.ws.onmessage = (event) => {
                    this.handleMessage(event.data);
                };

            } catch (e) {
                reject(e);
            }
        });
    }

    /**
     * Disconnect from the bridge
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
            this.connected = false;
        }
    }

    /**
     * Handle incoming message
     */
    handleMessage(data) {
        try {
            const message = JSON.parse(data);
            const type = message.type;

            switch (type) {
                case 'EXECUTION_RESULT':
                    this.emit('execution_result', message);
                    break;

                case 'PONG':
                    console.log('PONG received:', message.stats);
                    break;

                case 'STATUS':
                    console.log('Bridge status:', message);
                    break;

                case 'ERROR':
                    console.error('Bridge error:', message.error);
                    this.emit('error', message);
                    break;

                default:
                    console.log('Unknown message type:', type);
            }
        } catch (e) {
            console.error('Failed to parse message:', e);
        }
    }

    /**
     * Send a synaptic probe (execute a DAG)
     */
    async probe(dag, coords = { x: 0, y: 0 }) {
        if (!this.connected) {
            console.warn('SynapticClient not connected, using simulation');
            return this.simulateExecution(dag, coords);
        }

        const message = {
            type: 'SYNAPTIC_PROBE',
            dag: dag,
            coords: coords
        };

        return new Promise((resolve, reject) => {
            const handler = (result) => {
                this.off('execution_result', handler);
                resolve(result);
            };

            this.on('execution_result', handler);

            this.ws.send(JSON.stringify(message));
            console.log('🔍 Sent SYNAPTIC_PROBE:', dag.name);

            // Timeout after 5 seconds
            setTimeout(() => {
                this.off('execution_result', handler);
                reject(new Error('Probe timeout'));
            }, 5000);
        });
    }

    /**
     * Simulate execution when bridge is not available
     */
    simulateExecution(dag, coords) {
        const glyphs = dag.glyphs || {};
        const glyphCount = Object.keys(glyphs).length;

        // Extract activation from DAG data
        let activation = 0.5;
        let entropy = 0.2;

        for (const [idx, glyph] of Object.entries(glyphs)) {
            if (glyph.opcode === 'DATA' && glyph.metadata?.invariants?.value !== undefined) {
                activation = glyph.metadata.invariants.value;
            }
            if (glyph.opcode === 'BRANCH') {
                entropy = glyph.metadata?.invariants?.condition || 0.7;
            }
        }

        // Simulate confidence calculation
        const confidence = activation * (1.0 - entropy * 0.2);

        return {
            success: true,
            error: null,
            result: `[SIMULATED] Confidence: ${confidence.toFixed(6)}`,
            status: {
                halted: false,
                error: null,
                frame_depth: 1,
                memory_allocated: glyphCount,
                output: [`Confidence: ${confidence.toFixed(6)}`]
            },
            registry: {
                glyph_count: glyphCount,
                strata: { 'Logic': 1, 'Substrate': 1 },
                opcodes: {}
            },
            coords: coords,
            simulated: true
        };
    }

    /**
     * Ping the bridge
     */
    async ping() {
        if (!this.connected) return null;

        return new Promise((resolve) => {
            const handler = (result) => {
                this.off('execution_result', handler);
                resolve(result);
            };

            // Use a one-time listener for PONG
            const originalHandler = this.ws.onmessage;
            this.ws.onmessage = (event) => {
                const msg = JSON.parse(event.data);
                if (msg.type === 'PONG') {
                    this.ws.onmessage = originalHandler;
                    resolve(msg);
                } else {
                    originalHandler.call(this.ws, event);
                }
            };

            this.ws.send(JSON.stringify({ type: 'PING' }));

            setTimeout(() => {
                this.ws.onmessage = originalHandler;
                resolve(null);
            }, 2000);
        });
    }

    /**
     * Event emitter methods
     */
    on(event, handler) {
        if (this.eventHandlers[event]) {
            this.eventHandlers[event].push(handler);
        }
    }

    off(event, handler) {
        if (this.eventHandlers[event]) {
            const idx = this.eventHandlers[event].indexOf(handler);
            if (idx >= 0) {
                this.eventHandlers[event].splice(idx, 1);
            }
        }
    }

    emit(event, data) {
        if (this.eventHandlers[event]) {
            for (const handler of this.eventHandlers[event]) {
                handler(data);
            }
        }
    }
}

// Export for module systems
if (typeof module !== 'undefined') {
    module.exports = { SynapticClient };
}
