# tests/test_daemon_timeout.py
import subprocess
from unittest.mock import MagicMock, patch

from systems.sisyphus.daemon import SisyphusDaemon, Task, TaskState


def test_task_timeout_kills_long_running_process():
    """Tasks running longer than 300s should be killed and marked failed."""
    daemon = SisyphusDaemon()
    task = Task(number=1, name="Timeout Test", description="Test task that runs too long")

    # Mock subprocess that runs forever (never returns from wait)
    with patch('subprocess.Popen') as mock_popen:
        mock_process = MagicMock()
        mock_process.stdout = iter(['line 1\n', 'line 2\n', 'line 3\n'])

        # Make wait() raise TimeoutExpired
        mock_process.wait.side_effect = subprocess.TimeoutExpired(cmd=['pi'], timeout=300)
        mock_process.kill.return_value = None
        mock_process.returncode = -9  # Killed
        mock_popen.return_value = mock_process

        # Run the task (should timeout and fail)
        daemon.run_task(task)

        # Task should be marked FAILED due to timeout
        assert task.state == TaskState.FAILED, f"Expected FAILED, got {task.state}"

        # Kill should have been called
        mock_process.kill.assert_called_once()


def test_task_completes_normally_within_timeout():
    """Tasks that complete within timeout should succeed."""
    daemon = SisyphusDaemon()
    task = Task(number=1, name="Normal Task", description="Test task that completes normally")

    # Mock subprocess that completes quickly
    with patch('subprocess.Popen') as mock_popen:
        mock_process = MagicMock()
        mock_process.stdout = iter(['Working...\n', 'Done!\n'])
        mock_process.wait.return_value = None  # Completes normally
        mock_process.returncode = 0  # Success
        mock_popen.return_value = mock_process

        # Run the task
        daemon.run_task(task)

        # Task should be marked COMPLETE
        assert task.state == TaskState.COMPLETE, f"Expected COMPLETE, got {task.state}"
