#!/usr/bin/env python3
"""
Visual Thought Demo - Geometry OS
==================================

Demonstrates the pipeline from LLM "thought" (latent vector) to visible
holographic tiles pulsing in the Neural City UI.

Pipeline:
    Mock Latent Vector → GeometricOutputAdapter → 16x16 Holographic Tile
                                                              ↓
                    VisualBridgeClient → token_visualization_update → Neural City

Usage:
    # Start Visual Bridge first
    python systems/visual_shell/api/visual_bridge.py &

    # Run demo
    python visual_thought_demo.py

    # With custom thoughts
    python visual_thought_demo.py --thoughts "hello world" "geometry os" "neural city"
"""

import asyncio
import time
import numpy as np
import argparse
import sys
from pathlib import Path

# Add project root to path
PROJECT_ROOT = Path(__file__).parent
sys.path.insert(0, str(PROJECT_ROOT))

from systems.pixel_compiler.holographic_encoder import generate_2d_basis, encode_instruction
from systems.visual_shell.api.visual_bridge import VisualBridgeClient


class GeometricOutputAdapter:
    """
    Converts LLM latent vectors to 16x16 holographic tiles.

    This sits at the output of any transformer, intercepting the hidden state
    before it goes to the vocabulary projection (unembedding) layer.

    The result is a visual "fingerprint" of the model's internal state.
    """

    def __init__(self, latent_dim: int = 4096, seed: int = 42):
        """
        Initialize the adapter.

        Args:
            latent_dim: Dimension of input latent vectors (e.g., 4096 for Llama-7B)
            seed: Random seed for reproducible projections
        """
        self.latent_dim = latent_dim
        self.target_bits = 32  # 32-bit geometric signature

        # Generate Hadamard basis patterns (32 unique 16x16 patterns)
        self.basis = generate_2d_basis(size=16, count=64)[:self.target_bits]

        # Random projection matrix: latent_dim → 32 dimensions
        # This is a fixed "hash" function that preserves semantic similarity
        np.random.seed(seed)
        self.projection = np.random.randn(latent_dim, self.target_bits) / np.sqrt(latent_dim)

    def adapt(self, latent_vector: np.ndarray) -> tuple:
        """
        Convert a latent vector to a 16x16 holographic tile.

        Args:
            latent_vector: Shape (latent_dim,) or (batch, latent_dim)

        Returns:
            (pattern_16x16, signature_int, signature_bits)
        """
        # Ensure 1D
        latent = latent_vector.flatten()

        # Project to 32 dimensions
        projected = np.dot(latent, self.projection)

        # Binarize: threshold at 0 to get 32-bit signature
        signature_bits = (projected > 0).astype(int)

        # Convert bit array to integer
        signature_int = sum((1 << i) for i, bit in enumerate(signature_bits) if bit)

        # Generate 16x16 holographic interference pattern
        pattern = encode_instruction(signature_int, self.basis)

        return pattern, signature_int, signature_bits

    def adapt_batch(self, latent_vectors: np.ndarray) -> list:
        """Process multiple latent vectors."""
        results = []
        for lv in latent_vectors:
            results.append(self.adapt(lv))
        return results


