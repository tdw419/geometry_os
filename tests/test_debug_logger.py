"""
Tests for Debug Logger - Granular logging framework for debugging.
"""

import json
import os
import tempfile
import threading
import time
from pathlib import Path

import pytest

from core.debug_logger import (
    DebugConfig,
    DebugLevel,
    DebugLogger,
    OperationCategory,
    OperationTrace,
    configure_debug_logging,
    debug_error,
    debug_info,
    debug_log,
    get_debug_logger,
    trace,
    traced,
)


class TestDebugLevel:
    """Tests for DebugLevel enum."""

    def test_level_ordering(self):
        """Levels should be ordered by verbosity."""
        assert DebugLevel.OFF.value < DebugLevel.ERROR.value
        assert DebugLevel.ERROR.value < DebugLevel.WARNING.value
        assert DebugLevel.WARNING.value < DebugLevel.INFO.value
        assert DebugLevel.INFO.value < DebugLevel.DEBUG.value
        assert DebugLevel.DEBUG.value < DebugLevel.TRACE.value

    def test_level_values(self):
        """Level values should be correct."""
        assert DebugLevel.OFF.value == 0
        assert DebugLevel.ERROR.value == 1
        assert DebugLevel.WARNING.value == 2
        assert DebugLevel.INFO.value == 3
        assert DebugLevel.DEBUG.value == 4
        assert DebugLevel.TRACE.value == 5


class TestOperationCategory:
    """Tests for OperationCategory enum."""

    def test_category_values(self):
        """Categories should have correct string values."""
        assert OperationCategory.NEURAL_INFERENCE.value == "neural_inference"
        assert OperationCategory.GPU_RENDER.value == "gpu_render"
        assert OperationCategory.FILE_READ.value == "file_read"
        assert OperationCategory.UNKNOWN.value == "unknown"

    def test_all_categories_exist(self):
        """All expected categories should exist."""
        expected = [
            "init", "shutdown",
            "neural_inference", "neural_training", "neural_compile",
            "gpu_render", "gpu_shader", "gpu_memory", "visual_process",
            "evolution_cycle", "evolution_mutate", "evolution_select",
            "file_read", "file_write", "file_parse",
            "network_send", "network_recv", "ipc_call",
            "memory_alloc", "memory_free", "cache_hit", "cache_miss",
            "agent_spawn", "agent_message", "swarm_coord",
            "user_input", "user_output",
            "state_change", "state_query",
            "unknown",
        ]
        actual = [c.value for c in OperationCategory]
        for exp in expected:
            assert exp in actual


class TestOperationTrace:
    """Tests for OperationTrace dataclass."""

    def test_trace_creation(self):
        """Trace should be created with correct values."""
        trace = OperationTrace(
            operation_id="test-123",
            category=OperationCategory.NEURAL_INFERENCE,
            name="test_operation",
            start_time=time.time(),
        )
        assert trace.operation_id == "test-123"
        assert trace.category == OperationCategory.NEURAL_INFERENCE
        assert trace.name == "test_operation"
        assert trace.status == "running"
        assert trace.end_time is None
        assert trace.duration_ms is None

    def test_trace_to_dict(self):
        """Trace should convert to dict correctly."""
        trace = OperationTrace(
            operation_id="test-123",
            category=OperationCategory.GPU_RENDER,
            name="render_frame",
            start_time=1000.0,
            end_time=1001.5,
            duration_ms=1500.0,
            status="success",
            metadata={"frame": 1},
        )
        d = trace.to_dict()
        
        assert d["operation_id"] == "test-123"
        assert d["category"] == "gpu_render"
        assert d["name"] == "render_frame"
        assert d["start_time"] == 1000.0
        assert d["end_time"] == 1001.5
        assert d["duration_ms"] == 1500.0
        assert d["status"] == "success"
        assert d["metadata"]["frame"] == 1

    def test_trace_with_error(self):
        """Trace with error should store error info."""
        trace = OperationTrace(
            operation_id="test-err",
            category=OperationCategory.FILE_READ,
            name="read_config",
            start_time=time.time(),
            status="error",
            error="File not found",
        )
        d = trace.to_dict()
        
        assert d["status"] == "error"
        assert d["error"] == "File not found"


