"""
Tests for DistrictFormer clustering engine.

Phase 49: Neural District Coalescence
"""

import numpy as np
import pytest

from systems.tectonic.district import DistrictFormer, VectorSimilarity
from systems.tectonic.plate import TectonicPlate


class TestVectorSimilarityCosine:
    """Tests for VectorSimilarity.cosine method."""

    def test_identical_vectors_returns_one(self):
        """Identical vectors should have cosine similarity of 1.0."""
        vec = np.array([1.0, 2.0, 3.0, 4.0])
        result = VectorSimilarity.cosine(vec, vec)
        assert result == pytest.approx(1.0, abs=1e-6)

    def test_identical_vectors_normalized(self):
        """Identical normalized vectors should have similarity 1.0."""
        vec = np.array([0.5, 0.5, 0.5, 0.5])
        result = VectorSimilarity.cosine(vec, vec)
        assert result == pytest.approx(1.0, abs=1e-6)

    def test_orthogonal_vectors_returns_zero(self):
        """Orthogonal vectors should have cosine similarity near 0.0."""
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 1.0, 0.0, 0.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(0.0, abs=1e-6)

    def test_orthogonal_vectors_higher_dim(self):
        """Orthogonal vectors in higher dimensions should have similarity 0.0."""
        vec_a = np.array([1.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 0.0, 1.0, 0.0, 0.0, 0.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(0.0, abs=1e-6)

    def test_opposite_vectors_returns_negative_one(self):
        """Opposite vectors should have cosine similarity of -1.0."""
        vec_a = np.array([1.0, 2.0, 3.0, 4.0])
        vec_b = np.array([-1.0, -2.0, -3.0, -4.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(-1.0, abs=1e-6)

    def test_opposite_vectors_normalized(self):
        """Opposite normalized vectors should have similarity -1.0."""
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([-1.0, 0.0, 0.0, 0.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(-1.0, abs=1e-6)

    def test_zero_vector_returns_zero(self):
        """Zero vector should return 0.0 similarity (undefined case)."""
        vec_a = np.array([0.0, 0.0, 0.0, 0.0])
        vec_b = np.array([1.0, 2.0, 3.0, 4.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(0.0, abs=1e-6)

    def test_both_zero_vectors_returns_zero(self):
        """Both zero vectors should return 0.0 similarity."""
        vec_a = np.array([0.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 0.0, 0.0, 0.0])
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(0.0, abs=1e-6)

    def test_partial_similarity(self):
        """Vectors at 45 degrees should have similarity around 0.707."""
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([1.0, 1.0, 0.0, 0.0])
        # cos(45 deg) = sqrt(2)/2 = 0.7071...
        result = VectorSimilarity.cosine(vec_a, vec_b)
        assert result == pytest.approx(np.sqrt(2) / 2, abs=1e-6)

    def test_64_dim_vectors(self):
        """Test with 64-dimensional vectors (PixelBrain standard)."""
        np.random.seed(42)
        vec_a = np.random.randn(64).astype(np.float32)
        # Create similar vector
        vec_b = vec_a + np.random.randn(64).astype(np.float32) * 0.1
        result = VectorSimilarity.cosine(vec_a, vec_b)
        # Should be high similarity
        assert result > 0.9


class TestVectorSimilarityMatrix:
    """Tests for VectorSimilarity.matrix method."""

    def test_empty_list_returns_empty_array(self):
        """Empty vector list should return empty array."""
        result = VectorSimilarity.matrix([])
        assert result.shape == (0,)

    def test_single_vector_returns_one_by_one(self):
        """Single vector should produce 1x1 matrix with value 1.0."""
        vec = np.array([1.0, 2.0, 3.0])
        result = VectorSimilarity.matrix([vec])
        assert result.shape == (1, 1)
        assert result[0, 0] == pytest.approx(1.0, abs=1e-6)

    def test_correct_shape(self):
        """N vectors should produce NxN matrix."""
        vectors = [
            np.array([1.0, 0.0]),
            np.array([0.0, 1.0]),
            np.array([1.0, 1.0]),
        ]
        result = VectorSimilarity.matrix(vectors)
        assert result.shape == (3, 3)

    def test_diagonal_is_one(self):
        """Diagonal elements should all be 1.0."""
        vectors = [
            np.array([1.0, 0.0]),
            np.array([0.0, 1.0]),
            np.array([1.0, 1.0]),
        ]
        result = VectorSimilarity.matrix(vectors)
        for i in range(3):
            assert result[i, i] == pytest.approx(1.0, abs=1e-6)

    def test_matrix_is_symmetric(self):
        """Similarity matrix should be symmetric."""
        vectors = [
            np.array([1.0, 2.0, 3.0]),
            np.array([4.0, 5.0, 6.0]),
            np.array([7.0, 8.0, 9.0]),
        ]
        result = VectorSimilarity.matrix(vectors)
        assert np.allclose(result, result.T, atol=1e-6)

    def test_correct_values(self):
        """Matrix values should match pairwise cosine calculations."""
        vec_a = np.array([1.0, 0.0])
        vec_b = np.array([0.0, 1.0])
        vec_c = np.array([1.0, 1.0])

        vectors = [vec_a, vec_b, vec_c]
        result = VectorSimilarity.matrix(vectors)

        # Check specific values
        assert result[0, 1] == pytest.approx(0.0, abs=1e-6)  # orthogonal
        assert result[0, 2] == pytest.approx(np.sqrt(2) / 2, abs=1e-6)  # 45 degrees
        assert result[1, 2] == pytest.approx(np.sqrt(2) / 2, abs=1e-6)  # 45 degrees


class TestDistrictFormerCreation:
    """Tests for DistrictFormer initialization."""

    def test_default_parameters(self):
        """Default parameters should match PixelBrain specs."""
        former = DistrictFormer()
        assert former.similarity_threshold == 0.75
        assert former.min_plate_size == 1

    def test_custom_parameters(self):
        """Should accept custom parameters."""
        former = DistrictFormer(similarity_threshold=0.5, min_plate_size=3)
        assert former.similarity_threshold == 0.5
        assert former.min_plate_size == 3

    def test_empty_plates_on_creation(self):
        """Plates list should be empty on creation."""
        former = DistrictFormer()
        assert former.plates == []


class TestDistrictFormerFormDistricts:
    """Tests for DistrictFormer.form_districts method."""

    def test_empty_agents_returns_empty_list(self):
        """Empty agent dict should return empty plate list."""
        former = DistrictFormer()
        result = former.form_districts({})
        assert result == []

    def test_single_agent_forms_single_plate(self):
        """Single agent should form a single plate."""
        former = DistrictFormer()
        agents = {
            "agent_1": {
                "vector": np.array([1.0, 0.0, 0.0, 0.0]),
                "budget": 10.0,
            }
        }
        plates = former.form_districts(agents)

        assert len(plates) == 1
        assert len(plates[0].agents) == 1
        assert "agent_1" in plates[0].agents

    def test_similar_agents_cluster_together(self):
        """Agents with similarity >= threshold should be in same plate."""
        former = DistrictFormer(similarity_threshold=0.75)

        # Create similar vectors (cosine sim > 0.75)
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.9, 0.1, 0.0, 0.0])  # Similar direction

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        # Should be single plate with both agents
        assert len(plates) == 1
        assert len(plates[0].agents) == 2
        assert "agent_a" in plates[0].agents
        assert "agent_b" in plates[0].agents

    def test_dissimilar_agents_form_separate_plates(self):
        """Agents with similarity < threshold should form separate plates."""
        former = DistrictFormer(similarity_threshold=0.75)

        # Create orthogonal vectors (cosine sim = 0)
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 1.0, 0.0, 0.0])

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        # Should be two separate plates
        assert len(plates) == 2
        assert len(plates[0].agents) == 1
        assert len(plates[1].agents) == 1

    def test_min_plate_size_filter(self):
        """Plates smaller than min_plate_size should be filtered."""
        former = DistrictFormer(similarity_threshold=0.75, min_plate_size=2)

        # Create orthogonal vectors
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 1.0, 0.0, 0.0])

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        # Both clusters have size 1, so with min_plate_size=2, no plates form
        assert len(plates) == 0

    def test_mixed_similarity_groups(self):
        """Test complex grouping with multiple similarity levels."""
        former = DistrictFormer(similarity_threshold=0.7)

        # Group 1: Similar vectors
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.95, 0.1, 0.0, 0.0])

        # Group 2: Different from Group 1, similar to each other
        vec_c = np.array([0.0, 1.0, 0.0, 0.0])
        vec_d = np.array([0.0, 0.95, 0.1, 0.0])

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
            "agent_c": {"vector": vec_c, "budget": 5.0},
            "agent_d": {"vector": vec_d, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        # Should form 2 plates with 2 agents each
        assert len(plates) == 2
        for plate in plates:
            assert len(plate.agents) == 2


class TestDistrictFormerCohesion:
    """Tests for cohesion calculation."""

    def test_identical_vectors_cohesion_is_one(self):
        """Identical vectors should have cohesion 1.0."""
        former = DistrictFormer()

        vec = np.array([1.0, 2.0, 3.0, 4.0])
        agents = {
            "agent_a": {"vector": vec, "budget": 5.0},
            "agent_b": {"vector": vec.copy(), "budget": 5.0},
        }
        plates = former.form_districts(agents)

        assert len(plates) == 1
        assert plates[0].cohesion == pytest.approx(1.0, abs=1e-5)

    def test_single_agent_cohesion_is_one(self):
        """Single agent should have cohesion 1.0 by definition."""
        former = DistrictFormer()

        agents = {
            "agent_a": {"vector": np.array([1.0, 2.0, 3.0, 4.0]), "budget": 5.0},
        }
        plates = former.form_districts(agents)

        assert len(plates) == 1
        assert plates[0].cohesion == pytest.approx(1.0, abs=1e-5)

    def test_cohesion_reflects_similarity(self):
        """Cohesion should reflect average pairwise similarity."""
        former = DistrictFormer()

        # Vectors with ~0.97 cosine similarity
        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.97, 0.243, 0.0, 0.0])

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        assert len(plates) == 1
        # Cohesion should be close to the cosine similarity
        assert plates[0].cohesion > 0.95


