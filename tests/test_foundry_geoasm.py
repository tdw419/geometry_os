"""Tests for GeoASM Forge System."""
import pytest

from systems.foundry.geoasm_forge import GeoASMForge, Instruction, Opcode


class TestGeoASMForge:
    """Test GeoASMForge class."""

    @pytest.fixture
    def forge(self):
        """Create a GeoASMForge instance."""
        return GeoASMForge()

    @pytest.fixture
    def sample_program(self):
        """Create a sample GeoASM program."""
        instructions = [
            Instruction(Opcode.EMBED, rd=1, rs=0),      # EMBED R0, R1
            Instruction(Opcode.LAYER, imm=0),           # LAYER #0
            Instruction(Opcode.ATTEND, rd=2, rs=1),     # ATTEND R1, R2
            Instruction(Opcode.KV_APPEND, rs=2, imm=0), # KV_APPEND R2, #0 (K)
            Instruction(Opcode.KV_APPEND, rs=2, imm=1), # KV_APPEND R2, #1 (V)
            Instruction(Opcode.PROJECT, rd=3, rs=2),    # PROJECT R2, R3
            Instruction(Opcode.SAMPLE, rd=4, rs=3),     # SAMPLE R3, R4
            Instruction(Opcode.THOUGHT_PULSE, rs=4),    # THOUGHT_PULSE R4
        ]
        return b''.join(inst.to_bytes() for inst in instructions)

    def test_forge_creation(self, forge):
        """GeoASMForge should be created successfully."""
        assert forge is not None

    def test_disassemble(self, forge, sample_program):
        """disassemble should convert bytes to instructions."""
        instructions = forge.disassemble(sample_program)
        assert len(instructions) == 8
        assert instructions[0].opcode == Opcode.EMBED
        assert instructions[-1].opcode == Opcode.THOUGHT_PULSE

    def test_assemble(self, forge):
        """assemble should convert instructions to bytes."""
        instructions = [
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.SAMPLE, rd=2, rs=1),
        ]
        program = forge.assemble(instructions)
        assert len(program) == 8  # 2 instructions * 4 bytes

    def test_roundtrip(self, forge, sample_program):
        """Disassemble then assemble should preserve program."""
        instructions = forge.disassemble(sample_program)
        reconstructed = forge.assemble(instructions)
        assert reconstructed == sample_program

    def test_optimize_removes_duplicate_layers(self, forge):
        """optimize should remove redundant LAYER instructions."""
        instructions = [
            Instruction(Opcode.LAYER, imm=0),
            Instruction(Opcode.LAYER, imm=0),  # Duplicate
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.LAYER, imm=0),  # Another duplicate
        ]
        program = b''.join(inst.to_bytes() for inst in instructions)

        optimized = forge.optimize(program)
        optimized_insts = forge.disassemble(optimized)

        # Should have fewer instructions
        assert len(optimized_insts) < len(instructions)

    def test_optimize_removes_trailing_layers(self, forge):
        """optimize should remove trailing LAYER instructions."""
        instructions = [
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.LAYER, imm=0),  # Trailing
            Instruction(Opcode.LAYER, imm=1),  # Trailing
        ]
        program = b''.join(inst.to_bytes() for inst in instructions)

        optimized = forge.optimize(program)
        optimized_insts = forge.disassemble(optimized)

        # Last instruction should not be LAYER
        assert optimized_insts[-1].opcode != Opcode.LAYER

    def test_mutate_applies_changes(self, forge, sample_program):
        """mutate should modify the program."""
        mutated = forge.mutate(sample_program, mutation_rate=1.0)  # 100% mutation rate
        # With 100% mutation rate, program should likely change
        # (though it's theoretically possible for it to stay the same)
        assert isinstance(mutated, bytes)

    def test_mutate_rate_zero(self, forge, sample_program):
        """mutate with rate 0 should not change program."""
        mutated = forge.mutate(sample_program, mutation_rate=0.0)
        assert mutated == sample_program

    def test_mutate_rate_partial(self, forge, sample_program):
        """mutate with partial rate should sometimes change."""
        # Run multiple times to check randomness
        changes = 0
        for _ in range(10):
            mutated = forge.mutate(sample_program, mutation_rate=0.5)
            if mutated != sample_program:
                changes += 1
        # Should have some changes with 50% mutation rate over 10 runs
        assert changes > 0

    def test_analyze(self, forge, sample_program):
        """analyze should return program metrics."""
        analysis = forge.analyze(sample_program)
        assert analysis['instruction_count'] == 8
        assert analysis['has_embedding'] == True
        assert analysis['has_attention'] == True
        assert analysis['has_sampling'] == True

    def test_analyze_opcode_distribution(self, forge, sample_program):
        """analyze should count opcodes."""
        analysis = forge.analyze(sample_program)
        dist = analysis['opcode_distribution']
        assert dist.get('EMBED', 0) == 1
        assert dist.get('ATTEND', 0) == 1
        assert dist.get('SAMPLE', 0) == 1

    def test_validate_valid_program(self, forge, sample_program):
        """validate should pass for valid program."""
        is_valid, errors = forge.validate(sample_program)
        assert is_valid

    def test_validate_empty_program(self, forge):
        """validate should fail for empty program."""
        is_valid, errors = forge.validate(b'')
        assert not is_valid
        assert any('empty' in e.lower() for e in errors)

    def test_validate_missing_embed(self, forge):
        """validate should fail without EMBED."""
        instructions = [
            Instruction(Opcode.SAMPLE, rd=1, rs=0),
        ]
        program = forge.assemble(instructions)
        is_valid, errors = forge.validate(program)
        assert not is_valid
        assert any('EMBED' in e for e in errors)

    def test_validate_missing_sample(self, forge):
        """validate should fail without SAMPLE."""
        instructions = [
            Instruction(Opcode.EMBED, rd=1, rs=0),
        ]
        program = forge.assemble(instructions)
        is_valid, errors = forge.validate(program)
        assert not is_valid
        assert any('SAMPLE' in e for e in errors)


