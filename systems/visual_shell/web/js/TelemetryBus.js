/**
 * TelemetryBus - Event-driven data bus for Neural City visualization.
 *
 * Provides a pub/sub interface for real-time telemetry data from the
 * Evolution Daemon, with WebSocket integration for live updates.
 */
class TelemetryBus {
    constructor(wsUrl = 'ws://localhost:8768') {
        this.wsUrl = wsUrl;
        this.ws = null;
        this.subscribers = new Map();
        this.connected = false;
    }

    /**
     * Subscribe to an event type.
     * @param {string} eventType - The event type to listen for
     * @param {Function} callback - Callback function invoked with event data
     * @returns {Function} Unsubscribe function
     */
    subscribe(eventType, callback) {
        if (!this.subscribers.has(eventType)) {
            this.subscribers.set(eventType, new Set());
        }
        this.subscribers.get(eventType).add(callback);

        // Return unsubscribe function
        return () => {
            this.subscribers.get(eventType)?.delete(callback);
        };
    }

    /**
     * Emit an event to all subscribers.
     * @param {string} eventType - The event type to emit
     * @param {*} data - Data to pass to subscribers
     */
    emit(eventType, data) {
        const callbacks = this.subscribers.get(eventType);
        if (callbacks) {
            callbacks.forEach(cb => cb(data));
        }
    }

    /**
     * Connect to the WebSocket server.
     * @returns {Promise<boolean>} Resolves when connected
     */
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.wsUrl);

                this.ws.onopen = () => {
                    this.connected = true;
                    this._onConnect();
                    resolve(true);
                };

                this.ws.onmessage = (event) => {
                    this._handleMessage(event);
                };

                this.ws.onerror = (err) => {
                    console.warn('TelemetryBus WebSocket error:', err);
                    this.connected = false;
                };

                this.ws.onclose = () => {
                    this.connected = false;
                    this._onDisconnect();
                };
            } catch (e) {
                reject(e);
            }
        });
    }

    /**
     * Handle incoming WebSocket messages.
     * @private
     */
    _handleMessage(event) {
        try {
            const data = JSON.parse(event.data);

            // Handle RPC-style broadcast_event format
            if (data.type === 'broadcast_event' && data.params) {
                this.emit(data.params.type, data.params.data);
            } else if (data.method === 'broadcast_event') {
                this.emit(data.params?.type, data.params?.data);
            }
        } catch (e) {
            console.warn('TelemetryBus parse error:', e);
        }
    }

    /**
     * Called when WebSocket connects.
     * @private
     */
    _onConnect() {
        console.log('🏙️ TelemetryBus connected');
        this.emit('bus_connected', { url: this.wsUrl });
    }

    /**
     * Called when WebSocket disconnects.
     * @private
     */
    _onDisconnect() {
        this.emit('bus_disconnected', {});
    }

    /**
     * Check if WebSocket is connected.
     * @returns {boolean}
     */
    isConnected() {
        return this.connected && this.ws?.readyState === WebSocket.OPEN;
    }

    /**
     * Disconnect from WebSocket server.
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }
}

// Export for browser and module systems
if (typeof window !== 'undefined') {
    window.TelemetryBus = TelemetryBus;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = TelemetryBus;
}
