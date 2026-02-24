"""
Data models for ASCII GUI system.

Defines all dataclasses for windows, focus, mouse, keyboard, menus, panels, and commands.
These models serialize to YAML for AI consumption.
"""

from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum
from typing import Any, Dict, List, Optional, Tuple

import yaml


class WindowType(Enum):
    """Window type classification."""
    TERMINAL = "terminal"
    EDITOR = "editor"
    BROWSER = "browser"
    DIALOG = "dialog"
    PANEL = "panel"
    UTILITY = "utility"


class PanelType(Enum):
    """Panel type classification."""
    SIDEBAR = "sidebar"
    BOTTOM = "bottom"
    TOP = "top"
    FLOATING = "floating"


@dataclass
class Window:
    """Represents a GUI window."""
    id: str
    title: str
    type: WindowType
    pos: Tuple[int, int] = (0, 0)  # (x, y)
    size: Tuple[int, int] = (640, 480)  # (width, height)
    z: int = 0  # z-order
    focused: bool = False
    visible: bool = True
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "id": self.id,
            "title": self.title,
            "type": self.type.value,
            "pos": list(self.pos),
            "size": list(self.size),
            "z": self.z,
            "focused": self.focused,
            "visible": self.visible,
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Window":
        """Create from dict."""
        return cls(
            id=data["id"],
            title=data["title"],
            type=WindowType(data["type"]),
            pos=tuple(data.get("pos", [0, 0])),
            size=tuple(data.get("size", [640, 480])),
            z=data.get("z", 0),
            focused=data.get("focused", False),
            visible=data.get("visible", True),
            metadata=data.get("metadata", {}),
        )


@dataclass
class FocusState:
    """Represents current focus state."""
    window_id: Optional[str] = None
    window_title: Optional[str] = None
    element: Optional[str] = None  # e.g., "textarea[0]", "button#submit"
    cursor_pos: Tuple[int, int] = (0, 0)  # (col, row)
    mode: str = "normal"  # normal, insert, visual, command

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "window_id": self.window_id,
            "window_title": self.window_title,
            "element": self.element,
            "cursor_pos": list(self.cursor_pos),
            "mode": self.mode,
        }

    def to_ascii_box(self, width: int = 80) -> str:
        """Format as ASCII box for quick scanning."""
        lines = [
            "+" + "-" * (width - 2) + "+",
            "| FOCUS STATE" + " " * (width - 14) + "|",
            "+" + "-" * (width - 2) + "+",
        ]

        window_str = f"{self.window_id or 'none'}"
        if self.window_title:
            window_str += f" ({self.window_title})"
        lines.append(f"| Window:     {window_str}" + " " * (width - 14 - len(window_str)) + "|")

        element_str = self.element or "none"
        lines.append(f"| Element:    {element_str}" + " " * (width - 14 - len(element_str)) + "|")

        cursor_str = f"({self.cursor_pos[0]}, {self.cursor_pos[1]})"
        lines.append(f"| Cursor:     {cursor_str}" + " " * (width - 14 - len(cursor_str)) + "|")

        lines.append(f"| Mode:       {self.mode}" + " " * (width - 14 - len(self.mode)) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        return "\n".join(lines)


@dataclass
class MouseState:
    """Represents current mouse state."""
    x: int = 0
    y: int = 0
    buttons: List[str] = field(default_factory=list)  # ["left", "right", "middle"]
    hovering: Optional[str] = None  # Element under cursor

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "x": self.x,
            "y": self.y,
            "buttons": self.buttons,
            "hovering": self.hovering,
        }

    def to_ascii_box(self, width: int = 80) -> str:
        """Format as ASCII box for quick scanning."""
        lines = [
            "+" + "-" * (width - 2) + "+",
            "| MOUSE STATE" + " " * (width - 14) + "|",
            "+" + "-" * (width - 2) + "+",
        ]

        pos_str = f"({self.x}, {self.y})"
        lines.append(f"| Position:   {pos_str}" + " " * (width - 14 - len(pos_str)) + "|")

        buttons_str = ", ".join(self.buttons) if self.buttons else "none"
        lines.append(f"| Buttons:    {buttons_str}" + " " * (width - 14 - len(buttons_str)) + "|")

        hover_str = self.hovering or "none"
        lines.append(f"| Hovering:   {hover_str}" + " " * (width - 14 - len(hover_str)) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        return "\n".join(lines)


@dataclass
class KeyboardState:
    """Represents current keyboard state."""
    pressed_keys: List[str] = field(default_factory=list)  # Currently held keys
    modifiers: List[str] = field(default_factory=list)  # ["ctrl", "alt", "shift", "meta"]
    last_key: Optional[str] = None
    last_key_time: Optional[str] = None  # ISO timestamp

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "pressed_keys": self.pressed_keys,
            "modifiers": self.modifiers,
            "last_key": self.last_key,
            "last_key_time": self.last_key_time,
        }

    def to_ascii_box(self, width: int = 80) -> str:
        """Format as ASCII box for quick scanning."""
        lines = [
            "+" + "-" * (width - 2) + "+",
            "| KEYBOARD STATE" + " " * (width - 16) + "|",
            "+" + "-" * (width - 2) + "+",
        ]

        mods_str = "+".join(self.modifiers) if self.modifiers else "none"
        lines.append(f"| Modifiers:  {mods_str}" + " " * (width - 14 - len(mods_str)) + "|")

        pressed_str = ", ".join(self.pressed_keys) if self.pressed_keys else "none"
        lines.append(f"| Pressed:    {pressed_str}" + " " * (width - 14 - len(pressed_str)) + "|")

        last_str = self.last_key or "none"
        lines.append(f"| Last Key:   {last_str}" + " " * (width - 14 - len(last_str)) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        return "\n".join(lines)


@dataclass
class MenuItem:
    """Represents a menu item."""
    id: str
    label: str
    shortcut: Optional[str] = None  # e.g., "Ctrl+S"
    enabled: bool = True
    checked: Optional[bool] = None  # For checkbox menu items
    submenu: List["MenuItem"] = field(default_factory=list)

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "id": self.id,
            "label": self.label,
            "shortcut": self.shortcut,
            "enabled": self.enabled,
            "checked": self.checked,
            "submenu": [item.to_yaml_dict() for item in self.submenu],
        }


