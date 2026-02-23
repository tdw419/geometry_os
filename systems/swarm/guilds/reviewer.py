"""
ReviewerAgent - Code review and security analysis specialist.

Handles CODE_REVIEW and SECURITY_SCAN tasks.
"""

import traceback
from typing import Dict, Any, Optional, List, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class ReviewerAgent(GuildAgent):
    """
    Reviewer agent for code review and security analysis tasks.

    Capabilities:
    - CODE_REVIEW: Review code for quality, style, and best practices
    - SECURITY_SCAN: Analyze code for security vulnerabilities
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        auto_claim: bool = False
    ):
        """
        Initialize reviewer agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            event_bus: Optional NEBBus for publishing result events
            auto_claim: If True, automatically claim tasks when notified
        """
        capabilities = [
            TaskType.CODE_REVIEW.value,
            TaskType.SECURITY_SCAN.value
        ]

        handlers = {
            TaskType.CODE_REVIEW: self._handle_code_review,
            TaskType.SECURITY_SCAN: self._handle_security_scan
        }

        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="reviewer",
            event_bus=event_bus,
            capabilities=capabilities,
            handlers=handlers,
            auto_claim=auto_claim
        )

    def _summarize(self, result: Dict[str, Any]) -> str:
        """
        Summarize task result.

        Args:
            result: Task result dictionary

        Returns:
            Human-readable summary
        """
        if "issues" in result:
            issue_count = len(result["issues"])
            severity = result.get("severity", "unknown")
            return f"Found {issue_count} issues ({severity})"
        elif "vulnerabilities" in result:
            vuln_count = len(result["vulnerabilities"])
            risk = result.get("risk_level", "unknown")
            return f"Found {vuln_count} vulnerabilities ({risk} risk)"
        elif "error" in result:
            return f"Error: {result['error']}"
        return "Review completed"

    def _handle_code_review(self, task: Task) -> Dict[str, Any]:
        """
        Handle CODE_REVIEW task.

        Args:
            task: Task to process

        Returns:
            Result with review findings
        """
        try:
            # POC: Return mock review results
            # TODO: Integrate with actual linters (pylint, black, etc.)
            code = task.payload.get("code", "")
            lines = code.count("\n") + 1 if code else 0

            # Mock analysis
            issues = []
            if lines > 100:
                issues.append({
                    "type": "complexity",
                    "message": "File exceeds 100 lines, consider splitting",
                    "severity": "warning"
                })

            if "TODO" in code:
                issues.append({
                    "type": "todo",
                    "message": "Unresolved TODO comment found",
                    "severity": "info"
                })

            return {
                "issues": issues,
                "severity": "low" if not issues else "medium",
                "lines_reviewed": lines,
                "reviewed_by": self.agent_id,
                "recommendations": [
                    "Consider adding docstrings to functions",
                    "Ensure consistent code formatting"
                ]
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Code review failed: {e}. Check task payload for valid code."
            }

    def _handle_security_scan(self, task: Task) -> Dict[str, Any]:
        """
        Handle SECURITY_SCAN task.

        Args:
            task: Task to process

        Returns:
            Result with security findings
        """
        try:
            # POC: Return mock security scan results
            # TODO: Integrate with actual security scanners (bandit, etc.)
            code = task.payload.get("code", "")

            vulnerabilities = []

            # Mock security checks
            if "eval(" in code:
                vulnerabilities.append({
                    "type": "code_injection",
                    "message": "Use of eval() detected - potential code injection risk",
                    "severity": "high",
                    "line": None
                })

            if "password" in code.lower() and "=" in code:
                vulnerabilities.append({
                    "type": "hardcoded_secret",
                    "message": "Possible hardcoded password/secret detected",
                    "severity": "medium",
                    "line": None
                })

            if "exec(" in code:
                vulnerabilities.append({
                    "type": "code_execution",
                    "message": "Use of exec() detected - potential security risk",
                    "severity": "high",
                    "line": None
                })

            # Calculate risk level
            if any(v["severity"] == "high" for v in vulnerabilities):
                risk_level = "high"
            elif any(v["severity"] == "medium" for v in vulnerabilities):
                risk_level = "medium"
            elif vulnerabilities:
                risk_level = "low"
            else:
                risk_level = "none"

            return {
                "vulnerabilities": vulnerabilities,
                "risk_level": risk_level,
                "scanned_by": self.agent_id,
                "recommendations": [
                    "Review all high-severity findings immediately",
                    "Consider using environment variables for secrets"
                ] if vulnerabilities else [
                    "No security issues found"
                ]
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Security scan failed: {e}. Check task payload for valid code."
            }

    def complete_task(self, task: Task, result: Dict[str, Any]) -> bool:
        """
        Complete task and publish result event.

        Args:
            task: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        success = super().complete_task(task, result)

        if success:
            # Publish result event
            topic = f"guild.reviewer.{task.task_type.value.lower()}"
            self._publish_result(topic, {
                "agent_id": self.agent_id,
                "task_id": task.task_id,
                "summary": self._summarize(result),
                "result": result
            })

        return success
