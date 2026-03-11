#!/usr/bin/env python3
"""
Geometry OS: Native G-Shell (v2)

A fully native Geometry OS terminal that:
1. Encodes terminal state as RGBA pixels in a Hilbert-mapped texture.
2. Operates as a .rts.png Visual Container ("The Screen is the Hard Drive").
3. Integrates with the Geometric Native Browser (GNB) for AI perception.
4. Intercepts 'gemini'/'claude' for Image-Native context injection.
"""

import os
import sys
import pty
import select
import termios
import tty
import json
import time
import signal
import fcntl
import struct
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

# Geometry OS Components
from systems.visual_shell.api.geometric_terminal_bridge import GeometricTerminalBridge, TerminalTextureConfig
from systems.visual_shell.api.vat_manager import VATManager

class NativeGeosShell:
    """
    Native Geometry OS Shell
    
    The state of this shell is an RGBA image (.rts.png).
    It bypasses ASCII files and communicates via geometric opcodes.
    """

    def __init__(self, shell="/bin/bash"):
        self.shell = shell
        self.rows, self.cols = self._get_terminal_size()
        self.fd = None
        
        # Geometry OS Native State
        self.bridge = GeometricTerminalBridge()
        self.config = TerminalTextureConfig(cols=self.cols, rows=self.rows)
        self.tile_id = self.bridge.spawn_geometric_terminal(self.config)
        
        # State paths
        self.texture_path = Path(f".geometry/tectonic/textures/native_terminal_{self.tile_id}.rts.png")
        self.ascii_fragment = Path(".geometry/ascii_scene/terminal_fragment.ascii")
        self.ascii_fragment.parent.mkdir(parents=True, exist_ok=True)
        
        self.last_sync = 0
        self.sync_interval = 0.2 # Faster sync for native shell (5Hz)

    def _get_terminal_size(self):
        """Get the current terminal size."""
        try:
            s = struct.unpack('HHHH', fcntl.ioctl(sys.stdout.fileno(), termios.TIOCGWINSZ,
                                                struct.pack('HHHH', 0, 0, 0, 0)))
            return s[0], s[1]
        except Exception:
            return 24, 80

    def _set_terminal_size(self, rows, cols):
        """Set the terminal size for the PTY and Native Tile."""
        if self.fd is not None:
            s = struct.pack('HHHH', rows, cols, 0, 0)
            fcntl.ioctl(self.fd, termios.TIOCSWINSZ, s)
            self.bridge.vat_bridge.resize_terminal(self.tile_id, rows, cols)
            
    def _handle_winch(self, signum, frame):
        """Handle terminal resize signal."""
        new_rows, new_cols = self._get_terminal_size()
        if (new_rows, new_cols) != (self.rows, self.cols):
            self.rows, self.cols = new_rows, new_cols
            self._set_terminal_size(self.rows, self.cols)
            # Re-spawn or re-config native terminal? 
            # In alpha, we just keep the existing buffer and clip.

    def _update_native_state(self, data: bytes):
        """Update the RGBA texture and ASCII fragment."""
        # 1. Update the GPU-native texture via opcodes
        self.bridge.feed_pty_output(self.tile_id, data)
        
        # 2. Update ASCII fragment for GNB/AI Perception
        # (This is the bridge between v1 and v2)
        now = time.time()
        if now - self.last_sync > self.sync_interval:
            # Render texture to disk
            self.bridge.render_to_texture(self.tile_id, str(self.texture_path))
            
            # Export ASCII view for current LLMs
            terminal = self.bridge._tiles[self.tile_id].terminal
            lines = []
            for r in range(self.rows):
                row = []
                for c in range(self.cols):
                    cell = terminal.get_cell_at(r, c)
                    row.append(chr(cell.char) if cell and cell.char > 0 else " ")
                lines.append("".join(row))
            
            fragment = f"--- NATIVE TERMINAL FRAGMENT (Tile {self.tile_id}) ---\n"
            fragment += f"Texture: {self.texture_path}\n"
            fragment += "\n".join(lines)
            
            try:
                with open(self.ascii_fragment, "w") as f:
                    f.write(fragment)
                self.last_sync = now
            except Exception:
                pass

    def _intercept_ai_command(self, cmd_line: str):
        """Image-Native context injection for AI commands."""
        parts = cmd_line.strip().split()
        if not parts:
            return None
            
        if parts[0] in ["gemini", "claude"]:
            # Ensure latest texture is on disk
            self.bridge.render_to_texture(self.tile_id, str(self.texture_path))
            
            user_prompt = " ".join(parts[1:])
            # Vision-Native prompt: Referencing the texture
            injected_prompt = (
                f"I am running a Native G-Shell. My current screen is encoded as an RGBA Hilbert-mapped texture at: {self.texture_path}\n"
                f"USER REQUEST: {user_prompt}\n"
                f"(If you can read images, analyze the texture. Otherwise, read the ASCII fragment at {self.ascii_fragment})"
            )
            
            return f"{parts[0]} {json.dumps(injected_prompt)}\r\n"
        
        return None

    def run(self):
        """Run the native shell."""
        print(f"--- GEOMETRY OS NATIVE SHELL (G-Shell v2) ---")
        print(f"Texture State: {self.texture_path}")
        print(f"Starting native {self.shell} bridge...\n")
        
        # 1. Start the PTY
        pid, self.fd = pty.fork()
        
        if pid == 0:
            os.execvpe(self.shell, [self.shell], os.environ)
            
        old_settings = termios.tcgetattr(sys.stdin)
        input_buffer = ""
        
        # Setup SIGWINCH handler
        signal.signal(signal.SIGWINCH, self._handle_winch)
        
        try:
            tty.setraw(sys.stdin)
            while True:
                r, w, e = select.select([sys.stdin, self.fd], [], [], 0.05)
                
                if sys.stdin in r:
                    data = os.read(sys.stdin.fileno(), 1024)
                    for char_byte in data:
                        char = chr(char_byte)
                        if char == '\r' or char == '\n':
                            # AI Command Injection
                            injected_cmd = self._intercept_ai_command(input_buffer)
                            if injected_cmd:
                                os.write(sys.stdout.fileno(), b"\r" + b" " * (len(input_buffer) + 2) + b"\r")
                                os.write(self.fd, injected_cmd.encode())
                            else:
                                os.write(self.fd, bytes([char_byte]))
                            input_buffer = ""
                        elif char_byte == 127: # Backspace
                            input_buffer = input_buffer[:-1]
                            os.write(self.fd, data)
                        else:
                            input_buffer += char
                            os.write(self.fd, data)
                
                if self.fd in r:
                    try:
                        data = os.read(self.fd, 1024)
                    except OSError:
                        break
                    if not data:
                        break
                        
                    os.write(sys.stdout.fileno(), data)
                    self._update_native_state(data)
                    
        finally:
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
            self.bridge.render_to_texture(self.tile_id, str(self.texture_path))

if __name__ == "__main__":
    shell = NativeGeosShell()
    shell.run()
