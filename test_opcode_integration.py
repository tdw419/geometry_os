"""
Verify Opcode-Enhanced Distillation
Tests the integration of OpcodeRegistry and KnowledgeDistiller.
"""

import asyncio
from runtime.knowledge_distiller import KnowledgeDistiller

async def test_opcode_distillation():
    print("🧪 Testing Opcode-Enhanced Distillation...")
    
    # Initialize Distiller
    distiller = KnowledgeDistiller("test_opcode_distillation.db")
    
    # Run Distillation with Opcodes
    domain = "AI Ethics"
    opcode = "DOMAIN_MENTAL_EXPLORATION"
    
    print(f"\n🧠 Running distillation for '{domain}' with opcode '{opcode}'...")
    knowledge_ids = await distiller.distill_domain_with_opcodes(
        domain=domain,
        opcode_name=opcode,
        num_concepts=3 # Small number for testing
    )
    
    print(f"\n✅ Created {len(knowledge_ids)} knowledge vectors.")
    print("Verifying vector metadata...")
    
    # Verify metadata contains opcode info
    cursor = distiller.conn.cursor()
    for kid in knowledge_ids:
        cursor.execute("SELECT concept, metadata FROM knowledge_vectors WHERE id = ?", (kid,))
        row = cursor.fetchone()
        print(f"   - {row['concept']}: {row['metadata']}")

if __name__ == "__main__":
    asyncio.run(test_opcode_distillation())
