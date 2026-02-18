import os
import hashlib
import pytest
import subprocess
import shutil
import json
from pathlib import Path

class TestHilbertBitPerfect:
    """
    Integration tests to prove bit-perfect storage using the Hilbert Curve mapping.
    Ensures Binary -> RTS.PNG -> Binary is lossless.
    """

    def setup_method(self):
        self.test_dir = Path("test_hilbert_workspace")
        if self.test_dir.exists():
            shutil.rmtree(self.test_dir)
        self.test_dir.mkdir(exist_ok=True)
        self.source_dir = self.test_dir / "source"
        self.source_dir.mkdir(exist_ok=True)
        self.extracted_dir = self.test_dir / "extracted"
        self.extracted_dir.mkdir(exist_ok=True)

    def teardown_method(self):
        if self.test_dir.exists():
            shutil.rmtree(self.test_dir)

    def get_sha256(self, file_path):
        sha256_hash = hashlib.sha256()
        with open(file_path, "rb") as f:
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()

    def run_roundtrip(self, source_file):
        rts_png = self.test_dir / f"{source_file.name}.rts.png"
        
        # 1. Convert to RTS.PNG
        conv_cmd = ["python3", "pixelrts_v2_converter.py", str(source_file), str(rts_png)]
        result = subprocess.run(conv_cmd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Converter failed for {source_file.name}:")
            print(result.stdout)
            print(result.stderr)
            return False
        
        # 2. Extract back to binary
        # Based on pixelrts_v2_extractor.py, it uses positional args or --output if specified correctly in its custom arg parser
        # It seems it only supports --output if sys.argv[2] == '--output'
        ext_cmd = ["python3", "pixelrts_v2_extractor.py", str(rts_png)]
        result = subprocess.run(ext_cmd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Extractor failed for {source_file.name}:")
            print(result.stdout)
            print(result.stderr)
            return False
        
        # The extractor saves files in the same directory as the PNG by default.
        # We need to find the extracted file.
        source_hash = self.get_sha256(source_file)
        
        # The extractor uses the 'name' from the offsets metadata as the filename.
        # For a single file converted via pixelrts_v2_converter.py, it usually 
        # names it 'main' or the original filename.
        
        # Look for extracted files in the directory where the PNG was created.
        extracted_dir = rts_png.parent
        match_found = False
        for ext_file in extracted_dir.glob("*"):
            # Skip the source, the PNG and the meta.json
            if ext_file.suffix in ['.png', '.json'] or 'source' in str(ext_file):
                continue
            if ext_file.is_file() and self.get_sha256(ext_file) == source_hash:
                match_found = True
                break
        
        return match_found

    def test_small_file_roundtrip(self):
        """1KB random data roundtrip"""
        source = self.source_dir / "small.bin"
        with open(source, "wb") as f:
            f.write(os.urandom(1024))
        
        assert self.run_roundtrip(source) is True

    def test_kernel_sized_roundtrip(self):
        """10MB structured data roundtrip (simulating a kernel)"""
        source = self.source_dir / "kernel_mock.bin"
        with open(source, "wb") as f:
            # Write 10MB of data
            for i in range(1024):
                f.write(b"RISCV" * 200 + os.urandom(24))
        
        assert self.run_roundtrip(source) is True

    def test_single_byte(self):
        """Edge case: 1-byte file"""
        source = self.source_dir / "single.bin"
        with open(source, "wb") as f:
            f.write(b"G")
        
        assert self.run_roundtrip(source) is True

    def test_power_of_two_boundary(self):
        """Test file sizes exactly at PNG texture boundaries"""
        # 4MB = 1024x1024 pixels (4 bytes each)
        size = 1024 * 1024 * 4
        source = self.source_dir / "boundary.bin"
        with open(source, "wb") as f:
            f.write(os.urandom(size))
            
        assert self.run_roundtrip(source) is True

    def test_metadata_consistency(self):
        """Verify that the metadata contains correct hashes and offsets"""
        source = self.source_dir / "meta_test.bin"
        data = b"STARDUST" * 100
        source_hash = hashlib.sha256(data).hexdigest()
        with open(source, "wb") as f:
            f.write(data)
            
        rts_png = self.test_dir / "meta_test.rts.png"
        subprocess.run(["python3", "pixelrts_v2_converter.py", str(source), str(rts_png)], check=True)
        
        meta_path = rts_png.with_suffix('.meta.json')
        assert meta_path.exists()
        
        with open(meta_path) as f:
            meta = json.load(f)
            
        # Verify offsets structure
        assert "offsets" in meta
        # In v2 converter, the primary payload is usually in 'main' or the source filename
        payload_meta = None
        for key in meta["offsets"]:
            if source.name in key or key == "main":
                payload_meta = meta["offsets"][key]
                break
        
        assert payload_meta is not None
        assert payload_meta["sha256"] == source_hash
        assert payload_meta["size"] == len(data)
