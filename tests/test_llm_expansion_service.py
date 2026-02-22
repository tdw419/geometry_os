# tests/test_llm_expansion_service.py
"""
Unit tests for LLMExpansionService.

Tests cover:
- Service initialization with defaults
- Expansion result generation
- Fallback behavior on errors
- Confidence calculation boundaries
"""
import pytest
import sys
import os
from unittest.mock import patch, MagicMock, AsyncMock

# Ensure the project root is in the path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from systems.evolution_daemon.wordpress.llm_expansion_service import (
    LLMExpansionService,
    LLMExpansionConfig,
    ExpansionResult,
    create_service
)


class TestServiceInitialization:
    """Tests for LLMExpansionService initialization."""

    def test_service_initializes_with_defaults(self):
        """Service should initialize with default config when none provided."""
        service = LLMExpansionService()

        assert service.config is not None
        assert service.config.model == "glm-4-plus"
        assert service.config.temperature == 0.7
        assert service.config.timeout == 30
        assert service.config.max_tokens == 2048
        assert service.config.llm_enabled is False
        assert service.config.fallback_confidence == 0.3

    def test_service_accepts_custom_config(self):
        """Service should accept custom configuration."""
        config = LLMExpansionConfig(
            model="custom-model",
            temperature=0.5,
            timeout=60,
            llm_enabled=True
        )
        service = LLMExpansionService(config)

        assert service.config.model == "custom-model"
        assert service.config.temperature == 0.5
        assert service.config.timeout == 60
        assert service.config.llm_enabled is True

    def test_create_service_convenience_function(self):
        """create_service() should create service with specified llm_enabled."""
        service_disabled = create_service(llm_enabled=False)
        assert service_disabled.config.llm_enabled is False

        service_enabled = create_service(llm_enabled=True)
        assert service_enabled.config.llm_enabled is True


class TestExpansionResultGeneration:
    """Tests for ExpansionResult generation."""

    def test_service_generates_expansion_result(self):
        """expand() should return ExpansionResult with all expected fields."""
        service = LLMExpansionService()

        result = service.expand(
            post_id=42,
            title="Test Post Title",
            content="This is original content.",
            context="Additional context info"
        )

        # Verify all ExpansionResult fields are present and valid
        assert isinstance(result, ExpansionResult)
        assert result.post_id == 42
        assert isinstance(result.content, str)
        assert len(result.content) > 0
        assert isinstance(result.confidence, float)
        assert 0.0 <= result.confidence <= 1.0
        assert isinstance(result.model_used, str)
        assert isinstance(result.fallback_used, bool)
        assert isinstance(result.original_length, int)
        assert isinstance(result.expanded_length, int)
        assert isinstance(result.expansion_ratio, float)

    def test_fallback_expansion_includes_original_content(self):
        """Fallback expansion should include original content."""
        service = LLMExpansionService()
        original = "Original test content here."

        result = service.expand(
            post_id=1,
            title="Test",
            content=original
        )

        assert original in result.content
        assert result.fallback_used is True

    def test_fallback_expansion_adds_context_section(self):
        """Fallback should add 'Additional Context' section."""
        service = LLMExpansionService()

        result = service.expand(
            post_id=1,
            title="Test Title",
            content="Short content."
        )

        assert "## Additional Context" in result.content
        assert result.fallback_used is True


class TestFallbackBehavior:
    """Tests for fallback behavior when LLM fails."""

    def test_service_falls_back_on_error_with_invalid_api_key(self):
        """Service should fall back to template when ZAIBridge raises error."""
        config = LLMExpansionConfig(llm_enabled=True)
        service = LLMExpansionService(config)

        # Mock the bridge to raise an exception
        with patch.object(service, '_get_bridge') as mock_bridge:
            mock_bridge.return_value = None  # Simulate bridge unavailable

            result = service.expand(
                post_id=1,
                title="Test",
                content="Original content for testing."
            )

            # Should fall back to template
            assert result.fallback_used is True
            assert result.model_used == "template"
            assert result.confidence == 0.3

    def test_service_falls_back_on_llm_exception(self):
        """Service should fall back when LLM call raises exception."""
        config = LLMExpansionConfig(llm_enabled=True)
        service = LLMExpansionService(config)

        # Mock bridge that raises exception
        mock_bridge = MagicMock()
        mock_bridge.chat = AsyncMock(side_effect=Exception("API Error"))

        with patch.object(service, '_get_bridge', return_value=mock_bridge):
            result = service.expand(
                post_id=1,
                title="Test",
                content="Content"
            )

            assert result.fallback_used is True
            assert result.model_used == "template"

    def test_service_falls_back_on_mock_response(self):
        """Service should fall back when receiving mock response."""
        config = LLMExpansionConfig(llm_enabled=True)
        service = LLMExpansionService(config)

        # Mock bridge that returns mock response
        mock_bridge = MagicMock()
        mock_bridge.chat = AsyncMock(return_value="[Mock response from LLM]")

        with patch.object(service, '_get_bridge', return_value=mock_bridge):
            result = service.expand(
                post_id=1,
                title="Test",
                content="Content"
            )

            assert result.fallback_used is True

    def test_llm_disabled_uses_template(self):
        """When llm_enabled=False, should always use template."""
        config = LLMExpansionConfig(llm_enabled=False)
        service = LLMExpansionService(config)

        result = service.expand(
            post_id=1,
            title="Test",
            content="Content"
        )

        assert result.fallback_used is True
        assert result.model_used == "template"
        assert result.confidence == 0.3


