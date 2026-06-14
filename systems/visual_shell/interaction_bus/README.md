# Visual Interaction Bus

The Visual Interaction Bus is the high-performance input pipeline for Geometry OS. It connects physical Human Interface Devices (HID) directly to the GPU-resident Window Table, bypassing the traditional CPU-bound desktop stack.

## Architecture

```
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│  Physical Mouse  │ ───► │  Kernel Module   │ ───► │   VRAM Queue     │
│  (USB / I2C)     │      │ (geometry_input) │      │   (DMA-BUF)      │
└──────────────────┘      └──────────────────┘      └──────────────────┘
                                                             │
                                                             ▼
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│  Glyph VM        │ ◄─── │  Window Table    │ ◄─── │  Event Shader    │
│  (Client App)    │      │  (GPU Memory)    │      │  (event_queue)   │
└──────────────────┘      └──────────────────┘      └──────────────────┘
```

## Key Components

1.  **`geometry_input.c`**: A Linux kernel module that uses the `evdev` interface to capture raw input events and writes them directly into a shared memory region (VRAM via DMA-BUF).
2.  **`input_types.rs`**: Shared data structures (InputEvent, WindowState) used by C, Rust, and WGSL.
3.  **`event_queue.wgsl`**: A compute shader that runs every frame. It consumes the event queue, performs hit-testing against the window table, and updates window focus/position.
4.  **`window_table.rs`**: Manages the GPU-resident table of active windows.
5.  **`event_processor.rs`**: The Rust driver that coordinates the compute shader dispatch.

## Zero-Copy Performance

By writing events directly to VRAM from the kernel module, we achieve:
- **Zero context switches**: Input never passes through X11, Wayland, or userspace event loops.
- **Hardware-speed focus**: Focus switching and window dragging are handled by the GPU in the same pass as rendering.
- **Glyph-native integration**: Windows are spatial regions that receive these events as direct memory updates.

## Building and Loading

### 1. Build the Kernel Module
(Requires Linux kernel headers)
```bash
make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
```

### 2. Load the Module
```bash
sudo insmod geometry_input.ko
```

### 3. Verify
Check `dmesg` to ensure the "Visual Interaction Bus" has initialized and captured your mouse.
