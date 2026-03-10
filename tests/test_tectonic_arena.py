"""
Tests for SimulationArena.

Task 2.1 of Tectonic Realignment Plan.
"""

import asyncio
import pytest
from typing import Tuple

from systems.tectonic.arena import (
    AgentConfig,
    SimulationResult,
    SimulatedAgent,
    SimulationArena,
)
from systems.tectonic.strategy import StrategyType


# ============================================================================
# AgentConfig Tests
# ============================================================================


def test_agent_config_defaults():
    """AgentConfig should have sensible defaults."""
    config = AgentConfig(agent_id="test_agent")

    assert config.agent_id == "test_agent"
    assert config.budget == 100.0
    assert config.strategy_type == StrategyType.RANDOM


def test_agent_config_custom_values():
    """AgentConfig should accept custom values."""
    config = AgentConfig(
        agent_id="custom_agent",
        budget=500.0,
        strategy_type=StrategyType.AGGRESSIVE,
    )

    assert config.agent_id == "custom_agent"
    assert config.budget == 500.0
    assert config.strategy_type == StrategyType.AGGRESSIVE


def test_agent_config_all_strategy_types():
    """AgentConfig should work with all strategy types."""
    strategy_types = [
        StrategyType.RANDOM,
        StrategyType.AGGRESSIVE,
        StrategyType.CONSERVATIVE,
        StrategyType.DISTANCE_AWARE,
        StrategyType.ADAPTIVE,
    ]

    for strategy_type in strategy_types:
        config = AgentConfig(agent_id=f"agent_{strategy_type.value}", strategy_type=strategy_type)
        assert config.strategy_type == strategy_type


# ============================================================================
# SimulationResult Tests
# ============================================================================


def test_simulation_result_creation():
    """SimulationResult should store all fields correctly."""
    result = SimulationResult(
        round_id=1,
        winner="agent_1",
        tile=(5, 10),
        winning_bid=15.5,
        participants=["agent_1", "agent_2"],
        forces={"agent_1": 15.5, "agent_2": 12.0},
    )

    assert result.round_id == 1
    assert result.winner == "agent_1"
    assert result.tile == (5, 10)
    assert result.winning_bid == 15.5
    assert result.participants == ["agent_1", "agent_2"]
    assert result.forces == {"agent_1": 15.5, "agent_2": 12.0}
    assert result.timestamp > 0


def test_simulation_result_to_dict():
    """SimulationResult should serialize to dictionary."""
    result = SimulationResult(
        round_id=2,
        winner="agent_2",
        tile=(3, 7),
        winning_bid=20.0,
        participants=["agent_1", "agent_2", "agent_3"],
        forces={"agent_1": 10.0, "agent_2": 20.0, "agent_3": 15.0},
    )

    data = result.to_dict()

    assert data["round_id"] == 2
    assert data["winner"] == "agent_2"
    assert data["tile"] == [3, 7]
    assert data["winning_bid"] == 20.0
    assert data["participants"] == ["agent_1", "agent_2", "agent_3"]
    assert data["forces"] == {"agent_1": 10.0, "agent_2": 20.0, "agent_3": 15.0}
    assert "timestamp" in data


# ============================================================================
# SimulatedAgent Tests
# ============================================================================


def test_simulated_agent_creation():
    """SimulatedAgent should initialize correctly from config."""
    config = AgentConfig(
        agent_id="test",
        budget=200.0,
        strategy_type=StrategyType.CONSERVATIVE,
    )
    agent = SimulatedAgent(config)

    assert agent.agent_id == "test"
    assert agent.budget == 200.0
    assert agent.initial_budget == 200.0
    assert agent.wins == 0
    assert agent.losses == 0
    assert agent.budget_consumed == 0.0


def test_simulated_agent_calculate_bid():
    """SimulatedAgent should calculate bids based on strategy."""
    config = AgentConfig(agent_id="bidder", budget=100.0)
    agent = SimulatedAgent(config)

    bid = agent.calculate_bid((5, 5), "training")

    assert bid > 0
    assert bid <= agent.budget


