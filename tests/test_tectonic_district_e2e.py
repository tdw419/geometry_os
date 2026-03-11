"""
End-to-end integration tests for district formation and negotiation.

Phase 49: Neural District Coalescence
Tests the full pipeline from agent creation -> district formation -> negotiation -> visualization.
"""

import os
import tempfile

import numpy as np
import pytest

from systems.tectonic.arena import AgentConfig, SimulationArena
from systems.tectonic.claim import ClaimStatus
from systems.tectonic.district import DistrictFormer, VectorSimilarity
from systems.tectonic.learner import LearningConfig, StrategyLearner
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.plate import DISTRICT_COLORS, DistrictState, TectonicPlate
from systems.tectonic.strategy import StrategyProfile, StrategyType
from systems.tectonic.visual import DistrictHeatmap, GhostLayer


def create_similar_vectors(count: int, base_vector: np.ndarray, noise: float = 0.1) -> list:
    """Create multiple similar vectors by adding noise to a base vector."""
    vectors = []
    for _ in range(count):
        noise_vec = np.random.randn(*base_vector.shape).astype(np.float32) * noise
        vectors.append((base_vector + noise_vec).astype(np.float32))
    return vectors


def create_orthogonal_vector(dim: int = 64) -> np.ndarray:
    """Create a random normalized vector."""
    vec = np.random.randn(dim).astype(np.float32)
    return vec / np.linalg.norm(vec)


# ============================================================================
# Test 1: Agents Form Districts and Negotiate
# ============================================================================


def test_agents_form_districts_and_negotiate():
    """
    E2E test: Create 3 agents with similar vectors, form districts,
    verify single plate formed, submit plate claim, settle and verify plate wins.
    """
    np.random.seed(42)

    # Step 1: Create 3 agents with similar vectors (will cluster)
    base_vector = create_orthogonal_vector(64)
    similar_vectors = create_similar_vectors(3, base_vector, noise=0.05)

    agents = {
        "agent_alpha": {"vector": similar_vectors[0], "budget": 100.0},
        "agent_beta": {"vector": similar_vectors[1], "budget": 100.0},
        "agent_gamma": {"vector": similar_vectors[2], "budget": 100.0},
    }

    # Step 2: Form districts with DistrictFormer
    former = DistrictFormer(similarity_threshold=0.75)
    plates = former.form_districts(agents)

    # Step 3: Verify single plate formed (all vectors are similar)
    assert len(plates) == 1, f"Expected 1 plate, got {len(plates)}"
    plate = plates[0]
    assert len(plate.agents) == 3, f"Expected 3 agents in plate, got {len(plate.agents)}"

    # Verify high cohesion (similar vectors)
    # With noise=0.05, we expect cohesion around 0.85-0.95
    assert plate.cohesion > 0.8, f"Expected high cohesion, got {plate.cohesion}"

    # Step 4: Submit plate claim
    negotiator = TectonicNegotiator()
    tile = (10, 20)
    purpose = "establish_district"

    claim_id = negotiator.submit_plate_claim(plate, tile, purpose)

    # Verify claim was submitted
    claim = negotiator.get_claim(claim_id)
    assert claim is not None
    assert claim.tile == tile
    assert claim.plate_id == plate.plate_id

    # Step 5: Settle and verify plate wins
    settlement = negotiator.settle(claim_id)

    # Plate should win (no counter-bids, force = budget * cohesion)
    assert settlement.winner == plate.plate_id
    assert settlement.force > 0
    assert settlement.claim.status == ClaimStatus.APPROVED


# ============================================================================
# Test 2: Districts with Different Strategies
# ============================================================================


