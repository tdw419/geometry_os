"""
Tests for Level of Detail (LOD) rendering using quadtree.

Verifies that dense "City Blocks" are shown from afar and
individual "Windows" (Tokens) up close.
"""

import pytest
from systems.infinite_map.quadtree import QuadTree, QuadNode


class TestLODQueries:
    """Tests for LOD-aware spatial queries."""

    def test_quadtree_get_visible_nodes(self):
        """Test QuadTree can return nodes visible at a zoom level."""
        tree = QuadTree(width=1024, height=1024)

        # Insert 100 points
        for i in range(100):
            tree.insert((i * 73) % 1024, (i * 97) % 1024, 1.0, {"idx": i})

        # At low zoom (see all), should return root-level aggregation
        # With min_pixels=200, nodes must be 200+ pixels to subdivide
        visible = tree.get_visible_nodes(camera_x=512, camera_y=512, zoom=0.1, min_pixels=200.0)

        assert len(visible) >= 1
        # Root node should be in visible set (1024 * 0.1 = 102.4 < 200, so use root)
        assert any(n.total_mass == 100.0 for n in visible)

    def test_quadtree_high_zoom_shows_details(self):
        """Test high zoom level shows individual particles."""
        tree = QuadTree(width=1024, height=1024)

        # Insert points in clusters
        for i in range(10):
            tree.insert(100 + i * 5, 100 + i * 5, 1.0, {"cluster": "A"})
        for i in range(10):
            tree.insert(900 + i * 5, 900 + i * 5, 1.0, {"cluster": "B"})

        # At high zoom on cluster A, should see individual particles
        visible = tree.get_visible_nodes(camera_x=120, camera_y=120, zoom=10.0)

        # Should have leaf nodes with individual particles
        leaf_count = sum(1 for n in visible if not n.is_subdivided() and len(n.particles) > 0)
        assert leaf_count >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
