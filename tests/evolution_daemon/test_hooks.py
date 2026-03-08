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


class TestAsciiEmitterHook:
    """Tests for AsciiEmitterHook."""

    def test_initialization(self):
        """Test AsciiEmitterHook initialization."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        assert hook._prefix == "[EVOLUTION]"

    def test_custom_prefix(self):
        """Test custom prefix."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook(prefix="[CUSTOM]")
        assert hook._prefix == "[CUSTOM]"

    def test_on_pas_change_excellent(self, capsys):
        """Test PAS change with excellent health."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.85, 0.95)

        captured = capsys.readouterr()
        assert "PAS:" in captured.out
        assert "EXCELLENT" in captured.out

    def test_on_pas_change_good(self, capsys):
        """Test PAS change with good health."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.6, 0.75)

        captured = capsys.readouterr()
        assert "GOOD" in captured.out

    def test_on_pas_change_moderate(self, capsys):
        """Test PAS change with moderate health."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.4, 0.55)

        captured = capsys.readouterr()
        assert "MODERATE" in captured.out

    def test_on_pas_change_critical(self, capsys):
        """Test PAS change with critical health."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.3, 0.35)

        captured = capsys.readouterr()
        assert "CRITICAL" in captured.out

    def test_on_pas_change_negative_delta(self, capsys):
        """Test PAS change with negative delta."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.9, 0.7)

        captured = capsys.readouterr()
        assert "-0.200" in captured.out or "-" in captured.out

    def test_on_pipeline_stage_started(self, capsys):
        """Test pipeline stage started."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pipeline_stage("Scan", "started")

        captured = capsys.readouterr()
        assert "STAGE:" in captured.out
        assert "Scan" in captured.out
        assert "[>]" in captured.out

    def test_on_pipeline_stage_in_progress(self, capsys):
        """Test pipeline stage in progress."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pipeline_stage("Build", "in_progress")

        captured = capsys.readouterr()
        assert "[...]" in captured.out

    def test_on_pipeline_stage_completed(self, capsys):
        """Test pipeline stage completed."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pipeline_stage("Patch", "completed")

        captured = capsys.readouterr()
        assert "[OK]" in captured.out

    def test_on_pipeline_stage_failed(self, capsys):
        """Test pipeline stage failed."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pipeline_stage("Reason", "failed")

        captured = capsys.readouterr()
        assert "[FAIL]" in captured.out

    def test_on_self_correction_success(self, capsys):
        """Test self-correction success."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_self_correction("test_failure", "rollback", True)

        captured = capsys.readouterr()
        assert "CORRECTION:" in captured.out
        assert "OK" in captured.out

    def test_on_self_correction_failure(self, capsys):
        """Test self-correction failure."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_self_correction("error", "retry", False)

        captured = capsys.readouterr()
        assert "FAIL" in captured.out

    def test_pas_history_tracking(self):
        """Test that PAS history is tracked."""
        from systems.evolution_daemon.hooks import AsciiEmitterHook
        hook = AsciiEmitterHook()
        hook.on_pas_change(0.5, 0.6)
        hook.on_pas_change(0.6, 0.7)

        assert 0.6 in hook._pas_history
        assert 0.7 in hook._pas_history


class TestGetEvolutionBroadcaster:
    """Tests for get_evolution_broadcaster singleton."""

    def test_get_broadcaster_returns_instance(self):
        """Test that get_evolution_broadcaster returns an instance."""
        from systems.evolution_daemon.hooks import (
            get_evolution_broadcaster,
            EvolutionHookBroadcaster
        )
        # Reset singleton
        import systems.evolution_daemon.hooks as hooks_module
        hooks_module._default_broadcaster = None

        broadcaster = get_evolution_broadcaster()
        assert isinstance(broadcaster, EvolutionHookBroadcaster)

    def test_get_broadcaster_singleton(self):
        """Test that get_evolution_broadcaster returns singleton."""
        from systems.evolution_daemon.hooks import get_evolution_broadcaster
        import systems.evolution_daemon.hooks as hooks_module
        hooks_module._default_broadcaster = None

        b1 = get_evolution_broadcaster()
        b2 = get_evolution_broadcaster()
        assert b1 is b2

    def test_broadcaster_has_ascii_emitter(self):
        """Test that broadcaster has AsciiEmitterHook by default."""
        from systems.evolution_daemon.hooks import (
            get_evolution_broadcaster,
            AsciiEmitterHook
        )
        import systems.evolution_daemon.hooks as hooks_module
        hooks_module._default_broadcaster = None

        broadcaster = get_evolution_broadcaster()
        # Should have at least the ASCII emitter
        assert len(broadcaster._hooks) >= 1
        assert any(isinstance(h, AsciiEmitterHook) for h in broadcaster._hooks)


class TestEvolutionHookBroadcasterClear:
    """Tests for clear_hooks method."""

    def test_clear_hooks(self):
        """Test clearing all hooks."""
        broadcaster = EvolutionHookBroadcaster()
        hook1 = ConcreteHook()
        hook2 = ConcreteHook()
        broadcaster.add_hook(hook1)
        broadcaster.add_hook(hook2)

        assert len(broadcaster._hooks) == 2
        broadcaster.clear_hooks()
        assert len(broadcaster._hooks) == 0

    def test_clear_hooks_empty(self):
        """Test clearing when already empty."""
        broadcaster = EvolutionHookBroadcaster()
        broadcaster.clear_hooks()  # Should not raise
        assert len(broadcaster._hooks) == 0


class TestEvolutionHookBroadcasterHooksProperty:
    """Tests for hooks property."""

    def test_hooks_returns_copy(self):
        """Test that hooks property returns a copy."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)

        hooks_copy = broadcaster.hooks
        assert hooks_copy == [hook]

        # Modifying copy shouldn't affect original
        hooks_copy.clear()
        assert len(broadcaster._hooks) == 1


