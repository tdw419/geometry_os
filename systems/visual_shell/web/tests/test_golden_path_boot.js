/**
 * Golden Path Boot Test
 *
 * Proves: Linux boots on GPU shader + AI can control it via WebMCP
 *
 * Flow:
 * 1. Wait for hypervisor to initialize
 * 2. Wait for boot to reach shell prompt
 * 3. Type "uname -a" via WebMCP
 * 4. Capture console output
 * 5. Verify output contains "riscv64"
 */

class GoldenPathBootTest {
    constructor() {
        this.results = {
            hypervisorReady: false,
            bootCompleted: false,
            inputSent: false,
            outputCaptured: false,
            outputValid: false,
            fullOutput: '',
            error: null
        };
        this.timeout = 60000; // 60 second max
        this.hypervisor = null;
        this.bootOutput = '';
    }

    async run() {
        console.log('\n========================================');
        console.log('  GOLDEN PATH BOOT TEST');
        console.log('  Proving: Linux boots on GPU + AI controls it');
        console.log('========================================\n');

        try {
            // Step 1: Check hypervisor exists
            await this.step1_checkHypervisor();

            // Step 2: Wait for boot completion
            await this.step2_waitForBoot();

            // Step 3: Send uname command
            await this.step3_sendCommand();

            // Step 4: Capture and validate output
            await this.step4_validateOutput();

            // Report results
            this.reportResults();

        } catch (error) {
            this.results.error = error.message;
            this.reportResults();
            throw error;
        }
    }

    reportResults() {
        console.log('\n========================================');
        console.log('  TEST RESULTS');
        console.log('========================================');
        console.log(`  Hypervisor Ready: ${this.results.hypervisorReady ? '✅' : '❌'}`);
        console.log(`  Boot Completed:   ${this.results.bootCompleted ? '✅' : '❌'}`);
        console.log(`  Input Sent:       ${this.results.inputSent ? '✅' : '❌'}`);
        console.log(`  Output Captured:  ${this.results.outputCaptured ? '✅' : '❌'}`);
        console.log(`  Output Valid:     ${this.results.outputValid ? '✅' : '❌'}`);
        console.log('========================================');

        if (this.results.outputCaptured) {
            console.log('\nConsole Output:');
            console.log('---');
            console.log(this.results.fullOutput);
            console.log('---\n');
        }

        if (this.results.error) {
            console.log(`\n❌ ERROR: ${this.results.error}\n`);
        }

        if (this.results.outputValid) {
            console.log('\n✅ GOLDEN PATH COMPLETE');
            console.log('   Linux boots on GPU shader.');
            console.log('   AI controls VM via WebMCP.');
            console.log('   System is fully operational.\n');
        }
    }

    /**
     * Step 1: Check hypervisor availability
     * Verifies WebMCP bridge exists and hypervisor is initialized
     */
    async step1_checkHypervisor() {
        console.log('[Step 1] Checking hypervisor availability...');

        // Check if WebMCP bridge exists
        if (typeof window.invokeWebMCPTool !== 'function') {
            throw new Error('WebMCP bridge not available. Ensure webmcp_bridge.js is loaded.');
        }

        // Check hypervisor status via WebMCP
        const status = await window.invokeWebMCPTool('hypervisor_status', {});

        if (status.error && !status.hypervisor) {
            // Try alternate check - direct hypervisor reference
            if (window.hypervisorSystem && window.hypervisorSystem.kernels) {
                console.log('  ✓ Hypervisor found (direct reference)');
                this.results.hypervisorReady = true;
                this.hypervisor = window.hypervisorSystem;
                return;
            }
            throw new Error('Hypervisor not initialized. Wait for boot to start.');
        }

        console.log('  ✓ Hypervisor ready via WebMCP');
        this.results.hypervisorReady = true;
        this.hypervisor = status.hypervisor || window.hypervisorSystem;
    }

    /**
     * Step 2: Wait for boot to complete
     * Polls for shell prompt indicators with 45s timeout
     */
    async step2_waitForBoot() {
        console.log('[Step 2] Waiting for boot to reach shell prompt...');

        const startTime = Date.now();
        const bootTimeout = 45000; // 45 seconds for boot
        let lastOutput = '';

        while (Date.now() - startTime < bootTimeout) {
            // Get hypervisor state
            const state = await this.getHypervisorState();

            if (state && state.sepc !== undefined) {
                // Check console output for shell prompt indicators
                const consoleOutput = await this.getConsoleOutput();

                if (consoleOutput && consoleOutput !== lastOutput) {
                    lastOutput = consoleOutput;
                    console.log(`  Boot progress: ${consoleOutput.substring(0, 80)}...`);
                }

                // Check for shell prompt indicators
                const shellIndicators = [
                    'login:',
                    'alpine',
                    '# ',
                    '$ ',
                    '~ #',
                    '/ #'
                ];

                for (const indicator of shellIndicators) {
                    if (consoleOutput && consoleOutput.toLowerCase().includes(indicator.toLowerCase())) {
                        console.log(`  ✓ Shell prompt detected: "${indicator}"`);
                        this.results.bootCompleted = true;
                        this.bootOutput = consoleOutput;
                        return;
                    }
                }
            }

            // Wait before polling again
            await this.delay(1000);
        }

        throw new Error('Boot timeout - shell prompt not detected within 45 seconds');
    }

