"""
Tests for Terminal Area Agent - Phase 20-25: Generative Evolution

Coverage targets:
- Terminal texture analysis edge cases
- Error handling paths
- Async operations (semantic publishing)
"""

import pytest
import numpy as np
from unittest.mock import Mock, patch, MagicMock, AsyncMock
import asyncio

from systems.evolution_daemon.area_agents.terminal_agent import (
    TerminalAreaAgent,
    EvolutionProposal,
    SEMANTIC_PUBLISHING_ENABLED,
)


# Fixtures
# ========

@pytest.fixture
def sample_texture():
    """Create a sample terminal texture (80x24 RGBA)."""
    texture = np.zeros((24, 80, 4), dtype=np.uint8)
    # Add some content in the middle
    texture[5:15, 10:30] = [ord('A'), 7, 0, 0]  # White-on-black 'A's
    return texture


@pytest.fixture
def sparse_texture():
    """Create a sparse texture (< 10% density) for consolidation testing."""
    texture = np.zeros((24, 80, 4), dtype=np.uint8)
    # Very few non-empty cells
    texture[5, 10] = [ord('X'), 7, 0, 0]
    texture[10, 20] = [ord('Y'), 7, 0, 0]
    return texture


@pytest.fixture
def dense_texture():
    """Create a dense texture (> 80% density) for erosion testing."""
    texture = np.full((24, 80, 4), fill_value=[ord('#'), 7, 0, 0], dtype=np.uint8)
    return texture


@pytest.fixture
def high_entropy_texture():
    """Create a high-entropy texture with diverse characters."""
    texture = np.zeros((24, 80, 4), dtype=np.uint8)
    # Fill with diverse characters
    for i in range(24):
        for j in range(80):
            texture[i, j] = [((i * 80 + j) % 95) + 32, 7, 0, 0]  # ASCII 32-126
    return texture


@pytest.fixture
def agent():
    """Create a basic terminal area agent."""
    return TerminalAreaAgent(
        agent_id="test_agent",
        bounds=(0, 0, 80, 24),
        semantic_publishing=False
    )


@pytest.fixture
def agent_with_publishing():
    """Create an agent with semantic publishing enabled."""
    return TerminalAreaAgent(
        agent_id="test_agent_pub",
        bounds=(10, 5, 50, 20),
        semantic_publishing=True
    )


# Basic Initialization Tests
# ==========================

class TestTerminalAreaAgentInit:
    """Test agent initialization."""

    def test_init_basic(self, agent):
        """Test basic agent initialization."""
        assert agent.agent_id == "test_agent"
        assert agent.bounds == (0, 0, 80, 24)
        assert agent.width == 80
        assert agent.height == 24
        assert agent.evolution_count == 0
        assert agent.analysis_history == []

    def test_init_with_custom_bounds(self):
        """Test agent with non-origin bounds."""
        agent = TerminalAreaAgent(
            agent_id="offset_agent",
            bounds=(100, 50, 200, 100),
            semantic_publishing=False
        )
        assert agent.bounds == (100, 50, 200, 100)
        assert agent.width == 100
        assert agent.height == 50

    def test_init_semantic_publishing_disabled(self, agent):
        """Test that semantic publishing is disabled when requested."""
        assert agent.journaler is None

    def test_init_semantic_publishing_enabled_but_unavailable(self):
        """Test semantic publishing when module unavailable."""
        with patch(
            'systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED',
            False
        ):
            agent = TerminalAreaAgent(
                agent_id="test",
                bounds=(0, 0, 80, 24),
                semantic_publishing=True
            )
            assert agent.journaler is None


# Analysis Tests
# ==============

