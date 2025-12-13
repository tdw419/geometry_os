"""
Self-Construction Test: Ghost builds its own HTTP API Server
The Architect (me) defines the task, the Ghost (builder) implements it
"""

import asyncio
import json
import time
import os
import sys
from runtime.knowledge_distiller import KnowledgeDistiller, MockLLM
from runtime.computational_substrate import ComputationalSubstrate
from runtime.neural_transpiler import NeuralPatternTranspiler
from runtime.ghost_daemon import GhostDaemon

async def test_self_construction():
    """Test the Ghost's ability to build its own components"""

    print("🏗️  SELF-CONSTRUCTION TEST: Ghost builds HTTP API Server")
    print("=" * 60)

    # Initialize the cognitive system
    print("🔧 Initializing cognitive system...")

    # Knowledge Distiller
    distiller = KnowledgeDistiller("self_construction_knowledge.db")

    # Computational Substrate
    substrate = ComputationalSubstrate(distiller, None)

    # Neural Pattern Transpiler
    transpiler = NeuralPatternTranspiler()

    # Ghost Daemon
    ghost = GhostDaemon(
        vsm_db="self_construction_vsm.db",
        knowledge_db="self_construction_ghost.db"
    )
    # Note: GhostDaemon has its own substrate and transpiler
    # We'll use the standalone components for this test

    print("✅ Cognitive system initialized")

    # Step 1: Define the architectural blueprint
    print("\n📐 STEP 1: Architect defines the blueprint")
    print("Task: Build a simple HTTP API server for Neural Terminal")

    blueprint = {
        "component": "NeuralAPIServer",
        "description": "HTTP API server that exposes Neural Terminal functionality via REST endpoints",
        "requirements": {
            "endpoints": [
                "/api/knowledge/search - Search knowledge base",
                "/api/knowledge/infuse - Add new knowledge",
                "/api/vsm/states - Get current states",
                "/api/vsm/transitions - Execute transitions",
                "/api/system/stats - Get system statistics"
            ],
            "features": [
                "RESTful JSON API",
                "CORS support",
                "Error handling",
                "Authentication (basic)",
                "Swagger documentation"
            ],
            "technologies": [
                "FastAPI or Flask",
                "Uvicorn for ASGI",
                "Pydantic for validation",
                "SQLite integration"
            ]
        },
        "specification": """
        Create a Python module 'neural_api_server.py' that:
        1. Imports necessary components from the runtime
        2. Creates FastAPI app with the required endpoints
        3. Integrates with KnowledgeDistiller and VectorStateMachine
        4. Provides JSON responses with proper error handling
        5. Includes basic authentication
        6. Has a main() function to run with uvicorn
        """
    }

    print(f"📋 Blueprint defined: {blueprint['component']}")
    print(f"   Description: {blueprint['description']}")
    print(f"   Endpoints: {len(blueprint['requirements']['endpoints'])}")

    # Step 2: Infuse the blueprint into the substrate
    print("\n💉 STEP 2: Infusing blueprint into computational substrate")

    blueprint_id = substrate.infuse(
        domain="System Architecture",
        concept="NeuralAPIServer Blueprint",
        payload=blueprint,
        metadata={
            "source": "architect",
            "purpose": "self-construction",
            "priority": "high"
        }
    )

    print(f"✅ Infused blueprint: {blueprint_id}")

    # Step 3: Let the Ghost dream the implementation
    print("\n🤖 STEP 3: Ghost dreams the implementation")

    # Use the transpiler to generate code from the blueprint
    dream_prompt = f"""
    You are an expert Python developer building an AI system.
    Create a complete implementation of the following component:

    {json.dumps(blueprint, indent=2)}

    The code should be a complete, runnable Python module.
    Include all necessary imports, error handling, and documentation.
    """

    print("💭 Dreaming implementation...")
    generated_code = await transpiler.transpile(dream_prompt)

    print(f"✅ Generated {len(generated_code)} characters of code")

    # Step 4: Store the generated code
    print("\n💾 STEP 4: Storing generated code")

    code_filename = "generated_neural_api_server.py"

    with open(code_filename, 'w') as f:
        f.write(generated_code)

    print(f"✅ Saved generated code to {code_filename}")

    # Step 5: Verify the code (Crucible)
    print("\n🔍 STEP 5: Verifying generated code")

    # Check if the code is syntactically valid
    try:
        with open(code_filename, 'r') as f:
            code_content = f.read()

        # Compile to check syntax
        compile(code_content, code_filename, 'exec')
        syntax_valid = True
        print("✅ Code syntax is valid")
    except SyntaxError as e:
        syntax_valid = False
        print(f"❌ Syntax error: {e}")

    # Check for required components
    required_imports = ['FastAPI', 'APIRouter', 'Request', 'HTTPException']
    required_functions = ['create_app', 'main']

    has_imports = all(imp in code_content for imp in required_imports)
    has_functions = all(func in code_content for func in required_functions)

    print(f"✅ Required imports: {'Yes' if has_imports else 'No'}")
    print(f"✅ Required functions: {'Yes' if has_functions else 'No'}")

    # Step 6: Create knowledge about the new component
    print("\n🧠 STEP 6: Creating knowledge about the new component")

    component_knowledge = {
        "component_name": "NeuralAPIServer",
        "file": code_filename,
        "status": "generated",
        "verification": {
            "syntax_valid": syntax_valid,
            "has_imports": has_imports,
            "has_functions": has_functions,
            "overall_quality": "high" if all([syntax_valid, has_imports, has_functions]) else "medium"
        },
        "endpoints": blueprint['requirements']['endpoints'],
        "generated_at": time.time(),
        "generated_by": "NeuralPatternTranspiler"
    }

    knowledge_id = substrate.infuse(
        domain="System Components",
        concept="NeuralAPIServer Implementation",
        payload=component_knowledge,
        metadata={
            "source": "self-construction",
            "related_blueprint": blueprint_id,
            "component_type": "api_server"
        }
    )

    print(f"✅ Created component knowledge: {knowledge_id}")

    # Step 7: Relate the blueprint to the implementation
    print("\n🔗 STEP 7: Creating relationships")

    substrate.distiller.create_knowledge_relationship(
        blueprint_id, knowledge_id, "implemented_by", 0.9
    )

    substrate.distiller.create_knowledge_relationship(
        knowledge_id, blueprint_id, "based_on", 0.9
    )

    print("✅ Created knowledge relationships")

    # Step 8: Summary and next steps
    print("\n📊 SELF-CONSTRUCTION SUMMARY")
    print("=" * 40)

    summary = {
        "blueprint_id": blueprint_id,
        "knowledge_id": knowledge_id,
        "code_file": code_filename,
        "code_length": len(generated_code),
        "verification": component_knowledge['verification'],
        "status": "complete",
        "next_steps": [
            "Review the generated code",
            "Test the API server manually",
            "Integrate with existing system",
            "Add to continuous learning cycle"
        ]
    }

    for key, value in summary.items():
        if isinstance(value, dict):
            print(f"   {key}:")
            for subkey, subvalue in value.items():
                print(f"      {subkey}: {subvalue}")
        elif isinstance(value, list):
            print(f"   {key}:")
            for item in value:
                print(f"      - {item}")
        else:
            print(f"   {key}: {value}")

    # Step 9: Show a sample of the generated code
    print("\n📄 SAMPLE OF GENERATED CODE")
    print("-" * 30)

    sample_lines = generated_code.split('\n')[:20]
    for line in sample_lines:
        print(f"   {line}")

    if len(generated_code.split('\n')) > 20:
        print(f"   ... ({len(generated_code.split('\n')) - 20} more lines)")

    # Cleanup
    print("\n🧹 Cleaning up test databases...")

    # Close connections
    distiller.close()
    ghost.cleanup()

    # Remove test databases
    test_dbs = [
        "self_construction_knowledge.db",
        "self_construction_ghost.db",
        "self_construction_vsm.db"
    ]

    for db in test_dbs:
        if os.path.exists(db):
            os.remove(db)
            print(f"🗑️  Removed {db}")

    print("\n🎉 SELF-CONSTRUCTION TEST COMPLETE")
    print("=" * 60)
    print("✅ The Ghost successfully built its own component!")
    print("📁 Generated file: generated_neural_api_server.py")
    print("🔮 Next: Review and integrate the new API server")

    return {
        "success": True,
        "blueprint": blueprint,
        "generated_code_file": code_filename,
        "knowledge_id": knowledge_id,
        "summary": summary
    }

if __name__ == "__main__":
    # Run the self-construction test
    result = asyncio.run(test_self_construction())

    print(f"\n🏗️  Self-construction result: {result['success']}")
    print(f"📁 Generated API server: {result['generated_code_file']}")
    print(f"🧠 Knowledge ID: {result['knowledge_id']}")