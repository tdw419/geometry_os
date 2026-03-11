"""
Test EvolutionDaemon weight mutation integration.

Tests the integration of WeightMutator into EvolutionDaemon for
brain atlas evolution with sector-based mutations.
"""

import numpy as np
import pytest


def test_evolution_daemon_has_weight_mutator():
    """EvolutionDaemon should initialize weight_mutator when brain_atlas provided."""
    # Create a small test brain atlas (64x64x3 for speed)
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    # Import here to avoid issues if module doesn't exist
    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    # Create daemon with brain atlas
    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Verify weight_mutator is initialized
    assert hasattr(daemon, 'weight_mutator'), "Daemon should have weight_mutator attribute"
    assert daemon.weight_mutator is not None, "weight_mutator should be initialized"
    assert daemon.brain_atlas is not None, "brain_atlas should be stored"


def test_evolution_daemon_without_brain_atlas():
    """EvolutionDaemon should work without brain_atlas (weight_mutator None)."""
    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    # Create daemon without brain atlas
    daemon = EvolutionDaemon(brain_atlas=None)

    # Verify weight_mutator is None
    assert hasattr(daemon, 'weight_mutator'), "Daemon should have weight_mutator attribute"
    assert daemon.weight_mutator is None, "weight_mutator should be None when no brain_atlas"


def test_propose_weight_mutation():
    """EvolutionDaemon.propose_weight_mutation should apply mutations."""
    # Create a small test brain atlas
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)
    original_checksum = _checksum_atlas(test_atlas)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Propose a mutation
    result = daemon.propose_weight_mutation(
        sector="embeddings",
        mutation_type="noise",
        intensity=0.1,
        reason="Test mutation"
    )

    # Verify result structure
    assert isinstance(result, dict), "Result should be a dict"
    assert "status" in result, "Result should have status"
    assert result["status"] in ["proposed", "applied", "rejected"], \
        f"Invalid status: {result['status']}"

    # If applied, verify atlas changed
    if result["status"] == "applied":
        new_checksum = _checksum_atlas(daemon.brain_atlas)
        assert new_checksum != original_checksum, "Atlas should have changed after mutation"
        assert "mutation_id" in result, "Result should have mutation_id"


def test_propose_weight_mutation_radiation():
    """Test radiation mutation type."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    result = daemon.propose_weight_mutation(
        sector="attention_layer_0",
        mutation_type="radiation",
        intensity=0.5,
        reason="Exploration mutation"
    )

    assert result["status"] in ["proposed", "applied", "rejected"]


def test_propose_weight_mutation_crossover():
    """Test crossover mutation type."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    result = daemon.propose_weight_mutation(
        sector="ffn_layer_0",
        mutation_type="crossover",
        intensity=0.3,
        reason="Combine learned features"
    )

    assert result["status"] in ["proposed", "applied", "rejected"]


def test_resolve_sector_bounds():
    """EvolutionDaemon._resolve_sector_bounds should map sector names to bounds."""
    # Create test atlas (assuming 64x64)
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Test known sectors
    sectors = ["embeddings", "attention_layer_0", "ffn_layer_0", "lm_head"]

    for sector in sectors:
        bounds = daemon._resolve_sector_bounds(sector)

        assert isinstance(bounds, dict), f"Bounds for {sector} should be dict"
        assert "start" in bounds, f"Bounds for {sector} should have start"
        assert "end" in bounds, f"Bounds for {sector} should have end"
        assert bounds["start"] >= 0, f"Start for {sector} should be non-negative"
        assert bounds["end"] > bounds["start"], f"End for {sector} should be > start"
        assert bounds["end"] <= 64 * 64, f"End for {sector} should be within atlas"


def test_resolve_unknown_sector():
    """Unknown sectors should return None."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Unknown sectors should return None
    bounds = daemon._resolve_sector_bounds("unknown_sector_xyz")
    assert bounds is None, "Unknown sector should return None"


def test_weight_mutation_preserves_atlas_shape():
    """Mutations should not change atlas shape."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)
    original_shape = test_atlas.shape

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Apply several mutations
    for i in range(5):
        daemon.propose_weight_mutation(
            sector="embeddings",
            mutation_type="noise",
            intensity=0.05,
            reason=f"Test mutation {i}"
        )

    # Verify shape unchanged
    assert daemon.brain_atlas.shape == original_shape, \
        "Atlas shape should be preserved after mutations"


def test_weight_mutator_integration():
    """Test that weight_mutator is properly integrated."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.weight_mutator import WeightMutator
    except ImportError as e:
        pytest.skip(f"Required module not available: {e}")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Verify weight_mutator is a WeightMutator instance
    assert isinstance(daemon.weight_mutator, WeightMutator), \
        "weight_mutator should be WeightMutator instance"

    # Verify it has the correct atlas
    assert daemon.weight_mutator.atlas.shape == test_atlas.shape, \
        "Mutator atlas should match provided atlas"


def test_multiple_mutations_accumulate():
    """Multiple mutations should have cumulative effect."""
    test_atlas = np.random.rand(64, 64, 3).astype(np.float32)
    original_checksum = _checksum_atlas(test_atlas)

    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    except ImportError:
        pytest.skip("EvolutionDaemon not available")

    daemon = EvolutionDaemon(brain_atlas=test_atlas)

    # Apply multiple mutations
    checksums = []
    for i in range(3):
        daemon.propose_weight_mutation(
            sector="embeddings",
            mutation_type="noise",
            intensity=0.1,
            reason=f"Mutation {i}"
        )
        checksums.append(_checksum_atlas(daemon.brain_atlas))

    # Each mutation should change the atlas
    assert checksums[0] != original_checksum, "First mutation should change atlas"
    assert checksums[1] != checksums[0], "Second mutation should change atlas"
    assert checksums[2] != checksums[1], "Third mutation should change atlas"


# Helper functions
def _checksum_atlas(atlas: np.ndarray) -> str:
    """Calculate checksum of atlas for comparison."""
    import hashlib
    flat = atlas.tobytes()
    return hashlib.sha256(flat).hexdigest()[:16]