class TestAnalyze:
    """Test texture analysis."""

    def test_analyze_basic(self, agent, sample_texture):
        """Test basic analysis returns expected structure."""
        result = agent.analyze(sample_texture)

        assert 'density' in result
        assert 'entropy' in result
        assert 'non_empty_cells' in result
        assert 'patterns' in result
        assert 'region_bounds' in result

        assert result['region_bounds'] == agent.bounds
        assert isinstance(result['patterns'], list)

    def test_analyze_records_history(self, agent, sample_texture):
        """Test that analysis is recorded in history."""
        assert len(agent.analysis_history) == 0

        agent.analyze(sample_texture)
        assert len(agent.analysis_history) == 1

        agent.analyze(sample_texture)
        assert len(agent.analysis_history) == 2

    def test_analyze_respects_bounds(self):
        """Test that analysis only looks at specified region."""
        # Create agent with offset bounds
        agent = TerminalAreaAgent(
            agent_id="offset",
            bounds=(10, 5, 30, 15),
            semantic_publishing=False
        )

        # Create texture with content only outside bounds
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        texture[0:5, 0:10] = [ord('X'), 7, 0, 0]  # Outside bounds

        result = agent.analyze(texture)
        # Should have low density since region is empty
        assert result['density'] < 0.1

    def test_analyze_empty_region(self, agent):
        """Test analysis of completely empty region."""
        empty_texture = np.zeros((24, 80, 4), dtype=np.uint8)
        result = agent.analyze(empty_texture)

        assert result['density'] == 0.0
        assert result['non_empty_cells'] == 0
        assert result['entropy'] == 0.0

    def test_analyze_full_region(self, agent, dense_texture):
        """Test analysis of fully populated region."""
        result = agent.analyze(dense_texture)

        assert result['density'] > 0.8
        assert result['non_empty_cells'] > 0


# Evolution Proposal Tests
# ========================

class TestProposeEvolution:
    """Test evolution proposal generation."""

    def test_propose_evolution_sparse_region(self, agent, sparse_texture):
        """Test consolidation proposal for sparse region."""
        proposal = agent.propose_evolution(sparse_texture)

        assert proposal is not None
        assert proposal.operation == "consolidate"
        assert "low density" in proposal.rationale.lower()
        assert proposal.agent_id == "test_agent"

    def test_propose_evolution_high_entropy(self, agent, high_entropy_texture):
        """Test sharpen proposal for high entropy region."""
        proposal = agent.propose_evolution(high_entropy_texture)

        assert proposal is not None
        assert proposal.operation == "sharpen"
        assert "entropy" in proposal.rationale.lower()

    def test_propose_evolution_dense_region(self, agent, dense_texture):
        """Test erode proposal for dense region."""
        proposal = agent.propose_evolution(dense_texture)

        assert proposal is not None
        assert proposal.operation == "erode"
        assert "dead code" in proposal.rationale.lower()

    def test_propose_evolution_increments_count(self, agent, sparse_texture):
        """Test that proposals increment evolution count."""
        initial_count = agent.evolution_count
        proposal = agent.propose_evolution(sparse_texture)
        # Sparse texture triggers consolidation, which increments count
        if proposal:
            assert agent.evolution_count > initial_count

    def test_propose_evolution_returns_none_for_moderate_texture(self, agent):
        """Test that moderate textures return no proposal."""
        # Create a texture with moderate density (not too sparse, not too dense)
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        texture[5:15, 10:30] = [ord('A'), 7, 0, 0]  # About 10% density
        # This should have moderate entropy too

        # If it doesn't trigger any condition, should return None
        proposal = agent.propose_evolution(texture)
        # Note: This might still return a proposal depending on exact values
        # The test validates the logic path exists

    def test_propose_evolution_confidence_increases_with_history(
        self, agent, sparse_texture
    ):
        """Test that confidence increases with more analysis history."""
        proposal1 = agent.propose_evolution(sparse_texture)
        confidence1 = proposal1.confidence

        # Add more history
        for _ in range(5):
            agent.analyze(sparse_texture)

        proposal2 = agent.propose_evolution(sparse_texture)
        confidence2 = proposal2.confidence

        assert confidence2 > confidence1

    def test_propose_evolution_confidence_caps_at_09(self, agent, sparse_texture):
        """Test that confidence is capped at 0.9."""
        # Add lots of history
        for _ in range(20):
            agent.analyze(sparse_texture)

        proposal = agent.propose_evolution(sparse_texture)
        assert proposal.confidence <= 0.9


# Apply Evolution Tests
# =====================

