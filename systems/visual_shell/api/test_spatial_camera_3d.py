"""
Tests for 3D Spatial Camera
TDD tests for Task 5.1: 3D Spatial View
"""

import pytest
import math
import sys
from pathlib import Path

# Add api directory to path
sys.path.insert(0, str(Path(__file__).parent))

from spatial_camera_3d import (
    Camera3D,
    ProjectionType,
    Viewport,
    create_perspective_matrix,
    create_look_at_matrix,
)


class TestCamera3D:
    """Tests for 3D camera system"""

    def test_create_default_camera(self):
        """A default 3D camera can be created"""
        camera = Camera3D()

        assert camera.position == (0.0, 0.0, 500.0)  # Default distance
        assert camera.target == (0.0, 0.0, 0.0)  # Look at origin
        assert camera.up == (0.0, 1.0, 0.0)  # Y-up convention
        assert camera.fov == 60.0  # Field of view
        assert camera.near == 0.1
        assert camera.far == 10000.0

    def test_camera_position(self):
        """Camera position can be set and retrieved"""
        camera = Camera3D()
        camera.position = (100.0, 200.0, 300.0)

        assert camera.position == (100.0, 200.0, 300.0)

    def test_camera_look_at(self):
        """Camera can look at a specific point"""
        camera = Camera3D()
        camera.look_at(500.0, 0.0, 0.0)

        assert camera.target == (500.0, 0.0, 0.0)

    def test_camera_zoom(self):
        """Camera can zoom in and out"""
        camera = Camera3D()

        # Zoom in (decrease Z distance)
        camera.zoom_in(factor=0.5)
        assert camera.position[2] == 250.0  # 500 * 0.5

        # Zoom out (increase Z distance)
        camera.zoom_out(factor=2.0)
        assert camera.position[2] == 500.0  # 250 * 2.0

    def test_camera_pan(self):
        """Camera can pan in X/Y plane"""
        camera = Camera3D()
        camera.pan(100.0, 50.0)

        assert camera.position[0] == 100.0
        assert camera.position[1] == 50.0

    def test_camera_rotate_orbit(self):
        """Camera can orbit around target"""
        camera = Camera3D()
        camera.position = (500.0, 0.0, 0.0)  # Start on X axis
        camera.target = (0.0, 0.0, 0.0)

        # Rotate 90 degrees around Y axis
        camera.orbit(angle_y_degrees=90.0)

        # Should now be on negative Z axis (approximately)
        assert abs(camera.position[0]) < 50.0  # X ~= 0
        assert camera.position[1] == 0.0  # Y unchanged
        assert abs(camera.position[2]) > 400.0  # Z ~= -500 or +500


class TestProjectionMatrix:
    """Tests for projection matrix generation"""

    def test_perspective_matrix_dimensions(self):
        """Perspective matrix is 4x4"""
        matrix = create_perspective_matrix(
            fov_degrees=60.0,
            aspect_ratio=16.0 / 9.0,
            near=0.1,
            far=1000.0
        )

        assert len(matrix) == 16  # 4x4 matrix as flat array

    def test_perspective_matrix_values(self):
        """Perspective matrix has correct structure"""
        matrix = create_perspective_matrix(
            fov_degrees=90.0,
            aspect_ratio=1.0,
            near=1.0,
            far=100.0
        )

        # Matrix should be column-major
        # Check that it's not identity (perspective has depth)
        assert matrix[0] != 1.0 or matrix[5] != 1.0  # Not identity

    def test_look_at_matrix(self):
        """Look-at matrix can be created from camera vectors"""
        eye = (0.0, 0.0, 5.0)
        target = (0.0, 0.0, 0.0)
        up = (0.0, 1.0, 0.0)

        matrix = create_look_at_matrix(eye, target, up)

        assert len(matrix) == 16  # 4x4 matrix


class TestViewport:
    """Tests for 3D viewport management"""

    def test_viewport_creation(self):
        """A viewport can be created with dimensions"""
        viewport = Viewport(width=1920, height=1080)

        assert viewport.width == 1920
        assert viewport.height == 1080
        assert viewport.aspect_ratio == 1920.0 / 1080.0

    def test_viewport_world_to_screen(self):
        """Viewport can convert world coordinates to screen coordinates"""
        viewport = Viewport(width=800, height=600)
        camera = Camera3D()
        camera.position = (0.0, 0.0, 500.0)

        # Center of world should map to center of screen
        screen_x, screen_y = viewport.world_to_screen(
            world_x=0.0, world_y=0.0, world_z=0.0,
            camera=camera
        )

        # Should be approximately center
        assert abs(screen_x - 400) < 50  # Near center X
        assert abs(screen_y - 300) < 50  # Near center Y

    def test_viewport_screen_to_world(self):
        """Viewport can convert screen coordinates to world ray"""
        viewport = Viewport(width=800, height=600)
        camera = Camera3D()

        # Click in center of screen
        ray_origin, ray_direction = viewport.screen_to_world_ray(
            screen_x=400, screen_y=300,
            camera=camera
        )

        # Ray should start at camera position
        assert ray_origin[0] == camera.position[0]
        assert ray_origin[1] == camera.position[1]
        assert ray_origin[2] == camera.position[2]

        # Ray should point forward (negative Z)
        assert ray_direction[2] < 0  # Pointing into the scene


class TestDepthBuffer:
    """Tests for depth ordering in 3D"""

    def test_depth_sorting(self):
        """Entities can be sorted by depth (Z distance from camera)"""
        camera = Camera3D()
        camera.position = (0.0, 0.0, 500.0)  # Camera at Z=500

        # World Z coordinates: higher Z = closer to camera
        entities = [
            {"id": "z400", "x": 0, "y": 0, "z": 400},  # 100 units from camera
            {"id": "z100", "x": 0, "y": 0, "z": 100},  # 400 units from camera
            {"id": "z250", "x": 0, "y": 0, "z": 250},  # 250 units from camera
        ]

        sorted_entities = sorted(
            entities,
            key=lambda e: camera.depth_distance(e["x"], e["y"], e["z"])
        )

        # Smallest distance first (closest to camera)
        assert sorted_entities[0]["id"] == "z400"  # 100 units away
        assert sorted_entities[1]["id"] == "z250"  # 250 units away
        assert sorted_entities[2]["id"] == "z100"  # 400 units away

    def test_depth_distance_calculation(self):
        """Depth distance is calculated correctly"""
        camera = Camera3D()
        camera.position = (0.0, 0.0, 100.0)

        # Point directly in front
        dist = camera.depth_distance(0.0, 0.0, 50.0)
        expected = 50.0  # 100 - 50

        assert abs(dist - expected) < 0.001


class TestGlyphDepth:
    """Tests for 3D glyph rendering"""

    def test_glyph_has_depth(self):
        """Glyphs can have a Z coordinate for depth"""
        from native_panel import NativePanel

        panel = NativePanel(
            id="3d_panel",
            title="3D Panel",
            x=100, y=100,
            width=200, height=150,
            z=50.0  # Depth value
        )

        assert panel.z == 50.0

    def test_glyph_depth_affects_render_order(self):
        """Glyphs with higher Z (closer) render on top"""
        camera = Camera3D()
        camera.position = (0.0, 0.0, 500.0)

        # Panel further away (lower Z = further from camera looking at origin)
        far_panel_z = 100.0
        near_panel_z = 300.0

        # Closer panel should render on top
        assert camera.is_closer(near_panel_z, far_panel_z)
