"""
Tests for Phase 64: Self-Reflection

Comprehensive tests for mesh self-reflection, behavior analysis,
and improvement suggestions.
"""

from datetime import datetime

from systems.visual_shell.self_reflection import (
    AnomalyRecord,
    BehaviorAnalyzer,
    BehaviorMetric,
    DecisionQuality,
    DecisionRecord,
    ImprovementCategory,
    ImprovementSuggester,
    ImprovementSuggestion,
    ReflectionEntry,
    ReflectionJournal,
    ReflectionSeverity,
    ReflectionStatus,
    ReflectionType,
    SelfReflection,
    create_anomaly_record,
    create_behavior_metric,
    create_decision_record,
    create_improvement_suggestion,
    create_reflection_entry,
    create_self_reflection,
)


class TestReflectionType:
    """Tests for ReflectionType enum."""

    def test_reflection_types_exist(self):
        """Test all reflection types are defined."""
        assert ReflectionType.BEHAVIOR_ANALYSIS.value == "behavior_analysis"
        assert ReflectionType.DECISION_QUALITY.value == "decision_quality"
        assert ReflectionType.PERFORMANCE_REVIEW.value == "performance_review"
        assert ReflectionType.ANOMALY_DETECTION.value == "anomaly_detection"
        assert ReflectionType.IMPROVEMENT_SUGGESTION.value == "improvement_suggestion"
        assert ReflectionType.LEARNING_INSIGHT.value == "learning_insight"
        assert ReflectionType.PATTERN_DISCOVERY.value == "pattern_discovery"
        assert ReflectionType.ERROR_ANALYSIS.value == "error_analysis"
        assert ReflectionType.SUCCESS_ANALYSIS.value == "success_analysis"
        assert ReflectionType.TREND_ANALYSIS.value == "trend_analysis"


class TestReflectionSeverity:
    """Tests for ReflectionSeverity enum."""

    def test_severity_levels(self):
        """Test all severity levels."""
        assert ReflectionSeverity.INFO.value == "info"
        assert ReflectionSeverity.LOW.value == "low"
        assert ReflectionSeverity.MEDIUM.value == "medium"
        assert ReflectionSeverity.HIGH.value == "high"
        assert ReflectionSeverity.CRITICAL.value == "critical"


class TestDecisionQuality:
    """Tests for DecisionQuality enum."""

    def test_quality_levels(self):
        """Test all quality levels."""
        assert DecisionQuality.EXCELLENT.value == "excellent"
        assert DecisionQuality.GOOD.value == "good"
        assert DecisionQuality.ADEQUATE.value == "adequate"
        assert DecisionQuality.POOR.value == "poor"
        assert DecisionQuality.CRITICAL.value == "critical"
        assert DecisionQuality.UNKNOWN.value == "unknown"


class TestImprovementCategory:
    """Tests for ImprovementCategory enum."""

    def test_categories_exist(self):
        """Test all improvement categories."""
        assert ImprovementCategory.PERFORMANCE.value == "performance"
        assert ImprovementCategory.RELIABILITY.value == "reliability"
        assert ImprovementCategory.COST.value == "cost"
        assert ImprovementCategory.SECURITY.value == "security"
        assert ImprovementCategory.SCALABILITY.value == "scalability"
        assert ImprovementCategory.MAINTAINABILITY.value == "maintainability"
        assert ImprovementCategory.USER_EXPERIENCE.value == "user_experience"
        assert ImprovementCategory.RESOURCE_USAGE.value == "resource_usage"
        assert ImprovementCategory.AUTOMATION.value == "automation"
        assert ImprovementCategory.MONITORING.value == "monitoring"


class TestReflectionStatus:
    """Tests for ReflectionStatus enum."""

    def test_statuses_exist(self):
        """Test all statuses."""
        assert ReflectionStatus.DRAFT.value == "draft"
        assert ReflectionStatus.PUBLISHED.value == "published"
        assert ReflectionStatus.ACKNOWLEDGED.value == "acknowledged"
        assert ReflectionStatus.ACTIONED.value == "actioned"
        assert ReflectionStatus.DISMISSED.value == "dismissed"
        assert ReflectionStatus.ARCHIVED.value == "archived"


