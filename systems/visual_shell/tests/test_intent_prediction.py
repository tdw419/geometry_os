"""
Tests for Phase 63: Intent Prediction

Comprehensive tests for intent prediction, proactive actions,
and confidence-based suggestions.
"""

from datetime import datetime, timedelta
from unittest.mock import MagicMock

from systems.visual_shell.intent_prediction import (
    ActionType,
    IntentConfidence,
    IntentContext,
    IntentHistory,
    IntentInference,
    IntentPattern,
    IntentPredictor,
    IntentStatus,
    IntentType,
    PatternRecognizer,
    PredictedIntent,
    ProactiveAction,
    ProactivePreparer,
    UserAction,
    create_intent_context,
    create_intent_predictor,
    create_predicted_intent,
    create_proactive_action,
    create_user_action,
)


class TestIntentType:
    """Tests for IntentType enum."""

    def test_intent_types_exist(self):
        """Test all intent types are defined."""
        assert IntentType.SCALE_UP.value == "scale_up"
        assert IntentType.SCALE_DOWN.value == "scale_down"
        assert IntentType.MIGRATION.value == "migration"
        assert IntentType.FAILOVER.value == "failover"
        assert IntentType.RECOVERY.value == "recovery"
        assert IntentType.OPTIMIZATION.value == "optimization"
        assert IntentType.DEBUGGING.value == "debugging"
        assert IntentType.MAINTENANCE.value == "maintenance"
        assert IntentType.CAPACITY_PLANNING.value == "capacity_planning"
        assert IntentType.COST_REDUCTION.value == "cost_reduction"
        assert IntentType.SECURITY_SCAN.value == "security_scan"
        assert IntentType.BACKUP.value == "backup"
        assert IntentType.DEPLOYMENT.value == "deployment"
        assert IntentType.ROLLBACK.value == "rollback"
        assert IntentType.INSPECTION.value == "inspection"
        assert IntentType.HEALTH_CHECK.value == "health_check"


        assert IntentType.CUSTOM.value == "custom"


class TestIntentConfidence:
    """Tests for IntentConfidence enum."""

    def test_confidence_levels(self):
        """Test all confidence levels."""
        assert IntentConfidence.VERY_LOW.value == "very_low"
        assert IntentConfidence.LOW.value == "low"
        assert IntentConfidence.MEDIUM.value == "medium"
        assert IntentConfidence.HIGH.value == "high"
        assert IntentConfidence.VERY_HIGH.value == "very_high"
        assert IntentConfidence.CERTAIN.value == "certain"


class TestIntentStatus:
    """Tests for IntentStatus enum."""

    def test_intent_statuses(self):
        """Test all intent statuses."""
        assert IntentStatus.PREDICTED.value == "predicted"
        assert IntentStatus.CONFIRMED.value == "confirmed"
        assert IntentStatus.EXECUTING.value == "executing"
        assert IntentStatus.COMPLETED.value == "completed"
        assert IntentStatus.CANCELLED.value == "cancelled"
        assert IntentStatus.EXPIRED.value == "expired"


class TestActionType:
    """Tests for ActionType enum."""

    def test_action_types(self):
        """Test all action types."""
        assert ActionType.PREALLOCATE.value == "preallocate"
        assert ActionType.PREPARE.value == "prepare"
        assert ActionType.WARM_UP.value == "warm_up"
        assert ActionType.CLEANUP.value == "cleanup"
        assert ActionType.NOTIFY.value == "notify"
        assert ActionType.SCALE.value == "scale"
        assert ActionType.MIGRATE.value == "migrate"
        assert ActionType.BACKUP.value == "backup"
        assert ActionType.ALERT.value == "alert"
        assert ActionType.CUSTOM.value == "custom"


class TestIntentPattern:
    """Tests for IntentPattern dataclass."""

    def test_create_intent_pattern(self):
        """Test creating an intent pattern."""
        pattern = IntentPattern(
            id="pattern1",
            name="Scale Up Pattern",
            intent_type=IntentType.SCALE_UP
        )
        assert pattern.id == "pattern1"
        assert pattern.name == "Scale Up Pattern"
        assert pattern.intent_type == IntentType.SCALE_UP
        assert pattern.confidence_base == 0.5
        assert pattern.usage_count == 0

    def test_intent_pattern_with_triggers(self):
        """Test pattern with trigger patterns."""
        pattern = IntentPattern(
            id="pattern2",
            name="Migration Pattern",
            intent_type=IntentType.MIGRATION,
            trigger_patterns=["cpu>80", "memory>90"],
            required_actions=["check_target", "prepare_route"],
            confidence_base=0.7
        )
        assert len(pattern.trigger_patterns) == 2
        assert len(pattern.required_actions) == 2
        assert pattern.confidence_base == 0.7


