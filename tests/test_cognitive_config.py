"""
Tests for Cognitive Configuration System.
"""

from unittest.mock import Mock, patch

import pytest


class TestCognitiveConfig:
    """Tests for cognitive engine configuration."""

    def test_default_engine_is_pixelbrain(self):
        """Default cognitive engine should be PixelBrain."""
        from systems.cognitive.cognitive_config import CognitiveConfig, reset_cognitive_config

        reset_cognitive_config()
        config = CognitiveConfig()
        assert config.default_engine == "pixelbrain"

    def test_can_set_fallback_engine(self):
        """Should be able to configure fallback engine."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig(fallback_engine="lmstudio")
        assert config.fallback_engine == "lmstudio"

    def test_can_check_engine_availability(self):
        """Should check if an engine is available."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()
        # PixelBrain may or may not be available depending on atlas
        assert isinstance(config.is_available("pixelbrain"), bool)

    def test_get_engine_returns_correct_backend(self):
        """get_engine() should return the appropriate backend."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()

        with patch.object(config, '_create_backend') as mock_create:
            mock_backend = Mock()
            mock_backend.generate = Mock()
            mock_create.return_value = mock_backend

            engine = config.get_engine("lmstudio")
            assert engine is not None

    def test_environment_variable_override(self, monkeypatch):
        """COGNITIVE_ENGINE env var should override default."""
        from systems.cognitive.cognitive_config import CognitiveConfig, reset_cognitive_config

        reset_cognitive_config()
        monkeypatch.setenv("COGNITIVE_ENGINE", "lmstudio")

        config = CognitiveConfig()
        assert config.default_engine == "lmstudio"

    def test_lmstudio_availability_check(self):
        """Should correctly check LM Studio availability."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()

        # This will return False if LM Studio is not running
        result = config._check_lmstudio_available()
        assert isinstance(result, bool)

    def test_external_api_availability(self, monkeypatch):
        """Should check for external API keys."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()

        # No key set
        monkeypatch.delenv("OPENAI_API_KEY", raising=False)
        assert config._check_external_api_available("openai") is False

        # Key set
        monkeypatch.setenv("OPENAI_API_KEY", "test-key")
        assert config._check_external_api_available("openai") is True

    def test_get_available_engine_returns_default_if_available(self):
        """Should return default engine if available."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()

        with patch.object(config, 'is_available', return_value=True):
            with patch.object(config, 'get_engine') as mock_get:
                mock_get.return_value = Mock()
                engine = config.get_available_engine()
                mock_get.assert_called_with("pixelbrain")

    def test_get_available_engine_returns_fallback_if_default_unavailable(self):
        """Should return fallback if default unavailable."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()

        def mock_is_available(engine):
            return engine == "lmstudio"

        with patch.object(config, 'is_available', side_effect=mock_is_available):
            with patch.object(config, 'get_engine') as mock_get:
                mock_get.return_value = Mock()
                engine = config.get_available_engine()
                mock_get.assert_called_with("lmstudio")

    def test_singleton_pattern(self):
        """get_cognitive_config should return singleton."""
        from systems.cognitive.cognitive_config import get_cognitive_config, reset_cognitive_config

        reset_cognitive_config()
        config1 = get_cognitive_config()
        config2 = get_cognitive_config()

        assert config1 is config2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
