"""
Ground Operation - Find elements matching text.

Uses Florence-2 phrase grounding to locate text in the image.
"""

from typing import Any, Dict, List

from PIL import Image

from systems.vision.operations.base import BaseOperation


class GroundOperation(BaseOperation):
    """Find elements matching text."""

    @property
    def name(self) -> str:
        return "ground"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> Dict[str, Any]:
        """
        Find element matching text description.

        Args:
            image: PIL Image to process
            context: Execution context with model
            params: Dict with 'text' (string to find)

        Returns:
            Dict with bbox, text, confidence (or list if multiple matches)
        """
        model = context.get("_model")
        if not model:
            raise ValueError("No model available in context")

        text = params.get("text")
        if not text:
            raise ValueError("'text' parameter required")

        # Run grounding
        results = model.ground(image, text)

        if not results:
            return {"bbox": None, "text": text, "confidence": 0.0}

        # Return first match as dict, or list if multiple
        if len(results) == 1:
            r = results[0]
            return {
                "bbox": list(r.bbox),
                "text": r.text,
                "confidence": r.confidence
            }
        else:
            return [
                {
                    "bbox": list(r.bbox),
                    "text": r.text,
                    "confidence": r.confidence
                }
                for r in results
            ]

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate ground parameters."""
        errors = []
        if "text" not in params:
            errors.append("'text' parameter is required")
        elif not isinstance(params["text"], str):
            errors.append("'text' must be a string")
        return errors
