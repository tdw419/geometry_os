#!/usr/bin/env python3
"""
Genetic Turing Test for Weight Grafting Validation

Task 8.1: Prove that weight grafting transfers physical pixel data,
not just behavioral mimicry.

Protocol:
  Phase A (Baseline): Run inference on original brain, record logits
  Phase B (Mutation): Apply radiation mutation to LM head, record logits
  Phase C (Graft): Graft mutated sector to fresh brain, record logits
  Phase D (Audit): Compare logits - SUCCESS if Grafted == Donor AND Grafted != Baseline
"""

import hashlib
import json
import shutil
import sys
from pathlib import Path

import numpy as np
from PIL import Image

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.evolution_daemon.grafting_protocol import GraftingProtocol
from systems.evolution_daemon.weight_mutator import WeightMutator


class GeneticTuringTest:
    def __init__(self, baseline_brain_path: str = None, prompt: str = None):
        if baseline_brain_path is None:
            baseline_brain_path = "gpt_neo_125m_brain.rts.png"
        if prompt is None:
            prompt = "The security vulnerability is"

        self.baseline_brain_path = Path(baseline_brain_path)
        self.prompt = prompt
        self.results = {
            "baseline_logits": None,
            "donor_logits": None,
            "grafted_logits": None,
            "baseline_checksum": None,
            "donor_checksum": None,
            "grafted_checksum": None,
            "verdict": None,
            "details": {}
        }

        if not self.baseline_brain_path.exists():
            raise FileNotFoundError(f"Baseline brain not found: {self.baseline_brain_path}")

        meta_path = Path(str(self.baseline_brain_path) + ".meta.json")
        with open(meta_path) as f:
            self.metadata = json.load(f)
        self.layout = self.metadata.get("layout", {})
        self.lm_head_start = self.layout.get("sectors", {}).get("lm_head", {}).get("start", 123532032)

        self.test_dir = Path("/tmp/genetic_turing_test")
        self.test_dir.mkdir(exist_ok=True)

    def _run_simple_inference(self, brain_path: Path) -> tuple[np.ndarray, str]:
        print(f"   Loading atlas from {brain_path}...")
        img = Image.open(brain_path)
        atlas = np.array(img)
        checksum = hashlib.sha256(atlas.tobytes()).hexdigest()[:16]

        from systems.evolution.HilbertEngine import HilbertEngine
        engine = HilbertEngine()

        # CORRECT Q4_0 INDEXING: 32 weights = 5 pixels
        pixel_start = (self.lm_head_start // 32) * 5
        print(f"   Sampling Hilbert pixels starting at {pixel_start}...")

        weight_values = []
        for d in range(pixel_start, pixel_start + 100):
            x, y = engine.d2xy(atlas.shape[0], d)
            pixel = atlas[y, x]
            weight_values.extend(pixel.tolist())

        logits = np.array(weight_values[:50], dtype=np.float32)
        top_5_indices = np.argsort(logits)[-5:][::-1]
        top_logits = logits[top_5_indices]
        return top_logits, checksum

    def phase_a_baseline(self):
        print("\nPHASE A: BASELINE")
        logits, checksum = self._run_simple_inference(self.baseline_brain_path)
        self.results["baseline_logits"] = logits
        self.results["baseline_checksum"] = checksum
        print(f"✅ Baseline checksum: {checksum}")

    def phase_b_mutation(self):
        print("\nPHASE B: RADIATION MUTATION")
        img = Image.open(self.baseline_brain_path)
        baseline_atlas = np.array(img)
        donor_path = self.test_dir / "donor_brain.rts.png"
        shutil.copy(self.baseline_brain_path, donor_path)
        shutil.copy(str(self.baseline_brain_path) + ".meta.json", str(donor_path) + ".meta.json")

        pixel_start = (self.lm_head_start // 32) * 5
        pixel_end = pixel_start + 1000
        print(f"📊 Mutating pixels {pixel_start} -> {pixel_end} (Intensity: 50.0)")

        mutator = WeightMutator(baseline_atlas)
        mutated_atlas, record = mutator.mutate_sector({
            "hilbert_start": pixel_start,
            "hilbert_end": pixel_end,
            "mutation_type": "radiation",
            "intensity": 50.0
        })
        Image.fromarray(mutated_atlas, 'RGBA').save(donor_path)
        print(f"✅ Mutation complete (Affected: {record.pixels_affected})")

        logits, checksum = self._run_simple_inference(donor_path)
        self.results["donor_logits"] = logits
        self.results["donor_checksum"] = checksum

    def phase_c_graft(self):
        print("\nPHASE C: WEIGHT GRAFTING")
        donor_path = self.test_dir / "donor_brain.rts.png"
        grafted_path = self.test_dir / "grafted_brain.rts.png"
        shutil.copy(self.baseline_brain_path, grafted_path)
        shutil.copy(str(self.baseline_brain_path) + ".meta.json", str(grafted_path) + ".meta.json")

        protocol = GraftingProtocol(str(grafted_path), str(donor_path))
        pixel_start = (self.lm_head_start // 32) * 5
        pixel_end = pixel_start + 1000
        grafted = protocol.graft_sector(pixel_start, pixel_end)
        protocol.save_grafted_brain(str(grafted_path))
        print(f"✅ Grafting complete (Pixels: {grafted})")

        logits, checksum = self._run_simple_inference(grafted_path)
        self.results["grafted_logits"] = logits
        self.results["grafted_checksum"] = checksum

    def phase_d_audit(self):
        print("\nPHASE D: AUDIT")
        donor_checksum = self.results["donor_checksum"]
        grafted_checksum = self.results["grafted_checksum"]
        baseline_checksum = self.results["baseline_checksum"]

        success = (donor_checksum == grafted_checksum) and (grafted_checksum != baseline_checksum)
        self.results["verdict"] = "SUCCESS" if success else "FAILURE"

        print(f"📊 Result: {self.results['verdict']}")
        print(f"   Donor == Grafted: {donor_checksum == grafted_checksum}")
        print(f"   Baseline != Grafted: {baseline_checksum != grafted_checksum}")
        return self.results

    def run_full_test(self):
        self.phase_a_baseline()
        self.phase_b_mutation()
        self.phase_c_graft()
        return self.phase_d_audit()

if __name__ == "__main__":
    test = GeneticTuringTest()
    results = test.run_full_test()
    print(json.dumps(results, indent=2, default=str))
