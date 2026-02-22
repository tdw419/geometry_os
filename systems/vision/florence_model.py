"""
Florence-2 Model Wrapper

Provides a clean interface to Microsoft's Florence-2 vision model
for OCR, object detection, and phrase grounding tasks.
"""

import base64
import io
from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Tuple, Union

from PIL import Image


@dataclass
class TextResult:
    """OCR result with text and bounding box."""
    bbox: Tuple[int, int, int, int]  # x, y, w, h
    text: str
    confidence: float = 1.0


@dataclass
class DetectionResult:
    """Object detection result."""
    bbox: Tuple[int, int, int, int]  # x, y, w, h
    class_name: str
    confidence: float


@dataclass
class GroundingResult:
    """Phrase grounding result."""
    bbox: Tuple[int, int, int, int]  # x, y, w, h
    text: str
    confidence: float


class FlorenceModel:
    """
    Wrapper for Florence-2 vision model.

    Provides unified interface for:
    - OCR (text extraction with bounding boxes)
    - Object detection (UI elements)
    - Phrase grounding (find text in image)

    Usage:
        model = FlorenceModel()
        model.load()

        # OCR
        texts = model.ocr(image)

        # Detection
        elements = model.detect(image, classes=["button", "input"])

        # Grounding
        matches = model.ground(image, text="Export")
    """

    # Florence-2 task names (use these exactly as-is)
    TASK_OCR = "<OCR>"
    TASK_OCR_WITH_REGION = "<OCR_WITH_REGION>"
    TASK_OD = "<OD>"  # Object Detection
    TASK_DENSE_REGION_CAPTION = "<DENSE_REGION_CAPTION>"
    TASK_CAPTION_TO_GROUNDING = "<CAPTION_TO_PHRASE_GROUNDING>"
    TASK_REGION_PROPOSAL = "<REGION_PROPOSAL>"
    TASK_OPEN_VOCABULARY_DETECTION = "<OPEN_VOCABULARY_DETECTION>"

    # Map our class names to Florence-2 concepts
    UI_CLASS_MAPPING = {
        "button": "button",
        "input": "text input",
        "textfield": "text input",
        "menu": "menu",
        "checkbox": "checkbox",
        "dropdown": "dropdown menu",
        "dialog": "dialog box",
        "icon": "icon",
        "label": "text label",
        "panel": "panel",
    }

    def __init__(self, model_size: str = "base"):
        """
        Initialize Florence-2 wrapper.

        Args:
            model_size: Model size - "base" or "large"
        """
        self.model_size = model_size
        self._model = None
        self._processor = None
        self._device = None

    def load(self) -> None:
        """Load the Florence-2 model and processor."""
        try:
            import torch
            from transformers import AutoModelForCausalLM, AutoProcessor

            # Determine device
            if torch.cuda.is_available():
                self._device = torch.device("cuda")
            elif torch.backends.mps.is_available():
                self._device = torch.device("mps")
            else:
                self._device = torch.device("cpu")

            # Load model
            model_name = f"microsoft/Florence-2-{self.model_size}"
            self._model = AutoModelForCausalLM.from_pretrained(
                model_name,
                trust_remote_code=True,
                attn_implementation="eager"  # Avoid SDPA compatibility issues
            ).to(self._device)
            self._model.eval()

            # Load processor
            self._processor = AutoProcessor.from_pretrained(
                model_name,
                trust_remote_code=True
            )

            print(f"Florence-2 loaded on {self._device}")

        except ImportError as e:
            raise ImportError(
                "Florence-2 requires torch and transformers. "
                f"Install with: pip install torch transformers. Error: {e}"
            )

    def is_loaded(self) -> bool:
        """Check if model is loaded."""
        return self._model is not None and self._processor is not None

    def ocr(self, image: Image.Image, region: Optional[Tuple[int, int, int, int]] = None) -> List[TextResult]:
        """
        Extract text from image using OCR.

        Args:
            image: PIL Image to process
            region: Optional bbox (x, y, w, h) to constrain OCR

        Returns:
            List of TextResult with text and bounding boxes
        """
        if not self.is_loaded():
            raise RuntimeError("Model not loaded. Call load() first.")

        # Crop to region if specified
        if region:
            x, y, w, h = region
            image = image.crop((x, y, x + w, y + h))

        # Ensure RGB mode
        if image.mode != "RGB":
            image = image.convert("RGB")

        # Use OCR_WITH_REGION for bounding boxes
        task = self.TASK_OCR_WITH_REGION

        # Run OCR task
        inputs = self._processor(
            text=task,
            images=image,
            return_tensors="pt"
        ).to(self._device)

        import torch
        with torch.no_grad():
            outputs = self._model.generate(
                input_ids=inputs["input_ids"],
                pixel_values=inputs["pixel_values"],
                max_new_tokens=1024,
                num_beams=1,  # Use greedy decoding for compatibility
                do_sample=False,
                use_cache=False  # Required for transformers compatibility
            )

        # Parse results
        result = self._processor.batch_decode(outputs, skip_special_tokens=False)[0]
        parsed = self._processor.post_process_generation(
            result,
            task=task,
            image_size=(image.width, image.height)
        )

        # Convert to TextResult objects
        results = []
        ocr_results = parsed.get(task, {})

        if isinstance(ocr_results, str):
            # Simple text output - fallback to whole image
            results.append(TextResult(
                bbox=(0, 0, image.width, image.height),
                text=ocr_results,
                confidence=1.0
            ))
        elif isinstance(ocr_results, list):
            for item in ocr_results:
                if isinstance(item, dict):
                    bbox = self._normalize_bbox(item.get("bbox", [0, 0, 0, 0]))
                    # Adjust bbox if we cropped to region
                    if region:
                        x, y, _, _ = region
                        bbox = (bbox[0] + x, bbox[1] + y, bbox[2], bbox[3])
                    results.append(TextResult(
                        bbox=bbox,
                        text=item.get("text", ""),
                        confidence=item.get("confidence", 1.0)
                    ))
        elif isinstance(ocr_results, dict):
            # Handle dict format with 'quad_box' or 'bboxes'
            if "quad_box" in ocr_results:
                quads = ocr_results["quad_box"]
                labels = ocr_results.get("labels", [])
                for i, quad in enumerate(quads):
                    # Convert quad to bbox
                    x_coords = [quad[j] for j in range(0, 8, 2)]
                    y_coords = [quad[j] for j in range(1, 8, 2)]
                    x1, y1 = min(x_coords), min(y_coords)
                    x2, y2 = max(x_coords), max(y_coords)
                    bbox = (int(x1), int(y1), int(x2 - x1), int(y2 - y1))
                    text = labels[i] if i < len(labels) else ""
                    if region:
                        x, y, _, _ = region
                        bbox = (bbox[0] + x, bbox[1] + y, bbox[2], bbox[3])
                    results.append(TextResult(bbox=bbox, text=text, confidence=1.0))
            elif "bboxes" in ocr_results:
                bboxes = ocr_results["bboxes"]
                labels = ocr_results.get("labels", [])
                for i, bbox_raw in enumerate(bboxes):
                    bbox = self._normalize_bbox(bbox_raw)
                    text = labels[i] if i < len(labels) else ""
                    if region:
                        x, y, _, _ = region
                        bbox = (bbox[0] + x, bbox[1] + y, bbox[2], bbox[3])
                    results.append(TextResult(bbox=bbox, text=text, confidence=1.0))

        return results

    def detect(
        self,
        image: Image.Image,
        classes: Optional[List[str]] = None
    ) -> List[DetectionResult]:
        """
        Detect UI elements in image.

        Args:
            image: PIL Image to process
            classes: List of UI element classes to detect (note: Florence-2 OD
                     detects all objects, classes are used for filtering only)

        Returns:
            List of DetectionResult with bounding boxes and classes
        """
        if not self.is_loaded():
            raise RuntimeError("Model not loaded. Call load() first.")

        # Ensure RGB mode
        if image.mode != "RGB":
            image = image.convert("RGB")

        # Use OD task - task token must be the only text
        task = self.TASK_OD

        inputs = self._processor(
            text=task,
            images=image,
            return_tensors="pt"
        ).to(self._device)

        import torch
        with torch.no_grad():
            outputs = self._model.generate(
                input_ids=inputs["input_ids"],
                pixel_values=inputs["pixel_values"],
                max_new_tokens=1024,
                num_beams=1,  # Use greedy decoding for compatibility
                do_sample=False,
                use_cache=False  # Required for transformers compatibility
            )

        # Parse results
        result = self._processor.batch_decode(outputs, skip_special_tokens=False)[0]
        parsed = self._processor.post_process_generation(
            result,
            task=task,
            image_size=(image.width, image.height)
        )

        # Convert to DetectionResult objects
        results = []
        od_results = parsed.get(task, {})

        if isinstance(od_results, dict) and "bboxes" in od_results:
            bboxes = od_results.get("bboxes", [])
            labels = od_results.get("labels", [])

            for i, bbox in enumerate(bboxes):
                label = labels[i] if i < len(labels) else "unknown"
                # Filter by classes if specified
                if classes:
                    label_lower = label.lower()
                    if not any(c.lower() in label_lower for c in classes):
                        continue
                results.append(DetectionResult(
                    bbox=self._normalize_bbox(bbox),
                    class_name=label,
                    confidence=0.9  # Florence-2 doesn't provide confidence for OD
                ))

        return results

    def ground(self, image: Image.Image, text: str) -> List[GroundingResult]:
        """
        Find elements matching text description.

        Args:
            image: PIL Image to process
            text: Text to search for

        Returns:
            List of GroundingResult with bounding boxes
        """
        if not self.is_loaded():
            raise RuntimeError("Model not loaded. Call load() first.")

        # Ensure RGB mode
        if image.mode != "RGB":
            image = image.convert("RGB")

        # For phrase grounding, the format is task_token + space + caption
        prompt = f"{self.TASK_CAPTION_TO_GROUNDING} {text}"

        inputs = self._processor(
            text=prompt,
            images=image,
            return_tensors="pt"
        ).to(self._device)

        import torch
        with torch.no_grad():
            outputs = self._model.generate(
                input_ids=inputs["input_ids"],
                pixel_values=inputs["pixel_values"],
                max_new_tokens=1024,
                num_beams=1,  # Use greedy decoding for compatibility
                do_sample=False,
                use_cache=False  # Required for transformers compatibility
            )

        # Parse results
        result = self._processor.batch_decode(outputs, skip_special_tokens=False)[0]
        parsed = self._processor.post_process_generation(
            result,
            task=self.TASK_CAPTION_TO_GROUNDING,
            image_size=(image.width, image.height)
        )

        # Convert to GroundingResult objects
        results = []
        grounding_results = parsed.get(self.TASK_CAPTION_TO_GROUNDING, {})

        if isinstance(grounding_results, dict) and "bboxes" in grounding_results:
            bboxes = grounding_results.get("bboxes", [])
            labels = grounding_results.get("labels", [])

            for i, bbox in enumerate(bboxes):
                label = labels[i] if i < len(labels) else text
                results.append(GroundingResult(
                    bbox=self._normalize_bbox(bbox),
                    text=label,
                    confidence=0.9
                ))

        return results

    def _normalize_bbox(self, bbox: List[Any]) -> Tuple[int, int, int, int]:
        """
        Normalize bbox to (x, y, w, h) format.

        Florence-2 returns bboxes in various formats.
        """
        if len(bbox) == 4:
            x1, y1, x2, y2 = bbox
            return (int(x1), int(y1), int(x2 - x1), int(y2 - y1))
        return (0, 0, 0, 0)


