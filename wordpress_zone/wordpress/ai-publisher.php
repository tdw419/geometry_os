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
    echo json_encode(array('success' => true, 'posts' => array()));
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