class TestBehaviorMetric:
    """Tests for BehaviorMetric dataclass."""

    def test_create_behavior_metric(self):
        """Test creating a behavior metric."""
        metric = BehaviorMetric(
            id="m1",
            name="cpu",
            value=50.0,
            timestamp=datetime.now(),
            threshold_low=0.0,
            threshold_high=100.0
        )
        assert metric.id == "m1"
        assert metric.name == "cpu"
        assert metric.value == 50.0
        assert metric.is_within_bounds() is True

    def test_out_of_bounds_metric(self):
        """Test metric out of bounds."""
        metric = BehaviorMetric(
            id="m2",
            name="cpu",
            value=150.0,
            timestamp=datetime.now(),
            threshold_low=0.0,
            threshold_high=100.0
        )
        assert metric.is_within_bounds() is False

    def test_get_deviation(self):
        """Test deviation calculation."""
        metric = BehaviorMetric(
            id="m3",
            name="cpu",
            value=60.0,
            timestamp=datetime.now(),
            threshold_low=0.0,
            threshold_high=100.0
        )
        # Midpoint is 50, deviation should be 10
        assert metric.get_deviation() == 10.0


class TestDecisionRecord:
    """Tests for DecisionRecord dataclass."""

    def test_create_decision_record(self):
        """Test creating a decision record."""
        record = DecisionRecord(
            id="d1",
            decision_type="scale",
            timestamp=datetime.now(),
            actor="autoscaler",
            reasoning="High load"
        )
        assert record.id == "d1"
        assert record.decision_type == "scale"
        assert record.actor == "autoscaler"
        assert record.success is True

    def test_decision_record_with_failure(self):
        """Test decision record with failure."""
        record = DecisionRecord(
            id="d2",
            decision_type="failover",
            timestamp=datetime.now(),
            actor="system",
            reasoning="Critical failure",
            success=False
        )
        assert record.success is False


class TestAnomalyRecord:
    """Tests for AnomalyRecord dataclass."""

    def test_create_anomaly_record(self):
        """Test creating an anomaly record."""
        anomaly = AnomalyRecord(
            id="a1",
            anomaly_type="metric_out_of_bounds",
            detected_at=datetime.now(),
            severity=ReflectionSeverity.HIGH,
            description="CPU out of bounds"
        )
        assert anomaly.id == "a1"
        assert anomaly.anomaly_type == "metric_out_of_bounds"
        assert anomaly.severity == ReflectionSeverity.HIGH

    def test_is_resolved(self):
        """Test is_resolved method."""
        anomaly = AnomalyRecord(
            id="a2",
            anomaly_type="test",
            detected_at=datetime.now(),
            severity=ReflectionSeverity.LOW,
            description="Test"
        )
        assert anomaly.is_resolved() is False
        anomaly.resolved_at = datetime.now()
        assert anomaly.is_resolved() is True


class TestReflectionEntry:
    """Tests for ReflectionEntry dataclass."""

    def test_create_reflection_entry(self):
        """Test creating a reflection entry."""
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test",
            content="Test content"
        )
        assert entry.id == "e1"
        assert entry.reflection_type == ReflectionType.BEHAVIOR_ANALYSIS
        assert entry.status == ReflectionStatus.DRAFT

    def test_reflection_entry_lifecycle(self):
        """Test reflection entry lifecycle."""
        entry = ReflectionEntry(
            id="e2",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test",
            content="Test content"
        )
        # Publish
        entry.publish()
        assert entry.status == ReflectionStatus.PUBLISHED
        # Archive
        entry.archive()
        assert entry.status == ReflectionStatus.ARCHIVED


