"""Tests for file browser app."""
import pytest
import os
import tempfile
from pathlib import Path

from systems.spatial_coordinator.apps.file_browser_app import (
    FileBrowser, FileEntry, build_file_browser_app
)


class TestFileEntry:
    """Test FileEntry class."""

    def test_directory_entry(self):
        """Should create directory entry."""
        with tempfile.TemporaryDirectory() as tmpdir:
            dir_path = Path(tmpdir) / "test_dir"
            dir_path.mkdir()

            entry = FileEntry(
                name="test_dir",
                path=dir_path,
                is_dir=True,
            )

            assert entry.is_dir
            assert entry.name == "test_dir"
            assert entry.glyph == 0x1F4C1  # Folder icon

    def test_file_entry(self):
        """Should create file entry."""
        with tempfile.NamedTemporaryFile(suffix=".py", delete=False) as f:
            f.write(b"test content")
            f.flush()

            entry = FileEntry(
                name=Path(f.name).name,
                path=Path(f.name),
                is_dir=False,
                size=12,
                modified=None,
            )

            assert not entry.is_dir
            assert entry.size == 12

            os.unlink(f.name)


class TestFileBrowser:
    """Test FileBrowser class."""

    @pytest.fixture
    def browser(self):
        """Create a file browser instance."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test structure
            Path(tmpdir, "dir1").mkdir()
            Path(tmpdir, "dir2").mkdir()
            Path(tmpdir, "file1.txt").write_text("hello")
            Path(tmpdir, "file2.py").write_text("print('test')")
            Path(tmpdir, "zzz_last").mkdir()

            browser = FileBrowser(tmpdir)
            yield browser

    def test_creation(self, browser):
        """Should create file browser."""
        assert browser.WIDTH == 64
        assert browser.HEIGHT == 20
        assert browser.current_path.exists()

    def test_load_directory(self, browser):
        """Should load directory entries."""
        assert len(browser.entries) >= 4  # dir1, dir2, file1, file2

        # Check sorting: directories first, then files, alphabetically
        dirs = [e for e in browser.entries if e.is_dir]
        files = [e for e in browser.entries if not e.is_dir]

        assert len(dirs) >= 3  # dir1, dir2, zzz_last
        assert len(files) >= 2  # file1, file2

        # Directories should be sorted alphabetically
        dir_names = [d.name for d in dirs]
        assert dir_names == sorted(dir_names)

        # Files should be sorted alphabetically
        file_names = [f.name for f in files]
        assert file_names == sorted(file_names)

    def test_navigate_up_down(self, browser):
        """Should navigate up and down."""
        assert browser.selected_index == 0

        browser.navigate_down()
        assert browser.selected_index == 1

        browser.navigate_down()
        assert browser.selected_index == 2

        browser.navigate_up()
        assert browser.selected_index == 1

    def test_navigate_bounds(self, browser):
        """Should not go beyond bounds."""
        browser.selected_index = 0
        browser.navigate_up()
        assert browser.selected_index == 0  # Still 0

        last_idx = len(browser.entries) - 1
        browser.selected_index = last_idx
        browser.navigate_down()
        assert browser.selected_index == last_idx  # Still last

    def test_scroll_offset(self, browser):
        """Should scroll when selection goes off screen."""
        # Only test scroll if we have enough entries
        if len(browser.entries) <= browser.LIST_HEIGHT:
            pytest.skip("Not enough entries to test scrolling")

        # Move down past visible area
        for _ in range(browser.LIST_HEIGHT + 2):
            browser.navigate_down()

        assert browser.scroll_offset > 0

    def test_enter_directory(self, browser):
        """Should enter directory."""
        # Find a directory
        dir_entry = next(e for e in browser.entries if e.is_dir)
        browser.selected_index = browser.entries.index(dir_entry)

        result = browser.enter_selected()
        assert result is None  # Directories return None
        assert dir_entry.path in browser.current_path.parents or browser.current_path == dir_entry.path

    def test_enter_file(self, browser):
        """Should return file path when entering file."""
        # Find a file
        file_entry = next(e for e in browser.entries if not e.is_dir)
        browser.selected_index = browser.entries.index(file_entry)

        result = browser.enter_selected()
        assert result == str(file_entry.path)

    def test_go_back(self, browser):
        """Should go back to previous directory."""
        original_path = browser.current_path

        # Enter a directory
        dir_entry = next(e for e in browser.entries if e.is_dir)
        browser.selected_index = browser.entries.index(dir_entry)
        browser.enter_selected()

        # Go back
        browser.go_back()
        assert browser.current_path == original_path

    def test_handle_key_up(self, browser):
        """Should handle up arrow key."""
        browser.selected_index = 2
        browser.handle_key(0x41)  # Up arrow
        assert browser.selected_index == 1

        # Also test 'k' key
        browser.handle_key(ord('k'))
        assert browser.selected_index == 0

    def test_handle_key_down(self, browser):
        """Should handle down arrow key."""
        browser.handle_key(0x42)  # Down arrow
        assert browser.selected_index == 1

        # Also test 'j' key
        browser.handle_key(ord('j'))
        assert browser.selected_index == 2

    def test_handle_key_enter(self, browser):
        """Should handle enter key."""
        dir_entry = next(e for e in browser.entries if e.is_dir)
        browser.selected_index = browser.entries.index(dir_entry)

        browser.handle_key(0x0D)  # Enter
        assert dir_entry.path in browser.current_path.parents or browser.current_path == dir_entry.path

    def test_handle_key_backspace(self, browser):
        """Should handle backspace key."""
        original_path = browser.current_path

        # Enter a directory
        dir_entry = next(e for e in browser.entries if e.is_dir)
        browser.selected_index = browser.entries.index(dir_entry)
        browser.enter_selected()

        # Press backspace
        browser.handle_key(0x08)
        assert browser.current_path == original_path

    def test_handle_key_quit(self, browser):
        """Should handle quit key."""
        result = browser.handle_key(ord('q'))
        assert result == "QUIT"

    def test_get_glyphs(self, browser):
        """Should get glyph buffer."""
        glyphs = browser.get_glyphs()

        assert len(glyphs) == browser.WIDTH * browser.HEIGHT
        assert all(isinstance(g, int) for g in glyphs)

    def test_render_text(self, browser):
        """Should render as text."""
        text = browser.render_text()

        assert len(text.split('\n')) == browser.HEIGHT
        assert "File Browser:" in text

    def test_format_size(self, browser):
        """Should format file sizes."""
        assert browser._format_size(500) == "500 B"
        assert browser._format_size(1024) == "1.0 KB"
        assert browser._format_size(1536) == "1.5 KB"
        assert browser._format_size(1048576) == "1.0 MB"
        assert browser._format_size(1073741824) == "1.0 GB"

    def test_format_date(self, browser):
        """Should format dates."""
        from datetime import datetime
        dt = datetime(2024, 3, 13, 12, 30, 45)
        formatted = browser._format_date(dt)
        assert formatted == "2024-03-13"


class TestFileBrowserApp:
    """Test file browser app via AppLoader."""

    @pytest.fixture
    def loader(self):
        """Create an AppLoader instance."""
        from systems.spatial_coordinator.apps import AppLoader
        return AppLoader()

    def test_load_file_browser_app(self, loader):
        """Should load file browser app."""
        app_id = loader.load_app('file_browser')
        assert app_id is not None
        assert app_id in loader._apps

    def test_file_browser_size(self, loader):
        """File browser should be 64x20."""
        app_id = loader.load_app('file_browser')
        assert loader._apps[app_id]['width'] == 64
        assert loader._apps[app_id]['height'] == 20

    def test_navigate_in_file_browser(self, loader):
        """Should navigate in file browser."""
        app_id = loader.load_app('file_browser')

        # Send down arrow
        loader.send_key(app_id, 0x42)  # Down
        loader.tick()

        # Just verify no crash
        text = loader.render_text(app_id)
        assert text is not None


class TestAppBinary:
    """Test app binary generation."""

    def test_build_binary(self):
        """Should build valid app binary."""
        binary = build_file_browser_app()

        assert len(binary) > 16
        assert binary[:4] == b'GEOS'

        # Parse header
        import struct
        magic, width, height = struct.unpack('<4sHH', binary[:8])
        assert magic == b'GEOS'
        assert width == 64
        assert height == 20
