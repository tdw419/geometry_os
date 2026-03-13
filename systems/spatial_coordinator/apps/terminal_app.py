"""Terminal Emulator Glyph App.

A full terminal emulator with PTY support, cursor, and scrolling.
Demonstrates: memory operations, text rendering, ANSI escape sequences.

Layout (80x24 glyphs - classic terminal size):
┌────────────────────────────────────────────────────────────────────────────────┐
│user@geometry:~$ ls                                                              │
│Documents  Downloads  projects  .bashrc                                          │
│user@geometry:~$ _                                                               │
│                                                                                │
│... (20 more lines) ...                                                          │
│                                                                                │
└────────────────────────────────────────────────────────────────────────────────┘
"""

import os
import pty
import select
import struct
import fcntl
import termios
import errno
from typing import Optional, Tuple, List
from dataclasses import dataclass, field

from systems.spatial_coordinator.glyph_vm import assemble, Opcode
from systems.spatial_coordinator.opcodes import (
    R0, R1, R2, R3, R4, R5, R6, R7,
    R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE,
)


@dataclass
class TerminalState:
    """Terminal emulator state."""
    # Screen buffer (80x24 = 1920 chars)
    screen: List[int] = field(default_factory=lambda: [32] * (80 * 24))

    # Cursor position
    cursor_x: int = 0
    cursor_y: int = 0

    # Scroll region
    scroll_top: int = 0
    scroll_bottom: int = 23

    # Terminal modes
    echo: bool = True
    raw_mode: bool = False

    # PTY
    master_fd: Optional[int] = None
    shell_pid: Optional[int] = None

    # ANSI escape state
    escape_state: int = 0  # 0=normal, 1=got ESC, 2=got CSI
    escape_params: List[int] = field(default_factory=list)

    # Colors (for future use)
    fg_color: int = 7  # White
    bg_color: int = 0  # Black


