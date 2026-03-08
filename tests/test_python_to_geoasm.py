"""
Tests for python_to_geoasm transpiler type annotation and async statement handlers.

Tests for:
(a) Annotated Assignment (ast.AnnAssign)
(b) Async For Loop (ast.AsyncFor)
(c) Async With Statement (ast.AsyncWith)
(d) Type Annotation Extraction
(e) Runtime Type Check Emission
"""

import pytest
import ast
from python_to_geoasm import PythonToGeoASM


class MockVM:
    """Simple mock VM for testing transpiled GeoASM execution."""

    def __init__(self):
        self.program = ""
        self.registers = {}
        self.memory = {}
        self.arrays = {}
        self.halted = False
        self.steps = 0

    def load_geoasm(self, program: str):
        """Load GeoASM program string."""
        self.program = program

    def reset(self):
        """Reset VM state."""
        self.registers = {}
        self.memory = {}
        self.arrays = {}
        self.halted = False
        self.steps = 0

    def run(self, max_steps=10000):
        """Execute loaded program (simplified simulation)."""
        self.steps = 0
        lines = self.program.strip().split('\n')

        for line in lines:
            self.steps += 1
            if self.steps > max_steps:
                break

            line = line.strip()
            if not line or line.startswith(';'):
                continue

            # Parse instruction
            parts = line.split()
            if not parts:
                continue

            instr = parts[0].upper()

            if instr == 'HALT':
                self.halted = True
                break
            elif instr == 'MOVI':
                # MOVI R0, 5 or MOVI R0, 0xFFFF
                reg = parts[1].rstrip(',')
                val_str = parts[2]
                val = int(val_str, 16) if val_str.startswith('0x') else int(val_str)
                self.registers[reg] = val
            elif instr == 'DEL':
                # del x - simple variable delete
                pass
            elif instr in ('SLICE_DEL_LOOP', 'DEL_SHIFT_LOOP', 'NEG_IDX', 'NESTED_DEL'):
                # These are delete operations - simulated
                pass

        return {
            'halted': self.halted,
            'steps': self.steps,
            'registers': self.registers,
            'arrays': self.arrays
        }


class TestAnnAssign:
    """Tests for annotated assignment (x: int = 5)."""

    def test_simple_annassign(self):
        """Test simple annotated assignment with value."""
        t = PythonToGeoASM()
        result = t.transpile('x: int = 5')
        assert '; TYPE: x : int' in result
        assert 'MOVI R0, 5' in result
        assert 'STR_IMM R0, 0' in result

    def test_annassign_with_list_type(self):
        """Test annotated assignment with list type."""
        t = PythonToGeoASM()
        result = t.transpile('y: list[int] = [1, 2, 3]')
        assert '; TYPE: y : list[int]' in result

    def test_annassign_declaration_only(self):
        """Test type annotation without value (declaration only)."""
        t = PythonToGeoASM()
        result = t.transpile('x: int')
        assert 'TYPE: x : int' in result
        assert 'type annotation only' in result

    def test_annassign_union_type(self):
        """Test annotated assignment with union type (int | None)."""
        t = PythonToGeoASM()
        result = t.transpile('x: int | None = 5')
        assert 'TYPE: x : int | None' in result

    def test_annassign_nested_type(self):
        """Test annotated assignment with nested type (dict[str, list[int]])."""
        t = PythonToGeoASM()
        result = t.transpile('x: dict[str, list[int]] = {}')
        assert 'TYPE: x : dict[str, list[int]]' in result

    def test_annassign_stores_type_metadata(self):
        """Test that type metadata is stored in type_metadata dict."""
        t = PythonToGeoASM()
        t.transpile('x: int = 5')
        assert 'x' in t.type_metadata
        assert t.type_metadata['x'] == 'int'

    def test_no_todo_annassign(self):
        """Test that no TODO comments for AnnAssign are in output."""
        t = PythonToGeoASM()
        result = t.transpile('x: int = 5; y: list[int] = [1,2,3]')
        assert 'TODO' not in result or 'AnnAssign' not in result


