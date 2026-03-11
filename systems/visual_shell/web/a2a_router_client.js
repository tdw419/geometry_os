/**
 * A2A Router Client - Agent-to-Agent Communication for WebMCP
 * 
 * WebSocket client for the Geometry OS A2A protocol.
 * Enables spawned area agents to discover peers, send messages, and coordinate.
 * 
 * @module a2a_router_client
 * @see docs/plans/2026-02-13-webmcp-phase-d-design.md
 */

// A2A Priority levels
const A2A_PRIORITY = {
    CRITICAL: 10,
    HIGH: 8,
    NORMAL: 5,
    LOW: 1
};

// Default configuration
const DEFAULT_CONFIG = {
    wsUrl: 'ws://localhost:8766',
    reconnectBaseDelay: 1000,    // 1 second initial delay
    reconnectMaxDelay: 30000,    // 30 seconds max delay
    reconnectMultiplier: 2,      // Exponential backoff factor
    heartbeatInterval: 5000,     // 5 seconds
    messageTimeout: 10000        // 10 seconds for pending requests
};

/**
 * Generate a UUID v4
 * @returns {string} UUID string
 */
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
        const r = Math.random() * 16 | 0;
        const v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

/**
 * A2AMessageRouter - WebSocket client for agent-to-agent communication
 * 
 * Usage:
 *   const router = new A2AMessageRouter('area-agent-abc123');
 *   await router.connect();
 *   const peers = await router.discover({ agent_type: 'monitor' });
 *   router.subscribe('region-updates');
 *   router.onMessage((msg) => console.log('Received:', msg));
 *   await router.send({ to_agent: 'area-agent-def456', message_type: 'task_request', content: {...} });
 */
class A2AMessageRouter {
    #ws = null;
    #agentId;
    #config;
    #connected = false;
    #reconnectAttempts = 0;
    #reconnectTimer = null;
    #messageHandlers = new Set();
    #pendingRequests = new Map();
    #subscriptions = new Set();
    #heartbeatTimer = null;

    /**
     * Create a new A2A Message Router
     * @param {string} agentId - Unique identifier for this agent
     * @param {Object} config - Optional configuration overrides
     */
    constructor(agentId, config = {}) {
        this.#agentId = agentId;
        this.#config = { ...DEFAULT_CONFIG, ...config };
    }

