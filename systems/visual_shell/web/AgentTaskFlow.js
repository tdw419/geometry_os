/**
 * Geometry OS: Agent Task Flow Visualizer
 *
 * Visualizes the lifecycle of tasks through the agent guild:
 * Task Created → Assignment → Execution → Review → Completion
 *
 * Uses morphological glyphs and neural event bus integration.
 */

class AgentTaskFlow {
    constructor(options = {}) {
        this.container = options.container || document.body;
        this.width = options.width || 800;
        this.height = options.height || 600;

        // Task states
        this.tasks = new Map();
        this.agents = new Map();
        this.events = [];

        // Flow visualization
        this.canvas = null;
        this.ctx = null;
        this.animationId = null;

        // Time tracking
        this.startTime = Date.now();
        this.timeScale = options.timeScale || 1;

        // Visual config
        this.config = {
            nodeRadius: 30,
            arrowWidth: 2,
            particleSpeed: 2,
            trailLength: 50,
            colors: {
                pending: '#888888',
                assigned: '#44ffff',
                executing: '#ffff44',
                reviewing: '#ff44ff',
                completed: '#44ff44',
                failed: '#ff4444'
            }
        };

        // NEB integration
        this.nebBus = options.nebBus || null;
        this.wsConnection = null;

        console.log('[AgentTaskFlow] Initialized');
    }

    /**
     * Initialize the visualizer.
     */
    async init() {
        // Create canvas
        this.canvas = document.createElement('canvas');
        this.canvas.width = this.width;
        this.canvas.height = this.height;
        this.canvas.style.background = '#0a0a0a';
        this.container.appendChild(this.canvas);

        this.ctx = this.canvas.getContext('2d');

        // Initialize demo agents
        this._initDemoAgents();

        // Start animation loop
        this._animate();

        // Connect to NEB if available
        if (this.nebBus) {
            this._connectToNEB();
        }

        console.log('[AgentTaskFlow] Ready');
    }

    /**
     * Initialize demo agents for visualization.
     */
    _initDemoAgents() {
        const agentTypes = ['architect', 'engineer', 'reviewer', 'executor'];
        const positions = [
            { x: 100, y: 150 },  // Architect
            { x: 100, y: 300 },  // Engineer 1
            { x: 100, y: 450 },  // Engineer 2
            { x: 700, y: 300 }   // Reviewer
        ];

        agentTypes.forEach((type, i) => {
            const agentId = `agent-${type.slice(0, 3)}-${i + 1}`;
            this.agents.set(agentId, {
                id: agentId,
                type,
                status: 'idle',
                position: positions[i],
                currentTask: null,
                completedTasks: 0,
                color: this._getAgentColor(type),
                pulse: 0
            });
        });
    }

    /**
     * Get color for agent type.
     */
    _getAgentColor(type) {
        const colors = {
            architect: '#ff44ff',
            engineer: '#44ffff',
            reviewer: '#ffff44',
            executor: '#44ff44'
        };
        return colors[type] || '#888888';
    }

    /**
     * Connect to Neural Event Bus.
     */
    _connectToNEB() {
        // Subscribe to task events
        this.nebBus.subscribe('task.**', (signal) => {
            this._handleTaskEvent(signal);
        });

        this.nebBus.subscribe('agent.**', (signal) => {
            this._handleAgentEvent(signal);
        });
    }

    /**
     * Handle task events from NEB.
     */
    _handleTaskEvent(signal) {
        const topic = signal.topic;
        const payload = signal.payload;

        this.events.push({
            time: Date.now(),
            topic,
            payload
        });

        if (topic.includes('created')) {
            this._createTask(payload);
        } else if (topic.includes('assigned')) {
            this._assignTask(payload);
        } else if (topic.includes('started')) {
            this._startTask(payload);
        } else if (topic.includes('completed')) {
            this._completeTask(payload);
        } else if (topic.includes('failed')) {
            this._failTask(payload);
        }
    }

    /**
     * Handle agent events from NEB.
     */
    _handleAgentEvent(signal) {
        const topic = signal.topic;
        const payload = signal.payload;

        const agentId = payload.agent_id;
        if (!this.agents.has(agentId)) {
            // Create new agent if unknown
            this.agents.set(agentId, {
                id: agentId,
                type: payload.agent_type || 'unknown',
                status: 'idle',
                position: this._getAgentPosition(payload.agent_type),
                currentTask: null,
                completedTasks: 0,
                color: this._getAgentColor(payload.agent_type),
                pulse: 0
            });
        }

        const agent = this.agents.get(agentId);

        if (topic.includes('status')) {
            agent.status = payload.status;
        }

        if (topic.includes('pulse')) {
            agent.pulse = 1.0;
        }
    }

