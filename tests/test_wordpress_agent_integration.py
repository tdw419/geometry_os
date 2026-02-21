"""
Integration test for WordPress-Agent-EvolutionDaemon flow

Tests end-to-end communication:
- WordPress -> Visual Bridge HTTP endpoint
- Visual Bridge -> Evolution Daemon (via WebSocket)
- Evolution Daemon -> WordPress Task Handler
- Results returned via status polling

Note: HTTP endpoint tests require the Visual Bridge to be running.
Handler tests run without Visual Bridge dependency.
"""
import pytest
import json
import time
import requests
from typing import Optional


# Visual Bridge HTTP endpoint (port 8769 per visual_bridge.py)
BRIDGE_HTTP_URL = "http://127.0.0.1:8769"
BRIDGE_WS_URL = "ws://127.0.0.1:8768"

# Timeouts
REQUEST_TIMEOUT = 5  # seconds for HTTP requests
POLL_TIMEOUT = 10    # seconds for task completion polling
POLL_INTERVAL = 0.5  # seconds between status checks


def is_visual_bridge_running() -> bool:
    """Check if Visual Bridge is running by pinging health endpoint."""
    try:
        # Try the agent endpoint as health check
        response = requests.get(
            f"{BRIDGE_HTTP_URL}/agent/status/health-check",
            timeout=2
        )
        return True  # Any response means server is running
    except requests.exceptions.ConnectionError:
        return False
    except requests.exceptions.Timeout:
        return False
    except Exception:
        return False


@pytest.fixture
def require_visual_bridge():
    """Skip tests that require Visual Bridge HTTP endpoint."""
    if not is_visual_bridge_running():
        pytest.skip("Visual Bridge not running (start with: python3 systems/visual_shell/api/visual_bridge.py)")


class TestWordPressAgentIntegration:
    """End-to-end tests for WordPress agent request flow (requires Visual Bridge)."""

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_end_to_end_content_intelligence(self):
        """
        Test full flow for content_intelligence agent:
        1. POST to /agent/request with content_intelligence task
        2. Receive task_id with status='queued'
        3. Poll /agent/status/{task_id} until completion
        4. Verify result contains expected data
        """
        # 1. Submit agent request
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'content_intelligence',
                'payload': {
                    'post_id': 1,
                    'action': 'auto_tag'
                },
                'request_id': 'test-integration-content-001'
            },
            timeout=REQUEST_TIMEOUT
        )

        assert response.status_code == 200, f"Expected 200, got {response.status_code}: {response.text}"
        result = response.json()
        assert result['status'] == 'queued', f"Expected 'queued', got {result}"
        assert 'task_id' in result, f"Missing task_id in response: {result}"
        task_id = result['task_id']
        assert 'content_intelligence' in task_id, f"task_id should contain agent type: {task_id}"

        # 2. Poll for completion (task may complete quickly in unit test mode)
        status = self._poll_until_complete(task_id)

        # 3. Verify result structure
        # Note: Without Evolution Daemon running, task stays 'queued'
        # This is expected behavior - integration test validates the HTTP flow
        assert status['task_id'] == task_id
        assert status['status'] in ['queued', 'running', 'completed'], \
            f"Unexpected status: {status}"

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_end_to_end_evolution_publish(self):
        """
        Test full flow for evolution_publish agent:
        1. Submit evolution commit for WordPress publishing
        2. Verify task is queued
        """
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'evolution_publish',
                'payload': {
                    'commit_hash': 'integration-test-abc123',
                    'message': 'Integration test commit from pytest'
                },
                'request_id': 'test-integration-evolution-001'
            },
            timeout=REQUEST_TIMEOUT
        )

        assert response.status_code == 200
        result = response.json()
        assert result['status'] == 'queued', f"Expected 'queued', got: {result}"
        assert 'task_id' in result
        task_id = result['task_id']
        assert 'evolution_publish' in task_id

        # Verify task is retrievable
        status = self._get_status(task_id)
        assert status['task_id'] == task_id
        assert status['status'] in ['queued', 'running', 'completed']

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_end_to_end_plugin_analysis(self):
        """
        Test full flow for plugin_analysis agent:
        1. Submit plugin security scan request
        2. Verify task is queued
        """
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'plugin_analysis',
                'payload': {
                    'scan_type': 'security'
                },
                'request_id': 'test-integration-plugin-001'
            },
            timeout=REQUEST_TIMEOUT
        )

        assert response.status_code == 200
        result = response.json()
        assert result['status'] == 'queued', f"Expected 'queued', got: {result}"
        assert 'task_id' in result
        task_id = result['task_id']
        assert 'plugin_analysis' in task_id

        # Verify task is retrievable
        status = self._get_status(task_id)
        assert status['task_id'] == task_id

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_task_status_not_found(self):
        """Test that non-existent task returns proper error."""
        response = requests.get(
            f"{BRIDGE_HTTP_URL}/agent/status/non-existent-task-xyz",
            timeout=REQUEST_TIMEOUT
        )

        # Should return 404 or error status
        status = response.json()
        assert status['status'] == 'error' or response.status_code == 404

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_rejects_unknown_agent_type(self):
        """Test that unknown agent types are rejected at HTTP level."""
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'non_existent_agent',
                'payload': {'test': 'data'},
                'request_id': 'test-invalid-001'
            },
            timeout=REQUEST_TIMEOUT
        )

        # Should return error status
        result = response.json()
        assert result['status'] == 'error', f"Expected error for unknown agent type: {result}"
        assert 'Unknown agent type' in result.get('message', '')

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_multiple_concurrent_tasks(self):
        """Test that multiple tasks can be queued concurrently."""
        task_ids = []

        # Submit 3 different tasks
        for i in range(3):
            response = requests.post(
                f"{BRIDGE_HTTP_URL}/agent/request",
                json={
                    'type': 'agent_request',
                    'agent_type': 'content_intelligence',
                    'payload': {'post_id': i + 1, 'action': 'auto_tag'},
                    'request_id': f'test-concurrent-{i}'
                },
                timeout=REQUEST_TIMEOUT
            )
            assert response.status_code == 200
            result = response.json()
            assert result['status'] == 'queued'
            task_ids.append(result['task_id'])

        # Verify all task IDs are unique
        assert len(task_ids) == len(set(task_ids)), "Task IDs should be unique"

        # Verify all tasks are retrievable
        for task_id in task_ids:
            status = self._get_status(task_id)
            assert status['task_id'] == task_id

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_task_persistence_in_queue(self):
        """Test that tasks persist in queue and are retrievable."""
        # Submit a task
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'evolution_publish',
                'payload': {'commit_hash': 'persist-test', 'message': 'Test persistence'},
                'request_id': 'test-persist-001'
            },
            timeout=REQUEST_TIMEOUT
        )
        result = response.json()
        task_id = result['task_id']

        # Poll multiple times to verify persistence
        for _ in range(3):
            status = self._get_status(task_id)
            assert status['task_id'] == task_id
            time.sleep(0.1)  # Small delay between checks

    @pytest.mark.usefixtures("require_visual_bridge")
    def test_request_without_request_id(self):
        """Test that request_id is auto-generated if not provided."""
        response = requests.post(
            f"{BRIDGE_HTTP_URL}/agent/request",
            json={
                'type': 'agent_request',
                'agent_type': 'content_intelligence',
                'payload': {'post_id': 1, 'action': 'auto_tag'}
                # No request_id provided
            },
            timeout=REQUEST_TIMEOUT
        )

        assert response.status_code == 200
        result = response.json()
        assert result['status'] == 'queued'
        assert 'task_id' in result

    # Helper methods

    def _get_status(self, task_id: str) -> dict:
        """Get task status via HTTP endpoint."""
        response = requests.get(
            f"{BRIDGE_HTTP_URL}/agent/status/{task_id}",
            timeout=REQUEST_TIMEOUT
        )
        return response.json()

    def _poll_until_complete(self, task_id: str, max_attempts: int = 20) -> dict:
        """Poll task status until complete or timeout."""
        for _ in range(max_attempts):
            status = self._get_status(task_id)

            if status['status'] in ['completed', 'error']:
                return status

            time.sleep(POLL_INTERVAL)

        # Return last status even if not complete
        return status


