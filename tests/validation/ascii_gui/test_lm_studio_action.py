"""
LM Studio Action Test - Prove LLM can control GUI via commands.

This test validates that a local LLM (via LM Studio) can:
1. Read current GUI state
2. Decide on an action
3. Generate valid command YAML
4. Command gets processed and state changes
"""

import pytest
import requests
from pathlib import Path
from datetime import datetime
import yaml
import uuid


class TestLMStudioAction:
    """Tests for LM Studio's ability to control GUI via commands."""

    @pytest.mark.asyncio
    async def test_llm_generates_valid_focus_command(
        self, gui_renderer, gui_processor, sample_windows, lm_studio_available
    ):
        """Test that LLM can generate a valid focus command."""
        skip_if_no_lm_studio(lm_studio_available)

        # Setup: create windows, focus on Terminal
        for win in sample_windows:
            await gui_renderer.on_window_create(
                win.id, win.title, win.pos, win.size
            )
        await gui_renderer.on_window_focus("win-terminal")

        # Read current state
        windows_fragment = (gui_renderer.output_dir / "windows.yaml").read_text()

        # Ask LLM to generate a command
        prompt = f"""You are controlling a GUI. Current state:

```yaml
{windows_fragment}
```

Generate a command to focus the "Code Editor" window.

Output ONLY valid YAML in this exact format:
```yaml
command_id: <uuid>
action: focus
target: <window-id>
timestamp: <ISO8601>
source: ai-agent
```

No other text, just the YAML."""

        response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": prompt}],
                "temperature": 0.1,
                "max_tokens": 200,
            },
            timeout=30,
        )

        assert response.status_code == 200
        content = response.json()["choices"][0]["message"]["content"]

        # Extract YAML from response
        yaml_start = content.find("command_id:")
        if yaml_start == -1:
            yaml_start = content.find("```yaml") + 7
        yaml_end = content.rfind("```")
        if yaml_end == -1:
            yaml_end = len(content)
        yaml_content = content[yaml_start:yaml_end].strip()

        # Parse and validate command
        command_data = yaml.safe_load(yaml_content)

        assert command_data["action"] == "focus", f"Expected focus action, got {command_data.get('action')}"
        assert command_data["target"] == "win-editor", f"Expected win-editor target, got {command_data.get('target')}"
        assert "command_id" in command_data, "Command must have command_id"
        assert "timestamp" in command_data, "Command must have timestamp"

        # Write command to pending directory
        cmd_path = gui_processor["pending"] / f"{command_data['command_id']}.yaml"
        cmd_path.write_text(yaml_content)

        # Process the command
        await gui_processor["processor"].process_pending()

        # Verify command was processed
        assert len(gui_processor["executed_commands"]) == 1, "Command should have been executed"
        assert gui_processor["executed_commands"][0].action == "focus"
        assert gui_processor["executed_commands"][0].target == "win-editor"

    @pytest.mark.asyncio
    async def test_llm_command_execution_flow(
        self, gui_renderer, gui_processor, lm_studio_available
    ):
        """Test complete command execution flow: read -> decide -> write -> execute."""
        skip_if_no_lm_studio(lm_studio_available)

        # Setup
        await gui_renderer.on_window_create("win-a", "Window A", (0, 0), (100, 100))
        await gui_renderer.on_window_create("win-b", "Window B", (100, 0), (100, 100))

        # Simulate AI decision: close Window B
        command_yaml = f"""command_id: {uuid.uuid4()}
action: close
target: win-b
timestamp: {datetime.now().isoformat()}
source: ai-agent
"""

        # Write command
        cmd_path = gui_processor["pending"] / "cmd-close.yaml"
        cmd_path.write_text(command_yaml)

        # Process
        await gui_processor["processor"].process_pending()

        # Verify
        assert len(gui_processor["executed_commands"]) == 1
        assert gui_processor["executed_commands"][0].action == "close"
        assert gui_processor["executed_commands"][0].target == "win-b"

        # Command should be moved to completed
        assert not cmd_path.exists(), "Command should be moved from pending"
        completed_path = gui_processor["completed"] / "cmd-close.yaml"
        assert completed_path.exists(), "Command should be in completed"


def skip_if_no_lm_studio(available):
    """Skip test if LM Studio is not available."""
    if not available:
        pytest.skip("LM Studio not available at localhost:1234")
