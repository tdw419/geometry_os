"""
ASCII GUI Hook System - Event-driven instrumentation for GUI state changes.

Provides abstract hook interface and broadcaster pattern following the
VisualShellHook pattern.

Architecture:
- GUIShellHook: Abstract base class for GUI event handlers
- GUIHookBroadcaster: Dispatches events to all registered hooks
- Async dispatch for non-blocking operation

Events:
- window_create: New window created
- window_focus: Window focus changed
- window_close: Window closed
- mouse_move: Mouse position changed
- key_press: Key pressed
- menu_open: Menu opened

Usage:
    class MyHook(GUIShellHook):
        async def on_window_create(self, window):
            print(f"Window created: {window.title}")

    broadcaster = GUIHookBroadcaster()
    broadcaster.add_hook(MyHook())
    await broadcaster.on_window_create(window)
"""

from abc import ABC, abstractmethod
from typing import List, Optional, TYPE_CHECKING
import asyncio
import logging

if TYPE_CHECKING:
    from .models import Window

logger = logging.getLogger(__name__)


class GUIShellHook(ABC):
    """
    Abstract base class for ASCII GUI event hooks.

    Implement this interface to receive events from the GUI system
    including window management, input events, and menu interactions.

    All methods are async to enable non-blocking event dispatch.
    """

    @abstractmethod
    async def on_window_create(self, window: "Window") -> None:
        """
        Called when a new window is created.

        Args:
            window: The Window object that was created
        """
        pass

    @abstractmethod
    async def on_window_focus(self, window: "Window") -> None:
        """
        Called when a window gains focus.

        Args:
            window: The Window object that gained focus
        """
        pass

    @abstractmethod
    async def on_window_close(self, window_id: str) -> None:
        """
        Called when a window is closed.

        Args:
            window_id: The ID of the window being closed
        """
        pass

    @abstractmethod
    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str]) -> None:
        """
        Called when mouse position changes.

        Args:
            x: Mouse X coordinate
            y: Mouse Y coordinate
            hovering: Element selector under cursor, if any
        """
        pass

    @abstractmethod
    async def on_key_press(self, key: str, modifiers: List[str]) -> None:
        """
        Called when a key is pressed.

        Args:
            key: The key that was pressed
            modifiers: Active modifiers (ctrl, alt, shift, meta)
        """
        pass

    @abstractmethod
    async def on_menu_open(self, menu_id: str) -> None:
        """
        Called when a menu is opened.

        Args:
            menu_id: The ID of the menu being opened
        """
        pass


class GUIHookBroadcaster(GUIShellHook):
    """
    Broadcasts GUI events to multiple registered hooks.

    Follows the VisualShellHookBroadcaster pattern:
    - Maintains a list of registered hooks
    - Implements the same interface and dispatches to all hooks
    - Uses async dispatch with return_exceptions=True for fault tolerance

    Example:
        broadcaster = GUIHookBroadcaster()
        broadcaster.add_hook(FragmentRendererHook())
        broadcaster.add_hook(LoggingHook())

        # Dispatch to all hooks concurrently
        await broadcaster.on_window_create(window)
    """

    def __init__(self):
        """Initialize the broadcaster with an empty hook list."""
        self._hooks: List[GUIShellHook] = []

    def add_hook(self, hook: GUIShellHook) -> None:
        """
        Register a hook to receive events.

        Args:
            hook: GUIShellHook instance to register
        """
        self._hooks.append(hook)
        logger.debug(f"Registered GUI hook: {hook.__class__.__name__}")

    def remove_hook(self, hook: GUIShellHook) -> bool:
        """
        Unregister a hook.

        Args:
            hook: GUIShellHook instance to remove

        Returns:
            True if hook was found and removed, False otherwise
        """
        try:
            self._hooks.remove(hook)
            logger.debug(f"Unregistered GUI hook: {hook.__class__.__name__}")
            return True
        except ValueError:
            return False

    @property
    def hooks(self) -> List[GUIShellHook]:
        """Get list of registered hooks (read-only access)."""
        return list(self._hooks)

    async def _dispatch(self, coroutines: list) -> None:
        """
        Dispatch coroutines to all hooks with exception handling.

        Uses gather with return_exceptions=True to ensure all hooks
        receive events even if some fail.

        Args:
            coroutines: List of awaitables to dispatch
        """
        if coroutines:
            results = await asyncio.gather(*coroutines, return_exceptions=True)
            # Log any exceptions but don't propagate
            for i, result in enumerate(results):
                if isinstance(result, Exception):
                    logger.error(
                        f"Hook {self._hooks[i].__class__.__name__} raised: {result}"
                    )

    async def on_window_create(self, window: "Window") -> None:
        """Dispatch window creation to all registered hooks."""
        await self._dispatch([
            hook.on_window_create(window) for hook in self._hooks
        ])

    async def on_window_focus(self, window: "Window") -> None:
        """Dispatch window focus to all registered hooks."""
        await self._dispatch([
            hook.on_window_focus(window) for hook in self._hooks
        ])

    async def on_window_close(self, window_id: str) -> None:
        """Dispatch window close to all registered hooks."""
        await self._dispatch([
            hook.on_window_close(window_id) for hook in self._hooks
        ])

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str]) -> None:
        """Dispatch mouse move to all registered hooks."""
        await self._dispatch([
            hook.on_mouse_move(x, y, hovering) for hook in self._hooks
        ])

    async def on_key_press(self, key: str, modifiers: List[str]) -> None:
        """Dispatch key press to all registered hooks."""
        await self._dispatch([
            hook.on_key_press(key, modifiers) for hook in self._hooks
        ])

    async def on_menu_open(self, menu_id: str) -> None:
        """Dispatch menu open to all registered hooks."""
        await self._dispatch([
            hook.on_menu_open(menu_id) for hook in self._hooks
        ])


