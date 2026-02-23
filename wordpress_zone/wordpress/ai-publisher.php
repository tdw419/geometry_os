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

    // CTRM Truth Management System API
    case 'logTruth':
        handle_log_truth($args);
        break;

    case 'syncTruths':
        handle_sync_truths($args);
        break;

    case 'getTruthStats':
        handle_get_truth_stats($args);
        break;

    // TMS ANSMO Cycle API
    case 'logAnsmoCycle':
        handle_log_ansmo_cycle($args);
        break;

    // WordPress Truth Daemon API
    case 'getModifiedContent':
        handle_get_modified_content($args);
        break;

    case 'updatePostMeta':
        handle_update_post_meta($args);
        break;

    case 'getPostAuthor':
    case 'getPostAuthorInfo':
        handle_get_post_author($args);
        break;

    // World of Rectification Game API
    case 'logGameDecision':
        handle_log_game_decision($args);
        break;

    case 'getPlayerCTRM':
        handle_get_player_ctrm($args);
        break;

    case 'syncGameNodes':
        handle_sync_game_nodes($args);
        break;

    case 'verifySpark':
        handle_verify_spark($args);
        break;

    case 'getGameStats':
        handle_get_game_stats($args);
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
    echo json_encode(array(
        'success' => true,
        'tools' => array(
            // Publishing
            'createPost', 'editPage', 'listPosts', 'getStats',
            // Evolution
            'logEvolution', 'updateArchitecture',
            // Directives
            'getDirectives', 'markDirectiveProcessed', 'postDirectiveResponse',
            // Research
            'importResearchDocument', 'searchResearch',
            // Track Board
            'claimTrack', 'releaseTrack', 'listTracks', 'heartbeatTrack',
            // CTRM/TMS
            'logTruth', 'syncTruths', 'getTruthStats', 'logAnsmoCycle',
            // WordPress Truth Daemon
            'getModifiedContent', 'updatePostMeta', 'getPostAuthor',
            // World of Rectification
            'logGameDecision', 'getPlayerCTRM', 'syncGameNodes', 'verifySpark', 'getGameStats',
        ),
        'categories' => array(
            'wor' => array('logGameDecision', 'getPlayerCTRM', 'syncGameNodes', 'verifySpark', 'getGameStats'),
            'ctrm' => array('logTruth', 'syncTruths', 'getTruthStats'),
            'tms' => array('logAnsmoCycle'),
            'evolution' => array('logEvolution', 'updateArchitecture'),
            'tracks' => array('claimTrack', 'releaseTrack', 'listTracks', 'heartbeatTrack'),
        )
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

/**
 * ─────────────────────────────────────────────────────────────
 * CTRM Truth Management System API Handlers
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Handle logging a single truth entry
 * POST /ai-publisher.php {"action":"logTruth","truth_id":"...","claim":"..."}
 *
 * @param array $args Contains truth data
 * @return JSON response with truth post details
 */
function handle_log_truth($args) {
    try {
        // Validate required fields
        if (!isset($args['truth_id']) || empty($args['truth_id'])) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array(
                'success' => false,
                'error' => 'Missing required field: truth_id'
            ));
            return;
        }

        $truth_id = sanitize_text_field($args['truth_id']);

        // Check for existing truth by truth_id meta
        $existing = get_posts(array(
            'post_type' => 'truth_entry',
            'post_status' => 'any',
            'posts_per_page' => 1,
            'meta_query' => array(
                array(
                    'key' => 'truth_id',
                    'value' => $truth_id,
                    'compare' => '='
                )
            )
        ));

        // Extract truth fields with defaults
        $title = isset($args['claim']) ? wp_strip_all_tags($args['claim']) : "Truth: $truth_id";
        $content = isset($args['reason']) ? $args['reason'] : '';
        $confidence = isset($args['confidence']) ? floatval($args['confidence']) : 0.5;
        $agent = isset($args['agent']) ? sanitize_text_field($args['agent']) : '';
        $subject = isset($args['subject']) ? sanitize_text_field($args['subject']) : '';
        $evidence = isset($args['evidence']) ? $args['evidence'] : '';
        $reasoning_path = isset($args['reasoning_path']) ? $args['reasoning_path'] : array();

        // Calculate transparency_score per FR-1: min(1.0, len(reasoning_path)/10)
        $transparency_score = min(1.0, count($reasoning_path) / 10);

        $post_data = array(
            'post_title'   => $title,
            'post_content' => $content,
            'post_status'  => 'publish',
            'post_author'  => 1,
            'post_type'    => 'truth_entry'
        );

        $post_id = null;
        $action_taken = '';

        if (!empty($existing)) {
            // Update existing truth
            $post_data['ID'] = $existing[0]->ID;
            $post_id = wp_update_post($post_data);
            $action_taken = 'updated';
        } else {
            // Create new truth
            $post_id = wp_insert_post($post_data);
            $action_taken = 'created';
        }

        if (is_wp_error($post_id)) {
            header('HTTP/1.1 500 Internal Server Error');
            echo json_encode(array(
                'success' => false,
                'error' => 'Failed to save truth: ' . $post_id->get_error_message()
            ));
            return;
        }

        // Update/create meta fields
        update_post_meta($post_id, 'truth_id', $truth_id);
        update_post_meta($post_id, 'confidence', $confidence);
        update_post_meta($post_id, 'transparency_score', $transparency_score);
        update_post_meta($post_id, 'agent', $agent);
        update_post_meta($post_id, 'subject', $subject);
        update_post_meta($post_id, 'evidence', $evidence);
        update_post_meta($post_id, 'reasoning_path', $reasoning_path);

        echo json_encode(array(
            'success' => true,
            'truth_id' => $truth_id,
            'post_id' => $post_id,
            'action' => $action_taken,
            'url' => get_permalink($post_id)
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_log_truth: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle bulk sync of truths from TMS
 * POST /ai-publisher.php {"action":"syncTruths","truths":[...]}
 *
 * @param array $args Contains 'truths' array of truth objects
 * @return JSON response with sync stats and results
 */
function handle_sync_truths($args) {
    try {
        // Validate truths array presence
        if (!isset($args['truths']) || !is_array($args['truths'])) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array(
                'success' => false,
                'error' => 'Missing or invalid truths array'
            ));
            return;
        }

        $truths = $args['truths'];
        $total_requested = count($truths);

        // Limit to 100 truths per request
        if ($total_requested > 100) {
            $truths = array_slice($truths, 0, 100);
        }

        $synced_count = 0;
        $skipped_count = 0;
        $results = array();

        foreach ($truths as $truth) {
            // Validate required fields for each truth
            if (!isset($truth['truth_id'])) {
                $skipped_count++;
                $results[] = array(
                    'truth_id' => null,
                    'status' => 'skipped',
                    'error' => 'Missing truth_id'
                );
                continue;
            }

            $truth_id = sanitize_text_field($truth['truth_id']);

            try {
                // Check for existing truth by truth_id meta
                $existing = get_posts(array(
                    'post_type' => 'truth_entry',
                    'post_status' => 'any',
                    'posts_per_page' => 1,
                    'meta_query' => array(
                        array(
                            'key' => 'truth_id',
                            'value' => $truth_id,
                            'compare' => '='
                        )
                    )
                ));

                // Extract truth fields with defaults
                $title = isset($truth['claim']) ? wp_strip_all_tags($truth['claim']) : "Truth: $truth_id";
                $content = isset($truth['reason']) ? $truth['reason'] : '';
                $confidence = isset($truth['confidence']) ? floatval($truth['confidence']) : 0.5;
                $agent = isset($truth['agent']) ? sanitize_text_field($truth['agent']) : '';
                $subject = isset($truth['subject']) ? sanitize_text_field($truth['subject']) : '';
                $evidence = isset($truth['evidence']) ? $truth['evidence'] : '';
                $reasoning_path = isset($truth['reasoning_path']) ? $truth['reasoning_path'] : array();

                // Calculate transparency_score per FR-1: min(1.0, len(reasoning_path)/10)
                $transparency_score = min(1.0, count($reasoning_path) / 10);

                $post_data = array(
                    'post_title'   => $title,
                    'post_content' => $content,
                    'post_status'  => 'publish',
                    'post_author'  => 1,
                    'post_type'    => 'truth_entry'
                );

                $post_id = null;
                $action_taken = '';

                if (!empty($existing)) {
                    // Update existing truth
                    $post_data['ID'] = $existing[0]->ID;
                    $post_id = wp_update_post($post_data);
                    $action_taken = 'updated';
                } else {
                    // Create new truth
                    $post_id = wp_insert_post($post_data);
                    $action_taken = 'created';
                }

                if (is_wp_error($post_id)) {
                    $skipped_count++;
                    $results[] = array(
                        'truth_id' => $truth_id,
                        'status' => 'error',
                        'error' => $post_id->get_error_message()
                    );
                    continue;
                }

                // Update/create meta fields
                update_post_meta($post_id, 'truth_id', $truth_id);
                update_post_meta($post_id, 'confidence', $confidence);
                update_post_meta($post_id, 'transparency_score', $transparency_score);
                update_post_meta($post_id, 'agent', $agent);
                update_post_meta($post_id, 'subject', $subject);
                update_post_meta($post_id, 'evidence', $evidence);
                update_post_meta($post_id, 'reasoning_path', $reasoning_path);

                $synced_count++;
                $results[] = array(
                    'truth_id' => $truth_id,
                    'post_id' => $post_id,
                    'status' => 'synced',
                    'action' => $action_taken,
                    'url' => get_permalink($post_id)
                );
            } catch (Exception $inner_e) {
                $skipped_count++;
                $results[] = array(
                    'truth_id' => $truth_id,
                    'status' => 'error',
                    'error' => 'Exception: ' . $inner_e->getMessage()
                );
            }
        }

        echo json_encode(array(
            'success' => true,
            'synced_count' => $synced_count,
            'skipped_count' => $skipped_count,
            'total_requested' => $total_requested,
            'processed' => count($truths),
            'results' => $results
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_sync_truths: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle getting aggregate truth statistics
 * POST /ai-publisher.php {"action":"getTruthStats"}
 *
 * @return void Outputs JSON response with aggregate stats
 */
function handle_get_truth_stats($args) {
    try {
        // Check for force_refresh parameter to bypass cache
        $force_refresh = isset($args['force_refresh']) && (bool)$args['force_refresh'];

        // Try to get cached stats (5-minute TTL)
        $cache_key = 'ctrm_truth_stats';
        $cached_stats = get_transient($cache_key);

        if ($cached_stats !== false && !$force_refresh) {
            // Return cached stats
            $cached_stats['cached'] = true;
            echo json_encode($cached_stats);
            return;
        }

        // Query all truth_entry posts
        $query_args = array(
            'post_type' => 'truth_entry',
            'post_status' => 'publish',
            'posts_per_page' => -1, // Get all
            'orderby' => 'date',
            'order' => 'DESC'
        );

        $query = new WP_Query($query_args);

        if (is_wp_error($query)) {
            header('HTTP/1.1 500 Internal Server Error');
            echo json_encode(array(
                'success' => false,
                'error' => 'Query failed: ' . $query->get_error_message()
            ));
            return;
        }

        $total_truths = $query->found_posts;

        // Initialize aggregates
        $confidence_sum = 0.0;
        $transparency_sum = 0.0;
        $count = 0;
        $recent_truths = array();

        if ($query->have_posts()) {
            while ($query->have_posts()) {
                $query->the_post();
                $post_id = get_the_ID();

                // Get meta values
                $confidence = floatval(get_post_meta($post_id, 'confidence', true));
                $transparency = floatval(get_post_meta($post_id, 'transparency_score', true));

                $confidence_sum += $confidence;
                $transparency_sum += $transparency;
                $count++;

                // Collect 5 most recent truths
                if (count($recent_truths) < 5) {
                    $recent_truths[] = array(
                        'id' => $post_id,
                        'title' => get_the_title(),
                        'confidence' => $confidence,
                        'date' => get_the_date('c')
                    );
                }
            }
            wp_reset_postdata();
        }

        // Calculate averages (handle division by zero)
        $avg_confidence = $count > 0 ? $confidence_sum / $count : 0.0;
        $avg_transparency = $count > 0 ? $transparency_sum / $count : 0.0;

        // Calculate system_health = avg_confidence * 0.6 + avg_transparency * 0.4
        $system_health = ($avg_confidence * 0.6) + ($avg_transparency * 0.4);

        // Build response array
        $response = array(
            'success' => true,
            'total_truths' => $total_truths,
            'avg_confidence' => round($avg_confidence, 4),
            'avg_transparency' => round($avg_transparency, 4),
            'system_health' => round($system_health, 4),
            'recent_truths' => $recent_truths,
            'cached' => false
        );

        // Cache the stats for 5 minutes (300 seconds)
        set_transient($cache_key, $response, 5 * MINUTE_IN_SECONDS);

        echo json_encode($response);
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_get_truth_stats: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle logging an ANSMO optimization cycle
 * POST /ai-publisher.php {"action":"logAnsmoCycle","phase":"introspection",...}
 *
 * @param array $args {
 *   @type string $phase            Required. introspection|synthesis|optimization
 *   @type array  $input_state      Required. State before cycle
 *   @type array  $output_state     Required. State after cycle
 *   @type float  $improvement_delta Required. Change metric
 *   @type string $cycle_id         Optional. UUID, auto-generated if missing
 * }
 * @return void Outputs JSON response
 */
function handle_log_ansmo_cycle($args) {
    try {
        // Validate required fields
        $missing = array();
        if (!isset($args['phase']) || empty($args['phase'])) {
            $missing[] = 'phase';
        }
        if (!isset($args['input_state'])) {
            $missing[] = 'input_state';
        }
        if (!isset($args['output_state'])) {
            $missing[] = 'output_state';
        }
        if (!isset($args['improvement_delta'])) {
            $missing[] = 'improvement_delta';
        }

        if (!empty($missing)) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array(
                'success' => false,
                'error' => 'Missing required fields: ' . implode(', ', $missing)
            ));
            return;
        }

        $phase = sanitize_text_field($args['phase']);
        $valid_phases = array('introspection', 'synthesis', 'optimization');

        if (!in_array($phase, $valid_phases)) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array(
                'success' => false,
                'error' => 'Invalid phase. Must be: ' . implode(', ', $valid_phases)
            ));
            return;
        }

        $input_state = $args['input_state'];
        $output_state = $args['output_state'];
        $improvement_delta = floatval($args['improvement_delta']);

        // Auto-generate cycle_id if not provided
        $cycle_id = isset($args['cycle_id']) && !empty($args['cycle_id'])
            ? sanitize_text_field($args['cycle_id'])
            : wp_generate_uuid4();

        // Build title and content
        $title = "ANSMO Cycle: $phase ($cycle_id)";
        $content = "<h3>ANSMO Optimization Cycle</h3>" .
                   "<p><b>Phase:</b> $phase</p>" .
                   "<p><b>Improvement Delta:</b> " . ($improvement_delta * 100) . "%</p>" .
                   "<h4>Input State</h4>" .
                   "<pre>" . esc_html(json_encode($input_state, JSON_PRETTY_PRINT)) . "</pre>" .
                   "<h4>Output State</h4>" .
                   "<pre>" . esc_html(json_encode($output_state, JSON_PRETTY_PRINT)) . "</pre>";

        // Create ansmo_cycle post
        $post_data = array(
            'post_title'   => $title,
            'post_content' => $content,
            'post_status'  => 'publish',
            'post_author'  => 1,
            'post_type'    => 'ansmo_cycle'
        );

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            header('HTTP/1.1 500 Internal Server Error');
            echo json_encode(array(
                'success' => false,
                'error' => 'Failed to create ansmo_cycle post: ' . $post_id->get_error_message()
            ));
            return;
        }

        // Store meta fields
        add_post_meta($post_id, 'cycle_id', $cycle_id);
        add_post_meta($post_id, 'phase', $phase);
        add_post_meta($post_id, 'improvement_delta', $improvement_delta);

        // Notify Visual Bridge
        notify_visual_bridge('ANSMO_CYCLE', $cycle_id, 'ansmo', array(
            'phase' => $phase,
            'improvement_delta' => $improvement_delta
        ));

        echo json_encode(array(
            'success' => true,
            'post_id' => $post_id,
            'cycle_id' => $cycle_id,
            'url' => get_permalink($post_id)
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_log_ansmo_cycle: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle getModifiedContent - Query posts by modification date
 * Used by WordPress Truth Daemon for content discovery
 */
function handle_get_modified_content($args) {
    try {
        $since = isset($args['since']) ? sanitize_text_field($args['since']) : '';
        $post_types = isset($args['post_types']) ? $args['post_types'] : array('post', 'page');
        $limit = isset($args['limit']) ? intval($args['limit']) : 50;

        // Build query args
        $query_args = array(
            'post_type' => $post_types,
            'post_status' => 'publish',
            'posts_per_page' => $limit,
            'orderby' => 'modified',
            'order' => 'DESC'
        );

        // Add date filter if since provided
        if (!empty($since)) {
            $query_args['date_query'] = array(
                array(
                    'column' => 'post_modified_gmt',
                    'after' => $since
                )
            );
        }

        $query = new WP_Query($query_args);
        $posts = array();

        while ($query->have_posts()) {
            $query->the_post();
            $posts[] = array(
                'id' => get_the_ID(),
                'title' => get_the_title(),
                'content' => get_the_content(),
                'excerpt' => get_the_excerpt(),
                'modified' => get_post_modified_time('c', true),
                'type' => get_post_type(),
                'author_id' => get_the_author_meta('ID')
            );
        }
        wp_reset_postdata();

        echo json_encode(array(
            'success' => true,
            'posts' => $posts,
            'count' => count($posts)
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_get_modified_content: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle updatePostMeta - Update post metadata
 * Used by WordPress Truth Daemon for CTRM score updates
 */
function handle_update_post_meta($args) {
    try {
        if (!isset($args['post_id'])) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array('success' => false, 'error' => 'Missing post_id'));
            return;
        }

        $post_id = intval($args['post_id']);
        $meta_key = sanitize_key($args['meta_key']);
        $meta_value = $args['meta_value'];

        // Check post exists
        $post = get_post($post_id);
        if (!$post) {
            header('HTTP/1.1 404 Not Found');
            echo json_encode(array('success' => false, 'error' => 'Post not found'));
            return;
        }

        // Update meta
        $result = update_post_meta($post_id, $meta_key, $meta_value);

        echo json_encode(array(
            'success' => true,
            'post_id' => $post_id,
            'meta_key' => $meta_key,
            'updated' => $result !== false
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_update_post_meta: ' . $e->getMessage()
        ));
    }
}

/**
 * Handle getPostAuthor - Get author info for a post
 * Used by WordPress Truth Daemon for scoring
 */
function handle_get_post_author($args) {
    try {
        if (!isset($args['post_id'])) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array('success' => false, 'error' => 'Missing post_id'));
            return;
        }

        $post_id = intval($args['post_id']);
        $post = get_post($post_id);

        if (!$post) {
            header('HTTP/1.1 404 Not Found');
            echo json_encode(array('success' => false, 'error' => 'Post not found'));
            return;
        }

        $author_id = $post->post_author;
        $user = get_userdata($author_id);

        $role = 'contributor';
        if ($user && !empty($user->roles)) {
            $role = $user->roles[0];
        }

        echo json_encode(array(
            'success' => true,
            'author_info' => array(
                'id' => $author_id,
                'role' => $role,
                'post_count' => count_user_posts($author_id)
            )
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array(
            'success' => false,
            'error' => 'Exception in handle_get_post_author: ' . $e->getMessage()
        ));
    }
}

/**
 * ─────────────────────────────────────────────────────────────
 * World of Rectification Game API Handlers
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Handle logging a game decision to TMS
 * POST /ai-publisher.php {"action":"logGameDecision","quest_id":1,"mode":"hard",...}
 */
function handle_log_game_decision($args) {
    try {
        // Validate required fields
        if (!isset($args['quest_id'])) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array('success' => false, 'error' => 'Missing quest_id'));
            return;
        }

        $quest_id = intval($args['quest_id']);
        $mode = isset($args['mode']) ? sanitize_text_field($args['mode']) : 'easy';
        $choice = isset($args['choice']) ? sanitize_textarea_field($args['choice']) : '';
        $reasoning = isset($args['reasoning']) ? sanitize_textarea_field($args['reasoning']) : '';
        $time_taken = isset($args['time_taken']) ? intval($args['time_taken']) : 0;
        $user_id = isset($args['user_id']) ? intval($args['user_id']) : 1;

        // Calculate CTRM score if WOR_CTRM is available
        $ctrm_score = 0.0;
        if (class_exists('WOR_CTRM')) {
            $ctrm_score = WOR_CTRM()->record_decision($user_id, $quest_id, array(
                'mode' => $mode,
                'choices' => array($choice),
                'reasoning' => $reasoning,
                'time_taken' => $time_taken,
            ));
        } else {
            // Fallback calculation
            $base_score = 10.0;
            $mode_multiplier = $mode === 'hard' ? 2.5 : 1.0;
            $reasoning_bonus = min(5.0, str_word_count($reasoning) / 10);
            $ctrm_score = ($base_score + $reasoning_bonus) * $mode_multiplier;
        }

        // Create TMS truth entry from decision
        $post_data = array(
            'post_title'   => "Game Decision: Quest $quest_id ($mode mode)",
            'post_content' => json_encode(array(
                'quest_id' => $quest_id,
                'mode' => $mode,
                'choice' => $choice,
                'reasoning' => $reasoning,
                'ctrm_score' => $ctrm_score,
                'time_taken' => $time_taken,
                'timestamp' => time(),
            ), JSON_PRETTY_PRINT),
            'post_status'  => 'publish',
            'post_author'  => $user_id,
            'post_type'    => 'post',
        );

        $post_id = wp_insert_post($post_data);

        if (is_wp_error($post_id)) {
            echo json_encode(array('success' => false, 'error' => $post_id->get_error_message()));
            return;
        }

        // Add CTRM metadata
        add_post_meta($post_id, 'wor_decision', 1);
        add_post_meta($post_id, 'ctrm_score', $ctrm_score);
        add_post_meta($post_id, 'decision_mode', $mode);
        add_post_meta($post_id, 'quest_id', $quest_id);

        // Notify Visual Bridge
        notify_visual_bridge('WOR_DECISION', "decision-$post_id", 'WoR', array($mode));

        echo json_encode(array(
            'success' => true,
            'post_id' => $post_id,
            'ctrm_score' => round($ctrm_score, 2),
            'tms_logged' => true,
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array('success' => false, 'error' => 'Exception: ' . $e->getMessage()));
    }
}

/**
 * Handle getting player CTRM stats
 * POST /ai-publisher.php {"action":"getPlayerCTRM","user_id":1}
 */
function handle_get_player_ctrm($args) {
    try {
        $user_id = isset($args['user_id']) ? intval($args['user_id']) : 1;

        // Get CTRM stats if WOR_CTRM is available
        if (class_exists('WOR_CTRM')) {
            $ctrm_score = WOR_CTRM()->get_score($user_id);
            $tms_level = WOR_CTRM()->get_tms_level($user_id);
            $level_name = WOR_CTRM()->get_tms_level_name($tms_level);
            $next_level = WOR_CTRM()->get_next_level_threshold($user_id);
        } else {
            // Fallback to user meta
            $ctrm_score = floatval(get_user_meta($user_id, 'wor_ctrm_score', true));
            $tms_level = intval(get_user_meta($user_id, 'wor_tms_level', true));
            $level_name = 'Player';
            $next_level = array('current_level' => $tms_level, 'next_level' => null, 'points_needed' => 0);
        }

        echo json_encode(array(
            'success' => true,
            'user_id' => $user_id,
            'ctrm_total' => round($ctrm_score, 2),
            'tms_level' => $tms_level,
            'level_name' => $level_name,
            'next_level' => $next_level,
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array('success' => false, 'error' => 'Exception: ' . $e->getMessage()));
    }
}

/**
 * Handle syncing game data across nodes
 * POST /ai-publisher.php {"action":"syncGameNodes","since":1234567890}
 */
function handle_sync_game_nodes($args) {
    try {
        $since = isset($args['since']) ? intval($args['since']) : 0;
        $limit = isset($args['limit']) ? min(intval($args['limit']), 500) : 100;

        global $wpdb;

        // Sync quest completions
        $completions = array();
        if (post_type_exists('wor_completion')) {
            $query = new WP_Query(array(
                'post_type' => 'wor_completion',
                'post_status' => 'publish',
                'posts_per_page' => $limit,
                'date_query' => $since > 0 ? array(
                    array('column' => 'post_date_gmt', 'after' => date('Y-m-d H:i:s', $since))
                ) : array(),
            ));

            while ($query->have_posts()) {
                $query->the_post();
                $post_id = get_the_ID();
                $completions[] = array(
                    'id' => $post_id,
                    'quest_id' => get_post_meta($post_id, 'wor_quest_id', true),
                    'mode' => get_post_meta($post_id, 'wor_mode', true),
                    'ctrm_delta' => floatval(get_post_meta($post_id, 'wor_ctrm_delta', true)),
                    'status' => get_post_meta($post_id, 'wor_status', true),
                    'date' => get_the_date('c'),
                );
            }
            wp_reset_postdata();
        }

        // Sync quests
        $quests = array();
        if (post_type_exists('wor_quest')) {
            $query = new WP_Query(array(
                'post_type' => 'wor_quest',
                'post_status' => 'publish',
                'posts_per_page' => $limit,
            ));

            while ($query->have_posts()) {
                $query->the_post();
                $post_id = get_the_ID();
                $quests[] = array(
                    'id' => $post_id,
                    'title' => get_the_title(),
                    'sefirah' => wp_get_post_terms($post_id, 'wor_sefirah', array('fields' => 'slugs')),
                    'credits_reward' => intval(get_post_meta($post_id, 'wor_credits_reward', true)),
                    'difficulty' => get_post_meta($post_id, 'wor_difficulty', true),
                );
            }
            wp_reset_postdata();
        }

        // Global stats
        $global_stats = array(
            'total_completions' => count($completions),
            'total_quests' => count($quests),
            'sync_time' => time(),
        );

        echo json_encode(array(
            'success' => true,
            'completions' => $completions,
            'quests' => $quests,
            'global_stats' => $global_stats,
            'sync_time' => time(),
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array('success' => false, 'error' => 'Exception: ' . $e->getMessage()));
    }
}

/**
 * Handle verifying a spark (peer review)
 * POST /ai-publisher.php {"action":"verifySpark","completion_id":123,"verified":true}
 */
function handle_verify_spark($args) {
    try {
        $completion_id = isset($args['completion_id']) ? intval($args['completion_id']) : 0;
        $verified = isset($args['verified']) ? (bool)$args['verified'] : true;
        $verifier_id = isset($args['verifier_id']) ? intval($args['verifier_id']) : 1;

        if ($completion_id === 0) {
            header('HTTP/1.1 400 Bad Request');
            echo json_encode(array('success' => false, 'error' => 'Missing completion_id'));
            return;
        }

        // Get completion post
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== 'wor_completion') {
            header('HTTP/1.1 404 Not Found');
            echo json_encode(array('success' => false, 'error' => 'Completion not found'));
            return;
        }

        // Update verification status
        if ($verified) {
            update_post_meta($completion_id, 'wor_status', 'verified');
            update_post_meta($completion_id, 'wor_verified_by', $verifier_id);
            update_post_meta($completion_id, 'wor_verified_at', current_time('mysql'));
            update_post_meta($completion_id, 'wor_verification_method', 'peer_review');

            // Award credits
            $credits = 10;
            $user_id = $post->post_author;
            if (class_exists('WOR_Credits')) {
                $quest_id = get_post_meta($completion_id, 'wor_quest_id', true);
                WOR_Credits()->award_credits($user_id, $credits, 'spark_verified', $quest_id);
            }
            update_post_meta($completion_id, 'wor_spark_credits', $credits);

            // Notify Visual Bridge
            notify_visual_bridge('SPARK_VERIFIED', "spark-$completion_id", 'WoR', array('verified' => true));
        } else {
            update_post_meta($completion_id, 'wor_status', 'rejected');
            update_post_meta($completion_id, 'wor_rejection_reason', 'Peer review rejected');
        }

        echo json_encode(array(
            'success' => true,
            'completion_id' => $completion_id,
            'verified' => $verified,
            'spark_credits' => $verified ? $credits : 0,
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array('success' => false, 'error' => 'Exception: ' . $e->getMessage()));
    }
}

/**
 * Handle getting game statistics
 * POST /ai-publisher.php {"action":"getGameStats"}
 */
function handle_get_game_stats($args) {
    try {
        global $wpdb;

        // Count quests
        $quest_count = 0;
        if (post_type_exists('wor_quest')) {
            $quest_count = wp_count_posts('wor_quest')->publish;
        }

        // Count completions
        $completion_stats = array('total' => 0, 'verified' => 0, 'pending' => 0);
        if (post_type_exists('wor_completion')) {
            $posts = wp_count_posts('wor_completion');
            $completion_stats['total'] = $posts->publish;

            // Count by status
            $query = new WP_Query(array(
                'post_type' => 'wor_completion',
                'post_status' => 'publish',
                'posts_per_page' => -1,
                'fields' => 'ids',
            ));
            foreach ($query->posts as $id) {
                $status = get_post_meta($id, 'wor_status', true);
                if ($status === 'verified') $completion_stats['verified']++;
                elseif ($status === 'pending' || empty($status)) $completion_stats['pending']++;
            }
        }

        // Get leaderboard if WOR_CTRM available
        $leaderboard = array();
        if (class_exists('WOR_CTRM')) {
            $leaderboard = WOR_CTRM()->get_leaderboard(5);
        }

        echo json_encode(array(
            'success' => true,
            'quest_count' => $quest_count,
            'completion_stats' => $completion_stats,
            'leaderboard' => $leaderboard,
            'timestamp' => time(),
        ));
    } catch (Exception $e) {
        header('HTTP/1.1 500 Internal Server Error');
        echo json_encode(array('success' => false, 'error' => 'Exception: ' . $e->getMessage()));
    }
}
