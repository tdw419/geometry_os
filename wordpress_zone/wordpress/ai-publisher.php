<?php
/**
 * AI Publisher Helper for Geometry OS (Unified Bridge)
 * Allows both Browser-based WebMCP agents and Backend Python agents 
 * to interact with the WordPress Semantic District.
 * 
 * SECURITY: Only accessible from 127.0.0.1
 */

header('Content-Type: application/json');

if ($_SERVER['REMOTE_ADDR'] !== '127.0.0.1' && $_SERVER['REMOTE_ADDR'] !== '::1') {
    header('HTTP/1.1 403 Forbidden');
    die(json_encode(array('success' => false, 'error' => 'Local access only.')));
}

require_once('wp-load.php');

$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (!$data) {
    header('HTTP/1.1 400 Bad Request');
    die(json_encode(array('success' => false, 'error' => 'Invalid JSON input.')));
}

// ─────────────────────────────────────────────────────────────
// Dispatcher Logic
// ─────────────────────────────────────────────────────────────

$action = null;
$args = array();

// Handle URL-based action (e.g. ai-publisher.php/tools or ai-publisher.php/invoke)
$path_info = isset($_SERVER['PATH_INFO']) ? trim($_SERVER['PATH_INFO'], '/') : '';
if ($path_info === 'tools') {
    $action = 'tools';
} else if ($path_info === 'invoke' || !$path_info) {
    if (isset($data['tool'])) {
        $action = $data['tool'];
        $args = isset($data['arguments']) ? $data['arguments'] : array();
    } else if (isset($data['action'])) {
        $action = $data['action'];
        $args = $data;
    }
}

// Fallback for simple POST
if (!$action && isset($data['title']) && isset($data['content'])) {
    $action = 'publish';
    $args = $data;
}

switch ($action) {
    // Unified Publish Actions
    case 'publish':
    case 'createPost':
        handle_publish($args);
        break;
        
    case 'get_stats':
    case 'getStats':
        handle_get_stats();
        break;
        
    case 'list_posts':
    case 'listPosts':
        handle_list_posts($args);
        break;
        
    case 'get_categories':
    case 'getCategories':
        handle_get_categories();
        break;

    // Evolution Specific Actions
    case 'logEvolution':
        handle_log_evolution($args);
        break;
        
    case 'updateArchitecture':
        handle_update_architecture($args);
        break;
        
    case 'editPage':
        handle_edit_page($args);
        break;

    case 'createWidget':
        handle_create_widget($args);
        break;

    // Discovery (for EvolutionWebMCPBridge._check_availability)
    case 'tools':
        handle_list_tools();
        break;

    // Directive Console API (Command Console)
    case 'getDirectives':
        handle_get_directives();
        break;

    case 'markDirectiveProcessed':
        handle_mark_directive_processed($args);
        break;

    case 'postDirectiveResponse':
        handle_post_directive_response($args);
        break;

    // Research Document Import API
    case 'importResearchDocument':
        handle_import_research_document($args);
        break;

    case 'searchResearch':
        handle_search_research($args);
        break;

    // Track Board Coordination API (Multi-Agent Git Coordination)
    case 'claimTrack':
        handle_claim_track($args);
        break;

    case 'releaseTrack':
        handle_release_track($args);
        break;

    case 'listTracks':
        handle_list_tracks($args);
        break;

    case 'heartbeatTrack':
        handle_heartbeat_track($args);
        break;

    default:
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array('success' => false, 'error' => 'Invalid action/tool: ' . $action));
}

/**
 * Handle publishing a post (Browser & Evolution styles)
 */