# Convenience base classes

class LoggingGUITHook(GUIShellHook):
    """
    Simple logging hook that prints all GUI events.

    Useful for debugging and monitoring.
    """

    async def on_window_create(self, window: "Window") -> None:
        logger.info(f"[GUI] Window created: id={window.id} title='{window.title}'")

    async def on_window_focus(self, window: "Window") -> None:
        logger.info(f"[GUI] Window focused: id={window.id} title='{window.title}'")

    async def on_window_close(self, window_id: str) -> None:
        logger.info(f"[GUI] Window closed: id={window_id}")

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str]) -> None:
        logger.info(f"[GUI] Mouse moved: ({x}, {y}) hovering={hovering}")

    async def on_key_press(self, key: str, modifiers: List[str]) -> None:
        mods = "+".join(modifiers) + "+" if modifiers else ""
        logger.info(f"[GUI] Key pressed: {mods}{key}")

    async def on_menu_open(self, menu_id: str) -> None:
        logger.info(f"[GUI] Menu opened: {menu_id}")


class NoOpGUIHook(GUIShellHook):
    """
    No-op hook that does nothing.

    Useful as a base class for partial implementations or testing.
    """

    async def on_window_create(self, window: "Window") -> None:
        pass

    async def on_window_focus(self, window: "Window") -> None:
        pass

    async def on_window_close(self, window_id: str) -> None:
        pass

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str]) -> None:
        pass

    async def on_key_press(self, key: str, modifiers: List[str]) -> None:
        pass

    async def on_menu_open(self, menu_id: str) -> None:
        pass


# Demo / Test
if __name__ == "__main__":
    import sys
    from .models import Window, WindowType

    async def demo():
        """Demonstrate hook broadcaster usage."""
        broadcaster = GUIHookBroadcaster()

        # Add logging hook
        broadcaster.add_hook(LoggingGUITHook())

        # Add custom hook
        class DemoHook(GUIShellHook):
            async def on_window_create(self, window):
                print(f"Demo: New window '{window.title}'")

            async def on_window_focus(self, window):
                print(f"Demo: Window '{window.id}' focused")

            async def on_window_close(self, window_id):
                print(f"Demo: Window {window_id} closed")

            async def on_mouse_move(self, x, y, hovering):
                print(f"Demo: Mouse at ({x}, {y})")

            async def on_key_press(self, key, modifiers):
                print(f"Demo: Key {key} pressed")

            async def on_menu_open(self, menu_id):
                print(f"Demo: Menu {menu_id} opened")

        broadcaster.add_hook(DemoHook())

        print("=== ASCII GUI Hook Demo ===\n")

        window = Window(id="win-1", title="Terminal", type=WindowType.TERMINAL)

        print("Creating window...")
        await broadcaster.on_window_create(window)

        print("\nFocusing window...")
        await broadcaster.on_window_focus(window)

        print("\nMoving mouse...")
        await broadcaster.on_mouse_move(100, 200, "button#submit")

        print("\nPressing key...")
        await broadcaster.on_key_press("Enter", [])

        print("\nOpening menu...")
        await broadcaster.on_menu_open("file-menu")

        print("\nClosing window...")
        await broadcaster.on_window_close("win-1")

        print(f"\nTotal hooks registered: {len(broadcaster.hooks)}")

    asyncio.run(demo())
