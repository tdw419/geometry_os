# Geometry OS Web Terminal

![Terminal Tests](https://github.com/YOUR_USERNAME/geometry_os/actions/workflows/terminal-tests.yml/badge.svg)

Browser-based terminal interface for Geometry OS with xterm.js integration.

## Description

Geometry OS Web Terminal is a WordPress plugin that provides a full-featured terminal emulator directly in the WordPress admin panel. It connects to the Geometry OS Visual Bridge via WebSocket, allowing administrators to execute shell commands from their browser.

**Key Features**:
- Full terminal emulation via xterm.js v5.3.0
- Real-time WebSocket connection to Visual Bridge
- Secure session token authentication (64-char SHA-256)
- Auto-reconnect with exponential backoff
- Responsive design with dark theme
- PTY support via Python `pty` module

## Requirements

- **WordPress**: 6.0 or higher
- **PHP**: 8.0 or higher
- **Geometry OS Visual Bridge**: Running on port 8768
- **Python**: 3.8+ (for Visual Bridge)
- **Browser**: Modern browser with WebSocket support

### System Dependencies

- `/bin/bash` (or configure alternate shell)
- POSIX PTY support

## Installation

### 1. Install Plugin Files

```bash
# Copy to WordPress plugins directory
cp -r geometry-os-web-terminal /var/www/html/wp-content/plugins/

# Set permissions
chown -R www-data:www-data /var/www/html/wp-content/plugins/geometry-os-web-terminal
```

### 2. Start Visual Bridge

The Visual Bridge must be running before using the terminal:

```bash
cd /path/to/geometry_os
python3 systems/visual_shell/api/visual_bridge.py
```

The Visual Bridge listens on:
- **WebSocket**: `ws://localhost:8768` (terminal connections)
- **HTTP API**: `http://localhost:8769` (session management)

### 3. Activate Plugin

1. Log into WordPress admin
2. Navigate to **Plugins** → **Installed Plugins**
3. Find **Geometry OS Web Terminal**
4. Click **Activate**

### 4. Access Terminal

1. In WordPress admin sidebar, click **GO Terminal**
2. Terminal connects automatically to Visual Bridge
3. Start typing commands

## Usage

### Basic Commands

Once connected, the terminal works like any standard shell:

```bash
$ ls -la
$ pwd
$ echo "Hello from Geometry OS"
$ ps aux | grep python
```

### Status Indicators

The status bar shows connection state:

| Indicator | Color | Meaning |
|-----------|-------|---------|
| Connected | Green | WebSocket active, PTY ready |
| Connecting | Yellow | Attempting connection |
| Disconnected | Red | Connection lost or closed |

### Auto-Reconnect

If the connection drops, the terminal automatically attempts to reconnect:
- Maximum 5 reconnection attempts
- Exponential backoff (1s, 2s, 3s, 4s, 5s)
- Live countdown displayed in status bar

### Browser Console Debugging

Access terminal state from browser console:

```javascript
// Check connection status
window.GOTerminal.getStatus()
// Returns: {connected: true, attempts: 0, lastError: null}

// Manually disconnect
window.GOTerminal.disconnect()

// Trigger reconnect
window.GOTerminal.connect()
```

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        WordPress Admin                           │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                  GO Terminal Page                        │   │
│  │  ┌─────────────────────────────────────────────────┐    │   │
│  │  │              xterm.js Terminal                   │    │   │
│  │  │  • Keyboard input capture                        │    │   │
│  │  │  • Output rendering                              │    │   │
│  │  │  • Fit addon (responsive sizing)                 │    │   │
│  │  └──────────────────────┬──────────────────────────┘    │   │
│  └─────────────────────────┼───────────────────────────────┘   │
└────────────────────────────┼────────────────────────────────────┘
                             │
                             │ WebSocket
                             │ ws://localhost:8768/terminal?token=xxx
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     Visual Bridge (Python)                       │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              Terminal Session Manager                    │   │
│  │  • Session token validation                              │   │
│  │  • PTY lifecycle management                              │   │
│  │  • Input/output routing                                  │   │
│  └──────────────────────┬──────────────────────────┬───────┘   │
│                         │                          │            │
│           ┌─────────────┴─────────────┐   ┌───────┴───────┐   │
│           ▼                           ▼   ▼               │   │
│  ┌─────────────────┐        ┌─────────────────────────┐   │   │
│  │  PTY Process    │        │    HTTP API (8769)      │   │   │
│  │  • fork()       │        │  • POST /terminal/session│   │   │
│  │  • openpty()    │        │  • DELETE /terminal/...  │   │   │
│  │  • /bin/bash    │        └─────────────────────────┘   │   │
│  └────────┬────────┘                                       │   │
│           │                                                │   │
└───────────┼────────────────────────────────────────────────┼───┘
            │
            ▼
    ┌───────────────┐
    │  Shell (bash) │
    │  • Commands   │
    │  • Scripts    │
    │  • Output     │
    └───────────────┘
```

### Data Flow

1. **Page Load**: WordPress generates session token, embeds in page
2. **WebSocket Connect**: xterm.js connects to `/terminal?token=xxx`
3. **Token Validation**: Visual Bridge validates token against session
4. **PTY Spawn**: Visual Bridge forks process with pseudo-terminal
5. **Bidirectional I/O**:
   - Keypress → WebSocket JSON → PTY stdin
   - PTY stdout → WebSocket JSON → xterm.js

### Message Protocol

**Client → Server**:
```json
{"type": "input", "data": "ls -la\n"}
{"type": "resize", "rows": 24, "cols": 80}
```

**Server → Client**:
```json
{"type": "connected", "session_id": "abc-123"}
{"type": "output", "data": "total 48\ndrwxr-xr-x 2 user user 4096 ..."}
{"type": "error", "message": "Invalid token"}
```

## Security

### Session Tokens

- **Generation**: SHA-256 hash of `user_id + timestamp + uuid + auth_salt`
- **Format**: 64-character hexadecimal string
- **Storage**: Token hash stored in WordPress user meta
- **Validation**: Timing-safe comparison via `hash_equals()`
- **Expiration**: 24 hours from creation

### Access Control

- **WordPress Capability**: `manage_options` (admin-only)
- **Nonce Verification**: AJAX requests require WordPress nonce
- **Single Session**: One active WebSocket per session

### Best Practices

1. **HTTPS**: Use HTTPS in production to encrypt WebSocket traffic
2. **Firewall**: Restrict port 8768 to localhost or trusted IPs
3. **Monitoring**: Log all terminal sessions for audit
4. **Updates**: Keep WordPress and PHP updated

## Troubleshooting

### "Connection refused" Error

**Cause**: Visual Bridge not running

**Solution**:
```bash
# Start Visual Bridge
python3 systems/visual_shell/api/visual_bridge.py

# Verify it's listening
netstat -tlnp | grep 8768
```

### "Invalid or expired token" Error

**Cause**: Session expired or token mismatch

**Solution**:
1. Refresh the WordPress admin page
2. New token generated automatically
3. Check WordPress user meta table for session data

### Terminal Not Responding

**Cause**: PTY process hung or killed

**Solution**:
```bash
# Check for zombie processes
ps aux | grep defunct

# Restart Visual Bridge
pkill -f visual_bridge.py
python3 systems/visual_shell/api/visual_bridge.py
```

### Incorrect Terminal Size

**Cause**: Browser window resized without fit

**Solution**:
- Terminal auto-fits on window resize
- Manual trigger: `window.GOTerminal.fitAddon.fit()`

### Permission Denied on PTY

**Cause**: Shell not found or permissions issue

**Solution**:
```bash
# Verify shell exists
which bash

# Check execute permission
ls -la /bin/bash

# Try alternate shell
# Edit visual_bridge.py: shell = '/bin/sh'
```

### WebSocket Closes Immediately

**Cause**: Session already active or token invalid

**Solution**:
1. Clear browser cache
2. Check Visual Bridge logs for details
3. Verify single session per token

## Development

### File Structure

```
geometry-os-web-terminal/
├── geometry-os-web-terminal.php   # Main plugin class
├── assets/
│   ├── css/
│   │   └── terminal.css           # Dark theme styles
│   └── js/
│       └── terminal.js            # xterm.js integration
├── tests/
│   ├── test-plugin.php            # PHP unit tests
│   └── bootstrap.php              # Test bootstrap
└── README.md                      # This file
```

### Running Tests

**PHP Tests**:
```bash
cd wordpress_zone/wordpress
php wp-content/plugins/geometry-os-web-terminal/tests/test-plugin.php
```

**Python Integration Tests**:
```bash
# Start Visual Bridge first
python3 systems/visual_shell/api/visual_bridge.py &

# Run tests
python -m pytest systems/visual_shell/api/tests/test_terminal_bridge.py -v
```

### Customization

**Change Shell**:
Edit `visual_bridge.py`:
```python
shell = session.get('shell', '/bin/zsh')  # Default shell
```

**Modify Terminal Theme**:
Edit `assets/css/terminal.css` CSS variables:
```css
:root {
    --goterminal-bg-primary: #0c0c0c;
    --goterminal-accent-cyan: #00bcd4;
    /* ... */
}
```

## Credits

- **xterm.js** - Terminal emulator for the web
  - https://xtermjs.org/
  - https://github.com/xtermjs/xterm
  - License: MIT

- **Geometry OS** - Spatial computing platform
  - https://geometry.os

- **WordPress** - Content management system
  - https://wordpress.org

## License

MIT License

Copyright (c) 2026 Geometry OS

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
