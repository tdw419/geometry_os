"""
Tests for parallel isolation - proving concurrent operations don't race.

Tests use ThreadPoolExecutor to simulate multiple agents claiming tasks
concurrently, verifying no double-claims or result mixing occurs.
"""

import pytest
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import List, Tuple

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestParallelIsolation:
    """Test concurrent task claiming and execution."""

    def test_concurrent_claiming_no_double_claims(self, tmp_path):
        """
        5 threads claim from 10 tasks, verify no duplicates.

        This proves file locking prevents race conditions in claim().
        """
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 10 tasks
        for i in range(10):
            board.post(Task(
                task_id=f"parallel-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                priority=i
            ))

        claimed_tasks: List[str] = []
        claims_lock = __import__('threading').Lock()

        def claim_task(agent_id: str) -> Tuple[str, str]:
            """Claim a task and return (agent_id, task_id)."""
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                with claims_lock:
                    claimed_tasks.append(task.task_id)
                return (agent_id, task.task_id)
            return (agent_id, None)

        # 5 agents claim concurrently
        with ThreadPoolExecutor(max_workers=5) as executor:
            futures = [executor.submit(claim_task, f"agent-{i}") for i in range(5)]
            results = [f.result() for f in as_completed(futures)]

        # Verify: exactly 5 unique tasks claimed, no duplicates
        successful_claims = [r for r in results if r[1] is not None]
        assert len(successful_claims) == 5, f"Expected 5 claims, got {len(successful_claims)}"

        # No duplicate task_ids
        task_ids = [r[1] for r in successful_claims]
        assert len(task_ids) == len(set(task_ids)), f"Duplicate claims detected: {task_ids}"

        # Each task only claimed once
        for task_id in task_ids:
            task = board.get(task_id)
            assert task.status == TaskStatus.CLAIMED
            assert task.claimed_by is not None

    def test_concurrent_results_no_mixing(self, tmp_path):
        """
        3 agents complete tasks, verify correct result attribution.

        This proves complete() writes correct results to correct tasks.
        """
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 3 tasks
        for i in range(3):
            board.post(Task(
                task_id=f"result-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}"
            ))

        def complete_task(agent_id: str, task_index: int) -> Tuple[str, str, dict]:
            """Claim, start, and complete a task with agent-specific result."""
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                result = {"agent_id": agent_id, "index": task_index, "data": f"result-{agent_id}"}
                agent.complete_task(task, result)
                return (agent_id, task.task_id, result)
            return (agent_id, None, None)

        # 3 agents complete concurrently
        with ThreadPoolExecutor(max_workers=3) as executor:
            futures = [executor.submit(complete_task, f"agent-{i}", i) for i in range(3)]
            results = [f.result() for f in as_completed(futures)]

        # Verify correct attribution
        for agent_id, task_id, expected_result in results:
            if task_id:
                task = board.get(task_id)
                assert task.status == TaskStatus.COMPLETED
                assert task.result["agent_id"] == agent_id
                assert task.result["data"] == f"result-{agent_id}"

    def test_file_locking_prevents_race_conditions(self, tmp_path):
        """
        10 agents race for 1 task, verify single winner.

        Stress test for file locking correctness.
        """
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create only 1 task - high contention scenario
        board.post(Task(
            task_id="single-task",
            task_type=TaskType.CODE_ANALYSIS,
            description="Only one task available"
        ))

        winners: List[str] = []
        winners_lock = __import__('threading').Lock()

        def try_claim(agent_id: str) -> str:
            """Try to claim the single task."""
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                with winners_lock:
                    winners.append(agent_id)
                return agent_id
            return None

        # 10 agents race for 1 task
        with ThreadPoolExecutor(max_workers=10) as executor:
            futures = [executor.submit(try_claim, f"racer-{i}") for i in range(10)]
            _ = [f.result() for f in as_completed(futures)]

        # Exactly one winner
        assert len(winners) == 1, f"Expected 1 winner, got {len(winners)}: {winners}"

        # Task is claimed by the winner
        task = board.get("single-task")
        assert task.status == TaskStatus.CLAIMED
        assert task.claimed_by == winners[0]
