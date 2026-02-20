#!/usr/bin/env python3
import re
import logging
from typing import List, Optional, Tuple, Dict, Any
from pathlib import Path
import sys

# Add conductor path for extraction pipeline imports
sys.path.append(str(Path(__file__).parent.parent.parent.parent / "conductor" / "tracks" / "shotcut-on-the-map"))

from extraction_pipeline import ExtractionPipeline, ExtractionResult

logger = logging.getLogger("terminal_clone.detector")

class VMTerminalDetector:
    """
    Scans VM framebuffers for terminal windows using the ExtractionPipeline.
    """
    
    # Heuristic patterns for terminal detection
    SHELL_PROMPT_PATTERNS = [
        r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+:?[/~].*[\$#]\s*$",  # user@host:~$
        r"^[\$#]\s+",                                           # $ or #
        r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\s+[\$#]\s*$",        # user@host $
    ]
    
    TERMINAL_KEYWORDS = [
        "terminal", "shell", "bash", "zsh", "sh", "root", "command prompt"
    ]

    def __init__(self, pipeline: Optional[ExtractionPipeline] = None):
        self.pipeline = pipeline or ExtractionPipeline()
        self.compiled_prompts = [re.compile(p) for p in self.SHELL_PROMPT_PATTERNS]

    def scan_framebuffer(self, image_path: str) -> List[Dict[str, Any]]:
        """
        Scans a framebuffer image for terminal regions.
        
        Returns:
            List of detected terminal regions with coordinates and estimated grid size.
        """
        logger.info(f"🔍 Scanning framebuffer: {image_path}")
        result = self.pipeline.extract(image_path)
        
        terminals = []
        
        # Strategy A: Check widgets labeled as TERMINAL or similar
        for widget in result.widgets:
            if widget.type.name in ["TERMINAL", "WINDOW"] and any(kw in widget.text.lower() for kw in self.TERMINAL_KEYWORDS):
                terminals.append(self._widget_to_terminal_config(widget))

        # Strategy B: Check clusters for shell prompt patterns
        for cluster in result.clusters:
            if self._is_cluster_terminal_like(cluster):
                terminals.append(self._cluster_to_terminal_config(cluster))
                
        # Deduplicate overlapping regions
        return self._deduplicate(terminals)

    def _is_cluster_terminal_like(self, cluster: Any) -> bool:
        """Heuristic check if a semantic cluster looks like a terminal."""
        text_lines = [e.text for e in cluster.elements]
        full_text = " ".join(text_lines).lower()
        
        # Check for shell prompts
        has_prompt = any(any(p.match(line.strip()) for p in self.compiled_prompts) for line in text_lines)
        
        # Check for command-line commonalities
        has_keywords = any(kw in full_text for kw in ["ls -", "cd ", "sudo ", "apt ", "docker "])
        
        return has_prompt or (has_keywords and len(text_lines) > 5)

    def _widget_to_terminal_config(self, widget: Any) -> Dict[str, Any]:
        return {
            "bbox": widget.bbox,
            "text": widget.text,
            "type": "widget",
            "grid_size": self._estimate_grid_size(widget.bbox)
        }

    def _cluster_to_terminal_config(self, cluster: Any) -> Dict[str, Any]:
        return {
            "bbox": cluster.bounds,
            "text": " ".join([e.text for e in cluster.elements[:5]]),
            "type": "cluster",
            "grid_size": self._estimate_grid_size(cluster.bounds)
        }

    def _estimate_grid_size(self, bbox: List[int]) -> Tuple[int, int]:
        """Estimate terminal character grid size based on pixel dimensions."""
        # Assuming standard 8x16 font as baseline
        x1, y1, x2, y2 = bbox
        width = x2 - x1
        height = y2 - y1
        
        cols = max(40, min(120, width // 8))
        rows = max(10, min(50, height // 16))
        
        return (rows, cols)

    def _deduplicate(self, terminals: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Removes overlapping detected terminal regions."""
        if not terminals:
            return []
            
        unique = []
        for t in sorted(terminals, key=lambda x: (x["bbox"][2]-x["bbox"][0]) * (x["bbox"][3]-x["bbox"][1]), reverse=True):
            is_sub_region = False
            for u in unique:
                # Simple IoU-style check
                if self._is_inside(t["bbox"], u["bbox"]):
                    is_sub_region = True
                    break
            if not is_sub_region:
                unique.append(t)
        return unique

    def _is_inside(self, inner: List[int], outer: List[int]) -> bool:
        return (inner[0] >= outer[0] and inner[1] >= outer[1] and
                inner[2] <= outer[2] and inner[3] <= outer[3])

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("image", help="Path to VM framebuffer screenshot")
    args = parser.parse_args()
    
    logging.basicConfig(level=logging.INFO)
    detector = VMTerminalDetector()
    results = detector.scan_framebuffer(args.image)
    
    print(f"Found {len(results)} terminal regions:")
    for i, res in enumerate(results):
        print(f"[{i}] {res['bbox']} -> Grid: {res['grid_size']}")
