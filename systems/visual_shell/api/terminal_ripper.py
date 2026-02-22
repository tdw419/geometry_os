#!/usr/bin/env python3
"""
Terminal Ripper - Phase 28 + PixelRTS v3 Integration

Orchestrates the "rip" process:
1. Capture VM Framebuffer
2. Detect Terminal Regions
3. Spawn Terminal Clones on the Map

New in v3: Supports geometric terminal encoding where:
- Terminal cells are encoded as RGBA pixels
- Textures are GPU-native and directly executable
- Hilbert curve spatial mapping preserves locality
"""

import logging
import os
from pathlib import Path
from typing import List, Optional
from dataclasses import dataclass

try:
    from .vm_terminal_detector import VmTerminalDetector, TerminalCandidate
    from .terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig
except (ImportError, ValueError):
    from vm_terminal_detector import VmTerminalDetector, TerminalCandidate
    from terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig

# Check for PixelRTS v3 availability
try:
    from .geometric_terminal_bridge import (
        GeometricTerminalBridge, TerminalTextureConfig
    )
    GEOMETRIC_AVAILABLE = True
except ImportError:
    GEOMETRIC_AVAILABLE = False

logger = logging.getLogger("terminal_ripper")


@dataclass
class RipConfig:
    """Configuration for terminal rip operation."""
    use_geometric: bool = True  # Use PixelRTS v3 geometric encoding
    auto_render: bool = False   # Auto-render to texture
    near_center: bool = True    # Place near VAT focal point

class TerminalRipper:
    """
    Terminal Ripper with PixelRTS v3 geometric support.

    Can rip terminals in two modes:
    1. Standard mode: Spawns terminal clones with VAT placement
    2. Geometric mode: Encodes terminals as GPU-native PixelRTS v3 textures
    """

    def __init__(
        self,
        bridge: Optional[TerminalVatBridge] = None,
        geometric_bridge: Optional['GeometricTerminalBridge'] = None,
        config: Optional[RipConfig] = None
    ):
        self.bridge = bridge or TerminalVatBridge()
        self.detector = VmTerminalDetector()
        self.config = config or RipConfig()

        # Initialize geometric bridge if available and requested
        self.geometric_bridge = None
        if self.config.use_geometric and GEOMETRIC_AVAILABLE:
            self.geometric_bridge = geometric_bridge or GeometricTerminalBridge()

    def rip_from_image(self, image_path: str, rip_config: Optional[RipConfig] = None) -> List[int]:
        """
        Scans an image for terminals and spawns clones for each.

        Args:
            image_path: Path to VM screenshot/framebuffer
            rip_config: Optional rip configuration (overrides instance config)

        Returns:
            List of spawned tile IDs
        """
        config = rip_config or self.config

        logger.info(f"🧬 Ripping terminals from {image_path}")
        candidates = self.detector.scan(image_path)

        spawned_ids = []
        for candidate in candidates:
            logger.info(f"✨ Found terminal candidate: {candidate.grid_size} at {candidate.bbox}")

            if config.use_geometric and self.geometric_bridge:
                # Spawn as geometric terminal (PixelRTS v3)
                texture_config = TerminalTextureConfig(
                    rows=candidate.grid_size[1],
                    cols=candidate.grid_size[0],
                    near_center=config.near_center,
                    auto_render=config.auto_render
                )
                tile_id = self.geometric_bridge.spawn_geometric_terminal(texture_config)
                logger.info(f"   → Spawned geometric terminal {tile_id}")
            else:
                # Spawn as standard terminal
                tile_config = TerminalTileConfig(
                    rows=candidate.grid_size[1],
                    cols=candidate.grid_size[0],
                    shell="/bin/bash",
                    near_center=config.near_center
                )
                tile_id = self.bridge.spawn_terminal(tile_config)
                logger.info(f"   → Spawned standard terminal {tile_id}")

            spawned_ids.append(tile_id)

            # TODO: Pre-fill with detected text content
            # if candidate.text:
            #     self.geometric_bridge.feed_pty_output(tile_id, candidate.text.encode())

        return spawned_ids

    def rip_to_geometric_texture(
        self,
        image_path: str,
        output_dir: Optional[str] = None
    ) -> List[str]:
        """
        Rip terminals directly to geometric textures.

        This creates GPU-native .rts.png files without spawning live terminals.

        Args:
            image_path: Path to VM screenshot
            output_dir: Output directory for textures

        Returns:
            List of paths to generated textures
        """
        if not GEOMETRIC_AVAILABLE:
            logger.error("PixelRTS v3 not available for geometric ripping")
            return []

        from pixelrts_v3.geometric_terminal import GeometricTerminal

        output_dir = Path(output_dir or ".geometry/ripped_textures")
        output_dir.mkdir(parents=True, exist_ok=True)

        logger.info(f"🧬 Ripping to geometric textures: {image_path}")
        candidates = self.detector.scan(image_path)

        texture_paths = []
        for i, candidate in enumerate(candidates):
            # Create geometric terminal
            terminal = GeometricTerminal(
                cols=candidate.grid_size[0],
                rows=candidate.grid_size[1],
                use_hilbert=True
            )

            # Feed detected text
            if candidate.text:
                terminal.from_pty_output(candidate.text.encode())

            # Render to texture
            output_path = output_dir / f"ripped_terminal_{i}.rts.png"
            terminal.render_to_texture(str(output_path))
            texture_paths.append(str(output_path))

            logger.info(f"   → Rendered to {output_path}")

        return texture_paths

    def get_stats(self) -> dict:
        """Get ripper statistics."""
        stats = {
            "geometric_available": GEOMETRIC_AVAILABLE,
            "geometric_enabled": self.geometric_bridge is not None,
        }

        if self.geometric_bridge:
            stats["geometric_terminals"] = len(self.geometric_bridge.list_geometric_terminals())

        stats["standard_terminals"] = len(self.bridge.list_terminals())

        return stats

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Terminal Ripper - VM to PixelRTS")
    parser.add_argument("image", help="Path to VM screenshot")
    parser.add_argument("--geometric", action="store_true", default=True,
                        help="Use PixelRTS v3 geometric encoding (default)")
    parser.add_argument("--no-geometric", action="store_true",
                        help="Disable geometric encoding")
    parser.add_argument("--texture-only", action="store_true",
                        help="Only generate textures, don't spawn terminals")
    parser.add_argument("--output-dir", type=str, help="Output directory for textures")
    parser.add_argument("--stats", action="store_true", help="Show ripper stats")
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    config = RipConfig(
        use_geometric=args.geometric and not args.no_geometric,
        auto_render=False
    )

    ripper = TerminalRipper(config=config)

    if args.texture_only:
        paths = ripper.rip_to_geometric_texture(args.image, args.output_dir)
        print(f"Generated {len(paths)} geometric textures:")
        for p in paths:
            print(f"  {p}")
    else:
        ids = ripper.rip_from_image(args.image)
        print(f"Ripped {len(ids)} terminals. Tile IDs: {ids}")

    if args.stats:
        stats = ripper.get_stats()
        print(f"\nRipper Stats:")
        for k, v in stats.items():
            print(f"  {k}: {v}")
