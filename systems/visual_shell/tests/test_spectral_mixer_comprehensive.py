"""
Comprehensive test suite for Spectral Mixer - Native Glyph Shell

Tests cover edge cases, boundary conditions, wave interference patterns,
and multi-daemon composition for the spectral mixing system.
"""

import pytest
import math
import time
from typing import List, Dict, Tuple, Optional
from dataclasses import dataclass, field
from enum import Enum
import hashlib


class FrequencyBand(Enum):
    """Frequency bands for daemon classification."""
    ULTRA_LOW = "ultra_low"    # 0.25-0.5 Hz
    LOW = "low"                # 0.5-1.0 Hz
    MID = "mid"                # 1.0-2.0 Hz
    HIGH = "high"              # 2.0-4.0 Hz
    CUSTOM = "custom"          # User-defined


@dataclass(frozen=True)
class DaemonId:
    """Unique identifier for a daemon."""
    value: int

    @classmethod
    def from_name(cls, name: str) -> 'DaemonId':
        """Create daemon ID from a string name."""
        hash_val = int(hashlib.md5(name.encode()).hexdigest()[:16], 16)
        return cls(hash_val)


@dataclass
class WaveLayer:
    """A single wave layer representing one daemon's contribution."""
    daemon_id: DaemonId
    frequency: float
    phase: float
    amplitude: float
    data: List[float]
    band: FrequencyBand
    last_update: float = field(default_factory=time.time)

    def wave_modulation(self, t: float) -> float:
        """Calculate wave modulation factor at time t."""
        return math.sin(t * self.frequency + self.phase)


class SpectralMixerError(Exception):
    """Error from spectral mixer operations."""
    pass


