"""
Visual Shell Hook System - Event-driven instrumentation for AI perception.

Provides abstract hook interface and broadcaster pattern following the
RISC-V hooks.rs reference implementation.

Architecture:
- VisualShellHook: Abstract base class for event handlers
- VisualShellHookBroadcaster: Dispatches events to all registered hooks
- Async dispatch for non-blocking operation

Usage:
    class MyHook(VisualShellHook):
        async def on_window_create(self, id, title, pos, size):
            print(f"Window created: {title}")

    broadcaster = VisualShellHookBroadcaster()
    broadcaster.add_hook(MyHook())
    await broadcaster.on_window_create(1, "Terminal", (0, 0), (80, 24))
"""

from abc import ABC, abstractmethod
from typing import List, Tuple, Optional, Any
import asyncio
import logging

logger = logging.getLogger(__name__)


class VisualShellHook(ABC):
    """
    Abstract base class for Visual Shell event hooks.

    Implement this interface to receive events from the Visual Shell
    window manager, fragment renderer, and other components.

    All methods are async to enable non-blocking event dispatch.
    """

    @abstractmethod
    async def on_window_create(
        self,
        id: int,
        title: str,
        pos: Tuple[int, int],
        size: Tuple[int, int]
    ) -> None:
        """
        Called when a new window is created.

        Args:
            id: Unique window identifier
            title: Window title text
            pos: (x, y) position tuple
            size: (width, height) size tuple
        """
        pass

    @abstractmethod
    async def on_window_focus(self, id: int) -> None:
        """
        Called when a window gains focus.

        Args:
            id: Window identifier that gained focus
        """
        pass

    @abstractmethod
    async def on_window_close(self, id: int) -> None:
        """
        Called when a window is closed.

        Args:
            id: Window identifier being closed
        """
        pass

    @abstractmethod
    async def on_fragment_update(
        self,
        fragment_count: int,
        memory_mb: float
    ) -> None:
        """
        Called when fragment state is updated.

        Args:
            fragment_count: Total number of active fragments
            memory_mb: Total memory usage in megabytes
        """
        pass


class VisualShellHookBroadcaster(VisualShellHook):
    """
    Broadcasts Visual Shell events to multiple registered hooks.

    Follows the RiscvHookBroadcaster pattern from hooks.rs:
    - Maintains a list of registered hooks
    - Implements the same interface and dispatches to all hooks
    - Uses async dispatch for non-blocking operation

    Example:
        broadcaster = VisualShellHookBroadcaster()
        broadcaster.add_hook(AsciiSceneHook())
        broadcaster.add_hook(LoggingHook())

        # Dispatch to all hooks concurrently
        await broadcaster.on_window_create(1, "Terminal", (0, 0), (80, 24))
    """

    def __init__(self):
        """Initialize the broadcaster with an empty hook list."""
        self._hooks: List[VisualShellHook] = []
        self._lock = asyncio.Lock()

    def add_hook(self, hook: VisualShellHook) -> None:
        """
        Register a hook to receive events.

        Args:
            hook: VisualShellHook instance to register
        """
        self._hooks.append(hook)
        logger.debug(f"Registered hook: {hook.__class__.__name__}")

    def remove_hook(self, hook: VisualShellHook) -> bool:
        """
        Unregister a hook.

        Args:
            hook: VisualShellHook instance to remove

        Returns:
            True if hook was found and removed, False otherwise
        """
        try:
            self._hooks.remove(hook)
            logger.debug(f"Unregistered hook: {hook.__class__.__name__}")
            return True
        except ValueError:
            return False

    @property
    def hooks(self) -> List[VisualShellHook]:
        """Get list of registered hooks (read-only access)."""
        return list(self._hooks)

    async def on_window_create(
        self,
        id: int,
        title: str,
        pos: Tuple[int, int],
        size: Tuple[int, int]
    ) -> None:
        """Dispatch window creation to all registered hooks."""
        tasks = [
            hook.on_window_create(id, title, pos, size)
            for hook in self._hooks
        ]
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)

    async def on_window_focus(self, id: int) -> None:
        """Dispatch window focus to all registered hooks."""
        tasks = [hook.on_window_focus(id) for hook in self._hooks]
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)

    async def on_window_close(self, id: int) -> None:
        """Dispatch window close to all registered hooks."""
        tasks = [hook.on_window_close(id) for hook in self._hooks]
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)

    async def on_fragment_update(
        self,
        fragment_count: int,
        memory_mb: float
    ) -> None:
        """Dispatch fragment update to all registered hooks."""
        tasks = [
            hook.on_fragment_update(fragment_count, memory_mb)
            for hook in self._hooks
        ]
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)


# Convenience base classes for common hook patterns

class LoggingHook(VisualShellHook):
    """
    Simple logging hook that prints all events.

    Useful for debugging and monitoring.
    """

    async def on_window_create(
        self,
        id: int,
        title: str,
        pos: Tuple[int, int],
        size: Tuple[int, int]
    ) -> None:
        logger.info(
            f"[Window Create] id={id} title='{title}' "
            f"pos={pos} size={size}"
        )

    async def on_window_focus(self, id: int) -> None:
        logger.info(f"[Window Focus] id={id}")

    async def on_window_close(self, id: int) -> None:
        logger.info(f"[Window Close] id={id}")

    async def on_fragment_update(
        self,
        fragment_count: int,
        memory_mb: float
    ) -> None:
        logger.info(
            f"[Fragment Update] count={fragment_count} memory={memory_mb:.2f}MB"
        )


class NoOpHook(VisualShellHook):
    """
    No-op hook that does nothing.

    Useful as a base class for partial implementations or testing.
    """

    async def on_window_create(
        self,
        id: int,
        title: str,
        pos: Tuple[int, int],
        size: Tuple[int, int]
    ) -> None:
        pass

    async def on_window_focus(self, id: int) -> None:
        pass

    async def on_window_close(self, id: int) -> None:
        pass

    async def on_fragment_update(
        self,
        fragment_count: int,
        memory_mb: float
    ) -> None:
        pass


# Demo / Test
if __name__ == "__main__":
    import sys

    async def demo():
        """Demonstrate hook broadcaster usage."""
        broadcaster = VisualShellHookBroadcaster()

        # Add logging hook
        broadcaster.add_hook(LoggingHook())

        # Add custom hook
        class DemoHook(VisualShellHook):
            async def on_window_create(self, id, title, pos, size):
                print(f"Demo: New window '{title}' at {pos}")

            async def on_window_focus(self, id):
                print(f"Demo: Window {id} focused")

            async def on_window_close(self, id):
                print(f"Demo: Window {id} closed")

            async def on_fragment_update(self, fragment_count, memory_mb):
                print(f"Demo: {fragment_count} fragments, {memory_mb}MB")

        broadcaster.add_hook(DemoHook())

        print("=== Visual Shell Hook Demo ===\n")

        print("Creating window...")
        await broadcaster.on_window_create(1, "Terminal", (0, 0), (80, 24))

        print("\nFocusing window...")
        await broadcaster.on_window_focus(1)

        print("\nUpdating fragments...")
        await broadcaster.on_fragment_update(42, 128.5)

        print("\nClosing window...")
        await broadcaster.on_window_close(1)

        print(f"\nTotal hooks registered: {len(broadcaster.hooks)}")

    asyncio.run(demo())
