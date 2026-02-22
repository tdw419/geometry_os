#!/usr/bin/env python3
"""
Performance Benchmark Tests for Desktop Agent Service.

Validates NFR latency targets:
- NFR-19: Key validation latency < 1ms
- NFR-20: Command validation latency < 1ms
- NFR-21: Session creation latency < 10ms

Run: PYTHONPATH=. pytest tests/test_desktop_agent_performance.py -v
"""

import pytest
import time
import sys
import os
from unittest.mock import MagicMock, AsyncMock, patch

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.desktop_agent.safety.sanitizer import SafetySanitizer
from systems.desktop_agent.session_manager import SessionManager, DesktopSession
from systems.ai_gui.backends.base import BaseBackend


# NFR latency targets (in seconds)
KEY_VALIDATION_TARGET_MS = 1.0 / 1000  # < 1ms
COMMAND_VALIDATION_TARGET_MS = 1.0 / 1000  # < 1ms
SESSION_CREATION_TARGET_MS = 10.0 / 1000  # < 10ms
SESSION_RETRIEVAL_TARGET_MS = 1.0 / 1000  # < 1ms


class MockBackend(BaseBackend):
    """Minimal mock backend for performance testing."""

    async def connect(self, config=None):
        return True

    async def disconnect(self):
        return True

    async def send_input(self, tile_id, event):
        return True

    async def capture_frame(self, tile_id="root"):
        return b"\x00" * 100

    async def get_windows(self):
        return []

    async def focus_window(self, window_id):
        return True

    async def spawn(self, config):
        pass

    async def terminate(self, tile_id):
        pass

    async def health_check(self, tile_id):
        return True


@pytest.fixture
def sanitizer():
    """Create a SafetySanitizer instance for testing."""
    return SafetySanitizer()


@pytest.fixture
def session_manager():
    """Create a SessionManager instance for testing."""
    return SessionManager()


@pytest.fixture
def mock_backend():
    """Create a mock backend instance."""
    return MockBackend()


class TestKeyValidationLatency:
    """Benchmark tests for key validation (NFR-19: < 1ms)."""

    def test_single_key_validation_under_1ms(self, sanitizer):
        """Single key validation should complete in under 1ms."""
        # Test with a typical safe key
        start = time.perf_counter()
        result = sanitizer.validate_key_event("Ctrl+S")
        elapsed = time.perf_counter() - start

        assert result.valid is True
        assert elapsed < KEY_VALIDATION_TARGET_MS, \
            f"Key validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_blocked_key_validation_under_1ms(self, sanitizer):
        """Blocked key validation should still be under 1ms."""
        start = time.perf_counter()
        result = sanitizer.validate_key_event("Sys_Req")
        elapsed = time.perf_counter() - start

        assert result.valid is False
        assert elapsed < KEY_VALIDATION_TARGET_MS, \
            f"Blocked key validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_complex_combo_validation_under_1ms(self, sanitizer):
        """Complex key combo validation should be under 1ms."""
        start = time.perf_counter()
        result = sanitizer.validate_key_event("Ctrl+Shift+Alt+S")
        elapsed = time.perf_counter() - start

        assert result.valid is True
        assert elapsed < KEY_VALIDATION_TARGET_MS, \
            f"Complex combo validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_1000_key_validations_avg_under_1ms(self, sanitizer):
        """Average of 1000 key validations should be under 1ms each."""
        test_keys = [
            "A", "Ctrl+S", "Alt+Tab", "Ctrl+Alt+Delete",
            "Shift+A", "Ctrl+Shift+S", "Meta+L", "Sys_Req"
        ] * 125  # 1000 total

        start = time.perf_counter()
        for key in test_keys:
            sanitizer.validate_key_event(key)
        elapsed = time.perf_counter() - start

        avg_time = elapsed / len(test_keys)
        assert avg_time < KEY_VALIDATION_TARGET_MS, \
            f"Average key validation took {avg_time * 1000:.4f}ms, expected < 1ms"