function handle_publish($data) {
    if (!isset($data['title']) || !isset($data['content'])) {
        header('HTTP/1.1 400 Bad Request');
        die(json_encode(array('success' => false, 'error' => 'Missing title or content.')));
    }

    $post_data = array(
        'post_title'    => wp_strip_all_tags($data['title']),
        'post_content'  => $data['content'],
        'post_status'   => isset($data['post_status']) ? $data['post_status'] : (isset($data['status']) ? $data['status'] : 'publish'),
        'post_author'   => 1,
        'post_type'     => isset($data['type']) ? $data['type'] : 'post',
        'post_category' => array(isset($data['category_id']) ? $data['category_id'] : (isset($data['category']) ? $data['category'] : 1))
    );

    $post_id = wp_insert_post($post_data);

    if (is_wp_error($post_id)) {
        echo json_encode(array('success' => false, 'error' => $post_id->get_error_message()));
    } else {
        echo json_encode(array(
            'success' => true, 
            'post_id' => $post_id, 
            'status' => get_post_status($post_id),
            'url' => get_permalink($post_id),
            'edit_url' => get_edit_post_link($post_id, '')
        ));
    }
}

/**
 * Handle logging evolution events
 */
function handle_log_evolution($data) {
    $cycle = isset($data['cycle']) ? $data['cycle'] : 0;
    $target = isset($data['target']) ? $data['target'] : 'unknown';
    $improvement = isset($data['improvement']) ? $data['improvement'] : '';
    $delta = isset($data['delta']) ? $data['delta'] : 0;
    
    $title = "Evolution Cycle $cycle: $target";
    $content = "<h3>Improvement Report</h3>" .
               "<p><b>Target:</b> $target</p>" .
               "<p><b>Delta:</b> " . ($delta * 100) . "%</p>" .
               "<p><b>Details:</b> $improvement</p>";
               
    $post_data = array(
        'post_title'   => $title,
        'post_content' => $content,
        'post_status'  => 'publish',
        'post_author'  => 1,
        'post_category' => array(get_cat_ID('Evolution Log') ?: 1)
    );
    
    $post_id = wp_insert_post($post_data);
    echo json_encode(array('success' => !is_wp_error($post_id), 'post_id' => $post_id));
}

/**
 * Handle updating architecture docs
 */
function handle_update_architecture($data) {
    $component = isset($data['component']) ? $data['component'] : 'System';
    $desc = isset($data['description']) ? $data['description'] : '';
    $path = isset($data['path']) ? $data['path'] : '';
    
    $title = "Architecture: $component";
    $content = "<h3>Component Specification</h3>" .
               "<p><b>Path:</b> $path</p>" .
               "<p><b>Status:</b> " . (isset($data['status']) ? $data['status'] : 'active') . "</p>" .
               "<div class='spec-body'>$desc</div>";
               
    // Search for existing page with same title
    $existing = get_page_by_title($title, OBJECT, 'page');
    
    $post_data = array(
        'post_title'   => $title,
        'post_content' => $content,
        'post_status'  => 'publish',
        'post_author'  => 1,
        'post_type'    => 'page'
    );
    
    if ($existing) {
        $post_data['ID'] = $existing->ID;
    }
    
    $post_id = wp_insert_post($post_data);
    echo json_encode(array('success' => !is_wp_error($post_id), 'page_id' => $post_id));
}

/**
 * Placeholder for other actions
 */
function handle_get_stats() {
    echo json_encode(array('success' => true, 'site' => get_bloginfo('name')));
}

function handle_list_posts($data) {
    $limit = isset($data['limit']) ? intval($data['limit']) : 20;
    $post_type = isset($data['post_type']) ? $data['post_type'] : 'post';

    $args = array(
        'post_type' => $post_type,
        'post_status' => 'publish',
        'posts_per_page' => $limit,
        'orderby' => 'date',
        'order' => 'DESC'
    );

    $query = new WP_Query($args);
    $posts = array();

    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $posts[] = array(
                'id' => get_the_ID(),
                'title' => get_the_title(),
                'content' => get_the_content(),
                'excerpt' => get_the_excerpt(),
                'date' => get_the_date('c'),
                'url' => get_permalink()
            );
        }
        wp_reset_postdata();
    }

    echo json_encode(array('success' => true, 'posts' => $posts));
}

function handle_get_categories() {
    echo json_encode(array('success' => true, 'categories' => array()));
}

function handle_edit_page($data) {
    echo json_encode(array('success' => true));
}

function handle_create_widget($data) {
    echo json_encode(array('success' => true));
}

