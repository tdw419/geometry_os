
import asyncio
import os
import shutil
import numpy as np
from runtime.sqlite_vector_blueprint import SQLiteVectorBlueprintDB

# Ensure clean slate
if os.path.exists("test_blueprints.db"):
    os.remove("test_blueprints.db")

def create_sample_blueprints_wrapper(db):
    """Wrapper to call the helper function or re-implement if not exported"""
    # Fallback implementation as helper is not exported
    samples = [
        ([255, 0, 0, 255], 0, "solid_red", "Pure red solid color"),
        ([0, 255, 0, 255], 0, "solid_green", "Pure green solid color"),
        ([0, 0, 255, 255], 0, "solid_blue", "Pure blue solid color"),
        ([255, 0, 0, 0, 0, 255], 1, "gradient_red_blue", "Red to blue gradient"),
        ([100, 150], 3, "fractal_complex", "Complex fractal pattern"),
        ([10], 4, "noise_fine", "Fine-grained noise"),
    ]
    for data, pattern_type, name, description in samples:
        db.create_blueprint(data, pattern_type, name, description, ["sample"])

def test_sqlite_blueprints():
    print("🚀 Initializing SQLite Vector Blueprint DB...")
    db = SQLiteVectorBlueprintDB("test_blueprints.db")
    
    print("\n📥 Loading sample blueprints...")
    # Create sample blueprints
    create_sample_blueprints_wrapper(db)
    
    # Search for similar patterns
    print("\n🔍 Searching for patterns similar to 'red':")
    results = db.search_similar(text_query="red", limit=3)
    for result in results:
        print(f"  {result['name']} - similarity: {result['similarity']:.3f} (type: {result['pattern_type']})")
    
    # Combine blueprints
    print("\n🔄 Combining red solid (bp_...) and blue solid (bp_...):")
    # Need to get actual IDs first
    cursor = db.conn.cursor()
    cursor.execute("SELECT id, name FROM blueprints WHERE name IN ('solid_red', 'solid_blue')")
    found_bps = {row['name']: row['id'] for row in cursor.fetchall()}
    
    if len(found_bps) >= 2:
        bp1_id = found_bps['solid_red']
        bp2_id = found_bps['solid_blue']
        new_id, new_data = db.combine_blueprints(bp1_id, bp2_id, 0.5)
        print(f"  Created new blended blueprint: {new_id} from {bp1_id} + {bp2_id}")
    else:
        print("  Skipping combination: red/blue blueprints not found")

    
    # Evolve a blueprint
    print("\n🧬 Evolving a fractal pattern...")
    cursor.execute("SELECT id FROM blueprints WHERE pattern_type = 3 LIMIT 1")
    fractal_row = cursor.fetchone()
    
    if fractal_row:
        fractal_id = fractal_row['id']
        evolved_ids = db.evolve_blueprint(fractal_id, mutation_rate=0.2, generations=3)
        print(f"  Evolved {fractal_id} to: {evolved_ids}")
    else:
        print("  Skipping evolution: no fractal blueprint found")
    
    # Cluster patterns
    print("\n📊 Clustering patterns...")
    # Reduce cluster count for small dataset
    clusters = db.cluster_blueprints(n_clusters=3)
    for cluster_id, group in clusters.items():
        print(f"  Cluster {cluster_id}: {group['count']} patterns")
    
    # Show statistics
    stats = db.get_statistics()
    print(f"\n📈 Database statistics:")
    print(f"  Total blueprints: {stats['total_blueprints']}")
    print(f"  Average quality: {stats['avg_quality']:.3f}")
    
    db.close()
    
    # Clean up
    if os.path.exists("test_blueprints.db"):
        os.remove("test_blueprints.db")

if __name__ == "__main__":
    test_sqlite_blueprints()
