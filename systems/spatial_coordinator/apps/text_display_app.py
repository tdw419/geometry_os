"""Text Display Glyph App.

Displays text on a glyph grid with cursor.
Demonstrates: memory operations, text rendering, keyboard input.

Layout (32x8 glyphs):
┌──────────────────────────────────┐
│Text Display                      │
│Hello, World!_                    │
│                                  │
│Type to add characters...         │
└──────────────────────────────────┘
"""

import struct
from systems.spatial_coordinator.glyph_vm import assemble, Opcode
from systems.spatial_coordinator.opcodes import (
    R0, R1, R2, R3, R4, R5, R6, R7,
    R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE,
)


def build_text_display_app(width: int = 32, height: int = 8) -> bytes:
    """Build the text display app binary.

    Registers:
        R0: Cursor position (offset in buffer)
        R1: Buffer start address
        R2: Buffer end address
        R3: Current character from interrupt
        R4: Temp
        R5: Temp
        R6: Temp
        R7: Temp
    """
    # Memory layout:
    # 0x0000-0x001F: Header (in code section)
    # 0x0100-0x01FF: Text buffer (256 chars)
    # 0x0200-0x02FF: Display buffer (copied to glyphs)

    buffer_start = 0x100
    buffer_end = buffer_start + width * height
    display_start = 0x200

    code = assemble([
        # === Initialize ===
        (Opcode.MOVI, R0, 0, 0),            # R0 = cursor pos (0)
        (Opcode.MOVI, R1, 0, buffer_start >> 8),  # R1 high = buffer_start >> 8
        (Opcode.MOVI, R4, 0, buffer_start & 0xFF),  # R4 low = buffer_start & 0xFF

        # === Main Loop ===
        # Wait for keyboard interrupt

        # Check interrupt type
        (Opcode.MOV, R3, R_INT_TYPE, 0),
        (Opcode.MOVI, R4, 0, 1),
        (Opcode.CMP, R3, R4, 0),
        (Opcode.MOVI, R5, 0, 56),           # Skip to halt if not keyboard
        (Opcode.JNE, 0, R5, 0),

        # Get character from payload
        (Opcode.MOV, R3, R_INT_PAYLOAD, 0),

        # Check for special keys
        # Backspace (0x08): delete character
        (Opcode.MOVI, R4, 0, 0x08),
        (Opcode.CMP, R3, R4, 0),
        (Opcode.MOVI, R5, 0, 48),           # Jump to backspace handler
        (Opcode.JEQ, 0, R5, 0),

        # Enter (0x0D): ignored for now
        (Opcode.MOVI, R4, 0, 0x0D),
        (Opcode.CMP, R3, R4, 0),
        (Opcode.MOVI, R5, 0, 56),           # Skip to halt
        (Opcode.JEQ, 0, R5, 0),

        # === Add character ===
        # Store character at cursor position
        # Calculate address: buffer_start + cursor
        (Opcode.MOVI, R1, 0, buffer_start & 0xFF),  # R1 = buffer_start (low byte)
        (Opcode.ADD, R1, R0, 0),            # R1 += R0 (cursor offset)
        (Opcode.ST, R3, R1, 0),             # mem[R1] = R3 (store char)

        # Increment cursor
        (Opcode.ADDI, R0, 0, 1),

        # Check bounds
        (Opcode.MOVI, R4, 0, (width * height - 1) & 0xFF),
        (Opcode.CMP, R0, R4, 0),
        (Opcode.MOVI, R5, 0, 56),           # Skip to halt
        (Opcode.JGT, 0, R5, 0),             # If cursor > max, skip

        # Clamp cursor
        (Opcode.MOV, R0, R4, 0),            # R0 = max

        # === Halt ===
        (Opcode.HALT, 0, 0, 0),

        # === Backspace handler ===
        # Decrement cursor
        (Opcode.MOVI, R4, 0, 0),
        (Opcode.CMP, R0, R4, 0),
        (Opcode.MOVI, R5, 0, 56),           # Skip if cursor == 0
        (Opcode.JEQ, 0, R5, 0),

        # Decrement cursor
        (Opcode.SUBI, R0, 0, 1),

        # Clear character at cursor
        (Opcode.MOVI, R1, 0, buffer_start & 0xFF),
        (Opcode.ADD, R1, R0, 0),
        (Opcode.MOVI, R3, 0, 32),           # Space character
        (Opcode.ST, R3, R1, 0),

        # Halt
        (Opcode.HALT, 0, 0, 0),
    ])

    # Build header
    header = (
        b'GEOS'
        + (width).to_bytes(2, 'little')
        + (height).to_bytes(2, 'little')
        + (512).to_bytes(2, 'little')        # Memory slots (2KB)
        + (0).to_bytes(2, 'little')          # Entry point
        + (0).to_bytes(2, 'little')          # Handler table offset
        + (0x01).to_bytes(2, 'little')       # Flags: WANTS_KEYBOARD
    )

    return header + code


def get_initial_glyphs(width: int = 32, height: int = 8) -> list:
    """Get initial glyph grid for display."""
    lines = [
        "Text Display                      ",
        "Type to add characters...         ",
        "                                  ",
        "                                  ",
        "                                  ",
        "                                  ",
        "                                  ",
        "                                  ",
    ]

    glyphs = []
    for line in lines:
        for ch in line:
            glyphs.append(ord(ch))
        # Pad to width
        while len(glyphs) % width != 0:
            glyphs.append(32)

    return glyphs[:width * height]


def render_text_buffer(buffer: bytes, width: int = 32, height: int = 8,
                       cursor_pos: int = 0) -> list:
    """Render text buffer to glyph grid with cursor."""
    glyphs = []

    for i in range(width * height):
        if i < len(buffer):
            ch = buffer[i]
            if ch == 0:
                ch = 32  # Null → space
        else:
            ch = 32  # Space

        # Show cursor
        if i == cursor_pos:
            # Use block cursor (inverse or underscore)
            if ch == 32:
                ch = ord('_')  # Underscore cursor
            # Could also use inverse: ch = ch | 0x100 for attribute

        glyphs.append(ch)

    return glyphs


# Export for app loader
APP_BINARY = build_text_display_app()
APP_NAME = "text_display"
APP_WIDTH = 32
APP_HEIGHT = 8
APP_FLAGS = 0x01  # WANTS_KEYBOARD


if __name__ == "__main__":
    binary = build_text_display_app()
    print(f"Text display app: {len(binary)} bytes")

    # Test rendering
    buffer = b"Hello, World!" + b"\x00" * 250
    glyphs = render_text_buffer(buffer, cursor_pos=13)
    print(f"\nRendered (cursor=13):")
    for y in range(8):
        for x in range(32):
            print(chr(glyphs[y * 32 + x]), end='')
        print()
