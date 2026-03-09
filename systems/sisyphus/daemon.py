"""
Sisyphus v4 Daemon - Python-based evolution system with FFI integration.
Replaces shell scripts with native Python daemon that:
1. Uses FFI-accelerated Hilbert mapping for glyph operations
2. Monitors performance and offloads bottlenecks
3. Integrates with visual-vm via shared memory
4. Checkpoint/restore for crash recovery
5. Heartbeat monitoring for compositor socket connection
"""

import re
import os
import time
import json
import socket
import struct
import subprocess
import logging
import hashlib
import threading
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, List, Dict, Any
from datetime import datetime

from .native_hilbert import NativeHilbertLUT
from .compositor_bridge import CompositorBridge
from .token_rasterizer import TokenRasterizer
from ..infinite_map.gravity_engine import GravityEngine
from ..infinite_map.tectonic_updater import TectonicUpdater
from .performance_monitor import PerformanceMonitor
from .kernel_rewriter import KernelRewriter
from .hot_swap_manager import HotSwapManager
from .entropy_mapper import EntropyMapper
from .goal_synthesizer import GoalSynthesizer
from .speculative_optimizer import SpeculativeOptimizer

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

    def _compute_checksum(self, data: Dict[str, Any]) -> str:
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

    def save_checkpoint(self, state: Dict[str, Any]) -> bool:
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

    def load_checkpoint(self) -> Optional[Dict[str, Any]]:
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
    - Logs commit SHA to evolution.log
    """

    def __init__(self, repo_path: str = ".", log_path: str = ".loop/evolution.log"):
        self.repo_path = Path(repo_path)
        self.log_path = Path(log_path)

    def _log_event(self, message: str):
        """Log commit event to evolution.log."""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [GIT_COMMIT] {message}\n"

        # Ensure directory exists
        self.log_path.parent.mkdir(parents=True, exist_ok=True)

        with open(self.log_path, 'a') as f:
            f.write(log_entry)

    def commit_session_dna(self) -> Dict[str, Any]:
        """
        Commit .loop/ directory changes.

        Returns:
            Dict with success, commit_sha, and nothing_to_commit fields
        """
        try:
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
                self._log_event(f"Git commit failed: {result.stderr}")
                return {
                    "success": False,
                    "commit_sha": None,
                    "error": result.stderr
                }

        except subprocess.CalledProcessError as e:
            self._log_event(f"Git command failed: {e}")
            return {
                "success": False,
                "commit_sha": None,
                "error": str(e)
            }
        except Exception as e:
            self._log_event(f"Unexpected error: {e}")
            return {
                "success": False,
                "commit_sha": None,
                "error": str(e)
            }

class TaskState(Enum):
    PENDING = "[ ]"
    IN_PROGRESS = "[→]"
    COMPLETE = "[x]"
    FAILED = "[!]"

@dataclass
class Task:
    """Represents a task from the state file."""
    number: int
    name: str
    description: str
    verification: Optional[str] = None
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
        session_dir=None,
        force_clean=False,
        auto_commit=False,
        enable_heartbeat=True,
        enable_self_rewriting=False,
        enable_tectonic=False,
        performance_monitor: Optional[PerformanceMonitor] = None
    ):
        self.state_file = Path(state_file)
        self.project_dir = Path(__file__).parent.parent.parent.resolve()
        self.log_dir = Path(".loop/logs/v4")
        self.log_dir.mkdir(parents=True, exist_ok=True)

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

        # Phase 5: Mind's Eye & Tectonic
        self.token_rasterizer = TokenRasterizer(self.compositor)
        self.gravity_engine = GravityEngine()
        self._gravity_thread: Optional[threading.Thread] = None

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

        # Intrinsic Curiosity Engine components
        if self.performance_monitor is not None:
            self.entropy_mapper = EntropyMapper(self.performance_monitor)
        else:
            self.entropy_mapper = None
        self.goal_synthesizer = GoalSynthesizer(min_entropy_score=0.1)
        self.speculative_optimizer = SpeculativeOptimizer()
        self._curiosity_enabled = True

    def _save_task_checkpoint(self, task_id: int, task_name: str, extra_state: Dict[str, Any] = None):
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
        logger.info(msg)

    def get_tasks(self) -> List[Task]:
        if not self.state_file.exists():
            return []
            
        tasks = []
        with open(self.state_file, 'r') as f:
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
            
        with open(self.state_file, 'r') as f:
            lines = f.readlines()
            
        if task.line_number < len(lines):
            line = lines[task.line_number]
            # Replace state char in brackets
            new_line = re.sub(r"^- \[[ →x!]\]", f"- [{state.value}]", line)
            lines[task.line_number] = new_line
            
        with open(self.state_file, 'w') as f:
            f.writelines(lines)
        
        task.state = state

    def _generate_heuristic_tasks(self) -> List[str]:
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

        # First, collect heuristic tasks from codebase scan
        heuristic_tasks = self._generate_heuristic_tasks()
        heuristic_task_text = "\n".join(f"- {t}" for t in heuristic_tasks) if heuristic_tasks else ""

        try:
            # First, check if script exists
            extractor_script = self.project_dir / "scripts/session_dna_extractor.py"
            if not extractor_script.exists():
                self.log(f"Extractor script missing at {extractor_script}")
                
            dna_output = subprocess.check_output(
                ["python3", str(extractor_script), str(self.session_dir)],
                stderr=subprocess.STDOUT, text=True
            )
            
            prompt = f"""You are the Sisyphus Evolution Daemon (v4).
