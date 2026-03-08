#!/usr/bin/env python3
"""
Tests for UITransmuter wrapper in evolution daemon.

The wrapper reuses the existing UITransmuter from the conductor track,
providing a clean import path for the evolution daemon.
"""

import pytest
import json
import tempfile
from pathlib import Path


class TestUITransmuterWrapper:
    """Test suite for UITransmuter wrapper module."""

    def test_wrapper_imports_existing_transmuter(self):
        """
        Test that wrapper imports UITransmuter from conductor track.

        The wrapper at systems/evolution_daemon/ui_transmuter.py should
        re-export the UITransmuter class from conductor/tracks/shotcut-on-the-map/ui_transmuter.py
        """
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        # Verify it's the real UITransmuter class
        assert hasattr(UITransmuter, 'transmute')
        assert hasattr(UITransmuter, 'transmute_to_file')

    def test_wrapper_transmutes_simple_widget(self):
        """
        Test that wrapped UITransmuter can generate WGSL from widget data.
        """
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter(width=800, height=600)

        extraction_data = {
            "widgets": [
                {
                    "type": "panel",
                    "text": "Test Panel",
                    "bbox": [100, 50, 200, 100]
                }
            ],
            "metadata": {
                "source_image": "test.png"
            }
        }

        wgsl = transmuter.transmute(extraction_data)

        # Verify WGSL output contains expected elements
        assert "// Auto-generated WGSL Shader from UI Transmuter" in wgsl
        assert "sdRoundedBox" in wgsl  # Panel uses rounded box
        assert "panel_0" in wgsl  # Widget naming convention
        assert "@fragment" in wgsl  # Fragment shader entry point


