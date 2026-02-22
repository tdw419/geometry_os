"""
NeuralCityAsciiRenderer - ASCII visualization of Neural City for AI perception.

Emits .ascii files representing the Neural City state including:
- Camera-follow viewport (80x24)
- District layout with load and agent counts
- Global PAS and entropy metrics

Part of ASCII Scene Graph expansion for zero-cost AI perception.
"""

import os
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import logging

from systems.visual_shell.swarm.consciousness.hooks import NeuralCityHook

logger = logging.getLogger(__name__)


@dataclass
class District:
    """Represents a district in the Neural City."""
    name: str
    pos: Tuple[float, float]
    load: float = 0.0
    agent_count: int = 0

    def to_ascii_block(self, width: int = 10, height: int = 5) -> List[str]:
        """Generate ASCII block representation of this district."""
        load_pct = int(self.load * 100)

        # Choose border style based on load
        if self.load >= 0.8:
            border_chars = ("#", "#", "#", "#", "#", "#", "#", "#")  # Heavy load
        elif self.load >= 0.5:
            border_chars = ("+", "+", "+", "+", "+", "+", "+", "+")  # Medium load
        else:
            border_chars = ("-", "-", "|", "|", "+", "+", "+", "+")  # Light load

        lines = []
        # Top border
        lines.append(border_chars[0] * (width + 2))

        # District name (truncated to fit)
        name_display = self.name[:width].ljust(width)
        lines.append(f"|{name_display}|")

        # Load percentage bar
        bar_filled = int(load_pct * width / 100)
        bar = "#" * bar_filled + "-" * (width - bar_filled)
        lines.append(f"|{bar}|")

        # Agent count
        agent_str = f"{self.agent_count} agents"
        agent_display = agent_str[:width].ljust(width)
        lines.append(f"|{agent_display}|")

        # Bottom border
        lines.append(border_chars[0] * (width + 2))

        return lines


@dataclass
class CameraState:
    """Represents camera/view position."""
    pos: Tuple[float, float] = (0.0, 0.0)
    zoom: float = 1.0


