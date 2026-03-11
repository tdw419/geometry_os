"""
SimulationArena for training tectonic agents.

Task 2.1 of Tectonic Realignment Plan.

Provides a simulated environment for agents to compete for tiles
using different strategies, enabling learning and strategy evaluation.
"""

import asyncio
import logging
import random
import time
from dataclasses import dataclass, field
from typing import Any

from systems.tectonic.claim import TectonicBid, TectonicClaim
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.strategy import StrategyProfile, StrategyType

logger = logging.getLogger("tectonic.arena")


@dataclass
class AgentConfig:
    """
    Configuration for a simulated agent.

    Attributes:
        agent_id: Unique identifier for the agent
        budget: Initial budget for bidding
        strategy_type: Type of strategy profile to use
    """

    agent_id: str
    budget: float = 100.0
    strategy_type: StrategyType = StrategyType.RANDOM


@dataclass
class SimulationResult:
    """
    Result of a single simulation round.

    Attributes:
        round_id: Sequential round identifier
        winner: Agent ID of the winner
        tile: The tile that was contested
        winning_bid: The winning bid amount
        participants: List of participating agent IDs
        forces: Force values by agent ID
        timestamp: When the round completed
    """

    round_id: int
    winner: str
    tile: tuple[int, int]
    winning_bid: float
    participants: list[str]
    forces: dict[str, float]
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        """Serialize result to dictionary."""
        return {
            "round_id": self.round_id,
            "winner": self.winner,
            "tile": list(self.tile),
            "winning_bid": self.winning_bid,
            "participants": self.participants,
            "forces": self.forces,
            "timestamp": self.timestamp,
        }


class SimulatedAgent:
    """
    A simulated agent that uses a StrategyProfile for bidding decisions.

    Tracks wins, losses, and budget consumption over multiple rounds.
    """

    def __init__(self, config: AgentConfig):
        """
        Initialize a simulated agent.

        Args:
            config: Agent configuration including ID, budget, and strategy
        """
        self.agent_id = config.agent_id
        self.budget = config.budget
        self.initial_budget = config.budget
        self.strategy = StrategyProfile.get_preset(config.strategy_type)

        # Statistics tracking
        self.wins = 0
        self.losses = 0
        self.budget_consumed = 0.0

    def calculate_bid(self, tile: tuple[int, int], purpose: str) -> float:
        """
        Calculate the bid amount for a tile.

        Args:
            tile: The (x, y) coordinates of the tile
            purpose: The purpose of the claim

        Returns:
            The calculated bid amount
        """
        if self.budget <= 0:
            return 0.0

        bid = self.strategy.calculate_optimal_bid(tile, purpose, self.budget)
        # Add some randomness for non-deterministic behavior
        noise = random.uniform(-0.1, 0.1) * bid
        bid = max(0.1, bid + noise)
        return min(bid, self.budget)

    def should_counter(self, original_bid: float) -> bool:
        """
        Determine whether to submit a counter-bid.

        Args:
            original_bid: The bid amount to counter

        Returns:
            True if should counter-bid, False otherwise
        """
        return self.strategy.should_counter_bid(original_bid, self.budget)

    def calculate_counter(self, original_bid: float) -> float:
        """
        Calculate the counter-bid amount.

        Args:
            original_bid: The bid amount to counter

        Returns:
            The counter-bid amount
        """
        counter = self.strategy.calculate_counter_bid(original_bid)
        # Ensure we don't exceed budget
        return min(counter, self.budget)

    def consume_budget(self, amount: float) -> None:
        """
        Deduct budget after winning a round.

        Args:
            amount: The amount to deduct
        """
        self.budget -= amount
        self.budget_consumed += amount

    def record_win(self) -> None:
        """Record a win."""
        self.wins += 1

    def record_loss(self) -> None:
        """Record a loss."""
        self.losses += 1

    def reset_budget(self, budget: float | None = None) -> None:
        """
        Reset the agent's budget.

        Args:
            budget: Optional new budget amount (defaults to initial)
        """
        self.budget = budget if budget is not None else self.initial_budget

    def get_statistics(self) -> dict[str, Any]:
        """Get agent statistics."""
        return {
            "agent_id": self.agent_id,
            "current_budget": self.budget,
            "initial_budget": self.initial_budget,
            "budget_consumed": self.budget_consumed,
            "wins": self.wins,
            "losses": self.losses,
            "win_rate": self.wins / (self.wins + self.losses)
            if (self.wins + self.losses) > 0
            else 0.0,
        }


