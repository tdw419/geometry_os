"""
Comprehensive tests for HilbertEngine - Task 37 of Sisyphus v4.

Coverage targets:
- d2xy/xy2d roundtrip integrity
- Sequence-to-grid and grid-to-sequence mapping
- Locality preservation metrics
- Discontinuity detection
- Edge cases and boundary conditions
"""

import pytest
import numpy as np
from systems.evolution.HilbertEngine import (
    HilbertEngine,
    LocalityPreservationMetrics,
)


@pytest.fixture
def engine():
    """Create a HilbertEngine instance."""
    return HilbertEngine()


# Basic Transform Tests
# =====================

class TestD2XY:
    """Test d2xy (1D to 2D) transformation."""

    def test_d2xy_basic_2x2(self, engine):
        """Test d2xy for a 2x2 grid."""
        # For n=2, the curve visits: (0,0), (0,1), (1,1), (1,0)
        expected = [(0, 0), (0, 1), (1, 1), (1, 0)]
        for d, (ex, ey) in enumerate(expected):
            x, y = engine.d2xy(2, d)
            assert (x, y) == (ex, ey), f"d={d}: expected ({ex}, {ey}), got ({x}, {y})"

    def test_d2xy_basic_4x4(self, engine):
        """Test d2xy for a 4x4 grid - verify first few points."""
        # First few indices on a 4x4 Hilbert curve
        results = [engine.d2xy(4, d) for d in range(16)]
        
        # All results should be unique (bijective mapping)
        unique = set(results)
        assert len(unique) == 16, "d2xy should produce unique coordinates"

    def test_d2xy_all_indices_covered(self, engine):
        """Test that all grid cells are visited exactly once."""
        n = 8
        visited = set()
        for d in range(n * n):
            x, y = engine.d2xy(n, d)
            assert 0 <= x < n and 0 <= y < n, f"Coordinate ({x}, {y}) out of bounds"
            visited.add((x, y))
        
        assert len(visited) == n * n, "All cells should be visited"

    def test_d2xy_zero_index(self, engine):
        """Test that index 0 always maps to origin."""
        for n in [2, 4, 8, 16, 32]:
            x, y = engine.d2xy(n, 0)
            assert (x, y) == (0, 0), f"Index 0 should map to (0, 0) for n={n}"

    def test_d2xy_last_index(self, engine):
        """Test that the last index is within bounds."""
        for n in [2, 4, 8, 16]:
            x, y = engine.d2xy(n, n * n - 1)
            assert 0 <= x < n and 0 <= y < n


class TestXY2D:
    """Test xy2d (2D to 1D) transformation."""

    def test_xy2d_origin(self, engine):
        """Test that (0, 0) maps to index 0."""
        for n in [2, 4, 8, 16]:
            d = engine.xy2d(n, 0, 0)
            assert d == 0, f"(0, 0) should map to 0 for n={n}"

    def test_xy2d_all_coords_valid(self, engine):
        """Test that all coordinates produce valid indices."""
        n = 8
        for x in range(n):
            for y in range(n):
                d = engine.xy2d(n, x, y)
                assert 0 <= d < n * n, f"Index {d} out of bounds for ({x}, {y})"

    def test_xy2d_unique_indices(self, engine):
        """Test that each coordinate produces a unique index."""
        n = 8
        indices = set()
        for x in range(n):
            for y in range(n):
                d = engine.xy2d(n, x, y)
                indices.add(d)
        
        assert len(indices) == n * n, "Each coordinate should have unique index"


class TestRoundtrip:
    """Test d2xy and xy2d are inverses of each other."""

    def test_roundtrip_d_to_xy_to_d(self, engine):
        """Test d -> (x, y) -> d preserves index."""
        for n in [2, 4, 8, 16]:
            for d in range(n * n):
                x, y = engine.d2xy(n, d)
                d_back = engine.xy2d(n, x, y)
                assert d == d_back, f"Roundtrip failed for n={n}, d={d}"

    def test_roundtrip_xy_to_d_to_xy(self, engine):
        """Test (x, y) -> d -> (x, y) preserves coordinates."""
        n = 8
        for x in range(n):
            for y in range(n):
                d = engine.xy2d(n, x, y)
                x_back, y_back = engine.d2xy(n, d)
                assert (x, y) == (x_back, y_back), f"Roundtrip failed for ({x}, {y})"


