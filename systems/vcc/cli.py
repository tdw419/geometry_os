# systems/vcc/cli.py
"""
VCC CLI - Command-line interface for the Visual Consistency Contract.
"""

import argparse
import sys
import json
from .contract import VCCContract
from .validator import validate_all_layers

def main():
    parser = argparse.ArgumentParser(description="VCC CLI - Visual Consistency Contract")
    subparsers = parser.add_subparsers(dest="command", help="Commands")

    # Status
    status_parser = subparsers.add_parser("status", help="Check VCC status")
    status_parser.add_argument("--contract", default="systems/vcc/vcc_contract.json", help="Path to contract")

    # Validate
    validate_parser = subparsers.add_parser("validate", help="Validate all layers")
    validate_parser.add_argument("--contract", default="systems/vcc/vcc_contract.json", help="Path to contract")
    validate_parser.add_argument("--root", default=".", help="Project root")
    validate_parser.add_argument("--no-hw", action="store_true", help="Disable hardware attestation")

    # Generate
    generate_parser = subparsers.add_parser("generate", help="Generate a new contract")
    generate_parser.add_argument("--atlas", required=True, help="Path to atlas raw file")
    generate_parser.add_argument("--positions", required=True, help="Path to positions JSON")
    generate_parser.add_argument("--width", type=int, default=512, help="Atlas width")
    generate_parser.add_argument("--height", type=int, default=512, help="Atlas height")
    generate_parser.add_argument("--output", default="systems/vcc/vcc_contract.json", help="Output path")

    args = parser.parse_args()

    if args.command == "status":
        try:
            contract = VCCContract.load(args.contract)
            print(f"==================================================")
            print(f"VCC CONTRACT STATUS")
            print(f"==================================================")
            print(f"Version:      {contract.version}")
            print(f"Generated:    {contract.generated_at}")
            print(f"Atlas Hash:   {contract.atlas_hash['sha256']}")
            print(f"Glyphs:       {contract.glyph_count}")
            print(f"Foundry:      {contract.layers['foundry']['renderer_path']}")
            print(f"Shell:        {contract.layers['shell']['pixi_version']} (WebGPU={contract.layers['shell']['webgpu_enabled']})")
            print(f"Kernel:       {contract.layers['kernel']['rust_version']} (DRM={contract.layers['kernel']['drm_enabled']})")
            print(f"==================================================")
        except Exception as e:
            print(f"Error loading contract: {e}")
            sys.exit(1)

    elif args.command == "validate":
        print(f"🔍 Validating Visual Consistency Contract...")
        try:
            results = validate_all_layers(args.contract, args.root, prefer_hardware=not args.no_hw)
            
            print(f"\nLayer Results:")
            for layer, result in results["layers"].items():
                status = "✅" if result["valid"] else "❌"
                mode = f" ({result.get('mode', 'N/A')})" if "mode" in result else ""
                print(f"  {status} {layer:10}: VALID{mode}")
                if result.get("hardware_verified"):
                    print(f"      [Hardware Attestation Passed on {result['gpu_device']}]")

            print(f"\nOVERALL STATUS: {'✅ PASSED' if results['valid'] else '❌ FAILED'}")
            
            if not results["valid"]:
                sys.exit(1)
        except Exception as e:
            print(f"Validation failed: {e}")
            sys.exit(1)

    elif args.command == "generate":
        print(f"🎨 Generating VCC Contract from {args.atlas}...")
        try:
            contract = VCCContract()
            contract.generate_from_atlas(args.atlas, args.positions, (args.width, args.height))
            contract.save(args.output)
        except Exception as e:
            print(f"Failed to generate contract: {e}")
            sys.exit(1)

    else:
        parser.print_help()

if __name__ == "__main__":
    main()
