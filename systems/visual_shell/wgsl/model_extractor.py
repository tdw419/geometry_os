#!/usr/bin/env python3

"""
Model Weight Extractor for Geometry OS

Extracts and flattens model weights for atlas packing in the Hilbert space.
Supports multiple model architectures with proper weight layout metadata.
"""

import logging
from typing import Any

import numpy as np
import torch

logger = logging.getLogger(__name__)

def extract_model_weights(state_dict: dict[str, Any], model_type: str = "gpt-neo") -> tuple[np.ndarray, dict]:
    """
    Extract and flatten weights from a state_dict.
    
    Args:
        state_dict: Pytorch state dictionary
        model_type: Architecture type ("gpt-neo", "llama", "tiny-stories")
        
    Returns:
        (flattened_weights, metadata)
    """
    metadata = {
        "model_type": model_type,
        "num_layers": 0,
        "hidden_dim": 0,
        "vocab_size": 0,
        "sectors": {}
    }

    # Discover architecture
    if model_type == "gpt-neo":
        metadata["num_layers"] = len(set([k.split(".")[2] for k in state_dict if "transformer.h." in k]))
        metadata["hidden_dim"] = state_dict["transformer.wte.weight"].shape[1]
        metadata["vocab_size"] = state_dict["transformer.wte.weight"].shape[0]
        return _extract_gpt_neo_weights(state_dict, metadata)
    else:
        # Default/Fallback
        flat_weights = np.concatenate([v.detach().cpu().numpy().flatten() for v in state_dict.values()])
        return flat_weights, metadata

def _extract_gpt_neo_weights(state_dict: dict[str, Any], metadata: dict) -> tuple[np.ndarray, dict]:
    """Extract all GPT-Neo weights including PE, Biases, and LayerNorm."""
    total_params = 0
    sectors = {}

    def add_sector(name, tensor):
        nonlocal total_params
        size = tensor.numel()
        start = total_params
        end = total_params + size
        sectors[name] = {"start": start, "end": end, "shape": list(tensor.shape)}
        total_params += size
        return tensor.detach().cpu().numpy().flatten().astype(np.float32)

    # 1. Token Embeddings (WTE)
    wte = state_dict["transformer.wte.weight"]
    wte_flat = add_sector("embeddings", wte)

    # 2. Position Embeddings (WPE)
    wpe = state_dict["transformer.wpe.weight"]
    wpe_flat = add_sector("pos_embeddings", wpe)

    # 3. Layers
    layer_flats = []
    for i in range(metadata["num_layers"]):
        # LayerNorm 1
        layer_flats.append(add_sector(f"layer_{i}_ln1_w", state_dict[f"transformer.h.{i}.ln_1.weight"]))
        layer_flats.append(add_sector(f"layer_{i}_ln1_b", state_dict[f"transformer.h.{i}.ln_1.bias"]))

        # Attention
        for proj in ["q_proj", "k_proj", "v_proj", "out_proj"]:
            w_key = f"transformer.h.{i}.attn.attention.{proj}.weight"
            b_key = f"transformer.h.{i}.attn.attention.{proj}.bias"
            layer_flats.append(add_sector(f"layer_{i}_attn_{proj}_w", state_dict[w_key]))
            if b_key in state_dict:
                layer_flats.append(add_sector(f"layer_{i}_attn_{proj}_b", state_dict[b_key]))
            else:
                # Add zero bias if missing
                layer_flats.append(add_sector(f"layer_{i}_attn_{proj}_b", torch.zeros(state_dict[w_key].shape[0])))

        # LayerNorm 2
        layer_flats.append(add_sector(f"layer_{i}_ln2_w", state_dict[f"transformer.h.{i}.ln_2.weight"]))
        layer_flats.append(add_sector(f"layer_{i}_ln2_b", state_dict[f"transformer.h.{i}.ln_2.bias"]))

        # MLP
        for proj in ["c_fc", "c_proj"]:
            layer_flats.append(add_sector(f"layer_{i}_mlp_{proj}_w", state_dict[f"transformer.h.{i}.mlp.{proj}.weight"]))
            layer_flats.append(add_sector(f"layer_{i}_mlp_{proj}_b", state_dict[f"transformer.h.{i}.mlp.{proj}.bias"]))

    # 4. Final LayerNorm
    ln_f_w = state_dict["transformer.ln_f.weight"]
    ln_f_b = state_dict["transformer.ln_f.bias"]
    ln_f_flat = np.concatenate([add_sector("ln_f_w", ln_f_w), add_sector("ln_f_b", ln_f_b)])

    # 5. LM Head
    if "lm_head.weight" in state_dict:
        lm_head = state_dict["lm_head.weight"]
        lm_flat = add_sector("lm_head", lm_head)
    else:
        # Tied weights
        lm_flat = wte_flat
        sectors["lm_head"] = sectors["embeddings"]

    # Combine all
    flat_weights = np.concatenate([wte_flat, wpe_flat] + layer_flats + [ln_f_flat, lm_flat])

    metadata["sectors"] = sectors
    metadata["total_params"] = len(flat_weights)
    return flat_weights, metadata
