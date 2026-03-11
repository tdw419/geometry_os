"""
DistrictFormer - Clustering engine for neural district coalescence.

Phase 49: Neural District Coalescence
Groups agents into tectonic plates based on vector similarity.
"""

import uuid

import numpy as np

from systems.tectonic.plate import TectonicPlate


class VectorSimilarity:
    """
    Vector similarity computations for clustering.

    PixelBrain spec: cosine_similarity >= 0.75 for clustering threshold.
    """

    @staticmethod
    def cosine(vec_a: np.ndarray, vec_b: np.ndarray) -> float:
        """
        Compute cosine similarity between two vectors.

        Returns:
            float: Similarity in range [-1, 1]
                - 1.0 = identical direction
                - 0.0 = orthogonal
                - -1.0 = opposite direction
        """
        # Handle zero vectors
        norm_a = np.linalg.norm(vec_a)
        norm_b = np.linalg.norm(vec_b)

        if norm_a == 0 or norm_b == 0:
            return 0.0

        # Cosine similarity = dot(A, B) / (||A|| * ||B||)
        similarity = np.dot(vec_a, vec_b) / (norm_a * norm_b)

        # Clamp to [-1, 1] to handle floating point errors
        return float(np.clip(similarity, -1.0, 1.0))

    @staticmethod
    def matrix(vectors: list[np.ndarray]) -> np.ndarray:
        """
        Compute pairwise similarity matrix for a list of vectors.

        Args:
            vectors: List of vectors (all same dimension)

        Returns:
            np.ndarray: NxN symmetric matrix where M[i][j] = cosine(vectors[i], vectors[j])
        """
        n = len(vectors)
        if n == 0:
            return np.array([], dtype=np.float32)

        # Stack vectors into matrix for efficient computation
        stacked = np.stack(vectors, axis=0)  # Shape: (N, D)

        # Normalize all vectors
        norms = np.linalg.norm(stacked, axis=1, keepdims=True)
        # Avoid division by zero
        norms = np.where(norms == 0, 1, norms)
        normalized = stacked / norms

        # Compute all pairwise dot products at once
        # Result[i][j] = normalized[i] dot normalized[j]
        sim_matrix = np.dot(normalized, normalized.T)

        # Clamp to [-1, 1]
        sim_matrix = np.clip(sim_matrix, -1.0, 1.0)

        return sim_matrix.astype(np.float32)


class UnionFind:
    """
    Union-Find (Disjoint Set Union) data structure for clustering.
    """

    def __init__(self, n: int):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, x: int) -> int:
        """Find root with path compression."""
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, x: int, y: int) -> None:
        """Union by rank."""
        root_x = self.find(x)
        root_y = self.find(y)

        if root_x == root_y:
            return

        if self.rank[root_x] < self.rank[root_y]:
            self.parent[root_x] = root_y
        elif self.rank[root_x] > self.rank[root_y]:
            self.parent[root_y] = root_x
        else:
            self.parent[root_y] = root_x
            self.rank[root_x] += 1


