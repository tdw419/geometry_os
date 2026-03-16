#!/usr/bin/env python3
"""
ECC Canvas - Visual Learning State Renderer

Renders ECC (Everything Claude Code) learning state as pixels on the
Geometry OS Infinite Map. This enables visual debugging of:
- Learned instincts (confidence as brightness)
- Active skills (usage as size)
- Agent states (activity as alpha)
- Memory patterns (recency as color)

Integration: Phase 2 of ECC × Geometry OS
"""

import json
import hashlib
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Optional
from datetime import datetime

try:
    from PIL import Image, ImageDraw, ImageFont
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False

# ECC paths
ECC_HOME = Path.home() / ".claude"
ECC_MEMORY_DIR = Path.cwd() / ".claude" / "memory"
ECC_INSTINCTS_DIR = ECC_HOME / "instincts"
ECC_SKILLS_DIR = ECC_HOME / "skills"
ECC_AGENTS_DIR = ECC_HOME / "agents"


@dataclass
class ECCLearningState:
    """Represents the current ECC learning state."""
    instincts_count: int
    skills_count: int
    agents_count: int
    rules_count: int
    memory_entries: int
    top_instincts: list  # Top instincts by confidence
    active_skills: list  # Recently used skills
    agents_status: dict  # Agent activity status
    timestamp: str


@dataclass
class ECCPixelRegion:
    """A region in the ECC canvas representing a learning component."""
    x: int
    y: int
    width: int
    height: int
    color: tuple  # RGB
    alpha: float
    label: str
    value: float  # Confidence, usage count, etc.


