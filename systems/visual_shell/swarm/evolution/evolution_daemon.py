#!/usr/bin/env python3
"""
evolution_daemon.py - Continuous Evolution Daemon for Recursive Self-Improvement.

A persistent daemon that runs the RecursiveOrchestrator continuously,
allowing the swarm to autonomously improve its own code 24/7.

Features:
    - Continuous loop with configurable interval
    - Graceful shutdown handling (SIGTERM/SIGINT)
    - State persistence for recovery
    - Rate limiting (max improvements per hour)
    - Cooldown period between improvements
    - Health monitoring via heartbeat file
    - Structured JSON logging with rotation
    - Safe mode (--dry-run) without applying changes

Usage:
    python evolution_daemon.py                           # Start with defaults
    python evolution_daemon.py --dry-run                 # Preview only
    python evolution_daemon.py --interval 600            # Custom interval
    python evolution_daemon.py --max-per-hour 5          # Rate limiting
"""

from __future__ import annotations

import argparse
import json
import logging
import os
import signal
import sys
import threading
import time
from dataclasses import dataclass, field, asdict
from datetime import datetime, timedelta
from logging.handlers import RotatingFileHandler
from pathlib import Path
from typing import Any, Dict, List, Optional

# Add parent directories to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent))

from systems.visual_shell.swarm.evolution import (
    RecursiveOrchestrator,
    EvolutionPhase,
    EvolutionState,
    EvolutionResult,
    EvolutionTracker,
    EvolutionEvent,
    EventType,
    ValueEvaluator,
    ValueScore,
    AxionCore,
    AxionTarget,
)


@dataclass
class DaemonConfig:
    """Configuration for the evolution daemon."""

    interval: int = 300  # Seconds between evolution cycles
    max_per_hour: int = 10  # Maximum improvements per hour
    cooldown: int = 300  # Cooldown seconds between improvements
    dry_run: bool = False  # Preview only, don't apply changes
    target_dir: str = ""  # Directory to analyze (default: swarm/)
    target_file: Optional[str] = None  # Specific file to evolve
    state_file: str = "evolution_state.json"  # Path to state file
    heartbeat_file: str = "evolution_heartbeat.json"  # Path to heartbeat file
    log_dir: str = "logs/evolution/"  # Directory for logs
    heartbeat_interval: int = 30  # Seconds between heartbeat updates
    max_iterations: int = 3  # Max iterations per evolution cycle


@dataclass
class DaemonState:
    """
    Persistent state for daemon recovery.

    Attributes:
        started_at: ISO timestamp when daemon started
        total_cycles: Total evolution cycles completed
        total_improvements: Total successful improvements
        total_rejections: Total rejected proposals
        total_rollbacks: Total rollbacks
        last_cycle_at: ISO timestamp of last cycle
        last_improvement_at: ISO timestamp of last successful improvement
        current_target: Currently targeted file (if any)
        recent_improvements: List of recent improvement timestamps (for rate limiting)
        recent_rejections: List of recent rejection timestamps
        errors: List of recent errors
    """

    started_at: str = ""
    total_cycles: int = 0
    total_improvements: int = 0
    total_rejections: int = 0
    total_rollbacks: int = 0
    last_cycle_at: str = ""
    last_improvement_at: str = ""
    current_target: str = ""
    recent_improvements: List[str] = field(default_factory=list)
    recent_rejections: List[str] = field(default_factory=list)
    errors: List[Dict[str, Any]] = field(default_factory=list)


class JSONFormatter(logging.Formatter):
    """Custom JSON formatter for structured logging."""

    def format(self, record: logging.LogRecord) -> str:
        """Format log record as JSON."""
        log_data = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "level": record.levelname,
            "logger": record.name,
            "message": record.getMessage(),
        }

        # Add extra fields if present
        if hasattr(record, "daemon_state"):
            log_data["daemon_state"] = record.daemon_state
        if hasattr(record, "evolution_result"):
            log_data["evolution_result"] = record.evolution_result
        if hasattr(record, "target_file"):
            log_data["target_file"] = record.target_file
        if hasattr(record, "duration_ms"):
            log_data["duration_ms"] = record.duration_ms
        if hasattr(record, "error"):
            log_data["error"] = record.error

        # Add exception info if present
        if record.exc_info:
            log_data["exception"] = self.formatException(record.exc_info)

        return json.dumps(log_data)


