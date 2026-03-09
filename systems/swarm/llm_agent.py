"""
Swarm LLM Agent - Base class for agents using native PixelBrain LLM.

This module provides a base class for swarm agents that need LLM capabilities.
All LLM calls go through SwarmLLMBackend which uses the native PixelBrain
inference engine instead of external APIs.

Usage:
    class MyAgent(SwarmLLMAgent):
        async def process(self, input_data):
            result = await self.generate(f"Process: {input_data}")
            return result
"""

import logging
from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional
from datetime import datetime

logger = logging.getLogger(__name__)


@dataclass
class AgentMessage:
    """Message structure for agent communication."""
    role: str  # "user", "assistant", "system"
    content: str
    timestamp: float = field(default_factory=lambda: datetime.now().timestamp())


@dataclass
class AgentTask:
    """Task structure for agent work items."""
    task_id: str
    task_type: str
    payload: Dict[str, Any]
    priority: int = 0
    created_at: float = field(default_factory=lambda: datetime.now().timestamp())


@dataclass
class AgentResult:
    """Result structure for completed tasks."""
    task_id: str
    success: bool
    output: Optional[str] = None
    error: Optional[str] = None
    metadata: Dict[str, Any] = field(default_factory=dict)


class SwarmLLMAgent(ABC):
    """
    Base class for swarm agents using native PixelBrain LLM.

    This class provides:
    - Access to SwarmLLMBackend for all LLM operations
    - Message history tracking
    - Task processing interface
    - Graceful fallback when LLM unavailable

    Subclasses should implement:
    - process_task(): Main task processing logic
    - Optional: get_system_prompt() for agent personality
    """

    def __init__(self, agent_id: str, agent_type: str = "base"):
        """
        Initialize the agent.

        Args:
            agent_id: Unique identifier for this agent instance
            agent_type: Type of agent (e.g., "engineer", "reviewer", "architect")
        """
        self.agent_id = agent_id
        self.agent_type = agent_type
        self._backend = None
        self._message_history: List[AgentMessage] = []
        self._task_count = 0

    @property
    def backend(self):
        """Lazy-load the LLM backend."""
        if self._backend is None:
            from systems.swarm.llm_backend import get_swarm_llm_backend
            self._backend = get_swarm_llm_backend()
        return self._backend

    def is_llm_available(self) -> bool:
        """Check if LLM backend is available."""
        return self.backend.is_available()

    def get_system_prompt(self) -> Optional[str]:
        """
        Get the system prompt for this agent type.

        Override this method to define agent personality.

        Returns:
            System prompt string or None for no system prompt.
        """
        return None

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        use_history: bool = False
    ) -> str:
        """
        Generate text using the native LLM backend.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            use_history: Whether to include message history

        Returns:
            Generated text string
        """
        full_prompt = prompt

        if use_history and self._message_history:
            # Include recent history in prompt
            history_text = "\n".join([
                f"{msg.role}: {msg.content}"
                for msg in self._message_history[-5:]  # Last 5 messages
            ])
            full_prompt = f"Previous context:\n{history_text}\n\nCurrent: {prompt}"

        result = await self.backend.generate(
            prompt=full_prompt,
            max_tokens=max_tokens,
            temperature=temperature,
            system_prompt=self.get_system_prompt()
        )

        # Track this interaction
        self._message_history.append(AgentMessage(role="user", content=prompt))
        self._message_history.append(AgentMessage(role="assistant", content=result))

        return result

    async def generate_code(
        self,
        description: str,
        language: str = "python",
        max_tokens: int = 500
    ) -> str:
        """
        Generate code using the native LLM backend.

        Args:
            description: Description of code to generate
            language: Programming language
            max_tokens: Maximum tokens

        Returns:
            Generated code string
        """
        return await self.backend.generate_code(
            description=description,
            language=language,
            max_tokens=max_tokens
        )

    async def analyze(
        self,
        content: str,
        question: str,
        max_tokens: int = 200
    ) -> str:
        """
        Analyze content and answer a question.

        Args:
            content: Content to analyze
            question: Question about the content
            max_tokens: Maximum tokens

        Returns:
            Analysis result string
        """
        return await self.backend.analyze(
            content=content,
            question=question,
            max_tokens=max_tokens
        )

    def clear_history(self):
        """Clear message history."""
        self._message_history = []

    @abstractmethod
    async def process_task(self, task: AgentTask) -> AgentResult:
        """
        Process a task. Subclasses must implement this.

        Args:
            task: Task to process

        Returns:
            AgentResult with outcome
        """
        pass

    async def run_task(self, task: AgentTask) -> AgentResult:
        """
        Run a task with error handling.

        Args:
            task: Task to run

        Returns:
            AgentResult with outcome
        """
        self._task_count += 1
        logger.info(f"Agent {self.agent_id} starting task {task.task_id}")

        try:
            result = await self.process_task(task)
            logger.info(f"Agent {self.agent_id} completed task {task.task_id}: success={result.success}")
            return result
        except Exception as e:
            logger.error(f"Agent {self.agent_id} failed task {task.task_id}: {e}")
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=str(e)
            )


