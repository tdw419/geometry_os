"""
End-to-End Integration Tests for PixelBrain Pipeline.

Tests the complete system integration:
- Float16 weight encoding
- Neural opcodes (0xD0-0xD6)
- Pipeline orchestrator
- THOUGHT_PULSE visual feedback

These tests verify the full flow from brain atlas loading
through token generation and visual emission.
"""
from pathlib import Path

import numpy as np
import pytest


class TestPixelBrainE2E:
    """End-to-end tests for the complete PixelBrain system."""

    @pytest.fixture
    def brain_path(self):
        """Get brain atlas path."""
        return Path("/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png")

    @pytest.fixture
    def brain_available(self, brain_path):
        """Check if brain artifact exists."""
        meta_path = Path(str(brain_path) + ".meta.json")
        return brain_path.exists() and meta_path.exists()

    def test_token_through_pipeline(self, brain_available, brain_path):
        """A token should flow through the full pipeline."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Run forward pass for token 0
        logits = pipeline.forward(0)

        # Verify output shape matches vocab size
        assert logits.shape[0] == 50257, f"Expected vocab size 50257, got {logits.shape[0]}"

        # Verify embedding produced non-zero hidden state
        hidden = pipeline.embed_token(0)
        assert hidden.shape == (64,), f"Expected hidden dim 64, got {hidden.shape}"
        assert not np.allclose(hidden, 0), "Embedding should not be all zeros"

    def test_generate_sequence(self, brain_available, brain_path):
        """Pipeline should generate a token sequence."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Generate 5 tokens from seed
        generated = pipeline.generate([0], max_tokens=5)

        # Verify output
        assert len(generated) == 5, f"Expected 5 tokens, got {len(generated)}"
        assert all(isinstance(t, int) for t in generated), "All tokens should be integers"
        assert all(0 <= t < 50257 for t in generated), "All tokens should be in vocab range"

    def test_visual_feedback_on_generation(self, brain_available, brain_path):
        """Generation should trigger visual feedback."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.visual_bridge import MultiVmStreamer
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))
        bridge = MultiVmStreamer()

        # Generate tokens with visual feedback
        generated = pipeline.generate([0], max_tokens=3)

        # Emit THOUGHT_PULSE for each generated token
        for i, token_id in enumerate(generated):
            result = bridge.emit_thought_pulse(
                token_id=token_id,
                position=(100 + i * 20, 100),
                intensity=1.0
            )
            assert result is True, f"emit_thought_pulse should return True for token {i}"

        # Verify glyphs were created
        assert bridge.has_active_glyphs(), "Should have active glyphs after emission"

        glyphs = bridge.get_active_glyphs()
        assert len(glyphs) == 3, f"Expected 3 glyphs, got {len(glyphs)}"

        # Verify glyph structure
        for i, glyph in enumerate(glyphs):
            assert glyph["opcode"] == 0xCE, f"Glyph {i} should use THOUGHT_RENDER opcode (0xCE)"
            assert glyph["token_id"] == generated[i], f"Glyph {i} should have correct token_id"
            assert "timestamp" in glyph, f"Glyph {i} should have timestamp"

    def test_pipeline_with_visual_bridge_integration(self, brain_available, brain_path):
        """Pipeline and visual bridge should work together."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.api.visual_bridge import MultiVmStreamer
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))
        bridge = MultiVmStreamer()

        # Simulate generation loop with visual feedback
        seed_tokens = [0, 100, 500]
        position = (200, 200)

        for i, token in enumerate(seed_tokens):
            # Run inference
            logits = pipeline.forward(token)
            next_token = int(np.argmax(logits))

            # Emit visual feedback
            bridge.emit_thought_pulse(
                token_id=next_token,
                position=(position[0] + i * 15, position[1]),
                intensity=0.8
            )

        # Verify all emissions recorded
        glyphs = bridge.get_active_glyphs()
        assert len(glyphs) == 3, "Should have emitted 3 glyphs"

    def test_neural_opcodes_available(self):
        """Neural opcodes should be defined in GeoASM."""
        import sys
        sys.path.insert(0, str(Path(__file__).parent.parent / "geoasm-cli"))

        from geoasm_lib import OPCODE_NAMES, OPCODES

        # Verify neural opcodes exist
        neural_opcodes = {
            0xD0: "EMBED",
            0xD1: "ATTEND",
            0xD2: "PROJECT",
            0xD3: "SAMPLE",
            0xD5: "KV_APPEND",
            0xD6: "THOUGHT_PULSE",
        }

        for opcode, expected_name in neural_opcodes.items():
            assert opcode in OPCODES, f"Opcode 0x{opcode:02X} should be defined"
            name, args, desc = OPCODES[opcode]
            assert name == expected_name, f"Opcode 0x{opcode:02X} should be {expected_name}"

        # Verify reverse lookup
        for opcode, expected_name in neural_opcodes.items():
            assert expected_name in OPCODE_NAMES, f"{expected_name} should be in OPCODE_NAMES"
            assert OPCODE_NAMES[expected_name] == opcode, f"{expected_name} should map to 0x{opcode:02X}"

    def test_float16_weight_encoding(self):
        """Weights should be encodable as float16."""
        try:
            from pixel_brain_converter import PixelBrainConverter
        except ImportError:
            pytest.skip("pixel_brain_converter not available")

        import torch

        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        # Create converter instance
        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        # Test float16 encoding preserves values
        test_weights = np.array([[-0.5, 0.0, 0.5, 1.0, -1.0]], dtype=np.float32)
        result = converter.fold_weights_float16(torch.tensor(test_weights))

        assert result.dtype == np.float16, "Should encode as float16"
        np.testing.assert_array_almost_equal(
            result, [-0.5, 0.0, 0.5, 1.0, -1.0],
            decimal=3,
            err_msg="Float16 encoding should preserve values"
        )

    def test_multiple_emissions_accumulate(self):
        """Multiple THOUGHT_PULSE emissions should accumulate."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        # Emit multiple pulses
        positions = [(10, 10), (20, 20), (30, 30), (40, 40)]
        for i, pos in enumerate(positions):
            bridge.emit_thought_pulse(token_id=i, position=pos, intensity=0.5)

        # Verify all accumulated
        glyphs = bridge.get_active_glyphs()
        assert len(glyphs) == 4, "All emissions should accumulate"

        # Verify order preserved
        for i, glyph in enumerate(glyphs):
            assert glyph["token_id"] == i, f"Glyph order should be preserved at index {i}"

    def test_glyph_intensity_clamped(self):
        """Glyph intensity should be clamped to [0, 1]."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        # Test clamping
        bridge.emit_thought_pulse(token_id=1, position=(0, 0), intensity=2.0)  # Above max
        bridge.emit_thought_pulse(token_id=2, position=(0, 0), intensity=-0.5)  # Below min
        bridge.emit_thought_pulse(token_id=3, position=(0, 0), intensity=0.5)   # Valid

        glyphs = bridge.get_active_glyphs()

        assert glyphs[0]["intensity"] == 1.0, "Intensity should clamp to 1.0"
        assert glyphs[1]["intensity"] == 0.0, "Intensity should clamp to 0.0"
        assert glyphs[2]["intensity"] == 0.5, "Valid intensity should be preserved"

    def test_pipeline_config_from_metadata(self, brain_available, brain_path):
        """Pipeline should load config from metadata."""
        if not brain_available:
            pytest.skip("tinystories_brain.rts.png not generated")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline(str(brain_path))

        # Verify config loaded from metadata
        assert pipeline.config.get("dim") == 64, "Should load dim from metadata"
        assert pipeline.config.get("vocab") == 50257, "Should load vocab from metadata"
        assert pipeline.config.get("layers") == 8, "Should load layers from metadata"
