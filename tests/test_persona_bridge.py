"""
Unit tests for PersonaBridge

Tests the bridge between Rust compositor PERSONA_SHIFT events and PixelBrain
monologue injection.
"""

from pathlib import Path
from unittest.mock import AsyncMock, Mock, patch

import pytest

from systems.visual_shell.api.persona_bridge import (
    PERSONA_PATHS,
    PersonaBridge,
    PersonaInfo,
    PersonaShiftEvent,
    create_persona_bridge,
)


class TestPersonaShiftEvent:
    """Tests for PersonaShiftEvent dataclass."""

    def test_create_event(self):
        """Test creating a PersonaShiftEvent."""
        event = PersonaShiftEvent(
            persona_id="reality-checker",
            sector_id="validation_zone"
        )

        assert event.persona_id == "reality-checker"
        assert event.sector_id == "validation_zone"
        assert event.position == (0.0, 0.0)
        assert event.timestamp > 0  # Should be set to now

    def test_create_event_with_position(self):
        """Test creating event with position."""
        event = PersonaShiftEvent(
            persona_id="ai-engineer",
            sector_id="cognitive_hub",
            position=(100.0, 200.0)
        )

        assert event.position == (100.0, 200.0)

    def test_create_event_with_timestamp(self):
        """Test creating event with explicit timestamp."""
        event = PersonaShiftEvent(
            persona_id="security-engineer",
            sector_id="security_sector",
            timestamp=1234567890.0
        )

        assert event.timestamp == 1234567890.0


class TestPersonaInfo:
    """Tests for PersonaInfo dataclass."""

    def test_create_persona_info(self):
        """Test creating a PersonaInfo."""
        info = PersonaInfo(
            persona_id="reality-checker",
            name="Reality Checker",
            description="Stops fantasy approvals",
            color="red",
            mission="Stop Fantasy Approvals",
            rules="Default to NEEDS WORK"
        )

        assert info.persona_id == "reality-checker"
        assert info.name == "Reality Checker"
        assert info.description == "Stops fantasy approvals"
        assert info.color == "red"
        assert info.mission == "Stop Fantasy Approvals"
        assert info.rules == "Default to NEEDS WORK"


