"""
Test Visual Bridge agent request handling
"""
import pytest
import asyncio
import json


class TestAgentEndpoint:

    def test_agent_request_endpoint_exists(self):
        """Test that /agent/request endpoint is registered"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()
        # aiohttp routes are ResourceRoute objects, get resource path differently
        route_paths = []
        for route in bridge.app.router.routes():
            # Get the resource for this route
            resource = getattr(route, 'resource', None)
            if resource:
                # Get canonical path from resource
                path = getattr(resource, 'canonical', None)
                if path:
                    route_paths.append(path)
        assert '/agent/request' in route_paths

    def test_agent_request_queues_task(self):
        """Test that agent request creates task in queue"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        request_data = {
            'type': 'agent_request',
            'agent_type': 'content_intelligence',
            'payload': {'post_id': 1, 'action': 'auto_tag'},
            'request_id': 'test-123'
        }

        result = bridge.handle_agent_request(request_data)
        assert result['status'] == 'queued'
        assert 'task_id' in result

    def test_agent_status_endpoint(self):
        """Test /agent/status/{task_id} returns status"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        # First queue a task
        request_data = {
            'type': 'agent_request',
            'agent_type': 'evolution_publish',
            'payload': {'commit_hash': 'abc123'},
            'request_id': 'test-456'
        }
        result = bridge.handle_agent_request(request_data)
        task_id = result['task_id']

        # Then check status
        status = bridge.get_task_status(task_id)
        assert status['task_id'] == task_id
        assert status['status'] in ['queued', 'running', 'completed']

    def test_agent_request_rejects_unknown_agent_type(self):
        """Test that unknown agent types are rejected"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        request_data = {
            'type': 'agent_request',
            'agent_type': 'unknown_agent',
            'payload': {'test': 'data'},
            'request_id': 'test-789'
        }

        result = bridge.handle_agent_request(request_data)
        assert result['status'] == 'error'
        assert 'Unknown agent type' in result['message']

    def test_task_not_found(self):
        """Test that non-existent task returns error"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        status = bridge.get_task_status('non-existent-task-id')
        assert status['status'] == 'error'
        assert 'not found' in status['message'].lower()

    def test_agent_request_creates_unique_task_ids(self):
        """Test that multiple requests create unique task IDs"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        request_data = {
            'type': 'agent_request',
            'agent_type': 'content_intelligence',
            'payload': {'post_id': 1},
            'request_id': 'test-unique-1'
        }

        result1 = bridge.handle_agent_request(request_data)
        result2 = bridge.handle_agent_request(request_data)

        assert result1['task_id'] != result2['task_id']

    def test_plugin_analysis_agent_type(self):
        """Test that plugin_analysis agent type is accepted"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        request_data = {
            'type': 'agent_request',
            'agent_type': 'plugin_analysis',
            'payload': {'plugin_slug': 'hello-dolly'},
            'request_id': 'test-plugin-001'
        }

        result = bridge.handle_agent_request(request_data)
        assert result['status'] == 'queued'
        assert 'plugin_analysis' in result['task_id']

    def test_task_stored_in_queue(self):
        """Test that task is actually stored in the queue"""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()

        request_data = {
            'type': 'agent_request',
            'agent_type': 'content_intelligence',
            'payload': {'post_id': 42},
            'request_id': 'test-queue-001'
        }

        result = bridge.handle_agent_request(request_data)
        task_id = result['task_id']

        # Verify task is in the queue
        assert task_id in bridge.agent_task_queue
        stored_task = bridge.agent_task_queue[task_id]
        assert stored_task['agent_type'] == 'content_intelligence'
        assert stored_task['payload']['post_id'] == 42
        assert stored_task['status'] == 'queued'
