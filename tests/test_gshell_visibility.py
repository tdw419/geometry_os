import os
import time
import subprocess
import signal
import pty
import fcntl
import termios
import struct
from pathlib import Path

def test_gshell_state_fidelity():
    """
    Goal: Prove that G-Shell correctly mirrors terminal output to the GNB state file.
    """
    project_root = Path(__file__).parent.parent
    gshell_path = project_root / "systems" / "visual_shell" / "geos_terminal.py"
    gnb_path = project_root / ".geometry" / "gnb_state.ascii"
    
    # 1. Ensure clean state
    if gnb_path.exists():
        gnb_path.unlink()
    
    # 2. Spawn G-Shell as a background process using PTY
    master, slave = pty.openpty()
    
    # Set a fixed terminal size (24x80)
    winsize = struct.pack('HHHH', 24, 80, 0, 0)
    fcntl.ioctl(master, termios.TIOCSWINSZ, winsize)
    
    process = subprocess.Popen(
        ["python3", str(gshell_path)],
        stdin=slave,
        stdout=slave,
        stderr=slave,
        cwd=project_root,
        preexec_fn=os.setsid
    )
    
    try:
        # Give it a moment to start and sync initial buffer
        time.sleep(3)
        
        # 3. Send a command to the shell
        os.write(master, b"echo HELLO_G_SHELL_TEST\n")
        
        # 4. Wait for GNB sync
        time.sleep(3)
        
        # 5. Validate GNB state file
        assert gnb_path.exists(), "GNB state file was not created by G-Shell"
        
        content = gnb_path.read_text()
        print(f"DEBUG: GNB Content captured (Length: {len(content)}):\n{content}")
        
        assert "HELLO_G_SHELL_TEST" in content, f"Test marker 'HELLO_G_SHELL_TEST' not found in GNB state"
        print("✓ G-Shell State Fidelity Verified: Output mirrored to GNB")

    finally:
        # Cleanup
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGTERM)
        except ProcessLookupError:
            pass
        os.close(master)
        os.close(slave)

def test_native_gshell_image_state():
    """
    Goal: Prove that Native G-Shell (v2) creates the Hilbert-mapped .rts.png texture.
    """
    project_root = Path(__file__).parent.parent
    native_shell_path = project_root / "systems" / "visual_shell" / "native_geos_terminal.py"
    
    # Look for tile 0
    texture_path = project_root / ".geometry" / "tectonic" / "textures" / "native_terminal_0.rts.png"
    fragment_path = project_root / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"
    
    if texture_path.exists(): texture_path.unlink()
    if fragment_path.exists(): fragment_path.unlink()
    
    master, slave = pty.openpty()
    winsize = struct.pack('HHHH', 24, 80, 0, 0)
    fcntl.ioctl(master, termios.TIOCSWINSZ, winsize)
    
    process = subprocess.Popen(
        ["python3", str(native_shell_path)],
        stdin=slave,
        stdout=slave,
        stderr=slave,
        cwd=project_root,
        preexec_fn=os.setsid
    )
    
    try:
        time.sleep(5) # Native shell needs more time for FFI
        
        # Send output
        os.write(master, b"echo NATIVE_G_SHELL_ACTIVE\n")
        time.sleep(3)
        
        # Check for both visual and perceptual state
        assert texture_path.exists(), "Native .rts.png texture state not created"
        assert fragment_path.exists(), "Native ASCII fragment not created"
        
        fragment_content = fragment_path.read_text()
        assert "NATIVE_G_SHELL_ACTIVE" in fragment_content
        print("✓ Native G-Shell State Verified: Texture (.rts.png) and Fragment (.ascii) created")
        
    finally:
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGTERM)
        except ProcessLookupError:
            pass
        os.close(master)
        os.close(slave)

if __name__ == "__main__":
    print("Running G-Shell Verification Suite...")
    try:
        test_gshell_state_fidelity()
        print("-" * 40)
        test_native_gshell_image_state()
        print("\nALL GOALS ACHIEVED: G-Shell is fully operational and AI-visible.")
    except Exception as e:
        print(f"\nVerification Failed: {e}")
        import traceback
        traceback.print_exc()
        exit(1)
