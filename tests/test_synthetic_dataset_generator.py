# tests/test_synthetic_dataset_generator.py
"""Tests for synthetic dataset generator."""

import pytest
import numpy as np
from systems.pixel_brain.synthetic_dataset_generator import (
    SyntheticDatasetGenerator,
    AllocationTask,
    generate_allocation_seed_dataset,
)
from systems.pixel_brain.constants import (
    OPCODE_ALLOC,
    OPCODE_HALT,
    COLORS,
    ALLOC_SIZES,
    ALLOC_COLORS,
    TEXTURE_SIZE,
    QUADRANT_PIXELS,
)


class TestAllocationTask:
    """Test individual allocation tasks."""

    def test_create_task(self):
        """Create a basic allocation task."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(10, 10),
        )
        assert task.size == (4, 4)
        assert task.color == "BLUE"
        assert task.position == (10, 10)

    def test_task_has_prompt(self):
        """Task should generate a prompt string."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(10, 10),
        )
        prompt = task.to_prompt()
        assert "ALLOC" in prompt
        assert "4x4" in prompt
        assert "BLUE" in prompt
        assert "10,10" in prompt

    def test_task_has_ground_truth(self):
        """Task should generate ground truth codels."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(16, 16),
        )
        ground_truth = task.to_ground_truth()
        assert isinstance(ground_truth, np.ndarray)
        assert ground_truth.shape == (TEXTURE_SIZE, TEXTURE_SIZE)


class TestSyntheticDatasetGenerator:
    """Test the dataset generator."""

    @pytest.fixture
    def generator(self):
        """Create a generator instance."""
        return SyntheticDatasetGenerator(seed=42)

    def test_generator_creates_tasks(self, generator):
        """Generator should create allocation tasks."""
        tasks = generator.generate_tasks(count=10)
        assert len(tasks) == 10
        assert all(isinstance(t, AllocationTask) for t in tasks)

    def test_generator_is_reproducible(self):
        """Same seed should produce same tasks."""
        gen1 = SyntheticDatasetGenerator(seed=42)
        gen2 = SyntheticDatasetGenerator(seed=42)

        tasks1 = gen1.generate_tasks(count=5)
        tasks2 = gen2.generate_tasks(count=5)

        for t1, t2 in zip(tasks1, tasks2):
            assert t1.size == t2.size
            assert t1.color == t2.color
            assert t1.position == t2.position

    def test_generator_uses_valid_sizes(self, generator):
        """Generated tasks should use valid sizes."""
        tasks = generator.generate_tasks(count=50)
        for task in tasks:
            assert task.size in ALLOC_SIZES

    def test_generator_uses_valid_colors(self, generator):
        """Generated tasks should use valid colors."""
        tasks = generator.generate_tasks(count=50)
        for task in tasks:
            assert task.color in ALLOC_COLORS

    def test_generate_training_pair(self, generator):
        """Generate a complete training pair."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(16, 16))
        pair = generator.generate_training_pair(task)

        assert "prompt_indices" in pair
        assert "intent_indices" in pair
        assert "code_indices" in pair
        assert "terminus_indices" in pair
        assert "ground_truth" in pair

        # Q0-Q3 indices should be lists
        assert isinstance(pair["prompt_indices"], list)
        assert len(pair["prompt_indices"]) == QUADRANT_PIXELS

    def test_generate_dataset(self, generator):
        """Generate full dataset."""
        dataset = generator.generate_dataset(count=10)

        assert len(dataset) == 10
        for pair in dataset:
            assert "prompt_indices" in pair
            assert "ground_truth" in pair


class TestGroundTruthGeneration:
    """Test ground truth codel generation."""

    def test_ground_truth_has_alloc_opcode(self):
        """Ground truth should contain ALLOC opcode."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(16, 16))
        ground_truth = task.to_ground_truth()

        # Check that ALLOC opcode (201) appears somewhere
        assert OPCODE_ALLOC in ground_truth

    def test_ground_truth_has_halt_opcode(self):
        """Ground truth should contain HALT opcode."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(16, 16))
        ground_truth = task.to_ground_truth()

        # Check that HALT opcode (213) appears
        assert OPCODE_HALT in ground_truth


class TestConvenienceFunction:
    """Test the convenience function for dataset generation."""

    def test_generate_allocation_seed_dataset(self):
        """Generate dataset using convenience function."""
        dataset = generate_allocation_seed_dataset(count=5, seed=123)

        assert len(dataset) == 5
        assert all("prompt_indices" in pair for pair in dataset)
        assert all("ground_truth" in pair for pair in dataset)
