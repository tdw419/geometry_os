"""Glyph App Loader.

Loads and runs sample glyph applications in the GPU VM.
Provides a simple interface for testing and demo.

Usage:
    from systems.spatial_coordinator.apps import AppLoader

    loader = AppLoader()
    loader.load_app("counter")
    loader.run()
    print(loader.get_glyphs(0))
"""

import importlib
from typing import Dict, List, Optional, Any
from pathlib import Path

from systems.spatial_coordinator.gpu_vm import GPUGlyphVM
from systems.spatial_coordinator.opcodes import R_INT_TYPE, R_INT_PAYLOAD


class AppLoader:
    """Load and run sample glyph applications."""

    def __init__(self):
        self.vm = GPUGlyphVM()
        self._apps: Dict[int, Dict[str, Any]] = {}
        self._next_id = 0

        # Glyph buffers for each app
        self._glyph_buffers: Dict[int, List[int]] = {}

        # App metadata
        self._app_info: Dict[str, Dict] = {}

        # Terminal emulators (for terminal apps)
        self._terminals: Dict[int, Any] = {}

        # Discover available apps
        self._discover_apps()

    def _discover_apps(self):
        """Discover available sample apps."""
        apps_dir = Path(__file__).parent

        for app_file in apps_dir.glob("*_app.py"):
            app_name = app_file.stem.replace("_app", "")
            try:
                module = importlib.import_module(
                    f"systems.spatial_coordinator.apps.{app_file.stem}"
                )
                if hasattr(module, 'APP_NAME'):
                    self._app_info[module.APP_NAME] = {
                        'module': module,
                        'binary': getattr(module, 'APP_BINARY', None),
                        'width': getattr(module, 'APP_WIDTH', 32),
                        'height': getattr(module, 'APP_HEIGHT', 16),
                        'flags': getattr(module, 'APP_FLAGS', 0),
                    }
            except ImportError as e:
                print(f"Failed to import {app_file.stem}: {e}")
                pass

    @property
    def available_apps(self) -> List[str]:
        """List available sample apps."""
        return list(self._app_info.keys())

    def load_app(self, app_name: str) -> Optional[int]:
        """Load a sample app by name.

        Args:
            app_name: Name of the app (e.g., "counter", "text_display")

        Returns:
            App ID on success, None on failure
        """
        if app_name not in self._app_info:
            print(f"Unknown app: {app_name}")
            print(f"Available: {', '.join(self.available_apps)}")
            return None

        info = self._app_info[app_name]
        binary = info['binary']

        if binary is None:
            print(f"App {app_name} has no binary")
            return None

        # Load into VM
        app_id = self.vm.load_app(binary)
        if app_id is None:
            return None

        # Initialize glyph buffer
        width = info['width']
        height = info['height']

        # Get initial glyphs from module if available
        module = info['module']
        if hasattr(module, 'get_initial_glyphs'):
            self._glyph_buffers[app_id] = module.get_initial_glyphs()
        else:
            # Fill with spaces
            self._glyph_buffers[app_id] = [32] * (width * height)

        # Store app info
        self._apps[app_id] = {
            'name': app_name,
            'width': width,
            'height': height,
            'flags': info['flags'],
            'is_terminal': app_name == 'terminal',
        }

        # Special handling for terminal apps
        if app_name == 'terminal' and hasattr(module, 'create_terminal'):
            terminal = module.create_terminal()
            if terminal.start_shell():
                self._terminals[app_id] = terminal
                # Get initial screen
                self._glyph_buffers[app_id] = terminal.get_glyphs()
            else:
                print(f"Warning: Failed to start shell for terminal app")

        print(f"Loaded app: {app_name} (id={app_id}, {width}x{height})")
        return app_id

    def unload_app(self, app_id: int):
        """Unload an app."""
        if app_id in self._apps:
            del self._apps[app_id]
        if app_id in self._glyph_buffers:
            del self._glyph_buffers[app_id]
        # VM doesn't have unload, just mark as None
        if app_id < len(self.vm._apps):
            self.vm._apps[app_id] = None

    def run(self, max_frames: int = 1) -> int:
        """Run VM for specified frames.

        Args:
            max_frames: Number of frames to run (0 = until all halted)

        Returns:
            Total steps executed
        """
        return self.vm.run(max_frames)

    def tick(self):
        """Run one frame and update glyph buffers."""
        # Update terminal apps first (read from PTY)
        for app_id, terminal in list(self._terminals.items()):
            data = terminal.read_output()
            if data:
                terminal.process_output(data)
                self._glyph_buffers[app_id] = terminal.get_glyphs()

        # Wake up halted apps for new frame
        for app_id in self._apps:
            if self.vm.is_halted(app_id):
                # Reset halted state so app can process new interrupts
                self.vm._apps[app_id]['halted'] = False

        self.vm.run(max_frames=1)

        # Update glyph buffers based on app state
        for app_id, app_info in self._apps.items():
            self._update_glyphs(app_id)

    def _update_glyphs(self, app_id: int):
        """Update glyph buffer for an app."""
        if app_id not in self._apps:
            return

        app_name = self._apps[app_id]['name']

        # Special handling for terminal apps
        if app_name == "terminal":
            if app_id in self._terminals:
                terminal = self._terminals[app_id]
                # Read output from PTY
                data = terminal.read_output()
                if data:
                    terminal.process_output(data)
                # Get glyphs from terminal
                self._glyph_buffers[app_id] = terminal.get_glyphs()
            return

        module = self._app_info[app_name]['module']

        # Special handling per app type
        if app_name == "counter":
            # Read counter value from R0
            value = self.vm.read_register(app_id, 0)
            if hasattr(module, 'render_counter'):
                self._glyph_buffers[app_id] = module.render_counter(value)

        elif app_name == "text_display":
            # Read text buffer from memory
            buffer_start = 0x100
            buffer_size = self._apps[app_id]['width'] * self._apps[app_id]['height']
            buffer = self.vm.read_memory(app_id, buffer_start, buffer_size)

            # Get cursor position from R0
            cursor = self.vm.read_register(app_id, 0)

            if hasattr(module, 'render_text_buffer'):
                self._glyph_buffers[app_id] = module.render_text_buffer(
                    buffer,
                    width=self._apps[app_id]['width'],
                    height=self._apps[app_id]['height'],
                    cursor_pos=cursor
                )

    def get_glyphs(self, app_id: int) -> Optional[List[int]]:
        """Get glyph buffer for an app.

        Returns:
            List of glyph codes (ASCII), or None if app not found
        """
        return self._glyph_buffers.get(app_id)

    def get_glyph_grid(self, app_id: int) -> Optional[List[List[int]]]:
        """Get glyph buffer as 2D grid.

        Returns:
            2D list of glyph codes, or None if app not found
        """
        if app_id not in self._glyph_buffers:
            return None

        glyphs = self._glyph_buffers[app_id]
        width = self._apps[app_id]['width']
        height = self._apps[app_id]['height']

        grid = []
        for y in range(height):
            row = glyphs[y * width:(y + 1) * width]
            grid.append(row)

        return grid

    def render_text(self, app_id: int) -> Optional[str]:
        """Render glyph buffer as text string.

        Returns:
            Multiline string of glyphs, or None if app not found
        """
        grid = self.get_glyph_grid(app_id)
        if grid is None:
            return None

        lines = []
        for row in grid:
            line = ''.join(chr(g) for g in row)
            lines.append(line)

        return '\n'.join(lines)

    def send_key(self, app_id: int, keycode: int):
        """Send a keyboard interrupt to an app.

        Args:
            app_id: Target app ID
            keycode: ASCII keycode (e.g., 0x20 for space)
        """
        # Special handling for terminal apps
        if app_id in self._terminals:
            terminal = self._terminals[app_id]
            terminal.process_input(keycode)
            return

        self.vm.set_interrupt(app_id, int_type=1, payload=keycode)

    def send_mouse(self, app_id: int, button: int, x: int = 0, y: int = 0):
        """Send a mouse interrupt to an app.

        Args:
            app_id: Target app ID
            button: Button code (0 = left, 1 = middle, 2 = right)
            x: X coordinate
            y: Y coordinate
        """
        self.vm.set_interrupt(app_id, int_type=2, payload=button, source=(x << 16) | y)


# Demo
if __name__ == "__main__":
    print("Glyph App Loader Demo")
    print("=" * 40)

    loader = AppLoader()
    print(f"Available apps: {', '.join(loader.available_apps)}")

    # Load counter app
    app_id = loader.load_app("counter")
    if app_id is not None:
        print(f"\nInitial state:")
        print(loader.render_text(app_id))

        # Send some spacebar presses
        for _ in range(3):
            loader.send_key(app_id, 0x20)  # Spacebar
            loader.tick()

        print(f"\nAfter 3 spacebar presses:")
        print(loader.render_text(app_id))

    print("\n" + "=" * 40)
    print("Demo complete!")
