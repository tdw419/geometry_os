"""Tests for PixelBrain weight encoding."""

import numpy as np
import torch


class TestWeightEncoding:
    """Test that weights are encoded as float16, not normalized."""

    def test_fold_weights_preserves_float16(self, tmp_path):
        """Weights should be stored as float16, not 0-255 normalized."""
        from pixel_brain_converter import PixelBrainConverter

        # Create a small test tensor
        test_weights = np.array([
            [-0.5, 0.0, 0.5],
            [1.0, -1.0, 0.25]
        ], dtype=np.float32)

        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3

        # Import HilbertCurve
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        # Fold should preserve float values
        result = converter.fold_weights_float16(torch.tensor(test_weights))

        # Verify float16 encoding
        assert result.dtype == np.float16
        assert len(result) == 6

    def test_fold_weights_float16_preserves_values(self, tmp_path):
        """Float16 fold should preserve actual weight values, not normalize."""
        from pixel_brain_converter import PixelBrainConverter

        test_weights = np.array([[-0.5, 0.0, 0.5]], dtype=np.float32)

        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3

        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        result = converter.fold_weights_float16(torch.tensor(test_weights))

        # Values should be preserved (within float16 precision)
        np.testing.assert_array_almost_equal(result, [-0.5, 0.0, 0.5], decimal=3)

    def test_atlas_stores_rgba_float16(self, tmp_path):
        """Atlas pixels should store float16 values."""
        from pixel_brain_converter import PixelBrainConverter

        # This test will fail until we implement float16 storage
        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3

        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        # Mock config
        class MockConfig:
            num_hidden_layers = 0
            vocab_size = 100
            hidden_size = 16

        converter.config = MockConfig()

        test_tensor = torch.randn(64, 64, dtype=torch.float32)
        atlas = converter.create_brain_atlas_float16(test_tensor)

        # Atlas should be float16, not uint8
        assert atlas.dtype == np.float16
