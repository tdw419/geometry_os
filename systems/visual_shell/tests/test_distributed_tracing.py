"""
Tests for Distributed Tracing (Phase 50)

Tests request tracing across mesh with span aggregation.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.distributed_tracing import (
    DistributedTracer,
    Span,
    SpanContext,
    SpanContextManager,
    SpanEvent,
    SpanKind,
    SpanLink,
    SpanStatus,
    Trace,
    TraceAggregator,
    Tracer,
    TracerProvider,
    create_distributed_tracer,
)


class TestSpanStatus:
    """Tests for SpanStatus enum."""

    def test_span_statuses(self):
        assert SpanStatus.UNSET.value == "unset"
        assert SpanStatus.OK.value == "ok"
        assert SpanStatus.ERROR.value == "error"


class TestSpanKind:
    """Tests for SpanKind enum."""

    def test_span_kinds(self):
        assert SpanKind.INTERNAL.value == "internal"
        assert SpanKind.SERVER.value == "server"
        assert SpanKind.CLIENT.value == "client"
        assert SpanKind.PRODUCER.value == "producer"
        assert SpanKind.CONSUMER.value == "consumer"


class TestSpanContext:
    """Tests for SpanContext."""

    def test_context_creation(self):
        context = SpanContext(
            trace_id="trace-123",
            span_id="span-456",
        )
        assert context.trace_id == "trace-123"
        assert context.span_id == "span-456"
        assert context.is_remote is False

    def test_context_generate(self):
        context = SpanContext.generate()
        assert len(context.trace_id) == 32
        assert len(context.span_id) == 16

    def test_to_dict(self):
        context = SpanContext(
            trace_id="trace-123",
            span_id="span-456",
            trace_state={"key": "value"},
        )
        d = context.to_dict()
        assert d["trace_id"] == "trace-123"
        assert d["trace_state"]["key"] == "value"


class TestSpanEvent:
    """Tests for SpanEvent."""

    def test_event_creation(self):
        event = SpanEvent(
            name="test-event",
            attributes={"key": "value"},
        )
        assert event.name == "test-event"
        assert event.attributes["key"] == "value"


class TestSpanLink:
    """Tests for SpanLink."""

    def test_link_creation(self):
        context = SpanContext.generate()
        link = SpanLink(context=context, attributes={"type": "follows"})
        assert link.context == context


class TestSpan:
    """Tests for Span."""

    @pytest.fixture
    def span(self):
        return Span(
            span_id="span-1",
            name="test-span",
            context=SpanContext.generate(),
        )

    def test_span_creation(self, span):
        assert span.span_id == "span-1"
        assert span.status == SpanStatus.UNSET

    def test_set_status(self, span):
        span.set_status(SpanStatus.OK, "All good")
        assert span.status == SpanStatus.OK
        assert span.attributes["status_description"] == "All good"

    def test_set_attribute(self, span):
        span.set_attribute("key", "value")
        assert span.attributes["key"] == "value"

    def test_add_event(self, span):
        event = span.add_event("something-happened", {"detail": "info"})
        assert len(span.events) == 1
        assert event.name == "something-happened"

    def test_add_link(self, span):
        other_context = SpanContext.generate()
        link = span.add_link(other_context, {"type": "parent"})
        assert len(span.links) == 1

    def test_end(self, span):
        assert span.end_time is None
        span.end()
        assert span.end_time is not None

    def test_duration(self, span):
        time.sleep(0.01)
        duration = span.duration
        assert duration >= 0.01

    def test_is_finished(self, span):
        assert span.is_finished() is False
        span.end()
        assert span.is_finished() is True


class TestTrace:
    """Tests for Trace."""

    @pytest.fixture
    def trace(self):
        return Trace(trace_id="trace-1")

    def test_trace_creation(self, trace):
        assert trace.trace_id == "trace-1"
        assert len(trace.spans) == 0

    def test_add_span(self, trace):
        span = Span(
            span_id="span-1",
            name="test",
            context=SpanContext(trace_id="trace-1", span_id="span-1"),
        )
        trace.add_span(span)
        assert len(trace.spans) == 1

    def test_duration(self, trace):
        time.sleep(0.01)
        assert trace.duration >= 0.01

    def test_span_count(self, trace):
        assert trace.span_count == 0
        span = Span(
            span_id="span-1",
            name="test",
            context=SpanContext.generate(),
        )
        trace.add_span(span)
        assert trace.span_count == 1

    def test_root_span(self, trace):
        root = Span(
            span_id="root",
            name="root",
            context=SpanContext.generate(),
        )
        child = Span(
            span_id="child",
            name="child",
            context=SpanContext.generate(),
            parent_id="root",
        )
        trace.add_span(child)
        trace.add_span(root)

        found_root = trace.root_span
        assert found_root.span_id == "root"

    def test_get_span_tree(self, trace):
        root = Span(
            span_id="root",
            name="root",
            context=SpanContext.generate(),
        )
        child1 = Span(
            span_id="child1",
            name="child1",
            context=SpanContext.generate(),
            parent_id="root",
        )
        child2 = Span(
            span_id="child2",
            name="child2",
            context=SpanContext.generate(),
            parent_id="root",
        )
        trace.add_span(root)
        trace.add_span(child1)
        trace.add_span(child2)

        tree = trace.get_span_tree()
        assert "root" in tree
        assert len(tree["root"]) == 2


class TestTracerProvider:
    """Tests for TracerProvider."""

    def test_provider_creation(self):
        provider = TracerProvider("test-service")
        assert provider._service_name == "test-service"

    def test_get_tracer(self):
        provider = TracerProvider()
        tracer = provider.get_tracer("test-tracer")
        assert isinstance(tracer, Tracer)

    def test_add_span_processor(self):
        provider = TracerProvider()
        processor = Mock()
        provider.add_span_processor(processor)

        span = Span(
            span_id="span-1",
            name="test",
            context=SpanContext.generate(),
        )
        provider.process_span(span)

        processor.assert_called_once_with(span)

    def test_remove_span_processor(self):
        provider = TracerProvider()
        processor = Mock()
        provider.add_span_processor(processor)
        provider.remove_span_processor(processor)

        span = Span(
            span_id="span-1",
            name="test",
            context=SpanContext.generate(),
        )
        provider.process_span(span)

        processor.assert_not_called()

    def test_resource_attributes(self):
        provider = TracerProvider()
        provider.set_resource_attribute("service.name", "test")
        attrs = provider.get_resource_attributes()
        assert attrs["service.name"] == "test"


class TestTracer:
    """Tests for Tracer."""

    @pytest.fixture
    def tracer(self):
        provider = TracerProvider()
        return provider.get_tracer("test-tracer")

    def test_tracer_creation(self, tracer):
        assert tracer._name == "test-tracer"

    def test_start_span(self, tracer):
        span = tracer.start_span("operation")
        assert span.name == "operation"
        assert span.span_id is not None

    def test_start_span_with_parent(self, tracer):
        parent = tracer.start_span("parent")
        child = tracer.start_span("child", parent=parent)

        assert child.parent_id == parent.span_id

    def test_start_span_with_kind(self, tracer):
        span = tracer.start_span("request", kind=SpanKind.SERVER)
        assert span.kind == SpanKind.SERVER

    def test_start_span_with_attributes(self, tracer):
        span = tracer.start_span("op", attributes={"key": "value"})
        assert span.attributes["key"] == "value"

    def test_start_as_current_span(self, tracer):
        with tracer.start_as_current_span("operation") as span:
            assert span.name == "operation"
            span.set_attribute("test", "value")

        assert span.is_finished()


class TestSpanContextManager:
    """Tests for SpanContextManager."""

    def test_context_manager(self):
        provider = TracerProvider()
        tracer = provider.get_tracer("test")
        span = tracer.start_span("test")

        with SpanContextManager(span, provider):
            span.set_attribute("inside", True)

        assert span.is_finished()
        assert span.status == SpanStatus.UNSET

    def test_context_manager_with_exception(self):
        provider = TracerProvider()
        tracer = provider.get_tracer("test")
        span = tracer.start_span("test")

        try:
            with SpanContextManager(span, provider):
                raise ValueError("Test error")
        except ValueError:
            pass

        assert span.is_finished()
        assert span.status == SpanStatus.ERROR


class TestTraceAggregator:
    """Tests for TraceAggregator."""

    @pytest.fixture
    def aggregator(self):
        return TraceAggregator(max_traces=100)

    def test_aggregator_creation(self, aggregator):
        assert aggregator._max_traces == 100

    def test_add_span(self, aggregator):
        context = SpanContext.generate()
        span = Span(
            span_id="span-1",
            name="test",
            context=context,
        )
        aggregator.add_span(span)

        trace = aggregator.get_trace(context.trace_id)
        assert trace is not None

    def test_complete_trace(self, aggregator):
        context = SpanContext.generate()
        root = Span(
            span_id="root",
            name="root",
            context=context,
        )
        root.end()
        aggregator.add_span(root)

        # Trace should be completed
        completed = aggregator.get_completed_traces()
        assert len(completed) == 1

    def test_get_active_traces(self, aggregator):
        context = SpanContext.generate()
        span = Span(
            span_id="span-1",
            name="test",
            context=context,
        )
        aggregator.add_span(span)

        active = aggregator.get_active_traces()
        assert len(active) == 1

    def test_find_traces_by_name(self, aggregator):
        context = SpanContext.generate()
        span = Span(
            span_id="span-1",
            name="special-operation",
            context=context,
        )
        span.end()
        aggregator.add_span(span)

        found = aggregator.find_traces_by_name("special-operation")
        assert len(found) == 1

    def test_find_traces_by_duration(self, aggregator):
        context = SpanContext.generate()
        span = Span(
            span_id="span-1",
            name="test",
            context=context,
        )
        span.end()
        aggregator.add_span(span)

        found = aggregator.find_traces_by_duration(min_duration=0, max_duration=10)
        assert len(found) == 1

    def test_add_handler(self, aggregator):
        handler = Mock()
        aggregator.add_handler(handler)

        context = SpanContext.generate()
        span = Span(
            span_id="root",
            name="root",
            context=context,
        )
        span.end()
        aggregator.add_span(span)

        handler.assert_called_once()

    def test_remove_handler(self, aggregator):
        handler = Mock()
        aggregator.add_handler(handler)
        aggregator.remove_handler(handler)

        context = SpanContext.generate()
        span = Span(
            span_id="root",
            name="root",
            context=context,
        )
        span.end()
        aggregator.add_span(span)

        handler.assert_not_called()

    def test_get_stats(self, aggregator):
        stats = aggregator.get_stats()
        assert "active_traces" in stats
        assert "completed_traces" in stats

    def test_clear(self, aggregator):
        context = SpanContext.generate()
        span = Span(
            span_id="span-1",
            name="test",
            context=context,
        )
        aggregator.add_span(span)

        aggregator.clear()
        assert len(aggregator.get_active_traces()) == 0


class TestDistributedTracer:
    """Tests for DistributedTracer."""

    @pytest.fixture
    def tracer(self):
        return DistributedTracer(service_name="test-service")

    def test_tracer_creation(self, tracer):
        assert tracer._service_name == "test-service"

    def test_get_tracer(self, tracer):
        t = tracer.get_tracer("module")
        assert isinstance(t, Tracer)

    def test_start_span(self, tracer):
        span = tracer.start_span("operation")
        assert span.name == "operation"

    def test_start_span_with_parent(self, tracer):
        parent = tracer.start_span("parent")
        child = tracer.start_span("child", parent=parent)
        assert child.parent_id == parent.span_id

    def test_set_current_span(self, tracer):
        span = tracer.start_span("current")
        tracer.set_current_span(span)
        assert tracer.get_current_span() == span

    def test_inject_context(self, tracer):
        span = tracer.start_span("test")
        tracer.set_current_span(span)

        carrier = {}
        tracer.inject_context(carrier)

        assert "traceparent" in carrier

    def test_extract_context(self, tracer):
        carrier = {
            "traceparent": "00-01234567890123456789012345678901-0123456789012345-01"
        }

        context = tracer.extract_context(carrier)
        assert context is not None
        assert context.is_remote is True

    def test_extract_context_missing(self, tracer):
        carrier = {}
        context = tracer.extract_context(carrier)
        assert context is None

    def test_get_aggregator(self, tracer):
        aggregator = tracer.get_aggregator()
        assert isinstance(aggregator, TraceAggregator)

    def test_get_provider(self, tracer):
        provider = tracer.get_provider()
        assert isinstance(provider, TracerProvider)

    def test_get_trace(self, tracer):
        span = tracer.start_span("test")
        tracer._provider.process_span(span)

        trace = tracer.get_trace(span.context.trace_id)
        assert trace is not None

    def test_get_stats(self, tracer):
        stats = tracer.get_stats()
        assert "active_traces" in stats

    def test_set_sample_rate(self, tracer):
        tracer.set_sample_rate(0.5)
        assert tracer._sample_rate == 0.5


class TestCreateDistributedTracer:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        tracer = create_distributed_tracer()
        assert isinstance(tracer, DistributedTracer)

    def test_create_with_custom(self):
        tracer = create_distributed_tracer(
            service_name="custom-service",
            sample_rate=0.5,
        )
        assert tracer._service_name == "custom-service"
        assert tracer._sample_rate == 0.5


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
