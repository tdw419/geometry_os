"""
Evolution Visualization Module

Provides visualization tools for tile evolution from infinite_map_rs:
- Phylogeny trees showing evolutionary relationships
- Fitness heatmaps for spatial fitness distribution
- Species clustering by genome similarity
- Animation frame generation for evolution playback
"""

import math
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Tuple, Set


@dataclass
class PhylogenyNode:
    """
    A node in the phylogeny tree representing a tile.

    Tracks evolutionary lineage and fitness over generations.
    """
    tile_id: str
    generation: int
    fitness: float
    parent_id: Optional[str] = None
    children: List['PhylogenyNode'] = field(default_factory=list)
    x: int = 0
    y: int = 0
    genome: List[int] = field(default_factory=list)

    def add_child(self, child: 'PhylogenyNode'):
        """Add a child node to this node"""
        self.children.append(child)


@dataclass
class PhylogenyTree:
    """
    A phylogeny tree showing evolutionary relationships between tiles.

    Built from tile data exported from infinite_map_rs.
    """
    root: Optional[PhylogenyNode] = None
    nodes: Dict[str, PhylogenyNode] = field(default_factory=dict)

    @classmethod
    def from_tiles(cls, tiles: List[Dict[str, Any]]) -> 'PhylogenyTree':
        """
        Build a phylogeny tree from tile data.

        Args:
            tiles: List of tile dictionaries with id, generation, fitness, parent_id

        Returns:
            A PhylogenyTree with parent-child relationships established
        """
        tree = cls()
        nodes_by_id: Dict[str, PhylogenyNode] = {}

        # Create all nodes first
        for tile in tiles:
            node = PhylogenyNode(
                tile_id=tile["id"],
                generation=tile["generation"],
                fitness=tile.get("fitness", 0.0),
                parent_id=tile.get("parent_id"),
                x=tile.get("x", 0),
                y=tile.get("y", 0),
                genome=tile.get("genome", []),
            )
            nodes_by_id[tile["id"]] = node

        tree.nodes = nodes_by_id

        # Establish parent-child relationships
        for node in nodes_by_id.values():
            if node.parent_id and node.parent_id in nodes_by_id:
                nodes_by_id[node.parent_id].add_child(node)
            elif node.parent_id is None:
                tree.root = node

        return tree

    def get_lineage(self, tile_id: str) -> List[PhylogenyNode]:
        """
        Get the lineage from a node back to root.

        Args:
            tile_id: The tile ID to trace lineage for

        Returns:
            List of nodes from root to the specified tile
        """
        lineage = []
        current = self.nodes.get(tile_id)

        while current:
            lineage.insert(0, current)
            if current.parent_id:
                current = self.nodes.get(current.parent_id)
            else:
                current = None

        return lineage

    def get_descendants(self, tile_id: str) -> List[PhylogenyNode]:
        """
        Get all descendants of a node.

        Args:
            tile_id: The tile ID to get descendants for

        Returns:
            List of all descendant nodes
        """
        descendants = []
        node = self.nodes.get(tile_id)

        if node:
            self._collect_descendants(node, descendants)

        return descendants

    def _collect_descendants(self, node: PhylogenyNode, descendants: List[PhylogenyNode]):
        """Recursively collect descendants"""
        for child in node.children:
            descendants.append(child)
            self._collect_descendants(child, descendants)


