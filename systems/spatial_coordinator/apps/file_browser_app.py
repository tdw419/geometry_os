"""File Browser Glyph App.

A visual file browser with keyboard navigation.
Demonstrates: filesystem access, selection, scrolling.

Layout (64x20 glyphs):
┌──────────────────────────────────────────────────────────────────────┐
│File Browser: /home/user                                              │
│──────────────────────────────────────────────────────────────────────│
│📁 Documents                                              2024-03-13  │
│📁 Downloads                                              2024-03-13  │
│📁 projects                                               2024-03-13  │
│📄 .bashrc                                    4096 B    2024-03-10  │
│📄 README.md                                 8192 B    2024-03-12  │
│                                                                      │
│──────────────────────────────────────────────────────────────────────│
│↑↓ Navigate  → Enter  ← Back  q Quit                                  │
└──────────────────────────────────────────────────────────────────────┘
"""

import os
import stat
from pathlib import Path
from datetime import datetime
from typing import List, Tuple, Optional
from dataclasses import dataclass, field

from systems.spatial_coordinator.glyph_vm import assemble, Opcode
from systems.spatial_coordinator.opcodes import (
    R0, R1, R2, R3, R4, R5, R6, R7,
    R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE,
)


@dataclass
class FileEntry:
    """A file or directory entry."""
    name: str
    path: Path
    is_dir: bool
    size: int = 0
    modified: datetime = None

    @property
    def glyph(self) -> int:
        """Get icon glyph for this entry."""
        if self.is_dir:
            return 0x1F4C1  # 📁 folder
        # File type icons (simplified ASCII for now)
        name_lower = self.name.lower()
        if name_lower.endswith(('.py', '.js', '.ts', '.rs', '.go', '.c', '.h')):
            return 0x1F4C4  # 📄 code file
        elif name_lower.endswith(('.txt', '.md', '.rst')):
            return 0x1F4C3  # 📃 text file
        elif name_lower.endswith(('.png', '.jpg', '.gif', '.svg')):
            return 0x1F5BC  # 🖼 image
        else:
            return 0x1F4C4  # 📄 generic file