class TestPersonaBridge:
    """Tests for PersonaBridge class."""

    @pytest.fixture
    def visual_bridge_mock(self):
        """Create a mock VisualBridge."""
        mock = Mock()
        mock.broadcast_event = AsyncMock()
        return mock

    @pytest.fixture
    def persona_injector_mock(self):
        """Create a mock PersonaInjector."""
        mock = Mock()
        return mock

    @pytest.fixture
    def bridge(self, visual_bridge_mock, persona_injector_mock):
        """Create a PersonaBridge instance for testing."""
        return PersonaBridge(
            visual_bridge=visual_bridge_mock,
            persona_injector=persona_injector_mock
        )

    @pytest.fixture
    def sample_markdown(self):
        """Sample persona markdown content."""
        return """---
name: Reality Checker
description: Stops fantasy approvals
color: red
---

# Integration Agent Personality

You are **TestingRealityChecker**, a senior integration specialist.

## 🧠 Your Identity & Memory
- **Role**: Final integration testing
- **Personality**: Skeptical, thorough

## 🎯 Your Core Mission

### Stop Fantasy Approvals
- You're the last line of defense
- No more "98/100 ratings" for basic dark themes

## 🚨 Your Mandatory Process

### STEP 1: Reality Check Commands
- Verify what was actually built
- Cross-check claimed features

## 💭 Your Communication Style

- Reference evidence
- Challenge fantasy
"""

    def test_init(self, visual_bridge_mock, persona_injector_mock):
        """Test PersonaBridge initialization."""
        bridge = PersonaBridge(
            visual_bridge=visual_bridge_mock,
            persona_injector=persona_injector_mock
        )

        assert bridge.visual_bridge == visual_bridge_mock
        assert bridge.persona_injector == persona_injector_mock
        assert bridge.active_persona is None
        assert bridge.active_persona_info is None
        assert len(bridge.persona_cache) == 0

    def test_init_without_dependencies(self):
        """Test initialization without optional dependencies."""
        bridge = PersonaBridge()

        assert bridge.visual_bridge is None
        assert bridge.persona_injector is None

    @pytest.mark.asyncio
    async def test_handle_persona_shift_invalid_persona(self, bridge):
        """Test handling invalid persona_id raises ValueError."""
        event = PersonaShiftEvent(
            persona_id="non-existent-persona",
            sector_id="test_sector"
        )

        with pytest.raises(ValueError, match="Unknown persona_id"):
            await bridge.handle_persona_shift(event)

    @pytest.mark.asyncio
    async def test_handle_persona_shift_success(
        self, bridge, sample_markdown
    ):
        """Test successful persona shift handling."""
        # Mock file reading
        with patch('pathlib.Path.exists', return_value=True), \
             patch('builtins.open', create=True) as mock_open:
            mock_open.return_value.__enter__.return_value.read.return_value = sample_markdown

            event = PersonaShiftEvent(
                persona_id="reality-checker",
                sector_id="validation_zone"
            )

            result = await bridge.handle_persona_shift(event)

            # Verify result
            assert isinstance(result, PersonaInfo)
            assert result.persona_id == "reality-checker"
            assert result.name == "Reality Checker"
            assert result.description == "Stops fantasy approvals"
            assert result.color == "red"
            assert "Stop Fantasy Approvals" in result.mission
            assert "Reality Check Commands" in result.rules

            # Verify state updated
            assert bridge.active_persona == "reality-checker"
            assert bridge.active_persona_info == result

            # Verify frontend event emitted
            bridge.visual_bridge.broadcast_event.assert_called_once()
            call_args = bridge.visual_bridge.broadcast_event.call_args[0][0]
            assert call_args["type"] == "PERSONA_ACTIVE"
            assert call_args["persona_id"] == "reality-checker"
            assert call_args["name"] == "Reality Checker"

    @pytest.mark.asyncio
    async def test_handle_persona_shift_caching(
        self, bridge, sample_markdown
    ):
        """Test that persona markdown is cached after first load."""
        with patch('pathlib.Path.exists', return_value=True), \
             patch('builtins.open', create=True) as mock_open:
            mock_open.return_value.__enter__.return_value.read.return_value = sample_markdown

            event = PersonaShiftEvent(
                persona_id="reality-checker",
                sector_id="validation_zone"
            )

            # First call - should read file
            await bridge.handle_persona_shift(event)
            assert mock_open.call_count == 1

            # Second call - should use cache
            await bridge.handle_persona_shift(event)
            assert mock_open.call_count == 1  # No additional reads

    @pytest.mark.asyncio
    async def test_handle_persona_shift_file_not_found(self, bridge):
        """Test handling when persona file doesn't exist."""
        with patch('pathlib.Path.exists', return_value=False):
            event = PersonaShiftEvent(
                persona_id="reality-checker",
                sector_id="validation_zone"
            )

            with pytest.raises(FileNotFoundError, match="Persona file not found"):
                await bridge.handle_persona_shift(event)

    @pytest.mark.asyncio
    async def test_handle_persona_shift_without_visual_bridge(self, sample_markdown):
        """Test handling shift without VisualBridge (should not crash)."""
        bridge = PersonaBridge(visual_bridge=None)

        with patch('pathlib.Path.exists', return_value=True), \
             patch('builtins.open', create=True) as mock_open:
            mock_open.return_value.__enter__.return_value.read.return_value = sample_markdown

            event = PersonaShiftEvent(
                persona_id="reality-checker",
                sector_id="validation_zone"
            )

            # Should not raise
            result = await bridge.handle_persona_shift(event)
            assert result.persona_id == "reality-checker"

    @pytest.mark.asyncio
    async def test_handle_persona_shift_without_injector(self, sample_markdown):
        """Test handling shift without PersonaInjector (should not crash)."""
        bridge = PersonaBridge(persona_injector=None)

        with patch('pathlib.Path.exists', return_value=True), \
             patch('builtins.open', create=True) as mock_open:
            mock_open.return_value.__enter__.return_value.read.return_value = sample_markdown

            event = PersonaShiftEvent(
                persona_id="reality-checker",
                sector_id="validation_zone"
            )

            # Should not raise
            result = await bridge.handle_persona_shift(event)
            assert result.persona_id == "reality-checker"

    def test_extract_persona_info(self, bridge, sample_markdown):
        """Test extraction of PersonaInfo from markdown."""
        info = bridge._extract_persona_info("reality-checker", sample_markdown)

        assert info.persona_id == "reality-checker"
        assert info.name == "Reality Checker"
        assert info.description == "Stops fantasy approvals"
        assert info.color == "red"
        assert "Stop Fantasy Approvals" in info.mission
        assert "Reality Check Commands" in info.rules or "Identity & Memory" in info.rules

    def test_extract_persona_info_no_frontmatter(self, bridge):
        """Test extraction when markdown has no frontmatter."""
        markdown = """
# Simple Persona

You are a test persona.

## Core Mission
Test things thoroughly.
"""
        info = bridge._extract_persona_info("test-persona", markdown)

        assert info.persona_id == "test-persona"
        assert info.name == "Test Persona"  # Generated from ID
        assert info.description == ""
        assert info.color == "blue"  # Default
        assert "Test things thoroughly" in info.mission

    def test_extract_frontmatter_field(self, bridge):
        """Test extracting individual frontmatter fields."""
        frontmatter = """
name: Test Persona
description: A test persona
color: purple
tags: test, example
"""

        assert bridge._extract_frontmatter_field(frontmatter, "name") == "Test Persona"
        assert bridge._extract_frontmatter_field(frontmatter, "description") == "A test persona"
        assert bridge._extract_frontmatter_field(frontmatter, "color") == "purple"
        assert bridge._extract_frontmatter_field(frontmatter, "tags") == "test, example"
        assert bridge._extract_frontmatter_field(frontmatter, "missing") == ""

    def test_get_active_persona(self, bridge):
        """Test getting active persona info."""
        # Initially None
        assert bridge.get_active_persona() is None

        # After setting
        info = PersonaInfo(
            persona_id="test",
            name="Test Persona"
        )
        bridge.active_persona_info = info

        assert bridge.get_active_persona() == info

    def test_clear_cache(self, bridge):
        """Test clearing the persona cache."""
        bridge.persona_cache = {"test": "content"}
        bridge.clear_cache()

        assert len(bridge.persona_cache) == 0

    def test_get_available_personas(self, bridge):
        """Test getting list of available personas."""
        personas = bridge.get_available_personas()

        assert isinstance(personas, dict)
        assert "reality-checker" in personas
        assert "ai-engineer" in personas
        assert "security-engineer" in personas
        assert personas["reality-checker"] == "Reality Checker"

    @pytest.mark.asyncio
    async def test_load_persona_monologue(self, bridge, sample_markdown):
        """Test loading persona monologue from file."""
        with patch('pathlib.Path.exists', return_value=True), \
             patch('builtins.open', create=True) as mock_open:
            mock_open.return_value.__enter__.return_value.read.return_value = sample_markdown

            monologue = await bridge._load_persona_monologue("reality-checker")

            assert monologue == sample_markdown
            assert "reality-checker" in bridge.persona_cache

    @pytest.mark.asyncio
    async def test_load_persona_monologue_cached(self, bridge, sample_markdown):
        """Test that cached monologue is returned without file read."""
        # Pre-populate cache
        bridge.persona_cache["reality-checker"] = sample_markdown

        # Should not call open
        with patch('builtins.open', create=True) as mock_open:
            monologue = await bridge._load_persona_monologue("reality-checker")

            assert monologue == sample_markdown
            mock_open.assert_not_called()

    def test_persona_paths_complete(self):
        """Test that PERSONA_PATHS has expected entries."""
        # Engineering
        assert "ai-engineer" in PERSONA_PATHS
        assert "security-engineer" in PERSONA_PATHS
        assert "rapid-prototyper" in PERSONA_PATHS
        assert "backend-architect" in PERSONA_PATHS

        # Testing
        assert "reality-checker" in PERSONA_PATHS
        assert "performance-benchmarker" in PERSONA_PATHS

        # Spatial Computing
        assert "metal-engineer" in PERSONA_PATHS
        assert "xr-architect" in PERSONA_PATHS


