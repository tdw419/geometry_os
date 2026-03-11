"""
Chaos Monkey - Phase 47

Random failure injection for resilience testing.
"""

import asyncio
import random
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ChaosMode(Enum):
    """Operating modes for chaos."""
    DISABLED = "disabled"
    SAFE = "safe"
    AGGRESSIVE = "aggressive"
    SCHEDULED = "scheduled"


class TargetType(Enum):
    """Types of chaos targets."""
    CONTAINER = "container"
    PEER = "peer"
    NETWORK = "network"
    DISK = "disk"
    MEMORY = "memory"
    CPU = "cpu"


class FailureType(Enum):
    """Types of failures to inject."""
    KILL = "kill"
    RESTART = "restart"
    PAUSE = "pause"
    NETWORK_LATENCY = "network_latency"
    NETWORK_PARTITION = "network_partition"
    DISK_FILL = "disk_fill"
    MEMORY_PRESSURE = "memory_pressure"
    CPU_STRESS = "cpu_stress"


@dataclass
class ChaosTarget:
    """A target for chaos injection."""
    target_id: str
    target_type: TargetType
    weight: float = 1.0
    protected: bool = False
    last_chaos: float | None = None
    chaos_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class ChaosEvent:
    """Record of a chaos event."""
    event_id: str
    failure_type: FailureType
    target_id: str
    target_type: TargetType
    timestamp: float = field(default_factory=time.time)
    duration: float | None = None
    recovered: bool = False
    recovery_time: float | None = None
    impact_score: float = 0.0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class FailureSchedule:
    """Schedule for planned failures."""
    schedule_id: str
    cron: str  # Cron expression for timing
    target_type: TargetType
    failure_type: FailureType
    enabled: bool = True
    last_run: float | None = None
    next_run: float | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class BlastRadius:
    """Analysis of failure impact."""
    event_id: str
    direct_impact: set[str] = field(default_factory=set)
    indirect_impact: set[str] = field(default_factory=set)
    affected_containers: int = 0
    affected_peers: int = 0
    affected_connections: int = 0
    impact_score: float = 0.0


@dataclass
class ChaosStats:
    """Statistics for chaos operations."""
    total_events: int = 0
    kill_events: int = 0
    restart_events: int = 0
    network_events: int = 0
    successful_recoveries: int = 0
    failed_recoveries: int = 0
    avg_recovery_time: float = 0.0
    avg_impact_score: float = 0.0


