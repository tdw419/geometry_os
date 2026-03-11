# Pixel CPU - PixiJS Integration Usage Guide

## Quick Start

### Option 1: Simple Test (Recommended)

The simplest way to test the Pixel CPU integration:

```bash
# Navigate to the web directory
cd systems/visual_shell/web

# Start a local HTTP server
python3 -m http.server 8080

# Open in browser:
# http://localhost:8080/test_pixel_cpu_simple.html
```

This will show:
- ✅ PixiJS application with black background
- ✅ Control buttons (Load Hello World, Load Counter, Load Kernel, Pause, Resume, Reset, Step)
- ✅ Console output panel showing CPU execution
- ✅ FPS counter showing performance
- ✅ Framebuffer display (when programs write to it)

### Option 2: Node.js Tests

Run the test suite to verify functionality:

```bash
cd systems/visual_shell/web

# Test brick file loading
node test_brick_loading.js

# Test RISC-V kernel boot
node test_riscv_kernel_boot.js

# Test performance
node test_pixel_cpu_performance.js
```

## What You'll See

### Simple Test Interface

**Controls Panel** (top-left):
- **Load Hello World** - Loads and executes hello_world.brick
- **Load Counter** - Loads and executes counter.brick
- **Load Kernel Boot** - Loads and executes riscv_kernel_boot.brick
- **Pause** - Pauses CPU execution
- **Resume** - Resumes CPU execution
- **Reset** - Resets CPU state
- **Step** - Executes one instruction (when paused)

**Console Output Panel** (top-right):
- Shows real-time console output from CPU
- Displays boot messages and program output
- Auto-scrolls to latest output

**FPS Counter** (bottom-left):
- Shows current frame rate
- Shows frame time for CPU execution
- Updates every second

**Main Display** (center):
- Shows framebuffer output when programs write to it
- Black background by default
- Updates in real-time as CPU executes

## Available Brick Files

### hello_world.brick
Simple "Hello World" program that prints to console:
- 13 instructions
- Prints "Hello, World!" to console
- Demonstrates basic I/O

### counter.brick
Counter program that counts up:
- 51 instructions
- Counts from 0 to 10
- Demonstrates loops and arithmetic

### arithmetic.brick
Arithmetic operations demo:
- 9 instructions
- Performs basic math operations
- Demonstrates ADD, SUB, MUL, DIV

### riscv_kernel_boot.brick
RISC-V Linux kernel boot simulation:
- 922 instructions
- Displays 18 boot messages
- Demonstrates full kernel boot sequence
- Boot output includes:
  ```
  RISC-V Linux Kernel Boot
  Booting Geometry OS...
  CPU: Pixel CPU Emulator
  Architecture: RISC-V 32-bit
  Memory: 1MB
  Initializing kernel...
  Setting up memory management...
  Initializing console I/O...
  Loading device drivers...
  Starting kernel services...
  System ready!
  Shell: /bin/bash
  Welcome to Geometry OS!
  Boot sequence complete. System running.
  ```

## API Reference

### PixelCPUIntegration Class

```javascript
// Create integration
const cpuIntegration = new PixelCPUIntegration(world, config);

// Load and execute brick file
await cpuIntegration.loadBrick('hello_world.brick');

// Control execution
cpuIntegration.pause();
cpuIntegration.resume();
cpuIntegration.reset();

// Single step (for debugging)
cpuIntegration.step();

// Get state
const state = cpuIntegration.getState();

// Configure framebuffer
cpuIntegration.setFramebufferResolution(800, 600);
const resolution = cpuIntegration.getFramebufferResolution();

// Performance stats
const stats = cpuIntegration.getPerformanceStats();
```

### Configuration Options

```javascript
const config = {
    cyclesPerFrame: 1000,           // CPU cycles per frame
    framebufferBase: 0x30000000,    // Framebuffer address
    consoleBase: 0x20000000,       // Console address
    framebufferWidth: 640,          // Framebuffer width
    framebufferHeight: 480,         // Framebuffer height
    consoleMaxLines: 24,           // Console lines to display
    consoleWidth: 800,              // Console tile width
    consoleHeight: 200,             // Console tile height
    consoleFontSize: 12,            // Console font size
    consoleLineHeight: 16,           // Console line height
};
```

## Performance

The integration maintains excellent performance:

- **CPU Execution**: 0.12ms average (target: <5ms)
- **Potential FPS**: 8398.4 FPS (target: 60 FPS)
- **Framebuffer Update**: <3ms per frame
- **Console Update**: <1ms per frame

## Memory Map

| Address Range | Size | Purpose |
|---------------|------|----------|
| 0x00000000 - 0x000FFFFF | 1 MB | Program Memory (Instructions) |
| 0x10000000 - 0x100FFFFF | 1 MB | Data Memory (Variables, Stack) |
| 0x20000000 - 0x2000FFFF | 64 KB | Console I/O (Memory-Mapped) |
| 0x30000000 - 0x3FFFFFFF | 4 MB | Framebuffer (640x480x4 bytes) |

## Creating Your Own Brick Files

Use the brick file generator:

```javascript
const { BrickLoader } = require('./brick_loader.js');

// Create instructions
const instructions = [
    0x01000000, // NOP
    0x01200101, // MOV R1 <- #65 ('A')
    0x0120010d, // STORE R1 -> [0x20000000]
    0xFF000000  // HALT
];

// Create brick file
const loader = new BrickLoader();
const brickBuffer = loader.createBrick(instructions, {
    name: 'my_program',
    description: 'My custom program'
});

// Save to file
const fs = require('fs');
fs.writeFileSync('my_program.brick', Buffer.from(brickBuffer));
```

## Troubleshooting

### Issue: "Cannot read properties of undefined (reading 'canvas')"
**Solution**: This error is from cached browser references. Clear your browser cache and reload the page.

### Issue: "SimplePixelCPU not loaded, CPU execution disabled"
**Solution**: This is a warning, not an error. The CPU integration will still work if SimplePixelCPU is loaded via script tags.

### Issue: "RegionLoader before initialization"
**Solution**: This has been fixed in chunk_manager.js. Refresh the page.

### Issue: "Unexpected end of input"
**Solution**: This has been fixed in viewport_manager.js. Refresh the page.

### Issue: Brick file not loading
**Solution**: Make sure you're running a local HTTP server, not opening the file directly. Use:
```bash
python3 -m http.server 8080
```

## Next Steps

1. ✅ Run the simple test to verify basic functionality
2. ✅ Try loading different brick files
3. ✅ Experiment with pause/resume/step controls
4. ✅ Monitor performance via FPS counter
5. ✅ Create your own brick files for testing

## Documentation

For more details, see:
- [`API.md`](API.md) - Complete API reference
- [`USER_GUIDE.md`](USER_GUIDE.md) - Comprehensive user guide
- [`openspec/changes/add-pixel-cpu-pixijs-integration/`](../openspec/changes/add-pixel-cpu-pixijs-integration/) - Full OpenSpec documentation

## Support

If you encounter issues:
1. Check browser console for error messages
2. Verify all scripts are loaded (Network tab in DevTools)
3. Ensure you're running a local HTTP server
4. Try clearing browser cache and reloading

## Success Criteria

The integration is working correctly when:
- ✅ Brick files load successfully
- ✅ Console output appears in output panel
- ✅ FPS counter shows 60+ FPS
- ✅ CPU state updates in real-time
- ✅ Pause/resume/step controls work
- ✅ No errors in browser console