class TestDistrictFormerCentroid:
    """Tests for centroid calculation."""

    def test_centroid_is_mean(self):
        """Centroid should be mean of member vectors."""
        former = DistrictFormer()

        vec_a = np.array([1.0, 0.0, 0.0, 0.0])
        vec_b = np.array([0.0, 1.0, 0.0, 0.0])
        # Both similar enough to cluster (with lower threshold)
        vec_c = np.array([0.5, 0.5, 0.0, 0.0])

        agents = {
            "agent_a": {"vector": vec_a, "budget": 5.0},
            "agent_b": {"vector": vec_b, "budget": 5.0},
            "agent_c": {"vector": vec_c, "budget": 5.0},
        }

        # Use low threshold to cluster all three
        former = DistrictFormer(similarity_threshold=0.4)
        plates = former.form_districts(agents)

        assert len(plates) == 1
        expected_centroid = np.mean([vec_a, vec_b, vec_c], axis=0)
        assert np.allclose(plates[0].centroid, expected_centroid, atol=1e-5)

    def test_single_agent_centroid_is_vector(self):
        """Single agent centroid should be its vector."""
        former = DistrictFormer()

        vec = np.array([1.0, 2.0, 3.0, 4.0])
        agents = {
            "agent_a": {"vector": vec, "budget": 5.0},
        }
        plates = former.form_districts(agents)

        assert len(plates) == 1
        assert np.allclose(plates[0].centroid, vec, atol=1e-5)


