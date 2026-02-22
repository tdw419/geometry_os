#!/usr/bin/env python3
"""
Tests for Neural Semantic Publisher

Run with: python -m pytest tests/test_neural_semantic_publisher.py -v
"""

import pytest
import sys
import tempfile
import shutil
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from dataclasses import asdict

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestEvolutionEvent:
    """Tests for EvolutionEvent dataclass."""

    def test_evolution_event_creation(self):
        """Test creating an evolution event."""
        from neural_semantic_publisher import EvolutionEvent

        event = EvolutionEvent(
            cycle=48,
            target="test.py",
            improvement="Test improvement",
            delta=0.12
        )

        assert event.cycle == 48
        assert event.target == "test.py"
        assert event.improvement == "Test improvement"
        assert event.delta == 0.12
        assert event.success is True
        assert event.timestamp is not None

    def test_evolution_event_with_metrics(self):
        """Test evolution event with metrics."""
        from neural_semantic_publisher import EvolutionEvent

        event = EvolutionEvent(
            cycle=50,
            target="bridge.py",
            improvement="Optimized rendering",
            delta=0.15,
            metrics={"render_time": 45.2, "memory_mb": 128}
        )

        assert event.metrics["render_time"] == 45.2
        assert event.metrics["memory_mb"] == 128


class TestTerminalEvent:
    """Tests for TerminalEvent dataclass."""

    def test_terminal_event_creation(self):
        """Test creating a terminal event."""
        from neural_semantic_publisher import TerminalEvent

        event = TerminalEvent(
            tile_id=1,
            event="texture_rendered",
            cells_updated=124,
            grid_size=(32, 32)
        )

        assert event.tile_id == 1
        assert event.event == "texture_rendered"
        assert event.cells_updated == 124
        assert event.grid_size == (32, 32)
        assert event.timestamp is not None

    def test_terminal_event_with_cursor(self):
        """Test terminal event with cursor position."""
        from neural_semantic_publisher import TerminalEvent

        event = TerminalEvent(
            tile_id=2,
            event="cursor_move",
            cursor_pos=(10, 5)
        )

        assert event.cursor_pos == (10, 5)