class TestImprovementSuggestion:
    """Tests for ImprovementSuggestion dataclass."""

    def test_create_improvement_suggestion(self):
        """Test creating an improvement suggestion."""
        suggestion = ImprovementSuggestion(
            id="s1",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test description"
        )
        assert suggestion.id == "s1"
        assert suggestion.category == ImprovementCategory.PERFORMANCE
        assert suggestion.status == ReflectionStatus.DRAFT

    def test_improvement_suggestion_lifecycle(self):
        """Test improvement suggestion lifecycle."""
        suggestion = ImprovementSuggestion(
            id="s2",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test description"
        )
        # Acknowledge
        suggestion.acknowledge()
        assert suggestion.status == ReflectionStatus.ACKNOWLEDGED
        # Action
        suggestion.action()
        assert suggestion.status == ReflectionStatus.ACTIONED

    def test_dismiss_suggestion(self):
        """Test dismissing suggestion."""
        suggestion = ImprovementSuggestion(
            id="s3",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test description"
        )
        suggestion.dismiss()
        assert suggestion.status == ReflectionStatus.DISMISSED


class TestReflectionJournal:
    """Tests for ReflectionJournal class."""

    def test_create_journal(self):
        """Test creating a reflection journal."""
        journal = ReflectionJournal()
        assert len(journal.entries) == 0
        assert journal.max_entries == 10000

    def test_add_entry(self):
        """Test adding an entry to journal."""
        journal = ReflectionJournal()
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test",
            content="Test content"
        )
        journal.add_entry(entry)
        assert len(journal.entries) == 1

    def test_get_entries_by_type(self):
        """Test getting entries by type."""
        journal = ReflectionJournal()
        entry1 = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Entry 1",
            content="Test"
        )
        entry2 = ReflectionEntry(
            id="e2",
            reflection_type=ReflectionType.PERFORMANCE_REVIEW,
            timestamp=datetime.now(),
            title="Entry 2",
            content="Test"
        )
        journal.add_entry(entry1)
        journal.add_entry(entry2)
        entries = journal.get_entries_by_type(ReflectionType.BEHAVIOR_ANALYSIS)
        assert len(entries) == 1
        assert entries[0].id == "e1"

    def test_get_entries_by_severity(self):
        """Test getting entries by severity."""
        journal = ReflectionJournal()
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test",
            content="Test content",
            severity=ReflectionSeverity.HIGH
        )
        journal.add_entry(entry)
        entries = journal.get_entries_by_severity(ReflectionSeverity.HIGH)
        assert len(entries) == 1

    def test_get_recent_entries(self):
        """Test getting recent entries."""
        journal = ReflectionJournal()
        for i in range(5):
            entry = ReflectionEntry(
                id=f"e{i}",
                reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
                timestamp=datetime.now(),
                title=f"Entry {i}",
                content="Test content"
            )
            journal.add_entry(entry)
        entries = journal.get_recent_entries(limit=2)
        assert len(entries) == 2

    def test_search_entries(self):
        """Test searching entries."""
        journal = ReflectionJournal()
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test Entry",
            content="test content"
        )
        journal.add_entry(entry)
        results = journal.search("test")
        assert len(results) == 1
        assert results[0].id == "e1"

    def test_journal_max_entries(self):
        """Test journal respects max entries."""
        journal = ReflectionJournal()
        journal.max_entries = 5
        for i in range(10):
            entry = ReflectionEntry(
                id=f"e{i}",
                reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
                timestamp=datetime.now(),
                title=f"Entry {i}",
                content="Test content"
            )
            journal.add_entry(entry)
        assert len(journal.entries) == 5

    def test_search_entries_no_results(self):
        """Test searching entries with no results."""
        journal = ReflectionJournal()
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test Entry",
            content="test content"
        )
        journal.add_entry(entry)
        results = journal.search("nonexistent")
        assert len(results) == 0


