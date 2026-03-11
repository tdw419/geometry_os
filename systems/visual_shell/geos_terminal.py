#!/usr/bin/env python3
"""
Geometry OS: Geos-Shell (G-Shell)

A standalone Linux terminal that bridges standard Bash with Geometry OS.
It is 'state-aware' and continuously exports its screen buffer to the 
Geometric Neural Buffer (.geometry/gnb_state.ascii) for AI agents.
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
from systems.visual_shell.context_injector import ContextInjector
from systems.visual_shell.geos_commands import GeosCommands

# Geometry OS API Imports
try:
    from systems.visual_shell.api.terminal_vat_bridge import TerminalVatBridge
    from systems.visual_shell.api.vat_manager import VATManager
    GEOMETRY_OS_AVAILABLE = True
except ImportError:
    GEOMETRY_OS_AVAILABLE = False


class GeosShell:
    """
    Geometry OS Shell (G-Shell)
    
    A terminal that:
    1. Proxies standard PTY to Bash
    2. Maintains a 2D screen buffer for the GNB
    3. Intercepts 'g ' commands for Geometry OS
    4. Intercepts 'gemini'/'claude' for context injection
    5. Handles terminal resize events (SIGWINCH)
    """

    def __init__(self, shell="/bin/bash"):
        self.shell = shell
        self.rows, self.cols = self._get_terminal_size()
        self.fd = None
        
        # Screen buffer (list of lists of chars)
        self.screen_buffer = [[" " for _ in range(self.cols)] for _ in range(self.rows)]
        self.cursor_x = 0
        self.cursor_y = 0
        
        # GNB State Path
        self.gnb_path = Path(".geometry/gnb_state.ascii")
        self.gnb_path.parent.mkdir(parents=True, exist_ok=True)
        
        # Geometry OS Bridges
        if GEOMETRY_OS_AVAILABLE:
            self.vat_bridge = TerminalVatBridge(offline_mode=True)
            self.vat_manager = VATManager()
        else:
            self.vat_bridge = None
            self.vat_manager = None
            
        # Command Handlers
        self.commands = GeosCommands(self.vat_bridge, self.vat_manager, self.gnb_path)
        self.injector = ContextInjector()
            
        self.last_sync = 0
        self.sync_interval = 0.5 # Update GNB every 0.5s

    def _get_terminal_size(self):
        """Get the current terminal size."""
        try:
            s = struct.unpack('HHHH', fcntl.ioctl(sys.stdout.fileno(), termios.TIOCGWINSZ,
                                                struct.pack('HHHH', 0, 0, 0, 0)))
            return s[0], s[1]
        except Exception:
            return 24, 80

    def _set_terminal_size(self, rows, cols):
        """Set the terminal size for the PTY."""
        if self.fd is not None:
            s = struct.pack('HHHH', rows, cols, 0, 0)
            fcntl.ioctl(self.fd, termios.TIOCSWINSZ, s)
            
    def _handle_winch(self, signum, frame):
        """Handle terminal resize signal."""
        new_rows, new_cols = self._get_terminal_size()
        if (new_rows, new_cols) != (self.rows, self.cols):
            # Sync buffer content to new size
            new_buffer = [[" " for _ in range(new_cols)] for _ in range(new_rows)]
            for r in range(min(new_rows, self.rows)):
                for c in range(min(new_cols, self.cols)):
                    new_buffer[r][c] = self.screen_buffer[r][c]
            
            self.rows, self.cols = new_rows, new_cols
            self.screen_buffer = new_buffer
            self._set_terminal_size(self.rows, self.cols)
            
            # Clamp cursor
            self.cursor_x = min(self.cursor_x, self.cols - 1)
            self.cursor_y = min(self.cursor_y, self.rows - 1)
            
            # Sync to GNB immediately
            self._sync_gnb(force=True)

    def _update_buffer(self, data: bytes):
        """Update the internal screen buffer with new PTY data."""
        # This is a VERY simplified terminal emulator
        for byte in data:
            char = chr(byte)
            if char == '\r':
                self.cursor_x = 0
            elif char == '\n':
                self.cursor_y += 1
                if self.cursor_y >= self.rows:
                    self.screen_buffer.pop(0)
                    self.screen_buffer.append([" " for _ in range(self.cols)])
                    self.cursor_y = self.rows - 1
            elif char == '\b':
                self.cursor_x = max(0, self.cursor_x - 1)
            elif byte >= 32: # Printable
                if self.cursor_y < self.rows and self.cursor_x < self.cols:
                    self.screen_buffer[self.cursor_y][self.cursor_x] = char
                    self.cursor_x += 1
                    if self.cursor_x >= self.cols:
                        self.cursor_x = 0
                        self.cursor_y += 1
                        if self.cursor_y >= self.rows:
                            self.screen_buffer.pop(0)
                            self.screen_buffer.append([" " for _ in range(self.cols)])
                            self.cursor_y = self.rows - 1

    def _sync_gnb(self, force=False):
        """Sync the screen buffer to the GNB state file."""
        now = time.time()
        if not force and now - self.last_sync < self.sync_interval:
            return
            
        # Convert buffer to ASCII block
        lines = ["".join(row) for row in self.screen_buffer]
        content = "\n".join(lines)
        
        # Add metadata header for AI
        header = f"--- GEOMETRIC NEURAL BUFFER (GNB) ---\n"
        header += f"Cursor: ({self.cursor_x}, {self.cursor_y}) | Size: {self.rows}x{self.cols}\n"
        header += f"Timestamp: {now}\n"
        header += f"-------------------------------------\n"
        
        try:
            with open(self.gnb_path, "w") as f:
                f.write(header + content)
            self.last_sync = now
        except Exception:
            pass

    def run(self):
        """Run the shell."""
        print(f"--- GEOMETRY OS SHELL (G-Shell) ---")
        print(f"Starting {self.shell} with GNB sync...")
        print(f"Type 'g help' for Geometry OS commands.\n")
        
        # 1. Start the PTY
        pid, self.fd = pty.fork()
        
        if pid == 0:
            # Child process: Execute the shell
            os.execvpe(self.shell, [self.shell], os.environ)
            
        # Parent process: Multiplex I/O
        old_settings = termios.tcgetattr(sys.stdin)
        input_buffer = ""
        
        # Setup SIGWINCH handler
        signal.signal(signal.SIGWINCH, self._handle_winch)
        
        try:
            tty.setraw(sys.stdin)
            
            while True:
                self._sync_gnb()
                
                try:
                    r, w, e = select.select([sys.stdin, self.fd], [], [], 0.1)
                except (select.error, OSError):
                    continue
                
                if sys.stdin in r:
                    try:
                        data = os.read(sys.stdin.fileno(), 1024)
                    except OSError:
                        break
                    if not data:
                        break
                    
                    for char_byte in data:
                        char = chr(char_byte)
                        if char == '\r' or char == '\n':
                            # 1. Check for AI Injection (gemini/claude)
                            injected_cmd = self.injector.intercept(input_buffer, self.gnb_path)
                            if injected_cmd:
                                # Clear line and write injected command
                                os.write(sys.stdout.fileno(), b"\r" + b" " * (len(input_buffer) + 2) + b"\r")
                                os.write(self.fd, injected_cmd.encode())
                            # 2. Check for Geometry Commands (g map, etc)
                            elif input_buffer.startswith("g "):
                                os.write(sys.stdout.fileno(), b"\r\n")
                                self.commands.handle(input_buffer)
                                os.write(self.fd, bytes([char_byte])) # Send the newline to bash anyway for prompt
                            else:
                                os.write(self.fd, bytes([char_byte]))
                                
                            input_buffer = ""
                        elif char_byte == 127: # Backspace
                            if len(input_buffer) > 0:
                                input_buffer = input_buffer[:-1]
                            os.write(self.fd, bytes([char_byte]))
                        else:
                            input_buffer += char
                            os.write(self.fd, bytes([char_byte]))
                
                if self.fd in r:
                    try:
                        data = os.read(self.fd, 1024)
                    except OSError:
                        break
                    if not data:
                        break
                        
                    os.write(sys.stdout.fileno(), data)
                    self._update_buffer(data)
                    
        finally:
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
            self._sync_gnb(force=True)

if __name__ == "__main__":
    shell = GeosShell()
    shell.run()
