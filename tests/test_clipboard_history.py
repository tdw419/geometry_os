"""Tests for Clipboard History module - TDD approach."""

import time
import pytest
from systems.clipboard.history import ClipboardEntry, ClipboardHistory


class TestClipboardEntry:
    """Tests for ClipboardEntry dataclass."""

    def test_clipboard_entry_creation(self):
        """Test that ClipboardEntry is created with correct fields."""
        entry = ClipboardEntry(
            content="test content",
            source="localhost",
            source_ip="127.0.0.1"
        )

        assert entry.content == "test content"
        assert entry.source == "localhost"
        assert entry.source_ip == "127.0.0.1"
        assert len(entry.id) == 8  # uuid[:8]
        assert isinstance(entry.timestamp, float)
        assert entry.timestamp > 0

    def test_clipboard_entry_custom_id_and_timestamp(self):
        """Test that custom id and timestamp can be provided."""
        custom_time = 12345.0
        entry = ClipboardEntry(
            content="test",
            source="host",
            source_ip="192.168.1.1",
            id="custom12",
            timestamp=custom_time
        )

        assert entry.id == "custom12"
        assert entry.timestamp == custom_time


class TestClipboardHistory:
    """Tests for ClipboardHistory class."""

    def test_clipboard_history_add(self):
        """Test adding entries to history."""
        history = ClipboardHistory()
        entry = history.add("test content", "localhost", "127.0.0.1")

        assert isinstance(entry, ClipboardEntry)
        assert entry.content == "test content"
        assert len(history.get_all()) == 1

    def test_clipboard_history_max_size(self):
        """Test that history respects max_size (circular buffer)."""
        history = ClipboardHistory(max_size=3)

        # Add 5 entries
        for i in range(5):
            history.add(f"content{i}", "host", "127.0.0.1")

        entries = history.get_all()
        assert len(entries) == 3
        # Should have entries 2, 3, 4 (oldest evicted)
        assert entries[0].content == "content2"
        assert entries[1].content == "content3"
        assert entries[2].content == "content4"

    def test_clipboard_history_get_since(self):
        """Test getting entries since a specific entry ID."""
        history = ClipboardHistory()

        entry1 = history.add("content1", "host", "127.0.0.1")
        time.sleep(0.01)  # Ensure different timestamps
        entry2 = history.add("content2", "host", "127.0.0.1")
        time.sleep(0.01)
        entry3 = history.add("content3", "host", "127.0.0.1")

        # Get entries since entry1
        recent = history.get_since(entry1.id)
        assert len(recent) == 2
        assert recent[0].id == entry2.id
        assert recent[1].id == entry3.id

        # Invalid ID returns empty list
        assert history.get_since("invalid") == []

    def test_clipboard_history_get_latest(self):
        """Test getting the latest entry."""
        history = ClipboardHistory()

        # Empty history returns None
        assert history.get_latest() is None

        entry1 = history.add("first", "host", "127.0.0.1")
        entry2 = history.add("second", "host", "127.0.0.1")

        latest = history.get_latest()
        assert latest.id == entry2.id
        assert latest.content == "second"

    def test_clipboard_history_get_by_id(self):
        """Test getting an entry by its ID."""
        history = ClipboardHistory()

        entry1 = history.add("content1", "host", "127.0.0.1")
        entry2 = history.add("content2", "host", "127.0.0.1")

        found = history.get_by_id(entry1.id)
        assert found is not None
        assert found.content == "content1"

        # Non-existent ID returns None
        assert history.get_by_id("nonexist") is None

    def test_clipboard_history_delete(self):
        """Test deleting an entry by ID."""
        history = ClipboardHistory()

        entry1 = history.add("content1", "host", "127.0.0.1")
        entry2 = history.add("content2", "host", "127.0.0.1")

        assert len(history.get_all()) == 2

        # Delete first entry
        result = history.delete(entry1.id)
        assert result is True
        assert len(history.get_all()) == 1
        assert history.get_by_id(entry1.id) is None

        # Delete non-existent returns False
        assert history.delete("nonexist") is False

    def test_clipboard_history_to_json(self):
        """Test serialization to JSON."""
        history = ClipboardHistory(max_size=5)
        history.add("content1", "host1", "127.0.0.1")
        history.add("content2", "host2", "192.168.1.1")

        json_str = history.to_json()
        assert isinstance(json_str, str)
        assert "content1" in json_str
        assert "host1" in json_str

    def test_clipboard_history_from_json(self):
        """Test deserialization from JSON."""
        history1 = ClipboardHistory(max_size=5)
        entry1 = history1.add("content1", "host1", "127.0.0.1")
        entry2 = history1.add("content2", "host2", "192.168.1.1")

        json_str = history1.to_json()

        history2 = ClipboardHistory.from_json(json_str)
        entries = history2.get_all()

        assert len(entries) == 2
        assert entries[0].content == "content1"
        assert entries[0].id == entry1.id
        assert history2.max_size == 5

    def test_clipboard_history_empty_to_json(self):
        """Test serialization of empty history."""
        history = ClipboardHistory()
        json_str = history.to_json()

        history2 = ClipboardHistory.from_json(json_str)
        assert len(history2.get_all()) == 0