class TestCreatePersonaBridge:
    """Tests for create_persona_bridge convenience function."""

    def test_create_with_all_dependencies(self):
        """Test creating bridge with all dependencies."""
        visual_bridge = Mock()
        persona_injector = Mock()

        bridge = create_persona_bridge(visual_bridge, persona_injector)

        assert isinstance(bridge, PersonaBridge)
        assert bridge.visual_bridge == visual_bridge
        assert bridge.persona_injector == persona_injector

    def test_create_without_dependencies(self):
        """Test creating bridge without dependencies."""
        bridge = create_persona_bridge()

        assert isinstance(bridge, PersonaBridge)
        assert bridge.visual_bridge is None
        assert bridge.persona_injector is None


class TestPersonaBridgeIntegration:
    """Integration tests for PersonaBridge."""

    @pytest.mark.asyncio
    @pytest.mark.integration
    async def test_load_real_persona_file(self):
        """Test loading a real persona file from agency-agents."""
        bridge = PersonaBridge()

        # Try to load the reality-checker persona
        event = PersonaShiftEvent(
            persona_id="reality-checker",
            sector_id="validation_zone"
        )

        try:
            result = await bridge.handle_persona_shift(event)

            assert result.persona_id == "reality-checker"
            assert result.name  # Should have extracted name
            assert "Reality" in result.name or "Checker" in result.name
            assert result.mission  # Should have extracted mission
        except FileNotFoundError:
            pytest.skip("Agency agents not available - run from project root")

    @pytest.mark.integration
    def test_agency_agents_directory_exists(self):
        """Test that agency-agents directory exists."""
        agency_root = Path("apps/agency-agents")
        if not agency_root.exists():
            pytest.skip("Agency agents not available - run from project root")

        # Check for expected divisions
        assert (agency_root / "engineering").exists() or \
               (agency_root / "testing").exists() or \
               (agency_root / "spatial-computing").exists()
