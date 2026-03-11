"""
End-to-End Tests for WordPress Evolution GUI Integration.

Tests the full flow from content analysis to proposal generation to (mock) execution.
Verifies that all components work together correctly.
"""

import asyncio
from unittest.mock import AsyncMock, MagicMock

import pytest

# Use the unified imports from __init__.py
from systems.evolution_daemon.wordpress import (
    BridgeServiceConfig,
    EvolutionCycleResult,
    ExecutionResult,
    ImprovementProposal,
    PlaywrightActionExecutor,
    WordPressContentAnalyzer,
    WordPressEvolutionAgent,
    WPEvolutionBridgeService,
)
from systems.evolution_daemon.wordpress.bridge_service import create_cli_parser


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

    @pytest.mark.asyncio
    async def test_service_start_success(self, config):
        """Test that service starts successfully with connected executor."""
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(cycle_number=1)
        )

        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        service = WPEvolutionBridgeService(config, agent=mock_agent, executor=mock_executor)

        result = await service.start()

        assert result is True
        assert service._running is True
        mock_executor.connect.assert_called_once()

        # Clean up
        await service.stop()

    @pytest.mark.asyncio
    async def test_service_start_fails_without_executor(self, config):
        """Test that service start fails if executor can't connect."""
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=False)

        service = WPEvolutionBridgeService(config, agent=mock_agent, executor=mock_executor)

        result = await service.start()

        assert result is False
        assert service._running is False

    @pytest.mark.asyncio
    async def test_service_stop(self, config):
        """Test that service stops cleanly."""
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(cycle_number=1)
        )

        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        service = WPEvolutionBridgeService(config, agent=mock_agent, executor=mock_executor)
        await service.start()
        await service.stop()

        assert service._running is False
        mock_executor.disconnect.assert_called_once()

    @pytest.mark.asyncio
    async def test_get_stats_tracking(self, config):
        """Test that get_stats returns accurate statistics."""
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(
                cycle_number=1,
                posts_analyzed=5,
                proposals_generated=3,
                proposals=[
                    ImprovementProposal(
                        post_id=1,
                        improvement_type="expand",
                        confidence=0.8,
                    )
                ],
            )
        )

        mock_executor = MagicMock(spec=PlaywrightActionExecutor)
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()
        mock_executor.execute_proposal = AsyncMock(
            return_value=ExecutionResult(success=True, action="update", post_id=1)
        )

        config.auto_execute = True
        service = WPEvolutionBridgeService(config, agent=mock_agent, executor=mock_executor)

        # Run a cycle
        await service.run_single_cycle()

        stats = service.get_stats()
        assert stats.cycles_completed == 1
        assert stats.proposals_generated == 3
        assert stats.proposals_executed == 1
        assert stats.running is False

    @pytest.mark.asyncio
    async def test_multiple_cycles_accumulate_stats(self, config):
        """Test that running multiple cycles accumulates statistics."""
        mock_agent = MagicMock(spec=WordPressEvolutionAgent)
        call_count = 0

        async def mock_cycle():
            nonlocal call_count
            call_count += 1
            return EvolutionCycleResult(
                cycle_number=call_count,
                posts_analyzed=2,
                proposals_generated=1,
                proposals=[],
            )

        mock_agent.run_cycle = AsyncMock(side_effect=mock_cycle)
        service = WPEvolutionBridgeService(config, agent=mock_agent)

        # Run 3 cycles
        for _ in range(3):
            await service.run_single_cycle()

        stats = service.get_stats()
        assert stats.cycles_completed == 3
        assert stats.proposals_generated == 3


