"""
Tests for the Ouroboros Fracture Detector data structures.

These tests validate the ASCIIFrame, FractureEvent, OuroborosReflex enum and
FractureConfig dataclass that are used to track geometric coherence and detect structural fractures.
"""

import asyncio
import tempfile
from pathlib import Path

import pytest


class TestASCIIFrame:
    """Tests for ASCIIFrame dataclass."""

    def test_ascii_frame_creation(self):
        """Test basic ASCIIFrame creation."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frame = ASCIIFrame(
            timestamp=1234567890.0,
            window_count=5,
            windows=[{"id": "w1", "x": 100, "y": 200}],
            stability=0.85,
            heartbeat_age=0.5
        )
        assert frame.timestamp == 1234567890.0
        assert frame.window_count == 5
        assert len(frame.windows) == 1

    def test_ascii_frame_defaults(self):
        """Test ASCIIFrame default values."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frame = ASCIIFrame(timestamp=1234567890.0)
        assert frame.window_count == 0
        assert frame.windows == []
        assert frame.stability == 0.0
        assert frame.heartbeat_age == 0.0


class TestFractureEvent:
    """Tests for FractureEvent dataclass."""

    def test_fracture_event_creation(self):
        """Test basic FractureEvent creation."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent

        event = FractureEvent(
            timestamp=1234567890.0,
            reflex_level=None,  # Will be OuroborosReflex later
            drift_score=0.45,
            signal_type="window_explosion",
            affected_districts=["district_alpha"]
        )
        assert event.timestamp == 1234567890.0
        assert event.drift_score == 0.45

    def test_fracture_event_defaults(self):
        """Test FractureEvent default values."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent

        event = FractureEvent(timestamp=1234567890.0)
        assert event.affected_districts == []
        assert event.signal_type == "unknown"


class TestOuroborosReflex:
    """Tests for OuroborosReflex enum."""

    def test_reflex_levels_exist(self):
        """Test all reflex levels are defined."""
        from systems.evolution_daemon.safety.fracture_detector import OuroborosReflex

        assert OuroborosReflex.NONE.value == 0
        assert OuroborosReflex.WARNING.value == 1
        assert OuroborosReflex.QUARANTINE.value == 2
        assert OuroborosReflex.EMERGENCY_FREEZE.value == 3

    def test_reflex_ordering(self):
        """Test reflex levels are ordered by severity."""
        from systems.evolution_daemon.safety.fracture_detector import OuroborosReflex

        assert OuroborosReflex.NONE < OuroborosReflex.WARNING
        assert OuroborosReflex.WARNING < OuroborosReflex.QUARANTINE
        assert OuroborosReflex.QUARANTINE < OuroborosReflex.EMERGENCY_FREEZE


class TestFractureConfig:
    """Tests for FractureConfig dataclass."""

    def test_default_config(self):
        """Test default configuration values."""
        from systems.evolution_daemon.safety.fracture_detector import FractureConfig

        config = FractureConfig()
        assert config.WINDOW_SIZE == 5
        assert config.PAIN_THRESHOLD == 0.3
        assert config.MAX_POSITION_DELTA == 500
        assert config.MAX_COUNT_DELTA == 10
        assert config.MAX_HEARTBEAT_AGE == 3.0
        assert config.MAX_STABILITY_DROP == 0.5
        assert config.QUARANTINE_DURATION_SECONDS == 300

    def test_custom_config(self):
        """Test custom configuration values."""
        from systems.evolution_daemon.safety.fracture_detector import FractureConfig

        config = FractureConfig(
            WINDOW_SIZE=10,
            PAIN_THRESHOLD=0.5,
            MAX_HEARTBEAT_AGE=5.0
        )
        assert config.WINDOW_SIZE == 10
        assert config.PAIN_THRESHOLD == 0.5
        assert config.MAX_HEARTBEAT_AGE == 5.0


