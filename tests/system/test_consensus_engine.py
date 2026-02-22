"""
Tests for ConsensusEngine in the Collective Consciousness system.

Task 5: ConsensusEngine for Federated Inference
- Weighted aggregation by confidence
- Agreement detection using cosine similarity
- Conflict resolution
"""

import pytest
import numpy as np
from datetime import datetime, timezone

from systems.visual_shell.swarm.consciousness import (
    ThoughtType,
    Thought,
)
from systems.visual_shell.swarm.consciousness.consensus_engine import ConsensusEngine


class TestConsensusEngineInit:
    """Test cases for ConsensusEngine initialization."""

    def test_engine_initializes_with_default_params(self):
        """Test ConsensusEngine initializes with default parameters."""
        engine = ConsensusEngine()

        assert engine.agreement_threshold == 0.8
        assert engine.timeout_seconds == 5.0

    def test_engine_initializes_with_custom_params(self):
        """Test ConsensusEngine initializes with custom parameters."""
        engine = ConsensusEngine(
            agreement_threshold=0.9,
            timeout_seconds=10.0
        )

        assert engine.agreement_threshold == 0.9
        assert engine.timeout_seconds == 10.0

    def test_engine_validates_agreement_threshold_range(self):
        """Test ConsensusEngine validates agreement_threshold is in [0, 1]."""
        # Should raise for values outside [0, 1]
        with pytest.raises(ValueError):
            ConsensusEngine(agreement_threshold=-0.1)

        with pytest.raises(ValueError):
            ConsensusEngine(agreement_threshold=1.5)

    def test_engine_validates_timeout_positive(self):
        """Test ConsensusEngine validates timeout_seconds is positive."""
        with pytest.raises(ValueError):
            ConsensusEngine(timeout_seconds=0.0)

        with pytest.raises(ValueError):
            ConsensusEngine(timeout_seconds=-1.0)


class TestConsensusEngineAggregate:
    """Test cases for ConsensusEngine.aggregate()."""

    @pytest.fixture
    def engine(self):
        """Create a ConsensusEngine instance for testing."""
        return ConsensusEngine()

    @pytest.fixture
    def sample_inferences(self):
        """Create sample inference thoughts for testing."""
        return [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.8, 0.1, 0.1]),
                confidence=0.9,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.7, 0.2, 0.1]),
                confidence=0.8,
            ),
            Thought(
                agent_id="agent-003",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.9, 0.05, 0.05]),
                confidence=0.85,
            ),
        ]

    @pytest.mark.asyncio
    async def test_aggregate_returns_consensus_thought(self, engine, sample_inferences):
        """Test aggregate() returns a consensus Thought."""
        result = await engine.aggregate(sample_inferences)

        assert result is not None
        assert isinstance(result, Thought)
        assert result.thought_type == ThoughtType.INFERENCE

    @pytest.mark.asyncio
    async def test_aggregate_returns_none_for_empty_list(self, engine):
        """Test aggregate([]) returns None."""
        result = await engine.aggregate([])

        assert result is None

    @pytest.mark.asyncio
    async def test_aggregate_returns_none_for_none_input(self, engine):
        """Test aggregate(None) returns None."""
        result = await engine.aggregate(None)

        assert result is None

    @pytest.mark.asyncio
    async def test_aggregate_uses_confidence_weighting(self, engine):
        """Test aggregate() uses confidence weighting (higher confidence has more influence)."""
        # Create two inferences where high confidence agent has very different content
        # This verifies weighting actually affects the result
        high_confidence_inference = Thought(
            agent_id="high-conf-agent",
            thought_type=ThoughtType.INFERENCE,
            content=np.array([1.0, 0.0, 0.0]),
            confidence=0.99,  # Very high confidence
        )
        low_confidence_inference = Thought(
            agent_id="low-conf-agent",
            thought_type=ThoughtType.INFERENCE,
            content=np.array([0.0, 0.0, 1.0]),
            confidence=0.01,  # Very low confidence
        )

        result = await engine.aggregate([high_confidence_inference, low_confidence_inference])

        assert result is not None
        # Result should be closer to high confidence inference's content
        # [1.0, 0.0, 0.0] weighted 0.99 vs [0.0, 0.0, 1.0] weighted 0.01
        # Weighted avg = (0.99*[1,0,0] + 0.01*[0,0,1]) / 1.0 = [0.99, 0, 0.01]
        assert result.content[0] > 0.9  # Should be close to 1.0
        assert result.content[2] < 0.1  # Should be close to 0.0

    @pytest.mark.asyncio
    async def test_aggregate_handles_single_inference(self, engine):
        """Test aggregate() handles single inference correctly."""
        single = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.INFERENCE,
            content=np.array([0.5, 0.3, 0.2]),
            confidence=0.9,
        )

        result = await engine.aggregate([single])

        assert result is not None
        np.testing.assert_array_almost_equal(result.content, single.content)

    @pytest.mark.asyncio
    async def test_aggregate_preserves_thought_type(self, engine):
        """Test aggregate() preserves the thought type from input inferences."""
        inferences = [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([0.5, 0.5]),
                confidence=0.8,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([0.6, 0.4]),
                confidence=0.9,
            ),
        ]

        result = await engine.aggregate(inferences)

        assert result.thought_type == ThoughtType.EMBEDDING