class TestCLI:
    """Tests for CLI argument parser."""

    def test_create_cli_parser(self):
        """Test that CLI parser is created with expected arguments."""
        parser = create_cli_parser()

        # Test default values
        args = parser.parse_args([])
        assert args.wp_url == "http://localhost:8080"
        assert args.ws_uri == "ws://localhost:8768"
        assert args.interval == 60
        assert args.auto_execute is False
        assert args.min_confidence == 0.5
        assert args.single_cycle is False
        assert args.verbose is False

    def test_cli_parser_custom_args(self):
        """Test CLI parser with custom arguments."""
        parser = create_cli_parser()
        args = parser.parse_args([
            "--wp-url", "https://example.com",
            "--ws-uri", "wss://ws.example.com",
            "--interval", "30",
            "--auto-execute",
            "--min-confidence", "0.8",
            "--single-cycle",
            "--verbose",
        ])

        assert args.wp_url == "https://example.com"
        assert args.ws_uri == "wss://ws.example.com"
        assert args.interval == 30
        assert args.auto_execute is True
        assert args.min_confidence == 0.8
        assert args.single_cycle is True
        assert args.verbose is True


class TestWordPressContentAnalyzer:
    """Tests for WordPressContentAnalyzer."""

    def test_analyze_short_content(self):
        """Test analyzing content that's too short."""
        analyzer = WordPressContentAnalyzer()
        post = {"id": 1, "title": "Test", "content": "Short."}

        analysis = analyzer.analyze(post)

        assert analysis.post_id == 1
        assert analysis.word_count < 50
        assert len(analysis.issues) > 0
        assert any("short" in issue.lower() for issue in analysis.issues)

    def test_analyze_long_content(self):
        """Test analyzing content that's long enough."""
        analyzer = WordPressContentAnalyzer()
        content = " ".join(["word"] * 100)  # 100 words
        post = {"id": 2, "title": "Long Title Here", "content": content}

        analysis = analyzer.analyze(post)

        assert analysis.post_id == 2
        assert analysis.word_count == 100
        # Should have fewer issues than short content

    def test_analyze_short_title(self):
        """Test detecting short title."""
        analyzer = WordPressContentAnalyzer()
        post = {"id": 3, "title": "X", "content": " ".join(["word"] * 60)}

        analysis = analyzer.analyze(post)

        assert any("title" in issue.lower() for issue in analysis.issues)

    def test_propose_improvement_returns_none_for_good_content(self):
        """Test that no proposal is made for good content."""
        analyzer = WordPressContentAnalyzer()
        post = {
            "id": 4,
            "title": "This is a Properly Sized Title",
            "content": " ".join(["content"] * 100),
        }

        proposal = analyzer.propose_improvement(post)

        # Good content should not generate a proposal
        assert proposal is None

    def test_propose_improvement_for_short_content(self):
        """Test that proposal is made for short content."""
        analyzer = WordPressContentAnalyzer()
        post = {"id": 5, "title": "Test Title", "content": "Short content."}

        proposal = analyzer.propose_improvement(post)

        assert proposal is not None
        assert proposal.post_id == 5
        assert proposal.improvement_type == "expand"
        assert len(proposal.suggested_content) > len(post["content"])


class TestPlaywrightActionExecutor:
    """Tests for PlaywrightActionExecutor stub class."""

    @pytest.mark.asyncio
    async def test_default_connect_returns_false(self):
        """Test that default connect returns False."""
        from systems.evolution_daemon.wordpress.bridge_service import PlaywrightActionExecutor

        executor = PlaywrightActionExecutor(ws_uri="ws://test:1234")
        result = await executor.connect()
        assert result is False

    @pytest.mark.asyncio
    async def test_disconnect_does_not_raise(self):
        """Test that disconnect completes without error."""
        from systems.evolution_daemon.wordpress.bridge_service import PlaywrightActionExecutor

        executor = PlaywrightActionExecutor()
        await executor.disconnect()  # Should not raise

    @pytest.mark.asyncio
    async def test_execute_proposal_returns_failure(self):
        """Test that execute_proposal returns failure when not connected."""
        from systems.evolution_daemon.wordpress.bridge_service import (
            ImprovementProposal,
            PlaywrightActionExecutor,
        )

        executor = PlaywrightActionExecutor()
        proposal = ImprovementProposal(post_id=1, suggested_content="test")
        result = await executor.execute_proposal(proposal)

        assert result.success is False
        assert "not connected" in result.message.lower()


