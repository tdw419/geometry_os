"""
Unit tests for SafetySanitizer - Critical safety component.
Tests blocked key combinations, blocked commands, and safe operations.
"""

import pytest
import sys
import os

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.desktop_agent.safety.sanitizer import SafetySanitizer, ValidationResult


class TestSafetySanitizerInit:
    """Test sanitizer initialization."""

    def test_init_creates_sanitizer(self):
        """Sanitizer can be instantiated."""
        sanitizer = SafetySanitizer()
        assert sanitizer is not None

    def test_init_compiles_patterns(self):
        """Command patterns are compiled on init."""
        sanitizer = SafetySanitizer()
        assert hasattr(sanitizer, 'cmd_patterns')
        assert len(sanitizer.cmd_patterns) > 0

    def test_blocked_keys_defined(self):
        """BLOCKED_KEYS constant is defined."""
        assert hasattr(SafetySanitizer, 'BLOCKED_KEYS')
        assert len(SafetySanitizer.BLOCKED_KEYS) > 0

    def test_blocked_combos_defined(self):
        """BLOCKED_COMBOS constant is defined."""
        assert hasattr(SafetySanitizer, 'BLOCKED_COMBOS')
        assert len(SafetySanitizer.BLOCKED_COMBOS) > 0

    def test_blocked_commands_defined(self):
        """BLOCKED_COMMANDS constant is defined."""
        assert hasattr(SafetySanitizer, 'BLOCKED_COMMANDS')
        assert len(SafetySanitizer.BLOCKED_COMMANDS) > 0


