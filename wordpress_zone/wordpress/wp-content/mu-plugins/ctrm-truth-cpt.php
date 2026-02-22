<?php
/**
 * Plugin Name: CTRM/TMS Custom Post Types
 * Description: Registers truth_entry and ansmo_cycle custom post types for CTRM/TMS integration.
 * Version: 0.1
 * Author: Geometry OS Agent
 */

if (!defined('ABSPATH')) exit;

/**
 * Register CTRM/TMS custom post types on init
 */
add_action('init', function() {
    // Register truth_entry CPT for CTRM truth logging
    register_post_type('truth_entry', array(
        'labels' => array(
            'name' => 'Truth Entries',
            'singular_name' => 'Truth Entry',
            'add_new' => 'Add New',
            'add_new_item' => 'Add New Truth Entry',
            'edit_item' => 'Edit Truth Entry',
            'new_item' => 'New Truth Entry',
            'view_item' => 'View Truth Entry',
            'search_items' => 'Search Truth Entries',
            'not_found' => 'No truth entries found',
            'not_found_in_trash' => 'No truth entries found in trash',
        ),
        'public' => true,
        'has_archive' => true,
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'custom-fields'),
        'menu_icon' => 'dashicons-yes-alt',
        'capability_type' => 'post',
        'rewrite' => array('slug' => 'truth-entries'),
    ));

    // Register ansmo_cycle CPT for TMS ANSMO cycle logging
    register_post_type('ansmo_cycle', array(
        'labels' => array(
            'name' => 'ANSMO Cycles',
            'singular_name' => 'ANSMO Cycle',
            'add_new' => 'Add New',
            'add_new_item' => 'Add New ANSMO Cycle',
            'edit_item' => 'Edit ANSMO Cycle',
            'new_item' => 'New ANSMO Cycle',
            'view_item' => 'View ANSMO Cycle',
            'search_items' => 'Search ANSMO Cycles',
            'not_found' => 'No ANSMO cycles found',
            'not_found_in_trash' => 'No ANSMO cycles found in trash',
        ),
        'public' => true,
        'has_archive' => true,
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'custom-fields'),
        'menu_icon' => 'dashicons-update',
        'capability_type' => 'post',
        'rewrite' => array('slug' => 'ansmo-cycles'),
    ));
});
