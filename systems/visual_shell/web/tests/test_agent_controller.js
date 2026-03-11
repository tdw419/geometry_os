/**
 * Tests for AgentController (Glass Box Introspection - Task 3)
 *
 * Tests the control action bar that provides:
 * - Relocate button: Move agent to different district
 * - Evict button: Remove agent with confirmation
 * - Debug button: Dump agent state to console
 * - Command button: Send text command to agent
 *
 * Success criteria:
 * - Create control bar with 4 buttons
 * - Emit relocate event with district prompt
 * - Emit evict event with confirmation dialog
 * - Emit debug event on click
 * - Show command input panel on command click
 */

class AgentControllerTests {
    constructor() {
        this.name = 'AgentController Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
        this.container = null;
    }

    async execute() {
        console.log(`\n Running ${this.name}...`);

        // Create a container for DOM elements
        this._setupContainer();

        // Test 1: Create control bar with 4 buttons
        await this.testCreateWithFourButtons();

        // Test 2: Emit relocate event
        await this.testRelocateEvent();

        // Test 3: Emit evict event with confirmation
        await this.testEvictEvent();

        // Test 4: Emit evict event canceled on denial
        await this.testEvictCanceled();

        // Test 5: Emit debug event
        await this.testDebugEvent();

        // Test 6: Show command input on command click
        await this.testCommandPanelShow();

        // Test 7: Hide command panel on cancel
        await this.testCommandPanelCancel();

        // Test 8: Send command
        await this.testSendCommand();

        // Test 9: Enter key sends command
        await this.testEnterKeySendsCommand();

        // Test 10: Escape key closes command panel
        await this.testEscapeKeyClosesPanel();

        // Test 11: setAgent method
        await this.testSetAgent();

        // Cleanup
        this._cleanup();

        this.printResults();
        return this.failed === 0;
    }

    _setupContainer() {
        this.container = document.createElement('div');
        this.container.id = 'test-agent-controller-container';
        document.body.appendChild(this.container);
    }

    _cleanup() {
        if (this.container && this.container.parentNode) {
            this.container.parentNode.removeChild(this.container);
        }
    }

