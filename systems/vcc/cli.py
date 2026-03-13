# systems/vcc/cli.py
"""
VCC Command-Line Interface.

Usage:
    python -m systems.vcc.cli validate [--contract=PATH]
    python -m systems.vcc.cli generate --atlas=PATH --positions=PATH
    python -m systems.vcc.cli status
"""

import argparse
import sys
import json
from pathlib import Path


def cmd_validate(args):
    """Validate all layers against VCC contract."""
    from systems.vcc.validator import validate_all_layers

    contract_path = args.contract or "systems/vcc/vcc_contract.json"
    project_root = args.project_root or "."

    results = validate_all_layers(contract_path, project_root)

    print("VCC Validation Results\n")
    print(f"{'Layer':<12} {'Status':<10} {'Details'}")
    print("-" * 50)

    for layer in ["foundry", "shell", "kernel"]:
        result = results.get(layer, {})
        status = "PASS" if result.get("valid") else "FAIL"
        details = result.get("error", "") or f"{result.get('glyph_count', 'N/A')} glyphs"
        print(f"{layer:<12} {status:<10} {details}")

    print("-" * 50)
    print(f"Overall: {'ALL VALID' if results['all_valid'] else 'ISSUES FOUND'}")

    return 0 if results["all_valid"] else 1


def cmd_generate(args):
    """Generate a new VCC contract."""
    from systems.vcc.contract import generate_contract, VCCContract

    contract = generate_contract(
        atlas_path=args.atlas,
        positions_path=args.positions
    )

    output_path = Path(args.output or "vcc_contract.json")
    VCCContract(contract).to_json(output_path)

    print(f"VCC contract generated: {output_path}")
    print(f"   Atlas hash: {contract['atlas_hash']['sha256'][:16]}...")
    print(f"   Glyph count: {contract['glyph_count']}")

    return 0


def cmd_status(args):
    """Show current VCC status."""
    contract_path = Path(args.contract or "systems/vcc/vcc_contract.json")

    if not contract_path.exists():
        print("No VCC contract found. Run atlas generation first.")
        return 1

    from systems.vcc.contract import VCCContract
    contract = VCCContract.from_json(contract_path)

    print("VCC Contract Status\n")
    print(f"Version: {contract.version}")
    print(f"Generated: {contract.data['generated_at']}")
    print(f"Atlas hash: {contract.atlas_hash[:16]}...")
    print(f"Glyph count: {contract.glyph_count}")

    return 0


def main():
    parser = argparse.ArgumentParser(description="VCC CLI")
    subparsers = parser.add_subparsers(dest="command", required=True)

    # validate command
    validate_parser = subparsers.add_parser("validate", help="Validate all layers")
    validate_parser.add_argument("--contract", help="Path to VCC contract")
    validate_parser.add_argument("--project-root", default=".", help="Project root")
    validate_parser.set_defaults(func=cmd_validate)

    # generate command
    generate_parser = subparsers.add_parser("generate", help="Generate VCC contract")
    generate_parser.add_argument("--atlas", required=True, help="Path to .raw atlas")
    generate_parser.add_argument("--positions", required=True, help="Path to positions JSON")
    generate_parser.add_argument("--output", help="Output contract path")
    generate_parser.set_defaults(func=cmd_generate)

    # status command
    status_parser = subparsers.add_parser("status", help="Show VCC status")
    status_parser.add_argument("--contract", help="Path to VCC contract")
    status_parser.set_defaults(func=cmd_status)

    args = parser.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
