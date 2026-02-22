"""
Scalability tests - prove the system handles load efficiently.
"""

import pytest
import time
import tracemalloc
import uuid
from pathlib import Path

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestScalability:
    """Tests proving scalability."""

    def test_100_tasks_distributed_across_10_agents(self, tmp_path):
        """100 tasks distributed across 10 agents with round-robin claiming."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 100 tasks via map
        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search tasks",
            subtask_payloads=[{"index": i, "query": f"pattern-{i}"} for i in range(100)]
        )

        # 10 agents claim in round-robin fashion (simulates parallel competition)
        agents = [SwarmAgent(agent_id=f"agent-{i}", task_board=board) for i in range(10)]
        completed_by = {f"agent-{i}": 0 for i in range(10)}

        # Round-robin: each agent tries to claim one task, repeat until done
        for _ in range(15):  # Max 15 rounds
            for agent in agents:
                task = agent.claim_next_task()
                if task:
                    agent.complete_task(task, {"found": True})
                    completed_by[agent.agent_id] += 1

        total = sum(completed_by.values())
        assert total == 100

        # Verify all agents got some work (round-robin ensures distribution)
        for agent_id, count in completed_by.items():
            assert count > 0, f"{agent_id} got no tasks"

    def test_1000_tasks_with_progress_tracking(self, tmp_path):
        """1000 tasks with progress tracking stays efficient."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 1000 tasks
        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Many tasks",
            subtask_payloads=[{"i": i} for i in range(1000)]
        )

        # Check initial progress
        progress = coord.get_progress(parent_id)
        assert progress["total"] == 1000
        assert progress["completed"] == 0

        # Complete half
        agent = SwarmAgent(agent_id="bulk-agent", task_board=board)
        for _ in range(500):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {"done": True})

        progress = coord.get_progress(parent_id)
        assert progress["completed"] == 500
        assert progress["progress_pct"] == 50.0

    def test_claim_latency_under_10ms(self, tmp_path):
        """Task claim latency is under 10ms for 100 tasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 100 tasks
        for i in range(100):
            task = Task(
                task_id=f"lat-{i}-{uuid.uuid4().hex[:8]}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={}
            )
            board.post(task)

        agent = SwarmAgent(agent_id="latency-test", task_board=board)

        latencies = []
        for _ in range(50):
            start = time.perf_counter()
            task = agent.claim_next_task()
            elapsed = time.perf_counter() - start

            if task:
                latencies.append(elapsed * 1000)  # Convert to ms
                agent.complete_task(task, {"done": True})

        avg_latency = sum(latencies) / len(latencies)
        assert avg_latency < 10, f"Average claim latency {avg_latency:.2f}ms exceeds 10ms"

    def test_memory_usage_stays_bounded(self, tmp_path):
        """Memory usage stays bounded with many tasks."""
        tracemalloc.start()
        baseline = tracemalloc.get_traced_memory()[0]

        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 500 tasks
        for i in range(500):
            task = Task(
                task_id=f"mem-{i}-{uuid.uuid4().hex[:8]}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={"data": "x" * 100}  # Some payload
            )
            board.post(task)

        peak = tracemalloc.get_traced_memory()[1]
        tracemalloc.stop()

        # Memory growth should be under 10MB for 500 tasks
        growth = peak - baseline
        assert growth < 10 * 1024 * 1024, f"Memory growth {growth / 1024 / 1024:.1f}MB exceeds 10MB"
