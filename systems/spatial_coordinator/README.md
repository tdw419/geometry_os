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
