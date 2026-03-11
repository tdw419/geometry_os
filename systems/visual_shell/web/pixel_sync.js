/**
 * Pixel Synchronization Module
 * 
 * Provides real-time synchronization between agents and the infinite map.
 * Uses WebSocket to broadcast pixel updates to all connected clients.
 * 
 * This module enables:
 * - Real-time pixel updates from agents
 * - Tile creation and modification
 * - Pattern generation synchronization
 * - Multi-client collaboration
 * - Automatic reconnection on connection loss
 */

class PixelSync {
    constructor(config = {}) {
        this.config = {
            wsUrl: config.wsUrl || 'ws://127.0.0.1:8765',
            reconnectInterval: 5000,
            maxReconnectAttempts: 10,
            enableLogging: config.enableLogging !== false,
            ...config
        };

        this.ws = null;
        this.reconnectAttempts = 0;
        this.connected = false;
        this.messageQueue = [];
        this.eventHandlers = new Map();
        this.pendingRequests = new Map();

        if (this.config.enableLogging) {
            console.log('🔄 PixelSync initialized');
            console.log(`  WebSocket URL: ${this.config.wsUrl}`);
        }

        this.connect();
    }

    /**
     * Connect to WebSocket server
     */
    connect() {
        if (this.config.enableLogging) {
            console.log(`🔌 Connecting to ${this.config.wsUrl}...`);
        }

        try {
            this.ws = new WebSocket(this.config.wsUrl);

            this.ws.onopen = () => this._onOpen();
            this.ws.onmessage = (event) => this._onMessage(event);
            this.ws.onclose = () => this._onClose();
            this.ws.onerror = (error) => this._onError(error);
        } catch (error) {
            this._onError(error);
        }
    }

    /**
     * Handle WebSocket connection opened
     */
    _onOpen() {
        if (this.config.enableLogging) {
            console.log('✅ WebSocket connected');
        }

        this.connected = true;
        this.reconnectAttempts = 0;

        // Send queued messages
        while (this.messageQueue.length > 0) {
            const message = this.messageQueue.shift();
            this.send(message);
        }

        this.emit('connected', { timestamp: Date.now() });
    }

    /**
     * Handle incoming WebSocket message
     */
    _onMessage(event) {
        try {
            const data = JSON.parse(event.data);
            this.handleMessage(data);
        } catch (e) {
            if (this.config.enableLogging) {
                console.error('Failed to parse message:', e);
            }
        }
    }

    /**
     * Handle WebSocket connection closed
     */
    _onClose() {
        if (this.config.enableLogging) {
            console.log('❌ WebSocket disconnected');
        }

        this.connected = false;
        this.ws = null;

        this.emit('disconnected', { timestamp: Date.now() });

        // Attempt to reconnect
        if (this.reconnectAttempts < this.config.maxReconnectAttempts) {
            this.reconnectAttempts++;
            if (this.config.enableLogging) {
                console.log(`🔄 Reconnecting... (attempt ${this.reconnectAttempts}/${this.config.maxReconnectAttempts})`);
            }
            setTimeout(() => this.connect(), this.config.reconnectInterval);
        } else {
            if (this.config.enableLogging) {
                console.error('❌ Max reconnection attempts reached');
            }
            this.emit('reconnectFailed', { attempts: this.reconnectAttempts });
        }
    }

    /**
     * Handle WebSocket error
     */
    _onError(error) {
        if (this.config.enableLogging) {
            console.error('WebSocket error:', error);
        }
        this.emit('error', error);
    }

    /**
     * Handle incoming message
     */
    handleMessage(data) {
        if (this.config.enableLogging) {
            console.log('📨 Received message:', data.type);
        }

        switch (data.type) {
            case 'pixel_update':
                this.emit('pixelUpdate', data);
                break;
            case 'tile_created':
                this.emit('tileCreated', data);
                break;
            case 'tile_removed':
                this.emit('tileRemoved', data);
                break;
            case 'tile_updated':
                this.emit('tileUpdated', data);
                break;
            case 'pattern_generated':
                this.emit('patternGenerated', data);
                break;
            case 'agent_operation':
                this.emit('agentOperation', data);
                break;
            case 'map_state':
                this.emit('mapState', data);
                break;
            case 'error':
                this.emit('serverError', data);
                break;
            default:
                if (this.config.enableLogging) {
                    console.log('Unknown message type:', data.type);
                }
        }
    }

