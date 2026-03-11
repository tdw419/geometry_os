"""Tests for Foundry Safety System."""
import pytest

from systems.foundry.forge import ForgeTarget
from systems.foundry.safety import SafetyChecker, SafetyLevel


class TestSafetyLevel:
    """Test SafetyLevel enum."""

    def test_level_values(self):
        """SafetyLevel should have expected values."""
        assert SafetyLevel.PERMISSIVE.value == "permissive"
        assert SafetyLevel.MODERATE.value == "moderate"
        assert SafetyLevel.STRICT.value == "strict"

    def test_level_count(self):
        """Should have 3 safety levels."""
        assert len(SafetyLevel) == 3


class TestSafetyChecker:
    """Test SafetyChecker class."""

    @pytest.fixture
    def checker(self):
        """Create a SafetyChecker instance."""
        return SafetyChecker()

    def test_checker_creation(self, checker):
        """SafetyChecker should be created successfully."""
        assert checker is not None

    def test_default_level_is_moderate(self, checker):
        """Default safety level should be MODERATE."""
        assert checker.get_level() == SafetyLevel.MODERATE

    def test_set_level(self, checker):
        """set_level should change the level."""
        checker.set_level(SafetyLevel.STRICT)
        assert checker.get_level() == SafetyLevel.STRICT

        checker.set_level(SafetyLevel.PERMISSIVE)
        assert checker.get_level() == SafetyLevel.PERMISSIVE


class TestBlockedPatterns:
    """Test blocked pattern detection."""

    @pytest.fixture
    def checker(self):
        return SafetyChecker()

    def test_blocks_rm_rf(self, checker):
        """Should block rm -rf commands."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "some code with rm -rf / inside"
        )
        assert not is_safe
        assert "rm" in reason.lower()

    def test_blocks_exec(self, checker):
        """Should block exec() calls."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "exec(malicious_code)"
        )
        assert not is_safe
        assert "exec" in reason.lower()

    def test_blocks_eval(self, checker):
        """Should block eval() calls."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "eval(user_input)"
        )
        assert not is_safe
        assert "eval" in reason.lower()

    def test_blocks_os_system(self, checker):
        """Should block os.system calls."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "os.system('rm -rf')"
        )
        assert not is_safe

    def test_blocks_pickle_loads(self, checker):
        """Should block pickle.loads calls."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "pickle.loads(untrusted_data)"
        )
        assert not is_safe
        assert "pickle" in reason.lower()

    def test_allows_safe_code(self, checker):
        """Should allow safe code."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "@compute @workgroup_size(64)\nfn main() {}"
        )
        assert is_safe


class TestEscalationPatterns:
    """Test escalation pattern detection."""

    @pytest.fixture
    def checker(self):
        c = SafetyChecker()
        c.set_level(SafetyLevel.MODERATE)
        return c

    def test_escalates_delete_all(self, checker):
        """Should escalate delete_all patterns."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.STRATEGY,
            "delete_all_data()"
        )
        assert not is_safe
        assert "approval" in reason.lower() or "escalat" in reason.lower()

    def test_escalates_truncate(self, checker):
        """Should escalate truncate patterns."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.STRATEGY,
            "truncate_table()"
        )
        assert not is_safe

    def test_permissive_allows_escalation(self, checker):
        """PERMISSIVE mode should allow escalation patterns."""
        checker.set_level(SafetyLevel.PERMISSIVE)
        is_safe, _ = checker.check_patch(
            ForgeTarget.STRATEGY,
            "delete_all_data()"
        )
        assert is_safe


class TestSizeLimits:
    """Test content size limits."""

    @pytest.fixture
    def checker(self):
        return SafetyChecker()

    def test_rejects_oversized_shader(self, checker):
        """Should reject shaders over size limit."""
        huge_content = "// " + "x" * (200 * 1024)  # 200KB of comments
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            huge_content
        )
        assert not is_safe
        assert "large" in reason.lower() or "size" in reason.lower()

    def test_accepts_normal_sized_shader(self, checker):
        """Should accept normal sized shaders."""
        normal_content = "fn main() {}" * 100
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            normal_content
        )
        assert is_safe