class EvolutionDaemon:
    """
    Continuous Evolution Daemon for recursive self-improvement.

    This daemon runs the RecursiveOrchestrator in a continuous loop,
    allowing the swarm to autonomously improve its own codebase.

    Example:
        >>> config = DaemonConfig(interval=300, max_per_hour=10)
        >>> daemon = EvolutionDaemon(config)
        >>> daemon.run()  # Blocks until shutdown
    """

    def __init__(self, config: DaemonConfig):
        """
        Initialize the EvolutionDaemon.

        Args:
            config: Daemon configuration
        """
        self.config = config
        self.state = DaemonState()
        self.running = False
        self._shutdown_requested = False
        self._shutdown_lock = threading.Lock()

        # Core components
        self.orchestrator = RecursiveOrchestrator()
        self.tracker = EvolutionTracker()
        self.evaluator = ValueEvaluator()
        self.axion_core = AxionCore(
            protected_files=[
                str(Path(__file__).absolute()),  # This daemon file
                str(Path(__file__).parent / "recursive_orchestrator.py"),
            ]
        )

        # Set up paths
        self._setup_paths()

        # Set up logging
        self._setup_logging()

        # Set up signal handlers
        self._setup_signal_handlers()

        # Load previous state if exists
        self._load_state()

    def _setup_paths(self) -> None:
        """Set up and validate file paths."""
        # Target directory
        if self.config.target_dir:
            self.target_dir = Path(self.config.target_dir)
        else:
            # Default to swarm directory
            self.target_dir = Path(__file__).parent.parent

        # Ensure target directory exists
        if not self.target_dir.exists():
            raise ValueError(f"Target directory does not exist: {self.target_dir}")

        # Resolve state file path
        if os.path.isabs(self.config.state_file):
            self.state_file = Path(self.config.state_file)
        else:
            self.state_file = Path(__file__).parent / self.config.state_file

        # Resolve heartbeat file path
        if os.path.isabs(self.config.heartbeat_file):
            self.heartbeat_file = Path(self.config.heartbeat_file)
        else:
            self.heartbeat_file = Path(__file__).parent / self.config.heartbeat_file

        # Resolve log directory
        if os.path.isabs(self.config.log_dir):
            self.log_dir = Path(self.config.log_dir)
        else:
            self.log_dir = Path(__file__).parent / self.config.log_dir

        # Create log directory if needed
        self.log_dir.mkdir(parents=True, exist_ok=True)

    def _setup_logging(self) -> None:
        """Set up structured JSON logging with rotation."""
        self.logger = logging.getLogger("evolution_daemon")
        self.logger.setLevel(logging.INFO)

        # Clear existing handlers
        self.logger.handlers.clear()

        # File handler with rotation
        log_file = self.log_dir / "evolution_daemon.log"
        file_handler = RotatingFileHandler(
            log_file,
            maxBytes=10 * 1024 * 1024,  # 10 MB
            backupCount=5,
        )
        file_handler.setFormatter(JSONFormatter())
        self.logger.addHandler(file_handler)

        # Console handler for important messages
        console_handler = logging.StreamHandler(sys.stdout)
        console_handler.setLevel(logging.INFO)
        console_format = logging.Formatter(
            "%(asctime)s - [EVOLUTION_DAEMON] - %(levelname)s - %(message)s"
        )
        console_handler.setFormatter(console_format)
        self.logger.addHandler(console_handler)

    def _setup_signal_handlers(self) -> None:
        """Set up graceful shutdown signal handlers."""
        signal.signal(signal.SIGTERM, self._handle_shutdown_signal)
        signal.signal(signal.SIGINT, self._handle_shutdown_signal)

    def _handle_shutdown_signal(self, signum: int, frame) -> None:
        """Handle shutdown signals (SIGTERM, SIGINT)."""
        signal_name = signal.Signals(signum).name
        self.logger.info(
            f"Received {signal_name}, initiating graceful shutdown",
            extra={"signal": signal_name},
        )
        with self._shutdown_lock:
            self._shutdown_requested = True

    def _should_shutdown(self) -> bool:
        """Check if shutdown has been requested."""
        with self._shutdown_lock:
            return self._shutdown_requested

    def _load_state(self) -> None:
        """Load previous state from disk if it exists."""
        if self.state_file.exists():
            try:
                with open(self.state_file, "r") as f:
                    data = json.load(f)
                self.state = DaemonState(**data)
                self.logger.info(
                    "Loaded previous state",
                    extra={"daemon_state": asdict(self.state)},
                )
            except Exception as e:
                self.logger.warning(
                    f"Could not load state file: {e}, starting fresh"
                )
                self.state = DaemonState()

    def _save_state(self) -> None:
        """Save current state to disk."""
        try:
            with open(self.state_file, "w") as f:
                json.dump(asdict(self.state), f, indent=2)
        except Exception as e:
            self.logger.error(f"Could not save state file: {e}")

    def _write_heartbeat(self) -> None:
        """Write heartbeat file for external monitoring."""
        heartbeat_data = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "running": self.running,
            "pid": os.getpid(),
            "uptime_seconds": self._calculate_uptime(),
            "state": {
                "total_cycles": self.state.total_cycles,
                "total_improvements": self.state.total_improvements,
                "total_rejections": self.state.total_rejections,
                "current_target": self.state.current_target,
            },
            "orchestrator": {
                "phase": self.orchestrator.phase.name,
                "state": self.orchestrator.state.name,
            },
            "config": asdict(self.config),
        }

        try:
            with open(self.heartbeat_file, "w") as f:
                json.dump(heartbeat_data, f, indent=2)
        except Exception as e:
            self.logger.error(f"Could not write heartbeat file: {e}")

    def _calculate_uptime(self) -> float:
        """Calculate daemon uptime in seconds."""
        if not self.state.started_at:
            return 0.0
        try:
            start = datetime.fromisoformat(self.state.started_at.replace("Z", "+00:00"))
            now = datetime.utcnow().replace(tzinfo=None)
            # Handle timezone awareness
            start_naive = start.replace(tzinfo=None)
            return (now - start_naive).total_seconds()
        except Exception:
            return 0.0

    def _check_rate_limit(self) -> bool:
        """
        Check if we're within rate limits.

        Returns:
            True if we can proceed, False if rate limited
        """
        now = datetime.utcnow()
        one_hour_ago = now - timedelta(hours=1)

        # Filter recent improvements to last hour
        self.state.recent_improvements = [
            ts
            for ts in self.state.recent_improvements
            if datetime.fromisoformat(ts.replace("Z", "")) > one_hour_ago
        ]

        # Check if under limit
        return len(self.state.recent_improvements) < self.config.max_per_hour

    def _record_improvement(self) -> None:
        """Record a successful improvement for rate limiting."""
        self.state.recent_improvements.append(datetime.utcnow().isoformat() + "Z")
        self.state.total_improvements += 1
        self.state.last_improvement_at = datetime.utcnow().isoformat() + "Z"

    def _record_rejection(self) -> None:
        """Record a rejection for tracking."""
        self.state.recent_rejections.append(datetime.utcnow().isoformat() + "Z")
        self.state.total_rejections += 1

    def _record_error(self, error: str, context: Optional[Dict] = None) -> None:
        """Record an error for tracking."""
        error_entry = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "error": error,
            "context": context or {},
        }
        self.state.errors.append(error_entry)
        # Keep only last 100 errors
        self.state.errors = self.state.errors[-100:]

    def _scan_targets(self) -> List[Path]:
        """Scan target directory for Python files to analyze."""
        files = []
        for py_file in self.target_dir.rglob("*.py"):
            # Skip __pycache__ and test files
            if "__pycache__" in str(py_file):
                continue
            if "test_" in py_file.name:
                continue
            files.append(py_file)
        return files

    def _compute_value_score(self, file_path: Path) -> ValueScore:
        """Compute value score for a file."""
        # Basic metrics
        stat = file_path.stat()
        mod_time = stat.st_mtime
        now = datetime.now().timestamp()
        days_old = (now - mod_time) / (60 * 60 * 24)

        # Estimate metrics
        staleness = min(1.0, days_old / 30)
        complexity = 0.5  # Default
        coverage = 0.3  # Default estimate

        # Count dependents (simplified)
        dependent_count = 0
        file_module = str(file_path).replace("/", ".").replace(".py", "")

        for other_file in self._scan_targets():
            if other_file == file_path:
                continue
            try:
                with open(other_file, "r") as f:
                    content = f.read()
                if file_module.split(".")[-1] in content:
                    dependent_count += 1
            except Exception:
                pass

        # Access count estimation based on file role
        access_count = 10
        if "core" in str(file_path).lower():
            access_count = 100
        elif "coordinator" in str(file_path).lower():
            access_count = 80
        elif "agent" in str(file_path).lower():
            access_count = 50

        return self.evaluator.evaluate(
            file_path=str(file_path),
            access_count=access_count,
            dependent_count=dependent_count,
            coverage=coverage,
            complexity=complexity,
            staleness=staleness,
        )

    def _select_target(self) -> Optional[AxionTarget]:
        """Select the highest-value target for improvement."""
        self.axion_core.clear()

        files = self._scan_targets()
        self.logger.info(f"Scanned {len(files)} files for targets")

        for file_path in files:
            score = self._compute_value_score(file_path)
            self.axion_core.add_candidate(
                file_path=str(file_path),
                value_score=score.composite_score,
                reason=f"composite={score.composite_score:.3f}",
                value_breakdown={
                    "access": score.access_score,
                    "criticality": score.criticality_score,
                    "improvement": score.improvement_score,
                    "complexity": score.complexity_score,
                    "staleness": score.staleness_score,
                },
            )

        return self.axion_core.select_target()

    def _run_evolution_cycle(self, target: AxionTarget) -> EvolutionResult:
        """Run a single evolution cycle for the target."""
        self.state.current_target = target.file_path
        self._save_state()

        start_time = time.time()

        if self.config.dry_run:
            # Dry run mode - simulate success
            self.logger.info(
                f"DRY RUN: Would evolve {target.file_path}",
                extra={"target_file": target.file_path},
            )
            result = EvolutionResult(
                success=True,
                target_file=target.file_path,
                improvement_delta=0.0,
                tests_passed=5,
                tests_failed=0,
                consensus_achieved=True,
                iterations=1,
                metadata={"dry_run": True},
            )
        else:
            # Run actual evolution
            result = self.orchestrator.run_evolution_cycle(
                target_file=target.file_path,
                max_iterations=self.config.max_iterations,
            )

        duration_ms = int((time.time() - start_time) * 1000)
        self.logger.info(
            f"Evolution cycle completed: success={result.success}",
            extra={
                "evolution_result": {
                    "success": result.success,
                    "target_file": result.target_file,
                    "improvement_delta": result.improvement_delta,
                    "tests_passed": result.tests_passed,
                    "tests_failed": result.tests_failed,
                    "consensus_achieved": result.consensus_achieved,
                    "iterations": result.iterations,
                },
                "duration_ms": duration_ms,
            },
        )

        # Update state
        self.state.current_target = ""
        self.state.total_cycles += 1
        self.state.last_cycle_at = datetime.utcnow().isoformat() + "Z"

        if result.success:
            self._record_improvement()

            # Log to tracker
            event = EvolutionEvent(
                type=EventType.SUCCESS,
                target_file=result.target_file,
                timestamp=datetime.now(),
                value_score_before=target.value_score,
                value_score_after=target.value_score + result.improvement_delta,
                reason="Evolution cycle completed",
                metadata={
                    "iterations": result.iterations,
                    "tests_passed": result.tests_passed,
                    "consensus": result.consensus_achieved,
                },
            )
            self.tracker.log_event(event)
        else:
            self._record_rejection()

            # Log to tracker
            event = EvolutionEvent(
                type=EventType.REJECTION,
                target_file=result.target_file,
                timestamp=datetime.now(),
                value_score_before=target.value_score,
                value_score_after=None,
                reason=result.error_message or "Evolution cycle failed",
                metadata={
                    "iterations": result.iterations,
                    "tests_failed": result.tests_failed,
                },
            )
            self.tracker.log_event(event)

            if result.error_message:
                self._record_error(result.error_message, {"target": result.target_file})

        self._save_state()
        return result

    def _heartbeat_loop(self) -> None:
        """Background thread for writing heartbeats."""
        while self.running and not self._should_shutdown():
            self._write_heartbeat()
            time.sleep(self.config.heartbeat_interval)

    def run(self) -> None:
        """
        Run the evolution daemon main loop.

        This method blocks until shutdown is requested.
        """
        # Initialize state
        if not self.state.started_at:
            self.state.started_at = datetime.utcnow().isoformat() + "Z"

        self.running = True
        self._save_state()

        self.logger.info(
            "Evolution daemon starting",
            extra={"config": asdict(self.config)},
        )

        # Start heartbeat thread
        heartbeat_thread = threading.Thread(
            target=self._heartbeat_loop,
            daemon=True,
            name="heartbeat",
        )
        heartbeat_thread.start()

        # Initial heartbeat
        self._write_heartbeat()

        try:
            while not self._should_shutdown():
                # Check rate limit
                if not self._check_rate_limit():
                    self.logger.info(
                        f"Rate limit reached ({self.config.max_per_hour}/hour), "
                        f"waiting for cooldown"
                    )
                    time.sleep(self.config.cooldown)
                    continue

                # Select target
                if self.config.target_file:
                    target_path = Path(self.config.target_file)
                    if target_path.exists():
                        # Compute a score for the manual target
                        score = self._compute_value_score(target_path)
                        target = AxionTarget(
                            file_path=str(target_path),
                            value_score=score.composite_score,
                            metadata={"reason": "Manual target override"},
                        )
                    else:
                        self.logger.error(f"Manual target file not found: {self.config.target_file}")
                        target = self._select_target()
                else:
                    target = self._select_target()

                if target:
                    self.logger.info(
                        f"Selected target: {target.file_path} "
                        f"(score: {target.value_score:.3f})"
                    )

                    # Run evolution cycle
                    result = self._run_evolution_cycle(target)

                    # Log result
                    if result.success:
                        self.logger.info(
                            f"Improvement applied: {result.target_file} "
                            f"(delta: {result.improvement_delta:+.4f})"
                        )
                    else:
                        self.logger.warning(
                            f"Improvement rejected: {result.target_file} - "
                            f"{result.error_message}"
                        )
                else:
                    self.logger.info("No suitable target found")

                # Cooldown before next cycle
                self.logger.info(
                    f"Sleeping for {self.config.interval}s until next cycle"
                )

                # Sleep in small increments to check for shutdown
                sleep_remaining = self.config.interval
                while sleep_remaining > 0 and not self._should_shutdown():
                    sleep_time = min(sleep_remaining, 1.0)
                    time.sleep(sleep_time)
                    sleep_remaining -= sleep_time

        except Exception as e:
            self.logger.exception(f"Fatal error in daemon loop: {e}")
            self._record_error(str(e), {"fatal": True})
            raise

        finally:
            self.running = False
            self._save_state()
            self._write_heartbeat()
            self.logger.info("Evolution daemon stopped")

    def generate_status_report(self) -> Dict[str, Any]:
        """Generate a comprehensive status report."""
        uptime = self._calculate_uptime()
        tracker_report = self.tracker.generate_report()

        return {
            "daemon": {
                "running": self.running,
                "uptime_seconds": uptime,
                "uptime_human": self._format_uptime(uptime),
                "pid": os.getpid(),
                "dry_run": self.config.dry_run,
            },
            "state": {
                "total_cycles": self.state.total_cycles,
                "total_improvements": self.state.total_improvements,
                "total_rejections": self.state.total_rejections,
                "total_rollbacks": self.state.total_rollbacks,
                "last_cycle": self.state.last_cycle_at,
                "last_improvement": self.state.last_improvement_at,
                "current_target": self.state.current_target,
                "recent_improvements_count": len(self.state.recent_improvements),
                "recent_errors_count": len(self.state.errors),
            },
            "orchestrator": {
                "phase": self.orchestrator.phase.name,
                "state": self.orchestrator.state.name,
                "iterations": self.orchestrator.iteration_count,
            },
            "tracker": tracker_report,
            "config": asdict(self.config),
            "rate_limit": {
                "max_per_hour": self.config.max_per_hour,
                "used_this_hour": len(self.state.recent_improvements),
                "remaining": max(
                    0, self.config.max_per_hour - len(self.state.recent_improvements)
                ),
            },
        }

    def _format_uptime(self, seconds: float) -> str:
        """Format uptime in human-readable form."""
        if seconds < 60:
            return f"{int(seconds)}s"
        elif seconds < 3600:
            minutes = int(seconds / 60)
            secs = int(seconds % 60)
            return f"{minutes}m {secs}s"
        elif seconds < 86400:
            hours = int(seconds / 3600)
            minutes = int((seconds % 3600) / 60)
            return f"{hours}h {minutes}m"
        else:
            days = int(seconds / 86400)
            hours = int((seconds % 86400) / 3600)
            return f"{days}d {hours}h"


