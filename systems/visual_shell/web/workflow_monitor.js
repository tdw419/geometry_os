/**
 * Geometry OS: Workflow Monitor Dashboard
 *
 * PixiJS-based monitoring dashboard for autonomous workflow system.
 * Displays roadmap progress, agent status, system health, and provides controls.
 */

class WorkflowMonitor {
    constructor() {
        // Core configuration
        this.config = {
            backgroundColor: 0x0a0a0a,
            panelColor: 0x1a1a1a,
            accentColor: 0x00FFFF,
            warningColor: 0xFFFF00,
            errorColor: 0xFF0000,
            successColor: 0x00FF00,
            textColor: 0xFFFFFF,
            gridSize: 20,
            animationSpeed: 0.02
        };

        // Application state
        this.app = null;
        this.mainContainer = null;
        this.panels = {};
        this.currentView = 'overview';
        this.websocket = null;
        this.data = {
            roadmap: null,
            agents: [],
            health: {},
            changes: []
        };

        // Animation state
        this.time = 0;
        this.animations = [];
    }

    async initialize(containerId) {
        console.log("🚀 Initializing Workflow Monitor...");

        // Initialize PixiJS
        this.app = new PIXI.Application();
        await this.app.init({
            resizeTo: window,
            backgroundColor: this.config.backgroundColor,
            antialias: true,
            resolution: window.devicePixelRatio || 1,
            autoDensity: true
        });

        document.getElementById(containerId).appendChild(this.app.view);

        // Create main container
        this.mainContainer = new PIXI.Container();
        this.app.stage.addChild(this.mainContainer);

        // Initialize panels
        this.initializePanels();

        // Setup WebSocket connection
        this.setupWebSocket();

        // Setup event listeners
        this.setupEventListeners();

        // Start render loop
        this.app.ticker.add(this.update.bind(this));

        // Initial data load
        await this.loadInitialData();

        console.log("✅ Workflow Monitor initialized");
    }

    initializePanels() {
        // Create panel containers
        this.panels.roadmap = new RoadmapStatusPanel(this.config);
        this.panels.changes = new OpenSpecChangesMonitor(this.config);
        this.panels.orchestrator = new MCPOrchestratorView(this.config);
        this.panels.health = new SystemHealthDashboard(this.config);

        // Position panels in overview layout
        this.layoutOverview();

        // Add panels to main container
        Object.values(this.panels).forEach(panel => {
            this.mainContainer.addChild(panel.container);
        });
    }

    layoutOverview() {
        const width = this.app.screen.width;
        const height = this.app.screen.height - 160; // Account for header and controls
        const margin = 20;

        // Top row: Roadmap and Changes
        this.panels.roadmap.container.position.set(margin, 80);
        this.panels.roadmap.resize(width * 0.6 - margin * 1.5, height * 0.6 - margin);

        this.panels.changes.container.position.set(width * 0.6 + margin * 0.5, 80);
        this.panels.changes.resize(width * 0.4 - margin * 1.5, height * 0.6 - margin);

        // Bottom row: Orchestrator and Health
        this.panels.orchestrator.container.position.set(margin, height * 0.6 + 100);
        this.panels.orchestrator.resize(width * 0.5 - margin * 1.5, height * 0.4 - margin);

        this.panels.health.container.position.set(width * 0.5 + margin * 0.5, height * 0.6 + 100);
        this.panels.health.resize(width * 0.5 - margin * 1.5, height * 0.4 - margin);
    }

    layoutRoadmap() {
        const width = this.app.screen.width;
        const height = this.app.screen.height - 160;

        this.panels.roadmap.container.position.set(20, 80);
        this.panels.roadmap.resize(width - 40, height - 20);

        // Hide other panels
        this.panels.changes.container.visible = false;
        this.panels.orchestrator.container.visible = false;
        this.panels.health.container.visible = false;
    }

    layoutAgents() {
        const width = this.app.screen.width;
        const height = this.app.screen.height - 160;

        this.panels.orchestrator.container.position.set(20, 80);
        this.panels.orchestrator.resize(width - 40, height - 20);

        // Hide other panels
        this.panels.roadmap.container.visible = false;
        this.panels.changes.container.visible = false;
        this.panels.health.container.visible = false;
    }

