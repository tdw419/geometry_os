"""
Tests for Evolution Visualization
TDD tests for Task 5.2: Evolution Visualization
"""

import sys
from pathlib import Path

# Add api directory to path
sys.path.insert(0, str(Path(__file__).parent))

from evolution_viz import (
    EvolutionVisualizer,
    FitnessHeatmap,
    PhylogenyNode,
    PhylogenyTree,
    SpeciesCluster,
)


class TestPhylogenyNode:
    """Tests for phylogeny tree nodes"""

    def test_create_phylogeny_node(self):
        """A phylogeny node can be created with tile data"""
        node = PhylogenyNode(
            tile_id="tile_001",
            generation=5,
            fitness=0.85,
            parent_id="tile_000",
        )

        assert node.tile_id == "tile_001"
        assert node.generation == 5
        assert node.fitness == 0.85
        assert node.parent_id == "tile_000"
        assert node.children == []

    def test_node_can_have_children(self):
        """A node can have child nodes"""
        parent = PhylogenyNode(tile_id="parent", generation=1, fitness=0.5)
        child = PhylogenyNode(tile_id="child", generation=2, fitness=0.7, parent_id="parent")

        parent.add_child(child)

        assert len(parent.children) == 1
        assert parent.children[0].tile_id == "child"


class TestPhylogenyTree:
    """Tests for phylogeny tree structure"""

    def test_create_tree_from_tiles(self):
        """A phylogeny tree can be created from tile data"""
        tiles = [
            {"id": "tile_000", "generation": 0, "fitness": 0.5, "parent_id": None},
            {"id": "tile_001", "generation": 1, "fitness": 0.7, "parent_id": "tile_000"},
            {"id": "tile_002", "generation": 1, "fitness": 0.6, "parent_id": "tile_000"},
        ]

        tree = PhylogenyTree.from_tiles(tiles)

        assert tree.root.tile_id == "tile_000"
        assert len(tree.root.children) == 2

    def test_get_lineage(self):
        """Can get the lineage from a node back to root"""
        tiles = [
            {"id": "t0", "generation": 0, "fitness": 0.5, "parent_id": None},
            {"id": "t1", "generation": 1, "fitness": 0.6, "parent_id": "t0"},
            {"id": "t2", "generation": 2, "fitness": 0.7, "parent_id": "t1"},
        ]

        tree = PhylogenyTree.from_tiles(tiles)
        lineage = tree.get_lineage("t2")

        assert len(lineage) == 3
        assert lineage[0].tile_id == "t0"
        assert lineage[1].tile_id == "t1"
        assert lineage[2].tile_id == "t2"

    def test_get_all_descendants(self):
        """Can get all descendants of a node"""
        tiles = [
            {"id": "root", "generation": 0, "fitness": 0.5, "parent_id": None},
            {"id": "c1", "generation": 1, "fitness": 0.6, "parent_id": "root"},
            {"id": "c2", "generation": 1, "fitness": 0.6, "parent_id": "root"},
            {"id": "gc1", "generation": 2, "fitness": 0.7, "parent_id": "c1"},
        ]

        tree = PhylogenyTree.from_tiles(tiles)
        descendants = tree.get_descendants("root")

        assert len(descendants) == 3
        assert "c1" in [d.tile_id for d in descendants]
        assert "c2" in [d.tile_id for d in descendants]
        assert "gc1" in [d.tile_id for d in descendants]


class TestFitnessHeatmap:
    """Tests for fitness heatmap generation"""

    def test_create_heatmap_from_tiles(self):
        """A heatmap can be generated from tile fitness values"""
        tiles = [
            {"x": 0, "y": 0, "fitness": 0.1},
            {"x": 1, "y": 0, "fitness": 0.5},
            {"x": 0, "y": 1, "fitness": 0.9},
            {"x": 1, "y": 1, "fitness": 0.3},
        ]

        heatmap = FitnessHeatmap.from_tiles(tiles, width=2, height=2)

        assert heatmap.width == 2
        assert heatmap.height == 2
        # Check values are normalized
        assert heatmap.get_value(0, 1) > heatmap.get_value(0, 0)  # 0.9 > 0.1

    def test_heatmap_to_color(self):
        """Heatmap values can be converted to colors"""
        heatmap = FitnessHeatmap(width=2, height=2, data=[[0.0, 0.5], [1.0, 0.25]])

        # Low fitness = blue/cold
        low_color = heatmap.get_color(0, 0)
        # High fitness = red/hot
        high_color = heatmap.get_color(1, 0)

        # High fitness should have more red
        assert high_color[0] > low_color[0]  # Red channel

    def test_heatmap_interpolation(self):
        """Heatmap can interpolate values between tiles"""
        heatmap = FitnessHeatmap(width=2, height=2, data=[[0.0, 1.0], [0.0, 0.0]])

        # Interpolate at center
        center_value = heatmap.get_interpolated_value(0.5, 0.5)

        # Should be somewhere between min and max
        assert 0.0 <= center_value <= 1.0


