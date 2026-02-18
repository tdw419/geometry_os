/**
 * Test: RISC-V Timer Interrupt Flow
 *
 * Verifies:
 * 1. SBIHandler timer set/get functionality
 * 2. Timer interrupt checks before expiry
 * 3. Timer interrupt checks at expiry
 * 4. Timer interrupt checks after expiry
 */

// Mock browser globals
global.window = {};

class MockGPUDevice {
    constructor() {
        this.queue = {
            writeBuffer: (buffer, offset, data) => true
        };
        this.writtenValues = new Map();
    }
    createTexture(desc) {
        return { width: desc.size[0], height: desc.size[1] };
    }
}

async function runTests() {
    console.log('\n========================================');
    console.log('Timer Interrupt Flow - Test Suite');
    console.log('========================================\n');

    let passed = 0;
    let failed = 0;

    // Import modules
    const { SBIHandler } = await import('../sbi_handler.js');

    // ==========================================
    // Test 1: SBIHandler timer set/get
    // ==========================================
    console.log('Test 1: SBIHandler timer set/get...');
    try {
        const handler = new SBIHandler(null);

        // Set timer to 1000000
        const result = handler.handle(0x00, 0x00, [1000000, 0]);
        if (result[0] === 0 && handler.timerSet === true && handler.timerValue === 1000000n) {
            console.log('  PASS: Timer set correctly');
            passed++;
        } else {
            console.log(`  FAIL: Unexpected state: timerSet=${handler.timerSet}, value=${handler.timerValue}`);
            failed++;
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 2: checkTimerInterrupt returns false before expiry
    // ==========================================
    console.log('\nTest 2: checkTimerInterrupt returns false before expiry...');
    try {
        const handler = new SBIHandler(null);
        handler.handle(0x00, 0x00, [1000000, 0]); // Set timer

        const shouldFire = handler.checkTimerInterrupt(500000n);
        if (!shouldFire && handler.timerSet === true) {
            console.log('  PASS: Timer not firing before expiry');
            passed++;
        } else {
            console.log(`  FAIL: shouldFire=${shouldFire}, timerSet=${handler.timerSet}`);
            failed++;
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 3: checkTimerInterrupt returns true at expiry
    // ==========================================
    console.log('\nTest 3: checkTimerInterrupt returns true at expiry...');
    try {
        const handler = new SBIHandler(null);
        handler.handle(0x00, 0x00, [1000000, 0]); // Set timer

        const shouldFire = handler.checkTimerInterrupt(1000000n);
        if (shouldFire && handler.timerSet === false) {
            console.log('  PASS: Timer fires and clears');
            passed++;
        } else {
            console.log(`  FAIL: shouldFire=${shouldFire}, timerSet=${handler.timerSet}`);
            failed++;
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 4: checkTimerInterrupt returns true after expiry
    // ==========================================
    console.log('\nTest 4: checkTimerInterrupt returns true after expiry...');
    try {
        const handler = new SBIHandler(null);
        handler.handle(0x00, 0x00, [1000000, 0]); // Set timer

        const shouldFire = handler.checkTimerInterrupt(1500000n);
        if (shouldFire && handler.timerSet === false) {
            console.log('  PASS: Timer fires late');
            passed++;
        } else {
            console.log(`  FAIL: shouldFire=${shouldFire}, timerSet=${handler.timerSet}`);
            failed++;
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Summary
    // ==========================================
    console.log('\n========================================');
    console.log('Summary');
    console.log('========================================');
    console.log(`  Passed: ${passed}`);
    console.log(`  Failed: ${failed}`);
    console.log('========================================\n');

    if (failed === 0) {
        console.log('All tests passed!\n');
        process.exit(0);
    } else {
        console.log('Some tests failed\n');
        process.exit(1);
    }
}

runTests().catch(err => {
    console.error('Test runner error:', err);
    process.exit(1);
});