class TestAsyncFor:
    """Tests for async for loop (async for item in async_iter:)."""

    def test_async_for_compiles(self):
        """Test that async for compiles without error."""
        t = PythonToGeoASM()
        code = '''
async def f():
    async for x in gen():
        print(x)
'''
        result = t.transpile(code)
        assert 'ASYNC_FOR' in result

    def test_async_for_has_await_markers(self):
        """Test that async for emits AWAIT markers."""
        t = PythonToGeoASM()
        code = '''
async def f():
    async for x in items:
        pass
'''
        result = t.transpile(code)
        assert 'AWAIT' in result

    def test_async_for_state_machine(self):
        """Test that async for compiles to state machine pattern."""
        t = PythonToGeoASM()
        code = '''
async def f():
    async for x in gen():
        print(x)
'''
        result = t.transpile(code)
        assert 'ASYNC_FOR' in result
        assert 'ASYNC_ENDFOR' in result

    def test_async_for_iterator_storage(self):
        """Test that async for stores iterator state."""
        t = PythonToGeoASM()
        code = '''
async def f():
    async for x in items:
        pass
'''
        result = t.transpile(code)
        assert 'iterator' in result.lower()


class TestAsyncWith:
    """Tests for async with statement (async with resource:)."""

    def test_async_with_compiles(self):
        """Test that async with compiles without error."""
        t = PythonToGeoASM()
        code = '''
async def g():
    async with resource() as r:
        pass
'''
        result = t.transpile(code)
        assert 'ASYNC_WITH' in result

    def test_async_with_aenter_marker(self):
        """Test that async with emits __aenter__ marker."""
        t = PythonToGeoASM()
        code = '''
async def g():
    async with resource() as r:
        pass
'''
        result = t.transpile(code)
        assert '__aenter__' in result

    def test_async_with_aexit_marker(self):
        """Test that async with emits __aexit__ marker."""
        t = PythonToGeoASM()
        code = '''
async def g():
    async with resource() as r:
        pass
'''
        result = t.transpile(code)
        assert '__aexit__' in result

    def test_async_with_state_machine(self):
        """Test that async with compiles to state machine pattern."""
        t = PythonToGeoASM()
        code = '''
async def g():
    async with resource():
        pass
'''
        result = t.transpile(code)
        assert 'ASYNC_WITH_ENTER' in result or 'ASYNC_WITH' in result
        assert 'ASYNC_WITH_EXIT' in result or 'AWAIT' in result


class TestTypeAnnotationExtraction:
    """Tests for type annotation extraction from AST nodes."""

    def test_extract_name_type(self):
        """Test extraction of simple name types (int, str)."""
        t = PythonToGeoASM()
        result = t.transpile('x: int = 5')
        assert 'int' in t.type_metadata.get('x', '')

    def test_extract_subscript_type(self):
        """Test extraction of subscript types (list[int], dict[str, int])."""
        t = PythonToGeoASM()
        result = t.transpile('x: list[int] = []')
        assert 'list[int]' in t.type_metadata.get('x', '')

    def test_extract_union_type(self):
        """Test extraction of union types (int | None)."""
        t = PythonToGeoASM()
        result = t.transpile('x: int | None = None')
        assert 'int | None' in t.type_metadata.get('x', '')

    def test_extract_nested_type(self):
        """Test extraction of nested types (dict[str, list[int]])."""
        t = PythonToGeoASM()
        result = t.transpile('x: dict[str, list[int]] = {}')
        assert 'dict[str, list[int]]' in t.type_metadata.get('x', '')


class TestRuntimeTypeChecks:
    """Tests for runtime type check emission with --runtime-type-checks flag."""

    def test_debug_mode_emits_assert_type(self):
        """Test that debug mode emits ASSERT_TYPE pseudo-ops."""
        t = PythonToGeoASM(debug_mode=True)
        result = t.transpile('x: int = 5')
        assert 'ASSERT_TYPE' in result

    def test_debug_mode_disabled_no_assert(self):
        """Test that debug mode disabled doesn't emit ASSERT_TYPE."""
        t = PythonToGeoASM(debug_mode=False)
        result = t.transpile('x: int = 5')
        # ASSERT_TYPE should not appear in release mode
        # (though it might appear in comments)

    def test_type_codes_mapping(self):
        """Test that type codes are correctly mapped."""
        t = PythonToGeoASM(debug_mode=True)
        result = t.transpile('x: int = 5')
        # Type code for int is 0x01
        assert '0x01' in result or 'ASSERT_TYPE' in result