class TerminalEmulator:
    """Terminal emulator with PTY support."""

    WIDTH = 80
    HEIGHT = 24
    BUFFER_SIZE = WIDTH * HEIGHT

    def __init__(self):
        self.state = TerminalState()
        self._input_buffer: List[int] = []
        self._output_buffer: List[int] = []

    def start_shell(self) -> bool:
        """Start a shell process with PTY."""
        try:
            # Create pseudo-terminal
            master_fd, slave_fd = pty.openpty()

            # Set terminal size
            winsize = struct.pack('HHHH', self.HEIGHT, self.WIDTH, 0, 0)
            fcntl.ioctl(master_fd, termios.TIOCSWINSZ, winsize)

            # Fork shell
            pid = os.fork()
            if pid == 0:
                # Child process
                os.setsid()

                # Set controlling terminal
                fcntl.ioctl(slave_fd, termios.TIOCSCTTY, 0)

                # Redirect stdio
                os.dup2(slave_fd, 0)
                os.dup2(slave_fd, 1)
                os.dup2(slave_fd, 2)

                # Close master
                os.close(master_fd)

                # Execute shell
                shell = os.environ.get('SHELL', '/bin/bash')
                os.execvp(shell, [shell])

            # Parent process
            os.close(slave_fd)
            self.state.master_fd = master_fd
            self.state.shell_pid = pid

            # Set non-blocking
            flags = fcntl.fcntl(master_fd, fcntl.F_GETFL)
            fcntl.fcntl(master_fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)

            return True

        except Exception as e:
            print(f"Failed to start shell: {e}")
            return False

    def stop_shell(self):
        """Stop the shell process."""
        if self.state.shell_pid is not None:
            try:
                os.kill(self.state.shell_pid, 15)  # SIGTERM
                os.waitpid(self.state.shell_pid, 0)
            except:
                pass
            self.state.shell_pid = None

        if self.state.master_fd is not None:
            os.close(self.state.master_fd)
            self.state.master_fd = None

    def process_input(self, keycode: int):
        """Process keyboard input."""
        if self.state.master_fd is None:
            return

        # Convert keycode to character
        if keycode == 0x0D:  # Enter
            char = b'\n'
        elif keycode == 0x08 or keycode == 0x7F:  # Backspace
            char = b'\x7f'
        elif keycode == 0x1B:  # Escape
            char = b'\x1b'
        elif 0x20 <= keycode <= 0x7E:
            char = bytes([keycode])
        else:
            return  # Ignore

        # Write to PTY
        try:
            os.write(self.state.master_fd, char)
        except:
            pass

    def read_output(self) -> bytes:
        """Read available output from PTY."""
        if self.state.master_fd is None:
            return b''

        try:
            # Check if data available
            ready, _, _ = select.select([self.state.master_fd], [], [], 0)
            if not ready:
                return b''

            data = os.read(self.state.master_fd, 4096)
            return data

        except OSError as e:
            if e.errno == errno.EIO:
                # PTY closed
                self.stop_shell()
            return b''

    def process_output(self, data: bytes):
        """Process output from shell, handle ANSI escapes."""
        for byte in data:
            self._process_byte(byte)

    def _process_byte(self, byte: int):
        """Process a single byte of output."""
        state = self.state

        if state.escape_state == 0:
            # Normal mode
            if byte == 0x1B:  # ESC
                state.escape_state = 1
            elif byte == 0x0D:  # CR
                state.cursor_x = 0
            elif byte == 0x0A:  # LF
                self._line_feed()
            elif byte == 0x08:  # BS
                if state.cursor_x > 0:
                    state.cursor_x -= 1
            elif byte == 0x09:  # TAB
                state.cursor_x = (state.cursor_x + 8) & ~7
                if state.cursor_x >= self.WIDTH:
                    state.cursor_x = self.WIDTH - 1
            elif 0x20 <= byte < 0x7F:
                self._put_char(byte)

        elif state.escape_state == 1:
            # Got ESC
            if byte == ord('['):
                state.escape_state = 2
                state.escape_params = []
            elif byte == ord('M'):  # RI (Reverse Index)
                if state.cursor_y > state.scroll_top:
                    state.cursor_y -= 1
                state.escape_state = 0
            else:
                # Unknown escape, ignore
                state.escape_state = 0

        elif state.escape_state == 2:
            # CSI sequence
            if 0x30 <= byte <= 0x39 or byte == 0x3B:  # 0-9 or ;
                state.escape_params.append(byte)
            else:
                # Final byte - execute command
                self._execute_csi(byte)
                state.escape_state = 0

    def _execute_csi(self, command: int):
        """Execute a CSI command."""
        state = self.state

        # Parse parameters
        params = self._parse_csi_params(state.escape_params)

        if command == ord('A'):  # CUU - Cursor Up
            n = params[0] if params else 1
            state.cursor_y = max(state.scroll_top, state.cursor_y - n)

        elif command == ord('B'):  # CUD - Cursor Down
            n = params[0] if params else 1
            state.cursor_y = min(state.scroll_bottom, state.cursor_y + n)

        elif command == ord('C'):  # CUF - Cursor Forward
            n = params[0] if params else 1
            state.cursor_x = min(self.WIDTH - 1, state.cursor_x + n)

        elif command == ord('D'):  # CUB - Cursor Back
            n = params[0] if params else 1
            state.cursor_x = max(0, state.cursor_x - n)

        elif command == ord('H') or command == ord('f'):  # CUP - Cursor Position
            row = (params[0] if len(params) > 0 else 1) - 1
            col = (params[1] if len(params) > 1 else 1) - 1
            state.cursor_y = max(0, min(self.HEIGHT - 1, row))
            state.cursor_x = max(0, min(self.WIDTH - 1, col))

        elif command == ord('J'):  # ED - Erase Display
            mode = params[0] if params else 0
            if mode == 0:  # Erase from cursor to end
                self._erase_from_cursor()
            elif mode == 1:  # Erase from start to cursor
                self._erase_to_cursor()
            elif mode == 2:  # Erase entire screen
                self._erase_screen()

        elif command == ord('K'):  # EL - Erase Line
            mode = params[0] if params else 0
            if mode == 0:  # Erase from cursor to end of line
                self._erase_line_from_cursor()
            elif mode == 1:  # Erase from start to cursor
                self._erase_line_to_cursor()
            elif mode == 2:  # Erase entire line
                self._erase_line()

        elif command == ord('m'):  # SGR - Select Graphic Rendition
            # Handle color/style changes (simplified)
            for p in params:
                if p == 0:  # Reset
                    state.fg_color = 7
                    state.bg_color = 0
                elif 30 <= p <= 37:  # Foreground color
                    state.fg_color = p - 30
                elif 40 <= p <= 47:  # Background color
                    state.bg_color = p - 40

        elif command == ord('r'):  # DECSTBM - Set Scrolling Region
            top = (params[0] if len(params) > 0 else 1) - 1
            bottom = (params[1] if len(params) > 1 else self.HEIGHT) - 1
            state.scroll_top = max(0, min(self.HEIGHT - 1, top))
            state.scroll_bottom = max(state.scroll_top, min(self.HEIGHT - 1, bottom))

        elif command == ord('s'):  # SCP - Save Cursor Position
            self._saved_cursor = (state.cursor_x, state.cursor_y)

        elif command == ord('u'):  # RCP - Restore Cursor Position
            if hasattr(self, '_saved_cursor'):
                state.cursor_x, state.cursor_y = self._saved_cursor

    def _parse_csi_params(self, param_bytes: List[int]) -> List[int]:
        """Parse CSI parameters."""
        if not param_bytes:
            return []

        params = []
        current = 0
        has_value = False

        for b in param_bytes:
            if 0x30 <= b <= 0x39:  # Digit
                current = current * 10 + (b - 0x30)
                has_value = True
            elif b == 0x3B:  # Semicolon separator
                params.append(current if has_value else 0)
                current = 0
                has_value = False

        if has_value:
            params.append(current)

        return params

    def _put_char(self, char: int):
        """Put a character at cursor position."""
        state = self.state

        # Calculate buffer index
        idx = state.cursor_y * self.WIDTH + state.cursor_x
        if 0 <= idx < len(state.screen):
            state.screen[idx] = char

        # Advance cursor
        state.cursor_x += 1
        if state.cursor_x >= self.WIDTH:
            state.cursor_x = 0
            self._line_feed()

    def _line_feed(self):
        """Handle line feed."""
        state = self.state

        if state.cursor_y >= state.scroll_bottom:
            # Scroll up
            self._scroll_up()
        else:
            state.cursor_y += 1

    def _scroll_up(self):
        """Scroll the screen up by one line."""
        state = self.state

        # Move lines up within scroll region
        for y in range(state.scroll_top, state.scroll_bottom):
            src_start = (y + 1) * self.WIDTH
            dst_start = y * self.WIDTH
            state.screen[dst_start:dst_start + self.WIDTH] = \
                state.screen[src_start:src_start + self.WIDTH]

        # Clear bottom line
        bottom_start = state.scroll_bottom * self.WIDTH
        state.screen[bottom_start:bottom_start + self.WIDTH] = [32] * self.WIDTH

    def _erase_from_cursor(self):
        """Erase from cursor to end of screen."""
        state = self.state
        idx = state.cursor_y * self.WIDTH + state.cursor_x
        state.screen[idx:] = [32] * (len(state.screen) - idx)

    def _erase_to_cursor(self):
        """Erase from start to cursor."""
        state = self.state
        idx = state.cursor_y * self.WIDTH + state.cursor_x
        state.screen[:idx + 1] = [32] * (idx + 1)

    def _erase_screen(self):
        """Erase entire screen."""
        self.state.screen = [32] * (self.WIDTH * self.HEIGHT)

    def _erase_line_from_cursor(self):
        """Erase from cursor to end of line."""
        state = self.state
        start = state.cursor_y * self.WIDTH + state.cursor_x
        end = (state.cursor_y + 1) * self.WIDTH
        state.screen[start:end] = [32] * (end - start)

    def _erase_line_to_cursor(self):
        """Erase from start of line to cursor."""
        state = self.state
        start = state.cursor_y * self.WIDTH
        end = state.cursor_y * self.WIDTH + state.cursor_x + 1
        state.screen[start:end] = [32] * (end - start)

    def _erase_line(self):
        """Erase entire line."""
        state = self.state
        start = state.cursor_y * self.WIDTH
        end = (state.cursor_y + 1) * self.WIDTH
        state.screen[start:end] = [32] * (end - start)

    def get_glyphs(self) -> List[int]:
        """Get current screen as glyph buffer."""
        return self.state.screen.copy()

    def get_cursor_pos(self) -> Tuple[int, int]:
        """Get cursor position."""
        return (self.state.cursor_x, self.state.cursor_y)

    def render_text(self) -> str:
        """Render screen as text with cursor indicator."""
        lines = []
        screen = self.state.screen
        cx, cy = self.state.cursor_x, self.state.cursor_y

        for y in range(self.HEIGHT):
            row = []
            for x in range(self.WIDTH):
                idx = y * self.WIDTH + x
                char = screen[idx] if idx < len(screen) else 32

                # Show cursor
                if x == cx and y == cy:
                    if char == 32:
                        char = ord('_')
                    # Could also use block cursor

                row.append(chr(char))
            lines.append(''.join(row))

        return '\n'.join(lines)