function handle_list_tools() {
    $tools = array(
        'content' => array(
            'createPost',
            'editPage',
            'createWidget'
        ),
        'ctrm' => array(
            'logTruth',
            'syncTruths',
            'getTruthStats'
        ),
        'tms' => array(
            'logAnsmoCycle'
        ),
        'evolution' => array(
            'logEvolution'
        ),
        'directives' => array(
            'getDirectives',
            'markDirectiveProcessed'
        )
    );

    echo json_encode(array(
        'success' => true,
        'tools' => $tools,
        'categories' => array_keys($tools)
    ));
}

/**
 * ─────────────────────────────────────────────────────────────
 * Directive Console API Handlers
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Ensure the Directives category exists
 */
function ensure_directives_category() {
    $cat_slug = 'directives';
    $existing = get_term_by('slug', $cat_slug, 'category');
    if ($existing) {
        return $existing->term_id;
    }
    $result = wp_insert_term('Directives', 'category', array('slug' => $cat_slug));
    if (is_wp_error($result)) {
        return 1; // fallback to default category
    }
    return $result['term_id'];
}

/**
 * Get unprocessed directives from WordPress
 * Returns posts in Directives category where directive_processed meta is not set
 */
function handle_get_directives() {
    $cat_id = ensure_directives_category();

    $args = array(
        'post_type' => 'post',
        'post_status' => 'publish',
        'posts_per_page' => 50,
        'category' => $cat_id,
        'meta_query' => array(
            array(
                'key' => 'directive_processed',
                'compare' => 'NOT EXISTS'
            )
        )
    );

    $query = new WP_Query($args);
    $directives = array();

    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $directives[] = array(
                'id' => get_the_ID(),
                'title' => get_the_title(),
                'content' => get_the_content(),
                'author' => get_the_author(),
                'date' => get_the_date('c')
            );
        }
        wp_reset_postdata();
    }

    echo json_encode(array('success' => true, 'directives' => $directives));
}

/**
 * Mark a directive as processed
 */
function handle_mark_directive_processed($args) {
    $post_id = isset($args['post_id']) ? intval($args['post_id']) : 0;

    if (!$post_id) {
        echo json_encode(array('success' => false, 'error' => 'Missing post_id'));
        return;
    }

    update_post_meta($post_id, 'directive_processed', true);
    echo json_encode(array('success' => true, 'post_id' => $post_id));
}

/**
 * Post a response comment to a directive
 */
function handle_post_directive_response($args) {
    $post_id = isset($args['post_id']) ? intval($args['post_id']) : 0;
    $response = isset($args['response']) ? $args['response'] : '';
    $status = isset($args['status']) ? $args['status'] : 'COMPLETED';

    if (!$post_id) {
        echo json_encode(array('success' => false, 'error' => 'Missing post_id'));
        return;
    }

    if (!$response) {
        echo json_encode(array('success' => false, 'error' => 'Missing response'));
        return;
    }

    $comment_data = array(
        'comment_post_ID' => $post_id,
        'comment_author' => 'DirectiveAgent',
        'comment_author_email' => 'agent@geometry.os',
        'comment_content' => "**Status: $status**\n\n" . $response,
        'comment_approved' => 1, // Auto-approve
        'comment_type' => ''
    );

    $comment_id = wp_insert_comment($comment_data);

    if (is_wp_error($comment_id)) {
        echo json_encode(array('success' => false, 'error' => $comment_id->get_error_message()));
    } else {
        echo json_encode(array('success' => true, 'comment_id' => $comment_id));
    }
}

/**
 * ─────────────────────────────────────────────────────────────
 * Research Document Import Handler
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Handle importing a research document
 * Supports create/update/skip based on existing document state
 */