class TestCommandValidationLatency:
    """Benchmark tests for command validation (NFR-20: < 1ms)."""

    def test_safe_command_validation_under_1ms(self, sanitizer):
        """Safe command validation should complete in under 1ms."""
        start = time.perf_counter()
        result = sanitizer.validate_command("ls -la")
        elapsed = time.perf_counter() - start

        assert result.valid is True
        assert elapsed < COMMAND_VALIDATION_TARGET_MS, \
            f"Command validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_blocked_command_validation_under_1ms(self, sanitizer):
        """Blocked command validation should still be under 1ms."""
        start = time.perf_counter()
        result = sanitizer.validate_command("rm -rf /")
        elapsed = time.perf_counter() - start

        assert result.valid is False
        assert elapsed < COMMAND_VALIDATION_TARGET_MS, \
            f"Blocked command validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_complex_command_validation_under_1ms(self, sanitizer):
        """Complex command with pipes should be under 1ms."""
        complex_cmd = "cat /var/log/syslog | grep error | head -n 50"

        start = time.perf_counter()
        result = sanitizer.validate_command(complex_cmd)
        elapsed = time.perf_counter() - start

        assert result.valid is True
        assert elapsed < COMMAND_VALIDATION_TARGET_MS, \
            f"Complex command validation took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_1000_command_validations_avg_under_1ms(self, sanitizer):
        """Average of 1000 command validations should be under 1ms each."""
        test_commands = [
            "ls", "pwd", "echo hello", "cat file.txt",
            "grep pattern file", "find . -name '*.py'", "rm -rf /",
            "shutdown", "reboot", "chmod 777 /", "dd if=/dev/zero"
        ] * 91  # 1001 total, close enough

        start = time.perf_counter()
        for cmd in test_commands:
            sanitizer.validate_command(cmd)
        elapsed = time.perf_counter() - start

        avg_time = elapsed / len(test_commands)
        assert avg_time < COMMAND_VALIDATION_TARGET_MS, \
            f"Average command validation took {avg_time * 1000:.4f}ms, expected < 1ms"


class TestSessionCreationLatency:
    """Benchmark tests for session creation (NFR-21: < 10ms)."""

    def test_session_creation_under_10ms(self, session_manager, mock_backend):
        """Session creation should complete in under 10ms."""
        start = time.perf_counter()
        session = session_manager.create("local", mock_backend)
        elapsed = time.perf_counter() - start

        assert session is not None
        assert session.id is not None
        assert elapsed < SESSION_CREATION_TARGET_MS, \
            f"Session creation took {elapsed * 1000:.3f}ms, expected < 10ms"

    def test_session_creation_with_cleanup_under_10ms(self, session_manager, mock_backend):
        """Session creation with stale cleanup should be under 10ms."""
        # Create a session first
        session_manager.create("local", mock_backend)

        # Now measure creation (which triggers cleanup_stale internally)
        start = time.perf_counter()
        session = session_manager.create("local", mock_backend)
        elapsed = time.perf_counter() - start

        assert session is not None
        assert elapsed < SESSION_CREATION_TARGET_MS, \
            f"Session creation with cleanup took {elapsed * 1000:.3f}ms, expected < 10ms"


class TestSessionRetrievalLatency:
    """Benchmark tests for session retrieval."""

    def test_session_retrieval_under_1ms(self, session_manager, mock_backend):
        """Session retrieval should complete in under 1ms."""
        # Create a session first
        created = session_manager.create("local", mock_backend)
        session_id = created.id

        start = time.perf_counter()
        session = session_manager.get(session_id)
        elapsed = time.perf_counter() - start

        assert session is not None
        assert session.id == session_id
        assert elapsed < SESSION_RETRIEVAL_TARGET_MS, \
            f"Session retrieval took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_session_retrieval_nonexistent_under_1ms(self, session_manager):
        """Retrieving nonexistent session should be under 1ms."""
        start = time.perf_counter()
        session = session_manager.get("nonexistent-session-id")
        elapsed = time.perf_counter() - start

        assert session is None
        assert elapsed < SESSION_RETRIEVAL_TARGET_MS, \
            f"Session retrieval (nonexistent) took {elapsed * 1000:.3f}ms, expected < 1ms"

    def test_1000_session_retrievals_avg_under_1ms(self, session_manager, mock_backend):
        """Average of 1000 session retrievals should be under 1ms each."""
        # Create a session
        created = session_manager.create("local", mock_backend)
        session_id = created.id

        start = time.perf_counter()
        for _ in range(1000):
            session_manager.get(session_id)
        elapsed = time.perf_counter() - start

        avg_time = elapsed / 1000
        assert avg_time < SESSION_RETRIEVAL_TARGET_MS, \
            f"Average session retrieval took {avg_time * 1000:.4f}ms, expected < 1ms"


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
