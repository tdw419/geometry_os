"""
Base Operation - Abstract base class for all vision operations.
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

from PIL import Image


@dataclass
class OperationContext:
    """
    Context passed to operations during execution.

    Contains the image being processed and any previously computed results.
    """
    image: Image.Image
    results: Dict[str, Any]
    model: Any  # FlorenceModel

    def get(self, name: str, default: Any = None) -> Any:
        """Get a previously computed result by name."""
        return self.results.get(name, default)


class BaseOperation(ABC):
    """
    Abstract base class for vision operations.

    All operations must implement:
    - name: Property returning the operation name
    - execute: Method that performs the operation

    Operations can optionally implement:
    - validate_params: Validate input parameters before execution
    """

    @property
    @abstractmethod
    def name(self) -> str:
        """Return the operation name (used in pipeline steps)."""
        pass

    @abstractmethod
    async def execute(
        self,
        image: Image.Image,
        context: Dict[str, Any],
        params: Dict[str, Any]
    ) -> Any:
        """
        Execute the operation.

        Args:
            image: PIL Image to process
            context: Dict containing previously computed results
            params: Operation-specific parameters from the pipeline step

        Returns:
            Operation result (stored in context if assign_to is specified)
        """
        pass

    def validate_params(self, params: Dict[str, Any]) -> List[str]:
        """
        Validate operation parameters.

        Args:
            params: Parameters to validate

        Returns:
            List of error messages (empty if valid)
        """
        return []

    def get_model(self, context: Dict[str, Any]) -> Any:
        """Get the Florence model from context."""
        return context.get("_model")


class OperationError(Exception):
    """Error during operation execution."""
    pass
