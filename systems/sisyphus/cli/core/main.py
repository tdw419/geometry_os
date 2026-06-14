"""
Sisyphus CLI Core - Main entry point with Click-based commands.

Following CLI-Anything methodology:
- Structured JSON output for agent consumption
- REPL mode for interactive sessions
- Discoverable commands with --help
- State management and session persistence
"""

import json
import sys
from datetime import datetime
from pathlib import Path
from typing import Any, Optional

import click

# Add project root to path for imports
# This file is at systems/sisyphus/cli/core/main.py (5 levels from project root)
_PROJECT_ROOT = Path(__file__).resolve().parents[4]  # Go up 5 levels to geometry_os
if str(_PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(_PROJECT_ROOT))

from systems.sisyphus.daemon import SisyphusDaemon, TaskState


def json_output(data: dict[str, Any]) -> str:
    """Format output as JSON for agent consumption."""
    return json.dumps(data, indent=2, default=str)


def task_to_dict(task) -> dict[str, Any]:
    """Convert Task object to dictionary."""
    return {
        "number": task.number,
        "name": task.name,
        "description": task.description,
        "verification": task.verification,
        "state": task.state.value,
        "line_number": task.line_number,
    }


def daemon_status_dict(daemon: SisyphusDaemon) -> dict[str, Any]:
    """Get daemon status as dictionary."""
    tasks = daemon.get_tasks()
    pending = [t for t in tasks if t.state == TaskState.PENDING]
    complete = [t for t in tasks if t.state == TaskState.COMPLETE]
    failed = [t for t in tasks if t.state == TaskState.FAILED]
    in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]

    return {
        "timestamp": datetime.now().isoformat(),
        "running": daemon.running,
        "brain_evolution": daemon.enable_brain_evolution,
        "self_rewriting": daemon.enable_self_rewriting,
        "tectonic": daemon.enable_tectonic,
        "router_available": daemon.router is not None,
        "brain_hook_available": daemon.brain_hook is not None,
        "critic_available": daemon.critic is not None,
        "generation_failures": daemon._generation_failures,
        "tasks": {
            "total": len(tasks),
            "pending": len(pending),
            "complete": len(complete),
            "failed": len(failed),
            "in_progress": len(in_progress),
        },
        "pending_tasks": [task_to_dict(t) for t in pending[:5]],
        "current_task": task_to_dict(in_progress[0]) if in_progress else None,
    }


# Main CLI group
@click.group(invoke_without_command=True)
@click.option("--json", "json_mode", is_flag=True, help="Output as JSON for agent consumption")
@click.option("--verbose", "-v", is_flag=True, help="Verbose output")
@click.pass_context
def cli(ctx: click.Context, json_mode: bool, verbose: bool):
    """
    Sisyphus CLI - Agent-native interface for the Sisyphus evolution daemon.

    Run without arguments to enter REPL mode.
    """
    ctx.ensure_object(dict)
    ctx.obj["json"] = json_mode
    ctx.obj["verbose"] = verbose

    if ctx.invoked_subcommand is None:
        # Enter REPL mode
        ctx.invoke(repl)


@cli.command()
@click.pass_context
def status(ctx: click.Context):
    """Get current daemon status."""
    daemon = SisyphusDaemon(enable_brain_evolution=True)
    status_data = daemon_status_dict(daemon)

    if ctx.obj.get("json"):
        click.echo(json_output(status_data))
    else:
        click.echo(f"Sisyphus Daemon Status")
        click.echo(f"=" * 40)
        click.echo(
            f"Tasks: {status_data['tasks']['pending']} pending, "
            f"{status_data['tasks']['complete']} complete, "
            f"{status_data['tasks']['failed']} failed"
        )

        if status_data["current_task"]:
            t = status_data["current_task"]
            click.echo(f"\nCurrent Task: #{t['number']} - {t['name']}")

        click.echo(f"\nComponents:")
        click.echo(f"  Router: {'✓' if status_data['router_available'] else '✗'}")
        click.echo(f"  Brain Hook: {'✓' if status_data['brain_hook_available'] else '✗'}")
        click.echo(f"  Critic: {'✓' if status_data['critic_available'] else '✗'}")


