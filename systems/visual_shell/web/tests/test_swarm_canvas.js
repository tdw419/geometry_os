/**
 * Tests for SwarmCanvas (Visual Dashboard - Task 1)
 *
 * Verifies:
 * - SwarmCanvas initialization with PixiJS
 * - Particle creation and positioning
 * - Particle state updates
 * - Render loop execution
 * - Camera pan and zoom
 */

class SwarmCanvasTests {
    constructor() {
        this.name = 'SwarmCanvas Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
        this.container = null;
    }

    async execute() {
        console.log(`
 Running ${this.name}...`);

        // Create a container for the canvas
        this._setupContainer();

        // Test 1: SwarmCanvas initialization
        await this.testInitialization();

        // Test 2: Particle creation and positioning
        await this.testParticleCreation();

        // Test 3: Particle state updates
        await this.testParticleStateUpdate();

        // Test 4: Render loop execution
        await this.testRenderLoop();

        // Test 5: Camera pan and zoom
        await this.testCameraControls();

        // Cleanup
        this._cleanup();

        this.printResults();
        return this.failed === 0;
    }

    _setupContainer() {
        this.container = document.createElement('div');
        this.container.id = 'test-swarm-canvas-container';
        this.container.style.width = '800px';
        this.container.style.height = '600px';
        document.body.appendChild(this.container);
    }

    _cleanup() {
        if (this.container && this.container.parentNode) {
            this.container.parentNode.removeChild(this.container);
        }
    }

    async testInitialization() {
        console.log('  Test 1: SwarmCanvas initialization...');

        try {
            if (typeof SwarmCanvas === 'undefined') {
                throw new Error('SwarmCanvas not available');
            }

            const canvas = new SwarmCanvas(this.container);
            await canvas.initialize();

            if (!canvas.app) {
                throw new Error('PixiJS Application not initialized');
            }

            if (!this.container.querySelector('canvas')) {
                throw new Error('Canvas element not added to container');
            }

            this.passed++;
            this.results.push({ name: 'Initialization', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Initialization', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testParticleCreation() {
        console.log('  Test 2: Particle creation and positioning...');

        try {
            const canvas = new SwarmCanvas(this.container);
            await canvas.initialize();

            const agentId = 'agent-1';
            const x = 100;
            const y = 200;
            
            canvas.addAgent(agentId, { x, y });

            const particle = canvas.getAgentParticle(agentId);
            if (!particle) {
                throw new Error('Particle not created for agent');
            }

            if (particle.x !== x || particle.y !== y) {
                throw new Error(`Expected position (${x}, ${y}), got (${particle.x}, ${particle.y})`);
            }

            this.passed++;
            this.results.push({ name: 'Particle creation', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Particle creation', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testParticleStateUpdate() {
        console.log('  Test 3: Particle state updates...');

        try {
            const canvas = new SwarmCanvas(this.container);
            await canvas.initialize();

            const agentId = 'agent-1';
            canvas.addAgent(agentId, { x: 0, y: 0, state: 'idle' });

            canvas.updateAgent(agentId, { state: 'working' });

            const particle = canvas.getAgentParticle(agentId);
            if (particle.state !== 'working') {
                throw new Error(`Expected state 'working', got '${particle.state}'`);
            }

            this.passed++;
            this.results.push({ name: 'Particle state update', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Particle state update', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testRenderLoop() {
        console.log('  Test 4: Render loop execution...');

        try {
            let framesCounted = 0;
            const canvas = new SwarmCanvas(this.container);
            
            // Wrap update before initialization
            const originalUpdate = canvas.update;
            canvas.update = function(delta) {
                framesCounted++;
                return originalUpdate.apply(this, arguments);
            };

            await canvas.initialize();

            // Wait a bit for some frames to process
            if (canvas.app.simulateFrame) {
                canvas.app.simulateFrame();
            } else {
                await new Promise(resolve => setTimeout(resolve, 100));
            }

            if (framesCounted === 0) {
                throw new Error('Render loop not running (update not called)');
            }

            this.passed++;
            this.results.push({ name: 'Render loop', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Render loop', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testCameraControls() {
        console.log('  Test 5: Camera pan and zoom...');

        try {
            const canvas = new SwarmCanvas(this.container);
            await canvas.initialize();

            const initialX = canvas.viewport.x;
            canvas.pan(10, 20);
            
            if (canvas.viewport.x === initialX) {
                throw new Error('Viewport X did not change after pan');
            }

            const initialZoom = canvas.viewport.scale.x;
            canvas.zoom(1.5);

            if (canvas.viewport.scale.x !== 1.5) {
                throw new Error(`Expected zoom 1.5, got ${canvas.viewport.scale.x}`);
            }

            this.passed++;
            this.results.push({ name: 'Camera controls', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Camera controls', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    printResults() {
        console.log(`
${this.name} Results:`);
        console.log(`  Passed: ${this.passed}`);
        console.log(`  Failed: ${this.failed}`);
        console.log(`  Total:  ${this.passed + this.failed}`);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SwarmCanvasTests = SwarmCanvasTests;
}
