"""
Log Correlation - Phase 52

Correlate logs across services with trace IDs.
"""

import json
import re
import time
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from re import Pattern
from typing import Any


class LogLevel(Enum):
    """Log severity levels."""
    DEBUG = "debug"
    INFO = "info"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


class LogFormat(Enum):
    """Supported log formats."""
    JSON = "json"
    TEXT = "text"
    STRUCTURED = "structured"


@dataclass
class LogContext:
    """Context for log correlation."""
    trace_id: str | None = None
    span_id: str | None = None
    service_name: str = ""
    service_version: str = ""
    host: str = ""
    deployment_id: str = ""
    extra: dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "trace_id": self.trace_id,
            "span_id": self.span_id,
            "service_name": self.service_name,
            "service_version": self.service_version,
            "host": self.host,
            "deployment_id": self.deployment_id,
            **self.extra,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "LogContext":
        """Create from dictionary."""
        return cls(
            trace_id=data.get("trace_id"),
            span_id=data.get("span_id"),
            service_name=data.get("service_name", ""),
            service_version=data.get("service_version", ""),
            host=data.get("host", ""),
            deployment_id=data.get("deployment_id", ""),
            extra={k: v for k, v in data.items()
                   if k not in ("trace_id", "span_id", "service_name",
                               "service_version", "host", "deployment_id")},
        )


@dataclass
class LogEntry:
    """A single log entry."""
    entry_id: str
    timestamp: float
    level: LogLevel
    message: str
    logger_name: str = ""
    context: LogContext = field(default_factory=LogContext)
    fields: dict[str, Any] = field(default_factory=dict)
    exception: str | None = None
    stack_trace: str | None = None

    @property
    def trace_id(self) -> str | None:
        return self.context.trace_id

    @property
    def span_id(self) -> str | None:
        return self.context.span_id

    @property
    def service(self) -> str:
        return self.context.service_name

    def to_json(self) -> str:
        """Convert to JSON string."""
        return json.dumps({
            "entry_id": self.entry_id,
            "timestamp": self.timestamp,
            "level": self.level.value,
            "message": self.message,
            "logger_name": self.logger_name,
            "context": self.context.to_dict(),
            "fields": self.fields,
            "exception": self.exception,
            "stack_trace": self.stack_trace,
        })

    @classmethod
    def from_json(cls, json_str: str) -> "LogEntry":
        """Create from JSON string."""
        data = json.loads(json_str)
        return cls(
            entry_id=data["entry_id"],
            timestamp=data["timestamp"],
            level=LogLevel(data["level"]),
            message=data["message"],
            logger_name=data.get("logger_name", ""),
            context=LogContext.from_dict(data.get("context", {})),
            fields=data.get("fields", {}),
            exception=data.get("exception"),
            stack_trace=data.get("stack_trace"),
        )


