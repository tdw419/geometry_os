"""Tests for SpatialAttentionPool module"""
import pytest
import torch
from systems.pixel_llm.attention import SpatialAttentionPool


def test_spatial_attention_pooling():
    """Test basic spatial attention pooling preserves shape and modifies features"""
    # Input: [batch, num_patches, embed_dim]
    features = torch.randn(2, 257, 768)

    pool = SpatialAttentionPool(embed_dim=768, num_heads=8)
    output = pool(features)

    # Output should preserve spatial dimension
    assert output.shape == features.shape

    # Output should be different (attention applied)
    assert not torch.allclose(output, features)


def test_spatial_attention_different_dims():
    """Test spatial attention with different dimensions"""
    features = torch.randn(1, 196, 1024)  # Different batch, patches, dim

    pool = SpatialAttentionPool(embed_dim=1024, num_heads=16)
    output = pool(features)

    assert output.shape == (1, 196, 1024)


def test_spatial_attention_with_mask():
    """Test spatial attention with attention mask"""
    features = torch.randn(1, 100, 512)

    # Create mask (block certain positions)
    # MultiheadAttention expects 2D mask (seq_len, seq_len) for batch_first=True
    attn_mask = torch.zeros(100, 100)
    attn_mask[:, 50:] = float('-inf')  # Mask out second half

    pool = SpatialAttentionPool(embed_dim=512, num_heads=8)
    output = pool(features, attn_mask=attn_mask)

    assert output.shape == features.shape


def test_spatial_attention_num_heads_validation():
    """Test that embed_dim is divisible by num_heads"""
    with pytest.raises(ValueError):
        # 768 is not divisible by 5
        SpatialAttentionPool(embed_dim=768, num_heads=5)


def test_spatial_attention_residual_connection():
    """Test that residual connection is properly applied"""
    features = torch.randn(1, 50, 256)
    pool = SpatialAttentionPool(embed_dim=256, num_heads=4)

    # Set dropout to 0 for deterministic output
    pool.dropout.p = 0.0

    output = pool(features)

    # With residual connection, output should not be too far from input
    # (attention modifies but doesn't completely replace)
    diff = (output - features).abs().mean()
    assert diff > 0  # Some change occurred
    assert diff < 10  # But not a complete replacement


def test_spatial_attention_batch_processing():
    """Test that batch dimension is handled correctly"""
    features = torch.randn(4, 257, 768)

    pool = SpatialAttentionPool(embed_dim=768, num_heads=8)
    pool.dropout.p = 0.0
    output = pool(features)

    # Each batch element should be processed independently
    assert output.shape == (4, 257, 768)

    # First batch element should differ from second
    assert not torch.allclose(output[0], output[1])


def test_spatial_attention_dropout_rate():
    """Test dropout configuration"""
    pool = SpatialAttentionPool(embed_dim=512, num_heads=8, dropout=0.3)
    assert pool.dropout.p == 0.3


def test_spatial_attention_eval_mode():
    """Test that dropout is disabled in eval mode"""
    features = torch.randn(2, 100, 512)
    pool = SpatialAttentionPool(embed_dim=512, num_heads=8, dropout=0.5)

    pool.eval()
    output1 = pool(features)
    output2 = pool(features)

    # In eval mode, outputs should be deterministic
    assert torch.allclose(output1, output2)


def test_spatial_attention_properties():
    """Test module properties"""
    pool = SpatialAttentionPool(embed_dim=768, num_heads=8)

    assert pool.embed_dim == 768
    assert pool.num_heads == 8
    assert hasattr(pool, 'mha')
    assert hasattr(pool, 'norm')
    assert hasattr(pool, 'dropout')


def test_spatial_attention_single_patch():
    """Test with single spatial location"""
    features = torch.randn(1, 1, 512)

    pool = SpatialAttentionPool(embed_dim=512, num_heads=8)
    output = pool(features)

    assert output.shape == (1, 1, 512)
