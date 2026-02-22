"""
Integration tests for the Collective Consciousness system.

Task 6: Integration Tests
Tests for end-to-end federated inference flows combining all components:
- ThoughtEngine for generating embeddings and computing attention
- ThoughtBroadcaster for routing thoughts via A2A
- ConsciousnessState for global shared state
- ConsensusEngine for federated inference aggregation
"""

import pytest
import numpy as np

from systems.visual_shell.swarm.consciousness import (
    ThoughtType,
    Thought,
    ThoughtEngine,
    ConsensusEngine,
    ConsciousnessState,
)
from systems.visual_shell.swarm.consciousness.thought_broadcaster import (
    ThoughtBroadcaster,
)


class TestFederatedQueryFlow:
    """Tests for complete federated query flow across multiple agents."""

    @pytest.fixture
    def agents(self):
        """Create 3 agents with ThoughtEngines and Broadcasters."""
        agents = []
        for i in range(3):
            engine = ThoughtEngine(agent_id=f"agent-{i}", embedding_dim=64)
            broadcaster = ThoughtBroadcaster(agent_id=f"agent-{i}")
            agents.append({"id": f"agent-{i}", "engine": engine, "broadcaster": broadcaster})
        return agents

    @pytest.fixture
    def consciousness_state(self):
        """Create a ConsciousnessState for shared state."""
        return ConsciousnessState(max_thoughts=100)

    @pytest.mark.asyncio
    async def test_federated_query_flow(self, agents, consciousness_state):
        """
        Test complete federated query flow:
        - Agent 0 generates query embedding
        - All agents generate context embeddings
        - Agent 1 computes attention over contexts
        - Add all to ConsciousnessState
        - Compute attention map
        - Verify state has correct counts
        """
        # Step 1: Agent 0 generates query embedding
        agent_0 = agents[0]
        query_thought = await agent_0["engine"].generate_embedding("What is the meaning of life?")
        assert query_thought.thought_type == ThoughtType.EMBEDDING
        assert query_thought.agent_id == "agent-0"

        # Step 2: All agents generate context embeddings
        context_thoughts = []
        for agent in agents:
            context = await agent["engine"].generate_embedding(
                f"Context from {agent['id']} about philosophy"
            )
            context_thoughts.append(context)
            agent["engine"].add_to_context(context)

        assert len(context_thoughts) == 3

        # Step 3: Agent 1 computes attention over contexts
        agent_1 = agents[1]
        attention_thought = await agent_1["engine"].compute_attention(
            query_thought, context_thoughts
        )
        assert attention_thought.thought_type == ThoughtType.ATTENTION
        assert attention_thought.agent_id == "agent-1"
        # Attention weights should sum to ~1.0 (softmax)
        np.testing.assert_almost_equal(
            np.sum(attention_thought.content), 1.0, decimal=5
        )

        # Step 4: Add all to ConsciousnessState
        consciousness_state.add_thought(query_thought)
        for ctx in context_thoughts:
            consciousness_state.add_thought(ctx)
        consciousness_state.add_thought(attention_thought)

        # Add embeddings to pool for attention map
        # Use distinct keys for query and contexts to get 4 embeddings
        consciousness_state.add_embedding("query-agent-0", query_thought.content)
        for ctx in context_thoughts:
            consciousness_state.add_embedding(f"context-{ctx.agent_id}", ctx.content)

        # Step 5: Compute attention map
        attention_map = consciousness_state.compute_attention_map()
        assert attention_map is not None
        # Should be 4x4 (1 query + 3 contexts)
        assert attention_map.shape == (4, 4)
        # Diagonal should be 1.0 (self-attention)
        for i in range(4):
            np.testing.assert_almost_equal(attention_map[i, i], 1.0, decimal=5)

        # Step 6: Verify state has correct counts
        assert len(consciousness_state.embedding_pool) == 4
        all_thoughts = consciousness_state.get_recent_thoughts()
        assert len(all_thoughts) == 5  # 1 query + 3 contexts + 1 attention

        # Verify thought types
        queries = consciousness_state.get_recent_thoughts(ThoughtType.QUERY)
        # Note: generate_embedding creates EMBEDDING type, not QUERY
        embeddings = consciousness_state.get_recent_thoughts(ThoughtType.EMBEDDING)
        attentions = consciousness_state.get_recent_thoughts(ThoughtType.ATTENTION)

        assert len(embeddings) == 4  # 1 query + 3 contexts (all embeddings)
        assert len(attentions) == 1