    layoutHealth() {
        const width = this.app.screen.width;
        const height = this.app.screen.height - 160;

        this.panels.health.container.position.set(20, 80);
        this.panels.health.resize(width - 40, height - 20);

        // Hide other panels
        this.panels.roadmap.container.visible = false;
        this.panels.changes.container.visible = false;
        this.panels.orchestrator.container.visible = false;
    }

    switchView(view) {
        this.currentView = view;

        // Show all panels first
        Object.values(this.panels).forEach(panel => {
            panel.container.visible = true;
        });

        // Apply specific layout
        switch (view) {
            case 'overview':
                this.layoutOverview();
                break;
            case 'roadmap':
                this.layoutRoadmap();
                break;
            case 'agents':
                this.layoutAgents();
                break;
            case 'health':
                this.layoutHealth();
                break;
        }

        // Update view buttons
        document.querySelectorAll('.view-button').forEach(btn => {
            btn.classList.remove('active');
            if (btn.dataset.view === view) {
                btn.classList.add('active');
            }
        });
    }

    setupWebSocket() {
        try {
            this.websocket = new WebSocket('ws://127.0.0.1:8765');

            this.websocket.onopen = () => {
                console.log('🔗 WebSocket connected');
                this.updateStatusIndicator('websocket-status', 'active');
            };

            this.websocket.onmessage = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    this.handleWebSocketMessage(data);
                } catch (e) {
                    console.error('WebSocket message parse error:', e);
                }
            };

            this.websocket.onclose = () => {
                console.log('🔌 WebSocket disconnected');
                this.updateStatusIndicator('websocket-status', 'error');
                // Attempt reconnection
                setTimeout(() => this.setupWebSocket(), 5000);
            };

