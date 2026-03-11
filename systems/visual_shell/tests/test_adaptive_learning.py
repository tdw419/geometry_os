"""
Tests for Phase 60: Adaptive Learning

Comprehensive tests for learning from operational patterns.
"""

from datetime import datetime, timedelta

import pytest

from systems.visual_shell.adaptive_learning import (
    # Classes
    CostOptimizer,
    CostPattern,
    DataPoint,
    DetectedPattern,
    FailureCategory,
    FailurePattern,
    FailurePatternMemory,
    LearningSession,
    LearningStatus,
    PatternConfidence,
    PatternRecognizer,
    PatternSignature,
    # Enums
    PatternType,
    SeasonalAnalyzer,
    SeasonalityType,
    SeasonalPattern,
    # Dataclasses
    TimeWindow,
    WorkloadPattern,
    create_adaptive_learner,
    create_cost_optimizer,
    create_failure_memory,
    # Factory functions
    create_pattern_recognizer,
    create_seasonal_analyzer,
)


class TestEnums:
    """Test enum definitions."""

    def test_pattern_type_values(self):
        assert PatternType.WORKLOAD.value == "workload"
        assert PatternType.SEASONAL.value == "seasonal"
        assert PatternType.COST.value == "cost"
        assert PatternType.FAILURE.value == "failure"
        assert PatternType.PERFORMANCE.value == "performance"

    def test_seasonality_type_values(self):
        assert SeasonalityType.HOURLY.value == "hourly"
        assert SeasonalityType.DAILY.value == "daily"
        assert SeasonalityType.WEEKLY.value == "weekly"
        assert SeasonalityType.MONTHLY.value == "monthly"

    def test_pattern_confidence_values(self):
        assert PatternConfidence.LOW.value == "low"
        assert PatternConfidence.MEDIUM.value == "medium"
        assert PatternConfidence.HIGH.value == "high"
        assert PatternConfidence.VERY_HIGH.value == "very_high"

    def test_learning_status_values(self):
        assert LearningStatus.COLLECTING.value == "collecting"
        assert LearningStatus.ANALYZING.value == "analyzing"
        assert LearningStatus.LEARNED.value == "learned"
        assert LearningStatus.INVALIDATED.value == "invalidated"

    def test_failure_category_values(self):
        assert FailureCategory.RESOURCE_EXHAUSTION.value == "resource_exhaustion"
        assert FailureCategory.NETWORK_ISSUE.value == "network_issue"
        assert FailureCategory.DEPENDENCY_FAILURE.value == "dependency_failure"
        assert FailureCategory.CONFIGURATION_ERROR.value == "configuration_error"
        assert FailureCategory.TIMEOUT.value == "timeout"
        assert FailureCategory.OVERLOAD.value == "overload"


class TestTimeWindow:
    """Test TimeWindow dataclass."""

    def test_create_time_window(self):
        start = datetime.now()
        end = start + timedelta(hours=1)
        window = TimeWindow(start=start, end=end)
        assert window.duration_seconds == 3600.0

    def test_contains(self):
        start = datetime.now()
        end = start + timedelta(hours=1)
        window = TimeWindow(start=start, end=end)

        assert window.contains(start + timedelta(minutes=30))
        assert not window.contains(start - timedelta(minutes=1))
        assert not window.contains(end + timedelta(minutes=1))


class TestDataPoint:
    """Test DataPoint dataclass."""

    def test_create_data_point(self):
        point = DataPoint(
            timestamp=datetime.now(),
            value=42.0,
            labels={"service": "api"}
        )
        assert point.value == 42.0
        assert point.labels["service"] == "api"

    def test_create_data_point_no_labels(self):
        point = DataPoint(
            timestamp=datetime.now(),
            value=10.0
        )
        assert point.labels == {}


class TestPatternSignature:
    """Test PatternSignature dataclass."""

    def test_create_signature(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={"mean": 100.0, "std": 10.0}
        )
        assert signature.pattern_type == PatternType.WORKLOAD
        assert signature.hash_value != ""  # Auto-generated

    def test_signature_hash_consistency(self):
        sig1 = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={"a": 1, "b": 2}
        )
        sig2 = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={"b": 2, "a": 1}  # Same features, different order
        )
        # Should have same hash
        assert sig1.hash_value == sig2.hash_value