class TestConsensusFormation:
    """Tests for agents forming consensus on inferences."""

    @pytest.fixture
    def engines(self):
        """Create 5 ThoughtEngines for consensus testing."""
        return [
            ThoughtEngine(agent_id=f"agent-{i}", embedding_dim=64)
            for i in range(5)
        ]

    @pytest.fixture
    def consensus_engine(self):
        """Create a ConsensusEngine with threshold."""
        return ConsensusEngine(agreement_threshold=0.8)

    @pytest.mark.asyncio
    async def test_consensus_formation(self, engines, consensus_engine):
        """
        Test agents form consensus:
        - Create 5 ThoughtEngines
        - All process same query with slight variations
        - Use ConsensusEngine.aggregate() to form consensus
        - Verify consensus has source_count=5
        - Check detect_agreement() returns True
        """
        # Create inference thoughts with similar content to simulate agreement
        # Using a base embedding with small variations
        base_embedding = np.array([0.7, 0.2, 0.05, 0.03, 0.02])
        base_embedding = base_embedding / np.linalg.norm(base_embedding)  # Normalize

        inference_thoughts = []
        for i, engine in enumerate(engines):
            # Add small random noise to create slight variations
            np.random.seed(42 + i)  # Deterministic variation
            noise = np.random.randn(5) * 0.05
            varied_content = base_embedding + noise
            varied_content = varied_content / np.linalg.norm(varied_content)  # Re-normalize

            # Create an inference thought with the varied content
            # Slightly vary the confidence to test weighted aggregation
            inference = Thought(
                agent_id=engine.agent_id,
                thought_type=ThoughtType.INFERENCE,
                content=varied_content.astype(np.float32),
                confidence=0.8 + 0.04 * i,  # Confidence varies: 0.8, 0.84, 0.88, 0.92, 0.96
            )
            inference_thoughts.append(inference)

        assert len(inference_thoughts) == 5

        # Use ConsensusEngine.aggregate() to form consensus
        consensus = await consensus_engine.aggregate(inference_thoughts)

        # Verify consensus properties
        assert consensus is not None
        assert consensus.agent_id == "consensus"
        assert consensus.thought_type == ThoughtType.INFERENCE

        # Verify consensus has source_count=5 in metadata
        assert consensus.metadata.get("source") == "aggregate"
        assert consensus.metadata.get("count") == 5

        # Check detect_agreement() returns True (similar embeddings should agree)
        has_agreement = await consensus_engine.detect_agreement(inference_thoughts)
        assert has_agreement is True

    @pytest.mark.asyncio
    async def test_consensus_with_identical_inferences(self, consensus_engine):
        """Test consensus formation with identical inferences (perfect agreement)."""
        # Create 5 identical inferences
        identical_content = np.array([0.7, 0.2, 0.1])
        inferences = [
            Thought(
                agent_id=f"agent-{i}",
                thought_type=ThoughtType.INFERENCE,
                content=identical_content.copy(),
                confidence=0.9,
            )
            for i in range(5)
        ]

        consensus = await consensus_engine.aggregate(inferences)
        assert consensus is not None
        np.testing.assert_array_almost_equal(consensus.content, identical_content)

        has_agreement = await consensus_engine.detect_agreement(inferences)
        assert has_agreement is True


class TestBroadcastRateLimiting:
    """Tests for broadcasting respecting rate limits."""

    @pytest.fixture
    def broadcaster(self):
        """Create a ThoughtBroadcaster with default rate limits."""
        return ThoughtBroadcaster(agent_id="test-agent")

    def test_broadcast_rate_limiting(self, broadcaster):
        """
        Test broadcasting respects rate limits:
        - Create ThoughtBroadcaster
        - Exhaust QUERY limit (2 broadcasts)
        - Verify check_rate_limit returns False for QUERY
        - Verify EMBEDDING still allowed
        """
        # Create a QUERY thought
        query_thought = Thought(
            agent_id="test-agent",
            thought_type=ThoughtType.QUERY,
            content=np.array([1.0, 2.0, 3.0]),
        )

        # Default QUERY limit is 2 per second
        # Record 2 broadcasts to exhaust the limit
        broadcaster.record_broadcast(query_thought)
        broadcaster.record_broadcast(query_thought)

        # Now check_rate_limit should return False for QUERY
        allowed = broadcaster.check_rate_limit(query_thought)
        assert allowed is False, "QUERY should be rate limited after 2 broadcasts"

        # Verify EMBEDDING still allowed (limit is 10)
        embedding_thought = Thought(
            agent_id="test-agent",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0, 2.0, 3.0]),
        )
        allowed = broadcaster.check_rate_limit(embedding_thought)
        assert allowed is True, "EMBEDDING should still be allowed"

    def test_rate_limit_different_types_independent(self, broadcaster):
        """Test that rate limits are independent per thought type."""
        # Exhaust QUERY limit
        query_thought = Thought(
            agent_id="test-agent",
            thought_type=ThoughtType.QUERY,
            content=np.array([1.0]),
        )
        broadcaster.record_broadcast(query_thought)
        broadcaster.record_broadcast(query_thought)

        # EMBEDDING, ATTENTION, and INFERENCE should still be allowed
        for thought_type, limit in [
            (ThoughtType.EMBEDDING, 10),
            (ThoughtType.ATTENTION, 50),
            (ThoughtType.INFERENCE, 5),
        ]:
            thought = Thought(
                agent_id="test-agent",
                thought_type=thought_type,
                content=np.array([1.0]),
            )
            allowed = broadcaster.check_rate_limit(thought)
            assert allowed is True, f"{thought_type.value} should be allowed"


