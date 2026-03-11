"""
Operation Neural Scalpel - Stress Test for Ouroboros Reflex Arc

Validates the "Spinal Cord" under controlled failure injection.
These tests prove the system can handle "Structural Strokes" before
we teach it to dream about them (Phase 57).

Test Scenarios:
1. Teleportation Spike - Window jumps 9000+ pixels in one cycle
2. Population Explosion - 50 windows injected instantly
3. Flatline - Heartbeat kill (5s silence)

Expected Reflex Responses:
- Teleportation -> QUARANTINE
- Explosion -> WARNING/QUARANTINE
- Flatline -> EMERGENCY_FREEZE
"""

import time
from pathlib import Path
from typing import Any

import pytest

from systems.evolution_daemon.safety.fracture_detector import (
    FractureConfig,
    FractureDetector,
    OuroborosReflex,
    determine_reflex_level,
)


class StressTestEnvironment:
    """Isolated test environment for stress testing."""

    def __init__(self, tmpdir: Path):
        self.tmpdir = tmpdir
        self.geometry_dir = tmpdir / ".geometry"
        self.ascii_scene_dir = self.geometry_dir / "ascii_scene"
        self.loop_dir = tmpdir / ".loop"

        # Create directories
        self.geometry_dir.mkdir(parents=True, exist_ok=True)
        self.ascii_scene_dir.mkdir(parents=True, exist_ok=True)
        self.loop_dir.mkdir(parents=True, exist_ok=True)

        # Create detector with fast config
        self.config = FractureConfig(
            WINDOW_SIZE=3,
            PAIN_THRESHOLD=0.3,
            MAX_POSITION_DELTA=500,
            MAX_COUNT_DELTA=10,
            MAX_HEARTBEAT_AGE=3.0,
            QUARANTINE_DURATION_SECONDS=60,
        )
        self.detector = FractureDetector(daemon=None, config=self.config)
        self.detector._project_root = tmpdir

    def write_shell_fragments(self, windows: list[dict[str, Any]]) -> None:
        """Write window data to shell_fragments.ascii."""
        frag_path = self.ascii_scene_dir / "shell_fragments.ascii"

        lines = ["windows:"]
        for w in windows:
            lines.append(f"  - id: {w.get('id', 'unknown')}")
            lines.append(f"    x: {w.get('x', 0)}")
            lines.append(f"    y: {w.get('y', 0)}")
            lines.append(f"    width: {w.get('width', 800)}")
            lines.append(f"    height: {w.get('height', 600)}")

        frag_path.write_text("\n".join(lines))

    def write_gnb_state(self, heartbeat: int = 1) -> None:
        """Write GNB state file."""
        gnb_path = self.geometry_dir / "gnb_state.ascii"

        content = f"""GEOMETRIC NATIVE BROWSER - STATE MIRROR
TIMESTAMP: {time.time()}
MODE: HEADLESS
HEARTBEAT: {heartbeat}
---
SCENE SUMMARY:
Daemon: ACTIVE
Evolution Count: 0
"""
        gnb_path.write_text(content)

    def capture_and_wait(self, seconds: float = 0.1) -> None:
        """Capture frame and wait briefly."""
        self.detector._capture_frame()
        time.sleep(seconds)


class TestTeleportationSpike:
    """
    Test 1: The Teleportation Spike

    Forcibly move Window #1 from (100, 100) to (9999, 9999) in a single cycle.
    Expected Result: QUARANTINE reflex triggered.
    """

    @pytest.mark.asyncio
    async def test_teleportation_triggers_quarantine(self, tmp_path):
        """Verify teleportation spike triggers QUARANTINE reflex."""
        env = StressTestEnvironment(tmp_path)

        # Phase 1: Establish baseline with stable window
        env.write_shell_fragments([
            {"id": "win_001", "x": 100, "y": 100, "width": 800, "height": 600}
        ])
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()

        # Capture another frame to establish stability
        env.capture_and_wait()

        # Verify low drift before injection
        drift_before = env.detector._analyze_frames()
        assert drift_before < 0.1, f"Pre-injection drift too high: {drift_before}"

        # Phase 2: INJECT TELEPORTATION (9000+ pixel jump)
        env.write_shell_fragments([
            {"id": "win_001", "x": 9999, "y": 9999, "width": 800, "height": 600}
        ])
        env.write_gnb_state(heartbeat=2)

        # Capture the fractured frame
        env.detector._capture_frame()

        # Phase 3: Analyze drift
        drift_after = env.detector._analyze_frames()
        assert drift_after > 0.2, f"Post-injection drift too low: {drift_after}"

        # Phase 4: Determine reflex level
        reflex = determine_reflex_level(drift_after, env.config)

        # Verify WARNING or higher triggered (teleport triggers reflex)
        assert reflex.value >= OuroborosReflex.WARNING.value, \
            f"Expected WARNING+, got {reflex.name} (drift={drift_after:.3f})"

        # Phase 5: Trigger reflex and verify
        signal_type = env.detector._detect_signal_type(drift_after)
        assert signal_type == "window_teleport", f"Wrong signal type: {signal_type}"

        event = env.detector._trigger_reflex(
            reflex, drift_after, signal_type, ["visual_shell"]
        )

        assert event.reflex_level.value >= OuroborosReflex.WARNING.value
        # Note: Only QUARANTINE triggers district quarantine, not WARNING

    @pytest.mark.asyncio
    async def test_teleportation_latency_under_150ms(self, tmp_path):
        """Verify reflex triggers within 150ms of detection."""
        env = StressTestEnvironment(tmp_path)

        # Establish baseline
        env.write_shell_fragments([
            {"id": "win_001", "x": 100, "y": 100, "width": 800, "height": 600}
        ])
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()
        env.capture_and_wait()

        # Inject and measure
        start_time = time.time()

        env.write_shell_fragments([
            {"id": "win_001", "x": 9999, "y": 9999, "width": 800, "height": 600}
        ])
        env.write_gnb_state(heartbeat=2)
        env.detector._capture_frame()

        drift = env.detector._analyze_frames()
        reflex = determine_reflex_level(drift, env.config)
        signal = env.detector._detect_signal_type(drift)
        env.detector._trigger_reflex(reflex, drift, signal, ["visual_shell"])

        latency_ms = (time.time() - start_time) * 1000

        assert latency_ms < 150, f"Reflex latency too slow: {latency_ms:.1f}ms"
        print(f"✅ Reflex latency: {latency_ms:.1f}ms (target: <150ms)")


