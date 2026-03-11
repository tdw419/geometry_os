# tests/test_daemon_executor_integration.py
from unittest.mock import MagicMock, patch

from systems.sisyphus.daemon import SisyphusDaemon, Task, TaskState


def test_full_executor_flow():
    """Test the complete flow: startup reset -> execute -> complete."""
    daemon = SisyphusDaemon()

    # Simulate a task in progress from previous run
    task1 = Task(number=1, name="Stuck Task", description="Was interrupted")
    task1.state = TaskState.IN_PROGRESS

    task2 = Task(number=2, name="New Task", description="Fresh task")
    task2.state = TaskState.PENDING

    tasks = [task1, task2]

    # Mock subprocess for pi
    with patch('subprocess.Popen') as mock_popen:
        mock_process = MagicMock()
        mock_process.stdout = iter(['Working...\n', 'Done!\n'])
        mock_process.kill.return_value = None
        mock_process.returncode = 0
        mock_popen.return_value = mock_process

        # Simulate startup reset (what daemon does on startup)
        for task in tasks:
            if task.state == TaskState.IN_PROGRESS:
                daemon.mark_task_state(task, TaskState.PENDING)

        # Both should be pending now
        assert task1.state == TaskState.PENDING, "Task 1 should be reset to PENDING"
        assert task2.state == TaskState.PENDING, "Task 2 should still be PENDING"

        # Run task 2 (simulating execution)
        daemon.run_task(task2)

        # Task 2 should complete
        assert task2.state == TaskState.COMPLETE, "Task 2 should have completed"
