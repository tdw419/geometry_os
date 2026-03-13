# Spatial Program Coordinator

GPU-first windowing system for Geometry OS where applications are autonomous regions of executing glyphs on the Infinite Map.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    SPATIAL PROGRAM COORDINATOR                  │
├─────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │ App A        │    │ App B        │    │ App C        │      │
│  │ 64x32        │    │ 128x64       │    │ 32x32        │      │
│  └──────────────┘    └──────────────┘    └──────────────┘      │
│                                                                 │
│  ═══════════════════════ INFINITE MAP ═════════════════════════ │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  COORDINATOR SERVICES                                          │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │
│  │ Interrupt   │ │ Region     │ │ Syscall     │              │
│  │ Injector    │ │ Allocator  │ │ Handler     │              │
│  └─────────────┘ └─────────────┘ └─────────────┘              │
└─────────────────────────────────────────────────────────────────┘
```

## Components

| Component | File | Purpose |
|-----------|------|---------|
| **Types** | `types.py` | InterruptType, CapabilityFlags, SyscallID, ErrorCode, Opcode |
| **Interrupt** | `interrupt.py` | 5-byte packet format, propagation (4-connected, TTL=64) |
| **Header** | `header.py` | 16-byte GEOS app header parsing |
| **Allocator** | `allocator.py` | First-fit region allocation with compaction |
| **Syscall** | `syscall.py` | Queue (depth=16), focus arbitration |
| **Coordinator** | `coordinator.py` | Main orchestrator |

## Usage

```python
from systems.spatial_coordinator import Coordinator, InterruptPacket, InterruptType

# Create coordinator (1024x1024 map)
coordinator = Coordinator(map_width=1024, map_height=1024)

# Load app from binary
with open("app.glyph", "rb") as f:
    app_id = coordinator.load_app(f.read())

# Inject keyboard event
packet = InterruptPacket(
    type=InterruptType.KEYBOARD,
    payload=0x20,  # spacebar
    timestamp=1,
    source=0,
    x=0, y=0
)
coordinator.inject_interrupt(packet)

# Run frame
coordinator.tick()
```

## App Format

Apps are 16-byte header + code:

| Offset | Size | Field |
|--------|------|-------|
| 0-3 | 4 | Magic "GEOS" |
| 4-5 | 2 | Width |
| 6-7 | 2 | Height |
| 8-9 | 2 | Memory slots |
| 10-11 | 2 | Entry point (x\|y<<8) |
| 12-13 | 2 | Handler offset |
| 14-15 | 2 | Flags |

## Interrupt Protocol

5-byte packet injected at spatial coordinates:

| Offset | Size | Field |
|--------|------|-------|
| 0 | 1 | Type (0x01=KEY, 0x02=MOUSE) |
| 1 | 1 | Payload (keycode/button) |
| 2-3 | 2 | Timestamp (LE) |
| 4 | 1 | Source (device seat) |

Propagation: 4-connected neighbors, max TTL=64

## Syscalls

| ID | Name | Args |
|----|------|------|
| 0x01 | RESIZE | width, height |
| 0x02 | CLOSE | exit_code |
| 0x03 | SPAWN | app_ptr, flags |
| 0x04 | READ_CLIP | buf, max_len |
| 0x05 | WRITE_CLIP | buf, len |
| 0x06 | GET_TIME | - |
| 0x07 | REQUEST_FOCUS | - |
| 0x08 | YIELD_FOCUS | - |

## Tests

```bash
python3 -m pytest systems/spatial_coordinator/tests/ -v
```

150 tests covering:
- Type definitions
- Interrupt packet packing/unpacking
- Header parsing
- Region allocation (first-fit, compaction)
- Syscall queue and focus arbitration
- Coordinator integration

## Spec

See: `docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md`

## WGSL Shaders

GPU implementations in `wgsl/`:
- `interrupt_injector.wgsl` - Inject and propagate interrupts
- `app_loader.wgsl` - Parse headers, load apps
- `syscall_handler.wgsl` - Process SYNC opcodes
- `coordinator.wgsl` - Main compute shader

## Visual Shell Integration

The Spatial Coordinator bridges to the PixiJS infinite desktop via WebSocket:

```
┌──────────────────┐     WebSocket      ┌───────────────────┐
│ Spatial          │ ──────────────────▶│ PixiJS Desktop    │
│ Coordinator      │     ws://8769      │ (Visual Shell)    │
│ (Python)         │ ◀──────────────────│ (JavaScript)      │
└──────────────────┘    interrupts      └───────────────────┘
```

### Backend Bridge

```python
# systems/visual_shell/api/spatial_coordinator_bridge.py
from systems.visual_shell.api.spatial_coordinator_bridge import SpatialCoordinatorBridge

