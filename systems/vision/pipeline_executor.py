"""
Pipeline Executor - Step-by-step execution of visual queries.

Executes a sequence of operations on an image, maintaining variable
context for referencing previous results.
"""

import time
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional

from PIL import Image


@dataclass
class PipelineResult:
    """Result of executing a pipeline."""
    success: bool
    results: Dict[str, Any]
    latency_ms: int
    error: Optional[str] = None


class PipelineExecutor:
    """
    Executes visual query pipelines step by step.

    Maintains a variable context that allows steps to reference
    results from previous steps using $varname syntax.

    Usage:
        executor = PipelineExecutor(model)
        result = await executor.execute(image, [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
            {"op": "ground", "text": "Export", "assign_to": "export_btn"}
        ])
    """

    def __init__(self, model: "FlorenceModel"):
        """
        Initialize executor with a Florence model.

        Args:
            model: FlorenceModel instance for inference
        """
        self.model = model
        self._operations: Dict[str, Any] = {}
        self._load_operations()

    def _load_operations(self) -> None:
        """Load all available operations."""
        from systems.vision.operations import (
            DetectOperation,
            OCROperation,
            GroundOperation,
            RelativeOperation,
            ContainsOperation,
            LargestOperation,
            SmallestOperation,
            ClickPointOperation,
            RenderTextLayoutOperation,
        )

        self._operations = {
            "detect": DetectOperation(),
            "ocr": OCROperation(),
            "ground": GroundOperation(),
            "relative": RelativeOperation(),
            "contains": ContainsOperation(),
            "largest": LargestOperation(),
            "smallest": SmallestOperation(),
            "click_point": ClickPointOperation(),
            "render_text_layout": RenderTextLayoutOperation(),
        }

    async def execute(
        self,
        image: Image.Image,
        steps: List[Dict[str, Any]]
    ) -> PipelineResult:
        """
        Execute a pipeline of operations.

        Args:
            image: PIL Image to process
            steps: List of operation steps, each with 'op' and optional params

        Returns:
            PipelineResult with success status, results dict, and latency
        """
        start_time = time.time()
        context: Dict[str, Any] = {"_image": image, "_model": self.model}

        try:
            for i, step in enumerate(steps):
                op_name = step.get("op")
                if not op_name:
                    raise ValueError(f"Step {i} missing 'op' field")

                operation = self._operations.get(op_name)
                if not operation:
                    raise ValueError(f"Unknown operation: {op_name}")

                # Resolve any variable references in params
                params = self._resolve_params(step, context)

                # Execute operation
                result = await operation.execute(image, context, params)

                # Store result if assign_to is specified
                if "assign_to" in step:
                    context[step["assign_to"]] = result

            # Remove internal variables from results
            results = {k: v for k, v in context.items() if not k.startswith("_")}

            latency_ms = int((time.time() - start_time) * 1000)
            return PipelineResult(
                success=True,
                results=results,
                latency_ms=latency_ms
            )

        except Exception as e:
            latency_ms = int((time.time() - start_time) * 1000)
            return PipelineResult(
                success=False,
                results={},
                latency_ms=latency_ms,
                error=str(e)
            )

    def _resolve_params(self, step: Dict[str, Any], context: Dict[str, Any]) -> Dict[str, Any]:
        """
        Resolve variable references in step parameters.

        Handles $varname and $varname.property syntax.
        """
        params = dict(step)
        for key, value in list(params.items()):
            if isinstance(value, str) and value.startswith("$"):
                params[key] = self._resolve_reference(value, context)
            elif isinstance(value, list):
                params[key] = [
                    self._resolve_reference(v, context) if isinstance(v, str) and v.startswith("$") else v
                    for v in value
                ]
        return params

    def _resolve_reference(self, ref: str, context: Dict[str, Any]) -> Any:
        """
        Resolve a variable reference like $varname or $varname.property.

        Args:
            ref: Variable reference string starting with $
            context: Current variable context

        Returns:
            Resolved value from context
        """
        if not ref.startswith("$"):
            return ref

        parts = ref[1:].split(".")
        var_name = parts[0]

        if var_name not in context:
            raise KeyError(f"Variable '{var_name}' not found in context")

        value = context[var_name]

        # Navigate nested properties
        for part in parts[1:]:
            if isinstance(value, dict):
                value = value.get(part)
            elif hasattr(value, part):
                value = getattr(value, part)
            else:
                raise KeyError(f"Cannot access '{part}' on {type(value).__name__}")

        return value