function handle_import_research_document($args) {
    // Validate required fields
    if (!isset($args['title']) || !isset($args['content'])) {
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array('success' => false, 'error' => 'Missing title or content.'));
        return;
    }

    // Extract meta fields with defaults
    $meta = isset($args['meta']) ? $args['meta'] : array();
    $source_path = isset($meta['source_path']) ? sanitize_text_field($meta['source_path']) : '';
    $file_hash = isset($meta['file_hash']) ? sanitize_text_field($meta['file_hash']) : '';
    $line_count = isset($meta['line_count']) ? intval($meta['line_count']) : 0;
    $import_batch = isset($meta['import_batch']) ? sanitize_text_field($meta['import_batch']) : '';

    // Check for existing post by source_path meta
    $existing_posts = get_posts(array(
        'post_type' => 'research_document',
        'post_status' => 'any',
        'posts_per_page' => 1,
        'meta_query' => array(
            array(
                'key' => 'source_path',
                'value' => $source_path,
                'compare' => '='
            )
        )
    ));

    $post_data = array(
        'post_title'   => wp_strip_all_tags($args['title']),
        'post_content' => $args['content'],
        'post_status'  => 'publish',
        'post_author'  => 1,
        'post_type'    => 'research_document'
    );

    // Case 1: Existing post found
    if (!empty($existing_posts)) {
        $existing_post = $existing_posts[0];
        $existing_hash = get_post_meta($existing_post->ID, 'file_hash', true);

        // Case 1a: Hash matches - skip (no changes)
        if ($existing_hash === $file_hash) {
            echo json_encode(array(
                'success' => true,
                'status' => 'skipped',
                'post_id' => $existing_post->ID,
                'message' => 'Document unchanged (hash match).'
            ));
            return;
        }

        // Case 1b: Hash differs - update existing post
        $post_data['ID'] = $existing_post->ID;
        $post_id = wp_update_post($post_data);

        if (is_wp_error($post_id)) {
            echo json_encode(array('success' => false, 'error' => $post_id->get_error_message()));
            return;
        }

        // Update meta fields
        update_post_meta($post_id, 'file_hash', $file_hash);
        update_post_meta($post_id, 'line_count', $line_count);
        update_post_meta($post_id, 'import_batch', $import_batch);

        echo json_encode(array(
            'success' => true,
            'status' => 'updated',
            'post_id' => $post_id,
            'message' => 'Document updated successfully.'
        ));
        return;
    }

    // Case 2: New post - create
    $post_id = wp_insert_post($post_data);

    if (is_wp_error($post_id)) {
        echo json_encode(array('success' => false, 'error' => $post_id->get_error_message()));
        return;
    }

    // Save meta fields for new post
    add_post_meta($post_id, 'source_path', $source_path);
    add_post_meta($post_id, 'file_hash', $file_hash);
    add_post_meta($post_id, 'line_count', $line_count);
    add_post_meta($post_id, 'import_batch', $import_batch);

    echo json_encode(array(
        'success' => true,
        'status' => 'created',
        'post_id' => $post_id,
        'message' => 'Document created successfully.'
    ));
}

/**
 * ─────────────────────────────────────────────────────────────
 * Research Document Search Handler
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Handle searching research documents
 * Supports full-text search and meta filtering
 */
function handle_search_research($args) {
    // Pagination params
    $limit = isset($args['limit']) ? intval($args['limit']) : 50;
    $offset = isset($args['offset']) ? intval($args['offset']) : 0;

    // Build WP_Query args
    $query_args = array(
        'post_type' => 'research_document',
        'post_status' => 'publish',
        'posts_per_page' => $limit,
        'offset' => $offset,
        'orderby' => 'relevance',
        'order' => 'DESC'
    );

    // Full-text search on title/content
    if (isset($args['q']) && !empty($args['q'])) {
        $query_args['s'] = sanitize_text_field($args['q']);
    }

    // Meta filtering
    $meta_query = array();

    // Filter by import_batch
    if (isset($args['meta_filter']['import_batch'])) {
        $meta_query[] = array(
            'key' => 'import_batch',
            'value' => sanitize_text_field($args['meta_filter']['import_batch']),
            'compare' => '='
        );
    }

    // Filter by min_line_count
    if (isset($args['meta_filter']['min_line_count'])) {
        $meta_query[] = array(
            'key' => 'line_count',
            'value' => intval($args['meta_filter']['min_line_count']),
            'compare' => '>=',
            'type' => 'NUMERIC'
        );
    }

    // Filter by max_line_count
    if (isset($args['meta_filter']['max_line_count'])) {
        $meta_query[] = array(
            'key' => 'line_count',
            'value' => intval($args['meta_filter']['max_line_count']),
            'compare' => '<=',
            'type' => 'NUMERIC'
        );
    }

    if (!empty($meta_query)) {
        $meta_query['relation'] = 'AND';
        $query_args['meta_query'] = $meta_query;
    }

    $query = new WP_Query($query_args);
    $results = array();

    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $post_id = get_the_ID();
            $results[] = array(
                'id' => $post_id,
                'title' => get_the_title(),
                'excerpt' => get_the_excerpt(),
                'url' => get_permalink(),
                'source_path' => get_post_meta($post_id, 'source_path', true),
                'line_count' => intval(get_post_meta($post_id, 'line_count', true))
            );
        }
        wp_reset_postdata();
    }

    echo json_encode(array(
        'success' => true,
        'results' => $results,
        'total' => $query->found_posts,
        'limit' => $limit,
        'offset' => $offset
    ));
}

