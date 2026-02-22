"""
Integration tests for swarm intelligence system.

Tests the full flow: map -> agents work -> reduce
"""

import pytest
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestSwarmIntegration:
    """End-to-end swarm intelligence tests."""

    def test_parallel_code_analysis(self, tmp_path):
        """Multiple agents analyze different modules in parallel."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create agents with different capabilities
        agents = [
            SwarmAgent(agent_id=f"agent-{i}", task_board=board)
            for i in range(3)
        ]

        # Map: split analysis into modules
        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze codebase modules",
            subtask_payloads=[
                {"module": "auth", "path": "src/auth/"},
                {"module": "api", "path": "src/api/"},
                {"module": "db", "path": "src/db/"}
            ]
        )

        # Agents claim and complete tasks
        for agent in agents:
            task = agent.claim_next_task()
            if task:
                result = {
                    "module": task.payload["module"],
                    "lines": 100,
                    "issues": [],
                    "score": 0.9
                }
                agent.complete_task(task, result)

        # Reduce: merge all results
        final = coord.reduce(parent_id, strategy="merge_all")
        assert final is not None
        assert "auth" in final["module"]
        assert "api" in final["module"]
        assert "db" in final["module"]

    def test_competitive_solution_exploration(self, tmp_path):
        """Agents compete to find best solution, best wins."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        agents = [
            SwarmAgent(agent_id=f"solver-{i}", task_board=board)
            for i in range(3)
        ]

        # Map: try different approaches with scores in the payload
        parent_id = coord.map(
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find optimal sorting",
            subtask_payloads=[
                {"approach": "quicksort", "expected_score": 0.7},
                {"approach": "mergesort", "expected_score": 0.95},
                {"approach": "heapsort", "expected_score": 0.6}
            ]
        )

        # Each agent claims a task and uses the score from payload
        for agent in agents:
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {
                    "approach": task.payload["approach"],
                    "score": task.payload["expected_score"]
                })

        # Reduce: pick best score - mergesort should win with 0.95
        best = coord.reduce(parent_id, strategy="best_score", score_key="score")
        assert best["approach"] == "mergesort"
        assert best["score"] == 0.95

    def test_distributed_review_voting(self, tmp_path):
        """Multiple reviewers vote on a decision."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 5 reviewers
        agents = [
            SwarmAgent(agent_id=f"reviewer-{i}", task_board=board)
            for i in range(5)
        ]

        # Map: review the same PR
        parent_id = coord.map(
            task_type=TaskType.DISTRIBUTED_REVIEW,
            description="Review PR #123",
            subtask_payloads=[{"pr": 123} for _ in range(5)]
        )

        # Reviewers vote (3 approve, 2 reject)
        votes = ["approve", "approve", "reject", "approve", "reject"]
        for i, agent in enumerate(agents):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {
                    "pr": 123,
                    "decision": votes[i]
                })

        # Reduce: majority vote
        result = coord.reduce(parent_id, strategy="majority_vote", vote_key="decision")
        assert result["decision"] == "approve"

    def test_work_distribution_is_balanced(self, tmp_path):
        """Work is distributed across available agents."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # 2 agents, 6 tasks
        agents = [
            SwarmAgent(agent_id=f"worker-{i}", task_board=board)
            for i in range(2)
        ]

        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search for patterns",
            subtask_payloads=[{"pattern": f"TODO-{i}"} for i in range(6)]
        )

        # Each agent claims up to 3 tasks
        completed_by = []
        for agent in agents:
            for _ in range(3):  # Each agent can do 3 tasks
                task = agent.claim_next_task()
                if task:
                    agent.complete_task(task, {"found": True})
                    completed_by.append(agent.agent_id)

        # Verify distribution
        assert len(completed_by) == 6
        worker0_count = completed_by.count("worker-0")
        worker1_count = completed_by.count("worker-1")
        assert abs(worker0_count - worker1_count) <= 1  # Balanced

    def test_progress_tracking(self, tmp_path):
        """Can track progress of MapReduce job."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze",
            subtask_payloads=[{"i": i} for i in range(4)]
        )

        # Initial progress
        progress = coord.get_progress(parent_id)
        assert progress["total"] == 4
        assert progress["completed"] == 0
        assert progress["pending"] == 4

        # Complete some tasks
        agent = SwarmAgent(agent_id="worker", task_board=board)
        for _ in range(2):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {"done": True})

        # Check progress
        progress = coord.get_progress(parent_id)
        assert progress["completed"] == 2
        assert progress["progress_pct"] == 50.0
