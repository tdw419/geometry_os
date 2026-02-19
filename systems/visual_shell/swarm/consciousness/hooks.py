"""
NeuralCityHook - Abstract hook trait and broadcaster for Neural City events.

This module provides an abstract base class for handling Neural City events
and a broadcaster that dispatches events to all registered hooks.

Based on the RiscvHook pattern from systems/infinite_map_rs/src/riscv/hooks.rs

Part of ASCII Scene Graph expansion for zero-cost AI perception.
"""

from abc import ABC, abstractmethod
from typing import List, Tuple, Optional
import asyncio
import logging

logger = logging.getLogger(__name__)


class NeuralCityHook(ABC):
    """
    Abstract base class for Neural City event hooks.

    Implement this trait to receive callbacks for district updates,
    camera movements, agent relocations, and city health metrics.

    All methods have default no-op implementations for optional overrides.

    Example:
        >>> class LoggingHook(NeuralCityHook):
        ...     def on_district_update(self, name, pos, load, agent_count):
        ...         print(f"District {name} updated: {agent_count} agents")
        ...
        >>> broadcaster = NeuralCityHookBroadcaster()
        >>> broadcaster.add_hook(LoggingHook())
    """

    @abstractmethod
    def on_district_update(
        self,
        name: str,
        pos: Tuple[float, float],
        load: float,
        agent_count: int
    ) -> None:
        """
        Called when a district's state is updated.

        Args:
            name: District name/identifier
            pos: (x, y) position of the district in the city grid
            load: Current load factor (0.0 to 1.0)
            agent_count: Number of agents in the district
        """
        pass

    @abstractmethod
    def on_camera_move(
        self,
        pos: Tuple[float, float],
        zoom: float
    ) -> None:
        """
        Called when the camera/view position changes.

        Args:
            pos: New (x, y) camera position
            zoom: Current zoom level (1.0 = normal, >1 = zoomed in)
        """
        pass

    @abstractmethod
    def on_agent_relocation(
        self,
        agent_id: str,
        from_district: str,
        to_district: str
    ) -> None:
        """
        Called when an agent moves between districts.

        Args:
            agent_id: Unique identifier of the relocated agent
            from_district: Source district name
            to_district: Destination district name
        """
        pass

    @abstractmethod
    def on_city_health(
        self,
        pas_score: float,
        entropy: float
    ) -> None:
        """
        Called with periodic city-wide health metrics.

        Args:
            pas_score: Predictive Agent Stability score (0.0 to 1.0)
            entropy: Current system entropy level
        """
        pass


class NeuralCityHookBroadcaster(NeuralCityHook):
    """
    Broadcasts Neural City events to multiple registered hooks.

    This class implements the NeuralCityHook interface and dispatches
    all events to registered hooks. Uses async dispatch for non-blocking
    operation.

    Example:
        >>> broadcaster = NeuralCityHookBroadcaster()
        >>> broadcaster.add_hook(MyHook())
        >>> broadcaster.add_hook(AnotherHook())
        >>> # Events are broadcast to all hooks
        >>> broadcaster.on_district_update("cognitive", (0, 0), 0.5, 10)

    Attributes:
        hooks: List of registered NeuralCityHook instances
    """

    def __init__(self):
        """Initialize the broadcaster with an empty hook list."""
        self._hooks: List[NeuralCityHook] = []
        self._loop: Optional[asyncio.AbstractEventLoop] = None

    @property
    def hooks(self) -> List[NeuralCityHook]:
        """Get the list of registered hooks."""
        return self._hooks.copy()

    def add_hook(self, hook: NeuralCityHook) -> None:
        """
        Register a hook to receive events.

        Args:
            hook: NeuralCityHook instance to register
        """
        if hook not in self._hooks:
            self._hooks.append(hook)
            logger.debug(f"Registered NeuralCityHook: {hook.__class__.__name__}")

    def remove_hook(self, hook: NeuralCityHook) -> bool:
        """
        Unregister a hook from receiving events.

        Args:
            hook: NeuralCityHook instance to remove

        Returns:
            True if the hook was found and removed, False otherwise
        """
        try:
            self._hooks.remove(hook)
            logger.debug(f"Unregistered NeuralCityHook: {hook.__class__.__name__}")
            return True
        except ValueError:
            return False

    def clear_hooks(self) -> None:
        """Remove all registered hooks."""
        self._hooks.clear()
        logger.debug("Cleared all NeuralCityHooks")

    def _dispatch_async(self, coro) -> None:
        """
        Dispatch a coroutine asynchronously.

        Creates a task if an event loop is available, otherwise logs a warning.

        Args:
            coro: Coroutine to dispatch
        """
        try:
            loop = asyncio.get_running_loop()
            loop.create_task(coro)
        except RuntimeError:
            # No running loop, try to get or create one
            logger.debug("No running event loop, dispatching synchronously")
            try:
                asyncio.run(coro)
            except Exception as e:
                logger.error(f"Error in sync dispatch: {e}")

    async def _safe_call(self, func, *args) -> None:
        """
        Safely call a hook method, catching any exceptions.

        Args:
            func: The hook method to call
            *args: Arguments to pass to the method
        """
        try:
            func(*args)
        except Exception as e:
            logger.error(f"Error in hook {func.__self__.__class__.__name__}: {e}")

    # --- NeuralCityHook interface implementation ---

    def on_district_update(
        self,
        name: str,
        pos: Tuple[float, float],
        load: float,
        agent_count: int
    ) -> None:
        """Broadcast district update to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_district_update, name, pos, load, agent_count)
            )

    def on_camera_move(
        self,
        pos: Tuple[float, float],
        zoom: float
    ) -> None:
        """Broadcast camera movement to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_camera_move, pos, zoom)
            )

    def on_agent_relocation(
        self,
        agent_id: str,
        from_district: str,
        to_district: str
    ) -> None:
        """Broadcast agent relocation to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_agent_relocation, agent_id, from_district, to_district)
            )

    def on_city_health(
        self,
        pas_score: float,
        entropy: float
    ) -> None:
        """Broadcast city health metrics to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_city_health, pas_score, entropy)
            )


