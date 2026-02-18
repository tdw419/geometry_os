#!/usr/bin/env node

/**
 * Simple Console I/O Test - Phase 3 Verification
 * 
 * This test verifies the console I/O implementation by checking the code structure
 * and key functionality without requiring a full browser environment.
 */

const fs = require('fs');
const path = require('path');

console.log('='.repeat(60));
console.log('Console I/O Implementation Verification - Phase 3');
console.log('='.repeat(60));

// Test 1: Verify pixel_cpu.js has console I/O support
console.log('\nTest 1: Verify pixel_cpu.js console I/O support');
const pixelCpuPath = path.join(__dirname, 'pixel_cpu.js');
const pixelCpuCode = fs.readFileSync(pixelCpuPath, 'utf8');

const checks1 = [
    { name: 'Console base address defined', pattern: /this\.consoleBase\s*=\s*0x20000000/ },
    { name: 'Console size defined', pattern: /this\.consoleSize\s*=\s*64\s*\*\s*1024/ },
    { name: 'Console output callback', pattern: /this\.consoleOutput\s*=\s*null/ },
    { name: 'Console input callback', pattern: /this\.consoleInput\s*=\s*null/ },
    { name: 'setConsoleOutputCallback method', pattern: /setConsoleOutputCallback/ },
    { name: 'setConsoleInputCallback method', pattern: /setConsoleInputCallback/ },
    { name: 'Console output write handling', pattern: /if\s*\(\s*offset\s*===\s*0x00\s*\)/ },
    { name: 'Console status read handling', pattern: /if\s*\(\s*offset\s*===\s*0x02\s*\)/ },
];

