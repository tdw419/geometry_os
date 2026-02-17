"""
Contains Operation - Filter elements by text content.

Supports exact, fuzzy, and regex matching.
"""

import re
from typing import Any, Dict, List, Literal

from PIL import Image

from systems.vision.operations.base import BaseOperation


MatchMode = Literal["exact", "fuzzy", "regex"]


class ContainsOperation(BaseOperation):
    """Filter elements containing text."""

    @property
    def name(self) -> str:
        return "contains"

    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> List[Dict[str, Any]]:
        """
        Filter elements by text content.

        Args:
            image: PIL Image to process
            context: Execution context with previous results
            params: Dict with:
                - source: List of elements to filter
                - text: Text to match
                - match: exact/fuzzy/regex (default: exact)

        Returns:
            List of elements matching the text
        """
        source = params.get("source", [])
        text = params.get("text", "")
        match_mode = params.get("match", "exact")

        if not source:
            return []

        results = []
        for element in source:
            element_text = self._get_text(element)
            if element_text and self._matches(element_text, text, match_mode):
                results.append(element)

        return results

    def _get_text(self, element: Any) -> str:
        """Extract text from element."""
        if isinstance(element, dict):
            return element.get("text", "")
        elif hasattr(element, "text"):
            return element.text
        return ""

    def _matches(self, element_text: str, search_text: str, mode: MatchMode) -> bool:
        """Check if element text matches search text."""
        if mode == "exact":
            return search_text.lower() in element_text.lower()
        elif mode == "fuzzy":
            # Simple fuzzy match - check if all words are present
            search_words = search_text.lower().split()
            element_lower = element_text.lower()
            return all(word in element_lower for word in search_words)
        elif mode == "regex":
            try:
                pattern = re.compile(search_text, re.IGNORECASE)
                return bool(pattern.search(element_text))
            except re.error:
                return False
        return False

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """Validate contains parameters."""
        errors = []
        if "source" not in params:
            errors.append("'source' parameter is required")
        if "text" not in params:
            errors.append("'text' parameter is required")
        if "match" in params:
            valid = ["exact", "fuzzy", "regex"]
            if params["match"] not in valid:
                errors.append(f"'match' must be one of: {valid}")
        return errors