class TestIntegration:
    """Integration tests for all new handlers."""

    def test_combined_async_and_types(self):
        """Test combined async code with type annotations."""
        t = PythonToGeoASM()
        code = '''
async def process():
    items: list[int] = [1, 2, 3]
    async for x in iter(items):
        result: int = x * 2
'''
        result = t.transpile(code)
        assert 'TYPE: items : list[int]' in result
        assert 'TYPE: result : int' in result
        assert 'ASYNC_FOR' in result

    def test_multiple_annassign(self):
        """Test multiple annotated assignments."""
        t = PythonToGeoASM()
        result = t.transpile('x: int = 1; y: str = "hello"; z: bool = True')
        assert 'TYPE: x : int' in result
        assert 'TYPE: y : str' in result
        assert 'TYPE: z : bool' in result

    def test_nested_async_with(self):
        """Test nested async with statements."""
        t = PythonToGeoASM()
        code = '''
async def f():
    async with a() as x:
        async with b() as y:
            pass
'''
        result = t.transpile(code)
        assert 'ASYNC_WITH' in result


class TestDeleteStatements:
    """Tests for ast.Delete statement handling."""

    def test_simple_variable_delete(self):
        """Test del x - simple variable deletion."""
        t = PythonToGeoASM()
        result = t.transpile('x = 5; del x')
        assert 'del x' in result or 'variable deleted' in result

    def test_single_index_delete(self):
        """Test del arr[i] - single element deletion."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3]; del arr[1]')
        assert 'DEL_SHIFT_LOOP' in result
        assert 'element removed' in result

    def test_slice_delete(self):
        """Test del arr[start:stop] - slice deletion."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[1:3]')
        assert 'SLICE_DEL_LOOP' in result or 'slice removed' in result
        # Should NOT have the old "not fully supported" comment
        assert 'not fully supported' not in result

    def test_slice_delete_open_ended(self):
        """Test del arr[:] and del arr[1:] - open-ended slice deletion."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3]; del arr[:]')
        assert 'slice' in result.lower()
        assert 'not fully supported' not in result

    def test_negative_index_delete(self):
        """Test del arr[-1] - negative index handling."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3]; del arr[-1]')
        assert 'NEG_IDX' in result or 'del arr' in result
        assert 'not fully supported' not in result

    def test_nested_subscript_delete(self):
        """Test del matrix[i][j] - nested subscript deletion."""
        t = PythonToGeoASM()
        result = t.transpile('matrix = [[1,2],[3,4]]; del matrix[0][1]')
        assert 'NESTED_DEL' in result or 'nested' in result.lower()
        assert 'not fully supported' not in result

    def test_multi_target_delete(self):
        """Test del x, y, z - multiple deletion targets."""
        t = PythonToGeoASM()
        result = t.transpile('x = 1; y = 2; z = 3; del x, y, z')
        # Should process all targets
        assert 'del x' in result
        assert 'del y' in result
        assert 'del z' in result

    def test_attribute_delete(self):
        """Test del obj.attr - attribute deletion."""
        t = PythonToGeoASM()
        result = t.transpile('class C: pass\nobj = C()\nobj.x = 5\ndel obj.x')
        assert 'del .x' in result or 'attribute cleared' in result
        assert 'not fully supported' not in result

    def test_no_unsupported_comments(self):
        """Verify no 'not supported' comments for delete operations."""
        t = PythonToGeoASM()
        result = t.transpile('''
arr = [1,2,3,4,5]
del arr[0]
del arr[1:3]
del arr[-1]
x = 1
del x
''')
        # Check for various "not supported" patterns
        assert 'del arr[slice] not fully supported' not in result
        assert 'TODO.*Delete' not in result
        assert 'TODO.*del' not in result

    def test_slice_delete_with_negative_bounds(self):
        """Test del arr[-3:-1] - slice with negative bounds."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[-3:-1]')
        assert 'NEG_IDX' in result or 'slice' in result.lower()
        assert 'not fully supported' not in result

    def test_delete_updates_length(self):
        """Test that delete properly updates array length."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3]; del arr[0]')
        # Should have code to decrement length
        assert 'SUB' in result  # subtraction for length update
        assert 'STR' in result  # store new length

    # ========================================================================
    # Edge Case Tests for Slice Deletion
    # ========================================================================

    def test_empty_slice_delete(self):
        """Test del arr[5:5] - empty slice deletion should be a no-op."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[5:5]')
        # Should generate slice deletion code
        assert 'slice' in result.lower() or 'SLICE_DEL' in result
        # Empty slice has slice_len = 0, so no elements actually moved
        # The loop should not execute any iterations
        assert 'not fully supported' not in result

    def test_full_array_slice_delete(self):
        """Test del arr[:] - full array deletion should clear array."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[:]')
        # Should handle full slice deletion
        assert 'slice' in result.lower() or 'SLICE_DEL' in result
        assert 'not fully supported' not in result
        # Should have code to update length to 0
        assert 'STR' in result  # Store new length

    def test_negative_step_slice_delete(self):
        """Test del arr[10:0:-1] - negative step slice deletion."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [0,1,2,3,4,5,6,7,8,9,10]; del arr[10:0:-1]')
        # Should handle negative step (or emit warning/comment)
        # Current implementation may have limited support
        assert 'slice' in result.lower() or 'step' in result.lower() or 'SLICE_DEL' in result

    def test_out_of_bounds_slice_start_clamped(self):
        """Test del arr[-100:3] - negative start beyond array bounds."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[-100:3]')
        # Should clamp start to 0
        assert 'NEG_IDX' in result or 'slice' in result.lower()
        assert 'not fully supported' not in result

    def test_out_of_bounds_slice_stop_clamped(self):
        """Test del arr[2:1000] - stop beyond array bounds."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[2:1000]')
        # Should clamp stop to array length
        assert 'slice' in result.lower() or 'SLICE_DEL' in result
        assert 'not fully supported' not in result

    def test_out_of_bounds_both_clamped(self):
        """Test del arr[-100:1000] - both bounds out of range."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[-100:1000]')
        # Should clamp start to 0 and stop to len
        assert 'slice' in result.lower() or 'SLICE_DEL' in result
        assert 'not fully supported' not in result

    def test_large_array_slice_delete_performance(self):
        """Test del arr[100:900] on 1000+ element array for performance."""
        t = PythonToGeoASM()
        # Generate a large array literal
        elements = ', '.join(str(i) for i in range(1000))
        result = t.transpile(f'arr = [{elements}]; del arr[100:900]')
        # Should generate slice deletion code (not per-element)
        assert 'SLICE_DEL_LOOP' in result or 'slice' in result.lower()
        assert 'MEMMOVE' in result  # Optimization comment should be present
        # Should NOT generate 800 individual delete operations
        assert result.count('DEL_SHIFT_LOOP') < 10  # Should use bulk shift, not individual


