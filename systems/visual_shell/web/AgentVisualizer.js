/**
 * Geometry OS: AgentVisualizer
 *
 * Real-time visualization of Swarm agents connected to the Neural Event Bus.
 * Renders live agent states, tasks, and collaboration patterns.
 *
 * Architecture:
 * [Swarm Guilds] → [Neural Event Bus] → [AgentVisualizer] → [PIXI Stage]
 *                           ↓
 *                    [Agent State Updates]
 *                    [Task Assignments]
 *                    [Belief Updates]
 */

export class AgentVisualizer {
    constructor(options = {}) {
        this.width = options.width || 800;
        this.height = options.height || 600;
        this.wsUrl = options.wsUrl || 'ws://localhost:8770/ws/agents';
        this.nebUrl = options.nebUrl || 'ws://localhost:8765';

        // Agent state
        this.agents = new Map();
        this.tasks = new Map();
        this.connections = [];

        // Visual settings
        this.agentRadius = 40;
        this.connectionAlpha = 0.3;
        this.pulseSpeed = 0.02;

        // Callbacks
        this.onAgentUpdate = options.onAgentUpdate || null;
        this.onTaskUpdate = options.onTaskUpdate || null;
        this.onConnectionEvent = options.onConnectionEvent || null;

        // PIXI setup
        this.container = new PIXI.Container();
        this.connectionLayer = new PIXI.Container();
        this.agentLayer = new PIXI.Container();
        this.taskLayer = new PIXI.Container();
        this.effectLayer = new PIXI.Container();

        this.container.addChild(this.connectionLayer);
        this.container.addChild(this.taskLayer);
        this.container.addChild(this.agentLayer);
        this.container.addChild(this.effectLayer);

        // Time tracking
        this.time = 0;

        // WebSocket connections
        this.ws = null;
        this.nebWs = null;
        this.connected = false;

        // Agent type configurations
        this.agentTypes = {
            architect: {
                color: 0x00FFFF,
                shape: 'hexagon',
                label: 'Architect',
                description: 'System design & planning'
            },
            engineer: {
                color: 0x00FF88,
                shape: 'square',
                label: 'Engineer',
                description: 'Implementation & coding'
            },
            reviewer: {
                color: 0xFFAA00,
                shape: 'diamond',
                label: 'Reviewer',
                description: 'Quality & verification'
            },
            executor: {
                color: 0xFF44FF,
                shape: 'circle',
                label: 'Executor',
                description: 'Task execution'
            },
            scribe: {
                color: 0x8888FF,
                shape: 'triangle',
                label: 'Scribe',
                description: 'Documentation'
            }
        };

        // Layout positions
        this.layoutPositions = this._calculateLayout();

        // Initialize with placeholder agents
        this._initPlaceholderAgents();
    }

    _calculateLayout() {
        const positions = {};
        const centerX = this.width / 2;
        const centerY = this.height / 2;
        const radius = Math.min(this.width, this.height) * 0.35;

        const types = Object.keys(this.agentTypes);
        types.forEach((type, i) => {
            const angle = (i / types.length) * Math.PI * 2 - Math.PI / 2;
            positions[type] = {
                x: centerX + Math.cos(angle) * radius,
                y: centerY + Math.sin(angle) * radius
            };
        });

        return positions;
    }

    _initPlaceholderAgents() {
        Object.entries(this.agentTypes).forEach(([type, config]) => {
            const pos = this.layoutPositions[type];
            this._createAgent({
                id: `${type}-001`,
                type: type,
                status: 'idle',
                position: pos,
                config: config
            });
        });
    }

