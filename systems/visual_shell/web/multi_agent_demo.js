/**
 * Multi-Agent Collaboration Demo
 * BaseAgent class with A2A coordination primitives
 */

class BaseAgent {
  constructor(agentId, agentType, routerUrl = 'ws://localhost:8766/a2a') {
    this.agentId = agentId;
    this.agentType = agentType;
    this.routerUrl = routerUrl;
    this.ws = null;
    this.connected = false;
    this.messageHandlers = new Map();
    this.pendingRequests = new Map();
    this.requestIdCounter = 0;

    // Coordination state
    this.locks = new Map(); // lockId -> lockData
    this.barriers = new Map(); // barrierId -> { arrived: Set, expected: number, resolve: Function }

    // Default message handlers
    this.registerDefaultHandlers();
  }

  /**
   * Connect to A2A router and register agent
   */
  async connect() {
    return new Promise((resolve, reject) => {
      this.ws = new WebSocket(this.routerUrl);

      this.ws.onopen = async () => {
        try {
          // Register agent with router
          await this.send({
            type: 'register',
            agentId: this.agentId,
            agentType: this.agentType,
            capabilities: this.getCapabilities(),
            timestamp: Date.now()
          });

          this.connected = true;
          console.log(`[${this.agentId}] Connected to A2A router`);
          resolve();
        } catch (error) {
          reject(error);
        }
      };

      this.ws.onmessage = (event) => {
        try {
          const message = JSON.parse(event.data);
          this.handleIncomingMessage(message);
        } catch (error) {
          console.error(`[${this.agentId}] Message parse error:`, error);
        }
      };

      this.ws.onerror = (error) => {
        console.error(`[${this.agentId}] WebSocket error:`, error);
        reject(error);
      };

      this.ws.onclose = () => {
        console.log(`[${this.agentId}] Disconnected from A2A router`);
        this.connected = false;
      };
    });
  }

  /**
   * Disconnect from router and unregister agent
   */
  async disconnect() {
    if (this.ws && this.connected) {
      try {
        // Release all held locks
        for (const lockId of this.locks.keys()) {
          await this.releaseLock(lockId);
        }

        // Unregister from router
        await this.send({
          type: 'unregister',
          agentId: this.agentId,
          timestamp: Date.now()
        });

        this.ws.close();
        this.connected = false;
      } catch (error) {
        console.error(`[${this.agentId}] Disconnect error:`, error);
      }
    }
  }

  /**
   * Send JSON message to router
   */
  async send(message) {
    if (!this.ws || !this.connected) {
      throw new Error(`[${this.agentId}] Not connected to router`);
    }

    return new Promise((resolve, reject) => {
      try {
        this.ws.send(JSON.stringify(message));
        resolve();
      } catch (error) {
        reject(error);
      }
    });
  }

  /**
   * Handle incoming message from router
   */
  handleIncomingMessage(message) {
    // Check if this is a response to a pending request
    if (message.requestId && this.pendingRequests.has(message.requestId)) {
      const { resolve, reject } = this.pendingRequests.get(message.requestId);
      this.pendingRequests.delete(message.requestId);

      if (message.error) {
        reject(new Error(message.error));
      } else {
        resolve(message);
      }
      return;
    }

    // Check for lock/barrier responses
    if (message.type === 'lock_response') {
      this.handleLockResponse(message);
      return;
    }

    if (message.type === 'barrier_response') {
      this.handleBarrierResponse(message);
      return;
    }

    // Route to registered handler or subclass implementation
    const handler = this.messageHandlers.get(message.type);
    if (handler) {
      handler(message);
    } else {
      this.handleMessage(message);
    }
  }

  /**
   * Override in subclasses for custom message handling
   */
  handleMessage(message) {
    console.log(`[${this.agentId}] Unhandled message:`, message.type);
  }

  /**
   * Override in subclasses to declare agent capabilities
   */
  getCapabilities() {
    return {
      messages: [],
      coordination: ['lock', 'barrier', 'direct_messaging']
    };
  }

  /**
   * Register a message handler
   */
  registerHandler(messageType, handler) {
    this.messageHandlers.set(messageType, {
      callback: handler,
      override: false
    });
  }

  /**
   * Register default coordination handlers
   */
  registerDefaultHandlers() {
    this.messageHandlers.set('lock_granted', {
      callback: (msg) => {
        console.log(`[${this.agentId}] Lock granted: ${msg.lockId}`);
        this.locks.set(msg.lockId, { acquiredAt: Date.now() });
      },
      override: false
    });

    this.messageHandlers.set('lock_released', {
      callback: (msg) => {
        console.log(`[${this.andientId}] Lock released: ${msg.lockId}`);
        this.locks.delete(msg.lockId);
      },
      override: false
    });

    this.messageHandlers.set('direct_message', {
      callback: (msg) => {
        console.log(`[${this.agentId}] Direct message from ${msg.fromAgentId}:`, msg.content);
        this.handleDirectMessage(msg);
      },
      override: false
    });
  }