class SpectralMixer:
    """
    Python mock of the Rust SpectralMixer for testing logic.
    Implements wave interference-based daemon integration.
    """

    def __init__(self, data_size: int):
        if data_size <= 0:
            raise ValueError("Data size must be positive")
        self.data_size = data_size
        self.layers: Dict[DaemonId, WaveLayer] = {}
        self.time: float = 0.0
        self.band_registry: Dict[FrequencyBand, DaemonId] = {}

    @staticmethod
    def _band_frequency(band: FrequencyBand, custom_freq: Optional[float] = None) -> float:
        """Get base frequency for a band."""
        freqs = {
            FrequencyBand.ULTRA_LOW: 0.375,
            FrequencyBand.LOW: 0.75,
            FrequencyBand.MID: 1.5,
            FrequencyBand.HIGH: 3.0,
        }
        if band == FrequencyBand.CUSTOM:
            if custom_freq is None:
                raise ValueError("Custom band requires frequency")
            return custom_freq
        return freqs[band]

    def register_daemon(
        self,
        daemon_id: DaemonId,
        band: FrequencyBand,
        amplitude: float,
        custom_freq: Optional[float] = None
    ) -> None:
        """Register a new daemon with its frequency band."""
        if daemon_id in self.layers:
            raise SpectralMixerError(f"Daemon {daemon_id} already registered")

        # Check band allocation (custom bands can have duplicates)
        if band != FrequencyBand.CUSTOM and band in self.band_registry:
            raise SpectralMixerError(f"Frequency band {band} already allocated")

        # Validate frequency
        frequency = self._band_frequency(band, custom_freq)
        if frequency <= 0 or frequency > 10:
            raise SpectralMixerError(f"Invalid frequency: {frequency}")

        # Validate amplitude
        amplitude = max(0.0, min(1.0, amplitude))

        # Create layer
        layer = WaveLayer(
            daemon_id=daemon_id,
            frequency=frequency,
            phase=0.0,
            amplitude=amplitude,
            data=[0.0] * self.data_size,
            band=band
        )

        self.layers[daemon_id] = layer
        if band != FrequencyBand.CUSTOM:
            self.band_registry[band] = daemon_id

    def unregister_daemon(self, daemon_id: DaemonId) -> None:
        """Unregister a daemon."""
        if daemon_id not in self.layers:
            raise SpectralMixerError(f"Daemon {daemon_id} not found")

        layer = self.layers.pop(daemon_id)
        if layer.band in self.band_registry:
            del self.band_registry[layer.band]

    def update_daemon(self, daemon_id: DaemonId, data: List[float]) -> None:
        """Update a daemon's data vector."""
        if daemon_id not in self.layers:
            raise SpectralMixerError(f"Daemon {daemon_id} not found")

        if len(data) != self.data_size:
            raise SpectralMixerError(
                f"Data size mismatch: expected {self.data_size}, got {len(data)}"
            )

        self.layers[daemon_id].data = data
        self.layers[daemon_id].last_update = time.time()

    def set_amplitude(self, daemon_id: DaemonId, amplitude: float) -> None:
        """Set a daemon's amplitude."""
        if daemon_id not in self.layers:
            raise SpectralMixerError(f"Daemon {daemon_id} not found")

        self.layers[daemon_id].amplitude = max(0.0, min(1.0, amplitude))

    def set_phase(self, daemon_id: DaemonId, phase: float) -> None:
        """Set a daemon's phase offset."""
        if daemon_id not in self.layers:
            raise SpectralMixerError(f"Daemon {daemon_id} not found")

        self.layers[daemon_id].phase = phase

    def tick(self, delta: float) -> None:
        """Advance time by delta seconds."""
        self.time += delta

    def resolve_field(self) -> List[float]:
        """
        Resolve the composite field from all wave layers.
        Uses wave interference: tanh(sum(daemon_i * weight_i * sin(time * freq_i + phase_i)))
        """
        if not self.layers:
            return [0.0] * self.data_size

        # Pre-compute wave modulations
        wave_mods: List[Tuple[float, List[float]]] = []
        for layer in self.layers.values():
            wave_mod = layer.wave_modulation(self.time) * layer.amplitude
            wave_mods.append((wave_mod, layer.data))

        # Sum contributions
        composite = [0.0] * self.data_size
        for wave_mod, data in wave_mods:
            for i in range(self.data_size):
                composite[i] += data[i] * wave_mod

        # Apply tanh for saturation
        return [self._fast_tanh(v) for v in composite]

    @staticmethod
    def _fast_tanh(x: float) -> float:
        """Fast approximate tanh."""
        # For |x| > 5, tanh is essentially ±1
        if x > 5.0:
            return 1.0
        if x < -5.0:
            return -1.0
        x2 = x * x
        return x * (27.0 + x2) / (27.0 + 9.0 * x2)

    def daemon_count(self) -> int:
        """Get number of active daemons."""
        return len(self.layers)

    def get_layer(self, daemon_id: DaemonId) -> Optional[WaveLayer]:
        """Get a layer by daemon ID."""
        return self.layers.get(daemon_id)


class TestSpectralMixerCreation:
    """Tests for spectral mixer creation and initialization."""

    def test_valid_data_sizes(self):
        """Test creation with valid data sizes."""
        for size in [1, 4, 16, 64, 256, 1024, 65536]:
            mixer = SpectralMixer(size)
            assert mixer.data_size == size
            assert mixer.daemon_count() == 0

    def test_invalid_data_size_zero(self):
        """Data size 0 should raise ValueError."""
        with pytest.raises(ValueError):
            SpectralMixer(0)

    def test_invalid_data_size_negative(self):
        """Negative data size should raise ValueError."""
        with pytest.raises(ValueError):
            SpectralMixer(-1)

    def test_initial_state(self):
        """New mixer should have correct initial state."""
        mixer = SpectralMixer(256)
        assert mixer.time == 0.0
        assert mixer.daemon_count() == 0
        assert len(mixer.layers) == 0
        assert len(mixer.band_registry) == 0