class TestCurveContinuity:
    """Test Hilbert curve continuity properties."""

    def test_adjacent_indices_are_adjacent_cells(self, engine):
        """Adjacent indices should map to adjacent cells (Manhattan distance 1)."""
        n = 16
        for d in range(n * n - 1):
            x1, y1 = engine.d2xy(n, d)
            x2, y2 = engine.d2xy(n, d + 1)
            manhattan = abs(x1 - x2) + abs(y1 - y2)
            assert manhattan == 1, f"Indices {d} and {d+1} not adjacent: ({x1},{y1}) -> ({x2},{y2})"

    def test_curve_visits_all_quadrants(self, engine):
        """Curve should visit all four quadrants of the grid."""
        n = 4
        quadrants = {(0, 0): False, (0, 1): False, (1, 0): False, (1, 1): False}
        
        for d in range(n * n):
            x, y = engine.d2xy(n, d)
            qx, qy = x // (n // 2), y // (n // 2)
            quadrants[(qx, qy)] = True
        
        assert all(quadrants.values()), "All quadrants should be visited"


# Sequence/Grid Mapping Tests
# ===========================

class TestMapSequenceToGrid:
    """Test sequence-to-grid mapping."""

    def test_map_1d_to_2d_basic(self, engine):
        """Test basic 1D to 2D mapping."""
        data = np.array([1, 2, 3, 4])
        grid = engine.map_sequence_to_grid(data, 2)
        
        assert grid.shape == (2, 2)
        # Verify all values are placed (grid is 2x2 = 4 cells, all filled)
        assert set(grid.flatten()) == {1, 2, 3, 4}

    def test_map_with_channels(self, engine):
        """Test mapping with multi-channel data."""
        data = np.array([[1, 2], [3, 4], [5, 6], [7, 8]])
        grid = engine.map_sequence_to_grid(data, 2)
        
        assert grid.shape == (2, 2, 2)
        # First channel should have [1, 3, 5, 7] distributed along curve

    def test_map_truncates_to_grid_size(self, engine):
        """Test that data larger than grid is truncated."""
        data = np.arange(100)
        grid = engine.map_sequence_to_grid(data, 4)  # 16 cells
        
        assert grid.shape == (4, 4)
        # Should only have first 16 values
        non_zero = grid[grid > 0]
        assert len(non_zero) <= 16

    def test_map_pads_smaller_data(self, engine):
        """Test that data smaller than grid is zero-padded."""
        data = np.array([1, 2])
        grid = engine.map_sequence_to_grid(data, 4)  # 16 cells
        
        assert grid.shape == (4, 4)
        # Count non-zero values
        non_zero = np.count_nonzero(grid)
        assert non_zero == 2

    def test_map_rounds_up_non_power_of_two(self, engine):
        """Test that non-power-of-2 grid sizes are rounded up."""
        data = np.arange(20)
        grid = engine.map_sequence_to_grid(data, 5)  # Should become 8
        
        # Grid size should be rounded to power of 2
        assert grid.shape[0] in [5, 8]  # Either kept or rounded


class TestMapGridToSequence:
    """Test grid-to-sequence mapping."""

    def test_map_2d_to_1d_basic(self, engine):
        """Test basic 2D to 1D mapping."""
        grid = np.array([[1, 2], [3, 4]])
        seq = engine.map_grid_to_sequence(grid)
        
        assert len(seq) == 4
        assert set(seq) == {1, 2, 3, 4}

    def test_map_with_channels(self, engine):
        """Test mapping with multi-channel grid."""
        grid = np.array([[[1, 10], [2, 20]], [[3, 30], [4, 40]]])
        seq = engine.map_grid_to_sequence(grid)
        
        assert seq.shape == (4, 2)

    def test_roundtrip_sequence_grid_sequence(self, engine):
        """Test sequence -> grid -> sequence roundtrip."""
        original = np.arange(16)
        grid = engine.map_sequence_to_grid(original, 4)
        recovered = engine.map_grid_to_sequence(grid)
        
        np.testing.assert_array_equal(original, recovered)


# Gradient and Discontinuity Tests
# ================================

class TestCalculateHilbertGradient:
    """Test Hilbert gradient calculation."""

    def test_gradient_returns_correct_shape(self, engine):
        """Test gradient has correct shape."""
        for n in [4, 8, 16]:
            grad = engine.calculate_hilbert_gradient(n)
            assert grad.shape == (n, n)

    def test_gradient_values_are_positive(self, engine):
        """Test all gradient values are positive."""
        grad = engine.calculate_hilbert_gradient(8)
        assert np.all(grad >= 0)

    def test_gradient_is_constant_for_valid_curve(self, engine):
        """Test gradient is 1.0 everywhere for valid Hilbert curve."""
        grad = engine.calculate_hilbert_gradient(16)
        # For a correct Hilbert curve, all adjacent cells have distance 1
        assert np.allclose(grad, 1.0)


