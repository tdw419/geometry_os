"""
Sisyphus v4 Daemon - Python-based evolution system with FFI integration.
Replaces shell scripts with native Python daemon that:
1. Uses FFI-accelerated Hilbert mapping for glyph operations
2. Monitors performance and offloads bottlenecks
3. Integrates with visual-vm via shared memory
4. Checkpoint/restore for crash recovery
5. Heartbeat monitoring for compositor socket connection
"""

import sys
from pathlib import Path

# Project root setup (this file is at systems/sisyphus/daemon.py)
PROJECT_ROOT = Path(__file__).parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

import hashlib
import json
import logging
import re
import subprocess
import threading
import time
from dataclasses import dataclass
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Any

from systems.infinite_map.gravity_engine import GravityEngine
from systems.infinite_map.tectonic_updater import TectonicUpdater
from systems.sisyphus.compositor_bridge import CompositorBridge
from systems.sisyphus.entropy_mapper import EntropyMapper
from systems.sisyphus.goal_synthesizer import GoalSynthesizer
from systems.sisyphus.hot_swap_manager import HotSwapManager
from systems.sisyphus.kernel_rewriter import KernelRewriter
from systems.sisyphus.native_hilbert import NativeHilbertLUT
from systems.sisyphus.performance_monitor import PerformanceMonitor
from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer
from systems.sisyphus.token_rasterizer import TokenRasterizer
from systems.sisyphus.unified_glass_bridge import UnifiedGlassBridge

# Brain Evolution Integration
try:
    from systems.cognitive.cognitive_router import get_cognitive_router
    from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
    from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook
    from systems.sisyphus.critic import SisyphusCritic
    BRAIN_EVOLUTION_AVAILABLE = True
