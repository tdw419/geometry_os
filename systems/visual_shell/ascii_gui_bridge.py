"""
ASCII GUI Bridge - Connects ASCII fragments to Visual Shell frontend.

This bridge:
1. Reads ASCII fragments from .geometry/gui/fragments/ and broadcasts to frontend
2. Processes commands from .geometry/gui/commands/pending/ and sends to frontend
3. Receives window events from frontend and updates ASCII fragments
4. Translates screen coordinates to Hilbert curve indices for geometric structure

This enables AI agents to read/write ASCII text files and control the real GUI.
The Hilbert encoding ensures spatial locality - nearby windows have nearby indices.
"""

import asyncio
import json
import yaml
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, Optional, List, Callable, Tuple
from dataclasses import dataclass, field
import logging

logger = logging.getLogger(__name__)


class HilbertCurve:
    """
    Hilbert curve utility for spatial coordinate translation.

    The Hilbert curve is a space-filling curve that maps 2D coordinates to
    1D indices while preserving spatial locality. Nearby points in 2D space
    map to nearby points on the 1D curve.

    This is crucial for "AI sees OS as geometric structure" - windows that
    are visually close on screen have close Hilbert indices, enabling
    efficient spatial queries and AI comprehension of GUI layout.
    """

    def __init__(self, order: int = 10):
        """
        Initialize Hilbert curve for a given order.

        Args:
            order: Hilbert curve order. Grid size = 2^order.
                   Order 10 = 1024x1024 grid (suitable for most screens)
        """
        self.order = order
        self.grid_size = 2 ** order

    @staticmethod
    def d2xy(n: int, d: int) -> Tuple[int, int]:
        """
        Convert Hilbert distance (1D index) to (x, y) coordinates.

        Args:
            n: Grid size (must be power of 2)
            d: Distance along the curve (0 to n²-1)

        Returns:
            Tuple of (x, y) coordinates
        """
        x = y = 0
        s = 1
        temp_d = d

        while s < n:
            rx = 1 & (temp_d >> 1)
            ry = 1 & (temp_d ^ rx)

            # Rotate/flip quadrant
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                # Swap x and y
                x, y = y, x

            # Add offset for this level
            x += s * rx
            y += s * ry

            temp_d >>= 2  # temp_d //= 4
            s <<= 1  # s *= 2

        return (x, y)

    @staticmethod
    def xy2d(n: int, x: int, y: int) -> int:
        """
        Convert (x, y) coordinates to Hilbert distance (1D index).

        Args:
            n: Grid size (must be power of 2)
            x: X coordinate
            y: Y coordinate

        Returns:
            Distance along the curve (0 to n²-1)
        """
        d = 0
        s = n // 2  # Start at n/2, not 1 (matches Rust reference)
        temp_x, temp_y = x, y

        while s > 0:
            rx = 1 if (temp_x & s) else 0
            ry = 1 if (temp_y & s) else 0

            d += s * s * ((3 * rx) ^ ry)

            # Rotate/flip
            if ry == 0:
                if rx == 1:
                    temp_x = s - 1 - temp_x
                    temp_y = s - 1 - temp_y
                temp_x, temp_y = temp_y, temp_x

            s //= 2  # Divide by 2

        return d

    def screen_to_hilbert(self, x: int, y: int) -> int:
        """
        Convert screen coordinates to Hilbert index.

        Args:
            x: Screen X coordinate
            y: Screen Y coordinate

        Returns:
            Hilbert distance/index
        """
        return self.xy2d(self.grid_size, x, y)

    def hilbert_to_screen(self, d: int) -> Tuple[int, int]:
        """
        Convert Hilbert index to screen coordinates.

        Args:
            d: Hilbert distance/index

        Returns:
            Tuple of (x, y) screen coordinates
        """
        return self.d2xy(self.grid_size, d)

    def calculate_order_for_screen(self, width: int, height: int) -> int:
        """
        Calculate required Hilbert order for a given screen size.

        Args:
            width: Screen width
            height: Screen height

        Returns:
            Required Hilbert order
        """
        import math
        max_dim = max(width, height)
        return math.ceil(math.log2(max_dim))