def test_districts_with_different_strategies():
    """
    E2E test: 2 aggressive agents (similar vectors), 2 conservative agents
    (different vectors), form districts, verify 2 separate plates.
    """
    np.random.seed(123)

    # Group 1: Aggressive agents with similar vectors
    aggressive_base = create_orthogonal_vector(64)
    aggressive_vectors = create_similar_vectors(2, aggressive_base, noise=0.05)

    # Group 2: Conservative agents with different vectors (orthogonal to aggressive)
    conservative_base = create_orthogonal_vector(64)
    # Make sure conservative is different from aggressive
    conservative_base = conservative_base - aggressive_base * np.dot(conservative_base, aggressive_base)
    conservative_base = conservative_base / np.linalg.norm(conservative_base)
    conservative_vectors = create_similar_vectors(2, conservative_base, noise=0.05)

    agents = {
        "aggressive_1": {"vector": aggressive_vectors[0], "budget": 150.0},
        "aggressive_2": {"vector": aggressive_vectors[1], "budget": 150.0},
        "conservative_1": {"vector": conservative_vectors[0], "budget": 100.0},
        "conservative_2": {"vector": conservative_vectors[1], "budget": 100.0},
    }

    # Form districts
    former = DistrictFormer(similarity_threshold=0.75)
    plates = former.form_districts(agents)

    # Verify 2 separate plates formed
    assert len(plates) == 2, f"Expected 2 plates, got {len(plates)}"

    # Each plate should have 2 agents
    total_agents = sum(len(p.agents) for p in plates)
    assert total_agents == 4, f"Expected 4 total agents, got {total_agents}"

    # Verify plates have high internal cohesion
    for plate in plates:
        assert plate.cohesion > 0.8, f"Plate cohesion too low: {plate.cohesion}"


# ============================================================================
# Test 3: Render Districts to Heatmap
# ============================================================================


def test_render_districts_to_heatmap():
    """
    E2E test: Create 2 plates with different cohesion, render to heatmap,
    verify colors match state (cyan for high, gray for low), export to PNG.
    """
    # Create two plates with explicit states for reliable testing

    # Plate 1: High cohesion (>= 0.7) - should be cyan
    high_plate = TectonicPlate(
        plate_id="high_cohesion_plate",
        agents=["h1", "h2", "h3"],
        centroid=np.zeros(64, dtype=np.float32),
        cohesion=0.9,  # >= 0.7 triggers HIGH_COHESION
        agent_budgets={"h1": 50.0, "h2": 50.0, "h3": 50.0},
        tiles=[(10, 10), (10, 11), (11, 10), (11, 11)],
    )

    # Plate 2: Low cohesion (< 0.4) - should be gray
    low_plate = TectonicPlate(
        plate_id="low_cohesion_plate",
        agents=["l1", "l2", "l3"],
        centroid=np.zeros(64, dtype=np.float32),
        cohesion=0.2,  # < 0.4 triggers LOW_COHESION
        agent_budgets={"l1": 50.0, "l2": 50.0, "l3": 50.0},
        tiles=[(50, 50), (50, 51), (51, 50), (51, 51)],
    )

    # Verify states
    assert high_plate.state == DistrictState.HIGH_COHESION
    assert low_plate.state == DistrictState.LOW_COHESION

    # Render to heatmap
    heatmap = DistrictHeatmap(width=64, height=64)
    frame = heatmap.render([high_plate, low_plate])

    # Verify frame shape
    assert frame.shape == (64, 64, 4), f"Expected (64, 64, 4), got {frame.shape}"

    # Verify colors match state
    high_color = high_plate.get_color()
    low_color = low_plate.get_color()

    # Check that high cohesion plate has cyan-ish color (high G and B values)
    assert high_color[1] > 200, f"Expected green > 200 for high cohesion, got {high_color[1]}"
    assert high_color[2] > 200, f"Expected blue > 200 for high cohesion, got {high_color[2]}"

    # Check that low cohesion plate has gray color (similar R, G, B values)
    assert low_color[0] == low_color[1] == low_color[2], "Expected gray color for low cohesion"

    # Verify pixels are colored
    assert tuple(frame[10, 10]) == high_color, "High cohesion tile not colored correctly"
    assert tuple(frame[50, 50]) == low_color, "Low cohesion tile not colored correctly"

    # Export to PNG
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
        temp_path = f.name

    try:
        heatmap.render_to_png([high_plate, low_plate], temp_path)
        assert os.path.exists(temp_path), "PNG file not created"
        assert os.path.getsize(temp_path) > 0, "PNG file is empty"
    finally:
        if os.path.exists(temp_path):
            os.unlink(temp_path)


# ============================================================================
# Test 4: Plate Force Calculation
# ============================================================================


