# systems/swarm/ctp/parser.py
"""CTP ASCII parser - stdlib-only parsing."""
import re
from typing import Dict, Any


class ParseError(Exception):
    """Raised when CTP message parsing fails."""
    pass


class CTPParser:
    """Parse CTP ASCII messages using only stdlib."""

    VERSION_PATTERN = re.compile(r"^CTP/(\d+\.\d+)\s+(\S+)")
    HEADER_PATTERN = re.compile(r"^([^:]+):\s*(.*)$")
    # Control chars not allowed (0x00-0x08, 0x0B-0x0C, 0x0E-0x1F) - allows \t(0x09), \n(0x0A), \r(0x0D)
    CONTROL_CHAR_PATTERN = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f]")
    PAYLOAD_START = "---CTP-PAYLOAD---"
    PAYLOAD_END = "---CTP-END---"

    def parse(self, text: str) -> Dict[str, Any]:
        """Parse complete CTP message.

        Args:
            text: Complete CTP ASCII message

        Returns:
            Dict with version, message_type, headers, payload

        Raises:
            ParseError: If message is malformed
        """
        if not text or not text.strip():
            raise ParseError("Empty message")

        # Validate ASCII-only content (no control chars except \n, \t, \r)
        match = self.CONTROL_CHAR_PATTERN.search(text)
        if match:
            raise ParseError(f"Non-ASCII control character at position {match.start()}: 0x{ord(match.group()):02x}")

        lines = text.strip().split("\n")
        if not lines:
            raise ParseError("Empty message")

        # Parse first line (version + message type)
        first_match = self.VERSION_PATTERN.match(lines[0])
        if not first_match:
            raise ParseError(f"Invalid CTP version line: {lines[0]}")

        version = f"CTP/{first_match.group(1)}"
        message_type = first_match.group(2)

        # Find payload boundaries
        payload_start_idx = None
        payload_end_idx = None

        for i, line in enumerate(lines):
            if line.strip() == self.PAYLOAD_START:
                payload_start_idx = i
            elif line.strip() == self.PAYLOAD_END:
                payload_end_idx = i
                break

        if payload_start_idx is None:
            raise ParseError("Missing ---CTP-PAYLOAD--- marker")

        if payload_end_idx is None:
            raise ParseError("Missing ---CTP-END--- marker")

        # Parse headers (between first line and payload)
        headers = {}
        for line in lines[1:payload_start_idx]:
            header_match = self.HEADER_PATTERN.match(line)
            if header_match:
                key = header_match.group(1).strip()
                value = header_match.group(2).strip()
                headers[key] = value

        # Extract payload
        payload_lines = lines[payload_start_idx + 1:payload_end_idx]
        payload = "\n".join(payload_lines) if payload_lines else None

        return {
            "version": version,
            "message_type": message_type,
            "headers": headers,
            "payload": payload,
        }

    def parse_partial(self, text: str) -> Dict[str, Any]:
        """Parse partial/truncated message without raising.

        Returns whatever could be parsed.

        Args:
            text: Potentially incomplete CTP message

        Returns:
            Dict with whatever was parseable
        """
        result = {
            "version": None,
            "message_type": None,
            "headers": {},
            "payload": None,
            "complete": False,
        }

        if not text or not text.strip():
            return result

        lines = text.strip().split("\n")
        if not lines:
            return result

        # Try to parse first line
        first_match = self.VERSION_PATTERN.match(lines[0])
        if first_match:
            result["version"] = f"CTP/{first_match.group(1)}"
            result["message_type"] = first_match.group(2)

        # Parse any complete headers
        for line in lines[1:]:
            if line.strip() == self.PAYLOAD_START:
                break
            header_match = self.HEADER_PATTERN.match(line)
            if header_match:
                key = header_match.group(1).strip()
                value = header_match.group(2).strip()
                result["headers"][key] = value

        # Check if complete
        if self.PAYLOAD_END in text:
            result["complete"] = True

        return result
