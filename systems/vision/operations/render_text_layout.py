"""
Render Text Layout Operation - ASCII representation for debugging.

Creates a text-based visualization of element bounding boxes.
"""

from typing import Any, Dict, List, Optional, Tuple

from PIL import Image

from systems.vision.operations.base import BaseOperation


class RenderTextLayoutOperation(BaseOperation):
    """Create ASCII representation of UI layout."""

    @property
    def name(self) -> str:
        return "render_text_layout"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> str:
        """
        Render ASCII layout of elements.

        Args:
            image: PIL Image to process
            context: Execution context
            params: Dict with:
                - sources: List of variable names to render
                - width: Optional output width (default: 60)
                - height: Optional output height (default: 20)

        Returns:
            Multi-line string representing the UI layout
        """
        sources = params.get("sources", [])
        width = params.get("width", 60)
        height = params.get("height", 20)

        # Get image dimensions for scaling
        img_width = image.width
        img_height = image.height

        # Create empty canvas
        canvas = [[" " for _ in range(width)] for _ in range(height)]

        # Collect all elements from sources
        elements = []
        for source in sources:
            if isinstance(source, list):
                elements.extend(source)
            elif isinstance(source, dict):
                elements.append(source)

        # Draw each element
        for element in elements:
            bbox = self._get_bbox(element)
            text = self._get_text(element) if isinstance(element, dict) else ""

            if bbox:
                self._draw_element(canvas, bbox, text, img_width, img_height, width, height)

        # Convert to string
        lines = ["".join(row) for row in canvas]
        return "\n".join(lines)

    def _get_bbox(self, element: Any) -> Optional[Tuple[int, int, int, int]]:
        """Extract bbox from element."""
        if isinstance(element, dict):
            bbox = element.get("bbox")
            if bbox and len(bbox) == 4:
                return tuple(bbox)
        elif hasattr(element, "bbox"):
            return element.bbox
        return None

    def _get_text(self, element: Dict[str, Any]) -> str:
        """Extract text from element."""
        text = element.get("text", "")
        class_name = element.get("class", "")
        return text or class_name

    def _draw_element(
        self,
        canvas: List[List[str]],
        bbox: Tuple[int, int, int, int],
        text: str,
        img_width: int,
        img_height: int,
        canvas_width: int,
        canvas_height: int
    ) -> None:
        """Draw an element on the canvas."""
        x, y, w, h = bbox

        # Scale coordinates
        cx1 = int((x / img_width) * canvas_width)
        cy1 = int((y / img_height) * canvas_height)
        cx2 = int(((x + w) / img_width) * canvas_width)
        cy2 = int(((y + h) / img_height) * canvas_height)

        # Clamp to canvas bounds
        cx1 = max(0, min(cx1, canvas_width - 1))
        cy1 = max(0, min(cy1, canvas_height - 1))
        cx2 = max(0, min(cx2, canvas_width - 1))
        cy2 = max(0, min(cy2, canvas_height - 1))

        # Draw box with Unicode characters
        for row in range(cy1, cy2 + 1):
            for col in range(cx1, cx2 + 1):
                if row == cy1 and col == cx1:
                    canvas[row][col] = "┌"
                elif row == cy1 and col == cx2:
                    canvas[row][col] = "┐"
                elif row == cy2 and col == cx1:
                    canvas[row][col] = "└"
                elif row == cy2 and col == cx2:
                    canvas[row][col] = "┘"
                elif row == cy1 or row == cy2:
                    canvas[row][col] = "─"
                elif col == cx1 or col == cx2:
                    canvas[row][col] = "│"

        # Draw text if it fits
        if text and cx2 - cx1 > 2:
            text = text[:cx2 - cx1 - 1]  # Truncate to fit
            text_col = cx1 + 1
            for i, char in enumerate(text):
                if text_col + i < cx2:
                    canvas[cy1 + 1][text_col + i] = char

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate render_text_layout parameters."""
        errors = []
        if "sources" not in params:
            errors.append("'sources' parameter is required")
        return errors
