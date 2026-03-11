#!/usr/bin/env python3
"""
Verification script for Native Glyph Shell documentation completeness.
Checks that all new features are properly documented.
"""

import os
import sys
from pathlib import Path
import re


def check_file_exists(filepath: str) -> bool:
    """Check if a file exists."""
    return Path(filepath).exists()


def count_occurrences(filepath: str, pattern: str) -> int:
    """Count occurrences of pattern in file."""
    try:
        with open(filepath, 'r') as f:
            content = f.read()
            return len(re.findall(pattern, content, re.IGNORECASE))
    except FileNotFoundError:
        return 0


def verify_documentation():
    """Verify all documentation is complete."""
    print("=" * 70)
    print("NATIVE GLYPH SHELL DOCUMENTATION VERIFICATION")
    print("=" * 70)
    print()
    
    errors = []
    warnings = []
    
    # 1. Check main documentation exists
    print("1. Checking main documentation file...")
    doc_path = "docs/NATIVE_GLYPH_SHELL.md"
    if check_file_exists(doc_path):
        size = os.path.getsize(doc_path)
        print(f"   ✅ {doc_path} exists ({size:,} bytes)")
        if size < 20000:
            warnings.append(f"Documentation seems small ({size} bytes)")
    else:
        errors.append(f"Missing: {doc_path}")
        print(f"   ❌ {doc_path} not found")
    print()
    
    # 2. Check CHANGELOG update
    print("2. Checking CHANGELOG.md update...")
    changelog = "CHANGELOG.md"
    if check_file_exists(changelog):
        version_count = count_occurrences(changelog, r"4\.0\.3")
        glyph_shell_mentions = count_occurrences(changelog, "Native Glyph Shell")
        
        if version_count > 0:
            print(f"   ✅ Version 4.0.3 entry found")
        else:
            errors.append("CHANGELOG.md missing v4.0.3 entry")
            print(f"   ❌ Version 4.0.3 not found")
        
        if glyph_shell_mentions >= 3:
            print(f"   ✅ Native Glyph Shell mentioned {glyph_shell_mentions} times")
        else:
            warnings.append(f"Only {glyph_shell_mentions} mentions of Native Glyph Shell in CHANGELOG")
    else:
        errors.append("Missing: CHANGELOG.md")
    print()
    
    # 3. Check DOCUMENTATION_INDEX
    print("3. Checking DOCUMENTATION_INDEX.md...")
    index_path = "DOCUMENTATION_INDEX.md"
    if check_file_exists(index_path):
        if count_occurrences(index_path, "NATIVE_GLYPH_SHELL.md") > 0:
            print(f"   ✅ NATIVE_GLYPH_SHELL.md referenced in index")
        else:
            errors.append("DOCUMENTATION_INDEX.md missing NATIVE_GLYPH_SHELL.md reference")
            print(f"   ❌ NATIVE_GLYPH_SHELL.md not in index")
    else:
        errors.append("Missing: DOCUMENTATION_INDEX.md")
    print()
    
    # 4. Check documentation content
    if check_file_exists(doc_path):
        print("4. Checking documentation content...")
        
        # Performance metrics
        speedup_count = count_occurrences(doc_path, r"speedup|faster")
        print(f"   ✅ Performance metrics: {speedup_count} mentions")
        if speedup_count < 10:
            warnings.append(f"Only {speedup_count} performance mentions")
        
        # API documentation
        api_count = count_occurrences(doc_path, r"def |class ")
        print(f"   ✅ API documentation: {api_count} definitions")
        if api_count < 20:
            warnings.append(f"Only {api_count} API definitions")
        
        # Code examples
        code_examples = count_occurrences(doc_path, r"```python")
        print(f"   ✅ Code examples: {code_examples} examples")
        if code_examples < 15:
            warnings.append(f"Only {code_examples} code examples")
        
        # Hilbert curve
        hilbert_count = count_occurrences(doc_path, "hilbert")
        print(f"   ✅ Hilbert documentation: {hilbert_count} mentions")
        if hilbert_count < 5:
            warnings.append(f"Only {hilbert_count} Hilbert mentions")
        
        # Foveated rendering
        foveated_count = count_occurrences(doc_path, "foveated")
        print(f"   ✅ Foveated rendering: {foveated_count} mentions")
        if foveated_count < 5:
            warnings.append(f"Only {foveated_count} foveated mentions")
        
        # AI integration
        ai_count = count_occurrences(doc_path, r"gemini|claude|ai")
        print(f"   ✅ AI integration: {ai_count} mentions")
        if ai_count < 5:
            warnings.append(f"Only {ai_count} AI mentions")
        
        # Training
        training_count = count_occurrences(doc_path, "training")
        print(f"   ✅ Training program: {training_count} mentions")
        if training_count < 3:
            warnings.append(f"Only {training_count} training mentions")
        
        # Examples
        examples_count = count_occurrences(doc_path, "example")
        print(f"   ✅ Examples: {examples_count} mentions")
        if examples_count < 10:
            warnings.append(f"Only {examples_count} example mentions")
        
        # Troubleshooting
        troubleshooting_count = count_occurrences(doc_path, "troubleshooting")
        print(f"   ✅ Troubleshooting: {troubleshooting_count} mentions")
        
        print()
    
    # 5. Check training materials
    print("5. Checking training materials...")
    training_path = "docs/training"
    if check_file_exists(training_path):
        print(f"   ✅ Training directory exists")
        
        # Check key files
        key_files = [
            "README.md",
            "NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md",
            "GLYPH_SHELL_QUICK_REFERENCE.md",
        ]
        
        for filename in key_files:
            filepath = os.path.join(training_path, filename)
            if check_file_exists(filepath):
                print(f"   ✅ {filename}")
            else:
                warnings.append(f"Missing training file: {filename}")
    else:
        warnings.append("Training directory not found")
    print()
    
    # 6. Check benchmark results
    print("6. Checking benchmark documentation...")
    benchmark_paths = [
        "systems/visual_shell/benches/OPTIMIZATION_REPORT.md",
        "systems/visual_shell/benches/results/PERFORMANCE_REPORT.md",
        "systems/visual_shell/benches/results/OPTIMIZATION_SUMMARY.md",
    ]
    
    for path in benchmark_paths:
        if check_file_exists(path):
            print(f"   ✅ {path}")
        else:
            warnings.append(f"Missing benchmark doc: {path}")
    print()
    
    # 7. Check source code files
    print("7. Checking optimized source files...")
    source_files = [
        "systems/visual_shell/native/optimized_glyph_ops_v2.py",
        "systems/visual_shell/native/optimized_glyph_ops.py",
    ]
    
    for filepath in source_files:
        if check_file_exists(filepath):
            print(f"   ✅ {filepath}")
        else:
            warnings.append(f"Missing source file: {filepath}")
    print()
    
    # Summary
    print("=" * 70)
    print("VERIFICATION SUMMARY")
    print("=" * 70)
    print()
    
    if errors:
        print("❌ ERRORS:")
        for error in errors:
            print(f"   - {error}")
        print()
    
    if warnings:
        print("⚠️  WARNINGS:")
        for warning in warnings:
            print(f"   - {warning}")
        print()
    
    # Final status
    if not errors:
        print("✅ ALL CRITICAL CHECKS PASSED")
        print()
        
        if warnings:
            print(f"⚠️  {len(warnings)} warnings (non-critical)")
            return 0
        else:
            print("🎉 PERFECT SCORE - NO WARNINGS")
            return 0
    else:
        print(f"❌ {len(errors)} ERRORS FOUND")
        print(f"⚠️  {len(warnings)} warnings")
        return 1


if __name__ == "__main__":
    sys.exit(verify_documentation())
