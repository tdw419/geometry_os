"""
Kernel Rewriter for Self-Rewriting Kernel

Uses LM Studio to generate optimized Rust code for performance hot spots
detected by the PerformanceMonitor.
"""

from dataclasses import dataclass
from typing import Optional
import re
import requests

from systems.sisyphus.performance_monitor import HotSpot


@dataclass
class RewriteProposal:
    """Represents a proposed kernel rewrite optimization."""
    original_function: str
    optimized_code: str
    source_file: Optional[str]
    source_line: Optional[int]
    expected_speedup: float
    confidence: float  # 0.0 to 1.0


class KernelRewriter:
    """
    Generates optimized kernel code using LM Studio.

    This module creates LLM prompts for optimization and parses
    the generated code. The actual API integration is handled
    separately in Task 4.
    """

    def __init__(self, lm_studio_url: str = "http://localhost:1234"):
        """
        Initialize the rewriter.

        Args:
            lm_studio_url: URL of the LM Studio server (default: localhost:1234)
        """
        self.lm_studio_url = lm_studio_url

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
improves performance. Consider:
- Algorithmic improvements
- Memory access patterns
- Cache-friendly code
- SIMD where applicable

Return only the optimized Rust code in a markdown code block."""

        return prompt

    def extract_code_block(self, text: str, language: str = "rust") -> str:
        """
        Extract code from an LLM response with markdown code blocks.

        Args:
            text: The LLM response text
            language: The language of the code block to extract

        Returns:
            The extracted code, or empty string if not found
        """
        # Pattern to match code blocks with optional language specifier
        # Handles ```rust, ```Rust, ```RUST, etc.
        pattern = rf'```{language}\s*\n(.*?)```'
        match = re.search(pattern, text, re.IGNORECASE | re.DOTALL)

        if match:
            return match.group(1).strip()

        # Fallback: try to find any code block without language specifier
        pattern_generic = r'```\s*\n(.*?)```'
        match_generic = re.search(pattern_generic, text, re.DOTALL)

        if match_generic:
            return match_generic.group(1).strip()

        # If no code blocks found, return the text as-is (stripped)
        return text.strip()

    def validate_syntax(self, code: str, language: str = "rust") -> bool:
        """
        Perform basic syntax validation on code.

        This is NOT a full parser - it does simple heuristic checks
        to catch obviously malformed code.

        Args:
            code: The code to validate
            language: The language of the code

        Returns:
            True if code passes basic validation, False otherwise
        """
        if not code or not code.strip():
            return False

        code = code.strip()

        if language.lower() == "rust":
            # Check for balanced braces
            brace_count = code.count('{') - code.count('}')
            paren_count = code.count('(') - code.count(')')
            bracket_count = code.count('[') - code.count(']')

            if brace_count != 0 or paren_count != 0 or bracket_count != 0:
                return False

            # Check for at least one function definition
            if not re.search(r'\bfn\s+\w+', code):
                return False

            # Check for basic Rust keywords/patterns
            # Should have some form of function body
            if '{' in code and '}' in code:
                return True

            return False

        # Default: just check it's not empty
        return len(code) > 0

    def create_proposal(
        self,
        hot_spot: HotSpot,
        optimized_code: str,
        confidence: float
    ) -> RewriteProposal:
        """
        Create a rewrite proposal for a hot spot.

        Args:
            hot_spot: The original hot spot
            optimized_code: The LLM-generated optimized code
            confidence: Confidence score (0.0 to 1.0)

        Returns:
            A RewriteProposal object
        """
        # Calculate expected speedup based on confidence and hotspot score
        # Higher confidence and higher hotspot score = higher expected speedup
        base_speedup = 1.5  # Assume at least 1.5x improvement
        hotspot_factor = min(hot_spot.hotspot_score / 1000.0, 2.0)  # Cap at 2x
        expected_speedup = base_speedup * confidence * (1 + hotspot_factor)

        return RewriteProposal(
            original_function=hot_spot.function_name,
            optimized_code=optimized_code,
            source_file=hot_spot.source_file,
            source_line=hot_spot.source_line,
            expected_speedup=expected_speedup,
            confidence=confidence
        )

    def generate_optimized_code(
        self,
        hot_spot: HotSpot,
        model: str = "local-model",
        max_tokens: int = 1000
    ) -> str:
        """
        Generate optimized code using LM Studio.

        Args:
            hot_spot: The performance hot spot to optimize
            model: Model name (ignored for LM Studio)
            max_tokens: Maximum tokens to generate

        Returns:
            Extracted code block from LLM response, or "" on failure
        """
        prompt = self.generate_optimization_prompt(hot_spot)

        try:
            response = requests.post(
                f"{self.lm_studio_url}/v1/completions",
                json={
                    "prompt": prompt,
                    "max_tokens": max_tokens,
                    "temperature": 0.3,  # Low temperature for code
                    "stop": ["```"]  # Stop at code block end
                },
                timeout=30
            )

            if response.status_code == 200:
                data = response.json()
                text = data.get("choices", [{}])[0].get("text", "")
                return self.extract_code_block(text, language="rust")

        except requests.RequestException:
            pass  # Silently fail - return empty string

        return ""
