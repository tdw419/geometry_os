"""
Tests for ASCII GUI hook system.

Tests the GUIHookBroadcaster and GUIShellHook patterns.
"""

import pytest
import asyncio
from typing import List, Optional

from systems.visual_shell.ascii_gui.hooks import (
    GUIShellHook,
    GUIHookBroadcaster,
    NoOpGUIHook,
    LoggingGUITHook,
)
from systems.visual_shell.ascii_gui.models import Window, WindowType


class TestGUIShellHook:
    """Tests for GUIShellHook abstract base class."""

    def test_cannot_instantiate_abstract_class(self):
        """Cannot instantiate GUIShellHook directly."""
        with pytest.raises(TypeError):
            GUIShellHook()

    def test_must_implement_all_methods(self):
        """Subclasses must implement all abstract methods."""
        class IncompleteHook(GUIShellHook):
            async def on_window_create(self, window):
                pass
            # Missing other methods

        with pytest.raises(TypeError):
            IncompleteHook()


class TestGUIHookBroadcaster:
    """Tests for GUIHookBroadcaster."""

    def test_init_empty(self):
        """Broadcaster starts with no hooks."""
        broadcaster = GUIHookBroadcaster()
        assert broadcaster.hooks == []

    def test_add_hook(self):
        """Can add hooks to broadcaster."""
        broadcaster = GUIHookBroadcaster()
        hook = NoOpGUIHook()
        broadcaster.add_hook(hook)
        assert hook in broadcaster.hooks
        assert len(broadcaster.hooks) == 1

    def test_add_multiple_hooks(self):
        """Can add multiple hooks."""
        broadcaster = GUIHookBroadcaster()
        hook1 = NoOpGUIHook()
        hook2 = NoOpGUIHook()
        broadcaster.add_hook(hook1)
        broadcaster.add_hook(hook2)
        assert len(broadcaster.hooks) == 2

    def test_remove_hook(self):
        """Can remove hooks from broadcaster."""
        broadcaster = GUIHookBroadcaster()
        hook = NoOpGUIHook()
        broadcaster.add_hook(hook)
        result = broadcaster.remove_hook(hook)
        assert result is True
        assert hook not in broadcaster.hooks

    def test_remove_nonexistent_hook(self):
        """Removing nonexistent hook returns False."""
        broadcaster = GUIHookBroadcaster()
        hook = NoOpGUIHook()
        result = broadcaster.remove_hook(hook)
        assert result is False

    def test_hooks_property_returns_copy(self):
        """hooks property returns a copy, not the internal list."""
        broadcaster = GUIHookBroadcaster()
        hook = NoOpGUIHook()
        broadcaster.add_hook(hook)
        hooks_copy = broadcaster.hooks
        hooks_copy.clear()  # Modify the copy
        assert len(broadcaster.hooks) == 1  # Original unchanged

    @pytest.mark.asyncio
    async def test_dispatch_to_all_hooks(self):
        """Broadcaster dispatches events to all registered hooks."""
        broadcaster = GUIHookBroadcaster()

        calls: List[str] = []

        class TrackingHook(GUIShellHook):
            async def on_window_create(self, window):
                calls.append(f"hook1:create:{window.id}")

            async def on_window_focus(self, window):
                calls.append(f"hook1:focus:{window.id}")

            async def on_window_close(self, window_id):
                calls.append(f"hook1:close:{window_id}")

            async def on_mouse_move(self, x, y, hovering):
                calls.append(f"hook1:mouse:{x},{y}")

            async def on_key_press(self, key, modifiers):
                calls.append(f"hook1:key:{key}")

            async def on_menu_open(self, menu_id):
                calls.append(f"hook1:menu:{menu_id}")

        hook1 = TrackingHook()
        hook2 = TrackingHook()

        # Patch the calls to use different prefix
        class TrackingHook2(GUIShellHook):
            async def on_window_create(self, window):
                calls.append(f"hook2:create:{window.id}")

            async def on_window_focus(self, window):
                calls.append(f"hook2:focus:{window.id}")

            async def on_window_close(self, window_id):
                calls.append(f"hook2:close:{window_id}")

            async def on_mouse_move(self, x, y, hovering):
                calls.append(f"hook2:mouse:{x},{y}")

            async def on_key_press(self, key, modifiers):
                calls.append(f"hook2:key:{key}")

            async def on_menu_open(self, menu_id):
                calls.append(f"hook2:menu:{menu_id}")

        broadcaster.add_hook(hook1)
        broadcaster.add_hook(TrackingHook2())

        window = Window(id="test-win", title="Test", type=WindowType.TERMINAL)

        await broadcaster.on_window_create(window)
        await broadcaster.on_window_focus(window)
        await broadcaster.on_window_close("test-win")
        await broadcaster.on_mouse_move(100, 200, "button")
        await broadcaster.on_key_press("Enter", [])
        await broadcaster.on_menu_open("file")

        # Both hooks should receive all events
        assert "hook1:create:test-win" in calls
        assert "hook2:create:test-win" in calls
        assert "hook1:focus:test-win" in calls
        assert "hook2:focus:test-win" in calls
        assert "hook1:close:test-win" in calls
        assert "hook2:close:test-win" in calls
        assert "hook1:mouse:100,200" in calls
        assert "hook2:mouse:100,200" in calls
        assert "hook1:key:Enter" in calls
        assert "hook2:key:Enter" in calls
        assert "hook1:menu:file" in calls
        assert "hook2:menu:file" in calls

    @pytest.mark.asyncio
    async def test_dispatch_handles_exceptions(self):
        """Broadcaster handles exceptions in hooks gracefully."""
        broadcaster = GUIHookBroadcaster()

        calls: List[str] = []

        class FailingHook(GUIShellHook):
            async def on_window_create(self, window):
                raise RuntimeError("Hook failed!")

            async def on_window_focus(self, window):
                pass

            async def on_window_close(self, window_id):
                pass

            async def on_mouse_move(self, x, y, hovering):
                pass

            async def on_key_press(self, key, modifiers):
                pass

            async def on_menu_open(self, menu_id):
                pass

        class WorkingHook(GUIShellHook):
            async def on_window_create(self, window):
                calls.append("working:create")

            async def on_window_focus(self, window):
                pass

            async def on_window_close(self, window_id):
                pass

            async def on_mouse_move(self, x, y, hovering):
                pass

            async def on_key_press(self, key, modifiers):
                pass

            async def on_menu_open(self, menu_id):
                pass

        broadcaster.add_hook(FailingHook())
        broadcaster.add_hook(WorkingHook())

        window = Window(id="test", title="Test", type=WindowType.TERMINAL)

        # Should not raise, working hook should still be called
        await broadcaster.on_window_create(window)

        assert "working:create" in calls

    @pytest.mark.asyncio
    async def test_empty_broadcaster_does_not_error(self):
        """Broadcaster with no hooks does not error on dispatch."""
        broadcaster = GUIHookBroadcaster()

        window = Window(id="test", title="Test", type=WindowType.TERMINAL)

        # Should not raise
        await broadcaster.on_window_create(window)
        await broadcaster.on_window_focus(window)
        await broadcaster.on_window_close("test")
        await broadcaster.on_mouse_move(0, 0, None)
        await broadcaster.on_key_press("a", [])
        await broadcaster.on_menu_open("menu")


