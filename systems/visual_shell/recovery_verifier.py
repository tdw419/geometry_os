"""
Recovery Verifier - Phase 49

Automated verification of recovery from chaos events.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class RecoveryStatus(Enum):
    """Status of recovery verification."""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    VERIFIED = "verified"
    FAILED = "failed"
    TIMEOUT = "timeout"
    PARTIAL = "partial"


class VerificationType(Enum):
    """Types of verification checks."""
    HEALTH_CHECK = "health_check"
    CONNECTIVITY = "connectivity"
    DATA_INTEGRITY = "data_integrity"
    PERFORMANCE = "performance"
    FUNCTIONAL = "functional"
    STATE_CONSISTENCY = "state_consistency"


@dataclass
class VerificationCheck:
    """A single verification check."""
    check_id: str
    name: str
    check_type: VerificationType
    check_fn: Callable[[], bool] | None = None
    expected: bool = True
    actual: bool | None = None
    passed: bool | None = None
    timeout: float = 30.0
    retry_count: int = 0
    max_retries: int = 3
    retry_delay: float = 1.0
    error_message: str | None = None
    started_at: float | None = None
    completed_at: float | None = None


@dataclass
class RecoverySLA:
    """Service Level Agreement for recovery."""
    sla_id: str
    name: str
    target_seconds: float
    critical: bool = False
    grace_period: float = 0.0


@dataclass
class RecoveryResult:
    """Result of a recovery verification."""
    result_id: str
    event_id: str
    status: RecoveryStatus = RecoveryStatus.PENDING
    checks_passed: int = 0
    checks_failed: int = 0
    total_checks: int = 0
    recovery_time: float | None = None
    started_at: float | None = None
    completed_at: float | None = None
    sla_met: bool = True
    sla_violations: list[str] = field(default_factory=list)
    checks: list[VerificationCheck] = field(default_factory=list)
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class VerificationReport:
    """Report of verification results."""
    report_id: str
    name: str
    total_verifications: int = 0
    verified: int = 0
    failed: int = 0
    partial: int = 0
    timeout: int = 0
    avg_recovery_time: float = 0.0
    sla_compliance: float = 100.0
    started_at: float = field(default_factory=time.time)
    completed_at: float | None = None
    results: list[RecoveryResult] = field(default_factory=list)


class RecoveryVerifier:
    """Verifies recovery from chaos events."""

    def __init__(self, default_timeout: float = 60.0):
        self._default_timeout = default_timeout
        self._slas: dict[str, RecoverySLA] = {}
        self._checks: dict[str, VerificationCheck] = {}
        self._results: dict[str, RecoveryResult] = {}
        self._reports: list[VerificationReport] = []
        self._running_verifications: set[str] = set()
        self._verification_handlers: list[Callable[[RecoveryResult], None]] = []

    def register_sla(self, sla: RecoverySLA) -> None:
        """Register a recovery SLA."""
        self._slas[sla.sla_id] = sla

    def unregister_sla(self, sla_id: str) -> None:
        """Unregister an SLA."""
        self._slas.pop(sla_id, None)

    def get_sla(self, sla_id: str) -> RecoverySLA | None:
        """Get an SLA by ID."""
        return self._slas.get(sla_id)

    def register_check(self, check: VerificationCheck) -> None:
        """Register a verification check."""
        self._checks[check.check_id] = check

    def unregister_check(self, check_id: str) -> None:
        """Unregister a check."""
        self._checks.pop(check_id, None)

    def get_check(self, check_id: str) -> VerificationCheck | None:
        """Get a check by ID."""
        return self._checks.get(check_id)

    def add_verification_handler(self, handler: Callable[[RecoveryResult], None]) -> None:
        """Add a verification result handler."""
        self._verification_handlers.append(handler)

    def remove_verification_handler(self, handler: Callable) -> None:
        """Remove a handler."""
        if handler in self._verification_handlers:
            self._verification_handlers.remove(handler)

    def _notify_handlers(self, result: RecoveryResult) -> None:
        """Notify handlers of verification result."""
        for handler in self._verification_handlers:
            try:
                handler(result)
            except Exception:
                pass

    async def verify_recovery(
        self,
        event_id: str,
        checks: list[VerificationCheck] | None = None,
        timeout: float | None = None,
        slas: list[str] | None = None,
    ) -> RecoveryResult:
        """Verify recovery from a chaos event."""
        result_id = str(uuid.uuid4())
        result = RecoveryResult(
            result_id=result_id,
            event_id=event_id,
            started_at=time.time(),
        )

        self._running_verifications.add(result_id)

        try:
            # Get checks to run
            checks_to_run = checks or list(self._checks.values())
            result.total_checks = len(checks_to_run)

            # Run verification with timeout
            overall_timeout = timeout or self._default_timeout

            try:
                await asyncio.wait_for(
                    self._run_checks(result, checks_to_run),
                    timeout=overall_timeout,
                )
            except TimeoutError:
                result.status = RecoveryStatus.TIMEOUT

            # Check SLAs
            if slas:
                self._check_slas(result, slas)

            # Determine final status
            if result.status == RecoveryStatus.PENDING:
                if result.checks_failed == 0:
                    result.status = RecoveryStatus.VERIFIED
                elif result.checks_passed > 0:
                    result.status = RecoveryStatus.PARTIAL
                else:
                    result.status = RecoveryStatus.FAILED

        except Exception as e:
            result.status = RecoveryStatus.FAILED
            result.metadata["error"] = str(e)

        finally:
            result.completed_at = time.time()
            result.recovery_time = result.completed_at - result.started_at

            self._results[result_id] = result
            self._running_verifications.discard(result_id)
            self._notify_handlers(result)

        return result

    async def _run_checks(
        self,
        result: RecoveryResult,
        checks: list[VerificationCheck],
    ) -> None:
        """Run all verification checks."""
        for check in checks:
            check.started_at = time.time()

            for attempt in range(check.max_retries + 1):
                try:
                    if check.check_fn:
                        check.actual = check.check_fn()
                        check.passed = check.actual == check.expected

                    if check.passed:
                        result.checks_passed += 1
                        break
                    else:
                        check.retry_count = attempt
                        if attempt < check.max_retries:
                            await asyncio.sleep(check.retry_delay)
                        else:
                            result.checks_failed += 1
                            check.error_message = f"Expected {check.expected}, got {check.actual}"

                except Exception as e:
                    check.error_message = str(e)
                    check.retry_count = attempt

                    if attempt < check.max_retries:
                        await asyncio.sleep(check.retry_delay)
                    else:
                        result.checks_failed += 1

            check.completed_at = time.time()
            result.checks.append(check)

    def _check_slas(self, result: RecoveryResult, sla_ids: list[str]) -> None:
        """Check SLA compliance."""
        for sla_id in sla_ids:
            sla = self._slas.get(sla_id)
            if sla and result.recovery_time:
                target = sla.target_seconds + sla.grace_period

                if result.recovery_time > target:
                    result.sla_met = False
                    result.sla_violations.append(
                        f"{sla.name}: {result.recovery_time:.2f}s > {target:.2f}s"
                    )

    def get_result(self, result_id: str) -> RecoveryResult | None:
        """Get a verification result."""
        return self._results.get(result_id)

    def get_results_by_event(self, event_id: str) -> list[RecoveryResult]:
        """Get all results for an event."""
        return [
            r for r in self._results.values()
            if r.event_id == event_id
        ]

    def get_running_verifications(self) -> list[str]:
        """Get IDs of running verifications."""
        return list(self._running_verifications)

    def create_report(
        self,
        name: str,
        results: list[RecoveryResult] | None = None,
    ) -> VerificationReport:
        """Create a verification report."""
        report = VerificationReport(
            report_id=str(uuid.uuid4()),
            name=name,
        )

        results_to_include = results or list(self._results.values())

        for result in results_to_include:
            report.total_verifications += 1

            if result.status == RecoveryStatus.VERIFIED:
                report.verified += 1
            elif result.status == RecoveryStatus.PARTIAL:
                report.partial += 1
            elif result.status == RecoveryStatus.TIMEOUT:
                report.timeout += 1
            else:
                report.failed += 1

            report.results.append(result)

        # Calculate averages
        recovery_times = [
            r.recovery_time for r in results_to_include
            if r.recovery_time is not None
        ]
        if recovery_times:
            report.avg_recovery_time = sum(recovery_times) / len(recovery_times)

        # Calculate SLA compliance
        total = report.total_verifications
        if total > 0:
            compliant = sum(1 for r in results_to_include if r.sla_met)
            report.sla_compliance = compliant / total * 100

        report.completed_at = time.time()

        self._reports.append(report)
        return report

    def get_reports(self, limit: int = 10) -> list[VerificationReport]:
        """Get recent reports."""
        return self._reports[-limit:]

    def get_stats(self) -> dict[str, Any]:
        """Get verification statistics."""
        results = list(self._results.values())

        return {
            "total_verifications": len(results),
            "verified": sum(1 for r in results if r.status == RecoveryStatus.VERIFIED),
            "failed": sum(1 for r in results if r.status == RecoveryStatus.FAILED),
            "partial": sum(1 for r in results if r.status == RecoveryStatus.PARTIAL),
            "timeout": sum(1 for r in results if r.status == RecoveryStatus.TIMEOUT),
            "running": len(self._running_verifications),
            "registered_slas": len(self._slas),
            "registered_checks": len(self._checks),
        }


class RecoveryAutomator:
    """Automates recovery verification after chaos events."""

    def __init__(self, verifier: RecoveryVerifier):
        self._verifier = verifier
        self._auto_verify: bool = True
        self._pending_events: dict[str, float] = {}
        self._recovery_delay: float = 5.0
        self._running = False

    async def start(self) -> None:
        """Start the recovery automator."""
        self._running = True
        asyncio.create_task(self._monitor_loop())

    async def stop(self) -> None:
        """Stop the recovery automator."""
        self._running = False

    async def _monitor_loop(self) -> None:
        """Monitor pending events for recovery verification."""
        while self._running:
            await asyncio.sleep(1.0)

            now = time.time()
            to_verify = []

            for event_id, event_time in list(self._pending_events.items()):
                if now - event_time >= self._recovery_delay:
                    to_verify.append(event_id)
                    del self._pending_events[event_id]

            for event_id in to_verify:
                await self._verifier.verify_recovery(event_id)

    def queue_event(self, event_id: str) -> None:
        """Queue a chaos event for automatic verification."""
        if self._auto_verify:
            self._pending_events[event_id] = time.time()

    def cancel_event(self, event_id: str) -> bool:
        """Cancel pending verification for an event."""
        if event_id in self._pending_events:
            del self._pending_events[event_id]
            return True
        return False

    def set_auto_verify(self, enabled: bool) -> None:
        """Enable or disable automatic verification."""
        self._auto_verify = enabled

    def set_recovery_delay(self, delay: float) -> None:
        """Set delay before automatic verification."""
        self._recovery_delay = delay

    def get_pending_count(self) -> int:
        """Get count of pending verifications."""
        return len(self._pending_events)

    def get_verifier(self) -> RecoveryVerifier:
        """Get the verifier instance."""
        return self._verifier


def create_recovery_verifier(default_timeout: float = 60.0) -> RecoveryVerifier:
    """Factory function to create a recovery verifier."""
    return RecoveryVerifier(default_timeout=default_timeout)


def create_recovery_automator(verifier: RecoveryVerifier) -> RecoveryAutomator:
    """Factory function to create a recovery automator."""
    return RecoveryAutomator(verifier)


def create_verification_check(
    name: str,
    check_type: VerificationType,
    check_fn: Callable[[], bool],
    timeout: float = 30.0,
    max_retries: int = 3,
) -> VerificationCheck:
    """Factory function to create a verification check."""
    return VerificationCheck(
        check_id=str(uuid.uuid4()),
        name=name,
        check_type=check_type,
        check_fn=check_fn,
        timeout=timeout,
        max_retries=max_retries,
    )


def create_sla(
    name: str,
    target_seconds: float,
    critical: bool = False,
    grace_period: float = 0.0,
) -> RecoverySLA:
    """Factory function to create a recovery SLA."""
    return RecoverySLA(
        sla_id=str(uuid.uuid4()),
        name=name,
        target_seconds=target_seconds,
        critical=critical,
        grace_period=grace_period,
    )