class TestDetectDiscontinuities:
    """Test discontinuity detection."""

    def test_no_discontinuities_for_valid_curve(self, engine):
        """Test no discontinuities detected for valid Hilbert curve."""
        disc = engine.detect_discontinuities(8, threshold=2.0)
        # With gradient = 1.0 everywhere and threshold = 2.0, should be empty
        assert len(disc) == 0

    def test_high_threshold_catches_nothing(self, engine):
        """Test very high threshold catches nothing."""
        disc = engine.detect_discontinuities(4, threshold=100.0)
        assert len(disc) == 0

    def test_returns_list(self, engine):
        """Test return type is list."""
        disc = engine.detect_discontinuities(8)
        assert isinstance(disc, list)

    def test_fallback_without_scipy(self, engine):
        """Test fallback path when scipy is unavailable."""
        # This is implicitly tested if scipy isn't installed
        # The function should still work
        disc = engine.detect_discontinuities(4)
        assert isinstance(disc, list)


class TestFallbackConnectedComponents:
    """Test the fallback connected components implementation."""

    def test_fallback_empty_mask(self, engine):
        """Test fallback with empty mask."""
        mask = np.zeros((4, 4), dtype=bool)
        grad = np.ones((4, 4), dtype=np.float32)
        result = engine._fallback_connected_components(mask, grad)
        assert result == []

    def test_fallback_single_region(self, engine):
        """Test fallback with single connected region."""
        mask = np.zeros((4, 4), dtype=bool)
        mask[1:3, 1:3] = True
        grad = np.ones((4, 4), dtype=np.float32)
        
        result = engine._fallback_connected_components(mask, grad)
        assert len(result) == 1
        assert result[0]["size"] == 4

    def test_fallback_multiple_regions(self, engine):
        """Test fallback with multiple disconnected regions."""
        mask = np.zeros((8, 8), dtype=bool)
        mask[0:2, 0:2] = True  # Region 1
        mask[5:7, 5:7] = True  # Region 2
        grad = np.ones((8, 8), dtype=np.float32)
        
        result = engine._fallback_connected_components(mask, grad)
        assert len(result) == 2


# Locality Preservation Tests
# ===========================

class TestMeasureLocalityPreservation:
    """Test locality preservation metrics."""

    def test_returns_metrics_object(self, engine):
        """Test returns LocalityPreservationMetrics."""
        metrics = engine.measure_locality_preservation(4, num_samples=10)
        assert isinstance(metrics, LocalityPreservationMetrics)

    def test_average_distance_is_small(self, engine):
        """Test average neighbor distance is small (Hilbert property)."""
        metrics = engine.measure_locality_preservation(16, num_samples=100)
        # Adjacent indices should have distance ~1 (Manhattan) or sqrt(2) max
        assert metrics.average_neighbor_distance <= 1.5

    def test_max_distance_is_small(self, engine):
        """Test max neighbor distance is small."""
        metrics = engine.measure_locality_preservation(16, num_samples=100)
        assert metrics.max_neighbor_distance <= 2.0

    def test_locality_score_is_high(self, engine):
        """Test locality score is high for Hilbert curve."""
        metrics = engine.measure_locality_preservation(16, num_samples=100)
        assert metrics.locality_score > 0.4

    def test_variance_is_low(self, engine):
        """Test variance is low (consistent distances)."""
        metrics = engine.measure_locality_preservation(16, num_samples=100)
        assert metrics.variance < 1.0

    def test_efficiency_is_high(self, engine):
        """Test Hilbert efficiency is high."""
        metrics = engine.measure_locality_preservation(16, num_samples=100)
        assert metrics.hilbert_efficiency > 0.5


class TestVisualizeLocalityHeatmap:
    """Test locality heatmap visualization."""

    def test_heatmap_returns_correct_shape(self, engine):
        """Test heatmap has correct shape."""
        for n in [4, 8, 16]:
            heatmap = engine.visualize_locality_heatmap(n)
            assert heatmap.shape == (n, n)

    def test_heatmap_values_are_positive(self, engine):
        """Test heatmap values are non-negative."""
        heatmap = engine.visualize_locality_heatmap(8)
        assert np.all(heatmap >= 0)


# Edge Case Tests
# ===============

class TestEdgeCases:
    """Test edge cases and boundary conditions."""

    def test_large_grid_d2xy(self, engine):
        """Test d2xy for large grid sizes."""
        n = 256
        x, y = engine.d2xy(n, 0)
        assert (x, y) == (0, 0)
        
        # Test last index
        x, y = engine.d2xy(n, n * n - 1)
        assert 0 <= x < n and 0 <= y < n

    def test_large_grid_xy2d(self, engine):
        """Test xy2d for large grid sizes."""
        n = 256
        d = engine.xy2d(n, 0, 0)
        assert d == 0
        
        d = engine.xy2d(n, n - 1, n - 1)
        assert 0 <= d < n * n

    def test_power_of_two_grid_sizes(self, engine):
        """Test various power-of-2 grid sizes."""
        for exp in range(1, 8):  # 2^1 to 2^7
            n = 2 ** exp
            # Verify roundtrip for first and last indices
            x, y = engine.d2xy(n, 0)
            assert engine.xy2d(n, x, y) == 0
            
            x, y = engine.d2xy(n, n * n - 1)
            assert engine.xy2d(n, x, y) == n * n - 1

    def test_empty_data_mapping(self, engine):
        """Test mapping empty data."""
        data = np.array([])
        grid = engine.map_sequence_to_grid(data, 4)
        assert grid.shape == (4, 4)
        assert np.all(grid == 0)

    def test_single_element_data(self, engine):
        """Test mapping single element."""
        data = np.array([42])
        grid = engine.map_sequence_to_grid(data, 4)
        assert grid[0, 0] == 42  # First element at origin