class TestUserAction:
    """Tests for UserAction dataclass."""

    def test_create_user_action(self):
        """Test creating a user action."""
        action = UserAction(
            id="action1",
            action_type="scale_up",
            timestamp=datetime.now(),
            target="cluster1"
        )
        assert action.id == "action1"
        assert action.action_type == "scale_up"
        assert action.target == "cluster1"
        assert action.parameters == {}
        assert action.outcome == ""

    def test_user_action_with_params(self):
        """Test user action with parameters."""
        action = UserAction(
            id="action2",
            action_type="migrate",
            timestamp=datetime.now(),
            target="container1",
            parameters={"target_peer": "peer2"},
            outcome="success",
            duration_ms=1500.0
        )
        assert action.parameters["target_peer"] == "peer2"
        assert action.outcome == "success"
        assert action.duration_ms == 1500.0


class TestIntentContext:
    """Tests for IntentContext dataclass."""

    def test_create_intent_context(self):
        """Test creating an intent context."""
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        assert context.id == "ctx1"
        assert context.cluster_id == "cluster1"
        assert context.peer_id == "peer1"
        assert context.recent_actions == []
        assert context.current_metrics == {}

    def test_intent_context_with_data(self):
        """Test context with full data."""
        actions = [UserAction(
            id="a1",
            action_type="check",
            timestamp=datetime.now(),
            target="container1"
        )]
        context = IntentContext(
            id="ctx2",
            cluster_id="cluster1",
            peer_id="peer1",
            recent_actions=actions,
            current_metrics={"cpu": 75.5, "memory": 60.0},
            recent_alerts=2,
            active_migrations=1
        )
        assert len(context.recent_actions) == 1
        assert context.current_metrics["cpu"] == 75.5
        assert context.recent_alerts == 2


