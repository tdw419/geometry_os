#!/bin/bash
# RISC-V GPU VM Test Runner

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUNNER_DIR="$SCRIPT_DIR/../../infinite_map_rs"
PASS=0
FAIL=0

echo "=========================================="
echo "RISC-V GPU VM Test Suite"
echo "=========================================="
echo ""

run_test() {
    local name=$1
    local expected=$2
    local test_file="$SCRIPT_DIR/${name}.rts.png"

    if [ ! -f "$test_file" ]; then
        echo "SKIP: $name (file not found)"
        return
    fi

    echo -n "Running $name... "

    # Run from infinite_map_rs directory so shader can be found
    # Use absolute path for test file
    output=$(cd "$RUNNER_DIR" && ./target/release/run_riscv "$(realpath "$test_file")" --max-cycles 50000 2>&1)

    if echo "$output" | grep -q "$expected"; then
        echo "PASS"
        ((PASS++))
    else
        echo "FAIL"
        echo "  Expected: $expected"
        echo "  Got: $(echo "$output" | grep -A10 'UART Output' | tail -n +2 | head -1)"
        ((FAIL++))
    fi
}

# Build runner if needed
if [ ! -f "$RUNNER_DIR/target/release/run_riscv" ]; then
    echo "Building test runner..."
    cd "$RUNNER_DIR"
    cargo build --release --bin run_riscv 2>/dev/null
    cd "$SCRIPT_DIR"
fi

# Run tests
run_test "simple_uart" "Hello"
run_test "fibonacci_test" "1 1 2 3 5 8 13 21 34 55"
run_test "branch_test" "B1B2B3B4B5B6"
run_test "memory_test" "ML1ML2ML3ML4ML5"
run_test "shift_test" "S1S2S3S4S5S6"

# Summary
echo ""
echo "=========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "=========================================="

if [ $FAIL -gt 0 ]; then
    exit 1
fi
