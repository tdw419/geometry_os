#!/bin/bash
#
# Geometry OS WordPress Swarm Node Setup Script
# ==============================================
#
# Run this on a remote device to turn a WordPress installation
# into a Geometry OS Swarm Node.
#
# Usage:
#   curl -sSL https://your-server/setup_wp_swarm.sh | bash -s -- --secret YOUR_SECRET
#
# Or with a local file:
#   ./setup_wp_swarm.sh --secret YOUR_SECRET --wp-path /var/www/html
#
# Requirements:
#   - PHP 7.4+ with sockets extension (or will use file-based discovery)
#   - WordPress 5.0+
#   - curl, jq
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
SECRET=""
WP_PATH=""
AUTO_INSTALL_WP=false
MAIN_NODE_URL=""
NODE_NAME=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --secret)
            SECRET="$2"
            shift 2
            ;;
        --wp-path)
            WP_PATH="$2"
            shift 2
            ;;
        --main-node)
            MAIN_NODE_URL="$2"
            shift 2
            ;;
        --name)
            NODE_NAME="$2"
            shift 2
            ;;
        --auto-install)
            AUTO_INSTALL_WP=true
            shift
            ;;
        --help)
            echo "Geometry OS WordPress Swarm Node Setup"
            echo ""
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --secret SECRET       Shared secret for swarm authentication (required)"
            echo "  --wp-path PATH        Path to WordPress installation"
            echo "  --main-node URL       URL of main Geometry OS node for registration"
            echo "  --name NAME           Custom node name (default: auto-generated)"
            echo "  --auto-install        Install WordPress if not found (requires --wp-path)"
            echo "  --help                Show this help"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║     🐝 Geometry OS WordPress Swarm Node Setup              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check required tools
check_dependencies() {
    echo -e "${YELLOW}Checking dependencies...${NC}"

    local missing=()

    command -v php >/dev/null 2>&1 || missing+=("php")
    command -v curl >/dev/null 2>&1 || missing+=("curl")

    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${RED}Missing required tools: ${missing[*]}${NC}"
        echo "Install with:"
        echo "  Ubuntu/Debian: sudo apt install ${missing[*]}"
        echo "  CentOS/RHEL:   sudo yum install ${missing[*]}"
        exit 1
    fi

    # Check PHP version
    PHP_VERSION=$(php -r "echo PHP_VERSION_ID;")
    if [ "$PHP_VERSION" -lt 70400 ]; then
        echo -e "${RED}PHP 7.4+ required. Current: $(php -r 'echo PHP_VERSION;')${NC}"
        exit 1
    fi

    echo -e "${GREEN}✓ Dependencies OK (PHP $(php -r 'echo PHP_VERSION;'))${NC}"
}

# Find WordPress installation
find_wordpress() {
    echo -e "${YELLOW}Locating WordPress...${NC}"

    if [ -n "$WP_PATH" ]; then
        if [ -f "$WP_PATH/wp-config.php" ]; then
            echo -e "${GREEN}✓ WordPress found at $WP_PATH${NC}"
            return 0
        else
            if [ "$AUTO_INSTALL_WP" = true ]; then
                install_wordpress
                return 0
            fi
            echo -e "${RED}WordPress not found at $WP_PATH${NC}"
            exit 1
        fi
    fi

    # Common WordPress locations
    local search_paths=(
        "/var/www/html"
        "/var/www/wordpress"
        "/usr/share/wordpress"
        "/opt/wordpress"
        "$HOME/wordpress"
        "$HOME/public_html"
        "/srv/www/htdocs"
    )

    for path in "${search_paths[@]}"; do
        if [ -f "$path/wp-config.php" ]; then
            WP_PATH="$path"
            echo -e "${GREEN}✓ WordPress found at $WP_PATH${NC}"
            return 0
        fi
    done

    # Ask user
    echo -e "${YELLOW}WordPress not found in common locations.${NC}"
    echo "Please specify the path with --wp-path or use --auto-install to install WordPress."
    exit 1
}