class TestConsensusEngineDetectAgreement:
    """Test cases for ConsensusEngine.detect_agreement()."""

    @pytest.fixture
    def engine(self):
        """Create a ConsensusEngine instance for testing."""
        return ConsensusEngine(agreement_threshold=0.8)

    @pytest.fixture
    def similar_inferences(self):
        """Create similar inference thoughts for testing."""
        return [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.8, 0.1, 0.1]),
                confidence=0.9,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.79, 0.11, 0.1]),
                confidence=0.85,
            ),
            Thought(
                agent_id="agent-003",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.81, 0.09, 0.1]),
                confidence=0.88,
            ),
        ]

    @pytest.fixture
    def different_inferences(self):
        """Create different inference thoughts for testing."""
        return [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([1.0, 0.0, 0.0]),
                confidence=0.9,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.0, 1.0, 0.0]),
                confidence=0.85,
            ),
            Thought(
                agent_id="agent-003",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.0, 0.0, 1.0]),
                confidence=0.88,
            ),
        ]

    @pytest.mark.asyncio
    async def test_detect_agreement_returns_true_for_similar(self, engine, similar_inferences):
        """Test detect_agreement() returns True for similar inferences."""
        result = await engine.detect_agreement(similar_inferences)

        assert result is True

    @pytest.mark.asyncio
    async def test_detect_agreement_returns_false_for_different(self, engine, different_inferences):
        """Test detect_agreement() returns False for different inferences."""
        result = await engine.detect_agreement(different_inferences)

        assert result is False

    @pytest.mark.asyncio
    async def test_detect_agreement_returns_false_for_empty_list(self, engine):
        """Test detect_agreement() returns False for empty list."""
        result = await engine.detect_agreement([])

        assert result is False

    @pytest.mark.asyncio
    async def test_detect_agreement_returns_true_for_single_inference(self, engine):
        """Test detect_agreement() returns True for single inference (trivial agreement)."""
        single = [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.5, 0.3, 0.2]),
                confidence=0.9,
            )
        ]

        result = await engine.detect_agreement(single)

        assert result is True

    @pytest.mark.asyncio
    async def test_detect_agreement_respects_threshold(self):
        """Test detect_agreement() respects the agreement_threshold parameter."""
        # Create borderline inferences - exactly at threshold boundary
        # Cosine similarity of [1,0] and [0.6, 0.8] = 0.6
        engine_low_threshold = ConsensusEngine(agreement_threshold=0.5)
        engine_high_threshold = ConsensusEngine(agreement_threshold=0.9)

        inferences = [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([1.0, 0.0]),
                confidence=0.9,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.6, 0.8]),
                confidence=0.9,
            ),
        ]

        result_low = await engine_low_threshold.detect_agreement(inferences)
        result_high = await engine_high_threshold.detect_agreement(inferences)

        # With threshold 0.5, should agree (0.6 > 0.5)
        assert result_low is True
        # With threshold 0.9, should not agree (0.6 < 0.9)
        assert result_high is False


