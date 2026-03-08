"""
Tests for Renderer Configuration
TDD tests for Task 4.2: Switch Over
"""

import pytest
import warnings
import sys
from pathlib import Path

# Add api directory to path
sys.path.insert(0, str(Path(__file__).parent))

from renderer_config import RendererConfig, RendererType, DeprecationWarning
from native_api import NativeVisualShellAPI


class TestRendererConfig:
    """Tests for renderer configuration"""

    def test_default_renderer_is_native(self):
        """By default, native renderer should be enabled"""
        config = RendererConfig()

        assert config.use_native_renderer is True
        assert config.enable_parallel_mode is False

    def test_can_enable_parallel_mode(self):
        """Can enable both renderers for comparison"""
        config = RendererConfig(enable_parallel_mode=True)

        assert config.enable_parallel_mode is True
        assert config.get_preferred_renderer() == RendererType.NATIVE

    def test_config_persistence(self):
        """Config can be saved and loaded"""
        config = RendererConfig()
        config.use_native_renderer = True

        state = config.to_dict()
        assert state["use_native_renderer"] is True

        # Load from dict
        config2 = RendererConfig.from_dict(state)
        assert config2.use_native_renderer is True

    def test_can_switch_to_pixijs(self):
        """Can switch to PixiJS renderer (with deprecation warning)"""
        config = RendererConfig()
        config.preferred_renderer = RendererType.PIXIJS

        assert config.preferred_renderer == RendererType.PIXIJS


class TestNativeRendererDefault:
    """Tests for native renderer as default"""

    def test_api_uses_native_renderer_by_default(self):
        """API should use native renderer by default"""
        api = NativeVisualShellAPI()

        assert api.renderer_type == "native"
        assert api.config.use_native_renderer is True

    def test_api_can_switch_to_pixijs(self):
        """API can switch to PixiJS renderer (with deprecation warning)"""
        api = NativeVisualShellAPI()

        with pytest.warns(DeprecationWarning):
            api.set_renderer("pixijs")

        assert api.renderer_type == "pixijs"

    def test_api_emits_telemetry(self):
        """API should emit telemetry for performance comparison"""
        api = NativeVisualShellAPI()

        # Render a frame
        api.create_panel("test", "Test", 0, 0, 100, 100)
        telemetry = api.get_telemetry()

        assert "render_time_ms" in telemetry or "frame_count" in telemetry
        assert "entity_count" in telemetry
        assert telemetry["renderer"] == "native"


class TestDeprecationWarning:
    """Tests for PixiJS deprecation"""

    def test_pixijs_emits_deprecation_warning(self):
        """Switching to PixiJS should emit a deprecation warning"""
        with warnings.catch_warnings(record=True) as w:
            warnings.simplefilter("always")
            api = NativeVisualShellAPI()
            api.set_renderer("pixijs")

            # Check that a DeprecationWarning was issued
            assert len(w) == 1
            assert issubclass(w[0].category, DeprecationWarning)
            assert "deprecated" in str(w[0].message).lower()

    def test_native_renderer_no_warning(self):
        """Switching to native renderer should not emit a warning"""
        with warnings.catch_warnings(record=True) as w:
            warnings.simplefilter("always")
            api = NativeVisualShellAPI()
            api.set_renderer("native")

            # No deprecation warnings
            deprecation_warnings = [x for x in w if issubclass(x.category, DeprecationWarning)]
            assert len(deprecation_warnings) == 0
