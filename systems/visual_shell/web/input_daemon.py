#!/usr/bin/env python3
"""
Input Daemon for Geometry OS

Bridges MMIO input events to Linux uinput devices.
This runs inside the QEMU Linux VM.

MMIO Layout (matches GPU Execution System):
  0x02000000: status (bit 0 = pending)
  0x02000004: type (1=keyboard, 2=mouse)
  0x02000008: key_code
  0x0200000C: mouse_x
  0x02000010: mouse_y
  0x02000014: flags (1=pressed, 2=released)
"""

import os
import time
import struct
import threading
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger('input_daemon')

# Try to import evdev (available on Linux)
try:
    import evdev
    from evdev import UInput, ecodes, AbsInfo
    HAS_EVDEV = True
except ImportError:
    HAS_EVDEV = False
    logger.warning("evdev not available - running in mock mode")


class InputDaemon:
    """MMIO to uinput bridge daemon."""

    # MMIO layout
    MMIO_INPUT_STATUS = 0x02000000
    MMIO_INPUT_TYPE = 0x02000004
    MMIO_INPUT_KEY = 0x02000008
    MMIO_INPUT_X = 0x0200000C
    MMIO_INPUT_Y = 0x02000010
    MMIO_INPUT_FLAGS = 0x02000014

    # Input types
    INPUT_TYPE_KEYBOARD = 1
    INPUT_TYPE_MOUSE = 2

    # Input flags
    INPUT_FLAG_PRESSED = 1
    INPUT_FLAG_RELEASED = 2

    # Scancode to evdev key code mapping
    SCANCODE_TO_KEY = {
        0x01: ecodes.KEY_ESC,
        0x02: ecodes.KEY_1, 0x03: ecodes.KEY_2, 0x04: ecodes.KEY_3,
        0x05: ecodes.KEY_4, 0x06: ecodes.KEY_5, 0x07: ecodes.KEY_6,
        0x08: ecodes.KEY_7, 0x09: ecodes.KEY_8, 0x0A: ecodes.KEY_9,
        0x0B: ecodes.KEY_0,
        0x0E: ecodes.KEY_BACKSPACE,
        0x0F: ecodes.KEY_TAB,
        0x1C: ecodes.KEY_ENTER,
        0x1D: ecodes.KEY_LEFTCTRL,
        0x2A: ecodes.KEY_LEFTSHIFT,
        0x38: ecodes.KEY_LEFTALT,
        0x39: ecodes.KEY_SPACE,
        0x1E: ecodes.KEY_A, 0x30: ecodes.KEY_B, 0x2E: ecodes.KEY_C,
        0x20: ecodes.KEY_D, 0x12: ecodes.KEY_E, 0x21: ecodes.KEY_F,
        0x22: ecodes.KEY_G, 0x23: ecodes.KEY_H, 0x17: ecodes.KEY_I,
        0x24: ecodes.KEY_J, 0x25: ecodes.KEY_K, 0x26: ecodes.KEY_L,
        0x32: ecodes.KEY_M, 0x31: ecodes.KEY_N, 0x18: ecodes.KEY_O,
        0x19: ecodes.KEY_P, 0x10: ecodes.KEY_Q, 0x13: ecodes.KEY_R,
        0x1F: ecodes.KEY_S, 0x14: ecodes.KEY_T, 0x16: ecodes.KEY_U,
        0x2F: ecodes.KEY_V, 0x11: ecodes.KEY_W, 0x2D: ecodes.KEY_X,
        0x15: ecodes.KEY_Y, 0x2C: ecodes.KEY_Z,
        0x48: ecodes.KEY_UP, 0x50: ecodes.KEY_DOWN,
        0x4B: ecodes.KEY_LEFT, 0x4D: ecodes.KEY_RIGHT,
    }

    def __init__(self, mmio_path=None, mock=False):
        """
        Initialize input daemon.

        Args:
            mmio_path: Path to MMIO device file (e.g., /dev/geometry-mmio)
            mock: Run in mock mode (no real input injection)
        """
        self.mmio_path = mmio_path
        self.mock = mock or not HAS_EVDEV
        self.running = False
        self.mmio_fd = None

        # Create uinput devices
        if not self.mock:
            self._setup_uinput()
        else:
            self.keyboard = None
            self.mouse = None
            logger.info("Running in mock mode - no real input injection")

    def _setup_uinput(self):
        """Setup uinput keyboard and mouse devices."""
        # Keyboard device
        self.keyboard = UInput(
            name='Geometry OS Virtual Keyboard',
            phys='geometry-os/input0',
            bustype=ecodes.BUS_USB,
        )

        # Mouse device with absolute positioning
        self.mouse = UInput(
            name='Geometry OS Virtual Mouse',
            phys='geometry-os/input1',
            bustype=ecodes.BUS_USB,
            events={
                ecodes.EV_KEY: [ecodes.BTN_LEFT, ecodes.BTN_RIGHT, ecodes.BTN_MIDDLE],
                ecodes.EV_ABS: [
                    (ecodes.ABS_X, AbsInfo(0, 0, 1920, 0, 0, 0)),
                    (ecodes.ABS_Y, AbsInfo(0, 0, 1080, 0, 0, 0)),
                ],
            }
        )

        logger.info("Created uinput devices")

    def _open_mmio(self):
        """Open MMIO device file."""
        if not self.mmio_path:
            logger.warning("No MMIO path specified - using mock MMIO")
            return False

        try:
            self.mmio_fd = os.open(self.mmio_path, os.O_RDWR | os.O_SYNC)
            logger.info(f"Opened MMIO device: {self.mmio_path}")
            return True
        except OSError as e:
            logger.error(f"Failed to open MMIO device: {e}")
            return False

    def _read_mmio(self, offset, size=4):
        """Read from MMIO region."""
        if self.mmio_fd is None:
            return 0

        try:
            os.lseek(self.mmio_fd, offset, os.SEEK_SET)
            data = os.read(self.mmio_fd, size)
            return struct.unpack('<I', data)[0]
        except OSError as e:
            logger.error(f"MMIO read error: {e}")
            return 0

    def _write_mmio(self, offset, value, size=4):
        """Write to MMIO region."""
        if self.mmio_fd is None:
            return

        try:
            os.lseek(self.mmio_fd, offset, os.SEEK_SET)
            os.write(self.mmio_fd, struct.pack('<I', value)[:size])
        except OSError as e:
            logger.error(f"MMIO write error: {e}")

    def _process_input(self):
        """Process pending input event from MMIO."""
        # Read status
        status = self._read_mmio(self.MMIO_INPUT_STATUS)

        if (status & 1) == 0:
            return  # No pending event

        # Read input packet
        input_type = self._read_mmio(self.MMIO_INPUT_TYPE)
        key_code = self._read_mmio(self.MMIO_INPUT_KEY)
        mouse_x = self._read_mmio(self.MMIO_INPUT_X)
        mouse_y = self._read_mmio(self.MMIO_INPUT_Y)
        flags = self._read_mmio(self.MMIO_INPUT_FLAGS)

        # Clear pending flag
        self._write_mmio(self.MMIO_INPUT_STATUS, status & ~1)

        # Process based on type
        if input_type == self.INPUT_TYPE_KEYBOARD:
            self._inject_keyboard(key_code, flags)
        elif input_type == self.INPUT_TYPE_MOUSE:
            self._inject_mouse(mouse_x, mouse_y, flags)

    def _inject_keyboard(self, scancode, flags):
        """Inject keyboard event."""
        evdev_key = self.SCANCODE_TO_KEY.get(scancode)

        if evdev_key is None:
            logger.debug(f"Unknown scancode: 0x{scancode:02X}")
            return

        if self.mock:
            action = "pressed" if flags & self.INPUT_FLAG_PRESSED else "released"
            logger.info(f"[MOCK] Keyboard: {evdev_key} {action}")
            return

        if flags & self.INPUT_FLAG_PRESSED:
            self.keyboard.write(ecodes.EV_KEY, evdev_key, 1)
        elif flags & self.INPUT_FLAG_RELEASED:
            self.keyboard.write(ecodes.EV_KEY, evdev_key, 0)

        self.keyboard.syn()
        logger.debug(f"Injected keyboard: {evdev_key} flags={flags}")

    def _inject_mouse(self, x, y, flags):
        """Inject mouse event."""
        if self.mock:
            action = ""
            if flags & self.INPUT_FLAG_PRESSED:
                action = "pressed"
            elif flags & self.INPUT_FLAG_RELEASED:
                action = "released"
            logger.info(f"[MOCK] Mouse: ({x}, {y}) {action}")
            return

        # Move to position
        self.mouse.write(ecodes.EV_ABS, ecodes.ABS_X, x)
        self.mouse.write(ecodes.EV_ABS, ecodes.ABS_Y, y)

        # Handle button state
        if flags & self.INPUT_FLAG_PRESSED:
            self.mouse.write(ecodes.EV_KEY, ecodes.BTN_LEFT, 1)
        elif flags & self.INPUT_FLAG_RELEASED:
            self.mouse.write(ecodes.EV_KEY, ecodes.BTN_LEFT, 0)

        self.mouse.syn()
        logger.debug(f"Injected mouse: ({x}, {y}) flags={flags}")

    def run(self):
        """Main daemon loop."""
        self.running = True
        logger.info("Input daemon started")

        # Try to open MMIO device
        self._open_mmio()

        try:
            while self.running:
                self._process_input()
                time.sleep(0.001)  # 1ms poll interval
        except KeyboardInterrupt:
            pass
        finally:
            self.stop()

    def stop(self):
        """Stop the daemon."""
        self.running = False

        if self.mmio_fd is not None:
            os.close(self.mmio_fd)
            self.mmio_fd = None

        if self.keyboard:
            self.keyboard.close()
        if self.mouse:
            self.mouse.close()

        logger.info("Input daemon stopped")


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Geometry OS Input Daemon')
    parser.add_argument('--mmio', default='/dev/geometry-mmio', help='MMIO device path')
    parser.add_argument('--mock', action='store_true', help='Run in mock mode')
    parser.add_argument('--interval', type=int, default=1, help='Poll interval in ms')

    args = parser.parse_args()

    daemon = InputDaemon(mmio_path=args.mmio, mock=args.mock)
    daemon.run()


if __name__ == '__main__':
    main()
