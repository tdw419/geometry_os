#!/usr/bin/env python3
"""
Test suite for GIQ Benchmark Framework

Validates benchmark correctness and measures baseline scores.

Usage:
    pytest test_giq_benchmark.py -v
    python3 test_giq_benchmark.py
"""

import unittest
import math
from systems.intelligence.giq_benchmark import (
    GIQBenchmark,
    BenchmarkCategory,
    SpatialTransforms,
    PatternRecognition,
    TopologyAnalysis,
    SymmetryDetection
)


class TestSpatialTransforms(unittest.TestCase):
    """Test spatial transformation operations."""

    def test_rotation_90(self):
        """Test 90 degree rotation."""
        points = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        result = SpatialTransforms.rotation_90(points)
        expected = [(0, 1), (-1, 0), (0, -1), (1, 0)]
        for r, e in zip(result, expected):
            self.assertAlmostEqual(r[0], e[0], places=5)
            self.assertAlmostEqual(r[1], e[1], places=5)

    def test_rotation_180(self):
        """Test 180 degree rotation."""
        points = [(1, 2), (-3, 4), (0, 0)]
        result = SpatialTransforms.rotation_180(points)
        expected = [(-1, -2), (3, -4), (0, 0)]
        for r, e in zip(result, expected):
            self.assertAlmostEqual(r[0], e[0], places=5)
            self.assertAlmostEqual(r[1], e[1], places=5)

    def test_rotation_arbitrary(self):
        """Test arbitrary angle rotation."""
        points = [(1, 0)]
        result = SpatialTransforms.rotation_arbitrary(points, 45)
        # Rotating (1,0) by 45° gives (cos(45), sin(45)) ≈ (0.707, 0.707)
        expected = math.cos(math.radians(45))
        self.assertAlmostEqual(result[0][0], expected, places=3)
        self.assertAlmostEqual(result[0][1], expected, places=3)

    def test_scale(self):
        """Test scaling transformation."""
        points = [(2, 3), (-1, 4)]
        result = SpatialTransforms.scale(points, 2, 0.5)
        self.assertEqual(result, [(4, 1.5), (-2, 2)])

    def test_translate(self):
        """Test translation transformation."""
        points = [(0, 0), (1, 1)]
        result = SpatialTransforms.translate(points, 5, -3)
        self.assertEqual(result, [(5, -3), (6, -2)])

    def test_reflect_x(self):
        """Test reflection across x-axis."""
        points = [(1, 2), (3, -4)]
        result = SpatialTransforms.reflect_x(points)
        self.assertEqual(result, [(1, -2), (3, 4)])

    def test_reflect_y(self):
        """Test reflection across y-axis."""
        points = [(1, 2), (-3, 4)]
        result = SpatialTransforms.reflect_y(points)
        self.assertEqual(result, [(-1, 2), (3, 4)])

    def test_compose_transforms(self):
        """Test composed transformations."""
        points = [(1, 0)]
        transforms = [
            ('rotate', 90),
            ('scale', (2, 2)),
            ('translate', (1, 1))
        ]
        result = SpatialTransforms.compose_transforms(points, transforms)
        # After 90° rotation: (0, 1)
        # After scale 2x: (0, 2)
        # After translate: (1, 3)
        self.assertAlmostEqual(result[0][0], 1, places=5)
        self.assertAlmostEqual(result[0][1], 3, places=5)


class TestPatternRecognition(unittest.TestCase):
    """Test pattern recognition functions."""

    def test_detect_symmetry_axis_square(self):
        """Test symmetry detection for square."""
        # Square centered at origin
        points = [(-1, -1), (1, -1), (1, 1), (-1, 1)]
        axes = PatternRecognition.detect_symmetry_axis(points)
        self.assertTrue(len(axes) >= 2)  # Should have x and y symmetry

    def test_detect_symmetry_axis_asymmetric(self):
        """Test symmetry detection for asymmetric shape."""
        # Asymmetric shape
        points = [(0, 0), (1, 2), (3, 1), (2, -1)]
        axes = PatternRecognition.detect_symmetry_axis(points)
        # Asymmetric shape may have 0 or 1 symmetry axis
        self.assertLessEqual(len(axes), 1)


