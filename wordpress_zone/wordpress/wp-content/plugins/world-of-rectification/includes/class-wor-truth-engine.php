<?php
/**
 * Truth Engine - Verification System for World of Rectification
 *
 * Handles quest completion verification through peer, algorithmic, and oracle methods.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) exit;

class WOR_Truth_Engine {
    /**
     * Completion post type slug.
     */
    const COMPLETION_POST_TYPE = 'wor_completion';

    /**
     * Verification status values.
     */
    const STATUS_PENDING = 'pending';
    const STATUS_VERIFIED = 'verified';
    const STATUS_REJECTED = 'rejected';

    /**
     * Verification methods.
     */
    const METHOD_PEER = 'peer';
    const METHOD_ALGORITHMIC = 'algorithmic';
    const METHOD_ORACLE = 'oracle';

    /**
     * Singleton instance.
     *
     * @var WOR_Truth_Engine|null
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
        add_action('init', [$this, 'register_completion_post_type']);
        add_action('init', [$this, 'register_post_meta']);
    }

    /**
     * Register the completion post type.
     */
    public function register_completion_post_type(): void {
        register_post_type(self::COMPLETION_POST_TYPE, [
            'labels' => [
                'name' => __('Quest Completions', 'world-of-rectification'),
                'singular_name' => __('Quest Completion', 'world-of-rectification'),
                'add_new' => __('Add New Completion', 'world-of-rectification'),
                'add_new_item' => __('Add New Quest Completion', 'world-of-rectification'),
                'edit_item' => __('Edit Completion', 'world-of-rectification'),
                'view_item' => __('View Completion', 'world-of-rectification'),
                'search_items' => __('Search Completions', 'world-of-rectification'),
            ],
            'public' => false,
            'show_ui' => true,
            'show_in_rest' => true,
            'supports' => ['title', 'author', 'custom-fields', 'comments'],
            'capability_type' => 'post',
            'map_meta_cap' => true,
        ]);
    }

    /**
     * Register post meta fields for completions.
     */
    public function register_post_meta(): void {
        $meta_fields = [
            'wor_quest_id' => [
                'type' => 'integer',
                'description' => 'The quest ID this completion is for',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'absint',
            ],
            'wor_status' => [
                'type' => 'string',
                'description' => 'Verification status: pending, verified, rejected',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'sanitize_text_field',
                'default' => self::STATUS_PENDING,
            ],
            'wor_evidence' => [
                'type' => 'object',
                'description' => 'Evidence submitted for verification',
                'single' => true,
                'show_in_rest' => [
                    'schema' => [
                        'type' => 'object',
                        'properties' => [
                            'photo_url' => ['type' => 'string'],
                            'notes' => ['type' => 'string'],
                            'reasoning' => ['type' => 'string'],
                            'choices' => ['type' => 'array'],
                            'time_taken' => ['type' => 'integer'],
                            'mode' => ['type' => 'string'],
                        ],
                    ],
                ],
                'default' => [],
            ],
            'wor_verified_by' => [
                'type' => 'integer',
                'description' => 'User ID of the verifier',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'absint',
            ],
            'wor_verified_at' => [
                'type' => 'string',
                'description' => 'Timestamp when verified',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'sanitize_text_field',
            ],
            'wor_verification_method' => [
                'type' => 'string',
                'description' => 'Method used for verification: peer, algorithmic, oracle',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'sanitize_text_field',
            ],
            'wor_rejection_reason' => [
                'type' => 'string',
                'description' => 'Reason for rejection if applicable',
                'single' => true,
                'show_in_rest' => true,
                'sanitize_callback' => 'sanitize_textarea_field',
            ],
            'wor_started_at' => [
                'type' => 'string',
                'description' => 'Timestamp when quest was started',
                'single' => true,
                'show_in_rest' => true,
            ],
            'wor_completed_at' => [
                'type' => 'string',
                'description' => 'Timestamp when quest was completed',
                'single' => true,
                'show_in_rest' => true,
            ],
            'wor_credits_earned' => [
                'type' => 'integer',
                'description' => 'Credits earned from this completion',
                'single' => true,
                'show_in_rest' => true,
                'default' => 0,
            ],
            'wor_ctrm_delta' => [
                'type' => 'number',
                'description' => 'CTRM score delta from this completion',
                'single' => true,
                'show_in_rest' => true,
                'default' => 0.0,
            ],
        ];

        foreach ($meta_fields as $meta_key => $args) {
            register_post_meta(self::COMPLETION_POST_TYPE, $meta_key, $args);
        }
    }

    /**
     * Submit a quest completion for verification.
     *
     * @param int   $completion_id Completion post ID.
     * @param array $data         Evidence data for verification.
     * @return int|WP_Error Completion ID on success, WP_Error on failure.
     */
    public function submit_for_verification(int $completion_id, array $data) {
        // Verify completion exists
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== self::COMPLETION_POST_TYPE) {
            return new WP_Error(
                'invalid_completion',
                __('Invalid completion ID', 'world-of-rectification'),
                ['status' => 404]
            );
        }

        // Build evidence object
        $evidence = [
            'photo_url' => sanitize_url($data['photo_url'] ?? ''),
            'notes' => sanitize_textarea_field($data['notes'] ?? ''),
            'reasoning' => sanitize_textarea_field($data['reasoning'] ?? ''),
            'choices' => array_map('sanitize_text_field', $data['choices'] ?? []),
            'time_taken' => absint($data['time_taken'] ?? 0),
            'mode' => sanitize_text_field($data['mode'] ?? 'easy'),
        ];

        // Update completion with evidence
        update_post_meta($completion_id, 'wor_evidence', $evidence);
        update_post_meta($completion_id, 'wor_status', self::STATUS_PENDING);
        update_post_meta($completion_id, 'wor_completed_at', current_time('mysql'));

        /**
         * Fires when a completion is submitted for verification.
         *
         * @param int   $completion_id Completion post ID.
         * @param array $evidence      Evidence data.
         */
        do_action('wor_completion_submitted', $completion_id, $evidence);

        return $completion_id;
    }

    /**
     * Verify a quest completion (peer verification).
     *
     * @param int $completion_id Completion post ID.
     * @param int $verifier_id   User ID of the verifier.
     * @return bool|WP_Error True on success, WP_Error on failure.
     */
    public function verify_completion(int $completion_id, int $verifier_id) {
        // Verify completion exists and is pending
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== self::COMPLETION_POST_TYPE) {
            return new WP_Error(
                'invalid_completion',
                __('Invalid completion ID', 'world-of-rectification'),
                ['status' => 404]
            );
        }

        $status = get_post_meta($completion_id, 'wor_status', true);
        if ($status === self::STATUS_VERIFIED) {
            return new WP_Error(
                'already_verified',
                __('Completion already verified', 'world-of-rectification'),
                ['status' => 400]
            );
        }

        // Verify the verifier is not the completer
        if ((int) $post->post_author === $verifier_id) {
            return new WP_Error(
                'self_verification',
                __('Cannot verify your own completion', 'world-of-rectification'),
                ['status' => 403]
            );
        }

        // Update verification status
        update_post_meta($completion_id, 'wor_status', self::STATUS_VERIFIED);
        update_post_meta($completion_id, 'wor_verified_by', $verifier_id);
        update_post_meta($completion_id, 'wor_verified_at', current_time('mysql'));
        update_post_meta($completion_id, 'wor_verification_method', self::METHOD_PEER);

        // Award credits and update CTRM
        $this->award_verification_rewards($completion_id);

        /**
         * Fires when a completion is verified.
         *
         * @param int $completion_id Completion post ID.
         * @param int $verifier_id   User ID of the verifier.
         * @param string $method     Verification method used.
         */
        do_action('wor_completion_verified', $completion_id, $verifier_id, self::METHOD_PEER);

        return true;
    }

    /**
     * Auto-verify a completion using algorithmic verification.
     *
     * Placeholder for AI/algorithmic verification.
     *
     * @param int $completion_id Completion post ID.
     * @return bool|WP_Error True on success, WP_Error on failure.
     */
    public function auto_verify(int $completion_id) {
        // Verify completion exists and is pending
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== self::COMPLETION_POST_TYPE) {
            return new WP_Error(
                'invalid_completion',
                __('Invalid completion ID', 'world-of-rectification'),
                ['status' => 404]
            );
        }

        $status = get_post_meta($completion_id, 'wor_status', true);
        if ($status === self::STATUS_VERIFIED) {
            return new WP_Error(
                'already_verified',
                __('Completion already verified', 'world-of-rectification'),
                ['status' => 400]
            );
        }

        // Get evidence for algorithmic analysis
        $evidence = get_post_meta($completion_id, 'wor_evidence', true);
        $quest_id = get_post_meta($completion_id, 'wor_quest_id', true);

        // Placeholder: Algorithmic verification logic
        // In production, this would call AI services, check photo validity, etc.
        $verification_result = $this->run_algorithmic_checks($completion_id, $quest_id, $evidence);

        if ($verification_result['verified']) {
            update_post_meta($completion_id, 'wor_status', self::STATUS_VERIFIED);
            update_post_meta($completion_id, 'wor_verified_at', current_time('mysql'));
            update_post_meta($completion_id, 'wor_verification_method', self::METHOD_ALGORITHMIC);

            // Award credits and update CTRM
            $this->award_verification_rewards($completion_id);

            /**
             * Fires when a completion is auto-verified.
             *
             * @param int $completion_id Completion post ID.
             * @param array $result      Verification result data.
             */
            do_action('wor_completion_auto_verified', $completion_id, $verification_result);

            return true;
        } else {
            // Auto-reject if algorithmic checks fail
            update_post_meta($completion_id, 'wor_status', self::STATUS_REJECTED);
            update_post_meta($completion_id, 'wor_rejection_reason', $verification_result['reason']);

            /**
             * Fires when a completion is auto-rejected.
             *
             * @param int $completion_id Completion post ID.
             * @param string $reason     Rejection reason.
             */
            do_action('wor_completion_auto_rejected', $completion_id, $verification_result['reason']);

            return new WP_Error(
                'verification_failed',
                $verification_result['reason'],
                ['status' => 400]
            );
        }
    }

    /**
     * Run algorithmic verification checks.
     *
     * @param int   $completion_id Completion post ID.
     * @param int   $quest_id      Quest ID.
     * @param array $evidence      Evidence data.
     * @return array Verification result with 'verified' bool and 'reason' string.
     */
    private function run_algorithmic_checks(int $completion_id, int $quest_id, array $evidence): array {
        // Placeholder for AI/algorithmic verification
        // In production:
        // - Check photo for required elements
        // - Validate GPS coordinates
        // - Check reasoning quality with NLP
        // - Compare against known valid completions

        // For now, basic heuristics
        $score = 0;
        $max_score = 100;

        // Photo evidence (40 points)
        if (!empty($evidence['photo_url'])) {
            $score += 40;
        }

        // Reasoning quality (30 points)
        $reasoning = $evidence['reasoning'] ?? '';
        if (str_word_count($reasoning) >= 20) {
            $score += 20;
        }
        if (str_word_count($reasoning) >= 50) {
            $score += 10;
        }

        // Time spent (15 points)
        $time_taken = $evidence['time_taken'] ?? 0;
        if ($time_taken >= 30) {
            $score += 10;
        }
        if ($time_taken >= 60) {
            $score += 5;
        }

        // Mode difficulty (15 points)
        if (($evidence['mode'] ?? 'easy') === 'hard') {
            $score += 15;
        }

        // Threshold: 60 points required for auto-verification
        if ($score >= 60) {
            return [
                'verified' => true,
                'reason' => sprintf('Passed algorithmic verification (score: %d/%d)', $score, $max_score),
                'score' => $score,
            ];
        }

        return [
            'verified' => false,
            'reason' => sprintf('Failed algorithmic verification (score: %d/%d, need 60+)', $score, $max_score),
            'score' => $score,
        ];
    }

    /**
     * Reject a completion with a reason.
     *
     * @param int    $completion_id Completion post ID.
     * @param string $reason       Rejection reason.
     * @param int    $rejected_by  User ID who rejected.
     * @return bool|WP_Error True on success, WP_Error on failure.
     */
    public function reject_completion(int $completion_id, string $reason, int $rejected_by = 0) {
        // Verify completion exists
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== self::COMPLETION_POST_TYPE) {
            return new WP_Error(
                'invalid_completion',
                __('Invalid completion ID', 'world-of-rectification'),
                ['status' => 404]
            );
        }

        $status = get_post_meta($completion_id, 'wor_status', true);
        if ($status === self::STATUS_VERIFIED) {
            return new WP_Error(
                'already_verified',
                __('Cannot reject a verified completion', 'world-of-rectification'),
                ['status' => 400]
            );
        }

        // Update status
        update_post_meta($completion_id, 'wor_status', self::STATUS_REJECTED);
        update_post_meta($completion_id, 'wor_rejection_reason', $reason);
        update_post_meta($completion_id, 'wor_verified_by', $rejected_by);
        update_post_meta($completion_id, 'wor_verified_at', current_time('mysql'));

        /**
         * Fires when a completion is rejected.
         *
         * @param int    $completion_id Completion post ID.
         * @param string $reason       Rejection reason.
         * @param int    $rejected_by  User ID who rejected.
         */
        do_action('wor_completion_rejected', $completion_id, $reason, $rejected_by);

        return true;
    }

    /**
     * Get verification status for a completion.
     *
     * @param int $completion_id Completion post ID.
     * @return array|WP_Error Status array or WP_Error on failure.
     */
    public function get_verification_status(int $completion_id) {
        // Verify completion exists
        $post = get_post($completion_id);
        if (!$post || $post->post_type !== self::COMPLETION_POST_TYPE) {
            return new WP_Error(
                'invalid_completion',
                __('Invalid completion ID', 'world-of-rectification'),
                ['status' => 404]
            );
        }

        $status = get_post_meta($completion_id, 'wor_status', true) ?: self::STATUS_PENDING;
        $verified_by = get_post_meta($completion_id, 'wor_verified_by', true);
        $verified_at = get_post_meta($completion_id, 'wor_verified_at', true);
        $verification_method = get_post_meta($completion_id, 'wor_verification_method', true);
        $rejection_reason = get_post_meta($completion_id, 'wor_rejection_reason', true);

        $verifier = null;
        if ($verified_by) {
            $user = get_user_by('ID', $verified_by);
            $verifier = $user ? [
                'id' => $verified_by,
                'name' => $user->display_name,
            ] : null;
        }

        return [
            'completion_id' => $completion_id,
            'status' => $status,
            'verified_by' => $verifier,
            'verified_at' => $verified_at,
            'verification_method' => $verification_method,
            'rejection_reason' => $rejection_reason,
        ];
    }

    /**
     * Get pending completions for verification.
     *
     * @param int $limit  Maximum number to return.
     * @param int $offset Offset for pagination.
     * @return array Array of pending completions.
     */
    public function get_pending_completions(int $limit = 20, int $offset = 0): array {
        $args = [
            'post_type' => self::COMPLETION_POST_TYPE,
            'post_status' => 'publish',
            'posts_per_page' => $limit,
            'offset' => $offset,
            'meta_query' => [
                [
                    'key' => 'wor_status',
                    'value' => self::STATUS_PENDING,
                ],
            ],
            'orderby' => 'date',
            'order' => 'ASC', // Oldest first
        ];

        $query = new WP_Query($args);
        $completions = [];

        foreach ($query->posts as $post) {
            $completions[] = $this->format_completion($post->ID);
        }

        return [
            'completions' => $completions,
            'total' => (int) $query->found_posts,
            'total_pages' => (int) $query->max_num_pages,
        ];
    }

    /**
     * Format completion data for API response.
     *
     * @param int $completion_id Completion post ID.
     * @return array Formatted completion data.
     */
    private function format_completion(int $completion_id): array {
        $post = get_post($completion_id);
        $quest_id = get_post_meta($completion_id, 'wor_quest_id', true);
        $evidence = get_post_meta($completion_id, 'wor_evidence', true);
        $status = get_post_meta($completion_id, 'wor_status', true) ?: self::STATUS_PENDING;
        $credits = get_post_meta($completion_id, 'wor_credits_earned', true) ?: 0;
        $ctrm_delta = get_post_meta($completion_id, 'wor_ctrm_delta', true) ?: 0.0;

        // Get quest title
        $quest = get_post($quest_id);
        $quest_title = $quest ? $quest->post_title : 'Unknown Quest';

        // Get completer info
        $completer = get_user_by('ID', $post->post_author);

        return [
            'id' => $completion_id,
            'quest_id' => $quest_id,
            'quest_title' => $quest_title,
            'completer' => [
                'id' => (int) $post->post_author,
                'name' => $completer ? $completer->display_name : 'Unknown',
            ],
            'status' => $status,
            'evidence' => $evidence ?: [],
            'credits_earned' => (int) $credits,
            'ctrm_delta' => (float) $ctrm_delta,
            'created_at' => $post->post_date,
            'started_at' => get_post_meta($completion_id, 'wor_started_at', true),
            'completed_at' => get_post_meta($completion_id, 'wor_completed_at', true),
        ];
    }

    /**
     * Award credits and update CTRM upon verification.
     *
     * @param int $completion_id Completion post ID.
     */
    private function award_verification_rewards(int $completion_id): void {
        $post = get_post($completion_id);
        $user_id = (int) $post->post_author;
        $quest_id = (int) get_post_meta($completion_id, 'wor_quest_id', true);
        $evidence = get_post_meta($completion_id, 'wor_evidence', true);
        $existing_credits = get_post_meta($completion_id, 'wor_credits_earned', true);

        // Only award if not already awarded
        if ($existing_credits > 0) {
            return;
        }

        // Get mode and calculate credits
        $mode = $evidence['mode'] ?? 'easy';
        $credits = $this->calculate_verification_credits($completion_id, $quest_id, $mode);

        // Award credits via WOR_Credits
        if ($credits > 0 && class_exists('WOR_Credits')) {
            WOR_Credits()->award_credits($user_id, $credits, 'quest_verified', $quest_id);
            update_post_meta($completion_id, 'wor_credits_earned', $credits);
        }

        // Record CTRM score
        if (class_exists('WOR_CTRM')) {
            $ctrm_delta = WOR_CTRM()->record_decision($user_id, $quest_id, [
                'mode' => $mode,
                'choices' => $evidence['choices'] ?? [],
                'reasoning' => $evidence['reasoning'] ?? '',
                'time_taken' => $evidence['time_taken'] ?? 0,
                'verified' => true,
            ]);
            update_post_meta($completion_id, 'wor_ctrm_delta', $ctrm_delta);
        }
    }

    /**
     * Calculate credits to award for a verified completion.
     *
     * @param int    $completion_id Completion post ID.
     * @param int    $quest_id      Quest ID.
     * @param string $mode          Completion mode.
     * @return int Credits to award.
     */
    private function calculate_verification_credits(int $completion_id, int $quest_id, string $mode): int {
        // Get base credits from quest
        $base_credits = (int) get_post_meta($quest_id, 'wor_credits_reward', true);
        if ($base_credits <= 0) {
            $base_credits = 10; // Default
        }

        // Mode multiplier
        $mode_multiplier = $mode === 'hard' ? 2.5 : 1.0;

        // Sefirah bonus
        $sefirah_bonus = 1.0;
        $post = get_post($completion_id);
        if ($post && class_exists('WOR_Sefirah')) {
            $sefirah_bonus = WOR_Sefirah()->calculate_quest_bonus($post->post_author, $quest_id);
        }

        return (int) ceil($base_credits * $mode_multiplier * $sefirah_bonus);
    }

    /**
     * Get completion statistics for a user.
     *
     * @param int $user_id User ID.
     * @return array Completion statistics.
     */
    public function get_user_completion_stats(int $user_id): array {
        $args = [
            'post_type' => self::COMPLETION_POST_TYPE,
            'author' => $user_id,
            'posts_per_page' => -1,
        ];

        $query = new WP_Query($args);

        $stats = [
            'total' => 0,
            'pending' => 0,
            'verified' => 0,
            'rejected' => 0,
            'total_credits' => 0,
            'total_ctrm' => 0.0,
        ];

        foreach ($query->posts as $post) {
            $stats['total']++;
            $status = get_post_meta($post->ID, 'wor_status', true) ?: self::STATUS_PENDING;

            switch ($status) {
                case self::STATUS_PENDING:
                    $stats['pending']++;
                    break;
                case self::STATUS_VERIFIED:
                    $stats['verified']++;
                    $stats['total_credits'] += (int) get_post_meta($post->ID, 'wor_credits_earned', true);
                    $stats['total_ctrm'] += (float) get_post_meta($post->ID, 'wor_ctrm_delta', true);
                    break;
                case self::STATUS_REJECTED:
                    $stats['rejected']++;
                    break;
            }
        }

        $stats['total_ctrm'] = round($stats['total_ctrm'], 2);

        return $stats;
    }
}

/**
 * Helper function to get Truth Engine instance.
 *
 * @return WOR_Truth_Engine
 */
function WOR_Truth_Engine(): WOR_Truth_Engine {
    return WOR_Truth_Engine::get_instance();
}