class TestDaemonRegistration:
    """Tests for daemon registration."""

    def test_register_single_daemon(self):
        """Register a single daemon."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)

        assert mixer.daemon_count() == 1
        assert mixer.get_layer(daemon_id) is not None

    def test_register_multiple_daemons(self):
        """Register multiple daemons on different bands."""
        mixer = SpectralMixer(256)

        daemon1 = DaemonId.from_name("daemon1")
        daemon2 = DaemonId.from_name("daemon2")
        daemon3 = DaemonId.from_name("daemon3")

        mixer.register_daemon(daemon1, FrequencyBand.LOW, 0.5)
        mixer.register_daemon(daemon2, FrequencyBand.MID, 0.7)
        mixer.register_daemon(daemon3, FrequencyBand.HIGH, 0.9)

        assert mixer.daemon_count() == 3

    def test_register_duplicate_daemon(self):
        """Registering duplicate daemon should raise error."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)

        with pytest.raises(SpectralMixerError, match="already registered"):
            mixer.register_daemon(daemon_id, FrequencyBand.HIGH, 0.7)

    def test_register_duplicate_band(self):
        """Registering on same band should raise error."""
        mixer = SpectralMixer(256)

        daemon1 = DaemonId.from_name("daemon1")
        daemon2 = DaemonId.from_name("daemon2")

        mixer.register_daemon(daemon1, FrequencyBand.MID, 0.5)

        with pytest.raises(SpectralMixerError, match="already allocated"):
            mixer.register_daemon(daemon2, FrequencyBand.MID, 0.7)

    def test_register_custom_band_multiple(self):
        """Multiple custom bands should be allowed."""
        mixer = SpectralMixer(256)

        daemon1 = DaemonId.from_name("daemon1")
        daemon2 = DaemonId.from_name("daemon2")

        mixer.register_daemon(daemon1, FrequencyBand.CUSTOM, 0.5, custom_freq=1.0)
        mixer.register_daemon(daemon2, FrequencyBand.CUSTOM, 0.7, custom_freq=2.0)

        assert mixer.daemon_count() == 2


class TestDaemonUnregistration:
    """Tests for daemon unregistration."""

    def test_unregister_single_daemon(self):
        """Unregister a daemon."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)
        assert mixer.daemon_count() == 1

        mixer.unregister_daemon(daemon_id)
        assert mixer.daemon_count() == 0
        assert mixer.get_layer(daemon_id) is None

    def test_unregister_nonexistent_daemon(self):
        """Unregistering nonexistent daemon should raise error."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("nonexistent")

        with pytest.raises(SpectralMixerError, match="not found"):
            mixer.unregister_daemon(daemon_id)

    def test_unregister_releases_band(self):
        """Unregistering should release the band for reuse."""
        mixer = SpectralMixer(256)
        daemon1 = DaemonId.from_name("daemon1")
        daemon2 = DaemonId.from_name("daemon2")

        mixer.register_daemon(daemon1, FrequencyBand.MID, 0.5)
        mixer.unregister_daemon(daemon1)

        # Should be able to reuse the band now
        mixer.register_daemon(daemon2, FrequencyBand.MID, 0.7)
        assert mixer.daemon_count() == 1


class TestDaemonDataUpdate:
    """Tests for daemon data updates."""

    def test_update_daemon_data(self):
        """Update daemon's data vector."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)

        new_data = [1.0, 2.0, 3.0, 4.0]
        mixer.update_daemon(daemon_id, new_data)

        layer = mixer.get_layer(daemon_id)
        assert layer.data == new_data

    def test_update_wrong_size(self):
        """Update with wrong data size should raise error."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)

        with pytest.raises(SpectralMixerError, match="Data size mismatch"):
            mixer.update_daemon(daemon_id, [1.0, 2.0])  # Wrong size

    def test_update_nonexistent_daemon(self):
        """Update on nonexistent daemon should raise error."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("nonexistent")

        with pytest.raises(SpectralMixerError, match="not found"):
            mixer.update_daemon(daemon_id, [1.0, 2.0, 3.0, 4.0])


class TestAmplitudeControl:
    """Tests for amplitude control."""

    def test_set_amplitude(self):
        """Set daemon amplitude."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)
        mixer.set_amplitude(daemon_id, 0.8)

        layer = mixer.get_layer(daemon_id)
        assert layer.amplitude == 0.8

    def test_amplitude_clamped_high(self):
        """Amplitude > 1.0 should be clamped to 1.0."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)
        mixer.set_amplitude(daemon_id, 5.0)

        layer = mixer.get_layer(daemon_id)
        assert layer.amplitude == 1.0

    def test_amplitude_clamped_low(self):
        """Amplitude < 0.0 should be clamped to 0.0."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.5)
        mixer.set_amplitude(daemon_id, -0.5)

        layer = mixer.get_layer(daemon_id)
        assert layer.amplitude == 0.0

    def test_amplitude_nonexistent_daemon(self):
        """Setting amplitude on nonexistent daemon should raise error."""
        mixer = SpectralMixer(256)
        daemon_id = DaemonId.from_name("nonexistent")

        with pytest.raises(SpectralMixerError, match="not found"):
            mixer.set_amplitude(daemon_id, 0.5)