    /**
     * Connect to the A2A router backend
     * @returns {Promise<void>}
     */
    connect() {
        return new Promise((resolve, reject) => {
            if (this.#connected) {
                resolve();
                return;
            }

            try {
                this.#ws = new WebSocket(this.#config.wsUrl);

                this.#ws.onopen = () => {
                    this.#connected = true;
                    this.#reconnectAttempts = 0;
                    this.#startHeartbeat();
                    
                    // Re-subscribe to topics after reconnect
                    this.#resubscribeAll();
                    
                    resolve();
                };

                this.#ws.onmessage = (event) => {
                    this.#handleMessage(event.data);
                };

                this.#ws.onerror = (error) => {
                    console.error('[A2A] WebSocket error:', error);
                };

                this.#ws.onclose = () => {
                    this.#connected = false;
                    this.#stopHeartbeat();
                    this.#scheduleReconnect();
                };

            } catch (error) {
                reject(error);
            }
        });
    }

    /**
     * Disconnect from the A2A router
     */
    disconnect() {
        this.#stopHeartbeat();
        this.#clearReconnectTimer();
        
        if (this.#ws) {
            this.#ws.close();
            this.#ws = null;
        }
        
        this.#connected = false;
        this.#pendingRequests.clear();
    }

    /**
     * Send an A2A message
     * @param {Object} message - Message object
     * @param {string} message.to_agent - Target agent ID, 'broadcast', or 'topic:name'
     * @param {string} message.message_type - Message type
     * @param {Object} message.content - Message payload
     * @param {number} [message.priority=5] - Message priority (1-10)
     * @returns {Promise<Object>} Response from router or target
     */
    send(message) {
        return new Promise((resolve, reject) => {
            if (!this.#connected) {
                reject(new Error('Not connected to A2A router'));
                return;
            }

            const fullMessage = this.#createMessage(message);
            const correlationId = fullMessage.metadata.correlation_id;

            // Track pending request for response matching
            const timeout = setTimeout(() => {
                this.#pendingRequests.delete(correlationId);
                reject(new Error('Message timeout'));
            }, this.#config.messageTimeout);

            this.#pendingRequests.set(correlationId, { resolve, reject, timeout });

            try {
                this.#ws.send(JSON.stringify(fullMessage));
            } catch (error) {
                clearTimeout(timeout);
                this.#pendingRequests.delete(correlationId);
                reject(error);
            }
        });
    }

    /**
     * Discover agents matching filters
     * @param {Object} filters - Discovery filters
     * @param {string} [filters.agent_type] - Filter by agent type
     * @param {Object} [filters.region_overlaps] - Filter by region overlap
     * @param {string} [filters.capability] - Filter by capability
     * @returns {Promise<Array>} List of matching agents
     */
    discover(filters = {}) {
        return this.send({
            to_agent: 'registry',
            message_type: 'registry_query',
            content: {
                query: 'list_agents',
                filters
            },
            priority: A2A_PRIORITY.NORMAL
        }).then(response => response.agents || []);
    }

    /**
     * Subscribe to a topic for event-based messages
     * @param {string} topic - Topic name (e.g., 'region-updates', 'alerts')
     * @returns {Promise<void>}
     */
    subscribe(topic) {
        this.#subscriptions.add(topic);
        
        if (!this.#connected) {
            return Promise.resolve();
        }

        return this.send({
            to_agent: 'registry',
            message_type: 'subscription',
            content: {
                operation: 'subscribe',
                topic
            },
            priority: A2A_PRIORITY.NORMAL
        }).then(() => {});
    }

    /**
     * Register a handler for incoming messages
     * @param {Function} handler - Message handler function(msg)
     * @returns {Function} Unsubscribe function
     */
    onMessage(handler) {
        this.#messageHandlers.add(handler);
        return () => this.#messageHandlers.delete(handler);
    }

    // --- Private methods ---

    /**
     * Create a full A2A message with required fields
     */
    #createMessage(partial) {
        const now = Date.now() / 1000;
        return {
            $schema: 'https://geometry.os/a2a/message/v1',
            message_id: generateUUID(),
            timestamp: now,
            from_agent: this.#agentId,
            to_agent: partial.to_agent || 'broadcast',
            message_type: partial.message_type || 'notification',
            priority: partial.priority ?? A2A_PRIORITY.NORMAL,
            content: partial.content || {},
            metadata: {
                correlation_id: partial.correlation_id || generateUUID(),
                ...partial.metadata
            },
            expires_at: partial.expires_in ? now + partial.expires_in : null
        };
    }

    /**
     * Handle incoming WebSocket message
     */
    #handleMessage(data) {
        let message;
        try {
            message = JSON.parse(data);
        } catch (e) {
            console.error('[A2A] Failed to parse message:', e);
            return;
        }

        // Check if this is a response to a pending request
        const correlationId = message.metadata?.correlation_id;
        if (correlationId && this.#pendingRequests.has(correlationId)) {
            const pending = this.#pendingRequests.get(correlationId);
            clearTimeout(pending.timeout);
            this.#pendingRequests.delete(correlationId);
            pending.resolve(message);
            return;
        }

        // Dispatch to message handlers
        for (const handler of this.#messageHandlers) {
            try {
                handler(message);
            } catch (e) {
                console.error('[A2A] Handler error:', e);
            }
        }
    }

    /**
     * Schedule reconnection with exponential backoff
     */
    #scheduleReconnect() {
        this.#clearReconnectTimer();
        
        const delay = Math.min(
            this.#config.reconnectBaseDelay * Math.pow(this.#config.reconnectMultiplier, this.#reconnectAttempts),
            this.#config.reconnectMaxDelay
        );

        console.log(`[A2A] Reconnecting in ${delay}ms (attempt ${this.#reconnectAttempts + 1})`);

        this.#reconnectTimer = setTimeout(() => {
            this.#reconnectAttempts++;
            this.connect().catch(() => {
                // Reconnect failed, will retry again
            });
        }, delay);
    }

    #clearReconnectTimer() {
        if (this.#reconnectTimer) {
            clearTimeout(this.#reconnectTimer);
            this.#reconnectTimer = null;
        }
    }

    /**
     * Start heartbeat to keep connection alive
     */
    #startHeartbeat() {
        this.#stopHeartbeat();
        this.#heartbeatTimer = setInterval(() => {
            if (this.#connected) {
                this.send({
                    to_agent: 'registry',
                    message_type: 'heartbeat',
                    content: {},
                    priority: A2A_PRIORITY.LOW
                }).catch(() => {});
            }
        }, this.#config.heartbeatInterval);
    }

    #stopHeartbeat() {
        if (this.#heartbeatTimer) {
            clearInterval(this.#heartbeatTimer);
            this.#heartbeatTimer = null;
        }
    }

    /**
     * Re-subscribe to all topics after reconnect
     */
    #resubscribeAll() {
        for (const topic of this.#subscriptions) {
            this.send({
                to_agent: 'registry',
                message_type: 'subscription',
                content: {
                    operation: 'subscribe',
                    topic
                },
                priority: A2A_PRIORITY.NORMAL
            }).catch(() => {});
        }
    }

    // --- Getters ---

    get connected() { return this.#connected; }
    get agentId() { return this.#agentId; }
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { A2AMessageRouter, A2A_PRIORITY, generateUUID };
}
