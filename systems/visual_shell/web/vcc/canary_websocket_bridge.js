/**
 * Canary WebSocket Bridge
 * 
 * Streams health analysis data from Tectonic Canary (Python) to the
 * Visual Shell (PixiJS) in real-time.
 * 
 * Protocol:
 * - Client connects to WebSocket endpoint
 * - Server pushes health reports as tiles are analyzed
 * - Client can request analysis for specific tiles
 * - Bidirectional: Client can send visual feedback to Canary
 * 
 * Endpoints:
 * - ws://localhost:8766/vcc (health stream)
 * - HTTP POST /vcc/analyze (request analysis)
 */

/**
 * Connection states
 */
const BridgeState = {
    DISCONNECTED: 'DISCONNECTED',
    CONNECTING: 'CONNECTING',
    CONNECTED: 'CONNECTED',
    RECONNECTING: 'RECONNECTING',
    ERROR: 'ERROR'
};

/**
 * Message types
 */
const MessageType = {
    // Server -> Client
    HEALTH_REPORT: 'HEALTH_REPORT',
    BATCH_COMPLETE: 'BATCH_COMPLETE',
    ANALYSIS_PROGRESS: 'ANALYSIS_PROGRESS',
    SYSTEM_STATUS: 'SYSTEM_STATUS',
    
    // Client -> Server
    REQUEST_ANALYSIS: 'REQUEST_ANALYSIS',
    SUBSCRIBE_TILES: 'SUBSCRIBE_TILES',
    UNSUBSCRIBE_TILES: 'UNSUBSCRIBE_TILES',
    VISUAL_FEEDBACK: 'VISUAL_FEEDBACK',
    PING: 'PING'
};

/**
 * CanaryWebSocketBridge
 * 
 * Manages connection to Tectonic Canary health streaming service.
 */
class CanaryWebSocketBridge {
    constructor(options = {}) {
        this.config = {
            websocketUrl: 'ws://localhost:8766/vcc',
            httpUrl: 'http://localhost:8766',
            reconnectInterval: 5000,
            maxReconnectAttempts: 10,
            pingInterval: 30000,
            requestTimeout: 10000,
            batchSize: 10,
            ...options
        };

        this.state = BridgeState.DISCONNECTED;
        this.ws = null;
        this.reconnectAttempts = 0;
        this.pingTimer = null;
        this.reconnectTimer = null;
        
        // Pending requests (for correlation)
        this.pendingRequests = new Map(); // requestId -> { resolve, reject, timer }
        
        // Subscribed tiles
        this.subscribedTiles = new Set();
        
        // Event listeners
        this.listeners = {
            healthReport: new Set(),
            batchComplete: new Set(),
            progress: new Set(),
            status: new Set(),
            connect: new Set(),
            disconnect: new Set(),
            error: new Set()
        };
        
        // Analysis queue (tiles waiting to be analyzed)
        this.analysisQueue = [];
        this.processingQueue = false;
        
        // Stats
        this.stats = {
            messagesReceived: 0,
            messagesSent: 0,
            healthReportsReceived: 0,
            reconnections: 0,
            lastPingLatency: 0
        };

        console.log('🌉 CanaryWebSocketBridge initialized');
    }

    /**
     * Connect to Tectonic Canary WebSocket
     */
    async connect() {
        if (this.state === BridgeState.CONNECTED || this.state === BridgeState.CONNECTING) {
            return Promise.resolve();
        }

        this.state = BridgeState.CONNECTING;
        this._notifyListeners('status', { state: this.state });

        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.config.websocketUrl);
                
                this.ws.onopen = () => {
                    console.log('🌉 Connected to Tectonic Canary');
                    this.state = BridgeState.CONNECTED;
                    this.reconnectAttempts = 0;
                    this._startPingInterval();
                    this._notifyListeners('connect', {});
                    this._notifyListeners('status', { state: this.state });
                    
                    // Resubscribe to tiles
                    this._resubscribeTiles();
                    
                    resolve();
                };
                
                this.ws.onmessage = (event) => {
                    this._handleMessage(event.data);
                };
                
                this.ws.onclose = () => {
                    this._handleDisconnect();
                };
                