    /**
     * Send message to server
     */
    send(message) {
        if (this.connected && this.ws) {
            try {
                this.ws.send(JSON.stringify(message));
            } catch (error) {
                if (this.config.enableLogging) {
                    console.error('Failed to send message:', error);
                }
            }
        } else {
            // Queue message for when connection is restored
            this.messageQueue.push(message);
            if (this.config.enableLogging) {
                console.log('📬 Message queued (not connected)');
            }
        }
    }

    /**
     * Request pixel update from server
     */
    requestPixelUpdate(x, y, width = 512, height = 512) {
        const requestId = this._generateRequestId();

        this.send({
            type: 'request_pixel_update',
            requestId,
            x, y, width, height
        });

        return new Promise((resolve, reject) => {
            const timeout = setTimeout(() => {
                this.pendingRequests.delete(requestId);
                reject(new Error('Request timeout'));
            }, 10000);

            this.pendingRequests.set(requestId, {
                resolve,
                reject,
                timeout
            });
        });
    }

    /**
     * Broadcast pixel update to all clients
     */
    broadcastPixelUpdate(x, y, imageData, width = 512, height = 512) {
        this.send({
            type: 'pixel_update',
            x, y,
            width, height,
            imageData: imageData
        });
    }

    /**
     * Request tile creation
     */
    requestTileCreation(x, y, tileName, description = '', color = '#0066cc') {
        this.send({
            type: 'create_tile',
            x, y, tileName, description, color
        });
    }

    /**
     * Request tile removal
     */
    requestTileRemoval(x, y) {
        this.send({
            type: 'remove_tile',
            x, y
        });
    }

    /**
     * Request pattern generation
     */
    requestPatternGeneration(x, y, patternType, params = {}) {
        this.send({
            type: 'generate_pattern',
            x, y, patternType, params
        });
    }

    /**
     * Request pixel transformation
     */
    requestPixelTransformation(x, y, width, height, operation, params = {}) {
        this.send({
            type: 'transform_pixels',
            x, y, width, height, operation, params
        });
    }

    /**
     * Request pixel movement
     */
    requestPixelMovement(sourceX, sourceY, destX, destY, width = 1, height = 1) {
        this.send({
            type: 'move_pixels',
            sourceX, sourceY, destX, destY, width, height
        });
    }

    /**
     * Request agent operation
     */
    requestAgentOperation(agentId, toolName, parameters = {}) {
        this.send({
            type: 'agent_operation',
            agentId,
            toolName,
            parameters
        });
    }

    /**
     * Request map state
     */
    requestMapState() {
        this.send({
            type: 'get_map_state'
        });
    }

    /**
     * Register event handler
     */
    on(event, handler) {
        if (!this.eventHandlers.has(event)) {
            this.eventHandlers.set(event, []);
        }
        this.eventHandlers.get(event).push(handler);
    }

    /**
     * Unregister event handler
     */
    off(event, handler) {
        if (this.eventHandlers.has(event)) {
            const handlers = this.eventHandlers.get(event);
            const index = handlers.indexOf(handler);
            if (index !== -1) {
                handlers.splice(index, 1);
            }
        }
    }

    /**
     * Emit event to all handlers
     */
    emit(event, data) {
        if (this.eventHandlers.has(event)) {
            this.eventHandlers.get(event).forEach(handler => {
                try {
                    handler(data);
                } catch (error) {
                    console.error(`Error in event handler for '${event}':`, error);
                }
            });
        }
    }

