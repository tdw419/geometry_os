#!/usr/bin/env python3
"""
Unit tests for RoleConstraint, GEOMETRY_OS_ARCHITECT, and PromptValidator role constraints.

Tests RoleConstraint dataclass including:
- Creation with all fields
- Empty name validation (ValueError)
- Default values (min_role_mentions=1)
- GEOMETRY_OS_ARCHITECT constant values

Tests PromptValidator role constraint integration:
- Valid prompts with all required phrases pass
- Missing required phrases fail
- Forbidden patterns fail
- Forbidden roles fail
- Multiple constraints checked
- Case insensitive matching
- Empty constraint lists handled
"""

import unittest

from systems.intelligence.prompt_validator import (
    RoleConstraint,
    GEOMETRY_OS_ARCHITECT,
    PromptValidator,
)


class TestRoleConstraint(unittest.TestCase):
    """Test cases for RoleConstraint dataclass."""

    def test_role_constraint_creation(self):
        """RoleConstraint should instantiate with all fields."""
        constraint = RoleConstraint(
            role_name="Test Role",
            required_phrases=["phrase one", "phrase two"],
            forbidden_patterns=[r"bad\s+pattern"],
            forbidden_roles=["badrole"],
            min_role_mentions=3
        )

        self.assertEqual(constraint.role_name, "Test Role")
        self.assertEqual(constraint.required_phrases, ["phrase one", "phrase two"])
        self.assertEqual(constraint.forbidden_patterns, [r"bad\s+pattern"])
        self.assertEqual(constraint.forbidden_roles, ["badrole"])
        self.assertEqual(constraint.min_role_mentions, 3)

    def test_role_constraint_empty_name_raises(self):
        """RoleConstraint with empty role_name should raise ValueError."""
        with self.assertRaises(ValueError) as context:
            RoleConstraint(role_name="", required_phrases=[], forbidden_patterns=[], forbidden_roles=[])

        self.assertIn("role_name cannot be empty", str(context.exception))

    def test_role_constraint_whitespace_name_raises(self):
        """RoleConstraint with whitespace-only role_name should raise ValueError."""
        with self.assertRaises(ValueError) as context:
            RoleConstraint(role_name="   ", required_phrases=[], forbidden_patterns=[], forbidden_roles=[])

        self.assertIn("role_name cannot be empty", str(context.exception))

    def test_role_constraint_defaults(self):
        """RoleConstraint should have min_role_mentions=1 by default."""
        constraint = RoleConstraint(
            role_name="Default Test",
            required_phrases=[],
            forbidden_patterns=[],
            forbidden_roles=[]
        )

        self.assertEqual(constraint.min_role_mentions, 1)

    def test_role_constraint_empty_lists(self):
        """RoleConstraint should accept empty lists for optional fields."""
        constraint = RoleConstraint(
            role_name="Empty Lists Test",
            required_phrases=[],
            forbidden_patterns=[],
            forbidden_roles=[]
        )

        self.assertEqual(constraint.required_phrases, [])
        self.assertEqual(constraint.forbidden_patterns, [])
        self.assertEqual(constraint.forbidden_roles, [])


class TestGeometryOsArchitectConstant(unittest.TestCase):
    """Test cases for GEOMETRY_OS_ARCHITECT constant."""

    def test_geometry_os_architect_export(self):
        """GEOMETRY_OS_ARCHITECT should have correct constant values."""
        # Verify role_name
        self.assertEqual(GEOMETRY_OS_ARCHITECT.role_name, "Global Architect")

        # Verify required_phrases
        self.assertIn("Global Architect", GEOMETRY_OS_ARCHITECT.required_phrases)
        self.assertIn("Geometry OS", GEOMETRY_OS_ARCHITECT.required_phrases)

        # Verify forbidden_patterns contains expected patterns
        self.assertIn(r"professional\s+ai\s+assistant", GEOMETRY_OS_ARCHITECT.forbidden_patterns)
        self.assertIn(r"helpful\s+assistant", GEOMETRY_OS_ARCHITECT.forbidden_patterns)

        # Verify forbidden_roles
        self.assertIn("assistant", GEOMETRY_OS_ARCHITECT.forbidden_roles)
        self.assertIn("chatbot", GEOMETRY_OS_ARCHITECT.forbidden_roles)
        self.assertIn("helper", GEOMETRY_OS_ARCHITECT.forbidden_roles)

        # Verify min_role_mentions
        self.assertEqual(GEOMETRY_OS_ARCHITECT.min_role_mentions, 1)

    def test_geometry_os_architect_is_role_constraint(self):
        """GEOMETRY_OS_ARCHITECT should be a RoleConstraint instance."""
        self.assertIsInstance(GEOMETRY_OS_ARCHITECT, RoleConstraint)


