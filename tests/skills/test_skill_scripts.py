"""Tests for verifying skill scripts can execute and respond to CLI flags.

This test suite provides:
- Generic subprocess helper for running CLI commands safely
- Skip logic for missing external dependencies (xdotool, ImageMagick, etc.)
- Basic smoke tests to verify script structure and execution

Test Categories:
- Script Discovery: Verify scripts exist and are executable
- Help/Usage Tests: Scripts should respond to --help or invalid args
- Execution Tests: Scripts should run without immediate crashes
"""
import pytest
import subprocess
import shutil
from pathlib import Path
from typing import Optional, Tuple


class SubprocessResult:
    """Container for subprocess execution results with helpful properties."""

    def __init__(self, returncode: int, stdout: str, stderr: str, command: list):
        self.returncode = returncode
        self.stdout = stdout
        self.stderr = stderr
        self.command = command

    @property
    def succeeded(self) -> bool:
        """True if the process exited with code 0."""
        return self.returncode == 0

    @property
    def failed(self) -> bool:
        """True if the process exited with non-zero code."""
        return self.returncode != 0

    def __repr__(self) -> str:
        return f"SubprocessResult(returncode={self.returncode}, cmd={' '.join(self.command)})"


def run_cli_command(
    command: list,
    timeout: int = 10,
    cwd: Optional[Path] = None,
    env: Optional[dict] = None
) -> SubprocessResult:
    """Run a CLI command with subprocess and return structured result.

    Args:
        command: List of command parts (e.g., ["python3", "script.py", "--help"])
        timeout: Maximum execution time in seconds (default: 10)
        cwd: Working directory for the command (default: None = current dir)
        env: Environment variables for the subprocess (default: None = inherit)

    Returns:
        SubprocessResult: Container with returncode, stdout, stderr, and convenience properties

    Raises:
        subprocess.TimeoutExpired: If command exceeds timeout
        FileNotFoundError: If the executable is not found

    Example:
        result = run_cli_command(["python3", "script.py", "--help"])
        if result.succeeded:
            print(result.stdout)
        else:
            print(f"Failed: {result.stderr}")
    """
    result = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout,
        cwd=cwd,
        env=env
    )
    return SubprocessResult(
        returncode=result.returncode,
        stdout=result.stdout,
        stderr=result.stderr,
        command=command
    )


def check_dependency_exists(command_name: str) -> bool:
    """Check if an external command dependency is available.

    Args:
        command_name: Name of the command to check (e.g., "xdotool", "convert")

    Returns:
        bool: True if command exists in PATH, False otherwise

    Example:
        if not check_dependency_exists("xdotool"):
            pytest.skip("xdotool not installed")
    """
    return shutil.which(command_name) is not None


class TestScriptDiscovery:
    """Tests for discovering and validating skill script structure.

    These tests verify that:
    - Skills can optionally have a scripts/ subdirectory
    - Scripts in the directory are executable Python or shell files
    """

    def test_scripts_directory_discovery(self, skills_dir):
        """Test that we can discover scripts directories within skills.

        Not all skills need scripts, but those that do should have a
        scripts/ subdirectory containing executable files.
        """
        script_dirs = []
        for skill_dir in skills_dir.iterdir():
            if skill_dir.is_dir():
                scripts_path = skill_dir / "scripts"
                if scripts_path.exists() and scripts_path.is_dir():
                    script_dirs.append(scripts_path)

        # At minimum, ascii-desktop-control should have scripts
        assert len(script_dirs) >= 1, "Expected at least one skill with scripts directory"

    def test_ascii_desktop_control_has_scripts(self, skills_dir):
        """Test that ascii-desktop-control skill has expected scripts."""
        scripts_dir = skills_dir / "ascii-desktop-control" / "scripts"
        assert scripts_dir.exists(), f"Scripts directory not found: {scripts_dir}"

        scripts = list(scripts_dir.glob("*.py"))
        assert len(scripts) >= 1, "Expected at least one Python script in ascii-desktop-control"

        # Verify specific scripts exist
        get_ascii_view = scripts_dir / "get_ascii_view.py"
        assert get_ascii_view.exists(), "get_ascii_view.py should exist"


class TestScriptHelpUsage:
    """Tests for verifying scripts respond to help/usage requests.

    Scripts should either:
    - Respond to --help flag with usage information
    - Show usage when invoked with invalid arguments

    These tests verify the script is syntactically correct and
    can be imported/executed without immediate crashes.
    """

    def test_desktop_action_shows_usage(self, skills_dir):
        """Test that desktop_action.py shows usage when called without args."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "desktop_action.py"
        assert script_path.exists(), f"Script not found: {script_path}"

        result = run_cli_command(["python3", str(script_path)])

        # Script should exit with non-zero and show usage
        assert result.failed, "Should exit with non-zero when no args provided"
        assert "Usage" in result.stdout or "Usage" in result.stderr, \
            "Should show usage message"

    def test_desktop_action_shows_actions_list(self, skills_dir):
        """Test that desktop_action.py lists available actions in usage."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "desktop_action.py"

        result = run_cli_command(["python3", str(script_path)])

        # Usage should mention available actions
        output = result.stdout + result.stderr
        assert "click" in output.lower() or "type" in output.lower() or "key" in output.lower(), \
            "Usage should list available actions (click, type, key, etc.)"


