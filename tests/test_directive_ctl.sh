#!/bin/bash
#
# test_directive_ctl.sh - Integration tests for directive_ctl.sh control script
#
# Usage: bash tests/test_directive_ctl.sh
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CTL_SCRIPT="${PROJECT_ROOT}/systems/intelligence/directive_ctl.sh"
PID_FILE="${PROJECT_ROOT}/systems/intelligence/directive_agent.pid"

# Helper functions
pass() {
    echo -e "${GREEN}✓ PASS:${NC} $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

fail() {
    echo -e "${RED}✗ FAIL:${NC} $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

section() {
    echo ""
    echo -e "${YELLOW}=== $1 ===${NC}"
}

# Cleanup function
cleanup() {
    # Remove any stale PID file created during tests
    rm -f "$PID_FILE" 2>/dev/null || true
}

trap cleanup EXIT

# Tests

test_executable() {
    section "Test: Script is executable"

    if [ -x "$CTL_SCRIPT" ]; then
        pass "directive_ctl.sh is executable"
    else
        fail "directive_ctl.sh is not executable (chmod +x needed)"
    fi
}

test_help_command() {
    section "Test: Help command shows expected options"

    local output
    output=$("$CTL_SCRIPT" help 2>&1)

    # Check for required commands
    local expected_commands=("start" "stop" "status" "tail" "process")
    local all_found=true

    for cmd in "${expected_commands[@]}"; do
        if echo "$output" | grep -q "$cmd"; then
            : # Found
        else
            fail "Help output missing command: $cmd"
            all_found=false
        fi
    done

    if $all_found; then
        pass "Help command shows all expected options: start, stop, status, tail, process"
    fi
}

test_status_when_stopped() {
    section "Test: Status shows STOPPED when daemon not running"

    # Ensure daemon is not running
    rm -f "$PID_FILE" 2>/dev/null || true

    local output
    output=$("$CTL_SCRIPT" status 2>&1)

    if echo "$output" | grep -qi "STOPPED"; then
        pass "Status correctly shows STOPPED when daemon is not running"
    else
        fail "Status does not show STOPPED (output: $(echo "$output" | head -1))"
    fi
}

test_process_once() {
    section "Test: Process command executes without error"

    # Run process command - it will fail to connect to WordPress but should not crash
    local output
    local exit_code=0

    # Set timeout to prevent hanging
    output=$(timeout 10 "$CTL_SCRIPT" process 2>&1) || exit_code=$?

    if [ $exit_code -eq 0 ]; then
        pass "Process command executes without error"
    elif [ $exit_code -eq 124 ]; then
        fail "Process command timed out (>10s)"
    else
        # Process may fail due to WordPress not being available, but script itself should work
        if echo "$output" | grep -qi "Processing one cycle"; then
            pass "Process command runs (WordPress connection expected to fail in test env)"
        else
            fail "Process command failed with exit code $exit_code (output: $(echo "$output" | head -3))"
        fi
    fi
}

# Run all tests
main() {
    echo "========================================"
    echo "Directive Control Script Integration Tests"
    echo "========================================"
    echo ""

    test_executable
    test_help_command
    test_status_when_stopped
    test_process_once

    # Summary
    echo ""
    echo "========================================"
    echo "Summary"
    echo "========================================"
    echo -e "Passed: ${GREEN}$TESTS_PASSED${NC}"
    echo -e "Failed: ${RED}$TESTS_FAILED${NC}"
    echo ""

    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "${GREEN}All tests passed!${NC}"
        exit 0
    else
        echo -e "${RED}Some tests failed.${NC}"
        exit 1
    fi
}

main "$@"
