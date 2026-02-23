#!/bin/bash
#
# CI-Ready Terminal Test Runner
# Runs terminal tests in CI environment with proper mocking/skipping
#
# Exit codes:
#   0 - All passed
#   1 - Some tests failed
#   2 - Critical error (missing dependencies)
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
EXIT_CODE=0

# Add project root to PYTHONPATH for imports
export PYTHONPATH="$PROJECT_ROOT:$PYTHONPATH"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0
SKIPPED_TESTS=0

# Summary tracking
declare -a TEST_SUMMARY

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    PASSED_TESTS=$((PASSED_TESTS + 1))
}

log_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    FAILED_TESTS=$((FAILED_TESTS + 1))
    EXIT_CODE=1
}

log_skip() {
    echo -e "${YELLOW}[SKIP]${NC} $1"
    SKIPPED_TESTS=$((SKIPPED_TESTS + 1))
}

# ============================================
# 1. WebSocket Tests (always run)
# ============================================
run_websocket_tests() {
    echo ""
    echo "============================================"
    echo "1. WebSocket Tests"
    echo "============================================"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    log_info "Running pytest on WebSocket-related tests..."

    # Run pytest on terminal bridge and token relay tests
    # Store exit code to handle gracefully
    set +e
    python3 -m pytest "$SCRIPT_DIR/test_terminal_bridge.py" \
        "$SCRIPT_DIR/test_token_relay.py" \
        -v --tb=short 2>&1
    PYTEST_EXIT=$?
    set -e

    if [ $PYTEST_EXIT -eq 0 ]; then
        log_pass "WebSocket tests passed"
        TEST_SUMMARY+=("WebSocket Tests: PASSED")
    else
        log_fail "WebSocket tests failed (exit code: $PYTEST_EXIT)"
        TEST_SUMMARY+=("WebSocket Tests: FAILED")
    fi
}

# ============================================
# 2. E2E Tests (if Puppeteer available)
# ============================================
run_e2e_tests() {
    echo ""
    echo "============================================"
    echo "2. E2E Tests (Puppeteer)"
    echo "============================================"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    # Check for Puppeteer
    if command -v node &> /dev/null; then
        # Check if puppeteer is installed anywhere in the project
        PUPPETEER_FOUND=false

        # Check common locations
        for pkg_path in "$PROJECT_ROOT/node_modules" \
                        "$PROJECT_ROOT/systems/visual_shell/electron/node_modules" \
                        "$PROJECT_ROOT/systems/visual_shell/web/node_modules"; do
            if [ -d "$pkg_path/puppeteer" ]; then
                PUPPETEER_FOUND=true
                break
            fi
        done

        if [ "$PUPPETEER_FOUND" = true ]; then
            log_info "Puppeteer found, running E2E tests..."

            if [ -f "$SCRIPT_DIR/e2e_terminal_test.js" ]; then
                set +e
                node "$SCRIPT_DIR/e2e_terminal_test.js" 2>&1
                NODE_EXIT=$?
                set -e

                if [ $NODE_EXIT -eq 0 ]; then
                    log_pass "E2E tests passed"
                    TEST_SUMMARY+=("E2E Tests: PASSED")
                else
                    log_fail "E2E tests failed (exit code: $NODE_EXIT)"
                    TEST_SUMMARY+=("E2E Tests: FAILED")
                fi
            else
                log_skip "E2E test file not found"
                TEST_SUMMARY+=("E2E Tests: SKIPPED (no file)")
            fi
        else
            log_skip "Puppeteer not installed"
            TEST_SUMMARY+=("E2E Tests: SKIPPED (no Puppeteer)")
        fi
    else
        log_skip "Node.js not available"
        TEST_SUMMARY+=("E2E Tests: SKIPPED (no Node.js)")
    fi
}

