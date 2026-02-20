#!/usr/bin/env python3
"""
Terminal Ripper - Phase 28 Integration

Orchestrates the "rip" process:
1. Capture VM Framebuffer
2. Detect Terminal Regions
3. Spawn Terminal Clones on the Map
"""

import logging
import os
from pathlib import Path
from typing import List, Optional

try:
    from .vm_terminal_detector import VmTerminalDetector, TerminalCandidate
    from .terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig
except (ImportError, ValueError):
    from vm_terminal_detector import VmTerminalDetector, TerminalCandidate
    from terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig

logger = logging.getLogger("terminal_ripper")

class TerminalRipper:
    def __init__(self, bridge: Optional[TerminalVatBridge] = None):
        self.bridge = bridge or TerminalVatBridge()
        self.detector = VmTerminalDetector()

    def rip_from_image(self, image_path: str) -> List[int]:
        """
        Scans an image for terminals and spawns clones for each.
        
        Returns:
            List of spawned tile IDs
        """
        logger.info(f"🧬 Ripping terminals from {image_path}")
        candidates = self.detector.scan(image_path)
        
        spawned_ids = []
        for candidate in candidates:
            logger.info(f"✨ Found terminal candidate: {candidate.grid_size} at {candidate.bbox}")
            
            # Create config based on detected candidate
            config = TerminalTileConfig(
                rows=candidate.grid_size[1],
                cols=candidate.grid_size[0],
                shell="/bin/bash", # Default shell for the clone
                near_center=True   # Place near focal point
            )
            
            # Spawn the terminal
            tile_id = self.bridge.spawn_terminal(config)
            spawned_ids.append(tile_id)
            
            # TODO: In a more advanced version, we could "pre-fill" the clone 
            # with the detected text, but for now we just spawn a live shell.
            
        return spawned_ids

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("image", help="Path to VM screenshot")
    args = parser.parse_args()
    
    logging.basicConfig(level=logging.INFO)
    ripper = TerminalRipper()
    ids = ripper.rip_from_image(args.image)
    print(f"Successfully ripped {len(ids)} terminals. Tile IDs: {ids}")
