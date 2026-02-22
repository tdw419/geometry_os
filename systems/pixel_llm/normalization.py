"""Feature normalization options for vision encoders.

This module provides various normalization methods for feature tensors,
including L2 normalization (unit vectors), layer normalization (zero mean,
unit variance), and a passthrough mode.
"""
import torch
import torch.nn as nn
from typing import Literal


def normalize_features(
    features: torch.Tensor,
    method: Literal['l2', 'layer', 'none'] = 'l2',
    dim: int = -1,
    eps: float = 1e-8,
) -> torch.Tensor:
    """Normalize features using specified method.

    Args:
        features: Input features [batch, seq_len, embed_dim]
        method: Normalization method
            - 'l2': L2 normalization (unit length vectors)
            - 'layer': Layer normalization (zero mean, unit variance)
            - 'none': No normalization
        dim: Dimension to normalize over (for L2)
        eps: Small value for numerical stability

    Returns:
        Normalized features with same shape as input

    Example:
        >>> features = torch.randn(2, 257, 768)
        >>> normalized = normalize_features(features, method='l2')
        >>> norms = torch.norm(normalized, dim=-1)
        >>> assert torch.allclose(norms, torch.ones_like(norms))
    """
    if method == 'none':
        return features

    if method == 'l2':
        # L2 normalization along specified dimension
        norms = torch.norm(features, dim=dim, keepdim=True)
        return features / (norms + eps)

    if method == 'layer':
        # Layer normalization over feature dimension
        return nn.functional.layer_norm(
            features,
            normalized_shape=(features.shape[-1],),
            eps=eps,
        )

    raise ValueError(f"Unknown normalization method: {method}. "
                     f"Valid options are: 'l2', 'layer', 'none'")