class TestConsensusEngineResolveConflict:
    """Test cases for ConsensusEngine.resolve_conflict()."""

    @pytest.fixture
    def engine(self):
        """Create a ConsensusEngine instance for testing."""
        return ConsensusEngine()

    @pytest.fixture
    def conflicting_inferences(self):
        """Create conflicting inference thoughts for testing."""
        return [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.9, 0.05, 0.05]),
                confidence=0.7,
                metadata={"hypothesis": "A"},
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.1, 0.8, 0.1]),
                confidence=0.9,  # Higher confidence
                metadata={"hypothesis": "B"},
            ),
        ]

    @pytest.mark.asyncio
    async def test_resolve_conflict_uses_weighted_aggregation(self, engine, conflicting_inferences):
        """Test resolve_conflict() uses weighted aggregation."""
        result = await engine.resolve_conflict(conflicting_inferences)

        assert result is not None
        assert isinstance(result, Thought)
        # Result should be weighted average, not simple average
        # Higher confidence agent should have more influence
        assert result.content[1] > result.content[0]  # agent-002 has higher conf

    @pytest.mark.asyncio
    async def test_resolve_conflict_adds_conflict_metadata(self, engine, conflicting_inferences):
        """Test resolve_conflict() adds conflict resolution metadata."""
        result = await engine.resolve_conflict(conflicting_inferences)

        assert result is not None
        assert "conflict_resolved" in result.metadata
        assert result.metadata["conflict_resolved"] is True

    @pytest.mark.asyncio
    async def test_resolve_conflict_returns_none_for_empty_list(self, engine):
        """Test resolve_conflict() returns None for empty list."""
        result = await engine.resolve_conflict([])

        assert result is None

    @pytest.mark.asyncio
    async def test_resolve_conflict_returns_single_thought_unchanged(self, engine):
        """Test resolve_conflict() returns single thought with conflict metadata."""
        single = [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.5, 0.3, 0.2]),
                confidence=0.9,
            )
        ]

        result = await engine.resolve_conflict(single)

        assert result is not None
        np.testing.assert_array_almost_equal(result.content, single[0].content)
        assert "conflict_resolved" in result.metadata


class TestConsensusEngineIntegration:
    """Integration tests for ConsensusEngine."""

    @pytest.fixture
    def engine(self):
        """Create a ConsensusEngine instance for testing."""
        return ConsensusEngine(agreement_threshold=0.8)

    @pytest.mark.asyncio
    async def test_full_consensus_workflow(self, engine):
        """Test full consensus workflow: aggregate -> detect_agreement -> resolve_conflict."""
        # Create a set of inferences
        inferences = [
            Thought(
                agent_id=f"agent-{i:03d}",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.8 + 0.01 * i, 0.1 - 0.005 * i, 0.1 - 0.005 * i]),
                confidence=0.8 + 0.05 * i,
            )
            for i in range(5)
        ]

        # Step 1: Aggregate
        consensus = await engine.aggregate(inferences)
        assert consensus is not None

        # Step 2: Check agreement
        has_agreement = await engine.detect_agreement(inferences)
        assert has_agreement is True

        # Step 3: If no agreement, resolve conflict (shouldn't happen here)
        if not has_agreement:
            resolved = await engine.resolve_conflict(inferences)
            assert resolved is not None

    @pytest.mark.asyncio
    async def test_conflict_resolution_workflow(self, engine):
        """Test conflict resolution workflow when agents disagree."""
        # Create conflicting inferences
        conflicting = [
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.9, 0.1]),
                confidence=0.6,
            ),
            Thought(
                agent_id="agent-002",
                thought_type=ThoughtType.INFERENCE,
                content=np.array([0.1, 0.9]),
                confidence=0.95,  # Much higher confidence
            ),
        ]

        # Should detect disagreement
        has_agreement = await engine.detect_agreement(conflicting)
        assert has_agreement is False

        # Should resolve conflict with weighted result
        resolved = await engine.resolve_conflict(conflicting)
        assert resolved is not None
        # Higher confidence agent's content should dominate
        assert resolved.content[1] > resolved.content[0]