class TestSerializationRoundtrip:
    """Tests for thought serialization correctness."""

    @pytest.fixture
    def broadcaster(self):
        """Create a ThoughtBroadcaster for serialization."""
        return ThoughtBroadcaster(agent_id="test-agent")

    def test_serialization_roundtrip(self, broadcaster):
        """
        Test Thoughts serialize correctly:
        - Create Thought with numpy content
        - Serialize via ThoughtBroadcaster
        - Deserialize and verify all fields match
        """
        # Create a Thought with numpy content
        original_content = np.array([0.1, 0.2, 0.3, 0.4, 0.5])
        original = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.INFERENCE,
            content=original_content,
            confidence=0.95,
            metadata={"source": "test", "priority": "high"},
        )

        # Serialize via ThoughtBroadcaster
        serialized = broadcaster.serialize(original)
        assert isinstance(serialized, bytes)
        assert len(serialized) > 0

        # Deserialize
        restored = broadcaster.deserialize(serialized)

        # Verify all fields match
        assert restored.thought_id == original.thought_id
        assert restored.agent_id == original.agent_id
        assert restored.thought_type == original.thought_type
        np.testing.assert_array_almost_equal(restored.content, original.content)
        assert restored.confidence == original.confidence
        assert restored.metadata == original.metadata

    def test_serialization_2d_array(self, broadcaster):
        """Test serialization handles 2D numpy arrays correctly."""
        # Create a Thought with 2D content (e.g., attention matrix)
        original_content = np.array([
            [1.0, 0.5, 0.2],
            [0.5, 1.0, 0.3],
            [0.2, 0.3, 1.0],
        ])
        original = Thought(
            agent_id="agent-002",
            thought_type=ThoughtType.ATTENTION,
            content=original_content,
            confidence=0.88,
        )

        # Serialize and deserialize
        serialized = broadcaster.serialize(original)
        restored = broadcaster.deserialize(serialized)

        # Verify shape and content
        assert restored.content.shape == original_content.shape
        np.testing.assert_array_almost_equal(restored.content, original_content)

    def test_serialization_preserves_all_types(self, broadcaster):
        """Test serialization works for all ThoughtTypes."""
        for thought_type in [
            ThoughtType.EMBEDDING,
            ThoughtType.ATTENTION,
            ThoughtType.INFERENCE,
            ThoughtType.QUERY,
        ]:
            original = Thought(
                agent_id="test-agent",
                thought_type=thought_type,
                content=np.array([1.0, 2.0]),
                confidence=0.9,
            )

            serialized = broadcaster.serialize(original)
            restored = broadcaster.deserialize(serialized)

            assert restored.thought_type == thought_type, (
                f"Thought type {thought_type} not preserved"
            )


class TestFullSystemIntegration:
    """End-to-end integration tests for the full consciousness system."""

    @pytest.mark.asyncio
    async def test_full_swarm_consensus_flow(self):
        """
        Test full flow: multiple agents generate thoughts, broadcast,
        store in shared state, and form consensus.
        """
        # Setup: Create agents with engines and broadcasters
        num_agents = 4
        agents = [
            {
                "id": f"agent-{i}",
                "engine": ThoughtEngine(agent_id=f"agent-{i}", embedding_dim=32),
                "broadcaster": ThoughtBroadcaster(agent_id=f"agent-{i}"),
            }
            for i in range(num_agents)
        ]

        # Global shared state
        state = ConsciousnessState(max_thoughts=100)
        consensus_engine = ConsensusEngine()

        # Each agent generates an embedding for a similar topic
        topic = "distributed computing systems"
        all_embeddings = []

        for agent in agents:
            # Generate embedding
            thought = await agent["engine"].generate_embedding(topic)
            all_embeddings.append(thought)

            # Add to shared state
            state.add_thought(thought)
            state.add_embedding(agent["id"], thought.content)

        # Compute global attention map
        attention_map = state.compute_attention_map()
        assert attention_map is not None
        assert attention_map.shape == (num_agents, num_agents)

        # Create inference thoughts and form consensus
        inference_thoughts = [
            Thought(
                agent_id=agent["id"],
                thought_type=ThoughtType.INFERENCE,
                content=embedding.content.copy(),
                confidence=0.85 + 0.03 * i,
            )
            for i, (agent, embedding) in enumerate(zip(agents, all_embeddings))
        ]

        consensus = await consensus_engine.aggregate(inference_thoughts)
        assert consensus is not None
        assert consensus.metadata["count"] == num_agents

        # Check that agents agree
        has_agreement = await consensus_engine.detect_agreement(inference_thoughts)
        assert has_agreement is True

        # Update consensus state
        state.update_consensus("topic_consensus", consensus.to_dict())

        # Verify consensus was stored
        stored = state.get_consensus("topic_consensus")
        assert stored is not None
        assert stored["agent_id"] == "consensus"