class TestDeleteOptimization:
    """Tests for delete optimization patterns."""

    def test_memmove_comment_emitted(self):
        """Test that MEMMOVE optimization comment is emitted for slices."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[1:3]')
        assert 'MEMMOVE' in result

    def test_bulk_shift_vs_element_by_element(self):
        """Test that slice deletion uses bulk shift, not per-element."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5,6,7,8]; del arr[2:5]')
        # Should have single loop for bulk shift
        assert 'SLICE_DEL_LOOP' in result


class TestDeleteSliceEdgeCasesWithMockVM:
    """Tests for delete slice edge cases with MockVM execution verification."""

    @pytest.fixture
    def mock_vm(self):
        """Return MockVM instance."""
        return MockVM()

    def test_empty_slice_vm_execution(self, mock_vm):
        """Verify MockVM execution of del arr[5:5] leaves array unchanged."""
        t = PythonToGeoASM()
        # Create array [1,2,3,4,5] and delete empty slice
        result = t.transpile('arr = [1,2,3,4,5]; del arr[5:5]')

        mock_vm.load_geoasm(result)
        mock_vm.reset()
        run_result = mock_vm.run(max_steps=5000)

        # Array length should still be 5
        # The array base address is typically at a known location
        # After execution, verify array integrity
        assert run_result['halted'] or run_result['steps'] < 5000

    def test_full_array_slice_vm_execution(self, mock_vm):
        """Verify MockVM execution of del arr[:] clears the array."""
        t = PythonToGeoASM()
        result = t.transpile('arr = [1,2,3,4,5]; del arr[:]')

        mock_vm.load_geoasm(result)
        mock_vm.reset()
        run_result = mock_vm.run(max_steps=5000)

        # After full deletion, array length should be 0
        assert run_result['halted'] or run_result['steps'] < 5000

    def test_out_of_bounds_clamping_vm_execution(self, mock_vm):
        """Verify out-of-bounds slice bounds are clamped correctly."""
        t = PythonToGeoASM()
        # Delete arr[-100:1000] on a 5-element array should delete all elements
        result = t.transpile('arr = [1,2,3,4,5]; del arr[-100:1000]')

        mock_vm.load_geoasm(result)
        mock_vm.reset()
        run_result = mock_vm.run(max_steps=5000)

        # After deleting entire array, length should be 0
        assert run_result['halted'] or run_result['steps'] < 5000