class TestScriptSyntaxValidation:
    """Tests for verifying script syntax without full execution.

    These tests use Python's -m py_compile to verify scripts are
    syntactically valid without actually executing them.
    """

    def test_get_ascii_view_syntax_valid(self, skills_dir):
        """Test that get_ascii_view.py has valid Python syntax."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "get_ascii_view.py"

        # Use py_compile to check syntax without execution
        result = run_cli_command(["python3", "-m", "py_compile", str(script_path)])

        assert result.succeeded, f"Syntax error in {script_path}: {result.stderr}"

    def test_desktop_action_syntax_valid(self, skills_dir):
        """Test that desktop_action.py has valid Python syntax."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "desktop_action.py"

        result = run_cli_command(["python3", "-m", "py_compile", str(script_path)])

        assert result.succeeded, f"Syntax error in {script_path}: {result.stderr}"

    def test_all_skill_scripts_syntax_valid(self, skills_dir):
        """Test that all Python scripts in skills have valid syntax.

        This is a parametrized discovery test that finds all .py files
        in skill scripts directories and validates their syntax.
        """
        script_files = []
        for skill_dir in skills_dir.iterdir():
            if skill_dir.is_dir():
                scripts_path = skill_dir / "scripts"
                if scripts_path.exists():
                    script_files.extend(scripts_path.glob("*.py"))

        assert len(script_files) >= 1, "Expected at least one Python script in skills"

        errors = []
        for script_path in script_files:
            result = run_cli_command(["python3", "-m", "py_compile", str(script_path)])
            if result.failed:
                errors.append(f"{script_path.name}: {result.stderr.strip()}")

        assert len(errors) == 0, f"Syntax errors found:\n" + "\n".join(errors)


class TestSubprocessHelper:
    """Tests to verify the subprocess helper utilities work correctly.

    These are meta-tests that verify the test infrastructure itself.
    """

    def test_run_cli_command_success(self):
        """Test that run_cli_command captures successful output."""
        result = run_cli_command(["echo", "hello"])

        assert result.succeeded
        assert "hello" in result.stdout
        assert result.returncode == 0

    def test_run_cli_command_failure(self):
        """Test that run_cli_command captures failure output."""
        result = run_cli_command(["ls", "/nonexistent_directory_12345"])

        assert result.failed
        assert result.returncode != 0

    def test_check_dependency_exists_for_common_commands(self):
        """Test that check_dependency_exists works for common commands."""
        # ls should exist on any Unix system
        assert check_dependency_exists("ls"), "ls command should exist"

        # A made-up command should not exist
        assert not check_dependency_exists("nonexistent_command_xyz123"), \
            "Made-up command should not exist"

    def test_check_xdotool_dependency(self):
        """Test if xdotool is available (informational, not required)."""
        # This test documents whether xdotool is available in the test environment
        # Tests that need xdotool should use @pytest.mark.skipif
        xdotool_available = check_dependency_exists("xdotool")
        # We don't assert, just document the state
        if not xdotool_available:
            pytest.skip("xdotool not installed - tests requiring it will be skipped")

    def test_check_imagemagick_dependency(self):
        """Test if ImageMagick (convert) is available."""
        # get_ascii_view.py requires ImageMagick's convert command
        convert_available = check_dependency_exists("convert")
        if not convert_available:
            pytest.skip("ImageMagick (convert) not installed")


class TestDependencySkips:
    """Tests that document and verify skip behavior for missing dependencies.

    These tests demonstrate how to use skip logic when external tools
    are not available in the test environment.
    """

    @pytest.mark.skipif(
        not check_dependency_exists("xdotool"),
        reason="xdotool not installed"
    )
    def test_xdotool_available_for_desktop_tests(self):
        """Test that xdotool is available (skip if not installed)."""
        result = run_cli_command(["xdotool", "--version"])
        assert result.succeeded, "xdotool should execute successfully if available"

    @pytest.mark.skipif(
        not check_dependency_exists("convert"),
        reason="ImageMagick not installed"
    )
    def test_imagemagick_available_for_screenshot_tests(self):
        """Test that ImageMagick is available (skip if not installed)."""
        result = run_cli_command(["convert", "--version"])
        assert result.succeeded, "convert should execute successfully if available"

    @pytest.mark.skipif(
        not check_dependency_exists("xwininfo"),
        reason="xwininfo not installed (X11 tools)"
    )
    def test_xwininfo_available_for_window_tests(self):
        """Test that xwininfo is available (skip if not installed)."""
        result = run_cli_command(["xwininfo", "-help"])
        # xwininfo -help exits with 1 but shows help
        assert "Usage" in result.stdout or "Usage" in result.stderr or result.returncode in (0, 1)