class TestUITransmuterWidgetTypes:
    """Tests for different widget types in UITransmuter."""

    def test_transmute_button_widget(self):
        """Test transmuting a button widget."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "button",
                    "text": "Click Me",
                    "bbox": [10, 10, 100, 40]
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "button_0" in wgsl
        assert "sdRoundedBox" in wgsl  # Button uses rounded box

    def test_transmute_clip_widget(self):
        """Test transmuting a clip widget."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "clip",
                    "text": "Video Clip",
                    "bbox": [0, 100, 300, 50]
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "clip_0" in wgsl
        assert "sdBox" in wgsl  # Clip uses box

    def test_transmute_playhead_widget(self):
        """Test transmuting a playhead widget."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "playhead",
                    "text": "",
                    "bbox": [150, 0, 2, 200]
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "playhead_0" in wgsl
        assert "sdLine" in wgsl  # Playhead uses line

    def test_transmute_unknown_widget_type(self):
        """Test transmuting an unknown widget type."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "custom_widget",
                    "text": "Custom",
                    "bbox": [50, 50, 100, 100]
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        # Unknown type should still generate something
        assert "custom_widget_0" in wgsl
        assert "sdBox" in wgsl  # Falls back to box

    def test_transmute_multiple_widgets(self):
        """Test transmuting multiple widgets of different types."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 500, 400]},
                {"type": "button", "bbox": [10, 10, 80, 30]},
                {"type": "clip", "bbox": [100, 100, 200, 50]},
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "panel_0" in wgsl
        assert "button_1" in wgsl
        assert "clip_2" in wgsl


class TestUITransmuterInputFormats:
    """Tests for different input formats."""

    def test_transmute_from_json_string(self):
        """Test transmuting from JSON string input."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        json_string = json.dumps({
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 100, 100]}
            ]
        })

        wgsl = transmuter.transmute(json_string)

        assert "panel_0" in wgsl

    def test_transmute_empty_widgets(self):
        """Test transmuting with no widgets."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {"widgets": []}

        wgsl = transmuter.transmute(extraction_data)

        # Should still generate valid shader
        assert "@fragment" in wgsl
        assert "fn fragment_main" in wgsl


class TestUITransmuterFileOutput:
    """Tests for file output functionality."""

    def test_transmute_to_file(self):
        """Test transmuting and writing to file."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()

        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "test_output.wgsl"

            extraction_data = {
                "widgets": [
                    {"type": "panel", "bbox": [0, 0, 100, 100]}
                ]
            }

            wgsl = transmuter.transmute_to_file(extraction_data, str(output_path))

            # Check file was created
            assert output_path.exists()

            # Check content matches
            file_content = output_path.read_text()
            assert file_content == wgsl
            assert "panel_0" in file_content

    def test_transmute_to_file_creates_parent_dirs(self):
        """Test that transmute_to_file creates parent directories."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()

        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "nested" / "dirs" / "output.wgsl"

            extraction_data = {"widgets": []}
            transmuter.transmute_to_file(extraction_data, str(output_path))

            assert output_path.exists()


class TestTransmuteExtractionFunction:
    """Tests for the convenience transmute_extraction function."""

    def test_transmute_extraction_basic(self):
        """Test basic transmute_extraction usage."""
        from systems.evolution_daemon.ui_transmuter import transmute_extraction

        extraction_data = {
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30]}
            ]
        }

        wgsl = transmute_extraction(extraction_data)

        assert "button_0" in wgsl

    def test_transmute_extraction_with_output_path(self):
        """Test transmute_extraction with output path."""
        from systems.evolution_daemon.ui_transmuter import transmute_extraction

        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "convenience.wgsl"

            extraction_data = {
                "widgets": [
                    {"type": "panel", "bbox": [0, 0, 200, 100]}
                ]
            }

            wgsl = transmute_extraction(
                extraction_data,
                output_path=str(output_path)
            )

            assert output_path.exists()
            assert "panel_0" in wgsl

    def test_transmute_extraction_custom_dimensions(self):
        """Test transmute_extraction with custom dimensions."""
        from systems.evolution_daemon.ui_transmuter import transmute_extraction

        extraction_data = {
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 3840, 2160]}
            ]
        }

        wgsl = transmute_extraction(
            extraction_data,
            width=3840,
            height=2160
        )

        assert "@fragment" in wgsl


class TestUITransmuterEdgeCases:
    """Tests for edge cases and error handling."""

    def test_transmute_with_metadata(self):
        """Test that metadata is included in output comments."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [],
            "metadata": {
                "source_image": "screenshot.png",
                "timestamp": "2024-01-01"
            }
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "screenshot.png" in wgsl

    def test_transmute_custom_hover_threshold(self):
        """Test transmuter with custom hover threshold."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter(hover_threshold=0.1)
        extraction_data = {
            "widgets": [
                {"type": "button", "bbox": [0, 0, 100, 50]}
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        # Should use custom threshold
        assert "0.1000" in wgsl


class TestUITransmuterWidgetsWithActions:
    """Tests for widgets with action attributes."""

    def test_panel_with_action(self):
        """Test panel widget with action generates pressed state."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "panel",
                    "bbox": [0, 0, 100, 50],
                    "action": "click:submit"
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "panel_0" in wgsl
        assert "mouse_pressed" in wgsl  # Pressed state check

    def test_button_with_action(self):
        """Test button widget with action generates pressed state."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "button",
                    "bbox": [10, 10, 100, 40],
                    "text": "Click Me",
                    "action": "click:handle_click"
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "button_0" in wgsl
        assert "mouse_pressed" in wgsl

    def test_clip_with_action(self):
        """Test clip widget with action generates pressed state."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "clip",
                    "bbox": [0, 100, 300, 50],
                    "action": "click:play_clip"
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "clip_0" in wgsl
        assert "mouse_pressed" in wgsl

    def test_playhead_with_action(self):
        """Test playhead widget with action generates pressed state."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "playhead",
                    "bbox": [150, 0, 2, 200],
                    "action": "drag:seek"
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "playhead_0" in wgsl
        assert "mouse_pressed" in wgsl

    def test_unknown_widget_with_action(self):
        """Test unknown widget type with action generates pressed state."""
        from systems.evolution_daemon.ui_transmuter import UITransmuter

        transmuter = UITransmuter()
        extraction_data = {
            "widgets": [
                {
                    "type": "custom_slider",
                    "bbox": [50, 50, 100, 20],
                    "action": "drag:adjust"
                }
            ]
        }

        wgsl = transmuter.transmute(extraction_data)

        assert "custom_slider_0" in wgsl
        assert "mouse_pressed" in wgsl
