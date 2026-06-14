use geometry_os::vm::GlyphVm;
#[cfg(feature = "gpu")]
// Shared GPU test infrastructure for opcode_tests.
//
// The problem: each test creating a new GlyphVm creates a new wgpu Device.
// On NVIDIA drivers, rapid device create/destroy causes DeviceLost errors.
// Solution: provide a way to create GlyphVm with a shared device.
use std::sync::{Mutex, OnceLock};

/// Process-wide shared GPU VM. Created once, reused across all tests.
static SHARED_VM: OnceLock<Mutex<GlyphVm>> = OnceLock::new();

/// Run a test function with exclusive access to the shared GPU VM.
/// The VM is reset between tests automatically.
pub fn with_gpu_vm<F, R>(f: F) -> R
where
    F: FnOnce(&mut GlyphVm) -> R,
{
    let vm_mutex = SHARED_VM.get_or_init(|| {
        eprintln!("[test] Initializing shared GPU device (once per process)...");
        Mutex::new(GlyphVm::new())
    });
    let mut guard = vm_mutex.lock().unwrap_or_else(|e| e.into_inner());
    guard.reset();
    f(&mut guard)
}