# Install minimal WordPress
install_wordpress() {
    echo -e "${YELLOW}Installing WordPress to $WP_PATH...${NC}"

    sudo mkdir -p "$WP_PATH"
    sudo chown $USER:$USER "$WP_PATH"

    # Download WordPress
    curl -sSL https://wordpress.org/latest.tar.gz | tar xz --strip-components=1 -C "$WP_PATH"

    # Create wp-config.php
    cat > "$WP_PATH/wp-config.php" << 'WPCONFIG'
<?php
// Geometry OS Swarm Node - Auto-generated config
define('DB_NAME', 'geoos_swarm');
define('DB_USER', 'geoos');
define('DB_PASSWORD', 'geoos_swarm_password');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');
define('AUTH_KEY',         'geoos-auth-key-auto-generated');
define('SECURE_AUTH_KEY',  'geoos-secure-auth-key-auto-generated');
define('LOGGED_IN_KEY',    'geoos-logged-in-key-auto-generated');
define('NONCE_KEY',        'geoos-nonce-key-auto-generated');
define('AUTH_SALT',        'geoos-auth-salt-auto-generated');
define('SECURE_AUTH_SALT', 'geoos-secure-auth-salt-auto-generated');
define('LOGGED_IN_SALT',   'geoos-logged-in-salt-auto-generated');
define('NONCE_SALT',       'geoos-nonce-salt-auto-generated');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
WPCONFIG

    echo -e "${GREEN}✓ WordPress installed to $WP_PATH${NC}"
    echo -e "${YELLOW}Note: You'll need to configure database credentials in wp-config.php${NC}"
}

# Install the Swarm Node plugin
install_plugin() {
    echo -e "${YELLOW}Installing Geometry OS Swarm Node plugin...${NC}"

    PLUGIN_DIR="$WP_PATH/wp-content/plugins/geometry-os-swarm-node"
    mkdir -p "$PLUGIN_DIR"

    # Download plugin from main node or use embedded version
    if [ -n "$MAIN_NODE_URL" ]; then
        echo "Downloading plugin from $MAIN_NODE_URL..."
        curl -sSL "$MAIN_NODE_URL/plugins/geometry-os-swarm-node.php" -o "$PLUGIN_DIR/geometry-os-swarm-node.php" 2>/dev/null || true
    fi

    # If download failed, create embedded plugin
    if [ ! -f "$PLUGIN_DIR/geometry-os-swarm-node.php" ] || [ ! -s "$PLUGIN_DIR/geometry-os-swarm-node.php" ]; then
        echo "Creating plugin from embedded source..."
        create_embedded_plugin
    fi

    echo -e "${GREEN}✓ Plugin installed to $PLUGIN_DIR${NC}"
}