class TestNeuralSemanticPublisher:
    """Tests for NeuralSemanticPublisher class."""

    @pytest.fixture
    def publisher(self):
        """Create a publisher instance."""
        from neural_semantic_publisher import NeuralSemanticPublisher
        return NeuralSemanticPublisher(
            enabled=False,  # Disable actual publishing for tests
            rate_limit_seconds=0.1  # Fast rate limit for tests
        )

    @pytest.fixture
    def publisher_with_mock(self):
        """Create a publisher with mocked WordPress."""
        from neural_semantic_publisher import NeuralSemanticPublisher

        with patch('neural_semantic_publisher.WORDPRESS_AVAILABLE', True):
            pub = NeuralSemanticPublisher(
                enabled=True,
                rate_limit_seconds=0.1
            )
            yield pub

    def test_publisher_initialization(self, publisher):
        """Test publisher initializes correctly."""
        assert publisher is not None
        assert publisher.enabled is False  # Disabled for tests
        assert publisher.rate_limit_seconds == 0.1

    def test_rate_limiting(self, publisher_with_mock):
        """Test rate limiting works."""
        publisher_with_mock._last_publish_time = 0

        with patch('neural_semantic_publisher.publish_to_wordpress') as mock_pub:
            mock_pub.return_value = {"post_id": 1, "url": "http://test"}

            # First publish should work
            result1 = publisher_with_mock._publish_with_rate_limit("Test1", "Content1")
            assert result1 is not None

            # Second should be rate limited
            result2 = publisher_with_mock._publish_with_rate_limit("Test2", "Content2")
            assert result2 is None
            assert publisher_with_mock._stats["rate_limited"] == 1

    def test_evolution_event_skips_small_delta(self, publisher):
        """Test that small deltas are skipped."""
        from neural_semantic_publisher import EvolutionEvent

        event = EvolutionEvent(
            cycle=1,
            target="test.py",
            improvement="Tiny improvement",
            delta=0.001  # Below threshold
        )

        result = publisher.publish_evolution(event)
        assert result is None  # Should skip

    def test_terminal_event_format(self, publisher):
        """Test terminal event formatting."""
        from neural_semantic_publisher import TerminalEvent

        event = TerminalEvent(
            tile_id=1,
            event="test_event",
            cells_updated=100,
            grid_size=(32, 32),
            cursor_pos=(5, 10)
        )

        # With publishing disabled, should return None but not error
        result = publisher.publish_terminal_event(event)
        assert result is None

    def test_stats_tracking(self, publisher):
        """Test stats are tracked correctly."""
        stats = publisher.get_stats()

        assert "total_posts" in stats
        assert "evolution_posts" in stats
        assert "terminal_posts" in stats
        assert "enabled" in stats

    def test_queue_management(self, publisher_with_mock):
        """Test event queue management."""
        publisher_with_mock._last_publish_time = 0

        with patch('neural_semantic_publisher.publish_to_wordpress') as mock_pub:
            mock_pub.return_value = {"post_id": 1}

            # Queue some events
            publisher_with_mock._event_queue.append({"title": "Q1", "content": "C1", "type": "post"})
            publisher_with_mock._event_queue.append({"title": "Q2", "content": "C2", "type": "post"})

            assert len(publisher_with_mock._event_queue) == 2


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_publish_evolution_function(self):
        """Test publish_evolution convenience function."""
        with patch('neural_semantic_publisher.get_publisher') as mock_get:
            mock_publisher = Mock()
            mock_publisher.publish_evolution.return_value = {"post_id": 1}
            mock_get.return_value = mock_publisher

            from neural_semantic_publisher import publish_evolution

            result = publish_evolution(
                cycle=48,
                target="test.py",
                improvement="Test",
                delta=0.1
            )

            assert result is not None
            mock_publisher.publish_evolution.assert_called_once()

    def test_publish_terminal_event_function(self):
        """Test publish_terminal_event convenience function."""
        with patch('neural_semantic_publisher.get_publisher') as mock_get:
            mock_publisher = Mock()
            mock_publisher.publish_terminal_event.return_value = {"post_id": 2}
            mock_get.return_value = mock_publisher

            from neural_semantic_publisher import publish_terminal_event

            result = publish_terminal_event(
                tile_id=1,
                event="test",
                cells_updated=50
            )

            assert result is not None
            mock_publisher.publish_terminal_event.assert_called_once()


class TestEvolutionWordPressHook:
    """Tests for EvolutionWordPressHook class."""

    @pytest.fixture
    def hook(self):
        """Create a hook instance."""
        from evolution_wordpress_hook import EvolutionWordPressHook
        return EvolutionWordPressHook(enabled=False)

    def test_hook_initialization(self, hook):
        """Test hook initializes correctly."""
        assert hook is not None
        assert hook.enabled is False

    def test_on_improvement_disabled(self, hook):
        """Test on_improvement when disabled."""
        result = hook.on_improvement(
            cycle=48,
            target="test.py",
            improvement="Test",
            delta=0.1
        )
        assert result is False

    def test_on_improvement_small_delta(self, hook):
        """Test on_improvement with small delta."""
        hook.enabled = True
        hook.min_delta_threshold = 0.1

        result = hook.on_improvement(
            cycle=48,
            target="test.py",
            improvement="Test",
            delta=0.01  # Below threshold
        )
        assert result is False
        assert hook._skipped_count == 1

    def test_hook_stats(self, hook):
        """Test hook stats."""
        stats = hook.get_stats()

        assert "enabled" in stats
        assert "published_count" in stats
        assert "skipped_count" in stats


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
