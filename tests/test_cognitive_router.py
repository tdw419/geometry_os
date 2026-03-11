"""
Tests for Unified Cognitive Router.
"""

from unittest.mock import AsyncMock, Mock, patch

import pytest


class TestCognitiveRouter:
    """Tests for the cognitive routing layer."""

    @pytest.mark.asyncio
    async def test_route_uses_pixelbrain_by_default(self):
        """Router should use PixelBrain by default."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain') as mock_pb:
            mock_backend = Mock()
            mock_backend.generate = AsyncMock(return_value="Generated text")
            mock_pb.return_value = mock_backend

            result = await router.generate("Hello")

            mock_pb.assert_called_once()
            assert result == "Generated text"

    @pytest.mark.asyncio
    async def test_route_falls_back_on_pixelbrain_failure(self):
        """Router should fall back when PixelBrain fails."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain', side_effect=Exception("PB failed")):
            with patch.object(router, '_get_lmstudio') as mock_lms:
                mock_backend = Mock()
                mock_backend.generate = AsyncMock(return_value="Fallback text")
                mock_lms.return_value = mock_backend

                result = await router.generate("Hello", allow_fallback=True)

                mock_lms.assert_called_once()
                assert result == "Fallback text"

    @pytest.mark.asyncio
    async def test_route_returns_error_when_no_engine_available(self):
        """Router should return clear error when no engine available."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain', side_effect=Exception("PB unavailable")):
            with patch.object(router, '_get_lmstudio', side_effect=Exception("LMS unavailable")):
                result = await router.generate("Hello", allow_fallback=True)

                assert "error" in result.lower() or "unavailable" in result.lower()

    @pytest.mark.asyncio
    async def test_no_fallback_when_disabled(self):
        """Should not fallback when allow_fallback=False."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain', side_effect=Exception("PB failed")):
            with patch.object(router, '_get_lmstudio') as mock_lms:
                mock_lms.return_value = Mock()

                result = await router.generate("Hello", allow_fallback=False)

                # Should not have tried fallback
                mock_lms.assert_not_called()
                assert "error" in result.lower()

    @pytest.mark.asyncio
    async def test_can_specify_engine(self):
        """Should be able to specify specific engine."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_lmstudio') as mock_lms:
            mock_backend = Mock()
            mock_backend.generate = AsyncMock(return_value="LM Studio text")
            mock_lms.return_value = mock_backend

            result = await router.generate("Hello", engine="lmstudio")

            mock_lms.assert_called_once()
            assert result == "LM Studio text"

    @pytest.mark.asyncio
    async def test_passes_generation_params(self):
        """Should pass max_tokens and temperature to backend."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain') as mock_pb:
            mock_backend = Mock()
            mock_backend.generate = AsyncMock(return_value="Generated")
            mock_pb.return_value = mock_backend

            await router.generate("Hello", max_tokens=50, temperature=0.5)

            mock_backend.generate.assert_called_once()
            call_kwargs = mock_backend.generate.call_args[1]
            assert call_kwargs['max_tokens'] == 50
            assert call_kwargs['temperature'] == 0.5

    def test_singleton_pattern(self):
        """get_cognitive_router should return singleton."""
        from systems.cognitive.cognitive_router import get_cognitive_router, reset_cognitive_router

        reset_cognitive_router()
        router1 = get_cognitive_router()
        router2 = get_cognitive_router()

        assert router1 is router2

    def test_backend_caching(self):
        """Router should cache backends."""
        from systems.cognitive.cognitive_router import CognitiveRouter, reset_cognitive_router

        reset_cognitive_router()
        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain') as mock_pb:
            mock_pb.return_value = Mock()

            router._get_backend("pixelbrain")
            router._get_backend("pixelbrain")

            # Should only create once
            mock_pb.assert_called_once()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