bridge = SpatialCoordinatorBridge(port=8769)
bridge.initialize_coordinator()
await bridge.run(auto_tick=True)
```

### Frontend Client

```javascript
// systems/visual_shell/web/SpatialCoordinatorClient.js
import { SpatialCoordinatorClient, SpatialWindowRenderer } from './SpatialCoordinatorClient.js';

const client = new SpatialCoordinatorClient('ws://localhost:8769');
client.connect();

// Auto-render apps as windows
const renderer = new SpatialWindowRenderer(client, pixiContainer);
```

### Protocol

**Incoming (frontend → backend):**
```json
{"type": "interrupt", "data": {"interrupt_type": "keyboard", "payload": 32, "x": 10, "y": 20}}
{"type": "load_app", "data": {"binary": "<base64>"}}
{"type": "tick"}
```

**Outgoing (backend → frontend):**
```json
{"type": "app_loaded", "data": {"app_id": 0, "x": 0, "y": 0, "width": 32, "height": 16, "flags": 1}}
{"type": "focus_changed", "data": {"app_id": 0}}
{"type": "frame_tick", "data": {"frame": 100, "app_count": 1}}
```

### Tests

```bash
# Bridge tests
python3 -m pytest systems/visual_shell/api/tests/test_spatial_coordinator_bridge.py -v
# 11 tests
```

## Glyph VM

The Glyph VM is a CPU interpreter for executing spatial app bytecode.

### Instruction Format

All instructions are 4 bytes:
```
| Opcode (1) | Rd (1) | Rs1 (1) | Rs2/Imm (1) |
```

### Registers

| Register | Purpose |
|----------|---------|
| R0-R27 | General purpose |
| R0-R3 | Syscall args/return |
| R28 | Region origin (x<<16 \| y) |
| R29 | INT_PAYLOAD |
| R30 | INT_TYPE |
| R31 | INT_SOURCE |

### Instruction Set

| Opcode | Name | Description |
|--------|------|-------------|
| 0x00 | NOP | No operation |
| 0xFF | HALT | Stop execution |
| 0x10 | MOV | Rd = Rs1 |
| 0x11 | MOVI | Rd = imm8 |
| 0x12 | LD | Rd = mem[Rs1] |
| 0x13 | ST | mem[Rs1] = Rd |
| 0x20 | ADD | Rd += Rs1 |
| 0x21 | SUB | Rd -= Rs1 |
| 0x22 | MUL | Rd *= Rs1 |
| 0x23 | DIV | Rd /= Rs1 |
| 0x25 | ADDI | Rd += imm8 |
| 0x40 | CMP | Set flags from Rd - Rs1 |
| 0x41 | CMPI | Set flags from Rd - imm8 |
| 0x02 | JEQ | Jump if zero flag |
| 0x03 | JNE | Jump if not zero flag |
| 0x08 | CALL | Call subroutine |
| 0x09 | RET | Return from subroutine |
| 0xFE | SYNC | Syscall |
| 0x50 | DRAW | Draw to display |

### Usage

```python
from systems.spatial_coordinator import GlyphVM, assemble, Opcode, R0, R1

vm = GlyphVM()

# Simple program: R0 = 5 + 3
code = assemble([
    (Opcode.MOVI, R0, 0, 5),    # R0 = 5
    (Opcode.ADDI, R0, 0, 3),    # R0 += 3
    (Opcode.HALT, 0, 0, 0),
])

vm.load_app(b'GEOS' + b'\x00' * 12 + code)
vm.run(max_frames=0)

print(vm.registers[R0])  # Output: 8
```

### Demo

```bash
python3 systems/spatial_coordinator/apps/demo_glyph_vm.py
```