def test_plate_force_calculation():
    """
    E2E test: Plate with 3 agents, cohesion 0.8, verify force = total_budget * cohesion.
    """
    # Create a plate with known values
    plate = TectonicPlate(
        plate_id="force_test_plate",
        agents=["agent_1", "agent_2", "agent_3"],
        centroid=np.zeros(64, dtype=np.float32),
        cohesion=0.8,
        agent_budgets={
            "agent_1": 100.0,
            "agent_2": 100.0,
            "agent_3": 100.0,
        },
        tiles=[(5, 5)],
    )

    # Calculate expected force
    total_budget = 300.0  # 100 + 100 + 100
    expected_force = total_budget * 0.8  # 240.0

    # Verify force calculation
    assert plate.total_budget == total_budget, f"Expected budget {total_budget}, got {plate.total_budget}"
    assert plate.calculate_force() == expected_force, f"Expected force {expected_force}, got {plate.calculate_force()}"

    # Verify in negotiation context
    negotiator = TectonicNegotiator()
    claim_id = negotiator.submit_plate_claim(plate, (0, 0), "test")

    claim = negotiator.get_claim(claim_id)
    assert claim.bid == expected_force, "Claim bid should equal plate force"


# ============================================================================
# Test 5: Training Then District Formation
# ============================================================================


def test_training_then_district_formation():
    """
    E2E test: Run SimulationArena with different strategies,
    learn strategy profile, form districts based on trained profiles.
    """
    np.random.seed(789)

    # Step 1: Run SimulationArena with different strategies
    configs = [
        AgentConfig(agent_id="agg_1", budget=100.0, strategy_type=StrategyType.AGGRESSIVE),
        AgentConfig(agent_id="agg_2", budget=100.0, strategy_type=StrategyType.AGGRESSIVE),
        AgentConfig(agent_id="con_1", budget=100.0, strategy_type=StrategyType.CONSERVATIVE),
        AgentConfig(agent_id="con_2", budget=100.0, strategy_type=StrategyType.CONSERVATIVE),
    ]

    arena = SimulationArena(agent_configs=configs)
    arena.run_rounds(count=50)

    # Step 2: Learn strategy profile
    learner = StrategyLearner(config=LearningConfig(min_samples=10))
    learner.learn_from_arena(arena)

    # Derive learned strategy
    learned_profile = learner.derive_strategy()
    assert isinstance(learned_profile, StrategyProfile)

    # Step 3: Form districts based on trained profiles
    # Create vectors based on strategy similarity
    # Aggressive agents get similar vectors, conservative get different vectors
    aggressive_base = create_orthogonal_vector(64)
    conservative_base = create_orthogonal_vector(64)

    # Make conservative orthogonal to aggressive
    conservative_base = conservative_base - aggressive_base * np.dot(conservative_base, aggressive_base)
    conservative_base = conservative_base / np.linalg.norm(conservative_base)

    agents = {
        "agg_1": {"vector": aggressive_base + np.random.randn(64).astype(np.float32) * 0.05, "budget": 100.0},
        "agg_2": {"vector": aggressive_base + np.random.randn(64).astype(np.float32) * 0.05, "budget": 100.0},
        "con_1": {"vector": conservative_base + np.random.randn(64).astype(np.float32) * 0.05, "budget": 100.0},
        "con_2": {"vector": conservative_base + np.random.randn(64).astype(np.float32) * 0.05, "budget": 100.0},
    }

    # Form districts
    former = DistrictFormer(similarity_threshold=0.75)
    plates = former.form_districts(agents)

    # Should have 2 plates (aggressive cluster and conservative cluster)
    assert len(plates) == 2, f"Expected 2 plates, got {len(plates)}"

    # Verify statistics are available
    stats = arena.get_statistics()
    assert stats["rounds_completed"] == 50
    assert len(stats["win_counts"]) == 4


# ============================================================================
# Test 6: Ghost Layer Temporal Decay
# ============================================================================


def test_ghost_layer_temporal_decay():
    """
    E2E test: Push multiple frames, composite with decay,
    verify recent frames have more influence.
    """
    # Create ghost layer with known decay
    ghost = GhostLayer(depth=10, decay_gamma=0.5)

    # Create frames with different colors (to track influence)
    height, width = 32, 32
    frames = []
    for i in range(5):
        frame = np.zeros((height, width, 4), dtype=np.uint8)
        # Each frame has a unique color value
        frame[:, :, 0] = (i + 1) * 50  # R channel varies by frame
        frame[:, :, 3] = 255  # Full alpha
        frames.append(frame)
        ghost.push_frame(frame)

    # Composite
    result = ghost.composite()

    # Verify shape
    assert result.shape == (height, width, 4), f"Expected ({height}, {width}, 4), got {result.shape}"

    # Verify recent frames have more influence
    # The newest frame (frame 4 with R=250) should dominate
    # The oldest frame (frame 0 with R=50) should have least influence
    # With gamma=0.5 and 5 frames, newest weight is highest
    assert result[0, 0, 0] > 100, f"Expected high R value from recent frames, got {result[0, 0, 0]}"

    # Verify alpha is preserved
    assert result[0, 0, 3] == 255, "Alpha should be preserved"

    # Verify frame count
    assert ghost.frame_count == 5

    # Test clear
    ghost.clear()
    assert ghost.frame_count == 0

    # Empty composite returns zeros
    empty_result = ghost.composite()
    assert empty_result.shape == (0, 0, 4)