@cli.command()
@click.option("--limit", "-n", default=10, help="Number of tasks to show")
@click.option(
    "--state",
    "-s",
    type=click.Choice(["pending", "complete", "failed", "all"]),
    default="pending",
    help="Filter by state",
)
@click.option("--json", "json_mode", is_flag=True, help="Output as JSON for agent consumption")
@click.pass_context
def tasks(ctx: click.Context, limit: int, state: str, json_mode: bool):
    """List tasks by state."""
    daemon = SisyphusDaemon()
    all_tasks = daemon.get_tasks()

    if state == "all":
        filtered = all_tasks
    else:
        state_map = {
            "pending": TaskState.PENDING,
            "complete": TaskState.COMPLETE,
            "failed": TaskState.FAILED,
        }
        filtered = [t for t in all_tasks if t.state == state_map[state]]

    filtered = filtered[:limit]

    if json_mode:
        click.echo(
            json_output(
                {
                    "state_filter": state,
                    "count": len(filtered),
                    "total_matching": len(
                        [t for t in all_tasks if state == "all" or t.state == state_map.get(state)]
                    ),
                    "tasks": [task_to_dict(t) for t in filtered],
                }
            )
        )
    else:
        click.echo(f"Tasks ({state}): {len(filtered)} shown")
        click.echo("-" * 60)
        for t in filtered:
            state_char = {
                "pending": "[ ]",
                "complete": "[x]",
                "failed": "[!]",
                "in_progress": "[→]",
            }.get(t.state.value, "[?]")
            click.echo(f"{state_char} {t.number}. {t.name}")


@cli.command()
@click.argument("task_id", type=int)
@click.pass_context
def show(ctx: click.Context, task_id: int):
    """Show details for a specific task."""
    daemon = SisyphusDaemon()
    tasks = daemon.get_tasks()

    task = next((t for t in tasks if t.number == task_id), None)

    if not task:
        if ctx.obj.get("json"):
            click.echo(json_output({"error": f"Task {task_id} not found"}))
        else:
            click.echo(f"Error: Task {task_id} not found", err=True)
        sys.exit(1)

    if ctx.obj.get("json"):
        click.echo(json_output(task_to_dict(task)))
    else:
        click.echo(f"Task #{task.number}: {task.name}")
        click.echo("=" * 50)
        click.echo(f"State: {task.state.value}")
        click.echo(f"Description: {task.description}")
        if task.verification:
            click.echo(f"Verification: {task.verification}")


@cli.command()
@click.option("--timeout", "-t", default=300, help="Task timeout in seconds")
@click.pass_context
def run(ctx: click.Context, timeout: int):
    """Run the next pending task."""
    daemon = SisyphusDaemon(enable_brain_evolution=True)
    tasks = daemon.get_tasks()
    pending = [t for t in tasks if t.state == TaskState.PENDING]

    if not pending:
        if ctx.obj.get("json"):
            click.echo(json_output({"status": "no_pending_tasks"}))
        else:
            click.echo("No pending tasks to run")
        return

    task = pending[0]

    if ctx.obj.get("json"):
        click.echo(
            json_output({"status": "starting", "task": task_to_dict(task), "timeout": timeout})
        )

    # Run the task
    daemon.run_task(task)

    # Get updated state
    tasks = daemon.get_tasks()
    updated = next((t for t in tasks if t.number == task.number), None)

    if ctx.obj.get("json"):
        click.echo(
            json_output({"status": "completed", "task": task_to_dict(updated) if updated else None})
        )
    else:
        if updated:
            click.echo(f"Task #{task.number} {updated.state.value}: {updated.name}")
        else:
            click.echo(f"Task #{task.number} completed")


@cli.command()
@click.pass_context
def generate(ctx: click.Context):
    """Generate new tasks using heuristic fallback."""
    daemon = SisyphusDaemon(enable_brain_evolution=True)

    if ctx.obj.get("json"):
        click.echo(json_output({"status": "generating", "timestamp": datetime.now().isoformat()}))

    daemon.generate_tasks()

    tasks = daemon.get_tasks()
    pending = [t for t in tasks if t.state == TaskState.PENDING]

    if ctx.obj.get("json"):
        click.echo(
            json_output(
                {
                    "status": "generated",
                    "pending_count": len(pending),
                    "newest_tasks": [task_to_dict(t) for t in pending[-5:]],
                }
            )
        )
    else:
        click.echo(f"Generated tasks. Pending: {len(pending)}")


@cli.command()
@click.option("--tail", "-n", default=20, help="Number of lines to show")
@click.pass_context
def logs(ctx: click.Context, tail: int):
    """Show recent evolution logs."""
    log_path = Path(".loop/evolution.log")

    if not log_path.exists():
        if ctx.obj.get("json"):
            click.echo(json_output({"error": "No evolution log found"}))
        else:
            click.echo("No evolution log found")
        return

    with open(log_path) as f:
        lines = f.readlines()[-tail:]

    if ctx.obj.get("json"):
        click.echo(
            json_output(
                {
                    "log_file": str(log_path),
                    "lines_shown": len(lines),
                    "entries": [line.strip() for line in lines],
                }
            )
        )
    else:
        click.echo(f"Last {len(lines)} lines from {log_path}:")
        click.echo("-" * 60)
        for line in lines:
            click.echo(line.rstrip())