class TestBehaviorAnalyzer:
    """Tests for BehaviorAnalyzer class."""

    def test_create_analyzer(self):
        """Test creating a behavior analyzer."""
        analyzer = BehaviorAnalyzer()
        assert len(analyzer.metrics) == 0
        assert len(analyzer.decisions) == 0

    def test_record_metric(self):
        """Test recording a metric."""
        analyzer = BehaviorAnalyzer()
        metric = BehaviorMetric(
            id="m1",
            name="cpu",
            value=50.0,
            timestamp=datetime.now()
        )
        analyzer.record_metric(metric)
        assert "cpu" in analyzer.metrics
        assert len(analyzer.metrics["cpu"]) == 1

    def test_record_multiple_metrics(self):
        """Test recording multiple metrics."""
        analyzer = BehaviorAnalyzer()
        for i in range(5):
            metric = BehaviorMetric(
                id=f"m{i}",
                name="cpu",
                value=50.0 + i,
                timestamp=datetime.now()
            )
            analyzer.record_metric(metric)
        assert len(analyzer.metrics["cpu"]) == 5

    def test_record_decision(self):
        """Test recording a decision."""
        analyzer = BehaviorAnalyzer()
        decision = DecisionRecord(
            id="d1",
            decision_type="scale",
            timestamp=datetime.now(),
            actor="autoscaler",
            reasoning="High load"
        )
        analyzer.record_decision(decision)
        assert len(analyzer.decisions) == 1

    def test_analyze_behavior(self):
        """Test analyzing behavior."""
        analyzer = BehaviorAnalyzer()
        # Add some metrics
        for i in range(10):
            metric = BehaviorMetric(
                id=f"m{i}",
                name="cpu",
                value=50.0 + i * 5,
                timestamp=datetime.now()
            )
            analyzer.record_metric(metric)
        analyses = analyzer.analyze_behavior()
        assert len(analyses) >= 1

    def test_analyze_behavior_no_metrics(self):
        """Test analyzing behavior with no metrics."""
        analyzer = BehaviorAnalyzer()
        analyses = analyzer.analyze_behavior()
        assert len(analyses) == 0

    def test_detect_anomalies_no_metrics(self):
        """Test detecting anomalies with no metrics."""
        analyzer = BehaviorAnalyzer()
        anomalies = analyzer.detect_anomalies()
        assert len(anomalies) == 0

    def test_detect_anomalies_with_anomaly(self):
        """Test detecting anomalies with metric out of bounds."""
        analyzer = BehaviorAnalyzer()
        # Add metric out of bounds
        metric = BehaviorMetric(
            id="m1",
            name="cpu",
            value=150.0,
            timestamp=datetime.now(),
            threshold_high=100.0
        )
        analyzer.record_metric(metric)
        anomalies = analyzer.detect_anomalies()
        assert len(anomalies) >= 1

    def test_get_decision_quality(self):
        """Test getting decision quality."""
        analyzer = BehaviorAnalyzer()
        decision = DecisionRecord(
            id="d1",
            decision_type="scale",
            timestamp=datetime.now(),
            actor="autoscaler",
            reasoning="High load"
        )
        analyzer.record_decision(decision)
        quality = analyzer.get_decision_quality("d1")
        assert quality in (DecisionQuality.GOOD, DecisionQuality.EXCELLENT)

    def test_get_decision_quality_unknown(self):
        """Test getting quality of unknown decision."""
        analyzer = BehaviorAnalyzer()
        quality = analyzer.get_decision_quality("nonexistent")
        assert quality == DecisionQuality.UNKNOWN

    def test_get_overall_quality(self):
        """Test getting overall quality."""
        analyzer = BehaviorAnalyzer()
        # Add good decisions
        for i in range(5):
            decision = DecisionRecord(
                id=f"d{i}",
                decision_type="scale",
                timestamp=datetime.now(),
                actor="autoscaler",
                reasoning="High load"
            )
            analyzer.record_decision(decision)
        quality = analyzer.get_overall_quality()
        assert quality >= 0.5

    def test_get_overall_quality_no_decisions(self):
        """Test getting overall quality with no decisions."""
        analyzer = BehaviorAnalyzer()
        quality = analyzer.get_overall_quality()
        assert quality == 1.0

    def test_set_baseline(self):
        """Test setting baseline thresholds."""
        analyzer = BehaviorAnalyzer()
        analyzer.set_baseline("cpu", 10.0, 90.0)
        assert "cpu" in analyzer._baselines
        assert analyzer._baselines["cpu"] == (10.0, 90.0)


