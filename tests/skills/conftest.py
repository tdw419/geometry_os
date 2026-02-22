"""Test fixtures for AI Skills System tests."""
import pytest
from pathlib import Path


@pytest.fixture(scope="session")
def project_root():
    """Provide the path to the project root directory.

    Returns:
        Path: Absolute path to geometry_os root, used as base for all file lookups.

    Usage:
        def test_something(project_root):
            config = project_root / "config.json"
    """
    return Path(__file__).parent.parent.parent


@pytest.fixture(scope="session")
def skills_dir(project_root):
    """Provide the path to the .gemini/skills directory containing skill files.

    Args:
        project_root: Session-scoped fixture providing project root path.

    Returns:
        Path: Absolute path to the skills directory.

    Note:
        Tests using this fixture will be skipped if the directory doesn't exist.
    """
    return project_root / ".gemini" / "skills"


@pytest.fixture(scope="session")
def valid_categories():
    """Provide the list of valid skill categories for validation tests.

    Returns:
        list[str]: Categories that are allowed in skill frontmatter.

    Categories:
        - testing: Skills for test execution and verification
        - debugging: Skills for troubleshooting and diagnosis
        - operations: Skills for system operations and maintenance
        - coordination: Skills for multi-agent coordination
        - general: Default category for uncategorized skills
    """
    return ["testing", "debugging", "operations", "coordination", "general"]


@pytest.fixture(scope="session")
def wordpress_available():
    """Check if WordPress is available for integration tests.

    Returns:
        bool: True if WordPress responds on localhost:8080, False otherwise.

    Note:
        Integration tests should use @pytest.mark.skipif(not wordpress_available())
        to gracefully skip when WordPress is not running.

    Example:
        @pytest.mark.skipif(not wordpress_available(), reason="WordPress not available")
        def test_wp_integration(wordpress_available):
            assert wordpress_available
    """
    import requests
    try:
        response = requests.get("http://localhost:8080", timeout=2)
        return response.status_code == 200
    except Exception:
        return False