class TestCriticalFiles:
    """Test critical file protection."""

    @pytest.fixture
    def checker(self):
        c = SafetyChecker()
        c.set_level(SafetyLevel.STRICT)
        return c

    def test_blocks_critical_file_modification(self, checker):
        """Should block modification of critical files."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "# Modified safety checker",
            path="safety.py"
        )
        assert not is_safe
        assert "critical" in reason.lower() or "approval" in reason.lower()

    def test_allows_non_critical_files(self, checker):
        """Should allow modification of non-critical files."""
        # In STRICT mode, shaders need entry points
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "@compute @workgroup_size(1)\nfn main() {}",
            path="regular_shader.wgsl"
        )
        assert is_safe


class TestWGSLValidation:
    """Test WGSL-specific validation."""

    @pytest.fixture
    def checker(self):
        c = SafetyChecker()
        c.set_level(SafetyLevel.MODERATE)
        return c

    def test_rejects_infinite_loop(self, checker):
        """Should reject potential infinite loops."""
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "loop { }"  # Empty infinite loop
        )
        assert not is_safe
        assert "loop" in reason.lower()

    def test_validates_syntax_method(self, checker):
        """validate_wgsl_syntax should work."""
        is_valid, errors = checker.validate_wgsl_syntax(
            "@compute @workgroup_size(1)\nfn main() {}"
        )
        assert is_valid
        assert len(errors) == 0

    def test_detects_unbalanced_braces(self, checker):
        """Should detect unbalanced braces."""
        is_valid, errors = checker.validate_wgsl_syntax(
            "fn main() {"
        )
        assert not is_valid
        assert any("brace" in e.lower() for e in errors)

    def test_detects_missing_entry_point(self, checker):
        """Should detect missing entry point."""
        is_valid, errors = checker.validate_wgsl_syntax(
            "fn helper() {}"
        )
        assert not is_valid
        assert any("entry" in e.lower() for e in errors)


class TestGeoASMValidation:
    """Test GeoASM-specific validation."""

    @pytest.fixture
    def checker(self):
        return SafetyChecker()

    def test_validates_geoasm_syntax(self, checker):
        """validate_geoasm_syntax should work."""
        is_valid, errors = checker.validate_geoasm_syntax(
            "EMBED R0, R1\nSAMPLE R1, R2"
        )
        assert is_valid

    def test_detects_unknown_opcode(self, checker):
        """Should detect unknown opcodes."""
        is_valid, errors = checker.validate_geoasm_syntax(
            "INVALID_OP R0, R1"
        )
        assert not is_valid
        assert any("unknown" in e.lower() or "invalid" in e.lower() for e in errors)

    def test_rejects_oversized_program(self, checker):
        """Should reject very large programs."""
        huge_program = "\n".join(["EMBED R0, R1"] * 20000)
        is_safe, reason = checker.check_patch(
            ForgeTarget.GEOASM,
            huge_program
        )
        assert not is_safe


class TestApprovalSystem:
    """Test approval system."""

    @pytest.fixture
    def checker(self):
        c = SafetyChecker()
        c.set_level(SafetyLevel.STRICT)
        return c

    def test_request_approval(self, checker):
        """request_approval should create a request."""
        request_id = checker.request_approval("op123", "Test reason")
        assert request_id.startswith("approval_")
        assert "op123" in request_id

    def test_approve_request(self, checker):
        """approve should mark request as approved."""
        request_id = checker.request_approval("op456", "Test")
        success = checker.approve(request_id)
        assert success
        assert checker.is_approved("op456")

    def test_deny_request(self, checker):
        """deny should mark request as denied."""
        request_id = checker.request_approval("op789", "Test")
        success = checker.deny(request_id)
        assert success
        assert not checker.is_approved("op789")

    def test_get_pending_approvals(self, checker):
        """get_pending_approvals should return pending requests."""
        checker.request_approval("pending1", "Test 1")
        checker.request_approval("pending2", "Test 2")

        pending = checker.get_pending_approvals()
        assert len(pending) >= 2

    def test_clear_approvals(self, checker):
        """clear_approvals should remove all approvals."""
        checker.approve(checker.request_approval("clear_test", "Test"))
        checker.clear_approvals()
        assert not checker.is_approved("clear_test")


class TestSafetyStats:
    """Test safety statistics."""

    @pytest.fixture
    def checker(self):
        return SafetyChecker()

    def test_stats_initial_state(self, checker):
        """Stats should have correct initial state."""
        stats = checker.get_stats()
        assert stats['level'] == SafetyLevel.MODERATE.value
        assert stats['blocked_count'] == 0

    def test_stats_tracks_blocked(self, checker):
        """Stats should track blocked operations."""
        checker.check_patch(ForgeTarget.SHADER, "exec(bad)")
        stats = checker.get_stats()
        assert stats['blocked_count'] == 1

    def test_stats_tracks_approvals(self, checker):
        """Stats should track approvals."""
        request_id = checker.request_approval("test", "Test")
        checker.approve(request_id)
        stats = checker.get_stats()
        assert stats['total_approvals'] == 1


class TestCustomPatterns:
    """Test custom pattern management."""

    @pytest.fixture
    def checker(self):
        return SafetyChecker()

    def test_add_blocked_pattern(self, checker):
        """add_blocked_pattern should add new pattern."""
        checker.add_blocked_pattern(r'custom_danger')
        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "custom_danger code"
        )
        assert not is_safe

    def test_remove_blocked_pattern(self, checker):
        """remove_blocked_pattern should remove pattern."""
        checker.add_blocked_pattern(r'temporary_block')
        checker.remove_blocked_pattern(r'temporary_block')
        is_safe, _ = checker.check_patch(
            ForgeTarget.SHADER,
            "temporary_block code"
        )
        assert is_safe

    def test_add_critical_file(self, checker):
        """add_critical_file should add to critical list."""
        checker.set_level(SafetyLevel.STRICT)
        checker.add_critical_file("my_important_file.py")

        is_safe, reason = checker.check_patch(
            ForgeTarget.SHADER,
            "// safe code",
            path="my_important_file.py"
        )
        assert not is_safe
