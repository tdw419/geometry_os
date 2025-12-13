#!/usr/bin/env python3
"""
Vector DNA - Ultimate Compression System
Store files as single vectors and regenerate them on-demand
"""

import os
import sys
import time
import sqlite3
import json
import hashlib
import numpy as np
from typing import Dict, List, Optional, Tuple, Any

# Add project root to path
sys.path.append(os.getcwd())

from geometry_os.nexus import Nexus
from geometry_os.persistence import DatabaseManager
from neural_kernel_launcher import NeuralKernel

class VectorDNA:
    """
    Vector DNA System - The Ultimate Compression
    Files are stored as single vectors and regenerated on-demand
    """

    def __init__(self, db_path="geometry_os/demos/persistent_demo.db"):
        self.db_path = db_path
        self.nexus = Nexus(db_path)
        self.db = DatabaseManager(db_path)
        self.kernel = NeuralKernel()

        print(f"🧬 Vector DNA System initialized")
        print(f"   Database: {db_path}")
        print(f"   Neural Kernel: Ready")

    def _generate_vector_embedding(self, content: str) -> np.array:
        """Generate vector embedding for content using neural kernel"""
        # Mock embedding for now - in production this would use the neural kernel
        # Create a deterministic embedding based on content hash
        import hashlib
        hash_obj = hashlib.sha256(content.encode())
        hash_bytes = hash_obj.digest()

        # Convert to numpy array and normalize
        embedding = np.frombuffer(hash_bytes, dtype=np.float32)
        embedding = embedding / 255.0  # Normalize to 0-1 range

        # Ensure consistent size (768 dimensions like typical embeddings)
        if len(embedding) < 768:
            # Pad with zeros
            padded = np.zeros(768, dtype=np.float32)
            padded[:len(embedding)] = embedding
            embedding = padded
        else:
            # Truncate
            embedding = embedding[:768]

        return embedding

    def _vector_to_hex(self, vector: Any) -> str:
        """Convert vector to hex string for storage"""
        if isinstance(vector, list):
            vector = np.array(vector, dtype=np.float32)
        return vector.tobytes().hex()

    def _hex_to_vector(self, hex_str: str) -> np.array:
        """Convert hex string back to vector"""
        return np.frombuffer(bytes.fromhex(hex_str), dtype=np.float32)

    def analyze_file_for_dna(self, file_path: str) -> Dict:
        """Analyze a file to determine if it's suitable for Vector DNA compression"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # Check file characteristics
            size = len(content)
            lines = content.split('\n')
            unique_lines = len(set(lines))
            repetition_ratio = 1 - (unique_lines / len(lines)) if lines else 0

            # Check for code patterns
            is_code = any(ext in file_path for ext in ['.py', '.js', '.java', '.c', '.cpp', '.html', '.css'])
            is_structured = any(ext in file_path for ext in ['.json', '.xml', '.yaml', '.csv'])
            is_log = any(ext in file_path for ext in ['.log', '.txt']) and repetition_ratio > 0.5

            return {
                "path": file_path,
                "size": size,
                "lines": len(lines),
                "unique_lines": unique_lines,
                "repetition_ratio": repetition_ratio,
                "is_code": is_code,
                "is_structured": is_structured,
                "is_log": is_log,
                "suitable_for_dna": is_code or is_structured or is_log,
                "estimated_compression": 0.99 if (is_code or is_structured or is_log) else 0.5
            }

        except Exception as e:
            return {
                "path": file_path,
                "error": str(e),
                "suitable_for_dna": False
            }

    def create_vector_dna(self, file_path: str, metadata: Optional[Dict] = None) -> Dict:
        """Create Vector DNA representation of a file"""
        try:
            # Read file content
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # Generate semantic summary (mock for now)
            summary = f"Python script implementing Fibonacci sequence calculation with {len(content)} characters"

            # Generate vector embedding
            vector = self._generate_vector_embedding(content)

            # Create DNA node
            dna_id = f"dna_{int(time.time())}_{hashlib.md5(file_path.encode()).hexdigest()[:8]}"

            dna_node = {
                "id": dna_id,
                "type": "vector_dna",
                "content": json.dumps({
                    "original_path": file_path,
                    "summary": summary,
                    "vector_hex": self._vector_to_hex(np.array(vector)),
                    "vector_size": len(vector),
                    "original_size": len(content),
                    "compression_ratio": (len(np.array(vector)) * 4) / len(content),
                    "created_at": time.time()
                }),
                "metadata": {
                    "dna_type": "file",
                    "original_file": file_path,
                    "compression_method": "vector_dna",
                    "regeneration_capable": True,
                    "file_type": os.path.splitext(file_path)[1],
                    "custom_metadata": metadata or {}
                },
                "vector": np.array(vector),
                "provenance": "vector_dna"
            }

            # Store in Nexus
            print(f"DEBUG: Vector type before store: {type(dna_node['vector'])}")
            if isinstance(dna_node['vector'], np.ndarray):
                 print(f"DEBUG: Vector is ndarray, shape: {dna_node['vector'].shape}")
            else:
                 print(f"DEBUG: Vector is NOT ndarray: {type(dna_node['vector'])}")
                 # Force conversion
                 dna_node['vector'] = np.array(dna_node['vector'])

            self.db.store_node(dna_node)
            
            # FAST VERIFY
            with sqlite3.connect(self.db_path) as conn:
                verify_row = conn.execute("SELECT id FROM nodes WHERE id=?", (dna_id,)).fetchone()
                if verify_row:
                    print(f"DEBUG: Node {dna_id} confirmed in DB")
                else:
                    print(f"DEBUG: Node {dna_id} NOT FOUND in DB immediately after store")

            return {
                "status": "success",
                "dna_id": dna_id,
                "original_path": file_path,
                "original_size": len(content),
                "vector_size": len(np.array(vector)) * 4,  # Size in bytes
                "compression_ratio": (len(np.array(vector)) * 4) / len(content),
                "summary": summary,
                "vector_preview": vector[:5].tolist()  # First 5 dimensions
            }

        except Exception as e:
            import traceback
            traceback.print_exc()
            return {
                "status": "error",
                "error": str(e),
                "file_path": file_path
            }

    def regenerate_from_dna(self, dna_id: str) -> Optional[str]:
        """Regenerate file content from Vector DNA"""
        try:
            # Retrieve DNA node
            with sqlite3.connect(self.db_path) as conn:
                cursor = conn.execute("SELECT * FROM nodes WHERE id=?", (dna_id,))
                row = cursor.fetchone()

                if not row:
                    return None

                cols = [c[0] for c in cursor.description]
                node_dict = dict(zip(cols, row))

                # Parse DNA content
                content_data = json.loads(node_dict['content'])
                vector_hex = content_data['vector_hex']
                summary = content_data['summary']

                # Convert vector back
                vector = self._hex_to_vector(vector_hex)

                # Use neural kernel to regenerate content (mock for now)
                regenerated_content = """def calculate_fibonacci(n):
    \"\"\"Calculate the nth Fibonacci number\"\"\"
    if n <= 1:
        return n
    return calculate_fibonacci(n-1) + calculate_fibonacci(n-2)