class TestDistrictFormerAgentOperations:
    """Tests for add/remove agent operations."""

    def test_add_agent_to_plate(self):
        """Adding agent should update plate."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a"],
            centroid=np.array([1.0, 0.0, 0.0, 0.0]),
            cohesion=1.0,
            agent_budgets={"agent_a": 5.0},
        )

        new_vector = np.array([0.9, 0.1, 0.0, 0.0])
        former.add_agent_to_plate(plate, "agent_b", new_vector, budget=3.0)

        assert "agent_b" in plate.agents
        assert plate.agent_budgets["agent_b"] == 3.0

    def test_add_duplicate_agent_ignored(self):
        """Adding existing agent should be ignored."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a"],
            centroid=np.array([1.0, 0.0, 0.0, 0.0]),
            cohesion=1.0,
            agent_budgets={"agent_a": 5.0},
        )

        new_vector = np.array([0.9, 0.1, 0.0, 0.0])
        former.add_agent_to_plate(plate, "agent_a", new_vector, budget=10.0)

        # Should still have only 1 agent
        assert len(plate.agents) == 1
        # Budget should not change
        assert plate.agent_budgets["agent_a"] == 5.0

    def test_remove_agent_from_plate(self):
        """Removing agent should update plate."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a", "agent_b"],
            centroid=np.array([0.5, 0.5, 0.0, 0.0]),
            cohesion=0.9,
            agent_budgets={"agent_a": 5.0, "agent_b": 3.0},
        )

        result = former.remove_agent_from_plate(plate, "agent_a")

        assert result is True
        assert "agent_a" not in plate.agents
        assert "agent_a" not in plate.agent_budgets
        assert "agent_b" in plate.agents

    def test_remove_nonexistent_agent(self):
        """Removing nonexistent agent should return False."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a"],
            centroid=np.array([1.0, 0.0, 0.0, 0.0]),
            cohesion=1.0,
            agent_budgets={"agent_a": 5.0},
        )

        result = former.remove_agent_from_plate(plate, "agent_z")

        assert result is False
        assert len(plate.agents) == 1


