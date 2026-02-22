import pytest
import numpy as np
from systems.visual_shell.swarm.cognitive_clustering import CognitiveClusteringEngine

class TestCognitiveClustering:
    """Tests for the Cognitive Clustering Engine."""

    @pytest.fixture
    def engine(self):
        return CognitiveClusteringEngine()

    def test_artifact_embedding_generation(self, engine):
        """Engine generates neural embeddings for artifacts based on metadata."""
        artifact = {"id": "art-1", "name": "AuthService", "type": "code"}
        embedding = engine.generate_embedding(artifact)
        
        assert isinstance(embedding, np.ndarray)
        assert embedding.shape == (16,) # Mock embedding size

    def test_attention_based_clustering(self, engine):
        """Engine computes attention weights between artifacts to find clusters."""
        artifacts = [
            {"id": "a1", "type": "code"},
            {"id": "a2", "type": "code"},
            {"id": "b1", "type": "data"}
        ]
        
        clusters = engine.cluster_artifacts(artifacts)
        
        # Should find two clusters based on type
        assert len(clusters) == 2
        cluster_a = next(c for c in clusters if "a1" in c)
        assert "a2" in cluster_a
        assert "b1" not in cluster_a

    def test_consensus_category_assignment(self, engine):
        """Engine uses federated consensus to assign categories to clusters."""
        cluster = ["a1", "a2"]
        # Mock agent votes
        agent_votes = [
            {"category": "auth", "confidence": 0.9},
            {"category": "auth", "confidence": 0.8},
            {"category": "db", "confidence": 0.2}
        ]
        
        category = engine.determine_category(cluster, agent_votes)
        assert category == "auth"

    def test_cluster_plan_generation(self, engine):
        """Engine generates a plan with target coordinates for each cluster."""
        clusters = [
            {"ids": ["a1", "a2"], "category": "system"},
            {"ids": ["b1"], "category": "user"}
        ]
        
        plan = engine.generate_plan(clusters)
        
        assert "a1" in plan
        assert "b1" in plan
        # a1 and a2 should have nearby target coordinates
        p_a1 = plan["a1"]
        p_a2 = plan["a2"]
        dist = np.sqrt((p_a1['x'] - p_a2['x'])**2 + (p_a1['y'] - p_a2['y'])**2)
        assert dist < 100