# Mock model for testing without GPU
class MockFlorenceModel(FlorenceModel):
    """
    Mock Florence model for testing without GPU.

    Returns predictable results for unit tests.
    """

    def load(self) -> None:
        """Mock load - no actual model loading."""
        self._model = "mock"
        self._processor = "mock"
        self._device = "cpu"

    def ocr(self, image: Image.Image, region: Optional[Tuple[int, int, int, int]] = None) -> List[TextResult]:
        """Return mock OCR results."""
        return [
            TextResult(bbox=(10, 10, 100, 30), text="Export", confidence=0.95),
            TextResult(bbox=(10, 50, 100, 30), text="Cancel", confidence=0.92),
        ]

    def detect(self, image: Image.Image, classes: Optional[List[str]] = None) -> List[DetectionResult]:
        """Return mock detection results."""
        return [
            DetectionResult(bbox=(10, 10, 80, 30), class_name="button", confidence=0.94),
            DetectionResult(bbox=(100, 10, 80, 30), class_name="button", confidence=0.91),
            DetectionResult(bbox=(10, 100, 200, 25), class_name="input", confidence=0.88),
        ]

    def ground(self, image: Image.Image, text: str) -> List[GroundingResult]:
        """Return mock grounding results."""
        return [
            GroundingResult(bbox=(10, 10, 80, 30), text=text, confidence=0.95),
        ]
