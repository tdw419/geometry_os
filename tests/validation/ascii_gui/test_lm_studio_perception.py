"""
LM Studio Perception Test - Prove LLM can read and understand GUI state.

This test validates that a local LLM (via LM Studio) can:
1. Read ASCII fragment files
2. Understand the GUI state (windows, focus, etc.)
3. Correctly answer questions about the state
"""

import pytest
import requests
from pathlib import Path
from systems.visual_shell.ascii_gui import Window, WindowType


class TestLMStudioPerception:
    """Tests for LM Studio's ability to perceive GUI state."""

    @pytest.mark.asyncio
    async def test_llm_identifies_windows(self, gui_renderer, sample_windows, lm_studio_available):
        """Test that LLM can identify all windows from ASCII fragments."""
        skip_if_no_lm_studio(lm_studio_available)

        # Render sample windows
        for win in sample_windows:
            await gui_renderer.on_window_create(win)

        # Focus the editor window (need to pass Window object)
        editor_window = next(w for w in sample_windows if w.id == "win-editor")
        await gui_renderer.on_window_focus(editor_window)

        # Read the generated fragment
        windows_fragment = (gui_renderer.output_dir / "fragments" / "windows.yaml").read_text()

        # Ask LM Studio about the windows
        prompt = f"""You are analyzing a GUI state file. Here is the current state:

```yaml
{windows_fragment}
```

Answer these questions:
1. How many windows are open?
2. What are their titles?
3. Which window is focused?

Respond in JSON format:
{{"window_count": N, "titles": ["..."], "focused": "..."}}"""

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

        # Parse response and validate
        import json
        # Extract JSON from response (may have markdown formatting)
        json_start = content.find("{")
        json_end = content.rfind("}") + 1
        result = json.loads(content[json_start:json_end])

        assert result["window_count"] == 3, f"Expected 3 windows, got {result['window_count']}"
        assert "Terminal" in str(result["titles"]), "Should identify Terminal window"
        assert "Code Editor" in str(result["titles"]), "Should identify Code Editor window"
        assert result["focused"] == "Code Editor" or "win-editor" in str(result["focused"]), \
            f"Should identify Code Editor as focused, got {result['focused']}"

    @pytest.mark.asyncio
    async def test_llm_identifies_focus_state(self, gui_renderer, lm_studio_available):
        """Test that LLM can identify focus state from ASCII box."""
        skip_if_no_lm_studio(lm_studio_available)

        # Create a window and focus it
        win = Window(id="win-001", title="Dashboard", type=WindowType.TERMINAL, pos=(0, 0), size=(1920, 1080))
        await gui_renderer.on_window_create(win)
        await gui_renderer.on_window_focus(win)

        # Read focus fragment
        focus_fragment = (gui_renderer.output_dir / "fragments" / "focus.ascii").read_text()

        prompt = f"""Analyze this focus state:

{focus_fragment}

What window is currently focused? Respond with just the window ID."""

        response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": prompt}],
                "temperature": 0.1,
                "max_tokens": 50,
            },
            timeout=30,
        )

        assert response.status_code == 200
        content = response.json()["choices"][0]["message"]["content"]

        assert "win-001" in content or "Dashboard" in content, \
            f"LLM should identify focused window, got: {content}"

    @pytest.mark.asyncio
    async def test_llm_identifies_mouse_state(self, gui_renderer, lm_studio_available):
        """Test that LLM can identify mouse state from ASCII box."""
        skip_if_no_lm_studio(lm_studio_available)

        # Set mouse state
        await gui_renderer.on_mouse_move(512, 384, hovering=None)

        # Read mouse fragment
        mouse_fragment = (gui_renderer.output_dir / "fragments" / "mouse.ascii").read_text()

        prompt = f"""Analyze this mouse state:

{mouse_fragment}

What is the mouse position? Respond in format: (x, y)"""

        response = requests.post(
            "http://localhost:1234/v1/chat/completions",
            json={
                "model": "local-model",
                "messages": [{"role": "user", "content": prompt}],
                "temperature": 0.1,
                "max_tokens": 50,
            },
            timeout=30,
        )

        assert response.status_code == 200
        content = response.json()["choices"][0]["message"]["content"]

        assert "512" in content and "384" in content, \
            f"LLM should identify mouse position (512, 384), got: {content}"


def skip_if_no_lm_studio(available):
    """Skip test if LM Studio is not available."""
    if not available:
        pytest.skip("LM Studio not available at localhost:1234")