class SimulationArena:
    """
    Arena for running simulated tectonic negotiations.

    Manages multiple agents competing for tiles using various strategies,
    tracking results and statistics over multiple rounds.
    """

    def __init__(self, agent_configs: list[AgentConfig] | None = None):
        """
        Initialize the simulation arena.

        Args:
            agent_configs: Optional list of agent configurations to add
        """
        self.agent_configs: list[AgentConfig] = []
        self.rounds_completed = 0
        self.results: list[SimulationResult] = []
        self.win_counts: dict[str, int] = {}

        if agent_configs:
            for config in agent_configs:
                self.add_agent(config)

    def add_agent(self, config: AgentConfig) -> None:
        """
        Add an agent configuration to the arena.

        Args:
            config: The agent configuration to add
        """
        self.agent_configs.append(config)
        self.win_counts[config.agent_id] = 0

    def _create_agents(self) -> dict[str, SimulatedAgent]:
        """
        Create fresh SimulatedAgent instances from configurations.

        Returns:
            Dictionary mapping agent_id to SimulatedAgent
        """
        return {config.agent_id: SimulatedAgent(config) for config in self.agent_configs}

    def run_round(
        self,
        tile: tuple[int, int] | None = None,
        purpose: str = "training"
    ) -> SimulationResult:
        """
        Run a single simulation round.

        Creates fresh negotiator and agents, runs a 3-phase auction,
        and records the result.

        Args:
            tile: Optional specific tile to contest (random if None)
            purpose: Purpose string for the claim

        Returns:
            SimulationResult with round details
        """
        if len(self.agent_configs) < 2:
            raise ValueError("Need at least 2 agents to run a round")

        # Create fresh instances for this round
        negotiator = TectonicNegotiator()
        agents = self._create_agents()
        agent_list = list(agents.values())

        # Select tile
        if tile is None:
            tile = (random.randint(-10, 10), random.randint(-10, 10))

        # First agent makes claim
        claimant = agent_list[0]
        bid_amount = claimant.calculate_bid(tile, purpose)
        claim = TectonicClaim(
            tile=tile,
            purpose=purpose,
            bid=bid_amount,
            agent_id=claimant.agent_id,
        )
        claim_id = negotiator.submit_claim(claim)

        # Other agents may counter-bid
        for agent in agent_list[1:]:
            if agent.should_counter(bid_amount):
                counter_amount = agent.calculate_counter(bid_amount)
                if counter_amount > 0 and counter_amount <= agent.budget:
                    counter_bid = TectonicBid(
                        claim_id=claim_id,
                        amount=counter_amount,
                        agent_id=agent.agent_id,
                    )
                    negotiator.submit_bid(counter_bid)

        # Settle the claim
        settlement = negotiator.settle(claim_id)

        # Update agent statistics
        winner_id = settlement.winner
        for agent in agent_list:
            if agent.agent_id == winner_id:
                # Find the winning bid amount
                if winner_id == claimant.agent_id:
                    winning_bid = claim.bid
                else:
                    # Find the winning counter-bid
                    bids = negotiator.get_bids_for_claim(claim_id)
                    winning_bid = next(
                        (b.amount for b in bids if b.agent_id == winner_id),
                        claim.bid,
                    )
                agent.consume_budget(winning_bid)
                agent.record_win()
            else:
                agent.record_loss()

        # Calculate forces for result
        forces: dict[str, float] = {}
        f_claim, f_counter, f_anchor = negotiator._calculate_force(claim)
        forces[claimant.agent_id] = f_claim

        for bid in negotiator.get_bids_for_claim(claim_id):
            forces[bid.agent_id] = bid.amount * negotiator.competing_weight

        # Create result
        self.rounds_completed += 1
        result = SimulationResult(
            round_id=self.rounds_completed,
            winner=winner_id,
            tile=tile,
            winning_bid=settlement.force,
            participants=[a.agent_id for a in agent_list],
            forces=forces,
        )

        # Track win counts
        self.win_counts[winner_id] = self.win_counts.get(winner_id, 0) + 1

        # Store result
        self.results.append(result)

        logger.info(
            f"Round {result.round_id}: winner={winner_id}, "
            f"tile={tile}, winning_bid={result.winning_bid:.2f}"
        )

        return result

    def run_rounds(
        self,
        count: int,
        tiles: list[tuple[int, int]] | None = None
    ) -> list[SimulationResult]:
        """
        Run multiple simulation rounds.

        Args:
            count: Number of rounds to run
            tiles: Optional list of specific tiles (random if None or exhausted)

        Returns:
            List of SimulationResult objects
        """
        results = []
        for i in range(count):
            tile = tiles[i] if tiles and i < len(tiles) else None
            result = self.run_round(tile=tile)
            results.append(result)
        return results

    async def run_rounds_async(
        self,
        count: int,
        batch_size: int = 10
    ) -> list[SimulationResult]:
        """
        Run multiple rounds asynchronously in batches.

        Args:
            count: Total number of rounds to run
            batch_size: Number of rounds per batch

        Returns:
            List of SimulationResult objects
        """
        results = []

        async def run_batch(batch_count: int) -> list[SimulationResult]:
            """Run a batch of rounds."""
            batch_results = []
            for _ in range(batch_count):
                result = self.run_round()
                batch_results.append(result)
                # Yield control to event loop
                await asyncio.sleep(0)
            return batch_results

        full_batches = count // batch_size
        remainder = count % batch_size

        # Run full batches concurrently
        tasks = [run_batch(batch_size) for _ in range(full_batches)]
        batch_results = await asyncio.gather(*tasks)
        for batch in batch_results:
            results.extend(batch)

        # Run remainder
        if remainder > 0:
            remainder_results = await run_batch(remainder)
            results.extend(remainder_results)

        return results

    def get_statistics(self) -> dict[str, Any]:
        """
        Get arena statistics.

        Returns:
            Dictionary with win_rates, rounds_completed, and agent stats
        """
        total_rounds = self.rounds_completed

        # Calculate win rates
        win_rates: dict[str, float] = {}
        for agent_id, wins in self.win_counts.items():
            win_rates[agent_id] = wins / total_rounds if total_rounds > 0 else 0.0

        return {
            "rounds_completed": total_rounds,
            "win_rates": win_rates,
            "win_counts": dict(self.win_counts),
            "total_results": len(self.results),
        }

    def export_results(self) -> dict[str, Any]:
        """
        Export all results and statistics.

        Returns:
            Dictionary with rounds list and statistics
        """
        return {
            "rounds": [r.to_dict() for r in self.results],
            "statistics": self.get_statistics(),
        }

    def reset(self) -> None:
        """Reset the arena state."""
        self.rounds_completed = 0
        self.results = []
        self.win_counts = {config.agent_id: 0 for config in self.agent_configs}

    def get_results_by_winner(self, agent_id: str) -> list[SimulationResult]:
        """
        Get all results won by a specific agent.

        Args:
            agent_id: The agent ID to filter by

        Returns:
            List of results where the agent won
        """
        return [r for r in self.results if r.winner == agent_id]

    def get_results_by_tile(self, tile: tuple[int, int]) -> list[SimulationResult]:
        """
        Get all results for a specific tile.

        Args:
            tile: The tile coordinates to filter by

        Returns:
            List of results for that tile
        """
        return [r for r in self.results if r.tile == tile]
