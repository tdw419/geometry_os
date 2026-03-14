import hashlib
import struct
import time
from dataclasses import dataclass
from typing import Any

from .native_hilbert import NativeHilbertLUT


@dataclass
class ThoughtGlyph:
    thought_type: str  # "gvn", "slice", "heuristic", "checkpoint", "task_start", "task_complete"
    content: str
    hilbert_index: int
    color: tuple[float, float, float, float]  # RGBA (0.0 - 1.0)
    timestamp: float

class ThoughtSerializer:
    def __init__(self, hilbert: NativeHilbertLUT = None):
        self.hilbert = hilbert if hilbert else NativeHilbertLUT()
        self.order = 8  # 256x256 grid
        self.grid_size = 2**self.order

        # Semantic Color Palette
        self.colors = {
            "task_start": (0.0, 1.0, 1.0, 1.0),    # Cyan
            "task_complete": (0.0, 1.0, 0.0, 1.0), # Green
            "task_failure": (1.0, 0.0, 0.0, 1.0),  # Red
            "gvn": (1.0, 1.0, 0.0, 1.0),           # Yellow
            "dna_synthesis": (1.0, 0.0, 1.0, 1.0), # Magenta
            "heuristic": (0.5, 0.5, 1.0, 1.0),     # Light Blue
            "checkpoint": (1.0, 0.5, 0.0, 1.0),    # Orange
            "default": (0.8, 0.8, 0.8, 1.0)        # Gray
        }

    def _get_color(self, thought_type: str) -> tuple[float, float, float, float]:
        return self.colors.get(thought_type.lower(), self.colors["default"])

    def _calculate_hilbert_index(self, content: str) -> int:
        """Deterministically map content to a Hilbert index."""
        # Hash the content to get a stable pseudo-random value
        h = hashlib.sha256(content.encode('utf-8')).digest()
        # Use first 4 bytes as a u32, map to the grid size
        val = struct.unpack('<I', h[:4])[0]
        return val % (self.grid_size * self.grid_size)

    def serialize(self, thought: dict[str, Any]) -> ThoughtGlyph:
        thought_type = thought.get("type", "default")

        # Handle TOKEN_LINK specially
        if thought_type == "TOKEN_LINK":
            return self._serialize_token_link(thought)

        content = str(thought.get("content", thought.get("task_name", "")))

        hilbert_index = self._calculate_hilbert_index(content)
        color = self._get_color(thought_type)

        return ThoughtGlyph(
            thought_type=thought_type,
            content=content,
            hilbert_index=hilbert_index,
            color=color,
            timestamp=time.time()
        )

    def _serialize_token_link(self, thought: dict) -> ThoughtGlyph:
        """Serialize a TOKEN_LINK thought for semantic proximity lines."""
        prev_x = thought.get("prev_x", 0)
        prev_y = thought.get("prev_y", 0)
        delta_x = thought.get("delta_x", 0)
        delta_y = thought.get("delta_y", 0)
        color = thought.get("color", (0.5, 0.5, 0.5, 0.3))

        # Use start position for Hilbert index
        hilbert_idx = self.hilbert.xy2d(self.grid_size, prev_x, prev_y)

        return ThoughtGlyph(
            thought_type="TOKEN_LINK",
            content=f"link_{prev_x}_{prev_y}_{delta_x}_{delta_y}",
            hilbert_index=hilbert_idx,
            color=color,
            timestamp=time.time()
        )

    def to_glyph_command(self, glyph: ThoughtGlyph) -> bytes:
        """
        Convert to WGSL glyph command format.

        TOKEN_LINK (0x0A): [Opcode (1b)] [X (2b)] [Y (2b)] [dx (2b)] [dy (2b)] [Color R,G,B,A (4b)] [padding (4b)] = 16 bytes
        THOUGHT_RENDER (0xCE): [Opcode (1b)] [X (2b)] [Y (2b)] [Color R,G,B,A (4b)] [Data (7b)] = 16 bytes
        """
        # Pack floats (0.0-1.0) into bytes (0-255)
        r = int(glyph.color[0] * 255)
        g = int(glyph.color[1] * 255)
        b = int(glyph.color[2] * 255)
        a = int(glyph.color[3] * 255)

        if glyph.thought_type == "TOKEN_LINK":
            # Opcode 0x0A for TOKEN_LINK
            # Format: [opcode:1][x:2][y:2][dx:2][dy:2][r:1][g:1][b:1][a:1][padding:3] = 16 bytes
            opcode = 0x0A
            x, y = self.hilbert.d2xy(self.grid_size, glyph.hilbert_index)

            # Parse delta from content (format: link_prevx_prevy_deltax_deltay)
            parts = glyph.content.split('_')
            if len(parts) >= 5:
                dx = int(parts[3])
                dy = int(parts[4])
            else:
                dx, dy = 0, 0

            return struct.pack('<BHHHHBBBB3s',
                opcode,
                x, y,
                dx & 0xFFFF, dy & 0xFFFF,  # handle negative values
                r, g, b, a,
                b'\x00' * 3  # padding
            )

        # Default: THOUGHT_RENDER opcode 0xCE
        opcode = 0xCE
        x, y = self.hilbert.d2xy(self.grid_size, glyph.hilbert_index)

        return struct.pack('<BHHBBBB7s',
            opcode,
            x, y,
            r, g, b, a,
            b'\x00' * 7  # Reserved for metadata
        )

if __name__ == "__main__":
    serializer = ThoughtSerializer()
    test_thought = {"type": "gvn", "content": "Eliminated 45 instructions in loop_0"}
    glyph = serializer.serialize(test_thought)
    print(f"Serialized Thought: {glyph}")
    cmd = serializer.to_glyph_command(glyph)
    print(f"Glyph Command (0xCE): {cmd.hex()}")
