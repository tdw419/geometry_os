/**
 * Geometry OS: Simple Brick Loading Verification
 *
 * Simple verification that brick files load correctly without CPU execution.
 */

const { BrickLoader } = require('./brick_loader.js');

async function verifyBrickFile(brickFile, testName) {
    console.log(`\n🧪 Verifying: ${testName}`);
    console.log(`   Brick file: ${brickFile}`);

    try {
        const loader = new BrickLoader({
            validateChecksum: true,
            onProgress: (loaded, total, percentage, status) => {
                if (percentage % 20 === 0 || status.includes('complete')) {
                    console.log(`   Progress: ${percentage}% - ${status}`);
                }
            }
        });

        const brickData = await loader.load(brickFile);

        console.log(`   ✓ Header verified:`);
        console.log(`     Magic: 0x${brickData.header.magic.toString(16).padStart(8, '0')}`);
        console.log(`     Version: ${brickData.header.version}`);
        console.log(`     Instructions: ${brickData.header.instructionCount}`);
        console.log(`     Entry point: 0x${brickData.header.entryPoint.toString(16).padStart(8, '0')}`);
        console.log(`     Checksum: 0x${brickData.header.checksum.toString(16).padStart(8, '0')}`);

        console.log(`   ✓ Instructions loaded: ${brickData.instructions.length}`);
        console.log(`   ✓ File size: ${brickData.instructions.length * 4 + 132} bytes`);

        return true;
    } catch (error) {
        console.error(`   ✗ Verification failed: ${error.message}`);
        return false;
    }
}

async function main() {
    console.log('🧪 Brick Loading Verification\n');
    console.log('='.repeat(60));

    let passed = 0;
    let failed = 0;

    const test1 = await verifyBrickFile('hello_world.brick', 'Hello World');
    if (test1) passed++; else failed++;

    const test2 = await verifyBrickFile('counter.brick', 'Counter');
    if (test2) passed++; else failed++;

    const test3 = await verifyBrickFile('arithmetic.brick', 'Arithmetic');
    if (test3) passed++; else failed++;

    console.log('\n' + '='.repeat(60));
    console.log('🧪 Verification Summary:');
    console.log(`   Passed: ${passed}`);
    console.log(`   Failed: ${failed}`);
    console.log(`   Total: ${passed + failed}`);

    if (failed === 0) {
        console.log('\n✓ All brick files loaded successfully!');
        console.log('\n📦 Phase 5: Brick File Loading - COMPLETE');
        process.exit(0);
    } else {
        console.log('\n✗ Some verifications failed!');
        process.exit(1);
    }
}

main().catch((error) => {
    console.error('Fatal error:', error);
    process.exit(1);
});
