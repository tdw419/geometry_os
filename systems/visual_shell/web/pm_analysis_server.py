# systems/visual_shell/web/pm_analysis_server.py
"""
AI PM Analysis HTTP Server

Provides HTTP endpoint for AI PM analysis and autonomous deployment.
Bridges WebMCP to the ContinuousImprovementModule.

Endpoints:
  GET  /health              - Health check
  POST /pm/analyze          - Get improvement recommendations
  POST /pm/analyze_and_deploy - Analyze and optionally deploy fixes
"""

import json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
import sys
from pathlib import Path
from typing import Dict, Any, List, Optional

# Try to import AI PM modules
try:
    from ai_project_management.src.ai_project_management.improvement.module import (
        ContinuousImprovementModule,
        ImprovementRecommendation
    )
    AI_PM_AVAILABLE = True
except ImportError:
    AI_PM_AVAILABLE = False

# Try to import cartridge bridge
try:
    from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request
    CARTRIDGE_BRIDGE_AVAILABLE = True
except ImportError:
    CARTRIDGE_BRIDGE_AVAILABLE = False


class PMAnalysisHandler(BaseHTTPRequestHandler):
    """HTTP request handler for AI PM analysis operations."""

    def log_message(self, format, *args):
        """Custom logging."""
        print(f"[PMAnalysisServer] {format % args}")

    def do_GET(self):
        """Handle GET requests."""
        path = urlparse(self.path).path

        if path == "/health":
            self._send_json({
                "status": "ok",
                "service": "pm-analysis-server",
                "ai_pm_available": AI_PM_AVAILABLE,
                "cartridge_bridge_available": CARTRIDGE_BRIDGE_AVAILABLE
            })
        else:
            self._send_error(404, "Not found")

    def do_POST(self):
        """Handle POST requests."""
        path = urlparse(self.path).path
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length)

        try:
            request = json.loads(body)
        except json.JSONDecodeError:
            self._send_error(400, "Invalid JSON")
            return

        if path == "/pm/analyze":
            result = self._handle_analyze(request)
            self._send_json(result)
        elif path == "/pm/analyze_and_deploy":
            result = self._handle_analyze_and_deploy(request)
            self._send_json(result)
        else:
            self._send_error(404, "Not found")

    def _handle_analyze(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle analyze request."""
        if not AI_PM_AVAILABLE:
            return self._mock_analyze(request)

        try:
            # Initialize improvement module
            pm = ContinuousImprovementModule(
                telemetry_path=Path(".ai-pm-telemetry"),
                knowledge_base_path=Path(".ai-pm-knowledge")
            )

            # Run analysis (mock execution state for now)
            from ai_project_management.src.ai_project_management.models import ExecutionState
            state = ExecutionState()

            # Run async improvement cycle
            import asyncio
            recommendations = asyncio.run(pm.run_improvement_cycle(state))

            # Convert to serializable format
            recs_data = [
                {
                    "id": r.id,
                    "type": r.type,
                    "priority": r.priority,
                    "description": r.description,
                    "target_path": r.target_path,
                    "estimated_impact": r.estimated_impact,
                    "confidence": r.confidence
                }
                for r in recommendations
            ]

            max_recs = request.get("max_recommendations", 10)
            recs_data = recs_data[:max_recs]

            return {
                "success": True,
                "recommendations": recs_data,
                "count": len(recs_data),
                "neuromodulation": pm.get_modulation_state().model_dump()
            }

        except Exception as e:
            return {"success": False, "error": str(e), "recommendations": []}

    def _mock_analyze(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Mock analysis when AI PM not available."""
        recommendations = [
            {
                "id": "mock-optimize-1",
                "type": "optimize",
                "priority": "MEDIUM",
                "description": "Mock: Optimize Hilbert curve lookup performance",
                "target_path": "systems/pixel_compiler/pixelrts_v2_core.py",
                "estimated_impact": 0.8,
                "confidence": 0.7
            },
            {
                "id": "mock-refactor-1",
                "type": "refactor",
                "priority": "LOW",
                "description": "Mock: Extract common patterns from cartridge assembly",
                "target_path": "systems/pixel_compiler/cartridge_assembly.py",
                "estimated_impact": 0.5,
                "confidence": 0.6
            }
        ]

        max_recs = request.get("max_recommendations", 10)
        return {
            "success": True,
            "recommendations": recommendations[:max_recs],
            "count": min(len(recommendations), max_recs),
            "mock": True
        }

    def _handle_analyze_and_deploy(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle analyze and deploy request."""
        # First analyze
        analyze_result = self._handle_analyze(request)

        if not analyze_result.get("success"):
            return analyze_result

        recommendations = analyze_result.get("recommendations", [])
        auto_deploy = request.get("auto_deploy", False)
        cartridge_name = request.get("cartridge_name", "auto_improvement")

        # If not auto-deploying, just return analysis
        if not auto_deploy:
            return {
                "success": True,
                "recommendations": recommendations,
                "deployed": False,
                "message": "Analysis complete. Set auto_deploy=true to deploy."
            }

        # Auto-deploy: create cartridge from recommendations
        if not CARTRIDGE_BRIDGE_AVAILABLE:
            return {
                "success": False,
                "error": "Cartridge bridge not available for deployment",
                "recommendations": recommendations
            }

        # Convert recommendations to "source files" (metadata for now)
        source_files = [
            {
                "path": f"recommendation_{i}.json",
                "content": __import__("base64").b64encode(
                    json.dumps(rec).encode()
                ).decode()
            }
            for i, rec in enumerate(recommendations)
        ]

        deploy_result = handle_cartridge_request({
            "action": "deploy",
            "name": cartridge_name,
            "files": source_files,
            "description": f"Auto-generated from {len(recommendations)} recommendations",
            "location": request.get("location", {"x": 0, "y": 0})
        })

        return {
            "success": deploy_result.get("success", False),
            "recommendations": recommendations,
            "deployed": deploy_result.get("success", False),
            "cartridge": deploy_result.get("cartridge"),
            "location": deploy_result.get("location")
        }

    def _send_json(self, data, status=200):
        """Send JSON response with CORS headers."""
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        self.wfile.write(json.dumps(data, default=str).encode())

    def _send_error(self, code, message):
        """Send error response."""
        self._send_json({"success": False, "error": message}, code)

    def do_OPTIONS(self):
        """Handle OPTIONS for CORS preflight."""
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()


def run_server(port=8769):
    """Run the PM analysis server."""
    server = HTTPServer(("localhost", port), PMAnalysisHandler)
    print(f"PM Analysis server running on http://localhost:{port}")
    print("Endpoints:")
    print("  GET  /health              - Health check")
    print("  POST /pm/analyze          - Get recommendations")
    print("  POST /pm/analyze_and_deploy - Analyze and deploy")
    if AI_PM_AVAILABLE:
        print("  AI PM: AVAILABLE")
    else:
        print("  AI PM: NOT AVAILABLE (using mock)")
    server.serve_forever()


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8769
    run_server(port)