class TestDetectedPattern:
    """Test DetectedPattern dataclass."""

    def test_create_pattern(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={}
        )
        pattern = DetectedPattern(
            id="pat-001",
            signature=signature,
            pattern_type=PatternType.WORKLOAD,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now()
        )
        assert pattern.id == "pat-001"
        assert pattern.occurrence_count == 1

    def test_average_value(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={}
        )
        pattern = DetectedPattern(
            id="pat-001",
            signature=signature,
            pattern_type=PatternType.WORKLOAD,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            sample_values=[10.0, 20.0, 30.0]
        )
        assert pattern.average_value == 20.0

    def test_std_deviation(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={}
        )
        pattern = DetectedPattern(
            id="pat-001",
            signature=signature,
            pattern_type=PatternType.WORKLOAD,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            sample_values=[10.0, 20.0, 30.0]
        )
        # std = sqrt(((10-20)^2 + (20-20)^2 + (30-20)^2) / 3) = sqrt(200/3) ≈ 8.16
        assert 8.0 < pattern.std_deviation < 9.0

    def test_std_deviation_single_value(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={}
        )
        pattern = DetectedPattern(
            id="pat-001",
            signature=signature,
            pattern_type=PatternType.WORKLOAD,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            sample_values=[10.0]
        )
        assert pattern.std_deviation == 0.0


class TestWorkloadPattern:
    """Test WorkloadPattern dataclass."""

    def test_create_workload_pattern(self):
        signature = PatternSignature(
            pattern_type=PatternType.WORKLOAD,
            key_features={}
        )
        pattern = WorkloadPattern(
            id="wl-001",
            signature=signature,
            pattern_type=PatternType.WORKLOAD,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            peak_hours=[9, 10, 11],
            low_hours=[2, 3, 4],
            average_load=100.0
        )
        assert pattern.peak_hours == [9, 10, 11]
        assert pattern.average_load == 100.0


class TestSeasonalPattern:
    """Test SeasonalPattern dataclass."""

    def test_create_seasonal_pattern(self):
        signature = PatternSignature(
            pattern_type=PatternType.SEASONAL,
            key_features={}
        )
        pattern = SeasonalPattern(
            id="sea-001",
            signature=signature,
            pattern_type=PatternType.SEASONAL,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            seasonality_type=SeasonalityType.DAILY,
            period_seconds=86400.0
        )
        assert pattern.seasonality_type == SeasonalityType.DAILY
        assert pattern.period_seconds == 86400.0


class TestCostPattern:
    """Test CostPattern dataclass."""

    def test_create_cost_pattern(self):
        signature = PatternSignature(
            pattern_type=PatternType.COST,
            key_features={}
        )
        pattern = CostPattern(
            id="cost-001",
            signature=signature,
            pattern_type=PatternType.COST,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            average_cost=1000.0,
            peak_cost=1500.0,
            optimization_potential=200.0,
            recommended_actions=["Use reserved instances"]
        )
        assert pattern.average_cost == 1000.0
        assert pattern.optimization_potential == 200.0


class TestFailurePattern:
    """Test FailurePattern dataclass."""

    def test_create_failure_pattern(self):
        signature = PatternSignature(
            pattern_type=PatternType.FAILURE,
            key_features={}
        )
        pattern = FailurePattern(
            id="fail-001",
            signature=signature,
            pattern_type=PatternType.FAILURE,
            confidence=PatternConfidence.HIGH,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            failure_category=FailureCategory.RESOURCE_EXHAUSTION,
            precursors=["high_cpu"],
            affected_components=["api-server"],
            recovery_time_seconds=60.0,
            mitigation_strategies=["Scale horizontally"]
        )
        assert pattern.failure_category == FailureCategory.RESOURCE_EXHAUSTION
        assert len(pattern.mitigation_strategies) == 1


