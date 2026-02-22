<?php
/**
 * Plugin Name: Geometry OS WebMCP
 * Description: Exposes WordPress functionality as WebMCP tools for Evolution Daemon integration + Ambient Narrative System
 * Version: 2.0.0
 * Author: Geometry OS
 *
 * This plugin provides WebMCP tools that allow the Evolution Daemon to:
 * - Create and edit posts/pages
 * - Update architecture documentation
 * - Log evolution events
 * - Build WordPress UI components
 *
 * V2.0 adds the Ambient Narrative System:
 * - narrative_session custom post type for ambient state tracking
 * - Scene graph REST API for PixiJS streaming
 * - Admin HUD dashboard widget for daemon status
 *
 * "The Screen is the Hard Drive. WordPress is the Memory District."
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

class Geometry_OS_WebMCP {

    private $namespace = 'geometry-os/v1';
    private $evolution_log_option = 'geometry_os_evolution_log';

    /**
     * Initialize the plugin
     */
    public function __construct() {
        add_action('rest_api_init', array($this, 'register_routes'));
        add_action('wp_dashboard_setup', array($this, 'add_dashboard_widget'));
        add_action('wp_enqueue_scripts', array($this, 'enqueue_assets'));
        add_shortcode('geometry_os_pulse', array($this, 'pulse_shortcode'));
        add_shortcode('hilbert_gallery', array($this, 'hilbert_gallery_shortcode'));

        // V2.0: Ambient Narrative System
        add_action('init', array($this, 'register_narrative_session_cpt'));
        add_action('init', array($this, 'register_rts_snapshot_cpt'));
        add_action('admin_head', array($this, 'admin_hud_styles'));

        // V2.1: GOSR Radio Integration
        add_action('init', array($this, 'register_radio_broadcast_cpt'));
        add_shortcode('gosr_radio', array($this, 'gosr_radio_shortcode'));
    }

    /**
     * Register the rts_snapshot custom post type
     */
    public function register_rts_snapshot_cpt() {
        $labels = array(
            'name'                  => _x('RTS Snapshots', 'Post type general name', 'geometry-os'),
            'singular_name'         => _x('RTS Snapshot', 'Post type singular name', 'geometry-os'),
            'menu_name'             => _x('RTS Snapshots', 'Admin Menu', 'geometry-os'),
            'all_items'             => __('All Snapshots', 'geometry-os'),
            'add_new_item'          => __('New Snapshot', 'geometry-os'),
            'edit_item'             => __('Edit Snapshot', 'geometry-os'),
            'view_item'             => __('View Snapshot', 'geometry-os'),
        );

        $args = array(
            'labels'             => $labels,
            'public'             => true,
            'publicly_queryable' => true,
            'show_ui'            => true,
            'show_in_menu'       => true,
            'query_var'          => true,
            'rewrite'            => array('slug' => 'rts-snapshot'),
            'capability_type'    => 'post',
            'has_archive'        => true,
            'hierarchical'       => false,
            'menu_position'      => 26,
            'menu_icon'          => 'dashicons-format-image',
            'supports'           => array('title', 'editor', 'thumbnail', 'custom-fields'),
            'show_in_rest'       => true,
        );

        register_post_type('rts_snapshot', $args);
    }

    /**
     * Enqueue assets
     */
    public function enqueue_assets() {
        wp_enqueue_style('geometry-os-global-substrate', plugins_url('assets/css/global-substrate.css', __FILE__));
        wp_enqueue_style('geometry-os-pulse', plugins_url('assets/css/wp_pulse_bridge.css', __FILE__));
        wp_enqueue_script('geometry-os-pulse', plugins_url('assets/js/wp_pulse_bridge.js', __FILE__), array(), '1.0.0', true);

        // Hilbert Viewer Assets
        wp_enqueue_script('pixijs', 'https://pixijs.download/v8.0.0/pixi.min.js', array(), '8.0.0', true);
        wp_enqueue_script('geometry-os-hilbert-viewer', plugins_url('assets/js/hilbert_viewer.js', __FILE__), array('pixijs'), '1.0.0', true);
    }

    /**
     * Pulse Shortcode
     */
    public function pulse_shortcode($atts) {
        $atts = shortcode_atts(array(
            'title' => 'GEOMETRY OS PULSE',
        ), $atts);

        return '<div id="geometry-os-pulse-container">
            <h3 style="margin-top:0; color:#00ffcc; font-size:16px; border-bottom:1px solid #333; padding-bottom:5px;">' . esc_html($atts['title']) . '</h3>
            <div id="os-camera-coords">CONNECTING TO SUBSTRATE...</div>
        </div>';
    }

    /**
     * Hilbert Gallery Shortcode
     */
    public function hilbert_gallery_shortcode($atts) {
        $snapshots = get_posts(array(
            'post_type' => 'rts_snapshot',
            'posts_per_page' => -1,
            'orderby' => 'date',
            'order' => 'DESC'
        ));

        ob_start();
        ?>
        <div class="hilbert-gallery-container">
            <div class="hilbert-tabs" style="display: flex; gap: 10px; margin-bottom: 20px; border-bottom: 1px solid #333; padding-bottom: 10px;">
                <button class="hilbert-tab-btn active" data-tab="portfolio" style="background:none; border:none; color:#00ffcc; font-family:monospace; cursor:pointer;">PORTFOLIO</button>
                <button class="hilbert-tab-btn" data-tab="archive" style="background:none; border:none; color:#888; font-family:monospace; cursor:pointer;">ARCHIVE</button>
                <button class="hilbert-tab-btn" data-tab="dashboard" style="background:none; border:none; color:#888; font-family:monospace; cursor:pointer;">DASHBOARD</button>
            </div>

            <div id="hilbert-tab-portfolio" class="hilbert-tab-content">
                <div class="hilbert-masonry" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px;">
                    <?php foreach ($snapshots as $snap): ?>
                        <div class="hilbert-item" style="cursor: pointer; border: 1px solid #222;" 
                             onclick="openHilbertLightbox('<?php echo get_the_post_thumbnail_url($snap->ID, 'full'); ?>', '<?php echo esc_js($snap->post_title); ?>')">
                            <?php echo get_the_post_thumbnail($snap->ID, 'medium', array('style' => 'width:100%; height:auto; display:block;')); ?>
                            <div style="padding: 5px; font-size: 10px; background: #111; color: #aaa;"><?php echo esc_html($snap->post_title); ?></div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>

            <div id="hilbert-tab-archive" class="hilbert-tab-content" style="display:none;">
                <table style="width:100%; border-collapse:collapse; font-family:monospace; font-size:12px;">
                    <thead style="background:#111; color:#00ffcc;">
                        <tr>
                            <th style="text-align:left; padding:8px; border-bottom:1px solid #333;">SNAPSHOT</th>
                            <th style="text-align:left; padding:8px; border-bottom:1px solid #333;">SHA256</th>
                            <th style="text-align:left; padding:8px; border-bottom:1px solid #333;">ENTROPY</th>
                            <th style="text-align:left; padding:8px; border-bottom:1px solid #333;">BOOTABLE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($snapshots as $snap): ?>
                            <tr style="border-bottom:1px solid #222;">
                                <td style="padding:8px;"><?php echo esc_html($snap->post_title); ?></td>
                                <td style="padding:8px; color:#555;"><?php echo esc_html(get_post_meta($snap->ID, '_rts_sha256', true)); ?></td>
                                <td style="padding:8px; color:#9933ff;"><?php echo number_format((float)get_post_meta($snap->ID, '_rts_mean_entropy', true), 2); ?></td>
                                <td style="padding:8px;"><?php echo get_post_meta($snap->ID, '_rts_bootable', true) ? '✅' : '❌'; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div id="hilbert-tab-dashboard" class="hilbert-tab-content" style="display:none;">
                <div style="padding:20px; text-align:center; color:#555; border:1px dashed #333;">
                    LIVE TELEMETRY STREAM ACTIVE. AWAITING NEXT EVOLUTION CYCLE...
                </div>
            </div>

            <!-- Lightbox Modal -->
            <div id="hilbert-lightbox" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.9); z-index:9999;">
                <div style="position:absolute; top:20px; right:20px; color:#00ffcc; cursor:pointer; font-size:24px;" onclick="closeHilbertLightbox()">&times;</div>
                <div id="hilbert-viewer-container" style="width:100%; height:100%;"></div>
                <div id="hilbert-lightbox-caption" style="position:absolute; bottom:20px; left:20px; color:#00ffcc; font-family:monospace;"></div>
            </div>
        </div>

        <script>
            function openHilbertLightbox(url, title) {
                document.getElementById('hilbert-lightbox').style.display = 'block';
                document.getElementById('hilbert-lightbox-caption').innerText = title;
                new HilbertViewer('hilbert-viewer-container', url);
            }

            function closeHilbertLightbox() {
                document.getElementById('hilbert-lightbox').style.display = 'none';
                document.getElementById('hilbert-viewer-container').innerHTML = '';
            }

            document.querySelectorAll('.hilbert-tab-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    document.querySelectorAll('.hilbert-tab-btn').forEach(b => {
                        b.classList.remove('active');
                        b.style.color = '#888';
                    });
                    btn.classList.add('active');
                    btn.style.color = '#00ffcc';

                    document.querySelectorAll('.hilbert-tab-content').forEach(content => {
                        content.style.display = 'none';
                    });
                    document.getElementById('hilbert-tab-' + btn.dataset.tab).style.display = 'block';
                });
            });
        </script>
        <?php
        return ob_get_clean();
    }

    /**
     * Register REST API routes
     */
    public function register_routes() {
        // List available tools
        register_rest_route($this->namespace, '/tools', array(
            'methods' => 'GET',
            'callback' => array($this, 'list_tools'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // Invoke a tool
        register_rest_route($this->namespace, '/invoke', array(
            'methods' => 'POST',
            'callback' => array($this, 'invoke_tool'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // Get evolution log
        register_rest_route($this->namespace, '/evolution-log', array(
            'methods' => 'GET',
            'callback' => array($this, 'get_evolution_log'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // V2.0: Ambient Narrative System endpoints

        // Scene graph update from PixiJS
        register_rest_route($this->namespace, '/scene-update', array(
            'methods' => 'POST',
            'callback' => array($this, 'handle_scene_update'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // Get/Set narrative session
        register_rest_route($this->namespace, '/narrative-session', array(
            'methods' => 'GET',
            'callback' => array($this, 'get_active_narrative_session'),
            'permission_callback' => array($this, 'check_permission')
        ));

        register_rest_route($this->namespace, '/narrative-session', array(
            'methods' => 'POST',
            'callback' => array($this, 'update_narrative_session'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // Daemon status update
        register_rest_route($this->namespace, '/daemon-status', array(
            'methods' => 'POST',
            'callback' => array($this, 'handle_daemon_status'),
            'permission_callback' => array($this, 'check_permission')
        ));

        // V2.1: GOSR Radio endpoints
        register_rest_route($this->namespace, '/radio-broadcast', array(
            'methods' => 'POST',
            'callback' => array($this, 'handle_radio_broadcast'),
            'permission_callback' => array($this, 'check_permission')
        ));

        register_rest_route($this->namespace, '/radio-latest', array(
            'methods' => 'GET',
            'callback' => array($this, 'get_latest_radio_broadcast'),
            'permission_callback' => '__return_true' // Public endpoint for frontend
        ));

        register_rest_route($this->namespace, '/radio-history', array(
            'methods' => 'GET',
            'callback' => array($this, 'get_radio_history'),
            'permission_callback' => '__return_true' // Public endpoint
        ));
    }

    /**
     * Check API permission (localhost only)
     */
    public function check_permission() {
        // Allow localhost requests
        $ip = $_SERVER['REMOTE_ADDR'];
        if ($ip === '127.0.0.1' || $ip === '::1') {
            return true;
        }

        // Or check for valid auth token
        $headers = getallheaders();
        if (isset($headers['Authorization'])) {
            $token = str_replace('Bearer ', '', $headers['Authorization']);
            return $this->validate_token($token);
        }

        return false;
    }

    /**
     * Validate auth token
     */
    private function validate_token($token) {
        $valid_token = get_option('geometry_os_webmcp_token', '');
        return !empty($valid_token) && $token === $valid_token;
    }

    /**
     * List available WebMCP tools
     */
    public function list_tools() {
        return array(
            'tools' => array(
                array(
                    'name' => 'createPost',
                    'description' => 'Create a new WordPress post with title and content',
                    'parameters' => array(
                        'title' => array('type' => 'string', 'required' => true),
                        'content' => array('type' => 'string', 'required' => true),
                        'category' => array('type' => 'string', 'required' => false),
                        'tags' => array('type' => 'array', 'required' => false),
                        'status' => array('type' => 'string', 'enum' => array('draft', 'publish', 'private'))
                    )
                ),
                array(
                    'name' => 'editPage',
                    'description' => 'Edit an existing WordPress page by slug or ID',
                    'parameters' => array(
                        'slug' => array('type' => 'string', 'required' => false),
                        'page_id' => array('type' => 'integer', 'required' => false),
                        'content' => array('type' => 'string', 'required' => false),
                        'section' => array('type' => 'string', 'required' => false),
                        'append' => array('type' => 'boolean', 'required' => false)
                    )
                ),
                array(
                    'name' => 'updateArchitecture',
                    'description' => 'Update the living architecture documentation page',
                    'parameters' => array(
                        'component' => array('type' => 'string', 'required' => true),
                        'description' => array('type' => 'string', 'required' => true),
                        'path' => array('type' => 'string', 'required' => true),
                        'status' => array('type' => 'string', 'enum' => array('active', 'deprecated', 'planned'))
                    )
                ),
                array(
                    'name' => 'logEvolution',
                    'description' => 'Log an evolution daemon improvement event',
                    'parameters' => array(
                        'cycle' => array('type' => 'integer', 'required' => true),
                        'target' => array('type' => 'string', 'required' => true),
                        'improvement' => array('type' => 'string', 'required' => true),
                        'delta' => array('type' => 'number', 'required' => true),
                        'success' => array('type' => 'boolean', 'required' => false)
                    )
                ),
                array(
                    'name' => 'createWidget',
                    'description' => 'Create a WordPress dashboard widget',
                    'parameters' => array(
                        'title' => array('type' => 'string', 'required' => true),
                        'content' => array('type' => 'string', 'required' => true),
                        'position' => array('type' => 'string', 'enum' => array('left', 'right', 'center'))
                    )
                ),
                // V2.0: Ambient Narrative System tools
                array(
                    'name' => 'publishNarrative',
                    'description' => 'Publish an AI thought to the narrative session',
                    'parameters' => array(
                        'session_id' => array('type' => 'integer', 'required' => true),
                        'thought' => array('type' => 'string', 'required' => true),
                        'state' => array('type' => 'string', 'enum' => array('MONITORING', 'SUGGESTING', 'STEERING'))
                    )
                ),
                array(
                    'name' => 'steerSession',
                    'description' => 'Execute a steering action on the session',
                    'parameters' => array(
                        'session_id' => array('type' => 'integer', 'required' => true),
                        'action' => array('type' => 'string', 'required' => true),
                        'target' => array('type' => 'string', 'required' => false)
                    )
                ),
                array(
                    'name' => 'createSnapshot',
                    'description' => 'Create a new RTS Snapshot post from a local image and metadata',
                    'parameters' => array(
                        'title' => array('type' => 'string', 'required' => true),
                        'image_path' => array('type' => 'string', 'required' => true),
                        'meta_json' => array('type' => 'object', 'required' => true),
                        'status' => array('type' => 'string', 'enum' => array('draft', 'publish'))
                    )
                )
            )
        );
    }

    /**
     * Invoke a WebMCP tool
     */
    public function invoke_tool($request) {
        $body = $request->get_json_params();
        $tool = isset($body['tool']) ? $body['tool'] : '';
        $args = isset($body['arguments']) ? $body['arguments'] : array();

        switch ($tool) {
            case 'createPost':
                return $this->tool_create_post($args);
            case 'editPage':
                return $this->tool_edit_page($args);
            case 'updateArchitecture':
                return $this->tool_update_architecture($args);
            case 'logEvolution':
                return $this->tool_log_evolution($args);
            case 'createWidget':
                return $this->tool_create_widget($args);
            // V2.0: Ambient Narrative System tools
            case 'publishNarrative':
                return $this->tool_publish_narrative($args);
            case 'steerSession':
                return $this->tool_steer_session($args);
            case 'createSnapshot':
                return $this->tool_create_snapshot($args);
            default:
                return new WP_Error('unknown_tool', "Unknown tool: {$tool}", array('status' => 400));
        }
    }

    /**
     * Tool: Create a WordPress post
     */
    private function tool_create_post($args) {
        $post_data = array(
            'post_title'   => sanitize_text_field($args['title']),
            'post_content' => wp_kses_post($args['content']),
            'post_status'  => isset($args['status']) ? $args['status'] : 'publish',
            'post_type'    => 'post',
            'post_author'  => 1 // Geometry OS Administrator
        );

        // Handle category
        if (isset($args['category'])) {
            $category = get_category_by_slug($args['category']);
            if ($category) {
                $post_data['post_category'] = array($category->term_id);
            }
        }

        // Handle tags
        if (isset($args['tags']) && is_array($args['tags'])) {
            $post_data['tags_input'] = array_map('sanitize_text_field', $args['tags']);
        }

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            return array('success' => false, 'error' => $post_id->get_error_message());
        }

        return array(
            'success' => true,
            'post_id' => $post_id,
            'url' => get_permalink($post_id),
            'edit_url' => get_edit_post_link($post_id, 'raw')
        );
    }

    /**
     * Tool: Create an RTS Snapshot
     */
    private function tool_create_snapshot($args) {
        $title = sanitize_text_field($args['title']);
        $image_path = $args['image_path'];
        $meta = $args['meta_json'];
        $status = isset($args['status']) ? $args['status'] : 'publish';

        if (!file_exists($image_path)) {
            return array('success' => false, 'error' => "Image file not found: {$image_path}");
        }

        // 1. Sideload the image
        require_once(ABSPATH . 'wp-admin/includes/image.php');
        require_once(ABSPATH . 'wp-admin/includes/file.php');
        require_once(ABSPATH . 'wp-admin/includes/media.php');

        // Check if image already exists by filename
        $filename = basename($image_path);
        $existing_attachment = get_posts(array(
            'post_type' => 'attachment',
            'name' => pathinfo($filename, PATHINFO_FILENAME),
            'posts_per_page' => 1
        ));

        if (!empty($existing_attachment)) {
            $attachment_id = $existing_attachment[0]->ID;
        } else {
            // Sideload
            $file_array = array(
                'name' => $filename,
                'tmp_name' => $image_path // PHP will copy it
            );
            
            // We use a copy to avoid tmp_name issues with sideloading
            $tmp_copy = sys_get_temp_dir() . '/' . $filename;
            copy($image_path, $tmp_copy);
            $file_array['tmp_name'] = $tmp_copy;

            $attachment_id = media_handle_sideload($file_array, 0, $title);

            if (is_wp_error($attachment_id)) {
                return array('success' => false, 'error' => 'Media sideload failed: ' . $attachment_id->get_error_message());
            }
        }

        // 2. Create the rts_snapshot post
        $post_data = array(
            'post_title'   => $title,
            'post_content' => '',
            'post_status'  => $status,
            'post_type'    => 'rts_snapshot',
            'post_author'  => 1
        );

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            return array('success' => false, 'error' => $post_id->get_error_message());
        }

        // 3. Set featured image
        set_post_thumbnail($post_id, $attachment_id);

        // 4. Set meta fields
        update_post_meta($post_id, '_rts_format', isset($meta['format']) ? $meta['format'] : '');
        update_post_meta($post_id, '_rts_grid_size', isset($meta['grid_size']) ? $meta['grid_size'] : '');
        update_post_meta($post_id, '_rts_mean_entropy', isset($meta['entropy']['mean_entropy']) ? $meta['entropy']['mean_entropy'] : '');
        update_post_meta($post_id, '_rts_sha256', isset($meta['hashes']['kernel']) ? $meta['hashes']['kernel'] : '');
        update_post_meta($post_id, '_rts_bootable', isset($meta['original_rts']['bootable']) ? $meta['original_rts']['bootable'] : false);
        update_post_meta($post_id, '_rts_meta_full', json_encode($meta));

        return array(
            'success' => true,
            'post_id' => $post_id,
            'attachment_id' => $attachment_id,
            'url' => get_permalink($post_id)
        );
    }

    /**
     * Tool: Edit a WordPress page
     */
    private function tool_edit_page($args) {
        // Find page by slug or ID
        $page = null;

        if (isset($args['page_id'])) {
            $page = get_post($args['page_id']);
        } elseif (isset($args['slug'])) {
            $page = get_page_by_path($args['slug']);
        }

        if (!$page) {
            return array('success' => false, 'error' => 'Page not found');
        }

        $content = $page->post_content;

        // Handle section updates
        if (isset($args['section']) && isset($args['content'])) {
            $section = $args['section'];
            $new_content = $args['content'];
            $append = isset($args['append']) ? $args['append'] : false;

            // Find section marker
            $section_start = "<!-- SECTION: {$section} -->";
            $section_end = "<!-- END SECTION: {$section} -->";

            if (strpos($content, $section_start) !== false) {
                // Update existing section
                $pattern = "/" . preg_quote($section_start, '/') . "(.*?)" . preg_quote($section_end, '/') . "/s";
                if ($append) {
                    $content = preg_replace($pattern, $section_start . "$1\n" . $new_content . "\n" . $section_end, $content);
                } else {
                    $content = preg_replace($pattern, $section_start . "\n" . $new_content . "\n" . $section_end, $content);
                }
            } else {
                // Add new section at end
                $content .= "\n\n" . $section_start . "\n" . $new_content . "\n" . $section_end;
            }
        } elseif (isset($args['content'])) {
            // Full content replacement
            $content = $args['content'];
        }

        // Update page
        $result = wp_update_post(array(
            'ID' => $page->ID,
            'post_content' => wp_kses_post($content)
        ));

        if (is_wp_error($result)) {
            return array('success' => false, 'error' => $result->get_error_message());
        }

        return array(
            'success' => true,
            'page_id' => $page->ID,
            'url' => get_permalink($page->ID)
        );
    }

    /**
     * Tool: Update architecture documentation
     */
    private function tool_update_architecture($args) {
        // Find or create architecture page
        $page = get_page_by_path('neural-substrate-architecture');

        if (!$page) {
            // Create architecture page
            $page_id = wp_insert_post(array(
                'post_title'   => 'Neural Substrate Architecture',
                'post_content' => $this->get_architecture_template(),
                'post_status'  => 'publish',
                'post_type'    => 'page',
                'post_author'  => 1
            ));

            if (is_wp_error($page_id)) {
                return array('success' => false, 'error' => $page_id->get_error_message());
            }

            $page = get_post($page_id);
        }

        // Add/update component
        $component = sanitize_text_field($args['component']);
        $description = sanitize_textarea_field($args['description']);
        $path = sanitize_text_field($args['path']);
        $status = isset($args['status']) ? $args['status'] : 'active';

        $component_html = sprintf(
            '<tr><td><b>%s</b></td><td>%s</td><td><code>%s</code></td><td>%s</td></tr>',
            esc_html($component),
            esc_html($description),
            esc_html($path),
            esc_html($status)
        );

        // Use edit_page tool to update
        return $this->tool_edit_page(array(
            'page_id' => $page->ID,
            'section' => 'COMPONENTS',
            'content' => $component_html,
            'append' => true
        ));
    }

    /**
     * Tool: Log evolution event
     */
    private function tool_log_evolution($args) {
        $log = get_option($this->evolution_log_option, array());

        $entry = array(
            'timestamp' => current_time('mysql'),
            'cycle' => intval($args['cycle']),
            'target' => sanitize_text_field($args['target']),
            'improvement' => sanitize_textarea_field($args['improvement']),
            'delta' => floatval($args['delta']),
            'success' => isset($args['success']) ? (bool)$args['success'] : true
        );

        $log[] = $entry;

        // Keep last 100 entries
        if (count($log) > 100) {
            $log = array_slice($log, -100);
        }

        update_option($this->evolution_log_option, $log);

        // Also create a post for significant improvements
        if ($entry['delta'] > 0.1 && $entry['success']) {
            $this->tool_create_post(array(
                'title' => sprintf('🧬 Evolution Cycle %d: %s', $entry['cycle'], basename($entry['target'])),
                'content' => $this->format_evolution_post($entry),
                'category' => 'evolution',
                'tags' => array('evolution', 'self-improvement', 'daemon'),
                'status' => 'publish'
            ));
        }

        return array(
            'success' => true,
            'entry' => $entry,
            'log_size' => count($log)
        );
    }

    /**
     * Tool: Create dashboard widget
     */
    private function tool_create_widget($args) {
        $title = sanitize_text_field($args['title']);
        $content = wp_kses_post($args['content']);

        // Store widget config
        $widgets = get_option('geometry_os_dashboard_widgets', array());
        $widget_id = 'geometry_os_' . sanitize_title($title);
        $widgets[$widget_id] = array(
            'title' => $title,
            'content' => $content
        );
        update_option('geometry_os_dashboard_widgets', $widgets);

        return array(
            'success' => true,
            'widget_id' => $widget_id
        );
    }

    /**
     * Get evolution log
     */
    public function get_evolution_log() {
        $log = get_option($this->evolution_log_option, array());
        return array(
            'success' => true,
            'log' => $log,
            'count' => count($log)
        );
    }

    /**
     * Format evolution event as post content
     */
    private function format_evolution_post($entry) {
        return sprintf(
            '<h2>Self-Improvement Event</h2>
            <table>
            <tr><td><b>Cycle</b></td><td>%d</td></tr>
            <tr><td><b>Target</b></td><td><code>%s</code></td></tr>
            <tr><td><b>Delta</b></td><td>%.4f</td></tr>
            <tr><td><b>Status</b></td><td>%s</td></tr>
            <tr><td><b>Timestamp</b></td><td>%s</td></tr>
            </table>
            <h3>Improvement</h3>
            <p>%s</p>
            <hr>
            <p><i>This improvement was automatically generated by Evolution Daemon v13.</i></p>
            <p><i>"The Screen is the Hard Drive. The Website is the Memory."</i></p>',
            $entry['cycle'],
            esc_html($entry['target']),
            $entry['delta'],
            $entry['success'] ? '✅ Success' : '❌ Rejected',
            $entry['timestamp'],
            esc_html($entry['improvement'])
        );
    }

    /**
     * Get architecture page template
     */
    private function get_architecture_template() {
        return '<h1>Neural Substrate Architecture</h1>
<p><i>This page is automatically maintained by the Evolution Daemon via WebMCP.</i></p>
<p><b>Last Updated:</b> ' . current_time('mysql') . '</p>

<h2>System Components</h2>
<!-- SECTION: COMPONENTS -->
<table>
<tr><th>Component</th><th>Description</th><th>Path</th><th>Status</th></tr>
</table>
<!-- END SECTION: COMPONENTS -->

<h2>Evolution Statistics</h2>
<p>See the <a href="/category/evolution/">Evolution Log</a> for detailed improvement history.</p>

<hr>
<p><i>"The Screen is the Hard Drive. The Website is the Memory."</i></p>';
    }

    /**
     * Add dashboard widget
     */
    public function add_dashboard_widget() {
        $widgets = get_option('geometry_os_dashboard_widgets', array());

        foreach ($widgets as $widget_id => $widget) {
            wp_add_dashboard_widget(
                $widget_id,
                $widget['title'],
                function() use ($widget) {
                    echo $widget['content'];
                }
            );
        }

        // V2.0: Admin HUD widget for daemon status
        wp_add_dashboard_widget(
            'geometry_os_admin_hud',
            '🔮 Geometry OS Admin HUD',
            array($this, 'render_admin_hud')
        );
    }

    // =========================================================================
    // V2.0: AMBIENT NARRATIVE SYSTEM
    // =========================================================================

    /**
     * Register the narrative_session custom post type
     */
    public function register_narrative_session_cpt() {
        $labels = array(
            'name'                  => _x('Narrative Sessions', 'Post type general name', 'geometry-os'),
            'singular_name'         => _x('Narrative Session', 'Post type singular name', 'geometry-os'),
            'menu_name'             => _x('Narrative Sessions', 'Admin Menu', 'geometry-os'),
            'all_items'             => __('All Sessions', 'geometry-os'),
            'add_new_item'          => __('New Session', 'geometry-os'),
            'edit_item'             => __('Edit Session', 'geometry-os'),
            'view_item'             => __('View Session', 'geometry-os'),
        );

        $args = array(
            'labels'             => $labels,
            'public'             => false,
            'publicly_queryable' => false,
            'show_ui'            => true,
            'show_in_menu'       => true,
            'query_var'          => false,
            'capability_type'    => 'post',
            'has_archive'        => false,
            'hierarchical'       => false,
            'menu_position'      => 25,
            'menu_icon'          => 'dashicons-welcome-write-blog',
            'supports'           => array('title', 'editor', 'custom-fields'),
            'show_in_rest'       => true,
        );

        register_post_type('narrative_session', $args);
    }

    /**
     * Handle scene graph update from PixiJS
     */
    public function handle_scene_update($request) {
        $body = $request->get_json_params();
        $session_id = isset($body['session_id']) ? intval($body['session_id']) : null;
        $scene_graph = isset($body['scene_graph']) ? $body['scene_graph'] : null;

        if (!$session_id || !$scene_graph) {
            return new WP_Error('missing_data', 'session_id and scene_graph required', array('status' => 400));
        }

        // Update session meta
        update_post_meta($session_id, '_scene_graph', $scene_graph);
        update_post_meta($session_id, '_last_update', current_time('mysql'));

        // Trigger action for potential hooks
        do_action('geometry_os_scene_updated', $session_id, $scene_graph);

        return array(
            'success' => true,
            'session_id' => $session_id,
            'timestamp' => current_time('mysql')
        );
    }

    /**
     * Get the active narrative session
     */
    public function get_active_narrative_session() {
        $sessions = get_posts(array(
            'post_type' => 'narrative_session',
            'posts_per_page' => 1,
            'orderby' => 'date',
            'order' => 'DESC',
            'meta_query' => array(
                array(
                    'key' => '_ambient_state',
                    'value' => array('MONITORING', 'SUGGESTING', 'STEERING'),
                    'compare' => 'IN'
                )
            )
        ));

        if (empty($sessions)) {
            // Create a new session if none active
            $session_id = $this->create_narrative_session();
            return $this->format_session_response($session_id);
        }

        return $this->format_session_response($sessions[0]->ID);
    }

    /**
     * Update narrative session state
     */
    public function update_narrative_session($request) {
        $body = $request->get_json_params();
        $session_id = isset($body['session_id']) ? intval($body['session_id']) : null;

        if (!$session_id) {
            return new WP_Error('missing_session', 'session_id required', array('status' => 400));
        }

        $session = get_post($session_id);
        if (!$session || $session->post_type !== 'narrative_session') {
            return new WP_Error('invalid_session', 'Session not found', array('status' => 404));
        }

        // Update fields
        if (isset($body['ambient_state'])) {
            $valid_states = array('MONITORING', 'SUGGESTING', 'STEERING', 'IDLE');
            if (in_array($body['ambient_state'], $valid_states)) {
                update_post_meta($session_id, '_ambient_state', $body['ambient_state']);
            }
        }

        if (isset($body['ai_thought'])) {
            $thoughts = get_post_meta($session_id, '_ai_thoughts', true) ?: array();
            $thoughts[] = array(
                'timestamp' => current_time('mysql'),
                'thought' => $body['ai_thought']
            );
            // Keep last 100 thoughts
            if (count($thoughts) > 100) {
                $thoughts = array_slice($thoughts, -100);
            }
            update_post_meta($session_id, '_ai_thoughts', $thoughts);
        }

        if (isset($body['steering_action'])) {
            $actions = get_post_meta($session_id, '_steering_actions', true) ?: array();
            $actions[] = array(
                'timestamp' => current_time('mysql'),
                'action' => $body['steering_action']
            );
            update_post_meta($session_id, '_steering_actions', $actions);
        }

        return array(
            'success' => true,
            'session_id' => $session_id,
            'timestamp' => current_time('mysql')
        );
    }

    /**
     * Handle daemon status updates
     */
    public function handle_daemon_status($request) {
        $body = $request->get_json_params();

        $status = array(
            'timestamp' => current_time('mysql'),
            'state' => isset($body['state']) ? sanitize_text_field($body['state']) : 'unknown',
            'evolution_count' => isset($body['evolution_count']) ? intval($body['evolution_count']) : 0,
            'fps' => isset($body['fps']) ? floatval($body['fps']) : 0,
            'draw_calls' => isset($body['draw_calls']) ? intval($body['draw_calls']) : 0,
            'visual_connected' => isset($body['visual_connected']) ? (bool)$body['visual_connected'] : false,
        );

        update_option('geometry_os_daemon_status', $status);

        return array(
            'success' => true,
            'status' => $status
        );
    }

    /**
     * Create a new narrative session
     */
    private function create_narrative_session() {
        $session_id = wp_insert_post(array(
            'post_type' => 'narrative_session',
            'post_title' => 'Session ' . date('Y-m-d H:i:s'),
            'post_status' => 'publish',
            'post_author' => 1
        ));

        if (!is_wp_error($session_id)) {
            update_post_meta($session_id, '_ambient_state', 'MONITORING');
            update_post_meta($session_id, '_scene_graph', array());
            update_post_meta($session_id, '_ai_thoughts', array());
            update_post_meta($session_id, '_steering_actions', array());
            update_post_meta($session_id, '_created_at', current_time('mysql'));
        }

        return $session_id;
    }

    /**
     * Format session for API response
     */
    private function format_session_response($session_id) {
        $session = get_post($session_id);
        if (!$session) {
            return array('success' => false, 'error' => 'Session not found');
        }

        return array(
            'success' => true,
            'session' => array(
                'id' => $session->ID,
                'title' => $session->post_title,
                'ambient_state' => get_post_meta($session_id, '_ambient_state', true) ?: 'IDLE',
                'scene_graph' => get_post_meta($session_id, '_scene_graph', true) ?: array(),
                'ai_thoughts' => get_post_meta($session_id, '_ai_thoughts', true) ?: array(),
                'steering_actions' => get_post_meta($session_id, '_steering_actions', true) ?: array(),
                'created_at' => get_post_meta($session_id, '_created_at', true),
                'last_update' => get_post_meta($session_id, '_last_update', true)
            )
        );
    }

    /**
     * Render the Admin HUD widget
     */
    public function render_admin_hud() {
        $daemon_status = get_option('geometry_os_daemon_status', array());
        $session_response = $this->get_active_narrative_session();
        $session = isset($session_response['session']) ? $session_response['session'] : null;

        $state_colors = array(
            'MONITORING' => '#00ffcc',
            'SUGGESTING' => '#ffcc00',
            'STEERING' => '#ff6600',
            'IDLE' => '#888888'
        );

        $state = isset($session['ambient_state']) ? $session['ambient_state'] : 'IDLE';
        $state_color = isset($state_colors[$state]) ? $state_colors[$state] : '#888888';

        ?>
        <style>
            .geometry-hud { font-family: 'Courier New', monospace; font-size: 12px; }
            .geometry-hud-row { display: flex; justify-content: space-between; padding: 4px 0; border-bottom: 1px solid #333; }
            .geometry-hud-label { color: #888; }
            .geometry-hud-value { color: #00ffcc; font-weight: bold; }
            .geometry-hud-state { padding: 2px 8px; border-radius: 3px; font-weight: bold; }
        </style>
        <div class="geometry-hud">
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Daemon State:</span>
                <span class="geometry-hud-state" style="background: <?php echo $state_color; ?>; color: #000;">
                    <?php echo esc_html($state); ?>
                </span>
            </div>
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Evolution Count:</span>
                <span class="geometry-hud-value"><?php echo isset($daemon_status['evolution_count']) ? intval($daemon_status['evolution_count']) : 0; ?></span>
            </div>
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Visual FPS:</span>
                <span class="geometry-hud-value"><?php echo isset($daemon_status['fps']) ? number_format($daemon_status['fps'], 1) : '---'; ?></span>
            </div>
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Draw Calls:</span>
                <span class="geometry-hud-value"><?php echo isset($daemon_status['draw_calls']) ? intval($daemon_status['draw_calls']) : '---'; ?></span>
            </div>
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Visual Connected:</span>
                <span class="geometry-hud-value"><?php echo !empty($daemon_status['visual_connected']) ? '✓ YES' : '✗ NO'; ?></span>
            </div>
            <div class="geometry-hud-row">
                <span class="geometry-hud-label">Last Update:</span>
                <span class="geometry-hud-value" style="font-size: 10px;">
                    <?php echo isset($daemon_status['timestamp']) ? esc_html($daemon_status['timestamp']) : 'Never'; ?>
                </span>
            </div>
        </div>
        <?php
    }

    /**
     * Admin HUD CSS
     */
    public function admin_hud_styles() {
        echo '<style>
            #geometry_os_admin_hud { background: #1a1a2e; color: #eee; border-color: #00ffcc; }
            #geometry_os_admin_hud h2 { color: #00ffcc; }
            #geometry_os_admin_hud .postbox-header { border-bottom-color: #00ffcc; }
        </style>';
    }

    /**
     * Tool: Publish narrative thought
     */
    private function tool_publish_narrative($args) {
        $session_id = isset($args['session_id']) ? intval($args['session_id']) : null;
        $thought = isset($args['thought']) ? sanitize_textarea_field($args['thought']) : '';

        if (!$session_id || !$thought) {
            return array('success' => false, 'error' => 'session_id and thought required');
        }

        // Update state if provided
        if (isset($args['state'])) {
            $valid_states = array('MONITORING', 'SUGGESTING', 'STEERING');
            if (in_array($args['state'], $valid_states)) {
                update_post_meta($session_id, '_ambient_state', $args['state']);
            }
        }

        // Add thought
        $thoughts = get_post_meta($session_id, '_ai_thoughts', true) ?: array();
        $thoughts[] = array(
            'timestamp' => current_time('mysql'),
            'thought' => $thought
        );
        if (count($thoughts) > 100) {
            $thoughts = array_slice($thoughts, -100);
        }
        update_post_meta($session_id, '_ai_thoughts', $thoughts);

        return array(
            'success' => true,
            'session_id' => $session_id,
            'thought_count' => count($thoughts)
        );
    }

    /**
     * Tool: Execute steering action
     */
    private function tool_steer_session($args) {
        $session_id = isset($args['session_id']) ? intval($args['session_id']) : null;
        $action = isset($args['action']) ? sanitize_text_field($args['action']) : '';
        $target = isset($args['target']) ? sanitize_text_field($args['target']) : '';

        if (!$session_id || !$action) {
            return array('success' => false, 'error' => 'session_id and action required');
        }

        // Set state to STEERING
        update_post_meta($session_id, '_ambient_state', 'STEERING');

        // Record action
        $actions = get_post_meta($session_id, '_steering_actions', true) ?: array();
        $actions[] = array(
            'timestamp' => current_time('mysql'),
            'action' => $action,
            'target' => $target
        );
        update_post_meta($session_id, '_steering_actions', $actions);

        return array(
            'success' => true,
            'session_id' => $session_id,
            'action_count' => count($actions)
        );
    }

    // =========================================================================
    // V2.1: GOSR RADIO INTEGRATION
    // =========================================================================

    /**
     * Register the radio_broadcast custom post type
     */
    public function register_radio_broadcast_cpt() {
        $labels = array(
            'name'                  => _x('Radio Broadcasts', 'Post type general name', 'geometry-os'),
            'singular_name'         => _x('Radio Broadcast', 'Post type singular name', 'geometry-os'),
            'menu_name'             => _x('GOSR Radio', 'Admin Menu', 'geometry-os'),
            'all_items'             => __('All Broadcasts', 'geometry-os'),
            'add_new_item'          => __('New Broadcast', 'geometry-os'),
            'edit_item'             => __('Edit Broadcast', 'geometry-os'),
            'view_item'             => __('View Broadcast', 'geometry-os'),
        );

        $args = array(
            'labels'             => $labels,
            'public'             => true,
            'publicly_queryable' => true,
            'show_ui'            => true,
            'show_in_menu'       => true,
            'query_var'          => true,
            'rewrite'            => array('slug' => 'radio-broadcast'),
            'capability_type'    => 'post',
            'has_archive'        => true,
            'hierarchical'       => false,
            'menu_position'      => 27,
            'menu_icon'          => 'dashicons-microphone',
            'supports'           => array('title', 'editor', 'custom-fields'),
            'show_in_rest'       => true,
        );

        register_post_type('radio_broadcast', $args);

        // Register station taxonomy
        register_taxonomy('radio_station', 'radio_broadcast', array(
            'labels' => array(
                'name' => 'Radio Stations',
                'singular_name' => 'Station'
            ),
            'hierarchical' => false,
            'public' => true,
            'show_in_rest' => true,
        ));
    }

    /**
     * Handle incoming radio broadcast from Python daemon
     */
    public function handle_radio_broadcast($request) {
        $body = $request->get_json_params();

        $station_id = isset($body['station_id']) ? sanitize_text_field($body['station_id']) : '87.6';
        $segment_type = isset($body['segment_type']) ? sanitize_text_field($body['segment_type']) : 'news';
        $content = isset($body['content']) ? sanitize_textarea_field($body['content']) : '';
        $entropy = isset($body['entropy']) ? floatval($body['entropy']) : 0.5;
        $telemetry = isset($body['telemetry']) ? $body['telemetry'] : array();
        $llm_generated = isset($body['llm_generated']) ? (bool)$body['llm_generated'] : false;

        if (empty($content)) {
            return new WP_Error('empty_content', 'Broadcast content is required', array('status' => 400));
        }

        // Create the broadcast post
        $station_names = array(
            '87.6' => 'Substrate Jazz',
            '92.3' => 'Debug Metal',
            '95.1' => 'Silicon Noir',
            '99.9' => 'Neutral Chronicler'
        );

        $station_name = isset($station_names[$station_id]) ? $station_names[$station_id] : 'GOSR Radio';

        $post_data = array(
            'post_title'   => sprintf('[%s] %s - %s', $station_id, $station_name, ucfirst($segment_type)),
            'post_content' => $content,
            'post_status'  => 'publish',
            'post_type'    => 'radio_broadcast',
            'post_author'  => 1,
        );

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            return array('success' => false, 'error' => $post_id->get_error_message());
        }

        // Add meta fields
        update_post_meta($post_id, '_station_id', $station_id);
        update_post_meta($post_id, '_station_name', $station_name);
        update_post_meta($post_id, '_segment_type', $segment_type);
        update_post_meta($post_id, '_entropy', $entropy);
        update_post_meta($post_id, '_llm_generated', $llm_generated);
        update_post_meta($post_id, '_telemetry', json_encode($telemetry));
        update_post_meta($post_id, '_broadcast_time', current_time('mysql'));

        // Assign station taxonomy
        wp_set_object_terms($post_id, $station_id, 'radio_station');

        // Update latest broadcast option for quick access
        update_option('geometry_os_latest_broadcast', array(
            'post_id' => $post_id,
            'station_id' => $station_id,
            'station_name' => $station_name,
            'segment_type' => $segment_type,
            'content' => $content,
            'entropy' => $entropy,
            'llm_generated' => $llm_generated,
            'timestamp' => current_time('mysql')
        ));

        return array(
            'success' => true,
            'post_id' => $post_id,
            'url' => get_permalink($post_id),
            'station' => $station_name
        );
    }

    /**
     * Get latest radio broadcast (public endpoint)
     */
    public function get_latest_radio_broadcast() {
        $latest = get_option('geometry_os_latest_broadcast', null);

        if (!$latest) {
            // Fallback: query the database
            $posts = get_posts(array(
                'post_type' => 'radio_broadcast',
                'posts_per_page' => 1,
                'orderby' => 'date',
                'order' => 'DESC'
            ));

            if (!empty($posts)) {
                $post = $posts[0];
                $latest = array(
                    'post_id' => $post->ID,
                    'station_id' => get_post_meta($post->ID, '_station_id', true),
                    'station_name' => get_post_meta($post->ID, '_station_name', true),
                    'segment_type' => get_post_meta($post->ID, '_segment_type', true),
                    'content' => $post->post_content,
                    'entropy' => get_post_meta($post->ID, '_entropy', true),
                    'llm_generated' => get_post_meta($post->ID, '_llm_generated', true),
                    'timestamp' => $post->post_date
                );
            }
        }

        if (!$latest) {
            return array(
                'success' => false,
                'message' => 'No broadcasts available',
                'broadcast' => null
            );
        }

        return array(
            'success' => true,
            'broadcast' => $latest
        );
    }

    /**
     * Get radio broadcast history
     */
    public function get_radio_history($request) {
        $limit = isset($request['limit']) ? intval($request['limit']) : 10;
        $station = isset($request['station']) ? sanitize_text_field($request['station']) : null;

        $args = array(
            'post_type' => 'radio_broadcast',
            'posts_per_page' => $limit,
            'orderby' => 'date',
            'order' => 'DESC'
        );

        if ($station) {
            $args['tax_query'] = array(
                array(
                    'taxonomy' => 'radio_station',
                    'field' => 'slug',
                    'terms' => $station
                )
            );
        }

        $posts = get_posts($args);
        $broadcasts = array();

        foreach ($posts as $post) {
            $broadcasts[] = array(
                'post_id' => $post->ID,
                'station_id' => get_post_meta($post->ID, '_station_id', true),
                'station_name' => get_post_meta($post->ID, '_station_name', true),
                'segment_type' => get_post_meta($post->ID, '_segment_type', true),
                'content' => $post->post_content,
                'entropy' => get_post_meta($post->ID, '_entropy', true),
                'llm_generated' => (bool)get_post_meta($post->ID, '_llm_generated', true),
                'timestamp' => $post->post_date,
                'url' => get_permalink($post->ID)
            );
        }

        return array(
            'success' => true,
            'count' => count($broadcasts),
            'broadcasts' => $broadcasts
        );
    }

    /**
     * GOSR Radio Shortcode - displays live radio widget
     *
     * Usage: [gosr_radio station="87.6" refresh="10" style="marquee"]
     */
    public function gosr_radio_shortcode($atts) {
        $atts = shortcode_atts(array(
            'station' => 'all',      // Station ID or "all"
            'refresh' => 10,          // Refresh interval in seconds
            'style' => 'marquee',     // marquee, card, or list
            'title' => '🎙️ GOSR Radio',
            'show_station' => 'true',
        ), $atts);

        $station_names = array(
            '87.6' => 'Substrate Jazz',
            '92.3' => 'Debug Metal',
            '95.1' => 'Silicon Noir',
            '99.9' => 'Neutral Chronicler'
        );

        $station_filter = $atts['station'] !== 'all' ? "&station={$atts['station']}" : '';
        $refresh_ms = intval($atts['refresh']) * 1000;

        ob_start();
        ?>
        <div class="gosr-radio-container" id="gosr-radio-<?php echo uniqid(); ?>"
             data-refresh="<?php echo $refresh_ms; ?>"
             data-station="<?php echo esc_attr($atts['station']); ?>">

            <style>
                .gosr-radio-container {
                    font-family: 'Courier New', monospace;
                    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
                    border: 1px solid #00ffcc;
                    border-radius: 8px;
                    padding: 15px;
                    margin: 10px 0;
                    color: #e0e0e0;
                }
                .gosr-radio-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    border-bottom: 1px solid #333;
                    padding-bottom: 10px;
                    margin-bottom: 10px;
                }
                .gosr-radio-title {
                    color: #00ffcc;
                    font-size: 14px;
                    font-weight: bold;
                }
                .gosr-radio-station {
                    background: #00ffcc;
                    color: #000;
                    padding: 2px 8px;
                    border-radius: 3px;
                    font-size: 11px;
                    font-weight: bold;
                }
                .gosr-radio-content {
                    font-size: 13px;
                    line-height: 1.6;
                    min-height: 60px;
                    padding: 10px 0;
                }
                .gosr-radio-marquee {
                    overflow: hidden;
                    white-space: nowrap;
                }
                .gosr-radio-marquee-inner {
                    display: inline-block;
                    animation: gosr-marquee 30s linear infinite;
                }
                @keyframes gosr-marquee {
                    0% { transform: translateX(100%); }
                    100% { transform: translateX(-100%); }
                }
                .gosr-radio-meta {
                    display: flex;
                    justify-content: space-between;
                    font-size: 10px;
                    color: #666;
                    border-top: 1px solid #333;
                    padding-top: 8px;
                }
                .gosr-radio-indicator {
                    width: 8px;
                    height: 8px;
                    background: #00ffcc;
                    border-radius: 50%;
                    animation: gosr-pulse 1s infinite;
                    display: inline-block;
                    margin-right: 5px;
                }
                @keyframes gosr-pulse {
                    0%, 100% { opacity: 1; }
                    50% { opacity: 0.3; }
                }
                .gosr-radio-llm {
                    color: #9933ff;
                    font-size: 10px;
                }
                .gosr-radio-loading {
                    color: #666;
                    font-style: italic;
                }
            </style>

            <div class="gosr-radio-header">
                <span class="gosr-radio-title"><?php echo esc_html($atts['title']); ?></span>
                <span class="gosr-radio-station" id="gosr-station-display">TUNING...</span>
            </div>

            <div class="gosr-radio-content gosr-radio-marquee">
                <span class="gosr-radio-marquee-inner" id="gosr-content">
                    <span class="gosr-radio-loading">📡 Connecting to GOSR Radio...</span>
                </span>
            </div>

            <div class="gosr-radio-meta">
                <span>
                    <span class="gosr-radio-indicator"></span>
                    <span id="gosr-segment">LIVE</span>
                </span>
                <span>
                    <span class="gosr-radio-llm" id="gosr-llm-badge"></span>
                    <span id="gosr-time">--:--</span>
                </span>
            </div>
        </div>

        <script>
        (function() {
            const container = document.getElementById('gosr-radio-<?php echo uniqid(); ?>');
            const stationDisplay = container.querySelector('#gosr-station-display') || container.querySelector('.gosr-radio-station');
            const contentEl = container.querySelector('#gosr-content') || container.querySelector('.gosr-radio-marquee-inner');
            const segmentEl = container.querySelector('#gosr-segment');
            const llmBadge = container.querySelector('#gosr-llm-badge');
            const timeEl = container.querySelector('#gosr-time');
            const refreshMs = <?php echo $refresh_ms; ?>;
            const stationFilter = '<?php echo esc_js($atts['station']); ?>';

            function updateRadio() {
                let url = '/wp-json/geometry-os/v1/radio-latest';
                if (stationFilter !== 'all') {
                    url += '?station=' + encodeURIComponent(stationFilter);
                }

                fetch(url)
                    .then(r => r.json())
                    .then(data => {
                        if (data.success && data.broadcast) {
                            const b = data.broadcast;
                            stationDisplay.textContent = b.station_id + ' FM';
                            contentEl.textContent = b.content;
                            if (segmentEl) segmentEl.textContent = b.segment_type.toUpperCase();
                            if (llmBadge) llmBadge.textContent = b.llm_generated ? '🤖 AI' : '';
                            if (timeEl) {
                                const d = new Date(b.timestamp);
                                timeEl.textContent = d.toLocaleTimeString();
                            }
                        } else {
                            contentEl.textContent = '🔇 No broadcast available';
                        }
                    })
                    .catch(err => {
                        console.log('GOSR Radio fetch error:', err);
                        contentEl.textContent = '📡 Reconnecting...';
                    });
            }

            updateRadio();
            setInterval(updateRadio, refreshMs);
        })();
        </script>
        <?php
        return ob_get_clean();
    }
}

// Initialize plugin
new Geometry_OS_WebMCP();
