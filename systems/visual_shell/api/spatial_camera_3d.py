"""
3D Spatial Camera System

Provides camera, projection, and viewport utilities for 3D rendering
of the native visual shell.
"""

import math
from dataclasses import dataclass
from typing import Tuple, List, Optional
from enum import Enum


class ProjectionType(Enum):
    """Camera projection types"""
    PERSPECTIVE = "perspective"
    ORTHOGRAPHIC = "orthographic"


@dataclass
class Camera3D:
    """
    A 3D camera for the visual shell.

    Supports perspective and orthographic projection,
    orbit controls, and world-to-screen coordinate conversion.
    """
    position: Tuple[float, float, float] = (0.0, 0.0, 500.0)
    target: Tuple[float, float, float] = (0.0, 0.0, 0.0)
    up: Tuple[float, float, float] = (0.0, 1.0, 0.0)
    fov: float = 60.0  # Field of view in degrees
    near: float = 0.1
    far: float = 10000.0
    projection_type: ProjectionType = ProjectionType.PERSPECTIVE

    def look_at(self, x: float, y: float, z: float):
        """Set the point the camera is looking at"""
        self.target = (x, y, z)

    def zoom_in(self, factor: float = 0.5):
        """Zoom in by reducing Z distance to target"""
        dx, dy, dz = self.position
        tx, ty, tz = self.target

        # Calculate new position along view direction
        direction = (dx - tx, dy - ty, dz - tz)
        dist = math.sqrt(sum(d * d for d in direction))

        if dist > 0:
            scale = max(0.1, factor)  # Don't get too close
            self.position = (
                tx + direction[0] * scale,
                ty + direction[1] * scale,
                tz + direction[2] * scale
            )

    def zoom_out(self, factor: float = 2.0):
        """Zoom out by increasing Z distance to target"""
        dx, dy, dz = self.position
        tx, ty, tz = self.target

        direction = (dx - tx, dy - ty, dz - tz)
        dist = math.sqrt(sum(d * d for d in direction))

        if dist > 0:
            scale = min(10.0, factor)  # Don't get too far
            self.position = (
                tx + direction[0] * scale,
                ty + direction[1] * scale,
                tz + direction[2] * scale
            )

    def pan(self, dx: float, dy: float):
        """Pan the camera in the X/Y plane"""
        x, y, z = self.position
        tx, ty, tz = self.target

        self.position = (x + dx, y + dy, z)
        self.target = (tx + dx, ty + dy, tz)

    def orbit(self, angle_x_degrees: float = 0.0, angle_y_degrees: float = 0.0):
        """Orbit the camera around the target point"""
        dx, dy, dz = self.position
        tx, ty, tz = self.target

        # Translate to target-centered coordinates
        px, py, pz = dx - tx, dy - ty, dz - tz

        # Convert to spherical coordinates
        radius = math.sqrt(px * px + py * py + pz * pz)
        if radius == 0:
            return

        # Current angles
        theta = math.atan2(px, pz)  # Horizontal angle
        phi = math.asin(py / radius)  # Vertical angle

        # Apply rotation
        theta += math.radians(angle_y_degrees)
        phi += math.radians(angle_x_degrees)

        # Clamp vertical angle
        phi = max(-math.pi / 2 + 0.01, min(math.pi / 2 - 0.01, phi))

        # Convert back to Cartesian
        px = radius * math.cos(phi) * math.sin(theta)
        py = radius * math.sin(phi)
        pz = radius * math.cos(phi) * math.cos(theta)

        # Translate back to world coordinates
        self.position = (tx + px, ty + py, tz + pz)

    def depth_distance(self, x: float, y: float, z: float) -> float:
        """Calculate depth distance from camera to a point"""
        cx, cy, cz = self.position
        dx, dy, dz = x - cx, y - cy, z - cz
        return math.sqrt(dx * dx + dy * dy + dz * dz)

    def is_closer(self, z1: float, z2: float) -> bool:
        """Check if z1 is closer to camera than z2"""
        # Higher Z (in standard setup) means closer to camera
        return z1 > z2