# Example agent implementations

class EngineerAgent(SwarmLLMAgent):
    """
    Engineer agent that generates and modifies code.

    Uses native PixelBrain for all LLM operations.
    """

    def __init__(self, agent_id: str):
        super().__init__(agent_id, agent_type="engineer")

    def get_system_prompt(self) -> Optional[str]:
        return """You are an Engineer agent in a swarm system.
Your job is to write clean, efficient, well-documented code.
Follow best practices and include appropriate error handling."""

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Process engineering tasks."""
        if task.task_type == "generate_code":
            code = await self.generate_code(
                description=task.payload.get("description", ""),
                language=task.payload.get("language", "python")
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=code,
                metadata={"language": task.payload.get("language", "python")}
            )

        elif task.task_type == "modify_code":
            # Analyze existing code and generate modifications
            existing = task.payload.get("code", "")
            changes = task.payload.get("changes", "")

            result = await self.analyze(
                content=existing,
                question=f"Modify this code to: {changes}. Return the complete modified code."
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=result
            )

        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )


class ReviewerAgent(SwarmLLMAgent):
    """
    Reviewer agent that analyzes and provides feedback.

    Uses native PixelBrain for all LLM operations.
    """

    def __init__(self, agent_id: str):
        super().__init__(agent_id, agent_type="reviewer")

    def get_system_prompt(self) -> Optional[str]:
        return """You are a Reviewer agent in a swarm system.
Your job is to analyze code and provide constructive feedback.
Focus on: correctness, performance, security, and maintainability."""

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Process review tasks."""
        if task.task_type == "review_code":
            code = task.payload.get("code", "")

            review = await self.analyze(
                content=code,
                question="Review this code for correctness, performance, security, and maintainability. Provide specific suggestions for improvement."
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=review
            )

        elif task.task_type == "review_changes":
            old_code = task.payload.get("old_code", "")
            new_code = task.payload.get("new_code", "")

            review = await self.analyze(
                content=f"OLD CODE:\n{old_code}\n\nNEW CODE:\n{new_code}",
                question="Review these changes. Are they appropriate? Any issues or improvements needed?"
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=review
            )

        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )


class ArchitectAgent(SwarmLLMAgent):
    """
    Architect agent that designs system structures.

    Uses native PixelBrain for all LLM operations.
    """

    def __init__(self, agent_id: str):
        super().__init__(agent_id, agent_type="architect")

    def get_system_prompt(self) -> Optional[str]:
        return """You are an Architect agent in a swarm system.
Your job is to design system architectures and component interactions.
Focus on: modularity, scalability, and clear interfaces."""

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Process architecture tasks."""
        if task.task_type == "design_module":
            requirements = task.payload.get("requirements", "")

            design = await self.generate(
                prompt=f"Design a module with these requirements:\n{requirements}\n\nProvide: module structure, key classes/functions, and interfaces.",
                max_tokens=500,
                temperature=0.5
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=design
            )

        elif task.task_type == "design_interface":
            components = task.payload.get("components", [])

            design = await self.generate(
                prompt=f"Design interfaces for these components to work together:\n{chr(10).join(components)}\n\nProvide interface definitions.",
                max_tokens=300,
                temperature=0.5
            )
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=design
            )

        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )


# Factory function for creating agents

def create_agent(agent_type: str, agent_id: str) -> SwarmLLMAgent:
    """
    Factory function to create agents by type.

    Args:
        agent_type: Type of agent ("engineer", "reviewer", "architect")
        agent_id: Unique identifier for the agent

    Returns:
        SwarmLLMAgent instance

    Raises:
        ValueError: If agent type is unknown
    """
    agents = {
        "engineer": EngineerAgent,
        "reviewer": ReviewerAgent,
        "architect": ArchitectAgent
    }

    if agent_type not in agents:
        raise ValueError(f"Unknown agent type: {agent_type}. Available: {list(agents.keys())}")

    return agents[agent_type](agent_id)
