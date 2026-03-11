/**
 * Tests for HealthPanel (Visual Dashboard - Task 4)
 */

class HealthPanelTests {
    constructor() {
        this.name = 'HealthPanel Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
        this.container = null;
    }

    async execute() {
        console.log(`\n Running ${this.name}...`);

        await this.testInitialization();
        await this.testMetricUpdate();
        await this.testAlertNotification();

        this.printResults();
        return this.failed === 0;
    }

    _setupContainer() {
        this._cleanup();
        this.container = document.createElement('div');
        this.container.id = 'test-health-panel-container';
        document.body.appendChild(this.container);
        return this.container;
    }

    _cleanup() {
        if (this.container && this.container.parentNode) {
            this.container.parentNode.removeChild(this.container);
        }
        this.container = null;
    }

    async testInitialization() {
        console.log('  Test 1: HealthPanel initialization...');
        const container = this._setupContainer();
        try {
            if (typeof HealthPanel === 'undefined') throw new Error('HealthPanel not available');
            const panel = new HealthPanel(container);
            
            if (!container.querySelector('.health-panel')) {
                throw new Error('Panel element not added to container');
            }
            
            this.passed++;
            this.results.push({ name: 'Initialization', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Initialization', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        } finally {
            this._cleanup();
        }
    }

    async testMetricUpdate() {
        console.log('  Test 2: Metric updates...');
        const container = this._setupContainer();
        try {
            const panel = new HealthPanel(container);
            panel.updateMetrics({
                nodes: 5,
                agents: 120,
                tasks: 450
            });
            
            const nodesVal = container.querySelector('.metric-nodes .value').textContent;
            if (String(nodesVal) !== '5') throw new Error(`Expected 5 nodes, got ${nodesVal}`);
            
            this.passed++;
            this.results.push({ name: 'Metric update', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Metric update', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        } finally {
            this._cleanup();
        }
    }

    async testAlertNotification() {
        console.log('  Test 3: Alert notification...');
        const container = this._setupContainer();
        try {
            const panel = new HealthPanel(container);
            panel.showAlert('Node failure detected!', 'error');
            
            const alert = container.querySelector('.alert.error');
            if (!alert) throw new Error('Alert element not found');
            if (alert.textContent !== 'Node failure detected!') throw new Error('Incorrect alert text');
            
            this.passed++;
            this.results.push({ name: 'Alert notification', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Alert notification', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        } finally {
            this._cleanup();
        }
    }

    printResults() {
        console.log(`\n${this.name} Results:`);
        console.log(`  Passed: ${this.passed}`);
        console.log(`  Failed: ${this.failed}`);
        console.log(`  Total:  ${this.passed + this.failed}`);
    }
}

if (typeof window !== 'undefined') window.HealthPanelTests = HealthPanelTests;
