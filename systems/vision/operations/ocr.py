"""
OCR Operation - Extract text from image.

Uses Florence-2 OCR to extract text with bounding boxes.
"""

from typing import Any

from PIL import Image

from systems.vision.operations.base import BaseOperation


class OCROperation(BaseOperation):
    """Extract text with bounding boxes."""

    @property
    def name(self) -> str:
        return "ocr"

    async def execute(
        self,
        image: Image.Image,
        context: dict[str, Any],
        params: dict[str, Any]
    ) -> list[dict[str, Any]]:
        """
        Extract text from image.

        Args:
            image: PIL Image to process
            context: Execution context with model
            params: Optional 'region' (bbox to constrain)

        Returns:
            List of dicts with bbox, text, confidence
        """
        model = context.get("_model")
        if not model:
            raise ValueError("No model available in context")

        region = params.get("region")

        # Run OCR
        results = model.ocr(image, region=region)

        # Convert to dict format
        return [
            {
                "bbox": list(r.bbox),
                "text": r.text,
                "confidence": r.confidence
            }
            for r in results
        ]

    def validate_params(self, params: dict[str, Any]) -> list[str]:
        """Validate OCR parameters."""
        errors = []
        if "region" in params:
            region = params["region"]
            if not isinstance(region, (list, tuple)) or len(region) != 4:
                errors.append("'region' must be a 4-element list/tuple [x, y, w, h]")
        return errors