@dataclass
class Viewport:
    """
    A 3D viewport for coordinate conversion.

    Handles world-to-screen and screen-to-world transformations.
    """
    width: int
    height: int

    def __post_init__(self):
        self._camera: Optional[Camera3D] = None

    @property
    def aspect_ratio(self) -> float:
        """Get the aspect ratio of the viewport"""
        return self.width / self.height

    def world_to_screen(
        self,
        world_x: float,
        world_y: float,
        world_z: float,
        camera: Camera3D
    ) -> Tuple[int, int]:
        """Convert world coordinates to screen coordinates"""
        # Get view-projection matrix
        view_matrix = create_look_at_matrix(
            camera.position,
            camera.target,
            camera.up
        )
        proj_matrix = create_perspective_matrix(
            camera.fov,
            self.aspect_ratio,
            camera.near,
            camera.far
        )

        # Transform point (simplified - full matrix multiply would be better)
        cx, cy, cz = camera.position
        tx, ty, tz = camera.target

        # Relative position
        rx, ry, rz = world_x - tx, world_y - ty, world_z - tz

        # Perspective division (simplified)
        dist = camera.depth_distance(world_x, world_y, world_z)
        if dist == 0:
            return self.width // 2, self.height // 2

        # Project to screen
        fov_rad = math.radians(camera.fov)
        scale = 1.0 / math.tan(fov_rad / 2)

        screen_x = int(self.width / 2 + (rx / dist) * self.width * scale / 2)
        screen_y = int(self.height / 2 - (ry / dist) * self.height * scale / 2)

        return screen_x, screen_y

    def screen_to_world_ray(
        self,
        screen_x: int,
        screen_y: int,
        camera: Camera3D
    ) -> Tuple[Tuple[float, float, float], Tuple[float, float, float]]:
        """Convert screen coordinates to a world ray (origin + direction)"""
        cx, cy, cz = camera.position

        # Calculate ray direction from screen coordinates
        fov_rad = math.radians(camera.fov)
        scale = math.tan(fov_rad / 2)

        # Normalized device coordinates
        ndc_x = (2.0 * screen_x / self.width - 1.0) * scale * self.aspect_ratio
        ndc_y = (1.0 - 2.0 * screen_y / self.height) * scale

        # Ray direction in view space (pointing forward into scene)
        direction = (ndc_x, ndc_y, -1.0)

        # Normalize direction
        length = math.sqrt(sum(d * d for d in direction))
        if length > 0:
            direction = tuple(d / length for d in direction)

        return camera.position, direction


def create_perspective_matrix(
    fov_degrees: float,
    aspect_ratio: float,
    near: float,
    far: float
) -> List[float]:
    """
    Create a 4x4 perspective projection matrix.

    Returns a flat array in column-major order.
    """
    fov_rad = math.radians(fov_degrees)
    f = 1.0 / math.tan(fov_rad / 2)

    # Column-major 4x4 matrix
    return [
        f / aspect_ratio, 0.0, 0.0, 0.0,
        0.0, f, 0.0, 0.0,
        0.0, 0.0, (far + near) / (near - far), -1.0,
        0.0, 0.0, (2 * far * near) / (near - far), 0.0
    ]


def create_look_at_matrix(
    eye: Tuple[float, float, float],
    target: Tuple[float, float, float],
    up: Tuple[float, float, float]
) -> List[float]:
    """
    Create a 4x4 look-at (view) matrix.

    Returns a flat array in column-major order.
    """
    # Forward vector (Z axis)
    fx, fy, fz = target[0] - eye[0], target[1] - eye[1], target[2] - eye[2]
    flen = math.sqrt(fx * fx + fy * fy + fz * fz)
    if flen > 0:
        fx, fy, fz = fx / flen, fy / flen, fz / flen

    # Right vector (X axis) = up x forward
    ux, uy, uz = up
    rx = uy * fz - uz * fy
    ry = uz * fx - ux * fz
    rz = ux * fy - uy * fx
    rlen = math.sqrt(rx * rx + ry * ry + rz * rz)
    if rlen > 0:
        rx, ry, rz = rx / rlen, ry / rlen, rz / rlen

    # Recalculate up vector (Y axis) = forward x right
    ux = fy * rz - fz * ry
    uy = fz * rx - fx * rz
    uz = fx * ry - fy * rx

    # Column-major 4x4 matrix
    return [
        rx, ux, -fx, 0.0,
        ry, uy, -fy, 0.0,
        rz, uz, -fz, 0.0,
        -(rx * eye[0] + ry * eye[1] + rz * eye[2]),
        -(ux * eye[0] + uy * eye[1] + uz * eye[2]),
        (fx * eye[0] + fy * eye[1] + fz * eye[2]),
        1.0
    ]
