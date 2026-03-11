"""
Tests for Drift Visualizer.

Tests visual rendering of memory drift.
"""

import os
import tempfile

import numpy as np

from systems.memory_drift.drift_engine import MemoryEntry
from systems.memory_drift.drift_visualizer import DriftVisualizer
from systems.memory_drift.semantic_anchor import CodeAnchor


class TestDriftVisualizer:
    """Tests for DriftVisualizer class."""

    def test_visualizer_creation(self):
        """Test DriftVisualizer initializes correctly."""
        viz = DriftVisualizer()

        assert viz.width == 256
        assert viz.height == 256
        assert viz.background_color == (10, 10, 20)

    def test_visualizer_custom_size(self):
        """Test DriftVisualizer with custom dimensions."""
        viz = DriftVisualizer(width=512, height=384)

        assert viz.width == 512
        assert viz.height == 384

    def test_visualizer_custom_colors(self):
        """Test DriftVisualizer with custom colors."""
        viz = DriftVisualizer(
            background_color=(0, 0, 0),
            entry_color_recent=(255, 0, 0),
            anchor_color=(0, 255, 0),
        )

        assert viz.background_color == (0, 0, 0)
        assert viz.entry_color_recent == (255, 0, 0)
        assert viz.anchor_color == (0, 255, 0)