class SpatialLocalityVerifier:
    """
    Verifies that window placements preserve spatial locality on the Hilbert curve.

    Nearby windows on screen should have nearby Hilbert indices.
    This is essential for "AI sees OS as geometric structure" - the geometric
    structure of the GUI should be comprehensible through the Hilbert indices.
    """

    def __init__(self, hilbert: HilbertCurve):
        self.hilbert = hilbert

    def verify_locality(
        self,
        windows: List['WindowState'],
        threshold: float = 0.1
    ) -> Tuple[bool, List[Dict[str, Any]]]:
        """
        Verify that nearby windows have nearby Hilbert indices.

        Args:
            windows: List of WindowState objects
            threshold: Maximum acceptable ratio of Hilbert distance to
                      Manhattan distance (default 0.1 = 10%)

        Returns:
            Tuple of (passed, violations) where violations is a list of
            window pairs that violate locality
        """
        violations = []

        for i, win1 in enumerate(windows):
            for win2 in windows[i+1:]:
                # Calculate Manhattan distance on screen
                screen_dist = abs(win1.pos[0] - win2.pos[0]) + abs(win1.pos[1] - win2.pos[1])

                # Skip if windows are far apart on screen
                if screen_dist > 500:  # Not considered "nearby"
                    continue

                # Calculate Hilbert index distance
                h1 = win1.hilbert_index if win1.hilbert_index is not None else 0
                h2 = win2.hilbert_index if win2.hilbert_index is not None else 0
                hilbert_dist = abs(h1 - h2)

                # Check locality: Hilbert distance should be proportional to screen distance
                # For a perfect Hilbert curve, max ratio is roughly sqrt(2) * screen_dist
                max_expected_hilbert = screen_dist * screen_dist * 2  # Conservative bound

                if screen_dist > 0 and hilbert_dist > max_expected_hilbert:
                    violations.append({
                        'window1': win1.id,
                        'window2': win2.id,
                        'screen_distance': screen_dist,
                        'hilbert_distance': hilbert_dist,
                        'ratio': hilbert_dist / screen_dist if screen_dist > 0 else float('inf')
                    })

        passed = len(violations) == 0
        return (passed, violations)

    def get_spatial_coherence_score(self, windows: List['WindowState']) -> float:
        """
        Calculate a spatial coherence score (0.0 to 1.0).

        Higher scores indicate better locality preservation.

        Args:
            windows: List of WindowState objects

        Returns:
            Coherence score between 0.0 and 1.0
        """
        if len(windows) < 2:
            return 1.0

        total_pairs = 0
        coherent_pairs = 0

        for i, win1 in enumerate(windows):
            for win2 in windows[i+1:]:
                screen_dist = abs(win1.pos[0] - win2.pos[0]) + abs(win1.pos[1] - win2.pos[1])

                # Only consider "nearby" windows (< 200px Manhattan distance)
                if screen_dist < 200:
                    total_pairs += 1
                    h1 = win1.hilbert_index if win1.hilbert_index is not None else 0
                    h2 = win2.hilbert_index if win2.hilbert_index is not None else 0
                    hilbert_dist = abs(h1 - h2)

                    # Good locality: Hilbert distance < screen_distance^2 * 2
                    if hilbert_dist < screen_dist * screen_dist * 2:
                        coherent_pairs += 1

        return coherent_pairs / total_pairs if total_pairs > 0 else 1.0

# Project root
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
GUI_DIR = PROJECT_ROOT / ".geometry" / "gui"


@dataclass
class WindowState:
    """
    Represents a window's state for ASCII rendering with geometric structure.

    The Hilbert encoding enables AI to understand GUI layout through spatial
    indices. Nearby windows on screen have nearby Hilbert indices.
    """
    id: str
    title: str
    type: str
    pos: List[int]  # Screen coordinates [x, y]
    size: List[int]  # Window dimensions [width, height]
    z: int = 0
    focused: bool = False
    visible: bool = True
    metadata: Dict[str, Any] = field(default_factory=dict)

    # Hilbert geometric encoding (computed from pos)
    hilbert_index: Optional[int] = None  # 1D Hilbert distance
    hilbert_coords: Optional[Tuple[int, int]] = None  # Hilbert curve position


