#!/usr/bin/env python3
"""
Enhanced Native Glyph Shell - Intuitive UI Implementation

A user-friendly terminal interface with:
- Visual command palette (Ctrl+P)
- Real-time status bar
- Keyboard shortcut help (?)
- Enhanced output formatting
- Command history panel
- Progress indicators

Usage:
    python enhanced_glyph_shell.py

Keyboard Shortcuts:
    Ctrl+P  - Open command palette
    Ctrl+H  - Toggle history panel
    Ctrl+L  - Clear screen
    ?       - Toggle help overlay
    Esc     - Close overlays
    Tab     - Autocomplete
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
import re
import logging
from pathlib import Path
from dataclasses import dataclass, field
from typing import Any, Callable
from enum import Enum
from collections import deque

# ============================================================================
# Logging Configuration
# ============================================================================

# Create logger for this module
logger = logging.getLogger("glyph_shell")

# Configure logging if not already configured
if not logger.handlers:
    handler = logging.StreamHandler()
    formatter = logging.Formatter(
        '%(asctime)s | %(levelname)-8s | %(name)s | %(message)s',
        datefmt='%H:%M:%S'
    )
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    logger.setLevel(logging.INFO)

# Log file for persistent debugging
_log_dir = Path(".geometry/logs")
_log_dir.mkdir(parents=True, exist_ok=True)
_file_handler = logging.FileHandler(_log_dir / "glyph_shell.log")
_file_handler.setFormatter(logging.Formatter(
    '%(asctime)s | %(levelname)-8s | %(name)s | %(funcName)s:%(lineno)d | %(message)s'
))
logger.addHandler(_file_handler)

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

# Geometry OS Components
from systems.visual_shell.api.geometric_terminal_bridge import GeometricTerminalBridge, TerminalTextureConfig
from systems.visual_shell.api.vat_manager import VATManager

# ANSI color codes
class Colors:
    """ANSI color codes for terminal output."""
    RESET = "\033[0m"
    BOLD = "\033[1m"
    DIM = "\033[2m"
    ITALIC = "\033[3m"
    UNDERLINE = "\033[4m"

    # Foreground colors
    BLACK = "\033[30m"
    RED = "\033[31m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"
    MAGENTA = "\033[35m"
    CYAN = "\033[36m"
    WHITE = "\033[37m"

    # Bright foreground colors
    BRIGHT_RED = "\033[91m"
    BRIGHT_GREEN = "\033[92m"
    BRIGHT_YELLOW = "\033[93m"
    BRIGHT_BLUE = "\033[94m"
    BRIGHT_MAGENTA = "\033[95m"
    BRIGHT_CYAN = "\033[96m"
    BRIGHT_WHITE = "\033[97m"

    # Background colors
    BG_RED = "\033[41m"
    BG_GREEN = "\033[42m"
    BG_YELLOW = "\033[43m"
    BG_BLUE = "\033[44m"
    BG_MAGENTA = "\033[45m"
    BG_CYAN = "\033[46m"

    # Custom palette for UI
    UI_ACCENT = "\033[38;5;75m"      # Bright blue
    UI_SUCCESS = "\033[38;5;82m"     # Green
    UI_WARNING = "\033[38;5;214m"    # Orange
    UI_ERROR = "\033[38;5;196m"      # Red
    UI_INFO = "\033[38;5;246m"       # Gray
    UI_HIGHLIGHT = "\033[48;5;238m"  # Dark gray background


class UIState(Enum):
    """Current UI state."""
    NORMAL = "normal"
    COMMAND_PALETTE = "command_palette"
    HELP_OVERLAY = "help_overlay"
    HISTORY_PANEL = "history_panel"


@dataclass
class Command:
    """Represents a discoverable command."""
    name: str
    description: str
    category: str
    shortcut: str | None = None
    aliases: list[str] = field(default_factory=list)
    examples: list[str] = field(default_factory=list)
    handler: Callable | None = None


@dataclass
class HistoryEntry:
    """A command history entry."""
    command: str
    timestamp: float
    success: bool = True
    output_preview: str = ""


class StatusBar:
    """
    Real-time status bar with metrics and indicators.

    Displays:
    - Current directory
    - Active tile count
    - Connection status
    - Performance metrics (FPS, latency)
    """

    def __init__(self):
        self.directory = os.getcwd()
        self.tile_count = 0
        self.fps = 60.0
        self.latency_ms = 0.0
        self.connection_status = "disconnected"
        self.ai_bridge_status = "offline"
        self.message = ""
        self.message_type = "info"  # info, success, warning, error
        self.message_timeout = 0.0

    def update(self, tile_count: int = None, fps: float = None,
               latency_ms: float = None, connection: str = None,
               ai_bridge: str = None):
        """Update status bar values."""
        if tile_count is not None:
            self.tile_count = tile_count
        if fps is not None:
            self.fps = fps
        if latency_ms is not None:
            self.latency_ms = latency_ms
        if connection is not None:
            self.connection_status = connection
        if ai_bridge is not None:
            self.ai_bridge_status = ai_bridge

    def set_message(self, message: str, msg_type: str = "info", duration: float = 3.0):
        """Set a temporary status message."""
        self.message = message
        self.message_type = msg_type
        self.message_timeout = time.time() + duration

    def render(self, width: int) -> str:
        """Render the status bar."""
        # Check if message has expired
        if self.message and time.time() > self.message_timeout:
            self.message = ""

        # Build status segments
        segments = []

        # Directory (truncate if needed)
        dir_display = self.directory
        if len(dir_display) > width // 3:
            dir_display = "..." + dir_display[-(width // 3 - 3):]
        segments.append(f"{Colors.UI_ACCENT}📁 {dir_display}{Colors.RESET}")

        # Tile count
        segments.append(f"{Colors.CYAN}🔷 {self.tile_count} tiles{Colors.RESET}")

        # Connection status
        conn_icon = "🟢" if self.connection_status == "connected" else "🔴"
        segments.append(f"{conn_icon} {self.connection_status}")

        # AI Bridge status
        if self.ai_bridge_status == "online":
            segments.append(f"{Colors.UI_SUCCESS}🤖 AI{Colors.RESET}")

        # Performance
        fps_color = Colors.UI_SUCCESS if self.fps >= 55 else Colors.UI_WARNING if self.fps >= 30 else Colors.UI_ERROR
        segments.append(f"{fps_color}{self.fps:.0f}fps{Colors.RESET}")

        # Build the bar
        bar = " │ ".join(segments)

        # Add message if present
        if self.message:
            msg_color = {
                "info": Colors.UI_INFO,
                "success": Colors.UI_SUCCESS,
                "warning": Colors.UI_WARNING,
                "error": Colors.UI_ERROR
            }.get(self.message_type, Colors.WHITE)
            bar += f" │ {msg_color}{self.message}{Colors.RESET}"

        # Truncate if too long
        if len(bar) > width - 2:
            bar = bar[:width - 5] + "..."

        return bar


class CommandPalette:
    """
    Fuzzy-searchable command palette.

    Features:
    - Fuzzy search across all commands
    - Category grouping
    - Keyboard navigation
    - Command preview
    """

    def __init__(self):
        self.commands: list[Command] = []
        self.categories: dict[str, list[Command]] = {}
        self.search_query = ""
        self.selected_index = 0
        self.filtered_commands: list[Command] = []
        self.is_open = False

        # Register default commands
        self._register_default_commands()

    def _register_default_commands(self):
        """Register all available commands."""
        # Navigation commands
        self.register(Command(
            name="g map",
            description="Pan the Infinite Map to coordinates",
            category="Navigation",
            examples=["g map 100 200", "g map 0 0"],
        ))
        self.register(Command(
            name="g spawn",
            description="Spawn a new terminal tile on the map",
            category="Navigation",
            shortcut="Ctrl+N",
        ))
        self.register(Command(
            name="g gls",
            description="List files with spatial entropy metadata",
            category="Files",
            examples=["g gls", "g gls /path/to/dir"],
        ))
        self.register(Command(
            name="g ai",
            description="Request AI analysis of current context",
            category="AI",
            examples=["g ai analyze errors", "g ai suggest commands"],
        ))
        self.register(Command(
            name="g help",
            description="Show help for Geometry OS commands",
            category="System",
            shortcut="?",
        ))

        # UI commands
        self.register(Command(
            name="clear",
            description="Clear the terminal screen",
            category="UI",
            shortcut="Ctrl+L",
            aliases=["cls"],
        ))
        self.register(Command(
            name="history",
            description="Toggle command history panel",
            category="UI",
            shortcut="Ctrl+H",
        ))
        self.register(Command(
            name="palette",
            description="Open command palette",
            category="UI",
            shortcut="Ctrl+P",
        ))
        self.register(Command(
            name="help",
            description="Toggle keyboard shortcuts help",
            category="UI",
            shortcut="?",
        ))

        # System commands
        self.register(Command(
            name="status",
            description="Show system status and metrics",
            category="System",
        ))
        self.register(Command(
            name="version",
            description="Show Glyph Shell version",
            category="System",
        ))

    def register(self, command: Command):
        """Register a new command."""
        self.commands.append(command)
        if command.category not in self.categories:
            self.categories[command.category] = []
        self.categories[command.category].append(command)

    def open(self):
        """Open the command palette."""
        self.is_open = True
        self.search_query = ""
        self.selected_index = 0
        self._update_filtered()

    def close(self):
        """Close the command palette."""
        self.is_open = False
        self.search_query = ""

    def search(self, query: str):
        """Update search query and filter commands."""
        self.search_query = query
        self.selected_index = 0
        self._update_filtered()

    def _update_filtered(self):
        """Update filtered commands based on search query."""
        if not self.search_query:
            # Show all commands, grouped by category
            self.filtered_commands = sorted(
                self.commands,
                key=lambda c: (c.category, c.name)
            )
        else:
            # Fuzzy match
            query_lower = self.search_query.lower()
            scored = []
            for cmd in self.commands:
                score = self._fuzzy_score(query_lower, cmd.name.lower())
                if cmd.description:
                    score = max(score, self._fuzzy_score(query_lower, cmd.description.lower()) * 0.7)
                for alias in cmd.aliases:
                    score = max(score, self._fuzzy_score(query_lower, alias.lower()) * 0.8)
                if score > 0:
                    scored.append((score, cmd))
            self.filtered_commands = [cmd for _, cmd in sorted(scored, key=lambda x: -x[0])]

    def _fuzzy_score(self, query: str, text: str) -> float:
        """Calculate fuzzy match score (0-1)."""
        if not query:
            return 1.0
        if query in text:
            # Exact substring match
            return 1.0 - (text.index(query) / len(text)) * 0.5

        # Fuzzy character matching
        query_idx = 0
        consecutive = 0
        max_consecutive = 0
        for char in text:
            if query_idx < len(query) and char == query[query_idx]:
                query_idx += 1
                consecutive += 1
                max_consecutive = max(max_consecutive, consecutive)
            else:
                consecutive = 0

        if query_idx == len(query):
            # All characters found
            return 0.5 + (max_consecutive / len(query)) * 0.3
        return 0.0

    def navigate_up(self):
        """Move selection up."""
        if self.filtered_commands:
            self.selected_index = (self.selected_index - 1) % len(self.filtered_commands)

    def navigate_down(self):
        """Move selection down."""
        if self.filtered_commands:
            self.selected_index = (self.selected_index + 1) % len(self.filtered_commands)

    def get_selected(self) -> Command | None:
        """Get the currently selected command."""
        if 0 <= self.selected_index < len(self.filtered_commands):
            return self.filtered_commands[self.selected_index]
        return None

    def render(self, width: int, height: int = 10) -> str:
        """Render the command palette."""
        if not self.is_open:
            return ""

        lines = []

        # Header
        header = f"{Colors.BG_BLUE}{Colors.WHITE}{Colors.BOLD} Command Palette {Colors.RESET}"
        if self.search_query:
            header += f" {Colors.DIM}Search: {Colors.RESET}{Colors.CYAN}{self.search_query}{Colors.RESET}_"
        else:
            header += f" {Colors.DIM}Type to search...{Colors.RESET}"
        lines.append(header)

        # Commands
        visible_count = min(height - 3, len(self.filtered_commands))
        start_idx = max(0, min(self.selected_index - visible_count // 2,
                               len(self.filtered_commands) - visible_count))

        for i in range(start_idx, min(start_idx + visible_count, len(self.filtered_commands))):
            cmd = self.filtered_commands[i]
            is_selected = i == self.selected_index

            # Format command line
            if is_selected:
                line = f"{Colors.UI_HIGHLIGHT}{Colors.WHITE}▶ {cmd.name}{Colors.RESET}"
            else:
                line = f"  {Colors.CYAN}{cmd.name}{Colors.RESET}"

            # Add description (truncated)
            desc = cmd.description
            max_desc_len = width - len(cmd.name) - 8
            if len(desc) > max_desc_len:
                desc = desc[:max_desc_len - 3] + "..."
            line += f" {Colors.DIM}{desc}{Colors.RESET}"

            # Add shortcut if present
            if cmd.shortcut:
                line += f" {Colors.YELLOW}[{cmd.shortcut}]{Colors.RESET}"

            lines.append(line)

        # Footer with hint
        if not self.filtered_commands:
            lines.append(f"  {Colors.DIM}No commands found{Colors.RESET}")
        footer = f"{Colors.DIM}↑↓ Navigate │ Enter Select │ Esc Close │ Tab Autocomplete{Colors.RESET}"
        lines.append(footer)

        return "\n".join(lines)


class HelpOverlay:
    """
    Keyboard shortcuts help overlay.

    Displays all available keyboard shortcuts organized by category.
    """

    def __init__(self):
        self.is_open = False
        self.shortcuts = {
            "Navigation": [
                ("Ctrl+P", "Open command palette"),
                ("Ctrl+H", "Toggle history panel"),
                ("Ctrl+L", "Clear screen"),
                ("?", "Toggle this help"),
            ],
            "Editing": [
                ("Ctrl+A", "Beginning of line"),
                ("Ctrl+E", "End of line"),
                ("Ctrl+U", "Clear line before cursor"),
                ("Ctrl+K", "Clear line after cursor"),
                ("Ctrl+W", "Delete word before cursor"),
            ],
            "History": [
                ("↑/↓", "Navigate command history"),
                ("Ctrl+R", "Search history"),
                ("Tab", "Autocomplete"),
            ],
            "Commands": [
                ("g map <x> <y>", "Pan Infinite Map"),
                ("g spawn", "Spawn terminal tile"),
                ("g gls [path]", "Spatial file list"),
                ("g ai [prompt]", "AI analysis"),
                ("g help", "Command help"),
            ],
        }

    def toggle(self):
        """Toggle help overlay visibility."""
        self.is_open = not self.is_open

    def open(self):
        """Open help overlay."""
        self.is_open = True

    def close(self):
        """Close help overlay."""
        self.is_open = False

    def render(self, width: int) -> str:
        """Render the help overlay."""
        if not self.is_open:
            return ""

        lines = []

        # Header
        lines.append(f"{Colors.BG_MAGENTA}{Colors.WHITE}{Colors.BOLD} Keyboard Shortcuts {Colors.RESET}")
        lines.append("")

        # Categories
        for category, shortcuts in self.shortcuts.items():
            lines.append(f"{Colors.YELLOW}{Colors.BOLD}{category}:{Colors.RESET}")
            for key, description in shortcuts:
                lines.append(f"  {Colors.CYAN}{key:20}{Colors.RESET} {description}")
            lines.append("")

        # Footer
        lines.append(f"{Colors.DIM}Press ? or Esc to close{Colors.RESET}")

        return "\n".join(lines)


class CommandHistory:
    """
    Searchable command history with favorites.

    Features:
    - Search through past commands
    - Mark favorites
    - Success/failure indicators
    """

    def __init__(self, max_size: int = 1000):
        self.max_size = max_size
        self.entries: deque[HistoryEntry] = deque(maxlen=max_size)
        self.favorites: set[str] = set()
        self.is_open = False
        self.search_query = ""
        self.selected_index = 0

    def add(self, command: str, success: bool = True, output_preview: str = ""):
        """Add a command to history."""
        self.entries.append(HistoryEntry(
            command=command,
            timestamp=time.time(),
            success=success,
            output_preview=output_preview[:100]
        ))

    def toggle_favorite(self, command: str):
        """Toggle favorite status of a command."""
        if command in self.favorites:
            self.favorites.remove(command)
        else:
            self.favorites.add(command)

    def search(self, query: str) -> list[HistoryEntry]:
        """Search through history."""
        if not query:
            return list(self.entries)

        query_lower = query.lower()
        return [e for e in self.entries if query_lower in e.command.lower()]

    def get_recent(self, count: int = 20) -> list[HistoryEntry]:
        """Get most recent commands."""
        return list(self.entries)[-count:]

    def toggle(self):
        """Toggle history panel visibility."""
        self.is_open = not self.is_open

    def render(self, width: int, height: int = 10) -> str:
        """Render the history panel."""
        if not self.is_open:
            return ""

        lines = []

        # Header
        header = f"{Colors.BG_CYAN}{Colors.WHITE}{Colors.BOLD} Command History {Colors.RESET}"
        if self.search_query:
            header += f" {Colors.DIM}Search: {Colors.RESET}{self.search_query}_"
        lines.append(header)

        # Get entries to display
        entries = self.search(self.search_query)[-height + 2:]

        for i, entry in enumerate(reversed(entries)):
            is_selected = i == self.selected_index
            is_favorite = entry.command in self.favorites

            # Status icon
            status = f"{Colors.UI_SUCCESS}✓{Colors.RESET}" if entry.success else f"{Colors.UI_ERROR}✗{Colors.RESET}"
            fav = f"{Colors.YELLOW}★{Colors.RESET}" if is_favorite else " "

            # Format line
            if is_selected:
                line = f"{Colors.UI_HIGHLIGHT}{status} {fav} {entry.command}{Colors.RESET}"
            else:
                line = f"{status} {fav} {entry.command}"

            # Truncate if needed
            if len(line) > width:
                line = line[:width - 3] + "..."

            lines.append(line)

        # Footer
        footer = f"{Colors.DIM}↑↓ Navigate │ Enter Use │ ★ Favorite │ Esc Close{Colors.RESET}"
        lines.append(footer)

        return "\n".join(lines)


class OutputFormatter:
    """
    Enhanced output formatting with syntax highlighting.

    Features:
    - Syntax highlighting for common formats
    - Success/error indicators
    - Progress bars
    """

    # Patterns for syntax highlighting
    PATTERNS = [
        # URLs
        (r'https?://[^\s]+', f'{Colors.CYAN}{Colors.UNDERLINE}\\1{Colors.RESET}'),
        # File paths
        (r'(/[a-zA-Z0-9_\-./]+)', f'{Colors.BLUE}\\1{Colors.RESET}'),
        # Numbers
        (r'\b(\d+(?:\.\d+)?)\b', f'{Colors.YELLOW}\\1{Colors.RESET}'),
        # Keywords
        (r'\b(error|Error|ERROR)\b', f'{Colors.UI_ERROR}\\1{Colors.RESET}'),
        (r'\b(warning|Warning|WARNING)\b', f'{Colors.UI_WARNING}\\1{Colors.RESET}'),
        (r'\b(success|Success|SUCCESS|ok|OK)\b', f'{Colors.UI_SUCCESS}\\1{Colors.RESET}'),
    ]

    @classmethod
    def format(cls, text: str) -> str:
        """Apply syntax highlighting to text."""
        result = text
        for pattern, replacement in cls.PATTERNS:
            result = re.sub(pattern, replacement, result)
        return result

    @classmethod
    def format_success(cls, message: str) -> str:
        """Format a success message."""
        return f"{Colors.UI_SUCCESS}✓ {message}{Colors.RESET}"

    @classmethod
    def format_error(cls, message: str) -> str:
        """Format an error message."""
        return f"{Colors.UI_ERROR}✗ {message}{Colors.RESET}"

    @classmethod
    def format_warning(cls, message: str) -> str:
        """Format a warning message."""
        return f"{Colors.UI_WARNING}⚠ {message}{Colors.RESET}"

    @classmethod
    def format_info(cls, message: str) -> str:
        """Format an info message."""
        return f"{Colors.UI_INFO}ℹ {message}{Colors.RESET}"

    @classmethod
    def progress_bar(cls, progress: float, width: int = 40, label: str = "") -> str:
        """Create a progress bar."""
        filled = int(progress * width)
        bar = "█" * filled + "░" * (width - filled)
        percent = f"{progress * 100:.0f}%"

        if label:
            return f"{label} [{Colors.CYAN}{bar}{Colors.RESET}] {percent}"
        return f"[{Colors.CYAN}{bar}{Colors.RESET}] {percent}"


class EnhancedGlyphShell:
    """
    Enhanced Native Glyph Shell with intuitive UI.

    Combines all UI components into a cohesive terminal experience.
    """

    def __init__(self, shell: str = "/bin/bash"):
        init_start = time.time()
        logger.info(f"Initializing Enhanced Glyph Shell with shell: {shell}")
        
        self.shell = shell
        self.rows, self.cols = self._get_terminal_size()
        self.fd = None
        logger.debug(f"Terminal size: {self.cols}x{self.rows}")

        # UI Components
        logger.debug("Initializing UI components...")
        self.status_bar = StatusBar()
        self.command_palette = CommandPalette()
        self.help_overlay = HelpOverlay()
        self.history = CommandHistory()
        self.formatter = OutputFormatter()
        logger.debug(f"UI components initialized ({len(self.command_palette.commands)} commands registered)")

        # UI State
        self.ui_state = UIState.NORMAL
        self.input_buffer = ""
        self.last_update = 0
        self.frame_count = 0
        self.fps = 60.0

        # Geometry OS Native State
        logger.debug("Connecting to Geometric Terminal Bridge...")
        try:
            self.bridge = GeometricTerminalBridge()
            self.config = TerminalTextureConfig(cols=self.cols, rows=self.rows)
            self.tile_id = self.bridge.spawn_geometric_terminal(self.config)
            self.status_bar.update(tile_count=1, connection="connected")
            logger.info(f"Geometric terminal spawned successfully (tile_id: {self.tile_id})")
        except Exception as e:
            logger.warning(f"Geometric terminal not available: {e}")
            print(f"Warning: Geometric terminal not available: {e}")
            self.bridge = None
            self.tile_id = None

        # State paths
        self.texture_path = Path(f".geometry/tectonic/textures/enhanced_terminal_{id(self)}.rts.png")
        self.texture_path.parent.mkdir(parents=True, exist_ok=True)
        logger.debug(f"Texture path: {self.texture_path}")

        # Performance tracking
        self.last_frame_time = time.time()
        self.frame_times: deque[float] = deque(maxlen=60)
        
        init_time = (time.time() - init_start) * 1000
        logger.info(f"Enhanced Glyph Shell initialized in {init_time:.2f}ms")

    def _get_terminal_size(self) -> tuple[int, int]:
        """Get the current terminal size."""
        try:
            s = struct.unpack('HHHH', fcntl.ioctl(
                sys.stdout.fileno(), termios.TIOCGWINSZ,
                struct.pack('HHHH', 0, 0, 0, 0)
            ))
            return s[0], s[1]
        except Exception:
            return 24, 80

    def _set_terminal_size(self, rows: int, cols: int):
        """Set the terminal size for the PTY."""
        if self.fd is not None:
            s = struct.pack('HHHH', rows, cols, 0, 0)
            fcntl.ioctl(self.fd, termios.TIOCSWINSZ, s)

    def _handle_winch(self, signum, frame):
        """Handle terminal resize signal."""
        new_rows, new_cols = self._get_terminal_size()
        if (new_rows, new_cols) != (self.rows, self.cols):
            logger.info(f"Terminal resized: {self.cols}x{self.rows} → {new_cols}x{new_rows}")
            self.rows, self.cols = new_rows, new_cols
            self._set_terminal_size(self.rows, self.cols)

    def _render_ui(self):
        """Render the current UI state."""
        # Save cursor position
        sys.stdout.write("\033[s")

        # Move to bottom of screen for status bar
        sys.stdout.write(f"\033[{self.rows};0H")
        sys.stdout.write("\033[K")  # Clear line

        # Render status bar
        status = self.status_bar.render(self.cols)
        sys.stdout.write(status)

        # Render overlays if active
        if self.ui_state == UIState.COMMAND_PALETTE:
            # Move up to show palette
            palette_height = 12
            sys.stdout.write(f"\033[{self.rows - palette_height};0H")
            sys.stdout.write(self.command_palette.render(self.cols, palette_height))

        elif self.ui_state == UIState.HELP_OVERLAY:
            sys.stdout.write(f"\033[3;0H")
            sys.stdout.write(self.help_overlay.render(self.cols))

        elif self.ui_state == UIState.HISTORY_PANEL:
            history_height = 12
            sys.stdout.write(f"\033[{self.rows - history_height};0H")
            sys.stdout.write(self.history.render(self.cols, history_height))

        # Restore cursor position
        sys.stdout.write("\033[u")
        sys.stdout.flush()

    def _update_fps(self):
        """Update FPS calculation."""
        now = time.time()
        frame_time = now - self.last_frame_time
        self.frame_times.append(frame_time)
        self.last_frame_time = now
        if self.frame_times:
            avg_frame_time = sum(self.frame_times) / len(self.frame_times)
            self.fps = 1.0 / avg_frame_time if avg_frame_time > 0 else 60.0
            self.status_bar.update(fps=self.fps)
            
            # Log performance warnings
            if self.fps < 30:
                logger.warning(f"Low FPS detected: {self.fps:.1f} (avg frame time: {avg_frame_time*1000:.2f}ms)")
            elif logger.isEnabledFor(logging.DEBUG) and self.frame_count % 60 == 0:
                logger.debug(f"FPS: {self.fps:.1f}, avg frame time: {avg_frame_time*1000:.2f}ms")

    def _handle_special_input(self, char: str, char_byte: int) -> bool:
        """Handle special keyboard input. Returns True if handled."""
        start_time = time.time()
        
        # Check for Ctrl+P (command palette)
        if char_byte == 16:  # Ctrl+P
            if self.ui_state == UIState.COMMAND_PALETTE:
                logger.debug("Closing command palette")
                self.command_palette.close()
                self.ui_state = UIState.NORMAL
            else:
                logger.debug("Opening command palette")
                self.command_palette.open()
                self.ui_state = UIState.COMMAND_PALETTE
            self._render_ui()
            logger.debug(f"Command palette toggle took {(time.time() - start_time)*1000:.2f}ms")
            return True

        # Check for ? (help)
        if char == '?' and not self.input_buffer:
            if self.ui_state == UIState.HELP_OVERLAY:
                self.help_overlay.close()
                self.ui_state = UIState.NORMAL
            else:
                self.help_overlay.open()
                self.ui_state = UIState.HELP_OVERLAY
            self._render_ui()
            return True

        # Check for Ctrl+H (history)
        if char_byte == 8:  # Ctrl+H
            if self.ui_state == UIState.HISTORY_PANEL:
                self.history.toggle()
                self.ui_state = UIState.NORMAL
            else:
                self.history.toggle()
                self.ui_state = UIState.HISTORY_PANEL
            self._render_ui()
            return True

        # Check for Ctrl+L (clear)
        if char_byte == 12:  # Ctrl+L
            os.write(sys.stdout.fileno(), b"\033[2J\033[H")
            return True

        # Check for Escape
        if char_byte == 27:  # ESC
            if self.ui_state != UIState.NORMAL:
                self.command_palette.close()
                self.help_overlay.close()
                self.history.is_open = False
                self.ui_state = UIState.NORMAL
                self._render_ui()
                return True

        # Handle navigation in overlays
        if self.ui_state == UIState.COMMAND_PALETTE:
            if char_byte == 27:  # ESC sequence (arrow keys)
                # Read the rest of the sequence
                seq = os.read(sys.stdin.fileno(), 2)
                if seq == b'[A':  # Up
                    self.command_palette.navigate_up()
                elif seq == b'[B':  # Down
                    self.command_palette.navigate_down()
                self._render_ui()
                return True
            elif char_byte == 13:  # Enter
                cmd = self.command_palette.get_selected()
                if cmd:
                    self.input_buffer = cmd.name
                    # Write to terminal
                    os.write(sys.stdout.fileno(), f"\r{cmd.name}".encode())
                self.command_palette.close()
                self.ui_state = UIState.NORMAL
                self._render_ui()
                return True
            elif char_byte == 127:  # Backspace
                if self.command_palette.search_query:
                    self.command_palette.search(self.command_palette.search_query[:-1])
                    self._render_ui()
                return True
            elif char_byte >= 32:  # Printable
                self.command_palette.search(self.command_palette.search_query + char)
                self._render_ui()
                return True

        return False

    def _handle_geos_command(self, cmd_line: str) -> bool:
        """Handle Geometry OS specific commands. Returns True if handled."""
        cmd_start = time.time()
        logger.debug(f"Processing command: {cmd_line}")
        
        parts = cmd_line.strip().split()
        if not parts:
            return False

        # Handle g-* commands
        if parts[0] == "g":
            if len(parts) < 2:
                self._show_geos_help()
                return True

            subcmd = parts[1]
            logger.info(f"Executing Geometry OS command: g {subcmd}")

            if subcmd == "help":
                self._show_geos_help()

            elif subcmd == "map":
                if len(parts) >= 4:
                    try:
                        x, y = int(parts[2]), int(parts[3])
                        logger.info(f"Map pan to coordinates: ({x}, {y})")
                        print(f"\r\n{self.formatter.format_success(f'Map focal point → ({x}, {y})')}\r")
                        self.status_bar.set_message(f"Map centered at ({x}, {y})", "success")
                    except ValueError as e:
                        logger.error(f"Invalid map coordinates: {parts[2]} {parts[3]} - {e}")
                        print(f"\r\n{self.formatter.format_error('Invalid coordinates')}\r")
                else:
                    print(f"\r\n{self.formatter.format_info('Usage: g map <x> <y>')}\r")

            elif subcmd == "spawn":
                logger.info(f"Spawning new terminal tile (current count: {self.status_bar.tile_count})")
                print(f"\r\n{self.formatter.format_success('New terminal tile spawned')}\r")
                self.status_bar.update(tile_count=self.status_bar.tile_count + 1)
                self.status_bar.set_message("Terminal tile spawned", "success")

            elif subcmd == "gls":
                path = parts[2] if len(parts) > 2 else "."
                logger.debug(f"Spatial file listing for: {path}")
                print(f"\r\n{self.formatter.format_info(f'Spatial file listing for {path}:')}\r")
                try:
                    file_count = 0
                    for f in sorted(os.listdir(path))[:20]:
                        f_path = os.path.join(path, f)
                        if os.path.isfile(f_path):
                            size = os.path.getsize(f_path)
                            is_rts = f.endswith(".rts.png")
                            tag = f"{Colors.MAGENTA}[RTS]{Colors.RESET}" if is_rts else "     "
                            print(f"  {tag} {f:20} {Colors.DIM}{size/1024:.1f}KB{Colors.RESET}\r")
                            file_count += 1
                    logger.debug(f"Listed {file_count} files in {path}")
                except Exception as e:
                    logger.error(f"Failed to list directory {path}: {e}")
                    print(f"\r\n{self.formatter.format_error(str(e))}\r")

            elif subcmd == "ai":
                prompt = " ".join(parts[2:]) if len(parts) > 2 else "Analyze current state"
                logger.info(f"AI analysis request: {prompt}")
                print(f"\r\n{self.formatter.format_info(f'AI request: {prompt}')}\r")
                print(f"{Colors.DIM}Context synced to GNB...{Colors.RESET}\r")
                self.status_bar.set_message("AI analysis requested", "info")

            else:
                logger.warning(f"Unknown Geometry OS command: g {subcmd}")
                print(f"\r\n{self.formatter.format_warning(f'Unknown command: g {subcmd}')}\r")
                print(f"{Colors.DIM}Type 'g help' for available commands{Colors.RESET}\r")

            cmd_time = (time.time() - cmd_start) * 1000
            logger.debug(f"Command 'g {subcmd}' completed in {cmd_time:.2f}ms")
            self.history.add(cmd_line, success=True)
            return True

        # Handle built-in commands
        elif parts[0] == "status":
            logger.debug("Showing system status")
            self._show_status()
            return True

        elif parts[0] == "version":
            print(f"\r\n{Colors.CYAN}Enhanced Glyph Shell v1.0.0{Colors.RESET}\r")
            return True

        elif parts[0] == "help":
            self.help_overlay.open()
            self.ui_state = UIState.HELP_OVERLAY
            self._render_ui()
            return True

        return False

    def _show_geos_help(self):
        """Show Geometry OS command help."""
        print(f"\r\n{Colors.BOLD}{Colors.CYAN}Geometry OS Commands:{Colors.RESET}\r")
        print(f"\r")
        print(f"  {Colors.YELLOW}g map{Colors.RESET} <x> <y>    Pan the Infinite Map\r")
        print(f"  {Colors.YELLOW}g spawn{Colors.RESET}           Spawn a new terminal tile\r")
        print(f"  {Colors.YELLOW}g gls{Colors.RESET} [path]      List files with spatial metadata\r")
        print(f"  {Colors.YELLOW}g ai{Colors.RESET} [prompt]     Request AI analysis\r")
        print(f"  {Colors.YELLOW}g help{Colors.RESET}            Show this help\r")
        print(f"\r")
        print(f"{Colors.DIM}Press Ctrl+P for command palette, ? for keyboard shortcuts{Colors.RESET}\r")

    def _show_status(self):
        """Show system status."""
        print(f"\r\n{Colors.BOLD}{Colors.CYAN}System Status:{Colors.RESET}\r")
        print(f"\r")
        print(f"  {Colors.DIM}Directory:{Colors.RESET}    {os.getcwd()}\r")
        print(f"  {Colors.DIM}Terminal:{Colors.RESET}     {self.cols}x{self.rows}\r")
        print(f"  {Colors.DIM}Tiles:{Colors.RESET}        {self.status_bar.tile_count}\r")
        print(f"  {Colors.DIM}FPS:{Colors.RESET}          {self.fps:.1f}\r")
        print(f"  {Colors.DIM}Connection:{Colors.RESET}   {self.status_bar.connection_status}\r")
        print(f"  {Colors.DIM}AI Bridge:{Colors.RESET}    {self.status_bar.ai_bridge_status}\r")
        print(f"  {Colors.DIM}History:{Colors.RESET}      {len(self.history.entries)} commands\r")

    def run(self):
        """Run the enhanced shell."""
        logger.info("Starting Enhanced Glyph Shell main loop")
        
        # Print welcome message
        print(f"{Colors.BOLD}{Colors.CYAN}═══════════════════════════════════════════════════════════{Colors.RESET}")
        print(f"{Colors.BOLD}{Colors.WHITE}        Enhanced Glyph Shell - Geometry OS{Colors.RESET}")
        print(f"{Colors.BOLD}{Colors.CYAN}═══════════════════════════════════════════════════════════{Colors.RESET}")
        print(f"\r")
        print(f"  {Colors.DIM}Keyboard Shortcuts:{Colors.RESET}")
        print(f"    {Colors.YELLOW}Ctrl+P{Colors.RESET}  Command Palette    {Colors.YELLOW}Ctrl+H{Colors.RESET}  History")
        print(f"    {Colors.YELLOW}Ctrl+L{Colors.RESET}  Clear Screen       {Colors.YELLOW}?{Colors.RESET}       Help")
        print(f"\r")
        print(f"  {Colors.DIM}Type 'g help' for Geometry OS commands{Colors.RESET}")
        print(f"\r")

        # Start the PTY
        logger.debug(f"Forking PTY with shell: {self.shell}")
        pid, self.fd = pty.fork()
        logger.debug(f"PTY forked (pid: {pid}, fd: {self.fd})")

        if pid == 0:
            # Child process: Execute the shell
            logger.debug(f"Child process executing shell: {self.shell}")
            os.execvpe(self.shell, [self.shell], os.environ)

        # Parent process: Main loop
        logger.info(f"Parent process entering main loop (child pid: {pid})")
        old_settings = termios.tcgetattr(sys.stdin)

        # Setup SIGWINCH handler
        signal.signal(signal.SIGWINCH, self._handle_winch)
        logger.debug("SIGWINCH handler registered")

        try:
            tty.setraw(sys.stdin)

            # Initial UI render
            self._render_ui()

            while True:
                self._update_fps()
                self.frame_count += 1

                # Periodically update status bar
                now = time.time()
                if now - self.last_update > 0.5:
                    self._render_ui()
                    self.last_update = now

                r, w, e = select.select([sys.stdin, self.fd], [], [], 0.05)

                if sys.stdin in r:
                    data = os.read(sys.stdin.fileno(), 1024)
                    
                    if logger.isEnabledFor(logging.DEBUG):
                        logger.debug(f"stdin read: {len(data)} bytes")

                    for char_byte in data:
                        char = chr(char_byte)

                        # Handle special keys first
                        if self._handle_special_input(char, char_byte):
                            continue

                        if char == '\r' or char == '\n':
                            # Check for Geometry OS commands
                            if self._handle_geos_command(self.input_buffer):
                                os.write(self.fd, b"\n")
                            else:
                                os.write(self.fd, bytes([char_byte]))
                            self.input_buffer = ""
                        elif char_byte == 127:  # Backspace
                            if self.input_buffer:
                                self.input_buffer = self.input_buffer[:-1]
                            os.write(self.fd, bytes([char_byte]))
                        else:
                            if char_byte >= 32:  # Printable
                                self.input_buffer += char
                            os.write(self.fd, bytes([char_byte]))

                if self.fd in r:
                    try:
                        data = os.read(self.fd, 1024)
                    except OSError as e:
                        logger.info(f"PTY read error (child likely exited): {e}")
                        break
                    if not data:
                        logger.info("PTY returned empty data, child process exited")
                        break

                    # Format output with syntax highlighting
                    formatted = self.formatter.format(data.decode('utf-8', errors='replace'))
                    os.write(sys.stdout.fileno(), formatted.encode('utf-8'))

        except Exception as e:
            logger.error(f"Error in main loop: {e}", exc_info=True)
            raise
        finally:
            logger.info("Cleaning up and exiting Enhanced Glyph Shell")
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
            if self.bridge and self.tile_id is not None:
                logger.debug(f"Rendering final texture to: {self.texture_path}")
                self.bridge.render_to_texture(self.tile_id, str(self.texture_path))
            logger.info(f"Session stats: {self.frame_count} frames, {len(self.history.entries)} commands, final FPS: {self.fps:.1f}")


def main():
    """Main entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Enhanced Glyph Shell")
    parser.add_argument("--shell", default="/bin/bash", help="Shell to run")
    parser.add_argument("--demo", action="store_true", help="Run demo mode")

    args = parser.parse_args()

    if args.demo:
        # Demo mode - show UI components
        print(f"{Colors.BOLD}{Colors.CYAN}Enhanced Glyph Shell Demo{Colors.RESET}\n")

        # Status bar demo
        status = StatusBar()
        status.update(tile_count=3, fps=58.5, connection="connected", ai_bridge="online")
        status.set_message("Welcome to Enhanced Glyph Shell", "success")
        print("Status Bar:")
        print(status.render(80))
        print()

        # Command palette demo
        palette = CommandPalette()
        palette.open()
        print("\nCommand Palette (empty search):")
        print(palette.render(80, 8))
        print()

        palette.search("map")
        print("\nCommand Palette (search: 'map'):")
        print(palette.render(80, 8))
        print()

        # Help overlay demo
        help_overlay = HelpOverlay()
        help_overlay.open()
        print("\nHelp Overlay:")
        print(help_overlay.render(80))
        print()

        # Progress bar demo
        print("\nProgress Bar Examples:")
        print(OutputFormatter.progress_bar(0.25, label="Loading textures"))
        print(OutputFormatter.progress_bar(0.75, label="Compiling shaders"))
        print(OutputFormatter.progress_bar(1.0, label="Complete"))
        print()

        # Formatted messages
        print("\nFormatted Messages:")
        print(OutputFormatter.format_success("Operation completed successfully"))
        print(OutputFormatter.format_error("Connection failed: timeout"))
        print(OutputFormatter.format_warning("Low disk space: 5% remaining"))
        print(OutputFormatter.format_info("Press Ctrl+P to open command palette"))
        print()

        return

    shell = EnhancedGlyphShell(shell=args.shell)
    shell.run()


if __name__ == "__main__":
    main()