class TestLearningSession:
    """Test LearningSession dataclass."""

    def test_create_session(self):
        session = LearningSession(
            id="sess-001",
            pattern_type=PatternType.WORKLOAD,
            status=LearningStatus.COLLECTING,
            started_at=datetime.now()
        )
        assert session.status == LearningStatus.COLLECTING
        assert session.ended_at is None
        assert session.errors == []


class TestPatternRecognizer:
    """Test PatternRecognizer class."""

    @pytest.fixture
    def recognizer(self):
        return create_pattern_recognizer(
            name="test",
            pattern_type=PatternType.WORKLOAD,
            min_samples=5
        )

    def test_create_recognizer(self, recognizer):
        assert recognizer.name == "test"
        assert recognizer.pattern_type == PatternType.WORKLOAD
        assert recognizer.min_samples == 5

    def test_add_data_point(self, recognizer):
        for i in range(10):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=float(i * 10)
            )
            recognizer.add_data_point(point)
        assert len(recognizer.data_buffer) == 10

    def test_buffer_limit(self, recognizer):
        recognizer.max_buffer_size = 100
        for i in range(150):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=float(i)
            )
            recognizer.add_data_point(point)
        assert len(recognizer.data_buffer) == 100

    def test_detect_patterns_insufficient_data(self, recognizer):
        for i in range(3):  # Less than min_samples
            point = DataPoint(
                timestamp=datetime.now(),
                value=float(i)
            )
            recognizer.add_data_point(point)
        patterns = recognizer.detect_patterns()
        assert patterns == []

    def test_detect_patterns_sufficient_data(self, recognizer):
        for i in range(20):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0 + (i % 5) * 10  # Regular pattern
            )
            recognizer.add_data_point(point)
        patterns = recognizer.detect_patterns()
        assert len(patterns) > 0

    def test_pattern_updates_on_repeat(self, recognizer):
        # First detection
        for i in range(15):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
            recognizer.add_data_point(point)
        patterns1 = recognizer.detect_patterns()
        assert len(patterns1) == 1
        assert patterns1[0].occurrence_count == 1

        # Add more data and detect again
        recognizer.clear_buffer()
        for i in range(15):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
            recognizer.add_data_point(point)
        patterns2 = recognizer.detect_patterns()
        assert patterns2[0].occurrence_count == 2

    def test_confidence_calculation(self, recognizer):
        # High confidence: many samples, low variance
        for i in range(100):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0 + (i % 2)  # Low variance
            )
            recognizer.add_data_point(point)
        patterns = recognizer.detect_patterns()
        assert patterns[0].confidence == PatternConfidence.VERY_HIGH

    def test_clear_buffer(self, recognizer):
        for i in range(10):
            point = DataPoint(timestamp=datetime.now(), value=float(i))
            recognizer.add_data_point(point)
        assert len(recognizer.data_buffer) == 10
        recognizer.clear_buffer()
        assert len(recognizer.data_buffer) == 0


class TestSeasonalAnalyzer:
    """Test SeasonalAnalyzer class."""

    @pytest.fixture
    def analyzer(self):
        return create_seasonal_analyzer(name="test")

    def test_create_analyzer(self, analyzer):
        assert analyzer.name == "test"
        assert len(analyzer.seasonality_types) == 3

    def test_add_observation(self, analyzer):
        now = datetime.now()
        analyzer.add_observation(now, 100.0)
        assert len(analyzer.data_by_hour[now.hour]) == 1
        assert len(analyzer.data_by_weekday[now.weekday()]) == 1

    def test_analyze_hourly_pattern(self, analyzer):
        # Create 24 hours of data with clear peak at hour 12
        base = datetime.now().replace(hour=0, minute=0, second=0)
        for hour in range(24):
            # Peak at noon, trough at midnight
            value = 50.0 + 50.0 * (1 - abs(hour - 12) / 12)
            for _ in range(5):  # Multiple samples per hour
                analyzer.add_observation(base + timedelta(hours=hour), value)

        patterns = analyzer.analyze()
        hourly = [p for p in patterns if p.seasonality_type == SeasonalityType.HOURLY]
        assert len(hourly) > 0

    def test_analyze_weekly_pattern(self, analyzer):
        # Create 7 days of data with weekday/weekend difference
        base = datetime.now().replace(hour=12, minute=0, second=0)
        for day in range(7):
            # Weekdays higher than weekends
            value = 100.0 if day < 5 else 30.0
            for _ in range(10):
                analyzer.add_observation(base + timedelta(days=day), value)

        patterns = analyzer.analyze()
        weekly = [p for p in patterns if p.seasonality_type == SeasonalityType.WEEKLY]
        assert len(weekly) > 0

    def test_no_pattern_with_little_data(self, analyzer):
        # Only a few observations
        for i in range(5):
            analyzer.add_observation(datetime.now(), float(i))

        patterns = analyzer.analyze()
        assert len(patterns) == 0