class ThoughtGenerator:
    """
    Generates mock latent vectors that simulate LLM "thoughts".

    In a real implementation, these would come from the hidden states
    of a running LLM (e.g., llama.cpp with logits output).
    """

    def __init__(self, latent_dim: int = 4096, seed: int = 123):
        self.latent_dim = latent_dim
        self.rng = np.random.default_rng(seed)

        # Create some "semantic anchors" - base vectors for concepts
        self.anchors = {
            "hello": self._random_unit_vector(),
            "world": self._random_unit_vector(),
            "geometry": self._random_unit_vector(),
            "os": self._random_unit_vector(),
            "neural": self._random_unit_vector(),
            "city": self._random_unit_vector(),
            "thought": self._random_unit_vector(),
            "pulse": self._random_unit_vector(),
            "holographic": self._random_unit_vector(),
            "pattern": self._random_unit_vector(),
        }

    def _random_unit_vector(self) -> np.ndarray:
        """Generate a random unit vector."""
        v = self.rng.standard_normal(self.latent_dim)
        return v / np.linalg.norm(v)

    def generate_thought(self, concept: str = None, noise_level: float = 0.1) -> np.ndarray:
        """
        Generate a mock latent vector.

        Args:
            concept: Optional concept name to anchor the thought
            noise_level: Amount of random noise to add

        Returns:
            Latent vector of shape (latent_dim,)
        """
        if concept and concept.lower() in self.anchors:
            # Start from anchor and add noise
            base = self.anchors[concept.lower()].copy()
        else:
            # Random thought
            base = self._random_unit_vector()

        # Add noise to simulate evolving thought
        noise = self.rng.standard_normal(self.latent_dim) * noise_level
        return base + noise

    def generate_thought_sequence(self, concepts: list, drift: float = 0.05) -> list:
        """
        Generate a sequence of related thoughts.

        Each thought drifts slightly from the previous, simulating
        the natural flow of LLM cognition.

        Args:
            concepts: List of concept names
            drift: How much each thought drifts from base

        Returns:
            List of latent vectors
        """
        thoughts = []
        current = None

        for concept in concepts:
            base = self.generate_thought(concept, noise_level=drift)

            if current is not None:
                # Blend with previous thought (temporal coherence)
                blend = 0.7 * base + 0.3 * current
                current = blend / np.linalg.norm(blend) * np.linalg.norm(base)
            else:
                current = base

            thoughts.append(current)

        return thoughts


class VisualThoughtDemo:
    """
    Complete demo: generates thoughts, converts to glyphs, sends to Neural City.
    """

    def __init__(self, ws_url: str = "ws://localhost:8768", latent_dim: int = 4096):
        self.adapter = GeometricOutputAdapter(latent_dim=latent_dim)
        self.generator = ThoughtGenerator(latent_dim=latent_dim)
        self.client = VisualBridgeClient(ws_url=ws_url, agent_id="visual-thought-demo")

        # Track position on Hilbert curve (simulated 2D map)
        self.hilbert_x = 0
        self.hilbert_y = 0
        self.hilbert_step = 16

    async def connect(self) -> bool:
        """Connect to Visual Bridge."""
        return await self.client.connect()

    async def disconnect(self):
        """Disconnect from Visual Bridge."""
        await self.client.disconnect()

    def _advance_hilbert(self):
        """Move position along Hilbert curve (simplified)."""
        self.hilbert_x += self.hilbert_step
        if self.hilbert_x >= 1024:
            self.hilbert_x = 0
            self.hilbert_y += self.hilbert_step

    def _pattern_to_ascii(self, pattern: np.ndarray) -> str:
        """Convert 16x16 pattern to ASCII art representation."""
        chars = " .:-=+*#%@"
        normalized = ((pattern - pattern.min()) / (pattern.max() - pattern.min() + 1e-8) * (len(chars) - 1)).astype(int)
        lines = []
        for row in normalized:
            lines.append("".join(chars[c] for c in row))
        return "\n".join(lines)

    async def send_thought_pulse(self, latent_vector: np.ndarray, label: str = "") -> dict:
        """
        Convert latent vector to holographic tile and send to Neural City.

        Args:
            latent_vector: The "thought" to visualize
            label: Optional label for logging

        Returns:
            Dict with pattern info
        """
        # Convert to geometric representation
        pattern, signature_int, signature_bits = self.adapter.adapt(latent_vector)

        # Advance position
        self._advance_hilbert()

        # Create visual token representation (compact glyph)
        # Use first 8 bits as a visual pattern
        glyph_chars = "▓░▒█▄▀■□"
        glyph = "".join(glyph_chars[b % len(glyph_chars)] for b in signature_bits[:8])

        # Send to Neural City
        event = {
            "hilbert_x": self.hilbert_x,
            "hilbert_y": self.hilbert_y,
            "token": glyph,
            "signature": hex(signature_int),
            "timestamp": time.time()
        }

        success = await self.client.send("token_visualization_update", event)

        if success:
            print(f"\n{'='*60}")
            print(f"  THOUGHT: {label or 'unnamed'}")
            print(f"  Signature: 0x{signature_int:08X}")
            print(f"  Position: ({self.hilbert_x}, {self.hilbert_y})")
            print(f"  Glyph: {glyph}")
            print(f"{'='*60}")
            print(self._pattern_to_ascii(pattern))
            print()

        return {
            "pattern": pattern,
            "signature": signature_int,
            "event": event,
            "success": success
        }

    async def run_thought_stream(self, concepts: list, interval: float = 0.5):
        """
        Stream a sequence of thoughts to Neural City.

        Args:
            concepts: List of concept names to think about
            interval: Seconds between thoughts
        """
        thoughts = self.generator.generate_thought_sequence(concepts)

        print(f"\n🧠 Starting Visual Thought Stream")
        print(f"   Concepts: {concepts}")
        print(f"   Interval: {interval}s")
        print(f"   Total thoughts: {len(thoughts)}")
        print()

        for i, (concept, thought) in enumerate(zip(concepts, thoughts)):
            await self.send_thought_pulse(thought, label=concept)
            await asyncio.sleep(interval)

        print(f"\n✅ Stream complete. {len(thoughts)} thoughts visualized.")

    async def run_evolution_demo(self, base_concept: str = "geometry", steps: int = 20, interval: float = 0.3):
        """
        Demonstrate thought evolution - how a thought drifts over time.

        Args:
            base_concept: Starting concept
            steps: Number of evolution steps
            interval: Seconds between steps
        """
        print(f"\n🧬 Thought Evolution Demo")
        print(f"   Base concept: {base_concept}")
        print(f"   Evolution steps: {steps}")
        print()

        current = self.generator.generate_thought(base_concept, noise_level=0.02)

        for i in range(steps):
            # Evolve the thought (small random drift)
            drift = np.random.randn(*current.shape) * 0.05
            current = current + drift
            current = current / np.linalg.norm(current) * 10  # Renormalize

            await self.send_thought_pulse(current, label=f"{base_concept}→{i}")
            await asyncio.sleep(interval)

        print(f"\n✅ Evolution complete. {steps} states visualized.")