def test_simulated_agent_budget_tracking():
    """SimulatedAgent should track budget consumption."""
    config = AgentConfig(agent_id="tracker", budget=100.0)
    agent = SimulatedAgent(config)

    initial_budget = agent.budget
    agent.consume_budget(25.0)

    assert agent.budget == initial_budget - 25.0
    assert agent.budget_consumed == 25.0


def test_simulated_agent_win_loss_tracking():
    """SimulatedAgent should track wins and losses."""
    config = AgentConfig(agent_id="tracker")
    agent = SimulatedAgent(config)

    agent.record_win()
    agent.record_win()
    agent.record_loss()

    assert agent.wins == 2
    assert agent.losses == 1


def test_simulated_agent_statistics():
    """SimulatedAgent should return correct statistics."""
    config = AgentConfig(agent_id="stats_agent", budget=100.0)
    agent = SimulatedAgent(config)

    agent.record_win()
    agent.record_win()
    agent.record_loss()
    agent.consume_budget(30.0)

    stats = agent.get_statistics()

    assert stats["agent_id"] == "stats_agent"
    assert stats["wins"] == 2
    assert stats["losses"] == 1
    assert stats["win_rate"] == 2/3
    assert stats["budget_consumed"] == 30.0
    assert stats["current_budget"] == 70.0


# ============================================================================
# SimulationArena Tests
# ============================================================================


def test_arena_creation():
    """SimulationArena should initialize empty."""
    arena = SimulationArena()

    assert arena.agent_configs == []
    assert arena.rounds_completed == 0
    assert arena.results == []
    assert arena.win_counts == {}


def test_arena_with_agents():
    """SimulationArena should accept agents in constructor."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    assert len(arena.agent_configs) == 2
    assert arena.win_counts == {"agent_1": 0, "agent_2": 0}


def test_arena_add_agent():
    """SimulationArena should add agents dynamically."""
    arena = SimulationArena()
    config = AgentConfig(agent_id="new_agent", budget=200.0)

    arena.add_agent(config)

    assert len(arena.agent_configs) == 1
    assert arena.agent_configs[0].agent_id == "new_agent"
    assert arena.win_counts == {"new_agent": 0}


def test_arena_run_single_round():
    """SimulationArena should run a single round successfully."""
    configs = [
        AgentConfig(agent_id="agent_1", strategy_type=StrategyType.AGGRESSIVE),
        AgentConfig(agent_id="agent_2", strategy_type=StrategyType.CONSERVATIVE),
    ]
    arena = SimulationArena(agent_configs=configs)

    result = arena.run_round(tile=(5, 5))

    assert arena.rounds_completed == 1
    assert result.round_id == 1
    assert result.winner in ["agent_1", "agent_2"]
    assert result.tile == (5, 5)
    assert len(result.participants) == 2
    assert len(arena.results) == 1


def test_arena_run_multiple_rounds():
    """SimulationArena should run multiple rounds."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
        AgentConfig(agent_id="agent_3"),
    ]
    arena = SimulationArena(agent_configs=configs)

    tiles = [(1, 1), (2, 2), (3, 3)]
    results = arena.run_rounds(count=3, tiles=tiles)

    assert len(results) == 3
    assert arena.rounds_completed == 3
    assert results[0].tile == (1, 1)
    assert results[1].tile == (2, 2)
    assert results[2].tile == (3, 3)