class TestPositionDriftCalculation:
    """Tests for position drift calculation."""

    def test_no_windows_no_drift(self):
        """Test zero drift when no windows exist."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        drift = calculate_position_drift([], [])
        assert drift == 0.0

    def test_same_position_no_drift(self):
        """Test zero drift when positions are identical."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 100, "y": 200}]
        drift = calculate_position_drift(prev, curr)
        assert drift == 0.0

    def test_small_movement_low_drift(self):
        """Test low drift for small movements."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 110, "y": 210}]  # ~14px movement
        drift = calculate_position_drift(prev, curr)
        assert 0.0 < drift < 0.1

    def test_teleport_high_drift(self):
        """Test high drift for window teleport."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 800, "y": 900}]  # ~1131px movement
        drift = calculate_position_drift(prev, curr)
        assert drift > 0.5  # Should be high

    def test_missing_window_increases_drift(self):
        """Test drift increases when windows disappear."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}, {"id": "w2", "x": 300, "y": 400}]
        curr = [{"id": "w1", "x": 100, "y": 200}]  # w2 disappeared
        drift = calculate_position_drift(prev, curr)
        assert drift > 0.0

    def test_none_stability_values(self):
        """Test handling of None stability values in geometric drift calculation."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift

        # Test with None stability values
        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=None),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.5),
            ASCIIFrame(timestamp=3.0, window_count=5, stability=None),
        ]
        drift = calculate_geometric_drift(frames)
        assert drift >= 0.0  # Should not crash
        assert drift <= 1.0  # Should be normalized

    def test_windows_without_ids(self):
        """Test position drift calculation for windows without IDs."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test windows with no IDs but positions changed
        prev = [{"x": 100, "y": 200}, {"x": 300, "y": 400}]
        curr = [{"x": 120, "y": 220}, {"x": 280, "y": 380}]  # Positions slightly changed
        drift = calculate_position_drift(prev, curr)
        assert 0.0 <= drift <= 1.0  # Should not crash and should calculate drift

    def test_windows_without_ids_large_movement(self):
        """Test position drift calculation for windows without IDs with large movement."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test windows with no IDs and positions changed significantly
        prev = [{"x": 100, "y": 200}, {"x": 300, "y": 400}]
        curr = [{"x": 800, "y": 900}, {"x": 200, "y": 300}]  # Large movement
        drift = calculate_position_drift(prev, curr)
        assert drift > 0.5  # Should detect high drift

    def test_numeric_window_ids(self):
        """Test handling of numeric window IDs."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test with numeric IDs
        prev = [{"id": 1, "x": 100, "y": 200}, {"id": 2, "x": 300, "y": 400}]
        curr = [{"id": 1, "x": 110, "y": 210}, {"id": 2, "x": 300, "y": 400}]  # Only first moved
        drift = calculate_position_drift(prev, curr)
        assert 0.0 < drift < 0.5  # Should detect some drift

    def test_mixed_id_types(self):
        """Test handling of mixed string and numeric IDs."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test with mixed ID types
        prev = [{"id": "w1", "x": 100, "y": 200}, {"id": 2, "x": 300, "y": 400}]
        curr = [{"id": "w1", "x": 100, "y": 200}, {"id": 2, "x": 350, "y": 450}]  # Only numeric ID moved
        drift = calculate_position_drift(prev, curr)
        assert 0.0 < drift < 0.5  # Should detect drift for moved window

    def test_non_numeric_positions(self):
        """Test handling of non-numeric position values."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test with some non-numeric position values
        prev = [{"id": "w1", "x": 100, "y": 200}, {"id": "w2", "x": "invalid", "y": 400}]
        curr = [{"id": "w1", "x": 100, "y": 200}, {"id": "w2", "x": 300, "y": 400}]
        drift = calculate_position_drift(prev, curr)
        assert 0.0 <= drift <= 1.0  # Should not crash and should calculate drift

    def test_windows_with_none_ids(self):
        """Test handling of None window IDs."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        # Test with None IDs
        prev = [{"id": None, "x": 100, "y": 200}, {"x": 300, "y": 400}]
        curr = [{"id": None, "x": 120, "y": 220}, {"x": 300, "y": 400}]
        drift = calculate_position_drift(prev, curr)
        assert 0.0 <= drift <= 1.0  # Should not crash and should calculate drift