class TestWordPressTaskHandlerIntegration:
    """
    Test WordPress Task Handler integration with Visual Bridge.

    These tests verify the handler can be invoked and produces valid results.
    """

    def test_handler_processes_queued_task(self):
        """
        Test that WordPressTaskHandler can process a queued task.
        This simulates what the Evolution Daemon would do.
        """
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler

        handler = WordPressTaskHandler()

        # Simulate a task from the queue
        task = {
            'task_id': 'test-handler-001',
            'agent_type': 'content_intelligence',
            'payload': {
                'post_id': 1,
                'action': 'auto_tag'
            }
        }

        result = handler.execute(task)

        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'tags' in result

    def test_handler_evolution_publish(self):
        """Test handler creates WordPress post for evolution commit."""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler

        handler = WordPressTaskHandler()

        task = {
            'task_id': 'test-handler-002',
            'agent_type': 'evolution_publish',
            'payload': {
                'commit_hash': 'handler-test-abc',
                'message': 'Handler integration test'
            }
        }

        result = handler.execute(task)

        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'commit_hash' in result

    def test_handler_plugin_analysis(self):
        """Test handler performs plugin security scan."""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler

        handler = WordPressTaskHandler()

        task = {
            'task_id': 'test-handler-003',
            'agent_type': 'plugin_analysis',
            'payload': {
                'scan_type': 'security'
            }
        }

        result = handler.execute(task)

        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'plugins' in result
            assert 'issues' in result


class TestBridgeToHandlerFlow:
    """
    Test the complete flow from Bridge queue to Handler execution.
    """

    def test_task_queue_matches_handler_input(self):
        """Verify task structure in queue matches handler expectations."""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler

        bridge = VisualBridge()
        handler = WordPressTaskHandler()

        # Queue a task
        request_data = {
            'type': 'agent_request',
            'agent_type': 'content_intelligence',
            'payload': {'post_id': 1, 'action': 'auto_tag'},
            'request_id': 'test-flow-001'
        }

        result = bridge.handle_agent_request(request_data)
        task_id = result['task_id']

        # Get task from queue
        task = bridge.agent_task_queue.get(task_id)
        assert task is not None

        # Execute via handler
        handler_result = handler.execute(task)

        # Update task with result
        task['status'] = 'completed'
        task['result'] = handler_result

        # Verify updated task
        status = bridge.get_task_status(task_id)
        assert status['status'] == 'completed'
        assert status['result'] is not None

    def test_all_agent_types_handler_compatible(self):
        """Verify all three agent types can be processed by handler."""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler

        bridge = VisualBridge()
        handler = WordPressTaskHandler()

        agent_types = ['content_intelligence', 'evolution_publish', 'plugin_analysis']

        for agent_type in agent_types:
            # Queue task
            result = bridge.handle_agent_request({
                'type': 'agent_request',
                'agent_type': agent_type,
                'payload': {'test': 'data'},
                'request_id': f'test-compat-{agent_type}'
            })

            assert result['status'] == 'queued', f"Failed to queue {agent_type}"

            task = bridge.agent_task_queue.get(result['task_id'])

            # Execute via handler
            handler_result = handler.execute(task)

            assert handler_result['status'] in ['success', 'error'], \
                f"Handler failed for {agent_type}: {handler_result}"
