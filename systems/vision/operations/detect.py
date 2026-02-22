"""
Detect Operation - Find UI elements by type.

Uses Florence-2 object detection to find UI elements like buttons,
inputs, menus, etc.
"""

from typing import Any, Dict, List

from PIL import Image

from systems.vision.operations.base import BaseOperation


class DetectOperation(BaseOperation):
    """Find UI elements by type."""

    @property
    def name(self) -> str:
        return "detect"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> List[Dict[str, Any]]:
        """
        Detect UI elements in the image.

        Args:
            image: PIL Image to process
            context: Execution context with model
            params: Dict with 'classes' (list of element types)

        Returns:
            List of dicts with bbox, class, confidence
        """
        model = context.get("_model")
        if not model:
            raise ValueError("No model available in context")

        classes = params.get("classes", ["button", "input", "menu"])

        # Run detection
        results = model.detect(image, classes=classes)

        # Convert to dict format
        return [
            {
                "bbox": list(r.bbox),
                "class": r.class_name,
                "confidence": r.confidence
            }
            for r in results
        ]

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate detect parameters."""
        errors = []
        if "classes" in params:
            if not isinstance(params["classes"], list):
                errors.append("'classes' must be a list")
        return errors
