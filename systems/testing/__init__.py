# systems/testing/__init__.py
"""
Phase O: Continuous Testing & Validation System

Components:
- TestRunner: Execute tests and collect results
- TestSelector: Intelligently select tests to run
- FailureAnalyzer: Analyze test failures and identify root causes
- FixSuggester: Generate code fix suggestions

Integration:
- WebMCP tools: test_select, test_run, test_analyze, test_suggest_fix
- AI PM team: continuous-testing
"""

__version__ = "0.1.0"
__phase__ = "O"

from systems.testing.test_runner import TestRunner
from systems.testing.test_selector import TestSelector
from systems.testing.failure_analyzer import FailureAnalyzer
from systems.testing.fix_suggester import FixSuggester

__all__ = [
    "TestRunner",
    "TestSelector",
    "FailureAnalyzer",
    "FixSuggester",
]
