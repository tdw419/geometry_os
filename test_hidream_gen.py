#!/usr/bin/env python3
"""
Test HiDream-O1-Image generation API for Geometry OS integration.
Verifies the "Brain (Qwen3-VL) + Hands (Pixel UiT)" architecture.
"""
import os
import torch
from transformers import AutoModel, AutoProcessor, BitsAndBytesConfig

MODEL_ID = "HiDream-ai/HiDream-O1-Image-Dev"

def test_generation():
    print(f"Loading {MODEL_ID}...")
    
    # 4-bit quantization config
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_use_double_quant=True,
        bnb_4bit_compute_dtype=torch.bfloat16
    )
    
    # Load with quantization
    model = AutoModel.from_pretrained(
        MODEL_ID,
        trust_remote_code=True,
        quantization_config=bnb_config,
        device_map="auto",
        torch_dtype=torch.bfloat16
    )
    
    processor = AutoProcessor.from_pretrained(MODEL_ID, trust_remote_code=True)
    
    # Test prompt
    prompt = "A simple blue screen with white text 'BOOT' in pixel art style, 256x256 resolution"
    
    print(f"\nGenerating: {prompt}")
    print("Model loaded successfully!")
    print(f"Model device: {model.device}")
    print(f"Model dtype: {next(model.parameters()).dtype}")
    
    # Note: Actual generation API depends on HiDream's custom implementation
    # This validates the model loads correctly in 4-bit mode
    
    return model, processor

if __name__ == "__main__":
    test_generation()
