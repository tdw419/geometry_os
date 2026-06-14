#!/usr/bin/env python3
"""Integration tests for the C-to-.glyph transpiler.

Tests the full pipeline: C source -> pycparser AST -> .gasm -> assembler -> software VM.
Requires the Rust test harness via cargo test.
"""

import sys
import os
import subprocess
import json

sys.path.insert(0, os.path.dirname(__file__))
from transpiler import transpile_string


def write_test_program(gasm_source, output_path):
    """Write .gasm to a file for the Rust test to pick up."""
    with open(output_path, 'w') as f:
        f.write(gasm_source)


def main():
    """Run integration tests by writing .gasm files for cargo test to consume."""
    test_dir = os.path.join(os.path.dirname(__file__), '..', '..', 'test_output')
    os.makedirs(test_dir, exist_ok=True)

    tests = {
        'factorial': {
            'c_source': """
int factorial(int n) {
    int result;
    result = 1;
    while (n > 1) {
        result = result * n;
        n = n - 1;
    }
    return result;
}
""",
            'input_reg0': 5,
            'expected_reg0': 120,
        },
        'max_ab': {
            'c_source': """
int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}
""",
            'input_reg0': 10,
            'input_reg1': 25,
            'expected_reg0': 25,
        },
        'sum_to': {
            'c_source': """
int sum_to(int n) {
    int sum;
    int i;
    sum = 0;
    for (i = 0; i < n; i = i + 1) {
        sum = sum + i;
    }
    return sum;
}
""",
            'input_reg0': 6,
            'expected_reg0': 15,  # 0+1+2+3+4+5 = 15
        },
    }

    results = {}
    for name, test in tests.items():
        gasm = transpile_string(test['c_source'])
        out_path = os.path.join(test_dir, f'{name}.gasm')
        write_test_program(gasm, out_path)
        results[name] = {
            'gasm_path': out_path,
            'expected_reg0': test['expected_reg0'],
        }
        if 'input_reg0' in test:
            results[name]['input_reg0'] = test['input_reg0']
        if 'input_reg1' in test:
            results[name]['input_reg1'] = test['input_reg1']

    # Write manifest for Rust tests to read
    manifest_path = os.path.join(test_dir, 'manifest.json')
    with open(manifest_path, 'w') as f:
        json.dump(results, f, indent=2)

    print(f"Generated {len(tests)} test programs in {test_dir}/")
    for name, info in results.items():
        print(f"  {name}: {info['gasm_path']}")


if __name__ == '__main__':
    main()