async def main():
    parser = argparse.ArgumentParser(description="Visual Thought Demo")
    parser.add_argument("--ws", default="ws://localhost:8768", help="Visual Bridge WebSocket URL")
    parser.add_argument("--thoughts", nargs="+", default=["hello", "world", "geometry", "neural", "city"],
                        help="Concepts to visualize")
    parser.add_argument("--interval", type=float, default=0.5, help="Seconds between thoughts")
    parser.add_argument("--evolve", action="store_true", help="Run evolution demo instead")
    parser.add_argument("--steps", type=int, default=20, help="Steps for evolution demo")
    parser.add_argument("--latent-dim", type=int, default=4096, help="Latent dimension")

    args = parser.parse_args()

    demo = VisualThoughtDemo(ws_url=args.ws, latent_dim=args.latent_dim)

    print("="*60)
    print("  VISUAL THOUGHT DEMO - Geometry OS")
    print("="*60)
    print()
    print("This demo converts simulated LLM latent vectors to")
    print("holographic 16x16 tiles and sends them to Neural City.")
    print()

    # Connect to Visual Bridge
    print(f"🔌 Connecting to Visual Bridge at {args.ws}...")
    connected = await demo.connect()

    if not connected:
        print("❌ Failed to connect. Is the Visual Bridge running?")
        print("   Start it with: python systems/visual_shell/api/visual_bridge.py")
        return 1

    print("✅ Connected!")
    print()

    try:
        if args.evolve:
            await demo.run_evolution_demo(
                base_concept=args.thoughts[0] if args.thoughts else "geometry",
                steps=args.steps,
                interval=args.interval
            )
        else:
            await demo.run_thought_stream(
                concepts=args.thoughts,
                interval=args.interval
            )
    finally:
        await demo.disconnect()

    return 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
