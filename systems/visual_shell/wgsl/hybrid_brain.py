"""
Hybrid Brain - Hilbert Atlas Storage + PyTorch Inference

Best of both worlds:
- Hilbert atlas for weight storage & spatial mutation (Evolution Daemon)
- PyTorch for correct inference (proven architecture)
"""

import numpy as np
import torch
import torch.nn as nn
from typing import Optional, Dict
from pathlib import Path
import json

class HybridBrain(nn.Module):
    """
    GPT-Neo model that loads weights from Hilbert atlas.

    The atlas provides:
    - Spatial weight organization (Evolution Daemon can mutate)
    - Q4_0 compression for memory efficiency
    - Glass Box visualization of weight regions

    PyTorch provides:
    - Correct forward pass implementation
    - GPU acceleration
    - Proven numerical stability
    """

    def __init__(self, brain_path: str):
        super().__init__()

        self.brain_path = Path(brain_path)
        self.atlas: Optional[np.ndarray] = None
        self.metadata: Dict = {}
        self.config: Dict = {}
        self._hilbert = None
        self._weights_cache: Dict[str, np.ndarray] = {}

        # Load atlas and metadata
        self._load_atlas()
        self._load_metadata()
        self._init_hilbert()

        # Build PyTorch model
        self._build_model()

        # Load weights from atlas into PyTorch
        self._load_weights_from_atlas()

    def _load_atlas(self):
        """Load the PNG atlas."""
        from PIL import Image
        self.atlas = np.array(Image.open(self.brain_path))
        print(f"Loaded atlas: {self.atlas.shape}")

    def _load_metadata(self):
        """Load brain metadata."""
        meta_path = Path(str(self.brain_path) + ".meta.json")
        with open(meta_path) as f:
            self.metadata = json.load(f)

        self.config = self.metadata.get("config", {})
        print(f"Config: {self.config.get('layers')} layers, {self.config.get('dim')} dim")

    def _init_hilbert(self):
        """Initialize Hilbert curve."""
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        size = self.atlas.shape[0]
        order = int(np.log2(size))
        self._hilbert = HilbertCurve(order)

    def _get_sector_weights(self, sector_name: str) -> Optional[np.ndarray]:
        """Fetch weights for a sector from the Hilbert atlas."""
        if sector_name in self._weights_cache:
            return self._weights_cache[sector_name]

        sector = self.metadata.get("layout", {}).get("sectors", {}).get(sector_name)
        if not sector:
            return None

        start = sector.get("start", 0)
        end = sector.get("end", 0)
        count = end - start

        if count == 0:
            return None

        weights = np.zeros(count, dtype=np.float32)

        # In Q4_0, each block of 32 weights = 20 bytes = 5 pixels
        first_block = start // 32
        last_block = (start + count - 1) // 32

        weights_pos = 0
        for block_idx in range(first_block, last_block + 1):
            pixel_start = block_idx * 5
            block_bytes = bytearray()

            for p_offset in range(5):
                p_idx = pixel_start + p_offset
                x, y = self._hilbert._index_to_coord(p_idx, self._hilbert.grid_size)
                block_bytes.extend(self.atlas[y, x].tolist())

            if len(block_bytes) < 20:
                break

            # Dequantize
            scale = np.frombuffer(bytes(block_bytes[:2]), dtype=np.float16)[0]
            packed = np.frombuffer(bytes(block_bytes[2:18]), dtype=np.uint8)

            weights_4bit = np.zeros(32, dtype=np.uint8)
            for i in range(16):
                byte = packed[i]
                weights_4bit[i * 2] = byte >> 4
                weights_4bit[i * 2 + 1] = byte & 0xF

            block_weights = float(scale) * (weights_4bit.astype(np.float32) - 8.0)

            # Extract requested weights
            block_start_weight = block_idx * 32
            offset_in_block = max(0, start - block_start_weight)
            take_from_block = min(32 - offset_in_block, count - weights_pos)

            weights[weights_pos:weights_pos + take_from_block] = \
                block_weights[offset_in_block:offset_in_block + take_from_block]
            weights_pos += take_from_block

        shape = sector.get("shape")
        if shape:
            weights = weights.reshape(shape)

        self._weights_cache[sector_name] = weights
        return weights

    def _build_model(self):
        """Build PyTorch GPT-Neo model structure."""
        from transformers import GPTNeoModel, GPTNeoConfig

        # Create config
        num_layers = self.config.get("layers", 12)
        config = GPTNeoConfig(
            vocab_size=self.config.get("vocab", 50257),
            hidden_size=self.config.get("dim", 768),
            num_layers=num_layers,
            num_attention_heads=12,
            intermediate_size=3072,
            attention_types=[[["global"], num_layers]],  # All global attention
        )

        # Create model
        self.model = GPTNeoModel(config)

        # Add LM head
        self.lm_head = nn.Linear(config.hidden_size, config.vocab_size, bias=False)

    def _load_weights_from_atlas(self):
        """Load all weights from Hilbert atlas into PyTorch model."""
        print("Loading weights from Hilbert atlas...")

        # Token embeddings
        wte = self._get_sector_weights("embeddings")
        if wte is not None:
            self.model.wte.weight.data = torch.from_numpy(wte)

        # Position embeddings
        wpe = self._get_sector_weights("pos_embeddings")
        if wpe is not None:
            self.model.wpe.weight.data = torch.from_numpy(wpe)

        # Layer weights
        num_layers = self.config.get("layers", 12)
        for i in range(num_layers):
            layer = self.model.h[i]

            # LayerNorm 1
            ln1_w = self._get_sector_weights(f"layer_{i}_ln1_w")
            ln1_b = self._get_sector_weights(f"layer_{i}_ln1_b")
            if ln1_w is not None:
                layer.ln_1.weight.data = torch.from_numpy(ln1_w)
            if ln1_b is not None:
                layer.ln_1.bias.data = torch.from_numpy(ln1_b)

            # Attention projections
            for proj in ["q_proj", "k_proj", "v_proj", "out_proj"]:
                w = self._get_sector_weights(f"layer_{i}_attn_{proj}_w")
                b = self._get_sector_weights(f"layer_{i}_attn_{proj}_b")
                proj_layer = getattr(layer.attn.attention, proj)
                if w is not None and hasattr(proj_layer, 'weight') and proj_layer.weight is not None:
                    proj_layer.weight.data = torch.from_numpy(w)
                if b is not None and hasattr(proj_layer, 'bias') and proj_layer.bias is not None:
                    proj_layer.bias.data = torch.from_numpy(b)

            # LayerNorm 2
            ln2_w = self._get_sector_weights(f"layer_{i}_ln2_w")
            ln2_b = self._get_sector_weights(f"layer_{i}_ln2_b")
            if ln2_w is not None:
                layer.ln_2.weight.data = torch.from_numpy(ln2_w)
            if ln2_b is not None:
                layer.ln_2.bias.data = torch.from_numpy(ln2_b)

            # MLP
            c_fc_w = self._get_sector_weights(f"layer_{i}_mlp_c_fc_w")
            c_fc_b = self._get_sector_weights(f"layer_{i}_mlp_c_fc_b")
            if c_fc_w is not None:
                layer.mlp.c_fc.weight.data = torch.from_numpy(c_fc_w)
            if c_fc_b is not None:
                layer.mlp.c_fc.bias.data = torch.from_numpy(c_fc_b)

            c_proj_w = self._get_sector_weights(f"layer_{i}_mlp_c_proj_w")
            c_proj_b = self._get_sector_weights(f"layer_{i}_mlp_c_proj_b")
            if c_proj_w is not None:
                layer.mlp.c_proj.weight.data = torch.from_numpy(c_proj_w)
            if c_proj_b is not None:
                layer.mlp.c_proj.bias.data = torch.from_numpy(c_proj_b)

        # Final LayerNorm
        ln_f_w = self._get_sector_weights("ln_f_w")
        ln_f_b = self._get_sector_weights("ln_f_b")
        if ln_f_w is not None:
            self.model.ln_f.weight.data = torch.from_numpy(ln_f_w)
        if ln_f_b is not None:
            self.model.ln_f.bias.data = torch.from_numpy(ln_f_b)

        # LM Head
        lm_head = self._get_sector_weights("lm_head")
        if lm_head is not None:
            self.lm_head.weight.data = torch.from_numpy(lm_head)

        print(f"Loaded {len(self._weights_cache)} weight sectors")

    def forward(self, input_ids: torch.Tensor, output_attentions: bool = False):
        """Generate logits from input tokens.

        Args:
            input_ids: Input token IDs
            output_attentions: If True, return attention weights

        Returns:
            If output_attentions=False: logits tensor
            If output_attentions=True: (logits, attentions) tuple
        """
        with torch.no_grad():
            outputs = self.model(input_ids, output_attentions=output_attentions)
            hidden = outputs.last_hidden_state
            logits = self.lm_head(hidden)

            if output_attentions:
                return logits, outputs.attentions
            return logits

    def generate(self, prompt_tokens: list, max_tokens: int = 32) -> list:
        """Generate tokens autoregressively."""
        input_ids = torch.tensor([prompt_tokens])

        for _ in range(max_tokens):
            logits = self.forward(input_ids)
            next_token = logits[0, -1].argmax().item()
            input_ids = torch.cat([input_ids, torch.tensor([[next_token]])], dim=1)

        return input_ids[0].tolist()

    def generate_with_attention(
        self,
        prompt_tokens: list,
        max_tokens: int = 32,
        attention_callback=None
    ) -> dict:
        """Generate tokens with attention pattern capture.

        Args:
            prompt_tokens: Input token IDs
            max_tokens: Maximum tokens to generate
            attention_callback: Optional callback(token_id, attention_data) per token

        Returns:
            dict with 'tokens', 'text' (if tokenizer provided), and 'attention_history'
        """
        input_ids = torch.tensor([prompt_tokens])
        attention_history = []

        for step in range(max_tokens):
            logits, attentions = self.forward(input_ids, output_attentions=True)
            next_token = logits[0, -1].argmax().item()

            # Package attention data
            attention_data = {
                "step": step,
                "token_id": next_token,
                "seq_len": input_ids.shape[1],
                "num_layers": len(attentions),
                "patterns": []
            }

            # Extract attention patterns per layer
            for layer_idx, attn in enumerate(attentions):
                # attn shape: (batch, heads, seq_len, seq_len)
                attn_np = attn[0].numpy()  # Remove batch dim

                # Average across heads for visualization
                avg_attention = attn_np.mean(axis=0)  # (seq_len, seq_len)

                # Get attention from last token to all previous
                last_token_attention = avg_attention[-1, :].tolist()

                attention_data["patterns"].append({
                    "layer": layer_idx,
                    "heads": attn_np.shape[0],
                    "last_token_attention": last_token_attention,
                    "entropy": float(-np.sum(avg_attention * np.log(avg_attention + 1e-10)))
                })

            attention_history.append(attention_data)

            # Call callback if provided
            if attention_callback:
                attention_callback(next_token, attention_data)

            # Append token
            input_ids = torch.cat([input_ids, torch.tensor([[next_token]])], dim=1)

        return {
            "tokens": input_ids[0].tolist(),
            "attention_history": attention_history
        }

    def get_weight_region(self, sector_name: str) -> np.ndarray:
        """Get weight region for Glass Box visualization."""
        return self._get_sector_weights(sector_name)

    def mutate_weights(self, sector_name: str, mutation_fn):
        """
        Mutate weights in the atlas (for Evolution Daemon).

        1. Get weights from atlas
        2. Apply mutation
        3. Re-quantize and write back to atlas
        """
        from systems.visual_shell.wgsl.quantization.q4_utils import q4_quantize_block

        sector = self.metadata.get("layout", {}).get("sectors", {}).get(sector_name)
        if not sector:
            return False

        # Get current weights
        weights = self._get_sector_weights(sector_name).copy()

        # Apply mutation
        mutated = mutation_fn(weights)

        # Re-quantize and write back
        shape = sector.get("shape")
        flat = mutated.flatten()

        # Quantize in blocks of 32
        for block_idx in range((len(flat) + 31) // 32):
            start = block_idx * 32
            end = min(start + 32, len(flat))
            block = np.zeros(32, dtype=np.float32)
            block[:end-start] = flat[start:end]

            # Quantize
            result = q4_quantize_block(block)
            scale_bytes = np.array([result['scale']], dtype=np.float16).tobytes()
            packed = result['packed_weights'].tobytes()
            block_bytes = scale_bytes + packed + b'\x00\x00'

            # Write to atlas
            pixel_start = (sector['start'] // 32 + block_idx) * 5
            for p_offset in range(5):
                p_idx = pixel_start + p_offset
                x, y = self._hilbert._index_to_coord(p_idx, self._hilbert.grid_size)
                self.atlas[y, x] = list(block_bytes[p_offset*4:(p_offset+1)*4])

        # Clear cache
        if sector_name in self._weights_cache:
            del self._weights_cache[sector_name]

        # Reload into PyTorch
        self._load_weights_from_atlas()

        return True


if __name__ == "__main__":
    from transformers import AutoTokenizer

    print("=== Hybrid Brain Test ===\n")

    # Load brain
    brain = HybridBrain("gpt_neo_125m_brain_fixed.rts.png")

    # Load tokenizer
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")

    # Test generation
    prompt = "The computer"
    tokens = tokenizer.encode(prompt)
    print(f"Prompt: '{prompt}' (tokens: {tokens})")

    print("\nGenerating...")
    import time
    start = time.time()
    output_tokens = brain.generate(tokens, max_tokens=10)
    elapsed = time.time() - start

    output_text = tokenizer.decode(output_tokens)
    print(f"Output: '{output_text}'")
    print(f"Time: {elapsed:.2f}s ({10/elapsed:.1f} tok/s)")
