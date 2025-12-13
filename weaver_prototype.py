#!/usr/bin/env python3
"""
OMNI-GEOMETRY Weaver Prototype
Demonstrates the "No Folders" concept by converting traditional files into a semantic graph

This prototype shows how:
1. Files become nodes in a hyper-graph
2. Semantic relationships create tensile connections
3. The system automatically finds and links related concepts
4. Execution becomes geometric traversal
"""

import os
import json
import uuid
import networkx as nx
import numpy as np
from typing import Dict, List, Tuple, Any, Optional
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import hashlib
import argparse
from dataclasses import dataclass, field
from enum import Enum
import time
from pathlib import Path

@dataclass
class Node:
    """A node in the hyper-graph - replaces traditional files"""
    id: str
    name: str
    content: str
    file_path: str = ""
    file_type: str = "unknown"
    vector: np.array = field(default_factory=lambda: np.array([]))
    metadata: Dict[str, Any] = field(default_factory=dict)
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)

    def __post_init__(self):
        if not self.id:
            self.id = str(uuid.uuid4())
        if not self.vector.any():
            self.vector = self._generate_basic_vector()

    def _generate_basic_vector(self) -> np.array:
        """Generate a basic vector representation of the content"""
        # Simple hash-based vector for demo purposes
        content_hash = hashlib.sha256(self.content.encode()).hexdigest()
        return np.array([int(content_hash[i:i+2], 16) / 255.0 for i in range(0, 64, 2)])

    def to_dict(self) -> Dict:
        return {
            'id': self.id,
            'name': self.name,
            'content': self.content[:100] + '...' if len(self.content) > 100 else self.content,
            'file_path': self.file_path,
            'file_type': self.file_type,
            'vector': self.vector.tolist(),
            'metadata': self.metadata,
            'created_at': self.created_at,
            'updated_at': self.updated_at
        }

class EdgeType(Enum):
    """Types of tensile connections between nodes"""
    SEMANTIC = "semantic"  # Content similarity
    STRUCTURAL = "structural"  # Code dependencies, imports
    TEMPORAL = "temporal"  # Created/modified together
    FUNCTIONAL = "functional"  # Serve similar purpose
    REFERENTIAL = "referential"  # One references another

@dataclass
class Edge:
    """A tensile connection between nodes with strength and type"""
    source_id: str
    target_id: str
    strength: float  # 0.0 to 1.0 tensile strength
    edge_type: EdgeType
    metadata: Dict[str, Any] = field(default_factory=dict)
    created_at: float = field(default_factory=time.time)

    def to_dict(self) -> Dict:
        return {
            'source_id': self.source_id,
            'target_id': self.target_id,
            'strength': self.strength,
            'edge_type': self.edge_type.value,
            'metadata': self.metadata,
            'created_at': self.created_at
        }