# Build app binary (simplified - actual execution happens in Python)
def build_terminal_app() -> bytes:
    """Build terminal app binary (header only - Python handles execution)."""
    header = (
        b'GEOS'                              # Magic
        + (80).to_bytes(2, 'little')         # Width
        + (24).to_bytes(2, 'little')         # Height
        + (4096).to_bytes(2, 'little')       # Memory slots (16KB for scrollback)
        + (0).to_bytes(2, 'little')          # Entry point
        + (0).to_bytes(2, 'little')          # Handler table offset
        + (0x03).to_bytes(2, 'little')       # Flags: WANTS_KEYBOARD | WANTS_MOUSE
    )

    # Minimal halt instruction
    code = assemble([
        (Opcode.HALT, 0, 0, 0),
    ])

    return header + code


# App interface
APP_NAME = "terminal"
APP_BINARY = build_terminal_app()
APP_WIDTH = 80
APP_HEIGHT = 24
APP_FLAGS = 0x03  # WANTS_KEYBOARD | WANTS_MOUSE


def create_terminal() -> TerminalEmulator:
    """Create a new terminal emulator instance."""
    return TerminalEmulator()


if __name__ == "__main__":
    print("Terminal Emulator Demo")
    print("=" * 80)

    term = TerminalEmulator()

    if term.start_shell():
        print("Shell started. Reading output...")

        import time
        time.sleep(0.5)

        # Read initial output
        data = term.read_output()
        if data:
            term.process_output(data)
            print(term.render_text())
            print("\n" + "=" * 80)

        # Test a command
        term.process_input(ord('l'))
        term.process_input(ord('s'))
        term.process_input(0x0D)  # Enter

        time.sleep(0.5)

        data = term.read_output()
        if data:
            term.process_output(data)
            print(term.render_text())

        term.stop_shell()
    else:
        print("Failed to start shell")
