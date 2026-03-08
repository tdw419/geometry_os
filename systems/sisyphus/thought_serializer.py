import json
import hashlib
import time
import struct
from dataclasses import dataclass
from typing import Tuple, Dict, Any
from .native_hilbert import NativeHilbertLUT

@dataclass
class ThoughtGlyph:
    thought_type: str  # "gvn", "slice", "heuristic", "checkpoint", "task_start", "task_complete"
    content: str
    hilbert_index: int
    color: Tuple[float, float, float, float]  # RGBA (0.0 - 1.0)
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

    def _get_color(self, thought_type: str) -> Tuple[float, float, float, float]:
        return self.colors.get(thought_type.lower(), self.colors["default"])

    def _calculate_hilbert_index(self, content: str) -> int:
        """Deterministically map content to a Hilbert index."""
        # Hash the content to get a stable pseudo-random value
        h = hashlib.sha256(content.encode('utf-8')).digest()
        # Use first 4 bytes as a u32, map to the grid size
        val = struct.unpack('<I', h[:4])[0]
        return val % (self.grid_size * self.grid_size)

    def serialize(self, thought: Dict[str, Any]) -> ThoughtGlyph:
        thought_type = thought.get("type", "default")
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

    def to_glyph_command(self, glyph: ThoughtGlyph) -> bytes:
        """
        Convert to WGSL glyph command format.
        Opcode 0xCE = THOUGHT_RENDER
        
        Format: [Opcode (1b)] [X (2b)] [Y (2b)] [Color R,G,B,A (4b)] [Data (7b)] = 16 bytes
        """
        opcode = 0xCE
        x, y = self.hilbert.d2xy(self.grid_size, glyph.hilbert_index)
        
        # Pack floats (0.0-1.0) into bytes (0-255)
        r = int(glyph.color[0] * 255)
        g = int(glyph.color[1] * 255)
        b = int(glyph.color[2] * 255)
        a = int(glyph.color[3] * 255)
        
        return struct.pack('<BHHBBBB7s', 
            opcode, 
            x, y, 
            r, g, b, a, 
            b'\x00' * 7 # Reserved for metadata
        )

if __name__ == "__main__":
    serializer = ThoughtSerializer()
    test_thought = {"type": "gvn", "content": "Eliminated 45 instructions in loop_0"}
    glyph = serializer.serialize(test_thought)
    print(f"Serialized Thought: {glyph}")
    cmd = serializer.to_glyph_command(glyph)
    print(f"Glyph Command (0xCE): {cmd.hex()}")
