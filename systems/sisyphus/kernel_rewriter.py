"""
Kernel Rewriter for Self-Rewriting Kernel

Uses the native PixelBrain Universal Cognitive Service to generate optimized 
Rust code for performance hot spots detected by the PerformanceMonitor.
"""

import asyncio
import re
from dataclasses import dataclass
from typing import Any, Dict, Optional

from systems.sisyphus.performance_monitor import HotSpot

# PixelBrain service import (optional - resilient to missing module)
try:
    from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
    PIXEL_BRAIN_AVAILABLE = True
except ImportError:
    PIXEL_BRAIN_AVAILABLE = False
    
    # Stub service for when PixelBrain is not available
    class _StubPixelBrainService:
        """Fallback service when PixelBrain module is not installed."""
        def is_available(self) -> bool:
            return False
        async def generate(self, prompt: str, **kwargs) -> Dict[str, Any]:
            return {"text": "", "tokens": [], "error": "PixelBrain not available"}
    
    def get_pixel_brain_service() -> _StubPixelBrainService:
        return _StubPixelBrainService()


@dataclass
class RewriteProposal:
    """Represents a proposed kernel rewrite optimization."""
    original_function: str
    optimized_code: str
    source_file: str | None
    source_line: int | None
    expected_speedup: float
    confidence: float  # 0.0 to 1.0


class KernelRewriter:
    """
    Generates optimized kernel code using the native PixelBrain service.

    This module creates LLM prompts for optimization and parses
    the generated code using Geometry OS's internal cognitive core.
    """

    def __init__(self):
        """
        Initialize the rewriter.
        """
        self.service = get_pixel_brain_service()

    def generate_optimization_prompt(self, hot_spot: HotSpot) -> str:
        """
        Generate an LLM prompt for optimizing a hot spot.

        Args:
            hot_spot: The performance hot spot to optimize

        Returns:
            A prompt string for the LLM
        """
        prompt = f"""Optimize this Rust function for better performance.

Function: {hot_spot.function_name}
Source: {hot_spot.source_file or 'unknown'}:{hot_spot.source_line or '?'}

Performance metrics:
- Call count: {hot_spot.call_count}
- Total time: {hot_spot.total_time_ms:.2f}ms
- Average time per call: {hot_spot.avg_time_ms:.4f}ms

This function is a hot spot and needs optimization. Please provide an
optimized version in Rust that maintains the same functionality but
improves performance. Consider SIMD and memory locality.

Return only the optimized Rust code in a markdown code block."""

        return prompt

    def extract_code_block(self, text: str, language: str = "rust") -> str:
        """
        Extract code from an LLM response with markdown code blocks.
        """
        pattern = rf'```{language}\s*\n(.*?)```'
        match = re.search(pattern, text, re.IGNORECASE | re.DOTALL)

        if match:
            return match.group(1).strip()

        pattern_generic = r'```\s*\n(.*?)```'
        match_generic = re.search(pattern_generic, text, re.DOTALL)

        if match_generic:
            return match_generic.group(1).strip()

        return text.strip()

    def validate_syntax(self, code: str, language: str = "rust") -> bool:
        """
        Perform basic syntax validation on code.
        """
        if not code or not code.strip():
            return False

        if language.lower() == "rust":
            # Heuristic checks
            if code.count('{') != code.count('}') or code.count('(') != code.count(')'):
                return False
            if not re.search(r'\bfn\s+\w+', code):
                return False
            return True

        return len(code) > 0

    def create_proposal(
        self,
        hot_spot: HotSpot,
        optimized_code: str,
        confidence: float
    ) -> RewriteProposal:
        """
        Create a rewrite proposal for a hot spot.
        """
        base_speedup = 1.5
        hotspot_factor = min(hot_spot.hotspot_score / 1000.0, 2.0)
        expected_speedup = base_speedup * confidence * (1 + hotspot_factor)

        return RewriteProposal(
            original_function=hot_spot.function_name,
            optimized_code=optimized_code,
            source_file=hot_spot.source_file,
            source_line=hot_spot.source_line,
            expected_speedup=expected_speedup,
            confidence=confidence
        )

    async def generate_optimized_code_async(
        self,
        hot_spot: HotSpot,
        max_tokens: int = 1000
    ) -> str:
        """
        Generate optimized code using the native PixelBrain service.

        Returns:
            Extracted code block from LLM response, or "" on failure
        """
        if not self.service.is_available():
            return ""

        prompt = self.generate_optimization_prompt(hot_spot)

        # Dispatch to native WGPU inference
        result = await self.service.generate(prompt, max_tokens=max_tokens)
        text = result.get("text", "")

        return self.extract_code_block(text, language="rust")

    def generate_optimized_code(self, hot_spot: HotSpot, **kwargs) -> str:
        """Synchronous wrapper for async generation (for legacy compat)."""
        try:
            loop = asyncio.get_event_loop()
            return loop.run_until_complete(self.generate_optimized_code_async(hot_spot))
        except RuntimeError:
            # Fallback if no loop running
            return asyncio.run(self.generate_optimized_code_async(hot_spot))
