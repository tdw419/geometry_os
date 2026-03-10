"""
Tests for district visualization.

Phase 49: Neural District Coalescence
"""

import math
import tempfile
from pathlib import Path

import numpy as np
import pytest

from systems.tectonic.plate import TectonicPlate, DistrictState, DISTRICT_COLORS
from systems.tectonic.visual import DistrictHeatmap, GhostLayer


class TestDistrictHeatmapCreation:
    """Tests for DistrictHeatmap creation."""

    def test_heatmap_creation_default_size(self):
        """Default size should be 256x256."""
        heatmap = DistrictHeatmap()
        assert heatmap.width == 256
        assert heatmap.height == 256

    def test_heatmap_creation_custom_size(self):
        """Should accept custom dimensions."""
        heatmap = DistrictHeatmap(width=128, height=64)
        assert heatmap.width == 128
        assert heatmap.height == 64


class TestDistrictHeatmapRender:
    """Tests for rendering plates."""

    def test_render_empty_plates(self):
        """Rendering empty plate list should return transparent array."""
        heatmap = DistrictHeatmap(width=10, height=10)
        result = heatmap.render([])
        assert result.shape == (10, 10, 4)
        # All pixels should be transparent black
        assert np.all(result == 0)

    def test_render_single_plate(self):
        """Render a single plate with tiles."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="test-1",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,  # HIGH_COHESION
            tiles=[(1, 1), (2, 2), (3, 3)],
        )
        result = heatmap.render([plate])
        assert result.shape == (10, 10, 4)
        # Check that tile pixels have the HIGH_COHESION color
        expected_color = DISTRICT_COLORS[DistrictState.HIGH_COHESION]
        assert tuple(result[1, 1]) == expected_color
        assert tuple(result[2, 2]) == expected_color
        assert tuple(result[3, 3]) == expected_color

    def test_render_uses_high_cohesion_color(self):
        """High cohesion plate should render with cyan color."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="high-cohesion",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,  # >= 0.7 triggers HIGH_COHESION
            tiles=[(5, 5)],
        )
        result = heatmap.render([plate])
        # HIGH_COHESION = (0, 240, 255, 255)
        assert tuple(result[5, 5]) == (0, 240, 255, 255)

    def test_render_conflict_plate(self):
        """Conflict plate should render with red color."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="conflict",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.9,
            conflict_count=1,  # Triggers CONFLICT state
            tiles=[(3, 3)],
        )
        result = heatmap.render([plate])
        # CONFLICT = (255, 51, 51, 255)
        assert tuple(result[3, 3]) == (255, 51, 51, 255)

    def test_render_dormant_plate(self):
        """Dormant plate should render with dark color."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="dormant",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.5,  # 0.4 <= cohesion < 0.7 triggers DORMANT
            tiles=[(7, 7)],
        )
        result = heatmap.render([plate])
        # DORMANT = (26, 26, 26, 255)
        assert tuple(result[7, 7]) == (26, 26, 26, 255)

    def test_render_multiple_plates(self):
        """Render multiple plates with different colors."""
        heatmap = DistrictHeatmap(width=20, height=20)

        plate1 = TectonicPlate(
            plate_id="high",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,
            tiles=[(1, 1), (2, 2)],
        )
        plate2 = TectonicPlate(
            plate_id="conflict",
            agents=["b"],
            centroid=np.zeros(64),
            conflict_count=1,
            tiles=[(10, 10)],
        )

        result = heatmap.render([plate1, plate2])

        # Check plate1 tiles
        assert tuple(result[1, 1]) == DISTRICT_COLORS[DistrictState.HIGH_COHESION]
        assert tuple(result[2, 2]) == DISTRICT_COLORS[DistrictState.HIGH_COHESION]

        # Check plate2 tiles
        assert tuple(result[10, 10]) == DISTRICT_COLORS[DistrictState.CONFLICT]

    def test_render_respects_bounds(self):
        """Tiles outside canvas bounds should be ignored."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="out-of-bounds",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,
            tiles=[(-1, -1), (100, 100), (5, 5)],  # Only (5,5) is valid
        )
        result = heatmap.render([plate])
        # Should not raise, and (5,5) should be colored
        expected_color = DISTRICT_COLORS[DistrictState.HIGH_COHESION]
        assert tuple(result[5, 5]) == expected_color


class TestDistrictHeatmapPng:
    """Tests for PNG rendering."""

    def test_render_to_png(self, tmp_path):
        """Should save rendered heatmap to PNG file."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="png-test",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,
            tiles=[(1, 1), (2, 2)],
        )

        output_path = str(tmp_path / "test_output.png")
        heatmap.render_to_png([plate], output_path)

        # Verify file was created
        assert Path(output_path).exists()

        # Verify it's a valid PNG by loading it
        from PIL import Image
        img = Image.open(output_path)
        assert img.size == (10, 10)
        assert img.mode == "RGBA"


class TestDistrictHeatmapBorders:
    """Tests for border rendering."""

    def test_render_with_borders(self):
        """Should add glowing borders around tile groups."""
        heatmap = DistrictHeatmap(width=10, height=10)
        plate = TectonicPlate(
            plate_id="bordered",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.8,
            tiles=[(5, 5), (6, 5), (5, 6), (6, 6)],  # 2x2 block
        )
        result = heatmap.render_with_borders([plate], border_width=1)

        assert result.shape == (10, 10, 4)
        # Center tiles should have base color
        base_color = DISTRICT_COLORS[DistrictState.HIGH_COHESION]
        assert tuple(result[5, 5]) == base_color