Recent Session DNA:
{dna_output}

Heuristic Tasks (from codebase scan):
{heuristic_tasks}

Combine both sources to create diverse, actionable tasks. Priority heuristic tasks over DNA tasks when there are TODO/FIXME or uncommitted files present.

Each task must:
1. Address failures, uncommitted states from the DNA or heuristics.
2. Include concrete Verification Steps.
3. Advance the Native Glyph Shell architecture.

Format: '- [ ] N. **Task Name**: Description - **Verification**: Step'
Ensure task numbering continues correctly.
"""
            
            # Use pi -p to generate
            gen_log = self.log_dir / f"generate_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
            with open(gen_log, 'w') as f:
                subprocess.run(["pi", "-p", prompt], stdout=f, stderr=subprocess.STDOUT)
            
            self.log("✓ New tasks added to state file.")
            
        except Exception as e:
            self.log(f"Failed to generate tasks: {e}")

    def run_task(self, task: Task):
        self.log(f"Starting Task {task.number}: {task.name}")
        self.mark_task_state(task, TaskState.IN_PROGRESS)

        # Stream thought to Glass Box
        if self.compositor:
            self.compositor.send_thought({
                "type": "TASK_START",
                "task_id": task.number,
                "task_name": task.name,
                "timestamp": time.time()
            })

        # Save checkpoint at task start
        self._save_task_checkpoint(task.number, task.name)

        task_log = self.log_dir / f"task_{task.number}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"

        start_time = time.time()
        try:
            # Run pi with the description and verification
            full_prompt = task.full_description
            with open(task_log, 'w') as f:
                # We use -p for non-interactive mode
                process = subprocess.run(["pi", "-p", full_prompt], stdout=f, stderr=subprocess.STDOUT)

            duration = time.time() - start_time
            if process.returncode == 0:
                self.mark_task_state(task, TaskState.COMPLETE)
                self.log(f"✓ Task {task.number} complete ({duration:.1f}s)")
                
                # Stream success thought
                if self.compositor:
                    self.compositor.send_thought({
                        "type": "TASK_COMPLETE",
                        "task_id": task.number,
                        "duration": duration,
                        "timestamp": time.time()
                    })
                
                # Clear checkpoint on successful completion
                self.checkpoint_manager.clear_checkpoint()
                # Commit session DNA if auto_commit enabled
                self._commit_session_dna()
            else:
                self.mark_task_state(task, TaskState.FAILED)
                self.log(f"✗ Task {task.number} failed ({duration:.1f}s) - see {task_log}")
                
                # Stream failure thought
                if self.compositor:
                    self.compositor.send_thought({
                        "type": "TASK_FAILURE",
                        "task_id": task.number,
                        "error": "Subprocess exit non-zero",
                        "timestamp": time.time()
                    })

        except Exception as e:
            self.log(f"Error running task {task.number}: {e}")
            self.mark_task_state(task, TaskState.FAILED)

    def _commit_session_dna(self) -> Optional[Dict[str, Any]]:
        """Commit .loop/ changes if auto_commit is enabled."""
        if not self.auto_commit:
            return {"skipped": True, "reason": "auto_commit disabled"}

        result = self.git_commit_hook.commit_session_dna()

        if result.get("success") and result.get("commit_sha"):
            self.log(f"Session DNA committed: {result['commit_sha']}")
        elif result.get("nothing_to_commit"):
            self.log("Session DNA: nothing to commit")
        elif not result.get("success"):
            self.log(f"Session DNA commit failed: {result.get('error', 'unknown')}")

        return result

    def detect_kernel_hot_spots(self) -> List:
        """Detect performance hot spots in native kernels."""
        if not self.enable_self_rewriting:
            return []

        return self.performance_monitor.detect_hot_spots(
            threshold_calls=500,
            threshold_time_ms=1.0
        )

    def propose_kernel_rewrite(self) -> Optional[Task]:
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

    def generate_autonomous_goals(self) -> List[Dict[str, Any]]:
        """
        Generate autonomous goals from entropy analysis.

        This is the core of intrinsic curiosity - the system
        generates its own improvement goals without human input.

        Returns:
            List of goal dictionaries suitable for task queue
        """
        if not self._curiosity_enabled:
            return []

        if self.entropy_mapper is None:
            return []

        # Map entropy across codebase
        spots = self.entropy_mapper.map_entropy()

        # Synthesize goals from entropy
        goals = self.goal_synthesizer.synthesize_batch(spots)

        # Convert to task format
        return [g.to_task_dict() for g in goals]

    def get_structural_health(self) -> float:
        """
        Get current structural health score (PAS).

        Returns:
            Score from 0.0 (unhealthy) to 1.0 (healthy)
        """
        if self.entropy_mapper is None:
            return 1.0  # No data means no imbalance
        return self.entropy_mapper.compute_structural_health()

    async def run_curiosity_cycle(self) -> Dict[str, Any]:
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

        logger.info(f"[Curiosity] Health: {health:.2f}, Goals: {len(goals)}, Spots: {len(spots)}")

        return result

    def _gravity_loop(self):
        """Background thread for Tectonic gravity simulation."""
        self.log("Tectonic gravity engine started")
        while self.running:
            try:
                # Update Tectonic Updater (handles physics/saccade queue)
                if self.tectonic_updater:
                    self.tectonic_updater.update()

                self.gravity_engine.update()
                updates = self.gravity_engine.get_updates()
                ripples = self.gravity_engine.get_ripples()

                if self.compositor:
                    if updates:
                        self.compositor.send_thought({
                            "type": "GRAVITY_UPDATE",
                            "updates": updates[:10], # Cap for bandwidth
                            "timestamp": time.time()
                        }, msg_type="Tectonic")
                    
                    if ripples:
                        for ripple in ripples:
                            self.compositor.send_thought({
                                "type": "TECTONIC_RIPPLE",
                                **ripple,
                                "timestamp": time.time()
                            }, msg_type="Tectonic")

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
                tasks = self.get_tasks()
                pending_tasks = [t for t in tasks if t.state == TaskState.PENDING]
                in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]

                if in_progress:
                    self.log(f"Task {in_progress[0].number} is in progress. Waiting...")
                    time.sleep(self.poll_interval)
                    continue

                if not pending_tasks:
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