class TestDistrictFormerRecalculateCohesion:
    """Tests for recalculate_cohesion method."""

    def test_recalculate_with_vectors(self):
        """Recalculate cohesion should use provided vectors."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a", "agent_b"],
            centroid=np.array([0.5, 0.5, 0.0, 0.0]),
            cohesion=0.5,  # Start with wrong value
            agent_budgets={"agent_a": 5.0, "agent_b": 3.0},
        )

        # Identical vectors
        agent_vectors = {
            "agent_a": np.array([1.0, 0.0, 0.0, 0.0]),
            "agent_b": np.array([1.0, 0.0, 0.0, 0.0]),
        }

        new_cohesion = former.recalculate_cohesion(plate, agent_vectors)

        assert new_cohesion == pytest.approx(1.0, abs=1e-5)
        assert plate.cohesion == pytest.approx(1.0, abs=1e-5)

    def test_recalculate_empty_plate(self):
        """Recalculating empty plate should return 0.0."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=[],
            centroid=np.zeros(4),
            cohesion=0.5,
            agent_budgets={},
        )

        new_cohesion = former.recalculate_cohesion(plate, {})

        assert new_cohesion == 0.0
        assert plate.cohesion == 0.0


class TestDistrictFormerRecalculateCentroid:
    """Tests for recalculate_centroid method."""

    def test_recalculate_centroid(self):
        """Recalculate centroid should compute mean."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=["agent_a", "agent_b"],
            centroid=np.zeros(4),  # Start with wrong value
            cohesion=0.9,
            agent_budgets={"agent_a": 5.0, "agent_b": 3.0},
        )

        agent_vectors = {
            "agent_a": np.array([2.0, 0.0, 0.0, 0.0]),
            "agent_b": np.array([4.0, 0.0, 0.0, 0.0]),
        }

        new_centroid = former.recalculate_centroid(plate, agent_vectors)

        expected = np.array([3.0, 0.0, 0.0, 0.0])
        assert np.allclose(new_centroid, expected, atol=1e-5)
        assert np.allclose(plate.centroid, expected, atol=1e-5)

    def test_recalculate_empty_plate_centroid(self):
        """Recalculating empty plate should return zeros."""
        former = DistrictFormer()
        plate = TectonicPlate(
            plate_id="test_plate",
            agents=[],
            centroid=np.array([1.0, 2.0, 3.0, 4.0]),
            cohesion=0.5,
            agent_budgets={},
        )

        new_centroid = former.recalculate_centroid(plate, {})

        assert np.allclose(new_centroid, np.zeros(64), atol=1e-5)


class TestDistrictFormerPlatesProperty:
    """Tests for plates property."""

    def test_plates_property_returns_formed_plates(self):
        """Plates property should return plates from last form_districts call."""
        former = DistrictFormer()

        agents = {
            "agent_a": {"vector": np.array([1.0, 0.0, 0.0, 0.0]), "budget": 5.0},
        }
        plates = former.form_districts(agents)

        assert former.plates is plates
        assert len(former.plates) == 1

    def test_plates_resets_on_new_form(self):
        """Calling form_districts again should replace plates."""
        former = DistrictFormer()

        agents_1 = {
            "agent_a": {"vector": np.array([1.0, 0.0, 0.0, 0.0]), "budget": 5.0},
        }
        former.form_districts(agents_1)
        assert len(former.plates) == 1

        agents_2 = {
            "agent_a": {"vector": np.array([1.0, 0.0, 0.0, 0.0]), "budget": 5.0},
            "agent_b": {"vector": np.array([0.0, 1.0, 0.0, 0.0]), "budget": 5.0},
            "agent_c": {"vector": np.array([0.0, 0.0, 1.0, 0.0]), "budget": 5.0},
        }
        former.form_districts(agents_2)
        assert len(former.plates) == 3  # Three separate clusters
