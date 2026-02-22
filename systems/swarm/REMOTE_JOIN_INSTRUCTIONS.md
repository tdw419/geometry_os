# WordPress Swarm Remote Join Instructions

## For the AI on the Remote Computer (10.42.0.114)

### Step 1: Check if WordPress is Running

```bash
# Check if PHP server is running
ps aux | grep php

# If not running, start it:
cd /path/to/wordpress
php -S 0.0.0.0:8080
```

### Step 2: Install the Swarm Plugin

Copy the plugin from the main Geometry OS:

```bash
# From the main computer, share the plugin:
scp -r geometry_os/wordpress_zone/wordpress/wp-content/plugins/geometry-os-swarm-node \
    user@10.42.0.114:/path/to/wordpress/wp-content/plugins/
```

Or download directly if the main server is accessible:

```bash
# On the remote computer:
mkdir -p /path/to/wordpress/wp-content/plugins/geometry-os-swarm-node
curl -o plugin.php http://10.42.0.1:8080/wp-content/plugins/geometry-os-swarm-node/geometry-os-swarm-node.php
```

### Step 3: Activate the Plugin

```bash
# Via WP-CLI (if available):
wp plugin activate geometry-os-swarm-node

# Or manually: Go to WordPress Admin > Plugins > Activate
```

### Step 4: Test the Connection

```bash
# Test that your WordPress is reachable from the main computer:
curl "http://10.42.0.114:8080/?rest_route=/geoos/v1/swarm/info"
```

### Step 5: Join the Swarm

On the **main** Geometry OS computer, add the remote node:

```bash
# Edit remote_nodes.json to add the remote node:
python3 systems/swarm/swarm_join.py join 10.42.0.114:8080 --name wp-remote-node
```

Or manually add to `systems/swarm/remote_nodes.json`:

```json
{
  "nodes": [
    {
      "node_id": "wp-remote-node",
      "url": "http://10.42.0.114:8080",
      "api_url": "http://10.42.0.114:8080/?rest_route=/geoos/v1",
      "enabled": true
    }
  ]
}
```

### Step 6: Restart Sync Daemon

```bash
# On the main computer:
pkill -f wp_discovery_daemon
python3 systems/swarm/wp_discovery_daemon.py -f
```

## Firewall Settings

If the remote WordPress is not reachable, ensure the port is open:

```bash
# On the remote computer (Ubuntu/Debian):
sudo ufw allow 8080/tcp

# Or on CentOS/RHEL:
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

## Troubleshooting

1. **Connection refused**: WordPress/PHP not running on that port
2. **404 error**: Plugin not installed or not activated
3. **Empty response**: Check PHP error logs

```bash
# Check PHP errors:
tail -f /var/log/php_errors.log

# Or if using built-in server, check the terminal output
```
