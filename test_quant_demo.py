#!/usr/bin/env python3

import numpy as np
import sys
import os

# Add the quant_converter module to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'systems', 'visual_shell', 'wgsl', 'quantization'))

from quant_converter import quantize_q4, quantize_model_q4, debug_quantize_q4

def demo_quantization():
    print("=== Q4_0 Quantization Demo ===\n")

    # Test case 1: Simple block
    print("1. Testing single block quantization:")
    weights = np.array([1.0, -1.0, 0.5, -0.5, 2.0, -2.0, 0.25, -0.25,
                       1.5, -1.5, 0.75, -0.75, 3.0, -3.0, 0.125, -0.125,
                       0.8, -0.8, 0.4, -0.4, 1.2, -1.2, 0.6, -0.6,
                       2.5, -2.5, 1.25, -1.25, 0.3, -0.3, 0.15, -0.15],
                      dtype=np.float32)

    quantized = quantize_q4(weights)
    print(f"   Original weights shape: {weights.shape}")
    print(f"   Quantized size: {len(quantized)} bytes")
    print(f"   Scale bytes: {quantized[:2].hex()}")
    print(f"   Weight bytes: {quantized[2:].hex()}")

    # Debug info for the first 4 weights
    debug_info = debug_quantize_q4(weights)
    print(f"   Max abs value: {debug_info['max_abs']:.4f}")
    print(f"   Scale: {debug_info['scale']:.4f}")
    print(f"   Original[0:4]: {debug_info['original_weights'][0:4]}")
    print(f"   Quantized[0:4]: {debug_info['quantized_weights'][0:4]}")
    print()

    # Test case 2: Full model
    print("2. Testing full model quantization:")
    np.random.seed(42)
    model_weights = np.random.randn(100).astype(np.float32)  # 4 blocks

    quantized_model, metadata = quantize_model_q4(model_weights)

    print(f"   Original model size: {len(model_weights) * 4} bytes")
    print(f"   Quantized size: {len(quantized_model)} bytes")
    print(f"   Compression ratio: {(len(model_weights) * 4) / len(quantized_model):.2f}x")
    print(f"   Metadata: {metadata}")

    # Calculate compression
    original_size = len(model_weights) * 4  # 4 bytes per float32
    compressed_size = len(quantized_model)
    compression_ratio = original_size / compressed_size
    print(f"\n   Summary:")
    print(f"   - Original size: {original_size} bytes")
    print(f"   - Compressed size: {compressed_size} bytes")
    print(f"   - Compression ratio: {compression_ratio:.2f}x")
    print(f"   - Space saved: {(1 - compressed_size/original_size)*100:.1f}%")

    print("\n=== Demo Complete ===")

if __name__ == "__main__":
    demo_quantization()