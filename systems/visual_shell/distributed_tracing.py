"""
Distributed Tracing - Phase 50

Request tracing across mesh with span aggregation.
"""

import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class SpanStatus(Enum):
    """Status of a span."""
    UNSET = "unset"
    OK = "ok"
    ERROR = "error"


class SpanKind(Enum):
    """Kind of span."""
    INTERNAL = "internal"
    SERVER = "server"
    CLIENT = "client"
    PRODUCER = "producer"
    CONSUMER = "consumer"


class SpanKind(Enum):
    """Kind of span."""
    INTERNAL = "internal"
    SERVER = "server"
    CLIENT = "client"
    PRODUCER = "producer"
    CONSUMER = "consumer"


@dataclass
class SpanContext:
    """Context for a span."""
    trace_id: str
    span_id: str
    trace_flags: int = 0
    trace_state: dict[str, str] = field(default_factory=dict)
    is_remote: bool = False

    @classmethod
    def generate(cls) -> "SpanContext":
        """Generate a new span context."""
        return cls(
            trace_id=uuid.uuid4().hex,
            span_id=uuid.uuid4().hex[:16],
        )

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "trace_id": self.trace_id,
            "span_id": self.span_id,
            "trace_flags": self.trace_flags,
            "trace_state": self.trace_state,
            "is_remote": self.is_remote,
        }


@dataclass
class SpanEvent:
    """An event within a span."""
    name: str
    timestamp: float = field(default_factory=time.time)
    attributes: dict[str, Any] = field(default_factory=dict)


@dataclass
class SpanLink:
    """A link to another span."""
    context: SpanContext
    attributes: dict[str, Any] = field(default_factory=dict)


@dataclass
class Span:
    """A single span in a trace."""
    span_id: str
    name: str
    context: SpanContext
    parent_id: str | None = None
    kind: SpanKind = SpanKind.INTERNAL
    start_time: float = field(default_factory=time.time)
    end_time: float | None = None
    status: SpanStatus = SpanStatus.UNSET
    attributes: dict[str, Any] = field(default_factory=dict)
    events: list[SpanEvent] = field(default_factory=list)
    links: list[SpanLink] = field(default_factory=list)

    def set_status(self, status: SpanStatus, description: str = "") -> None:
        """Set span status."""
        self.status = status
        if description:
            self.attributes["status_description"] = description

    def set_attribute(self, key: str, value: Any) -> None:
        """Set an attribute."""
        self.attributes[key] = value

    def add_event(self, name: str, attributes: dict[str, Any] | None = None) -> SpanEvent:
        """Add an event."""
        event = SpanEvent(name=name, attributes=attributes or {})
        self.events.append(event)
        return event

    def add_link(self, context: SpanContext, attributes: dict[str, Any] | None = None) -> SpanLink:
        """Add a link to another span."""
        link = SpanLink(context=context, attributes=attributes or {})
        self.links.append(link)
        return link

    def end(self, end_time: float | None = None) -> None:
        """End the span."""
        self.end_time = end_time or time.time()

    @property
    def duration(self) -> float:
        """Get span duration."""
        if self.end_time is None:
            return time.time() - self.start_time
        return self.end_time - self.start_time

    def is_finished(self) -> bool:
        """Check if span is finished."""
        return self.end_time is not None


@dataclass
class Trace:
    """A complete trace with all spans."""
    trace_id: str
    spans: list[Span] = field(default_factory=list)
    start_time: float = field(default_factory=time.time)
    end_time: float | None = None

    def add_span(self, span: Span) -> None:
        """Add a span to the trace."""
        self.spans.append(span)
        if span.end_time:
            if self.end_time is None or span.end_time > self.end_time:
                self.end_time = span.end_time

    @property
    def duration(self) -> float:
        """Get total trace duration."""
        if self.end_time is None:
            return time.time() - self.start_time
        return self.end_time - self.start_time

    @property
    def span_count(self) -> int:
        """Get count of spans."""
        return len(self.spans)

    @property
    def root_span(self) -> Span | None:
        """Get the root span (no parent)."""
        for span in self.spans:
            if span.parent_id is None:
                return span
        return None

    def get_span_tree(self) -> dict[str, list[str]]:
        """Get parent-child relationships."""
        tree: dict[str, list[str]] = {}
        for span in self.spans:
            if span.parent_id:
                if span.parent_id not in tree:
                    tree[span.parent_id] = []
                tree[span.parent_id].append(span.span_id)
        return tree