except ImportError:
    BRAIN_EVOLUTION_AVAILABLE = False

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] [%(levelname)s] [%(name)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger("SisyphusV4")


class CheckpointManager:
    """
    Manages daemon state checkpointing for crash recovery.

    Features:
    - Saves checkpoint to JSON file with checksum validation
    - Logs checkpoint events to evolution.log
    - Validates integrity on restore
    """

    def __init__(self, checkpoint_path: str = ".loop/checkpoint.json",
                 log_path: str = ".loop/evolution.log"):
        self.checkpoint_path = Path(checkpoint_path)
        self.log_path = Path(log_path)

    def _compute_checksum(self, data: dict[str, Any]) -> str:
        """Compute SHA256 checksum of checkpoint data (excluding checksum field)."""
        # Create a copy without the checksum field for hashing
        hash_data = {k: v for k, v in data.items() if k != "checksum"}
        content = json.dumps(hash_data, sort_keys=True)
        return hashlib.sha256(content.encode()).hexdigest()[:16]

    def _log_event(self, message: str):
        """Log checkpoint event to evolution.log."""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [CHECKPOINT] {message}\n"

        # Ensure directory exists
        self.log_path.parent.mkdir(parents=True, exist_ok=True)

        with open(self.log_path, 'a') as f:
            f.write(log_entry)

    def save_checkpoint(self, state: dict[str, Any]) -> bool:
        """
        Save daemon state to checkpoint file.

        Args:
            state: Dictionary with task_id, task_name, and any other state

        Returns:
            True if saved successfully
        """
        # Add timestamp if not present
        if "timestamp" not in state:
            state["timestamp"] = datetime.now().isoformat()

        # Add checksum
        state["checksum"] = self._compute_checksum(state)

        # Ensure directory exists
        self.checkpoint_path.parent.mkdir(parents=True, exist_ok=True)

        try:
            with open(self.checkpoint_path, 'w') as f:
                json.dump(state, f, indent=2)

            self._log_event(f"Checkpoint saved: task_id={state.get('task_id')}, "
                          f"checksum={state['checksum']}")
            return True
        except Exception as e:
            self._log_event(f"ERROR: Failed to save checkpoint: {e}")
            return False

    def load_checkpoint(self) -> dict[str, Any] | None:
        """
        Load and validate checkpoint.

        Returns:
            Checkpoint data if valid, None if missing or invalid
        """
        if not self.checkpoint_path.exists():
            return None

        try:
            with open(self.checkpoint_path) as f:
                data = json.load(f)

            # Validate checksum
            if "checksum" not in data:
                self._log_event("WARNING: Checkpoint missing checksum, discarding")
                self.checkpoint_path.unlink()
                return None

            expected_checksum = self._compute_checksum(data)
            if data["checksum"] != expected_checksum:
                self._log_event(f"ERROR: Checksum mismatch (expected {expected_checksum}, "
                              f"got {data['checksum']}), discarding")
                self.checkpoint_path.unlink()
                return None

            self._log_event(f"Checkpoint restored: task_id={data.get('task_id')}, "
                          f"timestamp={data.get('timestamp')}")
            return data

        except json.JSONDecodeError as e:
            self._log_event(f"ERROR: Invalid checkpoint JSON: {e}, discarding")
            self.checkpoint_path.unlink()
            return None
        except Exception as e:
            self._log_event(f"ERROR: Failed to load checkpoint: {e}")
            return None

    def clear_checkpoint(self):
        """Remove checkpoint file if it exists."""
        if self.checkpoint_path.exists():
            self.checkpoint_path.unlink()
            self._log_event("Checkpoint cleared")

    def checkpoint_exists(self) -> bool:
        """Check if a valid checkpoint exists."""
        return self.checkpoint_path.exists()


class GitCommitHook:
    """
    Handles automatic git commits of daemon session state.

    Features:
    - Commits .loop/ directory changes after task completion
    - Handles "nothing to commit" gracefully
    - Detects and handles merge conflicts
    - Logs commit SHA to evolution.log
    """

    def __init__(self, repo_path: str = ".", log_path: str = ".loop/evolution.log"):
        self.repo_path = Path(repo_path)
        self.log_path = Path(log_path)

    def _log_event(self, message: str, level: str = "INFO"):
        """Log commit event to evolution.log."""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [GIT_COMMIT] [{level}] {message}\n"

        # Ensure directory exists
        self.log_path.parent.mkdir(parents=True, exist_ok=True)

        with open(self.log_path, 'a') as f:
            f.write(log_entry)

    def detect_merge_conflicts(self) -> list[str]:
        """
        Detect merge conflict state in the repository.

        Returns:
            List of conflicted file paths (empty if no conflicts)
        """
        try:
            result = subprocess.run(
                ["git", "status", "--porcelain"],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                check=True
            )

            # UU = unmerged, both modified (conflict)
            # AA = unmerged, both added
            # DD = unmerged, both deleted
            conflicted = []
            for line in result.stdout.strip().split("\n"):
                if line and line[:2] in ("UU", "AA", "DD"):
                    # Extract file path (after the status codes)
                    file_path = line[3:].strip()
                    conflicted.append(file_path)

            return conflicted

        except subprocess.CalledProcessError as e:
            self._log_event(f"Failed to check merge status: {e}", level="ERROR")
            return []

    def force_resolve_conflicts(self, paths: list[str] = None) -> dict[str, Any]:
        """
        Auto-resolve merge conflicts using --ours strategy.

        Args:
            paths: Specific paths to resolve (defaults to .loop/)

        Returns:
            Dict with success and resolved_paths fields
        """
        if paths is None:
            paths = [".loop/"]

        resolved = []
        failed = []

        for path in paths:
            try:
                result = subprocess.run(
                    ["git", "checkout", "--ours", path],
                    cwd=self.repo_path,
                    capture_output=True,
                    text=True
                )

                if result.returncode == 0:
                    resolved.append(path)
                    self._log_event(f"Force-resolved conflict in {path} using --ours")
                else:
                    failed.append(path)
                    self._log_event(f"Failed to resolve {path}: {result.stderr}", level="ERROR")

            except Exception as e:
                failed.append(path)
                self._log_event(f"Exception resolving {path}: {e}", level="ERROR")

        # Stage resolved files
        if resolved:
            try:
                subprocess.run(
                    ["git", "add"] + resolved,
                    cwd=self.repo_path,
                    check=True,
                    capture_output=True
                )
            except subprocess.CalledProcessError as e:
                self._log_event(f"Failed to stage resolved files: {e}", level="ERROR")

        return {
            "success": len(failed) == 0,
            "resolved_paths": resolved,
            "failed_paths": failed
        }

    def commit_session_dna(self, force_resolve: bool = False) -> dict[str, Any]:
        """
        Commit .loop/ directory changes.

        Args:
            force_resolve: If True, auto-resolve any merge conflicts using --ours

        Returns:
            Dict with success, commit_sha, nothing_to_commit, and error fields
        """
        try:
            # Check for merge conflicts first
            conflicts = self.detect_merge_conflicts()

            if conflicts:
                conflict_list = ", ".join(conflicts[:5])
                if len(conflicts) > 5:
                    conflict_list += f" (and {len(conflicts) - 5} more)"

                if force_resolve:
                    self._log_event(f"Merge conflicts detected: {conflict_list}. Force-resolving...", level="WARNING")
                    resolve_result = self.force_resolve_conflicts(conflicts)
                    if not resolve_result["success"]:
                        return {
                            "success": False,
                            "commit_sha": None,
                            "error": "force_resolve_failed",
                            "failed_paths": resolve_result["failed_paths"]
                        }
                else:
                    self._log_event(f"Merge conflicts detected: {conflict_list}. Skipping commit.", level="WARNING")
                    return {
                        "success": False,
                        "commit_sha": None,
                        "error": "merge_conflict",
                        "conflicted_files": conflicts
                    }

            # Stage .loop/ directory
            subprocess.run(
                ["git", "add", ".loop/"],
                cwd=self.repo_path,
                check=True,
                capture_output=True
            )

            # Create commit message with timestamp
            timestamp = datetime.now().strftime("%Y-%m-%dT%H-%M-%S")
            commit_msg = f"chore: daemon session {timestamp}"

            # Try to commit
            result = subprocess.run(
                ["git", "commit", "-m", commit_msg],
                cwd=self.repo_path,
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                # Get commit SHA
                sha_result = subprocess.run(
                    ["git", "rev-parse", "--short", "HEAD"],
                    cwd=self.repo_path,
                    check=True,
                    capture_output=True,
                    text=True
                )
                commit_sha = sha_result.stdout.strip()

                self._log_event(f"Commit created: {commit_sha}")
                return {
                    "success": True,
                    "commit_sha": commit_sha,
                    "nothing_to_commit": False
                }
            elif "nothing to commit" in result.stdout or "nothing to commit" in result.stderr:
                # No changes to commit - this is fine
                self._log_event("No changes to commit")
                return {
                    "success": True,
                    "commit_sha": None,
                    "nothing_to_commit": True
                }
            else:
                # Some other error
                self._log_event(f"Git commit failed: {result.stderr}", level="ERROR")
                return {
                    "success": False,
                    "commit_sha": None,
                    "error": result.stderr
                }

        except subprocess.CalledProcessError as e:
            self._log_event(f"Git command failed: {e}", level="ERROR")
            return {
                "success": False,
                "commit_sha": None,
                "error": str(e)
            }
        except Exception as e:
            self._log_event(f"Unexpected error: {e}", level="ERROR")
            return {
                "success": False,
                "commit_sha": None,
                "error": str(e)
            }

class TaskState(Enum):
    PENDING = " "
    IN_PROGRESS = "→"
    COMPLETE = "x"
    FAILED = "!"

@dataclass
class Task:
    """Represents a task from the state file."""
    number: int
    name: str
    description: str
    verification: str | None = None
    line_number: int = 0
    state: TaskState = TaskState.PENDING

    @property
    def full_description(self) -> str:
        if self.verification:
            return f"{self.description} - **Verification**: {self.verification}"
        return self.description

class SisyphusDaemon:
    def __init__(
        self,
        state_file=".loop/STATE_V4.md",
        intent_file=".geometry/intent/sisyphus.md",
        session_dir=None,
        force_clean=False,
        auto_commit=False,
        enable_heartbeat=True,
        enable_self_rewriting=False,
        enable_tectonic=False,
        enable_brain_evolution=False,
        performance_monitor: PerformanceMonitor | None = None,
        verbose=False,
        budget: int | None = None
    ):
        self.state_file = Path(state_file)
        self.intent_file = Path(intent_file)
        self.project_dir = Path(__file__).parent.parent.parent.resolve()
        self.log_dir = Path(".loop/logs/v4")
        self.log_dir.mkdir(parents=True, exist_ok=True)
        self.verbose = verbose
        self.budget = budget
        self.start_time = time.time()

        # Brain Evolution integration
        self.enable_brain_evolution = enable_brain_evolution and BRAIN_EVOLUTION_AVAILABLE
        self.brain_hook = None
        self.critic = None
        self.router = None
        if self.enable_brain_evolution:
            self.brain_hook = BrainEvolutionHook()
            self.critic = SisyphusCritic()
            self.router = get_cognitive_router()
            logger.info("Brain Evolution enabled in Sisyphus v4")

        # Determine session dir if not provided
        if not session_dir:
            home = Path.home()
            # This is specific to our project structure
            self.session_dir = home / ".pi/agent/sessions/--home-jericho-zion-projects-geometry_os-geometry-os--"
        else:
            self.session_dir = Path(session_dir)

        self.hilbert = NativeHilbertLUT()
        self.poll_interval = 5
        self.running = True

        # Checkpoint management
        self.checkpoint_manager = CheckpointManager()
        self.force_clean = force_clean
        self._last_checkpoint_time = 0
        self._checkpoint_interval = 60  # seconds

        # Git commit hook for session DNA
        self.auto_commit = auto_commit
        self.git_commit_hook = GitCommitHook(repo_path=self.project_dir)

        # Compositor connection with heartbeat
        self.enable_heartbeat = enable_heartbeat
        self.compositor = CompositorBridge() if enable_heartbeat else None

        # Unified Glass Box Bridge for multi-stream output
        self.unified_bridge = UnifiedGlassBridge(
            enable_socket=enable_heartbeat,
            enable_shm=True,
            enable_http=True
        )

        # Phase 5: Mind's Eye & Tectonic
        self.token_rasterizer = TokenRasterizer(self.compositor)
        self.gravity_engine = GravityEngine()
        self._gravity_thread: threading.Thread | None = None

        # Tectonic real-time gravity
        self.enable_tectonic = enable_tectonic
        self.tectonic_updater = None

        # Shared visual bridge for real-time desktop feedback
        from systems.visual_shell.api.visual_bridge import multi_vm_streamer
        self.visual_bridge = multi_vm_streamer

        if enable_tectonic:
            # Use project_dir as watch path
            self.tectonic_updater = TectonicUpdater(
                self.gravity_engine,
                watch_path=str(self.project_dir),
                decay_interval=10.0,
                visual_bridge=self.visual_bridge
            )

        # Self-rewriting components
        self.enable_self_rewriting = enable_self_rewriting
        if enable_self_rewriting:
            self.performance_monitor = PerformanceMonitor(visual_bridge=self.visual_bridge)
            self.kernel_rewriter = KernelRewriter()
            self.hot_swap_manager = HotSwapManager(visual_bridge=self.visual_bridge)
            self._last_hot_spot_check = 0
            self._hot_spot_check_interval = 300  # 5 minutes
        elif performance_monitor is not None:
            self.performance_monitor = performance_monitor
        else:
            self.performance_monitor = None

        # Generation failure tracking for exponential backoff
        self._generation_failures = 0
        self._last_generation_failure = 0
        self._max_backoff_seconds = 300  # Max 5 minute backoff

        # Intrinsic Curiosity Engine components
        if self.performance_monitor is not None:
            self.entropy_mapper = EntropyMapper(self.performance_monitor)
        else:
            self.entropy_mapper = None
        self.goal_synthesizer = GoalSynthesizer(min_entropy_score=0.1)
        self.speculative_optimizer = SpeculativeOptimizer()
        self._curiosity_enabled = True

    def _save_task_checkpoint(self, task_id: int, task_name: str, extra_state: dict[str, Any] = None):
        """Save current task state to checkpoint."""
        state = {
            "task_id": task_id,
            "task_name": task_name,
            "project_dir": str(self.project_dir),
        }
        if extra_state:
            state.update(extra_state)
        self.checkpoint_manager.save_checkpoint(state)
        self._last_checkpoint_time = time.time()

    def _handle_existing_checkpoint(self):
        """Handle existing checkpoint on startup."""
        if self.force_clean:
            self.log("Force clean requested, clearing existing checkpoint")
            self.checkpoint_manager.clear_checkpoint()
            return None

        checkpoint = self.checkpoint_manager.load_checkpoint()
        if checkpoint:
            self.log(f"Found checkpoint from task {checkpoint.get('task_id')}: "
                    f"{checkpoint.get('task_name')}")
            return checkpoint
        return None

    def _should_checkpoint(self) -> bool:
        """Check if enough time has passed for periodic checkpoint."""
        return time.time() - self._last_checkpoint_time >= self._checkpoint_interval

    def log(self, msg):
        # Add colors based on message content
        color_code = ""
        if "Task" in msg and ("complete" in msg or "✓" in msg):
            color_code = "\033[92m" # Green
        elif "Task" in msg and ("failed" in msg or "✗" in msg):
            color_code = "\033[91m" # Red
        elif "Task" in msg:
            color_code = "\033[96m" # Cyan
        elif "[Curiosity]" in msg or "[Cognitive Audit]" in msg:
            color_code = "\033[93m" # Yellow

        reset_code = "\033[0m" if color_code else ""
        logger.info(f"{color_code}{msg}{reset_code}")

    def get_tasks(self) -> list[Task]:
        if not self.state_file.exists():
            return []

        tasks = []
        with open(self.state_file) as f:
            lines = f.readlines()

        for i, line in enumerate(lines):
            # Robust task pattern: matches [ ], [x], [→], [!] followed by number, name, and description
            match = re.match(r"^- \[([ →x!x])\]\s*(\d+)\.\s*\*\*([^*]+)\*\*:\s*(.*)$", line)
            if match:
                state_char = match.group(1).strip()
                num = int(match.group(2))
                name = match.group(3).strip()
                desc_full = match.group(4).strip()

                # Split description and verification if present
                desc = desc_full
                verif = None
                if " - **Verification**:" in desc_full:
                    parts = desc_full.split(" - **Verification**:")
                    desc = parts[0].strip()
                    verif = parts[1].strip()

                state = TaskState.PENDING
                if state_char == "→": state = TaskState.IN_PROGRESS
                elif state_char == "x": state = TaskState.COMPLETE
                elif state_char == "!": state = TaskState.FAILED

                tasks.append(Task(num, name, desc, verif, i, state))
        return tasks

    def mark_task_state(self, task: Task, state: TaskState):
        if not self.state_file.exists():
            return

        with open(self.state_file) as f:
            lines = f.readlines()

        if task.line_number < len(lines):
            line = lines[task.line_number]
            # Replace state char in brackets
            new_line = re.sub(r"^- \[[ →x!]\]", f"- [{state.value}]", line)
            lines[task.line_number] = new_line

        with open(self.state_file, 'w') as f:
            f.writelines(lines)

        task.state = state

    def _generate_heuristic_tasks(self) -> list[str]:
        """
        Generate tasks based on codebase heuristics.

        Scans for:
        - Uncommitted files via git status
        - Failing tests via pytest collection
        - TODO/FIXME comments in source
        - Low coverage modules

        Returns:
            List of task description strings
        """
        tasks = []

        # 1. Check for uncommitted files
        try:
            result = subprocess.run(
                ["git", "status", "--porcelain"],
                cwd=self.project_dir,
                capture_output=True, text=True, timeout=10
            )
            uncommitted = [line for line in result.stdout.strip().split("\n") if line]

            if uncommitted:
                # Group by type
                modified = [l for l in uncommitted if l.startswith(" M") or l.startswith("M ")]
                untracked = [l for l in uncommitted if l.startswith("??")]
                staged = [l for l in uncommitted if l.startswith("A ") or l.startswith("M  ")]

                if len(untracked) > 3:
                    tasks.append(f"Commit Untracked Files: {len(untracked)} untracked files in project root. Review and commit relevant files, add others to .gitignore.")
                elif untracked:
                    sample = untracked[0].split()[-1] if untracked else ""
                    tasks.append(f"Commit New File: {sample} is untracked. Add to version control if relevant.")

                if len(modified) > 5:
                    tasks.append(f"Batch Commit Modified Files: {len(modified)} modified files need commits. Group by feature and commit with descriptive messages.")
                elif modified:
                    sample = modified[0].split()[-1] if modified else ""
                    tasks.append(f"Commit Changes: {sample} has uncommitted modifications.")
        except Exception as e:
            self.log(f"Heuristic scan failed (git): {e}")

        # 2. Check for failing tests
        try:
            result = subprocess.run(
                ["python3", "-m", "pytest", "tests/", "--collect-only", "-q"],
                cwd=self.project_dir,
                capture_output=True, text=True, timeout=30
            )
            if "ERROR" in result.stdout or result.returncode != 0:
                error_count = result.stdout.count("ERROR")
                if error_count > 0:
                    tasks.append(f"Fix Test Collection Errors: {error_count} test files have collection errors. Add missing imports or skip conditions.")
        except Exception:
            pass  # pytest might not be available

        # 3. Scan for TODO/FIXME comments
        try:
            result = subprocess.run(
                ["grep", "-r", "-n", "-E", "(TODO|FIXME|XXX|HACK):", "systems/", "geoasm-cli/", "--include=*.py"],
                cwd=self.project_dir,
                capture_output=True, text=True, timeout=15
            )
            todos = [line for line in result.stdout.strip().split("\n") if line][:5]

            if todos:
                sample = todos[0]
                file_match = sample.split(":")[0] if ":" in sample else "source"
                tasks.append(f"Address TODO Comment: Found in {file_match}. Review and implement or document.")
        except Exception:
            pass

        # 4. Check coverage (if .coverage exists)
        coverage_file = self.project_dir / ".coverage"
        if coverage_file.exists():
            try:
                result = subprocess.run(
                    ["coverage", "report", "--include=systems/*", "--skip-covered"],
                    cwd=self.project_dir,
                    capture_output=True, text=True, timeout=30
                )
                low_coverage = []
                for line in result.stdout.strip().split("\n"):
                    if "%" in line:
                        parts = line.split()
                        if len(parts) >= 4:
                            try:
                                pct = int(parts[-1].replace("%", ""))
                                if pct < 50:
                                    low_coverage.append(parts[0])
                            except ValueError:
                                pass

                if low_coverage:
                    tasks.append(f"Improve Coverage: {low_coverage[0]} has <50% coverage. Add tests for uncovered branches.")
            except Exception:
                pass

        return tasks

    def generate_tasks(self):
        self.log("🎉 Harvesting DNA from history for new prompts...")

        # Check exponential backoff - if we've failed recently, wait
        if self._generation_failures > 0:
            backoff = min(2 ** self._generation_failures, self._max_backoff_seconds)
            time_since_failure = time.time() - self._last_generation_failure
            if time_since_failure < backoff:
                wait_remaining = int(backoff - time_since_failure)
                self.log(f"[Backoff] Waiting {wait_remaining}s before retry (failures: {self._generation_failures})")
                time.sleep(wait_remaining)

        # 1. Collect heuristic tasks from codebase scan
        heuristic_tasks = self._generate_heuristic_tasks()
        heuristic_task_text = "\n".join(f"- {t}" for t in heuristic_tasks) if heuristic_tasks else "No critical heuristics detected."

        # 2. Collect autonomous goals from entropy/brain analysis
        autonomous_goals = self.generate_autonomous_goals()
        autonomous_task_text = ""
        if autonomous_goals:
            autonomous_task_text = "\n".join(f"- [ ] **{g.get('goal_type', 'Goal')}**: {g.get('rationale', 'No rationale')} (ID: {g.get('goal_id')}) - **Verification**: Check fitness/performance metrics" for g in autonomous_goals)
        else:
            autonomous_task_text = "No autonomous goals generated."

        # Determine last task number
        tasks = self.get_tasks()
        last_num = tasks[-1].number if tasks else 0

        # Check if router is available
        if not self.router:
            self.log("No Cognitive Router available. Using heuristic fallback...")
            self._use_heuristic_fallback(heuristic_tasks, autonomous_goals, last_num)
            return

        try:
            # 3. DNA from recent sessions
            extractor_script = self.project_dir / "scripts/session_dna_extractor.py"
            dna_output = ""
            if extractor_script.exists():
                try:
                    dna_output = subprocess.check_output(
                        ["python3", str(extractor_script), str(self.session_dir)],
                        stderr=subprocess.STDOUT, text=True, timeout=30
                    )
                except Exception as e:
                    self.log(f"DNA extraction failed: {e}")

            prompt = f"""You are the Sisyphus Evolution Daemon (v4) for Geometry OS.
Generate new evolution tasks based on the following context:

RECENT SESSION DNA:
{dna_output}

HEURISTIC TASKS:
{heuristic_task_text}

AUTONOMOUS GOALS:
{autonomous_task_text}

LAST TASK NUMBER: {last_num}

Format requirements:
- Return ONLY a list of tasks in markdown format.
- NO conversational preamble or postamble.
- NO bold summaries.
- Each task MUST match this exact pattern: '- [ ] N. **Task Name**: Description - **Verification**: Step'
- Task numbering MUST continue from {last_num + 1}.

Generate 5-10 diverse tasks that advance the Native Glyph Shell and fix any detected cognitive drift or codebase entropy.
"""

            # Use CognitiveRouter directly (escalates to LM Studio)
            import asyncio
            try:
                loop = asyncio.get_event_loop()
            except RuntimeError:
                loop = asyncio.new_event_loop()
                asyncio.set_event_loop(loop)

            # High complexity for task generation
            self.log(f"Requesting new tasks from Cognitive Tech Lead (Last task: #{last_num})...")
            response = loop.run_until_complete(self.router.generate(prompt, complexity=0.8, max_tokens=1000))

            # Check for error response from router
            if response.startswith("[Error:"):
                self.log(f"Cognitive Router failed: {response}")
                raise Exception(response)

            gen_log = self.log_dir / f"generate_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
            with open(gen_log, 'w') as f:
                f.write(response)

            if response.strip():
                new_tasks = []
                for line in response.strip().split("\n"):
                    if re.match(r"^- \[[x ]\]", line):
                        new_tasks.append(line)

                if new_tasks:
                    with open(self.state_file, 'a') as f:
                        f.write("\n" + "\n".join(new_tasks) + "\n")
                    self.log(f"✓ {len(new_tasks)} new tasks added to state file.")
                    # Reset failure counter on success
                    self._generation_failures = 0
                else:
                    self.log("WARNING: Tech Lead generated no tasks in the correct format. Using fallback.")
                    self._use_heuristic_fallback(heuristic_tasks, autonomous_goals, last_num)

        except Exception as e:
            self.log(f"Failed to generate tasks: {e}")
            # Track failure for exponential backoff
            self._generation_failures += 1
            self._last_generation_failure = time.time()
            # Use heuristic fallback
            self._use_heuristic_fallback(heuristic_tasks, autonomous_goals, last_num)

    def _use_heuristic_fallback(self, heuristic_tasks: list[str], autonomous_goals: list[dict], last_num: int) -> None:
        """
        Fallback task generation when cognitive engines are unavailable.

        Uses heuristic tasks and autonomous goals directly without AI generation.
        """
        self.log("Using heuristic/autonomous fallback for task generation...")
        new_tasks = []

        # Convert heuristic tasks to state file format
        task_num = last_num + 1
        for ht in heuristic_tasks[:5]:  # Max 5 heuristic tasks
            task_line = f"- [ ] {task_num}. **Heuristic Task**: {ht} - **Verification**: Run relevant tests"
            new_tasks.append(task_line)
            task_num += 1

        # Convert autonomous goals to state file format
        for goal in autonomous_goals[:5]:  # Max 5 autonomous goals
            goal_type = goal.get('goal_type', 'Goal')
            rationale = goal.get('rationale', 'No rationale')
            task_line = f"- [ ] {task_num}. **{goal_type}**: {rationale} - **Verification**: Check fitness/performance metrics"
            new_tasks.append(task_line)
            task_num += 1

        # If no tasks from either source, add a generic maintenance task
        if not new_tasks:
            task_line = f"- [ ] {task_num}. **System Maintenance**: Review evolution.log for recent patterns and identify improvement opportunities - **Verification**: Confirm log review completed"
            new_tasks.append(task_line)

        if new_tasks:
            with open(self.state_file, 'a') as f:
                f.write("\n" + "\n".join(new_tasks) + "\n")
            self.log(f"✓ {len(new_tasks)} fallback tasks added to state file.")
            # Reset failure counter since we successfully added tasks
            self._generation_failures = 0
        else:
            self.log("ERROR: No fallback tasks could be generated. Sleeping before retry.")
            self._generation_failures += 1
            self._last_generation_failure = time.time()

    def run_task(self, task: Task):
        self.log(f"Starting Task {task.number}: {task.name}")
        self.mark_task_state(task, TaskState.IN_PROGRESS)

        # Stream thought to Glass Box via unified bridge
        self.unified_bridge.stream_thought("TASK_START", {
            "task_id": task.number,
            "task_name": task.name,
            "description": task.description[:100] if task.description else ""
        })

        # Save checkpoint at task start
        self._save_task_checkpoint(task.number, task.name)

        task_log = self.log_dir / f"task_{task.number}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"

        start_time = time.time()
        try:
            # Run pi with the description and verification
            full_prompt = task.full_description

            # Use Popen to stream output
            process = subprocess.Popen(
                ["pi", "-p", full_prompt],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                bufsize=1,
                universal_newlines=True
            )

            # Non-blocking read with proper heartbeat timing
            import select
            import threading

            def read_lines_with_heartbeat():
                """Non-blocking line reader with heartbeat support."""
                last_heartbeat = time.time()
                last_line = ""
                heartbeat_interval = 30  # seconds

                with open(task_log, 'w') as f:
                    while True:
                        # Check if process has ended
                        if process.poll() is not None:
                            # Drain remaining output
                            for line in process.stdout:
                                f.write(line)
                                f.flush()
                                last_line = line.strip()
                                if self.verbose and last_line:
                                    self.log(f"  [Task {task.number}] {last_line}")
                            break

                        # Non-blocking read with 1-second timeout
                        ready, _, _ = select.select([process.stdout], [], [], 1.0)

                        now = time.time()

                        if ready:
                            line = process.stdout.readline()
                            if line:
                                f.write(line)
                                f.flush()
                                last_line = line.strip()

                                if self.verbose and last_line:
                                    self.log(f"  [Task {task.number}] {last_line}")

                                last_heartbeat = now
                            else:
                                # EOF reached
                                break
                        else:
                            # No output available - check heartbeat
                            if now - last_heartbeat > heartbeat_interval:
                                elapsed = int(now - start_time)
                                self.log(f"  [Task {task.number}] Still working... ({elapsed}s elapsed)")
                                last_heartbeat = now

                                # Stream heartbeat to bridge
                                self.unified_bridge.stream_thought("TASK_PROGRESS", {
                                    "task_id": task.number,
                                    "status": "thinking",
                                    "elapsed_seconds": elapsed,
                                    "last_line": last_line[:100] if last_line else "(waiting for output)"
                                })

            read_lines_with_heartbeat()

            # Wait with timeout (300s max per task)
            try:
                process.wait(timeout=300)
            except subprocess.TimeoutExpired:
                self.log(f"Task {task.number} timed out after 300s, killing...")
                process.kill()
                process.wait()  # Wait for kill to complete
                self.mark_task_state(task, TaskState.FAILED)
                self.log(f"Task {task.number} marked as FAILED due to timeout")
                return

            duration = time.time() - start_time
            if process.returncode == 0:
                self.mark_task_state(task, TaskState.COMPLETE)
                self.log(f"✓ Task {task.number} complete ({duration:.1f}s)")

                # Stream success thought via unified bridge
                self.unified_bridge.stream_thought("TASK_COMPLETE", {
                    "task_id": task.number,
                    "duration": duration
                })

                # Clear checkpoint on successful completion
                self.checkpoint_manager.clear_checkpoint()
                # Commit session DNA if auto_commit enabled
                self._commit_session_dna()
            else:
                self.mark_task_state(task, TaskState.FAILED)
                self.log(f"✗ Task {task.number} failed ({duration:.1f}s) - see {task_log}")

                # Stream failure thought via unified bridge
                self.unified_bridge.stream_thought("TASK_FAILURE", {
                    "task_id": task.number,
                    "error": "Subprocess exit non-zero",
                    "log_file": str(task_log)
                })

        except Exception as e:
            self.log(f"Error running task {task.number}: {e}")
            self.mark_task_state(task, TaskState.FAILED)

    def _commit_session_dna(self, force_resolve: bool = False) -> dict[str, Any] | None:
        """Commit .loop/ changes if auto_commit is enabled.

        Args:
            force_resolve: If True, auto-resolve merge conflicts using --ours
        """
        if not self.auto_commit:
            return {"skipped": True, "reason": "auto_commit disabled"}

        result = self.git_commit_hook.commit_session_dna(force_resolve=force_resolve)

        if result.get("success") and result.get("commit_sha"):
            self.log(f"Session DNA committed: {result['commit_sha']}")
        elif result.get("nothing_to_commit"):
            self.log("Session DNA: nothing to commit")
        elif result.get("error") == "merge_conflict":
            self.log("Session DNA commit skipped: merge conflict detected")
            self.log(f"  Conflicted files: {', '.join(result.get('conflicted_files', []))}")
        elif not result.get("success"):
            self.log(f"Session DNA commit failed: {result.get('error', 'unknown')}")

        return result

    def detect_kernel_hot_spots(self) -> list:
        """Detect performance hot spots in native kernels."""
        if not self.enable_self_rewriting:
            return []

        return self.performance_monitor.detect_hot_spots(
            threshold_calls=500,
            threshold_time_ms=1.0
        )

    def propose_kernel_rewrite(self) -> Task | None:
        """Create a task proposal for kernel optimization."""
        if not self.enable_self_rewriting:
            return None

        hot_spots = self.detect_kernel_hot_spots()
        if not hot_spots:
            return None

        top_hot_spot = hot_spots[0]

        # Create a task for the optimization
        task = Task(
            number=0,  # Will be assigned
            name=f"Optimize {top_hot_spot.function_name}",
            description=f"Hot-spot detected: {top_hot_spot.call_count} calls, "
                       f"{top_hot_spot.avg_time_ms:.2f}ms avg. "
                       f"Location: {top_hot_spot.source_file}:{top_hot_spot.source_line}",
            verification=f"Profile {top_hot_spot.function_name} after optimization - "
                       f"should show < {top_hot_spot.avg_time_ms * 0.5:.2f}ms avg"
        )

        return task

    def stream_llm_tokens(self, tokens: list[str], token_types: list[str] | None = None):
        """
        Stream LLM tokens to Glass Box via unified bridge.

        Args:
            tokens: List of token strings to stream
            token_types: Optional list of token types (keyword, string, etc.)
        """
        for i, token in enumerate(tokens):
            token_type = token_types[i] if token_types and i < len(token_types) else None
            self.unified_bridge.stream_token(token, token_type=token_type or "identifier")

    def get_multi_stream_stats(self) -> dict[str, Any]:
        """Get statistics from the unified bridge."""
        return self.unified_bridge.get_stats()

        return task

    def generate_autonomous_goals(self) -> list[dict[str, Any]]:
        """
        Generate autonomous goals from entropy analysis.

        This is the core of intrinsic curiosity - the system
        generates its own improvement goals without human input.

        Returns:
            List of goal dictionaries suitable for task queue
        """
        if not self._curiosity_enabled:
            return []

        all_goals = []

        # 1. Standard Codebase Entropy
        if self.entropy_mapper is not None:
            spots = self.entropy_mapper.map_entropy()
            code_goals = self.goal_synthesizer.synthesize_batch(spots)
            all_goals.extend(code_goals)

        # 2. Cognitive Brain Entropy
        if self.enable_brain_evolution:
            # Evaluate current brain fitness with "Tech Lead" oversight
            try:
                # 1. Get sample output from current brain
                # (Assuming a simplified 'generate' on brain_hook for now)
                sample_prompt = "Once upon a time in Geometry OS"
                from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
                brain = get_pixel_brain_service()

                # Perform a quick inference run
                import asyncio
                # Check if we're in an async loop or need a runner
                try:
                    loop = asyncio.get_event_loop()
                except RuntimeError:
                    loop = asyncio.new_event_loop()
                    asyncio.set_event_loop(loop)

                # Sample the current brain
                sample_result = loop.run_until_complete(brain.generate(sample_prompt, max_tokens=20))
                sample_output = sample_result.get('text', '')

                # 2. Grade the output via SisyphusCritic (Escalates to LM Studio)
                grade = loop.run_until_complete(self.critic.grade_mutation(sample_prompt, sample_output))
                fitness = grade.get('score', 0.5)

                # 3. Monitor performance hotspots (WGPU latency)
                latency = sample_result.get('latency_ms', 150.0)

                # 4. Synthesize cognitive goals
                brain_goals = self.goal_synthesizer.synthesize_from_brain_metrics(
                    fitness_score=fitness,
                    latency_ms=latency,
                    hot_sectors=["attention_layer_0"] # Default sector
                )
                all_goals.extend(brain_goals)

                logger.info(f"[Cognitive Audit] Fitness: {fitness:.2f} (Critic: {grade.get('decision')})")

            except Exception as e:
                logger.error(f"Failed to generate cognitive goals: {e}")

        # Sort all goals by priority
        all_goals.sort()

        # Convert to task format
        return [g.to_task_dict() for g in all_goals]

    def get_structural_health(self) -> float:
        """
        Get current structural health score (PAS).

        Returns:
            Score from 0.0 (unhealthy) to 1.0 (healthy)
        """
        if self.entropy_mapper is None:
            return 1.0  # No data means no imbalance
        return self.entropy_mapper.compute_structural_health()

    async def run_curiosity_cycle(self) -> dict[str, Any]:
        """
        Run one cycle of intrinsic curiosity.

        This method:
        1. Maps entropy across the codebase
        2. Generates autonomous goals
        3. Returns results for logging/display

        Returns:
            Dict with health_score, goals_generated, and spots_found
        """
        if self.entropy_mapper is None:
            return {
                "health_score": 1.0,
                "goals_generated": 0,
                "spots_found": 0,
                "cold_spots": 0,
                "hot_spots": 0,
                "top_goals": []
            }

        spots = self.entropy_mapper.map_entropy()
        health = self.entropy_mapper.compute_structural_health()
        goals = self.goal_synthesizer.synthesize_batch(spots)

        result = {
            "health_score": health,
            "goals_generated": len(goals),
            "spots_found": len(spots),
            "cold_spots": len([s for s in spots if s.entropy_type == "cold"]),
            "hot_spots": len([s for s in spots if s.entropy_type == "hot"]),
            "top_goals": [g.to_task_dict() for g in goals[:5]]
        }

        self.log(f"[Curiosity] System Health (PAS): {health:.2f} | Goals: {len(goals)} | Entropy Spots: {len(spots)}")
        for goal in goals[:3]:
            self.log(f"  - Generated Goal: {goal.goal_type} (Priority: {goal.priority:.2f})")

        return result

    def _gravity_loop(self):
        """Background thread for Tectonic gravity simulation with unified bridge."""
        self.log("Tectonic gravity engine started (unified bridge mode)")
        while self.running:
            try:
                # Update Tectonic Updater (handles physics/saccade queue)
                if self.tectonic_updater:
                    self.tectonic_updater.update()

                self.gravity_engine.update()
                updates = self.gravity_engine.get_updates()
                ripples = self.gravity_engine.get_ripples()

                # Use unified bridge for multi-stream output
                if updates:
                    self.unified_bridge.stream_gravity(updates[:10])

                if ripples:
                    for ripple in ripples:
                        self.unified_bridge.stream_ripple(
                            x=ripple.get("x", 0),
                            y=ripple.get("y", 0),
                            z=ripple.get("z", 0),
                            force=ripple.get("force", 0),
                            radius=ripple.get("radius", 0)
                        )

                # Periodic telemetry broadcast (every 5 cycles)
                if int(time.time()) % 5 == 0:
                    self.unified_bridge.stream_telemetry({
                        "orb_count": len(self.gravity_engine.orbs),
                        "ripple_count": len(ripples),
                        "gravity_health": 1.0
                    })

                time.sleep(1.0) # 1Hz simulation update (can be faster if needed)
            except Exception as e:
                logger.error(f"Gravity loop error: {e}")
                time.sleep(5)

    def run(self):
        self.log("--- SISYPHUS V4 DAEMON STARTING ---")

        # Handle existing checkpoint on startup
        checkpoint = self._handle_existing_checkpoint()
        if checkpoint:
            self.log(f"Resuming from checkpoint: task {checkpoint.get('task_id')}")

        # Connect unified bridge for multi-stream output
        if self.unified_bridge.connect():
            self.log("Unified Glass Box Bridge connected")
        else:
            self.log("Warning: Unified bridge connection failed")

        # Start compositor heartbeat if enabled
        if self.enable_heartbeat and self.compositor:
            self.compositor.connect()
            self.compositor.start_heartbeat_loop()
            self.log("Compositor heartbeat monitoring enabled")

        # Start Tectonic engine
        self._gravity_thread = threading.Thread(target=self._gravity_loop, daemon=True)
        self._gravity_thread.start()

        # Start Tectonic updater if enabled
        if self.enable_tectonic and self.tectonic_updater:
            self.tectonic_updater.start()
            self.log("Tectonic real-time gravity enabled")

        try:
            while self.running:
                # 0. Check time budget
                if self.budget:
                    elapsed = time.time() - self.start_time
                    if elapsed >= self.budget:
                        self.log(f"⏰ Budget of {self.budget}s reached. Graceful termination.")
                        break

                tasks = self.get_tasks()

                # 0.5 Reset in-progress tasks on startup (resume from interruption)
                in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]
                if in_progress:
                    self.log(f"Found {len(in_progress)} in-progress tasks from previous run")
                    for task in in_progress:
                        self.log(f"Resetting task {task.number} to pending")
                        self.mark_task_state(task, TaskState.PENDING)
                    # Refresh task list after reset
                    tasks = self.get_tasks()

                pending_tasks = [t for t in tasks if t.state == TaskState.PENDING]

                if not pending_tasks:
                    # Safety check: if we've failed too many times, pause longer
                    if self._generation_failures >= 5:
                        self.log(f"⚠️  Generation has failed {self._generation_failures} times. Pausing for 60s...")
                        time.sleep(60)
                        # Don't immediately retry - let the backoff logic work

                    if not tasks:
                        self.log("State file empty or no tasks found. Triggering generation...")
                        self.generate_tasks()
                    elif all(t.state in [TaskState.COMPLETE, TaskState.FAILED] for t in tasks):
                        self.log(f"All {len(tasks)} tasks complete. Triggering generation...")
                        self.generate_tasks()
                    else:
                        non_complete = [t.number for t in tasks if t.state not in [TaskState.COMPLETE, TaskState.FAILED]]
                        self.log(f"No pending tasks, but {len(non_complete)} tasks are in indeterminate states: {non_complete}. Waiting...")
                        time.sleep(self.poll_interval)
                    continue

                # Run the first pending task
                self.run_task(pending_tasks[0])
                time.sleep(2)
        finally:
            # Cleanup
            if self.tectonic_updater:
                self.tectonic_updater.stop()
                self.log("Tectonic updater stopped")
            if self.compositor:
                self.compositor.stop_heartbeat_loop()
                self.compositor.disconnect()
                self.log("Compositor connection closed")
            # Disconnect unified bridge
            self.unified_bridge.disconnect()
            self.log("Unified Glass Box Bridge disconnected")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Sisyphus v4 Daemon")
    parser.add_argument("--budget", type=int, help="Time budget in seconds (Ralph Wiggum Mode)")
    parser.add_argument("--intent", type=str, default=".geometry/intent/sisyphus.md", help="Intent file path")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")
    parser.add_argument("--enable-brain-evolution", action="store_true", help="Enable brain evolution with Cognitive Tech Lead")
    args = parser.parse_args()

    daemon = SisyphusDaemon(
        budget=args.budget,
        intent_file=args.intent,
        verbose=args.verbose,
        enable_brain_evolution=args.enable_brain_evolution
    )
    daemon.run()