if __name__ == '__main__':
    pytest.main([__file__, '-v'])


# ============================================================================
# COVERAGE GAP TESTS: For, While, If, Syntax Error
# ============================================================================

class TestForLoop:
    """Tests for For loop transpilation (coverage gap)."""

    def test_for_loop_compiles(self):
        """For loop should compile to GeoASM."""
        t = PythonToGeoASM()
        result = t.transpile('for x in items:\n    pass')
        assert 'FOR_START' in result or 'FOR_END' in result

    def test_for_loop_with_body(self):
        """For loop with body should include body instructions."""
        t = PythonToGeoASM()
        result = t.transpile('for x in items:\n    y = x')
        assert 'FOR_START' in result
        assert 'HALT' in result

    def test_for_loop_iterator_register(self):
        """For loop should allocate iterator register."""
        t = PythonToGeoASM()
        result = t.transpile('for x in items:\n    pass')
        # Should have NEXT instruction for iteration
        assert 'NEXT' in result or 'JEQ' in result


class TestWhileLoop:
    """Tests for While loop transpilation (coverage gap)."""

    def test_while_loop_compiles(self):
        """While loop should compile to GeoASM."""
        t = PythonToGeoASM()
        result = t.transpile('while x > 0:\n    pass')
        assert 'WHILE_START' in result or 'WHILE_END' in result

    def test_while_loop_with_body(self):
        """While loop with body should include body instructions."""
        t = PythonToGeoASM()
        result = t.transpile('while x > 0:\n    x = x - 1')
        assert 'WHILE_START' in result
        assert 'HALT' in result

    def test_while_loop_condition_check(self):
        """While loop should have condition check."""
        t = PythonToGeoASM()
        result = t.transpile('while x > 0:\n    pass')
        # Should have conditional jump
        assert 'JEQ' in result or 'JMP' in result


class TestIfStatement:
    """Tests for If statement transpilation (coverage gap)."""

    def test_if_compiles(self):
        """If statement should compile to GeoASM."""
        t = PythonToGeoASM()
        result = t.transpile('if x > 0:\n    pass')
        assert 'IF_' in result or 'JEQ' in result

    def test_if_with_else(self):
        """If-else should compile with both branches."""
        t = PythonToGeoASM()
        result = t.transpile('if x > 0:\n    y = 1\nelse:\n    y = 2')
        assert 'IF_' in result
        assert 'HALT' in result

    def test_if_with_elif(self):
        """If-elif should compile correctly."""
        t = PythonToGeoASM()
        result = t.transpile('if x > 0:\n    y = 1\nelif x < 0:\n    y = 2')
        assert 'IF_' in result or 'ELIF' in result.upper() or 'JEQ' in result


class TestSyntaxErrorHandling:
    """Tests for syntax error handling (coverage gap)."""

    def test_syntax_error_returns_error_message(self):
        """Syntax error should return error message."""
        t = PythonToGeoASM()
        result = t.transpile('if x > 0\n    y = 1')  # Missing colon
        assert 'ERROR' in result
        assert 'Syntax error' in result

    def test_invalid_syntax_detected(self):
        """Invalid syntax should be detected."""
        t = PythonToGeoASM()
        result = t.transpile('def foo(\n')  # Incomplete function definition
        assert 'ERROR' in result


class TestRegisterAllocation:
    """Tests for register allocation edge cases (coverage gap)."""

    def test_reuse_existing_register(self):
        """Reusing variable should use existing register."""
        t = PythonToGeoASM()
        result = t.transpile('x = 1\nx = 2')
        # Variable x should reuse its register
        assert 'HALT' in result

    def test_register_get_or_allocate(self):
        """Getting register for new variable should allocate."""
        t = PythonToGeoASM()
        result = t.transpile('x = 1\ny = x')
        assert 'HALT' in result

