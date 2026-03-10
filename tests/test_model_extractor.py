#!/usr/bin/env python3

import unittest
import numpy as np
from systems.visual_shell.wgsl.model_extractor import extract_model_weights


class TestModelExtractor(unittest.TestCase):
    def create_mock_state_dict(self, model_type="gpt-neo", vocab_size=50257, hidden_dim=768, num_layers=12):
        """Create a mock state dict matching GPT-Neo structure."""
        state_dict = {}

        # Token embeddings
        state_dict["transformer.wte.weight"] = np.random.randn(vocab_size, hidden_dim).astype(np.float32)

        # Position embeddings
        state_dict["transformer.wpe.weight"] = np.random.randn(1024, hidden_dim).astype(np.float32)

        # Layer norms (required for layer detection)
        for i in range(num_layers):
            state_dict[f"transformer.h.{i}.ln_1.weight"] = np.random.randn(hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.ln_1.bias"] = np.random.randn(hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.ln_2.weight"] = np.random.randn(hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.ln_2.bias"] = np.random.randn(hidden_dim).astype(np.float32)

        # Final layer norm
        state_dict["transformer.ln_f.weight"] = np.random.randn(hidden_dim).astype(np.float32)
        state_dict["transformer.ln_f.bias"] = np.random.randn(hidden_dim).astype(np.float32)

        # Attention weights for each layer
        for i in range(num_layers):
            state_dict[f"transformer.h.{i}.attn.attention.q_proj.weight"] = np.random.randn(hidden_dim, hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.attn.attention.k_proj.weight"] = np.random.randn(hidden_dim, hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.attn.attention.v_proj.weight"] = np.random.randn(hidden_dim, hidden_dim).astype(np.float32)
            state_dict[f"transformer.h.{i}.attn.attention.out_proj.weight"] = np.random.randn(hidden_dim, hidden_dim).astype(np.float32)

        # FFN weights for each layer
        for i in range(num_layers):
            state_dict[f"transformer.h.{i}.mlp.gate_proj.weight"] = np.random.randn(hidden_dim, hidden_dim * 4).astype(np.float32)
            state_dict[f"transformer.h.{i}.mlp.up_proj.weight"] = np.random.randn(hidden_dim, hidden_dim * 4).astype(np.float32)
            state_dict[f"transformer.h.{i}.mlp.down_proj.weight"] = np.random.randn(hidden_dim * 4, hidden_dim).astype(np.float32)

        # LM head (may share with embeddings)
        state_dict["lm_head.weight"] = np.random.randn(vocab_size, hidden_dim).astype(np.float32)

        return state_dict

    def test_extract_weights_basic(self):
        """Test basic weight extraction with mock GPT-Neo state dict."""
        state_dict = self.create_mock_state_dict()
        flat_weights, metadata = extract_model_weights(state_dict, "gpt-neo")

        # Check that flat_weights is a 1D numpy array
        self.assertIsInstance(flat_weights, np.ndarray)
        self.assertEqual(flat_weights.ndim, 1)

        # Check metadata structure
        self.assertEqual(metadata["model_type"], "gpt-neo")
        self.assertEqual(metadata["vocab_size"], 50257)
        self.assertEqual(metadata["hidden_dim"], 768)
        self.assertEqual(metadata["num_layers"], 12)

        # Calculate expected total parameters (only core weights, not layer norms or position embeddings)
        # The extractor automatically includes LM head if present in state dict
        expected_params = (
            # Embeddings
            50257 * 768 +
            # All layer weights (12 layers * 4 attention weights + 3 FFN weights)
            12 * (4 * 768 * 768 + 768 * 3072 + 768 * 3072 + 3072 * 768)
        )
        # Add LM head if present (which it is in our mock)
        expected_params += 50257 * 768

        self.assertEqual(len(flat_weights), expected_params)
        self.assertEqual(metadata["total_params"], expected_params)

    def test_weight_layout_sectors(self):
        """Test that weight layout sectors are correctly defined."""
        state_dict = self.create_mock_state_dict()
        flat_weights, metadata = extract_model_weights(state_dict, "gpt-neo")

        # Check that all sectors are present
        self.assertIn("embeddings", metadata["sectors"])
        self.assertIn("layer_0_attention", metadata["sectors"])
        self.assertIn("layer_0_ffn", metadata["sectors"])
        self.assertIn("layer_11_attention", metadata["sectors"])
        self.assertIn("layer_11_ffn", metadata["sectors"])

        # Check sector boundaries
        embeddings_sector = metadata["sectors"]["embeddings"]
        self.assertEqual(embeddings_sector["start"], 0)
        self.assertLess(embeddings_sector["end"], len(flat_weights))

        # Check that sectors are contiguous
        prev_end = embeddings_sector["end"]
        for i in range(metadata["num_layers"]):
            attention_sector = metadata["sectors"][f"layer_{i}_attention"]
            self.assertEqual(attention_sector["start"], prev_end)
            self.assertLess(attention_sector["end"], len(flat_weights))
            prev_end = attention_sector["end"]

            ffn_sector = metadata["sectors"][f"layer_{i}_ffn"]
            self.assertEqual(ffn_sector["start"], prev_end)
            self.assertLess(ffn_sector["end"], len(flat_weights))
            prev_end = ffn_sector["end"]

    def test_different_model_types(self):
        """Test extraction with different model types."""
        # Test with GPT-J (different weight naming)
        state_dict = self.create_mock_state_dict(model_type="gpt-j")

        # Update for GPT-J naming
        for i in range(12):
            # Rename attention weights
            state_dict[f"transformer.h.{i}.attn.q_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.q_proj.weight")
            state_dict[f"transformer.h.{i}.attn.k_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.k_proj.weight")
            state_dict[f"transformer.h.{i}.attn.v_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.v_proj.weight")
            state_dict[f"transformer.h.{i}.attn.out_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.out_proj.weight")

            # Rename FFN weights
            state_dict[f"transformer.h.{i}.mlp.c_fc.weight"] = state_dict.pop(f"transformer.h.{i}.mlp.gate_proj.weight")
            state_dict[f"transformer.h.{i}.mlp.c_proj.weight"] = state_dict.pop(f"transformer.h.{i}.mlp.down_proj.weight")

        flat_weights, metadata = extract_model_weights(state_dict, "gpt-j")

        self.assertEqual(metadata["model_type"], "gpt-j")
        self.assertGreater(len(flat_weights), 0)

        # Test with LLaMA (different weight naming)
        state_dict = self.create_mock_state_dict(model_type="llama")

        # Update for LLaMA naming
        # Rename embeddings
        state_dict["model.embed_tokens.weight"] = state_dict.pop("transformer.wte.weight")
        state_dict["model.embed_positions.weight"] = state_dict.pop("transformer.wpe.weight")

        # Rename layer weights
        for i in range(12):
            # Rename attention weights
            state_dict[f"model.layers.{i}.self_attn.q_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.q_proj.weight")
            state_dict[f"model.layers.{i}.self_attn.k_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.k_proj.weight")
            state_dict[f"model.layers.{i}.self_attn.v_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.v_proj.weight")
            state_dict[f"model.layers.{i}.self_attn.o_proj.weight"] = state_dict.pop(f"transformer.h.{i}.attn.attention.out_proj.weight")

            # Rename FFN weights
            state_dict[f"model.layers.{i}.mlp.gate_proj.weight"] = state_dict.pop(f"transformer.h.{i}.mlp.gate_proj.weight")
            state_dict[f"model.layers.{i}.mlp.up_proj.weight"] = state_dict.pop(f"transformer.h.{i}.mlp.up_proj.weight")
            state_dict[f"model.layers.{i}.mlp.down_proj.weight"] = state_dict.pop(f"transformer.h.{i}.mlp.down_proj.weight")

            # Rename layer norms
            state_dict[f"model.layers.{i}.input_layernorm.weight"] = state_dict.pop(f"transformer.h.{i}.ln_1.weight")
            state_dict[f"model.layers.{i}.input_layernorm.bias"] = state_dict.pop(f"transformer.h.{i}.ln_1.bias")
            state_dict[f"model.layers.{i}.post_attention_layernorm.weight"] = state_dict.pop(f"transformer.h.{i}.ln_2.weight")
            state_dict[f"model.layers.{i}.post_attention_layernorm.bias"] = state_dict.pop(f"transformer.h.{i}.ln_2.bias")

        # Rename final layer norm
        state_dict["model.norm.weight"] = state_dict.pop("transformer.ln_f.weight")
        state_dict["model.norm.bias"] = state_dict.pop("transformer.ln_f.bias")

        flat_weights, metadata = extract_model_weights(state_dict, "llama")

        self.assertEqual(metadata["model_type"], "llama")
        self.assertGreater(len(flat_weights), 0)

    def test_weight_ordering(self):
        """Test that weights are extracted in the correct order."""
        state_dict = self.create_mock_state_dict()
        flat_weights, metadata = extract_model_weights(state_dict, "gpt-neo")

        # Extract embeddings manually to check ordering
        embeddings = state_dict["transformer.wte.weight"].flatten()
        embeddings_start = metadata["sectors"]["embeddings"]["start"]
        embeddings_end = metadata["sectors"]["embeddings"]["end"]

        # Check that extracted embeddings match
        np.testing.assert_array_equal(
            flat_weights[embeddings_start:embeddings_end],
            embeddings
        )

        # Extract first attention layer weights (q, k, v, o concatenated)
        q_weight = state_dict["transformer.h.0.attn.attention.q_proj.weight"].flatten()
        k_weight = state_dict["transformer.h.0.attn.attention.k_proj.weight"].flatten()
        v_weight = state_dict["transformer.h.0.attn.attention.v_proj.weight"].flatten()
        o_weight = state_dict["transformer.h.0.attn.attention.out_proj.weight"].flatten()

        expected_attention = np.concatenate([q_weight, k_weight, v_weight, o_weight])
        attention_start = metadata["sectors"]["layer_0_attention"]["start"]
        attention_end = metadata["sectors"]["layer_0_attention"]["end"]

        # Check that extracted attention weights follow embeddings
        np.testing.assert_array_equal(
            flat_weights[attention_start:attention_end],
            expected_attention
        )


if __name__ == "__main__":
    unittest.main()