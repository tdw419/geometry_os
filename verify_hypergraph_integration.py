#!/usr/bin/env python3
"""
Verification script for OMNI-GEOMETRY hyper-graph integration
Checks that the hyper-graph data is properly stored in the main CTRM database
"""

import sqlite3
import json

def verify_hypergraph_integration():
    """Verify that hyper-graph tables exist and contain data"""

    print("🔍 Verifying OMNI-GEOMETRY hyper-graph integration...")
    print("=" * 60)

    # Connect to main database
    conn = sqlite3.connect('ctrm_llm_os.db')
    cursor = conn.cursor()

    # Check if hyper-graph tables exist
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    tables = cursor.fetchall()
    table_names = [table[0] for table in tables]

    print("📋 Database tables found:")
    for table in sorted(table_names):
        print(f"   - {table}")

    # Check hyper-graph specific tables
    required_tables = ['hyper_graph_nodes', 'hyper_graph_edges']
    missing_tables = []

    for table in required_tables:
        if table not in table_names:
            missing_tables.append(table)

    if missing_tables:
        print(f"❌ Missing hyper-graph tables: {missing_tables}")
        return False
    else:
        print("✅ All required hyper-graph tables exist")

    # Check node count
    cursor.execute("SELECT COUNT(*) FROM hyper_graph_nodes")
    node_count = cursor.fetchone()[0]
    print(f"📊 Hyper-graph nodes: {node_count}")

    # Check edge count
    cursor.execute("SELECT COUNT(*) FROM hyper_graph_edges")
    edge_count = cursor.fetchone()[0]
    print(f"🔗 Hyper-graph edges: {edge_count}")

    if node_count > 0 and edge_count > 0:
        print("✅ Hyper-graph data successfully integrated")

        # Show some sample data
        print(f"\n📝 Sample node data:")
        cursor.execute("SELECT id, name, file_path FROM hyper_graph_nodes LIMIT 3")
        sample_nodes = cursor.fetchall()

        for node_id, name, file_path in sample_nodes:
            print(f"   - {name} ({file_path})")
            print(f"     ID: {node_id}")

        print(f"\n🔗 Sample edge data:")
        cursor.execute("""
            SELECT source_id, target_id, strength, edge_type
            FROM hyper_graph_edges
            LIMIT 3
        """)
        sample_edges = cursor.fetchall()

        for source_id, target_id, strength, edge_type in sample_edges:
            print(f"   - {source_id[:8]}... -> {target_id[:8]}... (strength: {strength:.3f}, type: {edge_type})")

        return True
    else:
        print("❌ No hyper-graph data found")
        return False

def test_hypergraph_queries():
    """Test that we can perform semantic queries on the hyper-graph"""

    print(f"\n🧪 Testing hyper-graph semantic queries...")
    print("=" * 40)

    conn = sqlite3.connect('ctrm_llm_os.db')
    cursor = conn.cursor()

    # Test 1: Find nodes with specific content
    cursor.execute("""
        SELECT name, file_path
        FROM hyper_graph_nodes
        WHERE content LIKE '%CTRM%'
        LIMIT 3
    """)
    ctrm_nodes = cursor.fetchall()
    print(f"🔍 Found {len(ctrm_nodes)} nodes containing 'CTRM'")

    # Test 2: Find strongly connected nodes
    cursor.execute("""
        SELECT source_id, target_id, strength
        FROM hyper_graph_edges
        WHERE strength > 0.7
        LIMIT 3
    """)
    strong_connections = cursor.fetchall()
    print(f"💪 Found {len(strong_connections)} strong connections (strength > 0.7)")

    # Test 3: Get statistics
    cursor.execute("""
        SELECT
            AVG(strength) as avg_strength,
            MIN(strength) as min_strength,
            MAX(strength) as max_strength
        FROM hyper_graph_edges
    """)
    stats = cursor.fetchone()
    print(f"📊 Connection statistics:")
    print(f"   Average strength: {stats[0]:.3f}")
    print(f"   Minimum strength: {stats[1]:.3f}")
    print(f"   Maximum strength: {stats[2]:.3f}")

    return True

if __name__ == "__main__":
    success = verify_hypergraph_integration()

    if success:
        test_hypergraph_queries()
        print(f"\n🎉 OMNI-GEOMETRY integration verification complete!")
        print("✅ The hyper-graph is ready for daemon assimilation")
    else:
        print(f"\n❌ OMNI-GEOMETRY integration verification failed!")
        exit(1)