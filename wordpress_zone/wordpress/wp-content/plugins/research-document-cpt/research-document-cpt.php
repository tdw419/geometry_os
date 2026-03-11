<?php
/**
 * Plugin Name: Research Document CPT
 * Description: Custom post type for research documents imported from /home/jericho/zion/docs/research
 * Version: 1.0.0
 * Author: Geometry OS
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Register the Research Document custom post type
 */
function research_document_cpt_register() {
    $args = array(
        'labels' => array(
            'name'               => 'Research Documents',
            'singular_name'      => 'Research Document',
            'add_new'            => 'Add New',
            'add_new_item'       => 'Add New Research Document',
            'edit_item'          => 'Edit Research Document',
            'new_item'           => 'New Research Document',
            'view_item'          => 'View Research Document',
            'search_items'       => 'Search Research Documents',
            'not_found'          => 'No research documents found',
            'not_found_in_trash' => 'No research documents found in trash',
        ),
        'public'        => true,
        'show_in_rest'  => true,
        'has_archive'   => true,
        'supports'      => array('title', 'editor', 'custom-fields'),
        'menu_icon'     => 'dashicons-book',
        'rewrite'       => array('slug' => 'research-documents'),
    );
    register_post_type('research_document', $args);
}
add_action('init', 'research_document_cpt_register');