class CorrelatedLogger:
    """Logger that enriches logs with trace context."""

    def __init__(
        self,
        name: str,
        service_name: str = "",
        level: LogLevel = LogLevel.INFO,
        context: LogContext | None = None,
    ):
        self._name = name
        self._service_name = service_name
        self._level = level
        self._context = context or LogContext(service_name=service_name)
        self._handlers: list[Callable[[LogEntry], None]] = []
        self._extra_fields: dict[str, Any] = {}

    def set_context(self, context: LogContext) -> None:
        """Set the logging context."""
        self._context = context

    def get_context(self) -> LogContext:
        """Get current context."""
        return self._context

    def set_trace(self, trace_id: str, span_id: str | None = None) -> None:
        """Set trace context."""
        self._context.trace_id = trace_id
        if span_id:
            self._context.span_id = span_id

    def clear_trace(self) -> None:
        """Clear trace context."""
        self._context.trace_id = None
        self._context.span_id = None

    def set_extra_field(self, key: str, value: Any) -> None:
        """Set an extra field for all logs."""
        self._extra_fields[key] = value

    def remove_extra_field(self, key: str) -> None:
        """Remove an extra field."""
        self._extra_fields.pop(key, None)

    def add_handler(self, handler: Callable[[LogEntry], None]) -> None:
        """Add a log handler."""
        self._handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove a handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def _should_log(self, level: LogLevel) -> bool:
        """Check if level should be logged."""
        levels = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARNING,
                  LogLevel.ERROR, LogLevel.CRITICAL]
        return levels.index(level) >= levels.index(self._level)

    def _create_entry(
        self,
        level: LogLevel,
        message: str,
        fields: dict[str, Any] | None = None,
        exception: Exception | None = None,
    ) -> LogEntry:
        """Create a log entry."""
        combined_fields = {**self._extra_fields, **(fields or {})}

        exc_str = str(exception) if exception else None
        stack_trace = None
        if exception and hasattr(exception, "__traceback__"):
            import traceback
            stack_trace = "".join(traceback.format_exception(
                type(exception), exception, exception.__traceback__
            ))

        return LogEntry(
            entry_id=str(uuid.uuid4()),
            timestamp=time.time(),
            level=level,
            message=message,
            logger_name=self._name,
            context=LogContext(
                trace_id=self._context.trace_id,
                span_id=self._context.span_id,
                service_name=self._service_name,
                service_version=self._context.service_version,
                host=self._context.host,
                deployment_id=self._context.deployment_id,
                extra=self._context.extra.copy(),
            ),
            fields=combined_fields,
            exception=exc_str,
            stack_trace=stack_trace,
        )

    def _emit(self, entry: LogEntry) -> None:
        """Emit entry to handlers."""
        for handler in self._handlers:
            try:
                handler(entry)
            except Exception:
                pass

    def debug(self, message: str, **kwargs) -> None:
        """Log debug message."""
        if self._should_log(LogLevel.DEBUG):
            entry = self._create_entry(LogLevel.DEBUG, message, kwargs)
            self._emit(entry)

    def info(self, message: str, **kwargs) -> None:
        """Log info message."""
        if self._should_log(LogLevel.INFO):
            entry = self._create_entry(LogLevel.INFO, message, kwargs)
            self._emit(entry)

    def warning(self, message: str, **kwargs) -> None:
        """Log warning message."""
        if self._should_log(LogLevel.WARNING):
            entry = self._create_entry(LogLevel.WARNING, message, kwargs)
            self._emit(entry)

    def error(self, message: str, exception: Exception | None = None, **kwargs) -> None:
        """Log error message."""
        if self._should_log(LogLevel.ERROR):
            entry = self._create_entry(LogLevel.ERROR, message, kwargs, exception)
            self._emit(entry)

    def critical(self, message: str, exception: Exception | None = None, **kwargs) -> None:
        """Log critical message."""
        if self._should_log(LogLevel.CRITICAL):
            entry = self._create_entry(LogLevel.CRITICAL, message, kwargs, exception)
            self._emit(entry)

    def log(self, level: LogLevel, message: str, **kwargs) -> None:
        """Log with specified level."""
        if level == LogLevel.DEBUG:
            self.debug(message, **kwargs)
        elif level == LogLevel.INFO:
            self.info(message, **kwargs)
        elif level == LogLevel.WARNING:
            self.warning(message, **kwargs)
        elif level == LogLevel.ERROR:
            self.error(message, **kwargs)
        elif level == LogLevel.CRITICAL:
            self.critical(message, **kwargs)