class ASCIIGUIBridge:
    """
    Bridge between ASCII GUI fragments and Visual Shell frontend.

    Usage:
        bridge = ASCIIGUIBridge(broadcast_callback)
        await bridge.start()

    The broadcast_callback should accept a dict and send it via WebSocket.
    """

    def __init__(
        self,
        broadcast_callback: Callable[[Dict[str, Any]], None],
        gui_dir: Optional[Path] = None,
        hilbert_order: int = 10
    ):
        self.broadcast = broadcast_callback
        self.gui_dir = gui_dir or GUI_DIR
        self.fragments_dir = self.gui_dir / "fragments"
        self.pending_dir = self.gui_dir / "commands" / "pending"
        self.completed_dir = self.gui_dir / "commands" / "completed"

        # Ensure directories exist
        self.fragments_dir.mkdir(parents=True, exist_ok=True)
        self.pending_dir.mkdir(parents=True, exist_ok=True)
        self.completed_dir.mkdir(parents=True, exist_ok=True)

        # Hilbert curve for geometric coordinate translation
        self.hilbert = HilbertCurve(order=hilbert_order)
        self.locality_verifier = SpatialLocalityVerifier(self.hilbert)

        # Current window state
        self.windows: Dict[str, WindowState] = {}
        self.focused_window_id: Optional[str] = None

        # Running state
        self._running = False
        self._last_fragment_hash: Dict[str, str] = {}

    def _compute_hilbert_encoding(self, pos: List[int]) -> Tuple[int, Tuple[int, int]]:
        """
        Compute Hilbert encoding for screen coordinates.

        Args:
            pos: Screen coordinates [x, y]

        Returns:
            Tuple of (hilbert_index, hilbert_coords)
        """
        x, y = pos[0], pos[1]
        hilbert_index = self.hilbert.screen_to_hilbert(x, y)
        hilbert_coords = self.hilbert.hilbert_to_screen(hilbert_index)
        return (hilbert_index, hilbert_coords)

    async def start(self):
        """Start the bridge - load initial state and begin processing."""
        self._running = True
        await self._load_windows_fragment()
        logger.info(f"ASCII GUI Bridge started, watching {self.gui_dir}")

    async def stop(self):
        """Stop the bridge."""
        self._running = False

    # === Fragment Reading (AI reads GUI state) ===

    async def _load_windows_fragment(self):
        """Load windows.yaml into internal state with Hilbert encoding."""
        yaml_path = self.fragments_dir / "windows.yaml"
        if not yaml_path.exists():
            return

        try:
            with open(yaml_path) as f:
                data = yaml.safe_load(f) or {}

            self.windows.clear()
            for win_data in data.get("windows", []):
                pos = win_data["pos"]
                hilbert_index, hilbert_coords = self._compute_hilbert_encoding(pos)

                win = WindowState(
                    id=win_data["id"],
                    title=win_data["title"],
                    type=win_data["type"],
                    pos=pos,
                    size=win_data["size"],
                    z=win_data.get("z", 0),
                    focused=win_data.get("focused", False),
                    visible=win_data.get("visible", True),
                    metadata=win_data.get("metadata", {}),
                    hilbert_index=hilbert_index,
                    hilbert_coords=hilbert_coords
                )
                self.windows[win.id] = win
                if win.focused:
                    self.focused_window_id = win.id

            logger.debug(f"Loaded {len(self.windows)} windows from fragment with Hilbert encoding")
        except Exception as e:
            logger.error(f"Failed to load windows fragment: {e}")

    def get_windows_yaml(self) -> str:
        """Get current windows state as YAML string with Hilbert geometric encoding."""
        windows_data = []
        for win in sorted(self.windows.values(), key=lambda w: -w.z):
            windows_data.append({
                "id": win.id,
                "title": win.title,
                "type": win.type,
                "pos": win.pos,
                "size": win.size,
                "z": win.z,
                "focused": win.focused,
                "visible": win.visible,
                "metadata": win.metadata,
                # Hilbert geometric encoding for AI spatial understanding
                "hilbert_index": win.hilbert_index,
                "hilbert_coords": list(win.hilbert_coords) if win.hilbert_coords else None
            })

        # Calculate spatial coherence score
        coherence_score = self.locality_verifier.get_spatial_coherence_score(
            list(self.windows.values())
        )

        data = {
            "windows": windows_data,
            "count": len(windows_data),
            "focused_id": self.focused_window_id,
            "last_update": datetime.now().isoformat(),
            # Geometric structure metadata for AI comprehension
            "geometric": {
                "hilbert_order": self.hilbert.order,
                "grid_size": self.hilbert.grid_size,
                "spatial_coherence": round(coherence_score, 3),
                "locality_verified": self.locality_verifier.verify_locality(
                    list(self.windows.values())
                )[0]
            }
        }
        return yaml.dump(data, default_flow_style=False)

    # === Command Processing (AI writes commands) ===

    async def process_pending_commands(self):
        """
        Process all pending commands from .geometry/gui/commands/pending/.

        Commands are YAML files with format:
            command_id: <uuid>
            action: focus|close|move|resize|create
            target: <window-id>
            params: {...}
            timestamp: <ISO8601>
            source: <agent-name>
        """
        if not self.pending_dir.exists():
            return

        for cmd_file in list(self.pending_dir.glob("*.yaml")):
            try:
                await self._process_command_file(cmd_file)
            except Exception as e:
                logger.error(f"Failed to process command {cmd_file}: {e}")
                # Move to completed with error
                self._move_to_completed(cmd_file, error=str(e))

    async def _process_command_file(self, cmd_path: Path):
        """Process a single command file."""
        with open(cmd_path) as f:
            command = yaml.safe_load(f)

        action = command.get("action")
        target = command.get("target")
        params = command.get("params", {})
        cmd_id = command.get("command_id", cmd_path.stem)

        logger.info(f"Processing command: {action} on {target}")

        # Broadcast to frontend
        message = {
            "type": "GUI_COMMAND",
            "command_id": cmd_id,
            "action": action,
            "target": target,
            "params": params,
            "source": command.get("source", "unknown"),
            "timestamp": command.get("timestamp", datetime.now().isoformat())
        }

        await self.broadcast(message)

        # Update internal state based on action
        if action == "focus" and target in self.windows:
            # Unfocus all, focus target
            for win in self.windows.values():
                win.focused = False
            self.windows[target].focused = True
            self.focused_window_id = target

        elif action == "close" and target in self.windows:
            del self.windows[target]
            if self.focused_window_id == target:
                self.focused_window_id = None

        elif action == "create":
            pos = params.get("pos", [100, 100])
            hilbert_index, hilbert_coords = self._compute_hilbert_encoding(pos)

            win = WindowState(
                id=target,
                title=params.get("title", "New Window"),
                type=params.get("type", "terminal"),
                pos=pos,
                size=params.get("size", [400, 300]),
                z=params.get("z", 0),
                focused=params.get("focused", False),
                visible=True,
                hilbert_index=hilbert_index,
                hilbert_coords=hilbert_coords
            )
            self.windows[target] = win
            if win.focused:
                self.focused_window_id = target

        elif action == "move" and target in self.windows:
            if "pos" in params:
                self.windows[target].pos = params["pos"]

        elif action == "resize" and target in self.windows:
            if "size" in params:
                self.windows[target].size = params["size"]

        # Update fragments
        await self._update_fragments()

        # Move to completed
        self._move_to_completed(cmd_path)

    def _move_to_completed(self, cmd_path: Path, error: Optional[str] = None):
        """Move command file to completed directory."""
        completed_path = self.completed_dir / cmd_path.name

        # If there was an error, append it to the file
        if error:
            with open(cmd_path, 'a') as f:
                f.write(f"\nerror: \"{error}\"\n")
            completed_path = self.completed_dir / f"{cmd_path.stem}_error.yaml"

        cmd_path.rename(completed_path)

    async def _update_fragments(self):
        """Update all ASCII fragments from current state."""
        # Update windows.yaml
        yaml_path = self.fragments_dir / "windows.yaml"
        yaml_path.write_text(self.get_windows_yaml())

        # Update focus.ascii
        focus_path = self.fragments_dir / "focus.ascii"
        focus_path.write_text(self._render_focus_ascii())

    def _render_focus_ascii(self) -> str:
        """Render focus state as ASCII box."""
        focused = None
        if self.focused_window_id and self.focused_window_id in self.windows:
            focused = self.windows[self.focused_window_id]

        lines = [
            "+----------------------------------------------------------+",
            "| FOCUS STATE                                              |",
            "+----------------------------------------------------------+",
        ]

        if focused:
            lines.extend([
                f"| Window:     {focused.id} ({focused.title})".ljust(60) + "|",
                f"| Element:    none".ljust(60) + "|",
                f"| Cursor:     (0, 0)".ljust(60) + "|",
                f"| Mode:       normal".ljust(60) + "|",
            ])
        else:
            lines.extend([
                "| Window:     none".ljust(60) + "|",
                "| Element:    none".ljust(60) + "|",
            ])

        lines.append("+----------------------------------------------------------+")
        return "\n".join(lines)

    # === Frontend Event Handlers (update ASCII from frontend) ===

    async def on_window_create(self, window: WindowState):
        """Handle window creation from frontend."""
        self.windows[window.id] = window
        if window.focused:
            self.focused_window_id = window.id
        await self._update_fragments()
        logger.info(f"Window created: {window.id}")

    async def on_window_close(self, window_id: str):
        """Handle window close from frontend."""
        if window_id in self.windows:
            del self.windows[window_id]
            if self.focused_window_id == window_id:
                self.focused_window_id = None
            await self._update_fragments()
            logger.info(f"Window closed: {window_id}")

    async def on_window_focus(self, window_id: str):
        """Handle window focus from frontend."""
        if window_id in self.windows:
            for win in self.windows.values():
                win.focused = False
            self.windows[window_id].focused = True
            self.focused_window_id = window_id
            await self._update_fragments()

    async def on_window_move(self, window_id: str, pos: List[int]):
        """Handle window move from frontend - recompute Hilbert encoding."""
        if window_id in self.windows:
            hilbert_index, hilbert_coords = self._compute_hilbert_encoding(pos)
            self.windows[window_id].pos = pos
            self.windows[window_id].hilbert_index = hilbert_index
            self.windows[window_id].hilbert_coords = hilbert_coords
            await self._update_fragments()

    async def on_window_resize(self, window_id: str, size: List[int]):
        """Handle window resize from frontend."""
        if window_id in self.windows:
            self.windows[window_id].size = size
            await self._update_fragments()

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str] = None):
        """Handle mouse movement - update mouse.ascii fragment."""
        mouse_path = self.fragments_dir / "mouse.ascii"
        content = f"""+----------------------------------------------------------+
| MOUSE STATE                                              |
+----------------------------------------------------------+
| Position:   ({x}, {y})".ljust(41) + "|
| Buttons:    none".ljust(60) + "|
| Hovering:   {hovering or 'none'}".ljust(60) + "|
+----------------------------------------------------------+
"""
        mouse_path.write_text(content)

    async def on_key_event(self, modifiers: str, pressed: str, last_key: str):
        """Handle keyboard event - update keyboard.ascii fragment."""
        kb_path = self.fragments_dir / "keyboard.ascii"
        content = f"""+----------------------------------------------------------+
| KEYBOARD STATE                                           |
+----------------------------------------------------------+
| Modifiers:  {modifiers}".ljust(60) + "|
| Pressed:    {pressed}".ljust(60) + "|
| Last Key:   {last_key}".ljust(60) + "|
+----------------------------------------------------------+
"""
        kb_path.write_text(content)


# Convenience function for integration
def create_ascii_gui_bridge(broadcast_callback: Callable) -> ASCIIGUIBridge:
    """Create an ASCII GUI bridge with the given broadcast callback."""
    return ASCIIGUIBridge(broadcast_callback)
