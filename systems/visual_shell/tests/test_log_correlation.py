"""
Tests for Log Correlation (Phase 52)

Tests log correlation across services with trace IDs.
"""

import json
import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.log_correlation import (
    CorrelatedLogger,
    LogAggregator,
    LogAnalyzer,
    LogContext,
    LogCorrelationSystem,
    LogEntry,
    LogFormat,
    LogLevel,
    LogQueryEngine,
    create_correlated_logger,
    create_log_correlation_system,
)


class TestLogLevel:
    """Tests for LogLevel enum."""

    def test_log_levels(self):
        assert LogLevel.DEBUG.value == "debug"
        assert LogLevel.INFO.value == "info"
        assert LogLevel.WARNING.value == "warning"
        assert LogLevel.ERROR.value == "error"
        assert LogLevel.CRITICAL.value == "critical"


class TestLogFormat:
    """Tests for LogFormat enum."""

    def test_log_formats(self):
        assert LogFormat.JSON.value == "json"
        assert LogFormat.TEXT.value == "text"
        assert LogFormat.STRUCTURED.value == "structured"


class TestLogContext:
    """Tests for LogContext."""

    def test_context_creation(self):
        context = LogContext(
            trace_id="trace-123",
            span_id="span-456",
            service_name="test-service",
        )
        assert context.trace_id == "trace-123"
        assert context.span_id == "span-456"
        assert context.service_name == "test-service"

    def test_context_defaults(self):
        context = LogContext()
        assert context.trace_id is None
        assert context.span_id is None
        assert context.service_name == ""

    def test_to_dict(self):
        context = LogContext(
            trace_id="trace-123",
            service_name="test-service",
            extra={"key": "value"},
        )
        d = context.to_dict()
        assert d["trace_id"] == "trace-123"
        assert d["service_name"] == "test-service"
        assert d["key"] == "value"

    def test_from_dict(self):
        d = {
            "trace_id": "trace-123",
            "span_id": "span-456",
            "service_name": "test-service",
            "custom": "field",
        }
        context = LogContext.from_dict(d)
        assert context.trace_id == "trace-123"
        assert context.span_id == "span-456"
        assert context.extra["custom"] == "field"

    def test_roundtrip(self):
        original = LogContext(
            trace_id="trace-123",
            span_id="span-456",
            service_name="test-service",
            service_version="1.0.0",
            host="localhost",
            extra={"key": "value"},
        )
        d = original.to_dict()
        restored = LogContext.from_dict(d)
        assert restored.trace_id == original.trace_id
        assert restored.span_id == original.span_id
        assert restored.service_name == original.service_name
        assert restored.extra["key"] == "value"


class TestLogEntry:
    """Tests for LogEntry."""

    @pytest.fixture
    def entry(self):
        return LogEntry(
            entry_id="entry-123",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test message",
            logger_name="test-logger",
        )

    def test_entry_creation(self, entry):
        assert entry.entry_id == "entry-123"
        assert entry.level == LogLevel.INFO
        assert entry.message == "Test message"

    def test_trace_id_property(self, entry):
        entry.context.trace_id = "trace-123"
        assert entry.trace_id == "trace-123"

    def test_span_id_property(self, entry):
        entry.context.span_id = "span-456"
        assert entry.span_id == "span-456"

    def test_service_property(self, entry):
        entry.context.service_name = "test-service"
        assert entry.service == "test-service"

    def test_to_json(self, entry):
        json_str = entry.to_json()
        data = json.loads(json_str)
        assert data["entry_id"] == "entry-123"
        assert data["level"] == "info"
        assert data["message"] == "Test message"

    def test_from_json(self):
        json_str = json.dumps({
            "entry_id": "entry-123",
            "timestamp": 1234567890.0,
            "level": "error",
            "message": "Error message",
            "logger_name": "test-logger",
            "context": {
                "trace_id": "trace-123",
                "service_name": "test-service",
            },
            "fields": {"key": "value"},
            "exception": "Test exception",
        })
        entry = LogEntry.from_json(json_str)
        assert entry.entry_id == "entry-123"
        assert entry.level == LogLevel.ERROR
        assert entry.trace_id == "trace-123"
        assert entry.exception == "Test exception"

    def test_roundtrip(self, entry):
        json_str = entry.to_json()
        restored = LogEntry.from_json(json_str)
        assert restored.entry_id == entry.entry_id
        assert restored.level == entry.level
        assert restored.message == entry.message
        assert restored.logger_name == entry.logger_name


