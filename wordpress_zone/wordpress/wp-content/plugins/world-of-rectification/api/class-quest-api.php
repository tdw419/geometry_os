<?php
/**
 * Quest REST API Controller
 *
 * Handles all REST API endpoints for quest operations.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) exit;

/**
 * Class WOR_Quest_API
 *
 * REST API endpoints for World of Rectification quests.
 */
class WOR_Quest_API {
    /**
     * REST API namespace.
     */
    const API_NAMESPACE = 'wor/v1';

    /**
     * Singleton instance.
     *
     * @var WOR_Quest_API|null
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
        // GET /wor/v1/quests - List quests with pagination and filters
        register_rest_route(self::API_NAMESPACE, '/quests', [
            'methods' => 'GET',
            'callback' => [$this, 'get_quests'],
            'permission_callback' => '__return_true',
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
                'type' => [
                    'type' => 'string',
                    'enum' => ['local_shard', 'community_vessel', 'cosmic_raid'],
                    'sanitize_callback' => 'sanitize_text_field',
                ],
                'sefirah' => [
                    'type' => 'string',
                    'sanitize_callback' => 'sanitize_text_field',
                ],
                'location' => [
                    'type' => 'integer',
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // GET /wor/v1/quests/{id} - Get single quest
        register_rest_route(self::API_NAMESPACE, '/quests/(?P<id>\d+)', [
            'methods' => 'GET',
            'callback' => [$this, 'get_quest'],
            'permission_callback' => '__return_true',
            'args' => [
                'id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // POST /wor/v1/quests/{id}/start - Start a quest (requires auth)
        register_rest_route(self::API_NAMESPACE, '/quests/(?P<id>\d+)/start', [
            'methods' => 'POST',
            'callback' => [$this, 'start_quest'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'id' => [
                    'type' => 'integer',
                    'required' => true,
                    'sanitize_callback' => 'absint',
                ],
            ],
        ]);

        // POST /wor/v1/quests/{id}/complete - Complete a quest (requires auth)
        register_rest_route(self::API_NAMESPACE, '/quests/(?P<id>\d+)/complete', [
            'methods' => 'POST',
            'callback' => [$this, 'complete_quest'],
            'permission_callback' => [$this, 'check_auth'],
            'args' => [
                'id' => [
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
                'reasoning' => [
                    'type' => 'string',
                    'sanitize_callback' => 'sanitize_textarea_field',
                ],
                'time_taken' => [
                    'type' => 'integer',
                    'default' => 0,
                    'sanitize_callback' => 'absint',
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
                'choices' => [
                    'type' => 'array',
                    'default' => [],
                    'sanitize_callback' => [$this, 'sanitize_choices'],
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
     * Get list of quests with pagination and filtering.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function get_quests(WP_REST_Request $request): WP_REST_Response {
        $page = (int) $request->get_param('page');
        $per_page = (int) $request->get_param('per_page');
        $type = $request->get_param('type');
        $sefirah = $request->get_param('sefirah');
        $location = $request->get_param('location');

        // Build query args
        $args = [
            'post_type' => 'wor_quest',
            'post_status' => 'publish',
            'posts_per_page' => $per_page,
            'paged' => $page,
        ];

        // Add taxonomy filters
        $tax_query = [];

        if ($type) {
            $tax_query[] = [
                'taxonomy' => 'wor_quest_type',
                'field' => 'slug',
                'terms' => $type,
            ];
        }

        if ($sefirah) {
            $tax_query[] = [
                'taxonomy' => 'wor_sefirah',
                'field' => 'slug',
                'terms' => $sefirah,
            ];
        }

        if ($location) {
            $tax_query[] = [
                'taxonomy' => 'wor_location',
                'field' => 'term_id',
                'terms' => $location,
            ];
        }

        if (!empty($tax_query)) {
            $args['tax_query'] = count($tax_query) > 1
                ? array_merge(['relation' => 'AND'], $tax_query)
                : $tax_query;
        }

        $query = new WP_Query($args);
        $quests = [];

        foreach ($query->posts as $post) {
            $quests[] = $this->format_quest_data($post->ID);
        }

        return new WP_REST_Response([
            'success' => true,
            'quests' => $quests,
            'total' => (int) $query->found_posts,
            'total_pages' => (int) $query->max_num_pages,
            'page' => $page,
            'per_page' => $per_page,
        ]);
    }

    /**
     * Get a single quest by ID.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function get_quest(WP_REST_Request $request): WP_REST_Response {
        $quest_id = (int) $request->get_param('id');

        $post = get_post($quest_id);

        if (!$post || $post->post_type !== 'wor_quest') {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Quest not found',
            ], 404);
        }

        return new WP_REST_Response([
            'success' => true,
            'quest' => $this->format_quest_data($quest_id),
        ]);
    }

    /**
     * Start a quest for the current user.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function start_quest(WP_REST_Request $request): WP_REST_Response {
        $quest_id = (int) $request->get_param('id');
        $user_id = get_current_user_id();

        // Verify quest exists
        $post = get_post($quest_id);
        if (!$post || $post->post_type !== 'wor_quest') {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Quest not found',
            ], 404);
        }

        // Check if user already has an in-progress completion for this quest
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
                    'value' => 'in_progress',
                ],
            ],
        ]);

        if (!empty($existing)) {
            return new WP_REST_Response([
                'success' => true,
                'message' => 'Quest already in progress',
                'completion_id' => $existing[0]->ID,
                'quest' => $this->format_quest_data($quest_id),
            ]);
        }

        // Create completion record
        $completion_id = wp_insert_post([
            'post_type' => 'wor_completion',
            'post_author' => $user_id,
            'post_status' => 'publish',
            'post_title' => sprintf('Quest %d - User %d', $quest_id, $user_id),
        ]);

        if (is_wp_error($completion_id)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Failed to create completion record',
            ], 500);
        }

        // Add completion meta
        update_post_meta($completion_id, 'wor_quest_id', $quest_id);
        update_post_meta($completion_id, 'wor_status', 'in_progress');
        update_post_meta($completion_id, 'wor_started_at', current_time('mysql'));
        update_post_meta($completion_id, 'wor_started_at_unix', time());

        /**
         * Fires when a quest is started.
         *
         * @param int $completion_id Completion post ID.
         * @param int $quest_id      Quest ID.
         * @param int $user_id       User ID.
         */
        do_action('wor_quest_started', $completion_id, $quest_id, $user_id);