class ImpactAnalyzer:
    """Analyzes the impact of chaos events."""

    def __init__(self):
        self._blast_radiuses: dict[str, BlastRadius] = {}
        self._impact_handlers: list[Callable[[BlastRadius], None]] = []

    def analyze(
        self,
        event: ChaosEvent,
        containers: dict[str, Any],
        peers: dict[str, Any],
        connections: dict[str, Any],
    ) -> BlastRadius:
        """Analyze blast radius of a chaos event."""
        direct = {event.target_id}
        indirect: set[str] = set()

        # Find indirect impact based on target type
        if event.target_type == TargetType.PEER:
            # All containers on peer are affected
            for cid, container in containers.items():
                if getattr(container, 'peer_id', None) == event.target_id:
                    indirect.add(cid)

        elif event.target_type == TargetType.CONTAINER:
            # Connected containers may be affected
            for conn_id, conn in connections.items():
                if getattr(conn, 'source', None) == event.target_id:
                    indirect.add(getattr(conn, 'target', ''))
                elif getattr(conn, 'target', None) == event.target_id:
                    indirect.add(getattr(conn, 'source', ''))

        # Calculate impact score
        impact_score = len(direct) + len(indirect) * 0.5

        blast = BlastRadius(
            event_id=event.event_id,
            direct_impact=direct,
            indirect_impact=indirect,
            affected_containers=len([t for t in direct | indirect if t in containers]),
            affected_peers=len([t for t in direct | indirect if t in peers]),
            affected_connections=len([t for t in indirect if t in connections]),
            impact_score=impact_score,
        )

        self._blast_radiuses[event.event_id] = blast
        self._notify_handlers(blast)

        return blast

    def get_blast_radius(self, event_id: str) -> BlastRadius | None:
        """Get blast radius for an event."""
        return self._blast_radiuses.get(event_id)

    def get_all_blast_radiuses(self) -> list[BlastRadius]:
        """Get all blast radius analyses."""
        return list(self._blast_radiuses.values())

    def add_handler(self, handler: Callable[[BlastRadius], None]) -> None:
        """Add impact handler."""
        self._impact_handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove impact handler."""
        if handler in self._impact_handlers:
            self._impact_handlers.remove(handler)

    def _notify_handlers(self, blast: BlastRadius) -> None:
        """Notify handlers of blast radius."""
        for handler in self._impact_handlers:
            try:
                handler(blast)
            except Exception:
                pass


class ChaosMonkey:
    """Random failure injection engine."""

    def __init__(
        self,
        mode: ChaosMode = ChaosMode.SAFE,
        interval: float = 60.0,
        probability: float = 0.1,
    ):
        self.mode = mode
        self.interval = interval
        self.probability = probability
        self._running = False
        self._targets: dict[str, ChaosTarget] = {}
        self._events: list[ChaosEvent] = []
        self._schedules: dict[str, FailureSchedule] = {}
        self._impact_analyzer = ImpactAnalyzer()
        self._stats = ChaosStats()
        self._injectors: dict[FailureType, Callable] = {}
        self._recovery_handlers: list[Callable[[ChaosEvent], None]] = []
        self._protected: set[str] = set()

    def register_target(
        self,
        target_id: str,
        target_type: TargetType,
        weight: float = 1.0,
        protected: bool = False,
    ) -> ChaosTarget:
        """Register a target for chaos."""
        target = ChaosTarget(
            target_id=target_id,
            target_type=target_type,
            weight=weight,
            protected=protected,
        )
        self._targets[target_id] = target
        if protected:
            self._protected.add(target_id)
        return target

    def unregister_target(self, target_id: str) -> None:
        """Unregister a target."""
        self._targets.pop(target_id, None)
        self._protected.discard(target_id)

    def protect(self, target_id: str) -> None:
        """Protect a target from chaos."""
        self._protected.add(target_id)
        if target_id in self._targets:
            self._targets[target_id].protected = True

    def unprotect(self, target_id: str) -> None:
        """Remove protection from a target."""
        self._protected.discard(target_id)
        if target_id in self._targets:
            self._targets[target_id].protected = False

    def register_injector(
        self,
        failure_type: FailureType,
        injector: Callable[[str], bool],
    ) -> None:
        """Register a failure injector function."""
        self._injectors[failure_type] = injector

    def unregister_injector(self, failure_type: FailureType) -> None:
        """Unregister a failure injector."""
        self._injectors.pop(failure_type, None)

    def add_schedule(self, schedule: FailureSchedule) -> None:
        """Add a scheduled failure."""
        self._schedules[schedule.schedule_id] = schedule

    def remove_schedule(self, schedule_id: str) -> None:
        """Remove a scheduled failure."""
        self._schedules.pop(schedule_id, None)

    async def start(self) -> None:
        """Start the chaos monkey."""
        if self.mode == ChaosMode.DISABLED:
            return

        self._running = True
        asyncio.create_task(self._chaos_loop())

    async def stop(self) -> None:
        """Stop the chaos monkey."""
        self._running = False

    async def _chaos_loop(self) -> None:
        """Main chaos injection loop."""
        while self._running:
            await asyncio.sleep(self.interval)

            if self.mode == ChaosMode.DISABLED:
                continue

            if self.mode == ChaosMode.SAFE:
                await self._safe_chaos()
            elif self.mode == ChaosMode.AGGRESSIVE:
                await self._aggressive_chaos()

    async def _safe_chaos(self) -> None:
        """Inject chaos safely (avoid protected targets)."""
        eligible = [
            t for t in self._targets.values()
            if not t.protected and t.target_id not in self._protected
        ]

        if not eligible:
            return

        if random.random() < self.probability:
            target = random.choice(eligible)
            await self._inject_failure(target)

    async def _aggressive_chaos(self) -> None:
        """Inject chaos aggressively."""
        eligible = [t for t in self._targets.values() if not t.protected]

        if not eligible:
            return

        # Higher probability, multiple targets
        count = random.randint(1, min(3, len(eligible)))
        targets = random.sample(eligible, count)

        for target in targets:
            await self._inject_failure(target)

    async def _inject_failure(self, target: ChaosTarget) -> ChaosEvent | None:
        """Inject a failure into a target."""
        # Select failure type based on target type
        if target.target_type == TargetType.CONTAINER:
            failure_type = random.choice([FailureType.KILL, FailureType.PAUSE, FailureType.RESTART])
        elif target.target_type == TargetType.PEER:
            failure_type = random.choice([FailureType.NETWORK_PARTITION, FailureType.CPU_STRESS])
        else:
            failure_type = random.choice(list(FailureType))

        event = ChaosEvent(
            event_id=str(uuid.uuid4()),
            failure_type=failure_type,
            target_id=target.target_id,
            target_type=target.target_type,
        )

        # Execute injection
        injector = self._injectors.get(failure_type)
        if injector:
            try:
                success = injector(target.target_id)
                if success:
                    self._update_stats(event)
                    target.last_chaos = time.time()
                    target.chaos_count += 1
            except Exception:
                event.metadata["error"] = "Injection failed"

        self._events.append(event)
        return event

    def _update_stats(self, event: ChaosEvent) -> None:
        """Update statistics."""
        self._stats.total_events += 1

        if event.failure_type == FailureType.KILL:
            self._stats.kill_events += 1
        elif event.failure_type == FailureType.RESTART:
            self._stats.restart_events += 1
        elif event.failure_type in (FailureType.NETWORK_LATENCY, FailureType.NETWORK_PARTITION):
            self._stats.network_events += 1

    def record_recovery(
        self,
        event_id: str,
        success: bool,
        recovery_time: float,
    ) -> None:
        """Record recovery of a chaos event."""
        for event in self._events:
            if event.event_id == event_id:
                event.recovered = success
                event.recovery_time = recovery_time

                if success:
                    self._stats.successful_recoveries += 1
                    self._stats.avg_recovery_time = (
                        (self._stats.avg_recovery_time * (self._stats.successful_recoveries - 1) + recovery_time)
                        / self._stats.successful_recoveries
                    )
                else:
                    self._stats.failed_recoveries += 1
                break

    def inject_manual(
        self,
        target_id: str,
        failure_type: FailureType,
    ) -> ChaosEvent | None:
        """Manually inject a specific failure."""
        target = self._targets.get(target_id)
        if not target:
            return None

        event = ChaosEvent(
            event_id=str(uuid.uuid4()),
            failure_type=failure_type,
            target_id=target_id,
            target_type=target.target_type,
        )

        injector = self._injectors.get(failure_type)
        if injector:
            try:
                injector(target_id)
                self._update_stats(event)
                target.last_chaos = time.time()
                target.chaos_count += 1
            except Exception as e:
                event.metadata["error"] = str(e)

        self._events.append(event)
        return event

    def get_target(self, target_id: str) -> ChaosTarget | None:
        """Get a target by ID."""
        return self._targets.get(target_id)

    def get_targets(self) -> list[ChaosTarget]:
        """Get all targets."""
        return list(self._targets.values())

    def get_events(self, limit: int = 100) -> list[ChaosEvent]:
        """Get recent events."""
        return self._events[-limit:]

    def get_event(self, event_id: str) -> ChaosEvent | None:
        """Get event by ID."""
        for event in self._events:
            if event.event_id == event_id:
                return event
        return None

    def get_stats(self) -> ChaosStats:
        """Get chaos statistics."""
        return self._stats

    def get_impact_analyzer(self) -> ImpactAnalyzer:
        """Get impact analyzer."""
        return self._impact_analyzer

    def add_recovery_handler(self, handler: Callable[[ChaosEvent], None]) -> None:
        """Add recovery handler."""
        self._recovery_handlers.append(handler)

    def remove_recovery_handler(self, handler: Callable) -> None:
        """Remove recovery handler."""
        if handler in self._recovery_handlers:
            self._recovery_handlers.remove(handler)


def create_chaos_monkey(
    mode: ChaosMode = ChaosMode.SAFE,
    interval: float = 60.0,
    probability: float = 0.1,
) -> ChaosMonkey:
    """Factory function to create a chaos monkey."""
    return ChaosMonkey(
        mode=mode,
        interval=interval,
        probability=probability,
    )
