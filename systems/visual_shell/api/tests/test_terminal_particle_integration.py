#!/usr/bin/env python3
"""
Tests for Terminal Particle System Integration.

Verifies particle serialization, NEB event publishing, focus management,
scale clamping, and spatial indexing.
"""

import pytest
import json
from unittest.mock import MagicMock, patch
from dataclasses import dataclass, field
from typing import Dict, Any, Optional, Set, List


# === Python implementation mirrors for JS classes ===

@dataclass
class ParticlePosition:
    x: float = 100.0
    y: float = 100.0


@dataclass
class ParticleConfig:
    width: int = 800
    height: int = 500
    title: str = 'Terminal'
    ws_url: str = 'ws://localhost:8769/terminal'


class TerminalWindowParticleMock:
    """Python mock mirroring TerminalWindowParticle.js behavior."""

    PARTICLE_TYPE = 'terminal'
    MIN_SCALE = 0.25
    MAX_SCALE = 3.0

    def __init__(self, options: Optional[Dict[str, Any]] = None):
        options = options or {}

        # Particle identity
        self.particle_id = options.get('particleId') or f"terminal-{self._get_timestamp()}-{self._random_id()}"

        # Spatial properties
        self._position = ParticlePosition(
            x=options.get('x', 100),
            y=options.get('y', 100)
        )
        self._scale = self._clamp_scale(options.get('scale', 1.0))
        self._z_index = options.get('zIndex', 0)

        # Config
        config = options.get('config', {})
        self._config = ParticleConfig(
            width=config.get('width', options.get('width', 800)),
            height=config.get('height', options.get('height', 500)),
            title=config.get('title', options.get('title', 'Terminal')),
            ws_url=config.get('wsUrl', options.get('wsUrl', 'ws://localhost:8769/terminal'))
        )

        # NEB integration
        self._neb_socket = options.get('nebSocket')
        self._neb_enabled = options.get('nebEnabled', False)

        # Focus state
        self._focused = False

    def _get_timestamp(self) -> int:
        import time
        return int(time.time() * 1000)

    def _random_id(self) -> str:
        import random
        import string
        return ''.join(random.choices(string.ascii_lowercase + string.digits, k=9))

    def _clamp_scale(self, scale: float) -> float:
        """Clamp scale between MIN_SCALE and MAX_SCALE."""
        return max(self.MIN_SCALE, min(self.MAX_SCALE, scale))

    def serialize(self) -> Dict[str, Any]:
        """Serialize particle state for persistence."""
        return {
            'particleId': self.particle_id,
            'particleType': self.PARTICLE_TYPE,
            'position': {'x': self._position.x, 'y': self._position.y},
            'scale': self._scale,
            'zIndex': self._z_index,
            'config': {
                'width': self._config.width,
                'height': self._config.height,
                'title': self._config.title,
                'wsUrl': self._config.ws_url
            }
        }

    @classmethod
    def deserialize(cls, data: Dict[str, Any], neb_socket=None) -> 'TerminalWindowParticleMock':
        """Deserialize factory method."""
        position = data.get('position', {})
        config = data.get('config', {})

        return cls({
            'particleId': data.get('particleId'),
            'x': position.get('x', data.get('x', 100)),
            'y': position.get('y', data.get('y', 100)),
            'scale': data.get('scale', 1.0),
            'zIndex': data.get('zIndex', 0),
            'width': config.get('width', 800),
            'height': config.get('height', 500),
            'title': config.get('title', 'Terminal'),
            'wsUrl': config.get('wsUrl', 'ws://localhost:8769/terminal'),
            'nebSocket': neb_socket,
            'nebEnabled': bool(neb_socket)
        })

    def set_scale(self, scale: float):
        """Set particle scale with clamping."""
        self._scale = self._clamp_scale(scale)

    def set_position(self, x: float, y: float):
        """Set particle position."""
        self._position.x = x
        self._position.y = y

    def focus(self):
        """Focus this particle."""
        self._focused = True

    def blur(self):
        """Blur (unfocus) this particle."""
        self._focused = False

    @property
    def position(self) -> ParticlePosition:
        return ParticlePosition(x=self._position.x, y=self._position.y)

    @property
    def scale(self) -> float:
        return self._scale

    @property
    def z_index(self) -> int:
        return self._z_index

    @property
    def focused(self) -> bool:
        return self._focused


