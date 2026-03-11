/**
 * SwarmClient - Manages WebSocket communication with the swarm cluster.
 */

class SwarmClient {
    constructor(url, options = {}) {
        this.url = url;
        this.options = {
            reconnectInterval: 2000,
            maxReconnectAttempts: 10,
            ...options
        };

        this.ws = null;
        this.reconnectAttempts = 0;
        this.onMessage = null;
        this.onConnect = null;
        this.onDisconnect = null;
    }

    connect() {
        console.log(`🔌 Connecting to Swarm WebSocket: ${this.url}`);
        
        try {
            this.ws = new WebSocket(this.url);
            
            this.ws.onopen = () => this._handleOpen();
            this.ws.onmessage = (e) => this._handleMessage(e);
            this.ws.onclose = () => this._handleClose();
            this.ws.onerror = (e) => this._handleError(e);
            
        } catch (error) {
            console.error('❌ Failed to create WebSocket:', error);
            this._handleClose();
        }
    }

    _handleOpen() {
        console.log('✅ Connected to Swarm');
        this.reconnectAttempts = 0;
        if (this.onConnect) this.onConnect();
        
        // Request initial state
        this.send({ type: 'get_state' });
    }

    _handleMessage(event) {
        try {
            const msg = JSON.parse(event.data);
            if (this.onMessage) this.onMessage(msg);
        } catch (error) {
            console.warn('⚠️ Failed to parse swarm message:', error);
        }
    }

    _handleClose() {
        console.log('🔌 Disconnected from Swarm');
        if (this.onDisconnect) this.onDisconnect();
        
        if (this.reconnectAttempts < this.options.maxReconnectAttempts) {
            this.reconnectAttempts++;
            const delay = this.options.reconnectInterval * Math.min(this.reconnectAttempts, 5);
            console.log(`🔄 Reconnecting in ${delay}ms... (${this.reconnectAttempts})`);
            setTimeout(() => this.connect(), delay);
        }
    }

    _handleError(error) {
        console.error('❌ WebSocket error:', error);
    }

    send(data) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(data));
            return true;
        }
        return false;
    }

    close() {
        if (this.ws) {
            this.ws.onclose = null; // Prevent auto-reconnect
            this.ws.close();
            this.ws = null;
        }
    }
}

if (typeof window !== 'undefined') window.SwarmClient = SwarmClient;