@dataclass
class Menu:
    """Represents a menu bar menu."""
    id: str
    label: str
    items: List[MenuItem] = field(default_factory=list)

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "id": self.id,
            "label": self.label,
            "items": [item.to_yaml_dict() for item in self.items],
        }


@dataclass
class Panel:
    """Represents a UI panel."""
    id: str
    type: PanelType
    title: Optional[str] = None
    size: int = 200  # Width for sidebars, height for top/bottom
    collapsed: bool = False
    visible: bool = True
    content_type: Optional[str] = None  # e.g., "file-tree", "output", "debug"

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        return {
            "id": self.id,
            "type": self.type.value,
            "title": self.title,
            "size": self.size,
            "collapsed": self.collapsed,
            "visible": self.visible,
            "content_type": self.content_type,
        }


# Valid command actions
VALID_ACTIONS = frozenset([
    "click",      # Click at position or on element
    "type",       # Type text
    "key",        # Press key(s)
    "move",       # Move mouse
    "scroll",     # Scroll direction
    "drag",       # Drag from A to B
    "resize",     # Resize window
    "close",      # Close window
    "focus",      # Focus window/element
    "menu",       # Open menu
])


@dataclass
class Command:
    """Represents a GUI command from AI."""
    command_id: str
    action: str
    timestamp: datetime
    target: Optional[str] = None  # Window ID or element selector
    position: Optional[Tuple[int, int]] = None  # (x, y)
    text: Optional[str] = None  # For "type" action
    keys: Optional[List[str]] = None  # For "key" action
    direction: Optional[str] = None  # For "scroll": up, down, left, right
    delta: Optional[Tuple[int, int]] = None  # For "resize", "drag"
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Validate action is valid."""
        if self.action not in VALID_ACTIONS:
            raise ValueError(f"Invalid action: {self.action}. Valid: {VALID_ACTIONS}")

    def to_yaml(self) -> str:
        """Serialize to YAML string."""
        data = {
            "command_id": self.command_id,
            "action": self.action,
            "timestamp": self.timestamp.isoformat(),
            "target": self.target,
            "position": list(self.position) if self.position else None,
            "text": self.text,
            "keys": self.keys,
            "direction": self.direction,
            "delta": list(self.delta) if self.delta else None,
            "metadata": self.metadata,
        }
        return yaml.dump(data, default_flow_style=False, sort_keys=False)

    @classmethod
    def from_yaml(cls, yaml_str: str) -> "Command":
        """Deserialize from YAML string."""
        data = yaml.safe_load(yaml_str)
        return cls(
            command_id=data["command_id"],
            action=data["action"],
            timestamp=datetime.fromisoformat(data["timestamp"]),
            target=data.get("target"),
            position=tuple(data["position"]) if data.get("position") else None,
            text=data.get("text"),
            keys=data.get("keys"),
            direction=data.get("direction"),
            delta=tuple(data["delta"]) if data.get("delta") else None,
            metadata=data.get("metadata", {}),
        )

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dict for serialization."""
        return {
            "command_id": self.command_id,
            "action": self.action,
            "timestamp": self.timestamp.isoformat(),
            "target": self.target,
            "position": list(self.position) if self.position else None,
            "text": self.text,
            "keys": self.keys,
            "direction": self.direction,
            "delta": list(self.delta) if self.delta else None,
            "metadata": self.metadata,
        }
