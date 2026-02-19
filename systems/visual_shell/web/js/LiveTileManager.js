/**
 * LiveTileManager - Manages live tile instances via WebSocket bridge.
 * Communicates with the boot system to start/stop VMs.
 */

/**
 * LiveTile - Represents a single live tile instance with its state.
 */
class LiveTile {
    constructor(tileId, rtsPath) {
        this.tileId = tileId;
        this.rtsPath = rtsPath;
        this.state = 'stopped'; // 'stopped', 'booting', 'running', 'error'
        this.framebuffer = null;
        this.framebufferWidth = 0;
        this.framebufferHeight = 0;
        this.metrics = {
            cpuUsage: 0,
            memoryUsage: 0,
            uptime: 0,
            cycles: 0
        };
        this.consoleOutput = [];
        this.bootedAt = null;
        this.lastUpdate = null;
    }

    /**
     * Set the tile state
     * @param {string} state - New state value
     */
    setState(state) {
        this.state = state;
        this.lastUpdate = Date.now();

        if (state === 'running' && !this.bootedAt) {
            this.bootedAt = Date.now();
        }
    }

    /**
     * Update the framebuffer data
     * @param {ArrayBuffer|string} data - Framebuffer pixel data
     * @param {number} width - Frame width
     * @param {number} height - Frame height
     */
    updateFramebuffer(data, width, height) {
        this.framebuffer = data;
        this.framebufferWidth = width;
        this.framebufferHeight = height;
        this.lastUpdate = Date.now();
    }

    /**
     * Update tile metrics
     * @param {Object} metrics - Metrics object with cpuUsage, memoryUsage, etc.
     */
    updateMetrics(metrics) {
        this.metrics = { ...this.metrics, ...metrics };
        this.lastUpdate = Date.now();
    }

    /**
     * Append console output
     * @param {string} text - Console text to append
     */
    appendConsole(text) {
        this.consoleOutput.push({
            text,
            timestamp: Date.now()
        });

        // Keep last 1000 lines
        if (this.consoleOutput.length > 1000) {
            this.consoleOutput.shift();
        }
    }

    /**
     * Get uptime in seconds
     * @returns {number} Uptime in seconds
     */
    getUptime() {
        if (!this.bootedAt) return 0;
        return Math.floor((Date.now() - this.bootedAt) / 1000);
    }
}

/**
 * LiveTileManager - Manages live tile instances via WebSocket bridge.
 */
class LiveTileManager {
    constructor(wsUrl = 'ws://localhost:8768') {
        this.wsUrl = wsUrl;
        this.ws = null;
        this.tiles = new Map();
        this.connected = false;
        this.reconnectAttempts = 0;
        this.maxReconnectAttempts = 5;
        this.reconnectDelay = 1000;

        // Callbacks
        this.onTileBooted = null;
        this.onTileStopped = null;
        this.onFramebufferUpdate = null;
        this.onMetricsUpdate = null;
        this.onConnectionChange = null;
        this.onError = null;
    }

