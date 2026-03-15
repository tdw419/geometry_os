// Minimal Rust program for Geometry OS RISC-V

#![no_std]
#![no_main]

use core::panic::PanicInfo;

const UART: *mut u8 = 0x1000 as *mut u8;

fn putchar(c: u8) {
    unsafe {
        core::ptr::write_volatile(UART, c);
    }
}

fn puts(s: &[u8]) {
    for &c in s {
        putchar(c);
    }
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    puts(b"Hello from Rust on Geometry OS!\n");

    loop {
        // Halt
    }
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    puts(b"PANIC!\n");
    loop {}
}