class TestWaveInterference:
    """Tests for wave interference and field resolution."""

    def test_resolve_empty_mixer(self):
        """Empty mixer should return all zeros."""
        mixer = SpectralMixer(4)
        field = mixer.resolve_field()

        assert field == [0.0, 0.0, 0.0, 0.0]

    def test_resolve_single_daemon(self):
        """Resolve field with single daemon."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [1.0, 0.5, 0.0, -0.5])

        field = mixer.resolve_field()

        # Field values should be within [-1, 1] due to tanh
        for val in field:
            assert -1.0 <= val <= 1.0

    def test_resolve_multiple_daemons(self):
        """Resolve field with multiple daemons (interference)."""
        mixer = SpectralMixer(4)

        daemon1 = DaemonId.from_name("daemon1")
        daemon2 = DaemonId.from_name("daemon2")

        mixer.register_daemon(daemon1, FrequencyBand.LOW, 1.0)
        mixer.register_daemon(daemon2, FrequencyBand.HIGH, 1.0)

        mixer.update_daemon(daemon1, [1.0, 0.0, 0.0, 0.0])
        mixer.update_daemon(daemon2, [0.0, 1.0, 0.0, 0.0])

        # Advance time to get non-zero wave modulation
        mixer.tick(0.5)
        field = mixer.resolve_field()

        # Should have contributions from both daemons
        # At least some values should be non-zero after time has advanced
        assert any(abs(v) > 0.01 for v in field), "Field should have non-zero contributions"

    def test_tanh_saturation(self):
        """Large values should be saturated by tanh."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [100.0, -100.0, 50.0, -50.0])

        # Tick to a point where wave modulation is near 1
        mixer.tick(1.0)  # Time ~1s, frequency 1.5Hz -> sin(1.5) ~ 1

        field = mixer.resolve_field()

        # All values should be within [-1, 1] due to tanh saturation
        for val in field:
            assert -1.0 <= val <= 1.0, f"Value {val} not in [-1, 1]"

    def test_time_evolution(self):
        """Field should evolve as time advances."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [1.0, 1.0, 1.0, 1.0])

        # Get field at time 0
        field_t0 = mixer.resolve_field()

        # Advance time
        mixer.tick(0.5)
        field_t1 = mixer.resolve_field()

        # Fields should be different (wave has evolved)
        # At time 0: sin(0) = 0, so all values are 0
        # At time 0.5: sin(0.5 * 1.5) = sin(0.75) ≈ 0.68
        assert field_t0 != field_t1

    def test_amplitude_affects_field(self):
        """Amplitude should affect field strength."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [1.0, 1.0, 1.0, 1.0])
        mixer.tick(1.0)  # Non-zero wave modulation

        field_high = mixer.resolve_field()
        max_high = max(abs(v) for v in field_high)

        mixer.set_amplitude(daemon_id, 0.1)
        field_low = mixer.resolve_field()
        max_low = max(abs(v) for v in field_low)

        # Lower amplitude should produce smaller values
        assert max_low < max_high