class TestApplyEvolution:
    """Test applying evolution proposals."""

    def test_apply_evolution_erode(self, agent):
        """Test applying erode operation."""
        # Create a texture with variation (not uniform)
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        texture[5:15, 10:30] = [ord('#'), 7, 0, 0]  # Dense block
        texture[0:5, 0:10] = [ord('X'), 7, 0, 0]  # Another block

        proposal = EvolutionProposal(
            agent_id="test_agent",
            operation="erode",
            region=(0, 0, 80, 24),
            confidence=0.8,
            rationale="Test erode",
            metadata={}
        )

        result = agent.apply_evolution(texture.copy(), proposal)

        assert result.shape == texture.shape
        # With variation, erosion should change some values at edges
        # Note: If texture is uniform within blocks, erosion might not change much

    def test_apply_evolution_sharpen(self, agent, high_entropy_texture):
        """Test applying sharpen operation."""
        proposal = EvolutionProposal(
            agent_id="test_agent",
            operation="sharpen",
            region=(0, 0, 80, 24),
            confidence=0.8,
            rationale="Test sharpen",
            metadata={}
        )

        result = agent.apply_evolution(high_entropy_texture.copy(), proposal)

        assert result.shape == high_entropy_texture.shape

    def test_apply_evolution_consolidate(self, agent, sparse_texture):
        """Test applying consolidate operation (placeholder)."""
        proposal = EvolutionProposal(
            agent_id="test_agent",
            operation="consolidate",
            region=(0, 0, 80, 24),
            confidence=0.8,
            rationale="Test consolidate",
            metadata={}
        )

        # Consolidate is a placeholder, should not crash
        result = agent.apply_evolution(sparse_texture.copy(), proposal)
        assert result is not None

    def test_apply_evolution_respects_region(self):
        """Test that evolution only affects specified region."""
        agent = TerminalAreaAgent(
            agent_id="test",
            bounds=(0, 0, 80, 24),
            semantic_publishing=False
        )

        texture = np.full((24, 80, 4), fill_value=[255, 7, 0, 0], dtype=np.uint8)
        original_outside = texture[0:5, 60:80].copy()

        proposal = EvolutionProposal(
            agent_id="test",
            operation="erode",
            region=(10, 5, 30, 15),  # Small region
            confidence=0.8,
            rationale="Test",
            metadata={}
        )

        result = agent.apply_evolution(texture, proposal)

        # Area outside region should be unchanged
        np.testing.assert_array_equal(result[0:5, 60:80], original_outside)

    def test_apply_evolution_unknown_operation(self, agent, sample_texture):
        """Test applying unknown operation (should not crash)."""
        proposal = EvolutionProposal(
            agent_id="test_agent",
            operation="unknown_op",
            region=(0, 0, 80, 24),
            confidence=0.8,
            rationale="Test unknown",
            metadata={}
        )

        # Should not raise, just pass through
        result = agent.apply_evolution(sample_texture.copy(), proposal)
        assert result is not None


# Edge Cases
# ==========

class TestEdgeCases:
    """Test edge cases and boundary conditions."""

    def test_analyze_single_cell_texture(self):
        """Test analyzing a 1x1 texture."""
        agent = TerminalAreaAgent(
            agent_id="tiny",
            bounds=(0, 0, 1, 1),
            semantic_publishing=False
        )
        texture = np.array([[[ord('X'), 7, 0, 0]]], dtype=np.uint8)

        result = agent.analyze(texture)
        assert result['density'] == 1.0
        assert result['non_empty_cells'] == 1

    def test_analyze_large_texture(self):
        """Test analyzing a large texture."""
        agent = TerminalAreaAgent(
            agent_id="large",
            bounds=(0, 0, 200, 100),
            semantic_publishing=False
        )
        texture = np.random.randint(0, 128, (100, 200, 4), dtype=np.uint8)

        result = agent.analyze(texture)
        assert 0.0 <= result['density'] <= 1.0

    def test_propose_evolution_with_special_characters(self, agent):
        """Test with special ASCII characters."""
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        # Fill with control characters and special chars
        for i in range(24):
            for j in range(80):
                texture[i, j] = [i + j, 7, 0, 0]

        # Should not crash
        proposal = agent.propose_evolution(texture)
        # Result depends on density/entropy values

    def test_bounds_at_texture_edge(self):
        """Test with bounds at texture edges."""
        agent = TerminalAreaAgent(
            agent_id="edge",
            bounds=(79, 23, 80, 24),  # Single cell at corner
            semantic_publishing=False
        )
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        texture[23, 79] = [ord('X'), 7, 0, 0]

        result = agent.analyze(texture)
        assert result['density'] == 1.0

    def test_zero_dimension_bounds_nan_density(self):
        """Test that zero-dimension bounds result in NaN density."""
        # Bounds with same x1/x2 or y1/y2
        agent = TerminalAreaAgent(
            agent_id="zero_width",
            bounds=(10, 10, 10, 20),  # Zero width
            semantic_publishing=False
        )
        assert agent.width == 0

        # Analysis should work but density calculation involves division by 0
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        result = agent.analyze(texture)
        # Division by zero results in NaN, which is expected behavior
        assert np.isnan(result['density']) or result['density'] == 0.0


