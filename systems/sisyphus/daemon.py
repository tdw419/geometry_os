"""
Sisyphus v4 Daemon - Python-based evolution system with FFI integration.
Replaces shell scripts with native Python daemon that:
1. Uses FFI-accelerated Hilbert mapping for glyph operations
2. Monitors performance and offloads bottlenecks
3. Integrates with visual-vm via shared memory
"""

import re
import os
import time
import subprocess
import logging
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Optional, List
from datetime import datetime

from .native_hilbert import NativeHilbertLUT

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] [%(levelname)s] [%(name)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger("SisyphusV4")

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
    def __init__(self, state_file=".loop/STATE_V4.md", session_dir=None):
        self.state_file = Path(state_file)
        self.project_dir = Path(__file__).parent.parent.parent.resolve()
        self.log_dir = Path(".loop/logs/v4")
        self.log_dir.mkdir(parents=True, exist_ok=True)
        
        # Determine session dir if not provided
        if not session_dir:
            home = Path.home()
            # This is specific to our project structure
            self.session_dir = home / ".pi/agent/sessions/--home-jericho-zion-projects-geometry_os-geometry_os--"
        else:
            self.session_dir = Path(session_dir)
            
        self.hilbert = NativeHilbertLUT()
        self.poll_interval = 5
        self.running = True

    def log(self, msg):
        logger.info(msg)

    def get_tasks(self) -> List[Task]:
        if not self.state_file.exists():
            return []
            
        tasks = []
        with open(self.state_file, 'r') as f:
            lines = f.readlines()
            
        for i, line in enumerate(lines):
            # Match task pattern: - [ ] N. **Name**: Description - **Verification**: Step
            # Or - [x] N. **Name**: Description
            match = re.match(r"^- \[([ →x!])\] (\d+)\. \*\*([^*]+)\*\*: (.*?)(?: - \*\*Verification\*\*: (.*))?$", line)
            if match:
                state_char = match.group(1)
                num = int(match.group(2))
                name = match.group(3)
                desc = match.group(4)
                verif = match.group(5)
                
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

    def generate_tasks(self):
        self.log("🎉 Harvesting DNA from history for new prompts...")
        
        try:
            # First, check if script exists
            extractor_script = self.project_dir / "scripts/session_dna_extractor.py"
            if not extractor_script.exists():
                self.log(f"Extractor script missing at {extractor_script}")
                time.sleep(self.poll_interval)
                return
                
            dna_output = subprocess.check_output(
                ["python3", str(extractor_script), str(self.session_dir)],
                stderr=subprocess.STDOUT, text=True
            )
            
            prompt = f"""You are the Sisyphus Evolution Daemon (v4). 
Recent Session DNA:
{dna_output}

Analyze this DNA. Notice the intent, specific failures, and git status of touched files.
Append 5 new actionable tasks to {self.state_file}.

Each task must:
1. Address failures or uncommitted states from the DNA.
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
            else:
                self.mark_task_state(task, TaskState.FAILED)
                self.log(f"✗ Task {task.number} failed ({duration:.1f}s) - see {task_log}")
                
        except Exception as e:
            self.log(f"Error running task {task.number}: {e}")
            self.mark_task_state(task, TaskState.FAILED)

    def run(self):
        self.log("--- SISYPHUS V4 DAEMON STARTING ---")
        
        while self.running:
            tasks = self.get_tasks()
            pending_tasks = [t for t in tasks if t.state == TaskState.PENDING]
            
            if not pending_tasks:
                if all(t.state in [TaskState.COMPLETE, TaskState.FAILED] for t in tasks):
                    self.generate_tasks()
                else:
                    self.log("No pending tasks. Waiting...")
                    time.sleep(self.poll_interval)
                continue
            
            # Run the first pending task
            self.run_task(pending_tasks[0])
            time.sleep(2)