    _createAgent(agentData) {
        const config = this.agentTypes[agentData.type] || this.agentTypes.engineer;
        const pos = agentData.position || this.layoutPositions[agentData.type] || { x: this.width / 2, y: this.height / 2 };

        // Agent container
        const container = new PIXI.Container();
        container.x = pos.x;
        container.y = pos.y;
        container.sortableChildren = true;

        // Glow effect (for active agents)
        const glow = new PIXI.Graphics();
        container.addChild(glow);

        // Agent body
        const body = new PIXI.Graphics();
        this._drawAgentShape(body, config.shape, this.agentRadius, config.color, agentData.status);
        container.addChild(body);

        // Status indicator
        const statusIndicator = new PIXI.Graphics();
        this._drawStatusIndicator(statusIndicator, agentData.status);
        statusIndicator.x = this.agentRadius * 0.7;
        statusIndicator.y = -this.agentRadius * 0.7;
        container.addChild(statusIndicator);

        // Agent label
        const label = new PIXI.Text(config.label, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xFFFFFF,
            align: 'center'
        });
        label.anchor.set(0.5, 0);
        label.y = this.agentRadius + 8;
        container.addChild(label);

        // Task indicator (when assigned)
        const taskIndicator = new PIXI.Container();
        taskIndicator.visible = false;
        taskIndicator.y = this.agentRadius + 24;
        container.addChild(taskIndicator);

        // Progress ring
        const progressRing = new PIXI.Graphics();
        taskIndicator.addChild(progressRing);

