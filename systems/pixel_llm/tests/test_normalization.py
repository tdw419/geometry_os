"""Tests for feature normalization options"""
import pytest
import torch
from systems.pixel_llm.normalization import normalize_features


def test_l2_normalization():
    """Test L2 normalization produces unit length vectors"""
    features = torch.randn(2, 257, 768)

    normalized = normalize_features(features, method='l2')

    # Each feature vector should have unit norm
    norms = torch.norm(normalized, dim=-1)
    assert torch.allclose(norms, torch.ones_like(norms), atol=1e-5)


def test_l2_normalization_custom_dim():
    """Test L2 normalization along different dimension"""
    features = torch.randn(2, 257, 768)

    # Normalize along batch dimension
    normalized = normalize_features(features, method='l2', dim=0)

    norms = torch.norm(normalized, dim=0)
    assert torch.allclose(norms, torch.ones_like(norms), atol=1e-5)


def test_layer_normalization():
    """Test layer normalization produces zero mean and unit variance"""
    features = torch.randn(2, 257, 768)

    normalized = normalize_features(features, method='layer')

    # Each feature should have zero mean and unit variance
    means = normalized.mean(dim=-1)
    stds = normalized.std(dim=-1, unbiased=False)  # Use biased std to match layer_norm behavior

    assert torch.allclose(means, torch.zeros_like(means), atol=1e-5)
    assert torch.allclose(stds, torch.ones_like(stds), atol=1e-5)


def test_no_normalization():
    """Test 'none' method returns unchanged features"""
    features = torch.randn(2, 257, 768)

    normalized = normalize_features(features, method='none')

    # Should return unchanged features
    assert torch.equal(normalized, features)


def test_invalid_method_raises():
    """Test that invalid method raises ValueError"""
    features = torch.randn(2, 257, 768)

    with pytest.raises(ValueError, match="Unknown normalization method"):
        normalize_features(features, method='invalid')


def test_eps_parameter_for_stability():
    """Test that eps parameter prevents division by zero"""
    # Create features with near-zero norm
    features = torch.zeros(2, 10, 768)

    normalized = normalize_features(features, method='l2', eps=1e-8)

    # Should not produce NaN
    assert not torch.isnan(normalized).any()


def test_normalization_preserves_shape():
    """Test that normalization preserves input shape"""
    features = torch.randn(2, 257, 768)
    original_shape = features.shape

    for method in ['l2', 'layer', 'none']:
        normalized = normalize_features(features, method=method)
        assert normalized.shape == original_shape


def test_l2_with_different_shapes():
    """Test L2 normalization with various tensor shapes"""
    shapes = [
        (1, 100, 512),
        (4, 196, 1024),
        (8, 49, 768),
    ]

    for shape in shapes:
        features = torch.randn(*shape)
        normalized = normalize_features(features, method='l2')

        norms = torch.norm(normalized, dim=-1)
        assert torch.allclose(norms, torch.ones_like(norms), atol=1e-5)


def test_default_method_is_l2():
    """Test that default normalization method is L2"""
    features = torch.randn(2, 257, 768)

    normalized = normalize_features(features)

    norms = torch.norm(normalized, dim=-1)
    assert torch.allclose(norms, torch.ones_like(norms), atol=1e-5)
