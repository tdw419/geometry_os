<?php
/**
 * World of Rectification - Scribe Shortcodes
 *
 * Provides shortcodes for Scribe dashboard and Sprout help button.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Scribe_Shortcodes {

    /**
     * Singleton instance.
     *
     * @var WOR_Scribe_Shortcodes|null
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
        add_action('init', [$this, 'register_shortcodes']);
    }

    /**
     * Register shortcodes.
     */
    public function register_shortcodes(): void {
        add_shortcode('wor_scribe_dashboard', [$this, 'render_dashboard']);
        add_shortcode('wor_help_button', [$this, 'render_help_button']);
    }

    /**
     * Render Scribe Dashboard shortcode.
     *
     * @param array $atts Shortcode attributes.
     * @return string HTML output.
     */
    public function render_dashboard(array $atts = []): string {
        // Check if user is logged in
        if (!is_user_logged_in()) {
            return $this->render_login_prompt();
        }

        $user_id = get_current_user_id();

        // Load Scribe Portal
        require_once WOR_PATH . 'includes/class-scribe-portal.php';
        $portal = new WOR_Scribe_Portal();
        $scribe = $portal->get_scribe_by_user($user_id);

        // Not registered as Scribe - show registration form
        if (!$scribe) {
            return $this->render_registration_form();
        }

        // Onboarding not complete - show progress
        if (!$scribe['onboarding_completed']) {
            return $this->render_onboarding_progress($scribe, $portal);
        }

        // Certified Scribe - show dashboard with queue and history
        return $this->render_scribe_dashboard($scribe);
    }

    /**
     * Render login prompt for non-logged-in users.
     *
     * @return string HTML output.
     */
    private function render_login_prompt(): string {
        $login_url = wp_login_url(get_permalink());

        ob_start();
        ?>
        <div class="wor-scribe-dashboard wor-login-prompt">
            <h2>Scribe Portal</h2>
            <p>You must be logged in to access the Scribe Portal.</p>
            <a href="<?php echo esc_url($login_url); ?>" class="wor-button wor-button-primary">
                Log In
            </a>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Render Scribe registration form.
     *
     * @return string HTML output.
     */
    private function render_registration_form(): string {
        // Handle form submission
        if (isset($_POST['wor_scribe_register']) && wp_verify_nonce($_POST['wor_scribe_nonce'], 'wor_scribe_register')) {
            $cohort = sanitize_text_field($_POST['cohort'] ?? 'community');
            $expertise = isset($_POST['expertise']) ? array_map('sanitize_text_field', $_POST['expertise']) : [];

            require_once WOR_PATH . 'includes/class-scribe-portal.php';
            $portal = new WOR_Scribe_Portal();
            $result = $portal->register_scribe(get_current_user_id(), $cohort, $expertise);

            if ($result) {
                return '<div class="wor-scribe-dashboard wor-registration-success">
                    <h2>Welcome, Scribe!</h2>
                    <p>Your registration was successful. Please continue with onboarding.</p>
                    <meta http-equiv="refresh" content="2;url=' . esc_attr(get_permalink()) . '">
                </div>';
            }
        }

        ob_start();
        ?>
        <div class="wor-scribe-dashboard wor-registration-form">
            <h2>Become a Scribe</h2>
            <p>Scribes mentor newcomers (Sprouts) through their journey in World of Rectification. Your guidance helps train AI Ghost Mentors.</p>

            <form method="post" class="wor-form">
                <?php wp_nonce_field('wor_scribe_register', 'wor_scribe_nonce'); ?>

                <div class="wor-form-group">
                    <label for="cohort">Select Your Cohort</label>
                    <select name="cohort" id="cohort" required>
                        <option value="community">Community Volunteer</option>
                        <option value="internal">Internal Team Member</option>
                        <option value="domain_expert">Domain Expert</option>
                    </select>
                </div>

                <div class="wor-form-group">
                    <label>Areas of Expertise (optional)</label>
                    <div class="wor-checkbox-group">
                        <label><input type="checkbox" name="expertise[]" value="tikkun_olam"> Tikkun Olam</label>
                        <label><input type="checkbox" name="expertise[]" value="sefirot"> Sefirot</label>
                        <label><input type="checkbox" name="expertise[]" value="game_mechanics"> Game Mechanics</label>
                        <label><input type="checkbox" name="expertise[]" value="technical"> Technical/Code</label>
                        <label><input type="checkbox" name="expertise[]" value="spiritual"> Spiritual Guidance</label>
                    </div>
                </div>

                <button type="submit" name="wor_scribe_register" class="wor-button wor-button-primary">
                    Register as Scribe
                </button>
            </form>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Render onboarding progress for Scribes in training.
     *
     * @param array $scribe Scribe data.
     * @param WOR_Scribe_Portal $portal Portal instance.
     * @return string HTML output.
     */
    private function render_onboarding_progress(array $scribe, WOR_Scribe_Portal $portal): string {
        $flow = $portal->get_onboarding_flow($scribe['cohort']);
        $current_step = (int)$scribe['onboarding_step'];
        $total_steps = count($flow);
        $progress_percent = $total_steps > 0 ? round(($current_step / $total_steps) * 100) : 0;

        ob_start();
        ?>
        <div class="wor-scribe-dashboard wor-onboarding">
            <h2>Scribe Onboarding</h2>
            <p class="wor-cohort-badge">Cohort: <?php echo esc_html(ucfirst(str_replace('_', ' ', $scribe['cohort']))); ?></p>

            <div class="wor-progress-bar">
                <div class="wor-progress-fill" style="width: <?php echo $progress_percent; ?>%"></div>
                <span class="wor-progress-text"><?php echo $current_step; ?> / <?php echo $total_steps; ?> steps</span>
            </div>

            <?php if ($current_step < $total_steps): ?>
                <?php $step_data = $flow[$current_step] ?? null; ?>
                <?php if ($step_data): ?>
                    <div class="wor-onboarding-step">
                        <h3>Step <?php echo $current_step + 1; ?>: <?php echo esc_html($step_data['title']); ?></h3>

                        <?php if ($step_data['type'] === 'reading'): ?>
                            <div class="wor-step-content">
                                <?php echo wpautop(esc_html($step_data['content'])); ?>
                            </div>
                            <button class="wor-button wor-button-primary wor-complete-step" data-step="<?php echo $current_step; ?>">
                                Continue
                            </button>

                        <?php elseif ($step_data['type'] === 'quiz'): ?>
                            <form class="wor-quiz-form" data-step="<?php echo $current_step; ?>" data-passing-score="<?php echo $step_data['passing_score']; ?>">
                                <?php foreach ($step_data['questions'] as $q_idx => $question): ?>
                                    <div class="wor-quiz-question">
                                        <p class="wor-question-text"><?php echo esc_html($question['question']); ?></p>
                                        <div class="wor-quiz-options">
                                            <?php foreach ($question['options'] as $o_idx => $option): ?>
                                                <label class="wor-quiz-option">
                                                    <input type="radio" name="q<?php echo $q_idx; ?>" value="<?php echo $o_idx; ?>" required>
                                                    <?php echo esc_html($option); ?>
                                                </label>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                                <button type="submit" class="wor-button wor-button-primary">Submit Quiz</button>
                            </form>

                        <?php elseif ($step_data['type'] === 'interactive'): ?>
                            <div class="wor-step-interactive">
                                <p>Interactive content will load here.</p>
                                <a href="<?php echo esc_url($step_data['url']); ?>" class="wor-button wor-button-secondary">
                                    Start Interactive Tour
                                </a>
                            </div>

                        <?php else: ?>
                            <div class="wor-step-content">
                                <p><?php echo esc_html($step_data['content'] ?? 'Continue to next step.'); ?></p>
                            </div>
                            <button class="wor-button wor-button-primary wor-complete-step" data-step="<?php echo $current_step; ?>">
                                Continue
                            </button>
                        <?php endif; ?>
                    </div>
                <?php endif; ?>
            <?php else: ?>
                <div class="wor-onboarding-complete">
                    <p>Completing your certification...</p>
                </div>
            <?php endif; ?>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Render full Scribe dashboard with queue and history.
     *
     * @param array $scribe Scribe data.
     * @return string HTML output.
     */
    private function render_scribe_dashboard(array $scribe): string {
        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $queue = $session->get_queue();

        ob_start();
        ?>
        <div class="wor-scribe-dashboard wor-certified">
            <h2>Scribe Dashboard</h2>
            <p class="wor-cohort-badge">Cohort: <?php echo esc_html(ucfirst(str_replace('_', ' ', $scribe['cohort']))); ?></p>

            <div class="wor-dashboard-stats">
                <div class="wor-stat">
                    <span class="wor-stat-value"><?php echo (int)$scribe['mentorship_count']; ?></span>
                    <span class="wor-stat-label">Sessions</span>
                </div>
                <div class="wor-stat">
                    <span class="wor-stat-value"><?php echo $scribe['avg_sprout_rating'] ? number_format($scribe['avg_sprout_rating'], 1) : '-'; ?></span>
                    <span class="wor-stat-label">Avg Rating</span>
                </div>
            </div>

            <div class="wor-sprout-queue">
                <h3>Waiting Sprouts (<?php echo count($queue); ?>)</h3>
                <?php if (empty($queue)): ?>
                    <p class="wor-empty-queue">No Sprouts currently waiting. Check back soon!</p>
                <?php else: ?>
                    <ul class="wor-queue-list">
                        <?php foreach ($queue as $sprout): ?>
                            <li class="wor-queue-item" data-sprout-id="<?php echo esc_attr($sprout['sprout_id']); ?>">
                                <span class="wor-sprout-name">Sprout #<?php echo esc_html($sprout['sprout_id']); ?></span>
                                <?php if (!empty($sprout['topic'])): ?>
                                    <span class="wor-sprout-topic"><?php echo esc_html($sprout['topic']); ?></span>
                                <?php endif; ?>
                                <span class="wor-wait-time">Waiting <?php echo human_time_diff(strtotime($sprout['requested_at'])); ?></span>
                                <button class="wor-button wor-button-small wor-accept-sprout" data-sprout-id="<?php echo esc_attr($sprout['sprout_id']); ?>">
                                    Accept
                                </button>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </div>

            <div class="wor-session-history">
                <h3>Recent Sessions</h3>
                <?php echo $this->render_session_history($scribe['id']); ?>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Render session history for a Scribe.
     *
     * @param int $scribe_id Scribe ID.
     * @return string HTML output.
     */
    public function render_session_history(int $scribe_id): string {
        global $wpdb;
        $table = $wpdb->prefix . 'wor_transmissions';

        $sessions = $wpdb->get_results($wpdb->prepare(
            "SELECT * FROM {$table} WHERE scribe_id = %d ORDER BY started_at DESC LIMIT 10",
            $scribe_id
        ), ARRAY_A);

        if (empty($sessions)) {
            return '<p class="wor-empty-history">No sessions yet. Accept a Sprout to begin!</p>';
        }

        ob_start();
        ?>
        <ul class="wor-history-list">
            <?php foreach ($sessions as $session): ?>
                <li class="wor-history-item wor-status-<?php echo esc_attr($session['status']); ?>">
                    <span class="wor-history-date"><?php echo esc_html(date('M j, Y', strtotime($session['started_at']))); ?></span>
                    <span class="wor-history-duration"><?php echo $session['duration_seconds'] ? gmdate('i:s', $session['duration_seconds']) : '-'; ?></span>
                    <span class="wor-history-rating">
                        <?php if ($session['scribe_rating']): ?>
                            <?php echo str_repeat('★', (int)$session['scribe_rating']); ?><?php echo str_repeat('☆', 5 - (int)$session['scribe_rating']); ?>
                        <?php else: ?>
                            -
                        <?php endif; ?>
                    </span>
                    <span class="wor-history-status"><?php echo esc_html(ucfirst($session['status'])); ?></span>
                </li>
            <?php endforeach; ?>
        </ul>
        <?php
        return ob_get_clean();
    }

    /**
     * Render Help Button shortcode.
     *
     * @param array $atts Shortcode attributes.
     * @return string HTML output.
     */
    public function render_help_button(array $atts = []): string {
        if (!is_user_logged_in()) {
            return '';
        }

        $atts = shortcode_atts([
            'quest_id' => 0,
        ], $atts);

        $quest_id = (int)$atts['quest_id'];

        // Enqueue chat widget assets
        $this->enqueue_chat_widget();

        ob_start();
        ?>
        <div class="wor-help-button-container">
            <button class="wor-help-button" data-quest-id="<?php echo esc_attr($quest_id); ?>">
                <span class="wor-help-icon">?</span>
                <span class="wor-help-text">Get Help</span>
            </button>
        </div>

        <!-- Chat Widget Modal (hidden by default) -->
        <div class="wor-chat-modal" id="wor-chat-modal" style="display: none;">
            <div class="wor-chat-overlay"></div>
            <div class="wor-chat-container">
                <div class="wor-chat-header">
                    <h3>Scribe Help</h3>
                    <button class="wor-chat-close">&times;</button>
                </div>
                <div class="wor-chat-body">
                    <div class="wor-chat-messages"></div>
                    <div class="wor-chat-input-area">
                        <input type="text" class="wor-chat-input" placeholder="Type your message...">
                        <button class="wor-chat-send">Send</button>
                    </div>
                </div>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }

    /**
     * Enqueue chat widget JavaScript and CSS.
     */
    public function enqueue_chat_widget(): void {
        wp_enqueue_style(
            'wor-chat-widget',
            WOR_URL . 'assets/css/wor-chat.css',
            [],
            '1.0.0'
        );

        wp_enqueue_script(
            'wor-chat-widget',
            WOR_URL . 'assets/js/wor-chat-widget.js',
            ['jquery'],
            '1.0.0',
            true
        );

        wp_localize_script('wor-chat-widget', 'worChatData', [
            'restUrl' => rest_url('wor/v1'),
            'nonce' => wp_create_nonce('wp_rest'),
            'isLoggedIn' => is_user_logged_in(),
            'userId' => get_current_user_id(),
        ]);
    }
}

/**
 * Helper function to get WOR_Scribe_Shortcodes instance.
 *
 * @return WOR_Scribe_Shortcodes
 */
function WOR_Scribe_Shortcodes(): WOR_Scribe_Shortcodes {
    return WOR_Scribe_Shortcodes::get_instance();
}
