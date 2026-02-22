"""Spatial attention pooling for adaptive feature aggregation

This module implements spatial attention pooling using multi-head self-attention,
allowing spatial locations to attend to each other for context-aware feature
representations.
"""
import torch
import torch.nn as nn
from typing import Optional


class SpatialAttentionPool(nn.Module):
    """Spatial attention pooling for adaptive feature aggregation

    Uses multi-head self-attention to allow spatial locations to attend
    to each other, producing context-aware feature representations.

    Args:
        embed_dim: Dimension of input features (must be divisible by num_heads)
        num_heads: Number of attention heads (default: 8)
        dropout: Dropout probability (default: 0.1)

    Attributes:
        embed_dim: The embedding dimension
        num_heads: Number of attention heads
        mha: Multi-head attention module
        norm: Layer normalization
        dropout: Dropout layer

    Example:
        >>> pool = SpatialAttentionPool(embed_dim=768, num_heads=8)
        >>> features = torch.randn(2, 257, 768)  # batch, patches, dim
        >>> pooled = pool(features)
        >>> assert pooled.shape == features.shape
    """

    def __init__(
        self,
        embed_dim: int,
        num_heads: int = 8,
        dropout: float = 0.1,
    ):
        super().__init__()

        if embed_dim % num_heads != 0:
            raise ValueError(
                f"embed_dim ({embed_dim}) must be divisible by num_heads ({num_heads})"
            )

        self.embed_dim = embed_dim
        self.num_heads = num_heads

        # Multi-head attention (self-attention)
        self.mha = nn.MultiheadAttention(
            embed_dim=embed_dim,
            num_heads=num_heads,
            dropout=dropout,
            batch_first=True,  # Input format: [batch, seq, features]
        )

        # Layer norm
        self.norm = nn.LayerNorm(embed_dim)

        # Dropout
        self.dropout = nn.Dropout(dropout)

    def forward(
        self,
        features: torch.Tensor,
        attn_mask: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """
        Apply spatial attention pooling

        Args:
            features: Input features [batch, num_patches, embed_dim]
            attn_mask: Optional attention mask [num_patches, num_patches] or
                       [batch * num_heads, num_patches, num_patches]
                       Use float('-inf') to mask out positions

        Returns:
            Pooled features [batch, num_patches, embed_dim] with same shape as input
        """
        batch_size, num_patches, embed_dim = features.shape

        # Self-attention with residual connection
        attn_output, _ = self.mha(
            features,
            features,
            features,
            attn_mask=attn_mask,
            need_weights=False,
        )

        # Residual connection + norm
        features = self.norm(features + self.dropout(attn_output))

        return features