                this.ws.onerror = (error) => {
                    console.error('🌉 WebSocket error:', error);
                    this.state = BridgeState.ERROR;
                    this._notifyListeners('error', { error });
                    this._notifyListeners('status', { state: this.state });
                    reject(error);
                };
                
            } catch (e) {
                this.state = BridgeState.ERROR;
                reject(e);
            }
        });
    }

    /**
     * Disconnect from WebSocket
     */
    disconnect() {
        this._cleanup();
        this.state = BridgeState.DISCONNECTED;
        this._notifyListeners('disconnect', {});
        this._notifyListeners('status', { state: this.state });
    }

    /**
     * Request health analysis for specific tiles
     */
    async requestAnalysis(tileConfigs) {
        // tileConfigs: [{ tileKey, texturePath, coordinates }]
        const configs = Array.isArray(tileConfigs) ? tileConfigs : [tileConfigs];
        
        // Add to queue
        this.analysisQueue.push(...configs);
        
        // Process queue
        if (!this.processingQueue) {
            this._processAnalysisQueue();
        }
        
        return Promise.resolve();
    }

    /**
     * Subscribe to real-time health updates for tiles
     */
    async subscribeTiles(tileKeys) {
        const keys = Array.isArray(tileKeys) ? tileKeys : [tileKeys];
        
        for (const key of keys) {
            this.subscribedTiles.add(key);
        }
        
        if (this.state === BridgeState.CONNECTED) {
            this._sendMessage({
                type: MessageType.SUBSCRIBE_TILES,
                tileKeys: keys,
                timestamp: Date.now()
            });
        }
    }

    /**
     * Unsubscribe from tile updates
     */
    async unsubscribeTiles(tileKeys) {
        const keys = Array.isArray(tileKeys) ? tileKeys : [tileKeys];
        
        for (const key of keys) {
            this.subscribedTiles.delete(key);
        }
        
        if (this.state === BridgeState.CONNECTED) {
            this._sendMessage({
                type: MessageType.UNSUBSCRIBE_TILES,
                tileKeys: keys,
                timestamp: Date.now()
            });
        }
    }

    /**
     * Send visual feedback to Canary (bidirectional)
     */
    async sendVisualFeedback(tileKey, feedback) {
        if (this.state !== BridgeState.CONNECTED) {
            console.warn('🌉 Cannot send feedback: not connected');
            return;
        }
        
        this._sendMessage({
            type: MessageType.VISUAL_FEEDBACK,
            tileKey,
            feedback, // { effectActivated, userNoticed, timestamp }
            timestamp: Date.now()
        });
    }

    /**
     * Get system status from Canary
     */
    async getSystemStatus() {
        return this._requestResponse({
            type: MessageType.SYSTEM_STATUS,
            timestamp: Date.now()
        });
    }

    /**
     * Event subscription
     */
    on(event, callback) {
        if (this.listeners[event]) {
            this.listeners[event].add(callback);
            return () => this.listeners[event].delete(callback);
        }
        return () => {};
    }

    /**
     * Get current connection state
     */
    getState() {
        return this.state;
    }

    /**
     * Get bridge statistics
     */
    getStats() {
        return { ...this.stats };
    }

    /**
     * Process analysis queue in batches
     */
    async _processAnalysisQueue() {
        if (this.analysisQueue.length === 0 || this.state !== BridgeState.CONNECTED) {
            this.processingQueue = false;
            return;
        }
        
        this.processingQueue = true;
        
        // Take batch from queue
        const batch = this.analysisQueue.splice(0, this.config.batchSize);
        
        try {
            this._sendMessage({
                type: MessageType.REQUEST_ANALYSIS,
                tiles: batch,
                timestamp: Date.now()
            });
        } catch (e) {
            // Put back in queue on error
            this.analysisQueue.unshift(...batch);
        }
        
        // Process next batch
        setTimeout(() => this._processAnalysisQueue(), 100);
    }

    /**
     * Handle incoming WebSocket message
     */
    _handleMessage(data) {
        this.stats.messagesReceived++;
        
        try {
            const message = JSON.parse(data);
            
            switch (message.type) {
                case MessageType.HEALTH_REPORT:
                    this.stats.healthReportsReceived++;
                    this._notifyListeners('healthReport', message.report);
                    break;
                    
                case MessageType.BATCH_COMPLETE:
                    this._notifyListeners('batchComplete', {
                        batchId: message.batchId,
                        results: message.results,
                        timestamp: message.timestamp
                    });
                    break;
                    
                case MessageType.ANALYSIS_PROGRESS:
                    this._notifyListeners('progress', {
                        tileKey: message.tileKey,
                        progress: message.progress,
                        stage: message.stage
                    });
                    break;
                    
                case MessageType.SYSTEM_STATUS:
                    this._notifyListeners('status', message.status);
                    break;
                    
                case MessageType.PING:
                    // Calculate latency
                    if (message.timestamp) {
                        this.stats.lastPingLatency = Date.now() - message.timestamp;
                    }
                    break;
                    
                default:
                    // Check for pending request responses
                    this._checkPendingRequests(message);
            }
        } catch (e) {
            console.error('🌉 Failed to parse message:', e);
        }
    }

    /**
     * Handle disconnect
     */
    _handleDisconnect() {
        console.log('🌉 Disconnected from Tectonic Canary');
        this._cleanup();
        
        this._notifyListeners('disconnect', {});
        
        // Attempt reconnection
        if (this.reconnectAttempts < this.config.maxReconnectAttempts) {
            this.state = BridgeState.RECONNECTING;
            this.reconnectAttempts++;
            this.stats.reconnections++;
            
            console.log(`🌉 Reconnecting (${this.reconnectAttempts}/${this.config.maxReconnectAttempts})...`);
            this._notifyListeners('status', { state: this.state, attempt: this.reconnectAttempts });
            
            this.reconnectTimer = setTimeout(() => {
                this.connect().catch(() => {
                    // Reconnection failed, will retry
                });
            }, this.config.reconnectInterval);
        } else {
            this.state = BridgeState.ERROR;
            this._notifyListeners('status', { state: this.state, error: 'Max reconnection attempts reached' });
        }
    }

    /**
     * Send message to WebSocket
     */
    _sendMessage(message) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(message));
            this.stats.messagesSent++;
        } else {
            throw new Error('WebSocket not connected');
        }
    }

    /**
     * Request-response pattern
     */
    _requestResponse(request) {
        return new Promise((resolve, reject) => {
            if (this.state !== BridgeState.CONNECTED) {
                reject(new Error('Not connected'));
                return;
            }
            
            const requestId = this._generateRequestId();
            request.requestId = requestId;
            
            // Set timeout
            const timer = setTimeout(() => {
                this.pendingRequests.delete(requestId);
                reject(new Error('Request timeout'));
            }, this.config.requestTimeout);
            
            this.pendingRequests.set(requestId, { resolve, reject, timer });
            this._sendMessage(request);
        });
    }

    /**
     * Check if message is a response to pending request
     */
    _checkPendingRequests(message) {
        if (message.requestId && this.pendingRequests.has(message.requestId)) {
            const { resolve, timer } = this.pendingRequests.get(message.requestId);
            clearTimeout(timer);
            this.pendingRequests.delete(message.requestId);
            resolve(message);
        }
    }

    /**
     * Resubscribe to tiles after reconnection
     */
    _resubscribeTiles() {
        if (this.subscribedTiles.size === 0) return;
        
        this._sendMessage({
            type: MessageType.SUBSCRIBE_TILES,
            tileKeys: Array.from(this.subscribedTiles),
            timestamp: Date.now()
        });
    }

    /**
     * Start ping interval
     */
    _startPingInterval() {
        this.pingTimer = setInterval(() => {
            if (this.state === BridgeState.CONNECTED) {
                this._sendMessage({
                    type: MessageType.PING,
                    timestamp: Date.now()
                });
            }
        }, this.config.pingInterval);
    }

    /**
     * Cleanup resources
     */
    _cleanup() {
        if (this.pingTimer) {
            clearInterval(this.pingTimer);
            this.pingTimer = null;
        }
        
        if (this.reconnectTimer) {
            clearTimeout(this.reconnectTimer);
            this.reconnectTimer = null;
        }
        
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        
        // Clear pending requests
        for (const [id, { reject, timer }] of this.pendingRequests) {
            clearTimeout(timer);
            reject(new Error('Connection closed'));
        }
        this.pendingRequests.clear();
    }

    /**
     * Notify event listeners
     */
    _notifyListeners(event, data) {
        if (this.listeners[event]) {
            for (const listener of this.listeners[event]) {
                try {
                    listener(data);
                } catch (e) {
                    console.error(`🌉 Listener error for ${event}:`, e);
                }
            }
        }
    }

    /**
     * Generate unique request ID
     */
    _generateRequestId() {
        return `req_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { 
        CanaryWebSocketBridge, 
        BridgeState, 
        MessageType 
    };
}