@dataclass
class FitnessHeatmap:
    """
    A 2D heatmap showing fitness distribution across the map.

    Used for visualizing spatial fitness patterns.
    """
    width: int
    height: int
    data: List[List[float]]  # 2D array of normalized fitness values [0, 1]

    @classmethod
    def from_tiles(cls, tiles: List[Dict[str, Any]], width: int, height: int) -> 'FitnessHeatmap':
        """
        Create a heatmap from tile fitness values.

        Args:
            tiles: List of tiles with x, y, fitness
            width: Width of the heatmap grid
            height: Height of the heatmap grid

        Returns:
            A FitnessHeatmap with normalized values
        """
        # Initialize with zeros
        data = [[0.0 for _ in range(width)] for _ in range(height)]

        # Find min/max for normalization
        fitness_values = [t["fitness"] for t in tiles]
        min_fit = min(fitness_values) if fitness_values else 0
        max_fit = max(fitness_values) if fitness_values else 1
        range_fit = max_fit - min_fit if max_fit > min_fit else 1

        # Fill in normalized values
        for tile in tiles:
            x, y = tile["x"], tile["y"]
            if 0 <= x < width and 0 <= y < height:
                normalized = (tile.get("fitness", 0.0) - min_fit) / range_fit
                data[y][x] = normalized

        return cls(width=width, height=height, data=data)

    def get_value(self, x: int, y: int) -> float:
        """Get the value at a grid position"""
        if 0 <= x < self.width and 0 <= y < self.height:
            return self.data[y][x]
        return 0.0

    def get_color(self, x: int, y: int) -> Tuple[int, int, int, int]:
        """
        Get RGBA color for a position.

        Uses a blue-to-red gradient (cold to hot).
        """
        value = self.get_value(x, y)

        # Blue (cold) to Red (hot) gradient
        r = int(255 * value)
        g = int(50 * (1 - abs(value - 0.5) * 2))  # Peak green at 0.5
        b = int(255 * (1 - value))
        a = 200  # Semi-transparent

        return (r, g, b, a)

    def get_interpolated_value(self, x: float, y: float) -> float:
        """
        Get interpolated value at a fractional position.

        Uses bilinear interpolation.
        """
        x0, y0 = int(x), int(y)
        x1, y1 = min(x0 + 1, self.width - 1), min(y0 + 1, self.height - 1)

        # Bilinear interpolation
        fx, fy = x - x0, y - y0

        v00 = self.get_value(x0, y0)
        v10 = self.get_value(x1, y0)
        v01 = self.get_value(x0, y1)
        v11 = self.get_value(x1, y1)

        top = v00 * (1 - fx) + v10 * fx
        bottom = v01 * (1 - fx) + v11 * fx

        return top * (1 - fy) + bottom * fy


@dataclass
class SpeciesCluster:
    """
    A cluster of tiles with similar genomes.

    Represents a "species" in the evolutionary system.
    """
    cluster_id: int
    member_ids: List[str]
    centroid_id: str
    color: Tuple[int, int, int]

    @property
    def size(self) -> int:
        """Number of members in this cluster"""
        return len(self.member_ids)

    @classmethod
    def from_tiles(
        cls,
        tiles: List[Dict[str, Any]],
        similarity_threshold: float = 0.8
    ) -> List['SpeciesCluster']:
        """
        Cluster tiles by genome similarity.

        Args:
            tiles: List of tiles with genome data
            similarity_threshold: Minimum similarity to be in same cluster (0-1)

        Returns:
            List of SpeciesCluster objects
        """
        if not tiles:
            return []

        clusters: List[SpeciesCluster] = []
        assigned: Set[str] = set()

        # Pre-defined distinct colors for clusters
        colors = [
            (255, 100, 100),   # Red
            (100, 255, 100),   # Green
            (100, 100, 255),   # Blue
            (255, 255, 100),   # Yellow
            (255, 100, 255),   # Magenta
            (100, 255, 255),   # Cyan
            (255, 180, 100),   # Orange
            (180, 100, 255),   # Purple
        ]

        # Simple greedy clustering
        for i, tile in enumerate(tiles):
            if tile["id"] in assigned:
                continue

            # Start a new cluster with this tile as centroid
            members = [tile["id"]]
            assigned.add(tile["id"])

            # Find similar tiles
            for j, other in enumerate(tiles):
                if other["id"] in assigned:
                    continue

                similarity = cls._genome_similarity(
                    tile.get("genome", []),
                    other.get("genome", [])
                )

                if similarity >= similarity_threshold:
                    members.append(other["id"])
                    assigned.add(other["id"])

            # Find highest fitness member as centroid
            best_fitness = tile.get("fitness", 0.0)
            centroid_id = tile["id"]
            for member_id in members:
                for t in tiles:
                    if t["id"] == member_id and t.get("fitness", 0.0) > best_fitness:
                        best_fitness = t.get("fitness", 0.0)
                        centroid_id = member_id

            cluster = cls(
                cluster_id=len(clusters),
                member_ids=members,
                centroid_id=centroid_id,
                color=colors[len(clusters) % len(colors)]
            )
            clusters.append(cluster)

        return clusters

    @staticmethod
    def _genome_similarity(genome1: List[int], genome2: List[int]) -> float:
        """Calculate similarity between two genomes (Jaccard-like)"""
        if not genome1 or not genome2:
            return 0.0

        # Pad to same length
        max_len = max(len(genome1), len(genome2))
        g1 = genome1 + [0] * (max_len - len(genome1))
        g2 = genome2 + [0] * (max_len - len(genome2))

        # Calculate matching ratio
        matches = sum(1 for a, b in zip(g1, g2) if a == b)
        return matches / max_len


