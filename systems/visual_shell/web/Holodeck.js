/**
 * Holodeck.js - Visual Interface for ACE Framework
 * 
 * Renders the agent's internal cognitive state as a holographic projection
 * within the Geometry OS environment.
 */

class Holodeck {
    constructor(app) {
        this.app = app;
        this.container = new PIXI.Container();
        this.container.visible = false; // Hidden by default until active

        // Data stores
        this.thoughtTrace = [];
        this.currentPlan = null;
        this.activeTask = null;
        this.metrics = {};

        // WebSocket connection
        this.ws = null;
        this.connected = false;

        this.initializeUI();
        this.connect();
    }

    initializeUI() {
        // Main panel background (Glassmorphism)
        this.bg = new PIXI.Graphics();
        this.bg.beginFill(0x000000, 0.8);
        this.bg.lineStyle(2, 0x00FFFF, 0.5);
        this.bg.drawRoundedRect(0, 0, 800, 500, 15);
        this.bg.endFill();

        // Header
        this.header = new PIXI.Text('ACE COGNITIVE STATE // HOLODECK', {
            fontFamily: 'Courier New',
            fontSize: 18,
            fill: 0x00FFFF,
            fontWeight: 'bold'
        });
        this.header.position.set(20, 15);

        // Status indicator
        this.statusIndicator = new PIXI.Graphics();
        this.statusIndicator.beginFill(0xFF0000); // Red = disconnected
        this.statusIndicator.drawCircle(0, 0, 5);
        this.statusIndicator.endFill();
        this.statusIndicator.position.set(770, 25);

        // Content Containers
        this.thoughtContainer = new PIXI.Container();
        this.thoughtContainer.position.set(20, 60);

        this.planContainer = new PIXI.Container();
        this.planContainer.position.set(420, 60);

        this.evolutionContainer = new PIXI.Container();
        this.evolutionContainer.position.set(420, 15); // Top right next to header

        // Add to main container
        this.container.addChild(this.bg);
        this.container.addChild(this.header);
        this.container.addChild(this.statusIndicator);
        this.container.addChild(this.thoughtContainer);
        this.container.addChild(this.planContainer);
        this.container.addChild(this.evolutionContainer);

        // Position on screen (Center)
        this.container.position.set(
            (window.innerWidth - 800) / 2,
            (window.innerHeight - 500) / 2
        );

        // Interactive - Dragging
        this.container.eventMode = 'static';
        this.container.cursor = 'move';
        this.container.on('pointerdown', this.onDragStart, this);

        // Add to app
        this.app.stage.addChild(this.container);

        // Setup text styles
        this.thoughtStyle = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0xAAAAAA,
            wordWrap: true,
            wordWrapWidth: 380
        });

        this.activeThoughtStyle = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0xFFFFFF,
            wordWrap: true,
            wordWrapWidth: 380,
            fontWeight: 'bold'
        });
    }

    connect() {
        // Connect to Visual Bridge
        this.ws = new WebSocket('ws://localhost:8081');

        this.ws.onopen = () => {
            console.log('Holodeck connected to Visual Bridge');
            this.connected = true;
            this.updateStatus(true);
            this.container.visible = true; // Show when connected
        };

        this.ws.onclose = () => {
            console.log('Holodeck disconnected');
            this.connected = false;
            this.updateStatus(false);
            setTimeout(() => this.connect(), 5000); // Reconnect loop
        };

        this.ws.onmessage = (event) => {
            try {
                const message = JSON.parse(event.data);
                if (message.type === 'simulation_update') {
                    this.handleUpdate(message.data);
                }
            } catch (e) {
                console.error('Holodeck parse error:', e);
            }
        };
    }

    updateStatus(connected) {
        this.statusIndicator.clear();
        this.statusIndicator.beginFill(connected ? 0x00FF00 : 0xFF0000);
        this.statusIndicator.drawCircle(0, 0, 5);
        this.statusIndicator.endFill();

        // Holographic flicker effect on header if connected
        if (connected) {
            this.header.alpha = 1;
            // distinct flicker could be added in update loop
        } else {
            this.header.alpha = 0.5;
        }
    }

    handleUpdate(data) {
        // Update specialized views based on data source
        if (data.layer === 'cognitive_control') {
            this.addThought(data.content, data.metadata);
        } else if (data.layer === 'global_strategy') {
            this.updatePlan(data.content);
        } else if (data.layer === 'diagnostics') {
            this.updateMetrics(data.content);
        } else if (data.layer === 'evolution') {
            this.updateEvolution(data);
        }
    }

    updateEvolution(data) {
        // Log evolution events to thought stream
        if (data.content && data.metadata?.type !== 'cycle_start') {
            // Use a distinct color/prefix for evolution events
            this.addThought(`[EVO] ${data.content}`, { type: 'evolution' });
        }

        this.renderEvolutionStatus(data.state);
    }

    renderEvolutionStatus(state) {
        this.evolutionContainer.removeChildren();

        // Cycle Counter
        const cycleText = new PIXI.Text(`CYCLE: #${state.cycle || 0}`, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x00FF00
        });
        cycleText.position.set(0, 0);

        // Phase Indicator
        const phaseStr = (state.phase || 'IDLE').toUpperCase();
        const phaseText = new PIXI.Text(`PHASE: ${phaseStr}`, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xFFFF00,
            fontWeight: 'bold'
        });
        phaseText.position.set(120, 0);

        // Improvements Counter
        const dnaText = new PIXI.Text(`DNA+ ${state.improvements || 0}`, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x00FFFF
        });
        dnaText.position.set(280, 0);

        this.evolutionContainer.addChild(cycleText);
        this.evolutionContainer.addChild(phaseText);
        this.evolutionContainer.addChild(dnaText);

        // Visual indicator of phase
        const bar = new PIXI.Graphics();
        const phases = ['REFLECT', 'PLAN', 'EXECUTE', 'VERIFY', 'COMMIT'];
        const currentIdx = phases.indexOf(phaseStr);

        phases.forEach((p, i) => {
            const color = i === currentIdx ? 0xFFFF00 : 0x333333;
            bar.beginFill(color);
            bar.drawRect(i * 70, 20, 60, 4);
            bar.endFill();
        });
        this.evolutionContainer.addChild(bar);
    }

    addThought(thought, metadata) {
        // Determine color based on metadata type
        let color = 0xAAAAAA;
        if (metadata?.type === 'evolution') color = 0x00FF00;
        if (metadata?.type === 'commit') color = 0xFFD700; // Gold

        this.thoughtTrace.unshift({
            text: thought,
            time: new Date().toLocaleTimeString(),
            type: metadata?.type || 'info',
            color: color
        });

        // Keep only last 10
        if (this.thoughtTrace.length > 10) this.thoughtTrace.pop();

        this.renderThoughts();
    }

    renderThoughts() {
        this.thoughtContainer.removeChildren();

        const Title = new PIXI.Text('// COGNITIVE STREAM', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00FFFF
        });
        this.thoughtContainer.addChild(Title);

        let y = 25;
        this.thoughtTrace.forEach((t, i) => {
            const style = new PIXI.TextStyle({
                fontFamily: 'Courier New',
                fontSize: 14,
                fill: i === 0 ? 0xFFFFFF : (t.color || 0xAAAAAA),
                wordWrap: true,
                wordWrapWidth: 380,
                fontWeight: i === 0 ? 'bold' : 'normal'
            });
            const prefix = i === 0 ? '> ' : '  ';

            const text = new PIXI.Text(`${t.time} ${prefix}${t.text}`, style);
            text.position.set(0, y);
            this.thoughtContainer.addChild(text);

            y += text.height + 8;
        });
    }

    updatePlan(planData) {
        this.planContainer.removeChildren();

        const Title = new PIXI.Text('// ACTIVE STRATEGY', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0xFF00FF
        });
        this.planContainer.addChild(Title);

        if (!planData) return;

        const style = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 13,
            fill: 0xFFCCFF,
            wordWrap: true,
            wordWrapWidth: 350
        });

        const text = new PIXI.Text(JSON.stringify(planData, null, 2), style);
        text.position.set(0, 25);
        this.planContainer.addChild(text);
    }

    // Dragging logic
    onDragStart(event) {
        this.dragData = event.data;
        this.container.alpha = 0.8;
        this.dragging = true;

        this.dragOffset = this.dragData.getLocalPosition(this.container);

        this.container.on('pointerup', this.onDragEnd, this);
        this.container.on('pointerupoutside', this.onDragEnd, this);
        this.container.on('pointermove', this.onDragMove, this);
    }

    onDragEnd() {
        this.container.alpha = 1;
        this.dragging = false;
        this.dragData = null;

        this.container.off('pointerup', this.onDragEnd, this);
        this.container.off('pointerupoutside', this.onDragEnd, this);
        this.container.off('pointermove', this.onDragMove, this);
    }

    onDragMove() {
        if (this.dragging) {
            const newPosition = this.dragData.getLocalPosition(this.container.parent);
            this.container.position.x = newPosition.x - this.dragOffset.x;
            this.container.position.y = newPosition.y - this.dragOffset.y;
        }
    }
}

// Attach to window for global access
window.Holodeck = Holodeck;