class ECCCanvas:
    """
    Renders ECC learning state as a visual canvas.

    Layout (1024x1024 grid):
    ┌──────────────────────────────────────────────────────┐
    │ Row 0-63:    Header (ECC Status)                     │
    │ Row 64-255:  Instincts (confidence as brightness)    │
    │ Row 256-447: Skills (usage as size)                  │
    │ Row 448-639: Agents (activity as alpha)              │
    │ Row 640-831: Memory (recency as hue)                 │
    │ Row 832-1023: Summary & Health                       │
    └──────────────────────────────────────────────────────┘
    """

    CANVAS_SIZE = 1024
    HEADER_HEIGHT = 64
    INSTINCTS_HEIGHT = 192
    SKILLS_HEIGHT = 192
    AGENTS_HEIGHT = 192
    MEMORY_HEIGHT = 192
    SUMMARY_HEIGHT = 192

    # Colors for different states
    COLOR_INSTINCT = (0, 255, 0)      # Green for instincts
    COLOR_SKILL = (0, 100, 255)       # Blue for skills
    COLOR_AGENT_ACTIVE = (255, 100, 0)  # Orange for active agents
    COLOR_AGENT_IDLE = (100, 100, 100)  # Gray for idle agents
    COLOR_MEMORY = (200, 0, 200)      # Purple for memory
    COLOR_HEADER = (50, 50, 80)       # Dark blue for header
    COLOR_BACKGROUND = (10, 10, 20)   # Near black

    def __init__(self, output_dir: Optional[Path] = None):
        self.output_dir = output_dir or Path.cwd()
        self.state: Optional[ECCLearningState] = None
        self.regions: list[ECCPixelRegion] = []

    def collect_state(self) -> ECCLearningState:
        """Collect current ECC learning state."""
        # Count components
        instincts = self._count_files(ECC_INSTINCTS_DIR)
        skills = self._count_files(ECC_SKILLS_DIR)
        agents = self._count_files(ECC_AGENTS_DIR)
        rules = self._count_files(ECC_HOME / "rules")

        # Count memory entries
        memory = 0
        if ECC_MEMORY_DIR.exists():
            memory = len(list(ECC_MEMORY_DIR.glob("*.md")))

        # Get top instincts
        top_instincts = self._get_top_instincts()

        # Get active skills
        active_skills = self._get_active_skills()

        # Get agents status
        agents_status = self._get_agents_status()

        self.state = ECCLearningState(
            instincts_count=instincts,
            skills_count=skills,
            agents_count=agents,
            rules_count=rules,
            memory_entries=memory,
            top_instincts=top_instincts,
            active_skills=active_skills,
            agents_status=agents_status,
            timestamp=datetime.now().isoformat()
        )

        return self.state

    def _count_files(self, dir_path: Path) -> int:
        """Count files in directory."""
        if not dir_path.exists():
            return 0
        return len([f for f in dir_path.glob("**/*") if f.is_file()])

    def _get_top_instincts(self, limit: int = 20) -> list:
        """Get top instincts by confidence."""
        instincts = []
        if not ECC_INSTINCTS_DIR.exists():
            return instincts

        for f in list(ECC_INSTINCTS_DIR.glob("*.md"))[:limit]:
            try:
                content = f.read_text()
                # Parse confidence from frontmatter or content
                confidence = 0.5  # Default
                if "confidence:" in content.lower():
                    for line in content.split("\n"):
                        if "confidence:" in line.lower():
                            try:
                                confidence = float(line.split(":")[1].strip())
                            except:
                                pass
                instincts.append({
                    "name": f.stem,
                    "confidence": confidence,
                    "file": str(f)
                })
            except:
                pass

        return sorted(instincts, key=lambda x: x["confidence"], reverse=True)

    def _get_active_skills(self, limit: int = 20) -> list:
        """Get recently active skills."""
        skills = []
        if not ECC_SKILLS_DIR.exists():
            return skills

        for f in list(ECC_SKILLS_DIR.glob("**/*.md"))[:limit]:
            try:
                stat = f.stat()
                skills.append({
                    "name": f.stem,
                    "size": f.stat().st_size,
                    "modified": stat.st_mtime,
                    "file": str(f)
                })
            except:
                pass

        return sorted(skills, key=lambda x: x["modified"], reverse=True)

    def _get_agents_status(self) -> dict:
        """Get agents status."""
        agents = {}
        if not ECC_AGENTS_DIR.exists():
            return agents

        for f in list(ECC_AGENTS_DIR.glob("*.md")):
            agents[f.stem] = {
                "available": True,
                "file": str(f)
            }

        return agents

    def render(self, output_path: Optional[str] = None) -> str:
        """
        Render the ECC canvas to a PNG image.

        Returns:
            Path to the rendered image
        """
        if not PIL_AVAILABLE:
            raise ImportError("PIL not available. Install with: pip install Pillow")

        if not self.state:
            self.collect_state()

        # Create canvas
        img = Image.new('RGBA', (self.CANVAS_SIZE, self.CANVAS_SIZE),
                        color=self.COLOR_BACKGROUND + (255,))
        draw = ImageDraw.Draw(img)

        self.regions = []

        # Render each section
        y_offset = 0

        # Header
        self._render_header(draw, y_offset)
        y_offset += self.HEADER_HEIGHT

        # Instincts
        self._render_instincts(draw, y_offset)
        y_offset += self.INSTINCTS_HEIGHT

        # Skills
        self._render_skills(draw, y_offset)
        y_offset += self.SKILLS_HEIGHT

        # Agents
        self._render_agents(draw, y_offset)
        y_offset += self.AGENTS_HEIGHT

        # Memory
        self._render_memory(draw, y_offset)
        y_offset += self.MEMORY_HEIGHT

        # Summary
        self._render_summary(draw, y_offset)

        # Save image
        output = output_path or str(self.output_dir / "ecc_canvas.png")
        img.save(output)

        return output

    def _render_header(self, draw: ImageDraw, y_offset: int):
        """Render header section."""
        # Background
        draw.rectangle(
            [0, y_offset, self.CANVAS_SIZE, y_offset + self.HEADER_HEIGHT],
            fill=self.COLOR_HEADER + (255,)
        )

        # Title
        title = f"ECC Learning State - {self.state.timestamp[:19]}"
        draw.text((10, y_offset + 10), title, fill=(255, 255, 255))

        # Stats
        stats = f"Instincts: {self.state.instincts_count}  Skills: {self.state.skills_count}  Agents: {self.state.agents_count}"
        draw.text((10, y_offset + 35), stats, fill=(200, 200, 200))

        self.regions.append(ECCPixelRegion(
            x=0, y=y_offset,
            width=self.CANVAS_SIZE, height=self.HEADER_HEIGHT,
            color=self.COLOR_HEADER, alpha=1.0,
            label="Header", value=1.0
        ))

    def _render_instincts(self, draw: ImageDraw, y_offset: int):
        """Render instincts section as brightness-encoded pixels."""
        if not self.state.top_instincts:
            # Draw placeholder
            draw.rectangle(
                [0, y_offset, self.CANVAS_SIZE, y_offset + self.INSTINCTS_HEIGHT],
                fill=self.COLOR_BACKGROUND + (100,)
            )
            draw.text((10, y_offset + 10), "No instincts learned yet",
                      fill=(100, 100, 100))
            return

        # Each instinct is a 32x32 pixel block
        block_size = 32
        cols = self.CANVAS_SIZE // block_size

        for i, instinct in enumerate(self.state.top_instincts):
            col = i % cols
            row = i // cols
            x = col * block_size
            y = y_offset + row * block_size

            if y + block_size > y_offset + self.INSTINCTS_HEIGHT:
                break

            # Brightness based on confidence
            confidence = instinct.get("confidence", 0.5)
            brightness = int(255 * confidence)
            color = (
                int(self.COLOR_INSTINCT[0] * confidence),
                int(self.COLOR_INSTINCT[1] * confidence),
                int(self.COLOR_INSTINCT[2] * confidence)
            )

            draw.rectangle(
                [x, y, x + block_size - 1, y + block_size - 1],
                fill=color + (255,),
                outline=(50, 50, 50)
            )

            self.regions.append(ECCPixelRegion(
                x=x, y=y,
                width=block_size, height=block_size,
                color=color, alpha=confidence,
                label=instinct["name"], value=confidence
            ))

    def _render_skills(self, draw: ImageDraw, y_offset: int):
        """Render skills section with size-based visualization."""
        if not self.state.active_skills:
            draw.rectangle(
                [0, y_offset, self.CANVAS_SIZE, y_offset + self.SKILLS_HEIGHT],
                fill=self.COLOR_BACKGROUND + (100,)
            )
            draw.text((10, y_offset + 10), "No skills available",
                      fill=(100, 100, 100))
            return

        # Each skill is a horizontal bar
        bar_height = 16
        max_size = max(s["size"] for s in self.state.active_skills) or 1

        for i, skill in enumerate(self.state.active_skills[:12]):
            y = y_offset + i * bar_height
            if y + bar_height > y_offset + self.SKILLS_HEIGHT:
                break

            # Width based on size
            width_ratio = skill["size"] / max_size
            width = int((self.CANVAS_SIZE - 20) * width_ratio)

            # Color intensity based on recency
            color = self.COLOR_SKILL

            draw.rectangle(
                [10, y, 10 + width, y + bar_height - 2],
                fill=color + (255,)
            )

            self.regions.append(ECCPixelRegion(
                x=10, y=y,
                width=width, height=bar_height - 2,
                color=color, alpha=width_ratio,
                label=skill["name"], value=skill["size"]
            ))

    def _render_agents(self, draw: ImageDraw, y_offset: int):
        """Render agents section with activity visualization."""
        if not self.state.agents_status:
            draw.rectangle(
                [0, y_offset, self.CANVAS_SIZE, y_offset + self.AGENTS_HEIGHT],
                fill=self.COLOR_BACKGROUND + (100,)
            )
            draw.text((10, y_offset + 10), "No agents configured",
                      fill=(100, 100, 100))
            return

        # Each agent is a 64x64 pixel block
        block_size = 64
        cols = self.CANVAS_SIZE // block_size

        for i, (name, status) in enumerate(list(self.state.agents_status.items())[:16]):
            col = i % cols
            row = i // cols
            x = col * block_size
            y = y_offset + row * block_size

            if y + block_size > y_offset + self.AGENTS_HEIGHT:
                break

            # Color based on availability
            color = self.COLOR_AGENT_ACTIVE if status.get("available") else self.COLOR_AGENT_IDLE
            alpha = 1.0 if status.get("available") else 0.3

            draw.rectangle(
                [x, y, x + block_size - 1, y + block_size - 1],
                fill=color + (int(255 * alpha),),
                outline=(80, 80, 80)
            )

            self.regions.append(ECCPixelRegion(
                x=x, y=y,
                width=block_size, height=block_size,
                color=color, alpha=alpha,
                label=name, value=1.0 if status.get("available") else 0.0
            ))

    def _render_memory(self, draw: ImageDraw, y_offset: int):
        """Render memory section with recency-based hue."""
        # Memory visualization as a gradient
        if self.state.memory_entries == 0:
            draw.rectangle(
                [0, y_offset, self.CANVAS_SIZE, y_offset + self.MEMORY_HEIGHT],
                fill=self.COLOR_BACKGROUND + (100,)
            )
            draw.text((10, y_offset + 10), "No memory entries",
                      fill=(100, 100, 100))
            return

        # Create a gradient representing memory density
        for i in range(self.CANVAS_SIZE):
            # Hue shifts based on position (simulating memory density)
            hue = (i / self.CANVAS_SIZE) * 360
            # Convert HSV to RGB (simplified)
            r = int(self.COLOR_MEMORY[0] * (1 - abs((hue % 120) - 60) / 60))
            g = int(self.COLOR_MEMORY[1] * (1 - abs(((hue + 120) % 120) - 60) / 60))
            b = int(self.COLOR_MEMORY[2] * (1 - abs(((hue + 240) % 120) - 60) / 60))

            draw.line(
                [(i, y_offset), (i, y_offset + self.MEMORY_HEIGHT)],
                fill=(r, g, b, 100)
            )

        self.regions.append(ECCPixelRegion(
            x=0, y=y_offset,
            width=self.CANVAS_SIZE, height=self.MEMORY_HEIGHT,
            color=self.COLOR_MEMORY, alpha=0.5,
            label="Memory", value=self.state.memory_entries
        ))

    def _render_summary(self, draw: ImageDraw, y_offset: int):
        """Render summary section."""
        # Background
        draw.rectangle(
            [0, y_offset, self.CANVAS_SIZE, y_offset + self.SUMMARY_HEIGHT],
            fill=(30, 30, 50, 255)
        )

        # Health indicator
        health = self._calculate_health()
        health_color = (
            int(255 * (1 - health)),
            int(255 * health),
            0
        )

        # Health bar
        bar_width = int((self.CANVAS_SIZE - 40) * health)
        draw.rectangle(
            [20, y_offset + 20, 20 + bar_width, y_offset + 40],
            fill=health_color + (255,)
        )

        # Health text
        draw.text((20, y_offset + 50), f"System Health: {health:.1%}",
                  fill=(255, 255, 255))

        # Component counts
        y_text = y_offset + 80
        components = [
            f"Instincts: {self.state.instincts_count}",
            f"Skills: {self.state.skills_count}",
            f"Agents: {self.state.agents_count}",
            f"Rules: {self.state.rules_count}",
            f"Memory: {self.state.memory_entries}"
        ]
        for comp in components:
            draw.text((20, y_text), comp, fill=(200, 200, 200))
            y_text += 20

    def _calculate_health(self) -> float:
        """Calculate overall system health."""
        if not self.state:
            return 0.0

        # Health factors
        has_instincts = self.state.instincts_count > 0
        has_skills = self.state.skills_count > 0
        has_agents = self.state.agents_count > 0

        # Simple health calculation
        health = 0.0
        if has_instincts:
            health += 0.4
        if has_skills:
            health += 0.3
        if has_agents:
            health += 0.3

        return min(1.0, health)

    def to_json(self) -> str:
        """Export canvas state as JSON for the Infinite Map."""
        if not self.state:
            self.collect_state()

        return json.dumps({
            "timestamp": self.state.timestamp,
            "state": asdict(self.state),
            "regions": [asdict(r) for r in self.regions],
            "health": self._calculate_health()
        }, indent=2)

    def to_rts(self, output_path: Optional[str] = None) -> str:
        """
        Export as PixelRTS format for direct loading into GPU substrate.

        The ECC canvas is encoded as a 1024x1024 RGBA texture where:
        - Each pixel represents a learning component
        - Alpha channel encodes confidence/activity
        """
        if not self.state:
            self.collect_state()

        # First render to get regions
        output = self.render(output_path)

        # Convert to RTS format (reuse existing PixelRTS encoder)
        try:
            import sys
            sys.path.insert(0, str(Path(__file__).parent.parent / "pixel_compiler"))
            from pixelrts_v2_core import PixelRTSEncoder

            encoder = PixelRTSEncoder()
            # Read the rendered PNG and encode
            img = Image.open(output)
            rts_path = output.replace(".png", ".rts.png")
            img.save(rts_path)
            return rts_path
        except Exception as e:
            print(f"Warning: Could not convert to RTS: {e}")
            return output


def render_ecc_canvas(output_dir: Optional[str] = None) -> str:
    """
    Convenience function to render ECC canvas.

    Args:
        output_dir: Directory to save output (defaults to cwd)

    Returns:
        Path to rendered image
    """
    canvas = ECCCanvas(Path(output_dir) if output_dir else None)
    return canvas.render()


if __name__ == "__main__":
    import sys

    output_dir = sys.argv[1] if len(sys.argv) > 1 else None
    canvas = ECCCanvas(Path(output_dir) if output_dir else None)

    # Collect and render
    state = canvas.collect_state()
    print(f"ECC State: {state.instincts_count} instincts, {state.skills_count} skills, {state.agents_count} agents")

    # Render PNG
    output = canvas.render()
    print(f"Rendered to: {output}")

    # Export JSON
    json_path = output.replace(".png", ".json")
    with open(json_path, "w") as f:
        f.write(canvas.to_json())
    print(f"JSON exported to: {json_path}")