class TestCorrelatedLogger:
    """Tests for CorrelatedLogger."""

    @pytest.fixture
    def logger(self):
        return CorrelatedLogger(
            name="test-logger",
            service_name="test-service",
            level=LogLevel.DEBUG,
        )

    def test_logger_creation(self, logger):
        assert logger._name == "test-logger"
        assert logger._service_name == "test-service"

    def test_set_context(self, logger):
        context = LogContext(trace_id="trace-123")
        logger.set_context(context)
        assert logger.get_context().trace_id == "trace-123"

    def test_set_trace(self, logger):
        logger.set_trace("trace-123", "span-456")
        assert logger.get_context().trace_id == "trace-123"
        assert logger.get_context().span_id == "span-456"

    def test_clear_trace(self, logger):
        logger.set_trace("trace-123", "span-456")
        logger.clear_trace()
        assert logger.get_context().trace_id is None
        assert logger.get_context().span_id is None

    def test_extra_fields(self, logger):
        logger.set_extra_field("key", "value")
        assert logger._extra_fields["key"] == "value"

        logger.remove_extra_field("key")
        assert "key" not in logger._extra_fields

    def test_handlers(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        assert handler in logger._handlers

        logger.remove_handler(handler)
        assert handler not in logger._handlers

    def test_should_log(self, logger):
        logger._level = LogLevel.WARNING
        assert logger._should_log(LogLevel.WARNING) is True
        assert logger._should_log(LogLevel.ERROR) is True
        assert logger._should_log(LogLevel.INFO) is False

    def test_debug(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.debug("Debug message")
        handler.assert_called_once()
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.DEBUG
        assert entry.message == "Debug message"

    def test_info(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.info("Info message")
        handler.assert_called_once()
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.INFO

    def test_warning(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.warning("Warning message")
        handler.assert_called_once()
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.WARNING

    def test_error(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.error("Error message")
        handler.assert_called_once()
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.ERROR

    def test_error_with_exception(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        exc = ValueError("Test error")
        logger.error("Error occurred", exception=exc)
        entry = handler.call_args[0][0]
        assert entry.exception == "Test error"
        assert entry.stack_trace is not None

    def test_critical(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.critical("Critical message")
        handler.assert_called_once()
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.CRITICAL

    def test_log_method(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.log(LogLevel.WARNING, "Warning via log")
        entry = handler.call_args[0][0]
        assert entry.level == LogLevel.WARNING

    def test_level_filtering(self, logger):
        logger._level = LogLevel.ERROR
        handler = Mock()
        logger.add_handler(handler)

        logger.debug("Should not log")
        logger.info("Should not log")
        logger.warning("Should not log")

        handler.assert_not_called()

        logger.error("Should log")
        handler.assert_called_once()

    def test_trace_context_enrichment(self, logger):
        handler = Mock()
        logger.add_handler(handler)
        logger.set_trace("trace-123", "span-456")

        logger.info("Test message")
        entry = handler.call_args[0][0]

        assert entry.trace_id == "trace-123"
        assert entry.span_id == "span-456"

    def test_kwargs_as_fields(self, logger):
        handler = Mock()
        logger.add_handler(handler)

        logger.info("Test message", user_id=123, action="login")
        entry = handler.call_args[0][0]

        assert entry.fields["user_id"] == 123
        assert entry.fields["action"] == "login"


class TestLogAggregator:
    """Tests for LogAggregator."""

    @pytest.fixture
    def aggregator(self):
        return LogAggregator(max_entries=100)

    def test_aggregator_creation(self, aggregator):
        assert len(aggregator._entries) == 0

    def test_add_entry(self, aggregator):
        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
            context=LogContext(trace_id="trace-1", service_name="service-a"),
        )
        aggregator.add_entry(entry)
        assert len(aggregator._entries) == 1

    def test_index_by_trace(self, aggregator):
        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
            context=LogContext(trace_id="trace-1"),
        )
        aggregator.add_entry(entry)
        assert "trace-1" in aggregator._by_trace

    def test_index_by_service(self, aggregator):
        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
            context=LogContext(service_name="service-a"),
        )
        aggregator.add_entry(entry)
        assert "service-a" in aggregator._by_service

    def test_index_by_level(self, aggregator):
        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.ERROR,
            message="Test",
        )
        aggregator.add_entry(entry)
        assert "entry-1" in aggregator._by_level[LogLevel.ERROR]

    def test_max_entries_trimming(self):
        aggregator = LogAggregator(max_entries=3)

        for i in range(5):
            entry = LogEntry(
                entry_id=f"entry-{i}",
                timestamp=time.time() + i,
                level=LogLevel.INFO,
                message=f"Message {i}",
                context=LogContext(trace_id=f"trace-{i}"),
            )
            aggregator.add_entry(entry)

        assert len(aggregator._entries) == 3
        # First two should be removed
        assert aggregator.get_entry("entry-0") is None
        assert aggregator.get_entry("entry-1") is None

    def test_get_entry(self, aggregator):
        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
        )
        aggregator.add_entry(entry)

        found = aggregator.get_entry("entry-1")
        assert found is not None
        assert found.message == "Test"

    def test_get_entry_not_found(self, aggregator):
        assert aggregator.get_entry("nonexistent") is None

    def test_get_by_trace(self, aggregator):
        for i in range(3):
            entry = LogEntry(
                entry_id=f"entry-{i}",
                timestamp=time.time(),
                level=LogLevel.INFO,
                message=f"Message {i}",
                context=LogContext(trace_id="trace-1"),
            )
            aggregator.add_entry(entry)

        entries = aggregator.get_by_trace("trace-1")
        assert len(entries) == 3

    def test_get_by_service(self, aggregator):
        for i in range(2):
            entry = LogEntry(
                entry_id=f"entry-{i}",
                timestamp=time.time(),
                level=LogLevel.INFO,
                message=f"Message {i}",
                context=LogContext(service_name="service-a"),
            )
            aggregator.add_entry(entry)

        entries = aggregator.get_by_service("service-a")
        assert len(entries) == 2

    def test_get_by_level(self, aggregator):
        aggregator.add_entry(LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.ERROR,
            message="Error",
        ))
        aggregator.add_entry(LogEntry(
            entry_id="entry-2",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Info",
        ))

        errors = aggregator.get_by_level(LogLevel.ERROR)
        assert len(errors) == 1

    def test_get_by_time_range(self, aggregator):
        now = time.time()
        aggregator.add_entry(LogEntry(
            entry_id="entry-1",
            timestamp=now - 10,
            level=LogLevel.INFO,
            message="Old",
        ))
        aggregator.add_entry(LogEntry(
            entry_id="entry-2",
            timestamp=now - 5,
            level=LogLevel.INFO,
            message="Middle",
        ))
        aggregator.add_entry(LogEntry(
            entry_id="entry-3",
            timestamp=now,
            level=LogLevel.INFO,
            message="New",
        ))

        entries = aggregator.get_by_time_range(now - 6, now)
        assert len(entries) == 2

    def test_get_by_time_range_with_trace(self, aggregator):
        now = time.time()
        aggregator.add_entry(LogEntry(
            entry_id="entry-1",
            timestamp=now,
            level=LogLevel.INFO,
            message="Trace 1",
            context=LogContext(trace_id="trace-1"),
        ))
        aggregator.add_entry(LogEntry(
            entry_id="entry-2",
            timestamp=now,
            level=LogLevel.INFO,
            message="Trace 2",
            context=LogContext(trace_id="trace-2"),
        ))

        entries = aggregator.get_by_time_range(now - 1, now + 1, trace_id="trace-1")
        assert len(entries) == 1
        assert entries[0].trace_id == "trace-1"

    def test_handlers(self, aggregator):
        handler = Mock()
        aggregator.add_handler(handler)

        entry = LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
        )
        aggregator.add_entry(entry)

        handler.assert_called_once_with(entry)

    def test_clear(self, aggregator):
        aggregator.add_entry(LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Test",
            context=LogContext(trace_id="trace-1", service_name="service-a"),
        ))

        aggregator.clear()
        assert len(aggregator._entries) == 0
        assert len(aggregator._by_trace) == 0
        assert len(aggregator._by_service) == 0

    def test_get_stats(self, aggregator):
        aggregator.add_entry(LogEntry(
            entry_id="entry-1",
            timestamp=time.time(),
            level=LogLevel.ERROR,
            message="Test",
            context=LogContext(trace_id="trace-1", service_name="service-a"),
        ))

        stats = aggregator.get_stats()
        assert stats["total_entries"] == 1
        assert stats["traces"] == 1
        assert stats["services"] == 1


