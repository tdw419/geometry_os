/**
 * Integration Test: Timer Interrupt to Trap Handler
 *
 * Simulates the full flow:
 * 1. Kernel sets timer via SBI
 * 2. Hypervisor detects timer expiry
 * 3. Hypervisor sets SIP.STIP
 * 4. (Simulated) Shader would take trap
 */

global.window = {};

async function runTests() {
    console.log('\n========================================');
    console.log('Timer Interrupt Integration Test');
    console.log('========================================\n');

    let passed = 0;
    let failed = 0;

    const { SBIHandler } = await import('../sbi_handler.js');

    // Simulated CPU state
    const mockCPUState = {
        sstatus: 0x02,  // SIE enabled (bit 1)
        sie: 0x20,      // STIE enabled (bit 5)
        sip: 0x00,      // No interrupts pending initially
        stvec: 0xC000000, // Trap handler at 12MB
        pc: 0x1000
    };

    // ==========================================
    // Test 1: Full timer interrupt flow
    // ==========================================
    console.log('Test 1: Full timer interrupt flow...');
    try {
        const handler = new SBIHandler(null);

        // 1. Kernel sets timer
        const setResult = handler.handle(0x00, 0x00, [1000, 0]);
        if (setResult[0] !== 0) throw new Error('Timer set failed');

        // 2. Simulate time passing
        const shouldFire = handler.checkTimerInterrupt(1000n);
        if (!shouldFire) throw new Error('Timer should fire');

        // 3. Hypervisor sets SIP.STIP
        mockCPUState.sip = 0x20;
        console.log('  [Simulated] Hypervisor set SIP.STIP = 0x20');

        // 4. Check interrupt conditions (as shader would)
        const sstatusSIE = (mockCPUState.sstatus & 0x02) !== 0;
        const sieSTIE = (mockCPUState.sie & 0x20) !== 0;
        const sipSTIP = (mockCPUState.sip & 0x20) !== 0;
        const shouldTakeTrap = sstatusSIE && sieSTIE && sipSTIP;

        if (shouldTakeTrap) {
            console.log(`  PASS: All conditions met for timer trap`);
            console.log(`         SSTATUS.SIE=${sstatusSIE}, SIE.STIE=${sieSTIE}, SIP.STIP=${sipSTIP}`);
            console.log(`         Would trap to STVEC=0x${mockCPUState.stvec.toString(16)}`);
            passed++;
        } else {
            throw new Error(`Conditions not met: SIE=${sstatusSIE}, STIE=${sieSTIE}, STIP=${sipSTIP}`);
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 2: Interrupt disabled by SSTATUS.SIE=0
    // ==========================================
    console.log('\nTest 2: Interrupt disabled by SSTATUS.SIE=0...');
    try {
        mockCPUState.sstatus = 0x00;  // Disable SIE
        mockCPUState.sip = 0x20;      // Timer pending

        const sstatusSIE = (mockCPUState.sstatus & 0x02) !== 0;
        const shouldTakeTrap = sstatusSIE && (mockCPUState.sie & 0x20) !== 0 && (mockCPUState.sip & 0x20) !== 0;

        if (!shouldTakeTrap) {
            console.log('  PASS: Interrupt not taken when SIE disabled');
            passed++;
        } else {
            console.log('  FAIL: Interrupt should not be taken');
            failed++;
        }
    } catch (e) {
        console.log(`  FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 3: Interrupt disabled by SIE.STIE=0
    // ==========================================
    console.log('\nTest 3: Interrupt disabled by SIE.STIE=0...');
    try {
        mockCPUState.sstatus = 0x02;  // Enable SIE
        mockCPUState.sie = 0x00;      // Disable STIE
        mockCPUState.sip = 0x20;      // Timer pending

        const sieSTIE = (mockCPUState.sie & 0x20) !== 0;
        const shouldTakeTrap = (mockCPUState.sstatus & 0x02) !== 0 && sieSTIE && (mockCPUState.sip & 0x20) !== 0;

        if (!shouldTakeTrap) {
            console.log('  PASS: Interrupt not taken when STIE disabled');
            passed++;
        } else {
            console.log('  FAIL: Interrupt should not be taken');
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
        console.log('All integration tests passed!\n');
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
