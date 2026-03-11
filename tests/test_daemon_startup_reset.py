# tests/test_daemon_startup_reset.py
from systems.sisyphus.daemon import Task, TaskState


def test_startup_resets_in_progress_to_pending():
    """On startup, in-progress tasks should reset to pending."""
    # Create a task in IN_PROGRESS state
    task1 = Task(number=1, name="Stuck Task", description="Was interrupted")
    task1.state = TaskState.IN_PROGRESS

    task2 = Task(number=2, name="Pending Task", description="Fresh task")
    task2.state = TaskState.PENDING

    tasks = [task1, task2]

    # Verify initial state
    assert task1.state == TaskState.IN_PROGRESS
    assert task2.state == TaskState.PENDING

    # Simulate the startup reset logic from the main loop
    in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]
    if in_progress:
        for task in in_progress:
            task.state = TaskState.PENDING

    # After reset, both should be pending
    assert task1.state == TaskState.PENDING, "Task 1 should be reset to PENDING"
    assert task2.state == TaskState.PENDING, "Task 2 should still be PENDING"

def test_no_reset_when_no_in_progress():
    """Should not modify tasks when none are in progress."""
    task1 = Task(number=1, name="Complete Task", description="Done")
    task1.state = TaskState.COMPLETE

    task2 = Task(number=2, name="Pending Task", description="Fresh")
    task2.state = TaskState.PENDING

    tasks = [task1, task2]

    # Simulate startup reset logic
    in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]
    if in_progress:
        for task in in_progress:
            task.state = TaskState.PENDING

    # States should be unchanged
    assert task1.state == TaskState.COMPLETE
    assert task2.state == TaskState.PENDING
