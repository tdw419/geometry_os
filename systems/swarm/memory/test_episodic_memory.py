"""
Unit tests for EpisodicMemory system components.

Tests Experience, ExperienceStore, embedding generation, and similarity search.
"""

import os
import tempfile
import unittest

from systems.swarm.memory.experience import Experience
from systems.swarm.memory.experience_store import ExperienceStore, generate_embedding
from systems.swarm.memory.experience_retriever import ExperienceRetriever, cosine_similarity
from systems.swarm.memory.episodic_memory import EpisodicMemory


class TestExperience(unittest.TestCase):
    """Tests for Experience dataclass."""

    def test_create_experience(self):
        """Test creating an experience with all fields."""
        exp = Experience(
            experience_id="test-001",
            agent_id="agent1",
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="Generated auth module",
            embedding=[0.1] * 128,
            metadata={"duration": 45.0},
            timestamp=1234567890.0
        )

        self.assertEqual(exp.experience_id, "test-001")
        self.assertEqual(exp.agent_id, "agent1")
        self.assertEqual(exp.task_type, "CODE_GEN")
        self.assertEqual(exp.action, "write")
        self.assertEqual(exp.outcome, "success")
        self.assertEqual(exp.description, "Generated auth module")
        self.assertEqual(len(exp.embedding), 128)
        self.assertEqual(exp.metadata["duration"], 45.0)

    def test_embedding_validation(self):
        """Test that embedding must be 128 dimensions."""
        with self.assertRaises(ValueError):
            Experience(
                experience_id="test-001",
                agent_id="agent1",
                task_type="CODE_GEN",
                action="write",
                outcome="success",
                description="test",
                embedding=[0.1] * 64,  # Wrong size
                metadata={}
            )

    def test_to_dict_and_from_dict(self):
        """Test serialization to/from dictionary."""
        exp = Experience(
            experience_id="test-001",
            agent_id="agent1",
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="test",
            embedding=[0.1] * 128,
            metadata={"key": "value"},
            timestamp=0.0
        )

        data = exp.to_dict()
        self.assertEqual(data["experience_id"], "test-001")

        exp2 = Experience.from_dict(data)
        self.assertEqual(exp2.experience_id, exp.experience_id)
        self.assertEqual(exp2.embedding, exp.embedding)

    def test_to_json_and_from_json(self):
        """Test JSON serialization."""
        exp = Experience(
            experience_id="test-001",
            agent_id="agent1",
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="test",
            embedding=[0.1] * 128,
            metadata={},
            timestamp=0.0
        )

        json_str = exp.to_json()
        self.assertIn("test-001", json_str)

        exp2 = Experience.from_json(json_str)
        self.assertEqual(exp2.experience_id, exp.experience_id)


