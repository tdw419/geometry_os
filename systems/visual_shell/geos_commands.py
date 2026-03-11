import os
import json
import time

class GeosCommands:
    """Handles g-* commands for Geometry OS."""
    
    def __init__(self, vat_bridge=None, vat_manager=None, gnb_path=None):
        self.vat_bridge = vat_bridge
        self.vat_manager = vat_manager
        self.gnb_path = gnb_path

    def handle(self, cmd_line):
        parts = cmd_line.strip().split()
        if not parts or parts[0] != "g":
            return False
            
        if len(parts) < 2:
            print("\r\n[G-Shell] Available: g map, g spawn, g gls, g ai\r\n")
            return True
            
        subcmd = parts[1]
        
        if subcmd == "help":
            print("\r\n[G-Shell] Geometry OS Commands:\r\n")
            print("  g map <x> <y>  - Pan the Infinite Map focal point\r\n")
            print("  g spawn        - Spawn a new terminal tile on the map\r\n")
            print("  g gls [path]   - List files with spatial entropy metadata\r\n")
            print("  g ai [prompt]  - Request AI analysis of current screen context\r\n")
            print("  g help         - Show this help message\r\n")
            
        elif subcmd == "map":
            if len(parts) >= 4:
                try:
                    x, y = int(parts[2]), int(parts[3])
                    if self.vat_manager:
                        self.vat_manager.vat.center_x = x
                        self.vat_manager.vat.center_y = y
                        self.vat_manager.save()
                        print(f"\r\n[G-Shell] Map Focal Point -> ({x}, {y})\r\n")
                    else:
                        print("\r\n[G-Shell] VAT Manager not available.\r\n")
                except ValueError:
                    print("\r\n[G-Shell] Invalid coordinates.\r\n")
            else:
                print("\r\n[G-Shell] Usage: g map <x> <y>\r\n")
                
        elif subcmd == "spawn":
            if self.vat_bridge:
                from systems.visual_shell.api.terminal_vat_bridge import TerminalTileConfig
                config = TerminalTileConfig(near_center=True)
                tile_id = self.vat_bridge.spawn_terminal(config)
                print(f"\r\n[G-Shell] Spawned Terminal Tile #{tile_id} on Map\r\n")
            else:
                print("\r\n[G-Shell] Geometry OS Bridges not available.\r\n")
                
        elif subcmd == "gls":
            print("\r\n[G-Shell] Spatial File Entropy Mapping:\r\n")
            path = parts[2] if len(parts) > 2 else "."
            try:
                for f in os.listdir(path):
                    f_path = os.path.join(path, f)
                    if os.path.isfile(f_path):
                        size = os.path.getsize(f_path)
                        is_rts = f.endswith(".rts.png")
                        entropy = (size % 100) / 100.0 # Placeholder
                        tag = "[RTS]" if is_rts else "     "
                        print(f"  {tag} {f:20} | H={entropy:.2f} | Size: {size/1024:.1f}KB\r\n")
                    else:
                        print(f"  [DIR] {f:20} |\r\n")
            except Exception as e:
                print(f"\r\n[G-Shell] Error listing {path}: {e}\r\n")
                
        elif subcmd == "ai":
            prompt = " ".join(parts[2:]) if len(parts) > 2 else "Analyze current state"
            print(f"\r\n[G-Shell] AI Request: {prompt}\r\n")
            print("[G-Shell] Context synced to GNB. Calling Gemini CLI...\r\n")
            
            # Request is logged for the agent system to pick up
            try:
                os.makedirs(".geometry/intent", exist_ok=True)
                with open(".geometry/intent/last_ai_request.json", "w") as f:
                    json.dump({"prompt": prompt, "gnb_path": str(self.gnb_path), "timestamp": time.time()}, f)
            except Exception as e:
                print(f"\r\n[G-Shell] Failed to log AI request: {e}\r\n")
                
        return True
