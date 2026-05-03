# Vision Property Gate Test Plan

## What we're testing
The quantitative checklist for Layer 3+ subsystem designs:
- MeC (Meaningful Colors) <= 8 per dashboard group
- TiR (Text-Ink Ratio) <= 30% text
- Rule of 6 (<= 6 widgets per view)
- Resolution budget (fits in 256x256 with others)
- Information hierarchy (top-left = health at a glance)

## How to run (single session, 3 tool calls)

### Step 1: Run the program
```
mcp_geo_vm_run_program with source from test_vision_gate.asm
```

### Step 2: Ask vision model a property assertion
```
mcp_geo_vision_describe with prompt:
"Analyze this dashboard for visual complexity metrics:
1. Count distinct semantic colors used (Meaningful Colors). Is it <= 8?
2. Estimate text-to-graphics ratio. Is text <= 30% of pixel area?
3. Count distinct visual elements (bars, labels, regions). Is it <= 6?
4. Can you determine system health status from the top-left area alone?
5. Does everything fit clearly within the 256x256 space?
Answer PASS or FAIL for each metric with a one-line reason."
```

### Step 3: Save screenshot for reference
```
mcp_geo_vm_screenshot with path="/tmp/vision_gate_test.png"
```

## Expected result
The test program should PASS all 5 checks:
- 5 colors (green, white, + 4 bar colors = colors 3,4,5,6,7)
- Minimal text ("OK" + one status line)
- 3 regions (health bar, 4 activity bars, status text) = 3 visual groups
- Top-left green bar with "OK" = health at a glance
- Uses ~100x120 pixel region out of 256x256

## Next step after PASS
Write a FAIL-case program (too many colors, too much text, too many widgets) and verify the vision model catches it. That validates the gate catches both good and bad designs.
