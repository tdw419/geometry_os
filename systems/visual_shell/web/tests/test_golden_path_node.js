/**
 * Golden Path Boot Test - Node.js Runner
 *
 * Runs the test in Node.js environment for CI/CD.
 * Uses mocked WebMCP bridge to verify test logic.
 */

// Mock browser globals
global.window = {
    invokeWebMCPTool: async (tool, params) => {
        console.log(`[Mock WebMCP] ${tool} called with:`, params);

        // Simulate responses
        if (tool === 'hypervisor_status') {
            return {
                hypervisor: true,
                state: { pc: 0x80000000, sepc: 0x80000000, mode: 'supervisor' }
            };
        }
        if (tool === 'hypervisor_input') {
            return { success: true };
        }

        return { error: 'Unknown tool' };
    },
    hypervisorSystem: {
        cachedState: { pc: 0x80000000, sepc: 0x80000000 },
        sbiHandler: {
            timerSet: true,
            consoleBuffer: 'Linux alpine 6.6.0-rc1 riscv64 GNU/Linux\nalpine:~# ',
            queueInput: () => {}
        },
        kernels: true
    },
    geometryOSApp: {
        stage: {
            children: [{
                constructor: { name: 'VMMonitorTile' },
                consoleText: { text: 'Linux alpine 6.6.0-rc1 riscv64 GNU/Linux\nalpine:~# ' }
            }]
        }
    }
};

async function runTests() {
    console.log('\n========================================');
    console.log('  Golden Path Boot Test - Node.js');
    console.log('========================================\n');

    // Import required modules
    const fs = await import('fs');
    const vm = await import('vm');
    const path = await import('path');

    // Read and evaluate the test file
    const testFilePath = './systems/visual_shell/web/tests/test_golden_path_boot.js';
    const testCode = fs.readFileSync(testFilePath, 'utf-8');

    // Execute in global context
    const script = new vm.Script(testCode);
    script.runInThisContext();

    // Run the test
    const test = new window.GoldenPathBootTest();

    try {
        await test.run();

        console.log('\n========================================');
        console.log('  NODE.JS TEST RESULT');
        console.log('========================================');

        if (test.results.outputValid) {
            console.log('  ✅ PASS: Golden Path verified');
            process.exit(0);
        } else {
            console.log('  ❌ FAIL: Output validation failed');
            console.log('  Results:', JSON.stringify(test.results, null, 2));
            process.exit(1);
        }
    } catch (error) {
        console.error('  ❌ ERROR:', error.message);
        console.error(error.stack);
        process.exit(1);
    }
}

runTests();