class FileBrowser:
    """Visual file browser with keyboard navigation."""

    WIDTH = 64
    HEIGHT = 20
    HEADER_HEIGHT = 2
    FOOTER_HEIGHT = 2
    LIST_HEIGHT = HEIGHT - HEADER_HEIGHT - FOOTER_HEIGHT  # 16

    def __init__(self, start_path: str = None):
        self.current_path = Path(start_path or os.getcwd()).resolve()
        self.entries: List[FileEntry] = []
        self.scroll_offset = 0
        self.selected_index = 0
        self.message = ""

        # History for back navigation
        self.history: List[Path] = []

        # Load initial directory
        self._load_directory()

    def _load_directory(self):
        """Load directory contents."""
        self.entries = []

        try:
            items = sorted(
                self.current_path.iterdir(),
                key=lambda p: (not p.is_dir(), p.name.lower())
            )

            for item in items:
                try:
                    st = item.stat()
                    entry = FileEntry(
                        name=item.name,
                        path=item,
                        is_dir=item.is_dir(),
                        size=st.st_size if not item.is_dir() else 0,
                        modified=datetime.fromtimestamp(st.st_mtime),
                    )
                    self.entries.append(entry)
                except (PermissionError, OSError):
                    continue

        except PermissionError:
            self.message = "Permission denied"
        except OSError as e:
            self.message = f"Error: {e}"

    def navigate_up(self):
        """Move selection up."""
        if self.selected_index > 0:
            self.selected_index -= 1
            if self.selected_index < self.scroll_offset:
                self.scroll_offset = self.selected_index

    def navigate_down(self):
        """Move selection down."""
        if self.selected_index < len(self.entries) - 1:
            self.selected_index += 1
            if self.selected_index >= self.scroll_offset + self.LIST_HEIGHT:
                self.scroll_offset = self.selected_index - self.LIST_HEIGHT + 1

    def enter_selected(self) -> Optional[str]:
        """Enter selected directory or open file.

        Returns:
            Selected file path if file, None if directory
        """
        if not self.entries or self.selected_index >= len(self.entries):
            return None

        entry = self.entries[self.selected_index]

        if entry.is_dir:
            # Save current path to history
            self.history.append(self.current_path)
            self.current_path = entry.path
            self.scroll_offset = 0
            self.selected_index = 0
            self._load_directory()
            return None
        else:
            # Return file path for opening
            return str(entry.path)

    def go_back(self) -> bool:
        """Go back to previous directory.

        Returns:
            True if went back, False if no history
        """
        if not self.history:
            # Go to parent directory
            parent = self.current_path.parent
            if parent != self.current_path:
                self.history.append(self.current_path)
                self.current_path = parent
                self.scroll_offset = 0
                self.selected_index = 0
                self._load_directory()
                return True
            return False

        self.current_path = self.history.pop()
        self.scroll_offset = 0
        self.selected_index = 0
        self._load_directory()
        return True

    def handle_key(self, keycode: int) -> Optional[str]:
        """Handle keyboard input.

        Args:
            keycode: ASCII keycode

        Returns:
            File path if file selected, None otherwise
        """
        if keycode == 0x1B:  # ESC - go back
            self.go_back()
        elif keycode == ord('q') or keycode == ord('Q'):
            return "QUIT"
        elif keycode == 0x41 or keycode == ord('k') or keycode == ord('K'):  # Up
            self.navigate_up()
        elif keycode == 0x42 or keycode == ord('j') or keycode == ord('J'):  # Down
            self.navigate_down()
        elif keycode == 0x0D:  # Enter
            return self.enter_selected()
        elif keycode == 0x08 or keycode == 0x7F:  # Backspace
            self.go_back()
        elif keycode == 0x44 or keycode == ord('h') or keycode == ord('H'):  # Left
            self.go_back()

        return None

    def _format_size(self, size: int) -> str:
        """Format file size."""
        if size < 1024:
            return f"{size} B"
        elif size < 1024 * 1024:
            return f"{size / 1024:.1f} KB"
        elif size < 1024 * 1024 * 1024:
            return f"{size / 1024 / 1024:.1f} MB"
        else:
            return f"{size / 1024 / 1024 / 1024:.1f} GB"

    def _format_date(self, dt: datetime) -> str:
        """Format modification date."""
        if dt is None:
            return " " * 10
        return dt.strftime("%Y-%m-%d")

    def get_glyphs(self) -> List[int]:
        """Get current screen as glyph buffer."""
        glyphs = [32] * (self.WIDTH * self.HEIGHT)

        def put_text(x: int, y: int, text: str, max_width: int = None):
            """Put text at position."""
            if max_width:
                text = text[:max_width]
            for i, ch in enumerate(text):
                if x + i >= self.WIDTH:
                    break
                idx = y * self.WIDTH + x + i
                if 0 <= idx < len(glyphs):
                    glyphs[idx] = ord(ch)

        # === Header ===
        put_text(0, 0, "File Browser: " + str(self.current_path)[:self.WIDTH - 15])
        put_text(0, 1, "─" * self.WIDTH)

        # === File list ===
        for i in range(self.LIST_HEIGHT):
            entry_idx = self.scroll_offset + i
            if entry_idx >= len(self.entries):
                break

            entry = self.entries[entry_idx]
            y = self.HEADER_HEIGHT + i

            # Selection indicator
            if entry_idx == self.selected_index:
                put_text(0, y, "→")
                # Highlight by using different characters
                name_prefix = "┃"
            else:
                put_text(0, y, " ")
                name_prefix = " "

            # Icon + name
            icon = "📁" if entry.is_dir else "📄"
            name = entry.name
            if len(name) > 35:
                name = name[:32] + "..."

            # Pad name for selection highlight
            if entry_idx == self.selected_index:
                name = name.ljust(35)

            put_text(2, y, f"{icon} {name}")

            # Size and date (right-aligned columns)
            if not entry.is_dir:
                size_str = self._format_size(entry.size).rjust(10)
                put_text(40, y, size_str)

            date_str = self._format_date(entry.modified)
            put_text(52, y, date_str)

        # === Footer ===
        footer_y = self.HEIGHT - 2
        put_text(0, footer_y, "─" * self.WIDTH)

        # Status line
        status = f"↑↓ Navigate  → Enter  ← Back  q Quit"
        if self.message:
            status = self.message
            self.message = ""  # Clear message after display

        put_text(0, footer_y + 1, status)

        return glyphs

    def render_text(self) -> str:
        """Render screen as text."""
        glyphs = self.get_glyphs()
        lines = []
        for y in range(self.HEIGHT):
            row = []
            for x in range(self.WIDTH):
                idx = y * self.WIDTH + x
                row.append(chr(glyphs[idx]))
            lines.append(''.join(row))
        return '\n'.join(lines)


# Build app binary
def build_file_browser_app() -> bytes:
    """Build file browser app binary (header only - Python handles execution)."""
    header = (
        b'GEOS'                              # Magic
        + (64).to_bytes(2, 'little')         # Width
        + (20).to_bytes(2, 'little')         # Height
        + (4096).to_bytes(2, 'little')       # Memory slots
        + (0).to_bytes(2, 'little')          # Entry point
        + (0).to_bytes(2, 'little')          # Handler table offset
        + (0x01).to_bytes(2, 'little')       # Flags: WANTS_KEYBOARD
    )

    # Minimal halt instruction
    code = assemble([
        (Opcode.HALT, 0, 0, 0),
    ])

    return header + code


# App interface
APP_NAME = "file_browser"
APP_BINARY = build_file_browser_app()
APP_WIDTH = 64
APP_HEIGHT = 20
APP_FLAGS = 0x01  # WANTS_KEYBOARD


def create_file_browser(start_path: str = None) -> FileBrowser:
    """Create a new file browser instance."""
    return FileBrowser(start_path)


if __name__ == "__main__":
    print("File Browser Demo")
    print("=" * 64)

    browser = FileBrowser()
    print(browser.render_text())

    print("\n\nNavigating down...")
    browser.navigate_down()
    browser.navigate_down()
    print(browser.render_text())