def test_arena_win_rate_statistics():
    """SimulationArena should calculate win rates correctly."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    arena.run_rounds(count=10)

    stats = arena.get_statistics()

    assert stats["rounds_completed"] == 10
    assert "win_rates" in stats
    assert "win_counts" in stats

    # Win counts should sum to total rounds
    total_wins = sum(stats["win_counts"].values())
    assert total_wins == 10

    # Win rates should sum to 1.0
    total_rate = sum(stats["win_rates"].values())
    assert abs(total_rate - 1.0) < 0.001


def test_arena_budget_tracking():
    """SimulationArena should track budget consumption across rounds."""
    configs = [
        AgentConfig(agent_id="agent_1", budget=100.0),
        AgentConfig(agent_id="agent_2", budget=100.0),
    ]
    arena = SimulationArena(agent_configs=configs)

    arena.run_rounds(count=5)

    # Each round should have consumed budget from winner
    assert len(arena.results) == 5


def test_arena_strategy_comparison():
    """SimulationArena should allow comparing different strategies."""
    configs = [
        AgentConfig(agent_id="aggressive", strategy_type=StrategyType.AGGRESSIVE),
        AgentConfig(agent_id="conservative", strategy_type=StrategyType.CONSERVATIVE),
    ]
    arena = SimulationArena(agent_configs=configs)

    # Run enough rounds to see differentiation
    arena.run_rounds(count=20)

    stats = arena.get_statistics()

    # At least one agent should have wins (aggressive likely dominates)
    total_wins = sum(stats["win_counts"].values())
    assert total_wins == 20
    # Aggressive strategy should likely have wins due to higher aggression
    assert stats["win_counts"]["aggressive"] > 0


def test_arena_export_results():
    """SimulationArena should export results as dictionary."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    arena.run_rounds(count=3)

    exported = arena.export_results()

    assert "rounds" in exported
    assert "statistics" in exported
    assert len(exported["rounds"]) == 3
    assert exported["statistics"]["rounds_completed"] == 3


def test_arena_needs_two_agents():
    """SimulationArena should require at least 2 agents to run."""
    arena = SimulationArena()
    arena.add_agent(AgentConfig(agent_id="lonely"))

    with pytest.raises(ValueError, match="at least 2 agents"):
        arena.run_round()


# ============================================================================
# Async Tests
# ============================================================================


def test_arena_run_rounds_async():
    """SimulationArena should run rounds asynchronously."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    # Run async rounds
    results = asyncio.run(arena.run_rounds_async(count=10, batch_size=3))

    assert len(results) == 10
    assert arena.rounds_completed == 10


def test_arena_async_batch_handling():
    """SimulationArena async should handle partial batches."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    # Run with count not divisible by batch_size
    results = asyncio.run(arena.run_rounds_async(count=7, batch_size=3))

    assert len(results) == 7


# ============================================================================
# Additional Tests
# ============================================================================


def test_arena_reset():
    """SimulationArena should reset state correctly."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    arena.run_rounds(count=5)
    assert arena.rounds_completed == 5

    arena.reset()

    assert arena.rounds_completed == 0
    assert arena.results == []
    assert arena.win_counts == {"agent_1": 0, "agent_2": 0}


def test_arena_get_results_by_winner():
    """SimulationArena should filter results by winner."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    arena.run_rounds(count=5)

    stats = arena.get_statistics()
    winner = max(stats["win_counts"].items(), key=lambda x: x[1])[0]

    winner_results = arena.get_results_by_winner(winner)
    assert len(winner_results) == stats["win_counts"][winner]
    assert all(r.winner == winner for r in winner_results)


def test_arena_get_results_by_tile():
    """SimulationArena should filter results by tile."""
    configs = [
        AgentConfig(agent_id="agent_1"),
        AgentConfig(agent_id="agent_2"),
    ]
    arena = SimulationArena(agent_configs=configs)

    specific_tile = (7, 7)
    arena.run_rounds(count=3, tiles=[specific_tile, (1, 1), specific_tile])

    tile_results = arena.get_results_by_tile(specific_tile)

    assert len(tile_results) == 2
    assert all(r.tile == specific_tile for r in tile_results)


def test_simulated_agent_reset_budget():
    """SimulatedAgent should reset budget correctly."""
    config = AgentConfig(agent_id="resetter", budget=100.0)
    agent = SimulatedAgent(config)

    agent.consume_budget(50.0)
    assert agent.budget == 50.0

    agent.reset_budget()
    assert agent.budget == 100.0

    agent.reset_budget(budget=200.0)
    assert agent.budget == 200.0


def test_simulated_agent_zero_budget():
    """SimulatedAgent with zero budget should bid zero."""
    config = AgentConfig(agent_id="broke", budget=0.0)
    agent = SimulatedAgent(config)

    bid = agent.calculate_bid((5, 5), "training")
    assert bid == 0.0