class TestNoOpGUIHook:
    """Tests for NoOpGUIHook."""

    @pytest.mark.asyncio
    async def test_no_op_hook_does_nothing(self):
        """NoOpGUIHook methods do nothing and don't error."""
        hook = NoOpGUIHook()
        window = Window(id="test", title="Test", type=WindowType.TERMINAL)

        # All methods should complete without error
        await hook.on_window_create(window)
        await hook.on_window_focus(window)
        await hook.on_window_close("test")
        await hook.on_mouse_move(0, 0, None)
        await hook.on_key_press("a", [])
        await hook.on_menu_open("menu")


class TestLoggingGUITHook:
    """Tests for LoggingGUITHook."""

    @pytest.mark.asyncio
    async def test_logging_hook_logs_events(self, caplog):
        """LoggingGUITHook logs all events."""
        hook = LoggingGUITHook()
        window = Window(id="test", title="Test", type=WindowType.TERMINAL)

        with caplog.at_level("INFO"):
            await hook.on_window_create(window)
            await hook.on_window_focus(window)
            await hook.on_window_close("test")
            await hook.on_mouse_move(100, 200, "button")
            await hook.on_key_press("Enter", ["ctrl"])
            await hook.on_menu_open("file")

        # Check log messages contain expected content
        log_text = caplog.text
        assert "Window created" in log_text
        assert "Window focused" in log_text
        assert "Window closed" in log_text
        assert "Mouse moved" in log_text
        assert "Key pressed" in log_text
        assert "Menu opened" in log_text


class TestHookIntegration:
    """Integration tests for hook system."""

    @pytest.mark.asyncio
    async def test_broadcaster_with_multiple_hook_types(self):
        """Broadcaster works with different hook types."""
        broadcaster = GUIHookBroadcaster()

        # Mix of hook types
        broadcaster.add_hook(NoOpGUIHook())
        broadcaster.add_hook(LoggingGUITHook())
        broadcaster.add_hook(NoOpGUIHook())

        window = Window(id="test", title="Test", type=WindowType.EDITOR)

        # Should dispatch to all without error
        await broadcaster.on_window_create(window)
        await broadcaster.on_window_focus(window)
        await broadcaster.on_window_close("test")

        assert len(broadcaster.hooks) == 3

    @pytest.mark.asyncio
    async def test_concurrent_dispatch(self):
        """Hooks are dispatched concurrently."""
        broadcaster = GUIHookBroadcaster()

        order: List[str] = []

        class SlowHook(GUIShellHook):
            async def on_window_create(self, window):
                await asyncio.sleep(0.01)
                order.append("slow")

            async def on_window_focus(self, window):
                pass

            async def on_window_close(self, window_id):
                pass

            async def on_mouse_move(self, x, y, hovering):
                pass

            async def on_key_press(self, key, modifiers):
                pass

            async def on_menu_open(self, menu_id):
                pass

        class FastHook(GUIShellHook):
            async def on_window_create(self, window):
                order.append("fast")

            async def on_window_focus(self, window):
                pass

            async def on_window_close(self, window_id):
                pass

            async def on_mouse_move(self, x, y, hovering):
                pass

            async def on_key_press(self, key, modifiers):
                pass

            async def on_menu_open(self, menu_id):
                pass

        broadcaster.add_hook(SlowHook())
        broadcaster.add_hook(FastHook())

        window = Window(id="test", title="Test", type=WindowType.TERMINAL)
        await broadcaster.on_window_create(window)

        # Fast should complete first due to concurrent dispatch
        assert order == ["fast", "slow"]