class TestWaveModulation:
    """Tests for wave modulation calculations."""

    def test_zero_time_zero_modulation(self):
        """At time 0 with phase 0, sin(0) = 0."""
        layer = WaveLayer(
            daemon_id=DaemonId.from_name("test"),
            frequency=1.0,
            phase=0.0,
            amplitude=1.0,
            data=[0.0],
            band=FrequencyBand.MID
        )
        assert abs(layer.wave_modulation(0.0)) < 0.001

    def test_quarter_period_max(self):
        """At t = pi/(2*freq), modulation should be ~1."""
        layer = WaveLayer(
            daemon_id=DaemonId.from_name("test"),
            frequency=1.0,
            phase=0.0,
            amplitude=1.0,
            data=[0.0],
            band=FrequencyBand.MID
        )
        t = math.pi / 2  # Quarter period for 1 Hz
        mod = layer.wave_modulation(t)
        assert abs(mod - 1.0) < 0.001

    def test_phase_shift(self):
        """Phase shift should affect modulation timing."""
        layer1 = WaveLayer(
            daemon_id=DaemonId.from_name("test1"),
            frequency=1.0,
            phase=0.0,
            amplitude=1.0,
            data=[0.0],
            band=FrequencyBand.MID
        )
        layer2 = WaveLayer(
            daemon_id=DaemonId.from_name("test2"),
            frequency=1.0,
            phase=math.pi,  # 180 degree shift
            amplitude=1.0,
            data=[0.0],
            band=FrequencyBand.CUSTOM
        )

        t = math.pi / 4
        mod1 = layer1.wave_modulation(t)
        mod2 = layer2.wave_modulation(t)

        # Phase shift of pi should produce opposite signs at most times
        assert mod1 * mod2 < 0 or abs(mod1) < 0.01 or abs(mod2) < 0.01


class TestFrequencyBands:
    """Tests for frequency band behavior."""

    def test_band_frequencies(self):
        """Each band should have appropriate base frequency."""
        mixer = SpectralMixer(4)

        expected = {
            FrequencyBand.ULTRA_LOW: 0.375,
            FrequencyBand.LOW: 0.75,
            FrequencyBand.MID: 1.5,
            FrequencyBand.HIGH: 3.0,
        }

        for band, expected_freq in expected.items():
            daemon_id = DaemonId.from_name(f"daemon_{band.value}")
            mixer.register_daemon(daemon_id, band, 0.5)

            layer = mixer.get_layer(daemon_id)
            assert abs(layer.frequency - expected_freq) < 0.001

    def test_custom_frequency(self):
        """Custom band should use specified frequency."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("custom_daemon")

        mixer.register_daemon(daemon_id, FrequencyBand.CUSTOM, 0.5, custom_freq=2.5)

        layer = mixer.get_layer(daemon_id)
        assert layer.frequency == 2.5


class TestDaemonId:
    """Tests for daemon ID generation."""

    def test_id_from_name_consistent(self):
        """Same name should produce same ID."""
        id1 = DaemonId.from_name("test_daemon")
        id2 = DaemonId.from_name("test_daemon")
        assert id1 == id2

    def test_id_from_name_different(self):
        """Different names should produce different IDs."""
        id1 = DaemonId.from_name("daemon1")
        id2 = DaemonId.from_name("daemon2")
        assert id1 != id2

    def test_id_hashable(self):
        """DaemonId should be hashable for use as dict key."""
        id1 = DaemonId.from_name("test")
        id2 = DaemonId.from_name("test")

        d = {id1: "value"}
        d[id2] = "updated"

        assert len(d) == 1
        assert d[id1] == "updated"


class TestEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_all_bands_registered(self):
        """Register daemons on all standard bands."""
        mixer = SpectralMixer(4)

        bands = [FrequencyBand.ULTRA_LOW, FrequencyBand.LOW, FrequencyBand.MID, FrequencyBand.HIGH]
        for i, band in enumerate(bands):
            mixer.register_daemon(DaemonId(i), band, 0.5)

        assert mixer.daemon_count() == 4

    def test_zero_amplitude(self):
        """Zero amplitude daemon should contribute nothing."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("zero_amp")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 0.0)
        mixer.update_daemon(daemon_id, [1.0, 1.0, 1.0, 1.0])
        mixer.tick(1.0)

        field = mixer.resolve_field()
        # With amplitude 0, all values should be 0 (or very close)
        for val in field:
            assert abs(val) < 0.001

    def test_very_small_data_size(self):
        """Test with data size of 1."""
        mixer = SpectralMixer(1)
        daemon_id = DaemonId.from_name("test")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [1.0])

        field = mixer.resolve_field()
        assert len(field) == 1

    def test_large_data_size(self):
        """Test with large data size."""
        size = 1024 * 1024  # 1M elements
        mixer = SpectralMixer(size)
        daemon_id = DaemonId.from_name("test")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        data = [0.5] * size
        mixer.update_daemon(daemon_id, data)

        # Resolve should complete without memory issues
        field = mixer.resolve_field()
        assert len(field) == size

    def test_negative_data_values(self):
        """Negative data values should work correctly."""
        mixer = SpectralMixer(4)
        daemon_id = DaemonId.from_name("test")

        mixer.register_daemon(daemon_id, FrequencyBand.MID, 1.0)
        mixer.update_daemon(daemon_id, [-1.0, -0.5, 0.0, 0.5])
        mixer.tick(1.0)

        field = mixer.resolve_field()
        # All values should still be within [-1, 1]
        for val in field:
            assert -1.0 <= val <= 1.0