class LogAggregator:
    """Aggregates logs from multiple services."""

    def __init__(self, max_entries: int = 100000):
        self._max_entries = max_entries
        self._entries: list[LogEntry] = []
        self._by_trace: dict[str, list[str]] = defaultdict(list)
        self._by_service: dict[str, list[str]] = defaultdict(list)
        self._by_level: dict[LogLevel, list[str]] = defaultdict(list)
        self._handlers: list[Callable[[LogEntry], None]] = []

    def add_entry(self, entry: LogEntry) -> None:
        """Add a log entry."""
        self._entries.append(entry)

        # Index by trace
        if entry.trace_id:
            self._by_trace[entry.trace_id].append(entry.entry_id)

        # Index by service
        if entry.service:
            self._by_service[entry.service].append(entry.entry_id)

        # Index by level
        self._by_level[entry.level].append(entry.entry_id)

        # Trim if needed
        if len(self._entries) > self._max_entries:
            removed = self._entries.pop(0)
            self._remove_from_indexes(removed)

        # Notify handlers
        for handler in self._handlers:
            try:
                handler(entry)
            except Exception:
                pass

    def _remove_from_indexes(self, entry: LogEntry) -> None:
        """Remove entry from indexes."""
        if entry.trace_id and entry.entry_id in self._by_trace.get(entry.trace_id, []):
            self._by_trace[entry.trace_id].remove(entry.entry_id)
        if entry.service and entry.entry_id in self._by_service.get(entry.service, []):
            self._by_service[entry.service].remove(entry.entry_id)
        if entry.entry_id in self._by_level.get(entry.level, []):
            self._by_level[entry.level].remove(entry.entry_id)

    def get_entry(self, entry_id: str) -> LogEntry | None:
        """Get entry by ID."""
        for entry in self._entries:
            if entry.entry_id == entry_id:
                return entry
        return None

    def get_by_trace(self, trace_id: str) -> list[LogEntry]:
        """Get all entries for a trace."""
        entry_ids = self._by_trace.get(trace_id, [])
        return [e for e in self._entries if e.entry_id in entry_ids]

    def get_by_service(self, service_name: str) -> list[LogEntry]:
        """Get all entries for a service."""
        entry_ids = self._by_service.get(service_name, [])
        return [e for e in self._entries if e.entry_id in entry_ids]

    def get_by_level(self, level: LogLevel) -> list[LogEntry]:
        """Get all entries for a level."""
        entry_ids = self._by_level.get(level, [])
        return [e for e in self._entries if e.entry_id in entry_ids]

    def get_by_time_range(
        self,
        start: float,
        end: float,
        trace_id: str | None = None,
    ) -> list[LogEntry]:
        """Get entries in time range."""
        entries = [e for e in self._entries if start <= e.timestamp <= end]
        if trace_id:
            entries = [e for e in entries if e.trace_id == trace_id]
        return entries

    def add_handler(self, handler: Callable[[LogEntry], None]) -> None:
        """Add a handler for new entries."""
        self._handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove a handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def clear(self) -> None:
        """Clear all entries."""
        self._entries.clear()
        self._by_trace.clear()
        self._by_service.clear()
        self._by_level.clear()

    def get_stats(self) -> dict[str, Any]:
        """Get aggregator statistics."""
        return {
            "total_entries": len(self._entries),
            "traces": len(self._by_trace),
            "services": len(self._by_service),
            "by_level": {
                level.value: len(ids)
                for level, ids in self._by_level.items()
            },
        }


class LogQueryEngine:
    """Query engine for finding related logs."""

    def __init__(self, aggregator: LogAggregator):
        self._aggregator = aggregator

    def find_by_trace(self, trace_id: str) -> list[LogEntry]:
        """Find all logs for a trace."""
        entries = self._aggregator.get_by_trace(trace_id)
        return sorted(entries, key=lambda e: e.timestamp)

    def find_by_pattern(
        self,
        pattern: str,
        case_sensitive: bool = False,
    ) -> list[LogEntry]:
        """Find logs matching a pattern."""
        flags = 0 if case_sensitive else re.IGNORECASE
        regex = re.compile(pattern, flags)

        return [
            e for e in self._aggregator._entries
            if regex.search(e.message)
        ]

    def find_by_field(
        self,
        field_name: str,
        field_value: Any,
    ) -> list[LogEntry]:
        """Find logs by field value."""
        return [
            e for e in self._aggregator._entries
            if e.fields.get(field_name) == field_value
        ]

    def find_errors(self, trace_id: str | None = None) -> list[LogEntry]:
        """Find all error logs."""
        entries = self._aggregator.get_by_level(LogLevel.ERROR) + \
                  self._aggregator.get_by_level(LogLevel.CRITICAL)

        if trace_id:
            entries = [e for e in entries if e.trace_id == trace_id]

        return sorted(entries, key=lambda e: e.timestamp)

    def find_exceptions(self) -> list[LogEntry]:
        """Find all logs with exceptions."""
        return [
            e for e in self._aggregator._entries
            if e.exception is not None
        ]

    def find_context_window(
        self,
        entry_id: str,
        before: int = 10,
        after: int = 10,
    ) -> list[LogEntry]:
        """Find logs before and after a specific entry."""
        entries = sorted(self._aggregator._entries, key=lambda e: e.timestamp)

        for i, entry in enumerate(entries):
            if entry.entry_id == entry_id:
                start = max(0, i - before)
                end = min(len(entries), i + after + 1)
                return entries[start:end]

        return []

    def find_trace_timeline(self, trace_id: str) -> list[dict[str, Any]]:
        """Get a timeline view of a trace."""
        entries = self.find_by_trace(trace_id)

        if not entries:
            return []

        start_time = entries[0].timestamp

        return [
            {
                "entry_id": e.entry_id,
                "relative_time_ms": (e.timestamp - start_time) * 1000,
                "service": e.service,
                "level": e.level.value,
                "message": e.message,
            }
            for e in entries
        ]