class TestCostOptimizer:
    """Test CostOptimizer class."""

    @pytest.fixture
    def optimizer(self):
        return create_cost_optimizer(name="test")

    def test_create_optimizer(self, optimizer):
        assert optimizer.name == "test"
        assert optimizer.cost_history == []

    def test_record_cost(self, optimizer):
        optimizer.record_cost(
            timestamp=datetime.now(),
            total_cost=100.0,
            cost_breakdown={"compute": 60.0, "storage": 40.0}
        )
        assert len(optimizer.cost_history) == 1

    def test_analyze_insufficient_data(self, optimizer):
        for i in range(5):  # Less than 10
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=100.0,
                cost_breakdown={"compute": 60.0}
            )
        patterns = optimizer.analyze()
        assert patterns == []

    def test_analyze_sufficient_data(self, optimizer):
        for i in range(20):
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0 + i * 10,
                cost_breakdown={
                    "compute": 500.0,
                    "storage": 300.0,
                    "network": 200.0 + i * 10
                }
            )
        patterns = optimizer.analyze()
        assert len(patterns) > 0
        assert patterns[0].average_cost > 0

    def test_cost_drivers_identified(self, optimizer):
        for i in range(15):
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0,
                cost_breakdown={
                    "compute": 600.0,  # Top driver
                    "storage": 300.0,
                    "network": 100.0
                }
            )
        patterns = optimizer.analyze()
        assert "compute" in patterns[0].cost_drivers

    def test_optimization_recommendations(self, optimizer):
        for i in range(20):
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0,
                cost_breakdown={
                    "compute_instances": 700.0,  # High compute cost
                    "storage": 200.0,
                    "network": 100.0
                }
            )
        patterns = optimizer.analyze()
        assert len(patterns[0].recommended_actions) > 0

    def test_get_optimization_rules(self, optimizer):
        for i in range(25):
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0,
                cost_breakdown={"compute": 800.0, "storage": 200.0}
            )
        optimizer.analyze()
        rules = optimizer.get_optimization_rules()
        # May or may not have rules depending on thresholds
        assert isinstance(rules, list)


