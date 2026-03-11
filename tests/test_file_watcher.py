"""
Tests for FileWatcher - Real-time file access monitoring.

Uses watchdog to emit events when files are accessed, modified, or created.
These events drive the Tectonic Gravity Engine's semantic mass updates.
"""

import tempfile
import time
from pathlib import Path

import pytest

from systems.infinite_map.file_watcher import FileEvent, FileWatcher


class TestFileWatcher:
    """Tests for FileWatcher file monitoring."""

    def test_file_watcher_creation(self):
        """Test FileWatcher initializes with a watch path."""
        watcher = FileWatcher("/tmp")
        assert watcher.watch_path == "/tmp"
        assert watcher._running == False

    def test_file_watcher_start_stop(self):
        """Test FileWatcher can be started and stopped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            watcher = FileWatcher(tmpdir)
            watcher.start()
            assert watcher._running == True
            watcher.stop()
            assert watcher._running == False

    def test_file_event_captured_on_modify(self):
        """Test FileWatcher captures file modification events."""
        with tempfile.TemporaryDirectory() as tmpdir:
            watcher = FileWatcher(tmpdir)
            events = []
            watcher.set_callback(lambda e: events.append(e))

            # Create and modify a file
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("initial")

            watcher.start()
            time.sleep(0.2)  # Let watcher initialize

            test_file.write_text("modified")
            time.sleep(0.3)  # Wait for event

            watcher.stop()

            # Should have captured at least one event
            assert len(events) >= 1
            assert events[0].event_type in ("modified", "created")
            assert "test.py" in events[0].file_path

    def test_file_event_has_path_and_type(self):
        """Test FileEvent contains file_path and event_type."""
        event = FileEvent(file_path="/tmp/test.py", event_type="modified")
        assert event.file_path == "/tmp/test.py"
        assert event.event_type == "modified"


class TestFileEvent:
    """Tests for FileEvent dataclass."""

    def test_file_event_creation(self):
        """Test FileEvent stores all required fields."""
        event = FileEvent(
            file_path="src/core.py",
            event_type="accessed"
        )
        assert event.file_path == "src/core.py"
        assert event.event_type == "accessed"

    def test_file_event_types(self):
        """Test FileEvent supports different event types."""
        types = ["created", "modified", "accessed", "deleted"]
        for t in types:
            event = FileEvent(file_path="test.py", event_type=t)
            assert event.event_type == t


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