# --- Convenience implementations ---

class LoggingHook(NeuralCityHook):
    """
    Simple hook that logs all events to a logger.

    Useful for debugging and monitoring.
    """

    def __init__(self, log_level: int = logging.DEBUG):
        """
        Initialize the logging hook.

        Args:
            log_level: Python logging level to use (default: DEBUG)
        """
        self._log_level = log_level

    def on_district_update(self, name: str, pos: Tuple[float, float],
                           load: float, agent_count: int) -> None:
        logger.log(self._log_level,
                   f"[District] {name} at {pos}: load={load:.2f}, agents={agent_count}")

    def on_camera_move(self, pos: Tuple[float, float], zoom: float) -> None:
        logger.log(self._log_level,
                   f"[Camera] Position: {pos}, zoom: {zoom:.2f}")

    def on_agent_relocation(self, agent_id: str, from_district: str,
                            to_district: str) -> None:
        logger.log(self._log_level,
                   f"[Relocation] Agent {agent_id}: {from_district} -> {to_district}")

    def on_city_health(self, pas_score: float, entropy: float) -> None:
        logger.log(self._log_level,
                   f"[Health] PAS: {pas_score:.2f}, entropy: {entropy:.2f}")


class CallbackHook(NeuralCityHook):
    """
    Hook that uses callback functions for each event type.

    Useful for quick integration without creating a full subclass.

    Example:
        >>> hook = CallbackHook(
        ...     on_district=lambda n, p, l, a: print(f"District: {n}"),
        ...     on_relocate=lambda aid, f, t: print(f"Move: {aid}")
        ... )
    """

    def __init__(
        self,
        on_district: Optional[callable] = None,
        on_camera: Optional[callable] = None,
        on_relocate: Optional[callable] = None,
        on_health: Optional[callable] = None
    ):
        """
        Initialize with optional callbacks for each event type.

        Args:
            on_district: Callback for district updates (name, pos, load, count)
            on_camera: Callback for camera moves (pos, zoom)
            on_relocate: Callback for agent relocations (id, from, to)
            on_health: Callback for city health (pas_score, entropy)
        """
        self._on_district = on_district
        self._on_camera = on_camera
        self._on_relocate = on_relocate
        self._on_health = on_health

    def on_district_update(self, name: str, pos: Tuple[float, float],
                           load: float, agent_count: int) -> None:
        if self._on_district:
            self._on_district(name, pos, load, agent_count)

    def on_camera_move(self, pos: Tuple[float, float], zoom: float) -> None:
        if self._on_camera:
            self._on_camera(pos, zoom)

    def on_agent_relocation(self, agent_id: str, from_district: str,
                            to_district: str) -> None:
        if self._on_relocate:
            self._on_relocate(agent_id, from_district, to_district)

    def on_city_health(self, pas_score: float, entropy: float) -> None:
        if self._on_health:
            self._on_health(pas_score, entropy)