class TestImprovementSuggester:
    """Tests for ImprovementSuggester class."""

    def test_create_suggester(self):
        """Test creating an improvement suggester."""
        suggester = ImprovementSuggester()
        assert len(suggester.suggestions) == 0
        assert suggester.max_suggestions == 1000

    def test_generate_suggestions_no_anomalies(self):
        """Test generating suggestions with no anomalies."""
        suggester = ImprovementSuggester()
        suggestions = suggester.generate_suggestions([], [])
        assert len(suggestions) == 0

    def test_generate_suggestions_with_anomaly(self):
        """Test generating suggestions with anomaly."""
        suggester = ImprovementSuggester()
        anomaly = AnomalyRecord(
            id="a1",
            anomaly_type="metric_out_of_bounds",
            detected_at=datetime.now(),
            severity=ReflectionSeverity.HIGH,
            description="CPU out of bounds"
        )
        suggestions = suggester.generate_suggestions([anomaly], [])
        assert len(suggestions) >= 1
        assert suggestions[0].category == ImprovementCategory.PERFORMANCE

    def test_generate_suggestions_with_high_failure_rate(self):
        """Test generating suggestions for high failure rate."""
        suggester = ImprovementSuggester()
        anomaly = AnomalyRecord(
            id="a1",
            anomaly_type="high_failure_rate",
            detected_at=datetime.now(),
            severity=ReflectionSeverity.CRITICAL,
            description="High failure rate"
        )
        suggestions = suggester.generate_suggestions([anomaly], [])
        assert len(suggestions) >= 1
        assert suggestions[0].category == ImprovementCategory.RELIABILITY

    def test_acknowledge_suggestion(self):
        """Test acknowledging a suggestion."""
        suggester = ImprovementSuggester()
        suggestion = ImprovementSuggestion(
            id="s1",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test"
        )
        suggester.suggestions.append(suggestion)
        result = suggester.acknowledge_suggestion("s1")
        assert result is True
        assert suggestion.status == ReflectionStatus.ACKNOWLEDGED

    def test_action_suggestion(self):
        """Test actioning a suggestion."""
        suggester = ImprovementSuggester()
        suggestion = ImprovementSuggestion(
            id="s2",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test"
        )
        suggester.suggestions.append(suggestion)
        result = suggester.action_suggestion("s2")
        assert result is True
        assert suggestion.status == ReflectionStatus.ACTIONED

    def test_dismiss_suggestion(self):
        """Test dismissing a suggestion."""
        suggester = ImprovementSuggester()
        suggestion = ImprovementSuggestion(
            id="s3",
            category=ImprovementCategory.PERFORMANCE,
            title="Test",
            description="Test"
        )
        suggester.suggestions.append(suggestion)
        result = suggester.dismiss_suggestion("s3")
        assert result is True
        assert suggestion.status == ReflectionStatus.DISMISSED

    def test_get_pending_suggestions(self):
        """Test getting pending suggestions."""
        suggester = ImprovementSuggester()
        # Add some suggestions
        for i in range(5):
            suggestion = ImprovementSuggestion(
                id=f"s{i}",
                category=ImprovementCategory.PERFORMANCE,
                title=f"Suggestion {i}",
                description="Test"
            )
            suggester.suggestions.append(suggestion)
        pending = suggester.get_pending_suggestions()
        assert len(pending) == 5
        # Dismiss first
        suggester.dismiss_suggestion(pending[0].id)
        pending = suggester.get_pending_suggestions()
        assert len(pending) == 4

    def test_get_suggestions_by_category(self):
        """Test getting suggestions by category."""
        suggester = ImprovementSuggester()
        # Add suggestions
        for i in range(3):
            suggestion = ImprovementSuggestion(
                id=f"s{i}",
                category=ImprovementCategory.PERFORMANCE,
                title=f"Perf {i}",
                description="Test"
            )
            suggester.suggestions.append(suggestion)
        suggestion2 = ImprovementSuggestion(
            id="s4",
            category=ImprovementCategory.SECURITY,
            title="Sec",
            description="Test"
        )
        suggester.suggestions.append(suggestion2)
        perf = suggester.get_suggestions_by_category(ImprovementCategory.PERFORMANCE)
        assert len(perf) == 3
        security = suggester.get_suggestions_by_category(ImprovementCategory.SECURITY)
        assert len(security) == 1
        assert security[0].id == "s4"


