# Pixel CPU - PixiJS Integration User Guide

Complete user guide for the Pixel CPU - PixiJS integration system.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Quick Start](#quick-start)
- [Using the Integration](#using-the-integration)
- [Visual Components](#visual-components)
- [Writing .brick Programs](#writing-brick-programs)
- [Memory-Mapped I/O](#memory-mapped-io)
- [Interactive Controls](#interactive-controls)
- [Performance Optimization](#performance-optimization)
- [Troubleshooting](#troubleshooting)
- [Examples](#examples)

---

## Introduction

The Pixel CPU - PixiJS integration system allows you to execute .brick programs (SimplePixelCPU bytecode) with real-time visualization on an infinite map. The system provides:

- **Real-time CPU emulation** at 60 FPS
- **Memory-mapped I/O** for console output and framebuffer display
- **Interactive controls** for debugging and stepping through code
- **Performance monitoring** to ensure smooth execution

### Key Concepts

- **CPU Emulator**: SimplePixelCPU - a virtual CPU that executes .brick bytecode
- **Infinite Map**: PixiJS-based infinite canvas for visual components
- **Memory-Mapped I/O**: Console and framebuffer accessed via memory addresses
- **Dirty Rectangle Tracking**: Efficient framebuffer updates by only updating changed regions

---

## Getting Started

### Prerequisites

Before using the Pixel CPU integration, ensure you have:

1. **PixiJS** installed and configured
2. **InfiniteMap** instance created
3. **SimplePixelCPU** and **PixelCPUIntegration** modules loaded

### Installation

```html
<!-- In your HTML file -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/pixi.js/7.3.2/pixi.min.js"></script>
<script src="pixel_cpu.js"></script>
<script src="pixel_cpu_integration.js"></script>
```

Or using ES6 modules:

```javascript
import { PixelCPUIntegration } from './pixel_cpu_integration.js';
```

### Basic Setup

```javascript
// Create PixiJS application
const app = new PIXI.Application({
    width: window.innerWidth,
    height: window.innerHeight,
    backgroundColor: 0x000000
});
document.body.appendChild(app.view);

// Create infinite map
const infiniteMap = new InfiniteMap(app);

// Create Pixel CPU integration
const integration = new PixelCPUIntegration(infiniteMap);
```

---

## Quick Start

### Step 1: Create the Integration

```javascript
const integration = new PixelCPUIntegration(infiniteMap);
```

### Step 2: Load a .brick File

```javascript
await integration.loadBrick('hello_world.brick');
```

### Step 3: Start Execution

```javascript
// Add to PixiJS ticker for 60 FPS execution
app.ticker.add(() => {
    integration.executeFrame();
});
```

### Step 4: Interact with the CPU

Use the interactive controls in the CPU state overlay:
- **⏸️ Pause**: Pause CPU execution
- **▶️ Resume**: Resume CPU execution
- **⏭️ Step**: Execute one instruction
- **🔄 Reset**: Reset CPU to initial state

---

## Using the Integration

### Loading and Running Programs

```javascript
// Load a .brick file
await integration.loadBrick('program.brick');

// The program will start executing automatically
// Visual components are created automatically:
// - Framebuffer display at (100, 100)
// - Console output at (0, 800)
// - CPU state overlay at (-400, -200)
```

### Manual Control

```javascript
// Pause execution
integration.pause();

// Resume execution
integration.resume();

// Step through instructions (for debugging)
const result = integration.step();
console.log(`PC: 0x${result.pc.toString(16)}, Opcode: ${result.opcode}`);

// Reset CPU
integration.reset();
```

### Monitoring State

```javascript
// Get current CPU state
const state = integration.getState();
console.log(`PC: 0x${state.pc.toString(16)}`);
console.log(`Cycles: ${state.cycles}`);
console.log(`Running: ${state.running}`);
console.log(`Paused: ${state.paused}`);

// Get performance statistics
const stats = integration.getPerformanceStats();
console.log(`Execution Time: ${stats.lastExecutionTime.toFixed(2)}ms`);
console.log(`Framebuffer Updates: ${stats.framebufferUpdateCount}`);
```

---

## Visual Components

### Framebuffer Display

The framebuffer display shows the graphical output of your .brick program.

**Location**: World coordinates (100, 100)

**Default Resolution**: 640x480 pixels

**Features**:
- Real-time display of framebuffer memory
- Efficient updates using dirty rectangle tracking
- Supports RGBA color format

**Changing Resolution**:

```javascript
integration.setFramebufferResolution(800, 600);
```

**Clearing the Framebuffer**:

```javascript
integration.clearFramebuffer();
```

### Console Output

The console output shows text output from your .brick program.

**Location**: World coordinates (0, 800)

**Default Size**: 800x200 pixels

**Features**:
- Terminal-style green text on black background
- Scrollable history (up to 1000 lines)
- Scroll indicator showing current position
- Supports special characters (newline, tab, backspace)

**Scrolling**:

```javascript
// Scroll up to see older output
integration.scrollConsoleUp(5);

// Scroll down to see newer output
integration.scrollConsoleDown(2);

// Jump to bottom (latest output)
integration.scrollConsoleToBottom();

// Jump to top (oldest output)
integration.scrollConsoleToTop();
```

### CPU State Overlay

The CPU state overlay displays real-time CPU information and provides interactive controls.

**Location**: World coordinates (-400, -200)

**Features**:
- **Registers**: Shows all 8 CPU registers
- **PC**: Shows program counter (orange)
- **Cycles**: Shows total cycles executed (green)
- **Status**: Shows running/paused/halted state
- **Memory**: Shows memory usage statistics
- **Controls**: Interactive buttons for pause/resume/step/reset

**Reading the Display**:

```
Registers:
R00: 0x12345678
R01: 0xABCDEF00
...
R07: 0x00000000

PC: 0x00000100
Cycles: 12345

Running: Yes
Paused: No
Halted: No
Exec Time: 2.50ms
FB Update: 1.20ms
FB Updates: 42

Memory:
  Used: 12.3KB (12.3%)
  Console: 45 chars (4.5%)
  FB Updates: 42
```

---

## Writing .brick Programs

### Program Structure

A .brick program is a sequence of 32-bit instructions. Each instruction consists of:

- **Opcode** (8 bits): The operation to perform
- **Operands** (24 bits): The operands for the operation

### Supported Instructions

#### MOV - Move

Move value between registers or load immediate value.

```
MOV Rd, Rs      ; Move Rs to Rd
MOV Rd, #imm    ; Load immediate value to Rd
```

Example:
```
MOV R0, R1      ; Move R1 to R0
MOV R0, #42     ; Load 42 into R0
```

#### ADD - Add

Add two registers and store result.

```
ADD Rd, Rs, Rt  ; Rd = Rs + Rt
```

Example:
```
ADD R0, R1, R2  ; R0 = R1 + R2
```

#### SUB - Subtract

Subtract two registers and store result.

```
SUB Rd, Rs, Rt  ; Rd = Rs - Rt
```

Example:
```
SUB R0, R1, R2  ; R0 = R1 - R2
```

#### AND - Logical AND

Bitwise AND of two registers.

```
AND Rd, Rs, Rt  ; Rd = Rs & Rt
```

Example:
```
AND R0, R1, R2  ; R0 = R1 & R2
```

#### OR - Logical OR

Bitwise OR of two registers.

```
OR Rd, Rs, Rt   ; Rd = Rs | Rt
```

Example:
```
OR R0, R1, R2   ; R0 = R1 | R2
```

#### XOR - Logical XOR

Bitwise XOR of two registers.

```
XOR Rd, Rs, Rt  ; Rd = Rs ^ Rt
```

Example:
```
XOR R0, R1, R2  ; R0 = R1 ^ R2
```

#### JMP - Jump

Jump to address.

```
JMP addr        ; PC = addr
```

Example:
```
JMP 0x100       ; Jump to address 0x100
```

#### JZ - Jump if Zero

Jump if register is zero.

```
JZ Rd, addr     ; if Rd == 0, PC = addr
```

Example:
```
JZ R0, 0x100    ; Jump to 0x100 if R0 is zero
```

#### JNZ - Jump if Not Zero

Jump if register is not zero.

```
JNZ Rd, addr    ; if Rd != 0, PC = addr
```

Example:
```
JNZ R0, 0x100   ; Jump to 0x100 if R0 is not zero
```

#### LOAD - Load from Memory

Load value from memory address.

```
LOAD Rd, addr   ; Rd = memory[addr]
```

Example:
```
LOAD R0, 0x200  ; Load from address 0x200 into R0
```

#### STORE - Store to Memory

Store value to memory address.

```
STORE Rd, addr  ; memory[addr] = Rd
```

Example:
```
STORE R0, 0x200 ; Store R0 to address 0x200
```

#### RET - Return

Halt CPU execution.

```
RET             ; Halt CPU
```

Example:
```
RET             ; Stop execution
```

### Example Programs

#### Hello World

```
; Write "Hello, World!" to console
MOV R0, #72     ; 'H'
STORE R0, 0x20000000
MOV R0, #101    ; 'e'
STORE R0, 0x20000001
MOV R0, #108    ; 'l'
STORE R0, 0x20000002
MOV R0, #108    ; 'l'
STORE R0, 0x20000003
MOV R0, #111    ; 'o'
STORE R0, 0x20000004
MOV R0, #44     ; ','
STORE R0, 0x20000005
MOV R0, #32     ; ' '
STORE R0, 0x20000006
MOV R0, #87     ; 'W'
STORE R0, 0x20000007
MOV R0, #111    ; 'o'
STORE R0, 0x20000008
MOV R0, #114    ; 'r'
STORE R0, 0x20000009
MOV R0, #108    ; 'l'
STORE R0, 0x2000000A
MOV R0, #100    ; 'd'
STORE R0, 0x2000000B
MOV R0, #33     ; '!'
STORE R0, 0x2000000C
MOV R0, #10     ; Newline
STORE R0, 0x2000000D
RET             ; Halt
```

#### Draw a Rectangle

```
; Draw a red rectangle on framebuffer
MOV R0, #255    ; Red
MOV R1, #0      ; Green
MOV R2, #0      ; Blue
MOV R3, #255    ; Alpha

; Draw 10x10 rectangle at (100, 100)
MOV R4, #100    ; X position
MOV R5, #100    ; Y position
MOV R6, #10     ; Width
MOV R7, #10     ; Height

; Calculate framebuffer base
MOV R8, #0x30000000

; Loop: Y
MOV R9, #0      ; Y counter
LOOP_Y:
  ; Loop: X
  MOV R10, #0   ; X counter
  LOOP_X:
    ; Calculate pixel offset
    ADD R11, R5, R9      ; Y + y
    MUL R11, R11, #640   ; (Y + y) * width
    ADD R11, R11, R4     ; (Y + y) * width + X
    ADD R11, R11, R10    ; (Y + y) * width + X + x
    MUL R11, R11, #4     ; * 4 bytes per pixel

    ; Write pixel
    ADD R12, R8, R11     ; Base + offset
    STORE R0, R12        ; R
    ADD R12, R12, #1
    STORE R1, R12        ; G
    ADD R12, R12, #1
    STORE R2, R12        ; B
    ADD R12, R12, #1
    STORE R3, R12        ; A

    ; Increment X
    ADD R10, R10, #1
    CMP R10, R6
    JNZ R10, LOOP_X

  ; Increment Y
  ADD R9, R9, #1
  CMP R9, R7
  JNZ R9, LOOP_Y

RET
```

---

## Memory-Mapped I/O

### Console Output

Write to console memory address to output text.

**Base Address**: `0x20000000`

**Usage**:

```javascript
// Write "Hello" to console
integration.cpu.writeMemory(0x20000000, 72);  // 'H'
integration.cpu.writeMemory(0x20000001, 101); // 'e'
integration.cpu.writeMemory(0x20000002, 108); // 'l'
integration.cpu.writeMemory(0x20000003, 108); // 'l'
integration.cpu.writeMemory(0x20000004, 111); // 'o'
integration.cpu.writeMemory(0x20000005, 10);  // Newline
```

**Supported Characters**:

| Code | Character | Description |
|------|-----------|-------------|
| 32-126 | Printable | Printable ASCII characters |
| 10 | `\n` | Newline (LF) |
| 13 | `\r` | Carriage return (CR) - ignored |
| 8, 127 | Backspace | Delete last character |
| 9 | Tab | Expands to 4 spaces |
| Other | `[XX]` | Displayed as hex |

### Framebuffer Display

Write to framebuffer memory address to display graphics.

**Base Address**: `0x30000000`

**Format**: RGBA (4 bytes per pixel)

**Usage**:

```javascript
// Write a red pixel at (100, 100)
const width = 640;
const height = 480;
const fbBase = 0x30000000;

// Calculate pixel offset
const pixelOffset = (100 * width + 100) * 4;

// Write RGBA
integration.cpu.writeMemory(fbBase + pixelOffset, 255);     // R
integration.cpu.writeMemory(fbBase + pixelOffset + 1, 0);   // G
integration.cpu.writeMemory(fbBase + pixelOffset + 2, 0);   // B
integration.cpu.writeMemory(fbBase + pixelOffset + 3, 255); // A
```

**Drawing a Line**:

```javascript
// Draw a horizontal red line from (10, 10) to (100, 10)
const y = 10;
const width = 640;
const fbBase = 0x30000000;

for (let x = 10; x <= 100; x++) {
    const offset = (y * width + x) * 4;
    integration.cpu.writeMemory(fbBase + offset, 255);     // R
    integration.cpu.writeMemory(fbBase + offset + 1, 0);   // G
    integration.cpu.writeMemory(fbBase + offset + 2, 0);   // B
    integration.cpu.writeMemory(fbBase + offset + 3, 255); // A
}
```

---

## Interactive Controls

### CPU State Overlay Buttons

The CPU state overlay provides four interactive buttons:

#### ⏸️ Pause

Pause CPU execution.

**When to use**:
- Stop execution to examine state
- Debug program behavior
- Prepare for step-through debugging

**Example**:
```javascript
integration.pause();
```

#### ▶️ Resume

Resume CPU execution after pause.

**When to use**:
- Continue execution after pause
- Resume from step-through debugging

**Example**:
```javascript
integration.resume();
```

#### ⏭️ Step

Execute a single CPU instruction.

**When to use**:
- Step through code for debugging
- Examine state after each instruction
- Understand program flow

**Example**:
```javascript
const result = integration.step();
console.log(`PC: 0x${result.pc.toString(16)}, Opcode: ${result.opcode}`);
```

#### 🔄 Reset

Reset CPU to initial state.

**When to use**:
- Restart program from beginning
- Clear execution state
- Fix corrupted state

**Example**:
```javascript
integration.reset();
```

### Keyboard Shortcuts

You can add keyboard shortcuts for common operations:

```javascript
document.addEventListener('keydown', (event) => {
    switch (event.key) {
        case 'p': // Pause
            integration.pause();
            break;
        case 'r': // Resume
            integration.resume();
            break;
        case 's': // Step
            integration.step();
            break;
        case 'Escape': // Reset
            integration.reset();
            break;
    }
});
```

---

## Performance Optimization

### Performance Targets

| Component | Target | Notes |
|-----------|--------|-------|
| Frame Time | <16.67ms | 60 FPS target |
| CPU Execution | <5ms | Per frame |
| Framebuffer Update | <3ms | Per update |
| Console Update | <1ms | Per update |
| State Visualization | <2ms | Per update |

### Optimization Tips

#### 1. Adjust Cycles Per Frame

If CPU execution is too slow, reduce cycles per frame:

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 500  // Reduced from default 1000
});
```

If CPU execution is too fast, increase cycles per frame:

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 2000  // Increased from default 1000
});
```

#### 2. Optimize Framebuffer Updates

The system automatically uses dirty rectangle tracking to only update changed regions. To maximize efficiency:

- **Minimize framebuffer writes**: Only write to pixels that need to change
- **Batch updates**: Write to contiguous regions when possible
- **Use dirty rectangles**: The system automatically tracks changed regions

#### 3. Limit Console Output

Excessive console output can impact performance:

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    consoleMaxLines: 16,      // Reduce visible lines
    consoleMaxHistory: 500    // Reduce history size
});
```

#### 4. Monitor Performance

Regularly check performance statistics:

```javascript
app.ticker.add(() => {
    integration.executeFrame();

    // Log performance every 60 frames (1 second)
    if (app.ticker.lastTime % 60 < 1) {
        const stats = integration.getPerformanceStats();
        console.log(`CPU: ${stats.lastExecutionTime.toFixed(2)}ms`);
        console.log(`FB: ${stats.lastFramebufferUpdateTime.toFixed(2)}ms`);
    }
});
```

#### 5. Use Step Mode for Debugging

For debugging, use step mode instead of continuous execution:

```javascript
// Pause continuous execution
integration.pause();

// Step through code
setInterval(() => {
    integration.step();
}, 100); // Step every 100ms
```

### Performance Warnings

The system will log performance warnings when targets are exceeded:

```
⚠ CPU execution took 6.23ms (target: <5ms)
⚠ Framebuffer update took 3.45ms (target: <3ms)
⚠ Console update took 1.23ms (target: <1ms)
```

Warnings are limited to the first 10 occurrences to avoid console spam.

---

## Troubleshooting

### Common Issues

#### Issue: CPU not executing

**Symptoms**: CPU state shows `Running: No` or `Paused: Yes`

**Solutions**:
1. Ensure `integration.running` is `true`
2. Ensure `integration.paused` is `false`
3. Check that `executeFrame()` is being called

```javascript
integration.running = true;
integration.paused = false;
app.ticker.add(() => integration.executeFrame());
```

#### Issue: No framebuffer display

**Symptoms**: Framebuffer area is black or not visible

**Solutions**:
1. Ensure framebuffer texture was created
2. Check that framebuffer sprite was added to world
3. Verify camera is positioned correctly

```javascript
integration.createFramebufferTexture();
// Navigate to world coordinates (100, 100) to see framebuffer
```

#### Issue: No console output

**Symptoms**: Console area is empty

**Solutions**:
1. Ensure console tile was created
2. Check that program is writing to console base address
3. Verify console dirty flag is being set

```javascript
integration.createConsoleTile();
// Ensure program writes to 0x20000000
integration.cpu.writeMemory(0x20000000, 72); // 'H'
```

#### Issue: Poor performance

**Symptoms**: Frame rate drops below 60 FPS

**Solutions**:
1. Reduce `cyclesPerFrame`
2. Optimize framebuffer updates
3. Limit console output
4. Check performance statistics

```javascript
const stats = integration.getPerformanceStats();
console.log(`CPU: ${stats.lastExecutionTime.toFixed(2)}ms`);
console.log(`FB: ${stats.lastFramebufferUpdateTime.toFixed(2)}ms`);
```

#### Issue: CPU halted unexpectedly

**Symptoms**: CPU state shows `Halted: Yes` before program completes

**Solutions**:
1. Check for `RET` instruction in program
2. Verify program counter is valid
3. Check for invalid instructions

```javascript
const state = integration.getState();
console.log(`PC: 0x${state.pc.toString(16)}`);
console.log(`Halted: ${state.halted}`);
```

### Debug Mode

For detailed debugging, enable logging:

```javascript
// Log every CPU step
const originalStep = integration.cpu.step.bind(integration.cpu);
integration.cpu.step = function() {
    const result = originalStep();
    console.log(`PC: 0x${result.pc.toString(16)}, Opcode: ${result.opcode}`);
    return result;
};
```

---

## Examples

### Example 1: Simple Counter

```javascript
// Create integration
const integration = new PixelCPUIntegration(infiniteMap);

// Create a counter program
const counterProgram = [
    0x01000000, // MOV R0, R0 (initialize)
    0x01010001, // MOV R1, R1 (initialize)
    0x02000001, // ADD R0, R0, R1 (increment R0)
    0x03000000, // STORE R0, 0x20000000 (output to console)
    0x04000000, // LOAD R0, 0x20000000 (read back)
    0x05000000, // JMP 0x00000004 (loop)
];

integration.cpu.memory = counterProgram;
integration.running = true;

// Execute
app.ticker.add(() => integration.executeFrame());
```

### Example 2: Animated Graphics

```javascript
// Create integration
const integration = new PixelCPUIntegration(infiniteMap);

// Create an animation program
const animationProgram = [
    // Initialize
    0x01000000, // MOV R0, R0
    0x01010001, // MOV R1, R1

    // Draw frame
    0x03000000, // STORE R0, 0x30000000 (draw pixel)
    0x02000001, // ADD R0, R0, R1 (increment position)
    0x05000002, // JMP 0x00000002 (loop)
];

integration.cpu.memory = animationProgram;
integration.running = true;

// Execute
app.ticker.add(() => integration.executeFrame());
```

### Example 3: Interactive Program

```javascript
// Create integration
const integration = new PixelCPUIntegration(infiniteMap);

// Create an interactive program
const interactiveProgram = [
    // Wait for input
    0x04000000, // LOAD R0, 0x20000000 (read from console)
    0x06000000, // JZ R0, 0x00000000 (wait for input)
    0x03000001, // STORE R0, 0x30000000 (draw to framebuffer)
    0x05000000, // JMP 0x00000000 (loop)
];

integration.cpu.memory = interactiveProgram;
integration.running = true;

// Execute
app.ticker.add(() => integration.executeFrame());

// Handle keyboard input
document.addEventListener('keydown', (event) => {
    integration.writeConsole(event.keyCode);
});
```

### Example 4: Performance Monitoring

```javascript
// Create integration
const integration = new PixelCPUIntegration(infiniteMap);

// Load program
await integration.loadBrick('program.brick');

// Add performance monitoring
let frameCount = 0;
let startTime = performance.now();

app.ticker.add(() => {
    integration.executeFrame();

    frameCount++;

    // Log performance every second
    if (performance.now() - startTime >= 1000) {
        const fps = frameCount;
        const stats = integration.getPerformanceStats();

        console.log(`FPS: ${fps}`);
        console.log(`CPU: ${stats.lastExecutionTime.toFixed(2)}ms`);
        console.log(`FB: ${stats.lastFramebufferUpdateTime.toFixed(2)}ms`);

        frameCount = 0;
        startTime = performance.now();
    }
});
```

### Example 5: Custom Configuration

```javascript
// Create integration with custom configuration
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 2000,           // More CPU cycles per frame
    framebufferWidth: 800,           // Higher resolution
    framebufferHeight: 600,
    consoleMaxLines: 32,             // More console lines
    consoleMaxHistory: 2000,         // More history
    consoleFontSize: 14,             // Larger font
    consoleLineHeight: 18            // More line spacing
});

// Load program
await integration.loadBrick('program.brick');

// Execute
app.ticker.add(() => integration.executeFrame());
```

---

## Additional Resources

- [API Reference](API.md) - Complete API documentation
- [SimplePixelCPU Documentation](./pixel_cpu.js) - CPU emulator documentation
- [InfiniteMap Documentation](./infinite_map.js) - Infinite map documentation
- [Example Programs](./examples/) - Example .brick programs

---

## Support

For issues, questions, or contributions, please refer to the project repository or contact the development team.

---

## License

This user guide is part of the Geometry OS project. See project license for details.
