# tests/test_hot_swap_manager.py
import tempfile
from pathlib import Path

import pytest

from systems.sisyphus.hot_swap_manager import HotSwapManager
from systems.sisyphus.kernel_rewriter import RewriteProposal


class TestHotSwapManager:
    def setup_method(self):
        self.temp_dir = tempfile.mkdtemp()
        self.manager = HotSwapManager(backup_dir=self.temp_dir)

    def test_create_backup(self):
        """Test creating a backup of original code."""
        test_file = Path(self.temp_dir) / "test.rs"
        test_file.write_text("fn original() {}")

        backup_path = self.manager.create_backup(str(test_file))

        assert Path(backup_path).exists()
        assert Path(backup_path).read_text() == "fn original() {}"

    def test_apply_rewrite(self):
        """Test applying a rewrite proposal."""
        test_file = Path(self.temp_dir) / "target.rs"
        test_file.write_text("""
fn old_function() -> i32 {
    1
}
""")

        proposal = RewriteProposal(
            original_function="old_function",
            optimized_code="fn old_function() -> i32 { 2 }",
            source_file=str(test_file),
            source_line=1,
            expected_speedup=2.0,
            confidence=0.9
        )

        success = self.manager.apply_rewrite(proposal)

        assert success == True
        content = test_file.read_text()
        assert "fn old_function() -> i32 { 2 }" in content

    def test_rollback(self):
        """Test rolling back a rewrite."""
        test_file = Path(self.temp_dir) / "rollback.rs"
        test_file.write_text("fn target() { original }")

        backup = self.manager.create_backup(str(test_file))

        # Modify file
        test_file.write_text("fn target() { modified }")

        # Rollback
        result = self.manager.rollback(str(test_file), backup)

        assert result == True
        assert "original" in test_file.read_text()

    def test_get_active_rewrites(self):
        """Test tracking active rewrites."""
        test_file = Path(self.temp_dir) / "track.rs"
        test_file.write_text("fn tracked() {}")

        proposal = RewriteProposal(
            original_function="tracked",
            optimized_code="fn tracked() { /* optimized */ }",
            source_file=str(test_file),
            source_line=1,
            expected_speedup=1.5,
            confidence=0.8
        )

        self.manager.apply_rewrite(proposal)
        active = self.manager.get_active_rewrites()

        assert len(active) == 1
        assert active[0].proposal.original_function == "tracked"
        assert active[0].rolled_back == False


if __name__ == "__main__":
    pytest.main([__file__])
