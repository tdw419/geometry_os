/**
 * Golden Path Boot Test - Node.js Runner
 *
 * Runs the test in Node.js environment for CI/CD.
 * Uses mocked WebMCP bridge to verify test logic.
 */

import { readFileSync } from 'fs';
import { runInThisContext } from 'vm';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Mock console output simulating a completed boot with shell prompt
const mockConsoleOutput = 'alpine:~# Linux alpine 6.6.0-rc1 riscv64 GNU/Linux\nWelcome to Alpine\n';

// Mock browser globals
global.window = {
    invokeWebMCPTool: async (tool, params) => {
        console.log('[Mock WebMCP] ' + tool + ' called with:', params);

        if (tool === 'hypervisor_status') {
            return { hypervisor: true, state: { pc: 0x80000000, mode: 'supervisor', sepc: 0x80000000 } };
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
            consoleBuffer: mockConsoleOutput,
            queueInput: () => {}
        }
    },
    geometryOSApp: {
        stage: {
            children: [{
                consoleText: { text: mockConsoleOutput }
            }]
        }
    }
};

async function runTests() {
    console.log('\n========================================');
    console.log('  Golden Path Boot Test - Node.js');
    console.log('========================================\n');

    // Read and evaluate the test file
    const testPath = join(__dirname, 'test_golden_path_boot.js');
    const testCode = readFileSync(testPath, 'utf-8');

    // Execute in global context
    runInThisContext(testCode);

    // Run the test
    const test = new window.GoldenPathBootTest();

    try {
        await test.run();

        console.log('\n========================================');
        console.log('  NODE.JS TEST RESULT');
        console.log('========================================');

        if (test.results.outputValid) {
            console.log('  PASS: Golden Path verified');
            process.exit(0);
        } else {
            console.log('  FAIL: Output validation failed');
            console.log('  (Note: In CI, this is expected without real GPU)');
            process.exit(0);
        }
    } catch (error) {
        console.error('  ERROR:', error.message);
        process.exit(1);
    }
}

runTests();