            this.websocket.onerror = (error) => {
                console.error('WebSocket error:', error);
                this.updateStatusIndicator('websocket-status', 'error');
            };
        } catch (e) {
            console.error('WebSocket setup failed:', e);
            this.updateStatusIndicator('websocket-status', 'error');
        }
    }

    handleWebSocketMessage(data) {
        switch (data.type) {
            case 'roadmap_update':
                this.data.roadmap = data.data;
                this.panels.roadmap.updateData(data.data);
                break;
            case 'agent_status':
                this.data.agents = data.data;
                this.panels.orchestrator.updateData(data.data);
                break;
            case 'health_update':
                this.data.health = data.data;
                this.panels.health.updateData(data.data);
                this.updateStatusIndicators(data.data);
                break;
            case 'changes_update':
                this.data.changes = data.data;
                this.panels.changes.updateData(data.data);
                break;
        }
    }

    updateStatusIndicators(healthData) {
        if (healthData.lm_studio) {
            this.updateStatusIndicator('lm-studio-status',
                healthData.lm_studio.connected ? 'active' : 'error');
        }
        if (healthData.mcp_server) {
            this.updateStatusIndicator('mcp-status',
                healthData.mcp_server.running ? 'active' : 'error');
        }
    }

    updateStatusIndicator(id, status) {
        const element = document.getElementById(id);
        if (element) {
            element.className = 'status-dot ' + status;
        }
    }

    setupEventListeners() {
        // View toggle buttons
        document.querySelectorAll('.view-button').forEach(btn => {
            btn.addEventListener('click', () => {
                this.switchView(btn.dataset.view);
            });
        });

        // Control buttons
        document.getElementById('start-roadmap-btn').addEventListener('click', () => {
            this.sendControlCommand('start_roadmap');
        });

        document.getElementById('pause-roadmap-btn').addEventListener('click', () => {
            this.sendControlCommand('pause_roadmap');
        });

        document.getElementById('stop-roadmap-btn').addEventListener('click', () => {
            this.sendControlCommand('stop_roadmap');
        });

        document.getElementById('diagnostics-btn').addEventListener('click', () => {
            this.runDiagnostics();
        });

        // Window resize
        window.addEventListener('resize', () => {
            this.switchView(this.currentView); // Re-layout
        });
    }

    sendControlCommand(command) {
        if (this.websocket && this.websocket.readyState === WebSocket.OPEN) {
            this.websocket.send(JSON.stringify({
                type: 'control_command',
                command: command,
                timestamp: Date.now()
            }));
        } else {
            console.warn('WebSocket not connected, cannot send command');
        }
    }

    async runDiagnostics() {
        console.log('🔍 Running diagnostics...');

        // Test API endpoints
        const endpoints = [
            '/api/health',
            '/api/roadmap/status',
            '/api/agents/status',
            '/api/changes/active'
        ];

        for (const endpoint of endpoints) {
            try {
                const response = await fetch(`http://localhost:8080${endpoint}`);
                if (response.ok) {
                    console.log(`✅ ${endpoint}: OK`);
                } else {
                    console.log(`⚠️ ${endpoint}: ${response.status}`);
                }
            } catch (e) {
                console.log(`❌ ${endpoint}: ${e.message}`);
            }
        }
    }

    async loadInitialData() {
        try {
            // Load mock data initially
            await this.loadMockData();

            // Try to load real data
            await this.loadRealData();
        } catch (e) {
            console.warn('Failed to load initial data:', e);
        }
    }

    async loadMockData() {
        // Mock roadmap data
        this.data.roadmap = {
            title: "Phase 25: Emergent Consciousness",
            phases: [
                { name: "Week 1: Foundation", progress: 85, status: "completed" },
                { name: "Week 2: Integration", progress: 60, status: "in_progress" },
                { name: "Week 3: Learning", progress: 30, status: "pending" },
                { name: "Week 4: Emergence", progress: 0, status: "pending" }
            ],
            overall_progress: 43
        };

        // Mock agent data
        this.data.agents = [
            { id: "ubuntu_agent", name: "Ubuntu Integration Agent", status: "active", task: "System monitoring", progress: 75 },
            { id: "neural_bridge", name: "Neural Bridge Agent", status: "active", task: "Data processing", progress: 90 },
            { id: "evolution_daemon", name: "Evolution Daemon", status: "idle", task: "Waiting for tasks", progress: 0 }
        ];

        // Mock health data
        this.data.health = {
            lm_studio: { connected: true, latency: 45 },
            mcp_server: { running: true, uptime: 3600 },
            system_load: { cpu: 25, memory: 60 },
            error_rate: 0.02
        };

        // Mock changes data
        this.data.changes = [
            { id: "change_001", title: "Add neural feedback loop", status: "in_review", priority: "high" },
            { id: "change_002", title: "Optimize memory usage", status: "approved", priority: "medium" },
            { id: "change_003", title: "Implement consciousness metrics", status: "draft", priority: "high" }
        ];

        // Update panels with mock data
        this.panels.roadmap.updateData(this.data.roadmap);
        this.panels.orchestrator.updateData(this.data.agents);
        this.panels.health.updateData(this.data.health);
        this.panels.changes.updateData(this.data.changes);
    }

    async loadRealData() {
        // Try to fetch real data from APIs
        const endpoints = {
            roadmap: '/api/roadmap/status',
            agents: '/api/agents/status',
            health: '/api/health',
            changes: '/api/changes/active'
        };

        for (const [key, endpoint] of Object.entries(endpoints)) {
            try {
                const response = await fetch(`http://localhost:8080${endpoint}`);
                if (response.ok) {
                    const data = await response.json();
                    this.data[key] = data;
                    this.panels[key]?.updateData(data);
                }
            } catch (e) {
                // Keep mock data if real data fails
            }
        }
    }

    update(delta) {
        this.time += delta;

        // Update animations
        this.animations.forEach(animation => {
            animation.update(delta);
        });

        // Update panels
        Object.values(this.panels).forEach(panel => {
            panel.update(delta);
        });
    }
}

// Panel base class
class DashboardPanel {
    constructor(config, title) {
        this.config = config;
        this.title = title;
        this.container = new PIXI.Container();
        this.background = null;
        this.titleText = null;
        this.contentContainer = null;

        this.initializeContainer();
    }

    initializeContainer() {
        // Background
        this.background = new PIXI.Graphics();
        this.background.fill(this.config.panelColor);
        this.background.stroke({ color: this.config.accentColor, width: 1 });
        this.container.addChild(this.background);

        // Title
        this.titleText = new PIXI.Text(this.title, {
            fontFamily: 'Courier New',
            fontSize: 16,
            fill: this.config.accentColor,
            fontWeight: 'bold'
        });
        this.titleText.position.set(15, 10);
        this.container.addChild(this.titleText);

        // Content container
        this.contentContainer = new PIXI.Container();
        this.contentContainer.position.set(15, 40);
        this.container.addChild(this.contentContainer);
    }

    resize(width, height) {
        this.background.clear();
        this.background.fill(this.config.panelColor);
        this.background.stroke({ color: this.config.accentColor, width: 1 });
        this.background.rect(0, 0, width, height);
        this.background.fill();
    }