class ParticleManagerMock:
    """Python mock mirroring ParticleManager.js behavior."""

    SPATIAL_CELL_SIZE = 100
    NEB_TOPICS = [
        'terminal.particle.created',
        'terminal.particle.moved',
        'terminal.particle.focused',
        'terminal.particle.destroyed',
        'terminal.particle.resized',
        'terminal.particle.scaled'
    ]

    def __init__(self, options: Optional[Dict[str, Any]] = None):
        options = options or {}

        # Core particle storage
        self.particles: Dict[str, TerminalWindowParticleMock] = {}

        # Focus tracking
        self.focused_particle: Optional[TerminalWindowParticleMock] = None

        # Spatial index
        self.spatial_index: Dict[str, Set[str]] = {}

        # NEB integration
        self._neb_socket = options.get('nebSocket')

        # Published events (for testing)
        self._published_events: List[Dict[str, Any]] = []

        # Counter for generating IDs
        self._particle_counter = 0

    def create_particle(self, options: Optional[Dict[str, Any]] = None) -> TerminalWindowParticleMock:
        """Create a terminal window particle."""
        options = options or {}

        # Generate ID if not provided
        if not options.get('particleId'):
            self._particle_counter += 1
            options['particleId'] = f"terminal-{self._particle_counter}-{self._get_timestamp()}"

        # Create the particle
        particle = TerminalWindowParticleMock({
            **options,
            'nebSocket': self._neb_socket,
            'nebEnabled': bool(self._neb_socket)
        })

        # Add to tracking
        self.particles[particle.particle_id] = particle

        # Update spatial index
        self._add_to_spatial_index(particle)

        # Publish creation event
        self._publish_neb_event('terminal.particle.created', {
            'particleId': particle.particle_id,
            'particleType': particle.PARTICLE_TYPE,
            'position': {'x': particle.position.x, 'y': particle.position.y}
        })

        # Focus the new particle
        self.focus_particle(particle.particle_id)

        return particle

    def destroy_particle(self, particle_id: str) -> bool:
        """Destroy a particle by ID."""
        particle = self.particles.get(particle_id)
        if not particle:
            return False

        # Publish destruction event before removing
        self._publish_neb_event('terminal.particle.destroyed', {
            'particleId': particle.particle_id,
            'particleType': particle.PARTICLE_TYPE
        })

        # Remove from spatial index
        self._remove_from_spatial_index(particle)

        # Remove from tracking
        del self.particles[particle_id]

        # Update focus if this was focused
        if self.focused_particle == particle:
            self.focused_particle = None
            self._focus_next_available()

        return True

    def focus_particle(self, particle_id: str) -> bool:
        """Focus a specific particle."""
        particle = self.particles.get(particle_id)
        if not particle:
            return False

        # Blur current focused particle
        if self.focused_particle and self.focused_particle != particle:
            self.focused_particle.blur()

        # Set new focus
        self.focused_particle = particle
        particle.focus()

        return True

    def cycle_focus(self) -> Optional[TerminalWindowParticleMock]:
        """Cycle focus to next particle."""
        particles = list(self.particles.values())
        if not particles:
            return None

        if len(particles) == 1:
            self.focus_particle(particles[0].particle_id)
            return particles[0]

        # Find current index
        current_index = -1
        if self.focused_particle:
            for i, p in enumerate(particles):
                if p.particle_id == self.focused_particle.particle_id:
                    current_index = i
                    break

        # Move to next (wrap around)
        next_index = (current_index + 1) % len(particles)
        next_particle = particles[next_index]

        self.focus_particle(next_particle.particle_id)

        return next_particle

    def _get_spatial_key(self, x: float, y: float) -> str:
        """Get spatial key for a position."""
        cell_x = int(x // self.SPATIAL_CELL_SIZE)
        cell_y = int(y // self.SPATIAL_CELL_SIZE)
        return f"{cell_x},{cell_y}"

    def _add_to_spatial_index(self, particle: TerminalWindowParticleMock):
        """Add particle to spatial index."""
        pos = particle.position
        key = self._get_spatial_key(pos.x, pos.y)

        if key not in self.spatial_index:
            self.spatial_index[key] = set()
        self.spatial_index[key].add(particle.particle_id)

    def _remove_from_spatial_index(self, particle: TerminalWindowParticleMock):
        """Remove particle from spatial index."""
        pos = particle.position
        key = self._get_spatial_key(pos.x, pos.y)

        if key in self.spatial_index:
            self.spatial_index[key].discard(particle.particle_id)
            if not self.spatial_index[key]:
                del self.spatial_index[key]

    def _focus_next_available(self):
        """Focus next available particle."""
        particles = list(self.particles.values())
        if particles:
            self.focus_particle(particles[0].particle_id)

    def _publish_neb_event(self, topic: str, payload: Dict[str, Any]):
        """Publish event to NEB (stores for testing)."""
        import time
        event = {
            'topic': topic,
            'payload': {
                **payload,
                'timestamp': int(time.time() * 1000)
            }
        }
        self._published_events.append(event)

    def _get_timestamp(self) -> int:
        import time
        return int(time.time() * 1000)

    def serialize(self) -> Dict[str, Any]:
        """Serialize all particles for persistence."""
        import time
        return {
            'particles': [p.serialize() for p in self.particles.values()],
            'timestamp': int(time.time() * 1000),
            'version': 1
        }

    def deserialize(self, data: Dict[str, Any]):
        """Deserialize and restore particles."""
        if not data or 'particles' not in data:
            return

        # Clear existing
        self.particles.clear()
        self.spatial_index.clear()
        self.focused_particle = None

        # Restore particles
        for particle_data in data['particles']:
            try:
                particle = TerminalWindowParticleMock.deserialize(particle_data, self._neb_socket)
                self.particles[particle.particle_id] = particle
                self._add_to_spatial_index(particle)
            except Exception:
                pass

        # Focus first
        particles = list(self.particles.values())
        if particles:
            self.focus_particle(particles[0].particle_id)


# === Test Fixtures ===

@pytest.fixture
def particle():
    """Create a basic particle for testing."""
    return TerminalWindowParticleMock({
        'particleId': 'test-particle-1',
        'x': 100,
        'y': 200,
        'scale': 1.0,
        'zIndex': 5
    })


@pytest.fixture
def manager():
    """Create a particle manager for testing."""
    return ParticleManagerMock()


# === Test Class ===

class TestTerminalParticleIntegration:
    """Integration tests for the terminal particle system."""

    # === Serialization Tests ===

    def test_particle_serialization(self, particle):
        """Verify serialize() returns correct format."""
        serialized = particle.serialize()

        assert 'particleId' in serialized
        assert serialized['particleId'] == 'test-particle-1'
        assert 'particleType' in serialized
        assert serialized['particleType'] == 'terminal'
        assert 'position' in serialized
        assert serialized['position']['x'] == 100
        assert serialized['position']['y'] == 200
        assert 'scale' in serialized
        assert serialized['scale'] == 1.0
        assert 'zIndex' in serialized
        assert serialized['zIndex'] == 5
        assert 'config' in serialized

    def test_particle_deserialization(self):
        """Verify deserialize() creates valid particle."""
        data = {
            'particleId': 'restored-particle',
            'particleType': 'terminal',
            'position': {'x': 500, 'y': 600},
            'scale': 1.5,
            'zIndex': 10,
            'config': {
                'width': 1000,
                'height': 600,
                'title': 'Restored Terminal',
                'wsUrl': 'ws://localhost:9999/terminal'
            }
        }

        particle = TerminalWindowParticleMock.deserialize(data)

        assert particle.particle_id == 'restored-particle'
        assert particle.position.x == 500
        assert particle.position.y == 600
        assert particle.scale == 1.5
        assert particle.z_index == 10

    def test_particle_serialization_roundtrip(self, particle):
        """Verify serialization roundtrip preserves data."""
        serialized = particle.serialize()
        restored = TerminalWindowParticleMock.deserialize(serialized)

        assert restored.particle_id == particle.particle_id
        assert restored.position.x == particle.position.x
        assert restored.position.y == particle.position.y
        assert restored.scale == particle.scale
        assert restored.z_index == particle.z_index

    # === NEB Event Tests ===

    def test_neb_event_structure(self, manager):
        """Verify NEB events have correct structure."""
        manager.create_particle({'particleId': 'neb-test-1'})

        assert len(manager._published_events) > 0

        event = manager._published_events[0]
        assert 'topic' in event
        assert 'payload' in event
        assert 'timestamp' in event['payload']

    def test_neb_topics_coverage(self, manager):
        """Verify all required topics are defined."""
        required_topics = [
            'terminal.particle.created',
            'terminal.particle.moved',
            'terminal.particle.focused',
            'terminal.particle.destroyed'
        ]

        for topic in required_topics:
            assert topic in ParticleManagerMock.NEB_TOPICS

    def test_neb_created_event_on_create(self, manager):
        """Verify created event is published when particle is created."""
        manager.create_particle({'particleId': 'create-test-1', 'x': 250, 'y': 350})

        created_events = [e for e in manager._published_events if e['topic'] == 'terminal.particle.created']
        assert len(created_events) == 1

        event = created_events[0]
        assert event['payload']['particleId'] == 'create-test-1'
        assert event['payload']['particleType'] == 'terminal'
        assert event['payload']['position']['x'] == 250
        assert event['payload']['position']['y'] == 350

    def test_neb_destroyed_event_on_destroy(self, manager):
        """Verify destroyed event is published when particle is destroyed."""
        manager.create_particle({'particleId': 'destroy-test-1'})
        manager._published_events.clear()

        manager.destroy_particle('destroy-test-1')

        destroyed_events = [e for e in manager._published_events if e['topic'] == 'terminal.particle.destroyed']
        assert len(destroyed_events) == 1
        assert destroyed_events[0]['payload']['particleId'] == 'destroy-test-1'

    # === Scale Clamping Tests ===

    def test_scale_clamping_min(self, particle):
        """Verify scale is clamped to MIN_SCALE (0.25)."""
        particle.set_scale(0.1)  # Below minimum
        assert particle.scale == 0.25

        particle.set_scale(0.0)  # Way below
        assert particle.scale == 0.25

        particle.set_scale(-1.0)  # Negative
        assert particle.scale == 0.25

    def test_scale_clamping_max(self, particle):
        """Verify scale is clamped to MAX_SCALE (3.0)."""
        particle.set_scale(5.0)  # Above maximum
        assert particle.scale == 3.0

        particle.set_scale(10.0)  # Way above
        assert particle.scale == 3.0

    def test_scale_clamping_valid_range(self, particle):
        """Verify scale is preserved when within valid range."""
        particle.set_scale(0.5)
        assert particle.scale == 0.5

        particle.set_scale(1.0)
        assert particle.scale == 1.0

        particle.set_scale(2.5)
        assert particle.scale == 2.5

    def test_scale_clamping_at_boundaries(self, particle):
        """Verify scale at exact boundaries."""
        particle.set_scale(0.25)
        assert particle.scale == 0.25

        particle.set_scale(3.0)
        assert particle.scale == 3.0

    def test_constructor_scale_clamping(self):
        """Verify scale is clamped during construction."""
        # Below minimum
        p1 = TerminalWindowParticleMock({'scale': 0.1})
        assert p1.scale == 0.25

        # Above maximum
        p2 = TerminalWindowParticleMock({'scale': 5.0})
        assert p2.scale == 3.0

    # === Spatial Indexing Tests ===

    def test_spatial_key_generation(self, manager):
        """Verify spatial key generation."""
        # Origin cell
        assert manager._get_spatial_key(0, 0) == "0,0"
        assert manager._get_spatial_key(50, 50) == "0,0"
        assert manager._get_spatial_key(99, 99) == "0,0"

        # Adjacent cells
        assert manager._get_spatial_key(100, 0) == "1,0"
        assert manager._get_spatial_key(0, 100) == "0,1"
        assert manager._get_spatial_key(100, 100) == "1,1"

        # Negative coordinates
        assert manager._get_spatial_key(-50, -50) == "-1,-1"
        assert manager._get_spatial_key(-150, -50) == "-2,-1"

    def test_spatial_index_on_create(self, manager):
        """Verify particle is added to spatial index on creation."""
        manager.create_particle({'particleId': 'spatial-1', 'x': 150, 'y': 250})

        # 150/100=1, 250/100=2
        key = "1,2"
        assert key in manager.spatial_index
        assert 'spatial-1' in manager.spatial_index[key]

    def test_spatial_index_on_destroy(self, manager):
        """Verify particle is removed from spatial index on destruction."""
        manager.create_particle({'particleId': 'spatial-2', 'x': 200, 'y': 300})

        key = "2,3"
        assert key in manager.spatial_index

        manager.destroy_particle('spatial-2')
        assert key not in manager.spatial_index

    def test_spatial_index_multiple_particles_same_cell(self, manager):
        """Verify multiple particles in same cell."""
        manager.create_particle({'particleId': 'spatial-a', 'x': 50, 'y': 50})
        manager.create_particle({'particleId': 'spatial-b', 'x': 75, 'y': 75})
        manager.create_particle({'particleId': 'spatial-c', 'x': 99, 'y': 99})

        key = "0,0"
        assert len(manager.spatial_index[key]) == 3

    # === Particle Manager Lifecycle Tests ===

    def test_particle_manager_create(self, manager):
        """Verify particle creation."""
        particle = manager.create_particle({'particleId': 'lifecycle-1'})

        assert particle.particle_id == 'lifecycle-1'
        assert 'lifecycle-1' in manager.particles
        assert manager.focused_particle == particle

    def test_particle_manager_destroy(self, manager):
        """Verify particle destruction."""
        manager.create_particle({'particleId': 'lifecycle-2'})
        assert 'lifecycle-2' in manager.particles

        result = manager.destroy_particle('lifecycle-2')
        assert result is True
        assert 'lifecycle-2' not in manager.particles

    def test_particle_manager_destroy_nonexistent(self, manager):
        """Verify destroying nonexistent particle returns False."""
        result = manager.destroy_particle('does-not-exist')
        assert result is False

    def test_particle_manager_lifecycle(self, manager):
        """Verify full create/destroy cycle."""
        # Create multiple particles
        p1 = manager.create_particle({'particleId': 'cycle-1'})
        p2 = manager.create_particle({'particleId': 'cycle-2'})
        p3 = manager.create_particle({'particleId': 'cycle-3'})

        assert len(manager.particles) == 3

        # Destroy one
        manager.destroy_particle('cycle-2')
        assert len(manager.particles) == 2
        assert 'cycle-2' not in manager.particles

        # Destroy remaining
        manager.destroy_particle('cycle-1')
        manager.destroy_particle('cycle-3')
        assert len(manager.particles) == 0
        assert manager.focused_particle is None

    # === Focus Management Tests ===

    def test_focus_on_create(self, manager):
        """Verify new particle is focused on creation."""
        p1 = manager.create_particle({'particleId': 'focus-1'})
        assert manager.focused_particle == p1
        assert p1.focused is True

        p2 = manager.create_particle({'particleId': 'focus-2'})
        assert manager.focused_particle == p2
        assert p1.focused is False
        assert p2.focused is True

    def test_focus_cycle(self, manager):
        """Verify focus cycling."""
        p1 = manager.create_particle({'particleId': 'cycle-a'})
        p2 = manager.create_particle({'particleId': 'cycle-b'})
        p3 = manager.create_particle({'particleId': 'cycle-c'})

        # p3 is currently focused (last created)
        assert manager.focused_particle == p3

        # Cycle should go to p1 (first in order)
        manager.cycle_focus()
        assert manager.focused_particle == p1

        # Cycle to p2
        manager.cycle_focus()
        assert manager.focused_particle == p2

        # Cycle to p3
        manager.cycle_focus()
        assert manager.focused_particle == p3

        # Wrap around to p1
        manager.cycle_focus()
        assert manager.focused_particle == p1

    def test_focus_cycle_single_particle(self, manager):
        """Verify focus cycling with single particle."""
        p = manager.create_particle({'particleId': 'single'})

        result = manager.cycle_focus()
        assert result == p
        assert manager.focused_particle == p

    def test_focus_cycle_empty(self, manager):
        """Verify focus cycling with no particles."""
        result = manager.cycle_focus()
        assert result is None

    def test_focus_next_on_destroy(self, manager):
        """Verify next particle is focused when focused one is destroyed."""
        p1 = manager.create_particle({'particleId': 'next-1'})
        p2 = manager.create_particle({'particleId': 'next-2'})
        p3 = manager.create_particle({'particleId': 'next-3'})

        # Focus p2
        manager.focus_particle('next-2')
        assert manager.focused_particle.particle_id == 'next-2'

        # Destroy focused
        manager.destroy_particle('next-2')

        # Should have focused another
        assert manager.focused_particle is not None

    # === Layout Persistence Tests ===

    def test_serialize_layout(self, manager):
        """Verify layout serialization."""
        manager.create_particle({'particleId': 'persist-1', 'x': 100, 'y': 200})
        manager.create_particle({'particleId': 'persist-2', 'x': 300, 'y': 400})

        data = manager.serialize()

        assert 'particles' in data
        assert 'timestamp' in data
        assert 'version' in data
        assert len(data['particles']) == 2

    def test_deserialize_layout(self, manager):
        """Verify layout deserialization."""
        data = {
            'particles': [
                {
                    'particleId': 'restore-1',
                    'particleType': 'terminal',
                    'position': {'x': 150, 'y': 250},
                    'scale': 1.0,
                    'zIndex': 0,
                    'config': {'width': 800, 'height': 500}
                },
                {
                    'particleId': 'restore-2',
                    'particleType': 'terminal',
                    'position': {'x': 350, 'y': 450},
                    'scale': 1.5,
                    'zIndex': 1,
                    'config': {'width': 1000, 'height': 600}
                }
            ],
            'timestamp': 1234567890,
            'version': 1
        }

        manager.deserialize(data)

        assert len(manager.particles) == 2
        assert 'restore-1' in manager.particles
        assert 'restore-2' in manager.particles

    def test_layout_persistence_roundtrip(self, manager):
        """Verify layout persistence roundtrip."""
        # Create particles
        manager.create_particle({'particleId': 'roundtrip-1', 'x': 111, 'y': 222, 'scale': 1.2})
        manager.create_particle({'particleId': 'roundtrip-2', 'x': 333, 'y': 444, 'scale': 0.8})

        # Serialize
        serialized = manager.serialize()

        # Create new manager and deserialize
        new_manager = ParticleManagerMock()
        new_manager.deserialize(serialized)

        # Verify
        assert len(new_manager.particles) == 2
        p1 = new_manager.particles['roundtrip-1']
        assert p1.position.x == 111
        assert p1.position.y == 222
        assert p1.scale == 1.2

    def test_deserialize_invalid_data(self, manager):
        """Verify handling of invalid deserialize data."""
        # None
        manager.deserialize(None)
        assert len(manager.particles) == 0

        # Empty dict
        manager.deserialize({})
        assert len(manager.particles) == 0

        # Missing particles key
        manager.deserialize({'timestamp': 123, 'version': 1})
        assert len(manager.particles) == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