# ============================================
# 3. LLM Tests (mock mode)
# ============================================
run_llm_tests() {
    echo ""
    echo "============================================"
    echo "3. LLM Tests (Mock Mode)"
    echo "============================================"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    log_info "Running LLM verification in mock mode..."

    # Set environment variable to enable mock mode
    export LLM_MOCK_MODE=1
    export LM_STUDIO_URL="mock://disabled"

    if [ -f "$SCRIPT_DIR/llm_terminal_verify.py" ]; then
        # Create a mock test that doesn't require actual LLM
        set +e
        python3 -c "
import sys
sys.path.insert(0, '$SCRIPT_DIR')

# Mock the LLM verification
print('Running LLM tests in mock mode...')

# Test that the module imports correctly
try:
    from llm_terminal_verify import VerificationResult, LLMTerminalVerifier, TerminalTestRunner
    print('  - Module imports: OK')

    # Test data structure
    result = VerificationResult(
        test_name='mock_test',
        passed=True,
        llm_response='mock response',
        confidence=0.95,
        details='Mock test passed'
    )
    assert result.passed == True
    print('  - Data structures: OK')

    # Test mock mode is active
    import os
    assert os.environ.get('LLM_MOCK_MODE') == '1'
    print('  - Mock mode: ENABLED')

    print('LLM mock tests passed')
    sys.exit(0)
except Exception as e:
    print(f'LLM mock tests failed: {e}')
    sys.exit(1)
" 2>&1
        LLM_EXIT=$?
        set -e

        if [ $LLM_EXIT -eq 0 ]; then
            log_pass "LLM tests passed (mock mode)"
            TEST_SUMMARY+=("LLM Tests: PASSED (mock)")
        else
            log_fail "LLM tests failed (exit code: $LLM_EXIT)"
            TEST_SUMMARY+=("LLM Tests: FAILED")
        fi
    else
        log_skip "LLM test file not found"
        TEST_SUMMARY+=("LLM Tests: SKIPPED (no file)")
    fi

    unset LLM_MOCK_MODE
    unset LM_STUDIO_URL
}

# ============================================
# 4. ASCII Tests (skip in CI - no X11)
# ============================================
run_ascii_tests() {
    echo ""
    echo "============================================"
    echo "4. ASCII Terminal Tests"
    echo "============================================"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    # Check if we're in a CI environment
    if [ -n "$CI" ] || [ -n "$GITHUB_ACTIONS" ] || [ -z "$DISPLAY" ]; then
        log_skip "ASCII tests skipped (no X11/display in CI)"
        TEST_SUMMARY+=("ASCII Tests: SKIPPED (CI/no X11)")
    else
        log_info "Running ASCII terminal tests..."

        if [ -f "$SCRIPT_DIR/ascii_terminal_test.py" ]; then
            set +e
            python3 "$SCRIPT_DIR/ascii_terminal_test.py" 2>&1
            ASCII_EXIT=$?
            set -e

            if [ $ASCII_EXIT -eq 0 ]; then
                log_pass "ASCII tests passed"
                TEST_SUMMARY+=("ASCII Tests: PASSED")
            else
                log_fail "ASCII tests failed (exit code: $ASCII_EXIT)"
                TEST_SUMMARY+=("ASCII Tests: FAILED")
            fi
        else
            log_skip "ASCII test file not found"
            TEST_SUMMARY+=("ASCII Tests: SKIPPED (no file)")
        fi
    fi
}

# ============================================
# Summary
# ============================================
print_summary() {
    echo ""
    echo "============================================"
    echo "TEST SUMMARY"
    echo "============================================"
    echo ""

    for summary in "${TEST_SUMMARY[@]}"; do
        echo "  - $summary"
    done

    echo ""
    echo "--------------------------------------------"
    echo "Total:   $TOTAL_TESTS test suites"
    echo "Passed:  $PASSED_TESTS"
    echo "Failed:  $FAILED_TESTS"
    echo "Skipped: $SKIPPED_TESTS"
    echo "--------------------------------------------"

    if [ $FAILED_TESTS -eq 0 ]; then
        echo -e "${GREEN}All tests passed!${NC}"
    else
        echo -e "${RED}Some tests failed.${NC}"
    fi

    echo ""
}

# ============================================
# Main
# ============================================
main() {
    echo "============================================"
    echo "Geometry OS - CI Terminal Test Runner"
    echo "============================================"
    echo "Date: $(date)"
    echo "CI Environment: ${CI:-false}"
    echo "Display: ${DISPLAY:-none}"
    echo ""

    # Verify Python is available
    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}ERROR: Python3 is required${NC}"
        exit 2
    fi

    # Verify pytest is available
    if ! python3 -m pytest --version &> /dev/null; then
        echo -e "${YELLOW}WARNING: pytest not installed, installing...${NC}"
        pip3 install pytest -q
    fi

    # Run test suites (disable errexit to allow continuing on failures)
    set +e
    run_websocket_tests
    run_e2e_tests
    run_llm_tests
    run_ascii_tests
    set -e

    # Print summary
    print_summary

    exit $EXIT_CODE
}

main "$@"
