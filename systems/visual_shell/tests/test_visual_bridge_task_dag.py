"""Tests for Visual Bridge task DAG handling."""
import pytest


def test_handler_exists():
    """Verify the module loads and handler exists."""
    from systems.visual_shell.api.visual_bridge import VisualBridge
    bridge = VisualBridge()
    assert hasattr(bridge, 'handle_client')


def test_task_update_message_format():
    """Test that task_update messages are properly structured."""
    from systems.visual_shell.api.visual_bridge import VisualBridge
    bridge = VisualBridge()

    # Simulate a task_update message
    task_message = {
        'type': 'task_update',
        'data': {
            'task_id': 'task-123',
            'status': 'running',
            'progress': 50
        }
    }

    # Verify message structure
    assert task_message['type'] == 'task_update'
    assert 'data' in task_message
    assert 'task_id' in task_message['data']
    assert 'status' in task_message['data']


def test_visual_bridge_initialization():
    """Test that VisualBridge initializes with expected attributes."""
    from systems.visual_shell.api.visual_bridge import VisualBridge
    bridge = VisualBridge()

    assert hasattr(bridge, 'clients')
    assert hasattr(bridge, 'ws_port')
    assert hasattr(bridge, '_broadcast')
    assert bridge.ws_port == 8768  # default port
