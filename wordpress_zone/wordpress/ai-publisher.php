<?php
/**
 * AI Publisher Helper for Geometry OS
 * Allows local AI agents to publish posts to WordPress.
 * 
 * SECURITY: Only accessible from 127.0.0.1
 */

if ($_SERVER['REMOTE_ADDR'] !== '127.0.0.1' && $_SERVER['REMOTE_ADDR'] !== '::1') {
    header('HTTP/1.1 403 Forbidden');
    die('Local access only.');
}

require_once('wp-load.php');

$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (!$data || !isset($data['title']) || !isset($data['content'])) {
    header('HTTP/1.1 400 Bad Request');
    die('Missing title or content.');
}

$post_data = array(
    'post_title'    => wp_strip_all_tags($data['title']),
    'post_content'  => $data['content'],
    'post_status'   => 'publish',
    'post_author'   => 1, // Default to first user
    'post_type'     => isset($data['type']) ? $data['type'] : 'post',
    'post_category' => array(isset($data['category']) ? $data['category'] : 1)
);

$post_id = wp_insert_post($post_data);

if (is_wp_error($post_id)) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(array('success' => false, 'error' => $post_id->get_error_message()));
} else {
    echo json_encode(array('success' => true, 'post_id' => $post_id, 'url' => get_permalink($post_id)));
}