class TestWordPressEvolutionAgent:
    """Tests for WordPressEvolutionAgent stub class."""

    @pytest.mark.asyncio
    async def test_run_cycle_returns_result(self):
        """Test that run_cycle returns a result."""
        from systems.evolution_daemon.wordpress.bridge_service import WordPressEvolutionAgent

        agent = WordPressEvolutionAgent(wp_url="http://test.local")
        result = await agent.run_cycle()

        assert result is not None
        assert result.cycle_number > 0


class TestBridgeServiceStartStop:
    """Tests for service start/stop edge cases."""

    @pytest.fixture
    def config(self):
        """Create a test config."""
        return BridgeServiceConfig(
            wp_url="http://test.local",
            ws_uri="ws://localhost:8768",
            cycle_interval=5,
            auto_execute=False,
        )

    @pytest.mark.asyncio
    async def test_start_when_already_running(self, config):
        """Test that start returns False when already running."""
        mock_agent = MagicMock()
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(cycle_number=1)
        )

        mock_executor = MagicMock()
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor
        )

        # First start should succeed
        result1 = await service.start()
        assert result1 is True

        # Second start should return False
        result2 = await service.start()
        assert result2 is False

        # Clean up
        await service.stop()

    @pytest.mark.asyncio
    async def test_stop_when_not_running(self, config):
        """Test that stop when not running doesn't raise."""
        mock_agent = MagicMock()
        mock_executor = MagicMock()

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor
        )

        # Should not raise
        await service.stop()

    @pytest.mark.asyncio
    async def test_get_stats_with_uptime(self, config):
        """Test that get_stats includes uptime after start."""
        mock_agent = MagicMock()
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(cycle_number=1)
        )

        mock_executor = MagicMock()
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor
        )

        # Before start, uptime should be 0
        stats = service.get_stats()
        assert stats.uptime_seconds == 0.0

        # After start
        await service.start()
        await asyncio.sleep(0.1)  # Small delay

        stats = service.get_stats()
        assert stats.uptime_seconds > 0
        assert stats.running is True

        # Clean up
        await service.stop()


class TestMemorySyncErrorHandling:
    """Tests for memory sync error handling."""

    @pytest.fixture
    def config(self):
        """Create a test config."""
        return BridgeServiceConfig(
            wp_url="http://test.local",
            ws_uri="ws://localhost:8768",
            cycle_interval=5,
            auto_execute=False,
        )

    @pytest.mark.asyncio
    async def test_memory_sync_error_increments_error_count(self, config):
        """Test that memory sync errors increment the error count."""
        mock_agent = MagicMock()
        mock_agent.run_cycle = AsyncMock(
            return_value=EvolutionCycleResult(cycle_number=1)
        )

        mock_executor = MagicMock()
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        # Create a memory provider that raises an error
        mock_memory_provider = MagicMock()
        mock_memory_provider.sync_posts = MagicMock(side_effect=RuntimeError("Sync failed"))

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor,
            memory_provider=mock_memory_provider
        )

        await service.run_single_cycle()

        # Error count should be incremented
        stats = service.get_stats()
        assert stats.errors >= 1


class TestServiceLoopErrorHandling:
    """Tests for service loop error handling."""

    @pytest.fixture
    def config(self):
        """Create a test config."""
        return BridgeServiceConfig(
            wp_url="http://test.local",
            ws_uri="ws://localhost:8768",
            cycle_interval=0.1,  # Short interval for testing
            auto_execute=False,
        )

    @pytest.mark.asyncio
    async def test_service_loop_handles_cycle_errors(self, config):
        """Test that service loop continues after cycle errors."""
        call_count = 0

        async def failing_cycle():
            nonlocal call_count
            call_count += 1
            if call_count == 1:
                raise RuntimeError("First cycle failed")
            return EvolutionCycleResult(cycle_number=call_count)

        mock_agent = MagicMock()
        mock_agent.run_cycle = AsyncMock(side_effect=failing_cycle)

        mock_executor = MagicMock()
        mock_executor.connect = AsyncMock(return_value=True)
        mock_executor.disconnect = AsyncMock()

        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor
        )

        # Start the service
        result = await service.start()
        assert result is True

        # Wait for a few cycles
        await asyncio.sleep(0.3)

        # Should have completed multiple cycles despite first one failing
        assert call_count >= 2

        # Clean up
        await service.stop()