@cli.command()
@click.option("--json", "json_mode", is_flag=True, help="Output as JSON for agent consumption")
@click.pass_context
def health(ctx: click.Context, json_mode: bool):
    """Check daemon health and component status."""
    daemon = SisyphusDaemon(enable_brain_evolution=True)

    health_data = {
        "timestamp": datetime.now().isoformat(),
        "healthy": True,
        "issues": [],
        "components": {},
    }

    # Check router
    if daemon.router is None:
        health_data["components"]["router"] = {"status": "unavailable", "impact": "medium"}
        health_data["issues"].append("Cognitive router not available - using heuristic fallback")
    else:
        health_data["components"]["router"] = {"status": "ok"}

    # Check brain hook
    if daemon.brain_hook is None:
        health_data["components"]["brain_hook"] = {"status": "unavailable", "impact": "low"}
        health_data["issues"].append("Brain evolution hook not available")
    else:
        health_data["components"]["brain_hook"] = {"status": "ok"}

    # Check generation failures
    if daemon._generation_failures > 3:
        health_data["components"]["generation"] = {
            "status": "degraded",
            "failures": daemon._generation_failures,
            "impact": "high",
        }
        health_data["issues"].append(f"Generation has failed {daemon._generation_failures} times")
        health_data["healthy"] = False

    # Check pending tasks
    tasks = daemon.get_tasks()
    pending = [t for t in tasks if t.state == TaskState.PENDING]

    if len(pending) == 0:
        health_data["components"]["task_queue"] = {"status": "empty", "impact": "low"}
        health_data["issues"].append("No pending tasks - generation may be needed")
    else:
        health_data["components"]["task_queue"] = {"status": "ok", "pending": len(pending)}

    if json_mode:
        click.echo(json_output(health_data))
    else:
        status = "✓ HEALTHY" if health_data["healthy"] else "✗ UNHEALTHY"
        click.echo(f"Sisyphus Health: {status}")
        click.echo("-" * 40)

        for name, info in health_data["components"].items():
            icon = "✓" if info["status"] == "ok" else "⚠" if info["status"] == "degraded" else "✗"
            click.echo(f"  {icon} {name}: {info['status']}")

        if health_data["issues"]:
            click.echo("\nIssues:")
            for issue in health_data["issues"]:
                click.echo(f"  - {issue}")


@cli.command()
@click.pass_context
def repl(ctx: click.Context):
    """Start interactive REPL mode."""
    click.echo("Sisyphus REPL - Type 'help' for commands, 'exit' to quit")
    click.echo("=" * 50)

    daemon = SisyphusDaemon(enable_brain_evolution=True)

    while True:
        try:
            line = input("sisyphus> ").strip()
        except (EOFError, KeyboardInterrupt):
            click.echo("\nGoodbye!")
            break

        if not line:
            continue

        if line in ("exit", "quit", "q"):
            click.echo("Goodbye!")
            break

        if line in ("help", "h", "?"):
            click.echo("Commands: status, tasks, run, generate, logs, health, exit")
            continue

        # Process command
        parts = line.split(maxsplit=1)
        cmd = parts[0]
        args = parts[1] if len(parts) > 1 else ""

        try:
            if cmd == "status":
                status_data = daemon_status_dict(daemon)
                click.echo(
                    f"Pending: {status_data['tasks']['pending']}, "
                    f"Complete: {status_data['tasks']['complete']}, "
                    f"Failed: {status_data['tasks']['failed']}"
                )

            elif cmd == "tasks":
                tasks_list = daemon.get_tasks()
                pending = [t for t in tasks_list if t.state == TaskState.PENDING]
                for t in pending[:5]:
                    click.echo(f"  [ ] {t.number}. {t.name}")

            elif cmd == "run":
                pending = [t for t in daemon.get_tasks() if t.state == TaskState.PENDING]
                if pending:
                    click.echo(f"Running task {pending[0].number}...")
                    daemon.run_task(pending[0])
                else:
                    click.echo("No pending tasks")

            elif cmd == "generate":
                click.echo("Generating tasks...")
                daemon.generate_tasks()
                click.echo("Done")

            elif cmd == "logs":
                log_path = Path(".loop/evolution.log")
                if log_path.exists():
                    with open(log_path) as f:
                        for line in f.readlines()[-10:]:
                            click.echo(f"  {line.rstrip()}")
                else:
                    click.echo("No logs found")

            elif cmd == "health":
                status_data = daemon_status_dict(daemon)
                click.echo(f"Router: {'✓' if status_data['router_available'] else '✗'}")
                click.echo(f"Brain: {'✓' if status_data['brain_hook_available'] else '✗'}")
                click.echo(f"Failures: {status_data['generation_failures']}")

            else:
                click.echo(f"Unknown command: {cmd}. Type 'help' for commands.")

        except Exception as e:
            click.echo(f"Error: {e}")


if __name__ == "__main__":
    cli(obj={})
