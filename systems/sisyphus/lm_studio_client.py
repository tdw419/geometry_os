"""
LM Studio Client - Integration with local LLM for Sisyphus daemon.

Provides inference capabilities for:
- Brain fitness evaluation
- Goal synthesis
- Mutation review
- Pattern extraction

Created: 2026-03-15 (Session Analyzer)
"""

import os
import json
import logging
import asyncio
import aiohttp
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

logger = logging.getLogger(__name__)

# Configuration
LM_STUDIO_URL = os.getenv("LM_STUDIO_URL", "http://localhost:1234/v1")
LM_STUDIO_MODEL = os.getenv("LM_STUDIO_MODEL", "local-model")
LM_STUDIO_TIMEOUT = int(os.getenv("LM_STUDIO_TIMEOUT", "30"))


@dataclass
class InferenceResult:
    """Result from an LM Studio inference call."""
    success: bool
    content: str
    tokens_used: int = 0
    error: Optional[str] = None
    latency_ms: float = 0.0


class LMStudioClient:
    """
    Client for LM Studio local LLM server.
    
    LM Studio provides an OpenAI-compatible API at localhost:1234.
    This client wraps common inference patterns for Sisyphus integration.
    """
    
    def __init__(
        self,
        base_url: str = None,
        model: str = None,
        timeout: int = None
    ):
        self.base_url = (base_url or LM_STUDIO_URL).rstrip("/")
        self.model = model or LM_STUDIO_MODEL
        self.timeout = timeout or LM_STUDIO_TIMEOUT
        self._session: Optional[aiohttp.ClientSession] = None
        self._available: Optional[bool] = None
    
    async def _get_session(self) -> aiohttp.ClientSession:
        """Get or create HTTP session."""
        if self._session is None or self._session.closed:
            self._session = aiohttp.ClientSession(
                timeout=aiohttp.ClientTimeout(total=self.timeout)
            )
        return self._session
    
    async def is_available(self) -> bool:
        """Check if LM Studio server is running."""
        if self._available is not None:
            return self._available
        
        try:
            session = await self._get_session()
            async with session.get(f"{self.base_url}/models") as resp:
                self._available = resp.status == 200
                return self._available
        except Exception as e:
            logger.debug(f"LM Studio not available: {e}")
            self._available = False
            return False
    
    async def chat_completion(
        self,
        messages: List[Dict[str, str]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        **kwargs
    ) -> InferenceResult:
        """
        Send a chat completion request to LM Studio.
        
        Args:
            messages: List of message dicts with 'role' and 'content'
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature (0.0-2.0)
            **kwargs: Additional parameters to pass to API
        
        Returns:
            InferenceResult with success status and content
        """
        import time
        start = time.time()
        
        try:
            session = await self._get_session()
            
            payload = {
                "model": self.model,
                "messages": messages,
                "max_tokens": max_tokens,
                "temperature": temperature,
                **kwargs
            }
            
            async with session.post(
                f"{self.base_url}/chat/completions",
                json=payload
            ) as resp:
                if resp.status != 200:
                    error_text = await resp.text()
                    return InferenceResult(
                        success=False,
                        content="",
                        error=f"API error {resp.status}: {error_text}"
                    )
                
                data = await resp.json()
                content = data.get("choices", [{}])[0].get("message", {}).get("content", "")
                tokens = data.get("usage", {}).get("total_tokens", 0)
                
                latency = (time.time() - start) * 1000
                logger.debug(f"LM Studio inference: {tokens} tokens in {latency:.0f}ms")
                
                return InferenceResult(
                    success=True,
                    content=content,
                    tokens_used=tokens,
                    latency_ms=latency
                )
                
        except asyncio.TimeoutError:
            return InferenceResult(
                success=False,
                content="",
                error="Request timed out"
            )
        except Exception as e:
            logger.error(f"LM Studio inference error: {e}")
            return InferenceResult(
                success=False,
                content="",
                error=str(e)
            )
    
    async def evaluate_brain_mutation(
        self,
        mutation_type: str,
        sector: str,
        fitness_before: float,
        fitness_after: float,
        context: str = ""
    ) -> Dict[str, Any]:
        """
        Use LLM to evaluate a brain mutation.
        
        Args:
            mutation_type: Type of mutation performed
            sector: Brain sector affected
            fitness_before: Fitness score before mutation
            fitness_after: Fitness score after mutation
            context: Additional context about the mutation
        
        Returns:
            Dict with evaluation results including:
            - should_keep: Whether to keep the mutation
            - reasoning: LLM's reasoning
            - suggested_improvements: List of improvement suggestions
        """
        if not await self.is_available():
            return {
                "should_keep": fitness_after > fitness_before,
                "reasoning": "LM Studio not available, using simple comparison",
                "suggested_improvements": []
            }
        
        prompt = f"""You are evaluating a brain mutation in a neural evolution system.

Mutation Details:
- Type: {mutation_type}
- Sector: {sector}
- Fitness Before: {fitness_before:.4f}
- Fitness After: {fitness_after:.4f}
- Context: {context}

Should this mutation be kept? Consider:
1. Did fitness improve?
2. Is the improvement meaningful or noise?
3. Are there any risks with this mutation?

Respond in JSON format:
{{"should_keep": true/false, "reasoning": "...", "suggested_improvements": ["..."]}}"""

        result = await self.chat_completion(
            messages=[{"role": "user", "content": prompt}],
            max_tokens=256,
            temperature=0.3
        )
        
        if not result.success:
            return {
                "should_keep": fitness_after > fitness_before,
                "reasoning": f"LLM error: {result.error}",
                "suggested_improvements": []
            }
        
        try:
            # Extract JSON from response
            content = result.content.strip()
            if "```json" in content:
                content = content.split("```json")[1].split("```")[0]
            elif "```" in content:
                content = content.split("```")[1].split("```")[0]
            
            return json.loads(content)
        except json.JSONDecodeError:
            return {
                "should_keep": fitness_after > fitness_before,
                "reasoning": f"Failed to parse LLM response: {result.content[:100]}",
                "suggested_improvements": []
            }
    
    async def synthesize_evolution_goal(
        self,
        recent_mutations: List[Dict[str, Any]],
        current_fitness: float,
        target_fitness: float = 0.95
    ) -> str:
        """
        Generate an evolution goal based on recent mutation history.
        
        Args:
            recent_mutations: List of recent mutation records
            current_fitness: Current overall fitness
            target_fitness: Target fitness to reach
        
        Returns:
            Generated evolution goal string
        """
        if not await self.is_available():
            return "improve_overall_fitness"
        
        mutation_summary = "\n".join([
            f"- {m.get('mutation_type', 'unknown')} in {m.get('sector', 'unknown')}: "
            f"{'kept' if m.get('kept') else 'reverted'}"
            for m in recent_mutations[-10:]
        ])
        
        prompt = f"""You are a goal synthesizer for a neural evolution system.

Current State:
- Current Fitness: {current_fitness:.4f}
- Target Fitness: {target_fitness:.4f}

Recent Mutations:
{mutation_summary}

Generate a concise evolution goal (one sentence) that would help reach the target fitness.
Focus on what type of mutations or sectors to prioritize.

Goal:"""

        result = await self.chat_completion(
            messages=[{"role": "user", "content": prompt}],
            max_tokens=64,
            temperature=0.5
        )
        
        if result.success:
            return result.content.strip()
        return "improve_overall_fitness"
    
    async def extract_pattern(
        self,
        code_snippet: str,
        description: str = ""
    ) -> Dict[str, Any]:
        """
        Extract a reusable pattern from code.
        
        Args:
            code_snippet: Code to analyze
            description: Optional description of what the code does
        
        Returns:
            Dict with pattern information:
            - name: Pattern name
            - rule: One-sentence description
            - why: Why this pattern works
            - applicability: Where it can be applied
        """
        if not await self.is_available():
            return {
                "name": "unknown",
                "rule": "Pattern extraction unavailable",
                "why": "LM Studio not running",
                "applicability": []
            }
        
        prompt = f"""Analyze this code and extract a reusable pattern.

Code:
```
{code_snippet[:2000]}
```

{"Context: " + description if description else ""}

Extract the pattern in JSON format:
{{"name": "...", "rule": "one sentence description", "why": "why this works", "applicability": ["where to use it"]}}"""

        result = await self.chat_completion(
            messages=[{"role": "user", "content": prompt}],
            max_tokens=256,
            temperature=0.3
        )
        
        if not result.success:
            return {
                "name": "extraction_failed",
                "rule": "Failed to extract pattern",
                "why": result.error,
                "applicability": []
            }
        
        try:
            content = result.content.strip()
            if "```json" in content:
                content = content.split("```json")[1].split("```")[0]
            return json.loads(content)
        except json.JSONDecodeError:
            return {
                "name": "parse_failed",
                "rule": result.content[:100],
                "why": "Failed to parse JSON response",
                "applicability": []
            }
    
    async def close(self):
        """Close the HTTP session."""
        if self._session and not self._session.closed:
            await self._session.close()
            self._session = None


# Singleton instance for daemon use
_client: Optional[LMStudioClient] = None


def get_lm_studio_client() -> LMStudioClient:
    """Get the singleton LM Studio client."""
    global _client
    if _client is None:
        _client = LMStudioClient()
    return _client