    /**
     * Connect to the WebSocket server
     * @returns {Promise<boolean>} True if connected successfully
     */
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.wsUrl);

                this.ws.onopen = () => {
                    this.connected = true;
                    this.reconnectAttempts = 0;
                    console.log('🏙️ LiveTileManager connected');
                    if (this.onConnectionChange) {
                        this.onConnectionChange(true);
                    }
                    resolve(true);
                };

                this.ws.onmessage = (event) => {
                    this._handleMessage(event);
                };

                this.ws.onerror = (err) => {
                    console.warn('LiveTileManager WebSocket error:', err);
                    if (this.onError) {
                        this.onError(err);
                    }
                };

                this.ws.onclose = () => {
                    const wasConnected = this.connected;
                    this.connected = false;

                    if (wasConnected && this.onConnectionChange) {
                        this.onConnectionChange(false);
                    }

                    // Attempt reconnect if not intentionally closed
                    if (this.reconnectAttempts < this.maxReconnectAttempts) {
                        this._scheduleReconnect();
                    }
                };

                // Set a connection timeout
                setTimeout(() => {
                    if (!this.connected) {
                        reject(new Error('Connection timeout'));
                    }
                }, 5000);

            } catch (e) {
                reject(e);
            }
        });
    }

    /**
     * Schedule a reconnection attempt
     * @private
     */
    _scheduleReconnect() {
        this.reconnectAttempts++;
        const delay = this.reconnectDelay * Math.pow(2, this.reconnectAttempts - 1);

        console.log(`LiveTileManager reconnecting in ${delay}ms (attempt ${this.reconnectAttempts}/${this.maxReconnectAttempts})`);

        setTimeout(() => {
            this.connect().catch(err => {
                console.warn('Reconnection failed:', err.message);
            });
        }, delay);
    }

    /**
     * Boot a new tile
     * @param {string} tileId - Unique tile identifier
     * @param {string} rtsPath - Path to the RTS image file
     */
    bootTile(tileId, rtsPath) {
        const tile = new LiveTile(tileId, rtsPath);
        tile.setState('booting');
        this.tiles.set(tileId, tile);

        this._send({
            method: 'boot_tile',
            params: {
                tile_id: tileId,
                rts_path: rtsPath
            }
        });
    }

    /**
     * Stop a running tile
     * @param {string} tileId - Tile identifier to stop
     */
    stopTile(tileId) {
        this._send({
            method: 'stop_tile',
            params: { tile_id: tileId }
        });

        const tile = this.tiles.get(tileId);
        if (tile) {
            tile.setState('stopped');
        }
    }

    /**
     * Get a tile by ID
     * @param {string} tileId - Tile identifier
     * @returns {LiveTile|undefined} The tile instance or undefined
     */
    getTile(tileId) {
        return this.tiles.get(tileId);
    }

    /**
     * Get all tiles
     * @returns {Map} Map of tileId to LiveTile
     */
    getAllTiles() {
        return this.tiles;
    }

    /**
     * Get tiles by state
     * @param {string} state - State to filter by
     * @returns {LiveTile[]} Array of tiles matching the state
     */
    getTilesByState(state) {
        return Array.from(this.tiles.values()).filter(tile => tile.state === state);
    }

    /**
     * Handle incoming WebSocket message
     * @param {MessageEvent} event - WebSocket message event
     * @private
     */
    _handleMessage(event) {
        try {
            const data = JSON.parse(event.data);

            // Handle different message formats
            if (data.type === 'tile_event' && data.params) {
                this._handleEvent(data.params.event_type, data.params);
            } else if (data.method === 'tile_event') {
                this._handleEvent(data.params?.event_type, data.params);
            }
        } catch (e) {
            console.warn('LiveTileManager parse error:', e);
        }
    }

    /**
     * Handle tile events
     * @param {string} eventType - Type of event
     * @param {Object} params - Event parameters
     * @private
     */
    _handleEvent(eventType, params) {
        if (!params) return;

        const tileId = params.tile_id;

        switch (eventType) {
            case 'tile_booted':
                this._handleTileBooted(tileId, params);
                break;

            case 'tile_stopped':
                this._handleTileStopped(tileId, params);
                break;

            case 'tile_framebuffer':
                this._handleFramebuffer(tileId, params);
                break;

            case 'tile_metrics':
                this._handleMetrics(tileId, params);
                break;

            case 'tile_console':
                this._handleConsole(tileId, params);
                break;

            case 'tile_error':
                this._handleError(tileId, params);
                break;
        }
    }

    /**
     * Handle tile booted event
     * @private
     */
    _handleTileBooted(tileId, params) {
        const tile = this.tiles.get(tileId) || new LiveTile(tileId, params.rts_path);
        tile.setState('running');
        this.tiles.set(tileId, tile);
        if (this.onTileBooted) this.onTileBooted(tile);
    }

    /**
     * Handle tile stopped event
     * @private
     */
    _handleTileStopped(tileId, params) {
        const stoppedTile = this.tiles.get(tileId);
        if (stoppedTile) {
            stoppedTile.setState('stopped');
            if (this.onTileStopped) this.onTileStopped(stoppedTile);
        }
    }

    /**
     * Handle framebuffer update event
     * @private
     */
    _handleFramebuffer(tileId, params) {
        const fbTile = this.tiles.get(tileId);
        if (fbTile) {
            fbTile.updateFramebuffer(params.data, params.width, params.height);
            if (this.onFramebufferUpdate) this.onFramebufferUpdate(fbTile);
        }
    }

    /**
     * Handle metrics update event
     * @private
     */
    _handleMetrics(tileId, params) {
        const metricsTile = this.tiles.get(tileId);
        if (metricsTile) {
            metricsTile.updateMetrics(params.metrics);
            if (this.onMetricsUpdate) this.onMetricsUpdate(metricsTile);
        }
    }

    /**
     * Handle console output event
     * @private
     */
    _handleConsole(tileId, params) {
        const consoleTile = this.tiles.get(tileId);
        if (consoleTile) {
            consoleTile.appendConsole(params.text);
        }
    }

    /**
     * Handle tile error event
     * @private
     */
    _handleError(tileId, params) {
        const errorTile = this.tiles.get(tileId);
        if (errorTile) {
            errorTile.setState('error');
            errorTile.appendConsole(`[ERROR] ${params.message || 'Unknown error'}`);
        }
        if (this.onError) {
            this.onError({ tileId, message: params.message });
        }
    }

    /**
     * Send a message through the WebSocket
     * @param {Object} message - Message object to send
     * @private
     */
    _send(message) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(message));
        } else {
            console.warn('LiveTileManager: Cannot send, WebSocket not connected');
        }
    }

    /**
     * Disconnect from the WebSocket server
     */
    disconnect() {
        this.reconnectAttempts = this.maxReconnectAttempts; // Prevent reconnection
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }

    /**
     * Remove a tile from management
     * @param {string} tileId - Tile to remove
     */
    removeTile(tileId) {
        this.tiles.delete(tileId);
    }

    /**
     * Clear all tiles
     */
    clearTiles() {
        this.tiles.clear();
    }
}

// Export for browser environment
if (typeof window !== 'undefined') {
    window.LiveTileManager = LiveTileManager;
    window.LiveTile = LiveTile;
}

// Export for CommonJS (Node.js) environment
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LiveTileManager, LiveTile };
}

// Export for ES modules
if (typeof exports !== 'undefined') {
    exports.LiveTileManager = LiveTileManager;
    exports.LiveTile = LiveTile;
}
