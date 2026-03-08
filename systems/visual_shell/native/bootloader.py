"""
Native Visual Shell Bootloader
Initializes the GeoASM hypervisor and starts the native rendering loop.
"""

import time
import sys
import os
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.visual_shell.api.native_api import NativeVisualShellAPI, UIEntity

def boot_native_shell():
    print("🚀 Booting Geometry OS Native Visual Shell...")
    
    api = NativeVisualShellAPI()
    
    # 1. Initialize Desktop State
    print("  Initializing desktop substrate...")
    api.add_entity(UIEntity(id="bg", type="panel", x=0, y=0, width=1024, height=1024, color=(5, 5, 10, 255)))
    
    # 2. Add some test entities
    print("  Populating entities...")
    api.add_entity(UIEntity(id="main_panel", type="panel", x=100, y=100, width=600, height=400, color=(30, 30, 50, 200)))
    
    # Add file orbs in a spiral
    for i in range(20):
        api.add_entity(UIEntity(
            id=f"file_{i}",
            type="orb",
            x=512, # Center - layout engine will move them
            y=512,
            color=(255, 215, 0, 255) if i % 5 == 0 else (0, 206, 209, 255)
        ))
    
    # 3. Simulate Rendering Loop
    print("  Entering execution loop...")
    try:
        frame = 0
        while True:
            # Update state (conceptual)
            # api.calculate_layout(None)
            
            # Compose GeoASM frame
            # frame_code = api.compose_frame()
            
            # Dispatch to hypervisor (Conceptual)
            # hypervisor.execute(frame_code)
            
            if frame % 60 == 0:
                print(f"  [Frame {frame}] Rendering {len(api.entities)} glyphs...")
            
            time.sleep(1/60.0)
            frame += 1
            
            if frame > 180: # Run for 3 seconds in PoC
                break
                
    except KeyboardInterrupt:
        pass
        
    print("🏁 Native Shell Shutdown.")

if __name__ == "__main__":
    boot_native_shell()
