"""Tests for terminal emulator app."""
import pytest
import sys

# Skip if not on Unix (PTY not available)
pytestmark = pytest.mark.skipif(
    sys.platform == "win32",
    reason="PTY not available on Windows"
)


class TestTerminalEmulator:
    """Test TerminalEmulator class."""

    @pytest.fixture
    def term(self):
        """Create a TerminalEmulator instance."""
        from systems.spatial_coordinator.apps.terminal_app import TerminalEmulator
        term = TerminalEmulator()
        yield term
        term.stop_shell()

    def test_creation(self, term):
        """Should create terminal emulator."""
        assert term.WIDTH == 80
        assert term.HEIGHT == 24
        assert len(term.state.screen) == 80 * 24

    def test_initial_screen_blank(self, term):
        """Screen should be blank initially."""
        glyphs = term.get_glyphs()
        assert all(g == 32 for g in glyphs)  # All spaces

    def test_start_shell(self, term):
        """Should start a shell process."""
        assert term.start_shell()
        assert term.state.master_fd is not None
        assert term.state.shell_pid is not None

    def test_cursor_initial_position(self, term):
        """Cursor should start at 0,0."""
        assert term.state.cursor_x == 0
        assert term.state.cursor_y == 0

    def test_put_char(self, term):
        """Should put a character at cursor."""
        term._put_char(ord('A'))
        assert term.state.screen[0] == ord('A')
        assert term.state.cursor_x == 1

    def test_put_char_wrap(self, term):
        """Should wrap to next line at end of line."""
        term.state.cursor_x = 79
        term._put_char(ord('X'))
        term._put_char(ord('Y'))
        assert term.state.screen[79] == ord('X')
        assert term.state.screen[80] == ord('Y')
        assert term.state.cursor_x == 1
        assert term.state.cursor_y == 1

    def test_line_feed(self, term):
        """Should scroll at bottom of screen."""
        term.state.cursor_y = 23
        term._line_feed()
        # Should scroll, cursor stays at line 23
        assert term.state.cursor_y == 23

    def test_carriage_return(self, term):
        """CR should move cursor to start of line."""
        term.state.cursor_x = 40
        term._process_byte(0x0D)  # CR
        assert term.state.cursor_x == 0

    def test_backspace(self, term):
        """BS should move cursor back."""
        term.state.cursor_x = 10
        term._process_byte(0x08)  # BS
        assert term.state.cursor_x == 9

    def test_tab(self, term):
        """TAB should advance to next tab stop."""
        term.state.cursor_x = 0
        term._process_byte(0x09)  # TAB
        assert term.state.cursor_x == 8

        term.state.cursor_x = 8
        term._process_byte(0x09)  # TAB
        assert term.state.cursor_x == 16

    def test_ansi_cursor_up(self, term):
        """CSI A should move cursor up."""
        term.state.cursor_y = 10
        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('A'))  # Cursor up
        assert term.state.cursor_y == 9

    def test_ansi_cursor_down(self, term):
        """CSI B should move cursor down."""
        term.state.cursor_y = 10
        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('B'))  # Cursor down
        assert term.state.cursor_y == 11

    def test_ansi_cursor_forward(self, term):
        """CSI C should move cursor right."""
        term.state.cursor_x = 10
        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('C'))  # Cursor forward
        assert term.state.cursor_x == 11

    def test_ansi_cursor_back(self, term):
        """CSI D should move cursor left."""
        term.state.cursor_x = 10
        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('D'))  # Cursor back
        assert term.state.cursor_x == 9

    def test_ansi_cursor_position(self, term):
        """CSI H should set cursor position."""
        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('5'))  # Row 5
        term._process_byte(ord(';'))
        term._process_byte(ord('1'))  # Col 10
        term._process_byte(ord('0'))
        term._process_byte(ord('H'))  # CUP
        assert term.state.cursor_y == 4  # 0-indexed
        assert term.state.cursor_x == 9  # 0-indexed

    def test_ansi_erase_line(self, term):
        """CSI K should erase line."""
        term.state.cursor_x = 5
        term.state.cursor_y = 0
        term.state.screen[0:10] = [ord('X')] * 10

        term._process_byte(0x1B)  # ESC
        term._process_byte(ord('['))
        term._process_byte(ord('K'))  # EL (erase to end of line)

        # First 5 chars should remain
        assert term.state.screen[0:5] == [ord('X')] * 5
        # Rest should be spaces
        assert term.state.screen[5:80] == [32] * 75

    def test_render_text(self, term):
        """Should render screen as text."""
        term._put_char(ord('H'))
        term._put_char(ord('i'))

        text = term.render_text()
        assert 'Hi' in text


class TestTerminalApp:
    """Test terminal app via AppLoader."""

    @pytest.fixture
    def loader(self):
        """Create an AppLoader instance."""
        from systems.spatial_coordinator.apps import AppLoader
        loader = AppLoader()
        yield loader
        # Cleanup
        for app_id in list(loader._terminals.keys()):
            if app_id in loader._terminals:
                loader._terminals[app_id].stop_shell()

    def test_load_terminal_app(self, loader):
        """Should load terminal app."""
        app_id = loader.load_app('terminal')
        assert app_id is not None
        assert app_id in loader._terminals

    def test_terminal_size(self, loader):
        """Terminal should be 80x24."""
        app_id = loader.load_app('terminal')
        assert loader._apps[app_id]['width'] == 80
        assert loader._apps[app_id]['height'] == 24

    def test_send_key_to_terminal(self, loader):
        """Should send keys to terminal."""
        app_id = loader.load_app('terminal')

        # Send 'l' key
        loader.send_key(app_id, ord('l'))

        # Key should be processed by terminal
        # (Output depends on shell, so just verify no crash)
        loader.tick()

    def test_get_glyphs_from_terminal(self, loader):
        """Should get glyph buffer from terminal."""
        app_id = loader.load_app('terminal')

        # Run a few ticks to let shell start
        for _ in range(5):
            loader.tick()

        glyphs = loader.get_glyphs(app_id)
        assert glyphs is not None
        assert len(glyphs) == 80 * 24

    def test_render_terminal_text(self, loader):
        """Should render terminal as text."""
        app_id = loader.load_app('terminal')

        # Run ticks to let shell start
        for _ in range(10):
            loader.tick()

        text = loader.render_text(app_id)
        assert text is not None
        assert len(text.split('\n')) == 24  # 24 rows


class TestTerminalIntegration:
    """Integration tests for terminal with real shell."""

    @pytest.fixture
    def term(self):
        """Create and start a terminal."""
        from systems.spatial_coordinator.apps.terminal_app import TerminalEmulator
        term = TerminalEmulator()
        assert term.start_shell()
        yield term
        term.stop_shell()

    def test_shell_outputs_prompt(self, term):
        """Shell should output a prompt."""
        import time
        time.sleep(0.5)

        # Read output
        data = term.read_output()
        if data:
            term.process_output(data)

        # Screen should have some content
        text = term.render_text()
        # Prompt varies by shell, just check we got something
        assert len(text.strip()) > 0

    def test_echo_command(self, term):
        """Should echo a command."""
        import time

        # Wait for prompt
        time.sleep(0.3)
        data = term.read_output()
        if data:
            term.process_output(data)

        # Type 'echo hello'
        for c in 'echo hello':
            term.process_input(ord(c))
        term.process_input(0x0D)  # Enter

        # Wait for output
        time.sleep(0.3)
        data = term.read_output()
        if data:
            term.process_output(data)

        # Check screen for 'hello'
        text = term.render_text()
        # The command and output should appear
        assert 'echo' in text.lower() or 'hello' in text.lower()