# ============================================================================
# Test 7: Plate Conflict State
# ============================================================================


def test_plate_conflict_state():
    """
    E2E test: Plate with conflict_count > 0, verify CONFLICT state, verify red color.
    """
    # Create plate with conflict
    plate = TectonicPlate(
        plate_id="conflict_plate",
        agents=["agent_1", "agent_2"],
        centroid=np.zeros(64, dtype=np.float32),
        cohesion=0.9,  # High cohesion but...
        conflict_count=3,  # Has conflicts!
        agent_budgets={"agent_1": 50.0, "agent_2": 50.0},
        tiles=[(20, 20)],
    )

    # Verify CONFLICT state takes priority
    assert plate.state == DistrictState.CONFLICT, f"Expected CONFLICT state, got {plate.state}"

    # Verify red color
    color = plate.get_color()
    expected_conflict_color = DISTRICT_COLORS[DistrictState.CONFLICT]
    assert color == expected_conflict_color, f"Expected {expected_conflict_color}, got {color}"

    # Verify red color values
    assert color[0] == 255, "Red channel should be 255 for conflict"
    assert color[1] == 51, "Green channel should be 51 for conflict"
    assert color[2] == 51, "Blue channel should be 51 for conflict"

    # Render to heatmap and verify red
    heatmap = DistrictHeatmap(width=64, height=64)
    frame = heatmap.render([plate])

    # Check that conflict tile is red
    tile_color = tuple(frame[20, 20])
    assert tile_color == expected_conflict_color, f"Tile color mismatch: {tile_color}"


# ============================================================================
# Test 8: Full Pipeline with Visualization
# ============================================================================


def test_full_pipeline_with_visualization():
    """
    E2E test: Create agents -> Form districts -> Negotiate -> Render.
    Full end-to-end integration.
    """
    np.random.seed(999)

    # Step 1: Create agents with different strategies
    base_agg = create_orthogonal_vector(64)
    base_con = create_orthogonal_vector(64)
    base_con = base_con - base_agg * np.dot(base_con, base_agg)
    base_con = base_con / np.linalg.norm(base_con)

    agents = {
        "aggressive_alpha": {
            "vector": base_agg + np.random.randn(64).astype(np.float32) * 0.03,
            "budget": 150.0,
        },
        "aggressive_beta": {
            "vector": base_agg + np.random.randn(64).astype(np.float32) * 0.03,
            "budget": 150.0,
        },
        "conservative_gamma": {
            "vector": base_con + np.random.randn(64).astype(np.float32) * 0.03,
            "budget": 100.0,
        },
        "conservative_delta": {
            "vector": base_con + np.random.randn(64).astype(np.float32) * 0.03,
            "budget": 100.0,
        },
    }

    # Step 2: Form districts
    former = DistrictFormer(similarity_threshold=0.75)
    plates = former.form_districts(agents)

    assert len(plates) == 2, f"Expected 2 plates, got {len(plates)}"

    # Assign tiles to plates
    plates[0].tiles = [(10, 10), (10, 11), (11, 10)]
    plates[1].tiles = [(40, 40), (40, 41), (41, 40)]

    # Step 3: Negotiate
    negotiator = TectonicNegotiator()

    # Both plates submit claims
    claim_id_1 = negotiator.submit_plate_claim(plates[0], (10, 12), "expand_territory")
    claim_id_2 = negotiator.submit_plate_claim(plates[1], (40, 42), "expand_territory")

    # Settle both claims
    settlement_1 = negotiator.settle(claim_id_1)
    settlement_2 = negotiator.settle(claim_id_2)

    # Both should win (no counter-bids)
    assert settlement_1.winner == plates[0].plate_id
    assert settlement_2.winner == plates[1].plate_id

    # Step 4: Render visualization
    heatmap = DistrictHeatmap(width=64, height=64)

    # Render base layer
    frame = heatmap.render(plates)
    assert frame.shape == (64, 64, 4)

    # Render with borders
    frame_with_borders = heatmap.render_with_borders(plates, border_width=1)
    assert frame_with_borders.shape == (64, 64, 4)

    # Step 5: Create ghost layer visualization
    ghost = GhostLayer(depth=5, decay_gamma=0.3)

    # Push multiple frames
    for _ in range(3):
        ghost.push_frame(frame.copy())

    composite = ghost.composite()
    assert composite.shape == (64, 64, 4)

    # Step 6: Export final visualization
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
        temp_path = f.name

    try:
        heatmap.render_to_png(plates, temp_path)
        assert os.path.exists(temp_path)
        assert os.path.getsize(temp_path) > 0
    finally:
        if os.path.exists(temp_path):
            os.unlink(temp_path)

    # Verify negotiator statistics
    stats = negotiator.get_statistics()
    assert stats["total_settlements"] == 2
    assert len(stats["wins_by_agent"]) == 2


