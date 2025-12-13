
import asyncio
import os
import shutil
import numpy as np

# Ensure clean slate
if os.path.exists(".lancedb_blueprints"):
    shutil.rmtree(".lancedb_blueprints")

from runtime.vector_blueprint_db import VectorBlueprintDB

def test_vector_blueprints():
    print("🚀 Initializing Vector Blueprint DB...")
    db = VectorBlueprintDB()
    
    print("\n🧱 Creating test blueprints...")
    
    # 1. Sunset Gradient
    bp1_id = db.create_vector_blueprint(
        blueprint_data=[255, 100, 0, 0, 0, 128], 
        pattern_type=1,
        name="Sunset Gradient",
        description="A warm sunset gradient fading from orange to dark blue",
        tags=["warm", "nature", "smooth"]
    )
    print(f"Created: {bp1_id} (Sunset)")
    
    # 2. Cyberpunk Noise
    bp2_id = db.create_vector_blueprint(
        blueprint_data=[0, 255, 255, 50, 50, 50, 128], 
        pattern_type=4,
        name="Cyberpunk Static",
        description="Digital noise with neon cyan and glitch artifacts",
        tags=["tech", "glitch", "neon"]
    )
    print(f"Created: {bp2_id} (Cyberpunk)")

    # 3. Forest Fractal
    bp3_id = db.create_vector_blueprint(
        blueprint_data=[30, 80, 20, 100], 
        pattern_type=3,
        name="Forest Fractal",
        description="Recursive biological patterns in deep green",
        tags=["organic", "fractal", "nature"]
    )
    print(f"Created: {bp3_id} (Forest)")
    
    print("\n🔍 Testing Semantic Search ('warm colors')...")
    results = db.search_similar("something with warm colors", limit=1)
    if results:
        print(f"Match: {results[0]['metadata']}")
    else:
        print("No match found")
        
    print("\n🧬 Testing Blueprint Combination (Sunset + Cyberpunk)...")
    # Blend 50/50
    blended_data = db.combine_blueprints(bp1_id, bp2_id, blend_ratio=0.5)
    print(f"Blended Rules: {blended_data}")
    
    print("\n🔬 Testing Visual Similarity Search...")
    # Find what's visually similar to the Forest Fractal
    vis_results = db.search_visual_similar(bp3_id, limit=1)
    if vis_results:
        print(f"Visually Similar: {vis_results[0]['id']}")
    else:
        print("No visually similar blueprints found (expected with small DB)")

if __name__ == "__main__":
    test_vector_blueprints()
