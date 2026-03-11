"""Tests for GeoASM Executor."""
from unittest.mock import MagicMock

import numpy as np
import pytest


class TestExecutor:
    """Test instruction execution against PixelBrainPipeline."""

    @pytest.fixture
    def executor(self):
        """Create Executor with mocked pipeline."""
        from systems.visual_shell.geoasm.executor import Executor
        from systems.visual_shell.geoasm.register_file import RegisterFile

        pipeline = MagicMock()
        pipeline.config = {"dim": 64, "layers": 8, "vocab": 50257}
        # Mock embed_token to return a 64-dim vector
        pipeline.embed_token.return_value = np.zeros(64, dtype=np.float32)

        regs = RegisterFile()
        return Executor(pipeline, regs)

    def test_executor_has_pipeline(self, executor):
        """Executor holds reference to PixelBrainPipeline."""
        assert executor.pipeline is not None

    def test_execute_embed(self, executor):
        """EMBED loads token embedding into register."""
        from systems.visual_shell.geoasm.instruction import EMBED
        from systems.visual_shell.geoasm.register_file import R1, R2

        executor.registers.set(R1, 42)  # Token ID
        inst = EMBED(R1, R2)

        executor.execute(inst)

        # R2 should now contain hidden vector
        hidden = executor.registers.get_vector(R2)
        assert hidden.shape == (64,)
        executor.pipeline.embed_token.assert_called_once_with(42, 0)

    def test_execute_sample(self, executor):
        """SAMPLE produces token ID from hidden state."""
        from systems.visual_shell.geoasm.instruction import SAMPLE
        from systems.visual_shell.geoasm.register_file import R2, R5

        # Set up hidden state in R2
        hidden = np.random.randn(64).astype(np.float32)
        executor.registers.set_vector(R2, hidden)

        inst = SAMPLE(R2, R5)
        executor.execute(inst)

        # R5 should contain sampled token (mocked to 0)
        token = executor.registers.get(R5)
        assert isinstance(token, (int, float))

    def test_execute_thought_pulse(self, executor):
        """THOUGHT_PULSE emits visual feedback."""
        from systems.visual_shell.geoasm.instruction import THOUGHT_PULSE
        from systems.visual_shell.geoasm.register_file import R5

        executor.registers.set(R5, 1234)  # Token ID
        executor.visual_bridge = MagicMock()

        inst = THOUGHT_PULSE(R5)
        executor.execute(inst)

        # Should have called visual bridge
        executor.visual_bridge.emit_thought_pulse.assert_called_once_with(
            token=1234,
            position=0,
            layer=0
        )

    def test_run_program(self, executor):
        """Run complete program from instruction list."""
        from systems.visual_shell.geoasm.assembler import Assembler

        assembler = Assembler()
        program = assembler.assemble("""
            EMBED R1, R2
            SAMPLE R2, R5
        """)

        executor.registers.set(1, 0)  # Token ID 0
        results = executor.run(program)

        assert 'instructions_executed' in results
        assert results['instructions_executed'] == 2

    def test_executor_hooks(self, executor):
        """Executor supports pre/post instruction hooks."""
        called = []

        def pre_hook(inst, regs):
            called.append(('pre', inst.opcode.name))

        def post_hook(inst, regs):
            called.append(('post', inst.opcode.name))

        executor.add_pre_hook(pre_hook)
        executor.add_post_hook(post_hook)

        from systems.visual_shell.geoasm.instruction import LAYER
        executor.execute(LAYER(3))

        assert ('pre', 'LAYER') in called
        assert ('post', 'LAYER') in called

    def test_layer_instruction_updates_state(self, executor):
        """LAYER instruction updates current layer."""
        from systems.visual_shell.geoasm.instruction import LAYER

        inst = LAYER(5)
        executor.execute(inst)

        assert executor.current_layer == 5