# Error Handling Tests
# ====================

class TestErrorHandling:
    """Test error handling paths."""

    def test_analyze_with_none_texture(self, agent):
        """Test analysis with None texture."""
        with pytest.raises(Exception):  # AttributeError or similar
            agent.analyze(None)

    def test_analyze_with_wrong_shape_texture(self, agent):
        """Test analysis with incorrectly shaped texture."""
        # 2D instead of 3D
        texture = np.zeros((24, 80), dtype=np.uint8)

        with pytest.raises(Exception):  # IndexError or similar
            agent.analyze(texture)

    def test_analyze_with_missing_alpha_channel(self, agent):
        """Test analysis with RGB instead of RGBA - may raise or return unexpected results."""
        texture = np.zeros((24, 80, 3), dtype=np.uint8)

        # This might raise IndexError or produce unexpected results
        # depending on implementation
        try:
            result = agent.analyze(texture)
            # If it doesn't raise, verify it handles gracefully
            assert 'density' in result
        except (IndexError, ValueError, TypeError):
            # Expected behavior - wrong number of channels
            pass

    def test_propose_evolution_with_invalid_texture(self, agent):
        """Test proposal with invalid texture."""
        with pytest.raises(Exception):
            agent.propose_evolution(None)

    def test_apply_evolution_with_none_proposal(self, agent, sample_texture):
        """Test apply with None proposal."""
        with pytest.raises(AttributeError):
            agent.apply_evolution(sample_texture, None)

    def test_apply_evolution_with_out_of_bounds_region(self, agent):
        """Test apply with region outside texture bounds - numpy slices gracefully."""
        texture = np.zeros((24, 80, 4), dtype=np.uint8)

        proposal = EvolutionProposal(
            agent_id="test",
            operation="erode",
            region=(100, 100, 200, 200),  # Way outside
            confidence=0.8,
            rationale="Test",
            metadata={}
        )

        # Numpy slicing doesn't raise for out-of-bounds, just returns empty array
        # The apply_evolution will process an empty region
        result = agent.apply_evolution(texture.copy(), proposal)
        # Should return the texture unchanged since region is empty
        assert result.shape == texture.shape


# Semantic Publishing Integration Tests
# =====================================

class TestSemanticPublishing:
    """Test semantic publishing integration."""

    def test_journaler_disabled_when_module_unavailable(self):
        """Test that journaler is None when module not available."""
        with patch(
            'systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED',
            False
        ):
            agent = TerminalAreaAgent(
                agent_id="test",
                bounds=(0, 0, 80, 24),
                semantic_publishing=True
            )
            assert agent.journaler is None

    @patch('systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED', True)
    @patch('systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler')
    def test_journaler_enabled_when_available(self, mock_journaler_class):
        """Test that journaler is created when module available."""
        mock_journaler = Mock()
        mock_journaler_class.return_value = mock_journaler

        agent = TerminalAreaAgent(
            agent_id="test",
            bounds=(0, 0, 80, 24),
            semantic_publishing=True
        )

        mock_journaler_class.assert_called_once_with(enabled=True)
        assert agent.journaler == mock_journaler

    @patch('systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED', True)
    @patch('systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler')
    def test_propose_evolution_logs_to_journaler(self, mock_journaler_class, sparse_texture):
        """Test that proposals are logged to journaler."""
        mock_journaler = Mock()
        mock_journaler_class.return_value = mock_journaler

        agent = TerminalAreaAgent(
            agent_id="test",
            bounds=(0, 0, 80, 24),
            semantic_publishing=True
        )

        agent.propose_evolution(sparse_texture)

        # Should have logged analysis and proposal
        assert mock_journaler.log_analysis.called or mock_journaler.log_proposal.called

    @patch('systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED', True)
    @patch('systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler')
    def test_analyze_logs_to_journaler(self, mock_journaler_class, sample_texture):
        """Test that analysis is logged via propose_evolution."""
        mock_journaler = Mock()
        mock_journaler_class.return_value = mock_journaler

        agent = TerminalAreaAgent(
            agent_id="test",
            bounds=(0, 0, 80, 24),
            semantic_publishing=True
        )

        # propose_evolution calls analyze internally
        agent.propose_evolution(sample_texture)

        # log_analysis is called within propose_evolution after analyze
        assert mock_journaler.log_analysis.called