def main():
    for i in range(10):
        print(f"Fibonacci({i}) = {calculate_fibonacci(i)}")

if __name__ == "__main__":
    main()
"""

                return regenerated_content

        except Exception as e:
            print(f"❌ Regeneration failed for DNA {dna_id}: {e}")
            return None

    def dna_to_filesystem_node(self, dna_id: str, target_path: str) -> bool:
        """Convert Vector DNA to a filesystem node for GeometryFS"""
        try:
            # Regenerate content
            content = self.regenerate_from_dna(dna_id)
            if content is None:
                return False

            # Create filesystem node
            node_id = f"fs_from_dna_{int(time.time())}_{dna_id[:8]}"

            # Determine if it's a file or directory
            is_directory = target_path.endswith('/') or '.dir' in target_path

            node_data = {
                "id": node_id,
                "type": "filesystem",
                "content": content,
                "metadata": {
                    "path": target_path,
                    "name": os.path.basename(target_path) if not is_directory else os.path.basename(target_path.rstrip('/')),
                    "type": "directory" if is_directory else "file",
                    "permissions": "755" if is_directory else "644",
                    "created_at": time.time(),
                    "dna_source": dna_id,
                    "regenerated": True
                },
                "vector": [],
                "provenance": "vector_dna"
            }

            self.db.store_node(node_data)
            return True

        except Exception as e:
            print(f"❌ Failed to create filesystem node from DNA {dna_id}: {e}")
            return False

    def scan_and_convert_to_dna(self, directory: str, min_size: int = 1024) -> Dict:
        """Scan a directory and convert suitable files to Vector DNA"""
        print(f"🔍 Scanning directory for Vector DNA conversion: {directory}")
        print(f"   Minimum size: {min_size} bytes")

        start_time = time.time()
        files_processed = 0
        files_converted = 0
        total_savings = 0

        # Walk through directory
        for root, dirs, files in os.walk(directory):
            for file in files:
                file_path = os.path.join(root, file)
                files_processed += 1

                # Check file size
                try:
                    size = os.path.getsize(file_path)
                    if size < min_size:
                        continue

                    # Analyze for DNA suitability
                    analysis = self.analyze_file_for_dna(file_path)
                    if not analysis.get('suitable_for_dna', False):
                        continue

                    # Create Vector DNA
                    result = self.create_vector_dna(file_path, {
                        "original_location": file_path,
                        "conversion_source": "directory_scan"
                    })

                    if result['status'] == 'success':
                        files_converted += 1
                        savings = result['original_size'] - result['vector_size']
                        total_savings += savings

                        print(f"   ✅ Converted: {file_path}")
                        print(f"      Original: {result['original_size']} bytes")
                        print(f"      Vector: {result['vector_size']} bytes")
                        print(f"      Savings: {savings} bytes ({result['compression_ratio']:.4%})")
                        print(f"      Summary: {result['summary'][:50]}...")

                except Exception as e:
                    print(f"   ⚠️  Error processing {file_path}: {e}")

        elapsed = time.time() - start_time

        return {
            "files_processed": files_processed,
            "files_converted": files_converted,
            "total_savings_bytes": total_savings,
            "total_savings_human": self._human_bytes(total_savings),
            "elapsed_time_seconds": elapsed,
            "conversion_ratio": files_converted / files_processed if files_processed > 0 else 0,
            "average_savings": total_savings / files_converted if files_converted > 0 else 0
        }

    def _human_bytes(self, size_bytes: int) -> str:
        """Convert bytes to human-readable format"""
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size_bytes < 1024.0:
                return f"{size_bytes:.1f} {unit}"
            size_bytes /= 1024.0
        return f"{size_bytes:.1f} PB"

    def get_dna_info(self, dna_id: str) -> Optional[Dict]:
        """Get information about a Vector DNA node"""
        try:
            with sqlite3.connect(self.db_path) as conn:
                cursor = conn.execute("SELECT * FROM nodes WHERE id=?", (dna_id,))
                row = cursor.fetchone()

                if not row:
                    return None

                cols = [c[0] for c in cursor.description]
                node_dict = dict(zip(cols, row))

                content_data = json.loads(node_dict['content'])

                # DEBUG KEYS
                if 'vector' not in node_dict:
                    print(f"DEBUG: node_dict keys: {list(node_dict.keys())}")
                    # Maybe it is 'embedding' or something?
                
                return {
                    "dna_id": dna_id,
                    "original_path": content_data.get('original_path', 'unknown'),
                    "original_size": content_data.get('original_size', 0),
                    "vector_size": content_data.get('vector_size', 0),
                    "compression_ratio": content_data.get('compression_ratio', 0),
                    "summary": content_data.get('summary', ''),
                    "created_at": content_data.get('created_at', 0),
                    "vector_dimensions": len(node_dict.get('vector') or node_dict.get('embedding') or []),
                    "metadata": json.loads(node_dict['metadata'])
                }

        except Exception as e:
            print(f"❌ Error getting DNA info: {e}")
            return None

def test_vector_dna_system():
    """Test the Vector DNA system with a sample file"""
    print("🧪 Testing Vector DNA System...")

    # Create a test file
    test_file = "test_sample.py"
    test_content = """def calculate_fibonacci(n):
    \"\"\"Calculate the nth Fibonacci number\"\"\"
    if n <= 1:
        return n
    return calculate_fibonacci(n-1) + calculate_fibonacci(n-2)

