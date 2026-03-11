# AI Verification Tests for Skills System

> These tests verify that AI agents can correctly discover, load, and execute skills from the Geometry OS skills system.
>
> **Note**: These are manual verification tests that require human evaluation. They cannot be automated because they test AI reasoning and behavior, not deterministic code outputs.

## Prerequisites

- Access to an AI assistant with context loading capabilities
- Geometry OS repository checked out locally
- Skills index file: `SKILLS.md`
- Skills directory: `.gemini/skills/`

---

## Test 1: AI Discovers Correct Skill from Natural Language Query

### Purpose

Verify that an AI can map a natural language request to the appropriate skill by reading the SKILLS.md index.

### Procedure

1. **Setup**: Ensure the AI has SKILLS.md loaded in its context.

2. **Prompt**: Ask the AI one of the following queries (choose one per test run):
   - "I need to debug why the browser HUD isn't showing updates from the Evolution Daemon"
   - "How do I start the self-improvement system and check its status?"
   - "I want to verify the full RISC-V boot stack works end-to-end"
   - "The websocket connection between AI agents and the visual interface seems broken"
   - "I need to coordinate multiple agents for a distributed catalog scan"

3. **Expected Behavior**:
   - AI identifies the relevant skill from SKILLS.md
   - AI loads the full SKILL.md file for that skill
   - AI responds with a plan referencing the skill's workflow

### Evaluation Criteria

| Criterion | Pass | Fail |
|-----------|------|------|
| Skill Discovery | AI correctly identifies the matching skill | AI suggests wrong skill or no skill |
| File Loading | AI reads the actual SKILL.md file | AI hallucinates content without reading |
| Relevance | Response directly addresses the query | Response is generic or off-topic |
| Accuracy | Steps match the skill's documented workflow | Steps contradict the skill file |

### Pass Condition

All 4 criteria must be met for a PASS.

### Example Passing Response

```
Query: "I need to debug why the browser HUD isn't showing updates"

AI Response:
"I'll use the visual-shell-debug skill to diagnose this issue.

According to `.gemini/skills/visual-shell-debug/SKILL.md`:

1. First, let me check if the WebSocket bridge is running:
   `ps aux | grep visual_bridge`

2. If not running, start it:
   `cd systems/visual_shell/api && python3 visual_bridge.py`

3. In the browser console, verify the overlay:
   `window.visualDebugOverlay`

The skill's troubleshooting section covers this exact scenario..."
```

---

## Test 2: AI Follows Skill Procedure and Executes Commands

### Purpose

Verify that an AI correctly follows the step-by-step procedure documented in a skill and executes appropriate commands.

### Procedure

1. **Setup**: Have the AI load a specific skill (e.g., `evolution-daemon-control`).

2. **Prompt**: "Start the Evolution Daemon and show me its current status."

3. **Expected Behavior**:
   - AI reads the skill's execution workflow section
   - AI navigates to the correct directory
   - AI executes commands in the documented order
   - AI interprets the output correctly

### Evaluation Criteria

| Criterion | Pass | Fail |
|-----------|------|------|
| Workflow Adherence | Commands match skill documentation | Commands deviate without justification |
| Directory Navigation | Uses correct paths from skill | Uses wrong or hallucinated paths |
| Command Order | Follows documented sequence | Skips steps or reverses order |
| Output Interpretation | Correctly parses status output | Misinterprets clear status messages |
| Error Handling | If error, uses troubleshooting section | Ignores errors or guesses at fixes |

### Pass Condition

All 5 criteria must be met for a PASS.

### Example Passing Execution

```
AI Actions:
1. cd systems/visual_shell/swarm/evolution
2. ./evolution_ctl.sh start
   Output: "Evolution Daemon started (PID 12345)"
3. ./evolution_ctl.sh status
   Output parsed: "Status: RUNNING, Cycles: 5, Improvements: 3"

AI Response:
"The Evolution Daemon is now running with PID 12345.
Current metrics show 5 cycles completed with 3 improvements applied.
The daemon is in healthy state according to the skill's metrics table."
```