class TestPromptValidatorRoleConstraints(unittest.TestCase):
    """Test cases for PromptValidator role constraint enforcement."""

    def test_validator_accepts_valid_prompt(self):
        """Prompt with all required phrases should pass validation."""
        validator = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])
        prompt = "You are the Global Architect of Geometry OS. Build amazing systems."

        result = validator.validate(prompt)

        self.assertTrue(result.is_valid, "Valid prompt should pass")

    def test_validator_rejects_missing_phrase(self):
        """Prompt missing required phrase should fail validation."""
        validator = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])
        prompt = "You are the Global Architect. Build cool stuff."  # Missing "Geometry OS"

        result = validator.validate(prompt)

        self.assertFalse(result.is_valid, "Missing phrase should fail")
        error_messages = [i["message"] for i in result.get_errors()]
        self.assertTrue(
            any("Geometry OS" in msg for msg in error_messages),
            "Should have error about missing 'Geometry OS'"
        )

    def test_validator_rejects_forbidden_pattern(self):
        """Prompt matching forbidden pattern should fail validation."""
        validator = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])
        prompt = "You are a helpful assistant for Geometry OS."

        result = validator.validate(prompt)

        self.assertFalse(result.is_valid, "Forbidden pattern should fail")
        error_messages = [i["message"] for i in result.get_errors()]
        self.assertTrue(
            any("forbidden pattern" in msg.lower() for msg in error_messages),
            "Should have forbidden pattern error"
        )

    def test_validator_rejects_forbidden_role(self):
        """Prompt containing forbidden role word should fail validation."""
        validator = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])
        prompt = "You are the Global Architect of Geometry OS. You are a chatbot."

        result = validator.validate(prompt)

        self.assertFalse(result.is_valid, "Forbidden role should fail")
        error_messages = [i["message"] for i in result.get_errors()]
        self.assertTrue(
            any("chatbot" in msg.lower() for msg in error_messages),
            "Should have forbidden role error for 'chatbot'"
        )

    def test_multiple_constraints(self):
        """Validator should check all constraints."""
        constraint1 = RoleConstraint(
            role_name="Role A",
            required_phrases=["alpha"],
            forbidden_patterns=[],
            forbidden_roles=[]
        )
        constraint2 = RoleConstraint(
            role_name="Role B",
            required_phrases=["beta"],
            forbidden_patterns=[],
            forbidden_roles=[]
        )
        validator = PromptValidator(role_constraints=[constraint1, constraint2])

        # Missing both phrases
        result = validator.validate("Gamma delta epsilon")

        self.assertFalse(result.is_valid)
        errors = result.get_errors()
        constraint_names = [e.get("constraint") for e in errors]
        self.assertIn("Role A", constraint_names)
        self.assertIn("Role B", constraint_names)

    def test_case_insensitive_matching(self):
        """Matching should be case insensitive."""
        validator = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])

        # Test lowercase forbidden role
        result = validator.validate(
            "You are the Global Architect of Geometry OS. You are an ASSISTANT."
        )
        self.assertFalse(result.is_valid, "Uppercase forbidden role should fail")

        # Test mixed case required phrase
        result2 = validator.validate(
            "You are the global architect of geometry os. Build systems."
        )
        # This should pass required phrase check (case insensitive)
        # Note: may still fail structural "Architect" warning but that's warning level
        has_required_phrase_error = any(
            "Missing required phrase" in i["message"]
            for i in result2.get_errors()
        )
        self.assertFalse(has_required_phrase_error, "Case insensitive phrase check")

    def test_empty_constraint_lists(self):
        """Validator should work with empty constraint list."""
        validator = PromptValidator(role_constraints=[])
        prompt = "You are the Global Architect of Geometry OS. Build systems."

        result = validator.validate(prompt)

        # Should pass since no role constraints to check
        self.assertTrue(result.is_valid, "Empty constraint list should work")


if __name__ == "__main__":
    unittest.main()
