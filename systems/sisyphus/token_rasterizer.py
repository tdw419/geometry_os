"""
Mind's Eye: Token-to-Hilbert Rasterizer
Projecting LLM cognitive patterns into Hilbert-mapped VRAM.

Features:
- Connects to LM Studio streaming API (localhost:1234)
- Maps each generated token to a Hilbert coordinate based on token hash
- Assigns color based on token type (keyword, string, number, etc.)
- Streams to Glass Box via compositor bridge

Usage:
    # Real streaming from LM Studio
    rasterizer = TokenRasterizer()
    rasterizer.stream_from_lm_studio("Write a Python function")

    # Mock streaming for testing
    rasterizer.stream_mock("def hello(): pass")
"""

import hashlib
import json
import logging
import time
from dataclasses import dataclass, field

import requests

try:
    from .compositor_bridge import CompositorBridge
except ImportError:
    CompositorBridge = None

try:
    from .native_hilbert import NativeHilbertLUT
except ImportError:
    NativeHilbertLUT = None

logger = logging.getLogger("TokenRasterizer")


@dataclass
class TokenStats:
    """Statistics for token rasterization session."""
    total_tokens: int = 0
    tokens_by_type: dict[str, int] = field(default_factory=dict)
    unique_coords: set = field(default_factory=set)
    start_time: float = field(default_factory=time.time)

    def record(self, token_type: str, coord: tuple[int, int, int]):
        self.total_tokens += 1
        self.tokens_by_type[token_type] = self.tokens_by_type.get(token_type, 0) + 1
        self.unique_coords.add(coord)

    def summary(self) -> str:
        elapsed = time.time() - self.start_time
        rate = self.total_tokens / elapsed if elapsed > 0 else 0
        return (
            f"Tokens: {self.total_tokens} | "
            f"Unique coords: {len(self.unique_coords)} | "
            f"Rate: {rate:.1f} tok/s | "
            f"Types: {dict(sorted(self.tokens_by_type.items(), key=lambda x: -x[1]))}"
        )


