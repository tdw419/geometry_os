#!/usr/bin/env python3
"""Demo app: A simple counter that increments on spacebar press.

Demonstrates the Spatial Program Coordinator:
1. Creating a valid GEOS app binary
2. Loading it into the coordinator
3. Injecting keyboard interrupts
4. Processing syscalls

Run: python3 systems/spatial_coordinator/apps/demo_counter.py
"""
import sys
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.spatial_coordinator import (
    Coordinator,
    InterruptPacket,
    InterruptType,
    SyscallID,
    CapabilityFlags,
)
from systems.spatial_coordinator.syscall import SyscallRequest


def make_counter_app(width: int = 32, height: int = 16) -> bytes:
    """Create a minimal counter app binary.

    The app:
    - Has a 32x16 grid
    - Wants keyboard events
    - Maintains a counter in memory slot 0
    - Increments counter on spacebar (0x20)
    """
    header = (
        b'GEOS'  # Magic (4 bytes)
        + width.to_bytes(2, 'little')   # Width
        + height.to_bytes(2, 'little')  # Height
        + b'\x40\x00'  # Mem size: 64 slots
        + b'\x00\x00'  # Entry point: (0, 0)
        + b'\x00\x00'  # Handler table offset: 0
        + CapabilityFlags.WANTS_KEYBOARD.to_bytes(2, 'little')  # Flags
    )

    # Pad with zeros for code section (in real app, this would be glyph opcodes)
    code = b'\x00' * (width * height)

    return header + code


def main():
    print("=" * 60)
    print("Spatial Program Coordinator - Demo Counter App")
    print("=" * 60)
    print()

    # Create coordinator
    coordinator = Coordinator(map_width=1024, map_height=1024)
    print(f"✓ Coordinator created (1024x1024 map)")
    print()

    # Load the counter app
    app_data = make_counter_app()
    app_id = coordinator.load_app(app_data)

    if app_id is None:
        print("✗ Failed to load app")
        return 1

    print(f"✓ Counter app loaded (app_id={app_id})")

    region = coordinator.get_app_region(app_id)
    print(f"  Region: ({region.x}, {region.y}) {region.width}x{region.height}")
    print()

    # Simulate 10 frames with spacebar presses
    print("Simulating keyboard events...")
    print("-" * 40)

    for frame in range(10):
        # Inject spacebar on frames 2, 5, 8
        if frame in [2, 5, 8]:
            packet = InterruptPacket(
                type=InterruptType.KEYBOARD,
                payload=0x20,  # spacebar
                timestamp=frame,
                source=0,
                x=region.x,  # Target app's region
                y=region.y,
            )
            result = coordinator.inject_interrupt(packet)
            print(f"  Frame {frame}: Injected spacebar -> {'queued' if result else 'rejected'}")
        else:
            print(f"  Frame {frame}: (no input)")

        # Tick the coordinator
        coordinator.tick()

    print()
    print("-" * 40)
    print(f"✓ Simulation complete")
    print(f"  Final frame count: {coordinator.frame_count}")
    print(f"  Apps loaded: {coordinator.app_count}")
    print()

    # Unload app
    coordinator.unload_app(app_id)
    print(f"✓ App unloaded")
    print(f"  Apps remaining: {coordinator.app_count}")
    print()

    print("=" * 60)
    print("Demo complete!")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