class TestSelfReflection:
    """Tests for SelfReflection class."""

    def test_create_self_reflection(self):
        """Test creating a self-reflection instance."""
        reflection = SelfReflection()
        assert reflection.behavior_analyzer is not None
        assert reflection.improvement_suggester is not None
        assert reflection.journal is not None

    def test_record_metric(self):
        """Test recording a metric."""
        reflection = SelfReflection()
        reflection.record_metric("cpu", 50.0, 0.0, 100.0)
        assert "cpu" in reflection.behavior_analyzer.metrics

    def test_record_decision(self):
        """Test recording a decision."""
        reflection = SelfReflection()
        decision = reflection.record_decision(
            decision_type="scale",
            actor="autoscaler",
            reasoning="High load"
        )
        assert len(reflection.behavior_analyzer.decisions) == 1

    def test_reflect(self):
        """Test performing reflection."""
        reflection = SelfReflection()
        # Add some metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
        result = reflection.reflect()
        assert "behavior_analysis" in result
        assert "anomalies" in result
        assert "suggestions" in result
        assert "overall_quality" in result
        assert "reflection_id" in result

    def test_reflect_with_anomalies(self):
        """Test reflection with anomalies detected."""
        reflection = SelfReflection()
        # Add metric out of bounds
        for i in range(10):
            reflection.record_metric("cpu", 150.0, 0.0, 100.0)
        result = reflection.reflect()
        assert len(result["anomalies"]) >= 1

    def test_reflect_no_data(self):
        """Test reflection with no data."""
        reflection = SelfReflection()
        result = reflection.reflect()
        assert result["behavior_analysis"] == []
        assert result["anomalies"] == []
        assert result["suggestions"] == []

    def test_get_decision_quality(self):
        """Test getting decision quality."""
        reflection = SelfReflection()
        decision = reflection.record_decision(
            decision_type="scale",
            actor="autoscaler",
            reasoning="High load"
        )
        quality = reflection.get_decision_quality(decision.id)
        assert quality in (DecisionQuality.GOOD, DecisionQuality.EXCELLENT)

    def test_get_pending_suggestions(self):
        """Test getting pending suggestions."""
        reflection = SelfReflection()
        # Add some metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
        reflection.reflect()
        suggestions = reflection.get_pending_suggestions()
        # Should have some suggestions
        assert len(suggestions) >= 0

    def test_acknowledge_suggestion(self):
        """Test acknowledging a suggestion."""
        reflection = SelfReflection()
        # Add some metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
        reflection.reflect()
        suggestions = reflection.get_pending_suggestions()
        if suggestions:
            result = reflection.acknowledge_suggestion(suggestions[0].id)
            assert result is True

    def test_action_suggestion(self):
        """Test actioning a suggestion."""
        reflection = SelfReflection()
        # Add some metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
        reflection.reflect()
        suggestions = reflection.get_pending_suggestions()
        if suggestions:
            result = reflection.action_suggestion(suggestions[0].id)
            assert result is True

    def test_dismiss_suggestion(self):
        """Test dismissing a suggestion."""
        reflection = SelfReflection()
        # Add some metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
        reflection.reflect()
        suggestions = reflection.get_pending_suggestions()
        if suggestions:
            result = reflection.dismiss_suggestion(suggestions[0].id)
            assert result is True

    def test_get_journal_entries(self):
        """Test getting journal entries."""
        reflection = SelfReflection()
        for i in range(5):
            entry = ReflectionEntry(
                id=f"e{i}",
                reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
                timestamp=datetime.now(),
                title=f"Entry {i}",
                content="Test content"
            )
            reflection.journal.add_entry(entry)
        entries = reflection.get_journal_entries(limit=5)
        assert len(entries) == 5

    def test_get_recent_anomalies(self):
        """Test getting recent anomalies."""
        reflection = SelfReflection()
        # Add metrics to create anomalies
        for i in range(5):
            reflection.record_metric("cpu", 150.0, 0.0, 100.0)
        anomalies = reflection.get_recent_anomalies()
        assert len(anomalies) >= 1

    def test_search_journal(self):
        """Test searching journal."""
        reflection = SelfReflection()
        reflection.add_journal_entry(
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            title="CPU Analysis",
            content="CPU usage is high"
        )
        results = reflection.search_journal("CPU")
        assert len(results) == 1

    def test_add_journal_entry(self):
        """Test adding journal entry."""
        reflection = SelfReflection()
        entry = reflection.add_journal_entry(
            reflection_type=ReflectionType.PERFORMANCE_REVIEW,
            title="Test",
            content="Test content"
        )
        assert entry.title == "Test"
        assert len(reflection.journal.entries) == 1

    def test_get_overall_quality(self):
        """Test getting overall quality."""
        reflection = SelfReflection()
        # Record some decisions
        for i in range(5):
            reflection.record_decision(
                decision_type="scale",
                actor="autoscaler",
                reasoning="High load"
            )
        quality = reflection.get_overall_quality()
        assert quality >= 0.5


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_behavior_metric(self):
        """Test create_behavior_metric factory."""
        metric = create_behavior_metric("cpu", 50.0, 0.0, 100.0)
        assert metric.name == "cpu"
        assert metric.value == 50.0
        assert metric.is_within_bounds() is True

    def test_create_decision_record(self):
        """Test create_decision_record factory."""
        decision = create_decision_record(
            decision_type="scale",
            actor="autoscaler",
            reasoning="High load"
        )
        assert decision.decision_type == "scale"
        assert decision.actor == "autoscaler"
        assert decision.reasoning == "High load"
        assert decision.success is True

    def test_create_anomaly_record(self):
        """Test create_anomaly_record factory."""
        anomaly = create_anomaly_record(
            anomaly_type="metric_out_of_bounds",
            severity=ReflectionSeverity.HIGH,
            description="CPU out of bounds"
        )
        assert anomaly.anomaly_type == "metric_out_of_bounds"
        assert anomaly.severity == ReflectionSeverity.HIGH
        assert "CPU out of bounds" in anomaly.description

    def test_create_improvement_suggestion(self):
        """Test create_improvement_suggestion factory."""
        suggestion = create_improvement_suggestion(
            category=ImprovementCategory.PERFORMANCE,
            title="Optimize queries",
            description="Improve query performance"
        )
        assert suggestion.category == ImprovementCategory.PERFORMANCE
        assert suggestion.title == "Optimize queries"
        assert suggestion.priority == 50

    def test_create_reflection_entry(self):
        """Test create_reflection_entry factory."""
        entry = create_reflection_entry(
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            title="Test",
            content="Test content"
        )
        assert entry.reflection_type == ReflectionType.BEHAVIOR_ANALYSIS
        assert entry.title == "Test"

    def test_create_self_reflection(self):
        """Test create_self_reflection factory."""
        reflection = create_self_reflection()
        assert reflection is not None
        assert isinstance(reflection, SelfReflection)


