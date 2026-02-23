<?php
/**
 * CTRM (Cognitive Transparent Reasoning Model) Scorer
 *
 * Implements scoring system for World of Rectification.
 * CTRM measures the quality of reasoning in quest decisions.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) exit;

class WOR_CTRM {
    const META_SCORE = 'wor_ctrm_score';
    const META_TRACE = 'wor_ctrm_traces';
    const META_TMS_LEVEL = 'wor_tms_level';

    /**
     * TMS level thresholds.
     *
     * @var array
     */
    private const TMS_THRESHOLDS = [
        0 => 0,      // Level 0: Visitor
        1 => 100,    // Level 1: Player
        2 => 250,    // Level 2: Contributor
        3 => 500,    // Level 3: TMS Member
        4 => 1000,   // Level 4: GEMS Manager
        5 => 2500,   // Level 5: Oracle
    ];

    /**
     * TMS level names.
     *
     * @var array
     */
    private const TMS_LEVEL_NAMES = [
        0 => 'Visitor',
        1 => 'Player',
        2 => 'Contributor',
        3 => 'TMS Member',
        4 => 'GEMS Manager',
        5 => 'Oracle',
    ];

    /**
     * Mode multipliers for scoring.
     *
     * @var array
     */
    private const MODE_MULTIPLIERS = [
        'easy' => 1.0,
        'hard' => 2.5,
    ];

    /**
     * Singleton instance.
     *
     * @var WOR_CTRM|null
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
        // Hook for level-up notifications
        add_action('wor_tms_level_up', [$this, 'on_level_up'], 10, 3);
    }

    /**
     * Record a decision and calculate score delta.
     *
     * @param int   $user_id       User ID making the decision.
     * @param int   $quest_id      Quest ID the decision is for.
     * @param array $decision_data Decision data including mode, reasoning, etc.
     * @return float Score delta earned from this decision.
     */
    public function record_decision(int $user_id, int $quest_id, array $decision_data): float {
        // Validate user
        if (!get_user_by('ID', $user_id)) {
            return 0.0;
        }

        // Extract decision data
        $mode = $decision_data['mode'] ?? 'easy';
        $reasoning = $decision_data['reasoning'] ?? '';
        $choices = $decision_data['choices'] ?? [];
        $time_taken = $decision_data['time_taken'] ?? 0;

        // Build reasoning trace
        $trace = [
            'quest_id' => $quest_id,
            'mode' => $mode,
            'choices' => $choices,
            'reasoning' => $reasoning,
            'time_taken' => $time_taken,
            'timestamp' => current_time('mysql'),
            'timestamp_unix' => time(),
        ];

        // Calculate score delta
        $delta = $this->calculate_score_delta($trace);

        // Update total score
        $current_score = $this->get_score($user_id);
        $new_score = $current_score + $delta;
        update_user_meta($user_id, self::META_SCORE, $new_score);

        // Store trace for future analysis/training
        $this->store_trace($user_id, $trace);

        // Update TMS level if threshold crossed
        $this->update_tms_level($user_id, $new_score);

        /**
         * Fires after a CTRM decision is recorded.
         *
         * @param int   $user_id  User ID.
         * @param int   $quest_id Quest ID.
         * @param float $delta    Score delta.
         * @param array $trace    Decision trace.
         */
        do_action('wor_ctrm_decision_recorded', $user_id, $quest_id, $delta, $trace);

        return $delta;
    }

    /**
     * Get current CTRM score for a user.
     *
     * @param int $user_id User ID.
     * @return float Current score (0.0 if not set).
     */
    public function get_score(int $user_id): float {
        $score = get_user_meta($user_id, self::META_SCORE, true);
        return $score !== '' && $score !== false ? (float) $score : 0.0;
    }

    /**
     * Get current TMS level for a user.
     *
     * @param int $user_id User ID.
     * @return int Current level (0-5).
     */
    public function get_tms_level(int $user_id): int {
        $level = get_user_meta($user_id, self::META_TMS_LEVEL, true);
        return $level !== '' && $level !== false ? (int) $level : 0;
    }

    /**
     * Get TMS level name.
     *
     * @param int $level Level number (0-5).
     * @return string Level name.
     */
    public function get_tms_level_name(int $level): string {
        return self::TMS_LEVEL_NAMES[$level] ?? 'Unknown';
    }

    /**
     * Get next level threshold.
     *
     * @param int $user_id User ID.
     * @return array{current_level: int, next_level: int|null, points_needed: int}
     */
    public function get_next_level_threshold(int $user_id): array {
        $current_level = $this->get_tms_level($user_id);
        $current_score = $this->get_score($user_id);

        $next_level = $current_level + 1;
        if ($next_level > 5) {
            return [
                'current_level' => $current_level,
                'next_level' => null,
                'points_needed' => 0,
            ];
        }

        $next_threshold = self::TMS_THRESHOLDS[$next_level];
        $points_needed = $next_threshold - $current_score;

        return [
            'current_level' => $current_level,
            'next_level' => $next_level,
            'points_needed' => max(0, $points_needed),
        ];
    }

    /**
     * Update TMS level based on score thresholds.
     *
     * @param int   $user_id User ID.
     * @param float $score   Current score.
     * @return int New level (or current if no change).
     */
    public function update_tms_level(int $user_id, float $score): int {
        $new_level = 0;

        // Find highest level achieved
        foreach (self::TMS_THRESHOLDS as $level => $threshold) {
            if ($score >= $threshold) {
                $new_level = $level;
            }
        }

        $current_level = $this->get_tms_level($user_id);

        if ($new_level > $current_level) {
            update_user_meta($user_id, self::META_TMS_LEVEL, $new_level);

            /**
             * Fires when a user levels up.
             *
             * @param int $user_id      User ID.
             * @param int $new_level    New TMS level.
             * @param int $current_level Previous TMS level.
             */
            do_action('wor_tms_level_up', $user_id, $new_level, $current_level);

            return $new_level;
        }

        return $current_level;
    }

    /**
     * Calculate score delta based on decision trace.
     *
     * @param array $trace Decision trace.
     * @return float Score delta.
     */
    private function calculate_score_delta(array $trace): float {
        // Base points for making a decision
        $base_points = 10.0;

        // Mode multiplier (hard mode = 2.5x)
        $mode = $trace['mode'] ?? 'easy';
        $mode_multiplier = self::MODE_MULTIPLIERS[$mode] ?? 1.0;

        // Reasoning quality bonus
        $reasoning_bonus = $this->calculate_reasoning_bonus($trace['reasoning'] ?? '');

        // Time taken factor (longer thoughtful decisions = more points)
        $time_bonus = $this->calculate_time_bonus($trace['time_taken'] ?? 0);

        // Calculate total delta
        $delta = ($base_points + $reasoning_bonus + $time_bonus) * $mode_multiplier;

        // Round to 2 decimal places
        return round($delta, 2);
    }

    /**
     * Calculate reasoning quality bonus.
     *
     * @param string $reasoning The reasoning text.
     * @return float Bonus points.
     */
    private function calculate_reasoning_bonus(string $reasoning): float {
        if (empty($reasoning)) {
            return 0.0;
        }

        $bonus = 0.0;

        // Word count bonus (more words = more points, up to cap)
        $word_count = str_word_count($reasoning);
        $word_bonus = min(5.0, $word_count / 10); // Max 5 points for 50+ words
        $bonus += $word_bonus;

        // Structure bonus (paragraphs, sentences)
        $paragraph_count = substr_count($reasoning, "\n\n") + 1;
        $sentence_count = preg_match_all('/[.!?]+/', $reasoning) ?: 1;

        if ($paragraph_count > 1) {
            $bonus += 1.0; // Bonus for multiple paragraphs
        }
        if ($sentence_count >= 3) {
            $bonus += 0.5; // Bonus for structured sentences
        }

        // Ethical reasoning keywords bonus
        $ethical_keywords = [
            'because', 'therefore', 'consider', 'impact', 'community',
            'safety', 'long-term', 'sustainable', 'ethical', 'responsible',
            'consequence', 'benefit', 'harm', 'justice', 'fair',
        ];

        $reasoning_lower = strtolower($reasoning);
        $keyword_matches = 0;
        foreach ($ethical_keywords as $keyword) {
            if (strpos($reasoning_lower, $keyword) !== false) {
                $keyword_matches++;
            }
        }
        $bonus += min(2.0, $keyword_matches * 0.3); // Max 2 points for keywords

        return round($bonus, 2);
    }

    /**
     * Calculate time bonus.
     *
     * Longer thoughtful decisions earn more points.
     *
     * @param int $time_taken Time in seconds.
     * @return float Bonus points.
     */
    private function calculate_time_bonus(int $time_taken): float {
        if ($time_taken <= 0) {
            return 0.0;
        }

        // Bonus starts at 30 seconds
        if ($time_taken < 30) {
            return 0.0;
        }

        // Scale bonus: 30s = 0.5, 60s = 1.0, 120s = 2.0, max 3.0
        $bonus = min(3.0, ($time_taken - 30) / 30);

        return round($bonus, 2);
    }

    /**
     * Store decision trace for user.
     *
     * @param int   $user_id User ID.
     * @param array $trace   Decision trace.
     */
    private function store_trace(int $user_id, array $trace): void {
        $traces = get_user_meta($user_id, self::META_TRACE, true);

        if (!is_array($traces)) {
            $traces = [];
        }

        $traces[] = $trace;

        // Keep only last 100 traces to prevent unbounded growth
        if (count($traces) > 100) {
            $traces = array_slice($traces, -100);
        }

        update_user_meta($user_id, self::META_TRACE, $traces);
    }

    /**
     * Get decision traces for a user.
     *
     * @param int    $user_id User ID.
     * @param string $mode    Optional mode filter ('easy', 'hard', or 'all').
     * @param int    $limit   Maximum number of traces to return.
     * @return array Array of traces.
     */
    public function get_traces(int $user_id, string $mode = 'all', int $limit = 50): array {
        $traces = get_user_meta($user_id, self::META_TRACE, true);

        if (!is_array($traces)) {
            return [];
        }

        // Filter by mode if specified
        if ($mode !== 'all') {
            $traces = array_filter($traces, function ($trace) use ($mode) {
                return ($trace['mode'] ?? '') === $mode;
            });
        }

        // Return most recent first, limited
        $traces = array_reverse($traces);
        return array_slice($traces, 0, $limit);
    }

    /**
     * Get traces suitable for LLM training.
     *
     * @param int $user_id User ID.
     * @return array Training data formatted for LLM fine-tuning.
     */
    public function get_traces_for_training(int $user_id): array {
        $hard_traces = $this->get_traces($user_id, 'hard', 100);
        $training_data = [];

        foreach ($hard_traces as $trace) {
            if (empty($trace['reasoning'])) {
                continue;
            }

            $training_data[] = [
                'input' => [
                    'quest_id' => $trace['quest_id'],
                    'choices' => $trace['choices'] ?? [],
                    'mode' => 'hard',
                ],
                'output' => $trace['reasoning'],
                'metadata' => [
                    'user_level' => $this->get_tms_level($user_id),
                    'time_taken' => $trace['time_taken'] ?? 0,
                    'timestamp' => $trace['timestamp'] ?? '',
                ],
            ];
        }

        return $training_data;
    }

    /**
     * Export all hard mode traces for LLM training.
     *
     * @return array All users' training data.
     */
    public function export_training_data(): array {
        $users = get_users(['fields' => ['ID']]);
        $training_data = [];

        foreach ($users as $user) {
            $user_training = $this->get_traces_for_training($user->ID);
            $training_data = array_merge($training_data, $user_training);
        }

        return $training_data;
    }

    /**
     * Handle level-up event.
     *
     * @param int $user_id      User ID.
     * @param int $new_level    New TMS level.
     * @param int $current_level Previous TMS level.
     */
    public function on_level_up(int $user_id, int $new_level, int $current_level): void {
        // Award bonus credits on level up
        $level_bonus_credits = [
            1 => 5,
            2 => 10,
            3 => 25,
            4 => 50,
            5 => 100,
        ];

        $bonus = $level_bonus_credits[$new_level] ?? 0;

        if ($bonus > 0 && class_exists('WOR_Credits')) {
            WOR_Credits()->award_credits(
                $user_id,
                $bonus,
                sprintf('TMS Level Up: %s', $this->get_tms_level_name($new_level))
            );
        }
    }

    /**
     * Get leaderboard for CTRM scores.
     *
     * @param int $limit Maximum number of users to return.
     * @return array Leaderboard entries.
     */
    public function get_leaderboard(int $limit = 10): array {
        global $wpdb;

        $results = $wpdb->get_results($wpdb->prepare("
            SELECT user_id, meta_value as score
            FROM {$wpdb->usermeta}
            WHERE meta_key = %s
            AND meta_value > 0
            ORDER BY CAST(meta_value AS DECIMAL(10,2)) DESC
            LIMIT %d
        ", self::META_SCORE, $limit));

        $leaderboard = [];
        foreach ($results as $row) {
            $user = get_user_by('ID', $row->user_id);
            if ($user) {
                $leaderboard[] = [
                    'user_id' => (int) $row->user_id,
                    'display_name' => $user->display_name,
                    'score' => (float) $row->score,
                    'level' => $this->get_tms_level((int) $row->user_id),
                    'level_name' => $this->get_tms_level_name($this->get_tms_level((int) $row->user_id)),
                ];
            }
        }

        return $leaderboard;
    }

    /**
     * Get all TMS thresholds.
     *
     * @return array Level => threshold pairs.
     */
    public static function get_thresholds(): array {
        return self::TMS_THRESHOLDS;
    }

    /**
     * Get all level names.
     *
     * @return array Level => name pairs.
     */
    public static function get_level_names(): array {
        return self::TMS_LEVEL_NAMES;
    }
}

/**
 * Helper function to get CTRM instance.
 *
 * @return WOR_CTRM
 */
function WOR_CTRM(): WOR_CTRM {
    return WOR_CTRM::get_instance();
}
