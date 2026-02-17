"""
Tests for the Vision System.

Uses MockFlorenceModel to test without GPU.
"""

import pytest
from PIL import Image

from systems.vision.florence_model import MockFlorenceModel
from systems.vision.pipeline_executor import PipelineExecutor
from systems.vision.operations import (
    DetectOperation,
    OCROperation,
    GroundOperation,
    RelativeOperation,
    ContainsOperation,
    LargestOperation,
    SmallestOperation,
    ClickPointOperation,
    RenderTextLayoutOperation,
)


@pytest.fixture
def mock_model():
    """Create a mock Florence model for testing."""
    model = MockFlorenceModel()
    model.load()
    return model


@pytest.fixture
def sample_image():
    """Create a sample image for testing."""
    return Image.new("RGB", (800, 600), color="white")


@pytest.fixture
def executor(mock_model):
    """Create a pipeline executor with mock model."""
    return PipelineExecutor(mock_model)


class TestFlorenceModel:
    """Tests for the Florence model wrapper."""

    def test_load(self):
        """Test model loading."""
        model = MockFlorenceModel()
        assert not model.is_loaded()
        model.load()
        assert model.is_loaded()

    def test_ocr(self, mock_model, sample_image):
        """Test OCR operation."""
        results = mock_model.ocr(sample_image)
        assert len(results) > 0
        assert results[0].text == "Export"
        assert results[0].bbox == (10, 10, 100, 30)

    def test_detect(self, mock_model, sample_image):
        """Test detection operation."""
        results = mock_model.detect(sample_image, classes=["button", "input"])
        assert len(results) > 0
        assert results[0].class_name in ["button", "input"]

    def test_ground(self, mock_model, sample_image):
        """Test grounding operation."""
        results = mock_model.ground(sample_image, text="Export")
        assert len(results) > 0
        assert results[0].text == "Export"