class TestGeometricDriftCalculation:
    """Tests for overall geometric drift calculation."""

    def test_single_frame_no_drift(self):
        """Test zero drift with single frame."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift

        frames = [ASCIIFrame(timestamp=1.0, window_count=1, stability=0.9)]
        drift = calculate_geometric_drift(frames)
        assert drift == 0.0

    def test_stable_frames_low_drift(self):
        """Test low drift for stable frames."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=3.0, window_count=5, stability=0.9),
        ]
        drift = calculate_geometric_drift(frames)
        assert drift < 0.1

    def test_unstable_frames_high_drift(self):
        """Test high drift for unstable frames."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=50, stability=0.2),  # Explosion + collapse
        ]
        drift = calculate_geometric_drift(frames)
        assert drift > 0.3

    def test_returns_worst_drift(self):
        """Test that function returns worst drift in window."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.9),  # Stable
            ASCIIFrame(timestamp=3.0, window_count=20, stability=0.3),  # Worst
            ASCIIFrame(timestamp=4.0, window_count=5, stability=0.8),  # Better
        ]
        drift = calculate_geometric_drift(frames)
        # Should return drift between frames 2-3, not 3-4
        assert drift > 0.2


class TestReflexDetermination:
    """Tests for reflex level determination."""

    def test_low_drift_no_reflex(self):
        """Test no reflex for low drift."""
        from systems.evolution_daemon.safety.fracture_detector import determine_reflex_level

        reflex = determine_reflex_level(0.1)
        assert reflex.value == 0  # NONE

    def test_medium_drift_warning(self):
        """Test WARNING reflex for medium drift."""
        from systems.evolution_daemon.safety.fracture_detector import (
            OuroborosReflex,
            determine_reflex_level,
        )

        reflex = determine_reflex_level(0.35)
        assert reflex == OuroborosReflex.WARNING

    def test_high_drift_quarantine(self):
        """Test QUARANTINE reflex for high drift."""
        from systems.evolution_daemon.safety.fracture_detector import (
            OuroborosReflex,
            determine_reflex_level,
        )

        reflex = determine_reflex_level(0.6)
        assert reflex == OuroborosReflex.QUARANTINE

    def test_extreme_drift_emergency(self):
        """Test EMERGENCY_FREEZE for extreme drift."""
        from systems.evolution_daemon.safety.fracture_detector import (
            OuroborosReflex,
            determine_reflex_level,
        )

        reflex = determine_reflex_level(0.9)
        assert reflex == OuroborosReflex.EMERGENCY_FREEZE

    def test_custom_thresholds(self):
        """Test reflex with custom threshold config."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureConfig,
            OuroborosReflex,
            determine_reflex_level,
        )

        config = FractureConfig(PAIN_THRESHOLD=0.5)
        reflex = determine_reflex_level(0.4, config)
        assert reflex == OuroborosReflex.NONE  # Below custom threshold


class TestFractureDetector:
    """Tests for FractureDetector class."""

    def test_detector_initialization(self):
        """Test basic detector initialization."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        assert detector.config.WINDOW_SIZE == 5
        assert detector.config.PAIN_THRESHOLD == 0.3
        assert len(detector._frame_buffer) == 0
        assert len(detector._quarantined_districts) == 0

    def test_detector_custom_config(self):
        """Test detector with custom config."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureConfig,
            FractureDetector,
        )

        config = FractureConfig(WINDOW_SIZE=10, PAIN_THRESHOLD=0.5)
        detector = FractureDetector(daemon=None, config=config)
        assert detector.config.WINDOW_SIZE == 10
        assert detector.config.PAIN_THRESHOLD == 0.5

    def test_detector_quarantine_management(self):
        """Test district quarantine state management."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Initially not quarantined
        assert not detector.is_district_quarantined("district_alpha")

        # Quarantine a district
        detector.quarantine_district("district_alpha")
        assert detector.is_district_quarantined("district_alpha")

        # Release quarantine
        detector.release_district("district_alpha")
        assert not detector.is_district_quarantined("district_alpha")

    def test_detector_get_current_drift(self):
        """Test getting current drift score."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        assert detector.get_current_drift() == 0.0


class TestASCIISceneParsing:
    """Tests for ASCII Scene Graph parsing."""

    def test_parse_gnb_state(self):
        """Test parsing GNB state ASCII file."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create mock gnb_state.ascii
            gnb_path = Path(tmpdir) / ".geometry" / "gnb_state.ascii"
            gnb_path.parent.mkdir(parents=True, exist_ok=True)
            gnb_path.write_text("""GEOMETRIC NATIVE BROWSER - STATE MIRROR
TIMESTAMP: 1234567890.5
MODE: HEADLESS
HEARTBEAT: 42
---
SCENE SUMMARY:
Daemon: ACTIVE
Evolution Count: 5
""")

            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            frame = detector._parse_gnb_state()

            assert frame is not None
            assert frame.timestamp == 1234567890.5

    def test_parse_shell_fragments(self):
        """Test parsing shell_fragments.ascii."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create mock shell_fragments.ascii
            frag_path = Path(tmpdir) / ".geometry" / "ascii_scene" / "shell_fragments.ascii"
            frag_path.parent.mkdir(parents=True, exist_ok=True)
            frag_path.write_text("""windows:
  - id: win_001
    x: 100
    y: 200
    width: 800
    height: 600
  - id: win_002
    x: 300
    y: 400
    width: 400
    height: 300