    async testCreateWithFourButtons() {
        console.log('  Test 1: Create control bar with 4 buttons...');

        try {
            if (typeof AgentController === 'undefined') {
                throw new Error('AgentController not available');
            }

            const ctrl = new AgentController();
            this.container.appendChild(ctrl.element);

            const buttons = ctrl.element.querySelectorAll('button');
            // We expect 6 buttons total: 4 main buttons + 2 command panel buttons
            const mainButtons = ctrl.element.querySelectorAll('.control-bar button');

            if (mainButtons.length !== 4) {
                throw new Error(`Expected 4 main buttons, got ${mainButtons.length}`);
            }

            // Check button classes
            if (!ctrl.element.querySelector('.btn-relocate')) {
                throw new Error('Missing relocate button');
            }
            if (!ctrl.element.querySelector('.btn-evict')) {
                throw new Error('Missing evict button');
            }
            if (!ctrl.element.querySelector('.btn-debug')) {
                throw new Error('Missing debug button');
            }
            if (!ctrl.element.querySelector('.btn-command')) {
                throw new Error('Missing command button');
            }

            this.passed++;
            this.results.push({ name: 'Create with 4 buttons', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Create with 4 buttons', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testRelocateEvent() {
        console.log('  Test 2: Emit relocate event...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-1');
            this.container.appendChild(ctrl.element);

            let eventFired = false;
            let receivedAgentId = null;
            let receivedDistrict = null;

            ctrl.onRelocate = (agentId, district) => {
                eventFired = true;
                receivedAgentId = agentId;
                receivedDistrict = district;
            };

            // Mock prompt to return a district
            const originalPrompt = window.prompt;
            window.prompt = () => 'cognitive';

            try {
                ctrl.element.querySelector('.btn-relocate').click();

                if (!eventFired) {
                    throw new Error('Relocate event was not fired');
                }
                if (receivedAgentId !== 'test-agent-1') {
                    throw new Error(`Expected agentId 'test-agent-1', got '${receivedAgentId}'`);
                }
                if (receivedDistrict !== 'cognitive') {
                    throw new Error(`Expected district 'cognitive', got '${receivedDistrict}'`);
                }

                this.passed++;
                this.results.push({ name: 'Relocate event', status: 'PASS' });
                console.log('    PASS');
            } finally {
                window.prompt = originalPrompt;
            }
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Relocate event', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testEvictEvent() {
        console.log('  Test 3: Emit evict event with confirmation...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-2');
            this.container.appendChild(ctrl.element);

            let eventFired = false;
            let receivedAgentId = null;

            ctrl.onEvict = (agentId) => {
                eventFired = true;
                receivedAgentId = agentId;
            };

            // Mock confirm to return true
            const originalConfirm = window.confirm;
            window.confirm = () => true;

            try {
                ctrl.element.querySelector('.btn-evict').click();

                if (!eventFired) {
                    throw new Error('Evict event was not fired');
                }
                if (receivedAgentId !== 'test-agent-2') {
                    throw new Error(`Expected agentId 'test-agent-2', got '${receivedAgentId}'`);
                }

                this.passed++;
                this.results.push({ name: 'Evict event', status: 'PASS' });
                console.log('    PASS');
            } finally {
                window.confirm = originalConfirm;
            }
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Evict event', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testEvictCanceled() {
        console.log('  Test 4: Evict event canceled on denial...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-3');
            this.container.appendChild(ctrl.element);

            let eventFired = false;

            ctrl.onEvict = () => {
                eventFired = true;
            };

            // Mock confirm to return false
            const originalConfirm = window.confirm;
            window.confirm = () => false;

            try {
                ctrl.element.querySelector('.btn-evict').click();

                if (eventFired) {
                    throw new Error('Evict event should not be fired when denied');
                }

                this.passed++;
                this.results.push({ name: 'Evict canceled', status: 'PASS' });
                console.log('    PASS');
            } finally {
                window.confirm = originalConfirm;
            }
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Evict canceled', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testDebugEvent() {
        console.log('  Test 5: Emit debug event...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-4');
            this.container.appendChild(ctrl.element);

            let eventFired = false;
            let receivedAgentId = null;

            ctrl.onDebug = (agentId) => {
                eventFired = true;
                receivedAgentId = agentId;
            };

            ctrl.element.querySelector('.btn-debug').click();

            if (!eventFired) {
                throw new Error('Debug event was not fired');
            }
            if (receivedAgentId !== 'test-agent-4') {
                throw new Error(`Expected agentId 'test-agent-4', got '${receivedAgentId}'`);
            }

            this.passed++;
            this.results.push({ name: 'Debug event', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Debug event', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testCommandPanelShow() {
        console.log('  Test 6: Show command input panel...');

        try {
            const ctrl = new AgentController();
            this.container.appendChild(ctrl.element);

            const panel = ctrl.element.querySelector('.command-panel');
            if (panel.style.display !== 'none') {
                throw new Error('Command panel should be hidden initially');
            }

            ctrl.element.querySelector('.btn-command').click();

            if (panel.style.display === 'none') {
                throw new Error('Command panel should be visible after click');
            }

            // Check that input exists and is focused
            const input = ctrl.element.querySelector('.command-input');
            if (!input) {
                throw new Error('Command input not found');
            }

            this.passed++;
            this.results.push({ name: 'Command panel show', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Command panel show', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testCommandPanelCancel() {
        console.log('  Test 7: Hide command panel on cancel...');

        try {
            const ctrl = new AgentController();
            this.container.appendChild(ctrl.element);

            // Show the panel first
            ctrl.element.querySelector('.btn-command').click();
            const panel = ctrl.element.querySelector('.command-panel');

            // Click cancel button
            ctrl.element.querySelector('.btn-cancel').click();

            if (panel.style.display !== 'none') {
                throw new Error('Command panel should be hidden after cancel');
            }

            this.passed++;
            this.results.push({ name: 'Command panel cancel', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Command panel cancel', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testSendCommand() {
        console.log('  Test 8: Send command...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-5');
            this.container.appendChild(ctrl.element);

            let eventFired = false;
            let receivedAgentId = null;
            let receivedCommand = null;

            ctrl.onCommand = (agentId, command) => {
                eventFired = true;
                receivedAgentId = agentId;
                receivedCommand = command;
            };

            // Show command panel and enter a command
            ctrl.element.querySelector('.btn-command').click();
            const input = ctrl.element.querySelector('.command-input');
            input.value = 'test command';

            // Click send
            ctrl.element.querySelector('.btn-send').click();

            if (!eventFired) {
                throw new Error('Command event was not fired');
            }
            if (receivedAgentId !== 'test-agent-5') {
                throw new Error(`Expected agentId 'test-agent-5', got '${receivedAgentId}'`);
            }
            if (receivedCommand !== 'test command') {
                throw new Error(`Expected command 'test command', got '${receivedCommand}'`);
            }

            // Panel should be closed
            const panel = ctrl.element.querySelector('.command-panel');
            if (panel.style.display !== 'none') {
                throw new Error('Command panel should be hidden after send');
            }

            // Input should be cleared
            if (input.value !== '') {
                throw new Error('Command input should be cleared after send');
            }

            this.passed++;
            this.results.push({ name: 'Send command', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Send command', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testEnterKeySendsCommand() {
        console.log('  Test 9: Enter key sends command...');

        try {
            const ctrl = new AgentController();
            ctrl.setAgent('test-agent-6');
            this.container.appendChild(ctrl.element);

            let eventFired = false;

            ctrl.onCommand = () => {
                eventFired = true;
            };

            // Show command panel and enter a command
            ctrl.element.querySelector('.btn-command').click();
            const input = ctrl.element.querySelector('.command-input');
            input.value = 'enter key test';

            // Simulate Enter key
            const enterEvent = new KeyboardEvent('keydown', { key: 'Enter' });
            input.dispatchEvent(enterEvent);

            if (!eventFired) {
                throw new Error('Command event was not fired on Enter key');
            }

            this.passed++;
            this.results.push({ name: 'Enter key sends command', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Enter key sends command', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testEscapeKeyClosesPanel() {
        console.log('  Test 10: Escape key closes panel...');

        try {
            const ctrl = new AgentController();
            this.container.appendChild(ctrl.element);

            // Show command panel
            ctrl.element.querySelector('.btn-command').click();
            const panel = ctrl.element.querySelector('.command-panel');
            const input = ctrl.element.querySelector('.command-input');

            // Simulate Escape key
            const escapeEvent = new KeyboardEvent('keydown', { key: 'Escape' });
            input.dispatchEvent(escapeEvent);

            if (panel.style.display !== 'none') {
                throw new Error('Command panel should be hidden on Escape key');
            }

            this.passed++;
            this.results.push({ name: 'Escape key closes panel', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Escape key closes panel', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    async testSetAgent() {
        console.log('  Test 11: setAgent method...');

        try {
            const ctrl = new AgentController();

            // Initially null
            if (ctrl.agentId !== null) {
                throw new Error(`Expected agentId to be null initially, got ${ctrl.agentId}`);
            }

            ctrl.setAgent('test-agent-7');

            if (ctrl.agentId !== 'test-agent-7') {
                throw new Error(`Expected agentId 'test-agent-7', got ${ctrl.agentId}`);
            }

            // Test that callbacks use the set agentId
            let receivedAgentId = null;
            ctrl.onDebug = (agentId) => {
                receivedAgentId = agentId;
            };

            this.container.appendChild(ctrl.element);
            ctrl.element.querySelector('.btn-debug').click();

            if (receivedAgentId !== 'test-agent-7') {
                throw new Error(`Expected callbacks to use set agentId, got ${receivedAgentId}`);
            }

            this.passed++;
            this.results.push({ name: 'setAgent method', status: 'PASS' });
            console.log('    PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'setAgent method', status: 'FAIL', error: error.message });
            console.log(`    FAIL: ${error.message}`);
        }
    }

    printResults() {
        console.log(`\n${this.name} Results:`);
        console.log(`  Passed: ${this.passed}`);
        console.log(`  Failed: ${this.failed}`);
        console.log(`  Total:  ${this.passed + this.failed}`);

        if (this.failed > 0) {
            console.log('\nFailed tests:');
            this.results
                .filter(r => r.status === 'FAIL')
                .forEach(r => {
                    console.log(`  - ${r.name}: ${r.error}`);
                });
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.AgentControllerTests = AgentControllerTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentControllerTests;
}
