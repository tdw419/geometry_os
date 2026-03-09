"""
Mind's Eye: Token-to-Hilbert Rasterizer
Projecting LLM cognitive patterns into Hilbert-mapped VRAM.
"""

import json
import hashlib
import time
import requests
from typing import Dict, Any, Optional, List
from .compositor_bridge import CompositorBridge
from .native_hilbert import NativeHilbertLUT

class TokenRasterizer:
    def __init__(self, bridge: Optional[CompositorBridge] = None):
        self.bridge = bridge if bridge else CompositorBridge()
        self.hilbert = NativeHilbertLUT()
        self.order = 8
        self.grid_size = 2**self.order
        
        # Token type to color mapping (semantic reasoning colors)
        self.type_colors = {
            "keyword": (0.0, 1.0, 1.0, 1.0),    # Cyan
            "string": (0.0, 1.0, 0.0, 1.0),     # Green
            "number": (1.0, 1.0, 0.0, 1.0),     # Yellow
            "operator": (1.0, 0.0, 1.0, 1.0),   # Magenta
            "comment": (0.5, 0.5, 0.5, 1.0),    # Gray
            "identifier": (1.0, 1.0, 1.0, 1.0), # White
            "logic": (1.0, 0.5, 0.0, 1.0),      # Orange
            "default": (0.8, 0.8, 1.0, 1.0)     # Pale Blue
        }

        # Token chain tracking for semantic proximity lines
        self._prev_token_x: Optional[int] = None
        self._prev_token_y: Optional[int] = None
        self._prev_token_z: Optional[int] = None
        self._prev_token_color: Optional[tuple] = None

    def _hash_token(self, token: str) -> int:
        """Map token string to a stable Hilbert index."""
        h = hashlib.sha256(token.encode('utf-8')).digest()
        val = int.from_bytes(h[:4], byteorder='little')
        return val % (self.grid_size * self.grid_size)

    def _infer_token_type(self, token: str) -> str:
        """Basic heuristic to determine token type for coloring."""
        token = token.strip()
        if not token: return "default"
        if token in ["if", "for", "while", "return", "def", "class", "async", "await"]:
            return "keyword"
        if token in ["+", "-", "*", "/", "=", "==", "!", ">", "<", "and", "or", "not"]:
            return "logic"
        if (token.startswith("'") and token.endswith("'")) or (token.startswith('"') and token.endswith('"')):
            return "string"
        if token.isdigit():
            return "number"
        if token.startswith("#") or token.startswith("//"):
            return "comment"
        return "identifier"

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