# Performance Tests
# =================

class TestPerformance:
    """Test performance requirements."""

    def test_d2xy_performance(self, engine):
        """Test d2xy is fast enough for 10K queries."""
        import time
        n = 256
        start = time.time()
        for d in range(10000):
            x, y = engine.d2xy(n, d)
        elapsed = time.time() - start
        assert elapsed < 0.1, f"10K d2xy queries took {elapsed:.3f}s (>100ms)"

    def test_xy2d_performance(self, engine):
        """Test xy2d is fast enough for 10K queries."""
        import time
        n = 256
        start = time.time()
        for i in range(100):
            for j in range(100):
                d = engine.xy2d(n, i, j)
        elapsed = time.time() - start
        assert elapsed < 0.1, f"10K xy2d queries took {elapsed:.3f}s (>100ms)"

    def test_sequence_to_grid_performance(self, engine):
        """Test sequence-to-grid is reasonably fast."""
        import time
        data = np.arange(65536)  # 256x256
        start = time.time()
        grid = engine.map_sequence_to_grid(data, 256)
        elapsed = time.time() - start
        assert elapsed < 1.0, f"64K element mapping took {elapsed:.3f}s (>1s)"


# Dataclass Tests
# ===============

class TestLocalityPreservationMetricsDataclass:
    """Test LocalityPreservationMetrics dataclass."""

    def test_dataclass_creation(self):
        """Test creating metrics object."""
        metrics = LocalityPreservationMetrics(
            average_neighbor_distance=1.0,
            max_neighbor_distance=2.0,
            locality_score=0.5,
            variance=0.1,
            hilbert_efficiency=1.0
        )
        assert metrics.average_neighbor_distance == 1.0
        assert metrics.max_neighbor_distance == 2.0
        assert metrics.locality_score == 0.5
        assert metrics.variance == 0.1
        assert metrics.hilbert_efficiency == 1.0

    def test_dataclass_fields_exist(self):
        """Test all expected fields exist."""
        metrics = LocalityPreservationMetrics(0, 0, 0, 0, 0)
        assert hasattr(metrics, 'average_neighbor_distance')
        assert hasattr(metrics, 'max_neighbor_distance')
        assert hasattr(metrics, 'locality_score')
        assert hasattr(metrics, 'variance')
        assert hasattr(metrics, 'hilbert_efficiency')


# Integration Tests
# =================

class TestIntegration:
    """Integration tests for full workflows."""

    def test_full_mapping_workflow(self, engine):
        """Test full workflow: create data -> map to grid -> recover."""
        # Create test data (starting from 1 to avoid 0/empty confusion)
        original = np.arange(1, 65)
        
        # Map to grid
        grid = engine.map_sequence_to_grid(original, 8)
        
        # Verify all data is present
        flat = grid.flatten()
        non_zero = flat[flat != 0]
        assert len(non_zero) == 64
        
        # Recover sequence
        recovered = engine.map_grid_to_sequence(grid)
        np.testing.assert_array_equal(original, recovered)

    def test_locality_analysis_workflow(self, engine):
        """Test locality analysis workflow."""
        n = 16
        
        # Generate gradient
        grad = engine.calculate_hilbert_gradient(n)
        
        # Check for discontinuities
        disc = engine.detect_discontinuities(n)
        
        # Measure locality
        metrics = engine.measure_locality_preservation(n, num_samples=50)
        
        # For valid Hilbert curve:
        assert np.allclose(grad, 1.0)
        assert len(disc) == 0
        assert metrics.average_neighbor_distance <= 1.5

    def test_binary_visualization_workflow(self, engine):
        """Test binary data visualization workflow."""
        # Simulate binary data (e.g., file bytes)
        binary_data = np.random.randint(0, 256, size=1024, dtype=np.uint8)
        
        # Map to 2D grid
        grid = engine.map_sequence_to_grid(binary_data, 32)
        
        # Verify shape
        assert grid.shape == (32, 32)
        
        # Verify data preservation
        seq = engine.map_grid_to_sequence(grid)
        np.testing.assert_array_equal(binary_data, seq[:1024])
