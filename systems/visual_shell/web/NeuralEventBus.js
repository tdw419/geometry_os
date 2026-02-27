/**
 * Geometry OS: NeuralEventBus (Frontend)
 *
 * Lightweight event bus for window coordination on the infinite map.
 * Enables pub/sub communication between WindowParticles, TerminalManager,
 * and other visual shell components.
 *
 * Architecture:
 * [WindowParticle] ──emit──→ [NeuralEventBus] ──broadcast──→ [Subscribers]
 *                                    ↓
 *                         [ParticleManager]
 *                                    ↓
 *                         [ViewportManager]
 */

export class NeuralEventBus {
    /**
     * Create the event bus.
     * @param {Object} options - Configuration options
     */
    constructor(options = {}) {
        this.debug = options.debug || false;
        this.listeners = new Map();
        this.wildcardListeners = [];
        this.history = [];
        this.maxHistory = options.maxHistory || 100;

        // Particle tracking
        this.particleStates = new Map();
        this.topZIndex = 0;

        // WebSocket connection for backend sync (optional)
        this.ws = null;
        this.wsUrl = options.wsUrl || null;
        this.wsConnected = false;

        if (this.wsUrl) {
            this.connect(this.wsUrl);
        }
    }

    /**
     * Subscribe to an event.
     * @param {string} eventType - Event type (e.g., 'window-particle:focus')
     * @param {Function} callback - Callback function
     * @returns {Function} Unsubscribe function
     */
    on(eventType, callback) {
        if (!this.listeners.has(eventType)) {
            this.listeners.set(eventType, []);
        }
        this.listeners.get(eventType).push(callback);

        if (this.debug) {
            console.log(`[NEB] Subscribed to: ${eventType}`);
        }

        // Return unsubscribe function
        return () => this.off(eventType, callback);
    }

    /**
     * Subscribe to all events (wildcard).
     * @param {Function} callback - Callback function
     * @returns {Function} Unsubscribe function
     */
    onAll(callback) {
        this.wildcardListeners.push(callback);
        return () => {
            const idx = this.wildcardListeners.indexOf(callback);
            if (idx >= 0) this.wildcardListeners.splice(idx, 1);
        };
    }

    /**
     * Unsubscribe from an event.
     * @param {string} eventType
     * @param {Function} callback
     */
    off(eventType, callback) {
        const listeners = this.listeners.get(eventType);
        if (listeners) {
            const idx = listeners.indexOf(callback);
            if (idx >= 0) {
                listeners.splice(idx, 1);
            }
        }
    }

    /**
     * Emit an event.
     * @param {string} eventType
     * @param {Object} data
     */
    emit(eventType, data) {
        const event = {
            type: eventType,
            data,
            timestamp: Date.now()
        };

        // Add to history
        this.history.push(event);
        if (this.history.length > this.maxHistory) {
            this.history.shift();
        }

        // Notify specific listeners
        const listeners = this.listeners.get(eventType);
        if (listeners) {
            for (const callback of listeners) {
                try {
                    callback(data, event);
                } catch (e) {
                    console.error(`[NEB] Listener error for ${eventType}:`, e);
                }
            }
        }

        // Notify wildcard listeners
        for (const callback of this.wildcardListeners) {
            try {
                callback(eventType, data, event);
            } catch (e) {
                console.error('[NEB] Wildcard listener error:', e);
            }
        }

        // Track particle states
        if (eventType.startsWith('window-particle:')) {
            this._trackParticleState(eventType, data);
        }

        // Send to backend if connected
        if (this.wsConnected && this.ws) {
            this._sendToBackend(event);
        }

        if (this.debug) {
            console.log(`[NEB] Emitted: ${eventType}`, data);
        }
    }

    /**
     * Emit and wait for first response.
     * @param {string} eventType
     * @param {Object} data
     * @returns {Promise}
     */
    emitAsync(eventType, data) {
        return new Promise((resolve) => {
            const responseType = eventType + ':response';
            const unsub = this.on(responseType, (responseData) => {
                unsub();
                resolve(responseData);
            });
            this.emit(eventType, data);
        });
    }