def main():
    """Main entry point for the evolution daemon."""
    parser = argparse.ArgumentParser(
        description="Continuous Evolution Daemon for recursive self-improvement",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    %(prog)s                              # Start with defaults
    %(prog)s --dry-run                    # Preview only, no changes
    %(prog)s --interval 600               # 10-minute cycles
    %(prog)s --max-per-hour 5             # Limit to 5 improvements/hour
    %(prog)s --target-dir ./src           # Analyze specific directory

Control via evolution_ctl.sh:
    ./evolution_ctl.sh start              # Start daemon
    ./evolution_ctl.sh stop               # Stop daemon
    ./evolution_ctl.sh status             # Check status
    ./evolution_ctl.sh tail               # Follow logs
    ./evolution_ctl.sh report             # Generate report
        """,
    )

    parser.add_argument(
        "--interval",
        type=int,
        default=300,
        help="Seconds between evolution cycles (default: 300)",
    )
    parser.add_argument(
        "--max-per-hour",
        type=int,
        default=10,
        help="Maximum improvements per hour (default: 10)",
    )
    parser.add_argument(
        "--cooldown",
        type=int,
        default=300,
        help="Cooldown seconds between improvements (default: 300)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview only, don't apply changes",
    )
    parser.add_argument(
        "--target-dir",
        type=str,
        default="",
        help="Directory to analyze (default: systems/visual_shell/swarm/)",
    )
    parser.add_argument(
        "--target-file",
        type=str,
        help="Specific file to evolve",
    )
    parser.add_argument(
        "--state-file",
        type=str,
        default="evolution_state.json",
        help="Path to state file (default: evolution_state.json)",
    )
    parser.add_argument(
        "--heartbeat",
        type=str,
        default="evolution_heartbeat.json",
        help="Path to heartbeat file (default: evolution_heartbeat.json)",
    )
    parser.add_argument(
        "--log-dir",
        type=str,
        default="logs/evolution/",
        help="Directory for logs (default: logs/evolution/)",
    )
    parser.add_argument(
        "--max-iterations",
        type=int,
        default=3,
        help="Max iterations per evolution cycle (default: 3)",
    )
    parser.add_argument(
        "--report",
        action="store_true",
        help="Generate status report and exit",
    )

    args = parser.parse_args()

    # Build config
    config = DaemonConfig(
        interval=args.interval,
        max_per_hour=args.max_per_hour,
        cooldown=args.cooldown,
        dry_run=args.dry_run,
        target_dir=args.target_dir,
        target_file=args.target_file,
        state_file=args.state_file,
        heartbeat_file=args.heartbeat,
        log_dir=args.log_dir,
        max_iterations=args.max_iterations,
    )

    try:
        daemon = EvolutionDaemon(config)

        if args.report:
            # Just print report and exit
            report = daemon.generate_status_report()
            print(json.dumps(report, indent=2))
            return

        # Run daemon
        daemon.run()

    except KeyboardInterrupt:
        print("\nShutdown requested via keyboard")
        sys.exit(0)
    except Exception as e:
        print(f"Fatal error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