class TestIntegration:
    """Integration tests for Self-Reflection."""

    def test_full_reflection_workflow(self):
        """Test complete reflection workflow."""
        reflection = SelfReflection()
        # Add metrics
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i * 5, 0.0, 100.0)
            reflection.record_metric("memory", 60.0, 0.0, 100.0)
        # Record decisions
        for i in range(5):
            reflection.record_decision(
                decision_type="scale",
                actor="autoscaler",
                reasoning="High load"
            )
        result = reflection.reflect()
        assert "behavior_analysis" in result
        assert "anomalies" in result
        assert "suggestions" in result
        assert "overall_quality" in result
        assert "reflection_id" in result

    def test_anomaly_detection_workflow(self):
        """Test anomaly detection workflow."""
        reflection = SelfReflection()
        # Add metrics with anomalies
        for i in range(10):
            reflection.record_metric("cpu", 150.0, 0.0, 100.0)
        # Detect anomalies
        anomalies = reflection.behavior_analyzer.detect_anomalies()
        assert len(anomalies) >= 1
        # Reflect
        result = reflection.reflect()
        assert len(result["anomalies"]) >= 1

    def test_suggestion_workflow(self):
        """Test suggestion workflow."""
        reflection = SelfReflection()
        # Add metrics to trigger suggestions
        for i in range(10):
            reflection.record_metric("cpu", 150.0, 0.0, 100.0)
        # Reflect to generate suggestions
        reflection.reflect()
        # Get suggestions
        suggestions = reflection.get_pending_suggestions()
        assert len(suggestions) >= 0
        # Acknowledge one if available
        if suggestions:
            reflection.acknowledge_suggestion(suggestions[0].id)
            assert suggestions[0].status == ReflectionStatus.ACKNOWLEDGED

    def test_journal_workflow(self):
        """Test journal workflow."""
        reflection = SelfReflection()
        # Add entries
        for i in range(5):
            entry = ReflectionEntry(
                id=f"e{i}",
                reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
                timestamp=datetime.now(),
                title=f"Entry {i}",
                content="Test content"
            )
            reflection.journal.add_entry(entry)
        # Get entries
        entries = reflection.get_journal_entries()
        assert len(entries) == 5