/**
 * ─────────────────────────────────────────────────────────────
 * Track Board Coordination API Handlers
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Send notification to Visual Bridge WebSocket
 * Non-blocking notification for claim/release events
 * Gracefully degrades if socket extension not available
 */
function notify_visual_bridge($event_type, $track_id, $agent_id, $files = array()) {
    // Check if socket extension is available
    if (!function_exists('socket_create')) {
        // Graceful degradation - skip notification
        return false;
    }

    // Derive coordinates from track_id hash for visual pulse
    $hash = crc32($track_id);
    $x = ($hash % 1000) / 1000.0;  // 0.0 - 1.0
    $y = (($hash >> 16) % 1000) / 1000.0;  // 0.0 - 1.0

    $payload = json_encode(array(
        'type' => $event_type,
        'track_id' => $track_id,
        'agent_id' => $agent_id,
        'files' => $files,
        'coordinates' => array('x' => $x, 'y' => $y),
        'timestamp' => current_time('c')
    ));

    // Non-blocking UDP notification to Visual Bridge (port 8769 for track events)
    $sock = @socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
    if ($sock) {
        socket_set_nonblock($sock);
        @socket_sendto($sock, $payload, strlen($payload), 0, '127.0.0.1', 8769);
        socket_close($sock);
        return true;
    }
    return false;
}

/**
 * Check if file paths overlap with existing claims
 * Uses strpos() for path prefix matching
 */
function check_file_overlaps($files, $exclude_claim_id = 0) {
    // Get all active claims (not trashed)
    $args = array(
        'post_type' => 'track_claim',
        'post_status' => 'publish',
        'posts_per_page' => 100,
        'meta_query' => array(
            array(
                'key' => 'heartbeat',
                'value' => date('Y-m-d H:i:s', strtotime('-10 minutes')),
                'compare' => '>=',
                'type' => 'DATETIME'
            )
        )
    );

    if ($exclude_claim_id > 0) {
        $args['post__not_in'] = array($exclude_claim_id);
    }

    $query = new WP_Query($args);
    $overlaps = array();

    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $claim_id = get_the_ID();
            $existing_track_id = get_post_meta($claim_id, 'track_id', true);
            $existing_agent_id = get_post_meta($claim_id, 'agent_id', true);
            $existing_files = get_post_meta($claim_id, 'files', true);

            if (!is_array($existing_files)) {
                $existing_files = array($existing_files);
            }

            // Check each new file against each existing file
            foreach ($files as $new_file) {
                foreach ($existing_files as $existing_file) {
                    // Check if either path is a prefix of the other
                    if (strpos($new_file, $existing_file) === 0 ||
                        strpos($existing_file, $new_file) === 0) {
                        $overlaps[] = array(
                            'conflicting_claim' => $claim_id,
                            'track_id' => $existing_track_id,
                            'agent_id' => $existing_agent_id,
                            'conflicting_file' => $existing_file,
                            'requested_file' => $new_file
                        );
                    }
                }
            }
        }
        wp_reset_postdata();
    }

    return $overlaps;
}

