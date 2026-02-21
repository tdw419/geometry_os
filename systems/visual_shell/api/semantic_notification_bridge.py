#!/usr/bin/env python3
"""
Semantic Notification Bridge

Connects WordPress semantic publishing to PixelRTS v3 geometric terminal.
Transforms agent publications into terminal notifications with proper
color coding and formatting.

Terminal Color Index (16-color):
  9  = Bright Red (errors)
  10 = Bright Green (success/evolution)
  11 = Bright Yellow (warnings)
  12 = Bright Blue (info)
  14 = Bright Cyan (general updates)
"""

import re
from dataclasses import dataclass
from typing import Optional
from datetime import datetime


@dataclass
class NotificationEvent:
    """A semantic event from WordPress publishing."""

    title: str
    content: str
    url: str
    timestamp: Optional[str] = None
    color_index: int = 14  # Default: bright cyan

    def __post_init__(self):
        """Auto-assign color based on title keywords."""
        title_lower = self.title.lower()

        # Determine color from keywords
        if any(kw in title_lower for kw in ['error', 'failed', 'crash', 'critical']):
            self.color_index = 9  # Bright red
        elif any(kw in title_lower for kw in ['breakthrough', 'success', 'complete', 'evolution']):
            self.color_index = 10  # Bright green
        elif any(kw in title_lower for kw in ['warning', 'caution', 'alert']):
            self.color_index = 11  # Bright yellow
        elif any(kw in title_lower for kw in ['info', 'status', 'update', 'metric']):
            self.color_index = 14  # Bright cyan
        else:
            self.color_index = 12  # Bright blue (default)

        # Set timestamp if not provided
        if self.timestamp is None:
            self.timestamp = datetime.now().strftime("%H:%M:%S")


class SemanticNotificationBridge:
    """Bridge between WordPress events and geometric terminal notifications."""

    MAX_WIDTH = 80  # Standard terminal width

    def format_for_terminal(self, event: NotificationEvent) -> str:
        """
        Format a notification event for terminal display.

        Output format: [HH:MM:SS] Title - Content (stripped)
        """
        # Strip HTML tags from content
        clean_content = self._strip_html(event.content)

        # Truncate content to fit width
        prefix = f"[{event.timestamp}] "
        available = self.MAX_WIDTH - len(prefix) - 3  # 3 for " - "

        if len(event.title) + len(clean_content) > available:
            # Truncate combined, prefer title
            title_space = min(len(event.title), available // 2)
            content_space = available - title_space - 3
            truncated_title = event.title[:title_space]
            truncated_content = clean_content[:content_space]
        else:
            truncated_title = event.title
            truncated_content = clean_content

        # Combine
        if truncated_content:
            return f"{prefix}{truncated_title} - {truncated_content}"
        else:
            return f"{prefix}{truncated_title}"

    def _strip_html(self, text: str) -> str:
        """Remove HTML tags from text."""
        # Remove tags
        clean = re.sub(r'<[^>]+>', '', text)
        # Decode common entities
        clean = clean.replace('&nbsp;', ' ')
        clean = clean.replace('&amp;', '&')
        clean = clean.replace('&lt;', '<')
        clean = clean.replace('&gt;', '>')
        # Collapse whitespace
        clean = re.sub(r'\s+', ' ', clean).strip()
        return clean

    def to_terminal_opcode(self, event: NotificationEvent) -> dict:
        """
        Convert notification to PixelRTS v3 terminal opcode format.

        Returns dict suitable for WebSocket transmission to terminal.
        """
        formatted = self.format_for_terminal(event)
        return {
            "type": "terminal_notification",
            "text": formatted,
            "color": event.color_index,
            "flags": 1,  # Bold
            "url": event.url,
        }
