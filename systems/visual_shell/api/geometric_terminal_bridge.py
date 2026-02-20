#!/usr/bin/env python3
"""
Geometric Terminal Bridge - PixelRTS v3 Integration

Integrates the Terminal Clone system with PixelRTS v3 geometric instructions.
This creates a direct path from PTY output to GPU-native terminal textures.

Architecture:
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ TerminalVatBridge    │ ──► │ GeometricTerminal    │ ──► │ PixelRTS v3 Texture  │
│ (spawn terminal)     │     │ (encode cells)       │     │ (GPU-executable)     │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
         │                           │                            │
         ▼                           ▼                            ▼
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ Rust PTY Engine      │     │ TerminalCell RGBA    │     │ Hilbert-mapped       │
│ (shell output)       │     │ (char,fg,bg,flags)   │     │ spatial encoding     │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘

Terminal Cell Encoding (RGBA):
  R (Char):   ASCII character code (0-127)
  G (FG):     Foreground color index (0-15, ANSI 16-color)
  B (BG):     Background color index (0-15)
  A (Flags):  Style flags (bold=1, dim=2, italic=4, underline=8, blink=16, inverse=32)

Terminal Operation Opcodes (0x40-0x4F):
  0x40 PUTC   - Print character at cursor position
  0x41 MVCR   - Move cursor to (x, y)
  0x42 SCRL   - Scroll by N lines
  0x43 CLR    - Clear screen
  0x44 SETFG  - Set foreground color
  0x45 SETBG  - Set background color
  0x46 CLREOL - Clear to end of line
  0x47 BELL   - Terminal bell

Usage:
    from systems.visual_shell.api.geometric_terminal_bridge import (
        GeometricTerminalBridge, TerminalTextureConfig
    )

    # Spawn a geometric terminal
    bridge = GeometricTerminalBridge()
    config = TerminalTextureConfig(cols=120, rows=36)
    tile_id = bridge.spawn_geometric_terminal(config)

    # Feed PTY output
    bridge.feed_pty_output(tile_id, b"ls -la\\n")

    # Render to GPU-executable texture
    bridge.render_to_texture(tile_id, "terminal.rts.png")
"""

import sys
import json
import logging
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Tuple, Dict, Any, List

# Add pixel_compiler to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "pixel_compiler"))

try:
    from pixelrts_v3.geometric_terminal import (
        GeometricTerminal, TerminalCell, HilbertCurve,
        TERMINAL_OPCODES, TERMINAL_COLORS
    )
    PIXELRTS_V3_AVAILABLE = True
except ImportError:
    PIXELRTS_V3_AVAILABLE = False
    logging.warning("PixelRTS v3 not available - geometric terminal disabled")

try:
    from .terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig
except (ImportError, ValueError):
    from terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig

logger = logging.getLogger("geometric_terminal_bridge")


@dataclass
class TerminalTextureConfig:
    """Configuration for geometric terminal texture."""
    cols: int = 120
    rows: int = 36
    shell: str = "/bin/bash"
    district: str = "geometric_terminal"
    near_center: bool = True
    cell_width: int = 8   # Pixel width per cell
    cell_height: int = 16  # Pixel height per cell
    use_hilbert: bool = True  # Hilbert curve spatial mapping
    auto_render: bool = False  # Auto-render on PTY output


@dataclass
class GeometricTerminalTile:
    """A terminal tile with geometric texture encoding."""
    tile_id: int
    terminal: 'GeometricTerminal'
    vat_config: TerminalTileConfig
    texture_config: TerminalTextureConfig
    texture_path: Optional[Path] = None
    last_render: float = 0.0
    render_count: int = 0
    dirty: bool = True  # Needs re-render


