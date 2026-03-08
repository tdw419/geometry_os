"""
Tests for EvolutionHook and EvolutionHookBroadcaster.

Tests the hook trait system for evolution daemon events:
- EvolutionHook abstract base class
- EvolutionHookBroadcaster for event dispatch
- LoggingEvolutionHook convenience implementation
- CallbackEvolutionHook for callback-based handling
"""

import pytest
import asyncio
import logging
from unittest.mock import Mock, AsyncMock, patch

from systems.evolution_daemon.hooks import (
    EvolutionHook,
    EvolutionHookBroadcaster,
    LoggingEvolutionHook,
    CallbackEvolutionHook,
    PipelineStage,
    PipelineStatus
)


class ConcreteHook(EvolutionHook):
    """Concrete implementation for testing."""

    def __init__(self):
        self.pas_changes = []
        self.pipeline_stages = []
        self.corrections = []

    def on_pas_change(self, old_score: float, new_score: float) -> None:
        self.pas_changes.append((old_score, new_score))

    def on_pipeline_stage(self, stage: str, status: str) -> None:
        self.pipeline_stages.append((stage, status))

    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        self.corrections.append((trigger, action, result))


class TestEvolutionHook:
    """Tests for EvolutionHook base class."""

    def test_cannot_instantiate_abstract(self):
        """EvolutionHook is abstract and cannot be instantiated directly."""
        with pytest.raises(TypeError):
            EvolutionHook()

    def test_concrete_implementation(self):
        """Concrete implementation can be instantiated."""
        hook = ConcreteHook()
        assert hook is not None

    def test_on_pas_change(self):
        """Test on_pas_change records changes."""
        hook = ConcreteHook()
        hook.on_pas_change(0.5, 0.7)
        assert hook.pas_changes == [(0.5, 0.7)]

    def test_on_pipeline_stage(self):
        """Test on_pipeline_stage records stages."""
        hook = ConcreteHook()
        hook.on_pipeline_stage("Scan", "started")
        assert hook.pipeline_stages == [("Scan", "started")]

    def test_on_self_correction(self):
        """Test on_self_correction records corrections."""
        hook = ConcreteHook()
        hook.on_self_correction("low_pas", "rebuild", True)
        assert hook.corrections == [("low_pas", "rebuild", True)]


