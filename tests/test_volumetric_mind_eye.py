"""
Tests for Volumetric Mind's Eye 3D visualization.

Verifies Three.js scene setup and WebSocket integration.
"""


import pytest


class TestVolumetricMindEyeJS:
    """Tests for VolumetricMindEye JavaScript class."""

    def test_file_exists(self):
        """Verify VolumetricMindEye.js was created."""
        import os
        js_path = "systems/visual_shell/web/VolumetricMindEye.js"
        assert os.path.exists(js_path), f"Missing {js_path}"

    def test_html_file_exists(self):
        """Verify volumetric_minds_eye.html was created."""
        import os
        html_path = "systems/visual_shell/web/volumetric_minds_eye.html"
        assert os.path.exists(html_path), f"Missing {html_path}"

    def test_js_exports_class(self):
        """Verify JS exports VolumetricMindEye class."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "export class VolumetricMindEye" in content

    def test_js_has_threejs_import(self):
        """Verify JS imports Three.js."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "from 'three'" in content or "import * as THREE" in content

    def test_js_has_websocket(self):
        """Verify JS connects to WebSocket."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "WebSocket" in content
        assert "ws://localhost:3002" in content

    def test_js_handles_3d_tokens(self):
        """Verify JS handles TOKEN_RENDER_3D messages."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "TOKEN_RENDER_3D" in content or "Token3D" in content

    def test_html_has_importmap(self):
        """Verify HTML has Three.js importmap."""
        with open("systems/visual_shell/web/volumetric_minds_eye.html") as f:
            content = f.read()
        assert "importmap" in content
        assert "three" in content


class TestSemanticStrata:
    """Tests for semantic Z-axis strata."""

    def test_strata_planes_defined(self):
        """Verify strata planes are defined in JS."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "createStrataPlanes" in content or "strata" in content.lower()

    def test_z_legend_in_html(self):
        """Verify Z-axis legend is in HTML."""
        with open("systems/visual_shell/web/volumetric_minds_eye.html") as f:
            content = f.read()
        # Check for strata labels
        assert "Z=255" in content or "Architecture" in content
        assert "Z=0" in content or "Hardware" in content


class TestVolumetricMindEyeIntegration:
    """Integration tests for Volumetric Mind's Eye."""

    def test_js_has_orbit_controls(self):
        """Verify JS has OrbitControls for camera navigation."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "OrbitControls" in content

    def test_js_has_file_orb_handling(self):
        """Verify JS handles FILE_ORB_3D messages for file visualization."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "FILE_ORB_3D" in content or "updateFileOrb" in content

    def test_js_limits_tokens_for_performance(self):
        """Verify JS limits token count for performance."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        # Should have a max token limit
        assert "5000" in content or "maxTokens" in content.lower() or "tokenOrbs.length" in content

    def test_html_has_hud_stats(self):
        """Verify HTML has HUD for displaying stats."""
        with open("systems/visual_shell/web/volumetric_minds_eye.html") as f:
            content = f.read()
        assert "token-count" in content or "orb-count" in content or "fps" in content

    def test_js_handles_window_resize(self):
        """Verify JS handles window resize events."""
        with open("systems/visual_shell/web/VolumetricMindEye.js") as f:
            content = f.read()
        assert "resize" in content.lower() and ("onResize" in content or "addEventListener" in content)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
