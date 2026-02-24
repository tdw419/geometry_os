#!/usr/bin/env python3
"""
Geometry OS ASCII GUI - Integration Example

Demonstrates the complete flow of the ASCII GUI system:
1. Setting up the hook broadcaster
2. Registering the fragment renderer
3. Simulating GUI events (window create, focus, mouse move)
4. Reading fragments as AI would
5. Writing commands as AI would

This example shows how the dual-audience interface works:
- GUI events -> ASCII fragments (AI can read)
- AI commands -> YAML files -> Execution (GUI reacts)

Run with: python systems/visual_shell/ascii_gui/example.py
"""

import asyncio
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import List

# Add project root to path for imports
project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from systems.visual_shell.ascii_gui import (
    GUIHookBroadcaster,
    GUIFragmentRenderer,
    GUICommandProcessor,
    LoggingGUITHook,
    Window,
    WindowType,
    Command,
)


class DemoExecutor:
    """Mock executor that simulates GUI command execution."""

    def __init__(self):
        self.executed_commands: List[Command] = []

    async def execute(self, cmd: Command) -> None:
        """Simulate executing a GUI command."""
        self.executed_commands.append(cmd)
        print(f"  [EXECUTOR] Executed: {cmd.action}")

        # Simulate some actions
        if cmd.action == "click":
            print(f"  [EXECUTOR]   -> Clicked at {cmd.position} on {cmd.target}")
        elif cmd.action == "type":
            print(f"  [EXECUTOR]   -> Typed: '{cmd.text}'")
        elif cmd.action == "key":
            print(f"  [EXECUTOR]   -> Pressed keys: {cmd.keys}")


