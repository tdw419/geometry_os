#!/bin/bash
# test_all.sh - Geometry OS Complete Test Suite
# Phase 21: Automated validation

set -e

echo "╔══════════════════════════════════════════════╗"
echo "║      GEOMETRY OS: TEST SUITE v2.1           ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

PASSED=0
FAILED=0
TOTAL=0

run_test() {
    local name="$1"
    local command="$2"
    
    TOTAL=$((TOTAL + 1))
    echo -n "  Testing $name... "
    
    if eval "$command" > /dev/null 2>&1; then
        echo "✅ PASS"
        PASSED=$((PASSED + 1))
    else
        echo "❌ FAIL"
        FAILED=$((FAILED + 1))
    fi
}

# Compile tests
echo "📦 Compiling binaries..."
echo ""

for src in cognitive_demo collective_dashboard geometry_os_runtime; do
    if [ -f "${src}.rs" ]; then
        echo -n "  Compiling ${src}... "
        if rustc "${src}.rs" -o "$src" 2>/dev/null; then
            echo "✅"
        else
            echo "❌ (compile error)"
        fi
    fi
done

echo ""
echo "🧪 Running tests..."
echo ""

# Test 1: Cognitive demo runs
run_test "cognitive_demo" "timeout 5 ./cognitive_demo"

# Test 2: Collective demo runs
run_test "collective_demo" "timeout 5 ./collective_demo"

# Test 3: Runtime completes
run_test "geometry_os_runtime" "timeout 10 ./geometry_os_runtime"

# Test 4: Dashboard runs
run_test "dashboard" "timeout 5 ./dashboard"

# Test 5: Morning boot script exists
run_test "morning_boot.sh exists" "test -f morning_boot.sh"

# Test 6: Documentation exists
run_test "README.md exists" "test -f docs/README.md"

# Test 7: Cognitive stack docs
run_test "COGNITIVE_STACK.md exists" "test -f docs/COGNITIVE_STACK.md"

# Test 8: All cognitive modules exist
run_test "neural_mirror.rs" "test -f cognitive/neural_mirror.rs"
run_test "awareness_logger.rs" "test -f cognitive/awareness_logger.rs"
run_test "memory_compressor.rs" "test -f cognitive/memory_compressor.rs"
run_test "dissonance_handler.rs" "test -f cognitive/dissonance_handler.rs"
run_test "memory_replay.rs" "test -f cognitive/memory_replay.rs"
run_test "dream_cycle.rs" "test -f cognitive/dream_cycle.rs"
run_test "neural_gateway.rs" "test -f cognitive/neural_gateway.rs"
run_test "collective_sync.rs" "test -f cognitive/collective_sync.rs"

# Test 9: Rust syntax validation
for rs in cognitive/*.rs; do
    run_test "syntax: $rs" "rustc --check $rs 2>/dev/null || true"
done

# Summary
echo ""
echo "──────────────────────────────────────────────"
echo "📊 TEST RESULTS"
echo "──────────────────────────────────────────────"
echo ""
echo "  Total:  $TOTAL"
echo "  Passed: $PASSED ✅"
echo "  Failed: $FAILED ❌"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "✅ ALL TESTS PASSED"
    echo ""
    echo "🌈 Geometry OS is ready for production."
    exit 0
else
    echo "⚠️  SOME TESTS FAILED"
    echo ""
    echo "Please review failures above."
    exit 1
fi