class Nexus:
    """The hyper-graph database - replaces traditional file system"""

    def __init__(self):
        self.nodes: Dict[str, Node] = {}
        self.edges: List[Edge] = []
        self.graph = nx.Graph()
        self.vectorizer = TfidfVectorizer(stop_words='english')
        self.vector_cache: Dict[str, np.array] = {}

    def add_node(self, node: Node) -> Node:
        """Add a node to the hyper-graph"""
        if node.id in self.nodes:
            # Update existing node
            existing_node = self.nodes[node.id]
            existing_node.content = node.content
            existing_node.vector = node.vector
            existing_node.updated_at = time.time()
        else:
            # Add new node
            self.nodes[node.id] = node
            self.graph.add_node(node.id, **node.to_dict())

        return self.nodes[node.id]

    def add_edge(self, edge: Edge):
        """Add a tensile connection between nodes"""
        # Check if edge already exists
        for existing_edge in self.edges:
            if (existing_edge.source_id == edge.source_id and
                existing_edge.target_id == edge.target_id and
                existing_edge.edge_type == edge.edge_type):
                # Update strength if this connection is stronger
                if edge.strength > existing_edge.strength:
                    existing_edge.strength = edge.strength
                    existing_edge.updated_at = time.time()
                return

        # Add new edge
        self.edges.append(edge)
        self.graph.add_edge(
            edge.source_id,
            edge.target_id,
            strength=edge.strength,
            type=edge.edge_type.value
        )

    def find_similar_nodes(self, node_id: str, k: int = 5) -> List[Tuple[str, float]]:
        """Find nodes with similar content using vector similarity"""
        if node_id not in self.nodes:
            return []

        target_vector = self.nodes[node_id].vector
        similarities = []

        for other_id, other_node in self.nodes.items():
            if other_id == node_id:
                continue

            similarity = cosine_similarity(
                [target_vector],
                [other_node.vector]
            )[0][0]
            similarities.append((other_id, similarity))

        # Sort by similarity (descending)
        similarities.sort(key=lambda x: x[1], reverse=True)
        return similarities[:k]

    def get_neighbors(self, node_id: str) -> List[Tuple[str, float, EdgeType]]:
        """Get directly connected neighbors with edge information"""
        neighbors = []
        for edge in self.edges:
            if edge.source_id == node_id:
                neighbor_id = edge.target_id
                if neighbor_id in self.nodes:
                    neighbors.append((neighbor_id, edge.strength, edge.edge_type))
            elif edge.target_id == node_id:
                neighbor_id = edge.source_id
                if neighbor_id in self.nodes:
                    neighbors.append((neighbor_id, edge.strength, edge.edge_type))

        return neighbors

    def find_execution_path(self, start_node_id: str, intent: str) -> List[str]:
        """Find optimal geometric path for executing an intent"""
        # This is a simplified version - real implementation would use:
        # 1. Intent vectorization
        # 2. Multi-hop pathfinding
        # 3. Tensile strength optimization
        # 4. Simulation-based validation

        if start_node_id not in self.nodes:
            return []

        # For demo: find path to nodes containing intent keywords
        intent_keywords = set(intent.lower().split())
        path = [start_node_id]
        current_node = start_node_id

        for _ in range(5):  # Max 5 hops for demo
            neighbors = self.get_neighbors(current_node)
            if not neighbors:
                break

            # Find neighbor with most intent keyword matches
            best_neighbor = None
            best_score = 0

            for neighbor_id, strength, _ in neighbors:
                neighbor_node = self.nodes[neighbor_id]
                content_keywords = set(neighbor_node.content.lower().split())
                matches = len(intent_keywords.intersection(content_keywords))
                score = matches * strength

                if score > best_score:
                    best_score = score
                    best_neighbor = neighbor_id

            if best_neighbor and best_neighbor not in path:
                path.append(best_neighbor)
                current_node = best_neighbor
            else:
                break

        return path

    def save_to_file(self, filepath: str):
        """Save the hyper-graph to a file"""
        data = {
            'nodes': [node.to_dict() for node in self.nodes.values()],
            'edges': [edge.to_dict() for edge in self.edges],
            'metadata': {
                'node_count': len(self.nodes),
                'edge_count': len(self.edges),
                'timestamp': time.time()
            }
        }

        with open(filepath, 'w') as f:
            json.dump(data, f, indent=2)

    def load_from_file(self, filepath: str):
        """Load hyper-graph from file"""
        with open(filepath, 'r') as f:
            data = json.load(f)

        self.nodes = {}
        self.edges = []

        for node_data in data['nodes']:
            node = Node(
                id=node_data['id'],
                name=node_data['name'],
                content=node_data['content'],
                file_path=node_data.get('file_path', ''),
                file_type=node_data.get('file_type', 'unknown'),
                vector=np.array(node_data['vector']),
                metadata=node_data.get('metadata', {}),
                created_at=node_data.get('created_at', time.time()),
                updated_at=node_data.get('updated_at', time.time())
            )
            self.add_node(node)

        for edge_data in data['edges']:
            edge = Edge(
                source_id=edge_data['source_id'],
                target_id=edge_data['target_id'],
                strength=edge_data['strength'],
                edge_type=EdgeType(edge_data['edge_type']),
                metadata=edge_data.get('metadata', {}),
                created_at=edge_data.get('created_at', time.time())
            )
            self.add_edge(edge)

