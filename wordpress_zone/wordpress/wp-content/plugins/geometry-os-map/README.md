# Geometry OS Map - WordPress Plugin

Embeds the PixiJS Infinite Map in WordPress pages via shortcode.

## Quick Start

### 1. Start the Visual Shell Server

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web
./start.sh
```

This starts the server at `http://localhost:8000`

### 2. Activate the Plugin

1. Go to WordPress Admin → Plugins
2. Activate "Geometry OS Map"

### 3. Create a Page with the Map

Create a new WordPress page and add the shortcode:

```
[geometry_os_map height="600px"]
```

## Shortcode Options

| Attribute | Default | Description |
|-----------|---------|-------------|
| `width` | `100%` | CSS width of the map container |
| `height` | `600px` | CSS height of the map container |
| `fullscreen` | `false` | If true, map covers entire viewport |
| `mode` | ` ` | Application mode (`desktop` for desktop mode) |

## Examples

### Standard Map (600px height)
```
[geometry_os_map]
```

### Full-width, taller map
```
[geometry_os_map width="100%" height="800px"]
```

### Fullscreen immersive map
```
[geometry_os_map fullscreen="true"]
```

### Desktop mode (wallpaper-style)
```
[geometry_os_map fullscreen="true" mode="desktop"]
```

## Programmatic Usage

In PHP templates:

```php
<?php
// Simple
echo geometry_os_render_map();

// With options
echo geometry_os_render_map([
    'height' => '100vh',
    'mode' => 'desktop'
]);
?>
```

## Configuration

### Change Asset Base URL

In your theme's `functions.php`:

```php
add_filter('geometry_os_asset_base_url', function($url) {
    return 'https://your-server.com'; // For production
    // return 'http://localhost:8000'; // For development
});
```

## REST API

### GET `/wp-json/geometry-os/v1/map-config`

Returns map configuration:

```json
{
  "asset_base": "http://localhost:8000",
  "version": "1.0.0"
}
```

## Events

The plugin dispatches a custom event when the map is ready:

```javascript
window.addEventListener('geometryOSMapReady', function(e) {
    const { app, containerId } = e.detail;
    console.log('Map ready:', containerId);

    // Access the GeometryOSApplication instance
    window.geometryOSApp === app; // true
});
```

## Troubleshooting

### Map doesn't load

1. Ensure the visual shell server is running: `./start.sh`
2. Check browser console for CORS errors
3. Verify the asset base URL is correct

### Scripts not loading

The plugin only loads scripts on pages containing the `[geometry_os_map]` shortcode. Make sure:
- The shortcode is in the page content (not just in a template)
- Or use `geometry_os_render_map()` in PHP

## File Structure

```
wp-content/plugins/geometry-os-map/
├── geometry-os-map.php    # Main plugin file
└── README.md              # This file
```
