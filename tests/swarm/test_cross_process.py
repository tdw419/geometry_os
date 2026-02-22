"""
Tests for cross-process coordination - proving subprocesses can coordinate
via shared task board without any other communication.

Uses subprocess.Popen to create true process isolation with separate Python
interpreters.
"""

import pytest
import subprocess
import sys
import os
import json
import tempfile
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard


# Worker script that will be run as subprocess
WORKER_SCRIPT_SINGLE = '''
import sys
import os

# Add project root to path
sys.path.insert(0, os.getcwd())

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


def main(storage_path, agent_id):
    """Worker main function - claim and complete one task."""
    board = TaskBoard(storage_path=storage_path)
    agent = SwarmAgent(agent_id=agent_id, task_board=board)

    # Claim and complete one task
    task = agent.claim_next_task()
    if task:
        result = {"processed_by": agent_id, "task_id": task.task_id}
        agent.complete_task(task, result)
        print(f"COMPLETED:{task.task_id}:{agent_id}")
    else:
        print(f"NO_TASK:{agent_id}")
    sys.stdout.flush()


if __name__ == "__main__":
    storage_path = sys.argv[1]
    agent_id = sys.argv[2]
    main(storage_path, agent_id)
'''


# Worker script that claims multiple tasks in a loop
WORKER_SCRIPT_LOOP = '''
import sys
import os
import time

# Add project root to path
sys.path.insert(0, os.getcwd())

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


def main(storage_path, agent_id, max_tasks):
    """Worker main function - claim and complete tasks until board empty or max reached."""
    board = TaskBoard(storage_path=storage_path)
    agent = SwarmAgent(agent_id=agent_id, task_board=board)

    max_tasks = int(max_tasks)
    completed = 0

    while completed < max_tasks:
        task = agent.claim_next_task()
        if task:
            result = {"processed_by": agent_id, "task_id": task.task_id}
            agent.complete_task(task, result)
            completed += 1
            print(f"COMPLETED:{task.task_id}:{agent_id}")
            sys.stdout.flush()
        else:
            # No more tasks available
            break

    print(f"DONE:{agent_id}:{completed}")
    sys.stdout.flush()


if __name__ == "__main__":
    storage_path = sys.argv[1]
    agent_id = sys.argv[2]
    max_tasks = sys.argv[3] if len(sys.argv) > 3 else "999"
    main(storage_path, agent_id, max_tasks)
'''


class TestCrossProcessCoordination:
    """Test true cross-process coordination via shared task board."""

    def test_subprocess_agents_coordinate_via_shared_taskboard(self, tmp_path):
        """
        3 subprocesses via Popen, verify all complete their tasks.

        This proves cross-process coordination works with file-based locking.
        Uses looping workers that each claim exactly one task.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 3 tasks for 3 workers
        for i in range(3):
            board.post(Task(
                task_id=f"cross-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Cross-process task {i}"
            ))

        # Write worker script that loops
        worker_script_path = tmp_path / "worker.py"
        worker_script_path.write_text(WORKER_SCRIPT_LOOP)

        # Launch 3 subprocess workers, each limited to 1 task
        processes = []
        for i in range(3):
            proc = subprocess.Popen(
                [sys.executable, str(worker_script_path), storage_path, f"worker-{i}", "1"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=os.getcwd()
            )
            processes.append(proc)

        # Wait for all to complete
        outputs = []
        for proc in processes:
            stdout, stderr = proc.communicate(timeout=30)
            outputs.append(stdout.decode())

        # Each worker should have completed exactly 1 task
        total_completed = sum(1 for o in outputs if "COMPLETED:" in o)
        assert total_completed == 3, f"Expected 3 completed, got {total_completed}. Outputs: {outputs}"

        # Verify via board
        completed_count = 0
        for i in range(3):
            task = board.get(f"cross-task-{i}")
            if task and task.status == TaskStatus.COMPLETED:
                completed_count += 1

        assert completed_count == 3, f"Expected 3 completed on board, got {completed_count}"

    def test_no_communication_except_taskboard(self, tmp_path):
        """
        Verify no shared env vars, only file storage.

        Workers have no shared state except the task board directory.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create task
        board.post(Task(
            task_id="isolated-task",
            task_type=TaskType.CODE_ANALYSIS,
            description="Isolated task"
        ))

        # Write worker script
        worker_script_path = tmp_path / "worker_isolated.py"
        worker_script_path.write_text(WORKER_SCRIPT_SINGLE)

        # Create subprocess with minimal environment
        minimal_env = {
            "PATH": os.environ.get("PATH", ""),
            "PYTHONPATH": os.getcwd(),
        }

        proc = subprocess.Popen(
            [sys.executable, str(worker_script_path), storage_path, "isolated-worker"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=minimal_env,
            cwd=os.getcwd()
        )

        stdout, stderr = proc.communicate(timeout=30)

        # Verify task completed without any shared state
        task = board.get("isolated-task")
        assert task is not None
        assert task.status == TaskStatus.COMPLETED
        assert task.result["processed_by"] == "isolated-worker"

    def test_multiple_workers_one_taskboard(self, tmp_path):
        """
        3 workers, 9 tasks, verify distribution.

        Tests proper distribution across multiple workers using looping workers.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 9 tasks
        for i in range(9):
            board.post(Task(
                task_id=f"dist-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Distributed task {i}"
            ))

        # Write worker script that loops
        worker_script_path = tmp_path / "worker_dist.py"
        worker_script_path.write_text(WORKER_SCRIPT_LOOP)

        # Launch 3 workers, each can do up to 5 tasks
        processes = []
        for i in range(3):
            proc = subprocess.Popen(
                [sys.executable, str(worker_script_path), storage_path, f"worker-{i}", "5"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=os.getcwd()
            )
            processes.append(proc)

        # Wait for completion
        for proc in processes:
            proc.communicate(timeout=30)

        # Verify all 9 tasks completed
        completed_tasks = []
        for i in range(9):
            task = board.get(f"dist-task-{i}")
            if task and task.status == TaskStatus.COMPLETED:
                completed_tasks.append(task)

        assert len(completed_tasks) == 9, f"Expected 9 completed, got {len(completed_tasks)}"

        # Verify distribution (each worker should have done at least 1 task)
        worker_counts = {}
        for task in completed_tasks:
            worker_id = task.result.get("processed_by", "unknown")
            worker_counts[worker_id] = worker_counts.get(worker_id, 0) + 1

        # At least 2 workers should have done work (timing may cause one to miss out)
        assert len(worker_counts) >= 2, f"Expected at least 2 workers to participate, got {worker_counts}"
