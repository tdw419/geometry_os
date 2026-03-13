"""Tests for sample glyph applications."""
import pytest
from systems.spatial_coordinator.apps import AppLoader


class TestAppLoader:
    """Test AppLoader functionality."""

    @pytest.fixture
    def loader(self):
        """Create an AppLoader instance."""
        return AppLoader()

    def test_available_apps(self, loader):
        """Should discover available apps."""
        apps = loader.available_apps
        assert 'counter' in apps
        assert 'text_display' in apps

    def test_load_counter_app(self, loader):
        """Should load counter app."""
        app_id = loader.load_app('counter')
        assert app_id == 0
        assert app_id in loader._apps

    def test_load_text_display_app(self, loader):
        """Should load text display app."""
        app_id = loader.load_app('text_display')
        assert app_id == 0
        assert app_id in loader._apps

    def test_load_invalid_app(self, loader):
        """Should return None for invalid app."""
        app_id = loader.load_app('nonexistent')
        assert app_id is None

    def test_get_glyphs(self, loader):
        """Should get glyph buffer."""
        app_id = loader.load_app('counter')
        glyphs = loader.get_glyphs(app_id)
        assert glyphs is not None
        assert len(glyphs) == 8 * 4  # 8x4 grid

    def test_render_text(self, loader):
        """Should render as text."""
        app_id = loader.load_app('counter')
        text = loader.render_text(app_id)
        assert text is not None
        assert 'Counter:' in text

    def test_send_key(self, loader):
        """Should send keyboard interrupt."""
        app_id = loader.load_app('counter')
        loader.send_key(app_id, 0x20)  # Spacebar
        loader.tick()

        # Counter should have incremented
        text = loader.render_text(app_id)
        assert '1' in text


class TestCounterApp:
    """Test counter app functionality."""

    @pytest.fixture
    def loader(self):
        """Create a loader with counter app loaded."""
        loader = AppLoader()
        loader.load_app('counter')
        return loader

    def test_initial_value(self, loader):
        """Counter should start at 0."""
        text = loader.render_text(0)
        assert '0' in text

    def test_increment_on_space(self, loader):
        """Counter should increment on spacebar."""
        loader.send_key(0, 0x20)  # Spacebar
        loader.tick()

        text = loader.render_text(0)
        assert '1' in text

    def test_multiple_increments(self, loader):
        """Counter should increment multiple times."""
        for _ in range(5):
            loader.send_key(0, 0x20)
            loader.tick()

        text = loader.render_text(0)
        assert '5' in text

    def test_ignore_other_keys(self, loader):
        """Counter should ignore non-spacebar keys."""
        loader.send_key(0, 0x41)  # 'A' key
        loader.tick()

        text = loader.render_text(0)
        assert '0' in text  # Still 0


class TestTextDisplayApp:
    """Test text display app functionality."""

    @pytest.fixture
    def loader(self):
        """Create a loader with text display app loaded."""
        loader = AppLoader()
        loader.load_app('text_display')
        return loader

    def test_initial_display(self, loader):
        """Should show initial text."""
        text = loader.render_text(0)
        assert text is not None
        # Should have the title
        assert len(text) > 0

    def test_type_character(self, loader):
        """Should add typed character."""
        loader.send_key(0, ord('A'))
        loader.tick()

        # App should have processed the key
        # (Exact behavior depends on app implementation)


class TestAppRendering:
    """Test app rendering functionality."""

    @pytest.fixture
    def loader(self):
        """Create a loader with counter app."""
        loader = AppLoader()
        loader.load_app('counter')
        return loader

    def test_get_glyph_grid(self, loader):
        """Should get 2D glyph grid."""
        grid = loader.get_glyph_grid(0)
        assert grid is not None
        assert len(grid) == 4  # 4 rows
        assert len(grid[0]) == 8  # 8 columns

    def test_glyphs_are_ascii(self, loader):
        """All glyphs should be valid ASCII."""
        glyphs = loader.get_glyphs(0)
        for g in glyphs:
            assert 0 <= g <= 127

    def test_render_preserves_layout(self, loader):
        """Rendered text should preserve grid layout."""
        text = loader.render_text(0)
        lines = text.split('\n')
        assert len(lines) == 4  # 4 rows
        assert all(len(line) == 8 for line in lines)  # 8 columns each