class GeometricTerminalBridge:
    """
    Bridge between Terminal Clone Manager and PixelRTS v3 geometric textures.

    This creates GPU-native terminal tiles where:
    1. PTY output is encoded as RGBA pixels
    2. Each cell is a "paint" instruction for the GPU
    3. The texture IS the terminal state (no separate buffer)
    """

    def __init__(
        self,
        state_dir: Optional[Path] = None,
        texture_dir: Optional[Path] = None,
        auto_save: bool = True,
        offline_mode: bool = False
    ):
        """
        Initialize the geometric terminal bridge.

        Args:
            state_dir: Directory for VAT state
            texture_dir: Directory for rendered textures
            auto_save: Auto-save VAT after changes
            offline_mode: If True, skip Rust API calls
        """
        if not PIXELRTS_V3_AVAILABLE:
            raise ImportError("PixelRTS v3 is required for GeometricTerminalBridge")

        self.state_dir = state_dir or Path(".geometry/tectonic")
        self.state_dir.mkdir(parents=True, exist_ok=True)

        self.texture_dir = texture_dir or self.state_dir / "textures"
        self.texture_dir.mkdir(parents=True, exist_ok=True)

        # VAT bridge for spatial placement
        self.vat_bridge = TerminalVatBridge(
            state_dir=self.state_dir,
            auto_save=auto_save,
            offline_mode=offline_mode
        )

        # Geometric terminal tiles
        self._tiles: Dict[int, GeometricTerminalTile] = {}
        self._next_id = 0

        logger.info(
            f"GeometricTerminalBridge initialized "
            f"(texture_dir={self.texture_dir})"
        )

    def spawn_geometric_terminal(self, config: TerminalTextureConfig) -> int:
        """
        Spawn a new geometric terminal tile.

        Args:
            config: Terminal texture configuration

        Returns:
            Tile ID
        """
        tile_id = self._next_id
        self._next_id += 1

        # Create geometric terminal
        terminal = GeometricTerminal(
            cols=config.cols,
            rows=config.rows,
            use_hilbert=config.use_hilbert
        )

        # Create VAT config
        vat_config = TerminalTileConfig(
            rows=config.rows,
            cols=config.cols,
            shell=config.shell,
            district=config.district,
            near_center=config.near_center
        )

        # Register with VAT
        vat_tile_id = self.vat_bridge.spawn_terminal(vat_config)

        # Create tile
        tile = GeometricTerminalTile(
            tile_id=tile_id,
            terminal=terminal,
            vat_config=vat_config,
            texture_config=config,
            texture_path=None,
            dirty=True
        )
        self._tiles[tile_id] = tile

        logger.info(
            f"Spawned geometric terminal {tile_id} "
            f"({config.cols}x{config.rows}, VAT tile {vat_tile_id})"
        )

        return tile_id

    def feed_pty_output(self, tile_id: int, data: bytes) -> bool:
        """
        Feed PTY output to a geometric terminal.

        Args:
            tile_id: Tile identifier
            data: Raw PTY output bytes

        Returns:
            True if successful
        """
        if tile_id not in self._tiles:
            logger.warning(f"Tile {tile_id} not found")
            return False

        tile = self._tiles[tile_id]

        # Process through geometric terminal
        tile.terminal.from_pty_output(data)
        tile.dirty = True

        # Auto-render if configured
        if tile.texture_config.auto_render:
            self.render_to_texture(tile_id)

        return True

    def feed_ansi(self, tile_id: int, ansi_data: bytes) -> bool:
        """
        Feed ANSI-encoded data to terminal.

        This processes escape sequences and updates colors/styles.

        Args:
            tile_id: Tile identifier
            ansi_data: ANSI-encoded terminal data

        Returns:
            True if successful
        """
        if tile_id not in self._tiles:
            return False

        tile = self._tiles[tile_id]

        # Extended ANSI handling
        i = 0
        while i < len(ansi_data):
            byte = ansi_data[i]

            if byte == 0x1b:  # ESC
                # Look for CSI sequence
                if i + 1 < len(ansi_data) and ansi_data[i + 1] == ord('['):
                    # CSI sequence
                    j = i + 2
                    params = []
                    current_param = ""

                    while j < len(ansi_data):
                        c = ansi_data[j]
                        if 0x30 <= c <= 0x39:  # Digit
                            current_param += chr(c)
                        elif c == ord(';'):
                            params.append(int(current_param) if current_param else 0)
                            current_param = ""
                        elif 0x40 <= c <= 0x7e:  # Final byte
                            if current_param:
                                params.append(int(current_param))
                            self._handle_csi(tile.terminal, chr(c), params)
                            i = j
                            break
                        j += 1
                i += 1
            else:
                # Regular character
                tile.terminal.from_pty_output(bytes([byte]))
                i += 1

        tile.dirty = True
        return True

    def _handle_csi(self, terminal: GeometricTerminal, cmd: str, params: List[int]) -> None:
        """Handle CSI escape sequences."""
        if cmd == 'm':  # SGR - Select Graphic Rendition
            for p in params or [0]:
                if p == 0:
                    terminal.set_fg(7)
                    terminal.set_bg(0)
                    terminal.set_style()
                elif 30 <= p <= 37:
                    terminal.set_fg(p - 30)
                elif 40 <= p <= 47:
                    terminal.set_bg(p - 40)
                elif 90 <= p <= 97:
                    terminal.set_fg(p - 90 + 8)  # Bright colors
                elif 100 <= p <= 107:
                    terminal.set_bg(p - 100 + 8)
                elif p == 1:
                    terminal.set_style(bold=True)
                elif p == 4:
                    terminal.set_style(underline=True)
                elif p == 7:
                    terminal.set_style(inverse=True)

        elif cmd == 'H' or cmd == 'f':  # Cursor position
            row = (params[0] if len(params) > 0 else 1) - 1
            col = (params[1] if len(params) > 1 else 1) - 1
            terminal.move_cursor(col, row)

        elif cmd == 'J':  # Clear screen
            mode = params[0] if params else 0
            if mode == 2:
                terminal.clear()

        elif cmd == 'K':  # Clear line
            # Simplified - just clear to EOL
            pass

        elif cmd == 'A':  # Cursor up
            n = params[0] if params else 1
            terminal.move_cursor(terminal.cursor_x, terminal.cursor_y - n)

        elif cmd == 'B':  # Cursor down
            n = params[0] if params else 1
            terminal.move_cursor(terminal.cursor_x, terminal.cursor_y + n)

        elif cmd == 'C':  # Cursor forward
            n = params[0] if params else 1
            terminal.move_cursor(terminal.cursor_x + n, terminal.cursor_y)

        elif cmd == 'D':  # Cursor back
            n = params[0] if params else 1
            terminal.move_cursor(terminal.cursor_x - n, terminal.cursor_y)

    def render_to_texture(self, tile_id: int, output_path: Optional[str] = None) -> Optional[Path]:
        """
        Render terminal to PixelRTS v3 texture.

        Args:
            tile_id: Tile identifier
            output_path: Optional output path (default: auto-generated)

        Returns:
            Path to rendered texture or None on error
        """
        if tile_id not in self._tiles:
            return None

        tile = self._tiles[tile_id]

        # Generate output path if not provided
        if not output_path:
            output_path = str(self.texture_dir / f"terminal_{tile_id}.rts.png")

        # Render geometric texture
        tile.terminal.render_to_texture(output_path)
        tile.texture_path = Path(output_path)
        tile.last_render = time.time()
        tile.render_count += 1
        tile.dirty = False

        logger.debug(f"Rendered geometric terminal {tile_id} to {output_path}")
        return tile.texture_path

    def get_cell(self, tile_id: int, row: int, col: int) -> Optional[TerminalCell]:
        """Get cell at position."""
        if tile_id not in self._tiles:
            return None
        return self._tiles[tile_id].terminal.get_cell_at(row, col)

    def get_cell_rgba(self, tile_id: int, row: int, col: int) -> Optional[Tuple[int, int, int, int]]:
        """Get cell as RGBA tuple."""
        cell = self.get_cell(tile_id, row, col)
        if cell:
            return cell.to_rgba()
        return None

    def get_texture_stats(self, tile_id: int) -> Dict[str, Any]:
        """Get texture statistics for a tile."""
        if tile_id not in self._tiles:
            return {}

        tile = self._tiles[tile_id]
        return {
            "tile_id": tile_id,
            "cols": tile.texture_config.cols,
            "rows": tile.texture_config.rows,
            "grid_size": tile.terminal.grid_size,
            "texture_path": str(tile.texture_path) if tile.texture_path else None,
            "last_render": tile.last_render,
            "render_count": tile.render_count,
            "dirty": tile.dirty,
            "cursor": (tile.terminal.cursor_x, tile.terminal.cursor_y),
        }

    def list_geometric_terminals(self) -> List[int]:
        """List all geometric terminal tile IDs."""
        return list(self._tiles.keys())

    def destroy_geometric_terminal(self, tile_id: int) -> bool:
        """Destroy a geometric terminal tile."""
        if tile_id not in self._tiles:
            return False

        tile = self._tiles[tile_id]

        # Clean up texture file
        if tile.texture_path and tile.texture_path.exists():
            tile.texture_path.unlink()

        del self._tiles[tile_id]
        logger.info(f"Destroyed geometric terminal {tile_id}")
        return True

    def encode_as_opcodes(self, tile_id: int) -> List[Dict[str, Any]]:
        """
        Encode terminal state as PixelRTS v3 opcodes.

        This generates a sequence of geometric instructions that
        would recreate the terminal state when executed.

        Args:
            tile_id: Tile identifier

        Returns:
            List of opcode dictionaries
        """
        if tile_id not in self._tiles:
            return []

        tile = self._tiles[tile_id]
        opcodes = []

        # Clear screen
        opcodes.append({
            "op": "CLR",
            "opcode": TERMINAL_OPCODES["CLR"],
            "rgba": (TERMINAL_OPCODES["CLR"], 0, 0, 0)
        })

        # Set default colors
        opcodes.append({
            "op": "SETFG",
            "opcode": TERMINAL_OPCODES["SETFG"],
            "rgba": (TERMINAL_OPCODES["SETFG"], 7, 0, 0)  # White
        })

        # Encode each non-empty cell as PUTC
        for row in range(tile.terminal.rows):
            for col in range(tile.terminal.cols):
                cell = tile.terminal.get_cell_at(row, col)
                if cell and cell.char > 0:
                    # Move cursor
                    opcodes.append({
                        "op": "MVCR",
                        "opcode": TERMINAL_OPCODES["MVCR"],
                        "args": {"x": col, "y": row},
                        "rgba": (TERMINAL_OPCODES["MVCR"], col, row, 0)
                    })

                    # Set colors if different from current
                    # (simplified - always set for now)

                    # Print character
                    opcodes.append({
                        "op": "PUTC",
                        "opcode": TERMINAL_OPCODES["PUTC"],
                        "args": {"char": chr(cell.char), "fg": cell.fg, "bg": cell.bg},
                        "rgba": (TERMINAL_OPCODES["PUTC"], cell.char, cell.fg, cell.bg)
                    })

        return opcodes


