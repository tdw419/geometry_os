#!/usr/bin/env python3

"""
Model Weight Extractor for Geometry OS

Extracts and flattens model weights for atlas packing in the Hilbert space.
Supports multiple model architectures with proper weight layout metadata.
"""

import numpy as np
from typing import Dict, Any, Tuple
import logging

logger = logging.getLogger(__name__)


def extract_model_weights(state_dict: Dict[str, Any], model_type: str = "gpt-neo") -> Tuple[np.ndarray, dict]:
    """
    Extract and flatten model weights for atlas packing.

    Args:
        state_dict: Model state dict (from torch or transformers)
        model_type: "gpt-neo", "llama", "gpt-j", etc.

    Returns:
        (flat_weights, layout_metadata)
        - flat_weights: 1D numpy array of all weights
        - layout_metadata: dict with sectors, vocab_size, hidden_dim, num_layers
    """
    # Initialize metadata
    metadata = {
        "model_type": model_type,
        "vocab_size": 0,
        "hidden_dim": 0,
        "num_layers": 0,
        "sectors": {},
        "total_params": 0
    }

    # Extract weights based on model type
    if model_type == "gpt-neo":
        flat_weights, metadata = _extract_gpt_neo_weights(state_dict, metadata)
    elif model_type == "gpt-j":
        flat_weights, metadata = _extract_gpt_j_weights(state_dict, metadata)
    elif model_type == "llama":
        flat_weights, metadata = _extract_llama_weights(state_dict, metadata)
    else:
        raise ValueError(f"Unsupported model type: {model_type}")

    logger.info(f"Extracted {len(flat_weights)} parameters from {model_type} model")
    return flat_weights, metadata