class TestEvolutionHookBroadcasterDuplicateAdd:
    """Tests for adding duplicate hooks."""

    def test_add_duplicate_hook(self):
        """Test that duplicate hooks aren't added twice."""
        broadcaster = EvolutionHookBroadcaster()
        hook = ConcreteHook()
        broadcaster.add_hook(hook)
        broadcaster.add_hook(hook)  # Add same hook again

        assert len(broadcaster._hooks) == 1


class TestEvolutionHookBroadcasterErrorHandling:
    """Tests for error handling in broadcaster."""

    def test_safe_call_catches_exceptions(self, caplog):
        """Test that _safe_call catches and logs exceptions from hooks."""
        import time

        broadcaster = EvolutionHookBroadcaster()

        # Create a hook that raises an exception
        class BrokenHook(EvolutionHook):
            def on_pas_change(self, old_score, new_score):
                raise RuntimeError("Hook error!")

            def on_pipeline_stage(self, stage, status):
                pass

            def on_self_correction(self, trigger, action, result):
                pass

        broken_hook = BrokenHook()
        broadcaster.add_hook(broken_hook)

        with caplog.at_level(logging.ERROR):
            broadcaster.on_pas_change(0.5, 0.6)
            time.sleep(0.1)  # Let async dispatch complete

        # Should have logged the error
        assert "BrokenHook" in caplog.text or "Hook error" in caplog.text or "Error" in caplog.text

    def test_dispatch_async_with_running_loop(self):
        """Test _dispatch_async uses running loop when available."""
        broadcaster = EvolutionHookBroadcaster()

        # Add a hook so that _dispatch_async actually gets called
        hook = ConcreteHook()
        broadcaster.add_hook(hook)

        # Create an async context to test with running loop
        async def run_in_async_context():
            import asyncio
            loop = asyncio.get_running_loop()
            assert loop is not None

            # This should use loop.create_task path (line 181)
            tasks_created = []

            original_create_task = loop.create_task

            def tracked_create_task(coro):
                tasks_created.append(coro)
                return original_create_task(coro)

            loop.create_task = tracked_create_task

            try:
                broadcaster.on_pas_change(0.5, 0.7)
                await asyncio.sleep(0.05)
            finally:
                loop.create_task = original_create_task

            # Verify the running loop path was taken
            assert len(tasks_created) >= 1

        import asyncio
        asyncio.run(run_in_async_context())

    def test_dispatch_async_without_running_loop(self, caplog):
        """Test _dispatch_async falls back to sync dispatch when no loop."""
        import time

        broadcaster = EvolutionHookBroadcaster()

        # Add a hook to verify sync dispatch worked
        class SyncHook(EvolutionHook):
            def __init__(self):
                self.pas_changes = []

            def on_pas_change(self, old_score, new_score):
                self.pas_changes.append((old_score, new_score))

            def on_pipeline_stage(self, stage, status):
                pass

            def on_self_correction(self, trigger, action, result):
                pass

        sync_hook = SyncHook()
        broadcaster.add_hook(sync_hook)

        # Call outside async context - should use sync dispatch
        with caplog.at_level(logging.DEBUG):
            broadcaster.on_pas_change(0.5, 0.6)
            time.sleep(0.1)

        # Verify the hook received the event via sync dispatch
        assert sync_hook.pas_changes == [(0.5, 0.6)]

        # Should have logged about no running loop (or completed via sync)
        assert "No running event loop" in caplog.text or sync_hook.pas_changes == [(0.5, 0.6)]


class TestEvolutionHookBroadcasterSyncDispatchError:
    """Tests for sync dispatch error handling."""

    def test_sync_dispatch_error_handling(self, caplog):
        """Test that errors in sync dispatch are logged."""
        import time

        broadcaster = EvolutionHookBroadcaster()

        # Create a hook that raises an exception during sync dispatch
        class SyncErrorHook(EvolutionHook):
            def __init__(self):
                self.called = False

            def on_pas_change(self, old_score, new_score):
                self.called = True
                raise RuntimeError("Sync dispatch error!")

            def on_pipeline_stage(self, stage, status):
                pass

            def on_self_correction(self, trigger, action, result):
                pass

        error_hook = SyncErrorHook()
        broadcaster.add_hook(error_hook)

        with caplog.at_level(logging.ERROR):
            broadcaster.on_pas_change(0.5, 0.6)
            time.sleep(0.1)

        # The hook should have been called
        assert error_hook.called

        # Error should have been logged
        assert "Sync dispatch error" in caplog.text or "Error in sync dispatch" in caplog.text or "Error" in caplog.text
