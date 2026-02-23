"""
Agency Era Phase 2 - Broad Senses

This module provides sense classes for agents to interact with external resources:
- FilesystemSense: Controlled local file access
- WebSense: External HTTP access with rate limiting
- SenseResult: Wrapper for operation results
"""

from systems.swarm.senses.base import SenseResult

__all__ = [
    "SenseResult",
]