    /**
     * Generate unique request ID
     */
    _generateRequestId() {
        return `req_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    }

    /**
     * Disconnect from server
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
        }
        this.connected = false;
    }

    /**
     * Get connection status
     */
    isConnected() {
        return this.connected;
    }

    /**
     * Get queued message count
     */
    getQueueSize() {
        return this.messageQueue.length;
    }
}


/**
 * Integration with InfiniteMap class
 * 
 * This class extends PixelSync to work seamlessly with the InfiniteMap component.
 */
class InfiniteMapPixelSync extends PixelSync {
    constructor(infiniteMap, config = {}) {
        super(config);
        this.infiniteMap = infiniteMap;

        // Register event handlers
        this._setupEventHandlers();

        if (this.config.enableLogging) {
            console.log('🗺️ InfiniteMapPixelSync initialized');
        }
    }

    /**
     * Setup event handlers for integration with InfiniteMap
     */
    _setupEventHandlers() {
        // Handle pixel updates
        this.on('pixelUpdate', (data) => {
            this._handlePixelUpdate(data);
        });

        // Handle tile creation
        this.on('tileCreated', (data) => {
            this._handleTileCreated(data);
        });

        // Handle tile removal
        this.on('tileRemoved', (data) => {
            this._handleTileRemoved(data);
        });

        // Handle tile updates
        this.on('tileUpdated', (data) => {
            this._handleTileUpdated(data);
        });

        // Handle pattern generation
        this.on('patternGenerated', (data) => {
            this._handlePatternGenerated(data);
        });
    }

    /**
     * Handle pixel update from server
     */
    _handlePixelUpdate(data) {
        const { x, y, width, height, imageData } = data;

        // Update tile in InfiniteMap
        if (this.infiniteMap && this.infiniteMap.tiles) {
            const key = `${x},${y}`;

            if (this.infiniteMap.tiles.has(key)) {
                const tile = this.infiniteMap.tiles.get(key);

                // Update sprite texture
                if (tile.sprite && tile.sprite.texture) {
                    // Load new texture from image data
                    const image = new Image();
                    image.onload = () => {
                        const texture = new PIXI.Texture.from(image);
                        tile.sprite.texture = texture;
                    };
                    image.src = `data:image/png;base64,${imageData}`;
                }
            }
        }
    }

    /**
     * Handle tile creation from server
     */
    _handleTileCreated(data) {
        const { x, y, tileName, description } = data;

        if (this.config.enableLogging) {
            console.log(`🆕 Tile created: ${tileName} at (${x}, ${y})`);
        }

        // Reload manifest to get new tile
        if (this.infiniteMap && this.infiniteMap.checkUpdates) {
            this.infiniteMap.checkUpdates();
        }
    }

    /**
     * Handle tile removal from server
     */
    _handleTileRemoved(data) {
        const { x, y } = data;

        if (this.config.enableLogging) {
            console.log(`🗑️ Tile removed at (${x}, ${y})`);
        }

        // Remove tile from InfiniteMap
        if (this.infiniteMap && this.infiniteMap.tiles) {
            const key = `${x},${y}`;

            if (this.infiniteMap.tiles.has(key)) {
                const tile = this.infiniteMap.tiles.get(key);

                // Remove sprite from world
                if (tile.sprite) {
                    this.infiniteMap.world.removeChild(tile.sprite);
                }

                // Remove from tiles map
                this.infiniteMap.tiles.delete(key);
            }
        }
    }

    /**
     * Handle tile update from server
     */
    _handleTileUpdated(data) {
        const { x, y, timestamp } = data;

        if (this.config.enableLogging) {
            console.log(`🔄 Tile updated at (${x}, ${y})`);
        }

        // Reload tile
        if (this.infiniteMap && this.infiniteMap.checkUpdates) {
            this.infiniteMap.checkUpdates();
        }
    }

    /**
     * Handle pattern generation from server
     */
    _handlePatternGenerated(data) {
        const { x, y, patternType, params } = data;

        if (this.config.enableLogging) {
            console.log(`✨ Pattern generated: ${patternType} at (${x}, ${y})`);
        }

        // Reload manifest to get new pattern tile
        if (this.infiniteMap && this.infiniteMap.checkUpdates) {
            this.infiniteMap.checkUpdates();
        }
    }

    /**
     * Request pixel update for specific tile
     */
    requestTileUpdate(x, y) {
        return this.requestPixelUpdate(x, y, 512, 512);
    }

    /**
     * Broadcast tile modification to all clients
     */
    broadcastTileModification(x, y, imageData) {
        this.broadcastPixelUpdate(x, y, imageData, 512, 512);
    }
}


// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PixelSync, InfiniteMapPixelSync };
}

// Make available globally for browser use
if (typeof window !== 'undefined') {
    window.PixelSync = PixelSync;
    window.InfiniteMapPixelSync = InfiniteMapPixelSync;
}
