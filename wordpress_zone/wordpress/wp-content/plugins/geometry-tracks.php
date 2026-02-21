<?php
/**
 * Plugin Name: Geometry Tracks
 * Description: Track Board CPT for multi-agent file coordination with Visual Bridge integration.
 * Version: 1.0.0
 * Author: Geometry OS
 * Text Domain: geometry-tracks
 */

// Do not load directly.
if ( ! defined( 'ABSPATH' ) ) {
	die();
}

/**
 * Register the track_claim Custom Post Type
 */
function geometry_tracks_register_cpt() {
	$labels = array(
		'name'               => __( 'Track Claims', 'geometry-tracks' ),
		'singular_name'      => __( 'Track Claim', 'geometry-tracks' ),
		'add_new'            => __( 'Add New', 'geometry-tracks' ),
		'add_new_item'       => __( 'Add New Track Claim', 'geometry-tracks' ),
		'edit_item'          => __( 'Edit Track Claim', 'geometry-tracks' ),
		'new_item'           => __( 'New Track Claim', 'geometry-tracks' ),
		'view_item'          => __( 'View Track Claim', 'geometry-tracks' ),
		'search_items'       => __( 'Search Track Claims', 'geometry-tracks' ),
		'not_found'          => __( 'No track claims found', 'geometry-tracks' ),
		'not_found_in_trash' => __( 'No track claims found in trash', 'geometry-tracks' ),
		'menu_name'          => __( 'Track Claims', 'geometry-tracks' ),
	);

	$args = array(
		'labels'             => $labels,
		'public'             => false,
		'publicly_queryable' => false,
		'show_ui'            => true,
		'show_in_menu'       => true,
		'query_var'          => false,
		'rewrite'            => false,
		'capability_type'    => 'post',
		'has_archive'        => false,
		'hierarchical'       => false,
		'menu_position'      => 25,
		'menu_icon'          => 'dashicons-clipboard',
		'supports'           => array( 'title', 'custom-fields' ),
		'show_in_rest'       => false,
	);

	register_post_type( 'track_claim', $args );
}
add_action( 'init', 'geometry_tracks_register_cpt' );

/**
 * Add custom admin columns for track_claim CPT
 */
function geometry_tracks_custom_columns( $columns ) {
	// Remove date column
	unset( $columns['date'] );

	// Add custom columns
	$columns['agent_id']     = __( 'Agent ID', 'geometry-tracks' );
	$columns['files_count']  = __( 'Files Count', 'geometry-tracks' );
	$columns['heartbeat']    = __( 'Heartbeat', 'geometry-tracks' );
	$columns['track_status'] = __( 'Status', 'geometry-tracks' );

	return $columns;
}
add_filter( 'manage_track_claim_posts_columns', 'geometry_tracks_custom_columns' );

/**
 * Render custom column content
 */
function geometry_tracks_column_content( $column, $post_id ) {
	switch ( $column ) {
		case 'agent_id':
			$agent_id = get_post_meta( $post_id, 'agent_id', true );
			echo esc_html( $agent_id ? $agent_id : '-' );
			break;

		case 'files_count':
			$files = get_post_meta( $post_id, 'files', true );
			if ( is_array( $files ) ) {
				echo count( $files );
			} else {
				echo '0';
			}
			break;

		case 'heartbeat':
			$heartbeat = get_post_meta( $post_id, 'heartbeat', true );
			if ( $heartbeat ) {
				$heartbeat_time = strtotime( $heartbeat );
				$current_time   = current_time( 'timestamp' );
				$diff_minutes   = round( ( $current_time - $heartbeat_time ) / 60 );

				if ( $diff_minutes > 10 ) {
					echo '<span style="color: #d63638; font-weight: bold;">';
					echo sprintf( __( 'EXPIRED (%d min ago)', 'geometry-tracks' ), $diff_minutes );
					echo '</span>';
				} else {
					echo sprintf( __( '%d min ago', 'geometry-tracks' ), $diff_minutes );
				}
			} else {
				echo __( 'Never', 'geometry-tracks' );
			}
			break;

		case 'track_status':
			$post_status = get_post_status( $post_id );
			$heartbeat   = get_post_meta( $post_id, 'heartbeat', true );

			if ( $post_status === 'trash' ) {
				echo '<span style="color: #787c82;">' . __( 'Released', 'geometry-tracks' ) . '</span>';
			} elseif ( $heartbeat ) {
				$heartbeat_time = strtotime( $heartbeat );
				$current_time   = current_time( 'timestamp' );
				$diff_minutes   = round( ( $current_time - $heartbeat_time ) / 60 );

				if ( $diff_minutes > 10 ) {
					echo '<span style="color: #d63638;">' . __( 'Expired', 'geometry-tracks' ) . '</span>';
				} else {
					echo '<span style="color: #00a32a; font-weight: bold;">' . __( 'Active', 'geometry-tracks' ) . '</span>';
				}
			} else {
				echo '<span style="color: #dba617;">' . __( 'Unknown', 'geometry-tracks' ) . '</span>';
			}
			break;
	}
}
add_action( 'manage_track_claim_posts_custom_column', 'geometry_tracks_column_content', 10, 2 );

