/**
 * Node.js test runner for SwarmClient
 */

const fs = require('fs');
const path = require('path');

// Mock WebSocket
global.WebSocket = class {
    constructor(url) {
        this.url = url;
        this.readyState = 0; // CONNECTING
        setTimeout(() => {
            this.readyState = 1; // OPEN
            if (this.onopen) this.onopen();
        }, 10);
    }
    send(data) { this.lastSent = data; }
    close() { 
        this.readyState = 3; // CLOSED
        if (this.onclose) this.onclose();
    }
};
global.WebSocket.OPEN = 1;

const swarmClientCode = fs.readFileSync(path.join(__dirname, '../js/swarm/SwarmClient.js'), 'utf8');
const SwarmClient = (function() {
    let window = {};
    eval(swarmClientCode);
    return window.SwarmClient;
})();
global.SwarmClient = SwarmClient;

const testCode = fs.readFileSync(path.join(__dirname, 'test_swarm_client.js'), 'utf8');
const SwarmClientTests = (function() {
    let window = {};
    eval(testCode);
    return window.SwarmClientTests;
})();
global.SwarmClientTests = SwarmClientTests;

async function runTests() {
    const tests = new SwarmClientTests();
    const success = await tests.execute();
    process.exit(success ? 0 : 1);
}

runTests();
