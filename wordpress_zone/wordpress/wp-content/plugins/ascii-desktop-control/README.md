# ASCII Desktop Control - WordPress Plugin

A WordPress plugin that exposes ASCII Desktop Control functionality via a REST API for external tools, scripts, and AI agents.

## Features

- REST API for remote desktop control and monitoring
- API key authentication with timing-safe comparison
- Integration with ASCII View, Daemon Status, and Directive systems
- WordPress admin UI for API key management

## Requirements

- WordPress 5.6 or higher
- PHP 8.0 or higher

## Installation

1. Upload the `ascii-desktop-control` folder to `/wp-content/plugins/`
2. Activate the plugin through the 'Plugins' menu in WordPress
3. Navigate to Settings > ASCII Desktop Control to configure
4. Generate an API key to begin using the REST API

## API Documentation

### Base URL

All API endpoints are relative to your WordPress REST API base:

```
https://your-wordpress-site.com/wp-json/ascii/v1
```

### Authentication

All endpoints require authentication via API key. Two methods are supported:

#### Method 1: Header (Recommended)

```bash
curl -H "X-API-Key: your-api-key-here" \
  https://your-wordpress-site.com/wp-json/ascii/v1/view
```

#### Method 2: Query Parameter

```bash
curl "https://your-wordpress-site.com/wp-json/ascii/v1/view?api_key=your-api-key-here"
```

> **Note**: When using query parameter authentication, special characters in the API key must be URL-encoded. Header-based authentication is recommended to avoid encoding issues.

### Response Format

All responses follow this structure:

#### Success Response

```json
{
  "success": true,
  "data": { ... }
}
```

#### Error Response

```json
{
  "success": false,
  "error": "Error message describing the issue"
}
```

#### Authentication Error (401)

```json
{
  "code": "rest_forbidden",
  "message": "Invalid or missing API key",
  "data": { "status": 401 }
}
```

---

## Endpoints

### GET /ascii/v1/view

Retrieve the current ASCII representation of the desktop view.

#### Request

| Parameter | Type   | Required | Description                    |
|-----------|--------|----------|--------------------------------|
| width     | int    | No       | Width of the ASCII output      |
| height    | int    | No       | Height of the ASCII output     |

#### Example Request

```bash
curl -H "X-API-Key: abc123..." \
  "https://your-wordpress-site.com/wp-json/ascii/v1/view?width=80&height=24"
```

#### Success Response (200)

```json
{
  "success": true,
  "data": {
    "ascii": "┌──────────────────────────────┐\n│  Desktop ASCII View          │\n└──────────────────────────────┘",
    "bindings": {
      "window_positions": [...],
      "click_targets": [...]
    },
    "mode": "default",
    "timestamp": "2026-02-22T15:30:00+00:00"
  }
}
```

---

### GET /ascii/v1/status

Retrieve the current status of the ASCII daemon process.

#### Request

No parameters required.

#### Example Request

```bash
curl -H "X-API-Key: abc123..." \
  "https://your-wordpress-site.com/wp-json/ascii/v1/status"
```

#### Success Response (200)

```json
{
  "success": true,
  "data": {
    "running": true,
    "pid": 12345,
    "checked_at": "2026-02-22T15:30:00+00:00"
  }
}
```

---

### POST /ascii/v1/directives

Create a new directive for the desktop control system.

#### Request

| Parameter | Type   | Required | Description                    |
|-----------|--------|----------|--------------------------------|
| title     | string | Yes      | Title of the directive         |
| content   | string | Yes      | Content/instructions           |

#### Example Request

```bash
curl -X POST \
  -H "X-API-Key: abc123..." \
  -H "Content-Type: application/json" \
  -d '{"title": "Open Browser", "content": "Launch Firefox and navigate to example.com"}' \
  "https://your-wordpress-site.com/wp-json/ascii/v1/directives"
```

#### Success Response (201)

```json
{
  "success": true,
  "data": {
    "id": 42,
    "message": "Directive created successfully"
  }
}
```

#### Error Response - Missing Fields (400)

```json
{
  "success": false,
  "error": "Title is required"
}
```

#### Error Response - Duplicate (400)

```json
{
  "success": false,
  "error": "Duplicate directive detected",
  "is_duplicate": true
}
```

---

### GET /ascii/v1/directives

Retrieve a list of recent directives.

#### Request

| Parameter | Type | Required | Description                              |
|-----------|------|----------|------------------------------------------|
| limit     | int  | No       | Number of directives to return (1-100)   |

- Default limit: 10
- Maximum limit: 100
- Minimum limit: 1

#### Example Request

```bash
curl -H "X-API-Key: abc123..." \
  "https://your-wordpress-site.com/wp-json/ascii/v1/directives?limit=5"
```

#### Success Response (200)

```json
{
  "success": true,
  "data": {
    "directives": [
      {
        "id": 42,
        "title": "Open Browser",
        "content": "Launch Firefox...",
        "created_at": "2026-02-22T15:00:00+00:00",
        "status": "pending"
      }
    ],
    "total": 100,
    "count": 1
  }
}
```

---

### GET /ascii/v1/directives/{id}

Retrieve a specific directive by ID.

#### Request

