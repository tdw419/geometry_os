"""Test fixtures for AI Skills System tests."""
import pytest
from pathlib import Path


@pytest.fixture(scope="session")
def skills_dir():
    """Path to the .gemini/skills directory containing skill files."""
    project_root = Path(__file__).parent.parent.parent
    return project_root / ".gemini" / "skills"


@pytest.fixture(scope="session")
def valid_categories():
    """List of valid skill categories."""
    return ["testing", "debugging", "operations", "coordination", "general"]


@pytest.fixture(scope="session")
def wordpress_available():
    """Check if WordPress is available for integration tests."""
    import requests
    try:
        response = requests.get("http://localhost:8080", timeout=2)
        return response.status_code == 200
    except Exception:
        return False
