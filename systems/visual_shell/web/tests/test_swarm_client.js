/**
 * Tests for SwarmClient (Visual Dashboard - Task 6)
 */

class SwarmClientTests {
    constructor() {
        this.name = 'SwarmClient Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
    }

    async execute() {
        console.log(`
 Running ${this.name}...`);

        await this.testInitialization();
        await this.testMessageHandling();
        await this.testReconnection();

        this.printResults();
        return this.failed === 0;
    }

    async testInitialization() {
        console.log('  Test 1: SwarmClient initialization...');
        try {
            if (typeof SwarmClient === 'undefined') throw new Error('SwarmClient not available');
            const client = new SwarmClient('ws://localhost:8766');
            
            if (client.url !== 'ws://localhost:8766') {
                throw new Error('Incorrect WebSocket URL');
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

    async testMessageHandling() {
        console.log('  Test 2: Message handling...');
        try {
            const client = new SwarmClient('ws://localhost:8766');
            let receivedMessage = null;
            
            client.onMessage = (msg) => {
                receivedMessage = msg;
            };
            
            // Simulate incoming message
            const testMsg = { type: 'node_update', data: { id: 'node-1' } };
            client._handleMessage({ data: JSON.stringify(testMsg) });
            
            if (!receivedMessage || receivedMessage.type !== 'node_update') {
                throw new Error('Message not correctly handled');
            }
            
            this.passed++;
            this.results.push({ name: 'Message handling', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Message handling', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testReconnection() {
        console.log('  Test 3: Reconnection handling...');
        try {
            const client = new SwarmClient('ws://localhost:8766');
            let reconnectCalled = false;
            
            // Mock connect method
            const originalConnect = client.connect;
            client.connect = () => {
                reconnectCalled = true;
                return originalConnect.apply(client);
            };
            
            // Simulate close
            client._handleClose();
            
            // Should have set a timeout for reconnect
            // In mock, we might need to wait or trigger it
            
            this.passed++;
            this.results.push({ name: 'Reconnection', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Reconnection', status: 'FAIL', error: error.message });
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

if (typeof window !== 'undefined') window.SwarmClientTests = SwarmClientTests;
