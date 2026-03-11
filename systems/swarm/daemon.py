"""
Swarm Agency Daemon - Ralph Wiggum Mode

Autonomous orchestrator for Swarm Agency agents.
Continuously runs tasks from the Territorial Map and intent files.
"""

import argparse
import asyncio
import logging
import time
from pathlib import Path

from systems.swarm.agency_agents import create_agency_agent
from systems.swarm.llm_agent import AgentTask

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - [SWARM] - %(levelname)s - %(message)s'
)
logger = logging.getLogger("swarm_daemon")

class SwarmDaemon:
    def __init__(self, budget=None, intent_file=None):
        self.budget = budget
        self.intent_file = Path(intent_file) if intent_file else None
        self.start_time = time.time()
        self.running = True

        # Initialize key agents
        self.governor = create_agency_agent("mutation_governor", "gov-swarm-daemon")
        self.orchestrator = create_agency_agent("evolution_orchestrator", "orch-swarm-daemon")

    async def run(self):
        logger.info("🚀 Swarm Agency Daemon starting...")
        if self.intent_file:
            logger.info(f"📜 Intent loaded from {self.intent_file}")

        try:
            while self.running:
                # 1. Check budget
                if self.budget:
                    elapsed = time.time() - self.start_time
                    if elapsed >= self.budget:
                        logger.info(f"⏰ Budget of {self.budget}s reached. Graceful termination.")
                        break

                # 2. Simulate task processing
                # In a real run, this would query the TerritorialMap or WordPress discovery
                logger.info("🐝 Swarm agents polling for territory updates...")

                # Example task for the governor
                task = AgentTask(
                    task_id=f"poll_{int(time.time())}",
                    task_type="territory_check",
                    payload={"region": "The Forge"}
                )

                # Small delay to prevent CPU spinning
                await asyncio.sleep(10)

        except asyncio.CancelledError:
            logger.info("🛑 Swarm Daemon task cancelled")
        finally:
            logger.info("🏁 Swarm Daemon shutdown complete")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Swarm Agency Daemon")
    parser.add_argument("--budget", type=int, help="Time budget in seconds")
    parser.add_argument("--intent", type=str, help="Intent file path")
    args = parser.parse_args()

    daemon = SwarmDaemon(budget=args.budget, intent_file=args.intent)
    asyncio.run(daemon.run())
