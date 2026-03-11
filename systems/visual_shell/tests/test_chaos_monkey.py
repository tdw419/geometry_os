"""
Tests for Chaos Monkey (Phase 47)

Tests random failure injection for resilience testing.
"""

from unittest.mock import Mock

import pytest

from systems.visual_shell.chaos_monkey import (
    BlastRadius,
    ChaosEvent,
    ChaosMode,
    ChaosMonkey,
    ChaosStats,
    ChaosTarget,
    FailureSchedule,
    FailureType,
    ImpactAnalyzer,
    TargetType,
    create_chaos_monkey,
)


class TestChaosMode:
    """Tests for ChaosMode enum."""

    def test_chaos_modes(self):
        assert ChaosMode.DISABLED.value == "disabled"
        assert ChaosMode.SAFE.value == "safe"
        assert ChaosMode.AGGRESSIVE.value == "aggressive"
        assert ChaosMode.SCHEDULED.value == "scheduled"


class TestTargetType:
    """Tests for TargetType enum."""

    def test_target_types(self):
        assert TargetType.CONTAINER.value == "container"
        assert TargetType.PEER.value == "peer"
        assert TargetType.NETWORK.value == "network"
        assert TargetType.DISK.value == "disk"
        assert TargetType.MEMORY.value == "memory"
        assert TargetType.CPU.value == "cpu"


class TestFailureType:
    """Tests for FailureType enum."""

    def test_failure_types(self):
        assert FailureType.KILL.value == "kill"
        assert FailureType.RESTART.value == "restart"
        assert FailureType.PAUSE.value == "pause"
        assert FailureType.NETWORK_LATENCY.value == "network_latency"
        assert FailureType.NETWORK_PARTITION.value == "network_partition"


class TestChaosTarget:
    """Tests for ChaosTarget dataclass."""

    def test_target_creation(self):
        target = ChaosTarget(
            target_id="container-1",
            target_type=TargetType.CONTAINER,
        )
        assert target.target_id == "container-1"
        assert target.weight == 1.0
        assert target.protected is False

    def test_protected_target(self):
        target = ChaosTarget(
            target_id="critical-1",
            target_type=TargetType.CONTAINER,
            protected=True,
        )
        assert target.protected is True


class TestChaosEvent:
    """Tests for ChaosEvent dataclass."""

    def test_event_creation(self):
        event = ChaosEvent(
            event_id="event-1",
            failure_type=FailureType.KILL,
            target_id="container-1",
            target_type=TargetType.CONTAINER,
        )
        assert event.event_id == "event-1"
        assert event.recovered is False


class TestFailureSchedule:
    """Tests for FailureSchedule dataclass."""

    def test_schedule_creation(self):
        schedule = FailureSchedule(
            schedule_id="schedule-1",
            cron="0 * * * *",
            target_type=TargetType.CONTAINER,
            failure_type=FailureType.KILL,
        )
        assert schedule.schedule_id == "schedule-1"
        assert schedule.enabled is True


class TestBlastRadius:
    """Tests for BlastRadius dataclass."""

    def test_blast_radius_creation(self):
        blast = BlastRadius(
            event_id="event-1",
            direct_impact={"container-1"},
            indirect_impact={"container-2", "container-3"},
        )
        assert blast.event_id == "event-1"
        assert len(blast.direct_impact) == 1
        assert len(blast.indirect_impact) == 2


class TestChaosStats:
    """Tests for ChaosStats dataclass."""

    def test_stats_defaults(self):
        stats = ChaosStats()
        assert stats.total_events == 0
        assert stats.kill_events == 0


