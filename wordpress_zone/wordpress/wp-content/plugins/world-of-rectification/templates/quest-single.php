<?php
/**
 * Single Quest Template
 *
 * Displays a single quest with easy/hard mode choices.
 * Use shortcode [wor_quest id="123"] to embed in any page.
 *
 * @package World_of_Rectification
 */

if (!defined('ABSPATH')) exit;

/**
 * Shortcode handler for single quest display.
 *
 * @param array $atts Shortcode attributes.
 * @return string Quest HTML.
 */
function wor_quest_shortcode($atts = []) {
    $atts = shortcode_atts([
        'id' => 0,
    ], $atts);

    if (empty($atts['id'])) {
        // Try to get from URL query var
        $atts['id'] = get_query_var('wor_quest_id', 0);
    }

    if (empty($atts['id'])) {
        return '<div class="wor-error">No quest specified. Use [wor_quest id="123"] or visit /wor/quest/123/</div>';
    }

    $quest = get_post($atts['id']);

    if (!$quest || $quest->post_type !== 'wor_quest') {
        return '<div class="wor-error">Quest not found.</div>';
    }

    // Get quest metadata
    $sefirah = get_post_meta($quest->ID, '_wor_sefirah', true);
    $difficulty = get_post_meta($quest->ID, '_wor_difficulty', true);
    $easy_choices = get_post_meta($quest->ID, '_wor_easy_choices', true);
    $hard_task = get_post_meta($quest->ID, '_wor_hard_task', true);
    $spark_reward = get_post_meta($quest->ID, '_wor_spark_reward', true);
    $ctrm_multiplier = get_post_meta($quest->ID, '_wor_ctrm_multiplier', true);

    // Decode JSON fields
    if (is_string($easy_choices)) {
        $easy_choices = json_decode($easy_choices, true);
    }
    if (is_string($hard_task)) {
        $hard_task = json_decode($hard_task, true);
    }

    ob_start();
    ?>
    <div class="wor-quest-single" data-quest-id="<?php echo esc_attr($quest->ID); ?>">
        <article class="wor-quest-card">
            <!-- Quest Header -->
            <header class="wor-quest-header">
                <div class="wor-quest-meta">
                    <?php if ($sefirah): ?>
                    <span class="wor-sefirah-badge wor-sefirah-<?php echo esc_attr(strtolower($sefirah)); ?>">
                        <?php echo esc_html($sefirah); ?>
                    </span>
                    <?php endif; ?>
                    <?php if ($difficulty): ?>
                    <span class="wor-difficulty wor-difficulty-<?php echo esc_attr(strtolower($difficulty)); ?>">
                        <?php echo esc_html($difficulty); ?>
                    </span>
                    <?php endif; ?>
                </div>
                <h2 class="wor-quest-title"><?php echo esc_html($quest->post_title); ?></h2>
            </header>

            <!-- Quest Scenario -->
            <div class="wor-quest-scenario">
                <?php echo wpautop($quest->post_content); ?>
            </div>

            <!-- Mode Selection -->
            <div class="wor-mode-selection" id="wor-mode-selection-<?php echo esc_attr($quest->ID); ?>">
                <h3>Choose Your Path</h3>

                <!-- Easy Mode Option -->
                <div class="wor-mode-option wor-mode-easy" data-mode="easy">
                    <div class="wor-mode-header">
                        <span class="wor-mode-icon">🌿</span>
                        <h4>Easy Mode</h4>
                        <span class="wor-mode-points">+<?php echo esc_html($spark_reward ?: 10); ?> Sparks</span>
                    </div>
                    <p class="wor-mode-desc">Make a choice that aligns with the scenario. Learn through reflection.</p>

                    <div class="wor-easy-choices" id="wor-easy-choices-<?php echo esc_attr($quest->ID); ?>">
                        <?php if (!empty($easy_choices) && is_array($easy_choices)): ?>
                            <?php foreach ($easy_choices as $index => $choice): ?>
                            <button type="button"
                                    class="wor-choice-btn"
                                    data-choice-index="<?php echo esc_attr($index); ?>"
                                    data-alignment="<?php echo esc_attr($choice['alignment'] ?? 'neutral'); ?>">
                                <span class="wor-choice-icon"><?php echo $choice['alignment'] === 'light' ? '✨' : ($choice['alignment'] === 'shadow' ? '🌑' : '⚖️'); ?></span>
                                <?php echo esc_html($choice['text'] ?? $choice); ?>
                            </button>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <p>No choices available for this quest.</p>
                        <?php endif; ?>
                    </div>
                </div>

                <!-- Hard Mode Option -->
                <div class="wor-mode-option wor-mode-hard" data-mode="hard">
                    <div class="wor-mode-header">
                        <span class="wor-mode-icon">🔥</span>
                        <h4>Hard Mode</h4>
                        <span class="wor-mode-points">+<?php echo esc_html(($spark_reward ?: 10) * 2.5); ?> Sparks</span>
                        <span class="wor-ctrm-bonus">CTRM x<?php echo esc_html($ctrm_multiplier ?: 2.5); ?></span>
                    </div>
                    <p class="wor-mode-desc">Contribute to Geometry OS development. Help build the game engine itself.</p>

                    <div class="wor-hard-task" id="wor-hard-task-<?php echo esc_attr($quest->ID); ?>">
                        <?php if (!empty($hard_task)): ?>
                        <div class="wor-task-description">
                            <strong>Task:</strong> <?php echo esc_html($hard_task['description'] ?? ''); ?>
                        </div>
                        <div class="wor-task-requirements">
                            <strong>Requirements:</strong>
                            <ul>
                                <?php foreach (($hard_task['requirements'] ?? []) as $req): ?>
                                <li><?php echo esc_html($req); ?></li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <div class="wor-task-contribution">
                            <label for="wor-contribution-<?php echo esc_attr($quest->ID); ?>">
                                Your Contribution:
                            </label>
                            <textarea id="wor-contribution-<?php echo esc_attr($quest->ID); ?>"
                                      class="wor-contribution-input"
                                      placeholder="Describe your contribution or paste code/design..."></textarea>
                        </div>
                        <button type="button" class="wor-hard-submit-btn" data-quest-id="<?php echo esc_attr($quest->ID); ?>">
                            Submit Contribution
                        </button>
                        <?php else: ?>
                        <p>No hard mode task available for this quest.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <!-- Quest Footer -->
            <footer class="wor-quest-footer">
                <div class="wor-quest-rewards">
                    <span class="wor-reward">
                        <strong>Rewards:</strong>
                        <?php echo esc_html($spark_reward ?: 10); ?> Sparks (Easy) |
                        <?php echo esc_html(($spark_reward ?: 10) * 2.5); ?> Sparks (Hard)
                    </span>
                </div>
            </footer>
        </article>
    </div>

    <style>
    .wor-quest-single {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    .wor-quest-card {
        background: var(--wor-bg, #f8fafc);
        border: 1px solid var(--wor-border, #e2e8f0);
        border-radius: 12px;
        overflow: hidden;
    }
    .wor-quest-header {
        padding: 20px;
        background: linear-gradient(135deg, var(--wor-primary, #667eea), var(--wor-primary-dark, #764ba2));
        color: white;
    }
    .wor-quest-meta {
        display: flex;
        gap: 10px;
        margin-bottom: 10px;
    }
    .wor-sefirah-badge, .wor-difficulty {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
    }
    .wor-sefirah-badge {
        background: rgba(255,255,255,0.2);
    }
    .wor-difficulty {
        background: rgba(255,255,255,0.3);
    }
    .wor-quest-title {
        margin: 0;
        font-size: 24px;
    }
    .wor-quest-scenario {
        padding: 20px;
        font-size: 16px;
        line-height: 1.7;
        color: var(--wor-text, #1e293b);
    }
    .wor-mode-selection {
        padding: 20px;
    }
    .wor-mode-selection h3 {
        text-align: center;
        margin-bottom: 20px;
        color: var(--wor-text, #1e293b);
    }
    .wor-mode-option {
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 15px;
    }
    .wor-mode-easy {
        background: #ecfdf5;
        border: 2px solid #10b981;
    }
    .wor-mode-hard {
        background: #fef3c7;
        border: 2px solid #f97316;
    }
    .wor-mode-header {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
    }
    .wor-mode-icon {
        font-size: 24px;
    }
    .wor-mode-header h4 {
        margin: 0;
        flex-grow: 1;
    }
    .wor-mode-points {
        background: var(--wor-success, #10b981);
        color: white;
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: 600;
    }
    .wor-ctrm-bonus {
        background: var(--wor-warning, #f97316);
        color: white;
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: 600;
    }
    .wor-choice-btn {
        display: flex;
        align-items: center;
        gap: 10px;
        width: 100%;
        padding: 12px;
        margin-top: 10px;
        background: white;
        border: 1px solid var(--wor-border, #e2e8f0);
        border-radius: 6px;
        cursor: pointer;
        text-align: left;
        font-size: 14px;
        transition: all 0.2s;
    }
    .wor-choice-btn:hover {
        background: #f0f9ff;
        border-color: var(--wor-primary, #667eea);
    }
    .wor-choice-icon {
        font-size: 18px;
    }
    .wor-contribution-input {
        width: 100%;
        min-height: 100px;
        padding: 10px;
        border: 1px solid var(--wor-border, #e2e8f0);
        border-radius: 6px;
        font-family: inherit;
        font-size: 14px;
        margin-top: 10px;
    }
    .wor-hard-submit-btn {
        margin-top: 15px;
        padding: 12px 24px;
        background: var(--wor-warning, #f97316);
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 600;
    }
    .wor-hard-submit-btn:hover {
        background: #ea580c;
    }
    .wor-quest-footer {
        padding: 15px 20px;
        background: #f1f5f9;
        border-top: 1px solid var(--wor-border, #e2e8f0);
    }
    .wor-quest-rewards {
        text-align: center;
        color: var(--wor-text-muted, #64748b);
        font-size: 14px;
    }
    </style>
    <?php
    return ob_get_clean();
}

/**
 * Get all quests for listing.
 */
function wor_get_all_quests($limit = 10, $offset = 0) {
    $args = [
        'post_type' => 'wor_quest',
        'post_status' => 'publish',
        'posts_per_page' => $limit,
        'offset' => $offset,
        'orderby' => 'date',
        'order' => 'DESC',
    ];

    return get_posts($args);
}

/**
 * Render quest listing.
 */
function wor_render_quest_listing($limit = 10) {
    $quests = wor_get_all_quests($limit);

    if (empty($quests)) {
        return '<div class="wor-no-quests">No quests available yet. Check back soon!</div>';
    }

    ob_start();
    ?>
    <div class="wor-quest-list">
        <?php foreach ($quests as $quest): ?>
            <?php
            $sefirah = get_post_meta($quest->ID, '_wor_sefirah', true);
            $difficulty = get_post_meta($quest->ID, '_wor_difficulty', true);
            ?>
            <div class="wor-quest-item" data-quest-id="<?php echo esc_attr($quest->ID); ?>">
                <div class="wor-quest-item-header">
                    <?php if ($sefirah): ?>
                    <span class="wor-sefirah-badge wor-sefirah-<?php echo esc_attr(strtolower($sefirah)); ?>">
                        <?php echo esc_html($sefirah); ?>
                    </span>
                    <?php endif; ?>
                    <h4 class="wor-quest-item-title"><?php echo esc_html($quest->post_title); ?></h4>
                </div>
                <p class="wor-quest-item-excerpt"><?php echo esc_html(wp_trim_words($quest->post_content, 20)); ?></p>
                <a href="<?php echo esc_url(wor_get_quest_url($quest->ID)); ?>" class="wor-quest-link">
                    Begin Quest →
                </a>
            </div>
        <?php endforeach; ?>
    </div>

    <style>
    .wor-quest-list {
        display: grid;
        gap: 15px;
    }
    .wor-quest-item {
        background: white;
        border: 1px solid var(--wor-border, #e2e8f0);
        border-radius: 8px;
        padding: 15px;
        transition: box-shadow 0.2s;
    }
    .wor-quest-item:hover {
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .wor-quest-item-header {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 8px;
    }
    .wor-quest-item-title {
        margin: 0;
        font-size: 16px;
    }
    .wor-quest-item-excerpt {
        color: var(--wor-text-muted, #64748b);
        font-size: 14px;
        margin: 0 0 10px 0;
    }
    .wor-quest-link {
        color: var(--wor-primary, #667eea);
        text-decoration: none;
        font-weight: 600;
        font-size: 14px;
    }
    .wor-quest-link:hover {
        text-decoration: underline;
    }
    </style>
    <?php
    return ob_get_clean();
}

/**
 * Get quest URL.
 */
function wor_get_quest_url($quest_id) {
    // Check for pretty permalinks
    if (get_option('permalink_structure')) {
        return home_url("/wor/quest/{$quest_id}/");
    }
    return add_query_arg(['wor_quest_id' => $quest_id], home_url('/wor/'));
}