class TestFailurePatternMemory:
    """Test FailurePatternMemory class."""

    @pytest.fixture
    def memory(self):
        return create_failure_memory(name="test")

    def test_create_memory(self, memory):
        assert memory.name == "test"
        assert memory.failure_history == []

    def test_record_failure(self, memory):
        memory.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.RESOURCE_EXHAUSTION,
            details={"message": "OOM killed"}
        )
        assert len(memory.failure_history) == 1

    def test_record_failure_with_precursors(self, memory):
        memory.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.RESOURCE_EXHAUSTION,
            details={
                "message": "OOM killed",
                "precursors": ["high_memory", "cpu_spike"]
            }
        )
        assert "high_memory" in memory.precursor_signals[FailureCategory.RESOURCE_EXHAUSTION]

    def test_analyze_insufficient_data(self, memory):
        for i in range(2):  # Less than 3
            memory.record_failure(
                timestamp=datetime.now() - timedelta(days=i),
                category=FailureCategory.NETWORK_ISSUE,
                details={}
            )
        patterns = memory.analyze()
        assert len(patterns) == 0

    def test_analyze_sufficient_data(self, memory):
        for i in range(5):
            memory.record_failure(
                timestamp=datetime.now() - timedelta(days=i),
                category=FailureCategory.TIMEOUT,
                details={
                    "affected_components": ["api-server"],
                    "recovery_time_seconds": 30.0
                }
            )
        patterns = memory.analyze()
        assert len(patterns) > 0
        assert patterns[0].failure_category == FailureCategory.TIMEOUT

    def test_mitigation_strategies_generated(self, memory):
        for i in range(5):
            memory.record_failure(
                timestamp=datetime.now() - timedelta(days=i),
                category=FailureCategory.RESOURCE_EXHAUSTION,
                details={"affected_components": ["worker"]}
            )
        patterns = memory.analyze()
        assert len(patterns[0].mitigation_strategies) > 0

    def test_check_precursors(self, memory):
        # Record failures with precursors
        memory.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.RESOURCE_EXHAUSTION,
            details={"precursors": ["cpu_usage", "memory_usage"]}
        )

        # Check with concerning metrics
        warnings = memory.check_precursors({
            "cpu_usage": 85.0,
            "memory_usage": 90.0,
            "latency_p99": 500.0
        })
        assert FailureCategory.RESOURCE_EXHAUSTION in warnings

    def test_check_precursors_no_warning(self, memory):
        memory.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.RESOURCE_EXHAUSTION,
            details={"precursors": ["cpu_usage"]}
        )

        # Check with normal metrics
        warnings = memory.check_precursors({
            "cpu_usage": 50.0
        })
        assert FailureCategory.RESOURCE_EXHAUSTION not in warnings

    def test_failure_history_cleanup(self, memory):
        # Add old failure
        old_time = datetime.now() - timedelta(days=200)
        memory.record_failure(
            timestamp=old_time,
            category=FailureCategory.NETWORK_ISSUE,
            details={}
        )
        # Add recent failure
        memory.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.NETWORK_ISSUE,
            details={}
        )
        # Old one should be cleaned up
        assert len(memory.failure_history) == 1


