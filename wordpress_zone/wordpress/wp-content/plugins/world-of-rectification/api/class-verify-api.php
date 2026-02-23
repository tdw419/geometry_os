<?php
/**
 * Verify API Controller
 *
 * REST API endpoints for quest completion verification.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) exit;

/**
 * Class WOR_Verify_API
 *
 * REST API endpoints for completion verification.
 */
class WOR_Verify_API {
    /**
     * REST API namespace.
     */
    const API_NAMESPACE = 'wor/v1';

    /**
     * Singleton instance.
     *
     * @var WOR_Verify_API|null
     */
    private static $instance = null;

    /**
     * Get singleton instance.
     *
     * @return self
     */
    public static function get_instance(): self {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Private constructor.
     */
    private function __construct() {
        add_action('rest_api_init', [$this, 'register_routes']);
    }

    /**
     * Register REST API routes.
     */
    public function register_routes(): void {
        // POST /wor/v1/completions - Submit quest completion
        register_rest_route(self::API_NAMESPACE, '/completions', [
            'methods' => 'POST',
            'callback' => [$this, 'submit_completion'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'quest_id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
                'mode' => [
                    'type' => 'string',
                    'default' => 'easy',
                    'enum' => ['easy', 'hard'],
                    'sanitize_callback' => 'sanitize_text_field',
                ],
                'photo_url' => [
                    'type' => 'string',
                    'format' => 'uri',
                    'sanitize_callback' => 'esc_url_raw',
                ],
                'notes' => [
                    'type' => 'string',
                    'sanitize_callback' => 'sanitize_textarea_field',
                ],
                'reasoning' => [
                    'type' => 'string',
                    'sanitize_callback' => 'sanitize_textarea_field',
                ],
                'time_taken' => [
                    'type' => 'integer',
                    'default' => 0,
                    'sanitize_callback' => 'absint',
                ],
                'choices' => [
                    'type' => 'array',
                    'default' => [],
                    'sanitize_callback' => [$this, 'sanitize_choices'],
                ],
            ],
        ]);

        // GET /wor/v1/completions/pending - Get pending completions (for verifiers)
        register_rest_route(self::API_NAMESPACE, '/completions/pending', [
            'methods' => 'GET',
            'callback' => [$this, 'get_pending_completions'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'page' => [
                    'type' => 'integer',
                    'default' => 1,
                    'minimum' => 1,
                    'sanitize_callback' => 'absint',
                ],
                'per_page' => [
                    'type' => 'integer',
                    'default' => 20,
                    'minimum' => 1,
                    'maximum' => 100,
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // GET /wor/v1/completions/{id} - Get single completion
        register_rest_route(self::API_NAMESPACE, '/completions/(?P<id>\d+)', [
            'methods' => 'GET',
            'callback' => [$this, 'get_completion'],
            'permission_callback' => '__return_true',
            'args' => [
                'id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // POST /wor/v1/completions/{id}/verify - Verify a completion
        register_rest_route(self::API_NAMESPACE, '/completions/(?P<id>\d+)/verify', [
            'methods' => 'POST',
            'callback' => [$this, 'verify_completion'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // POST /wor/v1/completions/{id}/reject - Reject with reason
        register_rest_route(self::API_NAMESPACE, '/completions/(?P<id>\d+)/reject', [
            'methods' => 'POST',
            'callback' => [$this, 'reject_completion'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
                'reason' => [
                    'type' => 'string',
                    'required' => true,
                    'sanitize_callback' => 'sanitize_textarea_field',
                ],
            ],
        ]);

        // GET /wor/v1/completions/me - Get current user's completions
        register_rest_route(self::API_NAMESPACE, '/completions/me', [
            'methods' => 'GET',
            'callback' => [$this, 'get_my_completions'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'page' => [
                    'type' => 'integer',
                    'default' => 1,
                    'minimum' => 1,
                    'sanitize_callback' => 'absint',
                ],
                'per_page' => [
                    'type' => 'integer',
                    'default' => 20,
                    'minimum' => 1,
                    'maximum' => 100,
                    'sanitize_callback' => 'absint',
                ],
                'status' => [
                    'type' => 'string',
                    'enum' => ['pending', 'verified', 'rejected', 'all'],
                    'default' => 'all',
                    'sanitize_callback' => 'sanitize_text_field',
                ],
            ],
        ]);
    }

    /**
     * Permission callback for authenticated endpoints.
     *
     * @return bool|WP_Error
     */
    public function check_auth() {
        if (!is_user_logged_in()) {
            return new WP_Error(
                'rest_forbidden',
                __('You must be logged in to access this endpoint.', 'world-of-rectification'),
                ['status' => 401]
            );
        }
        return true;
    }

    /**
     * Sanitize choices array.
     *
     * @param mixed $choices Choices to sanitize.
     * @return array
     */
    public function sanitize_choices($choices): array {
        if (!is_array($choices)) {
            return [];
        }
        return array_map('sanitize_text_field', $choices);
    }

    /**
     * Submit a quest completion for verification.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function submit_completion(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $quest_id = (int) $request->get_param('quest_id');

        // Verify quest exists
        $quest = get_post($quest_id);
        if (!$quest || $quest->post_type !== 'wor_quest') {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Quest not found',
            ], 404);
        }

        // Check if user already has a pending completion for this quest
        $existing = get_posts([
            'post_type' => 'wor_completion',
            'author' => $user_id,
            'posts_per_page' => 1,
            'meta_query' => [
                [
                    'key' => 'wor_quest_id',
                    'value' => $quest_id,
                ],
                [
                    'key' => 'wor_status',
                    'value' => 'pending',
                ],
            ],
        ]);

        if (!empty($existing)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'You already have a pending completion for this quest',
                'completion_id' => $existing[0]->ID,
            ], 400);
        }

        // Create completion post
        $completion_id = wp_insert_post([
            'post_type' => 'wor_completion',
            'post_author' => $user_id,
            'post_status' => 'publish',
            'post_title' => sprintf('%s - %s', $quest->post_title, wp_get_current_user()->display_name),
        ]);

        if (is_wp_error($completion_id)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Failed to create completion record',
            ], 500);
        }

        // Set quest ID and started time
        update_post_meta($completion_id, 'wor_quest_id', $quest_id);
        update_post_meta($completion_id, 'wor_started_at', current_time('mysql'));

        // Submit for verification with evidence
        $result = WOR_Truth_Engine()->submit_for_verification($completion_id, [
            'quest_id' => $quest_id,
            'mode' => $request->get_param('mode'),
            'photo_url' => $request->get_param('photo_url'),
            'notes' => $request->get_param('notes'),
            'reasoning' => $request->get_param('reasoning'),
            'time_taken' => $request->get_param('time_taken'),
            'choices' => $request->get_param('choices'),
        ]);

        if (is_wp_error($result)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => $result->get_error_message(),
            ], 400);
        }

        // Get verification status
        $status = WOR_Truth_Engine()->get_verification_status($completion_id);

        return new WP_REST_Response([
            'success' => true,
            'completion_id' => $completion_id,
            'quest_id' => $quest_id,
            'quest_title' => $quest->post_title,
            'status' => $status['status'],
            'submitted_at' => current_time('mysql'),
        ], 201);
    }

    /**
     * Get pending completions for verification.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function get_pending_completions(WP_REST_Request $request): WP_REST_Response {
        $page = (int) $request->get_param('page');
        $per_page = (int) $request->get_param('per_page');
        $offset = ($page - 1) * $per_page;

        $result = WOR_Truth_Engine()->get_pending_completions($per_page, $offset);

        return new WP_REST_Response([
            'success' => true,
            'completions' => $result['completions'],
            'total' => $result['total'],
            'total_pages' => $result['total_pages'],
            'page' => $page,
            'per_page' => $per_page,
        ]);
    }

    /**
     * Get a single completion.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function get_completion(WP_REST_Request $request): WP_REST_Response {
        $completion_id = (int) $request->get_param('id');

        $post = get_post($completion_id);
        if (!$post || $post->post_type !== 'wor_completion') {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Completion not found',
            ], 404);
        }

        $status = WOR_Truth_Engine()->get_verification_status($completion_id);

        $quest_id = get_post_meta($completion_id, 'wor_quest_id', true);
        $quest = get_post($quest_id);
        $evidence = get_post_meta($completion_id, 'wor_evidence', true);
        $completer = get_user_by('ID', $post->post_author);

        return new WP_REST_Response([
            'success' => true,
            'completion' => [
                'id' => $completion_id,
                'quest' => [
                    'id' => (int) $quest_id,
                    'title' => $quest ? $quest->post_title : 'Unknown',
                ],
                'completer' => [
                    'id' => (int) $post->post_author,
                    'name' => $completer ? $completer->display_name : 'Unknown',
                ],
                'evidence' => $evidence ?: [],
                'verification' => $status,
                'created_at' => $post->post_date,
                'credits_earned' => (int) get_post_meta($completion_id, 'wor_credits_earned', true),
                'ctrm_delta' => (float) get_post_meta($completion_id, 'wor_ctrm_delta', true),
            ],
        ]);
    }

    /**
     * Verify a completion.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function verify_completion(WP_REST_Request $request): WP_REST_Response {
        $completion_id = (int) $request->get_param('id');
        $verifier_id = get_current_user_id();

        $result = WOR_Truth_Engine()->verify_completion($completion_id, $verifier_id);

        if (is_wp_error($result)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => $result->get_error_message(),
            ], 400);
        }

        // Get updated status
        $status = WOR_Truth_Engine()->get_verification_status($completion_id);
        $completion = get_post($completion_id);
        $credits_earned = (int) get_post_meta($completion_id, 'wor_credits_earned', true);

        return new WP_REST_Response([
            'success' => true,
            'message' => 'Completion verified successfully',
            'completion_id' => $completion_id,
            'status' => $status['status'],
            'verified_by' => $status['verified_by'],
            'verified_at' => $status['verified_at'],
            'verification_method' => $status['verification_method'],
            'credits_awarded' => $credits_earned,
        ]);
    }

    /**
     * Reject a completion.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function reject_completion(WP_REST_Request $request): WP_REST_Response {
        $completion_id = (int) $request->get_param('id');
        $reason = $request->get_param('reason');
        $rejected_by = get_current_user_id();

        if (empty($reason)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Rejection reason is required',
            ], 400);
        }

        $result = WOR_Truth_Engine()->reject_completion($completion_id, $reason, $rejected_by);

        if (is_wp_error($result)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => $result->get_error_message(),
            ], 400);
        }

        $status = WOR_Truth_Engine()->get_verification_status($completion_id);

        return new WP_REST_Response([
            'success' => true,
            'message' => 'Completion rejected',
            'completion_id' => $completion_id,
            'status' => $status['status'],
            'rejection_reason' => $status['rejection_reason'],
            'rejected_at' => $status['verified_at'],
        ]);
    }

    /**
     * Get current user's completions.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function get_my_completions(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $page = (int) $request->get_param('page');
        $per_page = (int) $request->get_param('per_page');
        $status_filter = $request->get_param('status');

        $args = [
            'post_type' => 'wor_completion',
            'author' => $user_id,
            'posts_per_page' => $per_page,
            'paged' => $page,
            'orderby' => 'date',
            'order' => 'DESC',
        ];

        // Add status filter
        if ($status_filter !== 'all') {
            $args['meta_query'] = [
                [
                    'key' => 'wor_status',
                    'value' => $status_filter,
                ],
            ];
        }

        $query = new WP_Query($args);
        $completions = [];

        foreach ($query->posts as $post) {
            $quest_id = get_post_meta($post->ID, 'wor_quest_id', true);
            $quest = get_post($quest_id);
            $status = get_post_meta($post->ID, 'wor_status', true) ?: 'pending';

            $completions[] = [
                'id' => $post->ID,
                'quest_id' => (int) $quest_id,
                'quest_title' => $quest ? $quest->post_title : 'Unknown',
                'status' => $status,
                'credits_earned' => (int) get_post_meta($post->ID, 'wor_credits_earned', true),
                'ctrm_delta' => (float) get_post_meta($post->ID, 'wor_ctrm_delta', true),
                'created_at' => $post->post_date,
                'completed_at' => get_post_meta($post->ID, 'wor_completed_at', true),
                'verified_at' => get_post_meta($post->ID, 'wor_verified_at', true),
            ];
        }

        // Get user stats
        $stats = WOR_Truth_Engine()->get_user_completion_stats($user_id);

        return new WP_REST_Response([
            'success' => true,
            'completions' => $completions,
            'total' => (int) $query->found_posts,
            'total_pages' => (int) $query->max_num_pages,
            'page' => $page,
            'per_page' => $per_page,
            'stats' => $stats,
        ]);
    }
}

/**
 * Helper function to get Verify API instance.
 *
 * @return WOR_Verify_API
 */
function WOR_Verify_API(): WOR_Verify_API {
    return WOR_Verify_API::get_instance();
}

// Initialize the API
WOR_Verify_API();