class TestEvolutionHookBroadcaster:
    """Tests for EvolutionHookBroadcaster."""

    def test_initialization(self):
        """Test broadcaster initialization."""
        broadcaster = EvolutionHookBroadcaster()
        assert broadcaster is not None
        assert len(broadcaster._hooks) == 0

    def test_add_hook(self):
        """Test adding a hook."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)
        assert hook in broadcaster._hooks

    def test_remove_hook(self):
        """Test removing a hook."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)
        result = broadcaster.remove_hook(hook)
        assert result is True
        assert hook not in broadcaster._hooks

    def test_remove_nonexistent_hook(self):
        """Test removing a hook that isn't registered."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        result = broadcaster.remove_hook(hook)
        assert result is False

    def test_broadcast_pas_change(self):
        """Test broadcasting PAS change to all hooks."""
        broadcaster = EvolutionHookBroadcaster()
        hook1 = ConcreteHook()
        hook2 = ConcreteHook()
        broadcaster.add_hook(hook1)
        broadcaster.add_hook(hook2)

        broadcaster.on_pas_change(0.5, 0.8)

        # Give async dispatch time to complete
        import time
        time.sleep(0.1)

        assert hook1.pas_changes == [(0.5, 0.8)]
        assert hook2.pas_changes == [(0.5, 0.8)]

    def test_broadcast_pipeline_stage(self):
        """Test broadcasting pipeline stage to all hooks."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)

        broadcaster.on_pipeline_stage("Reason", "completed")

        import time
        time.sleep(0.1)

        assert hook.pipeline_stages == [("Reason", "completed")]

    def test_broadcast_self_correction(self):
        """Test broadcasting self-correction to all hooks."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)

        broadcaster.on_self_correction("error", "retry", True)

        import time
        time.sleep(0.1)

        assert hook.corrections == [("error", "retry", True)]


class TestLoggingEvolutionHook:
    """Tests for LoggingEvolutionHook."""

    def test_initialization(self):
        """Test LoggingEvolutionHook initialization."""
        hook = LoggingEvolutionHook()
        assert hook is not None
        assert hook._log_level == logging.DEBUG

    def test_custom_log_level(self):
        """Test custom log level."""
        hook = LoggingEvolutionHook(log_level=logging.INFO)
        assert hook._log_level == logging.INFO

    def test_on_pas_change_logs(self, caplog):
        """Test on_pas_change logs the change."""
        hook = LoggingEvolutionHook(log_level=logging.INFO)
        with caplog.at_level(logging.INFO):
            hook.on_pas_change(0.5, 0.7)
        assert "PAS" in caplog.text or "Score" in caplog.text or "0.5" in caplog.text

    def test_on_pipeline_stage_logs(self, caplog):
        """Test on_pipeline_stage logs the stage."""
        hook = LoggingEvolutionHook(log_level=logging.INFO)
        with caplog.at_level(logging.INFO):
            hook.on_pipeline_stage("Scan", "started")
        assert "Pipeline" in caplog.text or "Scan" in caplog.text

    def test_on_self_correction_logs(self, caplog):
        """Test on_self_correction logs the correction."""
        hook = LoggingEvolutionHook(log_level=logging.INFO)
        with caplog.at_level(logging.INFO):
            hook.on_self_correction("trigger", "action", True)
        assert "Correction" in caplog.text or "trigger" in caplog.text


class TestCallbackEvolutionHook:
    """Tests for CallbackEvolutionHook."""

    def test_initialization(self):
        """Test CallbackEvolutionHook initialization."""
        hook = CallbackEvolutionHook()
        assert hook is not None

    def test_pas_callback(self):
        """Test PAS change callback."""
        calls = []
        hook = CallbackEvolutionHook(
            on_pas=lambda o, n: calls.append((o, n))
        )
        hook.on_pas_change(0.3, 0.6)
        assert calls == [(0.3, 0.6)]

    def test_stage_callback(self):
        """Test pipeline stage callback."""
        calls = []
        hook = CallbackEvolutionHook(
            on_stage=lambda s, st: calls.append((s, st))
        )
        hook.on_pipeline_stage("Build", "failed")
        assert calls == [("Build", "failed")]

    def test_correction_callback(self):
        """Test self-correction callback."""
        calls = []
        hook = CallbackEvolutionHook(
            on_correct=lambda t, a, r: calls.append((t, a, r))
        )
        hook.on_self_correction("test", "fix", False)
        assert calls == [("test", "fix", False)]

    def test_no_callback_no_error(self):
        """Test that missing callbacks don't cause errors."""
        hook = CallbackEvolutionHook()
        # These should not raise
        hook.on_pas_change(0.1, 0.2)
        hook.on_pipeline_stage("Scan", "started")
        hook.on_self_correction("x", "y", True)


class TestPipelineStage:
    """Tests for PipelineStage enum."""

    def test_all_stages(self):
        """Test all pipeline stages exist."""
        assert PipelineStage.SCAN.value == "Scan"
        assert PipelineStage.REASON.value == "Reason"
        assert PipelineStage.PATCH.value == "Patch"
        assert PipelineStage.BUILD.value == "Build"


class TestPipelineStatus:
    """Tests for PipelineStatus enum."""

    def test_all_statuses(self):
        """Test all pipeline statuses exist."""
        assert PipelineStatus.STARTED.value == "started"
        assert PipelineStatus.IN_PROGRESS.value == "in_progress"
        assert PipelineStatus.COMPLETED.value == "completed"
        assert PipelineStatus.FAILED.value == "failed"