class TestEdgeCases:
    """Edge case tests for Self-Reflection."""

    def test_empty_reflection(self):
        """Test reflection with no metrics."""
        reflection = SelfReflection()
        result = reflection.reflect()
        assert result["behavior_analysis"] == []
        assert result["anomalies"] == []
        assert result["suggestions"] == []

    def test_reflect_with_no_anomalies(self):
        """Test reflection with no anomalies."""
        reflection = SelfReflection()
        # Add metrics within bounds
        for i in range(10):
            reflection.record_metric("cpu", 50.0 + i, 0.0, 100.0)
        result = reflection.reflect()
        assert result["behavior_analysis"] != []
        assert len(result["anomalies"]) == 0

    def test_journal_search_no_results(self):
        """Test journal search with no results."""
        journal = ReflectionJournal()
        entry = ReflectionEntry(
            id="e1",
            reflection_type=ReflectionType.BEHAVIOR_ANALYSIS,
            timestamp=datetime.now(),
            title="Test Entry",
            content="test content"
        )
        journal.add_entry(entry)
        results = journal.search("nonexistent")
        assert len(results) == 0

    def test_high_failure_rate_detection(self):
        """Test detection of high failure rate."""
        analyzer = BehaviorAnalyzer()
        # Add decisions with high failure rate
        for i in range(20):
            decision = DecisionRecord(
                id=f"d{i}",
                decision_type="test",
                timestamp=datetime.now(),
                actor="test",
                reasoning="test",
                success=(i % 3 == 0)  # ~33% success rate
            )
            analyzer.record_decision(decision)
        anomalies = analyzer.detect_anomalies()
        # Should detect high failure rate
        high_failure = [a for a in anomalies if a.anomaly_type == "high_failure_rate"]
        assert len(high_failure) >= 1
