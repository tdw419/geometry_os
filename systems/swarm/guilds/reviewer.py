"""ReviewerAgent implementation for code review and security scanning."""

from typing import Dict, Any
from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard


class ReviewerAgent(GuildAgent):
    """Agent for code review and security analysis."""

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus = None,
        scanner=None,
        checker=None,
        auto_claim: bool = False
    ):
        """Initialize ReviewerAgent with optional scanner and checker."""
        self.scanner = scanner
        self.checker = checker

        capabilities = [
            TaskType.CODE_REVIEW.value,
            TaskType.SECURITY_SCAN.value
        ]

        handlers = {
            TaskType.CODE_REVIEW: self.review_code,
            TaskType.SECURITY_SCAN: self.security_scan
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

    def review_code(self, task: Task) -> Dict[str, Any]:
        """Full code review: style + security."""
        code = task.payload.get("code", "")

        style_issues = []
        security_issues = []

        if self.checker:
            style_issues = self.checker.check(code)

        if self.scanner:
            security_issues = self.scanner.scan(code)

        style_penalty = min(len(style_issues) * 2, 30)
        sec_penalty = sum(
            {"low": 5, "medium": 15, "high": 30, "critical": 50}.get(
                s.severity, 5
            )
            for s in security_issues
        )
        score = max(0, 100 - style_penalty - sec_penalty)

        return {
            "score": score,
            "style_violations": [v.__dict__ for v in style_issues],
            "security_findings": [f.__dict__ for f in security_issues],
            "passed": score >= 70
        }

    def security_scan(self, task: Task) -> Dict[str, Any]:
        """Security-only scan."""
        code = task.payload.get("code", "")

        if self.scanner is None:
            return {"vulnerabilities": [], "severity": "none", "secure": True}

        findings = self.scanner.scan(code)

        severity = "none"
        if findings:
            severity_order = ["low", "medium", "high", "critical"]
            severities = [f.severity for f in findings]
            severity = max(severities, key=lambda s: severity_order.index(s))

        return {
            "vulnerabilities": [f.__dict__ for f in findings],
            "severity": severity,
            "secure": len(findings) == 0
        }

    def _summarize(self, result: Dict[str, Any]) -> str:
        """Create brief summary of result."""
        if "score" in result:
            return f"Review score: {result['score']}/100"
        return f"Security: {result.get('severity', 'unknown')}"
