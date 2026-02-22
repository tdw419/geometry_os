"""
EvolutionAsciiRenderer - ASCII visualization of Evolution Pipeline for AI perception.

Emits .ascii files representing the Evolution Daemon state including:
- PAS meter with threshold alert
- Pipeline stage progress (Scan -> Reason -> Patch -> Build)
- Self-correction history (last 100 entries)

Part of ASCII Scene Graph expansion for zero-cost AI perception.
Enables Ouroboros self-healing loop monitoring.
"""

import os
import tempfile
from collections import deque
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Deque, Dict, List, Optional, Tuple
import logging

from systems.evolution_daemon.hooks import EvolutionHook

logger = logging.getLogger(__name__)


@dataclass
class CorrectionEntry:
    """Represents a self-correction event in history."""
    timestamp: datetime
    trigger: str
    action: str
    result: bool

    def to_ascii_line(self, width: int = 76) -> str:
        """Generate ASCII line for this entry."""
        status = "OK" if self.result else "FAIL"
        time_str = self.timestamp.strftime("%H:%M:%S")
        line = f"| [{time_str}] {self.trigger} -> {self.action} = {status}"
        return line.ljust(width) + "|"


class EvolutionAsciiRenderer(EvolutionHook):
    """
    ASCII renderer for Evolution Pipeline state.

    Implements EvolutionHook to receive pipeline events and emits .ascii files
    for zero-cost AI perception.

    Output files (in output_dir):
        - evolution_pas.ascii: PAS meter with threshold alert
        - evolution_pipeline.ascii: Stage progress (Scan -> Reason -> Patch -> Build)
        - evolution_log.ascii: Self-correction history (last 100 entries)

    Example:
        >>> renderer = EvolutionAsciiRenderer()
        >>> renderer.on_pas_change(0.80, 0.87)
        >>> renderer.on_pipeline_stage("Scan", "completed")
        >>> renderer.on_self_correction("test_failure", "rollback", True)
        >>> # Files written to .geometry/ascii_scene/
    """

    MAX_LOG_ENTRIES = 100
    STAGES = ["Scan", "Reason", "Patch", "Build"]

    def __init__(
        self,
        output_dir: str = ".geometry/ascii_scene",
        auto_flush: bool = True,
        max_log_entries: int = MAX_LOG_ENTRIES
    ):
        """
        Initialize the Evolution ASCII renderer.

        Args:
            output_dir: Directory to write .ascii files
            auto_flush: Automatically write files on each update
            max_log_entries: Maximum number of log entries to keep
        """
        self.output_dir = Path(output_dir)
        self.auto_flush = auto_flush
        self.max_log_entries = max_log_entries

        self.pas_score: float = 0.0
        self.entropy: float = 0.0
        self.current_stage: Optional[str] = None
        self.stage_status: Dict[str, str] = {}  # stage -> status
        self.correction_log: Deque[CorrectionEntry] = deque(maxlen=max_log_entries)
        self.last_update: Optional[datetime] = None
        self.threshold: float = 0.80

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
        self._write_pas()
        self._write_pipeline()
        self._write_log()

    # --- EvolutionHook implementation ---

    def on_pas_change(
        self,
        old_score: float,
        new_score: float
    ) -> None:
        """Handle PAS score change event."""
        self.pas_score = new_score
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_pas()

    def on_pipeline_stage(
        self,
        stage: str,
        status: str
    ) -> None:
        """Handle pipeline stage transition event."""
        self.stage_status[stage] = status

        if status in ("started", "in_progress"):
            self.current_stage = stage
        elif status == "completed" and self.current_stage == stage:
            # Move to next stage
            try:
                idx = self.STAGES.index(stage)
                if idx < len(self.STAGES) - 1:
                    self.current_stage = self.STAGES[idx + 1]
                else:
                    self.current_stage = None  # Pipeline complete
            except ValueError:
                pass

        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_pipeline()

    def on_self_correction(
        self,
        trigger: str,
        action: str,
        result: bool
    ) -> None:
        """Handle self-correction event."""
        entry = CorrectionEntry(
            timestamp=datetime.utcnow(),
            trigger=trigger,
            action=action,
            result=result
        )
        self.correction_log.appendleft(entry)
        self.last_update = entry.timestamp

        if self.auto_flush:
            self._write_log()

    # --- Additional methods ---

    def set_entropy(self, entropy: float) -> None:
        """
        Set the current entropy value.

        Args:
            entropy: Current entropy level (0.0 to 1.0)
        """
        self.entropy = entropy
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_pas()

    def set_threshold(self, threshold: float) -> None:
        """
        Set the PAS threshold for alerts.

        Args:
            threshold: New threshold value (0.0 to 1.0)
        """
        self.threshold = threshold
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_pas()

    # --- ASCII rendering ---

    def _write_pas(self) -> None:
        """Render PAS meter with threshold alert."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " EVOLUTION PAS MONITOR ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # PAS Score with progress bar
        pas_pct = int(self.pas_score * 100)
        bar_width = 40
        bar_filled = int(self.pas_score * bar_width)
        bar = "#" * bar_filled + "-" * (bar_width - bar_filled)

        # Determine threshold status
        if self.pas_score >= self.threshold:
            status = "HEALTHY"
            status_icon = "+"
        elif self.pas_score >= self.threshold * 0.9:
            status = "WARNING"
            status_icon = "!"
        else:
            status = "CRITICAL"
            status_icon = "X"

        pas_line = f"| PAS Score: {self.pas_score:.2f}  [{bar}] {pas_pct:3d}%"
        lines.append(pas_line.ljust(width - 1) + "|")

        # Status line
        status_line = f"| Status: {status} (threshold: {self.threshold:.2f})"
        lines.append(status_line.ljust(width - 1) + "|")

        # Entropy
        entropy_pct = int(self.entropy * 100)
        entropy_bar_filled = int(self.entropy * bar_width)
        entropy_bar = "#" * entropy_bar_filled + "-" * (bar_width - entropy_bar_filled)
        entropy_line = f"| Entropy: {self.entropy:.2f}   [{entropy_bar}] {entropy_pct:3d}%"
        lines.append(entropy_line.ljust(width - 1) + "|")

        # Health indicator
        if self.pas_score >= 0.9:
            health = "EXCELLENT - System operating optimally"
        elif self.pas_score >= 0.8:
            health = "GOOD - Normal operation"
        elif self.pas_score >= 0.6:
            health = "MODERATE - Some degradation detected"
        elif self.pas_score >= 0.4:
            health = "WARNING - System stress detected"
        else:
            health = "CRITICAL - Immediate attention required"

        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Health: {health}".ljust(width - 1) + "|")

        # Timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Last Update: {timestamp}".ljust(width - 1) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("evolution_pas.ascii", "\n".join(lines))

    def _write_pipeline(self) -> None:
        """Render pipeline stage progress."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " EVOLUTION PIPELINE ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # Pipeline stages
        stage_width = 16
        stages_line = "| "
        arrows_line = "| "

        for i, stage in enumerate(self.STAGES):
            status = self.stage_status.get(stage, "pending")
            is_current = (self.current_stage == stage)

            # Status indicator
            if status == "completed":
                icon = "[OK]"
            elif status == "failed":
                icon = "[X]"
            elif status == "in_progress":
                icon = "[..]"
            elif status == "started":
                icon = "[>]"
            else:
                icon = "[  ]"

            # Format stage with current indicator
            if is_current:
                stage_str = f">{stage}<"
            else:
                stage_str = stage

            stage_display = f"{stage_str[:stage_width-4]:^{stage_width-4}} {icon}"
            stages_line += stage_display

            # Arrow between stages
            if i < len(self.STAGES) - 1:
                arrows_line += " " * ((stage_width - 4) // 2) + "--->" + " " * ((stage_width - 4) // 2)
            else:
                arrows_line += " " * (stage_width - 4)

        lines.append(stages_line.ljust(width - 1) + "|")
        lines.append(arrows_line.ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Current stage details
        if self.current_stage:
            status = self.stage_status.get(self.current_stage, "unknown")
            lines.append(f"| Current Stage: {self.current_stage}".ljust(width - 1) + "|")
            lines.append(f"| Status: {status}".ljust(width - 1) + "|")
        else:
            # Check if all stages completed
            all_completed = all(
                self.stage_status.get(s) == "completed"
                for s in self.STAGES
            )
            if all_completed:
                lines.append("| Pipeline: COMPLETE".ljust(width - 1) + "|")
            else:
                lines.append("| Pipeline: IDLE".ljust(width - 1) + "|")

        # Stage summary
        completed = sum(1 for s in self.STAGES if self.stage_status.get(s) == "completed")
        failed = sum(1 for s in self.STAGES if self.stage_status.get(s) == "failed")
        lines.append(f"| Progress: {completed}/{len(self.STAGES)} stages completed".ljust(width - 1) + "|")
        if failed > 0:
            lines.append(f"| Failures: {failed} stage(s) failed".ljust(width - 1) + "|")

        # Timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Last Update: {timestamp}".ljust(width - 1) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("evolution_pipeline.ascii", "\n".join(lines))

    def _write_log(self) -> None:
        """Render self-correction history."""
        lines = []
        width = 80
        content_width = width - 2

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " EVOLUTION SELF-CORRECTION LOG ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # Statistics
        total = len(self.correction_log)
        successes = sum(1 for e in self.correction_log if e.result)
        failures = total - successes
        success_rate = (successes / total * 100) if total > 0 else 0.0

        lines.append(f"| Total Corrections: {total} (last {self.max_log_entries})".ljust(width - 1) + "|")
        lines.append(f"| Success Rate: {success_rate:.1f}% ({successes}/{total})".ljust(width - 1) + "|")

        if failures > 0:
            lines.append(f"| Failures: {failures}".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Log entries (most recent first)
        if not self.correction_log:
            lines.append("| No corrections recorded".ljust(width - 1) + "|")
        else:
            # Limit display to fit in reasonable space
            max_display = min(len(self.correction_log), 20)
            for entry in list(self.correction_log)[:max_display]:
                lines.append(entry.to_ascii_line(content_width))

            if len(self.correction_log) > max_display:
                remaining = len(self.correction_log) - max_display
                lines.append(f"| ... ({remaining} more entries)".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        lines.append(f"| Last Update: {timestamp}".ljust(width - 1) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("evolution_log.ascii", "\n".join(lines))

    def force_flush(self) -> None:
        """Force write all .ascii files regardless of auto_flush setting."""
        self._flush_all()

    def clear_log(self) -> None:
        """Clear the correction log."""
        self.correction_log.clear()
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_log()