# ============================================================================
# Additional Integration Tests
# ============================================================================


def test_plate_serialization_roundtrip():
    """Test that plates can be serialized and deserialized correctly."""
    original = TectonicPlate(
        plate_id="serialize_test",
        agents=["a1", "a2", "a3"],
        centroid=np.random.randn(64).astype(np.float32),
        cohesion=0.85,
        name="Test Plate",
        purpose="Testing serialization",
        agent_budgets={"a1": 10.0, "a2": 20.0, "a3": 30.0},
        tiles=[(1, 2), (3, 4)],
        is_active=True,
        conflict_count=0,
    )

    # Serialize
    data = original.to_dict()

    # Verify serialization
    assert data["plate_id"] == "serialize_test"
    assert len(data["agents"]) == 3
    assert data["cohesion"] == 0.85
    assert data["name"] == "Test Plate"

    # Deserialize
    restored = TectonicPlate.from_dict(data)

    # Verify restoration
    assert restored.plate_id == original.plate_id
    assert restored.agents == original.agents
    assert np.allclose(restored.centroid, original.centroid)
    assert restored.cohesion == original.cohesion
    assert restored.name == original.name
    assert restored.purpose == original.purpose
    assert restored.agent_budgets == original.agent_budgets
    assert restored.tiles == original.tiles
    assert restored.is_active == original.is_active
    assert restored.state == DistrictState.ACTIVE


def test_vector_similarity_edge_cases():
    """Test VectorSimilarity with edge cases for E2E robustness."""
    # Test with 64-dim vectors (PixelBrain standard)
    vec_a = np.random.randn(64).astype(np.float32)
    vec_b = vec_a * 0.9 + np.random.randn(64).astype(np.float32) * 0.1

    similarity = VectorSimilarity.cosine(vec_a, vec_b)
    assert 0.7 < similarity <= 1.0, f"Expected high similarity, got {similarity}"

    # Test matrix computation
    vectors = [vec_a, vec_b, np.random.randn(64).astype(np.float32)]
    matrix = VectorSimilarity.matrix(vectors)

    assert matrix.shape == (3, 3)
    assert matrix[0, 0] == pytest.approx(1.0, abs=1e-5)
    assert matrix[1, 1] == pytest.approx(1.0, abs=1e-5)
    assert matrix[0, 1] == pytest.approx(matrix[1, 0], abs=1e-5)


def test_heatmap_with_background():
    """Test heatmap rendering with a background image."""
    # Create plates
    plate = TectonicPlate(
        plate_id="bg_test",
        agents=["test"],
        centroid=np.zeros(64, dtype=np.float32),
        cohesion=0.9,
        agent_budgets={"test": 50.0},
        tiles=[(5, 5), (6, 6)],
    )

    # Create background
    background = np.zeros((32, 32, 4), dtype=np.uint8)
    background[:, :, 1] = 128  # Green background
    background[:, :, 3] = 255

    # Render with background
    heatmap = DistrictHeatmap(width=32, height=32)
    frame = heatmap.render([plate], background=background)

    # Verify background is preserved where there are no tiles
    assert frame[0, 0, 1] == 128, "Background should be preserved"

    # Verify tile is colored with plate color
    tile_color = tuple(frame[5, 5])
    assert tile_color == plate.get_color(), "Tile should have plate color"