---

## Test 3: AI Uses Skill Troubleshooting Section to Diagnose Issues

### Purpose

Verify that when an operation fails, the AI consults and applies the skill's troubleshooting guidance.

### Procedure

1. **Setup**: Create a simulated failure condition:
   - Option A: Stop the Evolution Daemon if running
   - Option B: Delete a required PID file
   - Option C: Have the AI check status when daemon is stopped

2. **Prompt**: "Check the Evolution Daemon status and fix any issues you find."

3. **Expected Behavior**:
   - AI detects the failure condition from command output
   - AI reads the troubleshooting section of the skill
   - AI follows the diagnostic steps in order
   - AI applies the documented resolution

### Evaluation Criteria

| Criterion | Pass | Fail |
|-----------|------|------|
| Issue Detection | Correctly identifies the problem | Misses obvious error indicators |
| Section Navigation | Finds the right troubleshooting subsection | Uses generic debugging instead |
| Step Adherence | Follows documented diagnostic steps | Skips to solutions without diagnosis |
| Resolution | Applies documented fix correctly | Attempts unrelated fixes |
| Verification | Confirms fix resolved the issue | Assumes fix without verification |

### Pass Condition

All 5 criteria must be met for a PASS.

### Example Passing Troubleshooting

```
Scenario: Daemon won't start due to stale PID file

AI Actions:
1. ./evolution_ctl.sh start
   Output: "Error: PID file exists but process not running"
2. [Reads troubleshooting section "Daemon Won't Start"]
3. rm -f evolution_daemon.pid
4. ./evolution_ctl.sh start
   Output: "Evolution Daemon started (PID 54321)"
5. ./evolution_ctl.sh status
   Output: "Status: RUNNING"

AI Response:
"The daemon failed to start due to a stale PID file.
Following the skill's troubleshooting guide, I removed the stale file
and successfully restarted the daemon. Status verified as RUNNING."
```

---

## Execution Log Template

Use this template to record test results:

```markdown
## AI Verification Test Results

**Date**: YYYY-MM-DD
**AI Model**: [Model name/version]
**Tester**: [Your name]

### Skill Discovery Verification
- Query Used: [Exact prompt]
- Skill Expected: [Expected skill name]
- Skill Selected: [Actual skill AI chose]
- Criteria Scores:
  - [ ] Skill Discovery
  - [ ] File Loading
  - [ ] Relevance
  - [ ] Accuracy
- Result: PASS / FAIL
- Notes: [Any observations]

### Procedure Execution Verification
- Skill Used: [Skill name]
- Task Given: [Exact prompt]
- Criteria Scores:
  - [ ] Workflow Adherence
  - [ ] Directory Navigation
  - [ ] Command Order
  - [ ] Output Interpretation
  - [ ] Error Handling
- Result: PASS / FAIL
- Notes: [Any observations]

### Troubleshooting Verification
- Skill Used: [Skill name]
- Issue Simulated: [Description]
- Criteria Scores:
  - [ ] Issue Detection
  - [ ] Section Navigation
  - [ ] Step Adherence
  - [ ] Resolution
  - [ ] Verification
- Result: PASS / FAIL
- Notes: [Any observations]

### Summary
- Tests Passed: X/3
- Overall Assessment: [PASS/FAIL]
- Recommendations: [Any improvements needed]
```

---

## Skills Reference for Testing

| Skill | Category | Best For Testing |
|-------|----------|------------------|
| `evolution-daemon-control` | Operations | Test 2, Test 3 |
| `visual-shell-debug` | Debugging | Test 1, Test 3 |
| `golden-path-boot-test` | Verification | Test 1, Test 2 |
| `parallel-swarm-production` | Coordination | Test 1 |
| `infinite-map-testing` | Testing | Test 1, Test 2 |

---

## Notes

- These tests require a human evaluator to assess AI reasoning quality
- Tests should be run with different queries to ensure robustness
- Failed tests should be documented with specific failure modes
- Results inform skill documentation improvements