class EvolutionVisualizer:
    """
    Main visualization controller for tile evolution.

    Integrates phylogeny, heatmap, and clustering visualizations.
    """

    def __init__(self):
        self.tree: Optional[PhylogenyTree] = None
        self.heatmap: Optional[FitnessHeatmap] = None
        self.clusters: List[SpeciesCluster] = []
        self._tiles: List[Dict[str, Any]] = []

    def load_from_map(self, map_data: Dict[str, Any]):
        """
        Load visualization data from infinite_map_rs map data.

        Args:
            map_data: Dictionary with 'tiles' key containing tile list
        """
        tiles = map_data.get("tiles", [])
        self._tiles = tiles

        if not tiles:
            return

        # Determine grid dimensions
        max_x = max(t.get("x", 0) for t in tiles) + 1
        max_y = max(t.get("y", 0) for t in tiles) + 1

        # Build phylogeny tree
        self.tree = PhylogenyTree.from_tiles(tiles)

        # Build fitness heatmap
        self.heatmap = FitnessHeatmap.from_tiles(tiles, width=max_x, height=max_y)

        # Build species clusters
        self.clusters = SpeciesCluster.from_tiles(tiles)

    def get_animation_frames(self) -> List[Dict[str, Any]]:
        """
        Generate animation frames showing evolution over time.

        Returns:
            List of frames, one per generation
        """
        if not self._tiles:
            return []

        # Group tiles by generation
        by_generation: Dict[int, List[Dict]] = {}
        for tile in self._tiles:
            gen = tile["generation"]
            if gen not in by_generation:
                by_generation[gen] = []
            by_generation[gen].append(tile)

        # Create a frame for each generation
        frames = []
        for gen in sorted(by_generation.keys()):
            frame = {
                "generation": gen,
                "tiles": by_generation[gen],
                "count": len(by_generation[gen]),
            }
            frames.append(frame)

        return frames

    def render_frame(self, generation: int) -> Dict[str, Any]:
        """
        Render a single generation frame as glyph commands.

        Args:
            generation: The generation number to render

        Returns:
            Dictionary with glyph commands for rendering
        """
        commands = []

        for tile in self._tiles:
            if tile["generation"] > generation:
                continue

            # Determine color based on cluster
            color = (100, 100, 100, 200)  # Default gray
            for cluster in self.clusters:
                if tile["id"] in cluster.member_ids:
                    color = cluster.color + (200,)
                    break

            # Create orb command
            cmd = {
                "opcode": "ORB",
                "x": tile["x"] * 20,  # Scale for visibility
                "y": tile["y"] * 20,
                "radius": 5 + int(tile.get("fitness", 0.5) * 10),  # Size by fitness
                "color": color,
            }
            commands.append(cmd)

        return {
            "generation": generation,
            "commands": commands,
        }

    def get_species_stats(self) -> Dict[str, Any]:
        """
        Get statistics about species in the current view.

        Returns:
            Dictionary with species statistics
        """
        if not self._tiles:
            return {
                "total_species": 0,
                "avg_fitness": 0.0,
                "max_fitness": 0.0,
            }

        fitness_values = [t["fitness"] for t in self._tiles]

        return {
            "total_species": len(self.clusters),
            "avg_fitness": sum(fitness_values) / len(fitness_values),
            "max_fitness": max(fitness_values),
            "min_fitness": min(fitness_values),
            "total_tiles": len(self._tiles),
        }
