#!/bin/bash
# Run isolation tests with verbose output

set -e

echo "=== Running Parallel Agent Isolation Tests ==="
echo ""

# Run all isolation tests
pytest tests/isolation/ -v --tb=short "$@"

echo ""
echo "=== All isolation tests passed ==="
