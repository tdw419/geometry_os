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

/**
 * Utility: Delay for specified milliseconds
 */
function delay(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * ScannerAgent - Scans regions and delegates processing
 */
class ScannerAgent extends BaseAgent {
  constructor() {
    super('scanner-001', 'scanner');
    this.regionsScanned = 0;
    this.tasksDelegated = 0;
    this.currentRegion = null;
  }

  getCapabilities() {
    return ['scan_region', 'detect_patterns', 'delegate_processing'];
  }

  handleMessage(message) {
    if (message.message_type === 'task_assignment') {
      this.handleTaskAssignment(message.content);
    }
  }

  async handleTaskAssignment(task) {
    if (task.type === 'scan_region') {
      await this.scanRegion(task.region_x, task.region_y);
    }
  }

  /**
   * Scan a region with distributed lock
   * @param {number} x - Region X coordinate
   * @param {number} y - Region Y coordinate
   */
  async scanRegion(x, y) {
    const lockId = `region-${x}-${y}`;
    this.currentRegion = { x, y };

    // Update UI: acquiring lock
    if (typeof updateAgentStatus === 'function') {
      updateAgentStatus(this.agentId, `Acquiring lock for region ${x},${y}`);
    }

    // 1. Acquire lock for region
    const lockResult = await this.acquireLock(lockId, 30);
    if (!lockResult || !lockResult.granted) {
      if (typeof log === 'function') {
        log(`error`, `Failed to acquire lock for ${lockId}`);
      }
      return;
    }

    try {
      // Update UI: lock acquired, scanning
      if (typeof updateAgentStatus === 'function') {
        updateAgentStatus(this.agentId, `Scanning region ${x},${y}`);
      }
      if (typeof updateRegion === 'function') {
        updateRegion(x, y, 'scanning');
      }

      // 2. Simulate work (500-1500ms)
      const workTime = 500 + Math.random() * 1000;
      await delay(workTime);

      // 3. Generate scanned data
      const scanData = {
        region_x: x,
        region_y: y,
        timestamp: Date.now(),
        features: this._generateScanFeatures(x, y),
        patterns_detected: Math.floor(Math.random() * 5),
        confidence: 0.7 + Math.random() * 0.3,
        scan_duration_ms: workTime
      };

      // 4. Update UI metrics
      this.regionsScanned++;
      if (typeof updateAgentMetric === 'function') {
        updateAgentMetric(this.agentId, 'regionsScanned', this.regionsScanned);
      }
      if (typeof updateRegion === 'function') {
        updateRegion(x, y, 'scanned');
      }

      if (typeof log === 'function') {
        log(`info`, `Scanned region ${x},${y}: ${scanData.patterns_detected} patterns`);
      }

      // 5. Delegate to processor
      await this.delegateProcessing(scanData);

    } finally {
      // 6. Release lock
      await this.releaseLock(lockId);
      this.currentRegion = null;

      if (typeof updateAgentStatus === 'function') {
        updateAgentStatus(this.agentId, 'Idle');
      }
    }
  }

  /**
   * Delegate processing to processor agent
   * @param {object} scanData - Scanned region data
   */
  async delegateProcessing(scanData) {
    this.tasksDelegated++;

    if (typeof updateAgentMetric === 'function') {
      updateAgentMetric(this.agentId, 'tasksDelegated', this.tasksDelegated);
    }

    // Send process_request message to processor-001
    await this.sendDirectMessage(
      'processor-001',
      'process_request',
      {
        type: 'scan_results',
        data: scanData,
        source_agent: this.agentId
      }
    );

    if (typeof log === 'function') {
      log(`info`, `Delegated processing for region ${scanData.region_x},${scanData.region_y}`);
    }
  }

  /**
   * Generate synthetic scan features for simulation
   * @private
   */
  _generateScanFeatures(x, y) {
    const features = [];
    const featureCount = 5 + Math.floor(Math.random() * 10);

    for (let i = 0; i < featureCount; i++) {
      features.push({
        type: ['edge', 'corner', 'texture', 'gradient'][Math.floor(Math.random() * 4)],
        x: x * 100 + Math.random() * 100,
        y: y * 100 + Math.random() * 100,
        intensity: Math.random()
      });
    }

    return features;
  }

  /**
   * Get current scanner status
   */
  getScannerStatus() {
    return {
      ...this.getStatus(),
      regionsScanned: this.regionsScanned,
      tasksDelegated: this.tasksDelegated,
      currentRegion: this.currentRegion
    };
  }
}

/**
 * ProcessorAgent - Processes data and analyzes patterns
 */
class ProcessorAgent extends BaseAgent {
  constructor() {
    super('processor-001', 'processor');
    this.regionsProcessed = 0;
    this.tasksReceived = 0;
    this.tasksCompleted = 0;
    this.pendingTasks = [];
    this.isProcessing = false;
  }

  getCapabilities() {
    return ['process_data', 'analyze_patterns', 'store_results'];
  }

  handleMessage(message) {
    if (message.message_type === 'process_request') {
      this.handleProcessRequest(message.from_agent, message.content);
    }
  }

  /**
   * Handle process request from another agent
   */
  async handleProcessRequest(fromAgent, content) {
    this.tasksReceived++;

    // Queue the task
    const task = {
      id: `task_${Date.now()}_${this.tasksReceived}`,
      fromAgent: fromAgent,
      content: content,
      queuedAt: Date.now()
    };
    this.pendingTasks.push(task);

    if (typeof log === 'function') {
      log(`info`, `Process request queued from ${fromAgent}: ${task.id}`);
    }

    // Update UI status
    if (typeof updateAgentStatus === 'function') {
      updateAgentStatus(this.agentId, 'queued');
    }

    // Update metrics
    if (typeof updateAgentMetric === 'function') {
      updateAgentMetric(this.agentId, 'pendingTasks', this.pendingTasks.length);
    }

    // Start processing if not already processing
    if (!this.isProcessing) {
      this.processNextTask();
    }
  }

  /**
   * Process next task in queue
   */
  async processNextTask() {
    if (this.pendingTasks.length === 0) {
      this.isProcessing = false;
      if (typeof updateAgentStatus === 'function') {
        updateAgentStatus(this.agentId, 'idle');
      }
      return;
    }

    this.isProcessing = true;
    const task = this.pendingTasks.shift();

    // Update UI status and metrics
    if (typeof updateAgentStatus === 'function') {
      updateAgentStatus(this.agentId, 'processing');
    }
    if (typeof updateAgentMetric === 'function') {
      updateAgentMetric(this.agentId, 'pendingTasks', this.pendingTasks.length);
    }

    if (typeof log === 'function') {
      log(`info`, `Processing task: ${task.id}`);
    }

    // Simulate processing work (800-2000ms)
    const processTime = 800 + Math.random() * 1200;
    await delay(processTime);

    // Generate analysis results
    const result = this.analyzeData(task.content);

    // Send result back to the requesting agent
    await this.sendDirectMessage(task.fromAgent, 'process_complete', {
      taskId: task.id,
      result: result,
      timestamp: Date.now()
    });

    // Update metrics
    this.tasksCompleted++;
    this.regionsProcessed++;
    if (typeof updateAgentMetric === 'function') {
      updateAgentMetric(this.agentId, 'tasksCompleted', this.tasksCompleted);
      updateAgentMetric(this.agentId, 'regionsProcessed', this.regionsProcessed);
    }

    // Update UI region if applicable
    if (task.content.data && task.content.data.region_x !== undefined) {
      const x = task.content.data.region_x;
      const y = task.content.data.region_y;
      if (typeof updateRegion === 'function') {
        updateRegion(x, y, 'processed');
      }
    }

    if (typeof log === 'function') {
      log(`info`, `Task completed: ${task.id}`);
    }

    // Continue processing if more tasks
    if (this.pendingTasks.length > 0) {
      await this.processNextTask();
    } else {
      this.isProcessing = false;
      if (typeof updateAgentStatus === 'function') {
        updateAgentStatus(this.agentId, 'idle');
      }
    }
  }

  /**
   * Analyze data and generate results
   */
  analyzeData(content) {
    // Mock data analysis
    const analysisTypes = ['spatial', 'temporal', 'statistical', 'heuristic'];
    const selectedAnalysis = analysisTypes[Math.floor(Math.random() * analysisTypes.length)];

    return {
      analysisType: selectedAnalysis,
      patterns: this._generatePatterns(),
      metrics: {
        complexity: Math.random().toFixed(2),
        density: Math.random().toFixed(2),
        entropy: Math.random().toFixed(2)
      },
      confidence: (0.7 + Math.random() * 0.3).toFixed(2),
      recommendations: this._generateRecommendations()
    };
  }

  /**
   * Generate pattern analysis (mock)
   * @private
   */
  _generatePatterns() {
    const patterns = [];
    const patternCount = Math.floor(Math.random() * 5) + 1;

    for (let i = 0; i < patternCount; i++) {
      patterns.push({
        type: ['linear', 'radial', 'fractal', 'noise'][Math.floor(Math.random() * 4)],
        strength: (Math.random()).toFixed(2),
        significance: Math.random() > 0.5 ? 'high' : 'low'
      });
    }

    return patterns;
  }

  /**
   * Generate recommendations based on analysis (mock)
   * @private
   */
  _generateRecommendations() {
    const recommendations = [];
    const recCount = Math.floor(Math.random() * 3);

    for (let i = 0; i < recCount; i++) {
      recommendations.push({
        action: ['optimize', 'compress', 'cache', 'prefetch'][Math.floor(Math.random() * 4)],
        priority: Math.random() > 0.5 ? 'high' : 'medium',
        estimatedImpact: (Math.random() * 100).toFixed(0) + '%'
      });
    }

    return recommendations;
  }

  /**
   * Get current processor status
   */
  getProcessorStatus() {
    return {
      ...this.getStatus(),
      regionsProcessed: this.regionsProcessed,
      tasksReceived: this.tasksReceived,
      tasksCompleted: this.tasksCompleted,
      pendingTasks: this.pendingTasks.length,
      isProcessing: this.isProcessing
    };
  }
}

/**
 * CoordinatorAgent - Manages task distribution and progress tracking
 * Coordinates ScannerAgent and ProcessorAgent across grid regions
 */
class CoordinatorAgent extends BaseAgent {
  constructor(gridWidth = 5, gridHeight = 5) {
    super('coordinator-001', 'coordinator');
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
    this.tasksAssigned = 0;
    this.barriersReached = 0;
    this.currentPhase = 1;
    this.pendingRegions = [];
    this.completedRegions = [];
    this.allRegions = [];

    // Initialize all regions
    for (let y = 0; y < gridHeight; y++) {
      for (let x = 0; x < gridWidth; x++) {
        this.allRegions.push({ x, y, status: 'pending' });
        this.pendingRegions.push({ x, y });
      }
    }

    // Register message handlers for task responses
    this.registerHandler('scan_complete', (msg) => {
      this.handleScanComplete(msg);
    });

    this.registerHandler('process_complete', (msg) => {
      this.handleProcessComplete(msg);
    });
  }

  getCapabilities() {
    return ['assign_tasks', 'monitor_progress', 'coordinate_phases'];
  }

  /**
   * Handle scan completion message from scanner
   */
  handleScanComplete(message) {
    const { x, y, data } = message.content || message;
    console.log(`[coordinator] Scan complete for region (${x}, ${y})`);

    // Move from pending to completed
    const pendingIndex = this.pendingRegions.findIndex(r => r.x === x && r.y === y);
    if (pendingIndex !== -1) {
      this.pendingRegions.splice(pendingIndex, 1);
      this.completedRegions.push({ x, y, phase: 1, data });
    }

    // Update UI if available
    this.updateProgressUI();
  }

  /**
   * Handle process completion message from processor
   */
  handleProcessComplete(message) {
    const { x, y, result } = message.content || message;
    console.log(`[coordinator] Process complete for region (${x}, ${y})`);

    // Update region status
    const region = this.allRegions.find(r => r.x === x && r.y === y);
    if (region) {
      region.status = 'processed';
      region.result = result;
    }

    // Update UI if available
    this.updateProgressUI();
  }

  /**
   * Start Phase 1: Assign all scan regions to scanner agent
   */
  async startPhase1() {
    console.log(`[coordinator] Starting Phase 1: Scanning ${this.allRegions.length} regions`);

    // Assign all regions to scanner
    for (const region of this.pendingRegions) {
      await this.assignScanTask(region.x, region.y);
      this.tasksAssigned++;
    }

    console.log(`[coordinator] Phase 1: ${this.tasksAssigned} scan tasks assigned`);
  }

  /**
   * Assign a scan task to the scanner agent
   * @param {number} x - Grid X coordinate
   * @param {number} y - Grid Y coordinate
   */
  async assignScanTask(x, y) {
    const task = {
      type: 'task_assignment',
      region: { x, y },
      action: 'scan',
      timestamp: Date.now()
    };

    try {
      await this.sendDirectMessage('scanner-001', 'scan_task', task);
      console.log(`[coordinator] Assigned scan task for region (${x}, ${y})`);
    } catch (error) {
      console.error(`[coordinator] Failed to assign scan task (${x}, ${y}):`, error);
    }
  }

  /**
   * Wait for all regions to complete
   * @param {number} expectedCount - Expected number of completions
   * @param {number} timeoutMs - Timeout in milliseconds
   */
  async waitForAllComplete(expectedCount, timeoutMs = 30000) {
    const startTime = Date.now();
    console.log(`[coordinator] Waiting for ${expectedCount} completions (timeout: ${timeoutMs}ms)`);

    return new Promise((resolve, reject) => {
      const checkInterval = setInterval(() => {
        const completed = this.completedRegions.length;
        const elapsed = Date.now() - startTime;

        if (completed >= expectedCount) {
          clearInterval(checkInterval);
          console.log(`[coordinator] All ${expectedCount} regions completed in ${elapsed}ms`);
          resolve({
            completed,
            elapsed,
            regions: this.completedRegions
          });
        } else if (elapsed >= timeoutMs) {
          clearInterval(checkInterval);
          reject(new Error(`Timeout: Only ${completed}/${expectedCount} regions completed`));
        }
      }, 100);
    });
  }

  /**
   * Get current progress statistics
   */
  getProgress() {
    const total = this.allRegions.length;
    const completed = this.completedRegions.length;
    const pending = this.pendingRegions.length;
    const percent = total > 0 ? Math.round((completed / total) * 100) : 0;

    return {
      total,
      completed,
      pending,
      percent,
      phase: this.currentPhase,
      tasksAssigned: this.tasksAssigned,
      barriersReached: this.barriersReached
    };
  }

  /**
   * Update UI with current progress
   * Hook for UI integration
   */
  updateProgressUI() {
    const progress = this.getProgress();

    // Emit custom event for UI to listen to
    if (typeof window !== 'undefined' && window.dispatchEvent) {
      window.dispatchEvent(new CustomEvent('coordinator-progress', {
        detail: progress
      }));
    }

    // Log progress periodically
    if (progress.completed % 5 === 0 || progress.completed === progress.total) {
      console.log(`[coordinator] Progress: ${progress.percent}% (${progress.completed}/${progress.total})`);
    }
  }

  /**
   * Start Phase 2: Assign processing tasks
   */
  async startPhase2() {
    console.log(`[coordinator] Starting Phase 2: Processing ${this.completedRegions.length} regions`);
    this.currentPhase = 2;

    for (const region of this.completedRegions) {
      await this.assignProcessTask(region.x, region.y, region.data);
      this.tasksAssigned++;
    }

    console.log(`[coordinator] Phase 2: ${this.completedRegions.length} process tasks assigned`);
  }

  /**
   * Assign a processing task to the processor agent
   */
  async assignProcessTask(x, y, scanData) {
    const task = {
      type: 'task_assignment',
      region: { x, y },
      action: 'process',
      scanData: scanData,
      timestamp: Date.now()
    };

    try {
      await this.sendDirectMessage('processor-001', 'process_task', task);
      console.log(`[coordinator] Assigned process task for region (${x}, ${y})`);
    } catch (error) {
      console.error(`[coordinator] Failed to assign process task (${x}, ${y}):`, error);
    }
  }

  /**
   * Synchronize at a barrier with all agents
   */
  async synchronizeAtBarrier(barrierId, expectedCount) {
    console.log(`[coordinator] Entering barrier '${barrierId}' (expecting ${expectedCount} agents)`);
    this.barriersReached++;

    try {
      await this.barrierEnter(barrierId, expectedCount);
      console.log(`[coordinator] Barrier '${barrierId}' synchronized`);
    } catch (error) {
      console.error(`[coordinator] Barrier synchronization failed:`, error);
      throw error;
    }
  }

  /**
   * Reset coordinator state for new run
   */
  reset() {
    this.tasksAssigned = 0;
    this.barriersReached = 0;
    this.currentPhase = 1;
    this.pendingRegions = [];
    this.completedRegions = [];
    this.allRegions = [];

    // Re-initialize regions
    for (let y = 0; y < this.gridHeight; y++) {
      for (let x = 0; x < this.gridWidth; x++) {
        this.allRegions.push({ x, y, status: 'pending' });
        this.pendingRegions.push({ x, y });
      }
    }

    console.log(`[coordinator] Reset complete. Grid: ${this.gridWidth}x${this.gridHeight}`);
  }

  /**
   * Get detailed status report
   */
  getStatusReport() {
    return {
      ...this.getProgress(),
      agentId: this.agentId,
      agentType: this.agentType,
      connected: this.connected,
      regions: {
        all: this.allRegions,
        pending: this.pendingRegions,
        completed: this.completedRegions
      },
      locks: Array.from(this.locks.keys()),
      barriers: Array.from(this.barriers.keys())
    };
  }
}

// Export for Node.js or browser
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { BaseAgent, ScannerAgent, ProcessorAgent, CoordinatorAgent, delay };
}