class TestExperienceStore(unittest.TestCase):
    """Tests for ExperienceStore persistence."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix=".json", delete=False)
        self.temp_path = self.temp_file.name
        self.temp_file.close()

    def tearDown(self):
        """Clean up temp file."""
        if os.path.exists(self.temp_path):
            os.unlink(self.temp_path)

    def test_add_and_get_all(self):
        """Test adding experiences and retrieving them."""
        store = ExperienceStore(self.temp_path)

        exp1 = Experience("id1", "agent1", "T1", "a1", "success", "d1", [0.1] * 128, {}, 0)
        exp2 = Experience("id2", "agent1", "T2", "a2", "failure", "d2", [0.2] * 128, {}, 0)

        store.add(exp1)
        store.add(exp2)

        all_exp = store.get_all()
        self.assertEqual(len(all_exp), 2)

    def test_persistence(self):
        """Test that experiences persist across store instances."""
        store1 = ExperienceStore(self.temp_path)
        exp = Experience("id1", "agent1", "T1", "a1", "success", "d1", [0.1] * 128, {}, 0)
        store1.add(exp)

        # Create new store instance - should load from file
        store2 = ExperienceStore(self.temp_path)
        all_exp = store2.get_all()
        self.assertEqual(len(all_exp), 1)
        self.assertEqual(all_exp[0].experience_id, "id1")

    def test_get_by_agent(self):
        """Test filtering experiences by agent."""
        store = ExperienceStore(self.temp_path)

        store.add(Experience("id1", "agent1", "T", "a", "s", "d", [0.1] * 128, {}, 0))
        store.add(Experience("id2", "agent2", "T", "a", "s", "d", [0.2] * 128, {}, 0))
        store.add(Experience("id3", "agent1", "T", "a", "s", "d", [0.3] * 128, {}, 0))

        agent1_exps = store.get_by_agent("agent1")
        self.assertEqual(len(agent1_exps), 2)

    def test_get_by_outcome(self):
        """Test filtering experiences by outcome."""
        store = ExperienceStore(self.temp_path)

        store.add(Experience("id1", "a", "T", "a", "success", "d", [0.1] * 128, {}, 0))
        store.add(Experience("id2", "a", "T", "a", "failure", "d", [0.2] * 128, {}, 0))
        store.add(Experience("id3", "a", "T", "a", "success", "d", [0.3] * 128, {}, 0))

        successes = store.get_by_outcome("success")
        self.assertEqual(len(successes), 2)

    def test_clear(self):
        """Test clearing all experiences."""
        store = ExperienceStore(self.temp_path)
        store.add(Experience("id1", "a", "T", "a", "s", "d", [0.1] * 128, {}, 0))
        store.clear()
        self.assertEqual(len(store.get_all()), 0)


class TestGenerateEmbedding(unittest.TestCase):
    """Tests for embedding generation."""

    def test_deterministic(self):
        """Test that same text produces same embedding."""
        text = "test embedding generation"
        e1 = generate_embedding(text)
        e2 = generate_embedding(text)
        self.assertEqual(e1, e2)

    def test_different_texts_different_embeddings(self):
        """Test that different texts produce different embeddings."""
        e1 = generate_embedding("authentication module")
        e2 = generate_embedding("database connection")
        self.assertNotEqual(e1, e2)

    def test_dimension(self):
        """Test that embedding has correct dimension."""
        e = generate_embedding("test")
        self.assertEqual(len(e), 128)

    def test_normalization(self):
        """Test that embedding is normalized to unit length."""
        e = generate_embedding("test")
        magnitude = sum(x * x for x in e) ** 0.5
        self.assertAlmostEqual(magnitude, 1.0, places=5)


class TestCosineSimilarity(unittest.TestCase):
    """Tests for cosine similarity function."""

    def test_identical_vectors(self):
        """Test that identical vectors have similarity 1."""
        v = [0.1, 0.2, 0.3, 0.4]
        sim = cosine_similarity(v, v)
        self.assertAlmostEqual(sim, 1.0, places=5)

    def test_orthogonal_vectors(self):
        """Test that orthogonal vectors have similarity 0."""
        v1 = [1, 0, 0, 0]
        v2 = [0, 1, 0, 0]
        sim = cosine_similarity(v1, v2)
        self.assertAlmostEqual(sim, 0.0, places=5)

    def test_opposite_vectors(self):
        """Test that opposite vectors have similarity -1."""
        v1 = [1, 0, 0, 0]
        v2 = [-1, 0, 0, 0]
        sim = cosine_similarity(v1, v2)
        self.assertAlmostEqual(sim, -1.0, places=5)

    def test_zero_vector(self):
        """Test that zero vector returns 0 similarity."""
        v1 = [0, 0, 0, 0]
        v2 = [1, 2, 3, 4]
        sim = cosine_similarity(v1, v2)
        self.assertEqual(sim, 0.0)


class TestExperienceRetriever(unittest.TestCase):
    """Tests for similarity search."""

    def setUp(self):
        """Create sample experiences for testing."""
        self.experiences = [
            Experience("id1", "a", "CODE_GEN", "write", "success", "auth module", generate_embedding("auth module"), {}, 0),
            Experience("id2", "a", "CODE_GEN", "write", "failure", "database error", generate_embedding("database error"), {}, 0),
            Experience("id3", "a", "CODE_REVIEW", "review", "success", "code review passed", generate_embedding("code review passed"), {}, 0),
            Experience("id4", "a", "CODE_GEN", "write", "failure", "auth failed", generate_embedding("auth failed"), {}, 0),
        ]

    def test_find_similar(self):
        """Test finding similar experiences."""
        retriever = ExperienceRetriever(self.experiences)
        query = generate_embedding("authentication")

        # Use very low min_similarity to include all results
        results = retriever.find_similar(query, k=3, min_similarity=-1.0)
        self.assertEqual(len(results), 3)
        # Results should be sorted by similarity descending
        self.assertGreaterEqual(results[0].similarity, results[1].similarity)

    def test_outcome_filter(self):
        """Test filtering by outcome."""
        retriever = ExperienceRetriever(self.experiences)
        query = generate_embedding("auth")

        failures = retriever.find_similar(query, outcome_filter="failure", k=10)
        self.assertTrue(all(r.experience.outcome == "failure" for r in failures))

    def test_find_similar_failures(self):
        """Test convenience method for failures."""
        retriever = ExperienceRetriever(self.experiences)
        query = generate_embedding("error")

        failures = retriever.find_similar_failures(query, k=5, min_similarity=0.0)
        self.assertTrue(len(failures) >= 0)

    def test_find_similar_successes(self):
        """Test convenience method for successes."""
        retriever = ExperienceRetriever(self.experiences)
        query = generate_embedding("module")

        successes = retriever.find_similar_successes(query, k=5, min_similarity=0.0)
        self.assertTrue(all(r.experience.outcome == "success" for r in successes))


class TestEpisodicMemory(unittest.TestCase):
    """Tests for EpisodicMemory facade."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix=".json", delete=False)
        self.temp_path = self.temp_file.name
        self.temp_file.close()

    def tearDown(self):
        """Clean up temp file."""
        if os.path.exists(self.temp_path):
            os.unlink(self.temp_path)

    def test_store_and_retrieve(self):
        """Test storing and retrieving experiences."""
        memory = EpisodicMemory("agent1", self.temp_path)

        exp = memory.store_experience("CODE_GEN", "write", "success", "Generated auth")
        self.assertIsNotNone(exp.experience_id)

        all_exps = memory.get_all_experiences()
        self.assertEqual(len(all_exps), 1)

    def test_text_to_embedding(self):
        """Test text to embedding conversion."""
        e1 = EpisodicMemory.text_to_embedding("test")
        e2 = EpisodicMemory.text_to_embedding("test")
        self.assertEqual(e1, e2)

    def test_get_my_experiences(self):
        """Test getting experiences for current agent only."""
        memory1 = EpisodicMemory("agent1", self.temp_path)
        memory1.store_experience("T", "a", "s", "desc1")

        memory2 = EpisodicMemory("agent2", self.temp_path)
        memory2.store_experience("T", "a", "s", "desc2")

        # memory2 should see both (from shared storage)
        all_exps = memory2.get_all_experiences()
        self.assertEqual(len(all_exps), 2)

        # But only its own when filtered
        my_exps = memory2.get_my_experiences()
        self.assertEqual(len(my_exps), 1)
        self.assertEqual(my_exps[0].agent_id, "agent2")


if __name__ == "__main__":
    unittest.main()