class TestLogQueryEngine:
    """Tests for LogQueryEngine."""

    @pytest.fixture
    def setup(self):
        aggregator = LogAggregator()

        for i in range(5):
            entry = LogEntry(
                entry_id=f"entry-{i}",
                timestamp=time.time() + i,
                level=LogLevel.ERROR if i % 2 == 0 else LogLevel.INFO,
                message=f"Test message {i} with pattern",
                context=LogContext(
                    trace_id="trace-1" if i < 3 else "trace-2",
                    service_name="service-a",
                ),
                fields={"user_id": 100 + i},
            )
            aggregator.add_entry(entry)

        return LogQueryEngine(aggregator), aggregator

    def test_find_by_trace(self, setup):
        engine, _ = setup
        entries = engine.find_by_trace("trace-1")
        assert len(entries) == 3

    def test_find_by_trace_sorted(self, setup):
        engine, aggregator = setup
        entries = engine.find_by_trace("trace-1")
        timestamps = [e.timestamp for e in entries]
        assert timestamps == sorted(timestamps)

    def test_find_by_pattern(self, setup):
        engine, _ = setup
        entries = engine.find_by_pattern(r"pattern")
        assert len(entries) == 5

    def test_find_by_pattern_case_insensitive(self, setup):
        engine, _ = setup
        entries = engine.find_by_pattern(r"PATTERN")
        assert len(entries) == 5

    def test_find_by_pattern_case_sensitive(self, setup):
        engine, _ = setup
        entries = engine.find_by_pattern(r"pattern", case_sensitive=True)
        assert len(entries) == 5  # All lowercase in data

        entries = engine.find_by_pattern(r"PATTERN", case_sensitive=True)
        assert len(entries) == 0

    def test_find_by_field(self, setup):
        engine, _ = setup
        entries = engine.find_by_field("user_id", 101)
        assert len(entries) == 1
        assert entries[0].fields["user_id"] == 101

    def test_find_errors(self, setup):
        engine, _ = setup
        entries = engine.find_errors()
        # Entry 0, 2, 4 are ERROR level
        assert len(entries) == 3

    def test_find_errors_with_trace(self, setup):
        engine, _ = setup
        entries = engine.find_errors(trace_id="trace-1")
        # Only entry 0 and 2 are errors in trace-1
        assert len(entries) == 2

    def test_find_exceptions(self, setup):
        engine, aggregator = setup

        # Add entry with exception
        aggregator.add_entry(LogEntry(
            entry_id="exc-entry",
            timestamp=time.time(),
            level=LogLevel.ERROR,
            message="Error",
            exception="TestException",
        ))

        entries = engine.find_exceptions()
        assert len(entries) == 1

    def test_find_context_window(self, setup):
        engine, _ = setup
        window = engine.find_context_window("entry-2", before=1, after=1)
        assert len(window) == 3
        assert window[0].entry_id == "entry-1"
        assert window[1].entry_id == "entry-2"
        assert window[2].entry_id == "entry-3"

    def test_find_context_window_not_found(self, setup):
        engine, _ = setup
        window = engine.find_context_window("nonexistent")
        assert len(window) == 0

    def test_find_trace_timeline(self, setup):
        engine, _ = setup
        timeline = engine.find_trace_timeline("trace-1")

        assert len(timeline) == 3
        assert timeline[0]["relative_time_ms"] == 0  # First entry
        assert all("service" in t for t in timeline)
        assert all("level" in t for t in timeline)

    def test_find_trace_timeline_empty(self, setup):
        engine, _ = setup
        timeline = engine.find_trace_timeline("nonexistent")
        assert len(timeline) == 0