class TestTopologyAnalysis(unittest.TestCase):
    """Test topology analysis functions."""

    def test_euler_characteristic_cube(self):
        """Test Euler characteristic for cube (V-E+F=2)."""
        # Cube: 8 vertices, 12 edges, 6 faces
        euler = TopologyAnalysis.compute_euler_characteristic(8, 12, 6)
        self.assertEqual(euler, 2)

    def test_euler_characteristic_tetrahedron(self):
        """Test Euler characteristic for tetrahedron (V-E+F=2)."""
        # Tetrahedron: 4 vertices, 6 edges, 4 faces
        euler = TopologyAnalysis.compute_euler_characteristic(4, 6, 4)
        self.assertEqual(euler, 2)

    def test_compute_genus_sphere(self):
        """Test genus computation for sphere (genus=0)."""
        # Sphere has genus 0
        euler = TopologyAnalysis.compute_euler_characteristic(2, 1, 1)
        genus = TopologyAnalysis.compute_genus(euler)
        self.assertEqual(genus, 0)

    def test_compute_genus_torus(self):
        """Test genus computation for torus (genus=1)."""
        # Torus has V-E+F = 0, so genus = 1
        euler = 0
        genus = TopologyAnalysis.compute_genus(euler)
        self.assertEqual(genus, 1)

    def test_check_connectivity(self):
        """Test graph connectivity check."""
        # Connected graph
        graph = {0: [1, 2], 1: [0, 2], 2: [0, 1]}
        components = TopologyAnalysis.check_connectivity(graph)
        self.assertEqual(components, 1)

        # Disconnected graph
        graph = {0: [1], 1: [0], 2: [3], 3: [2]}
        components = TopologyAnalysis.check_connectivity(graph)
        self.assertEqual(components, 2)


class TestSymmetryDetection(unittest.TestCase):
    """Test symmetry detection functions."""

    def test_find_symmetry_group_square(self):
        """Test symmetry group for square."""
        points = [(0, 0), (1, 0), (1, 1), (0, 1)]
        symmetries = SymmetryDetection.find_symmetry_group(points)
        self.assertTrue(symmetries['has_point_symmetry'])
        self.assertGreaterEqual(len(symmetries['rotation_orders']), 1)

    def test_classify_spatial_group(self):
        """Test spatial group classification."""
        # D4 symmetry (square) - reflection_axes is a list
        symmetries = {
            'has_point_symmetry': True,
            'rotation_orders': [1, 2, 4],
            'reflection_axes': [0, 45, 90, 135]  # 4 reflection axes
        }
        group = SymmetryDetection.classify_spatial_group(symmetries)
        self.assertEqual(group, "D4")

        # C1 (no symmetry)
        symmetries = {
            'has_point_symmetry': False,
            'rotation_orders': [1],
            'reflection_axes': []
        }
        group = SymmetryDetection.classify_spatial_group(symmetries)
        self.assertEqual(group, "C1")


class TestGIQBenchmark(unittest.TestCase):
    """Test the full benchmark framework."""

    def setUp(self):
        """Set up benchmark instance."""
        self.benchmark = GIQBenchmark()

    def test_run_all(self):
        """Test running all benchmarks."""
        suite = self.benchmark.run_all()

        self.assertGreaterEqual(suite.total_tests, 8)  # At least 8 tests
        self.assertGreaterEqual(suite.passed, 6)  # Most tests should pass
        self.assertGreaterEqual(suite.giq_score, 50)  # Should score at least 50/100

    def test_run_category_spatial(self):
        """Test running spatial category only."""
        suite = self.benchmark.run_category(BenchmarkCategory.SPATIAL)

        spatial_tests = [r for r in suite.results if r.category == 'spatial']
        self.assertGreaterEqual(len(spatial_tests), 3)  # At least 3 spatial tests

    def test_run_category_symmetry(self):
        """Test running symmetry category only."""
        suite = self.benchmark.run_category(BenchmarkCategory.SYMMETRY)

        symmetry_tests = [r for r in suite.results if r.category == 'symmetry']
        self.assertEqual(len(symmetry_tests), 3)


def run_tests():
    """Run all tests."""
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()

    suite.addTests(loader.loadTestsFromTestCase(TestSpatialTransforms))
    suite.addTests(loader.loadTestsFromTestCase(TestPatternRecognition))
    suite.addTests(loader.loadTestsFromTestCase(TestTopologyAnalysis))
    suite.addTests(loader.loadTestsFromTestCase(TestSymmetryDetection))
    suite.addTests(loader.loadTestsFromTestCase(TestGIQBenchmark))

    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)

    return 0 if result.wasSuccessful() else 1


if __name__ == "__main__":
    exit(run_tests())
