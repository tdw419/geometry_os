/**
 * LiveTileManager - Manages live tile instances via WebSocket bridge.
 * Communicates with the boot system to start/stop VMs.
 */

/**
 * LiveTile - Represents a single live tile instance with its state.
 */
class LiveTile {
    constructor(id, rtsPath) {
        this.id = id;
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
        this.widgets = [];
        this.asciiView = '';
        this.consoleOutput = [];
        this.bootedAt = null;
        this.lastUpdate = Date.now();
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
        this.onExtractionResult = null;
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
     * @param {string} id - Unique tile identifier
     * @param {string} rtsPath - Path to the RTS image file
     */
    bootTile(id, rtsPath) {
        const tile = new LiveTile(id, rtsPath);
        tile.setState('booting');
        this.tiles.set(id, tile);

        this._send({
            method: 'boot_tile',
            params: {
                tile_id: id,
                rts_path: rtsPath
            }
        });
    }

    /**
     * Stop a running tile
     * @param {string} id - Tile identifier to stop
     */
    stopTile(id) {
        this._send({
            method: 'stop_tile',
            params: { tile_id: id }
        });

        const tile = this.tiles.get(id);
        if (tile) {
            tile.setState('stopped');
        }
    }

    /**
     * Send a command to a running tile
     * @param {string} id - Tile identifier
     * @param {string} command - Command text (e.g. "ls -la" or "click 100 200")
     */
    sendCommand(id, command) {
        this._send({
            method: 'send_console_input',
            params: {
                tile_id: id,
                input: command
            }
        });
    }

    /**
     * Get a tile by ID
     * @param {string} id - Tile identifier
     * @returns {LiveTile|undefined} The tile instance or undefined
     */
    getTile(id) {
        return this.tiles.get(id);
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
            } else if ((data.type === 'broadcast_event' || data.method === 'broadcast_event') && data.params) {
                // Support standard broadcast_event format
                this._handleEvent(data.params.type, data.params.data);
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

        const id = params.tile_id;

        switch (eventType) {
            case 'tile_booted':
                this._handleTileBooted(id, params);
                break;

            case 'tile_stopped':
                this._handleTileStopped(id, params);
                break;

            case 'tile_framebuffer':
                this._handleFramebuffer(id, params);
                break;

            case 'tile_metrics':
                this._handleMetrics(id, params);
                break;

            case 'tile_console':
                this._handleConsole(id, params);
                break;

            case 'tile_extraction_result':
                this._handleExtractionResult(id, params);
                break;

            case 'tile_error':
                this._handleError(id, params);
                break;
        }
    }

    /**
     * Handle tile booted event
     * @private
     */
    _handleTileBooted(id, params) {
        const tile = this.tiles.get(id) || new LiveTile(id, params.rts_path);
        tile.setState('running');
        this.tiles.set(id, tile);
        if (this.onTileBooted) this.onTileBooted(tile);
    }

    /**
     * Handle tile stopped event
     * @private
     */
    _handleTileStopped(id, params) {
        const stoppedTile = this.tiles.get(id);
        if (stoppedTile) {
            stoppedTile.setState('stopped');
            if (this.onTileStopped) this.onTileStopped(stoppedTile);
        }
    }

    /**
     * Handle framebuffer update event
     * @private
     */
    _handleFramebuffer(id, params) {
        const fbTile = this.tiles.get(id);
        if (fbTile) {
            fbTile.updateFramebuffer(params.data, params.width, params.height);
            if (this.onFramebufferUpdate) this.onFramebufferUpdate(fbTile);
        }
    }

    /**
     * Handle metrics update event
     * @private
     */
    _handleMetrics(id, params) {
        const metricsTile = this.tiles.get(id);
        if (metricsTile) {
            metricsTile.updateMetrics(params.metrics);
            if (this.onMetricsUpdate) this.onMetricsUpdate(metricsTile);
        }
    }

    /**
     * Handle console output event
     * @private
     */
    _handleConsole(id, params) {
        const consoleTile = this.tiles.get(id);
        if (consoleTile) {
            consoleTile.appendConsole(params.text);
        }
    }

    /**
     * Handle tile extraction result event
     * @private
     */
    _handleExtractionResult(id, params) {
        const tile = this.tiles.get(id);
        if (tile) {
            tile.widgets = params.widgets || [];
            tile.asciiView = params.ascii_view || '';
            if (this.onExtractionResult) {
                this.onExtractionResult(tile);
            }
        }
    }

    /**
     * Handle tile error event
     * @private
     */
    _handleError(id, params) {
        const errorTile = this.tiles.get(id);
        if (errorTile) {
            errorTile.setState('error');
            errorTile.appendConsole(`[ERROR] ${params.message || 'Unknown error'}`);
        }
        if (this.onError) {
            this.onError({ id, message: params.message });
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
     * @param {string} id - Tile to remove
     */
    removeTile(id) {
        this.tiles.delete(id);
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