        return new WP_REST_Response([
            'success' => true,
            'completion_id' => $completion_id,
            'quest' => $this->format_quest_data($quest_id),
            'started_at' => current_time('mysql'),
        ]);
    }

    /**
     * Complete a quest for the current user.
     *
     * @param WP_REST_Request $request Request object.
     * @return WP_REST_Response
     */
    public function complete_quest(WP_REST_Request $request): WP_REST_Response {
        $quest_id = (int) $request->get_param('id');
        $user_id = get_current_user_id();

        $mode = $request->get_param('mode') ?: 'easy';
        $reasoning = $request->get_param('reasoning') ?: '';
        $time_taken = (int) $request->get_param('time_taken') ?: 0;
        $photo_url = $request->get_param('photo_url') ?: '';
        $notes = $request->get_param('notes') ?: '';
        $choices = $request->get_param('choices') ?: [];

        // Verify quest exists
        $quest = $this->format_quest_data($quest_id);
        if (!$quest) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Quest not found',
            ], 404);
        }

        // Find in-progress completion
        $completions = get_posts([
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
                    'value' => 'in_progress',
                ],
            ],
        ]);

        // If no in-progress completion, create one
        if (empty($completions)) {
            $completion_id = wp_insert_post([
                'post_type' => 'wor_completion',
                'post_author' => $user_id,
                'post_status' => 'publish',
                'post_title' => sprintf('Quest %d - User %d', $quest_id, $user_id),
            ]);

            if (is_wp_error($completion_id)) {
                return new WP_REST_Response([
                    'success' => false,
                    'error' => 'Failed to create completion record',
                ], 500);
            }

            update_post_meta($completion_id, 'wor_quest_id', $quest_id);
            update_post_meta($completion_id, 'wor_started_at', current_time('mysql'));
        } else {
            $completion_id = $completions[0]->ID;
        }

        // Update completion record
        update_post_meta($completion_id, 'wor_mode', $mode);
        update_post_meta($completion_id, 'wor_photo_url', $photo_url);
        update_post_meta($completion_id, 'wor_notes', $notes);
        update_post_meta($completion_id, 'wor_choices', $choices);
        update_post_meta($completion_id, 'wor_reasoning', $reasoning);
        update_post_meta($completion_id, 'wor_time_taken', $time_taken);
        update_post_meta($completion_id, 'wor_completed_at', current_time('mysql'));
        update_post_meta($completion_id, 'wor_status', 'completed');

        // Record CTRM decision and get delta
        $ctrm_delta = 0.0;
        if (class_exists('WOR_CTRM')) {
            $ctrm_delta = WOR_CTRM()->record_decision($user_id, $quest_id, [
                'mode' => $mode,
                'choices' => $choices,
                'reasoning' => $reasoning,
                'time_taken' => $time_taken,
            ]);
        }
        update_post_meta($completion_id, 'wor_ctrm_delta', $ctrm_delta);

        // Calculate credits earned
        $credits_earned = $this->calculate_credits($quest_id, $user_id, $mode);

        // Award credits via WOR_Credits if available
        if ($credits_earned > 0 && class_exists('WOR_Credits')) {
            WOR_Credits()->award_credits($user_id, $credits_earned, 'quest_completion', $quest_id);
        }
        update_post_meta($completion_id, 'wor_credits_earned', $credits_earned);

        // Get new TMS level
        $new_tms_level = 0;
        if (class_exists('WOR_CTRM')) {
            $new_tms_level = WOR_CTRM()->get_tms_level($user_id);
        }

        /**
         * Fires when a quest is completed.
         *
         * @param int   $completion_id Completion post ID.
         * @param int   $quest_id      Quest ID.
         * @param int   $user_id       User ID.
         * @param float $ctrm_delta    CTRM score change.
         * @param int   $credits       Credits earned.
         */
        do_action('wor_quest_completed', $completion_id, $quest_id, $user_id, $ctrm_delta, $credits_earned);

        return new WP_REST_Response([
            'success' => true,
            'quest' => $quest,
            'completion_id' => $completion_id,
            'credits_earned' => $credits_earned,
            'ctrm_delta' => round($ctrm_delta, 2),
            'new_tms_level' => $new_tms_level,
            'mode' => $mode,
            'completed_at' => current_time('mysql'),
        ]);
    }

    /**
     * Format quest data for API response.
     *
     * @param int $quest_id Quest post ID.
     * @return array|null Formatted quest data or null if not found.
     */
    private function format_quest_data(int $quest_id): ?array {
        $post = get_post($quest_id);

        if (!$post || $post->post_type !== 'wor_quest') {
            return null;
        }

        // Get taxonomy terms
        $type_terms = wp_get_post_terms($quest_id, 'wor_quest_type', ['fields' => 'names']);
        $sefirah_terms = wp_get_post_terms($quest_id, 'wor_sefirah', ['fields' => 'slugs']);
        $location_terms = wp_get_post_terms($quest_id, 'wor_location', ['fields' => 'names']);

        // Get meta fields
        $coordinates = get_post_meta($quest_id, 'wor_coordinates', true);
        $estimated_time = get_post_meta($quest_id, 'wor_estimated_time', true);
        $credits_reward = get_post_meta($quest_id, 'wor_credits_reward', true);
        $verification_method = get_post_meta($quest_id, 'wor_verification_method', true);
        $difficulty = get_post_meta($quest_id, 'wor_difficulty', true);

        return [
            'id' => $quest_id,
            'title' => $post->post_title,
            'description' => $post->post_content,
            'excerpt' => $post->post_excerpt,
            'type' => $type_terms[0] ?? 'local_shard',
            'sefirah' => $sefirah_terms[0] ?? null,
            'location' => $location_terms[0] ?? null,
            'status' => $post->post_status,
            'coordinates' => is_array($coordinates) ? $coordinates : null,
            'estimated_time' => $estimated_time ? (int) $estimated_time : null,
            'credits_reward' => $credits_reward ? (int) $credits_reward : 0,
            'verification_method' => $verification_method ?: 'algorithmic',
            'difficulty' => $difficulty ?: 'medium',
            'author' => (int) $post->post_author,
            'created_at' => $post->post_date,
            'modified_at' => $post->post_modified,
            'featured_image' => get_the_post_thumbnail_url($quest_id, 'full'),
        ];
    }

    /**
     * Calculate credits earned for completing a quest.
     *
     * @param int    $quest_id Quest ID.
     * @param int    $user_id  User ID.
     * @param string $mode     Completion mode ('easy' or 'hard').
     * @return int Credits earned.
     */
    private function calculate_credits(int $quest_id, int $user_id, string $mode): int {
        $quest = $this->format_quest_data($quest_id);
        if (!$quest) {
            return 0;
        }

        $base_credits = (int) ($quest['credits_reward'] ?? 0);

        // Mode multiplier
        $mode_multiplier = $mode === 'hard' ? 2.5 : 1.0;

        // Sefirah bonus if class matches
        $sefirah_bonus = 1.0;
        if (class_exists('WOR_Sefirah')) {
            $sefirah_bonus = WOR_Sefirah()->calculate_quest_bonus($user_id, $quest_id);
        }

        $total_credits = (int) ceil($base_credits * $mode_multiplier * $sefirah_bonus);

        return max(1, $total_credits); // Minimum 1 credit
    }
}

/**
 * Helper function to get Quest API instance.
 *
 * @return WOR_Quest_API
 */
function WOR_Quest_API(): WOR_Quest_API {
    return WOR_Quest_API::get_instance();
}

// Initialize the API
WOR_Quest_API();