class TestDebugConfig:
    """Tests for DebugConfig."""

    def test_default_config(self):
        """Default config should have sensible values."""
        config = DebugConfig()
        assert config.global_level == DebugLevel.INFO
        assert config.output_to_console is True
        assert config.output_to_file is True
        assert config.slow_operation_threshold_ms == 100.0

    def test_custom_config(self):
        """Custom config values should be set correctly."""
        config = DebugConfig(
            global_level=DebugLevel.DEBUG,
            output_to_console=False,
            slow_operation_threshold_ms=50.0,
        )
        assert config.global_level == DebugLevel.DEBUG
        assert config.output_to_console is False
        assert config.slow_operation_threshold_ms == 50.0

    def test_category_levels(self):
        """Category-specific levels should work."""
        config = DebugConfig(
            global_level=DebugLevel.WARNING,
            category_levels={
                OperationCategory.NEURAL_INFERENCE: DebugLevel.TRACE,
            }
        )
        assert config.global_level == DebugLevel.WARNING
        assert config.category_levels[OperationCategory.NEURAL_INFERENCE] == DebugLevel.TRACE

    def test_subsystem_levels(self):
        """Subsystem-specific levels should work."""
        config = DebugConfig(
            global_level=DebugLevel.INFO,
            subsystem_levels={
                "visual_shell": DebugLevel.TRACE,
            }
        )
        assert config.subsystem_levels["visual_shell"] == DebugLevel.TRACE