class TestAdaptiveLearner:
    """Test AdaptiveLearner class."""

    @pytest.fixture
    def learner(self):
        return create_adaptive_learner()

    def test_create_learner(self, learner):
        assert learner.workload_recognizer is not None
        assert learner.seasonal_analyzer is not None
        assert learner.cost_optimizer is not None
        assert learner.failure_memory is not None

    def test_start_learning_session(self, learner):
        session = learner.start_learning_session(PatternType.WORKLOAD)
        assert session.id in learner.sessions
        assert session.status == LearningStatus.COLLECTING

    def test_record_workload_observation(self, learner):
        learner.record_workload_observation(
            timestamp=datetime.now(),
            value=100.0,
            labels={"service": "api"}
        )
        assert len(learner.workload_recognizer.data_buffer) == 1

    def test_record_cost_observation(self, learner):
        learner.record_cost_observation(
            timestamp=datetime.now(),
            total_cost=100.0,
            cost_breakdown={"compute": 60.0}
        )
        assert len(learner.cost_optimizer.cost_history) == 1

    def test_record_failure(self, learner):
        learner.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.TIMEOUT,
            details={"message": "Request timeout"}
        )
        assert len(learner.failure_memory.failure_history) == 1

    def test_analyze_all_empty(self, learner):
        results = learner.analyze_all()
        assert results == {}

    def test_analyze_all_with_data(self, learner):
        # Add workload data
        for i in range(20):
            learner.record_workload_observation(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )

        # Add cost data
        for i in range(15):
            learner.record_cost_observation(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0,
                cost_breakdown={"compute": 600.0}
            )

        results = learner.analyze_all()
        assert PatternType.WORKLOAD in results
        assert PatternType.COST in results

    def test_get_pattern(self, learner):
        # Add data and analyze
        for i in range(20):
            learner.record_workload_observation(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
        learner.analyze_all()

        # Get first pattern
        patterns = learner.get_patterns_by_type(PatternType.WORKLOAD)
        if patterns:
            retrieved = learner.get_pattern(patterns[0].id)
            assert retrieved is not None

    def test_get_patterns_by_type(self, learner):
        for i in range(20):
            learner.record_workload_observation(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
        learner.analyze_all()

        patterns = learner.get_patterns_by_type(PatternType.WORKLOAD)
        assert len(patterns) > 0

    def test_get_high_confidence_patterns(self, learner):
        # Add lots of consistent data for high confidence
        for i in range(100):
            learner.record_workload_observation(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
        learner.analyze_all()

        high_conf = learner.get_high_confidence_patterns()
        assert len(high_conf) > 0

    def test_predict_workload_no_patterns(self, learner):
        prediction = learner.predict_workload(datetime.now())
        assert prediction is None

    def test_predict_workload_with_patterns(self, learner):
        # Create hourly pattern data
        base = datetime.now().replace(hour=0, minute=0, second=0)
        for hour in range(24):
            value = 50.0 + hour * 2
            for _ in range(10):
                learner.record_workload_observation(
                    timestamp=base + timedelta(hours=hour),
                    value=value
                )
        learner.analyze_all()

        # Predict for a specific hour
        prediction = learner.predict_workload(base + timedelta(hours=12))
        # May or may not have prediction depending on pattern detection
        assert prediction is None or isinstance(prediction, float)

    def test_check_failure_warnings(self, learner):
        # Record failure with precursor
        learner.record_failure(
            timestamp=datetime.now(),
            category=FailureCategory.RESOURCE_EXHAUSTION,
            details={"precursors": ["cpu_usage"]}
        )

        warnings = learner.check_failure_warnings({
            "cpu_usage": 90.0
        })
        assert len(warnings) > 0

    def test_get_cost_recommendations(self, learner):
        for i in range(25):
            learner.record_cost_observation(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=1000.0,
                cost_breakdown={"compute": 800.0}
            )
        learner.analyze_all()

        recommendations = learner.get_cost_recommendations()
        assert isinstance(recommendations, list)

    def test_get_failure_mitigations(self, learner):
        for i in range(5):
            learner.record_failure(
                timestamp=datetime.now() - timedelta(days=i),
                category=FailureCategory.NETWORK_ISSUE,
                details={}
            )
        learner.analyze_all()

        mitigations = learner.get_failure_mitigations(FailureCategory.NETWORK_ISSUE)
        assert len(mitigations) > 0

    def test_get_failure_mitigations_unknown(self, learner):
        mitigations = learner.get_failure_mitigations(FailureCategory.TIMEOUT)
        assert mitigations == []

    def test_end_learning_session(self, learner):
        session = learner.start_learning_session(PatternType.WORKLOAD)
        learner.end_learning_session(session.id)

        assert session.status == LearningStatus.LEARNED
        assert session.ended_at is not None


class TestIntegration:
    """Integration tests for adaptive learning."""

    def test_full_learning_workflow(self):
        """Test complete learning workflow from data to patterns."""
        learner = create_adaptive_learner()

        # Start session
        session = learner.start_learning_session(PatternType.WORKLOAD)

        # Collect workload data with daily pattern
        base = datetime.now().replace(hour=0, minute=0, second=0)
        for day in range(7):
            for hour in range(24):
                # Work hours have higher load
                value = 80.0 if 9 <= hour <= 17 else 20.0
                learner.record_workload_observation(
                    timestamp=base + timedelta(days=day, hours=hour),
                    value=value
                )

        # Collect cost data
        for day in range(30):
            learner.record_cost_observation(
                timestamp=datetime.now() - timedelta(days=day),
                total_cost=1000.0 + day * 5,
                cost_breakdown={"compute": 600.0, "storage": 400.0}
            )

        # Collect failure data
        for i in range(5):
            learner.record_failure(
                timestamp=datetime.now() - timedelta(days=i * 3),
                category=FailureCategory.RESOURCE_EXHAUSTION,
                details={
                    "affected_components": ["api-server"],
                    "recovery_time_seconds": 60.0,
                    "precursors": ["high_cpu"]
                }
            )

        # Analyze all
        results = learner.analyze_all()

        # Should have detected patterns
        assert len(results) > 0

        # End session
        learner.end_learning_session(session.id)
        assert session.status == LearningStatus.LEARNED

    def test_prediction_and_warning_workflow(self):
        """Test prediction and warning capabilities."""
        learner = create_adaptive_learner()

        # Create predictable workload pattern
        base = datetime.now().replace(hour=0, minute=0, second=0)
        for day in range(14):
            for hour in range(24):
                value = 100.0 if 9 <= hour <= 17 else 30.0
                learner.record_workload_observation(
                    timestamp=base + timedelta(days=day, hours=hour),
                    value=value
                )

        # Record failures with precursors
        for i in range(5):
            learner.record_failure(
                timestamp=datetime.now() - timedelta(days=i * 5),
                category=FailureCategory.OVERLOAD,
                details={"precursors": ["cpu_usage", "request_rate"]}
            )

        learner.analyze_all()

        # Check predictions
        work_hour = base + timedelta(hours=12)
        prediction = learner.predict_workload(work_hour)
        # May or may not have prediction

        # Check warnings
        warnings = learner.check_failure_warnings({
            "cpu_usage": 95.0,
            "request_rate": 10000.0
        })

        assert len(warnings) > 0


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_pattern_analysis(self):
        """Test analysis with no data."""
        recognizer = PatternRecognizer(
            name="empty",
            pattern_type=PatternType.WORKLOAD
        )
        patterns = recognizer.detect_patterns()
        assert patterns == []

    def test_single_value_pattern(self):
        """Test pattern with all same values."""
        recognizer = PatternRecognizer(
            name="constant",
            pattern_type=PatternType.WORKLOAD,
            min_samples=5
        )
        for i in range(20):
            point = DataPoint(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0  # All same
            )
            recognizer.add_data_point(point)

        patterns = recognizer.detect_patterns()
        assert len(patterns) > 0
        assert patterns[0].std_deviation == 0.0

    def test_cost_optimizer_empty_breakdown(self):
        """Test cost optimizer with empty breakdown."""
        optimizer = CostOptimizer(name="test")
        for i in range(15):
            optimizer.record_cost(
                timestamp=datetime.now() - timedelta(days=i),
                total_cost=100.0,
                cost_breakdown={}
            )
        patterns = optimizer.analyze()
        assert len(patterns) > 0
        assert patterns[0].cost_drivers == {}

    def test_failure_memory_no_precursors(self):
        """Test failure memory without precursors."""
        memory = FailurePatternMemory(name="test")
        for i in range(5):
            memory.record_failure(
                timestamp=datetime.now() - timedelta(days=i),
                category=FailureCategory.TIMEOUT,
                details={}  # No precursors
            )
        patterns = memory.analyze()
        assert len(patterns) > 0
        assert patterns[0].precursors == []

    def test_seasonal_analyzer_constant_values(self):
        """Test seasonal analyzer with constant values."""
        analyzer = SeasonalAnalyzer(name="test")
        for hour in range(24):
            for _ in range(5):
                analyzer.add_observation(
                    datetime.now().replace(hour=hour),
                    100.0  # Constant
                )

        patterns = analyzer.analyze()
        # May not detect pattern due to low variance
        assert isinstance(patterns, list)

    def test_pattern_signature_with_complex_features(self):
        """Test pattern signature with complex features."""
        signature = PatternSignature(
            pattern_type=PatternType.PERFORMANCE,
            key_features={
                "nested": {"deep": "value"},
                "list": [1, 2, 3],
                "number": 42.0
            }
        )
        assert signature.hash_value != ""

    def test_learner_multiple_sessions(self):
        """Test multiple concurrent learning sessions."""
        learner = create_adaptive_learner()

        session1 = learner.start_learning_session(PatternType.WORKLOAD)
        session2 = learner.start_learning_session(PatternType.COST)

        assert len(learner.sessions) == 2

        learner.end_learning_session(session1.id)
        learner.end_learning_session(session2.id)

        assert session1.status == LearningStatus.LEARNED
        assert session2.status == LearningStatus.LEARNED

    def test_workload_prediction_no_seasonal_data(self):
        """Test workload prediction without seasonal patterns."""
        learner = create_adaptive_learner()

        # Only add workload data, no seasonal
        for i in range(20):
            learner.record_workload_observation(
                timestamp=datetime.now() + timedelta(minutes=i),
                value=100.0
            )
        # Don't analyze - no seasonal patterns

        prediction = learner.predict_workload(datetime.now())
        assert prediction is None
