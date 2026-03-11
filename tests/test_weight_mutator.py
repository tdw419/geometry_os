"""
Tests for WeightMutator - Hilbert-indexed weight sector mutations.

Enables the Evolution Daemon to physically mutate model weights in the Brain Atlas.
"""


import numpy as np
import pytest

from systems.evolution_daemon.weight_mutator import MutationRecord, WeightMutator


class TestMutationRecord:
    """Test MutationRecord dataclass."""

    def test_mutation_record_creation(self):
        """Test creating a MutationRecord."""
        record = MutationRecord(
            mutation_id="test-mutation-001",
            mutation_type="radiation",
            hilbert_start=100,
            hilbert_end=200,
            pixels_affected=100,
            intensity=0.5,
            checksum_before="abc123",
            checksum_after="def456"
        )

        assert record.mutation_id == "test-mutation-001"
        assert record.mutation_type == "radiation"
        assert record.hilbert_start == 100
        assert record.hilbert_end == 200
        assert record.pixels_affected == 100
        assert record.intensity == 0.5
        assert record.checksum_before == "abc123"
        assert record.checksum_after == "def456"


class TestWeightMutator:
    """Test WeightMutator class."""

    @pytest.fixture
    def sample_atlas(self):
        """Create a sample weight atlas (64x64x4 for testing)."""
        np.random.seed(42)
        return np.random.randn(64, 64, 4).astype(np.float16)

    @pytest.fixture
    def hilbert_lut(self):
        """Create a Hilbert lookup table for 64x64 grid."""
        # Generate Hilbert LUT for 64x64
        from systems.evolution.HilbertEngine import HilbertEngine
        engine = HilbertEngine()
        lut = []
        for d in range(64 * 64):
            x, y = engine.d2xy(64, d)
            lut.append((y, x))  # (row, col) for array indexing
        return lut

    @pytest.fixture
    def mutator(self, sample_atlas, hilbert_lut):
        """Create WeightMutator instance."""
        return WeightMutator(sample_atlas, hilbert_lut)

    def test_init(self, sample_atlas, hilbert_lut):
        """Test WeightMutator initialization."""
        mutator = WeightMutator(sample_atlas, hilbert_lut)
        assert mutator.atlas.shape == sample_atlas.shape
        assert len(mutator.hilbert_lut) == 64 * 64
        assert mutator.grid_size == 64

    def test_init_without_lut(self, sample_atlas):
        """Test WeightMutator initialization without LUT (auto-generate)."""
        mutator = WeightMutator(sample_atlas)
        assert mutator.atlas.shape == sample_atlas.shape
        assert len(mutator.hilbert_lut) == 64 * 64
        assert mutator.grid_size == 64

    def test_radiation_mutation(self, mutator):
        """Test radiation mutation type."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "radiation",
            "intensity": 0.5
        }

        original_atlas = mutator.atlas.copy()
        mutated_atlas, record = mutator.mutate_sector(config)

        # Verify mutation occurred
        assert not np.array_equal(mutated_atlas, original_atlas)

        # Verify only affected region changed
        affected_mask = np.zeros_like(mutated_atlas, dtype=bool)
        for d in range(config["hilbert_start"], config["hilbert_end"]):
            row, col = mutator.hilbert_lut[d]
            affected_mask[row, col] = True

        # Check that affected region changed
        assert np.any(mutated_atlas[affected_mask] != original_atlas[affected_mask])

        # Check that unaffected region remained same
        assert np.array_equal(
            mutated_atlas[~affected_mask],
            original_atlas[~affected_mask]
        )

        # Verify record
        assert record.mutation_type == "radiation"
        assert record.hilbert_start == 0
        assert record.hilbert_end == 100
        assert record.pixels_affected == 100
        assert record.intensity == 0.5
        assert record.checksum_before != record.checksum_after

    def test_crossover_mutation(self, mutator):
        """Test crossover mutation type."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "crossover",
            "intensity": 1.0,
            "source_sector": 1000  # Source sector starts at index 1000
        }

        original_atlas = mutator.atlas.copy()
        mutated_atlas, record = mutator.mutate_sector(config)

        # Verify mutation occurred
        assert not np.array_equal(mutated_atlas, original_atlas)

        # Verify record
        assert record.mutation_type == "crossover"
        assert record.pixels_affected == 100

    def test_noise_mutation(self, mutator):
        """Test noise mutation type (fine-tuning)."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "noise",
            "intensity": 0.1
        }

        original_atlas = mutator.atlas.copy()
        mutated_atlas, record = mutator.mutate_sector(config)

        # Noise should be subtle - verify changes are small
        affected_mask = np.zeros_like(mutated_atlas, dtype=bool)
        for d in range(config["hilbert_start"], config["hilbert_end"]):
            row, col = mutator.hilbert_lut[d]
            affected_mask[row, col] = True

        diff = np.abs(mutated_atlas[affected_mask] - original_atlas[affected_mask])
        # Noise should be smaller than radiation
        assert np.mean(diff) < 1.0  # Reasonable threshold for fp16

        # Verify record
        assert record.mutation_type == "noise"

    def test_invalid_mutation_type(self, mutator):
        """Test that invalid mutation type raises error."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "invalid_type",
            "intensity": 0.5
        }

        with pytest.raises(ValueError, match="Unknown mutation type"):
            mutator.mutate_sector(config)

    def test_checksum_calculation(self, mutator):
        """Test checksum calculation in mutation record."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "radiation",
            "intensity": 0.5
        }

        _, record = mutator.mutate_sector(config)

        # Verify checksums are hex strings
        assert isinstance(record.checksum_before, str)
        assert isinstance(record.checksum_after, str)
        assert len(record.checksum_before) > 0
        assert len(record.checksum_after) > 0
        assert record.checksum_before != record.checksum_after

    def test_multiple_sequential_mutations(self, mutator):
        """Test applying multiple mutations sequentially."""
        config1 = {
            "hilbert_start": 0,
            "hilbert_end": 50,
            "mutation_type": "radiation",
            "intensity": 0.3
        }

        config2 = {
            "hilbert_start": 50,
            "hilbert_end": 100,
            "mutation_type": "noise",
            "intensity": 0.1
        }

        original = mutator.atlas.copy()
        _, record1 = mutator.mutate_sector(config1)
        intermediate, record2 = mutator.mutate_sector(config2)

        # Verify both mutations applied
        assert not np.array_equal(intermediate, original)
        assert record1.mutation_id != record2.mutation_id

    def test_mutation_preserves_shape(self, mutator):
        """Test that mutation preserves atlas shape."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "radiation",
            "intensity": 0.5
        }

        original_shape = mutator.atlas.shape
        mutated, _ = mutator.mutate_sector(config)

        assert mutated.shape == original_shape
        assert mutated.dtype == mutator.atlas.dtype

    def test_mutation_id_uniqueness(self, mutator):
        """Test that each mutation gets a unique ID."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "radiation",
            "intensity": 0.5
        }

        _, record1 = mutator.mutate_sector(config)
        _, record2 = mutator.mutate_sector(config)

        assert record1.mutation_id != record2.mutation_id

    def test_bounds_checking(self, mutator):
        """Test that out-of-bounds indices are handled."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 10000,  # Way beyond atlas size
            "mutation_type": "radiation",
            "intensity": 0.5
        }

        # Should clamp to valid range
        mutated, record = mutator.mutate_sector(config)
        assert mutated.shape == mutator.atlas.shape

    def test_crossover_without_source_sector(self, mutator):
        """Test that crossover requires source_sector."""
        config = {
            "hilbert_start": 0,
            "hilbert_end": 100,
            "mutation_type": "crossover",
            "intensity": 1.0
        }

        with pytest.raises(ValueError, match="source_sector required"):
            mutator.mutate_sector(config)