class LogAnalyzer:
    """Analyzes logs for patterns and anomalies."""

    def __init__(self, aggregator: LogAggregator):
        self._aggregator = aggregator
        self._patterns: list[tuple[Pattern, str]] = []
        self._anomaly_handlers: list[Callable[[str, list[LogEntry]], None]] = []

    def add_pattern(self, pattern: str, label: str) -> None:
        """Add a pattern to detect."""
        compiled = re.compile(pattern, re.IGNORECASE)
        self._patterns.append((compiled, label))

    def remove_pattern(self, pattern: str) -> None:
        """Remove a pattern."""
        self._patterns = [(p, l) for p, l in self._patterns if p.pattern != pattern]

    def detect_patterns(self) -> dict[str, list[LogEntry]]:
        """Detect pattern matches in logs."""
        results: dict[str, list[LogEntry]] = defaultdict(list)

        for entry in self._aggregator._entries:
            for pattern, label in self._patterns:
                if pattern.search(entry.message):
                    results[label].append(entry)

        return dict(results)

    def detect_error_bursts(
        self,
        window_seconds: float = 60.0,
        threshold: int = 10,
    ) -> list[dict[str, Any]]:
        """Detect bursts of errors."""
        errors = self._aggregator.get_by_level(LogLevel.ERROR) + \
                 self._aggregator.get_by_level(LogLevel.CRITICAL)

        if not errors:
            return []

        errors = sorted(errors, key=lambda e: e.timestamp)
        bursts = []

        window_start = errors[0].timestamp
        window_errors = [errors[0]]

        for entry in errors[1:]:
            if entry.timestamp - window_start <= window_seconds:
                window_errors.append(entry)
            else:
                if len(window_errors) >= threshold:
                    bursts.append({
                        "start_time": window_start,
                        "end_time": window_errors[-1].timestamp,
                        "count": len(window_errors),
                        "services": list(set(e.service for e in window_errors)),
                        "entries": window_errors,
                    })

                window_start = entry.timestamp
                window_errors = [entry]

        # Check last window
        if len(window_errors) >= threshold:
            bursts.append({
                "start_time": window_start,
                "end_time": window_errors[-1].timestamp,
                "count": len(window_errors),
                "services": list(set(e.service for e in window_errors)),
                "entries": window_errors,
            })

        return bursts

    def detect_slow_operations(
        self,
        min_duration_ms: float = 1000.0,
    ) -> list[dict[str, Any]]:
        """Detect slow operations from trace logs."""
        # Group entries by trace
        trace_entries: dict[str, list[LogEntry]] = defaultdict(list)

        for entry in self._aggregator._entries:
            if entry.trace_id:
                trace_entries[entry.trace_id].append(entry)

        slow_ops = []

        for trace_id, entries in trace_entries.items():
            if len(entries) < 2:
                continue

            sorted_entries = sorted(entries, key=lambda e: e.timestamp)
            duration_ms = (sorted_entries[-1].timestamp - sorted_entries[0].timestamp) * 1000

            if duration_ms >= min_duration_ms:
                slow_ops.append({
                    "trace_id": trace_id,
                    "duration_ms": duration_ms,
                    "entry_count": len(entries),
                    "services": list(set(e.service for e in entries)),
                    "start_time": sorted_entries[0].timestamp,
                    "end_time": sorted_entries[-1].timestamp,
                })

        return sorted(slow_ops, key=lambda x: x["duration_ms"], reverse=True)

    def compute_statistics(self) -> dict[str, Any]:
        """Compute log statistics."""
        total = len(self._aggregator._entries)

        if total == 0:
            return {"total": 0}

        by_level = {}
        for level in LogLevel:
            by_level[level.value] = len(self._aggregator.get_by_level(level))

        services = list(self._aggregator._by_service.keys())
        traces = list(self._aggregator._by_trace.keys())

        timestamps = [e.timestamp for e in self._aggregator._entries]

        return {
            "total": total,
            "by_level": by_level,
            "services": {
                "count": len(services),
                "names": services[:20],  # First 20
            },
            "traces": len(traces),
            "time_range": {
                "start": min(timestamps),
                "end": max(timestamps),
            },
        }

    def add_anomaly_handler(self, handler: Callable) -> None:
        """Add handler for anomaly detection."""
        self._anomaly_handlers.append(handler)

    def remove_anomaly_handler(self, handler: Callable) -> None:
        """Remove anomaly handler."""
        if handler in self._anomaly_handlers:
            self._anomaly_handlers.remove(handler)


