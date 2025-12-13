
import sys
import os
import sqlite3
import time
import numpy as np

# Ensure we can import our tools
sys.path.append(os.getcwd())
from geometry_os.nexus import Nexus
from geometry_os.nexus_loader import install_hook

DB_PATH = "geometry_os/demos/persistent_demo.db"

def test_holographic_import():
    print("🧪 Initiating Holographic Import Test...")
    
    # 1. Create a "Virtual Module" in Nexus
    nexus = Nexus(DB_PATH)
    
    module_name = "phantom_logic"
    module_code = """
def hello_from_void():
    return "I exist without a file."

class Ghost:
    def boo(self):
        return "Ectoplasm found."
        
PARAM_OF_TRUTH = 42
"""
    
    # Store it as 'virtual_module'
    print(f"    -> Injecting '{module_name}' into Nexus...")
    # Clean up old run
    with sqlite3.connect(DB_PATH) as conn:
        conn.execute("DELETE FROM nodes WHERE type='virtual_module' AND metadata LIKE ?", (f'%{module_name}%',))
        conn.commit()
        
    nexus.db.store_node({
        "id": "hologram_001",
        "type": "virtual_module",
        "name": module_name,
        "content": module_code,
        "metadata": {"origin": "thought", "name": module_name},
        "vector": np.array([]), # Mock
        "provenance": "test"
    })
    
    # 2. Verify it's NOT on disk
    if os.path.exists(f"{module_name}.py"):
        print("❌ Error: File exists on disk! Delete it to prove the point.")
        return
    else:
        print(f"    -> Verified: '{module_name}.py' DOES NOT EXIST on disk.")
        
    # 3. Install Hook
    install_hook(DB_PATH)
    
    # 4. Import the Phantom
    print(f"    -> Attempting: import {module_name}")
    try:
        import phantom_logic
        print("✨ SUCCESS: Import successful!")
        
        # 5. Use it
        msg = phantom_logic.hello_from_void()
        print(f"       Function output: '{msg}'")
        
        g = phantom_logic.Ghost()
        print(f"       Class output:    '{g.boo()}'")
        print(f"       Constant:        {phantom_logic.PARAM_OF_TRUTH}")
        
        print(f"       Module File:     {phantom_logic.__file__}")
        
    except ImportError as e:
        print(f"❌ Failed to import: {e}")
    except Exception as e:
        print(f"❌ Runtime error: {e}")

if __name__ == "__main__":
    test_holographic_import()