""")

            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            windows = detector._parse_shell_fragments()

            assert len(windows) == 2
            assert windows[0]["id"] == "win_001"
            assert windows[0]["x"] == 100

    def test_missing_files_returns_empty(self):
        """Test that missing files return empty data gracefully."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            # Should not raise, return empty data
            frame = detector._parse_gnb_state()
            assert frame is None

            windows = detector._parse_shell_fragments()
            assert windows == []


class TestFrameCapture:
    """Tests for frame capture and buffer management."""

    def test_capture_frame(self):
        """Test capturing a frame into buffer."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        assert len(detector._frame_buffer) == 0

        frame = detector._capture_frame()

        # Frame should be added to buffer
        assert len(detector._frame_buffer) == 1
        assert frame is not None

    def test_buffer_sliding_window(self):
        """Test that buffer maintains sliding window size."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureConfig,
            FractureDetector,
        )

        config = FractureConfig(WINDOW_SIZE=3)
        detector = FractureDetector(daemon=None, config=config)

        # Capture more frames than window size
        for _ in range(5):
            detector._capture_frame()

        # Buffer should be capped at WINDOW_SIZE
        assert len(detector._frame_buffer) == 3

    def test_analyze_frames_returns_drift(self):
        """Test that frame analysis returns drift score."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Capture some frames
        for _ in range(3):
            detector._capture_frame()

        drift = detector._analyze_frames()

        # Should return a float drift score
        assert isinstance(drift, float)
        assert 0.0 <= drift <= 1.0


class TestReflexTriggering:
    """Tests for reflex response triggering."""

    def test_trigger_warning_reflex(self):
        """Test WARNING reflex triggers logging."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        event = detector._trigger_reflex(
            OuroborosReflex.WARNING,
            drift=0.35,
            signal_type="window_explosion"
        )

        assert event.reflex_level == OuroborosReflex.WARNING
        assert detector._last_fracture == event

    def test_trigger_quarantine_reflex(self):
        """Test QUARANTINE reflex quarantines districts."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.QUARANTINE,
            drift=0.6,
            signal_type="window_teleport",
            affected_districts=["district_alpha"]
        )

        assert detector.is_district_quarantined("district_alpha")

    def test_trigger_emergency_freeze(self):
        """Test EMERGENCY_FREEZE sets global freeze state."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.EMERGENCY_FREEZE,
            drift=0.95,
            signal_type="heartbeat_desync"
        )

        assert detector.is_emergency_frozen() is True

    def test_write_alert_log(self):
        """Test writing fracture event to alert log."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        with tempfile.TemporaryDirectory() as tmpdir:
            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            event = FractureEvent(
                timestamp=1234567890.0,
                reflex_level=OuroborosReflex.WARNING,
                drift_score=0.45,
                signal_type="window_explosion",
                affected_districts=["district_alpha"]
            )

            detector._write_alert_log(event)

            # Check log file was created
            log_path = Path(tmpdir) / ".loop" / "ouroboros_alerts.log"
            assert log_path.exists()

            # Check log content
            log_content = log_path.read_text()
            assert "REFLEX=WARNING" in log_content
            assert "DRIFT=0.450" in log_content
            assert "SIGNAL=window_explosion" in log_content
            assert "DISTRICTS=district_alpha" in log_content

    def test_clear_emergency_freeze(self):
        """Test clearing emergency freeze state."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        # Trigger emergency freeze
        detector._trigger_reflex(
            OuroborosReflex.EMERGENCY_FREEZE,
            drift=0.95,
            signal_type="heartbeat_desync"
        )

        assert detector.is_emergency_frozen() is True

        # Clear freeze
        detector.clear_emergency_freeze()
        assert detector.is_emergency_frozen() is False

    def test_multiple_district_quarantine(self):
        """Test quarantining multiple districts at once."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.QUARANTINE,
            drift=0.7,
            signal_type="cascading_failure",
            affected_districts=["district_alpha", "district_beta", "district_gamma"]
        )

        assert detector.is_district_quarantined("district_alpha")
        assert detector.is_district_quarantined("district_beta")
        assert detector.is_district_quarantined("district_gamma")

    def test_reflex_updates_metrics(self):
        """Test that triggering reflex updates drift metrics."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector,
            OuroborosReflex,
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.WARNING,
            drift=0.42,
            signal_type="test_signal"
        )

        # Check metrics were updated
        assert detector._last_fracture is not None
        assert detector._last_fracture.drift_score == 0.42
        assert detector._last_fracture.signal_type == "test_signal"