class TracerProvider:
    """Provides tracers for services."""

    def __init__(self, service_name: str = "geometry-os"):
        self._service_name = service_name
        self._processors: list[Callable[[Span], None]] = []
        self._resource_attributes: dict[str, Any] = {}

    def get_tracer(self, name: str, version: str = "") -> "Tracer":
        """Get a tracer."""
        return Tracer(
            name=name,
            version=version,
            provider=self,
        )

    def add_span_processor(self, processor: Callable[[Span], None]) -> None:
        """Add a span processor."""
        self._processors.append(processor)

    def remove_span_processor(self, processor: Callable) -> None:
        """Remove a span processor."""
        if processor in self._processors:
            self._processors.remove(processor)

    def process_span(self, span: Span) -> None:
        """Process a finished span."""
        for processor in self._processors:
            try:
                processor(span)
            except Exception:
                pass

    def set_resource_attribute(self, key: str, value: Any) -> None:
        """Set a resource attribute."""
        self._resource_attributes[key] = value

    def get_resource_attributes(self) -> dict[str, Any]:
        """Get resource attributes."""
        return self._resource_attributes.copy()


class Tracer:
    """Creates and manages spans."""

    def __init__(
        self,
        name: str,
        provider: TracerProvider,
        version: str = "",
    ):
        self._name = name
        self._provider = provider
        self._version = version

    def start_span(
        self,
        name: str,
        context: SpanContext | None = None,
        parent: Span | None = None,
        kind: SpanKind = SpanKind.INTERNAL,
        attributes: dict[str, Any] | None = None,
    ) -> Span:
        """Start a new span."""
        if context is None:
            context = SpanContext.generate()

        parent_id = parent.span_id if parent else None

        span = Span(
            span_id=uuid.uuid4().hex[:16],
            name=name,
            context=context,
            parent_id=parent_id,
            kind=kind,
            attributes=attributes or {},
        )

        return span

    def start_as_current_span(
        self,
        name: str,
        context: SpanContext | None = None,
        parent: Span | None = None,
        kind: SpanKind = SpanKind.INTERNAL,
        attributes: dict[str, Any] | None = None,
    ) -> "SpanContextManager":
        """Start a span and set as current."""
        span = self.start_span(name, context, parent, kind, attributes)
        return SpanContextManager(span, self._provider)


class SpanContextManager:
    """Context manager for spans."""

    def __init__(self, span: Span, provider: TracerProvider):
        self._span = span
        self._provider = provider

    def __enter__(self) -> Span:
        return self._span

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        if exc_type is not None:
            self._span.set_status(SpanStatus.ERROR, str(exc_val))
        self._span.end()
        self._provider.process_span(self._span)


class TraceAggregator:
    """Aggregates spans into traces."""

    def __init__(self, max_traces: int = 10000):
        self._max_traces = max_traces
        self._traces: dict[str, Trace] = {}
        self._span_buffer: dict[str, list[Span]] = {}
        self._completed_traces: list[Trace] = []
        self._handlers: list[Callable[[Trace], None]] = []

    def add_span(self, span: Span) -> None:
        """Add a span to aggregation."""
        trace_id = span.context.trace_id

        if trace_id not in self._traces:
            self._traces[trace_id] = Trace(trace_id=trace_id)

        self._traces[trace_id].add_span(span)

        # Check if trace is complete (root span finished)
        if span.parent_id is None and span.is_finished():
            self._complete_trace(trace_id)

    def _complete_trace(self, trace_id: str) -> None:
        """Complete a trace."""
        trace = self._traces.pop(trace_id, None)
        if trace:
            trace.end_time = time.time()
            self._completed_traces.append(trace)

            # Trim old traces
            if len(self._completed_traces) > self._max_traces:
                self._completed_traces = self._completed_traces[-self._max_traces:]

            # Notify handlers
            for handler in self._handlers:
                try:
                    handler(trace)
                except Exception:
                    pass

    def get_trace(self, trace_id: str) -> Trace | None:
        """Get a trace by ID."""
        if trace_id in self._traces:
            return self._traces[trace_id]

        for trace in self._completed_traces:
            if trace.trace_id == trace_id:
                return trace

        return None

    def get_active_traces(self) -> list[Trace]:
        """Get all active traces."""
        return list(self._traces.values())

    def get_completed_traces(self, limit: int = 100) -> list[Trace]:
        """Get completed traces."""
        return self._completed_traces[-limit:]

    def find_traces_by_name(self, name: str) -> list[Trace]:
        """Find traces by span name."""
        matches = []
        for trace in list(self._traces.values()) + self._completed_traces:
            for span in trace.spans:
                if span.name == name:
                    matches.append(trace)
                    break
        return matches

    def find_traces_by_duration(
        self,
        min_duration: float = 0,
        max_duration: float = float("inf"),
    ) -> list[Trace]:
        """Find traces by duration range."""
        matches = []
        for trace in self._completed_traces:
            if min_duration <= trace.duration <= max_duration:
                matches.append(trace)
        return matches

    def add_handler(self, handler: Callable[[Trace], None]) -> None:
        """Add a trace completion handler."""
        self._handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove a handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def get_stats(self) -> dict[str, Any]:
        """Get aggregator statistics."""
        total_spans = sum(len(t.spans) for t in self._completed_traces)

        durations = [t.duration for t in self._completed_traces[-100:]]
        avg_duration = sum(durations) / len(durations) if durations else 0

        return {
            "active_traces": len(self._traces),
            "completed_traces": len(self._completed_traces),
            "total_spans": total_spans,
            "avg_duration": avg_duration,
        }

    def clear(self) -> None:
        """Clear all traces."""
        self._traces.clear()
        self._completed_traces.clear()