class TestLogAnalyzer:
    """Tests for LogAnalyzer."""

    @pytest.fixture
    def setup(self):
        aggregator = LogAggregator()

        # Add various entries
        now = time.time()
        for i in range(10):
            aggregator.add_entry(LogEntry(
                entry_id=f"entry-{i}",
                timestamp=now + (i * 0.1),
                level=LogLevel.ERROR if i % 3 == 0 else LogLevel.INFO,
                message=f"Log entry {i} with timeout error",
                context=LogContext(
                    trace_id=f"trace-{i // 3}",
                    service_name=f"service-{i % 2}",
                ),
            ))

        return LogAnalyzer(aggregator), aggregator

    def test_add_pattern(self, setup):
        analyzer, _ = setup
        analyzer.add_pattern(r"timeout", "timeout_error")
        assert len(analyzer._patterns) == 1

    def test_remove_pattern(self, setup):
        analyzer, _ = setup
        analyzer.add_pattern(r"timeout", "timeout_error")
        analyzer.remove_pattern(r"timeout")
        assert len(analyzer._patterns) == 0

    def test_detect_patterns(self, setup):
        analyzer, _ = setup
        analyzer.add_pattern(r"timeout", "timeout_error")

        results = analyzer.detect_patterns()
        assert "timeout_error" in results
        assert len(results["timeout_error"]) == 10  # All messages have "timeout"

    def test_detect_error_bursts(self, setup):
        analyzer, aggregator = setup

        # Add burst of errors
        now = time.time()
        for i in range(15):
            aggregator.add_entry(LogEntry(
                entry_id=f"burst-{i}",
                timestamp=now + (i * 0.01),
                level=LogLevel.ERROR,
                message=f"Burst error {i}",
            ))

        bursts = analyzer.detect_error_bursts(window_seconds=1.0, threshold=10)
        assert len(bursts) >= 1
        assert bursts[0]["count"] >= 10

    def test_detect_error_bursts_empty(self, setup):
        analyzer, aggregator = setup
        aggregator.clear()

        bursts = analyzer.detect_error_bursts()
        assert len(bursts) == 0

    def test_detect_slow_operations(self, setup):
        analyzer, aggregator = setup

        # Create a slow trace
        now = time.time()
        for i in range(3):
            aggregator.add_entry(LogEntry(
                entry_id=f"slow-{i}",
                timestamp=now + (i * 0.5),  # 1.5 seconds total
                level=LogLevel.INFO,
                message=f"Slow op {i}",
                context=LogContext(trace_id="slow-trace"),
            ))

        slow_ops = analyzer.detect_slow_operations(min_duration_ms=1000)
        assert len(slow_ops) >= 1
        assert any(op["trace_id"] == "slow-trace" for op in slow_ops)

    def test_detect_slow_operations_single_entry(self, setup):
        analyzer, aggregator = setup
        aggregator.clear()

        # Single entry trace - not slow
        aggregator.add_entry(LogEntry(
            entry_id="single",
            timestamp=time.time(),
            level=LogLevel.INFO,
            message="Single",
            context=LogContext(trace_id="single-trace"),
        ))

        slow_ops = analyzer.detect_slow_operations()
        assert len(slow_ops) == 0

    def test_compute_statistics(self, setup):
        analyzer, _ = setup
        stats = analyzer.compute_statistics()

        assert stats["total"] == 10
        assert "by_level" in stats
        assert "services" in stats
        assert "traces" in stats

    def test_compute_statistics_empty(self, setup):
        analyzer, aggregator = setup
        aggregator.clear()

        stats = analyzer.compute_statistics()
        assert stats["total"] == 0

    def test_anomaly_handlers(self, setup):
        analyzer, _ = setup
        handler = Mock()
        analyzer.add_anomaly_handler(handler)
        assert handler in analyzer._anomaly_handlers

        analyzer.remove_anomaly_handler(handler)
        assert handler not in analyzer._anomaly_handlers