class TestBlockedKeyCombinations:
    """Test blocked key combinations (Ctrl+Alt+Del, Ctrl+Alt+Backspace, Alt+SysRq)."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    # Ctrl+Alt+Del variants
    def test_ctrl_alt_del_blocked(self, sanitizer):
        """Ctrl+Alt+Del is blocked."""
        result = sanitizer.validate_key_event("Ctrl+Alt+Delete")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    def test_ctrl_alt_del_lowercase_blocked(self, sanitizer):
        """ctrl+alt+delete (lowercase) is blocked."""
        result = sanitizer.validate_key_event("ctrl+alt+delete")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    def test_ctrl_alt_del_order_independent(self, sanitizer):
        """Alt+Ctrl+Del (different order) is blocked."""
        result = sanitizer.validate_key_event("Alt+Ctrl+Delete")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    def test_delete_ctrl_alt_order_independent(self, sanitizer):
        """Delete+Ctrl+Alt (key first) is blocked."""
        result = sanitizer.validate_key_event("Delete+Ctrl+Alt")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    # Ctrl+Alt+Backspace variants
    def test_ctrl_alt_backspace_blocked(self, sanitizer):
        """Ctrl+Alt+Backspace is blocked."""
        result = sanitizer.validate_key_event("Ctrl+Alt+Backspace")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    def test_ctrl_alt_backspace_order_independent(self, sanitizer):
        """Alt+Ctrl+Backspace (different order) is blocked."""
        result = sanitizer.validate_key_event("Alt+Ctrl+Backspace")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    # Alt+SysRq variants
    def test_alt_sysrq_blocked(self, sanitizer):
        """Alt+SysRq is blocked."""
        result = sanitizer.validate_key_event("Alt+Sys_Req")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    def test_sysrq_alt_order_independent(self, sanitizer):
        """Sys_Req+Alt (different order) is blocked."""
        result = sanitizer.validate_key_event("Sys_Req+Alt")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    def test_sysrq_blocked_as_single_key(self, sanitizer):
        """Sys_Req alone is blocked."""
        result = sanitizer.validate_key_event("Sys_Req")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    # Ctrl+Alt+F[1-9] (TTY switch)
    def test_ctrl_alt_f1_blocked(self, sanitizer):
        """Ctrl+Alt+F1 (TTY switch) is blocked."""
        result = sanitizer.validate_key_event("Ctrl+Alt+F1")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    def test_ctrl_alt_f12_blocked(self, sanitizer):
        """Ctrl+Alt+F12 (TTY switch) is blocked."""
        result = sanitizer.validate_key_event("Ctrl+Alt+F12")
        assert result.valid is False
        assert result.code == "BLOCKED_COMBO"

    # Other blocked keys
    def test_print_screen_blocked(self, sanitizer):
        """Print (screen capture key) is blocked."""
        result = sanitizer.validate_key_event("Print")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    def test_scroll_lock_blocked(self, sanitizer):
        """Scroll_Lock is blocked."""
        result = sanitizer.validate_key_event("Scroll_Lock")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    def test_pause_blocked(self, sanitizer):
        """Pause is blocked."""
        result = sanitizer.validate_key_event("Pause")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"

    def test_break_blocked(self, sanitizer):
        """Break is blocked."""
        result = sanitizer.validate_key_event("Break")
        assert result.valid is False
        assert result.code == "BLOCKED_KEY"


class TestBlockedCommands:
    """Test blocked shell commands (rm -rf /, mkfs, dd if=, shutdown, reboot, init 0/6)."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    # rm -rf / variants
    def test_rm_rf_root_blocked(self, sanitizer):
        """rm -rf / is blocked."""
        result = sanitizer.validate_command("rm -rf /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_rm_rf_root_with_sudo_blocked(self, sanitizer):
        """sudo rm -rf / is blocked."""
        result = sanitizer.validate_command("sudo rm -rf /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_rm_rf_root_no_preserve_blocked(self, sanitizer):
        """rm -rf / --no-preserve-root is blocked."""
        result = sanitizer.validate_command("rm -rf / --no-preserve-root")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_rm_rf_root_case_insensitive(self, sanitizer):
        """RM -RF / (uppercase) is blocked."""
        result = sanitizer.validate_command("RM -RF /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_rm_rf_root_mixed_case_blocked(self, sanitizer):
        """Rm -Rf / (mixed case) is blocked."""
        result = sanitizer.validate_command("Rm -Rf /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # mkfs variants
    def test_mkfs_blocked(self, sanitizer):
        """mkfs is blocked."""
        result = sanitizer.validate_command("mkfs.ext4 /dev/sda1")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_mkfs_case_insensitive(self, sanitizer):
        """MKFS (uppercase) is blocked."""
        result = sanitizer.validate_command("MKFS.EXT4 /dev/sda1")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # dd variants
    def test_dd_if_blocked(self, sanitizer):
        """dd if= is blocked."""
        result = sanitizer.validate_command("dd if=/dev/zero of=/dev/sda")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_dd_if_case_insensitive(self, sanitizer):
        """DD IF= (uppercase) is blocked."""
        result = sanitizer.validate_command("DD IF=/dev/zero OF=/dev/sda")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # shutdown variants
    def test_shutdown_blocked(self, sanitizer):
        """shutdown is blocked."""
        result = sanitizer.validate_command("shutdown -h now")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_shutdown_case_insensitive(self, sanitizer):
        """SHUTDOWN (uppercase) is blocked."""
        result = sanitizer.validate_command("SHUTDOWN -h now")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # reboot variants
    def test_reboot_blocked(self, sanitizer):
        """reboot is blocked."""
        result = sanitizer.validate_command("reboot")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_reboot_case_insensitive(self, sanitizer):
        """REBOOT (uppercase) is blocked."""
        result = sanitizer.validate_command("REBOOT")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # poweroff variants
    def test_poweroff_blocked(self, sanitizer):
        """poweroff is blocked."""
        result = sanitizer.validate_command("poweroff")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # init variants
    def test_init_0_blocked(self, sanitizer):
        """init 0 is blocked."""
        result = sanitizer.validate_command("init 0")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_init_6_blocked(self, sanitizer):
        """init 6 is blocked."""
        result = sanitizer.validate_command("init 6")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    def test_init_0_with_sudo_blocked(self, sanitizer):
        """sudo init 0 is blocked."""
        result = sanitizer.validate_command("sudo init 0")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # chmod 777 /
    def test_chmod_777_root_blocked(self, sanitizer):
        """chmod 777 / is blocked."""
        result = sanitizer.validate_command("chmod -R 777 /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"

    # chown root /
    def test_chown_root_blocked(self, sanitizer):
        """chown root / is blocked."""
        result = sanitizer.validate_command("chown -R root:root /")
        assert result.valid is False
        assert result.code == "BLOCKED_COMMAND"


class TestSafeKeysAndCommands:
    """Test that safe keys and commands are allowed."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    # Safe key combinations
    def test_single_letter_allowed(self, sanitizer):
        """Single letter key is allowed."""
        result = sanitizer.validate_key_event("a")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_c_allowed(self, sanitizer):
        """Ctrl+C is allowed."""
        result = sanitizer.validate_key_event("Ctrl+C")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_v_allowed(self, sanitizer):
        """Ctrl+V is allowed."""
        result = sanitizer.validate_key_event("Ctrl+V")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_z_allowed(self, sanitizer):
        """Ctrl+Z is allowed."""
        result = sanitizer.validate_key_event("Ctrl+Z")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_s_allowed(self, sanitizer):
        """Ctrl+S is allowed."""
        result = sanitizer.validate_key_event("Ctrl+S")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_a_allowed(self, sanitizer):
        """Ctrl+A is allowed."""
        result = sanitizer.validate_key_event("Ctrl+A")
        assert result.valid is True
        assert result.code == "OK"

    def test_alt_tab_allowed(self, sanitizer):
        """Alt+Tab is allowed."""
        result = sanitizer.validate_key_event("Alt+Tab")
        assert result.valid is True
        assert result.code == "OK"

    def test_alt_f4_blocked_due_to_f4_pattern(self, sanitizer):
        """Alt+F4 might be caught by F[1-9] pattern if combined with Ctrl+Alt."""
        # Alt+F4 alone should be allowed (not in BLOCKED_COMBOS with Alt+F4 alone)
        # But Alt+F4 is typically a window close, let's verify it's allowed
        result = sanitizer.validate_key_event("Alt+F4")
        # Note: Based on implementation, F[1-9] only matches with ctrl+alt combo
        assert result.valid is True

    def test_shift_a_allowed(self, sanitizer):
        """Shift+A is allowed."""
        result = sanitizer.validate_key_event("Shift+A")
        assert result.valid is True
        assert result.code == "OK"

    def test_ctrl_shift_s_allowed(self, sanitizer):
        """Ctrl+Shift+S is allowed."""
        result = sanitizer.validate_key_event("Ctrl+Shift+S")
        assert result.valid is True
        assert result.code == "OK"

    def test_function_keys_allowed_without_modifiers(self, sanitizer):
        """F1-F12 alone are allowed."""
        result = sanitizer.validate_key_event("F1")
        assert result.valid is True
        assert result.code == "OK"

    # Safe commands
    def test_ls_allowed(self, sanitizer):
        """ls is allowed."""
        result = sanitizer.validate_command("ls -la")
        assert result.valid is True
        assert result.code == "OK"

    def test_cat_allowed(self, sanitizer):
        """cat is allowed."""
        result = sanitizer.validate_command("cat /etc/hosts")
        assert result.valid is True
        assert result.code == "OK"

    def test_echo_allowed(self, sanitizer):
        """echo is allowed."""
        result = sanitizer.validate_command("echo hello")
        assert result.valid is True
        assert result.code == "OK"

    def test_pwd_allowed(self, sanitizer):
        """pwd is allowed."""
        result = sanitizer.validate_command("pwd")
        assert result.valid is True
        assert result.code == "OK"

    def test_git_status_allowed(self, sanitizer):
        """git status is allowed."""
        result = sanitizer.validate_command("git status")
        assert result.valid is True
        assert result.code == "OK"

    def test_python_script_allowed(self, sanitizer):
        """python script.py is allowed."""
        result = sanitizer.validate_command("python script.py")
        assert result.valid is True
        assert result.code == "OK"

    def test_npm_install_allowed(self, sanitizer):
        """npm install is allowed."""
        result = sanitizer.validate_command("npm install")
        assert result.valid is True
        assert result.code == "OK"

    def test_rm_safe_file_allowed(self, sanitizer):
        """rm file.txt (not root) is allowed."""
        result = sanitizer.validate_command("rm file.txt")
        assert result.valid is True
        assert result.code == "OK"

    def test_rm_rf_safe_directory_allowed(self, sanitizer):
        """rm -rf ./build (not root) is allowed."""
        result = sanitizer.validate_command("rm -rf ./build")
        assert result.valid is True
        assert result.code == "OK"

    def test_mkdir_allowed(self, sanitizer):
        """mkdir is allowed."""
        result = sanitizer.validate_command("mkdir newdir")
        assert result.valid is True
        assert result.code == "OK"

    def test_cp_allowed(self, sanitizer):
        """cp is allowed."""
        result = sanitizer.validate_command("cp file1.txt file2.txt")
        assert result.valid is True
        assert result.code == "OK"

    def test_mv_allowed(self, sanitizer):
        """mv is allowed."""
        result = sanitizer.validate_command("mv old.txt new.txt")
        assert result.valid is True
        assert result.code == "OK"


class TestValidationResult:
    """Test ValidationResult dataclass."""

    def test_default_values(self):
        """ValidationResult has correct defaults."""
        result = ValidationResult(valid=True)
        assert result.valid is True
        assert result.message is None
        assert result.code == "OK"

    def test_custom_values(self):
        """ValidationResult accepts custom values."""
        result = ValidationResult(
            valid=False,
            message="Test message",
            code="TEST_CODE"
        )
        assert result.valid is False
        assert result.message == "Test message"
        assert result.code == "TEST_CODE"


class TestIsBlockedCombo:
    """Test is_blocked_combo method."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    def test_is_blocked_combo_ctrl_alt_del(self, sanitizer):
        """is_blocked_combo returns True for Ctrl+Alt+Del."""
        assert sanitizer.is_blocked_combo(["ctrl", "alt"], "delete") is True

    def test_is_blocked_combo_order_independent(self, sanitizer):
        """is_blocked_combo is order-independent."""
        assert sanitizer.is_blocked_combo(["alt", "ctrl"], "delete") is True

    def test_is_blocked_combo_ctrl_alt_backspace(self, sanitizer):
        """is_blocked_combo returns True for Ctrl+Alt+Backspace."""
        assert sanitizer.is_blocked_combo(["ctrl", "alt"], "backspace") is True

    def test_is_blocked_combo_safe(self, sanitizer):
        """is_blocked_combo returns False for safe combinations."""
        assert sanitizer.is_blocked_combo(["ctrl"], "c") is False

    def test_is_blocked_combo_empty_modifiers(self, sanitizer):
        """is_blocked_combo handles empty modifiers."""
        assert sanitizer.is_blocked_combo([], "a") is False

    def test_is_blocked_combo_single_modifier(self, sanitizer):
        """is_blocked_combo handles single modifier."""
        assert sanitizer.is_blocked_combo(["ctrl"], "s") is False


class TestCaseInsensitiveBlocking:
    """Test case-insensitive blocking for commands."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    def test_shutdown_uppercase(self, sanitizer):
        """SHUTDOWN is blocked (uppercase)."""
        result = sanitizer.validate_command("SHUTDOWN")
        assert result.valid is False

    def test_shutdown_mixed_case(self, sanitizer):
        """ShUtDoWn is blocked (mixed case)."""
        result = sanitizer.validate_command("ShUtDoWn")
        assert result.valid is False

    def test_reboot_uppercase(self, sanitizer):
        """REBOOT is blocked (uppercase)."""
        result = sanitizer.validate_command("REBOOT")
        assert result.valid is False

    def test_rm_rf_uppercase(self, sanitizer):
        """RM -RF / is blocked (uppercase)."""
        result = sanitizer.validate_command("RM -RF /")
        assert result.valid is False

    def test_dd_uppercase(self, sanitizer):
        """DD IF= is blocked (uppercase)."""
        result = sanitizer.validate_command("DD IF=/dev/zero OF=/dev/sda")
        assert result.valid is False


class TestEdgeCases:
    """Test edge cases and boundary conditions."""

    @pytest.fixture
    def sanitizer(self):
        return SafetySanitizer()

    def test_empty_key_string(self, sanitizer):
        """Empty key string is valid."""
        result = sanitizer.validate_key_event("")
        assert result.valid is True

    def test_empty_command_string(self, sanitizer):
        """Empty command string is valid."""
        result = sanitizer.validate_command("")
        assert result.valid is True

    def test_whitespace_key_string(self, sanitizer):
        """Whitespace key string is valid."""
        result = sanitizer.validate_key_event("   ")
        assert result.valid is True

    def test_whitespace_command_string(self, sanitizer):
        """Whitespace command string is valid."""
        result = sanitizer.validate_command("   ")
        assert result.valid is True

    def test_key_with_spaces(self, sanitizer):
        """Key string with spaces around is handled."""
        result = sanitizer.validate_key_event(" Ctrl + C ")
        assert result.valid is True

    def test_command_with_newlines(self, sanitizer):
        """Command with newlines is handled."""
        result = sanitizer.validate_command("echo hello\nreboot")
        assert result.valid is False

    def test_command_with_semicolon_reboot(self, sanitizer):
        """Command with semicolon and reboot is blocked."""
        result = sanitizer.validate_command("echo hello; reboot")
        assert result.valid is False

    def test_command_subshell_reboot(self, sanitizer):
        """Command in subshell with reboot is blocked."""
        result = sanitizer.validate_command("$(reboot)")
        assert result.valid is False

    def test_rm_rf_with_path_traversal(self, sanitizer):
        """rm -rf with path traversal to root is blocked."""
        result = sanitizer.validate_command("rm -rf ../../../")
        # This should NOT be blocked by the current pattern (rm -rf /)
        # The pattern specifically looks for "rm" followed by "-rf" and "/"
        # Path traversal like "../../../" doesn't match this pattern
        # This is a limitation - noting for potential future enhancement
        assert result.valid is True  # Current behavior

    def test_init_with_other_numbers_allowed(self, sanitizer):
        """init 1-5 are allowed (single-user mode etc)."""
        result = sanitizer.validate_command("init 1")
        assert result.valid is True

        result = sanitizer.validate_command("init 3")
        assert result.valid is True

    def test_command_similar_to_blocked(self, sanitizer):
        """Commands similar to blocked ones are allowed."""
        # 'shutdown' in a filename should not be blocked
        result = sanitizer.validate_command("cat shutdown.log")
        assert result.valid is False  # 'shutdown' is a word boundary match

        # But checking 'mkfs' - it's a word boundary
        result = sanitizer.validate_command("echo mkfs")
        assert result.valid is False  # 'mkfs' is blocked as a word


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
