#!/usr/bin/env python3
"""Demo: Glyph VM executing real bytecode.

Demonstrates:
1. Loading an app with actual executable code
2. Handling keyboard interrupts
3. Incrementing a counter on spacebar

Run: python3 systems/spatial_coordinator/apps/demo_glyph_vm.py
"""
import sys
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.spatial_coordinator import (
    GlyphVM,
    assemble,
    Opcode,
    InterruptType,
    SyscallID,
    R0, R1, R2, R3,
    R_INT_PAYLOAD, R_INT_TYPE,
)


def main():
    print("=" * 60)
    print("Glyph VM Demo - Counter Application")
    print("=" * 60)
    print()

    # Create VM
    vm = GlyphVM()
    print("✓ VM created")

    # Counter stored at memory address 200
    COUNTER_ADDR = 200

    # Initialize counter
    vm.memory[COUNTER_ADDR:COUNTER_ADDR+4] = (0).to_bytes(4, 'little')
    print(f"Counter initialized at memory[{COUNTER_ADDR}]")

    def get_counter():
        return int.from_bytes(vm.memory[COUNTER_ADDR:COUNTER_ADDR+4], 'little')

    def set_counter(val):
        vm.memory[COUNTER_ADDR:COUNTER_ADDR+4] = val.to_bytes(4, 'little')

    print()

    # Simple program: increment counter on spacebar
    # Layout (after 16-byte header):
    # 16: MOVI R2, 0, 0x20
    # 20: CMP R29, R2, 0
    # 24: MOVI R3, 0, 48  <-- jump target (HALT at 48)
    # 28: JNE 0, R3, 0
    # 32: MOVI R1, 0, 200
    # 36: LD R0, R1, 0
    # 40: ADDI R0, 0, 1
    # 44: ST R0, R1, 0
    # 48: HALT  <-- jump here if not space

    code = assemble([
        # Compare payload with spacebar (0x20)
        (Opcode.MOVI, R2, 0, 0x20),    # R2 = 0x20
        (Opcode.CMP, R_INT_PAYLOAD, R2, 0),  # Compare INT_PAYLOAD with R2

        # Jump to done if not equal (skip increment)
        (Opcode.MOVI, R3, 0, 48),      # R3 = address of HALT (48)
        (Opcode.JNE, 0, R3, 0),        # Jump if not equal

        # Increment counter
        (Opcode.MOVI, R1, 0, COUNTER_ADDR & 0xFF),  # R1 = 200 (low byte)
        (Opcode.LD, R0, R1, 0),        # R0 = mem[200]
        (Opcode.ADDI, R0, 0, 1),       # R0 += 1
        (Opcode.ST, R0, R1, 0),        # mem[200] = R0

        # done (at offset 48)
        (Opcode.HALT, 0, 0, 0),
    ])

    # Create header + code
    header = b'GEOS' + b'\x00' * 12  # 16-byte header
    app = header + code

    print(f"✓ App assembled ({len(app)} bytes, {len(code)} code bytes)")
    print()

    # Simulate keyboard events
    print("Simulating keyboard events...")
    print("-" * 40)

    events = [
        (0x20, "space"),   # Increment
        (0x20, "space"),   # Increment
        (0x20, "space"),   # Increment
        (0x61, "a"),       # No action (not space)
        (0x20, "space"),   # Increment
        (0x20, "space"),   # Increment
    ]

    for keycode, name in events:
        print(f"\nKey: {name} (0x{keycode:02X})")

        # Load fresh app
        vm.load_app(header + code)

        # Set up interrupt
        vm.set_interrupt(int_type=InterruptType.KEYBOARD, payload=keycode)

        # Run until halt
        steps = vm.run(max_frames=0)

        print(f"  Steps: {steps}, Counter: {get_counter()}, Halted: {vm.halted}")

        if vm.error:
            print(f"  Error: {vm.error}")

        # Reset for next key
        vm.halted = False
        vm.error = None

    print()
    print("-" * 40)
    print(f"Final counter value: {get_counter()}")
    print()
    print("=" * 60)
    print("Demo complete!")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