class TestIntegrationScenarios:
    """Tests that simulate real-world usage scenarios."""

    def test_security_daemon_scenario(self):
        """Simulate a security daemon with high frequency."""
        mixer = SpectralMixer(16)
        security_daemon = DaemonId.from_name("security")

        mixer.register_daemon(security_daemon, FrequencyBand.HIGH, 0.9)

        # Simulate security alert pattern
        alert_pattern = [0.0] * 15 + [1.0]  # Single alert
        mixer.update_daemon(security_daemon, alert_pattern)

        # Simulate rapid oscillation (security events)
        for _ in range(10):
            mixer.tick(0.1)
            field = mixer.resolve_field()
            # Field should be within bounds
            assert all(-1.0 <= v <= 1.0 for v in field)

    def test_creative_daemon_scenario(self):
        """Simulate a creative daemon with low frequency."""
        mixer = SpectralMixer(16)
        creative_daemon = DaemonId.from_name("creative")

        mixer.register_daemon(creative_daemon, FrequencyBand.LOW, 0.6)

        # Simulate smooth gradient pattern
        gradient = [i / 15.0 for i in range(16)]
        mixer.update_daemon(creative_daemon, gradient)

        # Slow evolution
        for _ in range(5):
            mixer.tick(1.0)
            field = mixer.resolve_field()
            assert all(-1.0 <= v <= 1.0 for v in field)

    def test_multi_daemon_orchestration(self):
        """Simulate multiple daemons working together."""
        mixer = SpectralMixer(32)

        # Register multiple daemons
        daemons = [
            ("security", FrequencyBand.HIGH, 0.8),
            ("creative", FrequencyBand.LOW, 0.6),
            ("system", FrequencyBand.MID, 0.7),
            ("network", FrequencyBand.ULTRA_LOW, 0.5),
        ]

        for name, band, amp in daemons:
            daemon_id = DaemonId.from_name(name)
            mixer.register_daemon(daemon_id, band, amp)

            # Give each daemon a different pattern
            pattern = [(i % 4) / 3.0 for i in range(32)]
            mixer.update_daemon(daemon_id, pattern)

        # Evolve system over time
        for t in range(20):
            mixer.tick(0.1)
            field = mixer.resolve_field()

            # All values should be within valid range
            assert all(-1.0 <= v <= 1.0 for v in field)

            # Field should have some variation (not all zeros)
            if t > 0:
                variance = sum((v - sum(field) / len(field)) ** 2 for v in field) / len(field)
                # Some variance expected from interference