/**
 * Handle claiming a track
 * POST /ai-publisher.php {"action":"claimTrack","track_id":"...","agent_id":"...","files":["path/"]}
 *
 * HTTP Status Codes:
 * - 200: Success
 * - 400: Missing or invalid required fields
 * - 409: Track already claimed or file conflict
 * - 500: Internal server error
 */
function handle_claim_track($args) {
    // Validate required fields
    $missing = array();
    if (!isset($args['track_id']) || empty($args['track_id'])) {
        $missing[] = 'track_id';
    }
    if (!isset($args['agent_id']) || empty($args['agent_id'])) {
        $missing[] = 'agent_id';
    }
    if (!isset($args['files'])) {
        $missing[] = 'files';
    }

    if (!empty($missing)) {
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array(
            'success' => false,
            'error' => 'Missing required fields: ' . implode(', ', $missing)
        ));
        return;
    }

    $track_id = sanitize_text_field($args['track_id']);
    $agent_id = sanitize_text_field($args['agent_id']);

    // Validate files is array and not empty
    $files = is_array($args['files']) ? $args['files'] : array($args['files']);
    if (empty($files) || (count($files) === 1 && empty($files[0]))) {
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array(
            'success' => false,
            'error' => 'Files array cannot be empty'
        ));
        return;
    }

    // Sanitize file paths
    $files = array_map('sanitize_text_field', $files);

    // Check for existing active claim with same track_id
    $existing = get_posts(array(
        'post_type' => 'track_claim',
        'post_status' => 'publish',
        'posts_per_page' => 1,
        'meta_query' => array(
            array(
                'key' => 'track_id',
                'value' => $track_id,
                'compare' => '='
            ),
            array(
                'key' => 'heartbeat',
                'value' => date('Y-m-d H:i:s', strtotime('-10 minutes')),
                'compare' => '>=',
                'type' => 'DATETIME'
            )
        )
    ));

    if (!empty($existing)) {
        header('HTTP/1.1 409 Conflict');
        echo json_encode(array(
            'success' => false,
            'error' => 'Track already claimed',
            'existing_claim_id' => $existing[0]->ID,
            'existing_agent' => get_post_meta($existing[0]->ID, 'agent_id', true)
        ));
        return;
    }

    // Check for file overlaps with other claims
    $overlaps = check_file_overlaps($files);
    if (!empty($overlaps)) {
        header('HTTP/1.1 409 Conflict');
        echo json_encode(array(
            'success' => false,
            'error' => 'File conflict detected',
            'conflicts' => $overlaps
        ));
        return;
    }

    // Create the claim
    $post_data = array(
        'post_title' => "Track: $track_id",
        'post_status' => 'publish',
        'post_author' => 1,
        'post_type' => 'track_claim'
    );

    $claim_id = wp_insert_post($post_data);

    if (is_wp_error($claim_id)) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Failed to create claim: ' . $claim_id->get_error_message()
        ));
        return;
    }

    // Add meta fields
    add_post_meta($claim_id, 'track_id', $track_id);
    add_post_meta($claim_id, 'agent_id', $agent_id);
    add_post_meta($claim_id, 'files', $files);
    add_post_meta($claim_id, 'heartbeat', current_time('mysql'));
    add_post_meta($claim_id, 'created_at', current_time('mysql'));

    // Notify Visual Bridge
    notify_visual_bridge('TRACK_CLAIMED', $track_id, $agent_id, $files);

    echo json_encode(array(
        'success' => true,
        'claim_id' => $claim_id,
        'track_id' => $track_id,
        'agent_id' => $agent_id,
        'files' => $files,
        'message' => 'Track claimed successfully'
    ));
}

/**
 * Handle releasing a track
 * POST /ai-publisher.php {"action":"releaseTrack","track_id":"...","agent_id":"..."}
 *
 * HTTP Status Codes:
 * - 200: Success (or idempotent release of non-existent/expired claim)
 * - 400: Missing or invalid required fields
 * - 403: Agent ID does not match claim owner (forbidden)
 * - 410: Claim has expired (gone)
 */
