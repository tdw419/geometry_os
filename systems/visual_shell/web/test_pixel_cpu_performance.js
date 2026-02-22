/**
 * Phase 7: Performance Tests for Pixel CPU - PixiJS Integration
 *
 * Comprehensive performance tests and optimization targeting:
 * - 60 FPS (16.67ms per frame)
 * - <5ms CPU execution time
 * - <3ms framebuffer update time
 * - <1ms console update time
 */

// Load required modules
let SimplePixelCPU, PixelCPUIntegration;
if (typeof require !== 'undefined') {
    SimplePixelCPU = require('./pixel_cpu.js');
    PixelCPUIntegration = require('./pixel_cpu_integration.js');
}

/**
 * Performance Test Suite: CPU Execution
 * Target: <5ms per frame
 */
function testCpuExecutionPerformance() {
    console.log('\n=== Testing CPU Execution Performance (<5ms target) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Create a complex program
    const complexProgram = [];
    for (let i = 0; i < 1000; i++) {
        complexProgram.push(0x01000000); // MOV R0, R0
        complexProgram.push(0x02000001); // ADD R0, R0, R1
        complexProgram.push(0x01010001); // MOV R1, R1
    }
    complexProgram.push(0x12000000); // RET

    integration.cpu.memory = complexProgram;
    integration.running = true;

    // Execute for 60 frames (1 second at 60 FPS)
    const executionTimes = [];
    for (let i = 0; i < 60; i++) {
        const startTime = performance.now();
        integration.executeFrame();
        const executionTime = performance.now() - startTime;
        executionTimes.push(executionTime);
    }

    // Calculate statistics
    const avgTime = executionTimes.reduce((a, b) => a + b, 0) / executionTimes.length;
    const maxTime = Math.max(...executionTimes);
    const minTime = Math.min(...executionTimes);
    const medianTime = executionTimes.sort((a, b) => a - b)[Math.floor(executionTimes.length / 2)];

    console.log(`CPU Execution Performance (60 frames):`);
    console.log(`  Average: ${avgTime.toFixed(2)}ms`);
    console.log(`  Median: ${medianTime.toFixed(2)}ms`);
    console.log(`  Min: ${minTime.toFixed(2)}ms`);
    console.log(`  Max: ${maxTime.toFixed(2)}ms`);

    // Performance assertions
    console.assert(avgTime < 5, `Average CPU execution time should be <5ms (was ${avgTime.toFixed(2)}ms)`);
    console.assert(maxTime < 8, `Max CPU execution time should be <8ms (was ${maxTime.toFixed(2)}ms)`);

    // Calculate potential FPS
    const potentialFps = 1000 / avgTime;
    console.log(`  Potential FPS from CPU execution: ${potentialFps.toFixed(1)}`);

    console.log('✓ CPU execution performance tests passed');
}

/**
 * Performance Test Suite: Framebuffer Update
 * Target: <3ms per update
 */
function testFramebufferUpdatePerformance() {
    console.log('\n=== Testing Framebuffer Update Performance (<3ms target) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();

    const fbBase = integration.config.framebufferBase;
    const width = integration.config.framebufferWidth;
    const height = integration.config.framebufferHeight;

    // Test 1: Small dirty rectangles (partial updates)
    console.log('\n  Test 1: Small dirty rectangles (partial updates)');
    const smallDirtyRectTimes = [];
    for (let i = 0; i < 60; i++) {
        // Write to a small area
        for (let y = 0; y < 10; y++) {
            for (let x = 0; x < 10; x++) {
                const offset = (y * width + x) * 4;
                integration.cpu.writeMemory(fbBase + offset, 255);
                integration.cpu.writeMemory(fbBase + offset + 1, (y * 25) % 256);
                integration.cpu.writeMemory(fbBase + offset + 2, (x * 25) % 256);
                integration.cpu.writeMemory(fbBase + offset + 3, 255);
            }
        }

        // Mark small dirty rectangle
        integration.cpu.dirtyRects = [
            { x: 0, y: 0, width: 10, height: 10 }
        ];

        const startTime = performance.now();
        integration.updateFramebuffer();
        const updateTime = performance.now() - startTime;
        smallDirtyRectTimes.push(updateTime);
    }

    const smallAvg = smallDirtyRectTimes.reduce((a, b) => a + b, 0) / smallDirtyRectTimes.length;
    const smallMax = Math.max(...smallDirtyRectTimes);
    console.log(`    Small dirty rects: Avg ${smallAvg.toFixed(2)}ms, Max ${smallMax.toFixed(2)}ms`);
    console.assert(smallAvg < 1, `Small dirty rect update should be <1ms (was ${smallAvg.toFixed(2)}ms)`);

    // Test 2: Medium dirty rectangles
    console.log('\n  Test 2: Medium dirty rectangles');
    const mediumDirtyRectTimes = [];
    for (let i = 0; i < 60; i++) {
        // Write to a medium area
        for (let y = 0; y < 50; y++) {
            for (let x = 0; x < 50; x++) {
                const offset = (y * width + x) * 4;
                integration.cpu.writeMemory(fbBase + offset, 255);
                integration.cpu.writeMemory(fbBase + offset + 1, (y * 5) % 256);
                integration.cpu.writeMemory(fbBase + offset + 2, (x * 5) % 256);
                integration.cpu.writeMemory(fbBase + offset + 3, 255);
            }
        }

        // Mark medium dirty rectangle
        integration.cpu.dirtyRects = [
            { x: 0, y: 0, width: 50, height: 50 }
        ];

        const startTime = performance.now();
        integration.updateFramebuffer();
        const updateTime = performance.now() - startTime;
        mediumDirtyRectTimes.push(updateTime);
    }

    const mediumAvg = mediumDirtyRectTimes.reduce((a, b) => a + b, 0) / mediumDirtyRectTimes.length;
    const mediumMax = Math.max(...mediumDirtyRectTimes);
    console.log(`    Medium dirty rects: Avg ${mediumAvg.toFixed(2)}ms, Max ${mediumMax.toFixed(2)}ms`);
    console.assert(mediumAvg < 2, `Medium dirty rect update should be <2ms (was ${mediumAvg.toFixed(2)}ms)`);

    // Test 3: Full framebuffer update
    console.log('\n  Test 3: Full framebuffer update');
    const fullUpdateTimes = [];
    for (let i = 0; i < 60; i++) {
        // Write to entire framebuffer
        for (let y = 0; y < height; y++) {
            for (let x = 0; x < width; x++) {
                const offset = (y * width + x) * 4;
                integration.cpu.writeMemory(fbBase + offset, (x * 255 / width) | 0);
                integration.cpu.writeMemory(fbBase + offset + 1, (y * 255 / height) | 0);
                integration.cpu.writeMemory(fbBase + offset + 2, 128);
                integration.cpu.writeMemory(fbBase + offset + 3, 255);
            }
        }

        // Mark many dirty rectangles to trigger full update
        integration.cpu.dirtyRects = [];
        for (let y = 0; y < height; y += 20) {
            for (let x = 0; x < width; x += 20) {
                integration.cpu.dirtyRects.push({ x, y, width: 20, height: 20 });
            }
        }

        const startTime = performance.now();
        integration.updateFramebuffer();
        const updateTime = performance.now() - startTime;
        fullUpdateTimes.push(updateTime);
    }

    const fullAvg = fullUpdateTimes.reduce((a, b) => a + b, 0) / fullUpdateTimes.length;
    const fullMax = Math.max(...fullUpdateTimes);
    console.log(`    Full framebuffer: Avg ${fullAvg.toFixed(2)}ms, Max ${fullMax.toFixed(2)}ms`);
    console.assert(fullAvg < 3, `Full framebuffer update should be <3ms (was ${fullAvg.toFixed(2)}ms)`);

    console.log('✓ Framebuffer update performance tests passed');
}

/**
 * Performance Test Suite: Console Update
 * Target: <1ms per update
 */
function testConsoleUpdatePerformance() {
    console.log('\n=== Testing Console Update Performance (<1ms target) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createConsoleTile();

    // Test 1: Single character updates
    console.log('\n  Test 1: Single character updates');
    const singleCharTimes = [];
    for (let i = 0; i < 100; i++) {
        integration.writeConsole(65 + (i % 26)); // A-Z
        const startTime = performance.now();
        integration.updateConsoleDisplay();
        const updateTime = performance.now() - startTime;
        singleCharTimes.push(updateTime);
    }

    const singleAvg = singleCharTimes.reduce((a, b) => a + b, 0) / singleCharTimes.length;
    const singleMax = Math.max(...singleCharTimes);
    console.log(`    Single char: Avg ${singleAvg.toFixed(3)}ms, Max ${singleMax.toFixed(3)}ms`);
    console.assert(singleAvg < 1, `Single char update should be <1ms (was ${singleAvg.toFixed(3)}ms)`);

    // Test 2: Line updates
    console.log('\n  Test 2: Line updates');
    const lineTimes = [];
    for (let i = 0; i < 50; i++) {
        const line = `Line ${i}: This is a test line with some content`;
        for (let j = 0; j < line.length; j++) {
            integration.writeConsole(line.charCodeAt(j));
        }
        integration.writeConsole(10); // LF

        const startTime = performance.now();
        integration.updateConsoleDisplay();
        const updateTime = performance.now() - startTime;
        lineTimes.push(updateTime);
    }

    const lineAvg = lineTimes.reduce((a, b) => a + b, 0) / lineTimes.length;
    const lineMax = Math.max(...lineTimes);
    console.log(`    Line updates: Avg ${lineAvg.toFixed(3)}ms, Max ${lineMax.toFixed(3)}ms`);
    console.assert(lineAvg < 1, `Line update should be <1ms (was ${lineAvg.toFixed(3)}ms)`);

    // Test 3: Large buffer updates
    console.log('\n  Test 3: Large buffer updates');
    integration.consoleBuffer = '';
    for (let i = 0; i < 100; i++) {
        integration.consoleBuffer += `Line ${i}: This is a test line with some content\n`;
    }

    const largeBufferTimes = [];
    for (let i = 0; i < 50; i++) {
        integration.consoleDirty = true;
        const startTime = performance.now();
        integration.updateConsoleDisplay();
        const updateTime = performance.now() - startTime;
        largeBufferTimes.push(updateTime);
    }

    const largeAvg = largeBufferTimes.reduce((a, b) => a + b, 0) / largeBufferTimes.length;
    const largeMax = Math.max(...largeBufferTimes);
    console.log(`    Large buffer: Avg ${largeAvg.toFixed(3)}ms, Max ${largeMax.toFixed(3)}ms`);
    console.assert(largeAvg < 1, `Large buffer update should be <1ms (was ${largeAvg.toFixed(3)}ms)`);

    console.log('✓ Console update performance tests passed');
}

/**
 * Performance Test Suite: State Visualization
 * Target: <2ms per update
 */
function testStateVisualizationPerformance() {
    console.log('\n=== Testing State Visualization Performance (<2ms target) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createStateOverlay();

    // Set up CPU state
    for (let i = 0; i < 8; i++) {
        integration.cpu.registers[i] = Math.floor(Math.random() * 0xFFFFFFFF);
    }
    integration.cpu.pc = 0x1000;
    integration.cpu.cycles = 123456;
    integration.running = true;
    integration.paused = false;

    const updateTimes = [];
    for (let i = 0; i < 60; i++) {
        // Update CPU state
        for (let j = 0; j < 8; j++) {
            integration.cpu.registers[j] += Math.floor(Math.random() * 100);
        }
        integration.cpu.pc += 4;
        integration.cpu.cycles += 1000;

        const startTime = performance.now();
        integration.updateStateVisualization();
        const updateTime = performance.now() - startTime;
        updateTimes.push(updateTime);
    }

    const avgTime = updateTimes.reduce((a, b) => a + b, 0) / updateTimes.length;
    const maxTime = Math.max(...updateTimes);
    const minTime = Math.min(...updateTimes);

    console.log(`State Visualization Performance (60 updates):`);
    console.log(`  Average: ${avgTime.toFixed(3)}ms`);
    console.log(`  Min: ${minTime.toFixed(3)}ms`);
    console.log(`  Max: ${maxTime.toFixed(3)}ms`);

    console.assert(avgTime < 2, `Average state visualization time should be <2ms (was ${avgTime.toFixed(3)}ms)`);
    console.assert(maxTime < 3, `Max state visualization time should be <3ms (was ${maxTime.toFixed(3)}ms)`);

    console.log('✓ State visualization performance tests passed');
}

/**
 * Performance Test Suite: Full Frame (60 FPS Target)
 * Target: <16.67ms per frame (60 FPS)
 */
function testFullFramePerformance() {
    console.log('\n=== Testing Full Frame Performance (60 FPS target: <16.67ms) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Set up a comprehensive program
    const complexProgram = [];
    for (let i = 0; i < 500; i++) {
        complexProgram.push(0x01000000); // MOV R0, R0
        complexProgram.push(0x02000001); // ADD R0, R0, R1
    }
    complexProgram.push(0x12000000); // RET

    integration.cpu.memory = complexProgram;
    integration.running = true;

    // Simulate console output
    for (let i = 0; i < 10; i++) {
        const line = `Line ${i}: Test output`;
        for (let j = 0; j < line.length; j++) {
            integration.writeConsole(line.charCodeAt(j));
        }
        integration.writeConsole(10);
    }

    // Simulate framebuffer updates
    const fbBase = integration.config.framebufferBase;
    for (let y = 0; y < 50; y++) {
        for (let x = 0; x < 50; x++) {
            const offset = (y * integration.config.framebufferWidth + x) * 4;
            integration.cpu.writeMemory(fbBase + offset, 255);
            integration.cpu.writeMemory(fbBase + offset + 1, (y * 5) % 256);
            integration.cpu.writeMemory(fbBase + offset + 2, (x * 5) % 256);
            integration.cpu.writeMemory(fbBase + offset + 3, 255);
        }
    }
    integration.cpu.dirtyRects = [{ x: 0, y: 0, width: 50, height: 50 }];

    // Measure full frame performance
    const frameTimes = [];
    const componentTimes = {
        cpu: [],
        framebuffer: [],
        console: [],
        state: []
    };

    for (let i = 0; i < 60; i++) {
        const frameStart = performance.now();

        // CPU execution
        const cpuStart = performance.now();
        integration.executeFrame();
        componentTimes.cpu.push(performance.now() - cpuStart);

        // Framebuffer update
        const fbStart = performance.now();
        integration.updateFramebuffer();
        componentTimes.framebuffer.push(performance.now() - fbStart);

        // Console update
        integration.updateConsole();

        // State visualization
        const stateStart = performance.now();
        integration.updateStateVisualization();
        componentTimes.state.push(performance.now() - stateStart);

        const frameTime = performance.now() - frameStart;
        frameTimes.push(frameTime);
    }

    // Calculate statistics
    const avgFrame = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
    const maxFrame = Math.max(...frameTimes);
    const minFrame = Math.min(...frameTimes);

    const avgCpu = componentTimes.cpu.reduce((a, b) => a + b, 0) / componentTimes.cpu.length;
    const avgFb = componentTimes.framebuffer.reduce((a, b) => a + b, 0) / componentTimes.framebuffer.length;
    const avgState = componentTimes.state.reduce((a, b) => a + b, 0) / componentTimes.state.length;

    console.log(`Full Frame Performance (60 frames):`);
    console.log(`  Frame Time:`);
    console.log(`    Average: ${avgFrame.toFixed(2)}ms`);
    console.log(`    Min: ${minFrame.toFixed(2)}ms`);
    console.log(`    Max: ${maxFrame.toFixed(2)}ms`);
    console.log(`  Component Times:`);
    console.log(`    CPU: ${avgCpu.toFixed(2)}ms`);
    console.log(`    Framebuffer: ${avgFb.toFixed(2)}ms`);
    console.log(`    State: ${avgState.toFixed(2)}ms`);

    // Calculate achieved FPS
    const achievedFps = 1000 / avgFrame;
    console.log(`  Achieved FPS: ${achievedFps.toFixed(1)}`);

    // Performance assertions
    console.assert(avgFrame < 16.67, `Average frame time should be <16.67ms for 60 FPS (was ${avgFrame.toFixed(2)}ms)`);
    console.assert(avgCpu < 5, `Average CPU time should be <5ms (was ${avgCpu.toFixed(2)}ms)`);
    console.assert(avgFb < 3, `Average framebuffer time should be <3ms (was ${avgFb.toFixed(2)}ms)`);
    console.assert(avgState < 2, `Average state time should be <2ms (was ${avgState.toFixed(2)}ms)`);
    console.assert(achievedFps >= 60, `Achieved FPS should be >=60 (was ${achievedFps.toFixed(1)})`);

    console.log('✓ Full frame performance tests passed');
}

/**
 * Performance Test Suite: Memory Allocation
 */
function testMemoryAllocationPerformance() {
    console.log('\n=== Testing Memory Allocation Performance ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test memory read/write performance
    const readWriteTimes = [];
    for (let i = 0; i < 1000; i++) {
        const addr = Math.floor(Math.random() * 0x10000);
        const value = Math.floor(Math.random() * 256);

        const startTime = performance.now();
        integration.cpu.writeMemory(addr, value);
        const readValue = integration.cpu.readMemory(addr);
        const elapsed = performance.now() - startTime;

        readWriteTimes.push(elapsed);
        console.assert(readValue === value, `Read value should match written value`);
    }

    const avgTime = readWriteTimes.reduce((a, b) => a + b, 0) / readWriteTimes.length;
    const maxTime = Math.max(...readWriteTimes);

    console.log(`Memory Read/Write Performance (1000 operations):`);
    console.log(`  Average: ${avgTime.toFixed(4)}ms`);
    console.log(`  Max: ${maxTime.toFixed(4)}ms`);

    console.assert(avgTime < 0.1, `Average memory operation should be <0.1ms (was ${avgTime.toFixed(4)}ms)`);

    console.log('✓ Memory allocation performance tests passed');
}

/**
 * Performance Test Suite: Dirty Rectangle Optimization
 */
function testDirtyRectangleOptimization() {
    console.log('\n=== Testing Dirty Rectangle Optimization ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();

    const fbBase = integration.config.framebufferBase;
    const width = integration.config.framebufferWidth;
    const height = integration.config.framebufferHeight;

    // Test 1: No dirty rectangles (should skip update)
    console.log('\n  Test 1: No dirty rectangles (should skip update)');
    integration.cpu.dirtyRects = [];
    const startTime = performance.now();
    integration.updateFramebuffer();
    const noDirtyTime = performance.now() - startTime;
    console.log(`    No dirty rects: ${noDirtyTime.toFixed(4)}ms`);
    console.assert(noDirtyTime < 0.1, `Update with no dirty rects should be <0.1ms (was ${noDirtyTime.toFixed(4)}ms)`);

    // Test 2: Single dirty rectangle
    console.log('\n  Test 2: Single dirty rectangle');
    integration.cpu.dirtyRects = [{ x: 10, y: 10, width: 10, height: 10 }];
    const singleStart = performance.now();
    integration.updateFramebuffer();
    const singleTime = performance.now() - singleStart;
    console.log(`    Single dirty rect: ${singleTime.toFixed(2)}ms`);

    // Test 3: Many small dirty rectangles
    console.log('\n  Test 3: Many small dirty rectangles');
    integration.cpu.dirtyRects = [];
    for (let i = 0; i < 20; i++) {
        integration.cpu.dirtyRects.push({
            x: i * 20,
            y: 0,
            width: 10,
            height: 10
        });
    }
    const manyStart = performance.now();
    integration.updateFramebuffer();
    const manyTime = performance.now() - manyStart;
    console.log(`    Many dirty rects (20): ${manyTime.toFixed(2)}ms`);

    // Test 4: Threshold for full update (>16 dirty rects)
    console.log('\n  Test 4: Threshold for full update (>16 dirty rects)');
    integration.cpu.dirtyRects = [];
    for (let i = 0; i < 17; i++) {
        integration.cpu.dirtyRects.push({
            x: i * 20,
            y: 0,
            width: 10,
            height: 10
        });
    }
    const thresholdStart = performance.now();
    integration.updateFramebuffer();
    const thresholdTime = performance.now() - thresholdStart;
    console.log(`    Threshold exceeded (17): ${thresholdTime.toFixed(2)}ms`);

    console.log('✓ Dirty rectangle optimization tests passed');
}

/**
 * Performance Test Suite: Sustained Performance
 */
function testSustainedPerformance() {
    console.log('\n=== Testing Sustained Performance (10 seconds) ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Set up program
    const program = [];
    for (let i = 0; i < 200; i++) {
        program.push(0x01000000); // MOV R0, R0
        program.push(0x02000001); // ADD R0, R0, R1
    }
    program.push(0x12000000); // RET

    integration.cpu.memory = program;
    integration.running = true;

    // Run for 10 seconds (600 frames at 60 FPS)
    const frameTimes = [];
    const startTime = performance.now();
    let frameCount = 0;

    while (performance.now() - startTime < 10000) {
        const frameStart = performance.now();

        integration.executeFrame();
        integration.updateFramebuffer();
        integration.updateConsole();
        integration.updateStateVisualization();

        const frameTime = performance.now() - frameStart;
        frameTimes.push(frameTime);
        frameCount++;
    }

    const totalTime = performance.now() - startTime;
    const avgFrame = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
    const maxFrame = Math.max(...frameTimes);
    const minFrame = Math.min(...frameTimes);
    const achievedFps = frameCount / (totalTime / 1000);

    console.log(`Sustained Performance (${totalTime.toFixed(0)}ms, ${frameCount} frames):`);
    console.log(`  Frame Time:`);
    console.log(`    Average: ${avgFrame.toFixed(2)}ms`);
    console.log(`    Min: ${minFrame.toFixed(2)}ms`);
    console.log(`    Max: ${maxFrame.toFixed(2)}ms`);
    console.log(`  Achieved FPS: ${achievedFps.toFixed(1)}`);

    console.assert(avgFrame < 16.67, `Average frame time should be <16.67ms (was ${avgFrame.toFixed(2)}ms)`);
    console.assert(achievedFps >= 55, `Achieved FPS should be >=55 (was ${achievedFps.toFixed(1)})`);

    console.log('✓ Sustained performance tests passed');
}

/**
 * Run all performance tests
 */
function runAllPerformanceTests() {
    console.log('\n========================================');
    console.log('Phase 7: Performance Tests for Pixel CPU');
    console.log('========================================');

    try {
        testCpuExecutionPerformance();
        testFramebufferUpdatePerformance();
        testConsoleUpdatePerformance();
        testStateVisualizationPerformance();
        testFullFramePerformance();
        testMemoryAllocationPerformance();
        testDirtyRectangleOptimization();
        testSustainedPerformance();

        console.log('\n========================================');
        console.log('✓ All Phase 7 performance tests passed!');
        console.log('========================================\n');

        return true;
    } catch (error) {
        console.error('\n✗ Test failed:', error);
        console.error(error.stack);
        return false;
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testCpuExecutionPerformance,
        testFramebufferUpdatePerformance,
        testConsoleUpdatePerformance,
        testStateVisualizationPerformance,
        testFullFramePerformance,
        testMemoryAllocationPerformance,
        testDirtyRectangleOptimization,
        testSustainedPerformance,
        runAllPerformanceTests
    };
}

// Run tests if executed directly
if (typeof window === 'undefined' && require.main === module) {
    runAllPerformanceTests();
}
