"""
Tests for WordPress Evolution Bridge Service.

Tests the main service that coordinates evolution cycles, action execution,
and optional memory synchronization.
"""

import asyncio
import pytest
from unittest.mock import AsyncMock, MagicMock, patch
from dataclasses import asdict

from systems.evolution_daemon.wordpress.bridge_service import (
    BridgeServiceConfig,
    WPEvolutionBridgeService,
    ServiceStats,
)


class TestBridgeServiceConfig:
    """Tests for BridgeServiceConfig dataclass."""

    def test_default_config_values(self):
        """Test that default config uses safe values."""
        config = BridgeServiceConfig()

        assert config.wp_url == "http://localhost:8080"
        assert config.ws_uri == "ws://localhost:8768"
        assert config.cycle_interval == 60
        assert config.auto_execute is False  # Safety default
        assert config.min_confidence == 0.5

    def test_custom_config_values(self):
        """Test that custom config values are accepted."""
        config = BridgeServiceConfig(
            wp_url="https://example.com",
            ws_uri="ws://localhost:9000",
            cycle_interval=30,
            auto_execute=True,
            min_confidence=0.8
        )

        assert config.wp_url == "https://example.com"
        assert config.ws_uri == "ws://localhost:9000"
        assert config.cycle_interval == 30
        assert config.auto_execute is True
        assert config.min_confidence == 0.8


class TestWPEvolutionBridgeService:
    """Tests for WPEvolutionBridgeService class."""

    @pytest.fixture
    def config(self):
        """Create a test config."""
        return BridgeServiceConfig(
            wp_url="http://test.local",
            ws_uri="ws://localhost:8768",
            cycle_interval=5,
            auto_execute=False,
            min_confidence=0.5
        )

    @pytest.fixture
    def mock_agent(self):
        """Create a mock EvolutionAgent."""
        agent = MagicMock()
        agent.run_cycle = AsyncMock()
        agent.get_cycle_count.return_value = 1
        return agent

    @pytest.fixture
    def mock_executor(self):
        """Create a mock ActionExecutor."""
        executor = MagicMock()
        executor.connect = AsyncMock(return_value=True)
        executor.disconnect = AsyncMock()
        executor.execute_proposal = AsyncMock()
        return executor

    def test_service_initialization(self, config):
        """Test service initializes all components."""
        service = WPEvolutionBridgeService(config)

        assert service.config == config
        assert service._running is False
        assert service._agent is not None
        assert service._executor is not None

    def test_service_initialization_with_custom_components(self, config, mock_agent, mock_executor):
        """Test service accepts custom components."""
        service = WPEvolutionBridgeService(
            config,
            agent=mock_agent,
            executor=mock_executor
        )

        assert service._agent == mock_agent
        assert service._executor == mock_executor

    @pytest.mark.asyncio
    async def test_run_single_cycle_without_auto_execute(self, config, mock_agent):
        """Test running a single cycle without auto-execute."""
        # Setup mock to return proposals
        from systems.evolution_daemon.wordpress.content_analyzer import ImprovementProposal
        mock_proposal = ImprovementProposal(
            post_id=1,
            improvement_type="expand",
            suggested_content="Test content",
            confidence=0.7,
            reason="Test reason"
        )
        from systems.evolution_daemon.wordpress.evolution_agent import EvolutionCycleResult
        mock_agent.run_cycle.return_value = EvolutionCycleResult(
            cycle_number=1,
            posts_analyzed=5,
            proposals_generated=1,
            proposals=[mock_proposal]
        )

        service = WPEvolutionBridgeService(config, agent=mock_agent)
        result = await service.run_single_cycle()

        assert result["cycle_number"] == 1
        assert result["posts_analyzed"] == 5
        assert result["proposals_generated"] == 1
        assert result["executed"] == 0  # auto_execute is False

    @pytest.mark.asyncio
    async def test_get_stats(self, config, mock_agent):
        """Test getting service statistics."""
        mock_agent.get_cycle_count.return_value = 5

        service = WPEvolutionBridgeService(config, agent=mock_agent)
        service._cycles_completed = 5
        service._proposals_executed = 3

        stats = service.get_stats()

        assert stats.cycles_completed == 5
        assert stats.proposals_executed == 3
        assert stats.running is False


class TestServiceStats:
    """Tests for ServiceStats dataclass."""

    def test_stats_defaults(self):
        """Test default stats values."""
        stats = ServiceStats()

        assert stats.cycles_completed == 0
        assert stats.proposals_generated == 0
        assert stats.proposals_executed == 0
        assert stats.errors == 0
        assert stats.running is False
        assert stats.uptime_seconds == 0.0