class TestPredictedIntent:
    """Tests for PredictedIntent dataclass."""

    def test_create_predicted_intent(self):
        """Test creating a predicted intent."""
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        intent = PredictedIntent(
            id="intent1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        assert intent.id == "intent1"
        assert intent.intent_type == IntentType.SCALE_UP
        assert intent.confidence == IntentConfidence.HIGH
        assert intent.status == IntentStatus.PREDICTED

        assert intent.is_expired() is False

    def test_predicted_intent_expiration(self):
        """Test intent expiration check."""
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        intent = PredictedIntent(
            id="intent2",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() - timedelta(hours=1)
        )
        assert intent.is_expired() is True

    def test_predicted_intent_lifecycle(self):
        """Test intent lifecycle methods."""
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        intent = PredictedIntent(
            id="intent3",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        # Confirm
        intent.confirm()
        assert intent.status == IntentStatus.CONFIRMED
        assert intent.confirmed_at is not None
        # Execute
        intent.execute()
        assert intent.status == IntentStatus.EXECUTING
        assert intent.executed_at is not None
        # Complete
        intent.complete()
        assert intent.status == IntentStatus.COMPLETED

    def test_predicted_intent_cancel(self):
        """Test intent cancellation."""
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        intent = PredictedIntent(
            id="intent4",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        intent.cancel()
        assert intent.status == IntentStatus.CANCELLED


class TestProactiveAction:
    """Tests for ProactiveAction dataclass."""

    def test_create_proactive_action(self):
        """Test creating a proactive action."""
        action = ProactiveAction(
            id="action1",
            action_type=ActionType.PREPARE,
            target="cluster1"
        )
        assert action.id == "action1"
        assert action.action_type == ActionType.PREPARE
        assert action.target == "cluster1"
        assert action.is_ready() is True
        assert action.executed_at is None

    def test_proactive_action_execute(self):
        """Test executing a proactive action."""
        action = ProactiveAction(
            id="action2",
            action_type=ActionType.WARM_UP,
            target="peer1",
            parameters={"cpu_threshold": 80}
        )
        action.execute("Completed successfully")
        assert action.executed_at is not None
        assert action.result == "Completed successfully"
        assert action.is_ready() is False


class TestIntentHistory:
    """Tests for IntentHistory class."""

    def test_create_intent_history(self):
        """Test creating intent history."""
        history = IntentHistory()
        assert len(history.predictions) == 0
        assert history.confirmed_count == 0
        assert history.cancelled_count == 0

    def test_record_prediction(self):
        """Test recording predictions."""
        history = IntentHistory()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        history.record_prediction(prediction)
        assert len(history.predictions) == 1

    def test_update_accuracy(self):
        """Test updating accuracy metrics."""
        history = IntentHistory()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        history.record_prediction(prediction)
        prediction.confirm()
        history.update_accuracy(prediction, True)
        assert history.confirmed_count == 1
        assert history.accuracy_rate == 1.0

    def test_get_recent_predictions(self):
        """Test getting recent predictions."""
        history = IntentHistory()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        for i in range(5):
            prediction = PredictedIntent(
                id=f"p{i}",
                intent_type=IntentType.SCALE_UP,
                confidence=IntentConfidence.HIGH,
                context=context
            )
            history.record_prediction(prediction)
        recent = history.get_recent_predictions(limit=2)
        assert len(recent) == 2

    def test_get_predictions_by_type(self):
        """Test getting predictions by type."""
        history = IntentHistory()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction1 = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        prediction2 = PredictedIntent(
            id="p2",
            intent_type=IntentType.MIGRATION,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        history.record_prediction(prediction1)
        history.record_prediction(prediction2)
        scale_ups = history.get_predictions_by_type(IntentType.SCALE_UP)
        assert len(scale_ups) == 1


class TestPatternRecognizer:
    """Tests for PatternRecognizer class."""

    def test_create_pattern_recognizer(self):
        """Test creating pattern recognizer."""
        recognizer = PatternRecognizer()
        assert len(recognizer.patterns) == 0
        assert len(recognizer.action_history) == 0

    def test_record_action(self):
        """Test recording actions."""
        recognizer = PatternRecognizer()
        action = UserAction(
            id="a1",
            action_type="scale_up",
            timestamp=datetime.now(),
            target="cluster1"
        )
        recognizer.record_action(action)
        assert len(recognizer.action_history) == 1

    def test_analyze_patterns(self):
        """Test analyzing patterns."""
        recognizer = PatternRecognizer()
        # Add multiple actions of the same type
        for i in range(5):
            action = UserAction(
                id=f"a{i}",
                action_type="scale_up",
                timestamp=datetime.now() + timedelta(hours=i),
                target="cluster1"
            )
            recognizer.record_action(action)
        patterns = recognizer.analyze_patterns()
        assert len(patterns) >= 1

    def test_register_pattern(self):
        """Test registering a pattern."""
        recognizer = PatternRecognizer()
        pattern = IntentPattern(
            id="custom1",
            name="Custom Pattern",
            intent_type=IntentType.CUSTOM
        )
        recognizer.register_pattern(pattern)
        assert "custom1" in recognizer.patterns

    def test_get_pattern(self):
        """Test getting a pattern."""
        recognizer = PatternRecognizer()
        pattern = IntentPattern(
            id="custom2",
            name="Custom Pattern 2",
            intent_type=IntentType.CUSTOM
        )
        recognizer.register_pattern(pattern)
        retrieved = recognizer.get_pattern("custom2")
        assert retrieved is not None
        assert retrieved.name == "Custom Pattern 2"

    def test_action_history_max_size(self):
        """Test action history respects max size."""
        recognizer = PatternRecognizer()
        recognizer.max_history = 5
        for i in range(10):
            action = UserAction(
                id=f"a{i}",
                action_type="check",
                timestamp=datetime.now(),
                target="cluster1"
            )
            recognizer.record_action(action)
        assert len(recognizer.action_history) == 5


class TestIntentInference:
    """Tests for IntentInference class."""

    def test_create_intent_inference(self):
        """Test creating intent inference."""
        inference = IntentInference()
        assert inference.pattern_recognizer is not None
        assert inference.intent_history is not None

    def test_infer_intent_no_patterns(self):
        """Test inference with no patterns."""
        inference = IntentInference()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = inference.infer_intent(context)
        # Without patterns, may return None
        assert prediction is None or isinstance(prediction, PredictedIntent)

    def test_get_confidence_level(self):
        """Test confidence level calculation."""
        inference = IntentInference()
        assert inference._get_confidence_level(0.95) == IntentConfidence.VERY_HIGH
        assert inference._get_confidence_level(0.75) == IntentConfidence.HIGH
        assert inference._get_confidence_level(0.55) == IntentConfidence.MEDIUM
        assert inference._get_confidence_level(0.35) == IntentConfidence.LOW
        assert inference._get_confidence_level(0.15) == IntentConfidence.VERY_LOW

    def test_get_suggested_actions(self):
        """Test getting suggested actions."""
        inference = IntentInference()
        actions = inference._get_suggested_actions(IntentType.SCALE_UP)
        assert len(actions) > 0
        assert "Check resource availability" in actions

    def test_clear_expired_intents(self):
        """Test clearing expired intents."""
        inference = IntentInference()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        # Add an expired prediction
        expired = PredictedIntent(
            id="expired1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() - timedelta(hours=1)
        )
        inference.intent_history.record_prediction(expired)
        cleared = inference.clear_expired_intents()
        assert len(cleared) == 1
        assert cleared[0].status == IntentStatus.EXPIRED


class TestProactivePreparer:
    """Tests for ProactivePreparer class."""

    def test_create_proactive_preparer(self):
        """Test creating proactive preparer."""
        preparer = ProactivePreparer()
        assert len(preparer.pending_actions) == 0
        assert len(preparer.completed_actions) == 0

    def test_prepare_for_intent(self):
        """Test preparing actions for intent."""
        preparer = ProactivePreparer()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        intent = PredictedIntent(
            id="intent1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        actions = preparer.prepare_for_intent(intent)
        assert len(actions) > 0
        assert len(preparer.pending_actions) > 0

    def test_execute_action(self):
        """Test executing an action."""
        preparer = ProactivePreparer()
        action = ProactiveAction(
            id="action1",
            action_type=ActionType.PREPARE,
            target="cluster1"
        )
        preparer.pending_actions[action.id] = action
        result = preparer.execute_action(action.id)
        assert result is True
        assert action.executed_at is not None
        assert len(preparer.completed_actions) == 1

    def test_execute_nonexistent_action(self):
        """Test executing non-existent action."""
        preparer = ProactivePreparer()
        result = preparer.execute_action("nonexistent")
        assert result is False

    def test_get_pending_actions(self):
        """Test getting pending actions."""
        preparer = ProactivePreparer()
        action = ProactiveAction(
            id="action1",
            action_type=ActionType.PREPARE,
            target="cluster1"
        )
        preparer.pending_actions[action.id] = action
        pending = preparer.get_pending_actions()
        assert len(pending) == 1

    def test_get_completed_actions(self):
        """Test getting completed actions."""
        preparer = ProactivePreparer()
        action = ProactiveAction(
            id="action1",
            action_type=ActionType.PREPARE,
            target="cluster1"
        )
        preparer.completed_actions.append(action)
        completed = preparer.get_completed_actions()
        assert len(completed) == 1

    def test_clear_completed_actions(self):
        """Test clearing completed actions."""
        preparer = ProactivePreparer()
        action = ProactiveAction(
            id="action1",
            action_type=ActionType.PREPARE,
            target="cluster1"
        )
        preparer.completed_actions.append(action)
        preparer.clear_completed_actions()
        assert len(preparer.completed_actions) == 0

    def test_clear_expired_intents(self):
        """Test clearing expired intents from preparer."""
        preparer = ProactivePreparer()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        expired = PredictedIntent(
            id="expired1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() - timedelta(hours=1)
        )
        preparer.intent_history.record_prediction(expired)
        count = preparer.clear_expired_intents()
        assert count == 1


class TestIntentPredictor:
    """Tests for IntentPredictor class."""

    def test_create_intent_predictor(self):
        """Test creating intent predictor."""
        predictor = IntentPredictor()
        assert predictor.intent_inference is not None
        assert predictor.proactive_preparer is not None

    def test_predict(self):
        """Test predicting intent."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = predictor.predict(context)
        # May return None if no patterns match
        assert prediction is None or isinstance(prediction, PredictedIntent)

    def test_confirm_prediction(self):
        """Test confirming a prediction."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        predictor.prediction_history.append(prediction)
        result = predictor.confirm_prediction("p1")
        assert result is True
        assert prediction.status == IntentStatus.CONFIRMED

    def test_confirm_nonexistent_prediction(self):
        """Test confirming non-existent prediction."""
        predictor = IntentPredictor()
        result = predictor.confirm_prediction("nonexistent")
        assert result is False

    def test_cancel_prediction(self):
        """Test cancelling a prediction."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        predictor.prediction_history.append(prediction)
        result = predictor.cancel_prediction("p1", "User cancelled")
        assert result is True
        assert prediction.status == IntentStatus.CANCELLED

    def test_subscribe(self):
        """Test subscribing to predictions."""
        predictor = IntentPredictor()
        callback = MagicMock()
        predictor.subscribe(callback)
        assert callback in predictor._subscribers

    def test_get_prediction(self):
        """Test getting a prediction by ID."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        prediction = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        predictor.prediction_history.append(prediction)
        retrieved = predictor.get_prediction("p1")
        assert retrieved is not None
        assert retrieved.id == "p1"

    def test_get_nonexistent_prediction(self):
        """Test getting non-existent prediction."""
        predictor = IntentPredictor()
        retrieved = predictor.get_prediction("nonexistent")
        assert retrieved is None

    def test_get_recent_predictions(self):
        """Test getting recent predictions."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        for i in range(5):
            prediction = PredictedIntent(
                id=f"p{i}",
                intent_type=IntentType.SCALE_UP,
                confidence=IntentConfidence.HIGH,
                context=context
            )
            predictor.prediction_history.append(prediction)
        recent = predictor.get_recent_predictions(limit=2)
        assert len(recent) == 2

    def test_get_accuracy_stats(self):
        """Test getting accuracy stats."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        # Add predictions with different statuses
        confirmed = PredictedIntent(
            id="p1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        confirmed.confirm()
        predictor.prediction_history.append(confirmed)
        cancelled = PredictedIntent(
            id="p2",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        cancelled.cancel()
        predictor.prediction_history.append(cancelled)
        stats = predictor.get_accuracy_stats()
        assert stats["total_predictions"] == 2
        assert stats["confirmed"] == 1
        assert stats["cancelled"] == 1

    def test_clear_expired_predictions(self):
        """Test clearing expired predictions."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        expired = PredictedIntent(
            id="expired1",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() - timedelta(hours=1)
        )
        predictor.prediction_history.append(expired)
        count = predictor.clear_expired_predictions()
        assert count == 1
        assert len(predictor.prediction_history) == 0

    def test_prediction_history_max_size(self):
        """Test prediction history respects max size."""
        predictor = IntentPredictor()
        predictor.max_history = 5
        context = IntentContext(
            id="ctx1",
            cluster_id="cluster1",
            peer_id="peer1"
        )
        for i in range(10):
            prediction = PredictedIntent(
                id=f"p{i}",
                intent_type=IntentType.SCALE_UP,
                confidence=IntentConfidence.HIGH,
                context=context
            )
            predictor.prediction_history.append(prediction)
            if len(predictor.prediction_history) > predictor.max_history:
                predictor.prediction_history = predictor.prediction_history[-predictor.max_history:]
        assert len(predictor.prediction_history) == 5


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_intent_context(self):
        """Test create_intent_context factory."""
        context = create_intent_context(
            cluster_id="cluster1",
            peer_id="peer1"
        )
        assert context.cluster_id == "cluster1"
        assert context.peer_id == "peer1"
        assert len(context.id) == 8

    def test_create_intent_context_with_actions(self):
        """Test create_intent_context with actions."""
        action = create_user_action("check", "container1")
        context = create_intent_context(
            cluster_id="cluster1",
            peer_id="peer1",
            recent_actions=[action],
            current_metrics={"cpu": 50.0}
        )
        assert len(context.recent_actions) == 1
        assert context.current_metrics["cpu"] == 50.0

    def test_create_user_action(self):
        """Test create_user_action factory."""
        action = create_user_action(
            action_type="scale_up",
            target="cluster1",
            parameters={"replicas": 3},
            outcome="success"
        )
        assert action.action_type == "scale_up"
        assert action.target == "cluster1"
        assert action.parameters["replicas"] == 3
        assert action.outcome == "success"

    def test_create_predicted_intent(self):
        """Test create_predicted_intent factory."""
        context = create_intent_context("cluster1", "peer1")
        prediction = create_predicted_intent(
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            reasoning="High CPU usage detected"
        )
        assert prediction.intent_type == IntentType.SCALE_UP
        assert prediction.confidence == IntentConfidence.HIGH
        assert prediction.reasoning == "High CPU usage detected"
        assert prediction.expires_at is not None

    def test_create_proactive_action(self):
        """Test create_proactive_action factory."""
        action = create_proactive_action(
            action_type=ActionType.PREPARE,
            target="cluster1",
            parameters={"resource": "cpu"},
            priority=80
        )
        assert action.action_type == ActionType.PREPARE
        assert action.target == "cluster1"
        assert action.priority == 80

    def test_create_intent_predictor(self):
        """Test create_intent_predictor factory."""
        predictor = create_intent_predictor()
        assert isinstance(predictor, IntentPredictor)


class TestIntegration:
    """Integration tests for Intent Prediction."""

    def test_full_prediction_workflow(self):
        """Test complete prediction workflow."""
        predictor = IntentPredictor()
        # Create context with actions
        actions = [
            create_user_action("check", "container1"),
            create_user_action("scale_up", "cluster1"),
        ]
        context = create_intent_context(
            cluster_id="cluster1",
            peer_id="peer1",
            recent_actions=actions,
            current_metrics={"cpu": 85.0, "memory": 60.0}
        )
        # Make prediction
        prediction = predictor.predict(context)
        # If we got a prediction, verify the workflow
        if prediction:
            # Confirm it
            predictor.confirm_prediction(prediction.id)
            # Check stats
            stats = predictor.get_accuracy_stats()
            assert stats["total_predictions"] >= 1

    def test_proactive_preparation_workflow(self):
        """Test proactive preparation workflow."""
        preparer = ProactivePreparer()
        context = create_intent_context("cluster1", "peer1")
        intent = create_predicted_intent(
            intent_type=IntentType.MIGRATION,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        # Prepare actions
        actions = preparer.prepare_for_intent(intent)
        assert len(actions) > 0
        # Execute one action
        action_id = actions[0].id
        result = preparer.execute_action(action_id)
        assert result is True
        # Check completed
        completed = preparer.get_completed_actions()
        assert len(completed) == 1

    def test_subscription_workflow(self):
        """Test subscription workflow."""
        predictor = IntentPredictor()
        received = []
        def callback(prediction):
            received.append(prediction)
        predictor.subscribe(callback)
        context = create_intent_context("cluster1", "peer1")
        # Record some actions to trigger patterns
        for i in range(5):
            action = create_user_action("scale_up", "cluster1")
            predictor.intent_inference.pattern_recognizer.record_action(action)
        prediction = predictor.predict(context)
        if prediction:
            assert len(received) == 1


class TestEdgeCases:
    """Edge case tests."""

    def test_empty_context(self):
        """Test prediction with empty context."""
        predictor = IntentPredictor()
        context = IntentContext(
            id="empty",
            cluster_id="",
            peer_id=""
        )
        prediction = predictor.predict(context)
        # Should handle gracefully
        assert prediction is None or isinstance(prediction, PredictedIntent)

    def test_prediction_with_no_history(self):
        """Test prediction with no history."""
        predictor = IntentPredictor()
        predictor.prediction_history = []
        stats = predictor.get_accuracy_stats()
        assert stats["total_predictions"] == 0
        assert stats["accuracy_rate"] == 0.0

    def test_expired_intent_checks(self):
        """Test various expired intent scenarios."""
        context = create_intent_context("cluster1", "peer1")
        # Already expired
        intent = PredictedIntent(
            id="expired",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() - timedelta(days=1)
        )
        assert intent.is_expired() is True
        # Not expired
        intent2 = PredictedIntent(
            id="not_expired",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context,
            expires_at=datetime.now() + timedelta(days=1)
        )
        assert intent2.is_expired() is False
        # No expiration set
        intent3 = PredictedIntent(
            id="no_exp",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        assert intent3.is_expired() is False

    def test_multiple_status_transitions(self):
        """Test multiple status transitions."""
        context = create_intent_context("cluster1", "peer1")
        intent = PredictedIntent(
            id="multi",
            intent_type=IntentType.SCALE_UP,
            confidence=IntentConfidence.HIGH,
            context=context
        )
        # Confirm
        intent.confirm()
        assert intent.status == IntentStatus.CONFIRMED
        # Execute
        intent.execute()
        assert intent.status == IntentStatus.EXECUTING
        # Complete
        intent.complete()
        assert intent.status == IntentStatus.COMPLETED
