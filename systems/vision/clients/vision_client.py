"""
VisionClient - Lightweight client for VisionDaemon.

Provides a simple async interface for agents to query the VisionDaemon
via Unix socket IPC.
"""

import asyncio
import base64
import json
import os
from io import BytesIO
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union

from PIL import Image


class VisionClient:
    """
    Lightweight client for VisionDaemon.

    Connects to the VisionDaemon via Unix socket and provides
    a simple interface for visual queries.

    Usage:
        client = VisionClient()

        # Simple query
        result = await client.ground(image, "Export")
        click_point = await client.click_point(result)

        # Pipeline query
        result = await client.query({
            "image": image,
            "steps": [
                {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
                {"op": "ground", "text": "Export", "assign_to": "export_btn"}
            ]
        })
    """

    DEFAULT_SOCKET_PATH = "/tmp/vision_daemon.sock"
    DEFAULT_TIMEOUT = 30.0  # seconds

    def __init__(
        self,
        socket_path: str = DEFAULT_SOCKET_PATH,
        timeout: float = DEFAULT_TIMEOUT
    ):
        """
        Initialize VisionClient.

        Args:
            socket_path: Path to VisionDaemon Unix socket
            timeout: Request timeout in seconds
        """
        self.socket_path = socket_path
        self.timeout = timeout

    async def query(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """
        Send a pipeline query to VisionDaemon.

        Args:
            request: Dict with 'image' (PIL Image or base64 string) and 'steps'

        Returns:
            Response dict with 'success', 'results', 'latency_ms', 'error'
        """
        # Convert PIL Image to base64 if needed
        if "image" in request:
            image = request["image"]
            if isinstance(image, Image.Image):
                request["image"] = self._image_to_base64(image)
            elif not isinstance(image, str):
                raise ValueError("image must be PIL.Image or base64 string")

        # Send request
        response = await self._send_request(request)
        return response

    async def detect(
        self,
        image: Image.Image,
        classes: List[str] = None
    ) -> List[Dict[str, Any]]:
        """
        Detect UI elements in image.

        Args:
            image: PIL Image to process
            classes: List of element types to detect

        Returns:
            List of detected elements with bbox, class, confidence
        """
        classes = classes or ["button", "input", "menu"]
        result = await self.query({
            "image": image,
            "steps": [
                {"op": "detect", "classes": classes, "assign_to": "elements"}
            ]
        })

        if result["success"]:
            return result["results"].get("elements", [])
        raise VisionClientError(result.get("error", "Unknown error"))

    async def ocr(
        self,
        image: Image.Image,
        region: Optional[Tuple[int, int, int, int]] = None
    ) -> List[Dict[str, Any]]:
        """
        Extract text from image.

        Args:
            image: PIL Image to process
            region: Optional bbox (x, y, w, h) to constrain

        Returns:
            List of text elements with bbox, text, confidence
        """
        step = {"op": "ocr", "assign_to": "text"}
        if region:
            step["region"] = region

        result = await self.query({
            "image": image,
            "steps": [step]
        })

        if result["success"]:
            return result["results"].get("text", [])
        raise VisionClientError(result.get("error", "Unknown error"))

    async def ground(
        self,
        image: Image.Image,
        text: str
    ) -> Dict[str, Any]:
        """
        Find element matching text.

        Args:
            image: PIL Image to process
            text: Text to search for

        Returns:
            Element with bbox, text, confidence
        """
        result = await self.query({
            "image": image,
            "steps": [
                {"op": "ground", "text": text, "assign_to": "element"}
            ]
        })

        if result["success"]:
            return result["results"].get("element", {})
        raise VisionClientError(result.get("error", "Unknown error"))

    async def click_point(
        self,
        element: Union[Dict[str, Any], List[Dict[str, Any]]]
    ) -> Tuple[int, int]:
        """
        Get click point (center) of element.

        Args:
            element: Element dict with bbox or list of elements

        Returns:
            Tuple of (x, y) coordinates
        """
        # This is a local operation - no daemon call needed
        if isinstance(element, list):
            if not element:
                raise ValueError("Element list is empty")
            element = element[0]

        bbox = element.get("bbox")
        if not bbox:
            raise ValueError("Element has no bbox")

        x, y, w, h = bbox
        return (x + w // 2, y + h // 2)

    async def find_and_click(
        self,
        image: Image.Image,
        text: str
    ) -> Tuple[int, int]:
        """
        Find element by text and return click point.

        Convenience method combining ground and click_point.

        Args:
            image: PIL Image to process
            text: Text to search for

        Returns:
            Tuple of (x, y) coordinates for clicking
        """
        result = await self.query({
            "image": image,
            "steps": [
                {"op": "ground", "text": text, "assign_to": "target"},
                {"op": "click_point", "source": "$target", "assign_to": "click"}
            ]
        })

        if result["success"]:
            click = result["results"].get("click", {})
            return (click.get("x", 0), click.get("y", 0))
        raise VisionClientError(result.get("error", "Unknown error"))

    async def health_check(self) -> bool:
        """
        Check if VisionDaemon is running and responsive.

        Returns:
            True if daemon is healthy, False otherwise
        """
        try:
            if not os.path.exists(self.socket_path):
                return False

            # Try a minimal query
            image = Image.new("RGB", (100, 100), color="white")
            result = await self.query({
                "image": image,
                "steps": [{"op": "ocr", "assign_to": "text"}]
            })
            return result["success"]
        except Exception:
            return False

    async def _send_request(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Send request to VisionDaemon via Unix socket."""
        if not os.path.exists(self.socket_path):
            raise VisionClientError(
                f"VisionDaemon socket not found at {self.socket_path}. "
                "Is the daemon running?"
            )

        try:
            reader, writer = await asyncio.wait_for(
                asyncio.open_unix_connection(self.socket_path),
                timeout=self.timeout
            )

            # Send request
            data = json.dumps(request).encode("utf-8")
            writer.write(data)
            await writer.drain()

            # Read response
            response_data = await asyncio.wait_for(
                reader.read(1024 * 1024 * 10),  # 10MB max
                timeout=self.timeout
            )

            writer.close()
            await writer.wait_closed()

            return json.loads(response_data.decode("utf-8"))

        except asyncio.TimeoutError:
            raise VisionClientError(f"Request timed out after {self.timeout}s")
        except json.JSONDecodeError as e:
            raise VisionClientError(f"Invalid response: {e}")
        except Exception as e:
            raise VisionClientError(f"Connection error: {e}")

    def _image_to_base64(self, image: Image.Image) -> str:
        """Convert PIL Image to base64 string."""
        buffer = BytesIO()
        image.save(buffer, format="PNG")
        return base64.b64encode(buffer.getvalue()).decode("utf-8")


class VisionClientError(Exception):
    """Error from VisionClient operations."""
    pass


# Synchronous wrapper for simpler usage
class SyncVisionClient:
    """
    Synchronous wrapper for VisionClient.

    Use this when you don't need async operations.

    Usage:
        client = SyncVisionClient()
        click = client.find_and_click(image, "Export")
    """

    def __init__(self, socket_path: str = VisionClient.DEFAULT_SOCKET_PATH):
        self._client = VisionClient(socket_path=socket_path)

    def query(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Send a pipeline query."""
        return asyncio.run(self._client.query(request))

    def detect(self, image: Image.Image, classes: List[str] = None) -> List[Dict[str, Any]]:
        """Detect UI elements."""
        return asyncio.run(self._client.detect(image, classes))

    def ocr(self, image: Image.Image, region: Optional[Tuple[int, int, int, int]] = None) -> List[Dict[str, Any]]:
        """Extract text from image."""
        return asyncio.run(self._client.ocr(image, region))

    def ground(self, image: Image.Image, text: str) -> Dict[str, Any]:
        """Find element matching text."""
        return asyncio.run(self._client.ground(image, text))

    def click_point(self, element: Union[Dict[str, Any], List[Dict[str, Any]]]) -> Tuple[int, int]:
        """Get click point of element."""
        return asyncio.run(self._client.click_point(element))

    def find_and_click(self, image: Image.Image, text: str) -> Tuple[int, int]:
        """Find element and return click point."""
        return asyncio.run(self._client.find_and_click(image, text))

    def health_check(self) -> bool:
        """Check daemon health."""
        return asyncio.run(self._client.health_check())