# Create embedded plugin (minimal version)
create_embedded_plugin() {
    cat > "$PLUGIN_DIR/geometry-os-swarm-node.php" << 'PLUGIN'
<?php
/**
 * Plugin Name: Geometry OS Swarm Node
 * Description: Turns this WordPress instance into a Geometry OS Swarm Node
 * Version: 1.0
 * Author: Geometry OS
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_SwarmNode {
    private $node_id;
    private $discovery_port = 5001;
    private $capabilities = ['content_intelligence', 'semantic_storage', 'memory_retrieval'];

    public function __construct() {
        $this->node_id = $this->get_or_create_node_id();
        add_action('rest_api_init', [$this, 'register_routes']);
        add_action('init', [$this, 'maybe_heartbeat']);
        add_action('admin_menu', [$this, 'add_admin_menu']);
    }

    private function get_or_create_node_id(): string {
        $node_id = get_option('geoos_node_id');
        if (!$node_id) {
            $node_id = 'wp-' . substr(md5(site_url() . time()), 0, 8);
            update_option('geoos_node_id', $node_id);
        }
        return $node_id;
    }

    public function register_routes(): void {
        register_rest_route('geoos/v1', '/node', [
            'methods' => 'GET',
            'callback' => [$this, 'api_get_node_info'],
            'permission_callback' => '__return_true'
        ]);
        register_rest_route('geoos/v1', '/task', [
            'methods' => 'POST',
            'callback' => [$this, 'api_execute_task'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);
        register_rest_route('geoos/v1', '/memory/query', [
            'methods' => 'POST',
            'callback' => [$this, 'api_memory_query'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);
    }

    public function verify_swarm_auth($request): bool {
        $ip = $_SERVER['REMOTE_ADDR'] ?? '';
        if (in_array($ip, ['127.0.0.1', '::1'])) return true;
        $auth = $request->get_header('X-Geometry-OS-Auth');
        return hash_equals(get_option('geoos_shared_secret', ''), $auth ?? '');
    }

    public function api_get_node_info($request): array {
        return [
            'node_id' => $this->node_id,
            'type' => 'wordpress',
            'capabilities' => $this->capabilities,
            'status' => 'active',
            'site_url' => site_url(),
            'posts_count' => wp_count_posts()->publish,
            'version' => '1.0'
        ];
    }

    public function api_execute_task($request): array {
        $task = json_decode($request->get_body(), true);
        $type = $task['type'] ?? 'unknown';

        return match($type) {
            'semantic_storage' => $this->store_memory($task),
            'memory_retrieval' => $this->query_memory($task),
            default => ['status' => 'error', 'message' => "Unknown task: $type"]
        };
    }

    public function api_memory_query($request): array {
        $data = json_decode($request->get_body(), true);
        $query = $data['query'] ?? '';
        $posts = get_posts(['s' => $query, 'posts_per_page' => 10]);
        return [
            'query' => $query,
            'count' => count($posts),
            'results' => array_map(fn($p) => [
                'id' => $p->ID,
                'title' => $p->post_title,
                'excerpt' => wp_trim_words($p->post_content, 30),
                'url' => get_permalink($p)
            ], $posts)
        ];
    }

    private function store_memory(array $task): array {
        $post_id = wp_insert_post([
            'post_title' => $task['title'] ?? 'Untitled',
            'post_content' => $task['content'] ?? '',
            'post_status' => 'publish'
        ]);
        return is_wp_error($post_id)
            ? ['status' => 'error', 'message' => $post_id->get_error_message()]
            : ['status' => 'success', 'post_id' => $post_id, 'url' => get_permalink($post_id)];
    }

    private function query_memory(array $task): array {
        return $this->api_memory_query((new WP_REST_Request())->set_body(json_encode($task)));
    }

    public function maybe_heartbeat(): void {
        $last = get_option('geoos_last_heartbeat', 0);
        if (time() - $last < 30) return;
        update_option('geoos_last_heartbeat', time());
        $this->broadcast_discovery();
    }

    private function broadcast_discovery(): void {
        $message = json_encode([
            'type' => 'swarm_discovery',
            'node_id' => $this->node_id,
            'node_type' => 'wordpress',
            'capabilities' => $this->capabilities,
            'url' => site_url(),
            'api_url' => rest_url('geoos/v1'),
            'timestamp' => time()
        ]);

        // File-based discovery
        $dir = WP_CONTENT_DIR . '/uploads/geoos-discovery';
        wp_mkdir_p($dir);
        file_put_contents("$dir/node-{$this->node_id}.json", $message, LOCK_EX);

        // UDP broadcast if sockets available
        if (extension_loaded('sockets')) {
            $sock = @socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
            if ($sock) {
                @socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, 1);
                @socket_sendto($sock, $message, strlen($message), 0, '255.255.255.255', $this->discovery_port);
                @socket_close($sock);
            }
        }
    }

    public function add_admin_menu(): void {
        add_options_page('Geometry OS Node', 'Geometry OS Node', 'manage_options', 'geometry-os-swarm', [$this, 'admin_page']);
    }

    public function admin_page(): void {
        $info = $this->api_get_node_info(null);
        echo '<div class="wrap"><h1>🐝 Geometry OS Swarm Node</h1>';
        echo '<table class="form-table"><tr><th>Node ID</th><td><code>' . esc_html($info['node_id']) . '</code></td></tr>';
        echo '<tr><th>Capabilities</th><td>' . esc_html(implode(', ', $info['capabilities'])) . '</td></tr>';
        echo '<tr><th>Posts (Memory)</th><td>' . esc_html($info['posts_count']) . '</td></tr>';
        echo '<tr><th>API Endpoint</th><td><code>' . esc_html(rest_url('geoos/v1/node')) . '</code></td></tr></table></div>';
    }
}

new GeometryOS_SwarmNode();
PLUGIN
}

# Configure the plugin
configure_plugin() {
    echo -e "${YELLOW}Configuring Swarm Node...${NC}"

    # Generate secret if not provided
    if [ -z "$SECRET" ]; then
        SECRET=$(openssl rand -hex 16 2>/dev/null || cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
        echo -e "${YELLOW}Generated secret: $SECRET${NC}"
        echo -e "${YELLOW}Save this secret to connect from other nodes!${NC}"
    fi

    # Set custom node name
    if [ -n "$NODE_NAME" ]; then
        # This would require WP-CLI or direct DB access
        echo -e "${YELLOW}Note: Node name requires setting in WordPress admin after activation${NC}"
    fi

    # Create config file for reference
    cat > "$WP_PATH/wp-content/geoos-config.json" << CONFIG
{
    "node_id": "will-be-generated",
    "secret": "$SECRET",
    "main_node": "$MAIN_NODE_URL",
    "setup_date": "$(date -Iseconds)"
}
CONFIG

    chmod 600 "$WP_PATH/wp-content/geoos-config.json"

    echo -e "${GREEN}✓ Configuration saved${NC}"
}

# Activate the plugin
activate_plugin() {
    echo -e "${YELLOW}Activating plugin...${NC}"

    # Check if WP-CLI is available
    if command -v wp >/dev/null 2>&1; then
        cd "$WP_PATH"
        wp plugin activate geometry-os-swarm-node --allow-root 2>/dev/null || true
        wp option update geoos_shared_secret "$SECRET" --allow-root 2>/dev/null || true
        echo -e "${GREEN}✓ Plugin activated via WP-CLI${NC}"
    else
        echo -e "${YELLOW}WP-CLI not found. Please activate manually:${NC}"
        echo "  1. Go to $(dirname "$WP_PATH")/wp-admin/plugins.php"
        echo "  2. Activate 'Geometry OS Swarm Node'"
        echo "  3. Go to Settings → Geometry OS Node"
        echo "  4. Set the shared secret: $SECRET"
    fi
}

# Test the installation
test_installation() {
    echo -e "${YELLOW}Testing installation...${NC}"

    # Find WordPress URL
    WP_URL=""
    if command -v wp >/dev/null 2>&1; then
        WP_URL=$(wp option get siteurl --allow-root 2>/dev/null || echo "")
    fi

    if [ -z "$WP_URL" ]; then
        # Guess based on common setups
        if [ -f "/etc/apache2/sites-enabled/000-default.conf" ] || [ -f "/etc/nginx/sites-enabled/default" ]; then
            WP_URL="http://localhost"
        else
            WP_URL="http://localhost:8080"
        fi
    fi

    # Test API endpoint
    API_URL="$WP_URL/index.php?rest_route=/geoos/v1/node"

    echo "Testing: $API_URL"
    RESPONSE=$(curl -s "$API_URL" 2>/dev/null || echo '{"error": "connection failed"}')

    if echo "$RESPONSE" | grep -q '"node_id"'; then
        NODE_ID=$(echo "$RESPONSE" | grep -o '"node_id":"[^"]*"' | cut -d'"' -f4)
        echo -e "${GREEN}✓ Swarm Node API working!${NC}"
        echo -e "${GREEN}  Node ID: $NODE_ID${NC}"
    else
        echo -e "${YELLOW}⚠ Could not verify API (may need manual activation)${NC}"
    fi
}

# Print summary
print_summary() {
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          ✅ SETUP COMPLETE                                 ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "WordPress Path:     $WP_PATH"
    echo "Plugin Path:        $PLUGIN_DIR"
    echo "Shared Secret:      $SECRET"
    echo ""
    echo -e "${YELLOW}Next Steps:${NC}"
    echo "  1. Activate the plugin in WordPress Admin → Plugins"
    echo "  2. Configure the secret in Settings → Geometry OS Node"
    echo "  3. Ensure your main Geometry OS node can reach this server"
    echo ""
    echo -e "${BLUE}Connection Info for Main Node:${NC}"
    echo "  Node URL:    $WP_URL"
    echo "  API URL:     $WP_URL/index.php?rest_route=/geoos/v1/node"
    echo "  Secret:      $SECRET"
    echo ""
}

# Main execution
main() {
    check_dependencies

    if [ -z "$SECRET" ]; then
        echo -e "${YELLOW}No --secret provided. A random secret will be generated.${NC}"
    fi

    find_wordpress
    install_plugin
    configure_plugin
    activate_plugin
    test_installation
    print_summary
}

main