class TestConfidenceCalculation:
    """Tests for confidence score calculation."""

    def test_confidence_for_fallback_is_base_value(self):
        """Fallback expansion should have fallback_confidence (0.3)."""
        service = LLMExpansionService()

        result = service.expand(
            post_id=1,
            title="Test",
            content="Content"
        )

        assert result.confidence == 0.3

    def test_confidence_base_for_llm(self):
        """LLM expansion should have base confidence of 0.5."""
        service = LLMExpansionService()
        # Content short enough that ratio bonus won't apply
        original_length = 10

        # Test the internal calculation with no structure bonus
        confidence = service._calculate_confidence(
            original_length=original_length,
            expanded_length=10,  # 1x ratio - no bonus
            expanded_content="No structure here"
        )

        # Base only (no ratio bonus, no structure bonus)
        assert confidence == 0.5

    def test_confidence_with_perfect_ratio(self):
        """Confidence should increase for 2-3x expansion ratio."""
        service = LLMExpansionService()

        # 2.5x ratio (in perfect range) with no structure
        confidence = service._calculate_confidence(
            original_length=100,
            expanded_length=250,  # 2.5x ratio
            expanded_content="Plain content without structure markers"
        )

        # Base 0.5 + ratio bonus 0.3 = 0.8
        assert confidence == 0.8

    def test_confidence_with_acceptable_ratio(self):
        """Confidence should increase slightly for 1.5-4x ratio."""
        service = LLMExpansionService()

        # 1.6x ratio (acceptable range) with no structure
        confidence = service._calculate_confidence(
            original_length=100,
            expanded_length=160,  # 1.6x ratio
            expanded_content="Plain content"
        )

        # Base 0.5 + partial ratio bonus 0.15 = 0.65
        assert confidence == 0.65

    def test_confidence_with_structure_bonus(self):
        """Confidence should increase for headings and bullets."""
        service = LLMExpansionService()

        content_with_structure = """## Main Section

Content here.

### Subsection

- Point one
- Point two
- Point three
"""

        confidence = service._calculate_confidence(
            original_length=100,
            expanded_length=100,  # 1x ratio - no ratio bonus
            expanded_content=content_with_structure
        )

        # Base 0.5 + heading bonus 0.1 + bullet bonus 0.1 = 0.7
        assert confidence == 0.7

    def test_confidence_caps_at_0_95(self):
        """Confidence should cap at 0.95 maximum."""
        service = LLMExpansionService()

        content_with_everything = """## Section One

- Point one
- Point two
- Point three

## Section Two

- Point four
- Point five
"""

        confidence = service._calculate_confidence(
            original_length=100,
            expanded_length=250,  # Perfect ratio
            expanded_content=content_with_everything
        )

        # Would be 0.5 + 0.3 + 0.2 = 1.0, but caps at 0.95
        assert confidence == 0.95

    def test_confidence_in_valid_range(self):
        """All confidence scores should be in valid range [0.0, 1.0]."""
        service = LLMExpansionService()

        # Test various scenarios
        test_cases = [
            (10, 10, "No structure"),
            (100, 250, "With ## heading"),
            (50, 200, "- bullet\n- points\n- here\n## heading"),
            (1, 1000, "### Big expansion"),
        ]

        for orig_len, exp_len, content in test_cases:
            confidence = service._calculate_confidence(orig_len, exp_len, content)
            assert 0.0 <= confidence <= 1.0, f"Confidence {confidence} out of range for {content}"


class TestExpansionMetrics:
    """Tests for expansion metrics tracking."""

    def test_result_tracks_lengths(self):
        """Result should track original and expanded lengths via _extract_text."""
        service = LLMExpansionService()
        original = "Short."

        result = service.expand(
            post_id=1,
            title="Test",
            content=original
        )

        # original_length is extracted text length
        assert result.original_length == len(original)
        # expanded_length is also extracted text length (may differ from raw content length)
        assert result.expanded_length > result.original_length
        # Raw content should be longer than extracted text
        assert len(result.content) >= result.expanded_length

    def test_result_tracks_expansion_ratio(self):
        """Result should calculate expansion ratio correctly."""
        service = LLMExpansionService()
        original = "A" * 100

        result = service.expand(
            post_id=1,
            title="Test",
            content=original
        )

        expected_ratio = result.expanded_length / max(result.original_length, 1)
        assert abs(result.expansion_ratio - expected_ratio) < 0.01

    def test_zero_original_length_handles_gracefully(self):
        """Empty original content should not cause division by zero."""
        service = LLMExpansionService()

        result = service.expand(
            post_id=1,
            title="Test",
            content=""  # Empty original
        )

        # Should not crash and ratio should be valid
        assert result.expansion_ratio >= 0.0
        assert result.original_length == 0
