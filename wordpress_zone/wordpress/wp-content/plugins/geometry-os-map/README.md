# Geometry OS Map - WordPress Plugin

Embed the PixiJS Infinite Map in WordPress via shortcode, Gutenberg block, or page template.

## Installation

1. Copy plugin to `wp-content/plugins/geometry-os-map/`
2. Activate in WordPress Admin → Plugins

## Requirements

- WordPress 5.8+
- PHP 7.4+
- Visual Shell server running on configured asset URL

## Usage

### Method 1: Shortcode

```
[geometry_os_map height="600px"]
```

### Method 2: Gutenberg Block

1. Edit a page with the block editor
2. Add "Geometry OS Map" block
3. Configure via sidebar controls

### Method 3: Page Template

1. Create a new Page
2. Set Template to "Geometry OS Map (Full Screen)"
3. Publish

## Configuration

### Admin Settings

Go to **Settings → Geometry OS Map** to configure:

- **Asset Base URL** - Where visual shell assets are served (default: http://localhost:8000)
- **Default Width** - CSS width for new maps
- **Default Height** - CSS height for new maps
- **Default Theme** - dark/light/highContrast
- **Show Tutorial** - Display tutorial button

### Per-Instance Options

| Option | Values | Description |
|--------|--------|-------------|
| `width` | CSS value | Container width (e.g., `100%`, `800px`) |
| `height` | CSS value | Container height (e.g., `600px`, `80vh`) |
| `fullscreen` | true/false | Full viewport overlay |
| `mode` | desktop, (empty) | Application mode |
| `theme` | dark/light/highContrast | Visual theme |

### Shortcode Examples

```
[geometry_os_map]
[geometry_os_map height="800px"]
[geometry_os_map width="80%" height="500px"]
[geometry_os_map fullscreen="true"]
[geometry_os_map fullscreen="true" mode="desktop"]
```

### PHP Template Usage

```php
<?php
echo geometry_os_render_map(['height' => '800px']);
?>
```

### Filter Override

```php
// In functions.php
add_filter('geometry_os_asset_base_url', function($url) {
    return 'https://your-cdn.com';
});
```

## Development

### Start Visual Shell

```bash
cd systems/visual_shell/web
python3 -m http.server 8000
```

### File Structure

```
geometry-os-map/
├── geometry-os-map.php          # Bootstrap
├── includes/
│   ├── class-core.php           # Shared functionality
│   ├── class-shortcode.php      # Shortcode handler
│   ├── class-block.php          # Gutenberg block
│   ├── class-settings.php       # Admin settings
│   └── class-template.php       # Page template
├── assets/
│   ├── js/block-editor.js       # Block editor UI
│   └── css/admin.css            # Settings styles
├── templates/
│   └── full-map-template.php    # Full-screen template
└── README.md
```

## JavaScript Events

The plugin dispatches a custom event when the map is ready:

```javascript
window.addEventListener('geometryOSMapReady', function(e) {
    const { app, containerId } = e.detail;
    console.log('Map ready:', containerId);

    // Access the GeometryOSApplication instance
    window.geometryOSApp === app; // true
});
```

## REST API

### GET `/wp-json/geometry-os/v1/map-config`

Returns map configuration:

```json
{
  "asset_base": "http://localhost:8000",
  "version": "1.1.0"
}
```

## Changelog

### 1.1.0
- Added Gutenberg block with visual editor controls
- Added admin settings page
- Added full-screen page template
- Refactored to modular architecture

### 1.0.0
- Initial shortcode implementation
