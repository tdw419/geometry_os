<?php
/**
 * World of Rectification Frontend
 *
 * Provides shortcode and template rendering for the game interface.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_Frontend {

    /**
     * Initialize frontend functionality.
     */
    public function init(): void {
        add_shortcode('world_of_rectification', [$this, 'render_game']);
        add_shortcode('wor_game', [$this, 'render_game']);
        add_shortcode('wor_dashboard', [$this, 'render_dashboard']);
        add_shortcode('wor_quest', [$this, 'render_single_quest']);

        // Add dashboard styles
        add_action('wp_enqueue_scripts', [$this, 'enqueue_dashboard_styles']);
    }

    /**
     * Enqueue dashboard-specific styles.
     */
    public function enqueue_dashboard_styles(): void {
        wp_add_inline_style('wor-frontend', $this->get_dashboard_css());
    }

    /**
     * Get dashboard CSS.
     */
    private function get_dashboard_css(): string {
        return '
            .wor-dashboard {
                max-width: 900px;
                margin: 0 auto;
            }
            .wor-dashboard-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 24px;
            }
            .wor-dashboard-header h2 {
                margin: 0;
            }
            .wor-dashboard-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 16px;
                margin-bottom: 24px;
            }
            .wor-card {
                background: #fff;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                text-align: center;
            }
            .wor-card h3 {
                margin: 0 0 12px 0;
                font-size: 14px;
                color: #64748b;
                text-transform: uppercase;
            }
            .wor-big-number {
                font-size: 48px;
                font-weight: 700;
                color: #667eea;
            }
            .wor-card p {
                margin: 8px 0 0 0;
                font-size: 13px;
                color: #94a3b8;
            }
            .wor-card-ctrm .wor-big-number { color: #10b981; }
            .wor-card-completions .wor-big-number { color: #667eea; }
            .wor-card-rank .wor-big-number { color: #f59e0b; }
            .wor-card-sparks .wor-big-number { color: #ec4899; }
            .wor-recent-activity {
                background: #fff;
                padding: 20px;
                border-radius: 12px;
                margin-bottom: 24px;
            }
            .wor-recent-activity h3 {
                margin: 0 0 16px 0;
            }
            .wor-activity-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .wor-activity-list li {
                display: flex;
                gap: 12px;
                padding: 12px 0;
                border-bottom: 1px solid #e2e8f0;
            }
            .wor-activity-list li:last-child {
                border-bottom: none;
            }
            .wor-activity-mode {
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 11px;
                font-weight: 600;
                text-transform: uppercase;
            }
            .wor-mode-easy { background: #dcfce7; color: #166534; }
            .wor-mode-hard { background: #ffedd5; color: #9a3412; }
            .wor-activity-quest {
                flex: 1;
                font-weight: 500;
            }
            .wor-activity-date {
                color: #94a3b8;
                font-size: 13px;
            }
            .wor-level-progress {
                background: #fff;
                padding: 20px;
                border-radius: 12px;
                text-align: center;
            }
            .wor-level-progress h3 {
                margin: 0 0 16px 0;
            }
            .wor-progress-bar {
                height: 12px;
                background: #e2e8f0;
                border-radius: 6px;
                overflow: hidden;
                margin-bottom: 8px;
            }
            .wor-progress-fill {
                height: 100%;
                background: linear-gradient(90deg, #667eea, #764ba2);
                border-radius: 6px;
            }
            .wor-level-progress p {
                margin: 0;
                color: #64748b;
            }
            .wor-login-required {
                text-align: center;
                padding: 40px;
                background: #f8fafc;
                border-radius: 12px;
            }
        ';
    }

    /**
     * Render the main game interface.
     *
     * @param array $atts Shortcode attributes.
     * @return string HTML output.
     */
    public function render_game($atts = []): string {
        $atts = shortcode_atts([
            'limit' => 10,
            'show_stats' => 'true',
        ], $atts);

        // Get current user
        $user_id = get_current_user_id();
        $is_logged_in = is_user_logged_in();

        // Get player stats if logged in
        $player_stats = null;
        if ($is_logged_in && class_exists('WOR_CTRM')) {
            $player_stats = [
                'ctrm_score' => WOR_CTRM()->get_score($user_id),
                'tms_level' => WOR_CTRM()->get_tms_level($user_id),
                'level_name' => WOR_CTRM()->get_tms_level_name(WOR_CTRM()->get_tms_level($user_id)),
                'next_level' => WOR_CTRM()->get_next_level_threshold($user_id),
            ];
        }

        // Get quests
        $quests = $this->get_quests((int) $atts['limit']);

        // Calculate world health (based on verified completions)
        $world_health = $this->calculate_world_health();

        ob_start();
        ?>
        <div id="wor-game-container" class="wor-container">
            <?php if ($atts['show_stats'] === 'true'): ?>
            <!-- Player Stats Panel -->
            <div class="wor-player-panel">
                <h3>Your Journey</h3>
                <?php if ($is_logged_in && $player_stats): ?>
                    <div class="wor-stats-grid">
                        <div class="wor-stat">
                            <span class="wor-stat-label">CTRM Score</span>
                            <span class="wor-stat-value ctrm"><?php echo esc_html(number_format($player_stats['ctrm_score'], 1)); ?></span>
                        </div>
                        <div class="wor-stat">
                            <span class="wor-stat-label">TMS Level</span>
                            <span class="wor-stat-value level"><?php echo esc_html($player_stats['tms_level']); ?></span>
                        </div>
                        <div class="wor-stat">
                            <span class="wor-stat-label">Rank</span>
                            <span class="wor-stat-value"><?php echo esc_html($player_stats['level_name']); ?></span>
                        </div>
                        <div class="wor-stat">
                            <span class="wor-stat-label">Next Level</span>
                            <span class="wor-stat-value" style="font-size: 16px;">
                                <?php
                                if ($player_stats['next_level']['next_level']) {
                                    echo esc_html($player_stats['next_level']['points_needed'] . ' pts needed');
                                } else {
                                    echo 'Max Level!';
                                }
                                ?>
                            </span>
                        </div>
                    </div>
                <?php else: ?>
                    <p class="wor-login-prompt">
                        <a href="<?php echo esc_url(wp_login_url(get_permalink())); ?>">Log in</a> to track your progress and earn CTRM points.
                    </p>
                <?php endif; ?>
            </div>
            <?php endif; ?>

            <!-- Scenario Panel -->
            <div class="wor-scenario-panel">
                <div id="wor-scenarios">
                    <?php if (empty($quests)): ?>
                        <div class="wor-no-quests">
                            <h3>No Quests Available</h3>
                            <p>Check back soon for new quests to help repair the world!</p>
                        </div>
                    <?php else: ?>
                        <?php foreach ($quests as $index => $quest): ?>
                            <div class="wor-scenario" data-id="<?php echo esc_attr($quest['id']); ?>" data-easy-choices="<?php echo esc_attr($quest['easy_choices']); ?>" <?php echo $index > 0 ? 'style="display:none;"' : ''; ?>>
                                <div class="wor-scenario-header">
                                    <?php if (!empty($quest['sefirah'])): ?>
                                        <span class="wor-sefirah-badge wor-sefirah-<?php echo esc_attr($quest['sefirah']); ?>">
                                            <?php echo esc_html(ucfirst($quest['sefirah'])); ?>
                                        </span>
                                    <?php endif; ?>
                                    <h2 class="wor-scenario-title"><?php echo esc_html($quest['title']); ?></h2>
                                    <div class="wor-quest-meta">
                                        <span class="wor-credits">💰 <?php echo esc_html($quest['credits_reward']); ?> credits</span>
                                        <span class="wor-time">⏱️ ~<?php echo esc_html($quest['estimated_time']); ?> min</span>
                                        <span class="wor-difficulty wor-difficulty-<?php echo esc_attr($quest['difficulty']); ?>">
                                            <?php echo esc_html(ucfirst($quest['difficulty'])); ?>
                                        </span>
                                    </div>
                                </div>
                                <div class="wor-scenario-description">
                                    <?php echo wp_kses_post(wpautop($quest['description'])); ?>
                                </div>

                                <!-- Mode Selection -->
                                <div class="wor-mode-selection">
                                    <p>Choose your path:</p>
                                    <button class="wor-mode-btn wor-mode-easy" data-mode="easy">
                                        <span class="wor-mode-icon">🌱</span>
                                        <span class="wor-mode-label">Easy Mode</span>
                                        <span class="wor-mode-desc">Obvious choice, earn base CTRM</span>
                                    </button>
                                    <button class="wor-mode-btn wor-mode-hard" data-mode="hard">
                                        <span class="wor-mode-icon">🔥</span>
                                        <span class="wor-mode-label">Hard Mode</span>
                                        <span class="wor-mode-desc">Contribute to Geometry OS, earn 2.5x CTRM</span>
                                    </button>
                                </div>

                                <!-- Decision Form (loaded via JS) -->
                                <div class="wor-decision-form" style="display:none;"></div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>

                <?php if (!empty($quests) && count($quests) > 1): ?>
                <!-- Navigation -->
                <div class="wor-navigation">
                    <button id="wor-prev-scenario" class="wor-nav-btn" disabled>← Previous</button>
                    <span id="wor-scenario-counter">1 / <?php echo count($quests); ?></span>
                    <button id="wor-next-scenario" class="wor-nav-btn">Next →</button>
                </div>
                <?php endif; ?>
            </div>

            <!-- World Health Meter -->
            <div class="wor-world-meter">
                <h4>🌍 World Health</h4>
                <div class="wor-meter-bar">
                    <div class="wor-meter-fill" style="width: <?php echo esc_attr($world_health); ?>%;"></div>
                </div>
                <span class="wor-meter-label"><?php echo esc_html($world_health); ?>% Restored</span>
            </div>
        </div>

        <?php if ($is_logged_in): ?>
        <script>
        var worData = {
            restUrl: '<?php echo esc_url(rest_url('wor/v1')); ?>',
            nonce: '<?php echo esc_js(wp_create_nonce('wp_rest')); ?>',
            isLoggedIn: true,
            userId: <?php echo (int) $user_id; ?>
        };
        </script>
        <?php endif; ?>
        <?php
        return ob_get_clean();
    }

    /**
     * Render player dashboard.
     *
     * @param array $atts Shortcode attributes.
     * @return string HTML output.
     */
    public function render_dashboard($atts = []): string {
        if (!is_user_logged_in()) {
            return '<div class="wor-login-required"><p>Please <a href="' . esc_url(wp_login_url(get_permalink())) . '">log in</a> to view your dashboard.</p></div>';
        }

        $user_id = get_current_user_id();

        // Get player stats
        $ctrm_score = 0;
        $tms_level = 0;
        $level_name = 'Visitor';
        $traces = [];

        if (class_exists('WOR_CTRM')) {
            $ctrm_score = WOR_CTRM()->get_score($user_id);
            $tms_level = WOR_CTRM()->get_tms_level($user_id);
            $level_name = WOR_CTRM()->get_tms_level_name($tms_level);
            $traces = WOR_CTRM()->get_traces($user_id, 'all', 10);
        }

        // Get completion stats
        $completion_stats = ['total' => 0, 'verified' => 0, 'pending' => 0];
        if (class_exists('WOR_Truth_Engine')) {
            $completion_stats = WOR_Truth_Engine()->get_user_completion_stats($user_id);
        }

        // Get leaderboard position
        $leaderboard_position = $this->get_leaderboard_position($user_id);

        ob_start();
        ?>
        <div class="wor-dashboard">
            <div class="wor-dashboard-header">
                <h2>🏆 Your Dashboard</h2>
                <div class="wor-tms-badge level-<?php echo esc_attr($tms_level); ?>">
                    <?php echo esc_html($level_name); ?> (Level <?php echo esc_attr($tms_level); ?>)
                </div>
            </div>

            <div class="wor-dashboard-grid">
                <div class="wor-card wor-card-ctrm">
                    <h3>CTRM Score</h3>
                    <div class="wor-big-number"><?php echo esc_html(number_format($ctrm_score, 1)); ?></div>
                    <p>Cognitive Transparent Reasoning Model</p>
                </div>

                <div class="wor-card wor-card-completions">
                    <h3>Quests Completed</h3>
                    <div class="wor-big-number"><?php echo esc_html($completion_stats['verified']); ?></div>
                    <p><?php echo esc_html($completion_stats['pending']); ?> pending verification</p>
                </div>

                <div class="wor-card wor-card-rank">
                    <h3>Leaderboard</h3>
                    <div class="wor-big-number">#<?php echo esc_html($leaderboard_position); ?></div>
                    <p>Global ranking</p>
                </div>

                <div class="wor-card wor-card-sparks">
                    <h3>Sparks Released</h3>
                    <div class="wor-big-number">✨ <?php echo esc_html($completion_stats['verified']); ?></div>
                    <p>Verified contributions</p>
                </div>
            </div>

            <?php if (!empty($traces)): ?>
            <div class="wor-recent-activity">
                <h3>Recent Activity</h3>
                <ul class="wor-activity-list">
                    <?php foreach ($traces as $trace): ?>
                        <?php
                        $quest = get_post($trace['quest_id'] ?? 0);
                        $quest_title = $quest ? $quest->post_title : 'Unknown Quest';
                        ?>
                        <li>
                            <span class="wor-activity-mode wor-mode-<?php echo esc_attr($trace['mode'] ?? 'easy'); ?>">
                                <?php echo esc_html(ucfirst($trace['mode'] ?? 'easy')); ?>
                            </span>
                            <span class="wor-activity-quest"><?php echo esc_html($quest_title); ?></span>
                            <span class="wor-activity-date"><?php echo esc_html(human_time_diff(strtotime($trace['timestamp'] ?? 'now'), current_time('timestamp'))); ?> ago</span>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <?php endif; ?>

            <div class="wor-level-progress">
                <?php
                $thresholds = WOR_CTRM::get_thresholds();
                $next_threshold = null;
                foreach ($thresholds as $level => $threshold) {
                    if ($threshold > $ctrm_score) {
                        $next_threshold = $threshold;
                        break;
                    }
                }
                if ($next_threshold):
                    $prev_threshold = $thresholds[$tms_level] ?? 0;
                    $progress = (($ctrm_score - $prev_threshold) / ($next_threshold - $prev_threshold)) * 100;
                ?>
                <h3>Progress to Level <?php echo esc_html($tms_level + 1); ?></h3>
                <div class="wor-progress-bar">
                    <div class="wor-progress-fill" style="width: <?php echo esc_attr(min(100, $progress)); ?>%;"></div>
                </div>
                <p><?php echo esc_html(number_format($ctrm_score, 0)); ?> / <?php echo esc_html(number_format($next_threshold, 0)); ?> CTRM</p>
                <?php else: ?>
                <h3>Maximum Level Achieved!</h3>
                <p>🏆 You've reached the highest TMS level. Ready for GEMS?</p>
                <?php endif; ?>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Render a single quest.
     *
     * @param array $atts Shortcode attributes.
     * @return string HTML output.
     */
    public function render_single_quest($atts = []): string {
        $atts = shortcode_atts([
            'id' => 0,
        ], $atts);

        $quest_id = (int) $atts['id'];
        if (!$quest_id) {
            return '<p class="wor-error">Quest ID required.</p>';
        }

        $quest = get_post($quest_id);
        if (!$quest || $quest->post_type !== 'wor_quest') {
            return '<p class="wor-error">Quest not found.</p>';
        }

        // Use the same rendering as the main game but for a single quest
        $sefirah = get_post_meta($quest_id, 'wor_sefirah', true);
        $credits = get_post_meta($quest_id, 'wor_credits_reward', true);
        $time = get_post_meta($quest_id, 'wor_estimated_time', true);
        $difficulty = get_post_meta($quest_id, 'wor_difficulty', true);
        $easy_choices = get_post_meta($quest_id, 'wor_easy_choices', true);

        ob_start();
        ?>
        <div id="wor-game-container" class="wor-container wor-single-quest">
            <div class="wor-scenario-panel">
                <div class="wor-scenario" data-id="<?php echo esc_attr($quest_id); ?>" data-easy-choices="<?php echo esc_attr($easy_choices); ?>">
                    <div class="wor-scenario-header">
                        <?php if ($sefirah): ?>
                            <span class="wor-sefirah-badge wor-sefirah-<?php echo esc_attr($sefirah); ?>">
                                <?php echo esc_html(ucfirst($sefirah)); ?>
                            </span>
                        <?php endif; ?>
                        <h2 class="wor-scenario-title"><?php echo esc_html($quest->post_title); ?></h2>
                        <div class="wor-quest-meta">
                            <span class="wor-credits">💰 <?php echo esc_html($credits ?: 10); ?> credits</span>
                            <span class="wor-time">⏱️ ~<?php echo esc_html($time ?: 10); ?> min</span>
                            <span class="wor-difficulty wor-difficulty-<?php echo esc_attr($difficulty ?: 'medium'); ?>">
                                <?php echo esc_html(ucfirst($difficulty ?: 'Medium')); ?>
                            </span>
                        </div>
                    </div>
                    <div class="wor-scenario-description">
                        <?php echo wp_kses_post(wpautop($quest->post_content)); ?>
                    </div>

                    <div class="wor-mode-selection">
                        <p>Choose your path:</p>
                        <button class="wor-mode-btn wor-mode-easy" data-mode="easy">
                            <span class="wor-mode-icon">🌱</span>
                            <span class="wor-mode-label">Easy Mode</span>
                            <span class="wor-mode-desc">Obvious choice, earn base CTRM</span>
                        </button>
                        <button class="wor-mode-btn wor-mode-hard" data-mode="hard">
                            <span class="wor-mode-icon">🔥</span>
                            <span class="wor-mode-label">Hard Mode</span>
                            <span class="wor-mode-desc">Contribute to Geometry OS, earn 2.5x CTRM</span>
                        </button>
                    </div>

                    <div class="wor-decision-form" style="display:none;"></div>
                </div>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Get quests for display.
     *
     * @param int $limit Maximum number to return.
     * @return array Array of quest data.
     */
    private function get_quests(int $limit = 10): array {
        if (!post_type_exists('wor_quest')) {
            return [];
        }

        $args = [
            'post_type' => 'wor_quest',
            'post_status' => 'publish',
            'posts_per_page' => $limit,
            'orderby' => 'rand',
        ];

        $query = new WP_Query($args);
        $quests = [];

        foreach ($query->posts as $post) {
            $quests[] = [
                'id' => $post->ID,
                'title' => $post->post_title,
                'description' => $post->post_content,
                'sefirah' => get_post_meta($post->ID, 'wor_sefirah', true),
                'credits_reward' => get_post_meta($post->ID, 'wor_credits_reward', true) ?: 10,
                'estimated_time' => get_post_meta($post->ID, 'wor_estimated_time', true) ?: 10,
                'difficulty' => get_post_meta($post->ID, 'wor_difficulty', true) ?: 'medium',
                'easy_choices' => get_post_meta($post->ID, 'wor_easy_choices', true),
            ];
        }

        return $quests;
    }

    /**
     * Calculate world health percentage.
     *
     * @return int Percentage (0-100).
     */
    private function calculate_world_health(): int {
        global $wpdb;

        // Count total quests and verified completions
        $total_quests = wp_count_posts('wor_quest')->publish ?? 0;
        $verified_completions = 0;

        if ($total_quests === 0) {
            return 0;
        }

        // Count verified completions
        $completions = get_posts([
            'post_type' => 'wor_completion',
            'post_status' => 'publish',
            'posts_per_page' => -1,
            'fields' => 'ids',
        ]);

        foreach ($completions as $id) {
            if (get_post_meta($id, 'wor_status', true) === 'verified') {
                $verified_completions++;
            }
        }

        // Simple formula: 42 base + (verified / total_quests) * 58
        // This gives a range of 42-100% based on community progress
        $base = 42;
        $progress = $total_quests > 0 ? ($verified_completions / max($total_quests * 10, 1)) * 58 : 0;

        return min(100, (int) ($base + $progress));
    }

    /**
     * Get user's leaderboard position.
     *
     * @param int $user_id User ID.
     * @return int Position (1-indexed).
     */
    private function get_leaderboard_position(int $user_id): int {
        if (!class_exists('WOR_CTRM')) {
            return 0;
        }

        global $wpdb;

        $score = WOR_CTRM()->get_score($user_id);

        // Count users with higher scores
        $higher = $wpdb->get_var($wpdb->prepare(
            "SELECT COUNT(*) FROM {$wpdb->usermeta} WHERE meta_key = %s AND CAST(meta_value AS DECIMAL(10,2)) > %f",
            WOR_CTRM::META_SCORE,
            $score
        ));

        return (int) $higher + 1;
    }
}
