"""Truth Extractor for WordPress Truth Daemon.

This module extracts factual claims from WordPress content using LM Studio.
It uses the CTRM evidence classification system (E1/E2/E3) and provides
confidence scores for each extracted claim.

Usage:
    from wordpress_zone.truth_extractor import TruthExtractor, ExtractedClaim

    extractor = TruthExtractor()
    claims = await extractor.extract_claims(content, source_title)
"""

import asyncio
import json
import logging
import sys
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

# Add src to path for imports
sys.path.insert(0, str(__file__).replace('/wordpress_zone/truth_extractor.py', '/src'))

from lm_studio.integration import LMStudioIntegration

logger = logging.getLogger(__name__)


@dataclass
class ExtractedClaim:
    """A factual claim extracted from content.

    Attributes:
        statement: The atomic factual claim text.
        confidence: LLM-assigned confidence score (0.0-1.0).
        evidence_type: CTRM evidence classification (E1=Physical, E2=Textual, E3=Logical).
        source_context: Title or identifier of the source content.
    """
    statement: str
    confidence: float
    evidence_type: str  # E1, E2, or E3
    source_context: str

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "statement": self.statement,
            "confidence": self.confidence,
            "evidence_type": self.evidence_type,
            "source_context": self.source_context
        }


class TruthExtractor:
    """Extract factual claims from content using LM Studio.

    Uses a structured prompt to extract atomic factual claims and classify
    them according to the CTRM evidence system.

    Attributes:
        model: The LM Studio model to use for extraction.
        lm_client: The LMStudioIntegration instance.
    """

    EXTRACTION_PROMPT = """You are a High-Precision Truth Extraction Engine for Geometry OS. Analyze the following content and extract atomic factual claims that represent architectural decisions, domain knowledge, system behaviors, or key patterns.

GOAL: Extract "Golden Truths" that define the project's essence.
SKIP: Procedural logs, conversational filler, task status updates, temporal noise (e.g., "The assistant did X"), and low-value facts.

EXAMPLES OF HIGH-VALUE CLAIMS:
- "The CTRM confidence score is calculated as 0.4*LLM + 0.3*Author + 0.2*Source + 0.1*Corroboration."
- "Hilbert Curve mapping in PixelRTS v2 preserves spatial locality for binary data."
- "The Infinite Map compositor utilizes a Rust/Smithay backend with WGPU rendering."

For each claim:
1. Identify specific, verifiable statements of fact (Architecture, Logic, or Behavioral Patterns)
2. Assign a confidence score (0.0-1.0) based on:
   - 0.9-1.0: Mathematical facts, core definitions, established architectural constants
   - 0.7-0.9: Well-documented system behaviors, stable design patterns
   - 0.5-0.7: Documented implementation details
   - 0.3-0.5: Emerging patterns or partially documented behaviors
   - 0.0-0.3: Speculative or contradictory claims
3. Classify by evidence type:
   - E1 (Physical/Measurable): System performance, hard-coded constants, measurable behaviors
   - E2 (Textual/Documented): Claims directly supported by documentation or design specs
   - E3 (Logical/Structural): Derived architectural implications or mathematical proofs

CONTENT TITLE: {source_title}

CONTENT:
{content}

Respond ONLY with valid JSON in this exact format:
{{
  "claims": [
    {{
      "statement": "The specific factual claim",
      "confidence": 0.85,
      "evidence_type": "E2"
    }}
  ]
}}

If no high-value factual claims can be extracted, respond with:
{{"claims": []}}"""

    def __init__(self, model: str = "microsoft/phi-4"):
        """Initialize the TruthExtractor.

        Args:
            model: The LM Studio model to use (default: microsoft/phi-4).
        """
        self.model = model
        self.lm_client = LMStudioIntegration()
        logger.info(f"TruthExtractor initialized with model: {model}")

    async def extract_claims(
        self,
        content: str,
        source_title: str = "Unknown"
    ) -> List[ExtractedClaim]:
        """Extract factual claims from content.

        Args:
            content: The text content to analyze.
            source_title: Title or identifier of the source.

        Returns:
            List of ExtractedClaim objects.

        Example:
            >>> extractor = TruthExtractor()
            >>> claims = await extractor.extract_claims(
            ...     "The Earth orbits the Sun at 30 km/s.",
            ...     source_title="Astronomy Facts"
            ... )
            >>> print(claims[0].statement)
        """
        if not content or not content.strip():
            logger.warning("Empty content provided, returning empty claims list")
            return []

        # Truncate very long content to avoid token limits
        max_content_length = 4000
        if len(content) > max_content_length:
            logger.info(f"Truncating content from {len(content)} to {max_content_length} chars")
            content = content[:max_content_length] + "..."

        prompt = self.EXTRACTION_PROMPT.format(
            source_title=source_title,
            content=content
        )

        try:
            response = await self._call_llm(prompt)
            claims = self._parse_response(response, source_title)
            logger.info(f"Extracted {len(claims)} claims from '{source_title}'")
            return claims
        except Exception as e:
            logger.error(f"Error extracting claims: {e}")
            return []

    async def _call_llm(self, prompt: str) -> str:
        """Call LM Studio with the extraction prompt.

        Args:
            prompt: The formatted extraction prompt.

        Returns:
            The raw LLM response string.
        """
        try:
            result = await self.lm_client.generate(
                model=self.model,
                prompt=prompt,
                max_tokens=1000,
                temperature=0.3  # Low temperature for consistent extraction
            )
            return result.get("content", "")
        except Exception as e:
            logger.error(f"LM Studio call failed: {e}")
            raise

    def _parse_response(
        self,
        response: str,
        source_context: str
    ) -> List[ExtractedClaim]:
        """Parse JSON response into ExtractedClaim objects.

        Args:
            response: The raw LLM response string.
            source_context: The source title for context.

        Returns:
            List of ExtractedClaim objects.
        """
        claims = []

        try:
            # Extract JSON from response (may have surrounding text)
            json_start = response.find('{')
            json_end = response.rfind('}') + 1

            if json_start == -1 or json_end == 0:
                logger.warning("No JSON object found in response")
                return []

            json_str = response[json_start:json_end]
            data = json.loads(json_str)

            raw_claims = data.get("claims", [])
            if not raw_claims:
                logger.debug("No claims in parsed response")
                return []

            for claim_data in raw_claims:
                try:
                    # Validate and normalize evidence type
                    evidence_type = claim_data.get("evidence_type", "E2").upper()
                    if evidence_type not in ("E1", "E2", "E3"):
                        evidence_type = "E2"  # Default to textual

                    # Clamp confidence to valid range
                    confidence = float(claim_data.get("confidence", 0.5))
                    confidence = max(0.0, min(1.0, confidence))

                    claim = ExtractedClaim(
                        statement=claim_data.get("statement", ""),
                        confidence=confidence,
                        evidence_type=evidence_type,
                        source_context=source_context
                    )

                    if claim.statement:  # Only add non-empty claims
                        claims.append(claim)

                except (KeyError, ValueError, TypeError) as e:
                    logger.warning(f"Skipping malformed claim: {e}")
                    continue

        except json.JSONDecodeError as e:
            logger.warning(f"Failed to parse JSON response: {e}")
        except Exception as e:
            logger.error(f"Unexpected error parsing response: {e}")

        return claims


async def demo():
    """Demo function to test TruthExtractor."""
    logging.basicConfig(level=logging.INFO)

    extractor = TruthExtractor()

    test_content = """
    The Earth orbits the Sun at an average distance of 93 million miles.
    This orbital period takes approximately 365.25 days.
    The speed of light in a vacuum is 299,792,458 meters per second.
    """

    claims = await extractor.extract_claims(test_content, "Astronomy Facts")

    print(f"\nExtracted {len(claims)} claims:")
    for i, claim in enumerate(claims, 1):
        print(f"\n{i}. {claim.statement}")
        print(f"   Confidence: {claim.confidence:.2f}")
        print(f"   Evidence Type: {claim.evidence_type}")
        print(f"   Source: {claim.source_context}")


if __name__ == "__main__":
    asyncio.run(demo())
