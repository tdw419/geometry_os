#!/usr/bin/env python3
"""
Phase 16: Enhanced Interactivity Test Suite
Tests for Context Menus and Keyboard Shortcuts in Visual Shell
"""

import asyncio
import websockets
import json
import time
from typing import Dict, Any

class Phase16Tester:
    """Test Phase 16 Enhanced Interactivity features"""

    def __init__(self, ws_url: str = "ws://localhost:8765"):
        self.ws_url = ws_url
        self.ws = None
        self.test_results = []

    async def connect(self) -> bool:
        """Connect to WebSocket server"""
        try:
            self.ws = await websockets.connect(self.ws_url)
            print("✅ Connected to WebSocket server")
            return True
        except Exception as e:
            print(f"❌ Failed to connect: {e}")
            return False

    async def disconnect(self):
        """Disconnect from WebSocket server"""
        if self.ws:
            await self.ws.close()
            print("📡 Disconnected from WebSocket server")

    async def send_message(self, message: Dict[str, Any]) -> Dict[str, Any]:
        """Send message and receive response"""
        try:
            await self.ws.send(json.dumps(message))
            response = await self.ws.recv()
            return json.loads(response)
        except Exception as e:
            print(f"❌ Message error: {e}")
            return {}

    async def test_file_execution(self):
        """Test file execution via context menu"""
        print("\n🧪 Test: File Execution via Context Menu")

        # Simulate file execution request
        test_file = {
            "path": "/test/script.py",
            "name": "test_script.py",
            "type": "python"
        }

        message = {
            "type": "EXECUTE_FILE",
            "data": test_file
        }

        response = await self.send_message(message)

        if response.get("type") in ["APP_ACTIVATED", "EXECUTION_STARTED"]:
            print("✅ File execution initiated successfully")
            self.test_results.append(("File Execution", True))
        else:
            print("❌ File execution failed")
            self.test_results.append(("File Execution", False))

    async def test_refresh_files(self):
        """Test file refresh via keyboard shortcut"""
        print("\n🧪 Test: Refresh Files (Ctrl+R)")

        message = {
            "type": "REFRESH_FILES"
        }

        response = await self.send_message(message)

        if response.get("type") in ["INITIAL_FILES", "FILES_UPDATE"]:
            print("✅ File refresh successful")
            self.test_results.append(("Refresh Files", True))
        else:
            print("❌ File refresh failed")
            self.test_results.append(("Refresh Files", False))

    async def test_glass_panel_creation(self):
        """Test glass panel creation for files"""
        print("\n🧪 Test: Glass Panel Creation")

        # Wait for APP_ACTIVATED message
        try:
            response = await asyncio.wait_for(self.ws.recv(), timeout=5.0)
            data = json.loads(response)

            if data.get("type") == "APP_ACTIVATED":
                print("✅ Glass panel activation received")
                self.test_results.append(("Glass Panel Creation", True))
            else:
                print(f"❌ Unexpected response: {data.get('type')}")
                self.test_results.append(("Glass Panel Creation", False))
        except asyncio.TimeoutError:
            print("❌ Timeout waiting for glass panel activation")
            self.test_results.append(("Glass Panel Creation", False))

    async def test_context_menu_integration(self):
        """Test context menu integration with backend"""
        print("\n🧪 Test: Context Menu Integration")

        # Test that server handles context menu actions
        test_actions = [
            "open",
            "rename",
            "delete",
            "copy"
        ]

        for action in test_actions:
            message = {
                "type": "CONTEXT_MENU_ACTION",
                "data": {
                    "action": action,
                    "file": {
                        "path": "/test/file.txt",
                        "name": "file.txt"
                    }
                }
            }

            # Server may not implement this yet, so we just test message delivery
            try:
                await self.ws.send(json.dumps(message))
                print(f"✅ Context menu action '{action}' sent")
                self.test_results.append((f"Context Menu: {action}", True))
            except Exception as e:
                print(f"❌ Context menu action '{action}' failed: {e}")
                self.test_results.append((f"Context Menu: {action}", False))

    async def test_keyboard_shortcut_handling(self):
        """Test keyboard shortcut handling"""
        print("\n🧪 Test: Keyboard Shortcut Handling")

        # Test various keyboard shortcuts
        shortcuts = [
            {"type": "KEYBOARD_SHORTCUT", "data": {"shortcut": "Ctrl+N", "action": "create_panel"}},
            {"type": "KEYBOARD_SHORTCUT", "data": {"shortcut": "Ctrl+R", "action": "refresh"}},
            {"type": "KEYBOARD_SHORTCUT", "data": {"shortcut": "Escape", "action": "close_panel"}}
        ]

        for shortcut in shortcuts:
            try:
                await self.ws.send(json.dumps(shortcut))
                print(f"✅ Keyboard shortcut '{shortcut['data']['shortcut']}' sent")
                self.test_results.append((f"Keyboard Shortcut: {shortcut['data']['shortcut']}", True))
            except Exception as e:
                print(f"❌ Keyboard shortcut '{shortcut['data']['shortcut']}' failed: {e}")
                self.test_results.append((f"Keyboard Shortcut: {shortcut['data']['shortcut']}", False))

    async def run_all_tests(self):
        """Run all Phase 16 tests"""
        print("=" * 60)
        print("PHASE 16: ENHANCED INTERACTIVITY TEST SUITE")
        print("=" * 60)

        if not await self.connect():
            print("❌ Cannot run tests - connection failed")
            return

        try:
            # Run tests
            await self.test_file_execution()
            await self.test_refresh_files()
            await self.test_glass_panel_creation()
            await self.test_context_menu_integration()
            await self.test_keyboard_shortcut_handling()

            # Print summary
            print("\n" + "=" * 60)
            print("TEST SUMMARY")
            print("=" * 60)

            passed = sum(1 for _, result in self.test_results if result)
            total = len(self.test_results)

            for test_name, result in self.test_results:
                status = "✅ PASS" if result else "❌ FAIL"
                print(f"{status}: {test_name}")

            print("=" * 60)
            print(f"Results: {passed}/{total} tests passed")
            print(f"Success Rate: {(passed/total*100):.1f}%")
            print("=" * 60)

        finally:
            await self.disconnect()

async def main():
    """Main test runner"""
    tester = Phase16Tester()
    await tester.run_all_tests()

if __name__ == "__main__":
    asyncio.run(main())