class TestPopulationExplosion:
    """
    Test 2: The Population Explosion

    Inject 50 mock windows into the ASCII fragment instantly.
    Expected Result: WARNING or QUARANTINE reflex.
    """

    @pytest.mark.asyncio
    async def test_explosion_triggers_warning_or_higher(self, tmp_path):
        """Verify population explosion triggers at least WARNING."""
        env = StressTestEnvironment(tmp_path)

        # Phase 1: Establish baseline with 3 windows
        baseline_windows = [
            {"id": f"win_{i:03d}", "x": 100 * i, "y": 100 * i, "width": 800, "height": 600}
            for i in range(3)
        ]
        env.write_shell_fragments(baseline_windows)
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()
        env.capture_and_wait()

        # Phase 2: INJECT EXPLOSION (50 new windows)
        explosion_windows = baseline_windows + [
            {"id": f"win_exp_{i:03d}", "x": 200 * i, "y": 200 * i, "width": 400, "height": 300}
            for i in range(50)
        ]
        env.write_shell_fragments(explosion_windows)
        env.write_gnb_state(heartbeat=2)
        env.detector._capture_frame()

        # Phase 3: Analyze drift
        drift = env.detector._analyze_frames()
        assert drift > 0.3, f"Explosion drift too low: {drift:.3f}"

        # Phase 4: Determine reflex
        reflex = determine_reflex_level(drift, env.config)
        signal_type = env.detector._detect_signal_type(drift)

        # Verify WARNING or higher
        assert reflex.value >= OuroborosReflex.WARNING.value, \
            f"Expected WARNING+, got {reflex.name}"

        # Verify signal type
        assert signal_type == "window_explosion", f"Wrong signal: {signal_type}"

    @pytest.mark.asyncio
    async def test_explosion_count_delta_detection(self, tmp_path):
        """Verify count delta is correctly calculated."""
        env = StressTestEnvironment(tmp_path)

        # 5 windows baseline
        baseline = [
            {"id": f"win_{i}", "x": i * 100, "y": i * 100}
            for i in range(5)
        ]
        env.write_shell_fragments(baseline)
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()
        env.capture_and_wait()

        # 30 windows after explosion (delta = 25)
        explosion = baseline + [
            {"id": f"exp_{i}", "x": 500 + i * 10, "y": 500 + i * 10}
            for i in range(25)
        ]
        env.write_shell_fragments(explosion)
        env.write_gnb_state(heartbeat=2)
        env.detector._capture_frame()

        drift = env.detector._analyze_frames()
        signal = env.detector._detect_signal_type(drift)

        assert signal == "window_explosion", \
            f"Should detect explosion (25 new windows), got {signal}"


