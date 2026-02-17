"""
Relative Operation - Find elements relative to anchor.

Filters elements based on spatial relationship to an anchor element.
"""

from typing import Any, Dict, List, Literal, Optional, Tuple

from PIL import Image

from systems.vision.operations.base import BaseOperation


Direction = Literal["above", "below", "left", "right"]


class RelativeOperation(BaseOperation):
    """Find elements relative to anchor element."""

    @property
    def name(self) -> str:
        return "relative"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> List[Dict[str, Any]]:
        """
        Find elements relative to anchor.

        Args:
            image: PIL Image to process
            context: Execution context with previous results
            params: Dict with:
                - anchor: Anchor element with bbox
                - direction: above/below/left/right
                - max_distance: Optional max pixel distance
                - source: Optional list of elements to filter

        Returns:
            List of elements in the specified direction
        """
        anchor = params.get("anchor")
        direction = params.get("direction", "below")
        max_distance = params.get("max_distance", 200)
        source = params.get("source", [])

        if not anchor:
            raise ValueError("'anchor' parameter required")

        anchor_bbox = self._get_bbox(anchor)
        if not anchor_bbox:
            return []

        # Get source elements (from context or params)
        if not source:
            return []

        # Filter by direction
        results = []
        for element in source:
            element_bbox = self._get_bbox(element)
            if not element_bbox:
                continue

            if self._is_in_direction(anchor_bbox, element_bbox, direction, max_distance):
                results.append(element)

        return results

    def _get_bbox(self, element: Any) -> Optional[Tuple[int, int, int, int]]:
        """Extract bbox from element (handles dict and object formats)."""
        if isinstance(element, dict):
            bbox = element.get("bbox")
            if bbox:
                return tuple(bbox) if len(bbox) == 4 else None
        elif hasattr(element, "bbox"):
            return element.bbox
        return None

    def _is_in_direction(
        self,
        anchor: Tuple[int, int, int, int],
        element: Tuple[int, int, int, int],
        direction: Direction,
        max_distance: int
    ) -> bool:
        """Check if element is in the specified direction from anchor."""
        ax, ay, aw, ah = anchor
        ex, ey, ew, eh = element

        anchor_center_y = ay + ah / 2
        anchor_center_x = ax + aw / 2
        element_center_y = ey + eh / 2
        element_center_x = ex + ew / 2

        if direction == "above":
            return element_center_y < anchor_center_y and abs(element_center_x - anchor_center_x) < max_distance
        elif direction == "below":
            return element_center_y > anchor_center_y and abs(element_center_x - anchor_center_x) < max_distance
        elif direction == "left":
            return element_center_x < anchor_center_x and abs(element_center_y - anchor_center_y) < max_distance
        elif direction == "right":
            return element_center_x > anchor_center_x and abs(element_center_y - anchor_center_y) < max_distance

        return False

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate relative parameters."""
        errors = []
        if "anchor" not in params:
            errors.append("'anchor' parameter is required")
        if "direction" in params:
            valid = ["above", "below", "left", "right"]
            if params["direction"] not in valid:
                errors.append(f"'direction' must be one of: {valid}")
        return errors
