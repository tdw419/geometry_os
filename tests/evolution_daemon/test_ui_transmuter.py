#!/usr/bin/env python3
"""
Tests for UITransmuter wrapper in evolution daemon.

The wrapper reuses the existing UITransmuter from the conductor track,
providing a clean import path for the evolution daemon.
"""

import pytest


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