def _extract_gpt_neo_weights(state_dict: Dict[str, Any], metadata: dict) -> Tuple[np.ndarray, dict]:
    """Extract weights from GPT-Neo model state dict."""
    # Get model dimensions
    metadata["vocab_size"] = state_dict["transformer.wte.weight"].shape[0]
    metadata["hidden_dim"] = state_dict["transformer.wte.weight"].shape[1]
    # Count actual number of layers (not total keys)
    layer_keys = [k for k in state_dict.keys() if k.startswith("transformer.h.") and ".ln_1.weight" in k]
    metadata["num_layers"] = len(layer_keys)

    # Calculate total parameters
    total_params = 0
    sectors = {}

    # 1. Extract token embeddings
    wte_weight = state_dict["transformer.wte.weight"]
    embeddings_size = wte_weight.size
    sectors["embeddings"] = {"start": total_params, "end": total_params + embeddings_size}
    total_params += embeddings_size

    # 2. Extract each layer
    for i in range(metadata["num_layers"]):
        # Attention weights
        q_weight = state_dict[f"transformer.h.{i}.attn.attention.q_proj.weight"]
        k_weight = state_dict[f"transformer.h.{i}.attn.attention.k_proj.weight"]
        v_weight = state_dict[f"transformer.h.{i}.attn.attention.v_proj.weight"]
        o_weight = state_dict[f"transformer.h.{i}.attn.attention.out_proj.weight"]

        # Combine attention weights
        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        attention_size = len(attention_weights)
        sectors[f"layer_{i}_attention"] = {"start": total_params, "end": total_params + attention_size}
        total_params += attention_size

        # FFN weights
        gate_weight = state_dict[f"transformer.h.{i}.mlp.gate_proj.weight"]
        up_weight = state_dict[f"transformer.h.{i}.mlp.up_proj.weight"]
        down_weight = state_dict[f"transformer.h.{i}.mlp.down_proj.weight"]

        # Combine FFN weights
        ffn_weights = np.concatenate([
            gate_weight.flatten(),
            up_weight.flatten(),
            down_weight.flatten()
        ])

        ffn_size = len(ffn_weights)
        sectors[f"layer_{i}_ffn"] = {"start": total_params, "end": total_params + ffn_size}
        total_params += ffn_size

    # 3. Extract LM head (may share with embeddings)
    if "lm_head.weight" in state_dict:
        lm_head_weight = state_dict["lm_head.weight"]
        lm_head_size = lm_head_weight.size
        sectors["lm_head"] = {"start": total_params, "end": total_params + lm_head_size}
        total_params += lm_head_size

    metadata["sectors"] = sectors
    metadata["total_params"] = total_params

    # Create flattened weights array
    flat_weights = np.zeros(total_params, dtype=np.float32)

    # Fill in embeddings
    flat_weights[sectors["embeddings"]["start"]:sectors["embeddings"]["end"]] = wte_weight.flatten()

    # Fill in layer weights
    for i in range(metadata["num_layers"]):
        # Attention weights
        q_weight = state_dict[f"transformer.h.{i}.attn.attention.q_proj.weight"]
        k_weight = state_dict[f"transformer.h.{i}.attn.attention.k_proj.weight"]
        v_weight = state_dict[f"transformer.h.{i}.attn.attention.v_proj.weight"]
        o_weight = state_dict[f"transformer.h.{i}.attn.attention.out_proj.weight"]

        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_attention"]["start"]:sectors[f"layer_{i}_attention"]["end"]] = attention_weights

        # FFN weights
        gate_weight = state_dict[f"transformer.h.{i}.mlp.gate_proj.weight"]
        up_weight = state_dict[f"transformer.h.{i}.mlp.up_proj.weight"]
        down_weight = state_dict[f"transformer.h.{i}.mlp.down_proj.weight"]

        ffn_weights = np.concatenate([
            gate_weight.flatten(),
            up_weight.flatten(),
            down_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_ffn"]["start"]:sectors[f"layer_{i}_ffn"]["end"]] = ffn_weights

    # Fill in LM head
    if "lm_head.weight" in state_dict:
        flat_weights[sectors["lm_head"]["start"]:sectors["lm_head"]["end"]] = state_dict["lm_head.weight"].flatten()

    return flat_weights, metadata


def _extract_gpt_j_weights(state_dict: Dict[str, Any], metadata: dict) -> Tuple[np.ndarray, dict]:
    """Extract weights from GPT-J model state dict."""
    # Get model dimensions
    metadata["vocab_size"] = state_dict["transformer.wte.weight"].shape[0]
    metadata["hidden_dim"] = state_dict["transformer.wte.weight"].shape[1]
    # Count actual number of layers (not total keys)
    layer_keys = [k for k in state_dict.keys() if k.startswith("transformer.h.") and ".ln_1.weight" in k]
    metadata["num_layers"] = len(layer_keys)

    # Calculate total parameters
    total_params = 0
    sectors = {}

    # 1. Extract token embeddings
    wte_weight = state_dict["transformer.wte.weight"]
    embeddings_size = wte_weight.size
    sectors["embeddings"] = {"start": total_params, "end": total_params + embeddings_size}
    total_params += embeddings_size

    # 2. Extract each layer
    for i in range(metadata["num_layers"]):
        # Attention weights (GPT-J uses different naming)
        q_weight = state_dict[f"transformer.h.{i}.attn.q_proj.weight"]
        k_weight = state_dict[f"transformer.h.{i}.attn.k_proj.weight"]
        v_weight = state_dict[f"transformer.h.{i}.attn.v_proj.weight"]
        o_weight = state_dict[f"transformer.h.{i}.attn.out_proj.weight"]

        # Combine attention weights
        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        attention_size = len(attention_weights)
        sectors[f"layer_{i}_attention"] = {"start": total_params, "end": total_params + attention_size}
        total_params += attention_size

        # FFN weights (GPT-J uses mlp.c_* naming)
        c_fc_weight = state_dict[f"transformer.h.{i}.mlp.c_fc.weight"]
        c_proj_weight = state_dict[f"transformer.h.{i}.mlp.c_proj.weight"]

        # Combine FFN weights
        ffn_weights = np.concatenate([
            c_fc_weight.flatten(),
            c_proj_weight.flatten()
        ])

        ffn_size = len(ffn_weights)
        sectors[f"layer_{i}_ffn"] = {"start": total_params, "end": total_params + ffn_size}
        total_params += ffn_size

    metadata["sectors"] = sectors
    metadata["total_params"] = total_params

    # Create flattened weights array
    flat_weights = np.zeros(total_params, dtype=np.float32)

    # Fill in embeddings
    flat_weights[sectors["embeddings"]["start"]:sectors["embeddings"]["end"]] = wte_weight.flatten()

    # Fill in layer weights
    for i in range(metadata["num_layers"]):
        # Attention weights
        q_weight = state_dict[f"transformer.h.{i}.attn.q_proj.weight"]
        k_weight = state_dict[f"transformer.h.{i}.attn.k_proj.weight"]
        v_weight = state_dict[f"transformer.h.{i}.attn.v_proj.weight"]
        o_weight = state_dict[f"transformer.h.{i}.attn.out_proj.weight"]

        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_attention"]["start"]:sectors[f"layer_{i}_attention"]["end"]] = attention_weights

        # FFN weights
        c_fc_weight = state_dict[f"transformer.h.{i}.mlp.c_fc.weight"]
        c_proj_weight = state_dict[f"transformer.h.{i}.mlp.c_proj.weight"]

        ffn_weights = np.concatenate([
            c_fc_weight.flatten(),
            c_proj_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_ffn"]["start"]:sectors[f"layer_{i}_ffn"]["end"]] = ffn_weights

    return flat_weights, metadata


def _extract_llama_weights(state_dict: Dict[str, Any], metadata: dict) -> Tuple[np.ndarray, dict]:
    """Extract weights from LLaMA model state dict."""
    # Get model dimensions (LLaMA uses different key names)
    metadata["vocab_size"] = state_dict["model.embed_tokens.weight"].shape[0]
    metadata["hidden_dim"] = state_dict["model.embed_tokens.weight"].shape[1]
    # Count actual number of layers
    layer_keys = [k for k in state_dict.keys() if k.startswith("model.layers.") and ".input_layernorm.weight" in k]
    metadata["num_layers"] = len(layer_keys)

    # Calculate total parameters
    total_params = 0
    sectors = {}

    # 1. Extract token embeddings
    wte_weight = state_dict["model.embed_tokens.weight"]
    embeddings_size = wte_weight.size
    sectors["embeddings"] = {"start": total_params, "end": total_params + embeddings_size}
    total_params += embeddings_size

    # 2. Extract each layer
    for i in range(metadata["num_layers"]):
        # Attention weights
        q_weight = state_dict[f"model.layers.{i}.self_attn.q_proj.weight"]
        k_weight = state_dict[f"model.layers.{i}.self_attn.k_proj.weight"]
        v_weight = state_dict[f"model.layers.{i}.self_attn.v_proj.weight"]
        o_weight = state_dict[f"model.layers.{i}.self_attn.o_proj.weight"]

        # Combine attention weights
        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        attention_size = len(attention_weights)
        sectors[f"layer_{i}_attention"] = {"start": total_params, "end": total_params + attention_size}
        total_params += attention_size

        # FFN weights
        gate_weight = state_dict[f"model.layers.{i}.mlp.gate_proj.weight"]
        up_weight = state_dict[f"model.layers.{i}.mlp.up_proj.weight"]
        down_weight = state_dict[f"model.layers.{i}.mlp.down_proj.weight"]

        # Combine FFN weights
        ffn_weights = np.concatenate([
            gate_weight.flatten(),
            up_weight.flatten(),
            down_weight.flatten()
        ])

        ffn_size = len(ffn_weights)
        sectors[f"layer_{i}_ffn"] = {"start": total_params, "end": total_params + ffn_size}
        total_params += ffn_size

    # 3. Extract LM head
    if "lm_head.weight" in state_dict:
        lm_head_weight = state_dict["lm_head.weight"]
        lm_head_size = lm_head_weight.size
        sectors["lm_head"] = {"start": total_params, "end": total_params + lm_head_size}
        total_params += lm_head_size

    metadata["sectors"] = sectors
    metadata["total_params"] = total_params

    # Create flattened weights array
    flat_weights = np.zeros(total_params, dtype=np.float32)

    # Fill in embeddings
    flat_weights[sectors["embeddings"]["start"]:sectors["embeddings"]["end"]] = wte_weight.flatten()

    # Fill in layer weights
    for i in range(metadata["num_layers"]):
        # Attention weights
        q_weight = state_dict[f"model.layers.{i}.self_attn.q_proj.weight"]
        k_weight = state_dict[f"model.layers.{i}.self_attn.k_proj.weight"]
        v_weight = state_dict[f"model.layers.{i}.self_attn.v_proj.weight"]
        o_weight = state_dict[f"model.layers.{i}.self_attn.o_proj.weight"]

        attention_weights = np.concatenate([
            q_weight.flatten(),
            k_weight.flatten(),
            v_weight.flatten(),
            o_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_attention"]["start"]:sectors[f"layer_{i}_attention"]["end"]] = attention_weights

        # FFN weights
        gate_weight = state_dict[f"model.layers.{i}.mlp.gate_proj.weight"]
        up_weight = state_dict[f"model.layers.{i}.mlp.up_proj.weight"]
        down_weight = state_dict[f"model.layers.{i}.mlp.down_proj.weight"]

        ffn_weights = np.concatenate([
            gate_weight.flatten(),
            up_weight.flatten(),
            down_weight.flatten()
        ])

        flat_weights[sectors[f"layer_{i}_ffn"]["start"]:sectors[f"layer_{i}_ffn"]["end"]] = ffn_weights

    # Fill in LM head
    if "lm_head.weight" in state_dict:
        flat_weights[sectors["lm_head"]["start"]:sectors["lm_head"]["end"]] = state_dict["lm_head.weight"].flatten()

    return flat_weights, metadata