class Weaver:
    """The semantic linking daemon - continuously creates and updates connections"""

    def __init__(self, nexus: Nexus):
        self.nexus = nexus
        self.running = False
        self.analysis_interval = 60  # seconds

    def start(self):
        """Start the continuous weaving process"""
        self.running = True
        print("🕸️  Weaver started - continuously analyzing and linking nodes...")

        while self.running:
            start_time = time.time()
            self.analyze_and_link()
            elapsed = time.time() - start_time
            sleep_time = max(0, self.analysis_interval - elapsed)
            time.sleep(sleep_time)

    def stop(self):
        """Stop the weaving process"""
        self.running = False
        print("🕸️  Weaver stopped")

    def analyze_and_link(self):
        """Analyze all nodes and create/update semantic connections"""
        print(f"🔍 Analyzing {len(self.nexus.nodes)} nodes...")

        # Clear old weak connections
        self._prune_weak_connections()

        # Create new semantic connections
        new_connections = 0
        for node_id, node in list(self.nexus.nodes.items()):
            similar_nodes = self.nexus.find_similar_nodes(node_id, k=10)

            for similar_id, similarity in similar_nodes:
                # Only create connections with meaningful similarity
                if similarity > 0.3:  # Threshold
                    edge = Edge(
                        source_id=node_id,
                        target_id=similar_id,
                        strength=similarity,
                        edge_type=EdgeType.SEMANTIC,
                        metadata={'analysis': 'content_similarity'}
                    )
                    self.nexus.add_edge(edge)
                    new_connections += 1

        print(f"✨ Created/updated {new_connections} semantic connections")

        # Analyze structural connections (imports, references)
        structural_connections = self._analyze_structural_connections()
        print(f"🔗 Created/updated {structural_connections} structural connections")

    def _prune_weak_connections(self):
        """Remove weak or outdated connections"""
        initial_count = len(self.nexus.edges)
        strong_edges = []

        for edge in self.nexus.edges:
            # Keep strong connections or recently created
            if edge.strength > 0.2 or (time.time() - edge.created_at) < 3600:
                strong_edges.append(edge)

        self.nexus.edges = strong_edges
        # Rebuild graph
        self.nexus.graph = nx.Graph()
        for node in self.nexus.nodes.values():
            self.nexus.graph.add_node(node.id, **node.to_dict())
        for edge in self.nexus.edges:
            self.nexus.graph.add_edge(
                edge.source_id,
                edge.target_id,
                strength=edge.strength,
                type=edge.edge_type.value
            )

        pruned = initial_count - len(self.nexus.edges)
        if pruned > 0:
            print(f"🌳 Pruned {pruned} weak connections")

    def _analyze_structural_connections(self) -> int:
        """Analyze code dependencies and references"""
        connections = 0

        # Find Python files and analyze imports
        python_nodes = [
            (node_id, node) for node_id, node in self.nexus.nodes.items()
            if node.file_type == 'python' and node.content.strip()
        ]

        for node_id, node in python_nodes:
            # Analyze imports
            lines = node.content.split('\n')
            for line in lines:
                line = line.strip()
                if line.startswith(('import ', 'from ', '# import ', '# from ')):
                    # Extract module name
                    if line.startswith(('import ', '# import ')):
                        module = line.split()[1].split('.')[0]
                    elif line.startswith(('from ', '# from ')):
                        module = line.split()[1].split('.')[0]

                    # Find nodes that match this module
                    for other_id, other_node in self.nexus.nodes.items():
                        if (other_node.name == module or
                            other_node.file_path.endswith(f'/{module}.py') or
                            other_node.file_path.endswith(f'\\{module}.py')):
                            edge = Edge(
                                source_id=node_id,
                                target_id=other_id,
                                strength=0.8,  # Strong structural connection
                                edge_type=EdgeType.STRUCTURAL,
                                metadata={'relationship': 'import_dependency'}
                            )
                            self.nexus.add_edge(edge)
                            connections += 1

        return connections