class TestRunLoop:
    """Tests for the main detector run loop."""

    @pytest.mark.asyncio
    async def test_run_loop_captures_frames(self):
        """Test that run loop captures frames periodically."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Run for a short time
        task = asyncio.create_task(detector.run())
        await asyncio.sleep(0.2)  # Let it run briefly

        detector.stop()
        await asyncio.sleep(0.1)  # Let it stop

        # Should have captured at least one frame
        assert len(detector._frame_buffer) >= 1

    @pytest.mark.asyncio
    async def test_run_loop_updates_drift(self):
        """Test that run loop updates current drift."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        task = asyncio.create_task(detector.run())
        await asyncio.sleep(0.3)

        detector.stop()
        await asyncio.sleep(0.1)

        # Drift should be set (even if 0.0)
        assert detector._drift_current is not None

    def test_stop_method(self):
        """Test that stop method sets running to False."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        detector._running = True

        detector.stop()

        assert detector._running is False

    def test_detect_signal_type_window_explosion(self):
        """Test signal type detection for window explosion."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Add frames with window explosion
        detector._frame_buffer = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=20, stability=0.9),  # Explosion
        ]

        signal = detector._detect_signal_type(drift=0.5)
        assert signal == "window_explosion"

    def test_detect_signal_type_window_teleport(self):
        """Test signal type detection for window teleport."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Add frames with window teleport
        detector._frame_buffer = [
            ASCIIFrame(
                timestamp=1.0,
                window_count=5,
                stability=0.9,
                windows=[{"id": "w1", "x": 100, "y": 200}]
            ),
            ASCIIFrame(
                timestamp=2.0,
                window_count=5,
                stability=0.9,
                windows=[{"id": "w1", "x": 1000, "y": 1200}]  # Teleport
            ),
        ]

        signal = detector._detect_signal_type(drift=0.5)
        assert signal == "window_teleport"

    def test_detect_signal_type_pas_collapse(self):
        """Test signal type detection for PAS collapse."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Add frames with PAS collapse
        detector._frame_buffer = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.2),  # Collapse
        ]

        signal = detector._detect_signal_type(drift=0.5)
        assert signal == "pas_collapse"

    def test_detect_signal_type_geometric_drift(self):
        """Test signal type detection for generic geometric drift."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Add stable frames
        detector._frame_buffer = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.9),
        ]

        signal = detector._detect_signal_type(drift=0.1)
        assert signal == "geometric_drift"

    def test_identify_affected_districts(self):
        """Test identifying affected districts."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        districts = detector._identify_affected_districts()
        assert districts == []

    def test_write_metrics(self):
        """Test writing metrics to ASCII file."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)
            detector._drift_current = 0.42

            detector._write_metrics()

            # Check metrics file was created
            metrics_path = Path(tmpdir) / ".geometry" / "ascii_scene" / "ouroboros_metrics.ascii"
            assert metrics_path.exists()

            # Check content
            content = metrics_path.read_text()
            assert "drift_current: 0.420" in content
            assert "districts_quarantined:" in content
            assert "emergency_frozen:" in content
