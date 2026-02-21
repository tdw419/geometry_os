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
    echo json_encode(array('success' => true, 'tools' => array('createPost', 'editPage', 'logEvolution')));
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