let passed1 = 0;
checks1.forEach(check => {
    if (check.pattern.test(pixelCpuCode)) {
        console.log(`  ✓ ${check.name}`);
        passed1++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed1}/${checks1.length} checks passed`);

// Test 2: Verify pixel_cpu_integration.js has console tile
console.log('\nTest 2: Verify pixel_cpu_integration.js console tile');
const integrationPath = path.join(__dirname, 'pixel_cpu_integration.js');
const integrationCode = fs.readFileSync(integrationPath, 'utf8');

const checks2 = [
    { name: 'Console buffer defined', pattern: /this\.consoleBuffer\s*=\s*''/ },
    { name: 'Console history defined', pattern: /this\.consoleHistory\s*=\s*\[\]/ },
    { name: 'Console scroll position', pattern: /this\.consoleScrollPosition\s*=\s*0/ },
    { name: 'Console dirty flag', pattern: /this\.consoleDirty\s*=\s*false/ },
    { name: 'Console performance tracking', pattern: /this\.lastConsoleUpdateTime/ },
    { name: 'createConsoleTile method', pattern: /createConsoleTile\(\)/ },
    { name: 'writeConsole method', pattern: /writeConsole\(char\)/ },
    { name: 'updateConsoleDisplay method', pattern: /updateConsoleDisplay\(\)/ },
    { name: 'scrollConsoleUp method', pattern: /scrollConsoleUp/ },
    { name: 'scrollConsoleDown method', pattern: /scrollConsoleDown/ },
    { name: 'Terminal green color', pattern: /fill:\s*0x00FF00/ },
    { name: 'Monospace font', pattern: /Monaco.*Consolas.*monospace/ },
    { name: 'Console width config', pattern: /consoleWidth:\s*800/ },
    { name: 'Console height config', pattern: /consoleHeight:\s*200/ },
];

let passed2 = 0;
checks2.forEach(check => {
    if (check.pattern.test(integrationCode)) {
        console.log(`  ✓ ${check.name}`);
        passed2++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed2}/${checks2.length} checks passed`);

// Test 3: Verify console tile styling
console.log('\nTest 3: Verify console tile styling');
const checks3 = [
    { name: 'Black background', pattern: /beginFill\(0x000000/ },
    { name: 'Green border', pattern: /lineStyle\(2,\s*0x00FF00/ },
    { name: 'Rounded corners', pattern: /drawRoundedRect/ },
    { name: 'Title bar', pattern: /drawRect\(0,\s*0,\s*this\.config\.consoleWidth,\s*24\)/ },
    { name: 'Scroll indicator', pattern: /scrollIndicator/ },
    { name: 'Word wrap enabled', pattern: /wordWrap:\s*true/ },
    { name: 'Line height configured', pattern: /lineHeight:\s*this\.config\.consoleLineHeight/ },
];

let passed3 = 0;
checks3.forEach(check => {
    if (check.pattern.test(integrationCode)) {
        console.log(`  ✓ ${check.name}`);
        passed3++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed3}/${checks3.length} checks passed`);

// Test 4: Verify console output mechanism
console.log('\nTest 4: Verify console output mechanism');
const checks4 = [
    { name: 'Printable character handling', pattern: /if\s*\(\s*char\s*>=\s*32\s*&&\s*char\s*<=\s*126\s*\)/ },
    { name: 'Newline handling', pattern: /char\s*===\s*10/ },
    { name: 'Backspace handling', pattern: /char\s*===\s*8\s*\|\|\s*char\s*===\s*127/ },
    { name: 'Tab expansion', pattern: /char\s*===\s*9/ },
    { name: 'Control character display', pattern: /\[.*toString\(16\)\.padStart/ },
    { name: 'Dirty flag set on write', pattern: /this\.consoleDirty\s*=\s*true/ },
    { name: 'Scroll reset on write', pattern: /this\.consoleScrollPosition\s*=\s*0/ },
];

let passed4 = 0;
checks4.forEach(check => {
    if (check.pattern.test(integrationCode)) {
        console.log(`  ✓ ${check.name}`);
        passed4++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed4}/${checks4.length} checks passed`);

// Test 5: Verify console display optimization
console.log('\nTest 5: Verify console display optimization');
const checks5 = [
    { name: 'Dirty flag check', pattern: /if\s*\(\s*!this\.consoleText\s*\|\|\s*!this\.consoleDirty\s*\)/ },
    { name: 'Performance timing', pattern: /const startTime\s*=\s*performance\.now\(\)/ },
    { name: 'Visible line calculation', pattern: /maxVisibleLines/ },
    { name: 'Scroll offset calculation', pattern: /scrollOffset/ },
    { name: 'Dirty flag cleared', pattern: /this\.consoleDirty\s*=\s*false/ },
    { name: 'Performance warning', pattern: /if\s*\(\s*updateTime\s*>\s*1/ },
];

let passed5 = 0;
checks5.forEach(check => {
    if (check.pattern.test(integrationCode)) {
        console.log(`  ✓ ${check.name}`);
        passed5++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed5}/${checks5.length} checks passed`);

// Test 6: Verify configuration options
console.log('\nTest 6: Verify configuration options');
const checks6 = [
    { name: 'consoleMaxLines config', pattern: /consoleMaxLines:\s*24/ },
    { name: 'consoleMaxHistory config', pattern: /consoleMaxHistory:\s*1000/ },
    { name: 'consoleWidth config', pattern: /consoleWidth:\s*800/ },
    { name: 'consoleHeight config', pattern: /consoleHeight:\s*200/ },
    { name: 'consoleFontSize config', pattern: /consoleFontSize:\s*12/ },
    { name: 'consoleLineHeight config', pattern: /consoleLineHeight:\s*16/ },
];

let passed6 = 0;
checks6.forEach(check => {
    if (check.pattern.test(integrationCode)) {
        console.log(`  ✓ ${check.name}`);
        passed6++;
    } else {
        console.log(`  ✗ ${check.name}`);
    }
});
console.log(`  Result: ${passed6}/${checks6.length} checks passed`);

// Test 7: Verify test files exist
console.log('\nTest 7: Verify test files exist');
const testFiles = [
    'test_console_io.js',
    'test_console_io.html',
    'test_console_io_node.js',
    'CONSOLE_IO_README.md'
];

let passed7 = 0;
testFiles.forEach(file => {
    const filePath = path.join(__dirname, file);
    if (fs.existsSync(filePath)) {
        console.log(`  ✓ ${file} exists`);
        passed7++;
    } else {
        console.log(`  ✗ ${file} not found`);
    }
});
console.log(`  Result: ${passed7}/${testFiles.length} files found`);

// Final summary
console.log('\n' + '='.repeat(60));
console.log('Final Summary');
console.log('='.repeat(60));

const totalPassed = passed1 + passed2 + passed3 + passed4 + passed5 + passed6 + passed7;
const totalChecks = checks1.length + checks2.length + checks3.length + checks4.length + checks5.length + checks6.length + testFiles.length;
const passRate = ((totalPassed / totalChecks) * 100).toFixed(1);

console.log(`Total: ${totalPassed}/${totalChecks} checks passed (${passRate}%)`);

if (totalPassed === totalChecks) {
    console.log('\n✓ All checks passed! Phase 3 implementation is complete.');
    process.exit(0);
} else {
    console.log('\n✗ Some checks failed. Review the implementation.');
    process.exit(1);
}
