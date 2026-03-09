"""
Tests for Barnes-Hut Quadtree Spatial Partition
Enables O(N log N) force calculation for Tectonic GravityEngine
"""

import pytest
import math


class TestBoundingBox:
    """Tests for BoundingBox dataclass."""

    def test_bounding_box_creation(self):
        """Test BoundingBox initializes correctly."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        assert bbox.x == 0
        assert bbox.y == 0
        assert bbox.width == 100
        assert bbox.height == 100

    def test_bounding_box_contains_point(self):
        """Test BoundingBox.contains_point() works correctly."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        assert bbox.contains_point(50, 50) == True
        assert bbox.contains_point(150, 50) == False
        assert bbox.contains_point(-10, 50) == False
        # Edge cases - points on boundary
        assert bbox.contains_point(0, 0) == True
        assert bbox.contains_point(100, 100) == False  # Exclusive upper bound

    def test_bounding_box_center_of_mass_empty(self):
        """Test BoundingBox center_of_mass for empty region."""
        from systems.infinite_map.quadtree import BoundingBox, QuadNode

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)
        assert node.center_of_mass is None
        assert node.total_mass == 0.0


class TestQuadNode:
    """Tests for QuadNode class."""

    def test_quad_node_insert_single_point(self):
        """Test inserting a single point into QuadNode."""
        from systems.infinite_map.quadtree import BoundingBox, QuadNode

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)
        node.insert(x=50, y=50, mass=1.0, data={"path": "test.py"})
        assert node.total_mass == 1.0
        assert node.center_of_mass is not None
        assert abs(node.center_of_mass[0] - 50.0) < 0.01
        assert abs(node.center_of_mass[1] - 50.0) < 0.01

    def test_quad_node_subdivides_on_overflow(self):
        """Test QuadNode subdivides when capacity exceeded."""
        from systems.infinite_map.quadtree import BoundingBox, QuadNode

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox, capacity=2)
        node.insert(10, 10, 1.0, {"path": "a.py"})
        node.insert(20, 20, 1.0, {"path": "b.py"})
        node.insert(30, 30, 1.0, {"path": "c.py"})
        assert node.is_subdivided()

    def test_quad_node_center_of_mass_multiple(self):
        """Test center_of_mass calculation with multiple points."""
        from systems.infinite_map.quadtree import BoundingBox, QuadNode

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)
        # Use points strictly inside bounds (0-99 inclusive)
        node.insert(0, 0, 1.0, {"path": "a.py"})
        node.insert(99, 99, 1.0, {"path": "b.py"})
        com = node.center_of_mass
        assert com is not None
        # Center of mass should be approximately at midpoint
        assert abs(com[0] - 49.5) < 1.0
        assert abs(com[1] - 49.5) < 1.0


class TestQuadTree:
    """Tests for QuadTree main interface."""

    def test_quadtree_creation(self):
        """Test QuadTree initializes with bounds."""
        from systems.infinite_map.quadtree import QuadTree

        tree = QuadTree(width=1024, height=1024)
        assert tree.width == 1024
        assert tree.height == 1024
        assert tree.root is not None

    def test_quadtree_insert_multiple(self):
        """Test inserting multiple points into QuadTree."""
        from systems.infinite_map.quadtree import QuadTree

        tree = QuadTree(width=1024, height=1024)
        for i in range(100):
            x = (i * 37) % 1024
            y = (i * 53) % 1024
            tree.insert(x, y, mass=1.0, data={"idx": i})
        assert tree.root.total_mass == 100.0

    def test_quadtree_find_nearby(self):
        """Test QuadTree.find_nearby() returns points in radius."""
        from systems.infinite_map.quadtree import QuadTree

        tree = QuadTree(width=1024, height=1024)
        tree.insert(100, 100, 1.0, {"path": "center.py"})
        tree.insert(200, 200, 1.0, {"path": "near.py"})
        tree.insert(900, 900, 1.0, {"path": "far.py"})
        nearby = tree.find_nearby(150, 150, radius=100)
        paths = [p["data"]["path"] for p in nearby]
        assert "center.py" in paths
        assert "near.py" in paths
        assert "far.py" not in paths


class TestBarnesHutApproximation:
    """Tests for Barnes-Hut force approximation."""

    def test_theta_parameter_controls_approximation(self):
        """Test theta parameter controls when to approximate."""
        from systems.infinite_map.quadtree import QuadTree

        tree = QuadTree(width=1024, height=1024, theta=0.5)
        for i in range(50):
            tree.insert((i * 73) % 1024, (i * 97) % 1024, 1.0, {"idx": i})
        force = tree.calculate_force(512, 512, theta=0.5)
        assert force is not None
        assert len(force) == 2  # (fx, fy)

    def test_well_separated_uses_approximation(self):
        """Test that well-separated nodes use center-of-mass approximation."""
        from systems.infinite_map.quadtree import QuadTree

        tree = QuadTree(width=1024, height=1024, theta=0.5)
        for i in range(10):
            tree.insert(900 + i, 900 + i, 1.0, {"cluster": "far"})
        approx_count = tree.count_approximations(100, 100, theta=0.5)
        assert approx_count >= 1


class TestQuadrantAssignment:
    """Tests for quadrant assignment (NW, NE, SW, SE)."""

    def test_quadrant_nw(self):
        """Test NW quadrant (0) assignment."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        # NW is top-left quadrant (x < center_x, y < center_y)
        assert bbox.quadrant(25, 25) == 0

    def test_quadrant_ne(self):
        """Test NE quadrant (1) assignment."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        # NE is top-right quadrant (x >= center_x, y < center_y)
        assert bbox.quadrant(75, 25) == 1

    def test_quadrant_sw(self):
        """Test SW quadrant (2) assignment."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        # SW is bottom-left quadrant (x < center_x, y >= center_y)
        assert bbox.quadrant(25, 75) == 2

    def test_quadrant_se(self):
        """Test SE quadrant (3) assignment."""
        from systems.infinite_map.quadtree import BoundingBox

        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        # SE is bottom-right quadrant (x >= center_x, y >= center_y)
        assert bbox.quadrant(75, 75) == 3
