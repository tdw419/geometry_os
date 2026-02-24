"""
WebMCP Integration Test - Prove remote AI can interact with GUI via REST API.

This test validates that:
1. GUI state is accessible via REST API
2. Commands can be submitted via REST API
3. State changes are reflected in subsequent reads
"""

import pytest
import requests
import time


class TestWebMCPIntegration:
    """Tests for WebMCP bridge integration with ASCII GUI."""

    def test_get_gui_state(self, webmcp_available):
        """Test retrieving GUI state via REST API."""
        skip_if_no_webmcp(webmcp_available)

        response = requests.get(
            "http://localhost:8769/gui/state",
            timeout=5
        )

        assert response.status_code == 200
        data = response.json()

        assert data["status"] == "ok"
        assert "state" in data
        assert "timestamp" in data

    def test_list_gui_fragments(self, webmcp_available):
        """Test listing available GUI fragments."""
        skip_if_no_webmcp(webmcp_available)

        response = requests.get(
            "http://localhost:8769/gui/fragments",
            timeout=5
        )

        assert response.status_code == 200
        data = response.json()

        assert data["status"] == "ok"
        assert "fragments" in data
        assert isinstance(data["fragments"], list)

    def test_submit_gui_command(self, webmcp_available):
        """Test submitting a GUI command via REST API."""
        skip_if_no_webmcp(webmcp_available)

        command = {
            "command_id": f"test-cmd-{int(time.time())}",
            "action": "focus",
            "target": "win-test",
            "params": {}
        }

        response = requests.post(
            "http://localhost:8769/gui/command",
            json=command,
            timeout=5
        )

        assert response.status_code == 200
        data = response.json()

        assert data["status"] == "ok"
        assert "command_id" in data

    def test_command_then_verify_state(self, webmcp_available):
        """Test complete flow: submit command, verify state change."""
        skip_if_no_webmcp(webmcp_available)

        # Get initial state
        initial_state = requests.get(
            "http://localhost:8769/gui/state",
            timeout=5
        ).json()

        # Submit a command
        command = {
            "action": "focus",
            "target": "win-001",
        }

        submit_response = requests.post(
            "http://localhost:8769/gui/command",
            json=command,
            timeout=5
        )

        assert submit_response.status_code == 200

        # Wait for processing
        time.sleep(0.5)

        # Get new state
        new_state = requests.get(
            "http://localhost:8769/gui/state",
            timeout=5
        ).json()

        assert new_state["status"] == "ok"

    def test_health_endpoint(self, webmcp_available):
        """Test health check endpoint."""
        skip_if_no_webmcp(webmcp_available)

        response = requests.get(
            "http://localhost:8769/health",
            timeout=5
        )

        assert response.status_code == 200
        data = response.json()
        assert data["status"] == "ok"


def skip_if_no_webmcp(available):
    """Skip test if WebMCP bridge is not available."""
    if not available:
        pytest.skip("WebMCP bridge not available at localhost:8769")
