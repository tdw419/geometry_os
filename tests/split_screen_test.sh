#!/bin/bash
# split_screen_test.sh -- Verify Phase I capstone: two RISC-V programs running concurrently
# with pixel-region isolation (painter_left on left half, life32 on right half).
#
# Uses the kern_fb_verify example which boots geos_kern.elf headlessly,
# then checks the framebuffer for non-black pixels in both halves and
# verifies console output from both guest programs.
#
# Usage: bash tests/split_screen_test.sh
# Exit: 0 = pass, 1 = fail

set -euo pipefail
cd "$(dirname "$0")/.."
PROJECT_DIR="$(pwd)"

ELF="examples/riscv-hello/geos_kern.elf"
VERIFY_EXAMPLE="kern_fb_verify"

# --- Pre-flight ---
if [ ! -f "$ELF" ]; then
    echo "[FAIL] $ELF not found. Run build.sh --kern first."
    exit 1
fi

# Build the verify example (release for speed)
echo "[test] Building kern_fb_verify example..."
cargo build --release --example "$VERIFY_EXAMPLE" 2>/dev/null

# --- Run ---
# The verify example prints all diagnostics to stderr (eprintln!).
# The RISC-V console output goes to stdout (print!) but may be buffered.
# The verify example checks console internally and reports verdict to stderr.
echo "[test] Running geos_kern.elf (50M instructions)..."
VERIFY_OUT="$PROJECT_DIR/target/verify_output.txt"
./target/release/examples/kern_fb_verify "$ELF" > "$VERIFY_OUT" 2>&1 || {
    EXIT_CODE=$?
    echo "[FAIL] Verify example exited with code $EXIT_CODE"
    cat "$VERIFY_OUT"
    exit 1
}

# --- Check framebuffer pixel regions ---
echo "[test] Checking framebuffer pixel regions..."

LEFT_PIXELS=$(grep "left half" "$VERIFY_OUT" | grep -oP '\d+(?= non-black)' | head -1)
RIGHT_PIXELS=$(grep "right half" "$VERIFY_OUT" | grep -oP '\d+(?= non-black)' | head -1)

if [ -z "$LEFT_PIXELS" ]; then
    echo "[FAIL] Could not parse left-half pixel count"
    exit 1
fi
if [ -z "$RIGHT_PIXELS" ]; then
    echo "[FAIL] Could not parse right-half pixel count"
    exit 1
fi

echo "[info] Left half (painter):  $LEFT_PIXELS non-black pixels"
echo "[info] Right half (life32):  $RIGHT_PIXELS non-black pixels"

LEFT_MIN=1000
RIGHT_MIN=50

if [ "$LEFT_PIXELS" -lt "$LEFT_MIN" ]; then
    echo "[FAIL] Left half has only $LEFT_PIXELS pixels (expected >= $LEFT_MIN)"
    exit 1
fi
if [ "$RIGHT_PIXELS" -lt "$RIGHT_MIN" ]; then
    echo "[FAIL] Right half has only $RIGHT_PIXELS pixels (expected >= $RIGHT_MIN)"
    exit 1
fi
echo "[ok] Both regions have sufficient pixel content"

# --- Check console output (verify example checks this internally) ---
if grep -q "painter console: true" "$VERIFY_OUT"; then
    echo "[ok] Painter console output detected"
else
    echo "[FAIL] Painter console output missing"
    exit 1
fi

if grep -q "life32 console: true" "$VERIFY_OUT"; then
    echo "[ok] Life32 console output detected"
else
    echo "[FAIL] Life32 console output missing"
    exit 1
fi

# --- Check for PASS verdict ---
if grep -q "\[PASS\]" "$VERIFY_OUT"; then
    echo "[PASS] Split-screen kernel verification PASSED"
    exit 0
else
    echo "[FAIL] No [PASS] verdict in verify output"
    exit 1
fi
