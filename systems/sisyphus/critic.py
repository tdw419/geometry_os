"""
Sisyphus Critic - Cognitive Grading for PixelBrain Evolution

Uses the Cognitive Router (escalating to LM Studio) to evaluate
and grade the output of PixelBrain mutations. This provides the
"Tech Lead" oversight for the evolution loop.
"""

import logging
from typing import Dict, Any, Optional, List
from systems.cognitive.cognitive_router import get_cognitive_router

logger = logging.getLogger(__name__)


class SisyphusCritic:
    """
    Cognitive critic that grades brain evolution quality.
    
    It analyzes the output of a brain mutation and provides:
    1. A numerical score (0-1)
    2. A rationale for the grade
    3. A decision to COMMIT or REVERT
    """

    def __init__(self):
        self.router = get_cognitive_router()

    async def grade_mutation(
        self,
        prompt: str,
        output: str,
        expected_context: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Grade a single completion from a mutated brain.
        
        Args:
            prompt: The input prompt used
            output: The brain's generated output
            expected_context: Optional context about what was expected
            
        Returns:
            Dict containing score, rationale, and decision
        """
        eval_prompt = f"""You are the Sisyphus Tech Lead. Grade the following AI response.
        
Prompt: "{prompt}"
Response: "{output}"
{f"Context: {expected_context}" if expected_context else ""}

Evaluate based on:
1. Coherence and grammar.
2. Relevance to the prompt.
3. Logical flow.

Respond in JSON format:
{{
  "score": 0.0-1.0,
  "rationale": "...",
  "decision": "COMMIT" or "REVERT"
}}
"""
        # High complexity ensures escalation to LM Studio (Tech Lead)
        response_text = await self.router.generate(eval_prompt, complexity=0.9, max_tokens=200)
        
        try:
            import json
            import re
            # Extract JSON from potential markdown markers
            json_match = re.search(r'\{.*\}', response_text, re.DOTALL)
            if json_match:
                result = json.loads(json_match.group(0))
                logger.info(f"[Critic] Grade: {result.get('score')} - Decision: {result.get('decision')}")
                return result
        except Exception as e:
            logger.warning(f"Failed to parse critic response: {e}")
            
        # Fallback if evaluation fails
        return {
            "score": 0.5,
            "rationale": "Evaluation failed, using neutral fallback",
            "decision": "REVERT" # Safety first
        }

    async def evaluate_batch(self, samples: List[Dict[str, str]]) -> float:
        """Evaluate a batch of samples and return average score."""
        scores = []
        for sample in samples:
            grade = await self.grade_mutation(sample['prompt'], sample['output'])
            scores.append(grade.get('score', 0.0))
            
        return sum(scores) / len(scores) if scores else 0.0