        // Progress text
        const progressText = new PIXI.Text('0%', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0x00FF88
        });
        progressText.anchor.set(0.5);
        taskIndicator.addChild(progressText);

        // Agent data
        const agent = {
            id: agentData.id,
            type: agentData.type,
            status: agentData.status,
            config: config,
            container: container,
            body: body,
            glow: glow,
            statusIndicator: statusIndicator,
            label: label,
            taskIndicator: taskIndicator,
            progressRing: progressRing,
            progressText: progressText,
            currentTask: null,
            beliefs: {},
            pulsePhase: Math.random() * Math.PI * 2,
            position: { x: pos.x, y: pos.y }
        };

        this.agents.set(agentData.id, agent);
        this.agentLayer.addChild(container);

        // Setup interaction
        this._setupAgentInteraction(agent);

        return agent;
    }

    _drawAgentShape(graphics, shape, radius, color, status) {
        graphics.clear();

        const alpha = status === 'offline' ? 0.3 : (status === 'busy' ? 1 : 0.8);

        graphics.beginFill(color, alpha);
        graphics.lineStyle(2, color, 1);

        switch (shape) {
            case 'hexagon':
                this._drawHexagon(graphics, 0, 0, radius);
                break;
            case 'square':
                graphics.drawRoundedRect(-radius * 0.8, -radius * 0.8, radius * 1.6, radius * 1.6, 8);
                break;
            case 'diamond':
                graphics.moveTo(0, -radius);
                graphics.lineTo(radius * 0.8, 0);
                graphics.lineTo(0, radius);
                graphics.lineTo(-radius * 0.8, 0);
                graphics.closePath();
                break;
            case 'triangle':
                graphics.moveTo(0, -radius);
                graphics.lineTo(radius * 0.9, radius * 0.7);
                graphics.lineTo(-radius * 0.9, radius * 0.7);
                graphics.closePath();
                break;
            case 'circle':
            default:
                graphics.drawCircle(0, 0, radius);
                break;
        }

        graphics.endFill();
    }

    _drawHexagon(graphics, x, y, radius) {
        const points = [];
        for (let i = 0; i < 6; i++) {
            const angle = (i / 6) * Math.PI * 2 - Math.PI / 2;
            points.push(x + Math.cos(angle) * radius);
            points.push(y + Math.sin(angle) * radius);
        }
        graphics.drawPolygon(points);
    }

    _drawStatusIndicator(graphics, status) {
        graphics.clear();

        let color;
        switch (status) {
            case 'idle':
                color = 0x888888;
                break;
            case 'busy':
                color = 0xFFAA00;
                break;
            case 'active':
                color = 0x00FF88;
                break;
            case 'error':
                color = 0xFF4444;
                break;
            case 'offline':
                color = 0x444444;
                break;
            default:
                color = 0x888888;
        }

        graphics.beginFill(color);
        graphics.drawCircle(0, 0, 8);
        graphics.endFill();

        // Pulsing ring for active
        if (status === 'active' || status === 'busy') {
            graphics.lineStyle(2, color, 0.5);
            graphics.drawCircle(0, 0, 12);
        }
    }

    _setupAgentInteraction(agent) {
        agent.container.eventMode = 'static';
        agent.container.cursor = 'pointer';

        agent.container.on('pointerover', () => {
            agent.container.scale.set(1.1);
            this._showAgentTooltip(agent);
        });

        agent.container.on('pointerout', () => {
            agent.container.scale.set(1);
            this._hideAgentTooltip();
        });

        agent.container.on('pointerdown', () => {
            this._showAgentDetails(agent);
        });
    }

    _showAgentTooltip(agent) {
        // Create tooltip
        if (!this.tooltip) {
            this.tooltip = new PIXI.Container();
            this.tooltip.zIndex = 1000;
            this.effectLayer.addChild(this.tooltip);
        }

        this.tooltip.removeChildren();

        const bg = new PIXI.Graphics();
        const text = new PIXI.Text({
            text: `${agent.config.label}\n${agent.config.description}\nStatus: ${agent.status}${agent.currentTask ? `\nTask: ${agent.currentTask}` : ''}`,
            style: {
                fontFamily: 'Courier New',
                fontSize: 11,
                fill: 0xFFFFFF,
                lineHeight: 16
            }
        });

        text.x = 10;
        text.y = 8;

        bg.beginFill(0x1a1a2e, 0.95);
        bg.drawRoundedRect(0, 0, text.width + 20, text.height + 16, 6);
        bg.endFill();
        bg.lineStyle(1, agent.config.color, 0.5);
        bg.drawRoundedRect(0, 0, text.width + 20, text.height + 16, 6);

        this.tooltip.addChild(bg);
        this.tooltip.addChild(text);

        this.tooltip.x = agent.position.x + this.agentRadius + 15;
        this.tooltip.y = agent.position.y - 30;
    }

    _hideAgentTooltip() {
        if (this.tooltip) {
            this.tooltip.removeChildren();
        }
    }

    _showAgentDetails(agent) {
        // Emit event for external handling
        if (this.onAgentUpdate) {
            this.onAgentUpdate({
                type: 'selected',
                agent: this._getAgentState(agent)
            });
        }
    }

    _getAgentState(agent) {
        return {
            id: agent.id,
            type: agent.type,
            status: agent.status,
            currentTask: agent.currentTask,
            beliefs: agent.beliefs,
            position: { x: agent.position.x, y: agent.position.y }
        };
    }

    updateAgent(agentId, updates) {
        const agent = this.agents.get(agentId);
        if (!agent) {
            // Create new agent
            const type = updates.type || 'engineer';
            const config = this.agentTypes[type];
            return this._createAgent({
                id: agentId,
                type: type,
                status: updates.status || 'idle',
                position: updates.position || this.layoutPositions[type],
                config: config
            });
        }

        // Update status
        if (updates.status) {
            agent.status = updates.status;
            this._drawAgentShape(agent.body, agent.config.shape, this.agentRadius, agent.config.color, updates.status);
            this._drawStatusIndicator(agent.statusIndicator, updates.status);
        }

        // Update task
        if (updates.task !== undefined) {
            agent.currentTask = updates.task;
            agent.taskIndicator.visible = !!updates.task;
        }

        // Update progress
        if (updates.progress !== undefined) {
            this._updateProgress(agent, updates.progress);
        }

        // Update beliefs
        if (updates.beliefs) {
            agent.beliefs = { ...agent.beliefs, ...updates.beliefs };
        }

        // Update position
        if (updates.position) {
            agent.position = updates.position;
            agent.container.x = updates.position.x;
            agent.container.y = updates.position.y;
        }

        // Notify callback
        if (this.onAgentUpdate) {
            this.onAgentUpdate({
                type: 'updated',
                agent: this._getAgentState(agent)
            });
        }

        return agent;
    }

    _updateProgress(agent, progress) {
        const ring = agent.progressRing;
        const text = agent.progressText;

        ring.clear();

        // Background ring
        ring.lineStyle(4, 0x333333);
        ring.drawCircle(0, 0, 12);

        // Progress arc
        if (progress > 0) {
            const angle = (progress / 100) * Math.PI * 2 - Math.PI / 2;
            ring.lineStyle(4, agent.config.color);
            ring.arc(0, 0, 12, -Math.PI / 2, angle);
        }

        text.text = `${Math.round(progress)}%`;
    }

    addConnection(fromId, toId, type = 'task') {
        const fromAgent = this.agents.get(fromId);
        const toAgent = this.agents.get(toId);

        if (!fromAgent || !toAgent) return null;

        const connection = {
            id: `${fromId}-${toId}-${Date.now()}`,
            from: fromAgent,
            to: toAgent,
            type: type,
            alpha: 0,
            targetAlpha: this.connectionAlpha,
            createdAt: Date.now()
        };

        this.connections.push(connection);

        // Notify callback
        if (this.onConnectionEvent) {
            this.onConnectionEvent({
                type: 'created',
                connection: {
                    from: fromId,
                    to: toId,
                    connectionType: type
                }
            });
        }

        return connection;
    }

    removeConnection(connectionId) {
        const index = this.connections.findIndex(c => c.id === connectionId);
        if (index >= 0) {
            this.connections.splice(index, 1);
        }
    }

    _drawConnections() {
        const graphics = this.connectionLayer;
        graphics.clear();

        for (const conn of this.connections) {
            // Animate alpha
            conn.alpha += (conn.targetAlpha - conn.alpha) * 0.1;

            const fromPos = conn.from.position;
            const toPos = conn.to.position;

            // Draw connection line
            graphics.lineStyle(2, conn.from.config.color, conn.alpha);
            graphics.moveTo(fromPos.x, fromPos.y);

            // Curved line
            const midX = (fromPos.x + toPos.x) / 2;
            const midY = (fromPos.y + toPos.y) / 2 - 20;
            graphics.quadraticCurveTo(midX, midY, toPos.x, toPos.y);

            // Arrow head
            const angle = Math.atan2(toPos.y - midY, toPos.x - midX);
            const arrowSize = 8;

            graphics.beginFill(conn.from.config.color, conn.alpha);
            graphics.moveTo(toPos.x, toPos.y);
            graphics.lineTo(
                toPos.x - arrowSize * Math.cos(angle - 0.4),
                toPos.y - arrowSize * Math.sin(angle - 0.4)
            );
            graphics.lineTo(
                toPos.x - arrowSize * Math.cos(angle + 0.4),
                toPos.y - arrowSize * Math.sin(angle + 0.4)
            );
            graphics.closePath();
            graphics.endFill();
        }
    }

    _drawTaskFlow() {
        const graphics = this.taskLayer;
        graphics.clear();

        // Draw task nodes in center
        const centerX = this.width / 2;
        const centerY = this.height / 2;

        for (const [taskId, task] of this.tasks) {
            const progress = task.progress || 0;
            const radius = 20 + progress * 0.1;

            // Task circle
            graphics.lineStyle(2, 0x00FF88, 0.8);
            graphics.beginFill(0x1a1a2e, 0.5);
            graphics.drawCircle(centerX, centerY + task.yOffset, radius);
            graphics.endFill();

            // Progress arc
            if (progress > 0) {
                graphics.lineStyle(3, 0x00FF88);
                graphics.arc(
                    centerX, centerY + task.yOffset, radius,
                    -Math.PI / 2,
                    -Math.PI / 2 + (progress / 100) * Math.PI * 2
                );
            }
        }
    }

    _updateAgentEffects() {
        for (const [id, agent] of this.agents) {
            // Pulse effect for active agents
            if (agent.status === 'active' || agent.status === 'busy') {
                agent.pulsePhase += this.pulseSpeed;
                const pulse = Math.sin(agent.pulsePhase) * 0.1 + 1;
                agent.container.scale.set(pulse);

                // Glow effect
                agent.glow.clear();
                agent.glow.beginFill(agent.config.color, 0.1 + Math.sin(agent.pulsePhase) * 0.05);
                agent.glow.drawCircle(0, 0, this.agentRadius + 10 + Math.sin(agent.pulsePhase) * 5);
                agent.glow.endFill();
            } else {
                agent.glow.clear();
            }
        }
    }

    /**
     * Connect to agent WebSocket server.
     */
    async connect() {
        if (this.connected) return;

        try {
            // Connect to agent events WebSocket
            this.ws = new WebSocket(this.wsUrl);

            this.ws.onopen = () => {
                this.connected = true;
                console.log('AgentVisualizer: Connected to agent server');

                // Request current agent states
                this.ws.send(JSON.stringify({ type: 'get_state' }));
            };

            this.ws.onmessage = (event) => {
                const data = JSON.parse(event.data);
                this._handleAgentMessage(data);
            };

            this.ws.onclose = () => {
                this.connected = false;
                console.log('AgentVisualizer: Disconnected from agent server');
                this._scheduleReconnect();
            };

            this.ws.onerror = (error) => {
                console.error('AgentVisualizer: WebSocket error', error);
            };

            // Connect to NEB for real-time events
            await this._connectToNEB();

        } catch (error) {
            console.error('AgentVisualizer: Connection failed', error);
            this._scheduleReconnect();
        }
    }

    async _connectToNEB() {
        try {
            this.nebWs = new WebSocket(this.nebUrl);

            this.nebWs.onopen = () => {
                console.log('AgentVisualizer: Connected to NEB');

                // Subscribe to agent events
                this.nebWs.send(JSON.stringify({
                    type: 'subscribe',
                    topics: ['agent.**', 'task.**', 'belief.**']
                }));
            };

            this.nebWs.onmessage = (event) => {
                try {
                    const signal = JSON.parse(event.data);
                    this._handleNEBSignal(signal);
                } catch (e) {
                    // Ignore parse errors
                }
            };

        } catch (error) {
            console.warn('AgentVisualizer: NEB connection failed, using mock data');
        }
    }

    _handleAgentMessage(data) {
        switch (data.type) {
            case 'init':
                // Initial agent states
                if (data.agents) {
                    data.agents.forEach(agent => {
                        this.updateAgent(agent.id, agent);
                    });
                }
                break;

            case 'agent_event':
                // Agent state change
                this.updateAgent(data.agent_id, {
                    status: data.event === 'task_started' ? 'busy' :
                            data.event === 'task_completed' ? 'idle' : 'active',
                    task: data.payload?.task,
                    progress: data.payload?.progress
                });
                break;

            case 'state_update':
                // Full state update
                this.updateAgent(data.agent_id, data.updates);
                break;

            case 'task_assigned':
                // Task assignment
                this.addConnection(data.from_agent, data.to_agent, 'assignment');
                this.tasks.set(data.task_id, {
                    id: data.task_id,
                    description: data.description,
                    progress: 0,
                    yOffset: (this.tasks.size - 1) * 50 - 50
                });
                break;

            case 'task_completed':
                // Task completion
                this.tasks.delete(data.task_id);
                break;
        }

        if (this.onAgentUpdate) {
            this.onAgentUpdate(data);
        }
    }

    _handleNEBSignal(signal) {
        if (!signal.topic) return;

        const parts = signal.topic.split('.');
        const category = parts[0];
        const action = parts[1];

        switch (category) {
            case 'agent':
                this._handleNEBAgentEvent(action, signal.payload);
                break;
            case 'task':
                this._handleNEBTaskEvent(action, signal.payload);
                break;
            case 'belief':
                this._handleNEBBeliefEvent(action, signal.payload);
                break;
        }
    }

    _handleNEBAgentEvent(action, payload) {
        switch (action) {
            case 'spawned':
                this.updateAgent(payload.agent_id, {
                    type: payload.agent_type,
                    status: 'idle'
                });
                break;
            case 'status':
                this.updateAgent(payload.agent_id, {
                    status: payload.status
                });
                break;
            case 'terminated':
                this.updateAgent(payload.agent_id, { status: 'offline' });
                break;
        }
    }

    _handleNEBTaskEvent(action, payload) {
        switch (action) {
            case 'assigned':
                if (payload.from_agent && payload.to_agent) {
                    this.addConnection(payload.from_agent, payload.to_agent, 'task');
                }
                this.updateAgent(payload.agent_id, {
                    task: payload.task_id,
                    status: 'busy'
                });
                break;
            case 'progress':
                this.updateAgent(payload.agent_id, {
                    progress: payload.progress
                });
                break;
            case 'completed':
                this.updateAgent(payload.agent_id, {
                    task: null,
                    status: 'idle',
                    progress: 100
                });
                break;
        }
    }

    _handleNEBBeliefEvent(action, payload) {
        if (action === 'updated') {
            const agent = this.agents.get(payload.agent_id);
            if (agent) {
                agent.beliefs[payload.key] = payload.value;
            }
        }
    }

    _scheduleReconnect() {
        setTimeout(() => {
            if (!this.connected) {
                this.connect();
            }
        }, 5000);
    }

    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        if (this.nebWs) {
            this.nebWs.close();
            this.nebWs = null;
        }
        this.connected = false;
    }

    isConnected() {
        return this.connected;
    }

    /**
     * Get all agent states.
     */
    getAgents() {
        const states = [];
        for (const [id, agent] of this.agents) {
            states.push(this._getAgentState(agent));
        }
        return states;
    }

    /**
     * Simulate agent activity (for testing without live agents).
     */
    simulateActivity() {
        const statuses = ['idle', 'active', 'busy', 'idle'];
        const tasks = [
            'Implementing auth module',
            'Reviewing PR #42',
            'Planning API refactor',
            'Writing tests',
            'Updating docs'
        ];

        for (const [id, agent] of this.agents) {
            // Random status change
            if (Math.random() > 0.7) {
                const status = statuses[Math.floor(Math.random() * statuses.length)];
                const task = status === 'busy' ? tasks[Math.floor(Math.random() * tasks.length)] : null;
                const progress = status === 'busy' ? Math.random() * 100 : 0;

                this.updateAgent(id, { status, task, progress });
            }
        }

        // Random connections
        if (Math.random() > 0.8 && this.agents.size > 1) {
            const agentIds = Array.from(this.agents.keys());
            const from = agentIds[Math.floor(Math.random() * agentIds.length)];
            let to = agentIds[Math.floor(Math.random() * agentIds.length)];
            while (to === from) {
                to = agentIds[Math.floor(Math.random() * agentIds.length)];
            }
            this.addConnection(from, to, 'collaboration');
        }

        // Remove old connections
        const now = Date.now();
        this.connections = this.connections.filter(c => now - c.createdAt < 10000);
    }

    /**
     * Update loop - call from main animation loop.
     */
    update(deltaTime = 1) {
        this.time += deltaTime;

        // Update effects
        this._updateAgentEffects();
        this._drawConnections();
        this._drawTaskFlow();
    }

    /**
     * Resize handler.
     */
    resize(width, height) {
        this.width = width;
        this.height = height;
        this.layoutPositions = this._calculateLayout();

        // Reposition agents
        for (const [id, agent] of this.agents) {
            const pos = this.layoutPositions[agent.type];
            if (pos) {
                agent.position = { x: pos.x, y: pos.y };
                agent.container.x = pos.x;
                agent.container.y = pos.y;
            }
        }
    }

    /**
     * Cleanup.
     */
    destroy() {
        this.disconnect();
        this.container.destroy({ children: true });
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AgentVisualizer };
}
