# systems/visual_shell/web/autonomous_improvement_service.py
"""
Autonomous Improvement Loop Service

Periodically analyzes the codebase, generates recommendations,
and optionally deploys improvements as cartridges.

This is the "closed loop" that enables self-improvement.
"""

import asyncio
import json
import time
from pathlib import Path
from typing import Optional, Dict, Any, List
from dataclasses import dataclass, field
from datetime import datetime
import structlog

# Try imports
try:
    from ai_project_management.src.ai_project_management.improvement.module import (
        ContinuousImprovementModule,
        ImprovementRecommendation
    )
    from ai_project_management.src.ai_project_management.models import ExecutionState
    AI_PM_AVAILABLE = True
except ImportError:
    AI_PM_AVAILABLE = False

try:
    from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler
    CARTRIDGE_AVAILABLE = True
except ImportError:
    CARTRIDGE_AVAILABLE = False


@dataclass
class ImprovementCycleResult:
    """Result of an improvement cycle."""
    timestamp: str
    recommendations_count: int
    deployed: bool
    cartridge_path: Optional[str] = None
    error: Optional[str] = None
    metrics: Dict[str, Any] = field(default_factory=dict)


class AutonomousImprovementService:
    """
    Service that runs autonomous improvement loops.

    Flow:
    1. Analyze codebase via ContinuousImprovementModule
    2. Generate recommendations
    3. (Optional) Create cartridge from high-confidence recommendations
    4. Log results and metrics
    """

    def __init__(
        self,
        interval_seconds: int = 3600,  # 1 hour default
        auto_deploy: bool = False,
        confidence_threshold: float = 0.8,
        telemetry_path: Path = Path(".ai-pm-telemetry"),
        cartridges_path: Path = Path("cartridges"),
        log_level: str = "INFO"
    ):
        """
        Initialize autonomous improvement service.

        Args:
            interval_seconds: Time between improvement cycles
            auto_deploy: Whether to automatically deploy cartridges
            confidence_threshold: Minimum confidence to auto-deploy
            telemetry_path: Path for telemetry data
            cartridges_path: Path to save generated cartridges
            log_level: Logging level
        """
        structlog.configure(
            wrapper_class=structlog.make_filtering_bound_logger(log_level.lower())
        )
        self.logger = structlog.get_logger()

        self.interval_seconds = interval_seconds
        self.auto_deploy = auto_deploy
        self.confidence_threshold = confidence_threshold
        self.telemetry_path = telemetry_path
        self.cartridges_path = cartridges_path

        # Ensure directories exist
        self.cartridges_path.mkdir(parents=True, exist_ok=True)
        self.telemetry_path.mkdir(parents=True, exist_ok=True)

        # Initialize components
        if AI_PM_AVAILABLE:
            self.improvement_module = ContinuousImprovementModule(
                telemetry_path=telemetry_path
            )
        else:
            self.improvement_module = None

        if CARTRIDGE_AVAILABLE:
            self.cartridge_assembler = CartridgeAssembler()
        else:
            self.cartridge_assembler = None

        # State
        self.running = False
        self.last_cycle_result: Optional[ImprovementCycleResult] = None
        self.cycle_history: List[ImprovementCycleResult] = []

    async def run_cycle(self) -> ImprovementCycleResult:
        """
        Run a single improvement cycle.

        Returns:
            Result of the cycle
        """
        self.logger.info("Starting improvement cycle")
        timestamp = datetime.now().isoformat()

        result = ImprovementCycleResult(
            timestamp=timestamp,
            recommendations_count=0,
            deployed=False
        )

        try:
            # 1. Analyze
            if not self.improvement_module:
                result.error = "AI PM not available"
                return result

            state = ExecutionState()
            recommendations = await self.improvement_module.run_improvement_cycle(state)
            result.recommendations_count = len(recommendations)

            # 2. Filter by confidence
            high_confidence_recs = [
                r for r in recommendations
                if r.confidence >= self.confidence_threshold
            ]

            self.logger.info(
                "Analysis complete",
                total=len(recommendations),
                high_confidence=len(high_confidence_recs)
            )

            # 3. Deploy if auto-deploy enabled
            if self.auto_deploy and high_confidence_recs and self.cartridge_assembler:
                cartridge_name = f"auto_improvement_{int(time.time())}"
                cartridge_path = self.cartridges_path / f"{cartridge_name}.rts.png"

                # Convert recommendations to source files
                source_files = []
                for i, rec in enumerate(high_confidence_recs):
                    rec_path = Path(rec.target_path) if rec.target_path else Path(f"rec_{i}.txt")
                    source_files.append(rec_path)

                    # Write recommendation content (mock for now)
                    if not rec.target_path:
                        rec_path.write_text(rec.description)

                # Assemble cartridge
                png_bytes = self.cartridge_assembler.assemble_from_files(
                    source_files,
                    name=cartridge_name,
                    description=f"Auto-generated from {len(high_confidence_recs)} recommendations"
                )

                cartridge_path.write_bytes(png_bytes)
                result.deployed = True
                result.cartridge_path = str(cartridge_path)

                self.logger.info("Cartridge deployed", path=str(cartridge_path))

            # 4. Record metrics
            result.metrics = {
                "neuromodulation": self.improvement_module.get_modulation_state().model_dump(),
                "total_recommendations": len(recommendations),
                "high_confidence_count": len(high_confidence_recs)
            }

        except Exception as e:
            result.error = str(e)
            self.logger.error("Improvement cycle failed", error=str(e))

        # Store result
        self.last_cycle_result = result
        self.cycle_history.append(result)

        # Keep only last 100 cycles
        if len(self.cycle_history) > 100:
            self.cycle_history = self.cycle_history[-100:]

        return result

    async def run_forever(self):
        """
        Run improvement loops forever at the configured interval.
        """
        self.running = True
        self.logger.info(
            "Starting autonomous improvement service",
            interval_seconds=self.interval_seconds,
            auto_deploy=self.auto_deploy
        )

        while self.running:
            try:
                result = await self.run_cycle()
                self.logger.info(
                    "Cycle complete",
                    recommendations=result.recommendations_count,
                    deployed=result.deployed,
                    error=result.error
                )
            except Exception as e:
                self.logger.error("Cycle error", error=str(e))

            # Wait for next cycle
            await asyncio.sleep(self.interval_seconds)

    def stop(self):
        """Stop the service."""
        self.running = False
        self.logger.info("Stopping autonomous improvement service")

    def get_status(self) -> Dict[str, Any]:
        """Get current service status."""
        return {
            "running": self.running,
            "interval_seconds": self.interval_seconds,
            "auto_deploy": self.auto_deploy,
            "confidence_threshold": self.confidence_threshold,
            "ai_pm_available": AI_PM_AVAILABLE,
            "cartridge_available": CARTRIDGE_AVAILABLE,
            "last_cycle": self.last_cycle_result.__dict__ if self.last_cycle_result else None,
            "cycles_run": len(self.cycle_history)
        }


async def main():
    """Run the autonomous improvement service."""
    import argparse

    parser = argparse.ArgumentParser(description="Autonomous Improvement Service")
    parser.add_argument("--interval", type=int, default=3600, help="Interval in seconds")
    parser.add_argument("--auto-deploy", action="store_true", help="Auto-deploy cartridges")
    parser.add_argument("--confidence", type=float, default=0.8, help="Confidence threshold")
    args = parser.parse_args()

    service = AutonomousImprovementService(
        interval_seconds=args.interval,
        auto_deploy=args.auto_deploy,
        confidence_threshold=args.confidence
    )

    try:
        await service.run_forever()
    except KeyboardInterrupt:
        service.stop()


if __name__ == "__main__":
    asyncio.run(main())
