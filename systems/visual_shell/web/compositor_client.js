/**
 * Compositor Client - WebSocket Bridge to Rust Compositor
 * 
 * Connects the PixiJS visual shell to the Rust Wayland compositor via WebSocket,
 * enabling real-time camera synchronization and tile updates.
 */

class CompositorClient {
  constructor(url = 'ws://127.0.0.1:8765') {
    this.url = url;
    this.ws = null;
    this.connected = false;
    this.reconnectAttempts = 0;
    this.maxReconnectAttempts = 10;
    this.reconnectDelay = 1000; // Start with 1 second
    this.maxReconnectDelay = 30000; // Max 30 seconds

    // Event callbacks
    this.onCameraUpdateCallback = null;
    this.onTileUpdateCallback = null;
    this.onConnectionChangeCallback = null;
    this.onHeartbeatCallback = null;

    // Stats
    this.stats = {
      messagesReceived: 0,
      cameraUpdates: 0,
      tileUpdates: 0,
      heartbeats: 0,
      reconnects: 0
    };
  }

  /**
   * Connect to the WebSocket server
   */
  connect() {
    if (this.ws && (this.ws.readyState === WebSocket.CONNECTING || this.ws.readyState === WebSocket.OPEN)) {
      console.log('🔌 Already connected or connecting');
      return;
    }

    console.log(`🔌 Connecting to compositor at ${this.url}...`);

    try {
      this.ws = new WebSocket(this.url);

      this.ws.onopen = () => {
        console.log('✅ Connected to compositor');
        this.connected = true;
        this.reconnectAttempts = 0;
        this.reconnectDelay = 1000;

        if (this.onConnectionChangeCallback) {
          this.onConnectionChangeCallback(true);
        }
      };

      this.ws.onmessage = (event) => {
        this.handleMessage(event.data);
      };

      this.ws.onerror = (error) => {
        console.error('❌ WebSocket error:', error);
      };

      this.ws.onclose = () => {
        console.log('🔌 Disconnected from compositor');
        this.connected = false;

        if (this.onConnectionChangeCallback) {
          this.onConnectionChangeCallback(false);
        }

        // Attempt reconnection
        this.attemptReconnect();
      };

    } catch (error) {
      console.error('❌ Failed to create WebSocket:', error);
      this.attemptReconnect();
    }
  }

  /**
   * Disconnect from the WebSocket server
   */
  disconnect() {
    if (this.ws) {
      this.ws.close();
      this.ws = null;
    }
    this.connected = false;
  }

  /**
   * Attempt to reconnect with exponential backoff
   */
  attemptReconnect() {
    if (this.reconnectAttempts >= this.maxReconnectAttempts) {
      console.error(`❌ Max reconnection attempts (${this.maxReconnectAttempts}) reached`);
      return;
    }

    this.reconnectAttempts++;
    this.stats.reconnects++;

    console.log(`🔄 Reconnecting in ${this.reconnectDelay}ms (attempt ${this.reconnectAttempts}/${this.maxReconnectAttempts})...`);

    setTimeout(() => {
      this.connect();
    }, this.reconnectDelay);

    // Exponential backoff
    this.reconnectDelay = Math.min(this.reconnectDelay * 2, this.maxReconnectDelay);
  }

  /**
   * Handle incoming WebSocket messages
   */
  handleMessage(data) {
    this.stats.messagesReceived++;

    try {
      const message = JSON.parse(data);

      switch (message.type) {
        case 'camera_update':
          this.handleCameraUpdate(message);
          break;

        case 'tile_update':
          this.handleTileUpdate(message);
          break;

        case 'heartbeat':
          this.handleHeartbeat(message);
          break;

        default:
          console.warn('⚠️ Unknown message type:', message.type);
      }

    } catch (error) {
      console.error('❌ Failed to parse message:', error, data);
    }
  }

  /**
   * Handle camera update message
   */
  handleCameraUpdate(message) {
    this.stats.cameraUpdates++;

    if (this.onCameraUpdateCallback) {
      this.onCameraUpdateCallback({
        x: message.x,
        y: message.y,
        zoom: message.zoom,
        targetX: message.target_x,
        targetY: message.target_y,
        targetZoom: message.target_zoom,
        timestamp: message.timestamp
      });
    }
  }

  /**
   * Handle tile update message
   */
  handleTileUpdate(message) {
    this.stats.tileUpdates++;

    if (this.onTileUpdateCallback) {
      this.onTileUpdateCallback({
        x: message.x,
        y: message.y,
        brick: message.brick,
        timestamp: message.timestamp
      });
    }
  }

  /**
   * Handle heartbeat message
   */
  handleHeartbeat(message) {
    this.stats.heartbeats++;

    if (this.onHeartbeatCallback) {
      this.onHeartbeatCallback({
        timestamp: message.timestamp
      });
    }

    // Send heartbeat response
    this.sendHeartbeat();
  }

  /**
   * Send heartbeat response to server
   */
  sendHeartbeat() {
    if (this.connected && this.ws && this.ws.readyState === WebSocket.OPEN) {
      const message = {
        type: 'heartbeat',
        timestamp: Math.floor(Date.now() / 1000)
      };
      this.ws.send(JSON.stringify(message));
    }
  }

  /**
   * Register callback for camera updates
   */
  onCameraUpdate(callback) {
    this.onCameraUpdateCallback = callback;
  }

  /**
   * Register callback for tile updates
   */
  onTileUpdate(callback) {
    this.onTileUpdateCallback = callback;
  }

  /**
   * Register callback for connection state changes
   */
  onConnectionChange(callback) {
    this.onConnectionChangeCallback = callback;
  }

  /**
   * Register callback for heartbeats
   */
  onHeartbeat(callback) {
    this.onHeartbeatCallback = callback;
  }

  /**
   * Get connection statistics
   */
  getStats() {
    return {
      ...this.stats,
      connected: this.connected,
      reconnectAttempts: this.reconnectAttempts
    };
  }

  /**
   * Reset statistics
   */
  resetStats() {
    this.stats = {
      messagesReceived: 0,
      cameraUpdates: 0,
      tileUpdates: 0,
      heartbeats: 0,
      reconnects: 0
    };
  }
}

// Export for use in other modules
if (typeof window !== 'undefined') {
  window.CompositorClient = CompositorClient;
}

// Export for ES6 modules
if (typeof module !== 'undefined' && module.exports) {
  module.exports = CompositorClient;
}