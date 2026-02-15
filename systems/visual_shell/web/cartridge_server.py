# systems/visual_shell/web/cartridge_server.py
"""
Cartridge HTTP Server

Provides HTTP endpoint for cartridge assembly and deployment.
Used by WebMCP ide_deploy tool.

Endpoints:
  GET  /health              - Health check
  POST /cartridge/deploy    - Deploy cartridge (assemble + location)
  POST /cartridge/assemble  - Assemble only
"""

import json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
import sys

# Try to import cartridge_bridge (Task 2) - use mock if not available
try:
    from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request
    BRIDGE_AVAILABLE = True
except ImportError:
    BRIDGE_AVAILABLE = False
    # Mock handler for testing when bridge is not yet implemented
    def handle_cartridge_request(request):
        """Mock cartridge bridge handler for testing."""
        action = request.get("action", "assemble")
        name = request.get("name", "unnamed")
        files = request.get("files", [])

        if not files:
            return {
                "success": False,
                "error": "No files provided"
            }

        # Return mock PNG data (small valid 1x1 PNG)
        import base64
        mock_png = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x02\x00\x00\x00\x90wS\xDE\x00\x00\x00\x0cIDATx\x9cc\x00\x01\x00\x00\x05\x00\x01\r\n-\xb4\x00\x00\x00\x00IEND\xaeB`\x82'

        result = {
            "success": True,
            "cartridge": {
                "format": "png",
                "data": base64.b64encode(mock_png).decode('ascii'),
                "size_bytes": len(mock_png),
                "name": name
            }
        }

        if action == "deploy":
            location = request.get("location", {"x": 0, "y": 0})
            result["location"] = location
            result["deployed"] = True

        return result


class CartridgeHandler(BaseHTTPRequestHandler):
    """HTTP request handler for cartridge operations."""

    def log_message(self, format, *args):
        """Custom logging."""
        print(f"[CartridgeServer] {format % args}")

    def do_GET(self):
        """Handle GET requests."""
        path = urlparse(self.path).path

        if path == "/health":
            self._send_json({"status": "ok", "service": "cartridge-server"})
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

        if path == "/cartridge/deploy":
            request["action"] = "deploy"
            result = handle_cartridge_request(request)
            self._send_json(result)
        elif path == "/cartridge/assemble":
            request["action"] = "assemble"
            result = handle_cartridge_request(request)
            self._send_json(result)
        else:
            self._send_error(404, "Not found")

    def _send_json(self, data, status=200):
        """Send JSON response with CORS headers."""
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

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


def run_server(port=8766):
    """Run the cartridge server."""
    server = HTTPServer(("localhost", port), CartridgeHandler)
    print(f"Cartridge server running on http://localhost:{port}")
    print("Endpoints:")
    print("  GET  /health              - Health check")
    print("  POST /cartridge/deploy    - Deploy cartridge")
    print("  POST /cartridge/assemble  - Assemble only")
    if BRIDGE_AVAILABLE:
        print("  Using real cartridge_bridge")
    else:
        print("  Using mock cartridge_bridge (Task 2 not yet implemented)")
    server.serve_forever()


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8766
    run_server(port)