class Oracle:
    """The intent-based interface - execute commands through geometric traversal"""

    def __init__(self, nexus: Nexus):
        self.nexus = nexus

    def execute(self, intent: str, start_node: str = None) -> Dict:
        """Execute an intent by traversing the geometric graph"""
        print(f"🔮 Executing intent: '{intent}'")

        # Find starting point
        if start_node and start_node in self.nexus.nodes:
            start_id = start_node
        else:
            # Find most relevant starting node
            start_id = self._find_best_starting_node(intent)

        if not start_id:
            return {'success': False, 'message': 'No suitable starting node found'}

        # Find execution path
        path = self.nexus.find_execution_path(start_id, intent)
        print(f"🗺️  Execution path: {' -> '.join(path)}")

        # Simulate execution (in real system, this would modify nodes)
        result = self._simulate_execution(path, intent)

        return {
            'success': True,
            'intent': intent,
            'path': path,
            'result': result,
            'nodes_visited': len(path),
            'execution_time': time.time()
        }

    def _find_best_starting_node(self, intent: str) -> Optional[str]:
        """Find the most relevant node to start execution"""
        intent_vector = self._create_intent_vector(intent)
        best_node = None
        best_score = 0

        for node_id, node in self.nexus.nodes.items():
            similarity = cosine_similarity(
                [intent_vector],
                [node.vector]
            )[0][0]

            if similarity > best_score:
                best_score = similarity
                best_node = node_id

        return best_node if best_score > 0.1 else None

    def _create_intent_vector(self, intent: str) -> np.array:
        """Create a vector representation of the intent"""
        # Simple implementation for demo
        intent_hash = hashlib.sha256(intent.encode()).hexdigest()
        return np.array([int(intent_hash[i:i+2], 16) / 255.0 for i in range(0, 64, 2)])

    def _simulate_execution(self, path: List[str], intent: str) -> str:
        """Simulate what would happen when traversing this path"""
        # In a real system, this would:
        # 1. Modify node contents
        # 2. Create new nodes
        # 3. Update connections
        # 4. Validate changes through simulation

        executed_nodes = []
        for node_id in path:
            node = self.nexus.nodes[node_id]
            executed_nodes.append(f"{node.name} ({node.file_type})")

        return (
            f"Simulated execution of intent '{intent}' through path: "
            f"{' -> '.join(executed_nodes)}. "
            f"In a real system, this would modify the codebase accordingly."
        )

def ingest_directory(nexus: Nexus, directory_path: str):
    """Convert a traditional directory structure into hyper-graph nodes"""
    print(f"📁 Ingesting directory: {directory_path}")

    ingested_count = 0
    skipped_count = 0

    for root, dirs, files in os.walk(directory_path):
        for file in files:
            file_path = os.path.join(root, file)
            relative_path = os.path.relpath(file_path, directory_path)

            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()

                # Determine file type
                file_type = file.split('.')[-1] if '.' in file else 'unknown'

                # Create node
                node = Node(
                    id=str(uuid.uuid5(uuid.NAMESPACE_DNS, file_path)),
                    name=file,
                    content=content,
                    file_path=relative_path,
                    file_type=file_type,
                    metadata={
                        'original_path': file_path,
                        'size': len(content),
                        'lines': len(content.split('\n'))
                    }
                )

                nexus.add_node(node)
                ingested_count += 1

            except Exception as e:
                skipped_count += 1
                print(f"⚠️  Skipped {file_path}: {str(e)}")

    print(f"📊 Ingested {ingested_count} files, skipped {skipped_count}")
    return ingested_count

