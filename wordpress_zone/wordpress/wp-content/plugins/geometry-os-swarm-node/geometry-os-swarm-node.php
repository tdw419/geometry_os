<?php
/**
 * Plugin Name: Geometry OS Swarm Node
 * Description: Turns this WordPress instance into a Geometry OS Swarm Node
 * Version: 1.0
 * Author: Geometry OS
 *
 * This plugin enables WordPress to participate in the Geometry OS swarm cluster
 * as a semantic compute node with capabilities like:
 * - content_intelligence: Analyze and improve content
 * - semantic_storage: Long-term memory via posts
 * - evolution_proposals: Generate improvement suggestions
 * - memory_retrieval: Search historical context
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_SwarmNode {
    private $node_id;
    private $swarm_port = 6000;
    private $discovery_port = 5001;
    private $visual_bridge_url = 'ws://localhost:8768';
    private $capabilities = ['content_intelligence', 'semantic_storage', 'memory_retrieval'];
    private $heartbeat_interval = 30; // seconds

    public function __construct() {
        $this->node_id = $this->get_or_create_node_id();

        // Register REST endpoints for swarm communication
        add_action('rest_api_init', [$this, 'register_routes']);

        // Heartbeat to swarm
        add_action('init', [$this, 'maybe_heartbeat']);

        // Handle incoming swarm tasks
        add_filter('template_redirect', [$this, 'handle_swarm_signal']);

        // Admin UI
        add_action('admin_menu', [$this, 'add_admin_menu']);
        add_action('admin_init', [$this, 'register_settings']);

        // AJAX handlers
        add_action('wp_ajax_geoos_task_status', [$this, 'ajax_task_status']);
        add_action('wp_ajax_geoos_execute_task', [$this, 'ajax_execute_task']);
    }

    /**
     * Get or create a persistent node ID
     */
    private function get_or_create_node_id(): string {
        $node_id = get_option('geoos_node_id');
        if (!$node_id) {
            $node_id = 'wp-' . substr(md5(site_url() . time()), 0, 8);
            update_option('geoos_node_id', $node_id);
        }
        return $node_id;
    }

    /**
     * Handle incoming swarm signals via template_redirect
     */
    public function handle_swarm_signal(): void {
        if (!isset($_GET['geoos_signal'])) return;

        $signal = $_GET['geoos_signal'];
        $this->log_event('signal_received', ['signal' => $signal]);

        // Process signal (e.g., remote wake-up or health check)
        if ($signal === 'ping') {
            wp_send_json(['status' => 'pong', 'node_id' => $this->node_id]);
        }
    }

    /**
     * Register REST API routes for swarm communication
     */
    public function register_routes(): void {
        // Node info endpoint
        register_rest_route('geoos/v1', '/node', [
            'methods' => 'GET',
            'callback' => [$this, 'api_get_node_info'],
            'permission_callback' => '__return_true'
        ]);

        // Task execution endpoint
        register_rest_route('geoos/v1', '/task', [
            'methods' => 'POST',
            'callback' => [$this, 'api_execute_task'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);

        // Memory query endpoint
        register_rest_route('geoos/v1', '/memory/query', [
            'methods' => 'POST',
            'callback' => [$this, 'api_memory_query'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);

        // Content analysis endpoint
        register_rest_route('geoos/v1', '/analyze', [
            'methods' => 'POST',
            'callback' => [$this, 'api_analyze_content'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);

        // Evolution proposals endpoint
        register_rest_route('geoos/v1', '/evolution/propose', [
            'methods' => 'POST',
            'callback' => [$this, 'api_evolution_propose'],
            'permission_callback' => [$this, 'verify_swarm_auth']
        ]);
    }

    /**
     * Verify request comes from authorized swarm node
     */
    public function verify_swarm_auth($request): bool {
        $auth_header = $request->get_header('X-Geometry-OS-Auth');
        $shared_secret = get_option('geoos_shared_secret', 'default-secret-change-me');

        // Also allow localhost requests
        $ip = $_SERVER['REMOTE_ADDR'] ?? '';
        if (in_array($ip, ['127.0.0.1', '::1'])) {
            return true;
        }

        return hash_equals($shared_secret, $auth_header ?? '');
    }

    /**
     * GET /wp-json/geoos/v1/node - Return node info
     */
    public function api_get_node_info($request): array {
        return [
            'node_id' => $this->node_id,
            'type' => 'wordpress',
            'capabilities' => $this->capabilities,
            'status' => 'active',
            'site_url' => site_url(),
            'posts_count' => wp_count_posts()->publish,
            'last_heartbeat' => get_option('geoos_last_heartbeat', 0),
            'version' => '1.0'
        ];
    }

    /**
     * POST /wp-json/geoos/v1/task - Execute a task
     */
    public function api_execute_task($request): array {
        $task = json_decode($request->get_body(), true);

        $task_type = $task['type'] ?? 'unknown';
        $task_id = $task['task_id'] ?? uniqid('task-');

        // Log task receipt
        $this->log_event('task_received', [
            'task_id' => $task_id,
            'type' => $task_type
        ]);

        // Execute based on type
        $result = match ($task_type) {
            'content_intelligence' => $this->execute_content_intelligence($task),
            'semantic_storage' => $this->execute_semantic_storage($task),
            'memory_retrieval' => $this->execute_memory_retrieval($task),
            'evolution_proposal' => $this->execute_evolution_proposal($task),
            default => ['status' => 'error', 'message' => "Unknown task type: $task_type"]
        };

        $result['task_id'] = $task_id;
        $result['node_id'] = $this->node_id;
        $result['completed_at'] = time();

        return $result;
    }

    /**
     * POST /wp-json/geoos/v1/memory/query - Query semantic memory
     */
    public function api_memory_query($request): array {
        $query = json_decode($request->get_body(), true);
        $search = $query['query'] ?? '';
        $limit = $query['limit'] ?? 10;

        // Search posts as semantic memory
        $args = [
            'post_type' => 'any',
            'post_status' => 'publish',
            's' => $search,
            'posts_per_page' => $limit,
        ];

        $posts = get_posts($args);
        $results = [];

        foreach ($posts as $post) {
            $results[] = [
                'id' => $post->ID,
                'title' => $post->post_title,
                'excerpt' => wp_trim_words($post->post_content, 30),
                'url' => get_permalink($post),
                'date' => $post->post_date,
                'type' => $post->post_type
            ];
        }

        return [
            'query' => $search,
            'count' => count($results),
            'results' => $results
        ];
    }

    /**
     * POST /wp-json/geoos/v1/analyze - Analyze content
     */
    public function api_analyze_content($request): array {
        $data = json_decode($request->get_body(), true);
        $content = $data['content'] ?? '';
        $analysis_type = $data['analysis_type'] ?? 'sentiment';

        // Basic content analysis
        $analysis = [
            'word_count' => str_word_count(strip_tags($content)),
            'char_count' => strlen($content),
            'reading_time' => ceil(str_word_count(strip_tags($content)) / 200),
            'has_code' => strpos($content, '<code') !== false,
            'has_images' => strpos($content, '<img') !== false,
            'has_links' => strpos($content, '<a ') !== false,
        ];

        // Extract headings
        preg_match_all('/<h([1-6])[^>]*>(.*?)<\/h\1>/i', $content, $headings);
        $analysis['headings'] = $headings[2] ?? [];

        // Extract keywords (simple approach)
        $text = strtolower(strip_tags($content));
        $words = str_word_count($text, 1);
        $freq = array_count_values($words);
        arsort($freq);
        $analysis['top_keywords'] = array_slice(array_keys($freq), 0, 10);

        return [
            'analysis_type' => $analysis_type,
            'analysis' => $analysis,
            'node_id' => $this->node_id
        ];
    }

    /**
     * POST /wp-json/geoos/v1/evolution/propose - Generate evolution proposals
     */
    public function api_evolution_propose($request): array {
        $data = json_decode($request->get_body(), true);
        $scope = $data['scope'] ?? 'recent'; // 'recent', 'all', or post IDs

        $proposals = [];

        // Get posts to analyze
        $args = [
            'post_type' => 'post',
            'post_status' => 'publish',
            'posts_per_page' => $scope === 'recent' ? 10 : -1,
        ];

        $posts = get_posts($args);

        foreach ($posts as $post) {
            // Simple heuristics for improvement proposals
            $content = $post->post_content;
            $issues = [];

            // Check for short content
            if (str_word_count(strip_tags($content)) < 300) {
                $issues[] = [
                    'type' => 'content_length',
                    'severity' => 'info',
                    'message' => 'Content is short, consider expanding'
                ];
            }

            // Check for missing images
            if (strpos($content, '<img') === false) {
                $issues[] = [
                    'type' => 'missing_media',
                    'severity' => 'info',
                    'message' => 'No images found, consider adding visual content'
                ];
            }

            // Check for internal links
            if (strpos($content, site_url()) === false) {
                $issues[] = [
                    'type' => 'internal_linking',
                    'severity' => 'info',
                    'message' => 'No internal links detected'
                ];
            }

            if (!empty($issues)) {
                $proposals[] = [
                    'post_id' => $post->ID,
                    'title' => $post->post_title,
                    'issues' => $issues,
                    'confidence' => 0.7
                ];
            }
        }

        return [
            'proposals' => $proposals,
            'analyzed_count' => count($posts),
            'node_id' => $this->node_id
        ];
    }

    // Task execution methods
    private function execute_content_intelligence(array $task): array {
        // Analyze and potentially improve content
        $post_id = $task['post_id'] ?? null;

        if (!$post_id) {
            return ['status' => 'error', 'message' => 'post_id required'];
        }

        $post = get_post($post_id);
        if (!$post) {
            return ['status' => 'error', 'message' => 'Post not found'];
        }

        return [
            'status' => 'success',
            'post_id' => $post_id,
            'analysis' => [
                'word_count' => str_word_count(strip_tags($post->post_content)),
                'reading_time' => ceil(str_word_count(strip_tags($post->post_content)) / 200),
                'has_shortcode' => has_shortcode($post->post_content, ''),
            ]
        ];
    }

    private function execute_semantic_storage(array $task): array {
        // Store content as semantic memory
        $title = $task['title'] ?? 'Untitled';
        $content = $task['content'] ?? '';
        $meta = $task['meta'] ?? [];

        $post_data = [
            'post_title' => $title,
            'post_content' => $content,
            'post_status' => 'publish',
            'post_type' => 'post',
            'meta_input' => $meta
        ];

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            return ['status' => 'error', 'message' => $post_id->get_error_message()];
        }

        $this->log_event('semantic_storage', [
            'post_id' => $post_id,
            'title' => $title
        ]);

        return [
            'status' => 'success',
            'post_id' => $post_id,
            'url' => get_permalink($post_id)
        ];
    }

    private function execute_memory_retrieval(array $task): array {
        $query = $task['query'] ?? '';
        $limit = $task['limit'] ?? 5;

        $posts = get_posts([
            's' => $query,
            'posts_per_page' => $limit,
            'post_status' => 'publish'
        ]);

        $results = array_map(function($post) {
            return [
                'id' => $post->ID,
                'title' => $post->post_title,
                'content' => substr($post->post_content, 0, 500),
                'url' => get_permalink($post)
            ];
        }, $posts);

        return [
            'status' => 'success',
            'count' => count($results),
            'results' => $results
        ];
    }

    private function execute_evolution_proposal(array $task): array {
        // Generate a specific evolution proposal
        $target = $task['target'] ?? 'site';
        $type = $task['proposal_type'] ?? 'content';

        $proposal = [
            'target' => $target,
            'type' => $type,
            'suggestions' => [],
            'confidence' => 0.8
        ];

        // Add context-specific suggestions
        if ($type === 'content') {
            $proposal['suggestions'] = [
                'Review short posts for expansion opportunities',
                'Add alt text to images without it',
                'Check internal linking structure'
            ];
        }

        return [
            'status' => 'success',
            'proposal' => $proposal
        ];
    }

    /**
     * Send heartbeat to swarm
     */
    public function maybe_heartbeat(): void {
        $last = get_option('geoos_last_heartbeat', 0);

        if (time() - $last < $this->heartbeat_interval) {
            return;
        }

        update_option('geoos_last_heartbeat', time());

        // Broadcast heartbeat to discovery network
        $this->broadcast_discovery();

        // Log to telemetry
        $this->log_event('heartbeat', [
            'node_id' => $this->node_id,
            'capabilities' => $this->capabilities,
            'posts_count' => wp_count_posts()->publish
        ]);
    }

    /**
     * Broadcast discovery packet via UDP
     * Falls back to file-based discovery if sockets extension unavailable
     */
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

        // Try sockets extension first (preferred for UDP broadcast)
        if (extension_loaded('sockets')) {
            $socket = @socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
            if ($socket) {
                @socket_set_option($socket, SOL_SOCKET, SO_BROADCAST, 1);
                @socket_set_option($socket, SOL_SOCKET, SO_REUSEADDR, 1);
                @socket_sendto($socket, $message, strlen($message), 0, '255.255.255.255', $this->discovery_port);
                @socket_close($socket);
            }
        }

        // Always write to file-based discovery (works without sockets)
        $this->write_discovery_file($message);
    }

    /**
     * Write discovery info to file for non-socket discovery
     */
    private function write_discovery_file(string $message): void {
        $discovery_dir = WP_CONTENT_DIR . '/uploads/geoos-discovery';
        if (!file_exists($discovery_dir)) {
            wp_mkdir_p($discovery_dir);
        }

        $file = $discovery_dir . '/node-' . $this->node_id . '.json';
        file_put_contents($file, $message, LOCK_EX);
    }

    /**
     * Log event to telemetry file
     */
    private function log_event(string $type, array $data): void {
        $payload = [
            'type' => $type,
            'timestamp' => time(),
            'source' => 'wordpress_swarm_node',
            'node_id' => $this->node_id,
            'data' => $data
        ];

        $telemetry_dir = WP_CONTENT_DIR . '/uploads/geoos-telemetry';
        if (!file_exists($telemetry_dir)) {
            wp_mkdir_p($telemetry_dir);
        }

        $file = $telemetry_dir . '/events.jsonl';
        file_put_contents($file, json_encode($payload) . "\n", FILE_APPEND | LOCK_EX);
    }

    // Admin UI
    public function add_admin_menu(): void {
        // Trigger broadcast on admin page load for discovery help
        $this->broadcast_discovery();

        add_options_page(
            'Geometry OS Swarm Node',
            'Geometry OS Node',
            'manage_options',
            'geometry-os-swarm',
            [$this, 'admin_page']
        );
    }

    public function register_settings(): void {
        register_setting('geoos_settings', 'geoos_shared_secret');
        register_setting('geoos_settings', 'geoos_capabilities');

        add_settings_section('geoos_main', 'Node Configuration', null, 'geometry-os-swarm');

        add_settings_field('geoos_shared_secret', 'Shared Secret', function() {
            $value = get_option('geoos_shared_secret', 'default-secret-change-me');
            echo '<input type="text" name="geoos_shared_secret" value="' . esc_attr($value) . '" class="regular-text">';
        }, 'geometry-os-swarm', 'geoos_main');
    }

    public function admin_page(): void {
        $node_info = $this->api_get_node_info(null);
        ?>
        <div class="wrap">
            <h1>🐝 Geometry OS Swarm Node</h1>

            <div class="card" style="max-width: 600px;">
                <h2>Node Status</h2>
                <table class="form-table">
                    <tr>
                        <th>Node ID</th>
                        <td><code><?php echo esc_html($node_info['node_id']); ?></code></td>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <td><span style="color: green;">● Active</span></td>
                    </tr>
                    <tr>
                        <th>Capabilities</th>
                        <td><?php echo esc_html(implode(', ', $node_info['capabilities'])); ?></td>
                    </tr>
                    <tr>
                        <th>Posts (Memory)</th>
                        <td><?php echo esc_html($node_info['posts_count']); ?></td>
                    </tr>
                    <tr>
                        <th>API Endpoint</th>
                        <td><code><?php echo esc_html(rest_url('geoos/v1/node')); ?></code></td>
                    </tr>
                </table>
            </div>

            <div class="card" style="max-width: 600px; margin-top: 20px;">
                <h2>API Endpoints</h2>
                <table class="widefat">
                    <thead>
                        <tr>
                            <th>Endpoint</th>
                            <th>Method</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><code>/wp-json/geoos/v1/node</code></td>
                            <td>GET</td>
                            <td>Node info</td>
                        </tr>
                        <tr>
                            <td><code>/wp-json/geoos/v1/task</code></td>
                            <td>POST</td>
                            <td>Execute task</td>
                        </tr>
                        <tr>
                            <td><code>/wp-json/geoos/v1/memory/query</code></td>
                            <td>POST</td>
                            <td>Query semantic memory</td>
                        </tr>
                        <tr>
                            <td><code>/wp-json/geoos/v1/analyze</code></td>
                            <td>POST</td>
                            <td>Analyze content</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <form method="post" action="options.php" style="max-width: 600px; margin-top: 20px;">
                <?php
                settings_fields('geoos_settings');
                do_settings_sections('geometry-os-swarm');
                submit_button('Save Configuration');
                ?>
            </form>
        </div>
        <?php
    }

    // AJAX handlers
    public function ajax_task_status(): void {
        wp_send_json(['status' => 'ok', 'node_id' => $this->node_id]);
    }

    public function ajax_execute_task(): void {
        $task = json_decode(stripslashes($_POST['task'] ?? '{}'), true);
        $result = $this->api_execute_task(new WP_REST_Request());
        wp_send_json($result);
    }
}

// Initialize
new GeometryOS_SwarmNode();

/**
 * Helper function to send task to another swarm node
 */
function geoos_remote_task(string $node_url, string $task_type, array $payload, string $secret = ''): array {
    $request = wp_remote_post(rtrim($node_url, '/') . '/wp-json/geoos/v1/task', [
        'timeout' => 30,
        'headers' => [
            'Content-Type' => 'application/json',
            'X-Geometry-OS-Auth' => $secret ?: get_option('geoos_shared_secret', '')
        ],
        'body' => json_encode([
            'type' => $task_type,
            'task_id' => uniqid('task-'),
            'payload' => $payload
        ])
    ]);

    if (is_wp_error($request)) {
        return ['status' => 'error', 'message' => $request->get_error_message()];
    }

    return json_decode(wp_remote_retrieve_body($request), true);
}
