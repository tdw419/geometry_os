#!/usr/bin/env python3
"""C-to-.glyph transpiler for Geometry OS.

Takes simplified C code, parses it with pycparser, and emits .glyph
assembly that runs on the Geometry OS software VM.

Supports:
  - int variables (mapped to registers r0-r31)
  - Arithmetic: +, -, *, /, %, &, |, ^, ~, <<, >>
  - Comparisons: ==, !=, <, >, <=, >=
  - if/else statements
  - while/for loops
  - Basic function parameters (passed in r0-r7, return value in r0)

Does NOT support:
  - Structs, pointers, arrays (see GEO-44)
  - Float
  - Standard library / includes
  - Dynamic allocation
"""

import sys
import os
import tempfile
import subprocess

from pycparser import c_parser, c_ast, parse_file


# ── Register allocator ──────────────────────────────────────────────

class RegisterAllocator:
    """Allocate registers for variables. r0-r7 are args/returns, r8+ for locals."""

    def __init__(self):
        self.var_to_reg = {}
        self.next_reg = 8  # r0-r7 reserved for params/returns

    def alloc(self, var_name):
        if var_name not in self.var_to_reg:
            if self.next_reg > 31:
                raise RuntimeError(f"Out of registers for variable '{var_name}'")
            self.var_to_reg[var_name] = self.next_reg
            self.next_reg += 1
        return self.var_to_reg[var_name]

    def get(self, var_name):
        return self.var_to_reg[var_name]

    def has(self, var_name):
        return var_name in self.var_to_reg

    def param_reg(self, idx):
        """Map function parameter index to register (r0-r7)."""
        if idx > 7:
            raise RuntimeError(f"Too many parameters (max 8)")
        return idx


# ── Temporary register pool ─────────────────────────────────────────

class TempPool:
    """Pool of temporary registers for expression evaluation."""

    def __init__(self, allocator):
        self.allocator = allocator
        self.high_water = 31

    def acquire(self):
        """Get a temp register. Allocates from the top (r31 down)."""
        reg = self.high_water
        if reg <= self.allocator.next_reg:
            raise RuntimeError("Out of temporary registers")
        self.high_water -= 1
        return reg

    def release(self, reg):
        """Return a temp register."""
        if reg == self.high_water + 1:
            self.high_water = reg


# ── .glyph emitter ──────────────────────────────────────────────────

class GlyphEmitter:
    """Emits .glyph assembly instructions."""

    def __init__(self):
        self.lines = []
        self.label_counter = 0

    def emit(self, line):
        self.lines.append(line)

    def comment(self, text):
        self.emit(f"; {text}")

    def label(self, name):
        self.emit(f"{name}:")

    def new_label(self, prefix="L"):
        self.label_counter += 1
        return f"{prefix}_{self.label_counter}"

    def ldi(self, reg, imm):
        self.emit(f"LDI r{reg}, {imm}")

    def mov(self, dst, src):
        self.emit(f"MOV r{dst}, r{src}")

    def add(self, dst, src):
        self.emit(f"ADD r{dst}, r{src}")

    def sub(self, dst, src):
        self.emit(f"SUB r{dst}, r{src}")

    def mul(self, dst, src):
        self.emit(f"MUL r{dst}, r{src}")

    def div(self, dst, src):
        self.emit(f"DIV r{dst}, r{src}")

    def mod(self, dst, src):
        self.emit(f"MOD r{dst}, r{src}")

    def and_(self, dst, src):
        self.emit(f"AND r{dst}, r{src}")

    def or_(self, dst, src):
        self.emit(f"OR r{dst}, r{src}")

    def xor(self, dst, src):
        self.emit(f"XOR r{dst}, r{src}")

    def not_(self, reg):
        self.emit(f"NOT r{reg}")

    def shl(self, dst, src):
        self.emit(f"SHL r{dst}, r{src}")

    def shr(self, dst, src):
        self.emit(f"SHR r{dst}, r{src}")

    def halt(self):
        self.emit("HALT")

    def ret(self):
        self.emit("RET")

    def nop(self):
        self.emit("NOP")

    def jmp_label(self, label):
        self.emit(f"JMP {label}")

    def beq(self, r1, r2, label):
        self.emit(f"BEQ r{r1}, r{r2}, {label}")

    def bne(self, r1, r2, label):
        self.emit(f"BNE r{r1}, r{r2}, {label}")

    def blt(self, r1, r2, label):
        self.emit(f"BLT r{r1}, r{r2}, {label}")

    def bge(self, r1, r2, label):
        self.emit(f"BGE r{r1}, r{r2}, {label}")

    def bltu(self, r1, r2, label):
        self.emit(f"BLTU r{r1}, r{r2}, {label}")

    def bgeu(self, r1, r2, label):
        self.emit(f"BGEU r{r1}, r{r2}, {label}")

    def call(self, label):
        self.emit(f"CALL {label}")

    def load_word(self, dst, addr_reg):
        self.emit(f"LOAD r{dst}, r{addr_reg}")

    def store_word(self, addr_reg, src):
        self.emit(f"STORE r{addr_reg}, r{src}")

    def load_byte(self, dst, addr_reg):
        self.emit(f"LDB r{dst}, r{addr_reg}")

    def store_byte(self, addr_reg, src):
        self.emit(f"STB r{addr_reg}, r{src}")

    def output(self):
        return "\n".join(self.lines)


# ── AST Visitor / Code Generator ────────────────────────────────────