class DistrictFormer:
    """
    Clustering engine that forms tectonic plates from agent vectors.

    PixelBrain specs:
    - Clustering threshold: cosine_similarity >= 0.75
    - Cohesion: avg_cosine_similarity * (1 - spatial_distance_factor) * recency_weight

    For Phase 49, we use simplified cohesion: avg_cosine_similarity
    """

    def __init__(
        self,
        similarity_threshold: float = 0.75,
        min_plate_size: int = 1,
        spatial_distance_factor: float = 0.0,
        recency_weight: float = 1.0,
    ):
        """
        Initialize DistrictFormer.

        Args:
            similarity_threshold: Minimum cosine similarity for clustering (default: 0.75)
            min_plate_size: Minimum agents to form a plate (default: 1)
            spatial_distance_factor: Spatial decay factor (0-1, default: 0)
            recency_weight: Recency multiplier (default: 1.0)
        """
        self.similarity_threshold = similarity_threshold
        self.min_plate_size = min_plate_size
        self.spatial_distance_factor = spatial_distance_factor
        self.recency_weight = recency_weight
        self._plates: list[TectonicPlate] = []

    @property
    def plates(self) -> list[TectonicPlate]:
        """Return current list of plates."""
        return self._plates

    def form_districts(self, agents: dict[str, dict]) -> list[TectonicPlate]:
        """
        Cluster agents into tectonic plates based on vector similarity.

        Args:
            agents: Dict of {agent_id: {"vector": np.ndarray, "budget": float}}

        Returns:
            List of TectonicPlate objects
        """
        if not agents:
            self._plates = []
            return self._plates

        agent_ids = list(agents.keys())
        vectors = [agents[aid]["vector"] for aid in agent_ids]
        budgets = {aid: agents[aid].get("budget", 0.0) for aid in agent_ids}

        # Compute similarity matrix
        sim_matrix = VectorSimilarity.matrix(vectors)

        # Cluster by threshold using union-find
        clusters = self._cluster_by_threshold(sim_matrix, agent_ids)

        # Create TectonicPlate for each cluster
        self._plates = []
        for cluster_agent_ids in clusters:
            if len(cluster_agent_ids) < self.min_plate_size:
                continue

            # Get indices for this cluster
            cluster_indices = [agent_ids.index(aid) for aid in cluster_agent_ids]
            cluster_vectors = [vectors[i] for i in cluster_indices]

            # Calculate centroid as mean of member vectors
            centroid = np.mean(cluster_vectors, axis=0).astype(np.float32)

            # Calculate cohesion
            cohesion = self._calculate_cohesion(
                cluster_vectors, sim_matrix, cluster_indices
            )

            # Create plate
            plate = TectonicPlate(
                plate_id=f"plate_{uuid.uuid4().hex[:8]}",
                agents=cluster_agent_ids,
                centroid=centroid,
                cohesion=cohesion,
                agent_budgets={aid: budgets[aid] for aid in cluster_agent_ids},
            )
            self._plates.append(plate)

        return self._plates

    def _cluster_by_threshold(
        self, sim_matrix: np.ndarray, agent_ids: list[str]
    ) -> list[list[str]]:
        """
        Group agents using union-find based on similarity threshold.

        Args:
            sim_matrix: NxN similarity matrix
            agent_ids: List of agent IDs

        Returns:
            List of clusters, where each cluster is a list of agent IDs
        """
        n = len(agent_ids)
        if n == 0:
            return []

        uf = UnionFind(n)

        # Union all pairs with similarity >= threshold
        for i in range(n):
            for j in range(i + 1, n):
                if sim_matrix[i, j] >= self.similarity_threshold:
                    uf.union(i, j)

        # Group by root
        root_to_cluster: dict[int, list[str]] = {}
        for i in range(n):
            root = uf.find(i)
            if root not in root_to_cluster:
                root_to_cluster[root] = []
            root_to_cluster[root].append(agent_ids[i])

        return list(root_to_cluster.values())

    def _calculate_cohesion(
        self,
        vectors: list[np.ndarray],
        sim_matrix: np.ndarray,
        indices: list[int],
    ) -> float:
        """
        Calculate cohesion for a cluster.

        PixelBrain spec:
        cohesion = avg_cosine_similarity * (1 - spatial_distance_factor) * recency_weight

        For Phase 49, spatial_distance_factor=0 and recency_weight=1.0,
        so cohesion = avg_cosine_similarity

        Args:
            vectors: List of vectors in the cluster
            sim_matrix: Full similarity matrix
            indices: Indices of cluster members in the matrix

        Returns:
            float: Cohesion score in [0, 1]
        """
        if len(vectors) <= 1:
            # Single agent has perfect cohesion by definition
            return 1.0

        # Compute average pairwise similarity within cluster
        n = len(indices)
        total_sim = 0.0
        pair_count = 0

        for i in range(n):
            for j in range(i + 1, n):
                total_sim += sim_matrix[indices[i], indices[j]]
                pair_count += 1

        avg_similarity = total_sim / pair_count if pair_count > 0 else 1.0

        # Apply spatial and recency factors
        cohesion = avg_similarity * (1 - self.spatial_distance_factor) * self.recency_weight

        # Clamp to [0, 1]
        return float(np.clip(cohesion, 0.0, 1.0))

    def add_agent_to_plate(
        self,
        plate: TectonicPlate,
        agent_id: str,
        vector: np.ndarray,
        budget: float = 0.0,
    ) -> None:
        """
        Add an agent to an existing plate and recalculate.

        Args:
            plate: The TectonicPlate to modify
            agent_id: ID of the agent to add
            vector: Agent's embedding vector
            budget: Agent's budget (default: 0.0)
        """
        if agent_id in plate.agents:
            return  # Already in plate

        # Add agent
        plate.agents.append(agent_id)
        plate.agent_budgets[agent_id] = budget

        # Recalculate centroid
        # Note: For accurate centroid, we'd need all vectors
        # Here we update incrementally (approximation)
        n = len(plate.agents)
        if n == 1:
            plate.centroid = vector.astype(np.float32)
        else:
            # Incremental mean update
            old_weight = (n - 1) / n
            new_weight = 1 / n
            plate.centroid = (
                old_weight * plate.centroid + new_weight * vector
            ).astype(np.float32)

        # Recalculate cohesion (requires all vectors, so we mark for recalculation)
        # For now, we just trigger a state derivation
        plate.state = plate._derive_state()

    def remove_agent_from_plate(
        self,
        plate: TectonicPlate,
        agent_id: str,
    ) -> bool:
        """
        Remove an agent from a plate.

        Args:
            plate: The TectonicPlate to modify
            agent_id: ID of the agent to remove

        Returns:
            bool: True if agent was removed, False if not found
        """
        if agent_id not in plate.agents:
            return False

        # Remove agent
        plate.agents.remove(agent_id)
        if agent_id in plate.agent_budgets:
            del plate.agent_budgets[agent_id]

        # Update state
        if len(plate.agents) == 0:
            plate.cohesion = 0.0
        else:
            # Note: Full recalculation requires all vectors
            # Mark that cohesion needs recalculation
            pass

        plate.state = plate._derive_state()
        return True

    def recalculate_cohesion(
        self,
        plate: TectonicPlate,
        agent_vectors: dict[str, np.ndarray],
    ) -> float:
        """
        Recalculate cohesion for a plate given all agent vectors.

        Args:
            plate: The TectonicPlate to update
            agent_vectors: Dict of {agent_id: vector} for all agents in plate

        Returns:
            float: New cohesion value
        """
        if not plate.agents:
            plate.cohesion = 0.0
            return 0.0

        # Get vectors for plate members
        vectors = []
        indices = list(range(len(plate.agents)))

        for agent_id in plate.agents:
            if agent_id in agent_vectors:
                vectors.append(agent_vectors[agent_id])

        if not vectors:
            plate.cohesion = 0.0
            return 0.0

        if len(vectors) == 1:
            plate.cohesion = 1.0
            return 1.0

        # Compute similarity matrix for these vectors
        sim_matrix = VectorSimilarity.matrix(vectors)

        # Calculate cohesion
        plate.cohesion = self._calculate_cohesion(vectors, sim_matrix, indices)
        plate.state = plate._derive_state()

        return plate.cohesion

    def recalculate_centroid(
        self,
        plate: TectonicPlate,
        agent_vectors: dict[str, np.ndarray],
    ) -> np.ndarray:
        """
        Recalculate centroid for a plate given all agent vectors.

        Args:
            plate: The TectonicPlate to update
            agent_vectors: Dict of {agent_id: vector} for all agents in plate

        Returns:
            np.ndarray: New centroid
        """
        if not plate.agents:
            plate.centroid = np.zeros(64, dtype=np.float32)
            return plate.centroid

        # Collect vectors
        vectors = []
        for agent_id in plate.agents:
            if agent_id in agent_vectors:
                vectors.append(agent_vectors[agent_id])

        if vectors:
            plate.centroid = np.mean(vectors, axis=0).astype(np.float32)
        else:
            plate.centroid = np.zeros(64, dtype=np.float32)

        return plate.centroid
