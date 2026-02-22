"""
Geometric Semantic Bridge - PixelRTS v3 → WordPress District Integration

Bridges the geometric instruction pipeline with the WordPress semantic district
for persistent memory, execution logging, and human-readable system mirrors.

Integration Points:
1. PixelRTS Execution Traces → WordPress Journal Posts
2. Program Snapshots → WordPress Pages (documentation)
3. Telemetry Pulses → Visual Bridge → Map Visualization

Usage:
    from geometric_publisher import GeometricPublisher

    publisher = GeometricPublisher()
    publisher.log_execution(program_name="hello.pasm", registers=[0,10,20,30],
                            steps=4, pc=3, halted=True)
"""

import sys
import os
import json
import time
from datetime import datetime
from typing import List, Optional, Dict, Any

# Add parent paths for imports
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

try:
    from publish_to_wp import publish_to_wordpress
    WP_AVAILABLE = True
except ImportError:
    WP_AVAILABLE = False
    print("Warning: WordPress publishing not available")

try:
    import requests
    TELEMETRY_AVAILABLE = True
except ImportError:
    TELEMETRY_AVAILABLE = False


# Opcode definitions (synced with PixelRTS v3)
OPCODES = {
    0x00: "NOP", 0x01: "MOV", 0x33: "ADD", 0x34: "SUB",
    0x35: "MUL", 0x36: "DIV", 0x06: "JMP", 0x07: "HALT", 0x08: "LDI",
    0x37: "CMP", 0x38: "BEQ", 0x47: "LDP", 0x48: "STP"
}

OPCODE_COLORS = {
    0x00: "#333333",  # NOP - dark gray
    0x01: "#5555FF",  # MOV - blue
    0x33: "#44FF44",  # ADD - green
    0x34: "#FFAA44",  # SUB - orange
    0x35: "#FF44FF",  # MUL - magenta
    0x36: "#FF6666",  # DIV - red
    0x06: "#FFFF44",  # JMP - yellow
    0x07: "#FF4444",  # HALT - bright red
    0x08: "#44FFFF",  # LDI - cyan
    0x37: "#AAAAFF",  # CMP - lavender
    0x38: "#FF88AA",  # BEQ - pink
    0x47: "#AAFF88",  # LDP - light green
    0x48: "#FFAAAA",  # STP - light red
}