class TestGhostLayerCreation:
    """Tests for GhostLayer creation."""

    def test_ghost_layer_creation_defaults(self):
        """Default depth should be 60, gamma 0.3."""
        ghost = GhostLayer()
        assert ghost.depth == 60
        assert ghost.decay_gamma == 0.3
        assert ghost.frame_count == 0

    def test_ghost_layer_creation_custom(self):
        """Should accept custom depth and gamma."""
        ghost = GhostLayer(depth=30, decay_gamma=0.5)
        assert ghost.depth == 30
        assert ghost.decay_gamma == 0.5


class TestGhostLayerPushFrame:
    """Tests for pushing frames to history."""

    def test_push_single_frame(self):
        """Pushing a frame should increase frame count."""
        ghost = GhostLayer(depth=10)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)
        frame[2, 2] = [255, 0, 0, 255]

        ghost.push_frame(frame)
        assert ghost.frame_count == 1

    def test_push_multiple_frames(self):
        """Pushing multiple frames should track count."""
        ghost = GhostLayer(depth=10)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)

        for i in range(5):
            ghost.push_frame(frame)

        assert ghost.frame_count == 5

    def test_push_more_frames_than_depth(self):
        """Should truncate oldest frames when exceeding depth."""
        ghost = GhostLayer(depth=3)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)

        for i in range(10):
            # Make each frame unique
            f = frame.copy()
            f[0, 0, 0] = i  # Store index in red channel
            ghost.push_frame(f)

        # Should only keep last 3
        assert ghost.frame_count == 3


class TestGhostLayerComposite:
    """Tests for compositing frames with decay."""

    def test_composite_empty_history(self):
        """Compositing with no frames should return empty array."""
        ghost = GhostLayer()
        result = ghost.composite()
        assert result.shape == (0, 0, 4)

    def test_composite_single_frame(self):
        """Single frame should be returned as-is."""
        ghost = GhostLayer(depth=10)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)
        frame[2, 2] = [100, 150, 200, 255]

        ghost.push_frame(frame)
        result = ghost.composite()

        # Single frame has all weight
        assert np.allclose(result[2, 2], [100, 150, 200, 255])

    def test_composite_with_decay(self):
        """Multiple frames should blend with exponential decay."""
        ghost = GhostLayer(depth=10, decay_gamma=0.3)

        # Create two distinct frames
        frame1 = np.zeros((2, 2, 4), dtype=np.uint8)
        frame1[:, :] = [100, 0, 0, 255]  # Older frame (red)

        frame2 = np.zeros((2, 2, 4), dtype=np.uint8)
        frame2[:, :] = [0, 100, 0, 255]  # Newer frame (green)

        ghost.push_frame(frame1)
        ghost.push_frame(frame2)

        result = ghost.composite()

        # Newer frame (t=0) has weight e^0 = 1
        # Older frame (t=1) has weight e^(-0.3) ~ 0.74
        weight_new = 1.0
        weight_old = math.exp(-0.3)
        total = weight_new + weight_old

        expected_red = int((100 * weight_old) / total)
        expected_green = int((100 * weight_new) / total)

        assert result[0, 0, 0] == pytest.approx(expected_red, abs=2)
        assert result[0, 0, 1] == pytest.approx(expected_green, abs=2)

    def test_composite_decay_formula(self):
        """Verify decay formula matches PixelBrain spec."""
        ghost = GhostLayer(depth=3, decay_gamma=0.3)

        # Push 3 frames with unique colors
        frames = []
        for i in range(3):
            f = np.zeros((1, 1, 4), dtype=np.uint8)
            f[0, 0] = [i * 50, 0, 0, 255]
            frames.append(f)
            ghost.push_frame(f)

        result = ghost.composite()

        # Weights: t=0 (newest) = e^0 = 1, t=1 = e^(-0.3), t=2 = e^(-0.6)
        weights = [math.exp(-0.3 * t) for t in range(3)]
        total = sum(weights)

        # Newest is index 2 (value 100), middle is index 1 (value 50), oldest is index 0 (value 0)
        expected = (
            (0 * weights[2] + 50 * weights[1] + 100 * weights[0]) / total
        )

        assert result[0, 0, 0] == pytest.approx(expected, abs=2)


class TestGhostLayerClear:
    """Tests for clearing history."""

    def test_clear_removes_all_frames(self):
        """Clear should remove all frames from history."""
        ghost = GhostLayer(depth=10)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)

        for i in range(5):
            ghost.push_frame(frame)

        assert ghost.frame_count == 5

        ghost.clear()

        assert ghost.frame_count == 0

    def test_composite_after_clear(self):
        """Composite after clear should return empty array."""
        ghost = GhostLayer(depth=10)
        frame = np.zeros((5, 5, 4), dtype=np.uint8)

        ghost.push_frame(frame)
        ghost.clear()
        result = ghost.composite()

        assert result.shape == (0, 0, 4)