# Demo
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Geometric Terminal Bridge")
    parser.add_argument("--demo", action="store_true", help="Run demo")
    parser.add_argument("--spawn", action="store_true", help="Spawn a test terminal")
    parser.add_argument("--feed", type=str, help="Feed text to terminal")
    parser.add_argument("--render", action="store_true", help="Render to texture")
    parser.add_argument("--tile-id", type=int, default=0, help="Tile ID")

    args = parser.parse_args()

    if not PIXELRTS_V3_AVAILABLE:
        print("ERROR: PixelRTS v3 not available")
        sys.exit(1)

    logging.basicConfig(level=logging.INFO)

    bridge = GeometricTerminalBridge()

    if args.demo or not (args.spawn or args.feed or args.render):
        # Demo mode
        config = TerminalTextureConfig(cols=40, rows=10)
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed some output
        bridge.feed_ansi(tile_id, b"\x1b[32mGEOMETRY OS\x1b[0m\n")
        bridge.feed_ansi(tile_id, b"\x1b[36mGeometric Terminal v3\x1b[0m\n")
        bridge.feed_ansi(tile_id, b"Terminal cells as GPU opcodes\n")

        # Render
        path = bridge.render_to_texture(tile_id)
        print(f"\nRendered to: {path}")

        # Show opcodes
        opcodes = bridge.encode_as_opcodes(tile_id)
        print(f"\nGenerated {len(opcodes)} geometric opcodes:")
        for op in opcodes[:5]:
            print(f"  {op['op']}: RGBA={op['rgba']}")

    if args.spawn:
        config = TerminalTextureConfig()
        tile_id = bridge.spawn_geometric_terminal(config)
        print(f"Spawned tile {tile_id}")

    if args.feed:
        bridge.feed_ansi(args.tile_id, args.feed.encode())
        print(f"Fed {len(args.feed)} bytes to tile {args.tile_id}")

    if args.render:
        path = bridge.render_to_texture(args.tile_id)
        print(f"Rendered to: {path}")
