#!/usr/bin/env python3
"""
Unit tests for RoleConstraint and GEOMETRY_OS_ARCHITECT.

Tests RoleConstraint dataclass including:
- Creation with all fields
- Empty name validation (ValueError)
- Default values (min_role_mentions=1)
- GEOMETRY_OS_ARCHITECT constant values
"""

import unittest

from systems.intelligence.prompt_validator import RoleConstraint, GEOMETRY_OS_ARCHITECT


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


if __name__ == "__main__":
    unittest.main()