def visualize_graph(nexus: Nexus, output_file: str = "omni_graph.html"):
    """Generate a visualization of the hyper-graph"""
    print(f"🖼️  Generating graph visualization: {output_file}")

    try:
        import pyvis
        from pyvis.network import Network

        net = Network(
            height="1000px",
            width="100%",
            bgcolor="#222222",
            font_color="white",
            directed=True
        )

        # Add nodes
        for node_id, node in nexus.nodes.items():
            title = f"{node.name}\n{node.file_type}\n{len(node.content)} chars"
            net.add_node(
                node_id,
                label=node.name,
                title=title,
                color="#4CAF50" if node.file_type == 'python' else "#2196F3",
                size=20 + min(50, len(node.content) / 100)
            )

        # Add edges
        for edge in nexus.edges:
            net.add_edge(
                edge.source_id,
                edge.target_id,
                value=edge.strength * 10,
                title=f"{edge.edge_type.value}\nStrength: {edge.strength:.2f}",
                color="#FF5722" if edge.edge_type == EdgeType.SEMANTIC else "#9C27B0"
            )

        net.show(output_file)
        print(f"🎨 Visualization saved to {output_file}")

    except ImportError:
        print("⚠️  PyVis not installed. Install with: pip install pyvis")
        print("📊 Graph statistics:")
        print(f"   Nodes: {len(nexus.nodes)}")
        print(f"   Edges: {len(nexus.edges)}")
        print(f"   Density: {len(nexus.edges) / len(nexus.nodes):.2f} edges per node")

def main():
    """Main demonstration of the Weaver prototype"""
    parser = argparse.ArgumentParser(
        description="OMNI-GEOMETRY Weaver Prototype - No Folders OS Demonstration"
    )
    parser.add_argument(
        "--ingest",
        help="Directory to ingest into the hyper-graph",
        default="."
    )
    parser.add_argument(
        "--intent",
        help="Intent to execute (e.g., 'make login secure')",
        default="analyze security vulnerabilities"
    )
    parser.add_argument(
        "--visualize",
        action="store_true",
        help="Generate graph visualization"
    )
    parser.add_argument(
        "--save",
        help="Save hyper-graph to file",
        default="omni_graph.json"
    )
    parser.add_argument(
        "--load",
        help="Load hyper-graph from file"
    )

    args = parser.parse_args()

    print("🚀 OMNI-GEOMETRY Weaver Prototype")
    print("🌌 Demonstrating 'No Folders' OS Concept")
    print("=" * 50)

    # Initialize Nexus
    nexus = Nexus()

    # Load existing graph if specified
    if args.load:
        print(f"📥 Loading hyper-graph from {args.load}")
        nexus.load_from_file(args.load)

    # Ingest directory
    if args.ingest:
        ingest_directory(nexus, args.ingest)

    # Start Weaver in background
    weaver = Weaver(nexus)
    import threading
    weaver_thread = threading.Thread(target=weaver.start, daemon=True)
    weaver_thread.start()

    # Let Weaver analyze for a moment
    time.sleep(5)

    # Create Oracle and execute intent
    oracle = Oracle(nexus)
    result = oracle.execute(args.intent)

    print("\n📋 Execution Result:")
    print(f"   Intent: {result['intent']}")
    print(f"   Success: {result['success']}")
    print(f"   Path Length: {result['nodes_visited']} nodes")
    print(f"   Result: {result['result']}")

    # Visualize graph
    if args.visualize:
        visualize_graph(nexus, "omni_geometry_visualization.html")

    # Save graph
    if args.save:
        nexus.save_to_file(args.save)
        print(f"💾 Hyper-graph saved to {args.save}")

    # Stop Weaver
    weaver.stop()

    print("\n🎉 Demonstration complete!")
    print("💡 Key Concepts Demonstrated:")
    print("   ✅ Files become nodes in a hyper-graph")
    print("   ✅ Semantic relationships create tensile connections")
    print("   ✅ Execution = geometric traversal")
    print("   ✅ Intent-based interface replaces command lines")
    print("   ✅ Continuous semantic analysis replaces file organization")

if __name__ == "__main__":
    main()