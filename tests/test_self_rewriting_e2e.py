"""
End-to-End Test: Self-Rewriting Kernel Pipeline

Verifies the complete pipeline:
1. Performance monitor detects hot spot
2. Kernel rewriter generates optimization
3. Hot-swap manager applies change
4. Rollback capability
"""

import pytest
import tempfile
from pathlib import Path
from systems.sisyphus.performance_monitor import PerformanceMonitor, HotSpot
from systems.sisyphus.kernel_rewriter import KernelRewriter, RewriteProposal
from systems.sisyphus.hot_swap_manager import HotSwapManager


class TestSelfRewritingE2E:
    """End-to-end tests for the self-rewriting kernel pipeline."""

    def test_full_pipeline(self):
        """Test the complete self-rewriting pipeline."""
        # Setup
        temp_dir = tempfile.mkdtemp()
        test_file = Path(temp_dir) / "kernel.rs"
        test_file.write_text("""fn slow_function(n: u32) -> u32 {
    let mut result = 0;
    for i in 0..n {
        result += i;
    }
    result
}
""")

        monitor = PerformanceMonitor()
        rewriter = KernelRewriter()
        swap_manager = HotSwapManager(backup_dir=temp_dir)

        # 1. Simulate hot spot detection
        monitor.register_function("slow_function", str(test_file), 1)
        for _ in range(1000):
            monitor.record_call("slow_function", 5.0)

        hot_spots = monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=1.0)
        assert len(hot_spots) == 1

        # 2. Generate optimization (mocked - in production would call LM Studio)
        optimized_code = "fn slow_function(n: u32) -> u32 { n * (n - 1) / 2 }"

        # 3. Create and apply proposal
        proposal = RewriteProposal(
            original_function="slow_function",
            optimized_code=optimized_code,
            source_file=str(test_file),
            source_line=1,
            expected_speedup=10.0,
            confidence=0.95
        )

        success = swap_manager.apply_rewrite(proposal)
        assert success == True

        # 4. Verify change was applied
        new_content = test_file.read_text()
        assert "n * (n - 1) / 2" in new_content

        # 5. Verify backup exists and active rewrites tracked
        assert len(swap_manager.get_active_rewrites()) == 1

    def test_backup_and_rollback(self):
        """Test backup creation and rollback functionality."""
        temp_dir = tempfile.mkdtemp()
        test_file = Path(temp_dir) / "target.rs"
        original_content = "fn original() -> i32 { 1 }"
        test_file.write_text(original_content)

        swap_manager = HotSwapManager(backup_dir=temp_dir)

        # Create backup
        backup_path = swap_manager.create_backup(str(test_file))
        assert Path(backup_path).exists()

        # Apply rewrite
        proposal = RewriteProposal(
            original_function="original",
            optimized_code="fn original() -> i32 { 2 }",
            source_file=str(test_file),
            source_line=1,
            expected_speedup=1.5,
            confidence=0.9
        )

        success = swap_manager.apply_rewrite(proposal)
        assert success == True
        assert "2 }" in test_file.read_text()

        # Rollback
        rollback_success = swap_manager.rollback(str(test_file), backup_path)
        assert rollback_success == True
        assert test_file.read_text() == original_content

    def test_syntax_validation_catches_errors(self):
        """Test that syntax validation catches invalid generated code."""
        rewriter = KernelRewriter()

        # Valid Rust code
        valid_code = "fn test() -> i32 { 42 }"
        assert rewriter.validate_syntax(valid_code, language="rust") == True

        # Invalid Rust code (mismatched braces)
        invalid_code = "fn test( -> i32 { missing paren"
        assert rewriter.validate_syntax(invalid_code, language="rust") == False

        # Invalid Rust code (no function)
        no_function = "let x = 5;"
        assert rewriter.validate_syntax(no_function, language="rust") == False

    def test_hot_spot_scoring(self):
        """Test that hot spots are scored correctly by urgency."""
        monitor = PerformanceMonitor()

        # Register functions
        monitor.register_function("hot_func", "test.rs", 10)
        monitor.register_function("warm_func", "test.rs", 20)

        # Hot function: high call count, high avg time
        for _ in range(10000):
            monitor.record_call("hot_func", 10.0)

        # Warm function: medium call count, low avg time
        for _ in range(1000):
            monitor.record_call("warm_func", 1.0)

        hot_spots = monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=0.5)

        # Hot function should be first due to higher hotspot_score
        assert len(hot_spots) >= 2
        assert hot_spots[0].function_name == "hot_func"
        assert hot_spots[0].hotspot_score > hot_spots[1].hotspot_score

    def test_proposal_creation_from_hot_spot(self):
        """Test creating a rewrite proposal from a detected hot spot."""
        rewriter = KernelRewriter()

        hot_spot = HotSpot(
            function_name="expensive_kernel",
            call_count=50000,
            total_time_ms=250000.0,
            avg_time_ms=5.0,
            source_file="kernels/hilbert.rs",
            source_line=42
        )

        optimized_code = "fn expensive_kernel(n: u32) -> u32 { n.saturating_mul(2) }"

        proposal = rewriter.create_proposal(hot_spot, optimized_code, confidence=0.85)

        assert proposal.original_function == "expensive_kernel"
        assert proposal.source_file == "kernels/hilbert.rs"
        assert proposal.source_line == 42
        assert proposal.confidence == 0.85
        assert "saturating_mul" in proposal.optimized_code


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