class TestDebugLogger:
    """Tests for DebugLogger."""

    @pytest.fixture
    def temp_log_dir(self, tmp_path):
        """Create a temp directory for logs."""
        log_dir = tmp_path / "logs"
        log_dir.mkdir()
        return log_dir

    @pytest.fixture
    def logger(self, temp_log_dir):
        """Create a fresh logger for each test."""
        DebugLogger.reset_instance()
        config = DebugConfig(
            global_level=DebugLevel.TRACE,
            output_to_console=False,
            output_to_file=True,
            output_file=str(temp_log_dir / "test.log"),
            output_json=True,
            json_output_file=str(temp_log_dir / "test.json"),
        )
        return DebugLogger(config)

    @pytest.fixture
    def quiet_logger(self, temp_log_dir):
        """Logger that doesn't output to console."""
        DebugLogger.reset_instance()
        config = DebugConfig(
            global_level=DebugLevel.INFO,
            output_to_console=False,
            output_to_file=True,
            output_file=str(temp_log_dir / "quiet.log"),
        )
        return DebugLogger(config)

    def test_singleton(self, logger):
        """get_instance should return singleton."""
        DebugLogger._instance = logger
        instance = DebugLogger.get_instance()
        assert instance is logger

    def test_reset_instance(self, logger):
        """reset_instance should clear singleton."""
        DebugLogger._instance = logger
        DebugLogger.reset_instance()
        assert DebugLogger._instance is None

    def test_log_levels(self, logger, temp_log_dir):
        """Log messages should respect levels."""
        logger.info("Info message")
        logger.debug("Debug message")
        logger.warning("Warning message")
        logger.error("Error message")
        
        log_file = temp_log_dir / "test.log"
        content = log_file.read_text()
        
        assert "Info message" in content
        assert "Debug message" in content
        assert "Warning message" in content
        assert "Error message" in content

    def test_level_filtering(self, quiet_logger, temp_log_dir):
        """Logger should filter by level."""
        quiet_logger.debug("Should not appear")
        quiet_logger.info("Should appear")
        
        log_file = temp_log_dir / "quiet.log"
        content = log_file.read_text()
        
        assert "Should not appear" not in content
        assert "Should appear" in content

    def test_trace_operation_success(self, logger):
        """Successful operations should be traced."""
        with logger.trace_operation("test_op", OperationCategory.NEURAL_INFERENCE) as trace:
            time.sleep(0.01)  # 10ms
        
        assert trace.status == "success"
        assert trace.duration_ms is not None
        assert trace.duration_ms >= 10  # At least 10ms
        assert trace.end_time is not None

    def test_trace_operation_error(self, logger):
        """Failed operations should record error."""
        with pytest.raises(ValueError):
            with logger.trace_operation("failing_op", OperationCategory.FILE_READ) as trace:
                raise ValueError("Test error")
        
        assert trace.status == "error"
        assert trace.error == "Test error"

    def test_trace_operation_metadata(self, logger):
        """Operations should store metadata."""
        with logger.trace_operation(
            "metadata_op",
            OperationCategory.GPU_RENDER,
            metadata={"frame": 42, "resolution": "1920x1080"}
        ) as trace:
            pass
        
        assert trace.metadata["frame"] == 42
        assert trace.metadata["resolution"] == "1920x1080"

    def test_trace_hierarchy(self, logger):
        """Nested operations should have parent-child relationship."""
        with logger.trace_operation("parent", OperationCategory.UNKNOWN) as parent:
            with logger.trace_operation("child1", OperationCategory.UNKNOWN) as child1:
                pass
            with logger.trace_operation("child2", OperationCategory.UNKNOWN) as child2:
                pass
        
        assert len(parent.children) == 2
        assert child1.parent_id == parent.operation_id
        assert child2.parent_id == parent.operation_id

    def test_trace_function_decorator(self, logger):
        """@traced decorator should work."""
        @logger.trace_function("decorated_func", OperationCategory.AGENT_MESSAGE)
        def my_function(x, y):
            return x + y
        
        result = my_function(1, 2)
        
        assert result == 3
        # Check that trace was recorded
        traces = [t for t in logger._traces.values() if t.name == "decorated_func"]
        assert len(traces) == 1

    def test_trace_function_decorator_error(self, logger):
        """@traced decorator should capture errors."""
        @logger.trace_function("failing_func", OperationCategory.UNKNOWN)
        def failing_func():
            raise RuntimeError("Decorated error")
        
        with pytest.raises(RuntimeError):
            failing_func()
        
        traces = [t for t in logger._traces.values() if t.name == "failing_func"]
        assert len(traces) == 1
        assert traces[0].status == "error"
        assert "Decorated error" in traces[0].error

    def test_get_statistics(self, logger):
        """Statistics should be computed correctly."""
        with logger.trace_operation("op1", OperationCategory.NEURAL_INFERENCE):
            pass
        with logger.trace_operation("op2", OperationCategory.NEURAL_INFERENCE):
            time.sleep(0.01)
        with pytest.raises(Exception):
            with logger.trace_operation("op3", OperationCategory.FILE_READ):
                raise Exception("fail")
        
        stats = logger.get_statistics()
        
        assert stats["total_operations"] >= 3
        assert "neural_inference" in stats["by_category"]
        assert stats["by_status"]["success"] >= 2
        assert stats["by_status"]["error"] >= 1

    def test_get_slow_operations(self, logger):
        """Slow operations should be detected."""
        logger.config.slow_operation_threshold_ms = 5.0
        
        with logger.trace_operation("fast", OperationCategory.UNKNOWN):
            pass
        
        with logger.trace_operation("slow", OperationCategory.UNKNOWN):
            time.sleep(0.01)  # 10ms
        
        slow = logger.get_slow_operations()
        assert len(slow) >= 1
        assert any(t.name == "slow" for t in slow)

    def test_get_errors(self, logger):
        """Errors should be retrievable."""
        with pytest.raises(Exception):
            with logger.trace_operation("error_op", OperationCategory.UNKNOWN):
                raise Exception("test error")
        
        errors = logger.get_errors()
        assert len(errors) >= 1
        assert errors[0].name == "error_op"

    def test_get_traces_by_category(self, logger):
        """Traces should be filterable by category."""
        with logger.trace_operation("neural", OperationCategory.NEURAL_INFERENCE):
            pass
        with logger.trace_operation("gpu", OperationCategory.GPU_RENDER):
            pass
        
        neural_traces = logger.get_traces_by_category(OperationCategory.NEURAL_INFERENCE)
        gpu_traces = logger.get_traces_by_category(OperationCategory.GPU_RENDER)
        
        assert len(neural_traces) >= 1
        assert len(gpu_traces) >= 1

    def test_json_output(self, logger, temp_log_dir):
        """Traces should be written to JSON."""
        with logger.trace_operation("json_test", OperationCategory.UNKNOWN):
            pass
        
        json_file = temp_log_dir / "test.json"
        content = json_file.read_text()
        
        # Should have at least one JSON line
        lines = [l for l in content.strip().split("\n") if l]
        assert len(lines) >= 1
        
        # Should be valid JSON
        data = json.loads(lines[-1])
        assert "operation_id" in data
        assert data["name"] == "json_test"

    def test_thread_safety(self, logger):
        """Logger should be thread-safe."""
        results = []
        
        def worker(worker_id):
            with logger.trace_operation(f"worker_{worker_id}", OperationCategory.UNKNOWN) as trace:
                time.sleep(0.01)
                results.append(trace.operation_id)
        
        threads = [threading.Thread(target=worker, args=(i,)) for i in range(10)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        assert len(results) == 10
        assert len(set(results)) == 10  # All unique

    def test_clear_traces(self, logger):
        """Traces should be clearable."""
        with logger.trace_operation("to_clear", OperationCategory.UNKNOWN):
            pass
        
        assert len(logger._traces) >= 1
        logger.clear_traces()
        assert len(logger._traces) == 0

    def test_max_traces_limit(self, temp_log_dir):
        """Old traces should be trimmed when limit is reached."""
        config = DebugConfig(
            global_level=DebugLevel.DEBUG,
            output_to_console=False,
            output_to_file=False,
            max_traces_in_memory=5,
        )
        logger = DebugLogger(config)
        
        for i in range(10):
            with logger.trace_operation(f"op_{i}", OperationCategory.UNKNOWN):
                pass
        
        assert len(logger._traces) <= 5

    def test_get_trace_tree(self, logger):
        """Trace tree should show hierarchy."""
        with logger.trace_operation("root", OperationCategory.UNKNOWN) as root:
            with logger.trace_operation("child", OperationCategory.UNKNOWN):
                pass
        
        tree = logger.get_trace_tree(root.operation_id)
        
        assert tree["operation_id"] == root.operation_id
        assert len(tree["children"]) == 1
        assert tree["children"][0]["name"] == "child"

    def test_dump_session_report(self, logger, temp_log_dir):
        """Session report should be dumpable."""
        with logger.trace_operation("report_op", OperationCategory.UNKNOWN):
            pass
        
        report_path = str(temp_log_dir / "report.json")
        logger.dump_session_report(report_path)
        
        assert os.path.exists(report_path)
        with open(report_path) as f:
            report = json.load(f)
        
        assert "statistics" in report
        assert "errors" in report
        assert "slow_operations" in report


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    @pytest.fixture
    def setup_logger(self, tmp_path):
        """Set up logger for convenience function tests."""
        DebugLogger.reset_instance()
        config = DebugConfig(
            global_level=DebugLevel.TRACE,
            output_to_console=False,
            output_to_file=True,
            output_file=str(tmp_path / "logs" / "test.log"),
        )
        DebugLogger._instance = DebugLogger(config)
        yield
        DebugLogger.reset_instance()

    def test_get_debug_logger(self, setup_logger):
        """get_debug_logger should return singleton."""
        logger1 = get_debug_logger()
        logger2 = get_debug_logger()
        assert logger1 is logger2

    def test_trace_context_manager(self, setup_logger):
        """trace() shorthand should work."""
        with trace("shorthand_op", OperationCategory.GPU_SHADER) as t:
            pass
        
        assert t.status == "success"

    def test_traced_decorator(self, setup_logger):
        """traced() decorator shorthand should work."""
        @traced("shorthand_func")
        def my_func():
            return 42
        
        result = my_func()
        assert result == 42
        
        traces = [t for t in get_debug_logger()._traces.values() 
                  if t.name == "shorthand_func"]
        assert len(traces) >= 1

    def test_debug_log(self, setup_logger, tmp_path):
        """debug_log() shorthand should work."""
        debug_log("test debug message", OperationCategory.UNKNOWN)
        
        log_file = tmp_path / "logs" / "test.log"
        content = log_file.read_text()
        assert "test debug message" in content

    def test_debug_info(self, setup_logger, tmp_path):
        """debug_info() shorthand should work."""
        debug_info("test info message", OperationCategory.UNKNOWN)
        
        log_file = tmp_path / "logs" / "test.log"
        content = log_file.read_text()
        assert "test info message" in content

    def test_debug_error(self, setup_logger, tmp_path):
        """debug_error() shorthand should work."""
        debug_error("test error message", OperationCategory.UNKNOWN)
        
        log_file = tmp_path / "logs" / "test.log"
        content = log_file.read_text()
        assert "test error message" in content

    def test_configure_debug_logging(self, tmp_path):
        """configure_debug_logging should configure and return logger."""
        DebugLogger.reset_instance()
        
        logger = configure_debug_logging(
            global_level=DebugLevel.DEBUG,
            output_to_console=False,
            output_file=str(tmp_path / "configured.log"),
        )
        
        assert logger.config.global_level == DebugLevel.DEBUG
        assert logger is DebugLogger.get_instance()


class TestIntegration:
    """Integration tests for debug logger."""

    @pytest.fixture
    def setup_logger(self, tmp_path):
        """Set up logger for integration tests."""
        DebugLogger.reset_instance()
        config = DebugConfig(
            global_level=DebugLevel.TRACE,
            output_to_console=False,
            output_to_file=True,
            output_file=str(tmp_path / "integration.log"),
            output_json=True,
            json_output_file=str(tmp_path / "integration.json"),
            slow_operation_threshold_ms=10.0,
        )
        return DebugLogger(config)

    def test_complex_operation_flow(self, setup_logger):
        """Test a complex flow with nested operations."""
        logger = setup_logger
        
        with logger.trace_operation("process_request", OperationCategory.NETWORK_RECV,
                                    metadata={"request_id": "req-123"}):
            
            # Parse input
            with logger.trace_operation("parse_input", OperationCategory.FILE_PARSE):
                time.sleep(0.005)
            
            # Run inference
            with logger.trace_operation("neural_inference", OperationCategory.NEURAL_INFERENCE,
                                        metadata={"model": "gpt-neo"}):
                time.sleep(0.015)  # Slow operation
            
            # Render result
            with logger.trace_operation("render_output", OperationCategory.GPU_RENDER):
                time.sleep(0.005)
        
        # Check statistics
        stats = logger.get_statistics()
        assert stats["total_operations"] == 4
        
        # Check for slow operation
        slow = logger.get_slow_operations()
        assert len(slow) >= 1
        assert any(t.name == "neural_inference" for t in slow)
        
        # Check hierarchy
        process_traces = [t for t in logger._traces.values() if t.name == "process_request"]
        assert len(process_traces) == 1
        assert len(process_traces[0].children) == 3

    def test_error_recovery_tracking(self, setup_logger):
        """Test tracking of errors and recovery."""
        logger = setup_logger
        
        # First attempt fails
        with pytest.raises(ConnectionError):
            with logger.trace_operation("network_call", OperationCategory.NETWORK_SEND,
                                        metadata={"attempt": 1}):
                raise ConnectionError("Network unreachable")
        
        # Retry succeeds
        with logger.trace_operation("network_call", OperationCategory.NETWORK_SEND,
                                    metadata={"attempt": 2}):
            pass
        
        errors = logger.get_errors()
        assert len(errors) == 1
        assert errors[0].metadata["attempt"] == 1

    def test_concurrent_operations(self, setup_logger):
        """Test concurrent operations in different threads."""
        logger = setup_logger
        
        def worker(worker_id):
            with logger.trace_operation(f"worker_{worker_id}", OperationCategory.AGENT_SPAWN):
                for i in range(3):
                    with logger.trace_operation(f"task_{i}", OperationCategory.AGENT_MESSAGE):
                        time.sleep(0.005)
        
        threads = [threading.Thread(target=worker, args=(i,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        stats = logger.get_statistics()
        assert stats["by_category"]["agent_spawn"]["count"] == 3
        assert stats["by_category"]["agent_message"]["count"] == 9


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
