"""Counter Glyph App.

A simple counter that increments when spacebar is pressed.
Demonstrates: keyboard interrupts, arithmetic, register usage.

Layout (8x4 glyphs):
┌────────┐
│Counter:│
│   42   │
│        │
│[space] │
└────────┘
"""

import struct
from systems.spatial_coordinator.glyph_vm import assemble, Opcode
from systems.spatial_coordinator.opcodes import (
    R0, R1, R2, R3, R4, R5, R6, R7,
    R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE,
)


def build_counter_app() -> bytes:
    """Build the counter app binary.

    Registers:
        R0: Counter value
        R1: Spacebar keycode (0x20)
        R2: Interrupt payload (temp)
        R3: Jump target (temp)
        R4: Digit offset for display
        R5: Hundreds digit
        R6: Tens digit
        R7: Ones digit
    """
    # Simple loop: check for interrupt, process, halt
    # Coordinator will restart us each frame

    code = assemble([
        # === Main ===
        # Check if we got a keyboard interrupt
        (Opcode.MOV, R2, R_INT_TYPE, 0),    # R2 = INT_TYPE
        (Opcode.MOVI, R3, 0, 1),             # R3 = 1 (keyboard type)
        (Opcode.CMP, R2, R3, 0),             # Compare: R2 == 1?
        (Opcode.MOVI, R4, 0, 28),            # R4 = halt address
        (Opcode.JNE, 0, R4, 0),              # Jump if not keyboard

        # Check for spacebar
        (Opcode.MOV, R2, R_INT_PAYLOAD, 0),  # R2 = INT_PAYLOAD (keycode)
        (Opcode.MOVI, R3, 0, 0x20),          # R3 = spacebar keycode
        (Opcode.CMP, R2, R3, 0),             # Compare: R2 == spacebar?
        (Opcode.MOVI, R4, 0, 28),            # R4 = halt address
        (Opcode.JNE, 0, R4, 0),              # Jump if not spacebar

        # Increment counter
        (Opcode.ADDI, R0, 0, 1),             # R0 += 1

        # Halt - coordinator will restart next frame
        (Opcode.HALT, 0, 0, 0),              # 28: halt

        # Pad to make code at least 32 bytes
        (Opcode.NOP, 0, 0, 0),
        (Opcode.NOP, 0, 0, 0),
        (Opcode.NOP, 0, 0, 0),
    ])

    # Build header
    header = (
        b'GEOS'                              # Magic
        + (8).to_bytes(2, 'little')          # Width (8 glyphs)
        + (4).to_bytes(2, 'little')          # Height (4 glyphs)
        + (256).to_bytes(2, 'little')        # Memory slots (1KB)
        + (0).to_bytes(2, 'little')          # Entry point (0, 0)
        + (0).to_bytes(2, 'little')          # Handler table offset
        + (0x01).to_bytes(2, 'little')       # Flags: WANTS_KEYBOARD
    )

    return header + code


def get_initial_glyphs() -> list:
    """Get initial glyph grid for display."""
    # 8x4 grid showing initial state
    lines = [
        "Counter:",
        "    0   ",
        "        ",
        "[space] ",
    ]

    glyphs = []
    for line in lines:
        for ch in line:
            glyphs.append(ord(ch))
        # Pad to width 8
        while len(glyphs) % 8 != 0:
            glyphs.append(32)  # Space

    return glyphs


def render_counter(value: int, width: int = 8, height: int = 4) -> list:
    """Render counter value to glyph grid."""
    lines = [
        "Counter:",
        f"{value:^8}",  # Center the number
        "        ",
        "[space] ",
    ]

    glyphs = []
    for line in lines:
        for ch in line:
            glyphs.append(ord(ch))
        # Pad to width
        while len(glyphs) % width != 0:
            glyphs.append(32)

    # Ensure we have exactly width * height glyphs
    while len(glyphs) < width * height:
        glyphs.append(32)

    return glyphs[:width * height]


# Export for app loader
APP_BINARY = build_counter_app()
APP_NAME = "counter"
APP_WIDTH = 8
APP_HEIGHT = 4
APP_FLAGS = 0x01  # WANTS_KEYBOARD


if __name__ == "__main__":
    # Test building the app
    binary = build_counter_app()
    print(f"Counter app: {len(binary)} bytes")
    print(f"Header: {binary[:16].hex()}")
    print(f"Code: {binary[16:].hex()}")

    # Test rendering
    glyphs = render_counter(42)
    print(f"\nRendered (42):")
    for i, g in enumerate(glyphs):
        if i % 8 == 0:
            print()
        print(chr(g), end='')
    print()