  /**
   * Handle direct messages from other agents
   */
  handleDirectMessage(message) {
    // Override in subclasses
  }

  /**
   * Handle lock response from router
   */
  handleLockResponse(message) {
    const pending = this.pendingRequests.get(message.requestId);
    if (pending) {
      this.pendingRequests.delete(message.requestId);
      if (message.error) {
        pending.reject(new Error(message.error));
      } else {
        pending.resolve(message);
      }
    }
  }

  /**
   * Handle barrier response from router
   */
  handleBarrierResponse(message) {
    const barrier = this.barriers.get(message.barrierId);
    if (barrier) {
      if (message.completed) {
        // Barrier synchronized - resolve waiting promise
        if (barrier.resolve) {
          barrier.resolve();
        }
        this.barriers.delete(message.barrierId);
      }
    }
  }

  // ============ Coordination Primitives ============

  /**
   * Acquire distributed lock
   * @param {string} lockId - Unique lock identifier
   * @param {number} timeoutSeconds - Lock timeout in seconds
   * @returns {Promise<boolean>} True if lock acquired
   */
  async acquireLock(lockId, timeoutSeconds = 30) {
    const requestId = `lock_${lockId}_${this.requestIdCounter++}`;

    return new Promise((resolve, reject) => {
      this.pendingRequests.set(requestId, { resolve, reject });

      this.send({
        type: 'acquire_lock',
        agentId: this.agentId,
        lockId: lockId,
        timeout: timeoutSeconds,
        requestId: requestId,
        timestamp: Date.now()
      });

      // Set timeout for lock acquisition
      setTimeout(() => {
        if (this.pendingRequests.has(requestId)) {
          this.pendingRequests.delete(requestId);
          resolve({ granted: false, reason: 'timeout' });
        }
      }, timeoutSeconds * 1000);
    });
  }

  /**
   * Release distributed lock
   * @param {string} lockId - Lock identifier to release
   */
  async releaseLock(lockId) {
    return new Promise((resolve, reject) => {
      this.send({
        type: 'release_lock',
        agentId: this.agentId,
        lockId: lockId,
        timestamp: Date.now()
      }).then(() => {
        this.locks.delete(lockId);
        resolve();
      }).catch(reject);
    });
  }

  /**
   * Enter synchronization barrier
   * Blocks until expectedCount agents have entered the barrier
   * @param {string} barrierId - Unique barrier identifier
   * @param {number} expectedCount - Number of agents to wait for
   */
  async barrierEnter(barrierId, expectedCount) {
    return new Promise((resolve) => {
      // Initialize barrier state
      this.barriers.set(barrierId, {
        arrived: new Set([this.agentId]),
        expected: expectedCount,
        resolve: resolve
      });

      this.send({
        type: 'barrier_enter',
        agentId: this.agentId,
        barrierId: barrierId,
        expectedCount: expectedCount,
        timestamp: Date.now()
      });
    });
  }

  /**
   * Send direct message to another agent
   * @param {string} toAgent - Target agent ID
   * @param {string} messageType - Message type identifier
   * @param {any} content - Message payload
   */
  async sendDirectMessage(toAgent, messageType, content) {
    return this.send({
      type: 'direct_message',
      fromAgentId: this.agentId,
      toAgentId: toAgent,
      messageType: messageType,
      content: content,
      timestamp: Date.now()
    });
  }

  /**
   * Send message and wait for response
   * @param {object} message - Message to send
   * @param {number} timeoutMs - Timeout in milliseconds
   */
  async sendAndWait(message, timeoutMs = 5000) {
    const requestId = `wait_${this.requestIdCounter++}`;
    message.requestId = requestId;

    return new Promise((resolve, reject) => {
      this.pendingRequests.set(requestId, { resolve, reject });

      this.send(message);

      setTimeout(() => {
        if (this.pendingRequests.has(requestId)) {
          this.pendingRequests.delete(requestId);
          reject(new Error('Response timeout'));
        }
      }, timeoutMs);
    });
  }

  /**
   * Query all registered agents
   */
  async getRegisteredAgents() {
    return this.sendAndWait({
      type: 'query_agents',
      agentId: this.agentId,
      timestamp: Date.now()
    });
  }

  /**
   * Get agent status
   */
  getStatus() {
    return {
      agentId: this.agentId,
      agentType: this.agentType,
      connected: this.connected,
      locksHeld: Array.from(this.locks.keys()),
      barriersWaiting: Array.from(this.barriers.keys()),
      capabilities: this.getCapabilities()
    };
  }
}

// Export for Node.js or browser
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { BaseAgent };
}
