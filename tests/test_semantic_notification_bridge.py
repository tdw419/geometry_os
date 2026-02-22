#!/usr/bin/env python3
"""Tests for Semantic Notification Bridge - WordPress to Terminal."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from systems.visual_shell.api.semantic_notification_bridge import (
    SemanticNotificationBridge,
    NotificationEvent,
)


def test_notification_event_creation():
    """Test creating a notification event from WordPress data."""
    event = NotificationEvent(
        title="Generation 500: PAS Score Breakthrough",
        content="<p>Neural kernel stability reached 0.99</p>",
        url="http://localhost:8080/?p=123",
    )

    assert event.title == "Generation 500: PAS Score Breakthrough"
    assert "stability" in event.content
    assert event.color_index == 10  # Bright green for breakthrough


def test_notification_event_categories():
    """Test color assignment based on event category."""
    # Evolution breakthrough = bright green
    event = NotificationEvent(title="Evolution Success", content="", url="")
    assert event.color_index == 10

    # Error = bright red
    event = NotificationEvent(title="Error: Connection Failed", content="", url="")
    assert event.color_index == 9

    # Warning = bright yellow
    event = NotificationEvent(title="Warning: Memory Low", content="", url="")
    assert event.color_index == 11

    # Info = bright cyan
    event = NotificationEvent(title="System Status Update", content="", url="")
    assert event.color_index == 14


def test_bridge_format_for_terminal():
    """Test formatting notification for geometric terminal."""
    bridge = SemanticNotificationBridge()

    event = NotificationEvent(
        title="Evolution Complete",
        content="PAS score: 0.95",
        url="http://localhost:8080/?p=456",
        timestamp="14:32:05",
    )

    formatted = bridge.format_for_terminal(event)

    assert formatted.startswith("[14:32:05]")
    assert "Evolution Complete" in formatted
    assert len(formatted) <= 80  # Fits in terminal width


def test_bridge_strips_html():
    """Test HTML stripping from content."""
    bridge = SemanticNotificationBridge()

    event = NotificationEvent(
        title="Test",
        content="<p>Hello <b>World</b></p>",
        url="",
        timestamp="00:00:00",
    )

    formatted = bridge.format_for_terminal(event)
    assert "<p>" not in formatted
    assert "<b>" not in formatted
    assert "Hello World" in formatted


def test_to_terminal_opcode():
    """Test conversion to terminal opcode format."""
    bridge = SemanticNotificationBridge()

    event = NotificationEvent(
        title="Test Event",
        content="Test content",
        url="http://example.com",
        timestamp="12:00:00",
    )

    opcode = bridge.to_terminal_opcode(event)

    assert opcode['type'] == 'terminal_notification'
    assert opcode['color'] == 12  # Default blue
    assert opcode['flags'] == 1  # Bold
    assert opcode['url'] == "http://example.com"
    assert 'Test Event' in opcode['text']


if __name__ == "__main__":
    test_notification_event_creation()
    test_notification_event_categories()
    test_bridge_format_for_terminal()
    test_bridge_strips_html()
    test_to_terminal_opcode()
    print("✅ All 6 tests passed!")