| Parameter | Type | Required | Description          |
|-----------|------|----------|----------------------|
| id        | int  | Yes      | Directive ID (in URL) |

#### Example Request

```bash
curl -H "X-API-Key: abc123..." \
  "https://your-wordpress-site.com/wp-json/ascii/v1/directives/42"
```

#### Success Response (200)

```json
{
  "success": true,
  "data": {
    "id": 42,
    "title": "Open Browser",
    "content": "Launch Firefox and navigate to example.com",
    "created_at": "2026-02-22T15:00:00+00:00",
    "status": "pending",
    "author": "admin"
  }
}
```

#### Error Response - Not Found (404)

```json
{
  "success": false,
  "error": "Directive not found"
}
```

#### Error Response - Invalid ID (400)

```json
{
  "success": false,
  "error": "Invalid directive ID"
}
```

---

## API Key Management

### Generating API Keys

1. Navigate to **Settings > ASCII Desktop Control** in WordPress admin
2. Scroll to the **API Keys** section
3. Enter a descriptive name for the key (e.g., "Python Script", "Claude Agent")
4. Click **Generate API Key**
5. **Important**: Copy the key immediately - it cannot be retrieved later

### API Key Properties

- **Length**: 32 alphanumeric characters
- **Storage**: Keys are stored as SHA256 hashes for security
- **Validation**: Timing-safe comparison prevents timing attacks

### Revoking API Keys

1. Navigate to **Settings > ASCII Desktop Control** in WordPress admin
2. Find the key in the **Existing API Keys** table
3. Click **Revoke** next to the key
4. Confirm the revocation

> **Warning**: Revoking a key immediately disables access for any tools using that key.

---

## Error Handling

### HTTP Status Codes

| Code | Description                                      |
|------|--------------------------------------------------|
| 200  | Success                                          |
| 201  | Created (successful POST)                        |
| 400  | Bad Request (invalid parameters)                 |
| 401  | Unauthorized (invalid or missing API key)        |
| 404  | Not Found (resource does not exist)              |
| 500  | Internal Server Error                            |

### Common Errors

#### Invalid API Key

```json
{
  "code": "rest_forbidden",
  "message": "Invalid or missing API key",
  "data": { "status": 401 }
}
```

#### Invalid Parameter

```json
{
  "success": false,
  "error": "Limit must be a numeric value"
}
```

---

## Usage Examples

### Python Example

```python
import requests

API_URL = "https://your-wordpress-site.com/wp-json/ascii/v1"
API_KEY = "your-api-key-here"

headers = {"X-API-Key": API_KEY}

# Get current desktop view
response = requests.get(f"{API_URL}/view", headers=headers)
print(response.json())

# Create a directive
directive = {
    "title": "Open Terminal",
    "content": "Open a new terminal window and run 'ls -la'"
}
response = requests.post(f"{API_URL}/directives", headers=headers, json=directive)
print(response.json())

# Check daemon status
response = requests.get(f"{API_URL}/status", headers=headers)
print(response.json())
```

### JavaScript Example

```javascript
const API_URL = 'https://your-wordpress-site.com/wp-json/ascii/v1';
const API_KEY = 'your-api-key-here';

const headers = {
  'X-API-Key': API_KEY,
  'Content-Type': 'application/json'
};

// Get current view
async function getView() {
  const response = await fetch(`${API_URL}/view`, { headers });
  return response.json();
}

// Create directive
async function createDirective(title, content) {
  const response = await fetch(`${API_URL}/directives`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ title, content })
  });
  return response.json();
}
```

### cURL Examples

```bash
# Set your API key and site URL
API_KEY="your-api-key-here"
SITE_URL="https://your-wordpress-site.com"

# Get desktop view
curl -H "X-API-Key: $API_KEY" "$SITE_URL/wp-json/ascii/v1/view"

# Check daemon status
curl -H "X-API-Key: $API_KEY" "$SITE_URL/wp-json/ascii/v1/status"

# Create a directive
curl -X POST \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"title":"Test Directive","content":"This is a test"}' \
  "$SITE_URL/wp-json/ascii/v1/directives"

# List recent directives
curl -H "X-API-Key: $API_KEY" "$SITE_URL/wp-json/ascii/v1/directives?limit=10"

# Get specific directive
curl -H "X-API-Key: $API_KEY" "$SITE_URL/wp-json/ascii/v1/directives/42"
```

---

## Security Considerations

- **Timing-Safe Comparison**: API key validation uses `hash_equals()` to prevent timing attacks
- **SHA256 Hashing**: Keys are stored as SHA256 hashes; plain text keys are never stored
- **One-Time Display**: API keys are shown only once during generation
- **WordPress Nonces**: Admin UI operations use WordPress nonces for CSRF protection
- **Capability Checks**: Admin operations require appropriate WordPress capabilities

---

## Testing

The plugin includes comprehensive test suites:

### PHP Unit Tests

```bash
cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php
php run-tests.php
```

### Python Integration Tests

```bash
python3 tests/python/test_rest_api.py --url http://localhost:8080 --key your-api-key
```

---

## Changelog

### 1.0.0
- Initial REST API implementation
- API key authentication
- 5 endpoints: view, status, directives (list, get, create)
- Admin UI for key management
