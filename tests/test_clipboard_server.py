"""Tests for Clipboard HTTP Server - TDD approach."""

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
def server():
    """Create and start a test server with fresh history."""
    # Reset class-level history for test isolation
    ClipboardHandler.history = None
    ClipboardHandler.persistence_path = "/tmp/geometry_os/clipboard/test_history.json"

    # Clear persistence file
    if os.path.exists(ClipboardHandler.persistence_path):
        os.remove(ClipboardHandler.persistence_path)

    server = ClipboardServer(
        host="127.0.0.1",
        port=18765,
        persistence_path="/tmp/geometry_os/clipboard/test_history.json"
    )
    thread = threading.Thread(target=server.serve_forever)
    thread.daemon = True
    thread.start()
    time.sleep(0.2)  # Wait for server to start
    yield server
    server.shutdown()


@pytest.fixture
def server_url(server):
    """Return base URL for the test server."""
    return f"http://{server.host}:{server.port}"


class TestClipboardServerEndpoints:
    """Tests for HTTP clipboard server endpoints."""

    def test_get_clipboard_empty(self, server_url):
        """Test GET /clipboard when history is empty."""
        req = urllib.request.Request(f"{server_url}/clipboard")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert data["status"] == "empty"
            assert data["entry"] is None

    def test_post_clipboard(self, server_url):
        """Test POST /clipboard to add an entry."""
        payload = json.dumps({
            "content": "test content",
            "source": "test-host",
            "source_ip": "192.168.1.100"
        }).encode()

        req = urllib.request.Request(
            f"{server_url}/clipboard",
            data=payload,
            headers={"Content-Type": "application/json"},
            method="POST"
        )
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert data["status"] == "ok"
            assert "id" in data
            assert data["entry"]["content"] == "test content"

    def test_get_history(self, server_url):
        """Test GET /clipboard/history returns all entries."""
        # Add a few entries
        for i in range(3):
            payload = json.dumps({
                "content": f"content {i}",
                "source": f"host-{i}",
                "source_ip": "127.0.0.1"
            }).encode()
            req = urllib.request.Request(
                f"{server_url}/clipboard",
                data=payload,
                headers={"Content-Type": "application/json"},
                method="POST"
            )
            urllib.request.urlopen(req)

        # Get history
        req = urllib.request.Request(f"{server_url}/clipboard/history")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert len(data["entries"]) == 3
            assert data["entries"][0]["content"] == "content 0"
            assert data["entries"][2]["content"] == "content 2"

    def test_get_history_limit(self, server_url):
        """Test GET /clipboard/history/N returns last N entries."""
        # Add 5 entries
        for i in range(5):
            payload = json.dumps({
                "content": f"entry-{i}",
                "source": "host",
                "source_ip": "127.0.0.1"
            }).encode()
            req = urllib.request.Request(
                f"{server_url}/clipboard",
                data=payload,
                headers={"Content-Type": "application/json"},
                method="POST"
            )
            urllib.request.urlopen(req)

        # Get last 3 entries
        req = urllib.request.Request(f"{server_url}/clipboard/history/3")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert len(data["entries"]) == 3
            # Should be entries 2, 3, 4
            assert data["entries"][0]["content"] == "entry-2"
            assert data["entries"][2]["content"] == "entry-4"

    def test_get_since_id(self, server_url):
        """Test GET /clipboard/since/<id> returns entries after that ID."""
        # Add 3 entries
        ids = []
        for i in range(3):
            payload = json.dumps({
                "content": f"since-test-{i}",
                "source": "host",
                "source_ip": "127.0.0.1"
            }).encode()
            req = urllib.request.Request(
                f"{server_url}/clipboard",
                data=payload,
                headers={"Content-Type": "application/json"},
                method="POST"
            )
            with urllib.request.urlopen(req) as resp:
                data = json.loads(resp.read().decode())
                ids.append(data["id"])

        time.sleep(0.05)  # Ensure timestamps differ

        # Get entries since first entry
        req = urllib.request.Request(f"{server_url}/clipboard/since/{ids[0]}")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            # Should return entries 1 and 2
            assert len(data["entries"]) == 2
            assert data["entries"][0]["content"] == "since-test-1"

    def test_get_entry_by_id(self, server_url):
        """Test GET /clipboard/entry/<id> returns specific entry."""
        # Add an entry
        payload = json.dumps({
            "content": "specific entry",
            "source": "host",
            "source_ip": "127.0.0.1"
        }).encode()
        req = urllib.request.Request(
            f"{server_url}/clipboard",
            data=payload,
            headers={"Content-Type": "application/json"},
            method="POST"
        )
        with urllib.request.urlopen(req) as resp:
            data = json.loads(resp.read().decode())
            entry_id = data["id"]

        # Get by ID
        req = urllib.request.Request(f"{server_url}/clipboard/entry/{entry_id}")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert data["status"] == "ok"
            assert data["entry"]["content"] == "specific entry"

    def test_delete_entry(self, server_url):
        """Test DELETE /clipboard/<id> removes an entry."""
        # Add an entry
        payload = json.dumps({
            "content": "to delete",
            "source": "host",
            "source_ip": "127.0.0.1"
        }).encode()
        req = urllib.request.Request(
            f"{server_url}/clipboard",
            data=payload,
            headers={"Content-Type": "application/json"},
            method="POST"
        )
        with urllib.request.urlopen(req) as resp:
            data = json.loads(resp.read().decode())
            entry_id = data["id"]

        # Delete it
        req = urllib.request.Request(
            f"{server_url}/clipboard/{entry_id}",
            method="DELETE"
        )
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            data = json.loads(response.read().decode())
            assert data["status"] == "deleted"

        # Verify it's gone
        req = urllib.request.Request(f"{server_url}/clipboard/entry/{entry_id}")
        with urllib.request.urlopen(req) as response:
            data = json.loads(response.read().decode())
            assert data["status"] == "not_found"

    def test_cors_headers(self, server_url):
        """Test that CORS headers are present."""
        req = urllib.request.Request(f"{server_url}/clipboard")
        with urllib.request.urlopen(req) as response:
            assert response.headers.get("Access-Control-Allow-Origin") == "*"
            assert "Access-Control-Allow-Methods" in response.headers

    def test_options_preflight(self, server_url):
        """Test OPTIONS request for CORS preflight."""
        req = urllib.request.Request(f"{server_url}/clipboard", method="OPTIONS")
        with urllib.request.urlopen(req) as response:
            assert response.status == 200
            assert response.headers.get("Access-Control-Allow-Origin") == "*"
