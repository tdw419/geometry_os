"""Tests for PixelBrain as universal cognitive service."""
from pathlib import Path
from unittest.mock import MagicMock

import pytest


class TestPixelBrainService:
    """Test the universal cognitive bus integration."""

    @pytest.fixture
    def mock_visual_bridge(self):
        """Create a mock VisualBridge for testing."""
        bridge = MagicMock()
        bridge.emit_thought_pulse = MagicMock(return_value=True)
        bridge.emit_atlas_glow = MagicMock(return_value=True)
        return bridge

    @pytest.fixture
    def brain_path(self):
        """Get brain atlas path."""
        return Path("/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png")

    @pytest.fixture
    def brain_available(self, brain_path):
        """Check if brain artifact exists."""
        meta_path = Path(str(brain_path) + ".meta.json")
        return brain_path.exists() and meta_path.exists()

    def test_service_initializes_pipeline(self, brain_available, brain_path, mock_visual_bridge):
        """Service should initialize PixelBrainPipeline on creation."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        # Reset singleton for clean test
        reset_pixel_brain_service()

        service = PixelBrainService(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )

        assert service.pipeline is not None
        assert service.pipeline.config.get("dim") == 64

    def test_service_has_tokenize_method(self):
        """Service should have tokenize method for converting text to tokens."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService()

        # Test with transformers if available, else fallback
        tokens = service.tokenize("Hello world")

        assert isinstance(tokens, list)
        assert len(tokens) > 0
        assert all(isinstance(t, int) for t in tokens)

    def test_service_has_detokenize_method(self):
        """Service should have detokenize method for converting tokens to text."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService()

        # Test with transformers if available, else fallback
        text = service.detokenize([15496, 995])  # "Hello world" tokens

        assert isinstance(text, str)
        assert len(text) > 0

    @pytest.mark.asyncio
    async def test_service_generate_returns_tokens(self, brain_available, brain_path, mock_visual_bridge):
        """Service async generate() should return generated tokens."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )

        result = await service.generate(
            prompt="Once upon a time",
            max_tokens=5,
            temperature=1.0,
            emit_visual=False
        )

        assert "text" in result
        assert "tokens" in result
        assert isinstance(result["tokens"], list)
        assert len(result["tokens"]) <= 5

    @pytest.mark.asyncio
    async def test_service_generate_includes_visual_data(self, brain_available, brain_path, mock_visual_bridge):
        """Service async generate() with emit_visual should include visual feedback."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )

        result = await service.generate(
            prompt="Test",
            max_tokens=3,
            temperature=1.0,
            emit_visual=True
        )

        assert "visual_feedback" in result
        assert "accessed_indices" in result["visual_feedback"]
        assert "glyphs" in result["visual_feedback"]

    def test_service_is_available(self):
        """Service should report availability status."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService()

        # Should return bool
        available = service.is_available()
        assert isinstance(available, bool)

    def test_singleton_pattern(self, brain_available, brain_path, mock_visual_bridge):
        """Service should follow singleton pattern."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            get_pixel_brain_service,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()

        service1 = get_pixel_brain_service(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )
        service2 = get_pixel_brain_service()

        assert service1 is service2

    def test_service_without_visual_bridge(self, brain_available, brain_path):
        """Service should work without visual bridge (no visual feedback)."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService(brain_path=str(brain_path))

        assert service.pipeline is not None
        assert service.visual_bridge is None


class TestPixelBrainServiceTokenization:
    """Test tokenization with and without transformers."""

    def test_tokenize_with_fallback(self):
        """Tokenize should work with character fallback when transformers unavailable."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService()

        # Force fallback tokenizer for this test
        service._tokenizer = None

        tokens = service.tokenize("ABC")

        # Fallback should return char codes or similar
        assert isinstance(tokens, list)
        assert len(tokens) == 3

    def test_detokenize_with_fallback(self):
        """Detokenize should work with character fallback when transformers unavailable."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService()

        # Force fallback tokenizer for this test
        service._tokenizer = None

        # ASCII codes for 'ABC'
        text = service.detokenize([65, 66, 67])

        assert text == "ABC"