    /**
     * Get position for agent type.
     */
    _getAgentPosition(type) {
        const baseY = 100 + Math.random() * 400;
        const baseX = type === 'reviewer' ? 700 : 100;
        return { x: baseX + Math.random() * 50, y: baseY };
    }

    /**
     * Create a new task.
     */
    createTask(taskId, title, type = 'CODE_GEN') {
        const task = {
            id: taskId,
            title,
            type,
            status: 'pending',
            assignee: null,
            progress: 0,
            createdAt: Date.now(),
            position: { x: 400, y: 50 },
            targetPosition: { x: 400, y: 50 },
            particles: []
        };

        this.tasks.set(taskId, task);
        this.events.push({
            time: Date.now(),
            topic: 'task.created',
            payload: { taskId, title, type }
        });

        return task;
    }

    _createTask(payload) {
        return this.createTask(
            payload.task_id || payload.taskId,
            payload.title,
            payload.type
        );
    }

    /**
     * Assign task to an agent.
     */
    assignTask(taskId, agentId) {
        const task = this.tasks.get(taskId);
        const agent = this.agents.get(agentId);

        if (!task || !agent) return;

        task.status = 'assigned';
        task.assignee = agentId;
        task.targetPosition = { ...agent.position };
        agent.status = 'busy';
        agent.currentTask = taskId;

        // Create assignment particle trail
        this._createParticleTrail(task.position, agent.position, task.status);

        this.events.push({
            time: Date.now(),
            topic: 'task.assigned',
            payload: { taskId, agentId }
        });
    }

    _assignTask(payload) {
        this.assignTask(payload.task_id, payload.agent_id);
    }

    /**
     * Start task execution.
     */
    startTask(taskId) {
        const task = this.tasks.get(taskId);
        if (!task) return;

        task.status = 'executing';
        task.startedAt = Date.now();

        this.events.push({
            time: Date.now(),
            topic: 'task.started',
            payload: { taskId }
        });
    }

    _startTask(payload) {
        this.startTask(payload.task_id);
    }

    /**
     * Complete task.
     */
    completeTask(taskId, result = {}) {
        const task = this.tasks.get(taskId);
        if (!task) return;

        task.status = 'completed';
        task.result = result;
        task.completedAt = Date.now();
        task.progress = 100;

        // Update agent
        if (task.assignee) {
            const agent = this.agents.get(task.assignee);
            if (agent) {
                agent.status = 'idle';
                agent.currentTask = null;
                agent.completedTasks++;
            }
        }

        // Create completion particles
        this._createCompletionBurst(task.position);

        this.events.push({
            time: Date.now(),
            topic: 'task.completed',
            payload: { taskId, result }
        });
    }

    _completeTask(payload) {
        this.completeTask(payload.task_id, payload.result);
    }

    /**
     * Fail task.
     */
    failTask(taskId, error = '') {
        const task = this.tasks.get(taskId);
        if (!task) return;

        task.status = 'failed';
        task.error = error;

        if (task.assignee) {
            const agent = this.agents.get(task.assignee);
            if (agent) {
                agent.status = 'idle';
                agent.currentTask = null;
            }
        }

        this.events.push({
            time: Date.now(),
            topic: 'task.failed',
            payload: { taskId, error }
        });
    }

    _failTask(payload) {
        this.failTask(payload.task_id, payload.error);
    }

    /**
     * Create particle trail between two points.
     */
    _createParticleTrail(from, to, status) {
        const count = 10;
        const color = this.config.colors[status];

        for (let i = 0; i < count; i++) {
            const progress = i / count;
            this.particles.push({
                x: from.x + (to.x - from.x) * progress,
                y: from.y + (to.y - from.y) * progress,
                targetX: to.x,
                targetY: to.y,
                color,
                life: 1.0,
                size: 3 + Math.random() * 3
            });
        }
    }

    /**
     * Create completion burst effect.
     */
    _createCompletionBurst(position) {
        const count = 20;

        for (let i = 0; i < count; i++) {
            const angle = (i / count) * Math.PI * 2;
            const speed = 2 + Math.random() * 3;

            this.particles.push({
                x: position.x,
                y: position.y,
                vx: Math.cos(angle) * speed,
                vy: Math.sin(angle) * speed,
                color: '#44ff44',
                life: 1.0,
                size: 4 + Math.random() * 4
            });
        }
    }

