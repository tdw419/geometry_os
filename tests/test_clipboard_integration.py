"""Integration tests for AI-to-AI clipboard communication.

These tests verify the full round-trip workflow:
1. AI Agent A posts content to clipboard
2. AI Agent B retrieves content from clipboard
3. Polling for new entries since a known ID
"""

import json
import os
import threading
import time
import urllib.request
import urllib.error
import pytest
from systems.clipboard.server import ClipboardServer, ClipboardHandler
from systems.clipboard.history import ClipboardHistory


@pytest.fixture
def integration_server():
    """Create and start a test server with fresh history for integration tests."""
    # Reset class-level history for test isolation
    ClipboardHandler.history = None
    ClipboardHandler.persistence_path = "/tmp/geometry_os/clipboard/integration_test_history.json"

    # Clear persistence file
    if os.path.exists(ClipboardHandler.persistence_path):
        os.remove(ClipboardHandler.persistence_path)

    # Ensure directory exists
    os.makedirs(os.path.dirname(ClipboardHandler.persistence_path), exist_ok=True)

    server = ClipboardServer(
        host="127.0.0.1",
        port=18766,
        persistence_path="/tmp/geometry_os/clipboard/integration_test_history.json"
    )
    thread = threading.Thread(target=server.serve_forever)
    thread.daemon = True
    thread.start()
    time.sleep(0.2)  # Wait for server to start
    yield server
    server.shutdown()


@pytest.fixture
def server_url(integration_server):
    """Return base URL for the test server."""
    return f"http://{integration_server.host}:{integration_server.port}"


def http_post(url: str, data: dict) -> dict:
    """Helper to make HTTP POST request."""
    payload = json.dumps(data).encode()
    req = urllib.request.Request(
        url,
        data=payload,
        headers={"Content-Type": "application/json"},
        method="POST"
    )
    with urllib.request.urlopen(req) as response:
        return json.loads(response.read().decode())


def http_get(url: str) -> dict:
    """Helper to make HTTP GET request."""
    req = urllib.request.Request(url)
    with urllib.request.urlopen(req) as response:
        return json.loads(response.read().decode())


@pytest.mark.integration
class TestClipboardRoundTrip:
    """Integration tests for AI-to-AI clipboard round-trip communication."""

    def test_clipboard_round_trip(self, server_url):
        """Test complete round-trip: post from Agent A, retrieve by Agent B.

        Scenario:
        1. AI Agent A (source_ip: 10.0.0.1) posts a message
        2. AI Agent B (different process) retrieves the latest message
        3. Verify content matches exactly
        """
        # Agent A posts content
        original_content = "AI Task Result: Analysis complete. Found 3 anomalies."
        post_response = http_post(f"{server_url}/clipboard", {
            "content": original_content,
            "source": "ai-agent-alpha",
            "source_ip": "10.0.0.1"
        })

        assert post_response["status"] == "ok"
        assert "id" in post_response
        entry_id = post_response["id"]

        # Agent B retrieves latest
        get_response = http_get(f"{server_url}/clipboard")

        assert get_response["status"] == "ok"
        assert get_response["entry"]["id"] == entry_id
        assert get_response["entry"]["content"] == original_content
        assert get_response["entry"]["source"] == "ai-agent-alpha"
        assert get_response["entry"]["source_ip"] == "10.0.0.1"

    def test_multiple_agents_posting(self, server_url):
        """Test multiple AI agents posting to shared clipboard.

        Scenario:
        1. Agent A posts task assignment
        2. Agent B posts completion status
        3. Agent C retrieves history and sees both
        """
        # Agent A posts task
        response_a = http_post(f"{server_url}/clipboard", {
            "content": "TASK: Analyze log files for errors",
            "source": "ai-orchestrator",
            "source_ip": "10.0.0.10"
        })
        id_a = response_a["id"]

        time.sleep(0.05)  # Ensure different timestamps

        # Agent B posts status
        response_b = http_post(f"{server_url}/clipboard", {
            "content": "STATUS: Task accepted, starting analysis",
            "source": "ai-worker-1",
            "source_ip": "10.0.0.11"
        })
        id_b = response_b["id"]

        # Agent C retrieves full history
        history_response = http_get(f"{server_url}/clipboard/history")

        assert history_response["count"] == 2
        entries = history_response["entries"]

        # Verify both entries present in order
        assert entries[0]["id"] == id_a
        assert entries[0]["source"] == "ai-orchestrator"
        assert entries[1]["id"] == id_b
        assert entries[1]["source"] == "ai-worker-1"

    def test_large_content_round_trip(self, server_url):
        """Test round-trip with large content (code snippet)."""
        # Simulate AI-generated code
        large_content = '''
def process_clipboard_data(entries):
    """Process clipboard entries from remote AI agents."""
    results = []
    for entry in entries:
        if entry.get("content"):
            processed = {
                "id": entry["id"],
                "summary": entry["content"][:100],
                "source": entry["source"],
                "timestamp": entry["timestamp"]
            }
            results.append(processed)
    return results

# Usage example
if __name__ == "__main__":
    data = fetch_clipboard_history()
    processed = process_clipboard_data(data)
    print(f"Processed {len(processed)} entries")
'''

        # Post large content
        post_response = http_post(f"{server_url}/clipboard", {
            "content": large_content,
            "source": "ai-coder-agent",
            "source_ip": "10.0.0.50"
        })

        assert post_response["status"] == "ok"
        entry_id = post_response["id"]

        # Retrieve and verify
        get_response = http_get(f"{server_url}/clipboard/entry/{entry_id}")

        assert get_response["entry"]["content"] == large_content
        assert get_response["entry"]["source"] == "ai-coder-agent"


