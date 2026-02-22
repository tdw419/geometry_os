"""
Tests for scalability - proving the system handles 100+ tasks efficiently.

Tests verify distribution, performance, and memory usage at scale.
"""

import pytest
import time
import tracemalloc
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import List, Dict

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestScalability:
    """Test scalability with 100+ tasks."""

    def test_100_tasks_distributed_across_10_agents(self, tmp_path):
        """
        Verify reasonable distribution across agents.

        10 agents claim 100 tasks, verify:
        - All tasks claimed
        - All agents participated
        - No single agent dominates (> 20% of tasks)
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 100 tasks
        for i in range(100):
            board.post(Task(
                task_id=f"scale-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Scale test task {i}",
                priority=i
            ))

        worker_counts: Dict[str, int] = {}
        counts_lock = __import__('threading').Lock()

        def claim_multiple(agent_id: str, max_claims: int = 15) -> List[str]:
            """Agent claims up to max_claims tasks."""
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            claimed = []
            while len(claimed) < max_claims:
                task = agent.claim_next_task()
                if task:
                    claimed.append(task.task_id)
                    agent.complete_task(task, {"agent": agent_id})
                else:
                    break

            with counts_lock:
                worker_counts[agent_id] = len(claimed)
            return claimed

        # 10 agents compete for 100 tasks
        with ThreadPoolExecutor(max_workers=10) as executor:
            futures = [executor.submit(claim_multiple, f"agent-{i}") for i in range(10)]
            all_claimed = [task for f in as_completed(futures) for task in f.result()]

        # All 100 tasks claimed
        assert len(all_claimed) == 100, f"Expected 100 claimed, got {len(all_claimed)}"

        # Verify distribution
        counts = list(worker_counts.values())
        min_count = min(counts)
        max_count = max(counts)

        # All agents participated (each claimed at least 1)
        assert min_count >= 1, f"Some agents didn't get tasks: {counts}"

        # No single agent dominated (> 20% = 20 tasks)
        assert max_count <= 20, f"Agent dominated with {max_count} tasks: {counts}"

        # Reasonable spread (variance <= 10 is acceptable for concurrent systems)
        variance = max_count - min_count
        assert variance <= 10, f"Distribution variance too high: {variance} (counts={counts})"

    def test_1000_tasks_with_progress_tracking(self, tmp_path):
        """
        Verify progress_pct at 50% after 500 completions.

        Tests that the system can handle 1000 tasks and track progress.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 1000 tasks
        for i in range(1000):
            board.post(Task(
                task_id=f"progress-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Progress test task {i}"
            ))

        # Complete 500 tasks
        agent = SwarmAgent(agent_id="progress-agent", task_board=board)
        for _ in range(500):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {"done": True})

        # Calculate progress
        all_tasks = board.list_all()
        completed = sum(1 for t in all_tasks if t.status == TaskStatus.COMPLETED)
        progress_pct = (completed / 1000) * 100

        assert progress_pct == 50.0, f"Expected 50% progress, got {progress_pct}%"
        assert completed == 500, f"Expected 500 completed, got {completed}"

    def test_claim_latency_under_10ms(self, tmp_path):
        """
        Use perf_counter, assert avg < 10ms.

        Verify claim operations are fast enough for interactive use.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 100 tasks for timing tests
        for i in range(100):
            board.post(Task(
                task_id=f"latency-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Latency test task {i}"
            ))

        latencies = []
        agent = SwarmAgent(agent_id="latency-agent", task_board=board)

        # Measure claim latency for 100 operations
        for _ in range(100):
            start = time.perf_counter()
            task = agent.claim_next_task()
            elapsed_ms = (time.perf_counter() - start) * 1000

            if task:
                latencies.append(elapsed_ms)
                agent.complete_task(task, {})

        assert len(latencies) == 100, f"Expected 100 claims, got {len(latencies)}"

        avg_latency = sum(latencies) / len(latencies)
        assert avg_latency < 10, f"Average latency {avg_latency:.2f}ms exceeds 10ms threshold"

    def test_memory_usage_stays_bounded(self, tmp_path):
        """
        Use tracemalloc, assert growth < 10MB.

        Verify memory doesn't grow unboundedly with many tasks.
        """
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Start tracking memory
        tracemalloc.start()
        baseline = tracemalloc.get_traced_memory()[0]

        # Create 500 tasks
        for i in range(500):
            board.post(Task(
                task_id=f"memory-task-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Memory test task {i}" * 10  # Add some bulk
            ))

        # Check memory after creating tasks
        after_create = tracemalloc.get_traced_memory()[0]
        create_growth = (after_create - baseline) / (1024 * 1024)  # MB

        # Claim and complete all tasks
        agent = SwarmAgent(agent_id="memory-agent", task_board=board)
        while True:
            task = agent.claim_next_task()
            if not task:
                break
            agent.complete_task(task, {"result": "done"})

        # Check memory after processing
        after_complete = tracemalloc.get_traced_memory()[0]
        total_growth = (after_complete - baseline) / (1024 * 1024)  # MB

        tracemalloc.stop()

        # Memory growth should be bounded
        assert total_growth < 10, f"Memory grew by {total_growth:.2f}MB (baseline: {baseline/1024/1024:.2f}MB), exceeding 10MB limit"

        # Also verify create growth is reasonable
        assert create_growth < 10, f"Memory during creation grew by {create_growth:.2f}MB"
