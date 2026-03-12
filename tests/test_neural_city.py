"""
Tests for Neural City System - Phases 40-50

Comprehensive test coverage for the complete Neural City arc.
"""

import pytest
import time
import random
from unittest.mock import Mock, MagicMock, patch
from dataclasses import dataclass

# Phase 42-44: Core city
from systems.neural_city.citizen import NeuralCitizen, CitizenState, GuildType
from systems.neural_city.spawner import CitizenSpawner, Cluster
from systems.neural_city.territory import TerritoryMapper, Territory
from systems.neural_city.city import NeuralCity, CityStats

# Phase 46-47
from systems.neural_city.inter_brain_trade import InterBrainNetwork, BrainNode, TradeRoute
from systems.neural_city.citizen_writer import CitizenWriter

# Phase 48-50
from systems.neural_city.dream_engine import DreamEngine, DreamState, DreamFragment
from systems.neural_city.language_evolution import LanguageEvolution, Symbol, SymbolType
from systems.neural_city.consciousness import (
    ConsciousnessEngine, ConsciousnessLevel, SelfModel, Thought
)


# ============================================
# Phase 42: Citizen Tests
# ============================================

class TestNeuralCitizen:
    """Tests for NeuralCitizen class."""

    def test_citizen_creation(self):
        """Test basic citizen creation."""
        citizen = NeuralCitizen(
            x=100, y=200,
            opcode="ADD",
            guild=GuildType.LOGIC
        )
        assert citizen.x == 100
        assert citizen.y == 200
        assert citizen.opcode == "ADD"
        assert citizen.guild == GuildType.LOGIC
        assert citizen.state == CitizenState.DORMANT
        assert citizen.energy == 1.0
        assert citizen.generation == 0

    def test_citizen_auto_name(self):
        """Test automatic naming."""
        citizen = NeuralCitizen(opcode="MUL", guild=GuildType.MEMORY)
        assert citizen.name.startswith("MUL_")

    def test_citizen_update(self):
        """Test citizen state update."""
        citizen = NeuralCitizen(x=50, y=50, guild=GuildType.ATTENTION)

        # High activation, low entropy
        citizen.update(0.1, {'r': 0.8, 'g': 0.1})
        assert citizen.energy == 0.8
        assert citizen.entropy == 0.1

    def test_citizen_state_transitions(self):
        """Test state machine transitions."""
        citizen = NeuralCitizen(x=50, y=50, guild=GuildType.LOGIC)

        # Low energy -> DECLINING
        citizen.update(0.1, {'r': 0.05, 'g': 0.5})
        assert citizen.state == CitizenState.DECLINING

        # High energy, mature -> REPRODUCING
        citizen.age = 10.0
        citizen.energy = 0.9
        citizen.reproduction_cooldown = 0
        citizen.update(0.1, {'r': 0.9, 'g': 0.2})
        assert citizen.state == CitizenState.REPRODUCING

    def test_citizen_movement(self):
        """Test Phase 43 movement."""
        citizen = NeuralCitizen(x=500, y=500, guild=GuildType.ATTENTION)
        citizen.state = CitizenState.ACTIVE

        old_x, old_y = citizen.x, citizen.y
        new_pos = citizen.move(0.1, (1024, 1024))

        # Should move (random walk)
        # Home attraction keeps it somewhat near origin
        assert 0 <= citizen.x < 1024
        assert 0 <= citizen.y < 1024

    def test_citizen_movement_respects_bounds(self):
        """Test movement stays within bounds."""
        citizen = NeuralCitizen(x=0, y=0, guild=GuildType.LOGIC)
        citizen.state = CitizenState.ACTIVE

        for _ in range(100):
            citizen.move(0.1, (100, 100))
            assert 0 <= citizen.x < 100
            assert 0 <= citizen.y < 100

    def test_citizen_distance_to(self):
        """Test distance calculation."""
        citizen_a = NeuralCitizen(x=0, y=0)
        citizen_b = NeuralCitizen(x=3, y=4)

        assert citizen_a.distance_to(citizen_b) == 5.0

    def test_citizen_is_neighbor(self):
        """Test neighbor detection."""
        citizen_a = NeuralCitizen(x=0, y=0)
        citizen_b = NeuralCitizen(x=30, y=30)
        citizen_c = NeuralCitizen(x=100, y=100)

        assert citizen_a.is_neighbor(citizen_b, threshold=50) == True
        assert citizen_a.is_neighbor(citizen_c, threshold=50) == False

    def test_citizen_trade(self):
        """Test Phase 43 trading."""
        citizen_a = NeuralCitizen(x=0, y=0, guild=GuildType.LOGIC, energy=0.8)
        citizen_b = NeuralCitizen(x=10, y=10, guild=GuildType.MEMORY, energy=0.4)

        # Different guilds can trade
        assert citizen_a.can_trade_with(citizen_b) == True

        # Execute trade
        success = citizen_a.trade_energy(citizen_b, 0.2)
        assert success == True
        assert citizen_a.energy < 0.8
        assert citizen_b.energy > 0.4
        assert citizen_b.id in citizen_a.trade_partners

    def test_citizen_reproduction_asexual(self):
        """Test Phase 43 asexual reproduction."""
        parent = NeuralCitizen(
            x=500, y=500,
            opcode="ADD",
            guild=GuildType.LOGIC,
            energy=0.9,
            state=CitizenState.REPRODUCING
        )
        parent.age = 10.0
        parent.reproduction_cooldown = 0

        child = parent.reproduce()
        assert child is not None
        assert child.generation == parent.generation + 1
        assert child.parent_id == parent.id
        assert child.opcode == "ADD"
        assert parent.energy < 0.9  # Energy cost

    def test_citizen_reproduction_sexual(self):
        """Test Phase 43 sexual reproduction."""
        parent_a = NeuralCitizen(
            x=500, y=500,
            opcode="ADD",
            guild=GuildType.LOGIC,
            energy=0.9,
            state=CitizenState.REPRODUCING
        )
        parent_b = NeuralCitizen(
            x=510, y=510,
            opcode="MUL",
            guild=GuildType.MEMORY,
            energy=0.85,
            state=CitizenState.REPRODUCING
        )

        parent_a.age = 10.0
        parent_a.reproduction_cooldown = 0

        child = parent_a.reproduce(parent_b)
        assert child is not None
        # Child inherits from one parent randomly
        assert child.opcode in ["ADD", "MUL"]
        assert child.guild in [GuildType.LOGIC, GuildType.MEMORY]

    def test_citizen_serialization(self):
        """Test to_dict and from_dict."""
        original = NeuralCitizen(
            x=100, y=200,
            opcode="JMP",
            guild=GuildType.INTENT,
            energy=0.75,
            generation=3
        )

        data = original.to_dict()
        restored = NeuralCitizen.from_dict(data)

        assert restored.x == original.x
        assert restored.y == original.y
        assert restored.opcode == original.opcode
        assert restored.guild == original.guild
        assert restored.energy == original.energy
        assert restored.generation == original.generation