    // Particle system
    particles = [];

    /**
     * Animation loop.
     */
    _animate() {
        const ctx = this.ctx;
        const now = Date.now();

        // Clear
        ctx.fillStyle = '#0a0a0a';
        ctx.fillRect(0, 0, this.width, this.height);

        // Draw flow lanes
        this._drawFlowLanes(ctx);

        // Draw agents
        this._drawAgents(ctx, now);

        // Draw tasks
        this._drawTasks(ctx, now);

        // Update and draw particles
        this._updateParticles(ctx);

        // Draw connections
        this._drawConnections(ctx);

        // Draw event timeline
        this._drawTimeline(ctx);

        // Continue animation
        this.animationId = requestAnimationFrame(() => this._animate());
    }

    /**
     * Draw flow lanes.
     */
    _drawFlowLanes(ctx) {
        ctx.strokeStyle = '#1a1a1a';
        ctx.lineWidth = 1;

        // Vertical lanes
        for (let x = 50; x < this.width; x += 150) {
            ctx.beginPath();
            ctx.moveTo(x, 0);
            ctx.lineTo(x, this.height);
            ctx.stroke();
        }

        // Flow arrows
        ctx.fillStyle = '#333';
        ctx.font = '10px Courier New';
        ctx.fillText('PENDING', 370, 30);
        ctx.fillText('ASSIGNED', 80, 80);
        ctx.fillText('REVIEWING', 650, 80);
    }

