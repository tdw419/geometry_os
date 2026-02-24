# tests/swarm/ctp/test_simulation.py
"""Tests for CTP simulation phases."""
import pytest
from systems.swarm.ctp.simulation import CTPSimulationRunner


class TestCTPSimulationRunner:
    """Test simulation runner functionality."""

    @pytest.fixture
    def runner(self, tmp_path):
        """Create simulation runner with temp output dir."""
        return CTPSimulationRunner(output_dir=str(tmp_path / "ctp_sim"))

    def test_runner_initialization(self, runner):
        """Runner should initialize with phases."""
        assert len(runner.PHASES) == 4
        assert "ARCHITECTURE_VALIDATE" in runner.PHASES
        assert "PERFORMANCE_PREDICT" in runner.PHASES
        assert "EDGE_CASE_EXPLORE" in runner.PHASES
        assert "HILBERT_COHERENCE" in runner.PHASES

    def test_architecture_validate_phase(self, runner):
        """Run architecture validation phase."""
        result = runner.run_architecture_validate()
        assert result["phase"] == "ARCHITECTURE_VALIDATE"
        assert "passed" in result
        assert "tests" in result

    def test_performance_predict_phase(self, runner):
        """Run performance prediction phase."""
        result = runner.run_performance_predict()
        assert result["phase"] == "PERFORMANCE_PREDICT"
        assert "overhead_percent" in result
        # ASCII overhead is higher than JSON but acceptable for AI readability
        # Target: <75% overhead (realistic for ASCII-first design with variability)
        assert result["overhead_percent"] < 75

    def test_edge_case_explore_phase(self, runner):
        """Run edge case exploration phase."""
        result = runner.run_edge_case_explore()
        assert result["phase"] == "EDGE_CASE_EXPLORE"
        assert "scenarios_run" in result
        assert result["scenarios_run"] >= 4  # At least 4 scenarios

    def test_hilbert_coherence_phase(self, runner):
        """Run Hilbert coherence phase."""
        result = runner.run_hilbert_coherence()
        assert result["phase"] == "HILBERT_COHERENCE"
        assert "coherence_score" in result
        assert result["coherence_score"] > 0.99  # Target: >99%

    def test_generate_report(self, runner):
        """Generate final report."""
        runner.run_architecture_validate()
        runner.run_performance_predict()
        runner.run_edge_case_explore()
        runner.run_hilbert_coherence()

        report = runner.generate_report()
        assert "overall_status" in report
        assert "phases" in report
        assert len(report["phases"]) == 4

    def test_all_pass_gives_pass_status(self, runner):
        """All phases passing should give PASS status."""
        runner._results["ARCHITECTURE_VALIDATE"] = {"passed": True}
        runner._results["PERFORMANCE_PREDICT"] = {"passed": True}
        runner._results["EDGE_CASE_EXPLORE"] = {"passed": True}
        runner._results["HILBERT_COHERENCE"] = {"passed": True}

        report = runner.generate_report()
        assert report["overall_status"] == "PASS"

    def test_any_fail_gives_fail_status(self, runner):
        """Any phase failing should give FAIL status."""
        runner._results["ARCHITECTURE_VALIDATE"] = {"passed": True}
        runner._results["PERFORMANCE_PREDICT"] = {"passed": False}
        runner._results["EDGE_CASE_EXPLORE"] = {"passed": True}
        runner._results["HILBERT_COHERENCE"] = {"passed": True}

        report = runner.generate_report()
        assert report["overall_status"] == "FAIL"
