"""Tests for PixelBrain inference pipeline."""
import pytest
import numpy as np
from pathlib import Path


class TestPixelBrainPipeline:
    """Test the inference pipeline orchestration."""

    @pytest.fixture
    def brain_path(self):
        """Get brain atlas path."""
        return Path("/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png")

    @pytest.fixture
    def brain_available(self, brain_path):
        """Check if brain artifact exists."""
        meta_path = Path(str(brain_path) + ".meta.json")
        return brain_path.exists() and meta_path.exists()

    def test_pipeline_loads_brain_atlas(self, brain_available, brain_path):
        """Pipeline should load the RTS.PNG brain atlas."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))
        assert pipeline.atlas is not None
        assert pipeline.config["dim"] == 64

    def test_pipeline_embed_token(self, brain_available, brain_path):
        """Pipeline should embed a single token."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Token 0 should produce a 64-dim hidden state
        hidden = pipeline.embed_token(0)
        assert hidden.shape == (64,)
        assert not np.allclose(hidden, 0)  # Should not be zeros

    def test_pipeline_forward_pass(self, brain_available, brain_path):
        """Pipeline should run a complete forward pass."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Token 0 through full network
        logits = pipeline.forward(0)
        assert logits.shape[0] == 50257  # vocab size

    def test_generate_sequence(self, brain_available, brain_path):
        """Pipeline should generate a token sequence."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Generate from seed token
        generated = pipeline.generate([0], max_tokens=5)

        assert len(generated) == 5
        assert all(isinstance(t, int) for t in generated)
        assert all(0 <= t < 50257 for t in generated)