function handle_release_track($args) {
    // Validate required fields
    $missing = array();
    if (!isset($args['track_id']) || empty($args['track_id'])) {
        $missing[] = 'track_id';
    }
    if (!isset($args['agent_id']) || empty($args['agent_id'])) {
        $missing[] = 'agent_id';
    }

    if (!empty($missing)) {
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array(
            'success' => false,
            'error' => 'Missing required fields: ' . implode(', ', $missing)
        ));
        return;
    }

    $track_id = sanitize_text_field($args['track_id']);
    $agent_id = sanitize_text_field($args['agent_id']);

    // Find the claim (any status to handle expired cases)
    $claims = get_posts(array(
        'post_type' => 'track_claim',
        'post_status' => 'any', // Include trashed for idempotent behavior
        'posts_per_page' => 1,
        'meta_query' => array(
            array(
                'key' => 'track_id',
                'value' => $track_id,
                'compare' => '='
            )
        )
    ));

    // Idempotent: No claim found is success (already released or never claimed)
    if (empty($claims)) {
        echo json_encode(array(
            'success' => true,
            'track_id' => $track_id,
            'message' => 'No active claim found (already released or never claimed)'
        ));
        return;
    }

    $claim = $claims[0];
    $claim_id = $claim->ID;

    // Check if already trashed (idempotent)
    if ($claim->post_status === 'trash') {
        echo json_encode(array(
            'success' => true,
            'claim_id' => $claim_id,
            'track_id' => $track_id,
            'message' => 'Track already released (was in trash)'
        ));
        return;
    }

    // Verify ownership
    $claim_agent = get_post_meta($claim_id, 'agent_id', true);
    if ($claim_agent !== $agent_id) {
        header('HTTP/1.1 403 Forbidden');
        echo json_encode(array(
            'success' => false,
            'error' => 'Agent ID does not match claim owner',
            'claim_owner' => $claim_agent
        ));
        return;
    }

    // Check if claim has expired (heartbeat > 10 min)
    $heartbeat = get_post_meta($claim_id, 'heartbeat', true);
    $heartbeat_time = strtotime($heartbeat);
    $is_expired = ($heartbeat_time < strtotime('-10 minutes'));

    if ($is_expired) {
        // Still release it, but indicate it was expired
        $files = get_post_meta($claim_id, 'files', true);
        wp_trash_post($claim_id);
        notify_visual_bridge('TRACK_RELEASED', $track_id, $agent_id, is_array($files) ? $files : array($files));

        header('HTTP/1.1 410 Gone');
        echo json_encode(array(
            'success' => true,
            'claim_id' => $claim_id,
            'track_id' => $track_id,
            'message' => 'Track released (claim was expired)',
            'was_expired' => true
        ));
        return;
    }

    // Get files before trashing for notification
    $files = get_post_meta($claim_id, 'files', true);

    // Move to trash (not delete - for audit trail)
    wp_trash_post($claim_id);

    // Notify Visual Bridge
    notify_visual_bridge('TRACK_RELEASED', $track_id, $agent_id, is_array($files) ? $files : array($files));

    echo json_encode(array(
        'success' => true,
        'claim_id' => $claim_id,
        'track_id' => $track_id,
        'message' => 'Track released successfully'
    ));
}

/**
 * Handle listing active tracks
 * POST /ai-publisher.php {"action":"listTracks","agent_id":"..."} or {} for all
 */
