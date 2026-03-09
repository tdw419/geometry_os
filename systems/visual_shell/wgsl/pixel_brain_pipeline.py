"""
PixelBrain Inference Pipeline

Orchestrates the 4 WGSL shaders for inference:
1. embed (0xD0) - Token -> Hidden
2. attend (0xD1) - Self-Attention
3. project (0xD2) - FFN
4. sample (0xD3) - Hidden -> Token

CPU fallback implementation for initial testing.
WebGPU execution path will be added for production.
"""

import json
import numpy as np
from pathlib import Path
from typing import Optional, List
import logging

logger = logging.getLogger(__name__)


class PixelBrainPipeline:
    """
    Native Geometry OS LLM inference pipeline.

    Loads a Hilbert-folded RTS.PNG brain atlas and executes
    inference using WGSL compute shaders (with CPU fallback).
    """

    def __init__(self, brain_path: str):
        """
        Initialize pipeline from a PixelBrain RTS.PNG.

        Args:
            brain_path: Path to .rts.png file (meta.json should be adjacent)
        """
        self.brain_path = Path(brain_path)
        self.atlas: Optional[np.ndarray] = None
        self.metadata: dict = {}
        self.config: dict = {}
        self.model_id: str = "unknown"
        self.encoding: str = "uint8-normalized"
        self._hilbert = None
        self._wgpu_initialized = False

        self._load_metadata()
        self._load_atlas()
        self._init_hilbert()

    def _load_metadata(self):
        """Load brain configuration from meta.json."""
        meta_path = Path(str(self.brain_path) + ".meta.json")
        if not meta_path.exists():
            raise FileNotFoundError(f"Brain metadata not found: {meta_path}")

        with open(meta_path) as f:
            self.metadata = json.load(f)

        self.config = self.metadata.get("config", {})
        self.model_id = self.metadata.get("model_id", "unknown")
        self.encoding = self.metadata.get("encoding", "uint8-normalized")

        logger.info(f"Loaded PixelBrain: {self.model_id}")
        logger.info(
            f"  dim={self.config.get('dim')}, "
            f"layers={self.config.get('layers')}, "
            f"vocab={self.config.get('vocab')}"
        )

    def _load_atlas(self):
        """Load the weight atlas into memory."""
        try:
            import imageio

            if not self.brain_path.exists():
                raise FileNotFoundError(f"Brain atlas not found: {self.brain_path}")

            self.atlas = imageio.imread(str(self.brain_path))
            logger.info(f"Atlas shape: {self.atlas.shape}, dtype: {self.atlas.dtype}")

        except ImportError:
            # Fallback to PIL if imageio not available
            from PIL import Image

            if not self.brain_path.exists():
                raise FileNotFoundError(f"Brain atlas not found: {self.brain_path}")

            img = Image.open(str(self.brain_path))
            self.atlas = np.array(img)
            logger.info(f"Atlas shape: {self.atlas.shape}, dtype: {self.atlas.dtype}")

    def _init_hilbert(self):
        """Initialize Hilbert curve for coordinate lookup."""
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        # Calculate order from atlas size
        size = self.atlas.shape[0]
        order = int(np.log2(size))
        self._hilbert = HilbertCurve(order)
        self._hilbert.generate_lut()

    def _ensure_wgpu(self):
        """Lazily initialize WebGPU (not implemented yet)."""
        if self._wgpu_initialized:
            return

        try:
            import wgpu

            logger.warning("WGPU initialization not implemented - using CPU fallback")
        except ImportError:
            logger.warning("wgpu not available - using CPU fallback")

        self._wgpu_initialized = True

    def embed_token(self, token_id: int) -> np.ndarray:
        """
        Look up token embedding from atlas.

        Args:
            token_id: Token index (0 to vocab_size-1)

        Returns:
            Hidden state vector of shape (dim,)
        """
        self._ensure_wgpu()

        dim = self.config.get("dim", 64)
        vocab = self.config.get("vocab", 50257)

        if token_id < 0 or token_id >= vocab:
            raise ValueError(f"Invalid token_id: {token_id} (vocab size: {vocab})")

        # CPU fallback: Read directly from atlas using Hilbert mapping
        hidden = np.zeros(dim, dtype=np.float32)

        # Each token embedding is 'dim' consecutive float values
        # Starting at Hilbert index = token_id * dim
        for i in range(dim):
            atlas_idx = token_id * dim + i
            if atlas_idx < len(self._hilbert._lut):
                x, y = self._hilbert._lut[atlas_idx]
                channel = atlas_idx % 4

                if self.atlas.ndim == 3:
                    # RGBA image - extract from appropriate channel
                    val = self.atlas[y, x, channel]
                else:
                    # Grayscale
                    val = self.atlas[y, x]

                # Convert from uint8 to float if needed
                if self.atlas.dtype == np.uint8:
                    # Normalized encoding - denormalize
                    hidden[i] = (val / 255.0) * 2.0 - 1.0  # Map 0-255 to -1 to 1
                else:
                    hidden[i] = float(val)

        return hidden

    def forward(self, token_id: int) -> np.ndarray:
        """
        Run complete forward pass through the network.

        Args:
            token_id: Input token

        Returns:
            Logits vector of shape (vocab_size,)
        """
        self._ensure_wgpu()

        # Step 1: Embed
        hidden = self.embed_token(token_id)

        # Step 2: Transformer layers (attention + ffn)
        num_layers = self.config.get("layers", 8)
        for layer in range(num_layers):
            hidden = self._attention_layer(hidden, layer)
            hidden = self._ffn_layer(hidden, layer)

        # Step 3: LM Head -> logits
        logits = self._lm_head(hidden)

        return logits

    def _attention_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """Single attention layer (CPU fallback stub).

        In production, this dispatches pixel_brain_attention.wgsl.
        """
        # Placeholder: identity function
        # Real implementation would read Q, K, V, O weights from atlas
        # and compute scaled dot-product attention
        return hidden

    def _ffn_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """Single FFN layer (CPU fallback stub).

        In production, this dispatches pixel_brain_project.wgsl.
        """
        # Placeholder: identity function
        # Real implementation would read gate, up, down weights from atlas
        # and compute: down(silu(gate(x)) * up(x))
        return hidden

    def _lm_head(self, hidden: np.ndarray) -> np.ndarray:
        """Output projection to logits (CPU fallback stub).

        In production, this is part of sample shader.
        """
        vocab = self.config.get("vocab", 50257)

        # Placeholder: return uniform distribution
        # Real implementation would read lm_head weights from atlas
        # and compute logits = hidden @ lm_head.T
        return np.zeros(vocab, dtype=np.float32)

    def generate(self, prompt_tokens: List[int], max_tokens: int = 32) -> List[int]:
        """
        Generate tokens autoregressively.

        Args:
            prompt_tokens: List of input token IDs
            max_tokens: Maximum tokens to generate

        Returns:
            List of generated token IDs (excluding prompt)
        """
        generated: List[int] = []

        # Use last token as seed
        current_token = prompt_tokens[-1] if prompt_tokens else 0

        for _ in range(max_tokens):
            logits = self.forward(current_token)
            next_token = int(np.argmax(logits))  # Greedy decoding
            generated.append(next_token)
            current_token = next_token

        return generated
