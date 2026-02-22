# Pixel CPU - PixiJS Integration API Reference

Complete API documentation for the Pixel CPU - PixiJS integration system.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Classes](#classes)
  - [PixelCPUIntegration](#pixelcpuintegration)
- [Configuration](#configuration)
- [Performance](#performance)
- [Examples](#examples)

---

## Overview

The `PixelCPUIntegration` class integrates the SimplePixelCPU emulator with the PixiJS infinite map, enabling real-time execution of .brick files with memory-mapped I/O for console output and framebuffer display.

### Key Features

- **Real-time CPU Emulation**: Execute .brick programs at 60 FPS
- **Memory-Mapped I/O**: Console output and framebuffer display via memory addresses
- **Visual Components**: Framebuffer display, console output, and CPU state visualization
- **Interactive Controls**: Pause, resume, step, and reset CPU execution
- **Performance Optimized**: Dirty rectangle tracking for efficient framebuffer updates

---

## Installation

```javascript
// Browser (ES6 modules)
import { PixelCPUIntegration } from './pixel_cpu_integration.js';

// Node.js
const PixelCPUIntegration = require('./pixel_cpu_integration.js');
```

---

## Classes

### PixelCPUIntegration

Main integration class that connects the SimplePixelCPU emulator with PixiJS infinite map.

#### Constructor

```javascript
new PixelCPUIntegration(infiniteMap, config)
```

Creates a new PixelCPUIntegration instance.

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `infiniteMap` | `Object` | Yes | Reference to InfiniteMap instance |
| `config` | `Object` | No | Configuration options (see [Configuration](#configuration)) |

**Throws:**

- `TypeError` - If `infiniteMap` is not provided

**Example:**

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 1000,
    framebufferWidth: 640,
    framebufferHeight: 480
});
```

---

#### Methods

##### executeFrame

```javascript
executeFrame()
```

Execute CPU for `cyclesPerFrame` cycles (non-blocking). Called from PixiJS ticker (60 FPS).

**Performance Target:** <5ms per frame

**Example:**

```javascript
// In PixiJS ticker
app.ticker.add(() => {
    integration.executeFrame();
});
```

---

##### step

```javascript
step() → Object
```

Execute a single CPU instruction step. Used for debugging and stepping through code.

**Returns:**

| Type | Description |
|------|-------------|
| `Object` | Step result containing `pc`, `cycles`, `opcode`, `instruction`, `halted` |

**Example:**

```javascript
const result = integration.step();
console.log(`PC: ${result.pc}, Cycles: ${result.cycles}`);
```

---

##### loadBrick

```javascript
async loadBrick(brickName) → Promise<void>
```

Load and execute a .brick file.

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `brickName` | `string` | Yes | Name of brick file to load |

**Example:**

```javascript
await integration.loadBrick('test_program.brick');
```

---

##### pause

```javascript
pause()
```

Pause CPU execution.

**Example:**

```javascript
integration.pause();
```

---

##### resume

```javascript
resume()
```

Resume CPU execution.

**Example:**

```javascript
integration.resume();
```

---

##### reset

```javascript
reset()
```

Reset CPU state, console buffer, and visual components.

**Example:**

```javascript
integration.reset();
```

---

##### getState

```javascript
getState() → Object
```

Get current CPU and integration state.

**Returns:**

| Property | Type | Description |
|----------|------|-------------|
| `registers` | `number[]` | CPU register values |
| `pc` | `number` | Program counter |
| `cycles` | `number` | Total cycles executed |
| `halted` | `boolean` | CPU halted flag |
| `running` | `boolean` | Integration running flag |
| `paused` | `boolean` | Integration paused flag |
| `lastExecutionTime` | `number` | Last execution time in ms |
| `lastFramebufferUpdateTime` | `number` | Last framebuffer update time in ms |
| `framebufferUpdateCount` | `number` | Total framebuffer updates |
| `lastConsoleUpdateTime` | `number` | Last console update time in ms |
| `consoleUpdateCount` | `number` | Total console updates |
| `consoleBufferLength` | `number` | Console buffer length |
| `consoleHistoryLength` | `number` | Console history length |
| `performanceWarnings` | `number` | Performance warning count |

**Example:**

```javascript
const state = integration.getState();
console.log(`PC: 0x${state.pc.toString(16)}, Cycles: ${state.cycles}`);
```

---

##### createFramebufferTexture

```javascript
createFramebufferTexture()
```

Create framebuffer texture for display. Automatically called by `loadBrick()`.

**Example:**

```javascript
integration.createFramebufferTexture();
```

---

##### setFramebufferResolution

```javascript
setFramebufferResolution(width, height)
```

Set framebuffer resolution and recreate texture.

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `width` | `number` | Yes | Framebuffer width in pixels |
| `height` | `number` | Yes | Framebuffer height in pixels |

**Throws:**

- `Error` - If resolution change fails

**Example:**

```javascript
integration.setFramebufferResolution(800, 600);
```

---

##### getFramebufferResolution

```javascript
getFramebufferResolution() → Object
```

Get current framebuffer resolution.

**Returns:**

| Property | Type | Description |
|----------|------|-------------|
| `width` | `number` | Framebuffer width in pixels |
| `height` | `number` | Framebuffer height in pixels |

**Example:**

```javascript
const resolution = integration.getFramebufferResolution();
console.log(`Resolution: ${resolution.width}x${resolution.height}`);
```

---

##### updateFramebuffer

```javascript
updateFramebuffer()
```

Update framebuffer from CPU memory with dirty rectangle tracking. Automatically called by `executeFrame()`.

**Performance Target:** <3ms per update

**Example:**

```javascript
integration.updateFramebuffer();
```

---

##### clearFramebuffer

```javascript
clearFramebuffer()
```

Clear framebuffer with black.

**Example:**

```javascript
integration.clearFramebuffer();
```

---

##### createConsoleTile

```javascript
createConsoleTile()
```

Create console tile on infinite map. Automatically called by `loadBrick()`.

**Example:**

```javascript
integration.createConsoleTile();
```

---

##### updateConsoleDisplay

```javascript
updateConsoleDisplay()
```

Update console display with current buffer content.

**Performance Target:** <1ms per update

**Example:**

```javascript
integration.updateConsoleDisplay();
```

---

##### writeConsole

```javascript
writeConsole(char)
```

Write character to console (memory-mapped I/O). Called by CPU when writing to console base address.

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `char` | `number` | Yes | Character code to write |

**Supported Characters:**

- `32-126`: Printable ASCII characters
- `10`: Newline (LF)
- `13`: Carriage return (CR) - ignored
- `8` or `127`: Backspace/Delete
- `9`: Tab (expands to 4 spaces)
- Other: Displayed as hex `[XX]`

**Example:**

```javascript
integration.writeConsole(72); // 'H'
integration.writeConsole(101); // 'e'
integration.writeConsole(108); // 'l'
integration.writeConsole(108); // 'l'
integration.writeConsole(111); // 'o'
integration.writeConsole(10); // Newline
```

---

##### scrollConsoleUp

```javascript
scrollConsoleUp(lines = 1)
```

Scroll console up (show older output).

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `lines` | `number` | No | Number of lines to scroll (default: 1) |

**Example:**

```javascript
integration.scrollConsoleUp(5);
```

---

##### scrollConsoleDown

```javascript
scrollConsoleDown(lines = 1)
```

Scroll console down (show newer output).

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `lines` | `number` | No | Number of lines to scroll (default: 1) |

**Example:**

```javascript
integration.scrollConsoleDown(5);
```

---

##### scrollConsoleToBottom

```javascript
scrollConsoleToBottom()
```

Scroll console to bottom (show latest output).

**Example:**

```javascript
integration.scrollConsoleToBottom();
```

---

##### scrollConsoleToTop

```javascript
scrollConsoleToTop()
```

Scroll console to top (show oldest output).

**Example:**

```javascript
integration.scrollConsoleToTop();
```

---

##### updateConsole

```javascript
updateConsole()
```

Update console if output changed. Called from `executeFrame()` to batch updates.

**Example:**

```javascript
integration.updateConsole();
```

---

##### createStateOverlay

```javascript
createStateOverlay()
```

Create CPU state overlay with interactive controls. Automatically called by `loadBrick()`.

**Example:**

```javascript
integration.createStateOverlay();
```

---

##### updateStateVisualization

```javascript
updateStateVisualization()
```

Update CPU state visualization (registers, PC, cycles, status).

**Performance Target:** <2ms per update

**Example:**

```javascript
integration.updateStateVisualization();
```

---

##### getPerformanceStats

```javascript
getPerformanceStats() → Object
```

Get performance statistics.

**Returns:**

| Property | Type | Description |
|----------|------|-------------|
| `lastExecutionTime` | `number` | Last CPU execution time in ms |
| `lastFramebufferUpdateTime` | `number` | Last framebuffer update time in ms |
| `framebufferUpdateCount` | `number` | Total framebuffer updates |
| `performanceWarnings` | `number` | Performance warning count |

**Example:**

```javascript
const stats = integration.getPerformanceStats();
console.log(`Execution: ${stats.lastExecutionTime.toFixed(2)}ms`);
```

---

#### Properties

| Name | Type | Description |
|------|------|-------------|
| `infiniteMap` | `Object` | Reference to InfiniteMap instance |
| `cpu` | `SimplePixelCPU` | CPU emulator instance |
| `config` | `Object` | Configuration object |
| `running` | `boolean` | CPU running flag |
| `paused` | `boolean` | CPU paused flag |
| `framebufferTexture` | `PIXI.Texture` | Framebuffer texture |
| `framebufferSprite` | `PIXI.Sprite` | Framebuffer sprite |
| `consoleTile` | `PIXI.Container` | Console tile container |
| `consoleText` | `PIXI.Text` | Console text element |
| `stateOverlay` | `PIXI.Container` | State overlay container |
| `registerText` | `PIXI.Text` | Register display text |
| `pcText` | `PIXI.Text` | PC display text |
| `cyclesText` | `PIXI.Text` | Cycles display text |
| `statusText` | `PIXI.Text` | Status display text |
| `memoryText` | `PIXI.Text` | Memory display text |
| `consoleBuffer` | `string` | Console output buffer |
| `consoleHistory` | `string[]` | Console output history |
| `consoleScrollPosition` | `number` | Console scroll position |
| `consoleDirty` | `boolean` | Console dirty flag |
| `lastExecutionTime` | `number` | Last execution time in ms |
| `lastFramebufferUpdateTime` | `number` | Last framebuffer update time in ms |
| `framebufferUpdateCount` | `number` | Total framebuffer updates |
| `lastConsoleUpdateTime` | `number` | Last console update time in ms |
| `consoleUpdateCount` | `number` | Total console updates |
| `performanceWarnings` | `number` | Performance warning count |

---

## Configuration

### Default Configuration

```javascript
{
    cyclesPerFrame: 1000,           // CPU cycles per render frame
    framebufferBase: 0x30000000,    // Framebuffer base address
    consoleBase: 0x20000000,        // Console base address
    framebufferWidth: 640,           // Framebuffer width in pixels
    framebufferHeight: 480,          // Framebuffer height in pixels
    consoleMaxLines: 24,             // Maximum console lines to display
    consoleMaxHistory: 1000,         // Maximum console lines in history
    consoleWidth: 800,              // Console tile width in pixels
    consoleHeight: 200,             // Console tile height in pixels
    consoleFontSize: 12,            // Console font size in pixels
    consoleLineHeight: 16           // Console line height in pixels
}
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `cyclesPerFrame` | `number` | `1000` | CPU cycles to execute per frame (60 FPS) |
| `framebufferBase` | `number` | `0x30000000` | Memory address for framebuffer |
| `consoleBase` | `number` | `0x20000000` | Memory address for console output |
| `framebufferWidth` | `number` | `640` | Framebuffer width in pixels |
| `framebufferHeight` | `number` | `480` | Framebuffer height in pixels |
| `consoleMaxLines` | `number` | `24` | Maximum visible console lines |
| `consoleMaxHistory` | `number` | `1000` | Maximum console lines in history |
| `consoleWidth` | `number` | `800` | Console tile width in pixels |
| `consoleHeight` | `number` | `200` | Console tile height in pixels |
| `consoleFontSize` | `number` | `12` | Console font size in pixels |
| `consoleLineHeight` | `number` | `16` | Console line height in pixels |

### Example Configuration

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 2000,           // More CPU cycles per frame
    framebufferWidth: 800,           // Higher resolution
    framebufferHeight: 600,
    consoleMaxLines: 32,             // More console lines
    consoleFontSize: 14              // Larger font
});
```

---

## Performance

### Performance Targets

| Component | Target | Notes |
|-----------|--------|-------|
| **Frame Time** | <16.67ms | 60 FPS target |
| **CPU Execution** | <5ms | Per frame |
| **Framebuffer Update** | <3ms | Per update |
| **Console Update** | <1ms | Per update |
| **State Visualization** | <2ms | Per update |

### Performance Optimization Features

1. **Dirty Rectangle Tracking**: Only update changed framebuffer regions
2. **Batched Console Updates**: Console display updated once per frame
3. **Efficient Memory Access**: Direct memory read/write operations
4. **Lazy Evaluation**: Skip updates when no changes detected

### Performance Monitoring

```javascript
// Get current performance stats
const stats = integration.getPerformanceStats();
console.log(`CPU: ${stats.lastExecutionTime.toFixed(2)}ms`);
console.log(`Framebuffer: ${stats.lastFramebufferUpdateTime.toFixed(2)}ms`);
console.log(`Warnings: ${stats.performanceWarnings}`);

// Get full state including performance
const state = integration.getState();
console.log(`Execution: ${state.lastExecutionTime.toFixed(2)}ms`);
console.log(`FB Updates: ${state.framebufferUpdateCount}`);
```

---

## Examples

### Basic Usage

```javascript
// Create integration
const integration = new PixelCPUIntegration(infiniteMap);

// Load and run a brick file
await integration.loadBrick('program.brick');

// Add to PixiJS ticker
app.ticker.add(() => {
    integration.executeFrame();
});
```

### Custom Configuration

```javascript
const integration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 2000,
    framebufferWidth: 800,
    framebufferHeight: 600,
    consoleMaxLines: 32
});

await integration.loadBrick('program.brick');
```

### Manual Control

```javascript
const integration = new PixelCPUIntegration(infiniteMap);

// Create visual components manually
integration.createFramebufferTexture();
integration.createConsoleTile();
integration.createStateOverlay();

// Load program
await integration.cpu.loadBrick('/path/to/program.brick');

// Start execution
integration.running = true;

// Execute frames
app.ticker.add(() => {
    integration.executeFrame();
});
```

### Interactive Controls

```javascript
// Pause execution
integration.pause();

// Resume execution
integration.resume();

// Step through instructions
const result = integration.step();
console.log(`PC: ${result.pc}, Opcode: ${result.opcode}`);

// Reset CPU
integration.reset();
```

### Console Scrolling

```javascript
// Write to console
integration.writeConsole(72); // 'H'
integration.writeConsole(101); // 'e'
integration.writeConsole(108); // 'l'
integration.writeChannel(108); // 'l'
integration.writeConsole(111); // 'o'
integration.writeConsole(10); // Newline

// Update display
integration.updateConsoleDisplay();

// Scroll up to see older output
integration.scrollConsoleUp(5);

// Scroll down to see newer output
integration.scrollConsoleDown(2);

// Jump to bottom (latest output)
integration.scrollConsoleToBottom();

// Jump to top (oldest output)
integration.scrollConsoleToTop();
```

### Framebuffer Operations

```javascript
// Create framebuffer
integration.createFramebufferTexture();

// Change resolution
integration.setFramebufferResolution(800, 600);

// Get current resolution
const resolution = integration.getFramebufferResolution();
console.log(`Resolution: ${resolution.width}x${resolution.height}`);

// Clear framebuffer
integration.clearFramebuffer();

// Update framebuffer (called automatically by executeFrame)
integration.updateFramebuffer();
```

### State Monitoring

```javascript
// Get current state
const state = integration.getState();
console.log(`PC: 0x${state.pc.toString(16)}`);
console.log(`Cycles: ${state.cycles}`);
console.log(`Running: ${state.running}`);
console.log(`Paused: ${state.paused}`);

// Get performance stats
const stats = integration.getPerformanceStats();
console.log(`Execution Time: ${stats.lastExecutionTime.toFixed(2)}ms`);
console.log(`Framebuffer Updates: ${stats.framebufferUpdateCount}`);
```

### Error Handling

```javascript
try {
    await integration.loadBrick('program.brick');
} catch (error) {
    console.error('Failed to load brick:', error);
}

// Check if CPU is halted
if (integration.cpu.halted) {
    console.log('CPU halted');
    // Reset and try again
    integration.reset();
    integration.running = true;
}
```

---

## Memory-Mapped I/O

### Console Output

Write to console memory address to output text:

```javascript
// Console base address: 0x20000000
const consoleBase = 0x20000000;

// Write characters
integration.cpu.writeMemory(consoleBase, 72); // 'H'
integration.cpu.writeMemory(consoleBase + 1, 101); // 'e'
integration.cpu.writeMemory(consoleBase + 2, 108); // 'l'
integration.cpu.writeMemory(consoleBase + 3, 108); // 'l'
integration.cpu.writeMemory(consoleBase + 4, 111); // 'o'
integration.cpu.writeMemory(consoleBase + 5, 10); // Newline
```

### Framebuffer Display

Write to framebuffer memory address to display graphics:

```javascript
// Framebuffer base address: 0x30000000
const fbBase = 0x30000000;
const width = 640;
const height = 480;

// Write a red pixel at (100, 100)
const pixelOffset = (100 * width + 100) * 4;
integration.cpu.writeMemory(fbBase + pixelOffset, 255);     // R
integration.cpu.writeMemory(fbBase + pixelOffset + 1, 0);   // G
integration.cpu.writeMemory(fbBase + pixelOffset + 2, 0);   // B
integration.cpu.writeMemory(fbBase + pixelOffset + 3, 255); // A
```

---

## License

This API is part of the Geometry OS project. See the project license for details.

---

## Support

For issues, questions, or contributions, please refer to the project repository.