class TestRender:
    """Tests for render method."""

    def test_render_empty(self):
        """Test rendering with no entries or anchors."""
        viz = DriftVisualizer()
        image = viz.render([], [])

        assert image.shape == (256, 256, 3)
        assert np.all(image == viz.background_color)

    def test_render_with_entries(self):
        """Test rendering with memory entries."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
        )

        image = viz.render([entry], [])

        assert image.shape == (256, 256, 3)
        # Should not be all background (entry was drawn)
        assert not np.all(image == viz.background_color)

    def test_render_with_anchors(self):
        """Test rendering with code anchors."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        anchor = CodeAnchor(
            tile=(50, 50),
            code_hash="hash",
            semantic_vector=vector,
        )

        image = viz.render([], [anchor])

        assert image.shape == (256, 256, 3)
        # Should not be all background (anchor was drawn)
        assert not np.all(image == viz.background_color)

    def test_render_with_both(self):
        """Test rendering with entries and anchors."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
        )
        anchor = CodeAnchor(
            tile=(100, 100),
            code_hash="hash",
            semantic_vector=vector,
        )

        image = viz.render([entry], [anchor])

        assert image.shape == (256, 256, 3)


class TestDriftTrails:
    """Tests for drift trail rendering."""

    def test_render_with_trails(self):
        """Test rendering with drift trails enabled."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
            drift_history=[(0.0, 0.0), (25.0, 25.0), (50.0, 50.0)],
        )

        image = viz.render([entry], [], show_trails=True)

        assert image.shape == (256, 256, 3)

    def test_render_without_trails(self):
        """Test rendering with drift trails disabled."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
            drift_history=[(0.0, 0.0), (25.0, 25.0), (50.0, 50.0)],
        )

        image_with = viz.render([entry], [], show_trails=True)
        image_without = viz.render([entry], [], show_trails=False)

        # Images should be different (trails add pixels)
        assert not np.array_equal(image_with, image_without)


class TestCoordinateMapping:
    """Tests for coordinate mapping."""

    def test_world_to_screen_center(self):
        """Test mapping world coordinates to screen center."""
        viz = DriftVisualizer(width=100, height=100)
        bounds = (0.0, 0.0, 100.0, 100.0)

        sx, sy = viz._world_to_screen((50.0, 50.0), bounds)

        assert sx == 49  # (50/100) * 99 = 49.5 -> 49
        assert sy == 49

    def test_world_to_screen_corner(self):
        """Test mapping world coordinates to screen corner."""
        viz = DriftVisualizer(width=100, height=100)
        bounds = (0.0, 0.0, 100.0, 100.0)

        sx, sy = viz._world_to_screen((0.0, 0.0), bounds)
        assert sx == 0
        assert sy == 0

        sx, sy = viz._world_to_screen((100.0, 100.0), bounds)
        assert sx == 99
        assert sy == 99

    def test_world_to_screen_clamping(self):
        """Test coordinates are clamped to screen bounds."""
        viz = DriftVisualizer(width=100, height=100)
        bounds = (0.0, 0.0, 100.0, 100.0)

        # Test out-of-bounds coordinates
        sx, sy = viz._world_to_screen((-10.0, -10.0), bounds)
        assert sx == 0
        assert sy == 0

        sx, sy = viz._world_to_screen((200.0, 200.0), bounds)
        assert sx == 99
        assert sy == 99


class TestBoundsCalculation:
    """Tests for automatic bounds calculation."""

    def test_calculate_bounds_empty(self):
        """Test bounds calculation with no items."""
        viz = DriftVisualizer()

        bounds = viz._calculate_bounds([], [])

        # Default bounds when empty
        assert bounds == (0.0, 0.0, 1000.0, 1000.0)

    def test_calculate_bounds_with_entries(self):
        """Test bounds calculation with entries."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entries = [
            MemoryEntry(key="1", value=1, position=(0.0, 0.0), semantic_vector=vector),
            MemoryEntry(key="2", value=2, position=(100.0, 100.0), semantic_vector=vector),
        ]

        bounds = viz._calculate_bounds(entries, [])

        # Should include padding
        assert bounds[0] < 0.0  # x1 with padding
        assert bounds[1] < 0.0  # y1 with padding
        assert bounds[2] > 100.0  # x2 with padding
        assert bounds[3] > 100.0  # y2 with padding

    def test_calculate_bounds_with_anchors(self):
        """Test bounds calculation with anchors."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        anchors = [
            CodeAnchor(tile=(0, 0), code_hash="1", semantic_vector=vector),
            CodeAnchor(tile=(200, 200), code_hash="2", semantic_vector=vector),
        ]

        bounds = viz._calculate_bounds([], anchors)

        # Should include all anchor positions with padding
        assert bounds[0] < 0.0
        assert bounds[1] < 0.0
        assert bounds[2] > 200.0
        assert bounds[3] > 200.0


class TestDrawing:
    """Tests for drawing primitives."""

    def test_draw_circle(self):
        """Test drawing a filled circle."""
        viz = DriftVisualizer(width=50, height=50)
        image = np.zeros((50, 50, 3), dtype=np.uint8)

        viz._draw_circle(image, 25, 25, 5, (255, 0, 0))

        # Center should be red
        assert tuple(image[25, 25]) == (255, 0, 0)
        # Edge of circle should be red
        assert tuple(image[25, 20]) == (255, 0, 0)
        # Outside circle should be black
        assert tuple(image[25, 15]) == (0, 0, 0)

    def test_draw_rect(self):
        """Test drawing a rectangle outline."""
        viz = DriftVisualizer(width=50, height=50)
        image = np.zeros((50, 50, 3), dtype=np.uint8)

        viz._draw_rect(image, 10, 10, 10, 10, (0, 255, 0))

        # Top edge
        assert tuple(image[10, 10]) == (0, 255, 0)
        assert tuple(image[10, 19]) == (0, 255, 0)
        # Bottom edge
        assert tuple(image[19, 10]) == (0, 255, 0)
        # Inside should be black
        assert tuple(image[15, 15]) == (0, 0, 0)

    def test_draw_line(self):
        """Test drawing a line."""
        viz = DriftVisualizer(width=50, height=50)
        image = np.zeros((50, 50, 3), dtype=np.uint8)

        viz._draw_line(image, (0, 0), (10, 10), (0, 0, 255))

        # Diagonal should be blue
        assert tuple(image[0, 0]) == (0, 0, 255)
        assert tuple(image[5, 5]) == (0, 0, 255)
        assert tuple(image[10, 10]) == (0, 0, 255)


class TestRenderToPNG:
    """Tests for PNG output."""

    def test_render_to_png(self):
        """Test rendering to PNG file."""
        viz = DriftVisualizer()

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
        )

        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            temp_path = f.name

        try:
            result = viz.render_to_png([entry], [], temp_path)
            assert result is True

            # Check file was created
            assert os.path.exists(temp_path)
        finally:
            if os.path.exists(temp_path):
                os.remove(temp_path)

    def test_render_to_png_empty(self):
        """Test rendering empty scene to PNG."""
        viz = DriftVisualizer()

        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            temp_path = f.name

        try:
            result = viz.render_to_png([], [], temp_path)
            assert result is True
        finally:
            if os.path.exists(temp_path):
                os.remove(temp_path)


class TestEntryColoring:
    """Tests for entry coloring based on recency."""

    def test_entry_color_recent(self):
        """Test recent entries have bright color."""
        import time

        viz = DriftVisualizer(
            entry_color_recent=(100, 200, 255),
            entry_color_old=(50, 50, 100),
        )

        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 50.0),
            semantic_vector=vector,
            last_access=time.time(),  # Just accessed
        )

        image = viz.render([entry], [])

        # Entry pixel should be closer to recent color
        # Find the entry pixel (center-ish area)
        center_pixels = image[120:140, 120:140]
        # At least some pixels should have high blue values (recent color)
        has_bright = np.any(center_pixels[:, :, 2] > 150)
        assert has_bright