class TestOperations:
    """Tests for individual operations."""

    @pytest.mark.asyncio
    async def test_detect_operation(self, mock_model, sample_image):
        """Test detect operation."""
        op = DetectOperation()
        context = {"_model": mock_model}
        result = await op.execute(sample_image, context, {"classes": ["button"]})
        assert len(result) > 0
        assert "bbox" in result[0]
        assert "class" in result[0]

    @pytest.mark.asyncio
    async def test_ocr_operation(self, mock_model, sample_image):
        """Test OCR operation."""
        op = OCROperation()
        context = {"_model": mock_model}
        result = await op.execute(sample_image, context, {})
        assert len(result) > 0
        assert "text" in result[0]

    @pytest.mark.asyncio
    async def test_ground_operation(self, mock_model, sample_image):
        """Test ground operation."""
        op = GroundOperation()
        context = {"_model": mock_model}
        result = await op.execute(sample_image, context, {"text": "Export"})
        assert "bbox" in result
        assert result["text"] == "Export"

    @pytest.mark.asyncio
    async def test_click_point_operation(self, sample_image):
        """Test click_point operation."""
        op = ClickPointOperation()
        context = {}
        element = {"bbox": [10, 10, 100, 30], "text": "Export"}
        result = await op.execute(sample_image, context, {"source": element})
        assert "x" in result
        assert "y" in result
        # Center of [10, 10, 100, 30] should be (60, 25)
        assert result["x"] == 60
        assert result["y"] == 25

    @pytest.mark.asyncio
    async def test_relative_operation(self, sample_image):
        """Test relative operation."""
        op = RelativeOperation()
        context = {}
        anchor = {"bbox": [100, 100, 50, 30]}
        elements = [
            {"bbox": [100, 50, 50, 30], "text": "Above"},  # Above
            {"bbox": [100, 150, 50, 30], "text": "Below"},  # Below
            {"bbox": [50, 100, 50, 30], "text": "Left"},    # Left
            {"bbox": [200, 100, 50, 30], "text": "Right"},  # Right
        ]

        result = await op.execute(
            sample_image, context,
            {"anchor": anchor, "direction": "below", "source": elements}
        )
        assert len(result) == 1
        assert result[0]["text"] == "Below"

    @pytest.mark.asyncio
    async def test_contains_operation(self, sample_image):
        """Test contains operation."""
        op = ContainsOperation()
        context = {}
        elements = [
            {"text": "Export Project", "bbox": [0, 0, 100, 30]},
            {"text": "Cancel", "bbox": [0, 50, 100, 30]},
            {"text": "Export Selected", "bbox": [0, 100, 100, 30]},
        ]

        result = await op.execute(
            sample_image, context,
            {"source": elements, "text": "Export"}
        )
        assert len(result) == 2

    @pytest.mark.asyncio
    async def test_largest_operation(self, sample_image):
        """Test largest operation."""
        op = LargestOperation()
        context = {}
        elements = [
            {"bbox": [0, 0, 50, 30], "text": "Small"},      # 1500 px²
            {"bbox": [0, 50, 200, 100], "text": "Large"},   # 20000 px²
            {"bbox": [0, 200, 100, 50], "text": "Medium"},  # 5000 px²
        ]

        result = await op.execute(sample_image, context, {"source": elements})
        assert len(result) == 1
        assert result[0]["text"] == "Large"

    @pytest.mark.asyncio
    async def test_smallest_operation(self, sample_image):
        """Test smallest operation."""
        op = SmallestOperation()
        context = {}
        elements = [
            {"bbox": [0, 0, 50, 30], "text": "Small"},      # 1500 px²
            {"bbox": [0, 50, 200, 100], "text": "Large"},   # 20000 px²
            {"bbox": [0, 200, 100, 50], "text": "Medium"},  # 5000 px²
        ]

        result = await op.execute(sample_image, context, {"source": elements})
        assert len(result) == 1
        assert result[0]["text"] == "Small"

    @pytest.mark.asyncio
    async def test_render_text_layout_operation(self, sample_image):
        """Test render_text_layout operation."""
        op = RenderTextLayoutOperation()
        context = {}
        elements = [
            {"bbox": [10, 10, 100, 30], "text": "Export"},
            {"bbox": [120, 10, 100, 30], "text": "Cancel"},
        ]

        result = await op.execute(
            sample_image, context,
            {"sources": [elements], "width": 40, "height": 10}
        )
        assert isinstance(result, str)
        assert len(result.split("\n")) == 10


class TestPipelineExecutor:
    """Tests for the pipeline executor."""

    @pytest.mark.asyncio
    async def test_single_step_pipeline(self, executor, sample_image):
        """Test pipeline with single step."""
        result = await executor.execute(sample_image, [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"}
        ])
        assert result.success
        assert "buttons" in result.results

    @pytest.mark.asyncio
    async def test_multi_step_pipeline(self, executor, sample_image):
        """Test pipeline with multiple steps."""
        result = await executor.execute(sample_image, [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
            {"op": "ground", "text": "Export", "assign_to": "export_btn"},
            {"op": "click_point", "source": "$export_btn", "assign_to": "click"}
        ])
        assert result.success
        assert "buttons" in result.results
        assert "export_btn" in result.results
        assert "click" in result.results

    @pytest.mark.asyncio
    async def test_variable_reference(self, executor, sample_image):
        """Test variable reference resolution."""
        result = await executor.execute(sample_image, [
            {"op": "ground", "text": "Export", "assign_to": "target"},
            {"op": "click_point", "source": "$target", "assign_to": "click"}
        ])
        assert result.success
        assert "x" in result.results["click"]
        assert "y" in result.results["click"]

    @pytest.mark.asyncio
    async def test_latency_measurement(self, executor, sample_image):
        """Test that latency is measured."""
        result = await executor.execute(sample_image, [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"}
        ])
        assert result.latency_ms >= 0

    @pytest.mark.asyncio
    async def test_error_handling(self, executor, sample_image):
        """Test error handling for invalid operation."""
        result = await executor.execute(sample_image, [
            {"op": "invalid_op", "assign_to": "x"}
        ])
        assert not result.success
        assert result.error is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