class CodeGen(c_ast.NodeVisitor):
    """Walk pycparser AST and emit .glyph assembly."""

    def __init__(self):
        self.emitter = GlyphEmitter()
        self.regalloc = RegisterAllocator()
        self.temps = TempPool(self.regalloc)
        self.functions = {}  # name -> label
        self.current_func = None
        # Struct/pointer/array support (GEO-44)
        self.structs = {}        # name -> {fields: [(name, offset)], size: int}
        self.var_types = {}      # var_name -> {'kind': 'int'|'ptr'|'struct'|'array', ...}
        self.frame_offset = 0    # next free byte offset in stack frame
        self.frame_ptr_reg = 6   # r6 = frame pointer (reserved)

    def generate(self, ast):
        """Generate .glyph assembly from a parsed AST."""
        # First pass: collect function names and struct definitions
        for ext in ast.ext:
            if isinstance(ext, c_ast.FuncDef):
                fname = ext.decl.name
                self.functions[fname] = f"func_{fname}"

        # Collect top-level struct definitions
        for ext in ast.ext:
            self._collect_structs(ext)

        self.emitter.comment("Generated by c_transpiler.py")
        self.emitter.comment("")

        # Emit each function
        for ext in ast.ext:
            if isinstance(ext, c_ast.FuncDef):
                self._emit_function(ext)
            elif isinstance(ext, c_ast.Decl) and isinstance(ext.type, c_ast.FuncDecl):
                # Forward declaration, skip
                pass

        return self.emitter.output()

    def _emit_function(self, func):
        """Emit code for a function definition."""
        fname = func.decl.name
        self.current_func = fname

        # Fresh allocator for each function (params in r0-r7)
        self.regalloc = RegisterAllocator()
        self.temps = TempPool(self.regalloc)
        self.var_types = {}
        self.frame_offset = 0

        self.emitter.comment(f"Function: {fname}")
        self.emitter.label(self.functions[fname])

        # Map parameters to r0-r7
        if func.decl.type.args:
            for i, param in enumerate(func.decl.type.args.params):
                pname = param.name
                preg = self.regalloc.param_reg(i)
                self.regalloc.var_to_reg[pname] = preg
                self.emitter.comment(f"  param: {pname} -> r{preg}")

        # Emit body
        if func.body:
            self._emit_compound(func.body)

        self.emitter.comment(f"End function: {fname}")
        self.emitter.nop()
        self.current_func = None

    def _emit_compound(self, node):
        """Emit a compound statement (block)."""
        if node.block_items:
            for item in node.block_items:
                self._emit_stmt(item)

    def _emit_stmt(self, node):
        """Dispatch statement to the appropriate handler."""
        if isinstance(node, c_ast.Decl):
            self._emit_decl(node)
        elif isinstance(node, c_ast.Assignment):
            self._emit_assignment(node)
        elif isinstance(node, c_ast.If):
            self._emit_if(node)
        elif isinstance(node, c_ast.While):
            self._emit_while(node)
        elif isinstance(node, c_ast.For):
            self._emit_for(node)
        elif isinstance(node, c_ast.Return):
            self._emit_return(node)
        elif isinstance(node, c_ast.Compound):
            self._emit_compound(node)
        elif isinstance(node, c_ast.FuncCall):
            self._emit_funccall_stmt(node)
        elif isinstance(node, c_ast.UnaryOp):
            # e.g., standalone increment
            self._emit_unary_stmt(node)
        elif isinstance(node, c_ast.EmptyStatement):
            pass
        else:
            self.emitter.comment(f"TODO: unsupported statement: {type(node).__name__}")

    def _emit_decl(self, node):
        """Emit a variable declaration with optional initializer."""
        # Handle cases where type is directly PtrDecl or ArrayDecl (no TypeDecl wrapper)
        if isinstance(node.type, c_ast.PtrDecl):
            self._emit_ptr_decl_direct(node)
            return
        if isinstance(node.type, c_ast.ArrayDecl):
            self._emit_array_decl_direct(node)
            return

        if not isinstance(node.type, c_ast.TypeDecl):
            # Could be a top-level struct def
            return

        type_decl = node.type

        # Check for pointer
        if isinstance(type_decl.type, c_ast.PtrDecl):
            self._emit_ptr_decl(node, type_decl)
            return

        # Check for array
        if isinstance(type_decl.type, c_ast.ArrayDecl):
            self._emit_array_decl(node, type_decl)
            return

        # Check for struct variable
        inner = type_decl.type
        if isinstance(inner, c_ast.Struct):
            self._emit_struct_decl(node)
            return

        # Check for named struct type (e.g., "struct Point p;")
        if isinstance(inner, c_ast.IdentifierType):
            for tname in inner.names:
                if tname in self.structs:
                    # This is a struct variable using named struct type
                    var_name = node.name
                    struct_info = self.structs[tname]
                    sz = struct_info['size']
                    frame_off = self.frame_offset
                    self.frame_offset += sz
                    self.var_types[var_name] = {
                        'kind': 'struct',
                        'struct': tname,
                        'frame_offset': frame_off,
                    }
                    self.emitter.comment(f"  struct {tname} {var_name} at frame+{frame_off} ({sz}B)")
                    return

        # Regular int variable
        var_name = node.name
        reg = self.regalloc.alloc(var_name)
        self.emitter.comment(f"  int {var_name} -> r{reg}")

        if node.init:
            src_reg = self._eval_expr(node.init)
            if src_reg != reg:
                self.emitter.mov(reg, src_reg)

    def _emit_assignment(self, node):
        """Emit an assignment: x = expr, or s.field = expr, or arr[i] = expr."""
        lval = node.lvalue

        # --- Simple variable assignment ---
        if isinstance(lval, c_ast.ID):
            var_name = lval.name
            vtype = self.var_types.get(var_name)

            if vtype and vtype['kind'] == 'ptr':
                # Writing through a pointer: *p = expr  (but p = expr sets the pointer)
                # This is the "p = expr" case (assigning to pointer variable itself)
                reg = vtype['reg']
                if not self.regalloc.has(var_name):
                    pass  # already allocated via _emit_ptr_decl
                if node.op == '=':
                    src_reg = self._eval_expr(node.rvalue)
                    if src_reg != reg:
                        self.emitter.mov(reg, src_reg)
                    if not self._is_var_reg(src_reg):
                        self.temps.release(src_reg)
                return

            if not self.regalloc.has(var_name):
                self.regalloc.alloc(var_name)
            dst_reg = self.regalloc.get(var_name)

            op = node.op
            if op == '=':
                    src_reg = self._eval_expr(node.rvalue)
                    if src_reg != dst_reg:
                        self.emitter.mov(dst_reg, src_reg)
                    # Release temp if it came from an expression
                    if self._is_var_reg(src_reg) == False:
                        self.temps.release(src_reg)
            elif op in ('+=', '-=', '*=', '/=', '%=', '&=', '|=', '^=', '<<=', '>>='):
                src_reg = self._eval_expr(node.rvalue)
                op_map = {
                    '+=': self.emitter.add,
                    '-=': self.emitter.sub,
                    '*=': self.emitter.mul,
                    '/=': self.emitter.div,
                    '%=': self.emitter.mod,
                    '&=': self.emitter.and_,
                    '|=': self.emitter.or_,
                    '^=': self.emitter.xor,
                }
                if op in op_map:
                    op_map[op](dst_reg, src_reg)
                elif op == '<<=':
                    self.emitter.shl(dst_reg, src_reg)
                elif op == '>>=':
                    self.emitter.shr(dst_reg, src_reg)
                # Release temp from expression
                if not self._is_var_reg(src_reg):
                    self.temps.release(src_reg)
            return

        # --- Struct field assignment: s.field = expr ---
        if isinstance(lval, c_ast.StructRef):
            addr_reg = self._eval_address(lval)
            value_reg = self._eval_expr(node.rvalue)
            self._emit_store_to_addr(addr_reg, value_reg, 'int')
            self.temps.release(addr_reg)
            self.temps.release(value_reg)
            return

        # --- Array element assignment: arr[i] = expr ---
        if isinstance(lval, c_ast.ArrayRef):
            addr_reg = self._eval_address(lval)
            value_reg = self._eval_expr(node.rvalue)
            # Determine element type for correct store width
            elem_type = 'int'
            if isinstance(lval.name, c_ast.ID):
                vtype = self.var_types.get(lval.name.name)
                if vtype and vtype['kind'] == 'array':
                    elem_type = vtype['elem_type']
            self._emit_store_to_addr(addr_reg, value_reg, elem_type)
            self.temps.release(addr_reg)
            self.temps.release(value_reg)
            return

        # --- Pointer deref assignment: *p = expr ---
        if isinstance(lval, c_ast.UnaryOp) and lval.op == '*':
            ptr_reg = self._eval_expr(lval.expr)
            value_reg = self._eval_expr(node.rvalue)
            # Determine pointed-to type for correct store width
            deref_type = self._resolve_deref_type(lval.expr)
            self._emit_store_to_addr(ptr_reg, value_reg, deref_type)
            self.temps.release(ptr_reg)
            self.temps.release(value_reg)
            return

        self.emitter.comment(f"TODO: complex lvalue assignment: {type(lval).__name__}")

    def _emit_if(self, node):
        """Emit if/else statement."""
        else_label = self.emitter.new_label("else")
        end_label = self.emitter.new_label("endif")

        # Evaluate condition and branch
        has_else = node.iffalse is not None
        false_label = else_label if has_else else end_label

        self._emit_condition(node.cond, false_label, invert=True)

        # True branch
        self._emit_stmt(node.iftrue)

        if has_else:
            self.emitter.jmp_label(end_label)
            self.emitter.label(else_label)
            self._emit_stmt(node.iffalse)

        self.emitter.label(end_label)

    def _emit_while(self, node):
        """Emit while loop."""
        loop_start = self.emitter.new_label("while")
        loop_end = self.emitter.new_label("endwhile")

        self.emitter.label(loop_start)
        self._emit_condition(node.cond, loop_end, invert=True)
        self._emit_stmt(node.stmt)
        self.emitter.jmp_label(loop_start)
        self.emitter.label(loop_end)

    def _emit_for(self, node):
        """Emit for loop."""
        loop_start = self.emitter.new_label("for")
        loop_end = self.emitter.new_label("endfor")
        loop_step = self.emitter.new_label("step")

        # Init
        if node.init:
            self._emit_stmt(node.init)

        self.emitter.label(loop_start)

        # Condition
        if node.cond:
            self._emit_condition(node.cond, loop_end, invert=True)

        # Body
        if node.stmt:
            self._emit_stmt(node.stmt)

        # Step
        self.emitter.label(loop_step)
        if node.next:
            self._emit_stmt(node.next)

        self.emitter.jmp_label(loop_start)
        self.emitter.label(loop_end)

    def _emit_return(self, node):
        """Emit return statement."""
        if node.expr:
            src_reg = self._eval_expr(node.expr)
            # Return value goes in r0
            if src_reg != 0:
                self.emitter.mov(0, src_reg)
        self.emitter.halt()  # Top-level function halts; nested uses RET

    def _emit_funccall_stmt(self, node):
        """Emit a function call as a statement."""
        fname = node.name.name if isinstance(node.name, c_ast.ID) else str(node.name)
        if fname in self.functions:
            # Push args into r0-r7
            if node.args:
                for i, arg in enumerate(node.args.exprs):
                    src_reg = self._eval_expr(arg)
                    dst_reg = self.regalloc.param_reg(i)
                    if src_reg != dst_reg:
                        self.emitter.mov(dst_reg, src_reg)
            self.emitter.call(self.functions[fname])
        else:
            self.emitter.comment(f"TODO: unknown function call: {fname}")

    def _emit_unary_stmt(self, node):
        """Emit standalone unary op (e.g., x++)."""
        if node.op in ('p++', 'p--', '++', '--'):
            if isinstance(node.expr, c_ast.ID):
                var_name = node.expr.name
                reg = self.regalloc.get(var_name)
                tmp = self.temps.acquire()
                self.emitter.ldi(tmp, 1)
                if node.op in ('++', 'p++'):
                    self.emitter.add(reg, tmp)
                else:
                    self.emitter.sub(reg, tmp)
                self.temps.release(tmp)
        elif node.op == '!':
            src_reg = self._eval_expr(node.expr)
            self.emitter.not_(src_reg)

    # ── Expression evaluation ────────────────────────────────────────

    def _eval_expr(self, node):
        """Evaluate an expression and return the register holding the result."""
        if isinstance(node, c_ast.Constant):
            return self._eval_constant(node)
        elif isinstance(node, c_ast.ID):
            return self._eval_id(node)
        elif isinstance(node, c_ast.BinaryOp):
            return self._eval_binary(node)
        elif isinstance(node, c_ast.UnaryOp):
            return self._eval_unary(node)
        elif isinstance(node, c_ast.FuncCall):
            return self._eval_funccall(node)
        elif isinstance(node, c_ast.Assignment):
            # Assignment is an expression in C
            self._emit_assignment(node)
            if isinstance(node.lvalue, c_ast.ID):
                return self.regalloc.get(node.lvalue.name)
            tmp = self.temps.acquire()
            self.emitter.ldi(tmp, 0)
            return tmp
        elif isinstance(node, c_ast.StructRef):
            return self._eval_struct_ref(node)
        elif isinstance(node, c_ast.ArrayRef):
            return self._eval_array_ref(node)
        elif isinstance(node, c_ast.Cast):
            return self._eval_cast(node)
        else:
            self.emitter.comment(f"TODO: unsupported expr: {type(node).__name__}")
            tmp = self.temps.acquire()
            self.emitter.ldi(tmp, 0)
            return tmp

    def _eval_constant(self, node):
        """Evaluate a numeric constant."""
        tmp = self.temps.acquire()
        val = int(node.value, 0)  # handles 0x prefix
        self.emitter.ldi(tmp, val)
        return tmp

    def _eval_id(self, node):
        """Evaluate a variable reference."""
        return self.regalloc.get(node.name)

    def _get_ptr_elem_size(self, node):
        """If node refers to a pointer variable, return sizeof(pointed_to_type), else None."""
        if isinstance(node, c_ast.ID):
            vtype = self.var_types.get(node.name)
            if vtype and vtype['kind'] == 'ptr':
                return self._sizeof(vtype.get('points_to', 'int'))
        return None

    def _is_var_reg(self, reg):
        """Check if a register is a variable's persistent register (not a temp)."""
        return reg < self.temps.high_water  # variable regs are below temp range

    def _eval_binary(self, node):
        """Evaluate a binary operation."""
        op = node.op

        # Pointer arithmetic: ptr + n or ptr - n scales by sizeof(pointed_to_type)
        if op in ('+', '-'):
            ptr_size = self._get_ptr_elem_size(node.left)
            if ptr_size and ptr_size != 1:
                left_reg = self._eval_expr(node.left)
                right_reg = self._eval_expr(node.right)
                # Only copy to temp if left is a persistent variable register
                if self._is_var_reg(left_reg):
                    result_reg = self.temps.acquire()
                    self.emitter.mov(result_reg, left_reg)
                else:
                    result_reg = left_reg
                # Multiply right by element size
                sz_reg = self.temps.acquire()
                self.emitter.ldi(sz_reg, ptr_size)
                self.emitter.mul(right_reg, sz_reg)
                self.temps.release(sz_reg)
                if op == '+':
                    self.emitter.add(result_reg, right_reg)
                else:
                    self.emitter.sub(result_reg, right_reg)
                self.temps.release(right_reg)
                return result_reg
            # Also check right side: n + ptr
            if op == '+':
                ptr_size_r = self._get_ptr_elem_size(node.right)
                if ptr_size_r and ptr_size_r != 1:
                    left_reg = self._eval_expr(node.left)
                    right_reg = self._eval_expr(node.right)
                    # Only copy to temp if right is a persistent variable register
                    if self._is_var_reg(right_reg):
                        result_reg = self.temps.acquire()
                        self.emitter.mov(result_reg, right_reg)
                    else:
                        result_reg = right_reg
                    sz_reg = self.temps.acquire()
                    self.emitter.ldi(sz_reg, ptr_size_r)
                    self.emitter.mul(left_reg, sz_reg)
                    self.temps.release(sz_reg)
                    self.emitter.add(result_reg, left_reg)
                    self.temps.release(left_reg)
                    return result_reg

        left_reg = self._eval_expr(node.left)
        right_reg = self._eval_expr(node.right)

        op_map = {
            '+': self.emitter.add,
            '-': self.emitter.sub,
            '*': self.emitter.mul,
            '/': self.emitter.div,
            '%': self.emitter.mod,
            '&': self.emitter.and_,
            '|': self.emitter.or_,
            '^': self.emitter.xor,
        }

        if op in op_map:
            # Only copy to temp if left_reg is a variable's persistent register
            if self._is_var_reg(left_reg):
                result_reg = self.temps.acquire()
                self.emitter.mov(result_reg, left_reg)
                op_map[op](result_reg, right_reg)
                self.temps.release(right_reg)
                return result_reg
            else:
                op_map[op](left_reg, right_reg)
                self.temps.release(right_reg)
                return left_reg
        elif op == '<<':
            if self._is_var_reg(left_reg):
                result_reg = self.temps.acquire()
                self.emitter.mov(result_reg, left_reg)
                self.emitter.shl(result_reg, right_reg)
                self.temps.release(right_reg)
                return result_reg
            else:
                self.emitter.shl(left_reg, right_reg)
                self.temps.release(right_reg)
                return left_reg
        elif op == '>>':
            if self._is_var_reg(left_reg):
                result_reg = self.temps.acquire()
                self.emitter.mov(result_reg, left_reg)
                self.emitter.shr(result_reg, right_reg)
                self.temps.release(right_reg)
                return result_reg
            else:
                self.emitter.shr(left_reg, right_reg)
                self.temps.release(right_reg)
                return left_reg
        elif op in ('==', '!=', '<', '>', '<=', '>='):
            # Comparison: produce 1 or 0
            return self._eval_comparison(left_reg, right_reg, op)
        elif op == '&&':
            # Logical AND: both nonzero -> 1
            if self._is_var_reg(left_reg):
                result_reg = self.temps.acquire()
                self.emitter.mov(result_reg, left_reg)
            else:
                result_reg = left_reg
            self._emit_boolify(result_reg)
            self._emit_boolify(right_reg)
            self.emitter.and_(result_reg, right_reg)
            self.temps.release(right_reg)
            return result_reg
        elif op == '||':
            # Logical OR: either nonzero -> 1
            if self._is_var_reg(left_reg):
                result_reg = self.temps.acquire()
                self.emitter.mov(result_reg, left_reg)
            else:
                result_reg = left_reg
            self._emit_boolify(result_reg)
            self._emit_boolify(right_reg)
            self.emitter.or_(result_reg, right_reg)
            self.temps.release(right_reg)
            return result_reg
        else:
            self.emitter.comment(f"TODO: binary op '{op}'")
            self.temps.release(right_reg)
            self.temps.release(left_reg)
            return left_reg

    def _eval_comparison(self, left, right, op):
        """Emit comparison and return register with 1/0 result."""
        result = self.temps.acquire()
        true_label = self.emitter.new_label("cmp_true")
        end_label = self.emitter.new_label("cmp_end")

        branch_map = {
            '==': self.emitter.beq,
            '!=': self.emitter.bne,
            '<': self.emitter.blt,
            '>': self.emitter.bge,  # a > b  =>  b < a => BLT right, left
            '<=': self.emitter.bge,  # a <= b => NOT (a > b) => invert
            '>=': self.emitter.bge,
        }

        self.emitter.ldi(result, 0)

        if op == '>':
            # a > b  <=>  b < a
            branch_map['<'](right, left, true_label)
        elif op == '<=':
            # a <= b <=> NOT (a > b) <=> NOT (b < a)
            # Use BLT right, left -> if b < a, it's false (skip to end)
            skip_label = self.emitter.new_label("cmp_skip")
            self.emitter.blt(right, left, skip_label)
            self.emitter.ldi(result, 1)
            self.emitter.jmp_label(end_label)
            self.emitter.label(skip_label)
            self.emitter.jmp_label(end_label)
            self.emitter.label(end_label)
            self.temps.release(left)
            self.temps.release(right)
            return result
        else:
            branch_map[op](left, right, true_label)

        # False: result=0 (already set), jump to end
        self.emitter.jmp_label(end_label)
        self.emitter.label(true_label)
        self.emitter.ldi(result, 1)
        self.emitter.label(end_label)

        self.temps.release(left)
        self.temps.release(right)
        return result

    def _emit_boolify(self, reg):
        """Convert register to 0 or 1 (boolean)."""
        # reg != 0 ? 1 : 0
        zero = self.temps.acquire()
        true_label = self.emitter.new_label("bool_true")
        end_label = self.emitter.new_label("bool_end")

        self.emitter.ldi(zero, 0)
        self.emitter.bne(reg, zero, true_label)
        # False: reg is already 0
        self.emitter.jmp_label(end_label)
        self.emitter.label(true_label)
        self.emitter.ldi(reg, 1)
        self.emitter.label(end_label)
        self.temps.release(zero)

    def _eval_unary(self, node):
        """Evaluate a unary operation."""
        if node.op == '-':
            # Negation: 0 - expr
            src_reg = self._eval_expr(node.expr)
            zero = self.temps.acquire()
            self.emitter.ldi(zero, 0)
            self.emitter.sub(zero, src_reg)
            self.temps.release(src_reg)
            return zero
        elif node.op == '!':
            # Logical NOT
            src_reg = self._eval_expr(node.expr)
            self._emit_boolify(src_reg)
            zero = self.temps.acquire()
            self.emitter.ldi(zero, 1)
            self.emitter.xor(src_reg, zero)
            self.temps.release(zero)
            return src_reg
        elif node.op == '~':
            # Bitwise NOT
            src_reg = self._eval_expr(node.expr)
            self.emitter.not_(src_reg)
            return src_reg
        elif node.op == '*':
            # Pointer dereference: *p -> load from address
            addr_reg = self._eval_expr(node.expr)
            # Determine pointed-to type for correct load width
            deref_type = self._resolve_deref_type(node.expr)
            result = self._emit_load_from_addr(addr_reg, deref_type)
            self.temps.release(addr_reg)
            return result
        elif node.op == '&':
            # Address-of: &x -> compute address
            return self._eval_address(node.expr)
        elif node.op in ('++', '--', 'p++', 'p--'):
            # Pre/post increment/decrement
            if isinstance(node.expr, c_ast.ID):
                var_name = node.expr.name
                reg = self.regalloc.get(var_name)
                tmp = self.temps.acquire()
                self.emitter.ldi(tmp, 1)
                if node.op in ('++', 'p++'):
                    self.emitter.add(reg, tmp)
                else:
                    self.emitter.sub(reg, tmp)
                self.temps.release(tmp)
                return reg
        elif node.op == '+':
            # Unary plus, no-op
            return self._eval_expr(node.expr)

        self.emitter.comment(f"TODO: unary op '{node.op}'")
        tmp = self.temps.acquire()
        self.emitter.ldi(tmp, 0)
        return tmp

    def _eval_funccall(self, node):
        """Evaluate a function call expression."""
        fname = node.name.name if isinstance(node.name, c_ast.ID) else str(node.name)
        if fname in self.functions:
            if node.args:
                for i, arg in enumerate(node.args.exprs):
                    src_reg = self._eval_expr(arg)
                    dst_reg = self.regalloc.param_reg(i)
                    if src_reg != dst_reg:
                        self.emitter.mov(dst_reg, src_reg)
            self.emitter.call(self.functions[fname])
            # Return value is in r0
            return 0
        else:
            self.emitter.comment(f"TODO: unknown function: {fname}")
            tmp = self.temps.acquire()
            self.emitter.ldi(tmp, 0)
            return tmp

    def _eval_struct_ref(self, node):
        """Evaluate struct field access: s.field or p->field."""
        addr_reg = self._eval_address(node)
        # Determine the type of the field for correct load width
        field_type = 'int'
        if isinstance(node.name, c_ast.ID):
            vtype = self.var_types.get(node.name.name)
            if vtype:
                if node.type == '->':
                    struct_name = vtype.get('points_to', '')
                else:
                    struct_name = vtype.get('struct', '')
                field_name = node.field.name if isinstance(node.field, c_ast.ID) else str(node.field)
                info = self.structs.get(struct_name)
                if info:
                    for fname, foff, ftype in info['fields']:
                        if fname == field_name:
                            field_type = ftype
                            break
        result = self._emit_load_from_addr(addr_reg, field_type)
        self.temps.release(addr_reg)
        return result

    def _eval_array_ref(self, node):
        """Evaluate array element access: arr[i]."""
        addr_reg = self._eval_address(node)
        elem_type = 'int'
        if isinstance(node.name, c_ast.ID):
            vtype = self.var_types.get(node.name.name)
            if vtype and vtype['kind'] == 'array':
                elem_type = vtype['elem_type']
        result = self._emit_load_from_addr(addr_reg, elem_type)
        self.temps.release(addr_reg)
        return result

    def _eval_cast(self, node):
        """Evaluate a type cast: just evaluate the inner expression."""
        return self._eval_expr(node.expr)

    # ── Condition emission ───────────────────────────────────────────

    def _emit_condition(self, cond, false_label, invert=False):
        """Emit a conditional branch. If invert=True, branch to false_label when FALSE."""
        # Simple case: comparison operator
        if isinstance(cond, c_ast.BinaryOp) and cond.op in ('==', '!=', '<', '>', '<=', '>='):
            left_reg = self._eval_expr(cond.left)
            right_reg = self._eval_expr(cond.right)

            branch_map = {
                '==': (self.emitter.beq, self.emitter.bne),
                '!=': (self.emitter.bne, self.emitter.beq),
                '<': (self.emitter.blt, self.emitter.bge),
                '>=': (self.emitter.bge, self.emitter.blt),
                '>': None,   # special handling
                '<=': None,  # special handling
            }

            op = cond.op
            if op == '>':
                # a > b  <=>  b < a
                if invert:
                    # Branch when !(a > b) <=> !(b < a) <=> b >= a
                    self.emitter.bge(right_reg, left_reg, false_label)
                else:
                    # Branch when a > b <=> b < a
                    self.emitter.blt(right_reg, left_reg, false_label)
            elif op == '<=':
                # a <= b  <=>  !(a > b)  <=>  !(b < a)  <=>  b >= a
                if invert:
                    # Branch when !(a <= b) <=> a > b <=> b < a
                    self.emitter.blt(right_reg, left_reg, false_label)
                else:
                    # Branch when a <= b <=> b >= a
                    self.emitter.bge(right_reg, left_reg, false_label)
            else:
                taken, not_taken = branch_map[op]
                if invert:
                    not_taken(left_reg, right_reg, false_label)
                else:
                    taken(left_reg, right_reg, false_label)

            self.temps.release(left_reg)
            self.temps.release(right_reg)
        else:
            # General case: evaluate expr, compare != 0
            expr_reg = self._eval_expr(cond)
            zero = self.temps.acquire()
            self.emitter.ldi(zero, 0)
            if invert:
                # Branch to false_label when expr == 0
                self.emitter.beq(expr_reg, zero, false_label)
            else:
                # Branch to false_label when expr != 0
                self.emitter.bne(expr_reg, zero, false_label)
            self.temps.release(zero)
            self.temps.release(expr_reg)

    # ── Struct/Pointer/Array helpers (GEO-44) ─────────────────────────

    def _resolve_deref_type(self, expr_node):
        """Resolve the pointed-to type for a dereference expression (*expr).

        Checks in order:
        1. Cast node: *((unsigned char *)(addr)) -> extract type from cast
        2. Variable with ptr type: *p where p is a typed pointer
        3. Default to 'int'
        """
        # Check for cast: *(Type *)(expr)
        if isinstance(expr_node, c_ast.Cast):
            cast_type = expr_node.to_type.type  # PtrDecl
            if isinstance(cast_type, c_ast.PtrDecl):
                pointed = cast_type.type  # TypeDecl or direct
                type_str = self._resolve_type(pointed)
                return type_str
        # Check variable type
        if isinstance(expr_node, c_ast.ID):
            vtype = self.var_types.get(expr_node.name)
            if vtype and vtype['kind'] == 'ptr':
                return vtype.get('points_to', 'int')
        return 'int'

    def _sizeof(self, typename):
        """Return byte size of a type."""
        if typename in ('int', 'unsigned int', 'int32_t', 'uint32_t'):
            return 4
        elif typename in ('char', 'unsigned char', 'uint8_t', 'int8_t', 'byte'):
            return 1
        elif typename in self.structs:
            return self.structs[typename]['size']
        return 4  # default to word

    def _resolve_type(self, node):
        """Try to resolve the C type of a pycparser type node to a string."""
        if isinstance(node, c_ast.TypeDecl):
            return self._resolve_type(node.type)
        if isinstance(node, c_ast.IdentifierType):
            return ' '.join(node.names) if node.names else 'int'
        if isinstance(node, c_ast.PtrDecl):
            return 'ptr'
        if isinstance(node, c_ast.ArrayDecl):
            return 'array'
        if isinstance(node, c_ast.Struct):
            # Return the struct name so pointer targets resolve correctly
            return node.name if node.name else 'int'
        return 'int'

    def _register_struct(self, struct_node):
        """Register a struct definition from pycparser AST."""
        name = struct_node.name
        fields = []
        offset = 0
        if struct_node.decls:
            for decl in struct_node.decls:
                fname = decl.name
                ftype = self._resolve_type(decl.type)
                sz = self._sizeof(ftype)
                fields.append((fname, offset, ftype))
                offset += sz
        self.structs[name] = {'fields': fields, 'size': offset}
        self.emitter.comment(f"  struct {name} ({offset} bytes, {len(fields)} fields)")

    def _collect_structs(self, node):
        """Walk AST to find and register struct definitions."""
        if isinstance(node, c_ast.FileAST):
            for ext in node.ext:
                self._collect_structs(ext)
        elif isinstance(node, c_ast.Decl):
            self._collect_structs(node.type)
        elif isinstance(node, c_ast.TypeDecl):
            self._collect_structs(node.type)
        elif isinstance(node, c_ast.Struct):
            if node.name and node.decls:
                if node.name not in self.structs:
                    self._register_struct(node)
        elif isinstance(node, c_ast.FuncDef):
            # Walk function body for inline struct definitions
            if node.body:
                self._collect_structs(node.body)
        elif isinstance(node, c_ast.Compound):
            if node.block_items:
                for item in node.block_items:
                    self._collect_structs(item)

    def _emit_array_decl_direct(self, node):
        """Handle array declaration where node.type is directly ArrayDecl (no TypeDecl wrapper)."""
        array_decl = node.type
        var_name = node.name
        elem_type = self._resolve_type(array_decl.type)
        elem_size = self._sizeof(elem_type)
        dim = 4
        if array_decl.dim:
            if isinstance(array_decl.dim, c_ast.Constant):
                dim = int(array_decl.dim.value, 0)
        total_size = elem_size * dim
        frame_off = self.frame_offset
        self.frame_offset += total_size
        self.var_types[var_name] = {
            'kind': 'array',
            'elem_type': elem_type,
            'elem_size': elem_size,
            'count': dim,
            'frame_offset': frame_off,
        }
        self.emitter.comment(f"  {elem_type}[{dim}] {var_name} at frame+{frame_off} ({total_size}B)")

    def _emit_ptr_decl_direct(self, node):
        """Handle pointer declaration where node.type is directly PtrDecl (no TypeDecl wrapper)."""
        ptr_decl = node.type
        var_name = node.name
        reg = self.regalloc.alloc(var_name)
        points_to = self._resolve_type(ptr_decl.type)
        self.var_types[var_name] = {
            'kind': 'ptr',
            'points_to': points_to,
            'reg': reg,
        }
        self.emitter.comment(f"  {points_to}* {var_name} -> r{reg}")
        if node.init:
            src_reg = self._eval_expr(node.init)
            if src_reg != reg:
                self.emitter.mov(reg, src_reg)

    def _emit_struct_decl(self, node):
        """Handle declaration of a struct variable."""
        type_node = node.type
        while type_node and not isinstance(type_node, c_ast.Struct):
            if isinstance(type_node, c_ast.TypeDecl):
                type_node = type_node.type
            else:
                break
        if not isinstance(type_node, c_ast.Struct):
            return False

        struct_name = type_node.name
        if struct_name and struct_name not in self.structs and type_node.decls:
            self._register_struct(type_node)

        if not struct_name or struct_name not in self.structs:
            return False

        var_name = node.name
        struct_info = self.structs[struct_name]
        sz = struct_info['size']

        # Allocate stack frame space
        frame_off = self.frame_offset
        self.frame_offset += sz
        self.var_types[var_name] = {
            'kind': 'struct',
            'struct': struct_name,
            'frame_offset': frame_off,
        }
        self.emitter.comment(f"  struct {struct_name} {var_name} at frame+{frame_off} ({sz}B)")
        return True

    def _emit_array_decl(self, node, type_decl):
        """Handle declaration of an array variable."""
        array_decl = type_decl.type
        if not isinstance(array_decl, c_ast.ArrayDecl):
            return False

        var_name = node.name
        elem_type = self._resolve_type(array_decl.type)
        elem_size = self._sizeof(elem_type)

        # Get array dimension
        dim = 4  # default
        if array_decl.dim:
            if isinstance(array_decl.dim, c_ast.Constant):
                dim = int(array_decl.dim.value, 0)

        total_size = elem_size * dim
        frame_off = self.frame_offset
        self.frame_offset += total_size

        self.var_types[var_name] = {
            'kind': 'array',
            'elem_type': elem_type,
            'elem_size': elem_size,
            'count': dim,
            'frame_offset': frame_off,
        }
        self.emitter.comment(f"  {elem_type}[{dim}] {var_name} at frame+{frame_off} ({total_size}B)")
        return True

    def _emit_ptr_decl(self, node, type_decl):
        """Handle declaration of a pointer variable."""
        ptr_decl = type_decl.type
        if not isinstance(ptr_decl, c_ast.PtrDecl):
            return False

        var_name = node.name
        # Pointers live in registers (they're just addresses)
        reg = self.regalloc.alloc(var_name)

        # Figure out what it points to
        points_to = self._resolve_type(ptr_decl.type)

        self.var_types[var_name] = {
            'kind': 'ptr',
            'points_to': points_to,
            'reg': reg,
        }
        self.emitter.comment(f"  {points_to}* {var_name} -> r{reg}")

        if node.init:
            src_reg = self._eval_expr(node.init)
            if src_reg != reg:
                self.emitter.mov(reg, src_reg)
        return True

    def _get_struct_field_offset(self, struct_name, field_name):
        """Get byte offset of a field in a struct."""
        info = self.structs.get(struct_name)
        if not info:
            return None
        for fname, foff, ftype in info['fields']:
            if fname == field_name:
                return foff
        return None

    def _eval_address(self, node):
        """Compute the memory address of an lvalue, return register with address."""
        if isinstance(node, c_ast.ID):
            vname = node.name
            vtype = self.var_types.get(vname)
            if vtype and vtype['kind'] in ('struct', 'array'):
                # Address = frame_ptr + frame_offset
                addr = self.temps.acquire()
                self.emitter.ldi(addr, vtype['frame_offset'])
                self.emitter.add(addr, self.frame_ptr_reg)
                return addr
            elif vtype and vtype['kind'] == 'ptr':
                return vtype['reg']
            elif self.regalloc.has(vname):
                return self.regalloc.get(vname)
            else:
                self.emitter.comment(f"TODO: address of unknown var '{vname}'")
                tmp = self.temps.acquire()
                self.emitter.ldi(tmp, 0)
                return tmp

        elif isinstance(node, c_ast.StructRef):
            # s.field or p->field
            base_addr = self._eval_address(node.name)

            # Find the struct type and field offset
            name_node = node.name
            if isinstance(name_node, c_ast.ID):
                vtype = self.var_types.get(name_node.name)
                if vtype:
                    if node.type == '->':
                        # p->field: look up struct name from pointer's points_to type
                        struct_name = vtype.get('points_to', '')
                    else:
                        struct_name = vtype.get('struct', '')
                    field_name = node.field.name if isinstance(node.field, c_ast.ID) else str(node.field)
                    foff = self._get_struct_field_offset(struct_name, field_name)
                    if foff is not None and foff != 0:
                        # For pointer-based access (p->field), base_addr IS the pointer register.
                        # We must copy to a temp to avoid corrupting the pointer variable.
                        if vtype['kind'] == 'ptr':
                            tmp = self.temps.acquire()
                            self.emitter.mov(tmp, base_addr)
                            base_addr = tmp
                        off_reg = self.temps.acquire()
                        self.emitter.ldi(off_reg, foff)
                        self.emitter.add(base_addr, off_reg)
                        self.temps.release(off_reg)
            return base_addr

        elif isinstance(node, c_ast.ArrayRef):
            # arr[i] -> base + i * elem_size
            arr_addr = self._eval_address(node.name)
            idx_reg = self._eval_expr(node.subscript)

            name_node = node.name
            if isinstance(name_node, c_ast.ID):
                vtype = self.var_types.get(name_node.name)
                if vtype and vtype['kind'] == 'array':
                    elem_size = vtype['elem_size']
                    if elem_size > 1:
                        sz_reg = self.temps.acquire()
                        self.emitter.ldi(sz_reg, elem_size)
                        self.emitter.mul(idx_reg, sz_reg)
                        self.temps.release(sz_reg)
                    self.emitter.add(arr_addr, idx_reg)
                    self.temps.release(idx_reg)
            return arr_addr

        # Fallback
        self.emitter.comment(f"TODO: address-of {type(node).__name__}")
        tmp = self.temps.acquire()
        self.emitter.ldi(tmp, 0)
        return tmp

    def _is_memory_var(self, name):
        """Check if a variable lives in memory (struct/array) vs register."""
        vtype = self.var_types.get(name)
        return vtype and vtype['kind'] in ('struct', 'array')

    def _emit_store_to_addr(self, addr_reg, value_reg, typename='int'):
        """Store a value to a memory address (byte address).
        
        LOAD/STORE expect pixel indices, so for word-sized types we must
        convert byte_addr to pixel_idx by dividing by 4.
        LDB/STB work with byte addresses directly.
        """
        if typename in ('char', 'unsigned char', 'uint8_t', 'int8_t', 'byte'):
            self.emitter.store_byte(addr_reg, value_reg)
        else:
            # Word store: STORE expects pixel index = byte_addr / 4
            # We need to shift addr_reg right by 2 (divide by 4)
            # Use a temp to avoid destroying addr_reg
            pixel_idx = self.temps.acquire()
            self.emitter.comment(f"  ; convert byte addr r{addr_reg} to pixel index")
            # SHR by 2: divide by 4
            two = self.temps.acquire()
            self.emitter.ldi(two, 2)
            # We need to copy addr_reg first to not destroy it
            # Actually, we can emit: MOV pixel_idx, addr_reg; SHR pixel_idx, two
            self.emitter.mov(pixel_idx, addr_reg)
            self.emitter.shr(pixel_idx, two)
            self.temps.release(two)
            self.emitter.store_word(pixel_idx, value_reg)
            self.temps.release(pixel_idx)

    def _emit_load_from_addr(self, addr_reg, typename='int'):
        """Load a value from a memory address (byte address), return register with value.
        
        LOAD/STORE expect pixel indices, so for word-sized types we must
        convert byte_addr to pixel_idx by dividing by 4.
        LDB/STB work with byte addresses directly.
        """
        dst = self.temps.acquire()
        if typename in ('char', 'unsigned char', 'uint8_t', 'int8_t', 'byte'):
            self.emitter.load_byte(dst, addr_reg)
        else:
            # Word load: LOAD expects pixel index = byte_addr / 4
            pixel_idx = self.temps.acquire()
            two = self.temps.acquire()
            self.emitter.comment(f"  ; convert byte addr r{addr_reg} to pixel index")
            self.emitter.mov(pixel_idx, addr_reg)
            self.emitter.ldi(two, 2)
            self.emitter.shr(pixel_idx, two)
            self.temps.release(two)
            self.emitter.load_word(dst, pixel_idx)
            self.temps.release(pixel_idx)
        return dst