class TestImpactAnalyzer:
    """Tests for ImpactAnalyzer."""

    @pytest.fixture
    def analyzer(self):
        return ImpactAnalyzer()

    def test_analyzer_creation(self, analyzer):
        assert len(analyzer._blast_radiuses) == 0

    def test_analyze_peer_failure(self, analyzer):
        event = ChaosEvent(
            event_id="event-1",
            failure_type=FailureType.NETWORK_PARTITION,
            target_id="peer-1",
            target_type=TargetType.PEER,
        )

        containers = {
            "container-1": Mock(peer_id="peer-1"),
            "container-2": Mock(peer_id="peer-1"),
            "container-3": Mock(peer_id="peer-2"),
        }
        peers = {"peer-1": Mock(), "peer-2": Mock()}
        connections = {}

        blast = analyzer.analyze(event, containers, peers, connections)

        assert blast.event_id == "event-1"
        assert "peer-1" in blast.direct_impact
        assert blast.affected_peers >= 1

    def test_analyze_container_failure(self, analyzer):
        event = ChaosEvent(
            event_id="event-1",
            failure_type=FailureType.KILL,
            target_id="container-1",
            target_type=TargetType.CONTAINER,
        )

        containers = {"container-1": Mock(peer_id="peer-1")}
        peers = {}
        connections = {
            "conn-1": Mock(source="container-1", target="container-2"),
        }

        blast = analyzer.analyze(event, containers, peers, connections)

        assert "container-1" in blast.direct_impact

    def test_get_blast_radius(self, analyzer):
        event = ChaosEvent(
            event_id="event-1",
            failure_type=FailureType.KILL,
            target_id="container-1",
            target_type=TargetType.CONTAINER,
        )

        analyzer.analyze(event, {}, {}, {})

        blast = analyzer.get_blast_radius("event-1")
        assert blast is not None

    def test_get_blast_radius_not_found(self, analyzer):
        blast = analyzer.get_blast_radius("nonexistent")
        assert blast is None

    def test_get_all_blast_radiuses(self, analyzer):
        event = ChaosEvent(
            event_id="event-1",
            failure_type=FailureType.KILL,
            target_id="container-1",
            target_type=TargetType.CONTAINER,
        )

        analyzer.analyze(event, {}, {}, {})

        all_blasts = analyzer.get_all_blast_radiuses()
        assert len(all_blasts) == 1

    def test_add_handler(self, analyzer):
        handler = Mock()
        analyzer.add_handler(handler)
        assert handler in analyzer._impact_handlers

    def test_remove_handler(self, analyzer):
        handler = Mock()
        analyzer.add_handler(handler)
        analyzer.remove_handler(handler)
        assert handler not in analyzer._impact_handlers