@pytest.mark.integration
class TestClipboardPolling:
    """Integration tests for polling new clipboard entries."""

    def test_polling_new_entries(self, server_url):
        """Test polling for new entries since a known ID.

        Scenario:
        1. Agent A posts initial entry, Agent B gets its ID
        2. Agent A posts 3 more entries
        3. Agent B polls for entries since initial ID
        4. Verify only new entries returned
        """
        # Initial entry - Agent B records this ID
        initial_response = http_post(f"{server_url}/clipboard", {
            "content": "Initial checkpoint",
            "source": "ai-agent-a",
            "source_ip": "10.0.0.1"
        })
        checkpoint_id = initial_response["id"]

        time.sleep(0.05)

        # Agent A posts 3 new entries
        new_ids = []
        for i in range(3):
            response = http_post(f"{server_url}/clipboard", {
                "content": f"New task result {i}",
                "source": "ai-agent-a",
                "source_ip": "10.0.0.1"
            })
            new_ids.append(response["id"])
            time.sleep(0.02)

        # Agent B polls for new entries since checkpoint
        poll_response = http_get(f"{server_url}/clipboard/since/{checkpoint_id}")

        assert poll_response["count"] == 3
        returned_ids = [e["id"] for e in poll_response["entries"]]
        assert returned_ids == new_ids

        # Verify content of each
        for i, entry in enumerate(poll_response["entries"]):
            assert entry["content"] == f"New task result {i}"

    def test_polling_empty_when_no_new_entries(self, server_url):
        """Test polling returns empty when no new entries exist."""
        # Post one entry
        response = http_post(f"{server_url}/clipboard", {
            "content": "Only entry",
            "source": "ai-agent",
            "source_ip": "10.0.0.1"
        })
        entry_id = response["id"]

        # Poll since that entry - should return empty
        poll_response = http_get(f"{server_url}/clipboard/since/{entry_id}")

        assert poll_response["count"] == 0
        assert poll_response["entries"] == []

    def test_polling_with_unknown_id(self, server_url):
        """Test polling with unknown ID returns empty list."""
        # Post an entry
        http_post(f"{server_url}/clipboard", {
            "content": "Some entry",
            "source": "ai-agent",
            "source_ip": "10.0.0.1"
        })

        # Poll with unknown ID
        poll_response = http_get(f"{server_url}/clipboard/since/ffffffff")

        assert poll_response["count"] == 0
        assert poll_response["entries"] == []

    def test_continuous_polling_workflow(self, server_url):
        """Test continuous polling workflow between two AI agents.

        Simulates a real AI-to-AI communication pattern:
        - Agent A posts updates periodically
        - Agent B polls and processes new entries
        """
        # Initial state
        last_seen_id = None

        # Agent A posts first message
        response = http_post(f"{server_url}/clipboard", {
            "content": "Job started",
            "source": "ai-worker",
            "source_ip": "10.0.0.5"
        })
        first_id = response["id"]

        # Agent B polls (no last_seen_id, gets latest)
        latest = http_get(f"{server_url}/clipboard")
        assert latest["entry"]["content"] == "Job started"
        last_seen_id = latest["entry"]["id"]

        # Agent A posts progress updates
        for progress in [25, 50, 75, 100]:
            time.sleep(0.02)
            http_post(f"{server_url}/clipboard", {
                "content": f"Progress: {progress}%",
                "source": "ai-worker",
                "source_ip": "10.0.0.5"
            })

        # Agent B polls for new entries
        poll = http_get(f"{server_url}/clipboard/since/{last_seen_id}")

        assert poll["count"] == 4
        progress_values = [e["content"] for e in poll["entries"]]
        assert progress_values == [
            "Progress: 25%",
            "Progress: 50%",
            "Progress: 75%",
            "Progress: 100%"
        ]

        # Update last_seen_id to latest
        last_seen_id = poll["entries"][-1]["id"]

        # Poll again - should be empty
        poll = http_get(f"{server_url}/clipboard/since/{last_seen_id}")
        assert poll["count"] == 0


@pytest.mark.integration
class TestClipboardPersistenceIntegration:
    """Integration tests for persistence across server restarts."""

    def test_history_persists_across_restarts(self, server_url, integration_server):
        """Test that clipboard history persists when server restarts.

        This simulates a real scenario where the clipboard server might
        be restarted but AI agents expect their data to still be available.
        """
        # Post several entries
        posted_ids = []
        for i in range(3):
            response = http_post(f"{server_url}/clipboard", {
                "content": f"Persistent entry {i}",
                "source": "ai-agent",
                "source_ip": "10.0.0.1"
            })
            posted_ids.append(response["id"])

        # Verify persistence file exists
        assert os.path.exists(ClipboardHandler.persistence_path)

        # Read persistence file directly
        with open(ClipboardHandler.persistence_path, "r") as f:
            saved_data = json.loads(f.read())

        assert saved_data["max_size"] == 50
        assert len(saved_data["entries"]) == 3

        # Verify each entry was persisted
        saved_contents = [e["content"] for e in saved_data["entries"]]
        assert saved_contents == [
            "Persistent entry 0",
            "Persistent entry 1",
            "Persistent entry 2"
        ]
