"""
GeoASM Executor

Executes GeoASM instructions against PixelBrainPipeline.
Each opcode dispatches to the corresponding WGSL shader.
"""

import logging
from typing import List, Callable, Optional, Any, Dict
from .instruction import Instruction, Opcode
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7

logger = logging.getLogger(__name__)

# Type for instruction hooks
HookFn = Callable[[Instruction, RegisterFile], None]


class Executor:
    """
    GeoASM instruction executor.

    Dispatches instructions to PixelBrainPipeline shader stages,
    maintaining register state and visual feedback hooks.
    """

    def __init__(
        self,
        pipeline: Any,
        registers: Optional[RegisterFile] = None,
        visual_bridge: Optional[Any] = None,
    ):
        """
        Initialize executor.

        Args:
            pipeline: PixelBrainPipeline instance for GPU dispatch
            registers: RegisterFile (created if None)
            visual_bridge: Optional VisualBridge for THOUGHT_PULSE
        """
        self.pipeline = pipeline
        self.registers = registers or RegisterFile()
        self.visual_bridge = visual_bridge

        self.current_layer = 0
        self.position = 0

        self._pre_hooks: List[HookFn] = []
        self._post_hooks: List[HookFn] = []

    def add_pre_hook(self, hook: HookFn) -> None:
        """Add pre-execution hook."""
        self._pre_hooks.append(hook)

    def add_post_hook(self, hook: HookFn) -> None:
        """Add post-execution hook."""
        self._post_hooks.append(hook)

    def execute(self, instruction: Instruction) -> None:
        """
        Execute a single instruction.

        Args:
            instruction: GeoASM instruction to execute
        """
        # Pre-hooks
        for hook in self._pre_hooks:
            hook(instruction, self.registers)

        # Dispatch
        opcode = instruction.opcode

        if opcode == Opcode.EMBED:
            self._exec_embed(instruction)
        elif opcode == Opcode.ATTEND:
            self._exec_attend(instruction)
        elif opcode == Opcode.PROJECT:
            self._exec_project(instruction)
        elif opcode == Opcode.SAMPLE:
            self._exec_sample(instruction)
        elif opcode == Opcode.LAYER:
            self._exec_layer(instruction)
        elif opcode == Opcode.KV_APPEND:
            self._exec_kv_append(instruction)
        elif opcode == Opcode.THOUGHT_PULSE:
            self._exec_thought_pulse(instruction)
        else:
            raise ValueError(f"Unknown opcode: {opcode}")

        # Post-hooks
        for hook in self._post_hooks:
            hook(instruction, self.registers)

    def run(self, instructions: List[Instruction]) -> Dict[str, Any]:
        """
        Run a program (list of instructions).

        Args:
            instructions: List of GeoASM instructions

        Returns:
            Execution results with stats
        """
        count = 0
        errors = []

        for inst in instructions:
            try:
                self.execute(inst)
                count += 1
            except Exception as e:
                logger.error(f"Error executing {inst}: {e}")
                errors.append(str(e))

        return {
            'instructions_executed': count,
            'errors': errors,
            'final_registers': self.registers.to_buffer().tolist(),
        }

    def _exec_embed(self, inst: Instruction) -> None:
        """EMBED R1, R2: Token ID → Hidden vector."""
        token_id = int(self.registers.get(inst.rs))

        # Call pipeline embedding
        # We assume pipeline has embed_token method as per architecture
        if hasattr(self.pipeline, 'embed_token'):
            hidden = self.pipeline.embed_token(token_id, self.position)
        else:
            # Fallback for mock/testing
            hidden = np.zeros(64, dtype=np.float32)

        # Store in destination register
        self.registers.set_vector(inst.rd, hidden)

        logger.debug(f"EMBED: token={token_id} → R{inst.rd}")

    def _exec_attend(self, inst: Instruction) -> None:
        """ATTEND R2, R3: Self-attention."""
        hidden = self.registers.get_vector(inst.rs)

        # Dispatch to attention shader
        self._dispatch_attention(hidden, self.current_layer, self.position)

        self.registers.set_vector(inst.rd, hidden)
        logger.debug(f"ATTEND: R{inst.rs} → R{inst.rd} (layer={self.current_layer})")

    def _exec_project(self, inst: Instruction) -> None:
        """PROJECT R3, R4: SwiGLU FFN."""
        hidden = self.registers.get_vector(inst.rs)

        # Dispatch to FFN shader
        self._dispatch_ffn(hidden, self.current_layer)

        self.registers.set_vector(inst.rd, hidden)
        logger.debug(f"PROJECT: R{inst.rs} → R{inst.rd} (layer={self.current_layer})")

    def _exec_sample(self, inst: Instruction) -> None:
        """SAMPLE R4, R5: Hidden state → Token ID."""
        hidden = self.registers.get_vector(inst.rs)

        # Dispatch to sample shader
        token_id = self._dispatch_sample(hidden)

        self.registers.set(inst.rd, token_id)
        logger.debug(f"SAMPLE: R{inst.rs} → token={token_id} in R{inst.rd}")

    def _exec_layer(self, inst: Instruction) -> None:
        """LAYER #N: Set current layer index."""
        self.current_layer = inst.imm
        logger.debug(f"LAYER: now at layer {self.current_layer}")

    def _exec_kv_append(self, inst: Instruction) -> None:
        """KV_APPEND R2, #0: Update KV-cache (0=K, 1=V)."""
        # Vector must be in R2, R3, or R4
        try:
            hidden = self.registers.get_vector(inst.rs)
        except ValueError:
            # Fallback for scalar registers (not recommended but for robustness)
            hidden = np.zeros(64, dtype=np.float32)
            hidden[0] = self.registers.get(inst.rs)

        kv_type = inst.imm

        # Call pipeline KV append
        if hasattr(self.pipeline, 'kv_append_gpu'):
            self.pipeline.kv_append_gpu(
                layer=self.current_layer,
                position=self.position,
                hidden=hidden,
                kv_type=kv_type
            )
        
        logger.debug(
            f"KV_APPEND: R{inst.rs} as {'K' if kv_type==0 else 'V'} "
            f"(layer={self.current_layer}, pos={self.position})"
        )

    def _exec_thought_pulse(self, inst: Instruction) -> None:
        """THOUGHT_PULSE R5: Emit visual glyph."""
        token_id = int(self.registers.get(inst.rs))

        if self.visual_bridge:
            self.visual_bridge.emit_thought_pulse(
                token=token_id,
                position=self.position,
                layer=self.current_layer,
            )

        logger.debug(f"THOUGHT_PULSE: token={token_id}")

    # Shader dispatch helpers (CPU fallback if WGPU unavailable)
    def _dispatch_attention(self, hidden, layer, position):
        """Dispatch to attention shader or CPU fallback."""
        # This will be refined during integration with PixelBrainPipeline
        pass

    def _dispatch_ffn(self, hidden, layer):
        """Dispatch to FFN shader or CPU fallback."""
        # This will be refined during integration with PixelBrainPipeline
        pass

    def _dispatch_sample(self, hidden) -> int:
        """Dispatch to sample shader or CPU fallback."""
        # This will be refined during integration with PixelBrainPipeline
        return 0  # Placeholder

import numpy as np