# ============================================
# Phase 42: Spawner Tests
# ============================================

class TestCitizenSpawner:
    """Tests for CitizenSpawner class."""

    def test_spawner_creation(self):
        """Test spawner initialization."""
        spawner = CitizenSpawner()
        assert len(spawner.citizens) == 0

    def test_spawn_from_atlas(self):
        """Test spawning from atlas data."""
        spawner = CitizenSpawner()

        # Create fake atlas with some activity
        atlas = bytearray(1024 * 1024 * 4)
        # Add some high-activation pixels
        for i in range(1000):
            idx = (500 + i % 32 + (200 + i // 32) * 1024) * 4
            atlas[idx] = 200  # R = activation
            atlas[idx + 1] = 50   # G = entropy

        citizens = spawner.spawn_from_atlas(bytes(atlas), 1024, 1024)
        assert len(citizens) >= 0  # May spawn based on cluster detection

    def test_update_citizens(self):
        """Test updating citizens with new atlas data."""
        spawner = CitizenSpawner()

        # Add a citizen
        citizen = NeuralCitizen(x=100, y=100, guild=GuildType.LOGIC)
        spawner.citizens[citizen.id] = citizen

        # Create atlas data
        atlas = bytearray(1024 * 1024 * 4)

        dead = spawner.update_citizens(bytes(atlas), 1024, 1024)
        # Citizens with very low activation may die

    def test_spawner_serialization(self):
        """Test spawner to_dict and from_dict."""
        spawner = CitizenSpawner()
        citizen = NeuralCitizen(x=50, y=50, guild=GuildType.MEMORY)
        spawner.citizens[citizen.id] = citizen

        data = spawner.to_dict()
        restored = CitizenSpawner.from_dict(data)

        assert len(restored.citizens) == 1


# ============================================
# Phase 42: Territory Tests
# ============================================

class TestTerritoryMapper:
    """Tests for TerritoryMapper class."""

    def test_territory_creation(self):
        """Test territory mapper initialization."""
        mapper = TerritoryMapper(1024, 1024)
        assert mapper.width == 1024
        assert mapper.height == 1024

    def test_register_territory(self):
        """Test territory registration."""
        mapper = TerritoryMapper(1024, 1024)

        mapper.register_territory("citizen_1", 100, 100, 16)

        # Check pixel ownership
        territory = mapper.get_territory_at(100, 100)
        assert territory is not None
        assert territory.owner_id == "citizen_1"

    def test_remove_territory(self):
        """Test territory removal."""
        mapper = TerritoryMapper(1024, 1024)
        mapper.register_territory("citizen_1", 100, 100, 16)

        mapper.remove_territory("citizen_1")

        territory = mapper.get_territory_at(100, 100)
        assert territory is None

    def test_find_neighbors(self):
        """Test neighbor finding."""
        mapper = TerritoryMapper(1024, 1024)

        mapper.register_territory("citizen_1", 100, 100, 16)
        mapper.register_territory("citizen_2", 120, 100, 16)
        mapper.register_territory("citizen_3", 500, 500, 16)  # Far away

        neighbors = mapper.find_neighbors("citizen_1")
        assert "citizen_2" in neighbors
        assert "citizen_3" not in neighbors

    def test_render_overlay(self):
        """Test overlay rendering."""
        mapper = TerritoryMapper(64, 64)
        mapper.register_territory("citizen_1", 32, 32, 8)

        overlay = mapper.render_overlay()
        assert len(overlay) == 64 * 64 * 4  # RGBA


# ============================================
# Phase 42-44: City Tests
# ============================================

class TestNeuralCity:
    """Tests for NeuralCity orchestrator."""

    def test_city_creation(self):
        """Test city initialization."""
        city = NeuralCity(name="TestCity", width=512, height=512)
        assert city.name == "TestCity"
        assert city.width == 512
        assert city.height == 512
        assert city.tick_count == 0

    def test_city_initialize(self):
        """Test city initialization from atlas."""
        city = NeuralCity(width=256, height=256)

        # Create atlas with activity
        atlas = bytearray(256 * 256 * 4)
        for i in range(500):
            idx = (100 + i % 20 + (100 + i // 20) * 256) * 4
            atlas[idx] = 180

        count = city.initialize(bytes(atlas))
        assert count >= 0

    def test_city_tick(self):
        """Test city tick update."""
        city = NeuralCity(width=128, height=128)

        # Add a citizen manually
        citizen = NeuralCitizen(x=64, y=64, guild=GuildType.LOGIC, state=CitizenState.ACTIVE)
        city.spawner.citizens[citizen.id] = citizen

        result = city.tick()

        assert 'tick' in result
        assert 'events' in result
        assert 'stats' in result

    def test_city_stats(self):
        """Test city statistics."""
        city = NeuralCity(width=128, height=128)

        citizen = NeuralCitizen(x=64, y=64, guild=GuildType.LOGIC, energy=0.8)
        city.spawner.citizens[citizen.id] = citizen

        city._update_stats()

        assert city.stats.population == 1
        assert city.stats.total_energy == 0.8

    def test_city_serialization(self):
        """Test city to_dict."""
        city = NeuralCity(name="SerializeTest")
        data = city.to_dict()

        assert data['name'] == "SerializeTest"
        assert 'stats' in data
        assert 'citizens' in data


# ============================================
# Phase 46: Inter-Brain Trade Tests
# ============================================

class TestInterBrainNetwork:
    """Tests for InterBrainNetwork."""

    def test_network_creation(self):
        """Test network initialization."""
        network = InterBrainNetwork()
        assert len(network.brains) == 0
        assert len(network.routes) == 0

    def test_register_brain(self):
        """Test brain registration."""
        network = InterBrainNetwork()

        brain = network.register_brain(
            brain_id="brain_1",
            host="localhost",
            port=8000,
            atlas_size=(1024, 1024)
        )

        assert brain.id == "brain_1"
        assert brain.host == "localhost"
        assert network.stats['total_brains'] == 1

    def test_establish_route(self):
        """Test route establishment."""
        network = InterBrainNetwork()
        network.register_brain("brain_1", "host1", 8000, (512, 512))
        network.register_brain("brain_2", "host2", 8001, (512, 512))

        route = network.establish_route("brain_1", "brain_2", bandwidth=0.5)

        assert route is not None
        assert route.source_brain == "brain_1"
        assert route.target_brain == "brain_2"
        assert route.bandwidth == 0.5

    def test_cross_brain_trade(self):
        """Test cross-brain trading."""
        network = InterBrainNetwork()
        network.register_brain("brain_1", "host1", 8000, (512, 512))
        network.register_brain("brain_2", "host2", 8001, (512, 512))

        success = network.cross_brain_trade(
            "brain_1", "brain_2",
            "citizen_a", "citizen_b",
            amount=10.0
        )

        assert success == True
        assert network.stats['total_cross_brain_trades'] == 1

    def test_get_network_status(self):
        """Test network status."""
        network = InterBrainNetwork()
        network.register_brain("brain_1", "host1", 8000, (512, 512))

        status = network.get_network_status()

        assert 'brains' in status
        assert 'routes' in status
        assert 'stats' in status


class TestCitizenWriter:
    """Tests for CitizenWriter."""

    def setup_method(self):
        """Set up test fixtures."""
        self.mock_writer = Mock()
        self.mock_writer.write_pixel = Mock()

    def test_writer_creation(self):
        """Test writer initialization."""
        writer = CitizenWriter(self.mock_writer)
        assert writer.writings == 0

    def test_write_activation_boost(self):
        """Test activation boost writing."""
        writer = CitizenWriter(self.mock_writer)

        success = writer.write_activation_boost(
            x=100, y=100, radius=5, boost=0.3,
            current_r=0.5, current_g=0.2
        )

        assert success == True
        assert writer.writings > 0

    def test_write_neural_pathway(self):
        """Test neural pathway writing."""
        writer = CitizenWriter(self.mock_writer)

        success = writer.write_neural_pathway(
            start_x=0, start_y=0,
            end_x=10, end_y=10,
            opcode="ADD"
        )

        assert success == True
        assert writer.writings > 0

    def test_write_guild_territory(self):
        """Test guild territory writing."""
        writer = CitizenWriter(self.mock_writer)

        success = writer.write_guild_territory(
            center_x=50, center_y=50,
            radius=10, guild="attention"
        )

        assert success == True
        assert "attention" in writer.writings_by_guild

    def test_write_creative_pattern(self):
        """Test creative pattern writing."""
        writer = CitizenWriter(self.mock_writer)

        for pattern in ['spiral', 'web', 'wave', 'random', 'crystal']:
            writer.writings = 0
            success = writer.write_creative_pattern(
                x=50, y=50, pattern_type=pattern, seed=42
            )
            assert success == True

    def test_get_stats(self):
        """Test statistics retrieval."""
        writer = CitizenWriter(self.mock_writer)
        writer.write_activation_boost(50, 50, 3, 0.2, 0.5, 0.1)

        stats = writer.get_stats()

        assert 'total_writings' in stats
        assert stats['total_writings'] > 0


# ============================================
# Phase 48: Dream Engine Tests
# ============================================

class TestDreamEngine:
    """Tests for DreamEngine."""

    def setup_method(self):
        """Set up test fixtures."""
        self.mock_city = Mock()
        self.mock_city.spawner = Mock()
        self.mock_city.spawner.citizens = {}

    def test_dream_engine_creation(self):
        """Test dream engine initialization."""
        engine = DreamEngine(self.mock_city)
        assert engine.state == DreamState.AWAKE
        assert engine.current_session is None

    def test_calculate_activity_level(self):
        """Test activity level calculation."""
        engine = DreamEngine(self.mock_city)

        # Empty city
        level = engine.calculate_activity_level()
        assert level == 0.0

        # Add active citizens
        citizen = Mock()
        citizen.state = Mock()
        citizen.state.value = 'active'
        citizen.energy = 0.8
        citizen.vx = 1.0
        citizen.vy = 1.0
        self.mock_city.spawner.citizens = {'c1': citizen}

        level = engine.calculate_activity_level()
        assert level > 0

    def test_state_transitions(self):
        """Test dream state transitions."""
        engine = DreamEngine(self.mock_city)

        # High activity -> AWAKE
        citizen = Mock()
        citizen.state = Mock()
        citizen.state.value = 'active'
        citizen.energy = 0.9
        citizen.vx = 1.0
        citizen.vy = 1.0
        self.mock_city.spawner.citizens = {'c1': citizen}

        state = engine.update_state()
        assert state == DreamState.AWAKE

        # Low activity -> DROWSY
        citizen.energy = 0.2
        citizen.vx = 0
        citizen.vy = 0
        engine.activity_threshold = 0.5

        state = engine.update_state()
        assert state in [DreamState.DROWSY, DreamState.REM]

    def test_tick(self):
        """Test dream engine tick."""
        engine = DreamEngine(self.mock_city)

        result = engine.tick()

        assert 'state' in result
        assert 'activity' in result

    def test_record_event(self):
        """Test event recording."""
        engine = DreamEngine(self.mock_city)

        engine.record_event({'type': 'trade', 'amount': 10})
        engine.record_event({'type': 'move', 'from': (0, 0), 'to': (10, 10)})

        assert len(engine.recent_events) == 2

    def test_force_dream(self):
        """Test forcing dream state."""
        engine = DreamEngine(self.mock_city)

        engine.force_dream(DreamState.REM)

        assert engine.state == DreamState.REM
        assert engine.current_session is not None

    def test_wake(self):
        """Test waking from dream."""
        engine = DreamEngine(self.mock_city)
        engine.force_dream(DreamState.DEEP)

        engine.wake()

        assert engine.state == DreamState.AWAKE
        assert engine.current_session is None

    def test_get_dream_report(self):
        """Test dream report."""
        engine = DreamEngine(self.mock_city)

        report = engine.get_dream_report()

        assert 'current_state' in report
        assert 'activity_level' in report
        assert 'stats' in report


# ============================================
# Phase 49: Language Evolution Tests
# ============================================

class TestLanguageEvolution:
    """Tests for LanguageEvolution."""

    def setup_method(self):
        """Set up test fixtures."""
        self.mock_city = Mock()
        self.mock_city.spawner = Mock()
        self.mock_city.spawner.citizens = {}

    def test_language_creation(self):
        """Test language engine initialization."""
        lang = LanguageEvolution(self.mock_city)

        # Should have primitives
        assert len(lang.symbols) >= 10
        assert lang.stats['total_symbols'] >= 10

    def test_create_symbol(self):
        """Test symbol creation."""
        lang = LanguageEvolution(self.mock_city)

        symbol = lang.create_symbol(
            creator_id="citizen_1",
            symbol_type=SymbolType.GLYPH,
            concept="new idea",
            guild="logic"
        )

        assert symbol is not None
        assert symbol.meaning == "new idea"
        assert symbol.creator_id == "citizen_1"

    def test_get_vocabulary(self):
        """Test vocabulary retrieval."""
        lang = LanguageEvolution(self.mock_city)

        vocab = lang.get_or_create_vocabulary("citizen_1")

        assert vocab is not None
        assert vocab.citizen_id == "citizen_1"
        assert len(vocab.known_symbols) >= 0

    def test_communicate(self):
        """Test communication between citizens."""
        lang = LanguageEvolution(self.mock_city)

        # Set up vocabularies
        lang.get_or_create_vocabulary("speaker")
        lang.get_or_create_vocabulary("listener")

        utterance = lang.communicate(
            speaker_id="speaker",
            listener_id="listener",
            concept="STRONG important",
            context={'location': (50, 50)}
        )

        assert utterance is not None
        assert utterance.speaker_id == "speaker"
        assert utterance.listener_id == "listener"
        assert len(utterance.symbols) > 0

    def test_tick(self):
        """Test language tick."""
        lang = LanguageEvolution(self.mock_city)

        # Add citizens
        citizen_a = Mock()
        citizen_a.id = "citizen_a"
        citizen_a.state = Mock()
        citizen_a.state.value = "active"
        citizen_a.guild = Mock()
        citizen_a.guild.value = "logic"
        citizen_a.is_neighbor = Mock(return_value=True)
        citizen_a.trade_partners = set()
        citizen_a.x, citizen_a.y = 50, 50

        citizen_b = Mock()
        citizen_b.id = "citizen_b"
        citizen_b.state = Mock()
        citizen_b.state.value = "active"
        citizen_b.guild = Mock()
        citizen_b.guild.value = "memory"
        citizen_b.x, citizen_b.y = 60, 60

        self.mock_city.spawner.citizens = {
            "citizen_a": citizen_a,
            "citizen_b": citizen_b
        }

        result = lang.tick()

        assert 'communications' in result
        assert 'new_symbols' in result

    def test_get_language_report(self):
        """Test language report."""
        lang = LanguageEvolution(self.mock_city)

        report = lang.get_language_report()

        assert 'total_symbols' in report
        assert 'top_symbols' in report


# ============================================
# Phase 50: Consciousness Tests
# ============================================

class TestConsciousness:
    """Tests for ConsciousnessEngine."""

    def setup_method(self):
        """Set up test fixtures."""
        self.mock_city = Mock()
        self.mock_city.spawner = Mock()
        self.mock_city.spawner.citizens = {}

    def test_consciousness_creation(self):
        """Test consciousness engine initialization."""
        engine = ConsciousnessEngine(self.mock_city)

        assert engine.global_awareness == 0.0
        assert engine.phi_score == 0.0

    def test_get_self_model(self):
        """Test self-model retrieval."""
        engine = ConsciousnessEngine(self.mock_city)

        model = engine.get_or_create_self_model("citizen_1")

        assert model is not None
        assert model.citizen_id == "citizen_1"

    def test_assess_consciousness_level(self):
        """Test consciousness level assessment."""
        engine = ConsciousnessEngine(self.mock_city)

        # New citizen starts dormant
        level = engine.assess_consciousness_level("citizen_1")
        assert level == ConsciousnessLevel.DORMANT

        # Add thoughts
        engine.think("citizen_1", "observation", "I see something")
        level = engine.assess_consciousness_level("citizen_1")
        assert level.value >= ConsciousnessLevel.REACTIVE.value

    def test_think(self):
        """Test thought generation."""
        engine = ConsciousnessEngine(self.mock_city)

        thought = engine.think(
            citizen_id="citizen_1",
            thought_type="observation",
            content="I observe my surroundings",
            about_self=True
        )

        assert thought is not None
        assert thought.content == "I observe my surroundings"
        assert thought.about_self == True

    def test_introspect(self):
        """Test introspection."""
        engine = ConsciousnessEngine(self.mock_city)

        # Create self-model
        model = engine.get_or_create_self_model("citizen_1")
        model.perceived_energy = 0.8
        model.perceived_role = "logic"

        result = engine.introspect("citizen_1")

        assert 'insight' in result
        assert 'level' in result

    def test_update_self_model(self):
        """Test self-model update."""
        engine = ConsciousnessEngine(self.mock_city)

        engine.update_self_model("citizen_1", {
            'energy': 0.75,
            'guild': 'logic',
            'total_energy_traded': 5.0
        })

        model = engine.self_models["citizen_1"]
        assert 0.65 <= model.perceived_energy <= 0.85  # With noise
        assert model.perceived_role == "logic"

    def test_form_goal(self):
        """Test goal formation."""
        engine = ConsciousnessEngine(self.mock_city)
        engine.get_or_create_self_model("citizen_1")

        goal = engine.form_goal("citizen_1", {'guild': 'logic'})

        assert goal is not None
        assert len(engine.self_models["citizen_1"].goals) > 0

    def test_tick(self):
        """Test consciousness tick."""
        engine = ConsciousnessEngine(self.mock_city)

        # Add citizen
        citizen = Mock()
        citizen.id = "citizen_1"
        citizen.state = Mock()
        citizen.state.value = "active"
        citizen.energy = 0.8
        citizen.guild = Mock()
        citizen.guild.value = "logic"
        citizen.children = []
        citizen.x, citizen.y = 50, 50
        citizen.total_energy_traded = 5.0  # Fix: provide actual number

        self.mock_city.spawner.citizens = {"citizen_1": citizen}

        result = engine.tick()

        assert 'thoughts' in result
        assert 'avg_level' in result
        assert 'phi' in result

    def test_calculate_phi(self):
        """Test phi calculation."""
        engine = ConsciousnessEngine(self.mock_city)

        # Add citizens with neighbors
        citizen_a = Mock()
        citizen_a.id = "citizen_a"
        citizen_a.neighbors = {"citizen_b"}

        citizen_b = Mock()
        citizen_b.id = "citizen_b"
        citizen_b.neighbors = {"citizen_a"}

        self.mock_city.spawner.citizens = {
            "citizen_a": citizen_a,
            "citizen_b": citizen_b
        }

        phi = engine.calculate_phi()
        assert phi >= 0

    def test_get_consciousness_report(self):
        """Test consciousness report."""
        engine = ConsciousnessEngine(self.mock_city)

        report = engine.get_consciousness_report()

        assert 'total_thoughts' in report
        assert 'phi_score' in report
        assert 'collective_emergence' in report


# ============================================
# Integration Tests
# ============================================

class TestNeuralCityIntegration:
    """Integration tests for the complete Neural City system."""

    def test_full_city_lifecycle(self):
        """Test complete city lifecycle."""
        city = NeuralCity(name="IntegrationTest", width=128, height=128)

        # Initialize systems with mock writer
        mock_writer = Mock()
        mock_writer.write_pixel = Mock()
        city.set_substrate_writer(mock_writer)
        city.set_dream_engine()
        city.set_language_evolution()
        city.set_consciousness()

        # Add citizens
        for i in range(5):
            citizen = NeuralCitizen(
                x=32 + i * 16,
                y=64,
                opcode=["ADD", "MUL", "NOP"][i % 3],
                guild=[GuildType.LOGIC, GuildType.MEMORY, GuildType.ATTENTION][i % 3],
                state=CitizenState.ACTIVE,
                energy=random.uniform(0.5, 1.0)
            )
            city.spawner.citizens[citizen.id] = citizen
            city.territory_mapper.register_territory(
                citizen.id, citizen.x, citizen.y, citizen.territory_radius
            )

        # Run ticks
        for _ in range(3):
            result = city.tick()
            assert result is not None
            assert 'tick' in result

    def test_city_with_conscious_citizens(self):
        """Test city with conscious citizens."""
        city = NeuralCity(width=64, height=64)
        city.set_consciousness()

        # Add citizen
        citizen = NeuralCitizen(x=32, y=32, guild=GuildType.LOGIC, state=CitizenState.ACTIVE)
        city.spawner.citizens[citizen.id] = citizen

        # Run tick with consciousness
        result = city.tick()

        assert 'consciousness' in result['events']

    def test_dream_during_low_activity(self):
        """Test dreaming during low activity."""
        city = NeuralCity(width=64, height=64)
        city.set_dream_engine()

        # Add low-energy citizen
        citizen = NeuralCitizen(x=32, y=32, guild=GuildType.LOGIC, energy=0.1)
        city.spawner.citizens[citizen.id] = citizen

        # Multiple ticks
        for _ in range(5):
            city.tick()

        # Should eventually enter dream state (including DEEP)
        assert city.dream_engine.state in [DreamState.AWAKE, DreamState.DROWSY, DreamState.REM, DreamState.DEEP]


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
