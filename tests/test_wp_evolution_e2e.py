"""
End-to-End Tests for WordPress Evolution GUI Integration.

Tests the full flow from content analysis to proposal generation to (mock) execution.
Verifies that all components work together correctly.
"""

import asyncio
import pytest
from unittest.mock import AsyncMock, MagicMock, patch

from systems.evolution_daemon.wordpress.content_analyzer import (
    WordPressContentAnalyzer,
    ContentAnalysis,
    ImprovementProposal,
)
from systems.evolution_daemon.wordpress.evolution_agent import (
    WordPressEvolutionAgent,
    EvolutionCycleResult,
)
from systems.evolution_daemon.wordpress.action_executor import (
    PlaywrightActionExecutor,
    ExecutionResult,
)
from systems.evolution_daemon.wordpress.bridge_service import (
    BridgeServiceConfig,
    WPEvolutionBridgeService,
)


class TestWPEvolutionE2E:
    """End-to-end tests for WordPress Evolution integration."""

    @pytest.fixture
    def sample_weak_post(self):
        """Create a sample weak post that needs improvement."""
        return {
            "id": 123,
            "title": "Test",
            "content": "This is short.",  # Under 50 words
        }

    @pytest.fixture
    def sample_strong_post(self):
        """Create a sample strong post that doesn't need improvement."""
        return {
            "id": 456,
            "title": "Comprehensive Guide to Geometry OS Architecture",
            "content": "This is a comprehensive guide that covers the entire "
            "Geometry OS architecture in detail. We will explore the spatial "
            "computing paradigm, the infinite map system, and the neural CPU. "
            "The system is designed for autonomous evolution and self-improvement. "
            "Each component works together to create a cohesive operating environment. "
            "The visual shell provides the interface, while the evolution daemon handles "
            "continuous improvement cycles. Memory beams connect semantic knowledge.",
        }

    @pytest.fixture
    def mock_posts_response(self, sample_weak_post, sample_strong_post):
        """Create a mock posts response."""
        return [sample_weak_post, sample_strong_post]

    @pytest.fixture
    def config(self):
        """Create a test config."""
        return BridgeServiceConfig(
            wp_url="http://test.local",
            ws_uri="ws://localhost:8768",
            cycle_interval=5,
            auto_execute=False,
            min_confidence=0.5,
        )

    @pytest.fixture
    def mock_memory_provider(self):
        """Create a mock WordPressMemoryProvider."""
        provider = MagicMock()
        provider.sync_posts = MagicMock()
        return provider

    @pytest.mark.asyncio
    async def test_full_cycle_flow_analyze_to_proposal(
        self, sample_weak_post, sample_strong_post
    ):
        """Test full cycle: analyze posts -> generate proposals -> (mock) execute."""
        analyzer = WordPressContentAnalyzer()

        # Step 1: Analyze weak post - should identify issues
        weak_analysis = analyzer.analyze(sample_weak_post)
        assert weak_analysis is not None
        assert weak_analysis.post_id == 123
        assert weak_analysis.word_count < 50
        assert len(weak_analysis.issues) > 0
        assert any("short" in issue.lower() for issue in weak_analysis.issues)

        # Step 2: Propose improvement for weak post
        proposal = analyzer.propose_improvement(sample_weak_post)
        assert proposal is not None
        assert proposal.post_id == 123
        assert proposal.improvement_type == "expand"
        assert proposal.confidence >= 0.5
        assert len(proposal.suggested_content) > len(sample_weak_post["content"])

        # Step 3: Analyze strong post - should have fewer issues
        strong_analysis = analyzer.analyze(sample_strong_post)
        assert strong_analysis is not None
        assert strong_analysis.word_count >= 50
        assert len(strong_analysis.issues) < len(weak_analysis.issues)

        # Step 4: Strong post proposal should have lower confidence (fewer issues)
        strong_proposal = analyzer.propose_improvement(sample_strong_post)
        if strong_proposal:
            assert strong_proposal.confidence < proposal.confidence

    @pytest.mark.asyncio
    async def test_bridge_service_orchestration(
        self, config, mock_posts_response, mock_memory_provider
    ):
        """Test that BridgeService orchestrates Agent + Executor + MemoryProvider correctly."""
        # Create mock agent that returns proposals
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_proposal = ImprovementProposal(
            post_id=123,
            improvement_type="expand",
            suggested_content="Expanded content here...",
            confidence=0.7,
            reason="Content needs expansion (10 words)",
        )
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=2,
                proposals_generated=1,
                proposals=[mock_proposal],
            )
        )

        # Create mock executor
        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()
        mock_executor.execute_proposal = AsyncMock(
            return_value=ExecutionResult(
                success=True,
                action="update_content",
                post_id=123,
            )
        )

        # Create service with mocked components
        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor,
            memory_provider=mock_memory_provider,
        )

        # Run a single cycle
        result = await service.run_single_cycle()

        # Verify agent was called
        mock_agent.run_cycle.assert_called_once()

        # Verify cycle result structure
        assert result["cycle_number"] == 1
        assert result["posts_analyzed"] == 2
        assert result["proposals_generated"] == 1
        assert result["qualified_proposals"] == 1  # 0.7 >= 0.5 min_confidence

        # Since auto_execute is False, executor should NOT have been called
        assert result["executed"] == 0
        mock_executor.execute_proposal.assert_not_called()

        # Memory sync should have been triggered
        mock_memory_provider.sync_posts.assert_called_once()

    @pytest.mark.asyncio
    async def test_bridge_service_auto_execute_enabled(
        self, config, mock_posts_response, mock_memory_provider
    ):
        """Test that auto_execute=True triggers proposal execution."""
        # Enable auto-execute
        config.auto_execute = True

        # Create mock agent
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_proposal = ImprovementProposal(
            post_id=123,
            improvement_type="expand",
            suggested_content="Expanded content...",
            confidence=0.8,  # High confidence
            reason="Needs expansion",
        )
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=1,
                proposals_generated=1,
                proposals=[mock_proposal],
            )
        )

        # Create mock executor
        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()
        mock_executor.execute_proposal = AsyncMock(
            return_value=ExecutionResult(
                success=True,
                action="publish",
                post_id=123,
            )
        )

        # Create service with auto_execute enabled
        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor,
            memory_provider=mock_memory_provider,
        )

        # Run a single cycle
        result = await service.run_single_cycle()

        # Executor should have been called for the qualified proposal
        assert result["executed"] == 1
        mock_executor.execute_proposal.assert_called_once_with(mock_proposal)

        # Stats should reflect execution
        stats = service.get_stats()
        assert stats.proposals_executed == 1

    @pytest.mark.asyncio
    async def test_memory_sync_triggered(self, config, mock_memory_provider):
        """Test that memory sync is triggered after each cycle when provider is configured."""
        # Create mock agent with empty cycle
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=0,
                proposals_generated=0,
                proposals=[],
            )
        )

        # Create service with memory provider
        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            memory_provider=mock_memory_provider,
        )

        # Run a cycle
        await service.run_single_cycle()

        # Memory sync should have been called
        mock_memory_provider.sync_posts.assert_called_once()

    @pytest.mark.asyncio
    async def test_memory_sync_not_triggered_without_provider(self, config):
        """Test that memory sync is NOT triggered when no provider is configured."""
        # Create mock agent
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=0,
                proposals_generated=0,
                proposals=[],
            )
        )

        # Create service WITHOUT memory provider
        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            memory_provider=None,  # No memory provider
        )

        # Run a cycle - should not raise any errors
        result = await service.run_single_cycle()

        # Should complete successfully
        assert result["cycle_number"] == 1

    @pytest.mark.asyncio
    async def test_confidence_filtering(self, config):
        """Test that proposals below min_confidence are not executed even with auto_execute=True."""
        config.auto_execute = True
        config.min_confidence = 0.7

        # Create mock agent with low-confidence proposal
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        low_confidence_proposal = ImprovementProposal(
            post_id=123,
            improvement_type="expand",
            suggested_content="Content...",
            confidence=0.5,  # Below min_confidence of 0.7
            reason="Needs expansion",
        )
        high_confidence_proposal = ImprovementProposal(
            post_id=456,
            improvement_type="enhance",
            suggested_content="Enhanced content...",
            confidence=0.9,  # Above min_confidence
            reason="Readability improvement",
        )
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=2,
                proposals_generated=2,
                proposals=[low_confidence_proposal, high_confidence_proposal],
            )
        )

        # Create mock executor
        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()
        mock_executor.execute_proposal = AsyncMock(
            return_value=ExecutionResult(
                success=True,
                action="publish",
                post_id=456,
            )
        )

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor,
        )

        result = await service.run_single_cycle()

        # Only 1 proposal should qualify (high confidence one)
        assert result["qualified_proposals"] == 1
        assert result["executed"] == 1

        # Only high-confidence proposal should be executed
        mock_executor.execute_proposal.assert_called_once_with(high_confidence_proposal)

    @pytest.mark.asyncio
    async def test_error_handling_in_cycle(self, config):
        """Test that errors in execution don't crash the cycle."""
        config.auto_execute = True

        # Create mock agent
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_proposal = ImprovementProposal(
            post_id=123,
            improvement_type="expand",
            suggested_content="Content...",
            confidence=0.8,
            reason="Needs expansion",
        )
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=1,
                proposals_generated=1,
                proposals=[mock_proposal],
            )
        )

        # Create mock executor that fails
        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()
        mock_executor.execute_proposal = AsyncMock(
            return_value=ExecutionResult(
                success=False,
                action="update_content",
                post_id=123,
                error="Connection lost",
            )
        )

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor,
        )

        # Cycle should complete without raising
        result = await service.run_single_cycle()

        # Should have attempted execution but failed
        assert result["executed"] == 0

        # Error count should be incremented
        stats = service.get_stats()
        assert stats.errors == 1