class GeometricPublisher:
    """
    Publishes PixelRTS v3 execution events to WordPress semantic district.

    Features:
    - Execution trace logging (journal posts)
    - Program snapshots (documentation pages)
    - Telemetry pulses to Visual Bridge
    - Rate limiting (30s between posts)
    """

    def __init__(self, telemetry_port: int = 8768):
        self.telemetry_port = telemetry_port
        self.last_publish_time = 0
        self.min_publish_interval = 30  # seconds
        self.execution_count = 0

    def _can_publish(self) -> bool:
        """Check rate limiting."""
        elapsed = time.time() - self.last_publish_time
        return elapsed >= self.min_publish_interval

    def _format_instruction(self, r: int, g: int, b: int, a: int) -> str:
        """Format RGBA instruction as human-readable HTML."""
        op_name = OPCODES.get(r, "???")
        color = OPCODE_COLORS.get(r, "#888888")

        if r == 0x08:  # LDI
            return f'<span style="color:{color}"><b>LDI</b> r{a}, {g}</span>'
        elif r in [0x33, 0x34, 0x35, 0x36, 0x37]:  # ADD, SUB, MUL, DIV, CMP
            return f'<span style="color:{color}"><b>{op_name}</b> r{a}, r{g}, r{b}</span>'
        elif r == 0x38:  # BEQ
            return f'<span style="color:{color}"><b>BEQ</b> r{g}, r{b}, {a}</span>'
        elif r == 0x47:  # LDP
            return f'<span style="color:{color}"><b>LDP</b> r{a}, r{g}</span>'
        elif r == 0x48:  # STP
            return f'<span style="color:{color}"><b>STP</b> r{g}, r{a}</span>'
        elif r == 0x01:  # MOV
            return f'<span style="color:{color}"><b>MOV</b> r{a}, r{g}</span>'
        elif r == 0x06:  # JMP
            return f'<span style="color:{color}"><b>JMP</b> {g}</span>'
        elif r == 0x07:  # HALT
            return f'<span style="color:{color}"><b>HALT</b></span>'
        else:
            return f'<span style="color:#888">RGBA({r}, {g}, {b}, {a})</span>'

    def _send_telemetry(self, event_type: str, data: Dict[str, Any]) -> bool:
        """Send telemetry pulse to Visual Bridge."""
        if not TELEMETRY_AVAILABLE:
            return False

        try:
            payload = {
                "type": event_type,
                "source": "geometric_publisher",
                "timestamp": datetime.now().isoformat(),
                "data": data
            }
            # Visual Bridge WebSocket endpoint
            # Note: This would need actual WebSocket client for full integration
            # For now, we log to a telemetry file that Visual Bridge can read
            telemetry_dir = os.path.join(os.path.dirname(__file__), "telemetry")
            os.makedirs(telemetry_dir, exist_ok=True)

            telemetry_file = os.path.join(telemetry_dir, f"geometric_{int(time.time())}.json")
            with open(telemetry_file, 'w') as f:
                json.dump(payload, f, indent=2)

            return True
        except Exception as e:
            print(f"Telemetry error: {e}")
            return False

    def log_execution(self,
                      program_name: str,
                      instructions: List[List[int]],
                      registers: List[int],
                      steps: int,
                      pc: int,
                      halted: bool,
                      force: bool = False) -> Optional[Dict]:
        """
        Log a PixelRTS v3 execution to WordPress.

        Args:
            program_name: Name/identifier of the program
            instructions: List of [R, G, B, A] instruction tuples
            registers: Final register state (32 registers)
            steps: Number of execution steps
            pc: Final program counter
            halted: Whether program halted normally
            force: Skip rate limiting

        Returns:
            WordPress response dict or None
        """
        if not WP_AVAILABLE:
            print("WordPress not available, skipping publish")
            return None

        if not force and not self._can_publish():
            print(f"Rate limited: {self.min_publish_interval - (time.time() - self.last_publish_time):.0f}s remaining")
            return None

        self.execution_count += 1
        self.last_publish_time = time.time()

        # Build execution trace HTML
        content_parts = [
            '<div class="geometric-execution">',
            f'<h3>📊 Execution Report: {program_name}</h3>',
            f'<p><b>Timestamp:</b> {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}</p>',
            f'<p><b>Status:</b> {"🟢 HALTED" if halted else "🔴 RUNNING"}</p>',
            f'<p><b>Steps:</b> {steps} | <b>PC:</b> {pc}</p>',
            '',
            '<h4>📜 Instruction Trace</h4>',
            '<table style="border-collapse:collapse; font-family:monospace;">',
            '<tr style="background:#222; color:#888;"><th>d</th><th>Instruction</th><th>RGBA</th></tr>',
        ]

        for i, (r, g, b, a) in enumerate(instructions[:20]):  # Limit to 20
            bg_color = "#1a1a25" if i % 2 == 0 else "#151520"
            pc_marker = " 👈 PC" if i == pc else ""
            inst_html = self._format_instruction(r, g, b, a)
            content_parts.append(
                f'<tr style="background:{bg_color};"><td>{i}</td>'
                f'<td>{inst_html}{pc_marker}</td>'
                f'<td style="color:#666;">[{r}, {g}, {b}, {a}]</td></tr>'
            )

        if len(instructions) > 20:
            content_parts.append(f'<tr><td colspan="3" style="color:#666;">... and {len(instructions) - 20} more</td></tr>')

        content_parts.extend([
            '</table>',
            '',
            '<h4>📋 Register State</h4>',
            '<div style="display:grid; grid-template-columns:repeat(8, 1fr); gap:4px; font-family:monospace; font-size:11px;">',
        ])

        for i, val in enumerate(registers[:32]):
            active_style = "background:#1a3a1a; color:#4f4;" if val != 0 else "background:#151520; color:#666;"
            content_parts.append(
                f'<div style="{active_style} padding:4px; text-align:center;">'
                f'r{i}<br><b>{val}</b></div>'
            )

        content_parts.extend([
            '</div>',
            '</div>',
        ])

        title = f"🧮 Geometric Execution #{self.execution_count}: {program_name}"
        content = "\n".join(content_parts)

        # Publish to WordPress
        result = publish_to_wordpress(title, content, post_type='post')

        # Send telemetry pulse
        self._send_telemetry("evolution_event", {
            "program": program_name,
            "steps": steps,
            "halted": halted,
            "final_pc": pc,
            "non_zero_registers": sum(1 for r in registers if r != 0)
        })

        return result

    def publish_program_page(self,
                             program_name: str,
                             instructions: List[List[int]],
                             description: str = "") -> Optional[Dict]:
        """
        Publish a program as a documentation page (permanent reference).

        Args:
            program_name: Program identifier
            instructions: Full instruction list
            description: Human-readable description

        Returns:
            WordPress response dict or None
        """
        if not WP_AVAILABLE:
            return None

        content_parts = [
            '<div class="geometric-program-doc">',
            f'<h3>📖 Program Reference: {program_name}</h3>',
            f'<p>{description or "No description provided."}</p>',
            f'<p><b>Total Instructions:</b> {len(instructions)}</p>',
            '',
            '<h4>🔧 Source Code (PASM Equivalent)</h4>',
            '<pre style="background:#0a0a0f; padding:12px; border-radius:4px; overflow-x:auto;">',
        ]

        for i, (r, g, b, a) in enumerate(instructions):
            inst_html = self._format_instruction(r, g, b, a)
            # Strip HTML tags for pre block
            import re
            clean_inst = re.sub(r'<[^>]+>', '', inst_html)
            content_parts.append(f'{i:3d}: {clean_inst}')

        content_parts.extend([
            '</pre>',
            '',
            '<h4>🎨 RGBA Encoding</h4>',
            '<table style="border-collapse:collapse; font-family:monospace; font-size:12px;">',
            '<tr style="background:#222;"><th>Ch</th><th>Role</th><th>Range</th></tr>',
            '<tr><td style="color:#f88;">R</td><td>Opcode</td><td>0-255</td></tr>',
            '<tr><td style="color:#8f8;">G</td><td>RS1/Imm</td><td>0-31 / 0-255</td></tr>',
            '<tr><td style="color:#88f;">B</td><td>RS2</td><td>0-31</td></tr>',
            '<tr><td style="color:#888;">A</td><td>RD</td><td>0-31</td></tr>',
            '</table>',
            '</div>',
        ])

        title = f"📘 {program_name}"
        content = "\n".join(content_parts)

        return publish_to_wordpress(title, content, post_type='page')

    def log_breakthrough(self,
                         title: str,
                         description: str,
                         metrics: Dict[str, Any]) -> Optional[Dict]:
        """
        Log a breakthrough event (evolution milestone, fitness improvement, etc.).

        Args:
            title: Breakthrough title
            description: Detailed description
            metrics: Key metrics/numbers

        Returns:
            WordPress response dict or None
        """
        if not WP_AVAILABLE:
            return None

        content_parts = [
            '<div class="geometric-breakthrough">',
            f'<h3>🚀 {title}</h3>',
            f'<p>{description}</p>',
            '',
            '<h4>📊 Key Metrics</h4>',
            '<ul>',
        ]

        for key, value in metrics.items():
            content_parts.append(f'<li><b>{key}:</b> {value}</li>')

        content_parts.extend([
            '</ul>',
            f'<p><i>Logged at {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}</i></p>',
            '</div>',
        ])

        result = publish_to_wordpress(f"🚀 {title}", "\n".join(content_parts), post_type='post')

        # Send diagnostic pulse
        self._send_telemetry("diagnostic_pulse", {
            "event": "breakthrough",
            "title": title,
            "metrics": metrics
        })

        return result


def demo():
    """Demo: Publish a geometric execution."""
    publisher = GeometricPublisher()

    # Simulate a PixelRTS execution
    instructions = [
        [0x08, 10, 0, 1],   # LDI r1, 10
        [0x08, 20, 0, 2],   # LDI r2, 20
        [0x33, 1, 2, 3],    # ADD r3, r1, r2
        [0x08, 5, 0, 4],    # LDI r4, 5
        [0x35, 3, 4, 5],    # MUL r5, r3, r4
        [0x07, 0, 0, 0],    # HALT
    ]

    registers = [0, 10, 20, 30, 5, 150] + [0] * 26

    print("Publishing execution trace...")
    result = publisher.log_execution(
        program_name="hello_multiply.pasm",
        instructions=instructions,
        registers=registers,
        steps=6,
        pc=5,
        halted=True,
        force=True
    )

    if result:
        print(f"Published! URL: {result.get('url')}")

    print("\nPublishing program page...")
    page_result = publisher.publish_program_page(
        program_name="hello_multiply.pasm",
        instructions=instructions,
        description="Demo program: Calculate (10 + 20) * 5 = 150"
    )

    if page_result:
        print(f"Page created! URL: {page_result.get('url')}")


if __name__ == "__main__":
    demo()