class TestSpeciesCluster:
    """Tests for species clustering"""

    def test_cluster_tiles_by_genome(self):
        """Tiles can be clustered by genome similarity"""
        tiles = [
            {"id": "t1", "genome": [1, 0, 0, 1]},
            {"id": "t2", "genome": [1, 0, 0, 1]},  # Same as t1
            {"id": "t3", "genome": [0, 1, 1, 0]},  # Different
            {"id": "t4", "genome": [0, 1, 1, 0]},  # Same as t3
        ]

        clusters = SpeciesCluster.from_tiles(tiles, similarity_threshold=0.9)

        assert len(clusters) == 2
        assert clusters[0].size == 2
        assert clusters[1].size == 2

    def test_cluster_centroid(self):
        """Each cluster has a representative centroid"""
        tiles = [
            {"id": "t1", "genome": [1, 0, 0, 1], "fitness": 0.8},
            {"id": "t2", "genome": [1, 0, 0, 1], "fitness": 0.9},
        ]

        clusters = SpeciesCluster.from_tiles(tiles, similarity_threshold=0.9)

        # Centroid should be the highest fitness member
        assert clusters[0].centroid_id == "t2"

    def test_cluster_color_assignment(self):
        """Each cluster gets a unique color for visualization"""
        tiles = [
            {"id": "t1", "genome": [1, 0, 0, 1]},
            {"id": "t2", "genome": [0, 1, 1, 0]},
            {"id": "t3", "genome": [0, 0, 1, 1]},
        ]

        clusters = SpeciesCluster.from_tiles(tiles, similarity_threshold=0.9)

        colors = [c.color for c in clusters]
        # All colors should be unique
        assert len(set(colors)) == len(colors)


class TestEvolutionVisualizer:
    """Tests for the evolution visualizer"""

    def test_create_visualizer(self):
        """An evolution visualizer can be created"""
        viz = EvolutionVisualizer()

        assert viz.tree is None
        assert viz.heatmap is None
        assert viz.clusters == []

    def test_load_phylogeny_from_map(self):
        """Can load phylogeny from infinite_map_rs data"""
        viz = EvolutionVisualizer()

        # Mock tile data from infinite_map_rs
        map_data = {
            "tiles": [
                {"id": "t0", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1, 0]},
                {"id": "t1", "x": 1, "y": 0, "generation": 1, "fitness": 0.7, "parent_id": "t0", "genome": [1, 1]},
            ]
        }

        viz.load_from_map(map_data)

        assert viz.tree is not None
        assert viz.heatmap is not None
        assert len(viz.clusters) >= 1

    def test_get_evolution_animation_frames(self):
        """Can generate animation frames showing evolution over time"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t0", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1]},
                {"id": "t1", "x": 1, "y": 0, "generation": 1, "fitness": 0.6, "parent_id": "t0", "genome": [1]},
                {"id": "t2", "x": 0, "y": 1, "generation": 2, "fitness": 0.7, "parent_id": "t1", "genome": [1]},
            ]
        }

        viz.load_from_map(map_data)
        frames = viz.get_animation_frames()

        # Should have one frame per generation
        assert len(frames) == 3

    def test_render_frame(self):
        """Can render an animation frame to glyph commands"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t0", "x": 100, "y": 100, "generation": 0, "fitness": 0.8, "parent_id": None, "genome": [1]},
            ]
        }

        viz.load_from_map(map_data)
        frame = viz.render_frame(generation=0)

        # Frame should contain glyph commands
        assert "commands" in frame
        assert len(frame["commands"]) > 0

    def test_get_species_stats(self):
        """Can get statistics about species in the current view"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t1", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1, 0]},
                {"id": "t2", "x": 1, "y": 0, "generation": 0, "fitness": 0.6, "parent_id": None, "genome": [1, 0]},
                {"id": "t3", "x": 0, "y": 1, "generation": 0, "fitness": 0.4, "parent_id": None, "genome": [0, 1]},
            ]
        }

        viz.load_from_map(map_data)
        stats = viz.get_species_stats()

        assert "total_species" in stats
        assert "avg_fitness" in stats
        assert "max_fitness" in stats
        assert stats["total_species"] >= 1