class DistributedTracer:
    """Main interface for distributed tracing."""

    def __init__(
        self,
        service_name: str = "geometry-os",
        sample_rate: float = 1.0,
    ):
        self._service_name = service_name
        self._sample_rate = sample_rate
        self._provider = TracerProvider(service_name)
        self._aggregator = TraceAggregator()
        self._current_span: Span | None = None

        # Wire up span processor
        self._provider.add_span_processor(self._aggregator.add_span)

    def get_tracer(self, name: str, version: str = "") -> Tracer:
        """Get a tracer."""
        return self._provider.get_tracer(name, version)

    def start_span(
        self,
        name: str,
        parent: Span | None = None,
        kind: SpanKind = SpanKind.INTERNAL,
        attributes: dict[str, Any] | None = None,
    ) -> Span:
        """Start a span."""
        # Sampling check
        import random
        if random.random() > self._sample_rate:
            # Return no-op span
            context = SpanContext(trace_id="0" * 32, span_id="0" * 16)
            return Span(span_id="0" * 16, name=name, context=context)

        tracer = self._provider.get_tracer(self._service_name)

        # Propagate context from current span if no parent
        if parent is None and self._current_span:
            parent = self._current_span

        return tracer.start_span(name, parent=parent, kind=kind, attributes=attributes)

    def set_current_span(self, span: Span) -> None:
        """Set current span for context propagation."""
        self._current_span = span

    def get_current_span(self) -> Span | None:
        """Get current span."""
        return self._current_span

    def inject_context(self, carrier: dict[str, str]) -> None:
        """Inject trace context into carrier."""
        if self._current_span:
            carrier["traceparent"] = f"00-{self._current_span.context.trace_id}-{self._current_span.span_id}-01"
            for key, value in self._current_span.context.trace_state.items():
                carrier[f"tracestate_{key}"] = value

    def extract_context(self, carrier: dict[str, str]) -> SpanContext | None:
        """Extract trace context from carrier."""
        traceparent = carrier.get("traceparent")
        if not traceparent:
            return None

        parts = traceparent.split("-")
        if len(parts) >= 3:
            trace_state = {}
            for key, value in carrier.items():
                if key.startswith("tracestate_"):
                    trace_state[key[11:]] = value

            return SpanContext(
                trace_id=parts[1],
                span_id=uuid.uuid4().hex[:16],  # New span for child
                trace_flags=int(parts[3]) if len(parts) > 3 else 0,
                trace_state=trace_state,
                is_remote=True,
            )

        return None

    def get_aggregator(self) -> TraceAggregator:
        """Get trace aggregator."""
        return self._aggregator

    def get_provider(self) -> TracerProvider:
        """Get tracer provider."""
        return self._provider

    def get_trace(self, trace_id: str) -> Trace | None:
        """Get a trace by ID."""
        return self._aggregator.get_trace(trace_id)

    def get_stats(self) -> dict[str, Any]:
        """Get tracing statistics."""
        return self._aggregator.get_stats()

    def set_sample_rate(self, rate: float) -> None:
        """Set sampling rate."""
        self._sample_rate = max(0.0, min(1.0, rate))


def create_distributed_tracer(
    service_name: str = "geometry-os",
    sample_rate: float = 1.0,
) -> DistributedTracer:
    """Factory function to create a distributed tracer."""
    return DistributedTracer(
        service_name=service_name,
        sample_rate=sample_rate,
    )
