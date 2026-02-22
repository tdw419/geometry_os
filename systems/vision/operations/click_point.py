"""
Click Point Operation - Get center of bbox for clicking.

Returns the center point of an element's bounding box.
"""

from typing import Any, Dict, List, Optional, Tuple

from PIL import Image

from systems.vision.operations.base import BaseOperation


class ClickPointOperation(BaseOperation):
    """Get center of bbox for clicking."""

    @property
    def name(self) -> str:
        return "click_point"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> Dict[str, int]:
        """
        Get click point (center) of element.

        Args:
            image: PIL Image to process
            context: Execution context
            params: Dict with:
                - source: Element or list of elements

        Returns:
            Dict with x, y coordinates
        """
        source = params.get("source")

        if not source:
            raise ValueError("'source' parameter required")

        # Handle list (take first element)
        if isinstance(source, list):
            if not source:
                raise ValueError("Source list is empty")
            source = source[0]

        bbox = self._get_bbox(source)
        if not bbox:
            raise ValueError("Source element has no bbox")

        x, y, w, h = bbox
        center_x = x + w // 2
        center_y = y + h // 2

        return {"x": center_x, "y": center_y}

    def _get_bbox(self, element: Any) -> Optional[Tuple[int, int, int, int]]:
        """Extract bbox from element."""
        if isinstance(element, dict):
            bbox = element.get("bbox")
            if bbox and len(bbox) == 4:
                return tuple(bbox)
        elif hasattr(element, "bbox"):
            return element.bbox
        return None

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate click_point parameters."""
        errors = []
        if "source" not in params:
            errors.append("'source' parameter is required")
        return errors
