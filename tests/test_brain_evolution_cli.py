"""Tests for brain evolution CLI commands."""
from unittest.mock import AsyncMock, MagicMock, patch

import pytest


class TestBrainStatusCommand:
    """Test brain status CLI command."""

    @pytest.fixture
    def mock_hook(self):
        """Create mock BrainEvolutionHook."""
        mock = MagicMock()
        mock.get_mutation_stats.return_value = {
            "total": 10,
            "kept": 7,
            "reverted": 3,
            "keep_rate": 0.7,
            "avg_improvement": 0.012,
            "sectors_mutated": ["embeddings", "attention_layer_0"]
        }
        return mock

    def test_status_shows_mutation_stats(self, mock_hook, capsys):
        """Status command should display mutation statistics."""
        from systems.pixel_compiler.pixelrts_cli import cmd_brain_status

        # Create mock args
        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.json = False

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook):
            with patch('os.path.exists', return_value=True):
                result = cmd_brain_status(args)

        assert result == 0

        # Check output contains expected info
        captured = capsys.readouterr()
        assert "Total Mutations" in captured.out
        assert "10" in captured.out

    def test_status_json_output(self, mock_hook, capsys):
        """Status command with --json should output JSON."""
        import json

        from systems.pixel_compiler.pixelrts_cli import cmd_brain_status

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.json = True

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook):
            with patch('os.path.exists', return_value=True):
                result = cmd_brain_status(args)

        assert result == 0

        captured = capsys.readouterr()
        output = json.loads(captured.out)
        assert "stats" in output
        assert output["stats"]["total"] == 10

    def test_status_handles_no_mutations(self, capsys):
        """Status command handles brain with no mutations."""
        from systems.pixel_compiler.pixelrts_cli import cmd_brain_status

        mock_hook = MagicMock()
        mock_hook.get_mutation_stats.return_value = {"total": 0}

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.json = False

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook):
            with patch('os.path.exists', return_value=True):
                result = cmd_brain_status(args)

        assert result == 0

        captured = capsys.readouterr()
        assert "No mutations recorded" in captured.out


class TestBrainEvolveCommand:
    """Test brain evolve CLI command."""

    @pytest.fixture
    def mock_hook_async(self):
        """Create mock BrainEvolutionHook with async on_evolution_cycle."""
        mock = MagicMock()
        mock.on_evolution_cycle = AsyncMock(return_value={
            "success": True,
            "mutation_type": "weights",
            "sector": "embeddings",
            "fitness_before": 0.5,
            "fitness_after": 0.55,
            "improvement": 0.05,
            "kept": True
        })
        return mock

    def test_evolve_triggers_mutation(self, mock_hook_async, capsys):
        """Evolve command should trigger a mutation cycle."""
        from systems.pixel_compiler.pixelrts_cli import cmd_brain_evolve

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.sector = None
        args.rate = 0.0
        args.json = False

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook_async):
            result = cmd_brain_evolve(args)

        assert result == 0

        captured = capsys.readouterr()
        assert "Evolution cycle completed" in captured.out

    def test_evolve_json_output(self, mock_hook_async, capsys):
        """Evolve command with --json should output JSON."""
        import json

        from systems.pixel_compiler.pixelrts_cli import cmd_brain_evolve

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.sector = None
        args.rate = 0.01
        args.json = True

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook_async):
            result = cmd_brain_evolve(args)

        assert result == 0

        captured = capsys.readouterr()
        output = json.loads(captured.out)
        assert "result" in output
        assert output["result"]["success"] is True

    def test_evolve_handles_skip(self, capsys):
        """Evolve command handles skipped evolution."""
        from systems.pixel_compiler.pixelrts_cli import cmd_brain_evolve

        mock_hook = MagicMock()
        mock_hook.on_evolution_cycle = AsyncMock(return_value={
            "skipped": True,
            "reason": "random skip"
        })

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.sector = None
        args.rate = 0.0
        args.json = False

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook):
            result = cmd_brain_evolve(args)

        assert result == 0

        captured = capsys.readouterr()
        assert "skipped" in captured.out

    def test_evolve_handles_error(self, capsys):
        """Evolve command handles errors gracefully."""
        from systems.pixel_compiler.pixelrts_cli import cmd_brain_evolve

        mock_hook = MagicMock()
        mock_hook.on_evolution_cycle = AsyncMock(return_value={
            "error": "Could not load brain atlas",
            "success": False
        })

        args = MagicMock()
        args.brain = "tinystories_brain.rts.png"
        args.sector = None
        args.rate = 0.0
        args.json = False

        with patch('systems.evolution_daemon.evolution_hooks.brain_evolution_hook.BrainEvolutionHook', return_value=mock_hook):
            result = cmd_brain_evolve(args)

        assert result == 1  # Error exit code

        captured = capsys.readouterr()
        assert "failed" in captured.out.lower()


class TestBrainDispatch:
    """Test brain command dispatching."""

    def test_dispatch_brain_status(self):
        """Dispatch should route to status handler."""
        from systems.pixel_compiler.pixelrts_cli import _dispatch_brain

        args = MagicMock()
        args.brain_command = 'status'
        args.brain = 'tinystories_brain.rts.png'
        args.json = False

        with patch('systems.pixel_compiler.pixelrts_cli.cmd_brain_status') as mock_status:
            mock_status.return_value = 0
            result = _dispatch_brain(args)
            mock_status.assert_called_once_with(args)

    def test_dispatch_brain_evolve(self):
        """Dispatch should route to evolve handler."""
        from systems.pixel_compiler.pixelrts_cli import _dispatch_brain

        args = MagicMock()
        args.brain_command = 'evolve'
        args.brain = 'tinystories_brain.rts.png'
        args.sector = None
        args.rate = 0.0
        args.json = False

        with patch('systems.pixel_compiler.pixelrts_cli.cmd_brain_evolve') as mock_evolve:
            mock_evolve.return_value = 0
            result = _dispatch_brain(args)
            mock_evolve.assert_called_once_with(args)

    def test_dispatch_brain_no_command(self, capsys):
        """Dispatch without command should show help."""
        from systems.pixel_compiler.pixelrts_cli import _dispatch_brain

        args = MagicMock()
        args.brain_command = None

        result = _dispatch_brain(args)
        assert result == 1

        captured = capsys.readouterr()
        assert "status" in captured.out or "evolve" in captured.out
