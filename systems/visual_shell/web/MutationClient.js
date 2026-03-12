/**
 * MutationClient - Phase 41 Ouroboros Repair Client
 *
 * Enables the Legible Brain to write to its own substrate.
 * The brain can now heal itself by modifying its atlas.
 *
 * Usage:
 *     const mutClient = new MutationClient();
 *     await mutClient.connect();
 *
 *     // Scan for fractures
 *     const fractures = await mutClient.scanForFaults(0.6);
 *
 *     // Apply repair
 *     const result = await mutClient.repair(fractures[0]);
 */

class MutationClient {
    constructor(options = {}) {
        this.url = options.url || 'ws://localhost:8765';
        this.ws = null;
        this.connected = false;
        this.pendingRequests = new Map();
        this.eventHandlers = {
            'connect': [],
            'disconnect': [],
            'fault_report': [],
            'write_result': [],
            'repair_result': [],
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
                    console.log('🔧 MutationClient connected - Ouroboros Repair enabled');
                    this.emit('connect', { url: this.url });
                    resolve();
                };

                this.ws.onclose = (event) => {
                    this.connected = false;
                    console.log('MutationClient disconnected:', event.reason);
                    this.emit('disconnect', { reason: event.reason });
                };

                this.ws.onerror = (error) => {
                    console.error('MutationClient error:', error);
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
                case 'FAULT_REPORT':
                    this.emit('fault_report', message);
                    break;

                case 'WRITE_RESULT':
                    this.emit('write_result', message);
                    break;

                case 'REPAIR_RESULT':
                    this.emit('repair_result', message);
                    break;

                case 'ATLAS_STATUS':
                    console.log('Atlas status:', message);
                    break;

                case 'ERROR':
                    console.error('Bridge error:', message.error);
                    this.emit('error', message);
                    break;

                default:
                    // Pass to generic handlers
                    break;
            }
        } catch (e) {
            console.error('Failed to parse message:', e);
        }
    }

    /**
     * Scan for high-entropy fractures in the substrate
     */
    async scanForFaults(threshold = 0.6) {
        if (!this.connected) {
            console.warn('MutationClient not connected');
            return { fractures: [], simulated: true };
        }

        return new Promise((resolve, reject) => {
            const handler = (result) => {
                this.off('fault_report', handler);
                resolve(result);
            };

            this.on('fault_report', handler);

            this.ws.send(JSON.stringify({
                type: 'FAULT_SCAN',
                threshold: threshold
            }));

            console.log(`🔍 FAULT_SCAN requested (threshold=${threshold})`);

            // Timeout after 10 seconds
            setTimeout(() => {
                this.off('fault_report', handler);
                reject(new Error('Fault scan timeout'));
            }, 10000);
        });
    }

    /**
     * Write a mutation to the substrate
     */
    async write(coords, mutation) {
        if (!this.connected) {
            console.warn('MutationClient not connected, simulating write');
            return this.simulateWrite(coords, mutation);
        }

        return new Promise((resolve, reject) => {
            const handler = (result) => {
                this.off('write_result', handler);
                resolve(result);
            };

            this.on('write_result', handler);

            this.ws.send(JSON.stringify({
                type: 'SUBSTRATE_WRITE',
                coords: coords,
                mutation: mutation
            }));

            console.log(`✏️ SUBSTRATE_WRITE at (${coords.x}, ${coords.y})`);

            // Timeout after 5 seconds
            setTimeout(() => {
                this.off('write_result', handler);
                reject(new Error('Write timeout'));
            }, 5000);
        });
    }

    /**
     * Run a full repair cycle
     */
    async repairCycle(threshold = 0.6) {
        if (!this.connected) {
            console.warn('MutationClient not connected');
            return { success: false, simulated: true };
        }

        return new Promise((resolve, reject) => {
            const handler = (result) => {
                this.off('repair_result', handler);
                resolve(result);
            };

            this.on('repair_result', handler);

            this.ws.send(JSON.stringify({
                type: 'REPAIR_CYCLE',
                threshold: threshold
            }));

            console.log(`🔄 REPAIR_CYCLE initiated (threshold=${threshold})`);

            // Timeout after 30 seconds (repair can take time)
            setTimeout(() => {
                this.off('repair_result', handler);
                reject(new Error('Repair cycle timeout'));
            }, 30000);
        });
    }

    /**
     * Load an atlas for repair operations
     */
    async loadAtlas(path) {
        if (!this.connected) return { success: false };

        return new Promise((resolve) => {
            const handler = (result) => {
                this.off('atlas_status', handler);
                resolve(result);
            };

            // Temporarily add handler for this response
            const originalHandler = this.ws.onmessage;
            this.ws.onmessage = (event) => {
                const msg = JSON.parse(event.data);
                if (msg.type === 'ATLAS_STATUS') {
                    this.ws.onmessage = originalHandler;
                    resolve(msg);
                } else {
                    this.handleMessage(event.data);
                }
            };

            this.ws.send(JSON.stringify({
                type: 'LOAD_ATLAS',
                path: path
            }));
        });
    }

    /**
     * Simulate a write when bridge is unavailable
     */
    simulateWrite(coords, mutation) {
        const pixelsModified = (mutation.radius || 8) ** 2 * Math.PI;

        return {
            success: true,
            simulated: true,
            pixels_modified: Math.floor(pixelsModified),
            elapsed_ms: Math.random() * 10,
            mutation: {
                x: coords.x,
                y: coords.y,
                target_entropy: mutation.target_entropy || 0.3,
                rationale: mutation.rationale || 'Simulated repair'
            }
        };
    }

    /**
     * Convenience method: Heal a fracture
     */
    async heal(fracture) {
        const mutation = {
            entropy: fracture.entropy,
            activation: fracture.activation,
            sector: fracture.sector,
            radius: fracture.severity === 'critical' ? 12 : 6,
            target_entropy: fracture.entropy * 0.5,
            delta_g: -fracture.entropy * 0.5,
            rationale: `Heal ${fracture.severity} fracture at (${fracture.x}, ${fracture.y})`
        };

        return this.write({ x: fracture.x, y: fracture.y }, mutation);
    }

    /**
     * Phase 42: Neural City Colonization
     * Deploy a functional district to the atlas
     */
    async colonize(district = "Syntactic") {
        return this.sendRequest('COLONIZE', { district: district }, 'COLONIZE_RESULT');
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
    module.exports = { MutationClient };
}