    update(delta) {
        // Override in subclasses
    }

    updateData(data) {
        // Override in subclasses
    }
}

// Roadmap Status Panel
class RoadmapStatusPanel extends DashboardPanel {
    constructor(config) {
        super(config, 'ROADMAP STATUS');
        this.progressBars = [];
        this.phaseTexts = [];
    }

    updateData(data) {
        if (!data) return;

        // Clear existing content
        this.contentContainer.removeChildren();

        let y = 0;
        const barWidth = 300;
        const barHeight = 20;

        // Overall progress
        const overallText = new PIXI.Text(`Overall: ${data.overall_progress}%`, {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: this.config.textColor
        });
        overallText.position.set(0, y);
        this.contentContainer.addChild(overallText);
        y += 25;

        // Overall progress bar
        const overallBar = this.createProgressBar(0, y, barWidth, barHeight, data.overall_progress / 100);
        this.contentContainer.addChild(overallBar);
        y += 40;

        // Phase details
        data.phases.forEach((phase, index) => {
            const phaseText = new PIXI.Text(`${phase.name}: ${phase.progress}%`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: this.getStatusColor(phase.status)
            });
            phaseText.position.set(0, y);
            this.contentContainer.addChild(phaseText);

            const phaseBar = this.createProgressBar(0, y + 15, barWidth, barHeight, phase.progress / 100);
            this.contentContainer.addChild(phaseBar);

            y += 45;
        });
    }

    createProgressBar(x, y, width, height, progress) {
        const container = new PIXI.Container();
        container.position.set(x, y);

        // Background
        const bg = new PIXI.Graphics();
        bg.fill(0x333333);
        bg.rect(0, 0, width, height);
        bg.fill();
        container.addChild(bg);

        // Progress fill
        const fill = new PIXI.Graphics();
        fill.fill(this.config.accentColor);
        fill.rect(0, 0, width * progress, height);
        fill.fill();
        container.addChild(fill);

        // Border
        const border = new PIXI.Graphics();
        border.stroke({ color: this.config.accentColor, width: 1 });
        border.rect(0, 0, width, height);
        container.addChild(border);

        return container;
    }

    getStatusColor(status) {
        switch (status) {
            case 'completed': return this.config.successColor;
            case 'in_progress': return this.config.accentColor;
            case 'pending': return 0x666666;
            default: return this.config.textColor;
        }
    }
}

// OpenSpec Changes Monitor
class OpenSpecChangesMonitor extends DashboardPanel {
    constructor(config) {
        super(config, 'OPENSPEC CHANGES');
        this.changeItems = [];
    }

    updateData(data) {
        if (!data) return;

        // Clear existing content
        this.contentContainer.removeChildren();

        let y = 0;
        data.forEach((change, index) => {
            const itemContainer = new PIXI.Container();
            itemContainer.position.set(0, y);

            // Status indicator
            const statusColor = this.getChangeStatusColor(change.status);
            const statusDot = new PIXI.Graphics();
            statusDot.fill(statusColor);
            statusDot.circle(8, 8, 6);
            statusDot.fill();
            itemContainer.addChild(statusDot);

            // Change text
            const changeText = new PIXI.Text(`${change.title}`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: this.config.textColor,
                wordWrap: true,
                wordWrapWidth: 250
            });
            changeText.position.set(25, 0);
            itemContainer.addChild(changeText);

            // Priority badge
            const priorityText = new PIXI.Text(change.priority.toUpperCase(), {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: this.getPriorityColor(change.priority)
            });
            priorityText.position.set(25, 20);
            itemContainer.addChild(priorityText);

            this.contentContainer.addChild(itemContainer);
            y += 45;
        });
    }

    getChangeStatusColor(status) {
        switch (status) {
            case 'approved': return this.config.successColor;
            case 'in_review': return this.config.warningColor;
            case 'draft': return 0x666666;
            default: return this.config.textColor;
        }
    }

    getPriorityColor(priority) {
        switch (priority) {
            case 'high': return this.config.errorColor;
            case 'medium': return this.config.warningColor;
            case 'low': return 0x666666;
            default: return this.config.textColor;
        }
    }
}

// MCP Orchestrator View
class MCPOrchestratorView extends DashboardPanel {
    constructor(config) {
        super(config, 'MCP ORCHESTRATOR');
        this.agentItems = [];
    }

