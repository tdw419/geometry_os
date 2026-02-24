"""
Geometry OS ASCII GUI Module

A dual-audience interface where every GUI state is exposed as ASCII fragments.
Components:
- GUIFragmentRenderer: Converts GUI state to ASCII fragments
- GUICommandProcessor: Processes YAML commands to GUI actions
- GUIHookBroadcaster: Event dispatch system for GUI hooks
"""

__version__ = "0.1.0"

from .hooks import (
    GUIShellHook,
    GUIHookBroadcaster,
    NoOpGUIHook,
    LoggingGUITHook,
)

__all__ = [
    # Hooks
    "GUIShellHook",
    "GUIHookBroadcaster",
    "NoOpGUIHook",
    "LoggingGUITHook",
]
