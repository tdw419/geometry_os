"""
Vision Operations - Individual operations for the pipeline executor.

Each operation implements the BaseOperation interface and can be
composed into multi-step visual queries.
"""

from systems.vision.operations.base import BaseOperation
from systems.vision.operations.detect import DetectOperation
from systems.vision.operations.ocr import OCROperation
from systems.vision.operations.ground import GroundOperation
from systems.vision.operations.relative import RelativeOperation
from systems.vision.operations.contains import ContainsOperation
from systems.vision.operations.size import LargestOperation, SmallestOperation
from systems.vision.operations.click_point import ClickPointOperation
from systems.vision.operations.render_text_layout import RenderTextLayoutOperation

__all__ = [
    "BaseOperation",
    "DetectOperation",
    "OCROperation",
    "GroundOperation",
    "RelativeOperation",
    "ContainsOperation",
    "LargestOperation",
    "SmallestOperation",
    "ClickPointOperation",
    "RenderTextLayoutOperation",
]
