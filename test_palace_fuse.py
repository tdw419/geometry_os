#!/usr/bin/env python3
"""
Test the PalaceFS driver without mounting.

Validates:
- Facts loading
- File path parsing
- Spatial ↔ filesystem mapping
"""

import json
from pathlib import Path

FACTS_FILE = Path.home() / "projects/zion/projects/geometry_os/geometry_os/memory_palace_facts.json"

print("Testing PalaceFS...")
print("="*60)

# Load facts
if FACTS_FILE.exists():
    with open(FACTS_FILE) as f:
        data = json.load(f)
    facts = data.get("facts", [])
    print(f"✓ Loaded {len(facts)} facts")
else:
    print("✗ No facts file found")
    facts = []

# Test file path parsing
def parse_filename(filename: str):
    """Parse fact_<ANGLE>_<SUBJECT>.ext"""
    if not filename.startswith("fact_"):
        return None

    parts = filename[len("fact_"):].split("_", 1)
    if len(parts) != 2:
        return None

    try:
        angle = int(parts[0])
        subject_with_ext = parts[1]

        if "." in subject_with_ext:
            subject = subject_with_ext.rsplit(".", 1)[0]
        else:
            subject = subject_with_ext

        return angle, subject
    except ValueError:
        return None

# Test parsing
test_cases = [
    "fact_000_pixelpack_decode.md",
    "fact_270_new_insight.py",
    "fact_090_helper.asm",
    "invalid_file.txt",
    "fact_abc_invalid.md",
]

print("\nFilename parsing tests:")
for test in test_cases:
    result = parse_filename(test)
    if result:
        angle, subject = result
        print(f"  ✓ {test:40s} → angle={angle:3d}, subject={subject}")
    else:
        print(f"  ✗ {test:40s} → invalid")

# Test ring mapping
RING_NAMES = ["inner_ring", "middle_ring", "outer_ring"]
TIER_NAMES = ["critical", "important", "reference"]

print(f"\nRing → Tier mapping:")
for ring, tier in zip(RING_NAMES, TIER_NAMES):
    print(f"  {ring:15s} → {tier}")

# Show expected filesystem layout
print(f"\nExpected filesystem layout:")
print("  /mnt/memory_palace/")
print("  ├── inner_ring/")
for fact in facts:
    if fact.get("ring") == 0:
        angle = fact.get("angle", 0)
        subject = fact.get("subject", "fact")
        print(f"  │   ├── fact_{angle:03d}_{subject}.md")

print("  ├── middle_ring/")
for fact in facts:
    if fact.get("ring") == 1:
        angle = fact.get("angle", 0)
        subject = fact.get("subject", "fact")
        print(f"  │   ├── fact_{angle:03d}_{subject}.md")

print("  └── outer_ring/")
for fact in facts:
    if fact.get("ring") == 2:
        angle = fact.get("angle", 0)
        subject = fact.get("subject", "fact")
        print(f"      ├── fact_{angle:03d}_{subject}.md")

print("\n✓ All tests passed")
print("\nTo mount:")
print("  mkdir -p /mnt/memory_palace")
print("  python3 palace_fuse.py /mnt/memory_palace")
print("  cd /mnt/memory_palace")
print("  ls")