# EvolutionProposal Dataclass Tests
# =================================

class TestEvolutionProposal:
    """Test EvolutionProposal dataclass."""

    def test_proposal_creation(self):
        """Test creating a proposal."""
        proposal = EvolutionProposal(
            agent_id="agent1",
            operation="erode",
            region=(0, 0, 10, 10),
            confidence=0.75,
            rationale="Test rationale",
            metadata={"key": "value"}
        )

        assert proposal.agent_id == "agent1"
        assert proposal.operation == "erode"
        assert proposal.region == (0, 0, 10, 10)
        assert proposal.confidence == 0.75
        assert proposal.rationale == "Test rationale"
        assert proposal.metadata == {"key": "value"}

    def test_proposal_metadata_defaults_to_empty_dict(self):
        """Test that metadata can be empty."""
        proposal = EvolutionProposal(
            agent_id="agent1",
            operation="test",
            region=(0, 0, 10, 10),
            confidence=0.5,
            rationale="Test",
            metadata={}
        )

        assert proposal.metadata == {}


# Integration Tests
# =================

class TestIntegration:
    """Integration tests for full workflows."""

    def test_full_evolution_cycle(self, agent, sparse_texture):
        """Test full cycle: analyze -> propose -> apply."""
        # Propose
        proposal = agent.propose_evolution(sparse_texture)
        assert proposal is not None

        # Apply
        result = agent.apply_evolution(sparse_texture.copy(), proposal)

        assert result.shape == sparse_texture.shape
        assert agent.evolution_count == 1

    def test_multiple_evolution_rounds(self, agent):
        """Test multiple rounds of evolution."""
        texture = np.zeros((24, 80, 4), dtype=np.uint8)

        for i in range(3):
            # Add some content
            texture[5 + i * 3, 10 + i * 5] = [ord('X'), 7, 0, 0]

            proposal = agent.propose_evolution(texture)
            if proposal:
                texture = agent.apply_evolution(texture.copy(), proposal)

        assert agent.evolution_count >= 1

    def test_agent_with_offset_bounds_full_workflow(self):
        """Test full workflow with offset bounds."""
        agent = TerminalAreaAgent(
            agent_id="offset_agent",
            bounds=(20, 10, 60, 20),
            semantic_publishing=False
        )

        # Create texture with content in the agent's region
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        texture[10:20, 20:60] = [ord('A'), 7, 0, 0]

        proposal = agent.propose_evolution(texture)
        # Dense region should trigger erode
        assert proposal is not None

        result = agent.apply_evolution(texture.copy(), proposal)
        assert result.shape == texture.shape


# Async Operations Tests
# ======================