class TokenRasterizer:
    """
    Rasterizes LLM tokens into 3D Hilbert space for Glass Box visualization.

    Each token is:
    1. Hashed to a stable Hilbert index
    2. Converted to 3D coordinates
    3. Assigned a semantic color based on token type
    4. Streamed to the compositor bridge
    """

    # Extended keyword sets for better type inference
    KEYWORDS = {
        # Python
        "if", "elif", "else", "for", "while", "return", "def", "class",
        "import", "from", "as", "try", "except", "finally", "with", "raise",
        "yield", "lambda", "pass", "break", "continue", "global", "nonlocal",
        "assert", "async", "await", "True", "False", "None",
        # JavaScript/TypeScript
        "function", "const", "let", "var", "export",
        "interface", "type", "enum", "implements", "extends", "new",
        # Common
        "struct", "fn", "pub", "mod", "use", "impl", "trait", "where",
    }

    LOGIC_OPERATORS = {
        "+", "-", "*", "/", "%", "=", "==", "!=", "!", ">", "<", ">=", "<=",
        "and", "or", "not", "&&", "||", "|", "&", "^", "<<", ">>", "~",
        "->", "=>", ":", "::", ".", "...",
    }

    def __init__(self, bridge: CompositorBridge | None = None, grid_order: int = 8):
        """
        Initialize the Token Rasterizer.

        Args:
            bridge: CompositorBridge instance (created if None)
            grid_order: Hilbert curve order (grid_size = 2^order)
        """
        self.bridge = bridge
        if self.bridge is None and CompositorBridge:
            self.bridge = CompositorBridge()

        self.hilbert = NativeHilbertLUT() if NativeHilbertLUT else None
        self.order = grid_order
        self.grid_size = 2 ** self.order

        # Token type to color mapping (RGBA, semantic reasoning colors)
        self.type_colors = {
            "keyword": (0.0, 1.0, 1.0, 1.0),    # Cyan
            "string": (0.0, 1.0, 0.0, 1.0),     # Green
            "number": (1.0, 1.0, 0.0, 1.0),     # Yellow
            "operator": (1.0, 0.0, 1.0, 1.0),   # Magenta
            "comment": (0.5, 0.5, 0.5, 1.0),    # Gray
            "identifier": (1.0, 1.0, 1.0, 1.0), # White
            "logic": (1.0, 0.5, 0.0, 1.0),      # Orange
            "punctuation": (0.7, 0.7, 0.7, 1.0),# Light gray
            "default": (0.8, 0.8, 1.0, 1.0)     # Pale Blue
        }

        # Token chain tracking for semantic proximity lines
        self._prev_token_x: int | None = None
        self._prev_token_y: int | None = None
        self._prev_token_z: int | None = None
        self._prev_token_color: tuple | None = None

        # Statistics
        self.stats = TokenStats()

    def _hash_token(self, token: str) -> int:
        """
        Map token string to a stable Hilbert index using SHA-256.

        Same token always maps to same index (deterministic).
        """
        h = hashlib.sha256(token.encode('utf-8')).digest()
        val = int.from_bytes(h[:4], byteorder='little')
        return val % (self.grid_size * self.grid_size)

    def _infer_token_type(self, token: str) -> str:
        """
        Determine token type for semantic coloring using heuristics.

        Returns one of: keyword, string, number, logic, comment, identifier, punctuation, default
        """
        if not token:
            return "default"

        stripped = token.strip()

        if not stripped:
            return "default"

        # Keywords (check first - highest priority)
        if stripped in self.KEYWORDS:
            return "keyword"

        # Logic/operators
        if stripped in self.LOGIC_OPERATORS:
            return "logic"

        # String literals
        if (stripped.startswith("'") and stripped.endswith("'")) or \
           (stripped.startswith('"') and stripped.endswith('"')) or \
           (stripped.startswith('"""') or stripped.startswith("'''")):
            return "string"

        # Numbers (integers, floats, hex)
        if stripped.isdigit() or self._is_number(stripped):
            return "number"

        # Comments
        if stripped.startswith("#") or stripped.startswith("//") or stripped.startswith("/*"):
            return "comment"

        # Single punctuation
        if len(stripped) == 1 and not stripped.isalnum():
            return "punctuation"

        return "identifier"

    def _is_number(self, s: str) -> bool:
        """Check if string is a numeric literal."""
        try:
            float(s)
            return True
        except ValueError:
            # Check hex/binary/octal
            if s.startswith(('0x', '0X', '0b', '0B', '0o', '0O')):
                try:
                    int(s, 0)
                    return True
                except ValueError:
                    pass
            return False

    def _emit_token_link(self, curr_x: int, curr_y: int, curr_z: int, curr_color: tuple):
        """Emit a TOKEN_LINK command connecting previous token to current in 3D."""
        if self._prev_token_x is None or self._prev_token_y is None or self._prev_token_z is None:
            return  # No previous token to link from

        link_data = {
            "type": "TOKEN_LINK_3D",
            "prev_x": self._prev_token_x,
            "prev_y": self._prev_token_y,
            "prev_z": self._prev_token_z,
            "curr_x": curr_x,
            "curr_y": curr_y,
            "curr_z": curr_z,
            "color": self._prev_token_color or (0.5, 0.5, 0.5, 0.3),
            "timestamp": time.time()
        }

        self.bridge.send_thought(link_data, msg_type="TokenLink3D")

    def process_token(self, token: str):
        """Rasterize a single token into the 3D Hilbert space and stream it."""
        h_idx = self._hash_token(token)
        t_type = self._infer_token_type(token)
        color = self.type_colors.get(t_type, self.type_colors["default"])

        # Convert to 3D for the bridge
        x, y, z = self.hilbert.d2xyz(self.grid_size, h_idx)

        # Semantic Z-axis: Abstraction depth
        # Logic/Keywords are "Higher" (abstract), Identifiers are "Lower" (concrete)
        z_depth = z
        if t_type in ["keyword", "logic"]:
            z_depth = min(255, z + 100)

        # Emit TOKEN_LINK if we have a previous token
        self._emit_token_link(x, y, z_depth, color)

        # Update previous token tracking
        self._prev_token_x = x
        self._prev_token_y = y
        self._prev_token_z = z_depth
        self._prev_token_color = color

        thought_data = {
            "type": "TOKEN_RENDER_3D",
            "content": token,
            "token_type": t_type,
            "hilbert_index": h_idx,
            "x": x,
            "y": y,
            "z": z_depth,
            "color": color,
            "timestamp": time.time()
        }

        # Stream via Glass Box bridge (Opcode 0xCD handled by WGSL)
        self.bridge.send_thought(thought_data, msg_type="Token3D")

    def stream_from_lm_studio(self, prompt: str, url: str = "http://localhost:1234/v1/completions"):
        """Stream a prompt completion from LM Studio and rasterize each token."""
        try:
            payload = {
                "prompt": prompt,
                "stream": True,
                "max_tokens": 500
            }
            response = requests.post(url, json=payload, stream=True)

            for line in response.iter_lines():
                if line:
                    decoded = line.decode('utf-8')
                    if decoded.startswith("data: "):
                        data_str = decoded[6:]
                        if data_str == "[DONE]": break

                        try:
                            data = json.loads(data_str)
                            token = data["choices"][0]["text"]
                            if token:
                                self.process_token(token)
                        except (json.JSONDecodeError, KeyError):
                            continue
        except Exception as e:
            print(f"LM Studio Stream Error: {e}")

    def reset_chain(self):
        """Reset token chain tracking for a new stream."""
        self._prev_token_x = None
        self._prev_token_y = None
        self._prev_token_color = None

if __name__ == "__main__":
    rasterizer = TokenRasterizer()
    print("Starting Token Rasterization Mock Stream...")
    test_tokens = ["def", "calculate_gravity", "(", "mass", ",", "distance", ")", ":", "return", "G", "*", "mass", "/", "distance", "**", "2"]
    for t in test_tokens:
        rasterizer.process_token(t)
        time.sleep(0.1)
    print("Mock stream complete.")
