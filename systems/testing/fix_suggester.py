# systems/testing/fix_suggester.py
"""
FixSuggester: Generate code fix suggestions for test failures.

Provides actionable fix recommendations for AI consumption.
"""

import re
from typing import Dict, List, Any
from dataclasses import dataclass


@dataclass
class FixSuggestion:
    """A single fix suggestion."""
    suggestion: str
    action: str  # "install", "edit", "config", "investigate"
    target_file: str
    confidence: float
    details: Dict[str, Any]


class FixSuggester:
    """
    Generate code fix suggestions for test failures.

    Usage:
        suggester = FixSuggester()
        suggestions = suggester.suggest({
            "failure_type": "import_error",
            "root_cause": "Missing module: wasmtime",
            "related_files": ["test_wasm.py"]
        })
    """

    # Fix templates by error type
    FIX_TEMPLATES = {
        "import_error": {
            "action": "install",
            "template": "Install missing module: pip install {module}",
            "confidence": 0.9
        },
        "assertion_error": {
            "action": "investigate",
            "template": "Review assertion in {file}: {root_cause}",
            "confidence": 0.6
        },
        "type_error": {
            "action": "edit",
            "template": "Fix type mismatch in {file}: {root_cause}",
            "confidence": 0.7
        },
        "attribute_error": {
            "action": "edit",
            "template": "Check attribute access in {file}: {root_cause}",
            "confidence": 0.7
        },
        "key_error": {
            "action": "edit",
            "template": "Add key check before access in {file}",
            "confidence": 0.8
        },
        "timeout": {
            "action": "config",
            "template": "Increase timeout or optimize slow code in {file}",
            "confidence": 0.7
        },
        "connection": {
            "action": "config",
            "template": "Verify server is running and accessible",
            "confidence": 0.8
        },
        "file_not_found": {
            "action": "config",
            "template": "Create or locate missing file: {file}",
            "confidence": 0.85
        },
        "unknown": {
            "action": "investigate",
            "template": "Investigate error: {root_cause}",
            "confidence": 0.4
        }
    }

    def __init__(self):
        pass

    def suggest(self, analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        Generate fix suggestions based on failure analysis.

        Args:
            analysis: FailureAnalysis dict from FailureAnalyzer

        Returns:
            List of fix suggestion dicts
        """
        failure_type = analysis.get("failure_type", "unknown")
        root_cause = analysis.get("root_cause", "Unknown error")
        related_files = analysis.get("related_files", [])

        suggestions = []

        # Get template for this error type
        template_info = self.FIX_TEMPLATES.get(failure_type, self.FIX_TEMPLATES["unknown"])

        # Extract module name for import errors
        module_name = ""
        if failure_type == "import_error":
            match = re.search(r"module[:\s]+['\"]?(\S+)['\"]?", root_cause, re.IGNORECASE)
            if match:
                module_name = match.group(1).strip("'\"")
            else:
                # Try to extract from "No module named X"
                match = re.search(r"named ['\"]?(\S+)['\"]?", root_cause, re.IGNORECASE)
                if match:
                    module_name = match.group(1).strip("'\"")

        # Generate primary suggestion
        target_file = related_files[0] if related_files else "unknown"
        suggestion_text = template_info["template"].format(
            module=module_name,
            file=target_file,
            root_cause=root_cause
        )

        suggestions.append({
            "suggestion": suggestion_text,
            "action": template_info["action"],
            "target_file": target_file,
            "confidence": template_info["confidence"],
            "details": {
                "failure_type": failure_type,
                "root_cause": root_cause,
                "module_name": module_name if module_name else None
            }
        })

        # Add additional suggestions for specific error types
        if failure_type == "import_error" and module_name:
            # Suggest adding to requirements.txt
            suggestions.append({
                "suggestion": f"Add '{module_name}' to requirements.txt",
                "action": "edit",
                "target_file": "requirements.txt",
                "confidence": 0.85,
                "details": {
                    "line_to_add": module_name
                }
            })

        elif failure_type == "assertion_error" and len(related_files) > 1:
            # Suggest checking test file
            suggestions.append({
                "suggestion": f"Compare expected vs actual values in test",
                "action": "investigate",
                "target_file": related_files[0],
                "confidence": 0.5,
                "details": {}
            })

        return suggestions