class NeuralCityAsciiRenderer(NeuralCityHook):
    """
    ASCII renderer for Neural City state.

    Implements NeuralCityHook to receive city events and emits .ascii files
    for zero-cost AI perception.

    Output files (in output_dir):
        - neural_city_map.ascii: 80x24 camera-follow viewport
        - district_focus.ascii: Active district details with metrics
        - city_health.ascii: Global PAS and entropy metrics

    Example:
        >>> renderer = NeuralCityAsciiRenderer()
        >>> renderer.on_district_update("cognitive", (100, 200), 0.75, 42)
        >>> renderer.on_camera_move((512, 256), 1.5)
        >>> renderer.on_city_health(0.87, 0.12)
        >>> # Files written to .geometry/ascii_scene/
    """

    VIEWPORT_WIDTH = 80
    VIEWPORT_HEIGHT = 24
    DISTRICT_BLOCK_WIDTH = 14
    DISTRICT_BLOCK_HEIGHT = 5

    def __init__(
        self,
        output_dir: str = ".geometry/ascii_scene",
        auto_flush: bool = True
    ):
        """
        Initialize the Neural City ASCII renderer.

        Args:
            output_dir: Directory to write .ascii files
            auto_flush: Automatically write files on each update
        """
        self.output_dir = Path(output_dir)
        self.auto_flush = auto_flush

        self.districts: Dict[str, District] = {}
        self.camera = CameraState()
        self.pas_score: float = 0.0
        self.entropy: float = 0.0
        self.active_district: Optional[str] = None
        self.last_update: Optional[datetime] = None

        # Ensure output directory exists
        self.output_dir.mkdir(parents=True, exist_ok=True)

    def _atomic_write(self, filename: str, content: str) -> None:
        """
        Atomically write content to a file.

        Uses temp file + rename to avoid partial reads.

        Args:
            filename: Target filename (without path)
            content: Content to write
        """
        target_path = self.output_dir / filename

        # Write to temp file first
        fd, temp_path = tempfile.mkstemp(
            dir=self.output_dir,
            prefix=f".{filename}.tmp"
        )

        try:
            with os.fdopen(fd, 'w') as f:
                f.write(content)

            # Atomic rename
            os.rename(temp_path, target_path)
        except Exception as e:
            # Clean up temp file on error
            try:
                os.unlink(temp_path)
            except:
                pass
            logger.error(f"Failed to write {filename}: {e}")

    def _flush_all(self) -> None:
        """Write all .ascii files."""
        self._write_city_map()
        self._write_district_focus()
        self._write_city_health()

    # --- NeuralCityHook implementation ---

    def on_district_update(
        self,
        name: str,
        pos: Tuple[float, float],
        load: float,
        agent_count: int
    ) -> None:
        """Handle district update event."""
        self.districts[name] = District(
            name=name,
            pos=pos,
            load=load,
            agent_count=agent_count
        )
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._flush_all()

    def on_camera_move(
        self,
        pos: Tuple[float, float],
        zoom: float
    ) -> None:
        """Handle camera movement event."""
        self.camera = CameraState(pos=pos, zoom=zoom)
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_city_map()

    def on_agent_relocation(
        self,
        agent_id: str,
        from_district: str,
        to_district: str
    ) -> None:
        """Handle agent relocation event."""
        # Update agent counts
        if from_district in self.districts:
            self.districts[from_district].agent_count -= 1
        if to_district in self.districts:
            self.districts[to_district].agent_count += 1
            self.active_district = to_district

        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._flush_all()

    def on_city_health(
        self,
        pas_score: float,
        entropy: float
    ) -> None:
        """Handle city health metrics event."""
        self.pas_score = pas_score
        self.entropy = entropy
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_city_health()

    # --- ASCII rendering ---

    def _write_city_map(self) -> None:
        """Render the 80x24 camera-follow viewport."""
        lines = []

        # Header
        cam_x, cam_y = self.camera.pos
        header = f" NEURAL CITY MAP ({self.VIEWPORT_WIDTH}x{self.VIEWPORT_HEIGHT})"
        header += f" Camera: ({int(cam_x)}, {int(cam_y)}) "
        header = header.ljust(self.VIEWPORT_WIDTH)
        lines.append(f"+{'-' * self.VIEWPORT_WIDTH}+")
        lines.append(f"|{header}|")
        lines.append(f"+{'-' * self.VIEWPORT_WIDTH}+")

        # Sort districts by distance from camera
        sorted_districts = sorted(
            self.districts.values(),
            key=lambda d: (d.pos[0] - cam_x) ** 2 + (d.pos[1] - cam_y) ** 2
        )

        # Render districts in grid layout
        districts_per_row = self.VIEWPORT_WIDTH // (self.DISTRICT_BLOCK_WIDTH + 2)
        max_rows = (self.VIEWPORT_HEIGHT - 4) // (self.DISTRICT_BLOCK_HEIGHT + 1)

        rows = []
        for i in range(0, len(sorted_districts), districts_per_row):
            row_districts = sorted_districts[i:i + districts_per_row]
            rows.append(row_districts)
            if len(rows) >= max_rows:
                break

        for row_districts in rows:
            # Build row line by line
            block_lines = ["" for _ in range(self.DISTRICT_BLOCK_HEIGHT + 1)]

            for district in row_districts:
                block = district.to_ascii_block(
                    width=self.DISTRICT_BLOCK_WIDTH,
                    height=self.DISTRICT_BLOCK_HEIGHT - 2
                )
                for j, line in enumerate(block):
                    if j < len(block_lines):
                        block_lines[j] += line.ljust(self.DISTRICT_BLOCK_WIDTH + 2)

            # Pad to full width
            for line in block_lines:
                line = line[:self.VIEWPORT_WIDTH].ljust(self.VIEWPORT_WIDTH)
                lines.append(f"|{line}|")

        # Fill remaining lines
        while len(lines) < self.VIEWPORT_HEIGHT - 1:
            lines.append(f"|{' ' * self.VIEWPORT_WIDTH}|")

        # Footer with timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        footer = f" Updated: {timestamp}".ljust(self.VIEWPORT_WIDTH)
        lines.append(f"+{'-' * self.VIEWPORT_WIDTH}+")
        lines.append(f"|{footer}|")
        lines.append(f"+{'-' * self.VIEWPORT_WIDTH}+")

        self._atomic_write("neural_city_map.ascii", "\n".join(lines))

    def _write_district_focus(self) -> None:
        """Render the active district details."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " DISTRICT FOCUS ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        if self.active_district and self.active_district in self.districts:
            d = self.districts[self.active_district]

            lines.append(f"| District: {d.name}".ljust(width - 1) + "|")
            lines.append("+" + "-" * (width - 2) + "+")

            # Position
            lines.append(f"| Position: ({d.pos[0]:.1f}, {d.pos[1]:.1f})".ljust(width - 1) + "|")

            # Load with progress bar
            load_pct = int(d.load * 100)
            bar_width = 40
            bar_filled = int(d.load * bar_width)
            bar = "#" * bar_filled + "-" * (bar_width - bar_filled)
            load_line = f"| Load: [{bar}] {load_pct:3d}%"
            lines.append(load_line.ljust(width - 1) + "|")

            # Agent count
            lines.append(f"| Agents: {d.agent_count}".ljust(width - 1) + "|")

            # Status indicator
            if d.load >= 0.8:
                status = "CRITICAL - High load detected"
            elif d.load >= 0.5:
                status = "MODERATE - Normal activity"
            else:
                status = "HEALTHY - Low activity"
            lines.append(f"| Status: {status}".ljust(width - 1) + "|")

        else:
            lines.append("| No active district selected".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("district_focus.ascii", "\n".join(lines))

    def _write_city_health(self) -> None:
        """Render global PAS and entropy metrics."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " CITY HEALTH MONITOR ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # PAS Score with progress bar
        pas_pct = int(self.pas_score * 100)
        bar_width = 40
        bar_filled = int(self.pas_score * bar_width)
        bar = "#" * bar_filled + "-" * (bar_width - bar_filled)

        # Determine threshold status
        threshold = 0.80
        if self.pas_score >= threshold:
            status = "HEALTHY"
            status_color = "+"  # ASCII indicator
        else:
            status = "WARNING"
            status_color = "!"

        pas_line = f"| PAS Score: [{bar}] {pas_pct:3d}% [{status}]"
        lines.append(pas_line.ljust(width - 1) + "|")
        lines.append(f"| Threshold: {threshold:.2f}".ljust(width - 1) + "|")

        # Entropy
        entropy_pct = int(self.entropy * 100)
        entropy_bar_filled = int(self.entropy * bar_width)
        entropy_bar = "#" * entropy_bar_filled + "-" * (bar_width - entropy_bar_filled)
        entropy_line = f"| Entropy:   [{entropy_bar}] {entropy_pct:3d}%"
        lines.append(entropy_line.ljust(width - 1) + "|")

        # District summary
        total_agents = sum(d.agent_count for d in self.districts.values())
        avg_load = (
            sum(d.load for d in self.districts.values()) / len(self.districts)
            if self.districts else 0.0
        )

        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Districts: {len(self.districts)}".ljust(width - 1) + "|")
        lines.append(f"| Total Agents: {total_agents}".ljust(width - 1) + "|")
        lines.append(f"| Average Load: {avg_load:.2f}".ljust(width - 1) + "|")

        # Timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Last Update: {timestamp}".ljust(width - 1) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("city_health.ascii", "\n".join(lines))

    def force_flush(self) -> None:
        """Force write all .ascii files regardless of auto_flush setting."""
        self._flush_all()