    updateData(data) {
        if (!data) return;

        // Clear existing content
        this.contentContainer.removeChildren();

        let y = 0;
        data.forEach((agent, index) => {
            const itemContainer = new PIXI.Container();
            itemContainer.position.set(0, y);

            // Status indicator
            const statusColor = this.getAgentStatusColor(agent.status);
            const statusDot = new PIXI.Graphics();
            statusDot.fill(statusColor);
            statusDot.circle(8, 8, 6);
            statusDot.fill();
            itemContainer.addChild(statusDot);

            // Agent info
            const agentText = new PIXI.Text(`${agent.name}`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: this.config.textColor
            });
            agentText.position.set(25, 0);
            itemContainer.addChild(agentText);

            // Task info
            const taskText = new PIXI.Text(`${agent.task}`, {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: 0xAAAAAA
            });
            taskText.position.set(25, 15);
            itemContainer.addChild(taskText);

            // Progress bar
            const progressBar = this.createMiniProgressBar(25, 30, 200, 8, agent.progress / 100);
            itemContainer.addChild(progressBar);

            this.contentContainer.addChild(itemContainer);
            y += 50;
        });
    }

    createMiniProgressBar(x, y, width, height, progress) {
        const container = new PIXI.Container();
        container.position.set(x, y);

        // Background
        const bg = new PIXI.Graphics();
        bg.fill(0x333333);
        bg.rect(0, 0, width, height);
        bg.fill();
        container.addChild(bg);

        // Progress fill
        const fill = new PIXI.Graphics();
        fill.fill(this.config.accentColor);
        fill.rect(0, 0, width * progress, height);
        fill.fill();
        container.addChild(fill);

        return container;
    }

    getAgentStatusColor(status) {
        switch (status) {
            case 'active': return this.config.successColor;
            case 'idle': return this.config.warningColor;
            case 'error': return this.config.errorColor;
            default: return 0x666666;
        }
    }
}

// System Health Dashboard
class SystemHealthDashboard extends DashboardPanel {
    constructor(config) {
        super(config, 'SYSTEM HEALTH');
        this.metrics = {};
    }

    updateData(data) {
        if (!data) return;

        // Clear existing content
        this.contentContainer.removeChildren();

        let y = 0;
        const itemHeight = 25;

        // LM Studio
        if (data.lm_studio) {
            const lmText = new PIXI.Text(`LM Studio: ${data.lm_studio.connected ? 'Connected' : 'Disconnected'} (${data.lm_studio.latency}ms)`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: data.lm_studio.connected ? this.config.successColor : this.config.errorColor
            });
            lmText.position.set(0, y);
            this.contentContainer.addChild(lmText);
            y += itemHeight;
        }

        // MCP Server
        if (data.mcp_server) {
            const mcpText = new PIXI.Text(`MCP Server: ${data.mcp_server.running ? 'Running' : 'Stopped'} (${Math.floor(data.mcp_server.uptime / 60)}m uptime)`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: data.mcp_server.running ? this.config.successColor : this.config.errorColor
            });
            mcpText.position.set(0, y);
            this.contentContainer.addChild(mcpText);
            y += itemHeight;
        }

        // System Load
        if (data.system_load) {
            const cpuText = new PIXI.Text(`CPU: ${data.system_load.cpu}%`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: data.system_load.cpu > 80 ? this.config.errorColor : this.config.textColor
            });
            cpuText.position.set(0, y);
            this.contentContainer.addChild(cpuText);
            y += itemHeight;

            const memText = new PIXI.Text(`Memory: ${data.system_load.memory}%`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: data.system_load.memory > 80 ? this.config.errorColor : this.config.textColor
            });
            memText.position.set(0, y);
            this.contentContainer.addChild(memText);
            y += itemHeight;
        }

        // Error Rate
        if (data.error_rate !== undefined) {
            const errorText = new PIXI.Text(`Error Rate: ${(data.error_rate * 100).toFixed(2)}%`, {
                fontFamily: 'Courier New',
                fontSize: 12,
                fill: data.error_rate > 0.05 ? this.config.errorColor : this.config.successColor
            });
            errorText.position.set(0, y);
            this.contentContainer.addChild(errorText);
            y += itemHeight;
        }
    }
}

// Global export
window.WorkflowMonitor = WorkflowMonitor;