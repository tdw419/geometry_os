#!/bin/bash
#
# Quick Remote Setup - Copy-paste this entire command to a remote device
#
# This creates a self-extracting script that sets up a WordPress Swarm Node
#

# Configuration - EDIT THESE
SHARED_SECRET="your-shared-secret-here"
WP_PATH="/var/www/html"  # Change to your WordPress path
MAIN_NODE="http://YOUR-MAIN-NODE:8080"  # Your main Geometry OS URL

# --- DO NOT EDIT BELOW ---

cat << 'REMOTE_SCRIPT' > /tmp/geoos_swarm_setup.sh
#!/bin/bash
set -e

echo "🐝 Geometry OS Swarm Node Setup"

# Find WordPress
WP_PATH=""
for path in /var/www/html /var/www/wordpress /usr/share/wordpress $HOME/wordpress; do
    [ -f "$path/wp-config.php" ] && WP_PATH="$path" && break
done

if [ -z "$WP_PATH" ]; then
    echo "❌ WordPress not found. Specify path with: WP_PATH=/your/path $0"
    exit 1
fi

echo "✓ WordPress found at $WP_PATH"

# Create plugin directory
PLUGIN_DIR="$WP_PATH/wp-content/plugins/geometry-os-swarm-node"
mkdir -p "$PLUGIN_DIR"

# Write plugin file
cat > "$PLUGIN_DIR/geometry-os-swarm-node.php" << 'PLUGIN_EOF'
<?php
/* Plugin Name: Geometry OS Swarm Node
 * Description: Geometry OS Swarm Node - Distributed semantic memory
 * Version: 1.0
 */
if (!defined('ABSPATH')) exit;

class GeometryOS_SwarmNode {
    private $node_id;
    private $capabilities = ['content_intelligence', 'semantic_storage', 'memory_retrieval'];

    public function __construct() {
        $this->node_id = get_option('geoos_node_id') ?: 'wp-' . substr(md5(site_url() . time()), 0, 8);
        update_option('geoos_node_id', $this->node_id);
        add_action('rest_api_init', [$this, 'register_routes']);
        add_action('init', [$this, 'heartbeat']);
    }

    public function register_routes() {
        register_rest_route('geoos/v1', '/node', [
            'methods' => 'GET',
            'callback' => fn() => [
                'node_id' => $this->node_id,
                'type' => 'wordpress',
                'capabilities' => $this->capabilities,
                'status' => 'active',
                'site_url' => site_url(),
                'posts_count' => wp_count_posts()->publish
            ],
            'permission_callback' => '__return_true'
        ]);
        register_rest_route('geoos/v1', '/memory/query', [
            'methods' => 'POST',
            'callback' => function($req) {
                $q = json_decode($req->get_body(), true)['query'] ?? '';
                return ['query' => $q, 'results' => array_map(fn($p) => [
                    'id' => $p->ID, 'title' => $p->post_title,
                    'excerpt' => wp_trim_words($p->post_content, 20)
                ], get_posts(['s' => $q, 'posts_per_page' => 10]))];
            },
            'permission_callback' => '__return_true'
        ]);
        register_rest_route('geoos/v1', '/task', [
            'methods' => 'POST',
            'callback' => function($req) {
                $t = json_decode($req->get_body(), true);
                if (($t['type'] ?? '') === 'semantic_storage') {
                    $id = wp_insert_post(['post_title' => $t['title'], 'post_content' => $t['content'], 'post_status' => 'publish']);
                    return ['status' => 'success', 'post_id' => $id];
                }
                return ['status' => 'error', 'message' => 'Unknown task'];
            },
            'permission_callback' => '__return_true'
        ]);
    }

    public function heartbeat() {
        if (time() - get_option('geoos_last_heartbeat', 0) < 30) return;
        update_option('geoos_last_heartbeat', time());
        $msg = json_encode([
            'type' => 'swarm_discovery', 'node_id' => $this->node_id,
            'node_type' => 'wordpress', 'capabilities' => $this->capabilities,
            'url' => site_url(), 'api_url' => rest_url('geoos/v1'), 'timestamp' => time()
        ]);
        $dir = WP_CONTENT_DIR . '/uploads/geoos-discovery';
        wp_mkdir_p($dir);
        file_put_contents("$dir/node-{$this->node_id}.json", $msg);
    }
}
new GeometryOS_SwarmNode();
PLUGIN_EOF

# Set permissions
chown -R www-data:www-data "$PLUGIN_DIR" 2>/dev/null || chown -R apache:apache "$PLUGIN_DIR" 2>/dev/null || true

echo "✓ Plugin installed to $PLUGIN_DIR"
echo ""
echo "NEXT STEPS:"
echo "1. Go to $(dirname $WP_PATH)/wp-admin/plugins.php"
echo "2. Activate 'Geometry OS Swarm Node' plugin"
echo "3. Test: curl $(cat $WP_PATH/wp-config.php 2>/dev/null | grep -oP 'WP_HOME.*?http[s]?://[^'"'"']+' | head -1 | grep -oP 'http[^'"'"']+')/index.php?rest_route=/geoos/v1/node"
echo ""
echo "✅ Setup complete!"
REMOTE_SCRIPT

chmod +x /tmp/geoos_swarm_setup.sh
echo "Run: sudo /tmp/geoos_swarm_setup.sh"
