/**
 * Parallel Swarm Visual Demo Controller
 * Coordinates two VMMonitorTiles and runs the collaborative demo
 */

class SwarmVisualDemo {
    constructor() {
        this.app = null;
        this.vm1Tile = null;
        this.vm2Tile = null;
        this.running = false;

        // WebSocket connections
        this.a2aSocket = null;

        // Configuration
        this.config = {
            vm1: { port: 8765, vnc: '127.0.0.1:0', title: 'Researcher (Firefox)' },
            vm2: { port: 8768, vnc: '127.0.0.1:1', title: 'Producer (Shotcut)' },
            a2a: { port: 8766 }
        };
    }

    async initialize() {
        log('system', 'Initializing Parallel Swarm Demo...');

        // Create PixiJS application
        this.app = new PIXI.Application();
        await this.app.init({
            width: window.innerWidth,
            height: window.innerHeight - 120,
            backgroundColor: 0x0a0a1a,
            antialias: true
        });

        document.getElementById('app-container').appendChild(this.app.canvas);

        // Create VM Monitor Tiles
        this.createVMTiles();

        // Connect to A2A Router
        this.connectA2A();

        // Setup controls
        this.setupControls();

        log('system', 'Demo ready. Click "Start Demo" to begin.');
    }

    createVMTiles() {
        // VM1 - Researcher (Firefox) - Left side
        if (typeof VMMonitorTile !== 'undefined') {
            this.vm1Tile = new VMMonitorTile(
                this.config.vm1.title,
                50,  // x
                50,  // y
                580, // width
                420, // height
                { wsUrl: `ws://localhost:${this.config.vm1.port}` }
            );
            this.app.stage.addChild(this.vm1Tile);

            // VM2 - Producer (Shotcut) - Right side
            this.vm2Tile = new VMMonitorTile(
                this.config.vm2.title,
                680, // x
                50,  // y
                580, // width
                420, // height
                { wsUrl: `ws://localhost:${this.config.vm2.port}` }
            );
            this.app.stage.addChild(this.vm2Tile);

            log('system', 'VM Monitor Tiles created');
        } else {
            log('system', 'Warning: VMMonitorTile class not found');
        }
    }

    connectA2A() {
        try {
            this.a2aSocket = new WebSocket(`ws://localhost:${this.config.a2a.port}`, ['a2a']);

            this.a2aSocket.onopen = () => {
                document.getElementById('a2a-status').classList.add('online');
                log('system', 'Connected to A2A Router');
            };

            this.a2aSocket.onclose = () => {
                document.getElementById('a2a-status').classList.remove('online');
                log('system', 'Disconnected from A2A Router');
            };

            this.a2aSocket.onmessage = (event) => {
                const msg = JSON.parse(event.data);
                this.handleA2AMessage(msg);
            };

            this.a2aSocket.onerror = (err) => {
                log('system', 'A2A Router connection error');
            };
        } catch (e) {
            log('system', 'Failed to connect to A2A Router: ' + e.message);
        }
    }

    handleA2AMessage(msg) {
        if (msg.type === 'broadcast') {
            const fromAgent = msg.from_agent;
            const msgType = msg.message_type;

            if (fromAgent === '1') {
                log('researcher', `Broadcasting: ${msgType}`);
            } else if (fromAgent === '2') {
                log('producer', `Received: ${msgType}`);
            }
        }
    }

    setupControls() {
        document.getElementById('btn-start').onclick = () => this.startDemo();
        document.getElementById('btn-reset').onclick = () => this.resetDemo();
    }

    async startDemo() {
        if (this.running) return;
        this.running = true;

        document.getElementById('btn-start').disabled = true;
        document.getElementById('btn-reset').disabled = false;

        log('system', '=== Starting Parallel Swarm Demo ===');

        // Register demo coordinator with A2A
        if (this.a2aSocket && this.a2aSocket.readyState === WebSocket.OPEN) {
            this.a2aSocket.send(JSON.stringify({
                type: 'register',
                agent_id: 'demo-coordinator',
                agent_type: 'coordinator'
            }));
        }

        log('researcher', 'Searching for asset in Firefox...');
        await this.delay(2000);

        log('researcher', 'Found slogan: "The Screen is the Hard Drive"');
        await this.delay(1000);

        // Simulate broadcast
        if (this.a2aSocket && this.a2aSocket.readyState === WebSocket.OPEN) {
            this.a2aSocket.send(JSON.stringify({
                type: 'broadcast',
                from_agent: '1',
                message_type: 'asset_found',
                payload: { slogan: 'The Screen is the Hard Drive' }
            }));
        }

        log('producer', 'Waiting for asset...');
        await this.delay(1500);

        log('producer', 'Received slogan from Researcher');
        await this.delay(1000);

        log('producer', 'Typing slogan into Shotcut project...');
        await this.delay(2000);

        log('system', '=== Demo Complete ===');
        this.running = false;
    }

    resetDemo() {
        this.running = false;
        document.getElementById('btn-start').disabled = false;
        document.getElementById('btn-reset').disabled = true;
        document.getElementById('log-panel').innerHTML = '';
        log('system', 'Demo reset. Ready to start.');
    }

    delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Global logging function
function log(agent, message) {
    const panel = document.getElementById('log-panel');
    if (!panel) return;

    const entry = document.createElement('div');
    entry.className = `log-entry ${agent}`;
    const time = new Date().toLocaleTimeString();
    entry.innerHTML = `<span style="opacity:0.5">[${time}]</span> ${message}`;
    panel.appendChild(entry);
    panel.scrollTop = panel.scrollHeight;
}

// Initialize on load
window.onload = async () => {
    const demo = new SwarmVisualDemo();
    window.swarmDemo = demo;
    await demo.initialize();
};