function handle_list_tracks($args) {
    $agent_filter = isset($args['agent_id']) ? sanitize_text_field($args['agent_id']) : null;
    $include_expired = isset($args['include_expired']) ? (bool)$args['include_expired'] : false;

    $meta_query = array();

    // Filter by agent if provided
    if ($agent_filter) {
        $meta_query[] = array(
            'key' => 'agent_id',
            'value' => $agent_filter,
            'compare' => '='
        );
    }

    // Filter by heartbeat (active only) unless include_expired
    if (!$include_expired) {
        $meta_query[] = array(
            'key' => 'heartbeat',
            'value' => date('Y-m-d H:i:s', strtotime('-10 minutes')),
            'compare' => '>=',
            'type' => 'DATETIME'
        );
    }

    $query_args = array(
        'post_type' => 'track_claim',
        'post_status' => 'publish',
        'posts_per_page' => 100,
        'orderby' => 'modified',
        'order' => 'DESC'
    );

    if (!empty($meta_query)) {
        $query_args['meta_query'] = $meta_query;
    }

    $query = new WP_Query($query_args);
    $tracks = array();

    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $claim_id = get_the_ID();
            $heartbeat = get_post_meta($claim_id, 'heartbeat', true);
            $heartbeat_time = strtotime($heartbeat);
            $expired = ($heartbeat_time < strtotime('-10 minutes'));

            $tracks[] = array(
                'claim_id' => $claim_id,
                'track_id' => get_post_meta($claim_id, 'track_id', true),
                'agent_id' => get_post_meta($claim_id, 'agent_id', true),
                'files' => get_post_meta($claim_id, 'files', true),
                'heartbeat' => $heartbeat,
                'expired' => $expired,
                'created_at' => get_post_meta($claim_id, 'created_at', true)
            );
        }
        wp_reset_postdata();
    }

    echo json_encode(array(
        'success' => true,
        'count' => count($tracks),
        'tracks' => $tracks
    ));
}

/**
 * Handle heartbeat update for a track
 * POST /ai-publisher.php {"action":"heartbeatTrack","track_id":"...","agent_id":"..."}
 *
 * HTTP Status Codes:
 * - 200: Success
 * - 400: Missing or invalid required fields
 * - 404: No active claim found
 * - 403: Agent ID does not match claim owner (forbidden)
 * - 410: Claim has expired (gone) - heartbeat not updated
 */
function handle_heartbeat_track($args) {
    // Validate required fields
    $missing = array();
    if (!isset($args['track_id']) || empty($args['track_id'])) {
        $missing[] = 'track_id';
    }
    if (!isset($args['agent_id']) || empty($args['agent_id'])) {
        $missing[] = 'agent_id';
    }

    if (!empty($missing)) {
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(array(
            'success' => false,
            'error' => 'Missing required fields: ' . implode(', ', $missing)
        ));
        return;
    }

    $track_id = sanitize_text_field($args['track_id']);
    $agent_id = sanitize_text_field($args['agent_id']);

    // Find the claim (only active ones)
    $claims = get_posts(array(
        'post_type' => 'track_claim',
        'post_status' => 'publish',
        'posts_per_page' => 1,
        'meta_query' => array(
            array(
                'key' => 'track_id',
                'value' => $track_id,
                'compare' => '='
            )
        )
    ));

    if (empty($claims)) {
        header('HTTP/1.1 404 Not Found');
        echo json_encode(array(
            'success' => false,
            'error' => 'No claim found for this track_id'
        ));
        return;
    }

    $claim = $claims[0];
    $claim_id = $claim->ID;

    // Verify ownership
    $claim_agent = get_post_meta($claim_id, 'agent_id', true);
    if ($claim_agent !== $agent_id) {
        header('HTTP/1.1 403 Forbidden');
        echo json_encode(array(
            'success' => false,
            'error' => 'Agent ID does not match claim owner',
            'claim_owner' => $claim_agent
        ));
        return;
    }

    // Check if claim has already expired
    $heartbeat = get_post_meta($claim_id, 'heartbeat', true);
    $heartbeat_time = strtotime($heartbeat);
    $is_expired = ($heartbeat_time < strtotime('-10 minutes'));

    if ($is_expired) {
        header('HTTP/1.1 410 Gone');
        echo json_encode(array(
            'success' => false,
            'error' => 'Claim has expired, heartbeat cannot be updated',
            'claim_id' => $claim_id,
            'last_heartbeat' => $heartbeat
        ));
        return;
    }

    // Update heartbeat timestamp
    $now = current_time('mysql');
    update_post_meta($claim_id, 'heartbeat', $now);

    echo json_encode(array(
        'success' => true,
        'claim_id' => $claim_id,
        'track_id' => $track_id,
        'heartbeat' => $now,
        'message' => 'Heartbeat updated successfully'
    ));
}