    /**
     * Track particle state from events.
     */
    _trackParticleState(eventType, data) {
        if (!data.particleId) return;

        const particleId = data.particleId;
        if (!this.particleStates.has(particleId)) {
            this.particleStates.set(particleId, {});
        }

        const state = this.particleStates.get(particleId);
        const action = eventType.split(':')[1];

        switch (action) {
            case 'move':
                state.x = data.x;
                state.y = data.y;
                break;
            case 'scale':
                state.scale = data.scale;
                break;
            case 'depth':
                state.zIndex = data.zIndex;
                if (data.zIndex > this.topZIndex) {
                    this.topZIndex = data.zIndex;
                }
                break;
            case 'focus':
                state.focused = data.focused;
                break;
            case 'minimize':
                state.minimized = data.minimized;
                break;
            case 'visibility':
                state.visible = data.visible;
                break;
            case 'register':
                state.registered = true;
                state.type = data.type;
                break;
            case 'unregister':
                this.particleStates.delete(particleId);
                break;
        }
    }

    /**
     * Get particle state.
     * @param {string} particleId
     */
    getParticleState(particleId) {
        return this.particleStates.get(particleId);
    }

    /**
     * Get all particle states.
     */
    getAllParticleStates() {
        const states = {};
        for (const [id, state] of this.particleStates) {
            states[id] = { ...state, id };
        }
        return states;
    }

    /**
     * Get top z-index.
     */
    getTopZIndex() {
        return this.topZIndex;
    }

    /**
     * Connect to backend WebSocket.
     * @param {string} url
     */
    connect(url) {
        if (this.ws) {
            this.ws.close();
        }

        try {
            this.ws = new WebSocket(url);

            this.ws.onopen = () => {
                this.wsConnected = true;
                console.log('[NEB] Connected to backend:', url);
                this.emit('neb:connected', { url });
            };

            this.ws.onmessage = (event) => {
                try {
                    const message = JSON.parse(event.data);
                    this._handleBackendMessage(message);
                } catch (e) {
                    console.error('[NEB] Failed to parse backend message:', e);
                }
            };

            this.ws.onclose = () => {
                this.wsConnected = false;
                console.log('[NEB] Disconnected from backend');
                this.emit('neb:disconnected', {});
            };

            this.ws.onerror = (error) => {
                console.error('[NEB] WebSocket error:', error);
            };

        } catch (e) {
            console.error('[NEB] Failed to connect:', e);
        }
    }

    /**
     * Disconnect from backend.
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
            this.wsConnected = false;
        }
    }

    /**
     * Send event to backend.
     * @param {Object} event
     */
    _sendToBackend(event) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(event));
        }
    }

    /**
     * Handle message from backend.
     * @param {Object} message
     */
    _handleBackendMessage(message) {
        // Backend can emit events to frontend
        if (message.type) {
            this.emit(message.type, message.data || message);
        }
    }

    /**
     * Get event history.
     * @param {string} eventType - Filter by type (optional)
     */
    getHistory(eventType = null) {
        if (eventType) {
            return this.history.filter(e => e.type === eventType);
        }
        return [...this.history];
    }

    /**
     * Clear event history.
     */
    clearHistory() {
        this.history = [];
    }

    /**
     * Destroy the event bus.
     */
    destroy() {
        this.disconnect();
        this.listeners.clear();
        this.wildcardListeners = [];
        this.history = [];
        this.particleStates.clear();
    }
}


// Singleton instance
let nebInstance = null;

/**
 * Get or create the singleton NeuralEventBus.
 * @param {Object} options
 */
export function getNeuralEventBus(options = {}) {
    if (!nebInstance) {
        nebInstance = new NeuralEventBus(options);
    }
    return nebInstance;
}
