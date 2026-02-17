"""
Size Operations - Filter elements by size.

Provides largest and smallest operations.
"""

from typing import Any, Dict, List, Optional, Tuple

from PIL import Image

from systems.vision.operations.base import BaseOperation


class LargestOperation(BaseOperation):
    """Get largest element(s) by area."""

    @property
    def name(self) -> str:
        return "largest"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> List[Dict[str, Any]]:
        """
        Get largest element(s) from source.

        Args:
            image: PIL Image to process
            context: Execution context
            params: Dict with:
                - source: List of elements
                - count: Optional number to return (default: 1)

        Returns:
            List of largest elements, sorted by area descending
        """
        source = params.get("source", [])
        count = params.get("count", 1)

        if not source:
            return []

        # Sort by area (descending)
        sorted_elements = sorted(
            source,
            key=lambda e: self._get_area(e),
            reverse=True
        )

        return sorted_elements[:count]

    def _get_area(self, element: Any) -> int:
        """Calculate area of element's bbox."""
        bbox = self._get_bbox(element)
        if bbox:
            return bbox[2] * bbox[3]  # w * h
        return 0

    def _get_bbox(self, element: Any) -> Optional[Tuple[int, int, int, int]]:
        """Extract bbox from element."""
        if isinstance(element, dict):
            bbox = element.get("bbox")
            if bbox and len(bbox) == 4:
                return tuple(bbox)
        elif hasattr(element, "bbox"):
            return element.bbox
        return None


class SmallestOperation(BaseOperation):
    """Get smallest element(s) by area."""

    @property
    def name(self) -> str:
        return "smallest"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> List[Dict[str, Any]]:
        """
        Get smallest element(s) from source.

        Args:
            image: PIL Image to process
            context: Execution context
            params: Dict with:
                - source: List of elements
                - count: Optional number to return (default: 1)

        Returns:
            List of smallest elements, sorted by area ascending
        """
        source = params.get("source", [])
        count = params.get("count", 1)

        if not source:
            return []

        # Sort by area (ascending)
        sorted_elements = sorted(
            source,
            key=lambda e: self._get_area(e)
        )

        return sorted_elements[:count]

    def _get_area(self, element: Any) -> int:
        """Calculate area of element's bbox."""
        bbox = self._get_bbox(element)
        if bbox:
            return bbox[2] * bbox[3]  # w * h
        return 0

    def _get_bbox(self, element: Any) -> Optional[Tuple[int, int, int, int]]:
        """Extract bbox from element."""
        if isinstance(element, dict):
            bbox = element.get("bbox")
            if bbox and len(bbox) == 4:
                return tuple(bbox)
        elif hasattr(element, "bbox"):
            return element.bbox
        return None