async def main():
    """Run the integration example."""
    print("=" * 60)
    print("Geometry OS ASCII GUI - Integration Example")
    print("=" * 60)
    print()

    # --- 1. Setup Hook Broadcaster ---
    print("1. Setting up Hook Broadcaster")
    print("-" * 40)

    broadcaster = GUIHookBroadcaster()
    print("  Created GUIHookBroadcaster")

    # Add logging hook for visibility
    broadcaster.add_hook(LoggingGUITHook())
    print("  Added LoggingGUITHook")

    # --- 2. Register Fragment Renderer ---
    print("\n2. Registering Fragment Renderer")
    print("-" * 40)

    gui_dir = project_root / ".geometry" / "gui"
    renderer = GUIFragmentRenderer(
        output_dir=str(gui_dir),
        auto_flush=True,
        box_width=60
    )
    broadcaster.add_hook(renderer)
    print(f"  Created GUIFragmentRenderer")
    print(f"  Output directory: {renderer.fragments_dir}")
    print(f"  Auto-flush: enabled")

    # --- 3. Simulate GUI Events ---
    print("\n3. Simulating GUI Events")
    print("-" * 40)

    # Create some windows
    terminal = Window(
        id="terminal-1",
        title="Terminal",
        type=WindowType.TERMINAL,
        pos=(100, 50),
        size=(640, 480),
        z=1
    )

    editor = Window(
        id="editor-1",
        title="main.py - GeometryOS",
        type=WindowType.EDITOR,
        pos=(200, 100),
        size=(800, 600),
        z=2
    )

    browser = Window(
        id="browser-1",
        title="Documentation",
        type=WindowType.BROWSER,
        pos=(400, 50),
        size=(1024, 768),
        z=0
    )

    print("  Creating terminal window...")
    await broadcaster.on_window_create(terminal)

    print("  Creating editor window...")
    await broadcaster.on_window_create(editor)

    print("  Creating browser window...")
    await broadcaster.on_window_create(browser)

    print("\n  Focusing editor window...")
    await broadcaster.on_window_focus(editor)

    print("  Moving mouse...")
    await broadcaster.on_mouse_move(450, 300, "textarea#code-input")

    print("  Pressing key...")
    await broadcaster.on_key_press("s", ["ctrl"])

    # --- 4. Read Fragments as AI Would ---
    print("\n4. Reading Fragments (AI Perspective)")
    print("-" * 40)

    # Windows fragment (YAML)
    windows_path = renderer.fragments_dir / "windows.yaml"
    if windows_path.exists():
        print("\n  [windows.yaml]")
        content = windows_path.read_text()
        # Show first 15 lines
        lines = content.strip().split("\n")[:15]
        for line in lines:
            print(f"    {line}")
        if len(content.strip().split("\n")) > 15:
            print("    ...")

    # Focus fragment (ASCII)
    focus_path = renderer.fragments_dir / "focus.ascii"
    if focus_path.exists():
        print("\n  [focus.ascii]")
        for line in focus_path.read_text().strip().split("\n"):
            print(f"    {line}")

    # Mouse fragment (ASCII)
    mouse_path = renderer.fragments_dir / "mouse.ascii"
    if mouse_path.exists():
        print("\n  [mouse.ascii]")
        for line in mouse_path.read_text().strip().split("\n"):
            print(f"    {line}")

    # Keyboard fragment (ASCII)
    keyboard_path = renderer.fragments_dir / "keyboard.ascii"
    if keyboard_path.exists():
        print("\n  [keyboard.ascii]")
        for line in keyboard_path.read_text().strip().split("\n"):
            print(f"    {line}")

    # --- 5. Write Command as AI Would ---
    print("\n5. Writing Command (AI Perspective)")
    print("-" * 40)

    # Setup command processor
    demo_executor = DemoExecutor()
    processor = GUICommandProcessor(
        executor=demo_executor.execute,
        gui_dir=str(gui_dir)
    )
    print(f"  Created GUICommandProcessor")
    print(f"  Pending dir: {processor.pending_dir}")
    print(f"  Completed dir: {processor.completed_dir}")

    # AI writes a command to click a button
    click_cmd = Command(
        command_id="cmd-ai-001",
        action="click",
        timestamp=datetime.now(timezone.utc),
        position=(500, 350),
        target="button#run-code"
    )

    cmd_path = processor.pending_dir / f"{click_cmd.command_id}.yaml"
    cmd_path.write_text(click_cmd.to_yaml())
    print(f"\n  AI wrote command: {click_cmd.command_id}")
    print(f"    Action: {click_cmd.action}")
    print(f"    Target: {click_cmd.target}")
    print(f"    Position: {click_cmd.position}")

    # AI writes another command to type text
    type_cmd = Command(
        command_id="cmd-ai-002",
        action="type",
        timestamp=datetime.now(timezone.utc),
        target="textarea#code-input",
        text="print('Hello, Geometry OS!')"
    )

    cmd_path2 = processor.pending_dir / f"{type_cmd.command_id}.yaml"
    cmd_path2.write_text(type_cmd.to_yaml())
    print(f"\n  AI wrote command: {type_cmd.command_id}")
    print(f"    Action: {type_cmd.action}")
    print(f"    Target: {type_cmd.target}")
    print(f"    Text: {type_cmd.text}")

    # Process pending commands
    print(f"\n  Processing pending commands...")
    print(f"  Pending count: {processor.get_pending_count()}")

    results = await processor.process_pending()

    print(f"\n  Processing results:")
    for result in results:
        status = "OK" if result["success"] else "FAILED"
        print(f"    {result['command_id']}: {status} ({result['execution_time_ms']}ms)")

    print(f"\n  Completed count: {processor.get_completed_count()}")

    # Show a completed command file
    completed_path = processor.completed_dir / f"{click_cmd.command_id}.yaml"
    if completed_path.exists():
        print(f"\n  [completed/{click_cmd.command_id}.yaml]")
        for line in completed_path.read_text().strip().split("\n"):
            print(f"    {line}")

    # --- Summary ---
    print("\n" + "=" * 60)
    print("Summary")
    print("=" * 60)
    print(f"  Windows created: {len(renderer.windows)}")
    print(f"  Focused window: {renderer.focus_state.window_id}")
    print(f"  Mouse position: ({renderer.mouse_state.x}, {renderer.mouse_state.y})")
    print(f"  Last key: {renderer.keyboard_state.last_key}")
    print(f"  Commands processed: {len(results)}")
    print(f"  Fragment files: {list(renderer.fragments_dir.glob('*.ascii')) + list(renderer.fragments_dir.glob('*.yaml'))}")
    print()
    print("Integration example complete!")
    print()

    return 0


if __name__ == "__main__":
    exit_code = asyncio.run(main())
    sys.exit(exit_code)