class TestLogCorrelationSystem:
    """Tests for LogCorrelationSystem."""

    @pytest.fixture
    def system(self):
        return LogCorrelationSystem(service_name="test-service")

    def test_system_creation(self, system):
        assert system._service_name == "test-service"
        assert system._aggregator is not None
        assert system._query_engine is not None
        assert system._analyzer is not None

    def test_get_logger(self, system):
        logger = system.get_logger("test-logger")
        assert logger is not None
        assert logger._name == "test-logger"

    def test_get_logger_caches(self, system):
        logger1 = system.get_logger("test-logger")
        logger2 = system.get_logger("test-logger")
        assert logger1 is logger2

    def test_logger_auto_aggregates(self, system):
        logger = system.get_logger("test-logger")
        logger.info("Test message")

        entries = system.get_aggregator()._entries
        assert len(entries) == 1

    def test_get_aggregator(self, system):
        aggregator = system.get_aggregator()
        assert isinstance(aggregator, LogAggregator)

    def test_get_query_engine(self, system):
        engine = system.get_query_engine()
        assert isinstance(engine, LogQueryEngine)

    def test_get_analyzer(self, system):
        analyzer = system.get_analyzer()
        assert isinstance(analyzer, LogAnalyzer)

    def test_find_by_trace(self, system):
        logger = system.get_logger("test-logger")
        logger.set_trace("trace-123")
        logger.info("Test message")

        entries = system.find_by_trace("trace-123")
        assert len(entries) == 1

    def test_find_errors(self, system):
        logger = system.get_logger("test-logger")
        logger.error("Error message")
        logger.info("Info message")

        errors = system.find_errors()
        assert len(errors) == 1

    def test_analyze_patterns(self, system):
        analyzer = system.get_analyzer()
        analyzer.add_pattern(r"test", "test_pattern")

        logger = system.get_logger("test-logger")
        logger.info("Test message")

        patterns = system.analyze_patterns()
        assert "test_pattern" in patterns

    def test_detect_error_bursts(self, system):
        logger = system.get_logger("test-logger")
        for i in range(15):
            logger.error(f"Error {i}")

        bursts = system.detect_error_bursts()
        assert len(bursts) >= 1

    def test_get_statistics(self, system):
        logger = system.get_logger("test-logger")
        logger.info("Test message")

        stats = system.get_statistics()
        assert stats["total"] == 1

    def test_clear(self, system):
        logger = system.get_logger("test-logger")
        logger.info("Test message")

        system.clear()
        assert len(system.get_aggregator()._entries) == 0


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_log_correlation_system(self):
        system = create_log_correlation_system(service_name="custom-service")
        assert isinstance(system, LogCorrelationSystem)
        assert system._service_name == "custom-service"

    def test_create_log_correlation_system_defaults(self):
        system = create_log_correlation_system()
        assert system._service_name == "geometry-os"

    def test_create_correlated_logger(self):
        logger = create_correlated_logger(
            name="test-logger",
            service_name="custom-service",
            level=LogLevel.DEBUG,
        )
        assert isinstance(logger, CorrelatedLogger)
        assert logger._name == "test-logger"
        assert logger._service_name == "custom-service"
        assert logger._level == LogLevel.DEBUG

    def test_create_correlated_logger_defaults(self):
        logger = create_correlated_logger(name="test-logger")
        assert logger._service_name == "geometry-os"
        assert logger._level == LogLevel.INFO


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