class LogCorrelationSystem:
    """Complete log correlation system."""

    def __init__(self, service_name: str = "geometry-os"):
        self._service_name = service_name
        self._aggregator = LogAggregator()
        self._query_engine = LogQueryEngine(self._aggregator)
        self._analyzer = LogAnalyzer(self._aggregator)
        self._loggers: dict[str, CorrelatedLogger] = {}

    def get_logger(self, name: str, level: LogLevel = LogLevel.INFO) -> CorrelatedLogger:
        """Get or create a logger."""
        if name not in self._loggers:
            logger = CorrelatedLogger(
                name=name,
                service_name=self._service_name,
                level=level,
            )
            logger.add_handler(self._aggregator.add_entry)
            self._loggers[name] = logger
        return self._loggers[name]

    def get_aggregator(self) -> LogAggregator:
        """Get the log aggregator."""
        return self._aggregator

    def get_query_engine(self) -> LogQueryEngine:
        """Get the query engine."""
        return self._query_engine

    def get_analyzer(self) -> LogAnalyzer:
        """Get the log analyzer."""
        return self._analyzer

    def find_by_trace(self, trace_id: str) -> list[LogEntry]:
        """Find logs by trace ID."""
        return self._query_engine.find_by_trace(trace_id)

    def find_errors(self, trace_id: str | None = None) -> list[LogEntry]:
        """Find error logs."""
        return self._query_engine.find_errors(trace_id)

    def analyze_patterns(self) -> dict[str, list[LogEntry]]:
        """Detect patterns in logs."""
        return self._analyzer.detect_patterns()

    def detect_error_bursts(self) -> list[dict[str, Any]]:
        """Detect error bursts."""
        return self._analyzer.detect_error_bursts()

    def get_statistics(self) -> dict[str, Any]:
        """Get log statistics."""
        return self._analyzer.compute_statistics()

    def clear(self) -> None:
        """Clear all logs."""
        self._aggregator.clear()


def create_log_correlation_system(
    service_name: str = "geometry-os",
) -> LogCorrelationSystem:
    """Factory function to create a log correlation system."""
    return LogCorrelationSystem(service_name=service_name)


def create_correlated_logger(
    name: str,
    service_name: str = "geometry-os",
    level: LogLevel = LogLevel.INFO,
) -> CorrelatedLogger:
    """Factory function to create a correlated logger."""
    return CorrelatedLogger(
        name=name,
        service_name=service_name,
        level=level,
    )
