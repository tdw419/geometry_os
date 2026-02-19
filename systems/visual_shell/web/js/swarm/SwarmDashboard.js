/**
 * SwarmDashboard - Main controller for the Swarm Visual Dashboard.
 * Orchestrates Canvas, HealthPanel, EventLog, and SwarmClient.
 */

class SwarmDashboard {
    constructor(options = {}) {
        this.config = {
            wsUrl: 'ws://localhost:8766',
            containerId: 'dashboard-container',
            ...options
        };

        this.canvas = null;
        this.healthPanel = null;
        this.eventLog = null;
        this.client = null;
    }

    async initialize() {
        console.log('🚀 Initializing Swarm Dashboard...');
        
        const container = document.getElementById(this.config.containerId);
        if (!container) {
            throw new Error(`Container #${this.config.containerId} not found`);
        }

        // 1. Initialize Canvas
        const canvasContainer = container.querySelector('.canvas-area');
        this.canvas = new SwarmCanvas(canvasContainer);
        await this.canvas.initialize();

        // 2. Initialize Panels
        const sidebar = container.querySelector('.sidebar');
        this.healthPanel = new HealthPanel(sidebar);
        this.eventLog = new EventLog(sidebar);

        // 3. Initialize Client
        this.client = new SwarmClient(this.config.wsUrl);
        this.client.onMessage = (msg) => this._handleMessage(msg);
        this.client.onConnect = () => {
            this.eventLog.addEvent('Connected to swarm cluster', 'info');
        };
        this.client.onDisconnect = () => {
            this.eventLog.addEvent('Disconnected from swarm cluster', 'warn');
        };

        this.client.connect();
        
        console.log('✅ Dashboard ready');
    }

    _handleMessage(msg) {
        switch (msg.type) {
            case 'cluster_state':
                this._syncFullState(msg.data);
                break;
            case 'node_update':
                this._handleNodeUpdate(msg.data);
                break;
            case 'agent_update':
                this._handleAgentUpdate(msg.data);
                break;
            case 'task_event':
                this._handleTaskEvent(msg.data);
                break;
            case 'tectonic_update':
                this._handleTectonicUpdate(msg.data);
                break;
            case 'security_alert':
                this.eventLog.addEvent(`SECURITY: ${msg.message}`, 'error');
                this.healthPanel.showAlert(msg.message, 'error');
                break;
        }
    }

    _syncFullState(data) {
        this.eventLog.addEvent('Synchronizing cluster state...', 'info');
        
        // Sync nodes
        if (data.nodes) {
            data.nodes.forEach(node => this.canvas.addNode(node.id, node));
        }
        
        // Sync agents
        if (data.agents) {
            data.agents.forEach(agent => this.canvas.addAgent(agent.id, agent));
        }
        
        this._updateMetrics();
    }

    _handleNodeUpdate(node) {
        if (!this.canvas.getNodeRegion(node.id)) {
            this.canvas.addNode(node.id, node);
            this.eventLog.addEvent(`New node joined: ${node.id}`, 'info');
        } else {
            // Update node logic if needed
        }
        this._updateMetrics();
    }

    _handleAgentUpdate(agent) {
        if (!this.canvas.getAgentParticle(agent.id)) {
            this.canvas.addAgent(agent.id, agent);
            this.eventLog.addEvent(`Agent registered: ${agent.id} on ${agent.nodeId}`, 'info');
        } else {
            this.canvas.updateAgent(agent.id, agent);
        }
        this._updateMetrics();
    }

    _handleTaskEvent(event) {
        if (event.status === 'created') {
            this.canvas.addTask(event.taskId, event);
            this.eventLog.addEvent(`Task created: ${event.taskId} (${event.type})`, 'info');
        } else if (event.status === 'completed') {
            this.canvas.completeTask(event.taskId);
            this.eventLog.addEvent(`Task completed: ${event.taskId}`, 'info');
        } else if (event.status === 'failed') {
            this.canvas.completeTask(event.taskId); // Fade it out
            this.eventLog.addEvent(`Task failed: ${event.taskId} - ${event.error}`, 'error');
        }
        this._updateMetrics();
    }

    _handleTectonicUpdate(data) {
        if (data.event === 'optimization_complete') {
            this.eventLog.addEvent(`TECTONIC: Optimization complete. Improvement: ${(data.improvement * 100).toFixed(1)}%`, 'info');
            this.lastLocalityScore = data.score_after;
        } else if (data.event === 'migration_start') {
            this.eventLog.addEvent(`TECTONIC: Migrating ${data.file_count} files...`, 'info');
        }
        this._updateMetrics();
    }

    _updateMetrics() {
        this.healthPanel.updateMetrics({
            nodes: this.canvas.nodeRegions.size,
            agents: this.canvas.agentParticles.size,
            tasks: this.canvas.taskArrows.size,
            locality: this.lastLocalityScore || 0
        });
    }
}

if (typeof window !== 'undefined') window.SwarmDashboard = SwarmDashboard;