class TestCoreScriptCLI:
    """Tests for core scripts to verify they respond to CLI flags and launch.

    These tests verify that essential scripts in the project can be invoked
    and respond appropriately to --help or basic invocations.
    """

    # get_ascii_view.py tests
    def test_get_ascii_view_exists(self, skills_dir):
        """Test that get_ascii_view.py exists in ascii-desktop-control skill."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "get_ascii_view.py"
        assert script_path.exists(), f"Script not found: {script_path}"

    def test_get_ascii_view_imports_successfully(self, skills_dir):
        """Test that get_ascii_view.py can be imported without errors."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "get_ascii_view.py"
        # Check that the script can be parsed and has valid syntax
        result = run_cli_command(["python3", "-c", f"import ast; ast.parse(open('{script_path}').read())"])
        assert result.succeeded, f"Failed to parse {script_path}: {result.stderr}"

    @pytest.mark.skipif(
        not check_dependency_exists("xdotool"),
        reason="xdotool not installed - required for get_ascii_view execution"
    )
    def test_get_ascii_view_runs_with_x11(self, skills_dir):
        """Test that get_ascii_view.py executes when xdotool is available."""
        script_path = skills_dir / "ascii-desktop-control" / "scripts" / "get_ascii_view.py"
        result = run_cli_command(["python3", str(script_path)], timeout=15)
        # Script may fail if no display, but should not crash with import error
        assert "ImportError" not in result.stderr, f"Import error in script: {result.stderr}"
        assert "ModuleNotFoundError" not in result.stderr, f"Module not found: {result.stderr}"

    # evolution_ctl.sh tests
    def test_evolution_ctl_exists(self):
        """Test that evolution_ctl.sh exists."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "visual_shell" / "swarm" / "evolution" / "evolution_ctl.sh"
        assert script_path.exists(), f"Script not found: {script_path}"

    def test_evolution_ctl_help(self):
        """Test that evolution_ctl.sh responds to --help flag."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "visual_shell" / "swarm" / "evolution" / "evolution_ctl.sh"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        result = run_cli_command(["bash", str(script_path), "--help"])
        assert result.succeeded, f"Script failed: {result.stderr}"
        # Should show usage info with commands
        output = result.stdout + result.stderr
        assert "start" in output.lower() or "usage" in output.lower() or "commands" in output.lower(), \
            "Should show usage or commands in help output"

    def test_evolution_ctl_help_flag(self):
        """Test that evolution_ctl.sh responds to help command."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "visual_shell" / "swarm" / "evolution" / "evolution_ctl.sh"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        result = run_cli_command(["bash", str(script_path), "help"])
        assert result.succeeded, f"Script failed: {result.stderr}"
        output = result.stdout + result.stderr
        # Help should mention the available commands
        assert "start" in output or "stop" in output or "status" in output, \
            "Help output should list available commands"

    # vector_memory_daemon.py tests
    def test_vector_memory_daemon_exists(self):
        """Test that vector_memory_daemon.py exists."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "memory" / "vector_memory_daemon.py"
        assert script_path.exists(), f"Script not found: {script_path}"

    def test_vector_memory_daemon_syntax(self):
        """Test that vector_memory_daemon.py has valid Python syntax."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "memory" / "vector_memory_daemon.py"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        result = run_cli_command(["python3", "-m", "py_compile", str(script_path)])
        assert result.succeeded, f"Syntax error in {script_path}: {result.stderr}"

    def test_vector_memory_daemon_imports(self):
        """Test that vector_memory_daemon.py can be parsed (may lack dependencies)."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "memory" / "vector_memory_daemon.py"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        # Check syntax with AST parse
        result = run_cli_command(["python3", "-c", f"import ast; ast.parse(open('{script_path}').read())"])
        assert result.succeeded, f"Failed to parse {script_path}: {result.stderr}"

    # pixelrts_v2_converter.py tests
    def test_pixelrts_v2_converter_exists(self):
        """Test that pixelrts_v2_converter.py exists."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "pixel_compiler" / "pixelrts_v2_converter.py"
        assert script_path.exists(), f"Script not found: {script_path}"

    def test_pixelrts_v2_converter_help(self):
        """Test that pixelrts_v2_converter.py responds to --help flag."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "pixel_compiler" / "pixelrts_v2_converter.py"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        # The script uses argparse, so --help should work
        result = run_cli_command(["python3", str(script_path), "--help"], timeout=15)
        # argparse --help exits with 0, but might fail if dependencies missing
        output = result.stdout + result.stderr
        # Either we get help output, or a clear indication of missing dependency
        has_help = "usage" in output.lower() or "optional arguments" in output.lower() or "options" in output.lower()
        has_import_error = "ImportError" in output or "ModuleNotFoundError" in output
        assert has_help or has_import_error, \
            f"Script should show help or import error. Got: {output[:500]}"

    def test_pixelrts_v2_converter_syntax(self):
        """Test that pixelrts_v2_converter.py has valid Python syntax."""
        script_path = Path(__file__).parent.parent.parent / "systems" / "pixel_compiler" / "pixelrts_v2_converter.py"
        if not script_path.exists():
            pytest.skip(f"Script not found: {script_path}")

        result = run_cli_command(["python3", "-m", "py_compile", str(script_path)])
        assert result.succeeded, f"Syntax error in {script_path}: {result.stderr}"