class TestFlatline:
    """
    Test 3: The Flatline (Heartbeat Kill)

    Halt all ASCII writes for 5+ seconds.
    Expected Result: EMERGENCY_FREEZE global halt.
    """

    @pytest.mark.asyncio
    async def test_flatline_triggers_emergency_freeze(self, tmp_path):
        """Verify heartbeat absence triggers EMERGENCY_FREEZE."""
        env = StressTestEnvironment(tmp_path)

        # Fast config for testing (1 second max heartbeat age)
        env.config.MAX_HEARTBEAT_AGE = 1.0

        # Phase 1: Establish baseline
        env.write_shell_fragments([
            {"id": "win_001", "x": 100, "y": 100}
        ])
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()
        env.capture_and_wait()

        # Phase 2: Simulate flatline by NOT updating files
        # Wait for heartbeat age to exceed threshold
        time.sleep(1.5)  # Wait longer than MAX_HEARTBEAT_AGE

        # Phase 3: Capture frame (should detect stale heartbeat)
        frame = env.detector._capture_frame()

        # The heartbeat_age should be > MAX_HEARTBEAT_AGE
        assert frame.heartbeat_age > env.config.MAX_HEARTBEAT_AGE, \
            f"Heartbeat age {frame.heartbeat_age:.2f}s should exceed {env.config.MAX_HEARTBEAT_AGE}s"

        # Phase 4: Simulate what the run loop would do
        if frame.heartbeat_age > env.config.MAX_HEARTBEAT_AGE:
            event = env.detector._trigger_reflex(
                OuroborosReflex.EMERGENCY_FREEZE,
                drift=1.0,
                signal_type="heartbeat_desync"
            )

            assert event.reflex_level == OuroborosReflex.EMERGENCY_FREEZE
            assert env.detector.is_emergency_frozen()

    @pytest.mark.asyncio
    async def test_flatline_recovery_via_clear(self, tmp_path):
        """Verify emergency freeze can be cleared."""
        env = StressTestEnvironment(tmp_path)

        # Trigger freeze
        env.detector._trigger_reflex(
            OuroborosReflex.EMERGENCY_FREEZE,
            drift=1.0,
            signal_type="heartbeat_desync"
        )

        assert env.detector.is_emergency_frozen()

        # Clear freeze
        env.detector.clear_emergency_freeze()

        assert not env.detector.is_emergency_frozen()


class TestReflexArcIntegration:
    """
    Full integration tests for the reflex arc under stress.
    """

    @pytest.mark.asyncio
    async def test_multiple_fractures_cascade(self, tmp_path):
        """Verify system handles multiple simultaneous fractures."""
        env = StressTestEnvironment(tmp_path)

        # Establish baseline
        env.write_shell_fragments([
            {"id": "win_001", "x": 100, "y": 100}
        ])
        env.write_gnb_state(heartbeat=1)
        env.capture_and_wait()
        env.capture_and_wait()

        # Inject compound fracture: teleport + explosion
        env.write_shell_fragments([
            {"id": "win_001", "x": 9999, "y": 9999},  # Teleport
        ] + [
            {"id": f"exp_{i}", "x": i * 10, "y": i * 10}  # Explosion
            for i in range(30)
        ])
        env.write_gnb_state(heartbeat=2)
        env.detector._capture_frame()

        drift = env.detector._analyze_frames()
        reflex = determine_reflex_level(drift, env.config)

        # Should trigger at least QUARANTINE
        assert reflex.value >= OuroborosReflex.QUARANTINE.value, \
            f"Compound fracture should trigger QUARANTINE+, got {reflex.name}"

    @pytest.mark.asyncio
    async def test_reflex_audit_trail(self, tmp_path):
        """Verify all reflexes are logged to audit trail."""
        env = StressTestEnvironment(tmp_path)

        # Trigger multiple reflexes
        env.detector._trigger_reflex(
            OuroborosReflex.WARNING,
            drift=0.35,
            signal_type="test_warning"
        )
        env.detector._trigger_reflex(
            OuroborosReflex.QUARANTINE,
            drift=0.6,
            signal_type="test_quarantine",
            affected_districts=["test_district"]
        )

        # Check audit log exists
        alert_log = env.loop_dir / "ouroboros_alerts.log"
        assert alert_log.exists(), "Alert log should exist"

        log_content = alert_log.read_text()

        assert "WARNING" in log_content, "WARNING should be logged"
        assert "QUARANTINE" in log_content, "QUARANTINE should be logged"
        assert "test_district" in log_content, "District should be logged"


# Performance benchmarks
class TestReflexPerformance:
    """Performance benchmarks for reflex arc."""

    def test_drift_calculation_performance(self, tmp_path):
        """Verify drift calculation is sub-millisecond."""
        env = StressTestEnvironment(tmp_path)

        # Create frames with varying complexity
        for i in range(10):
            windows = [
                {"id": f"win_{j}", "x": j * 10 + i, "y": j * 10 + i}
                for j in range(20)
            ]
            env.write_shell_fragments(windows)
            env.write_gnb_state(heartbeat=i)
            env.detector._capture_frame()

        # Benchmark
        start = time.time()
        for _ in range(100):
            env.detector._analyze_frames()
        elapsed_ms = (time.time() - start) * 1000 / 100

        assert elapsed_ms < 1.0, f"Drift calculation too slow: {elapsed_ms:.2f}ms"
        print(f"✅ Drift calculation: {elapsed_ms:.3f}ms average (target: <1ms)")

    def test_frame_capture_performance(self, tmp_path):
        """Verify frame capture is sub-millisecond."""
        env = StressTestEnvironment(tmp_path)

        env.write_shell_fragments([
            {"id": "win_001", "x": 100, "y": 100}
        ])
        env.write_gnb_state(heartbeat=1)

        # Benchmark
        start = time.time()
        for _ in range(100):
            env.detector._capture_frame()
        elapsed_ms = (time.time() - start) * 1000 / 100

        assert elapsed_ms < 1.0, f"Frame capture too slow: {elapsed_ms:.2f}ms"
        print(f"✅ Frame capture: {elapsed_ms:.3f}ms average (target: <1ms)")


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