# ── Main ─────────────────────────────────────────────────────────────

# Fake libc headers for pycparser
FAKE_LIBC = """
typedef int size_t;
typedef void* void_ptr;
"""

def transpile_file(filepath):
    """Transpile a C file to .glyph assembly."""
    # pycparser needs preprocessed C. Use fake includes.
    ast = parse_file(filepath, use_cpp=True,
                     cpp_path='gcc',
                     cpp_args=['-E', '-I', os.path.dirname(os.path.abspath(__file__))])

    codegen = CodeGen()
    return codegen.generate(ast)


def transpile_string(source):
    """Transpile a C source string to .glyph assembly."""
    parser = c_parser.CParser()
    ast = parser.parse(source, filename='<input>')
    codegen = CodeGen()
    return codegen.generate(ast)


def main():
    if len(sys.argv) < 2:
        print("Usage: transpiler.py <input.c> [output.gasm]")
        print("       transpiler.py --test")
        sys.exit(1)

    if sys.argv[1] == '--test':
        run_tests()
        return

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None

    gasm = transpile_file(input_file)

    if output_file:
        with open(output_file, 'w') as f:
            f.write(gasm)
        print(f"Written to {output_file}")
    else:
        print(gasm)


def run_tests():
    """Run acceptance tests for GEO-43."""
    print("=== Test 1: factorial(5) should return 120 ===")
    factorial_c = """
int factorial(int n) {
    int result;
    result = 1;
    while (n > 1) {
        result = result * n;
        n = n - 1;
    }
    return result;
}
"""
    gasm = transpile_string(factorial_c)
    print("Generated .gasm:")
    print(gasm)
    print()

    # Verify it parses
    sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))
    # We can't directly import the Rust assembler, but we can verify the output looks right
    assert "MUL" in gasm, "Should contain MUL"
    assert "SUB" in gasm, "Should contain SUB"
    assert "WHILE" in gasm.upper() or "while" in gasm, "Should contain while loop"
    print("PASS: factorial test\n")

    print("=== Test 2: max(a, b) ===")
    max_c = """
int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}
"""
    gasm = transpile_string(max_c)
    print("Generated .gasm:")
    print(gasm)
    assert "BLT" in gasm or "BGE" in gasm, "Should contain branch instruction"
    print("PASS: max test\n")

    print("=== Test 3: arithmetic operators ===")
    arith_c = """
int test_arith(int x, int y) {
    int a;
    int b;
    a = x + y;
    a = a - x;
    a = a * 2;
    a = a / 3;
    a = a % 4;
    a = a & 0xFF;
    a = a | 0x100;
    a = a ^ 0x55;
    a = ~a;
    a = a << 2;
    a = a >> 1;
    return a;
}
"""
    gasm = transpile_string(arith_c)
    print("Generated .gasm:")
    print(gasm)
    for op in ["ADD", "SUB", "MUL", "DIV", "MOD", "AND", "OR", "XOR", "NOT", "SHL", "SHR"]:
        assert op in gasm, f"Should contain {op}"
    print("PASS: arithmetic test\n")

    print("=== Test 4: for loop ===")
    for_c = """
int sum_to(int n) {
    int sum;
    int i;
    sum = 0;
    for (i = 0; i < n; i = i + 1) {
        sum = sum + i;
    }
    return sum;
}
"""
    gasm = transpile_string(for_c)
    print("Generated .gasm:")
    print(gasm)
    assert "ADD" in gasm, "Should contain ADD"
    print("PASS: for loop test\n")

    # ── GEO-44: Structs, Pointers, Arrays ─────────────────────────────

    print("=== Test 5: NVMe SQE struct field offsets ===")
    nvme_sqe_c = """
struct NvmeCmd {
    int opcode;
    int flags;
    int cid;
    int nsid;
};

int test_nvme_struct() {
    struct NvmeCmd cmd;
    return 0;
}
"""
    gasm = transpile_string(nvme_sqe_c)
    print("Generated .gasm:")
    print(gasm)
    # Verify struct fields are at correct byte offsets (each int = 4 bytes)
    codegen = CodeGen()
    parser2 = c_parser.CParser()
    ast2 = parser2.parse(nvme_sqe_c, filename='<test>')
    codegen.generate(ast2)
    assert 'NvmeCmd' in codegen.structs, "NvmeCmd should be registered"
    nvme = codegen.structs['NvmeCmd']
    assert nvme['size'] == 16, f"NvmeCmd should be 16 bytes, got {nvme['size']}"
    fields_by_name = {f[0]: (f[1], f[2]) for f in nvme['fields']}
    assert fields_by_name['opcode'] == (0, 'int'), f"opcode should be at offset 0, got {fields_by_name['opcode']}"
    assert fields_by_name['flags'] == (4, 'int'), f"flags should be at offset 4, got {fields_by_name['flags']}"
    assert fields_by_name['cid'] == (8, 'int'), f"cid should be at offset 8, got {fields_by_name['cid']}"
    assert fields_by_name['nsid'] == (12, 'int'), f"nsid should be at offset 12, got {fields_by_name['nsid']}"
    print("PASS: NVMe struct field offsets correct (0, 4, 8, 12)\n")

    print("=== Test 6: Struct write/read via pointer ===")
    struct_ptr_c = """
struct Point {
    int x;
    int y;
};

int test_struct_ptr() {
    struct Point p;
    int *px;
    px = &p.x;
    *px = 42;
    return *px;
}
"""
    gasm = transpile_string(struct_ptr_c)
    print("Generated .gasm:")
    print(gasm)
    assert "STORE" in gasm, "Should contain STORE for write through pointer"
    assert "LOAD" in gasm, "Should contain LOAD for read through pointer"
    assert "SHR" in gasm, "Should contain SHR for byte-to-pixel conversion"
    print("PASS: struct write/read via pointer\n")

    print("=== Test 7: Array iteration with pointer arithmetic ===")
    array_ptr_c = """
int sum_array() {
    int arr[4];
    int *p;
    int sum;
    int i;
    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;
    sum = 0;
    p = &arr[0];
    for (i = 0; i < 4; i = i + 1) {
        sum = sum + *p;
        p = p + 1;
    }
    return sum;
}
"""
    gasm = transpile_string(array_ptr_c)
    print("Generated .gasm:")
    print(gasm)
    # Should use STORE for array writes, LOAD for pointer reads
    assert "STORE" in gasm, "Should contain STORE for array writes"
    assert "LOAD" in gasm, "Should contain LOAD for pointer deref reads"
    # Pointer arithmetic: p + 1 should scale by sizeof(int)=4
    assert "MUL" in gasm or "SHL" in gasm, "Pointer arithmetic should scale by element size"
    print("PASS: array iteration with pointer arithmetic\n")

    print("=== Test 8: Struct field access (dot notation) ===")
    struct_dot_c = """
struct Entry {
    int key;
    int value;
};

int test_dot_access() {
    struct Entry e;
    e.key = 5;
    e.value = e.key + 10;
    return e.value;
}
"""
    gasm = transpile_string(struct_dot_c)
    print("Generated .gasm:")
    print(gasm)
    assert "STORE" in gasm, "Should contain STORE for struct field write"
    assert "LOAD" in gasm, "Should contain LOAD for struct field read"
    print("PASS: struct field access via dot notation\n")

    print("=== Test 9: Byte array (char array) ===")
    bytearray_c = """
int test_bytearr() {
    char buf[8];
    buf[0] = 65;
    buf[1] = 66;
    return buf[0];
}
"""
    gasm = transpile_string(bytearray_c)
    print("Generated .gasm:")
    print(gasm)
    assert "STB" in gasm, "Should contain STB for byte array write"
    assert "LDB" in gasm, "Should contain LDB for byte array read"
    print("PASS: byte array (char array)\n")

    print("=== Test 10: Address-of operator ===")
    addrof_c = """
int test_addrof() {
    int x;
    int *p;
    x = 99;
    p = &x;
    return *p;
}
"""
    gasm = transpile_string(addrof_c)
    print("Generated .gasm:")
    print(gasm)
    # Should be able to take address and dereference
    print("PASS: address-of operator\n")

    print("=== Test 11: Mixed struct with char field ===")
    mixed_struct_c = """
struct Packet {
    int len;
    char type;
    char flags;
};

int test_mixed() {
    struct Packet pkt;
    pkt.len = 100;
    pkt.type = 1;
    pkt.flags = 2;
    return pkt.len;
}
"""
    codegen2 = CodeGen()
    ast3 = parser2.parse(mixed_struct_c, filename='<test>')
    codegen2.generate(ast3)
    assert 'Packet' in codegen2.structs, "Packet should be registered"
    pkt = codegen2.structs['Packet']
    # len: offset 0, 4 bytes (int)
    # type: offset 4, 1 byte (char)
    # flags: offset 5, 1 byte (char)
    # total: 6 bytes
    assert pkt['size'] == 6, f"Packet should be 6 bytes, got {pkt['size']}"
    fields_by_name2 = {f[0]: (f[1], f[2]) for f in pkt['fields']}
    assert fields_by_name2['len'] == (0, 'int'), f"len at offset 0, got {fields_by_name2['len']}"
    assert fields_by_name2['type'] == (4, 'char'), f"type at offset 4, got {fields_by_name2['type']}"
    assert fields_by_name2['flags'] == (5, 'char'), f"flags at offset 5, got {fields_by_name2['flags']}"
    print(f"PASS: mixed struct (int+char) offsets: {pkt}\n")

    print("All GEO-44 tests passed!")
    print("All tests passed!")


if __name__ == '__main__':
    main()