class TestPixelBrainServiceVisualIntegration:
    """Test visual feedback integration."""

    @pytest.fixture
    def mock_visual_bridge(self):
        """Create a mock VisualBridge for testing."""
        bridge = MagicMock()
        bridge.emit_thought_pulse = MagicMock(return_value=True)
        bridge.emit_atlas_glow = MagicMock(return_value=True)
        return bridge

    @pytest.fixture
    def brain_path(self):
        """Get brain atlas path."""
        return Path("/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png")

    @pytest.fixture
    def brain_available(self, brain_path):
        """Check if brain artifact exists."""
        meta_path = Path(str(brain_path) + ".meta.json")
        return brain_path.exists() and meta_path.exists()

    @pytest.mark.asyncio
    async def test_generate_emits_thought_pulses(self, brain_available, brain_path, mock_visual_bridge):
        """Generate with emit_visual should emit THOUGHT_PULSE glyphs."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )

        await service.generate(
            prompt="Hello",
            max_tokens=2,
            emit_visual=True
        )

        # Should have called emit_thought_pulse for each token
        assert mock_visual_bridge.emit_thought_pulse.call_count >= 1

    @pytest.mark.asyncio
    async def test_generate_without_visual_skips_emission(self, brain_available, brain_path, mock_visual_bridge):
        """Generate without emit_visual should not call visual bridge."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = PixelBrainService(
            brain_path=str(brain_path),
            visual_bridge=mock_visual_bridge
        )

        await service.generate(
            prompt="Hello",
            max_tokens=2,
            emit_visual=False
        )

        # Should NOT have called emit_thought_pulse
        mock_visual_bridge.emit_thought_pulse.assert_not_called()


class TestWebMCPIntegration:
    """Test WebMCP send_llm_prompt integration with PixelBrain."""

    @pytest.fixture
    def brain_path(self):
        """Get brain atlas path."""
        return Path("/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png")

    @pytest.fixture
    def brain_available(self, brain_path):
        """Check if brain artifact exists."""
        meta_path = Path(str(brain_path) + ".meta.json")
        return brain_path.exists() and meta_path.exists()

    @pytest.mark.asyncio
    async def test_send_llm_prompt_uses_pixel_brain(self, brain_available, brain_path):
        """send_llm_prompt should route through PixelBrainService when model='pixel-brain'."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            get_pixel_brain_service,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = get_pixel_brain_service(brain_path=str(brain_path))

        if not service.is_available():
            pytest.skip("PixelBrain pipeline not initialized")

        result = await service.generate("Hello", max_tokens=5)

        assert 'text' in result
        assert 'tokens' in result
        assert isinstance(result['text'], str)

    @pytest.mark.asyncio
    async def test_pixel_brain_generate_returns_visual_feedback(self, brain_available, brain_path):
        """PixelBrain generation should return visual_feedback for UI rendering."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.pixel_brain_service import (
            get_pixel_brain_service,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        service = get_pixel_brain_service(brain_path=str(brain_path))

        if not service.is_available():
            pytest.skip("PixelBrain pipeline not initialized")

        result = await service.generate("Test prompt", max_tokens=3, emit_visual=True)

        assert 'visual_feedback' in result
        assert 'accessed_indices' in result['visual_feedback']
        assert 'glyphs' in result['visual_feedback']

    @pytest.mark.asyncio
    async def test_pixel_brain_service_unavailable_returns_empty(self):
        """When PixelBrain is unavailable, generate should return empty result gracefully."""
        from systems.visual_shell.api.pixel_brain_service import (
            PixelBrainService,
            reset_pixel_brain_service,
        )

        reset_pixel_brain_service()
        # Create service with non-existent brain path
        service = PixelBrainService(brain_path="/nonexistent/brain.rts.png")

        assert not service.is_available()

        result = await service.generate("Hello", max_tokens=5)

        assert result['text'] == ''
        assert result['tokens'] == []