/**
 * Make custom columns sortable
 */
function geometry_tracks_sortable_columns( $columns ) {
	$columns['agent_id']  = 'agent_id';
	$columns['heartbeat'] = 'heartbeat';
	return $columns;
}
add_filter( 'manage_edit-track_claim_sortable_columns', 'geometry_tracks_sortable_columns' );

/**
 * Add a dashboard widget showing active claims
 */
function geometry_tracks_dashboard_widget() {
	wp_add_dashboard_widget(
		'geometry_tracks_dashboard',
		__( 'Geometry OS - Active Track Claims', 'geometry-tracks' ),
		'geometry_tracks_dashboard_content'
	);
}
add_action( 'wp_dashboard_setup', 'geometry_tracks_dashboard_widget' );

/**
 * Render the dashboard widget content
 */
function geometry_tracks_dashboard_content() {
	$args = array(
		'post_type'      => 'track_claim',
		'post_status'    => 'publish',
		'posts_per_page' => 10,
		'orderby'        => 'modified',
		'order'          => 'DESC',
	);

	$query = new WP_Query( $args );

	if ( $query->have_posts() ) {
		echo '<table style="width: 100%; border-collapse: collapse;">';
		echo '<thead><tr>';
		echo '<th style="text-align: left; padding: 5px; border-bottom: 1px solid #ddd;">' . __( 'Track', 'geometry-tracks' ) . '</th>';
		echo '<th style="text-align: left; padding: 5px; border-bottom: 1px solid #ddd;">' . __( 'Agent', 'geometry-tracks' ) . '</th>';
		echo '<th style="text-align: left; padding: 5px; border-bottom: 1px solid #ddd;">' . __( 'Status', 'geometry-tracks' ) . '</th>';
		echo '</tr></thead>';
		echo '<tbody>';

		while ( $query->have_posts() ) {
			$query->the_post();
			$post_id       = get_the_ID();
			$agent_id      = get_post_meta( $post_id, 'agent_id', true );
			$heartbeat     = get_post_meta( $post_id, 'heartbeat', true );
			$is_expired    = false;

			if ( $heartbeat ) {
				$heartbeat_time = strtotime( $heartbeat );
				$current_time   = current_time( 'timestamp' );
				$diff_minutes   = round( ( $current_time - $heartbeat_time ) / 60 );
				$is_expired     = ( $diff_minutes > 10 );
			}

			echo '<tr>';
			echo '<td style="padding: 5px; border-bottom: 1px solid #eee;">' . esc_html( get_the_title() ) . '</td>';
			echo '<td style="padding: 5px; border-bottom: 1px solid #eee;">' . esc_html( $agent_id ? $agent_id : '-' ) . '</td>';
			echo '<td style="padding: 5px; border-bottom: 1px solid #eee;">';

			if ( $is_expired ) {
				echo '<span style="color: #d63638;">' . __( 'Expired', 'geometry-tracks' ) . '</span>';
			} else {
				echo '<span style="color: #00a32a;">' . __( 'Active', 'geometry-tracks' ) . '</span>';
			}

			echo '</td>';
			echo '</tr>';
		}

		echo '</tbody></table>';
		wp_reset_postdata();
	} else {
		echo '<p>' . __( 'No active track claims.', 'geometry-tracks' ) . '</p>';
	}
}

/**
 * Add admin styles for the EXPIRED badge
 */
function geometry_tracks_admin_styles() {
	$screen = get_current_screen();
	if ( $screen && $screen->post_type === 'track_claim' ) {
		echo '<style>
			.column-heartbeat {
				width: 120px;
			}
			.column-agent_id {
				width: 150px;
			}
			.column-files_count {
				width: 100px;
			}
			.column-track_status {
				width: 100px;
			}
		</style>';
	}
}
add_action( 'admin_head', 'geometry_tracks_admin_styles' );