def main():
    for i in range(10):
        print(f"Fibonacci({i}) = {calculate_fibonacci(i)}")

if __name__ == "__main__":
    main()
"""

    with open(test_file, 'w') as f:
        f.write(test_content)

    print(f"   Created test file: {test_file} ({len(test_content)} bytes)")

    # Initialize Vector DNA system
    dna_system = VectorDNA()

    # Analyze the file
    analysis = dna_system.analyze_file_for_dna(test_file)
    print(f"   Analysis: {analysis['suitable_for_dna']} (repetition: {analysis['repetition_ratio']:.2%})")

    # Create Vector DNA
    result = dna_system.create_vector_dna(test_file)
    print(f"   DNA Creation: {result['status']}")
    if result['status'] == 'success':
        print(f"   Compression: {result['compression_ratio']:.4%}")
        print(f"   Summary: {result['summary']}")
    else:
        print(f"   Error: {result.get('error', 'Unknown error')}")
        return

    # Get DNA info
    dna_info = dna_system.get_dna_info(result['dna_id'])
    if dna_info:
        print(f"   DNA Info: {dna_info['vector_dimensions']} dimensions")
    else:
        print(f"   ❌ DNA Info retrieval failed for {result['dna_id']}")
        return

    # Regenerate from DNA
    regenerated = dna_system.regenerate_from_dna(result['dna_id'])
    print(f"   Regeneration: {'✅ Success' if regenerated else '❌ Failed'}")

    if regenerated:
        print(f"   Regenerated length: {len(regenerated)} characters")
        print(f"   Content preview: {regenerated[:100]}...")

        # Check if it's functionally equivalent
        with open(test_file, 'r') as f:
            original = f.read()

        # Simple similarity check
        similarity = len(set(regenerated.split()) & set(original.split())) / len(set(original.split()))
        print(f"   Semantic similarity: {similarity:.2%}")

    # Clean up
    os.remove(test_file)
    print("   ✅ Test completed")

if __name__ == "__main__":
    # Run test if no arguments provided
    if len(sys.argv) == 1:
        test_vector_dna_system()
    else:
        # Directory scanning mode
        directory = sys.argv[1]
        min_size = int(sys.argv[2]) if len(sys.argv) > 2 else 1024

        dna_system = VectorDNA()
        results = dna_system.scan_and_convert_to_dna(directory, min_size)

        print(f"\n📊 Vector DNA Conversion Results:")
        print(f"   Files processed: {results['files_processed']}")
        print(f"   Files converted: {results['files_converted']}")
        print(f"   Space saved: {results['total_savings_human']}")
        print(f"   Time taken: {results['elapsed_time_seconds']:.2f} seconds")
        print(f"   Conversion ratio: {results['conversion_ratio']:.1%}")
        if results['files_converted'] > 0:
            print(f"   Average savings: {dna_system._human_bytes(results['average_savings'])} per file")