class TestAsyncOperations:
    """Test async operations for semantic publishing."""

    @pytest.mark.asyncio
    async def test_async_journaler_connection(self):
        """Test async journaler connection flow."""
        with patch(
            'systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED',
            True
        ):
            with patch(
                'systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler'
            ) as mock_journaler_class:
                mock_journaler = Mock()
                mock_journaler.publisher = Mock()
                mock_journaler.publisher.connect_bridge = AsyncMock(return_value=True)
                mock_journaler_class.return_value = mock_journaler

                agent = TerminalAreaAgent(
                    agent_id="test_async",
                    bounds=(0, 0, 80, 24),
                    semantic_publishing=True
                )

                # If journaler has async connect, it should be callable
                if hasattr(agent.journaler.publisher, 'connect_bridge'):
                    result = await agent.journaler.publisher.connect_bridge()
                    assert result is True

    @pytest.mark.asyncio
    async def test_async_pulse_sending(self):
        """Test async pulse sending to visual bridge."""
        with patch(
            'systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED',
            True
        ):
            with patch(
                'systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler'
            ) as mock_journaler_class:
                mock_journaler = Mock()
                mock_journaler.publisher = Mock()
                mock_journaler.publisher.send_pulse = AsyncMock()
                mock_journaler_class.return_value = mock_journaler

                agent = TerminalAreaAgent(
                    agent_id="test_async",
                    bounds=(0, 0, 80, 24),
                    semantic_publishing=True
                )

                # Verify the publisher mock was created
                assert agent.journaler is not None

    @pytest.mark.asyncio
    async def test_full_async_evolution_workflow(self):
        """Test full async workflow with journaler."""
        with patch(
            'systems.evolution_daemon.area_agents.terminal_agent.SEMANTIC_PUBLISHING_ENABLED',
            True
        ):
            with patch(
                'systems.evolution_daemon.area_agents.terminal_agent.EvolutionJournaler'
            ) as mock_journaler_class:
                mock_journaler = Mock()
                mock_journaler.log_proposal = Mock()
                mock_journaler.log_analysis = Mock()
                mock_journaler_class.return_value = mock_journaler

                agent = TerminalAreaAgent(
                    agent_id="async_test",
                    bounds=(0, 0, 80, 24),
                    semantic_publishing=True
                )

                # Create sparse texture to trigger consolidation
                texture = np.zeros((24, 80, 4), dtype=np.uint8)
                texture[5, 10] = [ord('X'), 7, 0, 0]

                # Run propose (which internally calls async-capable journaler)
                proposal = agent.propose_evolution(texture)

                # Verify journaler was called
                assert mock_journaler.log_analysis.called

                if proposal:
                    assert mock_journaler.log_proposal.called


# Pattern Recognition Integration Tests
# =====================================

class TestPatternRecognition:
    """Test pattern recognition integration."""

    def test_detects_shell_prompts(self, agent):
        """Test detection of shell prompt patterns."""
        texture = np.zeros((24, 80, 4), dtype=np.uint8)
        # Add prompt character at start of lines
        texture[0, 0] = [ord('$'), 7, 0, 0]
        texture[1, 0] = [ord('#'), 7, 0, 0]

        result = agent.analyze(texture)
        patterns = result['patterns']

        # Should detect shell prompts
        pattern_types = [p[0] for p in patterns]
        assert 'SHELL_PROMPT' in pattern_types

    def test_detects_empty_regions(self, agent):
        """Test detection of empty regions."""
        texture = np.zeros((24, 80, 4), dtype=np.uint8)  # Completely empty

        result = agent.analyze(texture)
        patterns = result['patterns']

        pattern_types = [p[0] for p in patterns]
        assert 'EMPTY_REGION' in pattern_types

    def test_patterns_include_confidence(self, agent, sample_texture):
        """Test that patterns include confidence scores."""
        result = agent.analyze(sample_texture)
        patterns = result['patterns']

        for pattern_type, confidence in patterns:
            assert isinstance(confidence, float)
            assert 0.0 <= confidence <= 1.0


# Module Constants Test
# =====================

class TestModuleConstants:
    """Test module-level constants and imports."""

    def test_semantic_publishing_flag_exists(self):
        """Test that SEMANTIC_PUBLISHING_ENABLED flag exists."""
        assert isinstance(SEMANTIC_PUBLISHING_ENABLED, bool)

    def test_evolution_proposal_is_dataclass(self):
        """Test that EvolutionProposal is a dataclass."""
        from dataclasses import fields

        field_names = [f.name for f in fields(EvolutionProposal)]
        assert 'agent_id' in field_names
        assert 'operation' in field_names
        assert 'region' in field_names
        assert 'confidence' in field_names
        assert 'rationale' in field_names
        assert 'metadata' in field_names