    /**
     * Draw agents.
     */
    _drawAgents(ctx, now) {
        for (const agent of this.agents.values()) {
            const { x, y } = agent.position;
            const radius = this.config.nodeRadius;

            // Pulse effect
            if (agent.pulse > 0) {
                const pulseRadius = radius + agent.pulse * 20;
                ctx.beginPath();
                ctx.arc(x, y, pulseRadius, 0, Math.PI * 2);
                ctx.fillStyle = `${agent.color}${Math.floor(agent.pulse * 50).toString(16).padStart(2, '0')}`;
                ctx.fill();
                agent.pulse = Math.max(0, agent.pulse - 0.02);
            }

            // Agent body
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, Math.PI * 2);

            // Fill based on status
            const gradient = ctx.createRadialGradient(x, y, 0, x, y, radius);
            gradient.addColorStop(0, agent.color);
            gradient.addColorStop(1, '#1a1a1a');
            ctx.fillStyle = gradient;
            ctx.fill();

            // Border
            ctx.strokeStyle = agent.status === 'busy' ? '#ffffff' : agent.color;
            ctx.lineWidth = agent.status === 'busy' ? 3 : 2;
            ctx.stroke();

            // Agent type icon
            ctx.fillStyle = '#0a0a0a';
            ctx.font = 'bold 12px Courier New';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.fillText(agent.type[0].toUpperCase(), x, y);

            // Status label
            ctx.fillStyle = '#888';
            ctx.font = '9px Courier New';
            ctx.fillText(`${agent.status} (${agent.completedTasks})`, x, y + radius + 12);
        }
    }

    /**
     * Draw tasks.
     */
    _drawTasks(ctx, now) {
        for (const task of this.tasks.values()) {
            // Animate position
            const dx = task.targetPosition.x - task.position.x;
            const dy = task.targetPosition.y - task.position.y;
            task.position.x += dx * 0.1;
            task.position.y += dy * 0.1;

            const { x, y } = task.position;
            const radius = 15;

            // Task node
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, Math.PI * 2);
            ctx.fillStyle = this.config.colors[task.status];
            ctx.fill();
            ctx.strokeStyle = '#333';
            ctx.lineWidth = 1;
            ctx.stroke();

            // Progress bar for executing tasks
            if (task.status === 'executing') {
                const progress = Math.min(100, task.progress + 0.5);
                task.progress = progress;

                ctx.fillStyle = '#333';
                ctx.fillRect(x - 20, y + radius + 5, 40, 4);
                ctx.fillStyle = '#44ff44';
                ctx.fillRect(x - 20, y + radius + 5, 40 * (progress / 100), 4);
            }

            // Task ID
            ctx.fillStyle = '#0a0a0a';
            ctx.font = '8px Courier New';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.fillText(task.id.slice(-4), x, y);
        }
    }

    /**
     * Update and draw particles.
     */
    _updateParticles(ctx) {
        for (let i = this.particles.length - 1; i >= 0; i--) {
            const p = this.particles[i];

            // Update position
            if (p.targetX !== undefined) {
                const dx = p.targetX - p.x;
                const dy = p.targetY - p.y;
                p.x += dx * 0.1;
                p.y += dy * 0.1;
            } else if (p.vx !== undefined) {
                p.x += p.vx;
                p.y += p.vy;
            }

            // Update life
            p.life -= 0.02;

            // Remove dead particles
            if (p.life <= 0) {
                this.particles.splice(i, 1);
                continue;
            }

            // Draw
            ctx.beginPath();
            ctx.arc(p.x, p.y, p.size * p.life, 0, Math.PI * 2);
            ctx.fillStyle = p.color + Math.floor(p.life * 255).toString(16).padStart(2, '0');
            ctx.fill();
        }
    }

    /**
     * Draw connections between agents and tasks.
     */
    _drawConnections(ctx) {
        ctx.strokeStyle = '#333';
        ctx.lineWidth = 1;
        ctx.setLineDash([5, 5]);

        for (const task of this.tasks.values()) {
            if (task.assignee) {
                const agent = this.agents.get(task.assignee);
                if (agent) {
                    ctx.beginPath();
                    ctx.moveTo(task.position.x, task.position.y);
                    ctx.lineTo(agent.position.x, agent.position.y);
                    ctx.stroke();
                }
            }
        }

        ctx.setLineDash([]);
    }

    /**
     * Draw event timeline.
     */
    _drawTimeline(ctx) {
        const timelineY = this.height - 30;
        const recentEvents = this.events.slice(-20);

        ctx.fillStyle = '#1a1a1a';
        ctx.fillRect(0, timelineY - 10, this.width, 40);

        ctx.fillStyle = '#666';
        ctx.font = '9px Courier New';
        ctx.textAlign = 'left';

        let x = 10;
        for (const event of recentEvents) {
            const shortTopic = event.topic.split('.').pop();
            const color = this._getEventColor(event.topic);

            ctx.fillStyle = color;
            ctx.fillText(shortTopic, x, timelineY);

            x += 80;
            if (x > this.width - 50) break;
        }
    }

    /**
     * Get color for event type.
     */
    _getEventColor(topic) {
        if (topic.includes('created')) return '#44ffff';
        if (topic.includes('assigned')) return '#ffff44';
        if (topic.includes('started')) return '#ff8844';
        if (topic.includes('completed')) return '#44ff44';
        if (topic.includes('failed')) return '#ff4444';
        return '#888';
    }

    /**
     * Run demo simulation.
     */
    runDemo() {
        // Create tasks
        const task1 = this.createTask('task-001', 'Implement feature X', 'CODE_GEN');
        const task2 = this.createTask('task-002', 'Review PR #42', 'CODE_REVIEW');
        const task3 = this.createTask('task-003', 'Fix bug in module Y', 'BUG_FIX');

        // Simulate task flow
        setTimeout(() => {
            this.assignTask('task-001', 'agent-eng-1');
        }, 1000);

        setTimeout(() => {
            this.startTask('task-001');
        }, 2000);

        setTimeout(() => {
            this.assignTask('task-002', 'agent-rev-3');
        }, 2500);

        setTimeout(() => {
            this.completeTask('task-001', { linesAdded: 42 });
        }, 4000);

        setTimeout(() => {
            this.startTask('task-002');
        }, 4500);

        setTimeout(() => {
            this.assignTask('task-003', 'agent-eng-2');
        }, 5000);

        setTimeout(() => {
            this.completeTask('task-002', { approved: true });
        }, 6000);

        console.log('[AgentTaskFlow] Demo started');
    }

    /**
     * Get statistics.
     */
    getStats() {
        let pending = 0, assigned = 0, executing = 0, completed = 0, failed = 0;

        for (const task of this.tasks.values()) {
            switch (task.status) {
                case 'pending': pending++; break;
                case 'assigned': assigned++; break;
                case 'executing': executing++; break;
                case 'completed': completed++; break;
                case 'failed': failed++; break;
            }
        }

        return {
            total: this.tasks.size,
            pending,
            assigned,
            executing,
            completed,
            failed,
            events: this.events.length,
            agents: this.agents.size
        };
    }

    /**
     * Clear all tasks.
     */
    clear() {
        this.tasks.clear();
        this.events = [];
        this.particles = [];

        for (const agent of this.agents.values()) {
            agent.status = 'idle';
            agent.currentTask = null;
        }
    }

    /**
     * Destroy the visualizer.
     */
    destroy() {
        if (this.animationId) {
            cancelAnimationFrame(this.animationId);
        }
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentTaskFlow;
}
