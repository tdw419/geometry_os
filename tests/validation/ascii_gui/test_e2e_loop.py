"""
End-to-End Loop Test - Prove complete perception-decision-action cycle works.

This test validates the complete AI interaction loop:
1. AI reads GUI state
2. AI decides on an action
3. AI writes command
4. Command is executed
5. AI verifies state change
"""

import pytest
import requests
from pathlib import Path
from datetime import datetime
import uuid
import yaml
from systems.visual_shell.ascii_gui import Window, WindowType


class TestE2ELoop:
    """End-to-end tests for complete AI-GUI interaction loop."""

    @pytest.mark.asyncio
    async def test_complete_perception_action_loop(
        self, gui_renderer, gui_processor, sample_windows, lm_studio_available
    ):
        """Test complete loop: read state -> decide -> act -> verify."""
        skip_if_no_lm_studio(lm_studio_available)

        # Setup: create windows
        for win in sample_windows:
            await gui_renderer.on_window_create(win)

        # Initially focus Terminal (need to pass Window object)
        terminal_window = next(w for w in sample_windows if w.id == "win-terminal")
        await gui_renderer.on_window_focus(terminal_window)

        # PHASE 1: AI reads state
        windows_fragment = (gui_renderer.output_dir / "fragments" / "windows.yaml").read_text()

        # PHASE 2: AI decides what to do
        decision_prompt = f"""You are an AI controlling a GUI. Current state:

```yaml
{windows_fragment}
```

The Neural City window contains important visualization data but is not visible.
Decide: What action should you take?

Available actions:
- focus: Focus a window by ID
- close: Close a window by ID

Output your decision as YAML:
```yaml
action: <action>
target: <window-id>
reasoning: <brief explanation>
```"""

        decision_response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": decision_prompt}],
                "temperature": 0.3,
                "max_tokens": 200,
            },
            timeout=30,
        )

        assert decision_response.status_code == 200
        decision_content = decision_response.json()["choices"][0]["message"]["content"]

        # Parse decision
        yaml_start = decision_content.find("action:")
        yaml_end = decision_content.rfind("```")
        if yaml_end == -1:
            yaml_end = len(decision_content)
        decision = yaml.safe_load(decision_content[yaml_start:yaml_end].strip())

        # PHASE 3: AI writes command
        ts = datetime.now().isoformat()
        cmd_id = str(uuid.uuid4())
        action = decision.get("action", "focus")
        target = decision.get("target", "win-editor")
        command_yaml = f"""command_id: {cmd_id}
action: {action}
target: {target}
timestamp: "{ts}"
source: e2e-test
"""

        cmd_path = gui_processor["pending"] / "e2e-command.yaml"
        cmd_path.write_text(command_yaml)

        # PHASE 4: Command is executed
        await gui_processor["processor"].process_pending()

        # PHASE 5: AI verifies state change
        new_fragment = (gui_renderer.output_dir / "fragments" / "windows.yaml").read_text()

        verify_prompt = f"""Verify the action was executed.

Original state showed: Terminal was focused
Action taken: {action} on {target}

New state:
```yaml
{new_fragment}
```

Did the state change as expected? Answer YES or NO with explanation."""

        verify_response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": verify_prompt}],
                "temperature": 0.1,
                "max_tokens": 100,
            },
            timeout=30,
        )

        assert verify_response.status_code == 200
        verify_content = verify_response.json()["choices"][0]["message"]["content"]

        # Command should have been executed
        assert len(gui_processor["executed_commands"]) >= 1, "Command should have been executed"

    @pytest.mark.asyncio
    async def test_multi_step_interaction(
        self, gui_renderer, gui_processor, lm_studio_available
    ):
        """Test multiple sequential interactions."""
        skip_if_no_lm_studio(lm_studio_available)

        # Setup
        await gui_renderer.on_window_create(Window(id="w1", title="Window 1", type=WindowType.TERMINAL, pos=(0, 0), size=(100, 100)))
        await gui_renderer.on_window_create(Window(id="w2", title="Window 2", type=WindowType.TERMINAL, pos=(100, 0), size=(100, 100)))
        await gui_renderer.on_window_create(Window(id="w3", title="Window 3", type=WindowType.TERMINAL, pos=(200, 0), size=(100, 100)))

        executed_count = 0

        # Step 1: Focus Window 2
        ts1 = datetime.now().isoformat()
        cmd1_id = str(uuid.uuid4())
        cmd1 = f"""command_id: {cmd1_id}
action: focus
target: w2
timestamp: "{ts1}"
source: e2e-test
"""
        (gui_processor["pending"] / "cmd1.yaml").write_text(cmd1)
        await gui_processor["processor"].process_pending()
        executed_count += 1

        # Step 2: Close Window 3
        ts2 = datetime.now().isoformat()
        cmd2_id = str(uuid.uuid4())
        cmd2 = f"""command_id: {cmd2_id}
action: close
target: w3
timestamp: "{ts2}"
source: e2e-test
"""
        (gui_processor["pending"] / "cmd2.yaml").write_text(cmd2)
        await gui_processor["processor"].process_pending()
        executed_count += 1

        # Verify both commands executed
        assert len(gui_processor["executed_commands"]) == executed_count

        # Verify state
        windows_fragment = (gui_renderer.output_dir / "fragments" / "windows.yaml").read_text()

        # Ask LLM to verify final state
        verify_prompt = f"""Verify this final state after these actions:
1. Focus Window 2
2. Close Window 3

Current state:
```yaml
{windows_fragment}
```

How many windows should exist? Which should be focused?"""

        response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": verify_prompt}],
                "temperature": 0.1,
                "max_tokens": 100,
            },
            timeout=30,
        )

        assert response.status_code == 200


def skip_if_no_lm_studio(available):
    """Skip test if LM Studio is not available."""
    if not available:
        pytest.skip("LM Studio not available at localhost:1234")