class TestChaosMonkey:
    """Tests for ChaosMonkey."""

    @pytest.fixture
    def monkey(self):
        return ChaosMonkey(
            mode=ChaosMode.SAFE,
            interval=0.1,
            probability=1.0,  # Always inject for tests
        )

    def test_monkey_creation(self, monkey):
        assert monkey.mode == ChaosMode.SAFE
        assert monkey.probability == 1.0

    def test_register_target(self, monkey):
        target = monkey.register_target("container-1", TargetType.CONTAINER)
        assert target.target_id == "container-1"
        assert "container-1" in monkey._targets

    def test_register_protected_target(self, monkey):
        target = monkey.register_target("critical-1", TargetType.CONTAINER, protected=True)
        assert target.protected is True
        assert "critical-1" in monkey._protected

    def test_unregister_target(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        monkey.unregister_target("container-1")
        assert "container-1" not in monkey._targets

    def test_protect(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        monkey.protect("container-1")
        assert "container-1" in monkey._protected
        assert monkey._targets["container-1"].protected is True

    def test_unprotect(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER, protected=True)
        monkey.unprotect("container-1")
        assert "container-1" not in monkey._protected

    def test_register_injector(self, monkey):
        def injector(target_id):
            return True

        monkey.register_injector(FailureType.KILL, injector)
        assert FailureType.KILL in monkey._injectors

    def test_unregister_injector(self, monkey):
        def injector(target_id):
            return True

        monkey.register_injector(FailureType.KILL, injector)
        monkey.unregister_injector(FailureType.KILL)
        assert FailureType.KILL not in monkey._injectors

    def test_add_schedule(self, monkey):
        schedule = FailureSchedule(
            schedule_id="schedule-1",
            cron="0 * * * *",
            target_type=TargetType.CONTAINER,
            failure_type=FailureType.KILL,
        )
        monkey.add_schedule(schedule)
        assert "schedule-1" in monkey._schedules

    def test_remove_schedule(self, monkey):
        schedule = FailureSchedule(
            schedule_id="schedule-1",
            cron="0 * * * *",
            target_type=TargetType.CONTAINER,
            failure_type=FailureType.KILL,
        )
        monkey.add_schedule(schedule)
        monkey.remove_schedule("schedule-1")
        assert "schedule-1" not in monkey._schedules

    @pytest.mark.asyncio
    async def test_start_stop(self, monkey):
        await monkey.start()
        assert monkey._running is True

        await monkey.stop()
        assert monkey._running is False

    @pytest.mark.asyncio
    async def test_disabled_mode(self):
        monkey = ChaosMonkey(mode=ChaosMode.DISABLED)
        await monkey.start()
        assert monkey._running is False  # Should not run

    def test_inject_manual(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)

        injector_calls = []
        def injector(target_id):
            injector_calls.append(target_id)
            return True

        monkey.register_injector(FailureType.KILL, injector)

        event = monkey.inject_manual("container-1", FailureType.KILL)

        assert event is not None
        assert event.failure_type == FailureType.KILL
        assert len(injector_calls) == 1

    def test_inject_manual_unknown_target(self, monkey):
        event = monkey.inject_manual("unknown", FailureType.KILL)
        assert event is None

    def test_record_recovery(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        monkey.inject_manual("container-1", FailureType.KILL)

        events = monkey.get_events()
        event_id = events[0].event_id

        monkey.record_recovery(event_id, success=True, recovery_time=5.0)

        event = monkey.get_event(event_id)
        assert event.recovered is True
        assert event.recovery_time == 5.0

    def test_get_target(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        target = monkey.get_target("container-1")
        assert target is not None

    def test_get_target_not_found(self, monkey):
        target = monkey.get_target("unknown")
        assert target is None

    def test_get_targets(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        monkey.register_target("container-2", TargetType.CONTAINER)

        targets = monkey.get_targets()
        assert len(targets) == 2

    def test_get_events(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)

        def injector(target_id):
            return True

        monkey.register_injector(FailureType.KILL, injector)
        monkey.inject_manual("container-1", FailureType.KILL)

        events = monkey.get_events()
        assert len(events) == 1

    def test_get_event(self, monkey):
        monkey.register_target("container-1", TargetType.CONTAINER)
        event = monkey.inject_manual("container-1", FailureType.KILL)

        retrieved = monkey.get_event(event.event_id)
        assert retrieved is not None
        assert retrieved.event_id == event.event_id

    def test_get_stats(self, monkey):
        stats = monkey.get_stats()
        assert isinstance(stats, ChaosStats)

    def test_get_impact_analyzer(self, monkey):
        analyzer = monkey.get_impact_analyzer()
        assert isinstance(analyzer, ImpactAnalyzer)

    def test_add_recovery_handler(self, monkey):
        handler = Mock()
        monkey.add_recovery_handler(handler)
        assert handler in monkey._recovery_handlers

    def test_remove_recovery_handler(self, monkey):
        handler = Mock()
        monkey.add_recovery_handler(handler)
        monkey.remove_recovery_handler(handler)
        assert handler not in monkey._recovery_handlers


class TestCreateChaosMonkey:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        monkey = create_chaos_monkey()
        assert isinstance(monkey, ChaosMonkey)
        assert monkey.mode == ChaosMode.SAFE

    def test_create_with_custom(self):
        monkey = create_chaos_monkey(
            mode=ChaosMode.AGGRESSIVE,
            interval=30.0,
            probability=0.5,
        )
        assert monkey.mode == ChaosMode.AGGRESSIVE
        assert monkey.interval == 30.0
        assert monkey.probability == 0.5


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