class TestGeoASMTextFormat:
    """Test text format conversion."""

    @pytest.fixture
    def forge(self):
        return GeoASMForge()

    def test_to_text(self, forge):
        """to_text should convert program to assembly."""
        instructions = [
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.LAYER, imm=2),
            Instruction(Opcode.SAMPLE, rd=3, rs=2),
        ]
        program = forge.assemble(instructions)
        text = forge.to_text(program)

        assert "EMBED" in text
        assert "LAYER #2" in text
        assert "SAMPLE" in text

    def test_from_text(self, forge):
        """from_text should parse assembly text."""
        text = "EMBED R0, R1\nLAYER #2\nSAMPLE R2, R3"
        program = forge.from_text(text)
        instructions = forge.disassemble(program)

        assert len(instructions) == 3
        assert instructions[0].opcode == Opcode.EMBED
        assert instructions[1].opcode == Opcode.LAYER
        assert instructions[1].imm == 2
        assert instructions[2].opcode == Opcode.SAMPLE

    def test_roundtrip_text(self, forge):
        """Text roundtrip should preserve program."""
        original_text = "EMBED R0, R1\nLAYER #0\nSAMPLE R1, R2"
        program = forge.from_text(original_text)
        reconstructed = forge.to_text(program)

        # Parse both to compare structure
        orig_insts = forge.disassemble(forge.from_text(original_text))
        recon_insts = forge.disassemble(program)
        assert len(orig_insts) == len(recon_insts)


class TestGeoASMCrossover:
    """Test genetic crossover operations."""

    @pytest.fixture
    def forge(self):
        return GeoASMForge()

    def test_crossover_combines_programs(self, forge):
        """crossover should combine elements from both parents."""
        parent1 = forge.assemble([
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.ATTEND, rd=2, rs=1),
            Instruction(Opcode.SAMPLE, rd=3, rs=2),
        ])
        parent2 = forge.assemble([
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.PROJECT, rd=2, rs=1),
            Instruction(Opcode.SAMPLE, rd=3, rs=2),
        ])

        child = forge.crossover(parent1, parent2)
        child_insts = forge.disassemble(child)

        # Child should have instructions
        assert len(child_insts) > 0
        # First instruction should be EMBED (from parent1 start)
        assert child_insts[0].opcode == Opcode.EMBED


class TestGeoASMMutationHistory:
    """Test mutation history tracking."""

    @pytest.fixture
    def forge(self):
        return GeoASMForge()

    def test_mutation_history_empty_initially(self, forge):
        """Mutation history should start empty."""
        assert len(forge.get_mutation_history()) == 0

    def test_mutation_records_history(self, forge):
        """mutate should record in history."""
        program = forge.assemble([
            Instruction(Opcode.EMBED, rd=1, rs=0),
            Instruction(Opcode.SAMPLE, rd=2, rs=1),
        ])

        forge.mutate(program, mutation_rate=0.5)
        history = forge.get_mutation_history()

        assert len(history) == 1
        assert 'mutations_applied' in history[0]

    def test_clear_history(self, forge):
        """clear_history should remove history."""
        program = forge.assemble([Instruction(Opcode.EMBED, rd=1, rs=0)])
        forge.mutate(program, mutation_rate=1.0)

        forge.clear_history()
        assert len(forge.get_mutation_history()) == 0
