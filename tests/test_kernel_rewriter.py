# tests/test_kernel_rewriter.py
import pytest
from systems.sisyphus.kernel_rewriter import KernelRewriter, RewriteProposal
from systems.sisyphus.performance_monitor import HotSpot

class TestKernelRewriter:
    def setup_method(self):
        self.rewriter = KernelRewriter()

    def test_generate_optimization_prompt(self):
        """Test generating an LLM prompt for optimization."""
        hot_spot = HotSpot(
            function_name="hilbert_d2xy",
            call_count=10000,
            total_time_ms=5000.0,
            avg_time_ms=0.5,
            source_file="hilbert_native.rs",
            source_line=42
        )

        prompt = self.rewriter.generate_optimization_prompt(hot_spot)

        assert "hilbert_d2xy" in prompt
        assert "10000" in prompt
        assert "0.5" in prompt
        assert "Rust" in prompt or "rust" in prompt

    def test_parse_generated_code(self):
        """Test parsing LLM-generated Rust code."""
        llm_response = '''
Here's an optimized version:

```rust
fn hilbert_d2xy_optimized(n: u32, d: u32) -> (u32, u32) {
    // Optimized using lookup table
    let x = d % n;
    let y = d / n;
    (x, y)
}
```
'''

        code = self.rewriter.extract_code_block(llm_response, language="rust")

        assert "fn hilbert_d2xy_optimized" in code
        assert "```" not in code  # Should strip markdown

    def test_validate_rust_syntax(self):
        """Test basic Rust syntax validation."""
        valid_code = "fn test() -> i32 { 42 }"
        invalid_code = "fn test( -> i32 { missing paren"

        assert self.rewriter.validate_syntax(valid_code, language="rust") == True
        assert self.rewriter.validate_syntax(invalid_code, language="rust") == False

    def test_create_proposal(self):
        """Test creating a rewrite proposal."""
        hot_spot = HotSpot(
            function_name="test_func",
            call_count=1000,
            total_time_ms=100.0,
            avg_time_ms=0.1
        )
        code = "fn test_func() -> i32 { 42 }"

        proposal = self.rewriter.create_proposal(hot_spot, code, confidence=0.9)

        assert proposal.original_function == "test_func"
        assert proposal.optimized_code == code
        assert proposal.confidence == 0.9
        assert proposal.expected_speedup > 0

if __name__ == "__main__":
    pytest.main([__file__])