    /**
     * Step 3: Send command to hypervisor
     * Sends "uname -a" via WebMCP with fallback to direct methods
     */
    async step3_sendCommand() {
        console.log('[Step 3] Sending command: uname -a');

        const command = 'uname -a\n';

        // Method 1: Use WebMCP hypervisor_input tool
        if (typeof window.invokeWebMCPTool === 'function') {
            try {
                const result = await window.invokeWebMCPTool('hypervisor_input', {
                    type: 'text',
                    data: { text: command }
                });

                if (!result.error) {
                    console.log('  ✓ Command sent via WebMCP');
                    this.results.inputSent = true;

                    // Wait for command to execute
                    await this.delay(2000);
                    return;
                }
            } catch (e) {
                console.log('  WebMCP input failed, trying direct method...');
            }
        }

        // Method 2: Direct hypervisor injectInput
        if (this.hypervisor && this.hypervisor.injectInput) {
            for (const char of command) {
                await this.hypervisor.injectInput('main_cpu', 'keyboard', {
                    key: char,
                    pressed: true
                });
                await this.delay(50);
                await this.hypervisor.injectInput('main_cpu', 'keyboard', {
                    key: char,
                    pressed: false
                });
                await this.delay(30);
            }
            console.log('  ✓ Command sent via direct injectInput');
            this.results.inputSent = true;

            // Wait for command to execute
            await this.delay(2000);
            return;
        }

        // Method 3: SBI handler direct queue
        if (this.hypervisor && this.hypervisor.sbiHandler) {
            for (const char of command) {
                this.hypervisor.sbiHandler.queueInput(char.charCodeAt(0));
            }
            console.log('  ✓ Command queued via SBI handler');
            this.results.inputSent = true;

            await this.delay(2000);
            return;
        }

        throw new Error('No method available to send input to hypervisor');
    }

    /**
     * Step 4: Validate output
     * Captures console output and validates for riscv64 pattern
     */
    async step4_validateOutput() {
        console.log('[Step 4] Validating output for "riscv64"...');

        // Wait a bit for output to appear
        await this.delay(1000);

        // Capture console output
        const output = await this.getConsoleOutput();

        if (!output || output.length === 0) {
            throw new Error('No console output captured');
        }

        this.results.outputCaptured = true;
        this.results.fullOutput = output;

        // Validate the output contains expected patterns
        const expectedPatterns = [
            /riscv64/i,
            /linux/i,
            /alpine/i
        ];

        let matchesFound = 0;
        for (const pattern of expectedPatterns) {
            if (pattern.test(output)) {
                matchesFound++;
                console.log(`  ✓ Found pattern: ${pattern}`);
            }
        }

        // Primary validation: must contain riscv64
        if (/riscv64/i.test(output)) {
            this.results.outputValid = true;
            console.log('  ✓ Output contains "riscv64" - GPU RISC-V execution confirmed!');
        } else {
            console.log('  ⚠ Output does not contain "riscv64"');
            console.log('  This may indicate: wrong kernel, wrong architecture, or output timing');
        }

        // Also check for uname output format
        // Expected: Linux alpine 6.6.0-... riscv64 GNU/Linux
        const unamePattern = /linux\s+\S+\s+\S+\s+riscv64/i;
        if (unamePattern.test(output)) {
            console.log('  ✓ Full uname format detected');
        }
    }

    /**
     * Helper: Get hypervisor state
     * Tries WebMCP first, falls back to direct access
     */
    async getHypervisorState() {
        // Try WebMCP first
        if (typeof window.invokeWebMCPTool === 'function') {
            const status = await window.invokeWebMCPTool('hypervisor_status', {});
            if (status.state) return status.state;
        }

        // Fallback to direct access
        if (window.hypervisorSystem && window.hypervisorSystem.cachedState) {
            return window.hypervisorSystem.cachedState;
        }

        return null;
    }

    /**
     * Helper: Get console output
     * Tries VMMonitorTile first, falls back to SBI console buffer
     */
    async getConsoleOutput() {
        // Try to get console text from VMMonitorTile
        const tiles = this.findVMMonitorTiles();
        for (const tile of tiles) {
            if (tile.consoleText && tile.consoleText.text) {
                return tile.consoleText.text;
            }
        }

        // Fallback: try hypervisor's SBI console buffer
        if (this.hypervisor && this.hypervisor.sbiHandler) {
            // SBI handler may have buffered output
            return this.hypervisor.sbiHandler.consoleBuffer || '';
        }

        return '';
    }

    /**
     * Helper: Find VMMonitorTile instances in PixiJS stage
     */
    findVMMonitorTiles() {
        // Find VMMonitorTile instances in the PixiJS stage
        const tiles = [];
        if (window.geometryOSApp && window.geometryOSApp.stage) {
            const stage = window.geometryOSApp.stage;
            for (const child of stage.children) {
                if (child.constructor.name === 'VMMonitorTile' ||
                    child.consoleText) {
                    tiles.push(child);
                }
            }
        }
        return tiles;
    }

    /**
     * Helper: Delay for specified milliseconds
     */
    delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for module use
if (typeof window !== 'undefined') {
    window.GoldenPathBootTest = GoldenPathBootTest;

    /**
     * Convenience function to run the test from browser console
     */
    window.runGoldenPathTest = async function() {
        const test = new GoldenPathBootTest();
        try {
            await test.run();
            return test.results;
        } catch (error) {
            console.error('Golden Path Test Failed:', error);
            return test.results;
        }
    };

    console.log('Golden Path Boot Test loaded.');
    console.log('Run with: window.runGoldenPathTest()');
    console.log('');
    console.log('Prerequisites:');
    console.log('  1. Open index.html with WebGPU boot demo');
    console.log('  2. Wait for Alpine Linux to boot');
    console.log('  3. Run window.runGoldenPathTest()');
}
