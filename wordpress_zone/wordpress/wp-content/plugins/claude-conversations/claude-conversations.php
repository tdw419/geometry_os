<?php
/**
 * Plugin Name: Claude Conversations
 * Description: Import Claude Code CLI conversations from ~/.claude/projects/ into WordPress as formatted posts with syntax highlighting
 * Version: 1.0.0
 * Author: Geometry OS
 *
 * This plugin imports Claude Code CLI conversation sessions (JSONL format)
 * into WordPress posts with:
 * - User and assistant message formatting
 * - Thinking block extraction and display
 * - Prism.js syntax highlighting for code blocks
 * - Session metadata preservation (project, branch, timestamps)
 *
 * "Every conversation is a learning artifact worth preserving."
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

class Claude_Conversations_Admin {

    /**
     * Initialize the plugin
     */
    public function __construct() {
        add_action('admin_menu', array($this, 'add_menu'));
        add_action('admin_init', array($this, 'handle_import'));
        add_action('admin_init', array($this, 'test_parse'));
    }

    /**
     * Add admin menu page
     */
    public function add_menu() {
        add_menu_page(
            'Claude Chats',
            'Claude Chats',
            'manage_options',
            'claude-conversations',
            array($this, 'render_page'),
            'dashicons-format-chat',
            30
        );
    }

    /**
     * Get the Claude projects directory path
     *
     * @return string Expanded path
     */
    private function get_claude_dir(): string {
        return str_replace('~', getenv('HOME'), '~/.claude/projects/');
    }

    /**
     * Count total session files
     *
     * @return int Number of .jsonl files
     */
    private function count_sessions(): int {
        $claude_dir = $this->get_claude_dir();
        $pattern = rtrim($claude_dir, '/') . '/*/*.jsonl';
        $files = glob($pattern);
        return $files ? count($files) : 0;
    }

    /**
     * Count imported posts
     *
     * @return int Number of posts with _claude_session_id meta
     */
    private function count_imported(): int {
        $query = new WP_Query(array(
            'post_type' => 'post',
            'post_status' => 'any',
            'posts_per_page' => -1,
            'meta_query' => array(
                array(
                    'key' => '_claude_session_id',
                    'compare' => 'EXISTS',
                ),
            ),
            'fields' => 'ids',
        ));
        return $query->found_posts;
    }

    /**
     * Render the admin page
     */
    public function render_page() {
        // Get counts
        $claude_dir = $this->get_claude_dir();
        $session_count = $this->count_sessions();
        $imported_count = $this->count_imported();

        ?>
        <div class="wrap">
            <h1>Claude Conversations Importer</h1>

            <?php
            // Display admin notices
            if (isset($_GET['claude_imported'])) {
                $imported = intval($_GET['claude_imported']);
                $skipped = intval($_GET['claude_skipped']);
                $errors = intval($_GET['claude_errors']);
                echo '<div class="notice notice-success is-dismissible"><p>';
                echo sprintf(
                    'Import complete: %d imported, %d skipped (duplicates), %d errors.',
                    $imported, $skipped, $errors
                );
                echo '</p></div>';
            }
            ?>

            <div class="card" style="max-width: 800px; margin-top: 20px;">
                <h2>Status</h2>
                <p>Import Claude Code CLI conversations into WordPress posts.</p>

                <table class="form-table">
                    <tr>
                        <th scope="row">Claude Directory</th>
                        <td><code><?php echo esc_html($claude_dir); ?></code></td>
                    </tr>
                    <tr>
                        <th scope="row">Session Count</th>
                        <td><?php echo esc_html($session_count); ?> .jsonl files found</td>
                    </tr>
                    <tr>
                        <th scope="row">Imported Count</th>
                        <td><?php echo esc_html($imported_count); ?> posts imported</td>
                    </tr>
                </table>

                <h3>Actions</h3>

                <!-- Import All Sessions Form -->
                <form method="post" action="" style="margin-bottom: 20px;">
                    <?php wp_nonce_field('claude_import_all', 'claude_import_nonce'); ?>
                    <input type="hidden" name="claude_action" value="import_all">
                    <button type="submit" class="button button-primary">
                        Import All Sessions
                    </button>
                    <p class="description">
                        Import all .jsonl sessions from the Claude directory. Duplicates will be skipped.
                    </p>
                </form>

                <!-- Test Parse First Session Form -->
                <form method="post" action="">
                    <?php wp_nonce_field('claude_test_parse', 'claude_test_nonce'); ?>
                    <input type="hidden" name="claude_action" value="test_parse">
                    <button type="submit" class="button">
                        Test Parse First Session
                    </button>
                    <p class="description">
                        Parse and preview the first .jsonl file found without creating a post.
                    </p>
                </form>

                <?php
                // Display test parse preview if available
                if (isset($_GET['claude_preview']) && $_GET['claude_preview'] === '1') {
                    $preview = get_transient('claude_preview_html');
                    if ($preview) {
                        echo '<h3>Preview</h3>';
                        echo '<div style="background: #fff; border: 1px solid #ccc; padding: 15px; max-height: 500px; overflow: auto;">';
                        echo $preview;
                        echo '</div>';
                        delete_transient('claude_preview_html');
                    }
                }
                ?>
            </div>
        </div>
        <?php
    }

    /**
     * Handle import all sessions action
     */
    public function handle_import() {
        // Check if this is our action
        if (!isset($_POST['claude_action']) || $_POST['claude_action'] !== 'import_all') {
            return;
        }

        // Verify nonce
        if (!isset($_POST['claude_import_nonce']) || !wp_verify_nonce($_POST['claude_import_nonce'], 'claude_import_all')) {
            wp_die('Security check failed');
        }

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_die('Insufficient permissions');
        }

        // Run import
        $importer = new Claude_Importer();
        $stats = $importer->import_all('~/.claude/projects/');

        // Redirect with stats
        wp_redirect(add_query_arg(array(
            'page' => 'claude-conversations',
            'claude_imported' => $stats['imported'],
            'claude_skipped' => $stats['skipped'],
            'claude_errors' => $stats['errors'],
        ), admin_url('admin.php')));
        exit;
    }

    /**
     * Handle test parse action
     */
    public function test_parse() {
        // Check if this is our action
        if (!isset($_POST['claude_action']) || $_POST['claude_action'] !== 'test_parse') {
            return;
        }

        // Verify nonce
        if (!isset($_POST['claude_test_nonce']) || !wp_verify_nonce($_POST['claude_test_nonce'], 'claude_test_parse')) {
            wp_die('Security check failed');
        }

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_die('Insufficient permissions');
        }

        // Find first .jsonl file
        $claude_dir = $this->get_claude_dir();
        $pattern = rtrim($claude_dir, '/') . '/*/*.jsonl';
        $files = glob($pattern);

        if (empty($files)) {
            wp_redirect(add_query_arg(array(
                'page' => 'claude-conversations',
                'claude_error' => 'no_files',
            ), admin_url('admin.php')));
            exit;
        }

        // Parse first file
        $filepath = $files[0];
        $parser = new Claude_JsonlParser($filepath);
        $conversation = $parser->parse();

        if (is_wp_error($conversation)) {
            wp_redirect(add_query_arg(array(
                'page' => 'claude-conversations',
                'claude_error' => 'parse_error',
            ), admin_url('admin.php')));
            exit;
        }

        // Format with HTML formatter
        $formatter = new Claude_HtmlFormatter();
        $preview = '<div style="background: #f9f9f9; padding: 10px; margin-bottom: 15px; border-radius: 4px;">';
        $preview .= '<strong>File:</strong> ' . esc_html(basename($filepath)) . '<br>';
        $preview .= '<strong>Session ID:</strong> ' . esc_html($conversation['session_id']) . '<br>';
        $preview .= '<strong>Messages:</strong> ' . count($conversation['messages']) . '<br>';
        $preview .= '<strong>Thinking Blocks:</strong> ' . count($conversation['thinking']);
        $preview .= '</div>';
        $preview .= $formatter->get_css();
        $preview .= $formatter->format($conversation);

        // Store in transient for display
        set_transient('claude_preview_html', $preview, 60);

        // Redirect to show preview
        wp_redirect(add_query_arg(array(
            'page' => 'claude-conversations',
            'claude_preview' => '1',
        ), admin_url('admin.php')));
        exit;
    }
}

/**
 * JSONL Parser for Claude Code CLI conversation files
 */
class Claude_JsonlParser {

    /**
     * Path to the JSONL file
     * @var string
     */
    private $filepath;

    /**
     * Constructor
     *
     * @param string $filepath Path to JSONL file
     */
    public function __construct(string $filepath) {
        $this->filepath = $filepath;
    }

    /**
     * Parse the JSONL file and extract conversation data
     *
     * @return array|WP_Error Structured conversation data or error
     */
    public function parse() {
        if (!file_exists($this->filepath)) {
            return new WP_Error('file_not_found', sprintf('File not found: %s', $this->filepath));
        }

        if (!is_readable($this->filepath)) {
            return new WP_Error('file_not_readable', sprintf('File not readable: %s', $this->filepath));
        }

        $session_id = basename($this->filepath, '.jsonl');
        $messages = array();
        $thinking = array();
        $metadata = array(
            'project' => '',
            'git_branch' => '',
            'start_time' => PHP_INT_MAX,
            'end_time' => 0,
        );

        $handle = fopen($this->filepath, 'r');
        if (!$handle) {
            return new WP_Error('file_open_failed', sprintf('Cannot open file: %s', $this->filepath));
        }

        $line_number = 0;
        while (($line = fgets($handle)) !== false) {
            $line_number++;
            $line = trim($line);

            if (empty($line)) {
                continue;
            }

            $entry = json_decode($line, true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                // Skip malformed JSON lines silently
                continue;
            }

            // Extract metadata from first valid entry
            if (empty($metadata['project']) && isset($entry['cwd'])) {
                $metadata['project'] = basename($entry['cwd']);
            }
            if (empty($metadata['git_branch']) && isset($entry['gitBranch'])) {
                $metadata['git_branch'] = $entry['gitBranch'];
            }

            // Track timestamps
            if (isset($entry['timestamp'])) {
                $timestamp = strtotime($entry['timestamp']);
                if ($timestamp !== false) {
                    $metadata['start_time'] = min($metadata['start_time'], $timestamp);
                    $metadata['end_time'] = max($metadata['end_time'], $timestamp);
                }
            }

            // Process user messages
            if (isset($entry['type']) && $entry['type'] === 'user') {
                $content = $this->extract_user_content($entry);
                if ($content !== '') {
                    $messages[] = array(
                        'role' => 'user',
                        'content' => $content,
                        'timestamp' => isset($entry['timestamp']) ? strtotime($entry['timestamp']) : 0,
                    );
                }
            }

            // Process assistant messages
            if (isset($entry['type']) && $entry['type'] === 'assistant') {
                $this->extract_assistant_content($entry, $messages, $thinking);
            }
        }

        fclose($handle);

        // Fix timestamps if none were found
        if ($metadata['start_time'] === PHP_INT_MAX) {
            $metadata['start_time'] = 0;
        }
        if ($metadata['end_time'] === 0) {
            $metadata['end_time'] = 0;
        }

        return array(
            'session_id' => $session_id,
            'messages' => $messages,
            'thinking' => $thinking,
            'metadata' => $metadata,
        );
    }

    /**
     * Extract content from user message
     *
     * @param array $entry JSONL entry
     * @return string Extracted content
     */
    private function extract_user_content(array $entry): string {
        if (!isset($entry['message'])) {
            return '';
        }

        $message = $entry['message'];

        // Content can be a string directly
        if (isset($message['content']) && is_string($message['content'])) {
            return $message['content'];
        }

        // Or an array of content blocks
        if (isset($message['content']) && is_array($message['content'])) {
            $texts = array();
            foreach ($message['content'] as $block) {
                if (isset($block['type']) && $block['type'] === 'text' && isset($block['text'])) {
                    $texts[] = $block['text'];
                }
            }
            return implode("\n", $texts);
        }

        return '';
    }

    /**
     * Extract content from assistant message (text and thinking blocks)
     *
     * @param array $entry JSONL entry
     * @param array &$messages Array to append text messages to
     * @param array &$thinking Array to append thinking blocks to
     */
    private function extract_assistant_content(array $entry, array &$messages, array &$thinking): void {
        if (!isset($entry['message']['content']) || !is_array($entry['message']['content'])) {
            return;
        }

        $timestamp = isset($entry['timestamp']) ? strtotime($entry['timestamp']) : 0;
        $text_parts = array();

        foreach ($entry['message']['content'] as $block) {
            if (!isset($block['type'])) {
                continue;
            }

            // Extract thinking blocks
            if ($block['type'] === 'thinking' && isset($block['thinking'])) {
                $thinking[] = array(
                    'content' => $block['thinking'],
                );
            }

            // Extract text blocks
            if ($block['type'] === 'text' && isset($block['text'])) {
                $text_parts[] = $block['text'];
            }
        }

        // Add combined text as message if we have any
        if (!empty($text_parts)) {
            $messages[] = array(
                'role' => 'assistant',
                'content' => implode("\n", $text_parts),
                'timestamp' => $timestamp,
            );
        }
    }

    /**
     * Extract title from conversation (first 80 chars of first user message)
     *
     * @param array $conversation Parsed conversation data
     * @return string Title (max 80 chars)
     */
    public function extract_title(array $conversation): string {
        if (!isset($conversation['messages']) || empty($conversation['messages'])) {
            return 'Untitled Conversation';
        }

        // Find first user message
        foreach ($conversation['messages'] as $message) {
            if (isset($message['role']) && $message['role'] === 'user') {
                $content = $message['content'];
                // Strip any markdown or HTML for cleaner title
                $content = strip_tags($content);
                $content = preg_replace('/[#*_`~\[\]]/', '', $content);
                $content = trim($content);

                if (strlen($content) > 80) {
                    return substr($content, 0, 77) . '...';
                }
                return $content ?: 'Untitled Conversation';
            }
        }

        return 'Untitled Conversation';
    }
}

/**
 * Import Engine for Claude conversations
 */
class Claude_Importer {

    /**
     * Category ID cache
     * @var int|null
     */
    private $category_id = null;

    /**
     * Import all sessions from Claude directory
     *
     * @param string $claude_dir Base Claude directory (e.g., ~/.claude/projects/)
     * @return array Stats array with imported, skipped, errors counts
     */
    public function import_all(string $claude_dir): array {
        $stats = array(
            'imported' => 0,
            'skipped' => 0,
            'errors' => 0,
        );

        // Expand ~ to home directory
        $claude_dir = str_replace('~', getenv('HOME'), $claude_dir);

        // Glob all .jsonl files from all project subdirectories
        $pattern = rtrim($claude_dir, '/') . '/*/*.jsonl';
        $files = glob($pattern);

        if (empty($files)) {
            return $stats;
        }

        foreach ($files as $filepath) {
            // Extract project name from path
            $project = basename(dirname($filepath));

            $result = $this->import_session($filepath, $project);

            if ($result === true) {
                $stats['imported']++;
            } elseif ($result === 'skipped') {
                $stats['skipped']++;
            } else {
                $stats['errors']++;
            }
        }

        return $stats;
    }

    /**
     * Import a single session file
     *
     * @param string $filepath Path to JSONL file
     * @param string $project Project name
     * @return bool|string True on success, 'skipped' if duplicate, false on error
     */
    public function import_session(string $filepath, string $project) {
        // Extract session_id from filename
        $session_id = basename($filepath, '.jsonl');

        // Check for existing post (duplicate detection)
        $existing = $this->find_existing_post($session_id);
        if ($existing !== false) {
            return 'skipped';
        }

        // Parse the file
        $parser = new Claude_JsonlParser($filepath);
        $conversation = $parser->parse();

        if (is_wp_error($conversation)) {
            return false;
        }

        // Check if conversation has any messages
        if (empty($conversation['messages'])) {
            return 'skipped';
        }

        // Format with HTML formatter
        $formatter = new Claude_HtmlFormatter();
        $content = $formatter->format($conversation);
        $content = $formatter->get_css() . $content;

        // Extract title
        $title = $parser->extract_title($conversation);

        // Create the post
        $post_id = $this->create_post($title, $content, $session_id, $project, $conversation['metadata']);

        return $post_id !== false;
    }

    /**
     * Find existing post by session_id
     *
     * @param string $session_id Session ID to search for
     * @return int|false Post ID if found, false otherwise
     */
    public function find_existing_post(string $session_id) {
        $query = new WP_Query(array(
            'post_type' => 'post',
            'post_status' => 'any',
            'posts_per_page' => 1,
            'meta_query' => array(
                array(
                    'key' => '_claude_session_id',
                    'value' => $session_id,
                    'compare' => '=',
                ),
            ),
            'fields' => 'ids',
        ));

        if ($query->have_posts()) {
            return $query->posts[0];
        }

        return false;
    }

    /**
     * Create a WordPress post from conversation data
     *
     * @param string $title Post title
     * @param string $content Post content (HTML)
     * @param string $session_id Session ID
     * @param string $project Project name
     * @param array $metadata Additional metadata
     * @return int|false Post ID on success, false on failure
     */
    public function create_post(string $title, string $content, string $session_id, string $project, array $metadata) {
        $category_id = $this->ensure_category();

        $post_data = array(
            'post_title' => $title,
            'post_content' => $content,
            'post_status' => 'publish',
            'post_category' => array($category_id),
            'post_type' => 'post',
        );

        $post_id = wp_insert_post($post_data, true);

        if (is_wp_error($post_id)) {
            return false;
        }

        // Add post meta
        update_post_meta($post_id, '_claude_session_id', $session_id);
        update_post_meta($post_id, '_claude_project', $project);
        update_post_meta($post_id, '_claude_imported_at', current_time('mysql'));

        if (!empty($metadata['git_branch'])) {
            update_post_meta($post_id, '_claude_branch', $metadata['git_branch']);
        }

        if (!empty($metadata['start_time'])) {
            update_post_meta($post_id, '_claude_start_time', date('Y-m-d H:i:s', $metadata['start_time']));
        }

        if (!empty($metadata['end_time'])) {
            update_post_meta($post_id, '_claude_end_time', date('Y-m-d H:i:s', $metadata['end_time']));
        }

        return $post_id;
    }

    /**
     * Ensure the "Claude Conversations" category exists
     *
     * @return int Category ID
     */
    public function ensure_category(): int {
        if ($this->category_id !== null) {
            return $this->category_id;
        }

        $category_name = 'Claude Conversations';
        $category_slug = 'claude-conversations';

        // Check if category exists
        $existing = get_term_by('name', $category_name, 'category');

        if ($existing) {
            $this->category_id = $existing->term_id;
            return $this->category_id;
        }

        // Create category using wp_insert_term (available in CLI context)
        $result = wp_insert_term(
            $category_name,
            'category',
            array(
                'slug' => $category_slug,
                'description' => 'Conversations imported from Claude Code CLI',
            )
        );

        if (is_wp_error($result)) {
            // Fallback to uncategorized
            $this->category_id = 1;
        } else {
            $this->category_id = $result['term_id'];
        }

        return $this->category_id;
    }
}

/**
 * HTML Formatter for Claude conversations
 */
class Claude_HtmlFormatter {

    /**
     * Format a complete conversation as HTML
     *
     * @param array $conversation Parsed conversation data
     * @return string Formatted HTML
     */
    public function format(array $conversation): string {
        $html = '<div class="claude-conversation">';

        // Add metadata header
        if (isset($conversation['metadata'])) {
            $html .= $this->format_metadata($conversation['metadata']);
        }

        // Add messages
        if (isset($conversation['messages'])) {
            foreach ($conversation['messages'] as $message) {
                $html .= $this->format_message($message);
            }
        }

        // Add thinking blocks
        if (isset($conversation['thinking'])) {
            foreach ($conversation['thinking'] as $think) {
                $html .= $this->format_thinking($think);
            }
        }

        $html .= '</div>';

        return $html;
    }

    /**
     * Format metadata section
     *
     * @param array $meta Metadata array
     * @return string HTML header section
     */
    public function format_metadata(array $meta): string {
        $html = '<div class="claude-metadata">';

        if (!empty($meta['project'])) {
            $html .= sprintf(
                '<div class="claude-meta-item"><strong>Project:</strong> <span class="claude-project">%s</span></div>',
                esc_html(basename($meta['project']))
            );
        }

        if (!empty($meta['git_branch'])) {
            $html .= sprintf(
                '<div class="claude-meta-item"><strong>Branch:</strong> <span class="claude-branch">%s</span></div>',
                esc_html($meta['git_branch'])
            );
        }

        if (!empty($meta['start_time'])) {
            $html .= sprintf(
                '<div class="claude-meta-item"><strong>Started:</strong> <span class="claude-start">%s</span></div>',
                esc_html(date('Y-m-d H:i:s', $meta['start_time']))
            );
        }

        if (!empty($meta['end_time'])) {
            $html .= sprintf(
                '<div class="claude-meta-item"><strong>Ended:</strong> <span class="claude-end">%s</span></div>',
                esc_html(date('Y-m-d H:i:s', $meta['end_time']))
            );
        }

        $html .= '</div>';

        return $html;
    }

    /**
     * Format a single message
     *
     * @param array $msg Message array with role and content
     * @return string HTML formatted message
     */
    public function format_message(array $msg): string {
        $role = isset($msg['role']) ? $msg['role'] : 'unknown';
        $content = isset($msg['content']) ? $msg['content'] : '';

        // Apply role-based styling
        $class = 'claude-msg-' . esc_attr($role);

        $html = sprintf('<div class="%s">', $class);

        // Add role label
        $label = ucfirst($role);
        $html .= sprintf('<div class="claude-msg-role">%s</div>', esc_html($label));

        // Format content with code blocks and markdown
        $formatted_content = $this->format_code_blocks($content);
        $formatted_content = $this->format_markdown($formatted_content);

        $html .= sprintf('<div class="claude-msg-content">%s</div>', $formatted_content);

        $html .= '</div>';

        return $html;
    }

    /**
     * Format thinking block
     *
     * @param array $think Thinking block array
     * @return string HTML formatted thinking block
     */
    public function format_thinking(array $think): string {
        $content = isset($think['content']) ? $think['content'] : '';

        $html = '<blockquote class="claude-thinking">';
        $html .= '<span class="claude-thinking-icon">&#129504;</span> '; // Brain emoji
        $html .= '<strong>Thinking:</strong>';

        // Format content
        $formatted_content = $this->format_code_blocks($content);
        $formatted_content = $this->format_markdown($formatted_content);

        $html .= sprintf('<div class="claude-thinking-content">%s</div>', $formatted_content);
        $html .= '</blockquote>';

        return $html;
    }

    /**
     * Format code blocks in content
     * Converts ```language blocks to <pre><code class="language-X">
     * Converts inline `code` to <code>
     *
     * @param string $content Raw content
     * @return string Content with formatted code blocks
     */
    public function format_code_blocks(string $content): string {
        // First, handle fenced code blocks ```language\n...\n```
        $content = preg_replace_callback(
            '/```(\w*)\n(.*?)```/s',
            function ($matches) {
                $language = !empty($matches[1]) ? esc_attr($matches[1]) : 'plaintext';
                $code = esc_html($matches[2]);
                return sprintf('<pre><code class="language-%s">%s</code></pre>', $language, $code);
            },
            $content
        );

        // Then handle inline code `code`
        $content = preg_replace_callback(
            '/`([^`]+)`/',
            function ($matches) {
                return sprintf('<code class="claude-inline-code">%s</code>', esc_html($matches[1]));
            },
            $content
        );

        return $content;
    }

    /**
     * Format basic markdown elements
     * Converts **bold** and *italic*
     *
     * @param string $content Content with markdown
     * @return string HTML formatted content
     */
    public function format_markdown(string $content): string {
        // Bold: **text** or __text__
        $content = preg_replace('/\*\*(.+?)\*\*/', '<strong>$1</strong>', $content);
        $content = preg_replace('/__(.+?)__/', '<strong>$1</strong>', $content);

        // Italic: *text* or _text_ (but not if preceded by word char to avoid breaking snake_case)
        $content = preg_replace('/(?<![a-zA-Z0-9])\*(.+?)\*(?![a-zA-Z0-9])/', '<em>$1</em>', $content);
        $content = preg_replace('/(?<![a-zA-Z0-9])_(.+?)_(?![a-zA-Z0-9])/', '<em>$1</em>', $content);

        // Convert newlines to <br> for readability (but preserve pre blocks)
        // This is a simple approach - don't convert if inside <pre> tags
        $content = preg_replace('/(?<!<\/pre>)\n(?!<pre>)/', "<br>\n", $content);

        return $content;
    }

    /**
     * Get inline CSS for styling
     *
     * @return string CSS styles
     */
    public function get_css(): string {
        return <<<CSS
<style>
.claude-conversation {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    line-height: 1.6;
    color: #333;
}

.claude-metadata {
    background: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 15px;
    margin-bottom: 20px;
    font-size: 14px;
}

.claude-meta-item {
    margin-bottom: 5px;
}

.claude-meta-item:last-child {
    margin-bottom: 0;
}

.claude-msg-user {
    border-left: 4px solid #2271b1;
    background: #f0f6fc;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 0 4px 4px 0;
}

.claude-msg-assistant {
    border-left: 4px solid #00a32a;
    background: #edfaef;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 0 4px 4px 0;
}

.claude-msg-role {
    font-weight: bold;
    font-size: 12px;
    text-transform: uppercase;
    color: #666;
    margin-bottom: 8px;
}

.claude-msg-content {
    white-space: pre-wrap;
    word-wrap: break-word;
}

.claude-thinking {
    background: #fff8e5;
    border: 1px solid #ffb900;
    border-left: 4px solid #ffb900;
    padding: 15px;
    margin: 15px 0;
    border-radius: 4px;
    font-style: italic;
}

.claude-thinking-icon {
    font-size: 1.2em;
}

.claude-thinking-content {
    margin-top: 10px;
}

.claude-code,
.claude-conversation pre {
    background: #282c34;
    color: #abb2bf;
    padding: 15px;
    border-radius: 4px;
    overflow-x: auto;
    font-family: "Fira Code", "Consolas", "Monaco", monospace;
    font-size: 14px;
    line-height: 1.5;
}

.claude-conversation pre code {
    background: transparent;
    padding: 0;
    color: inherit;
}

.claude-inline-code {
    background: #f0f0f0;
    padding: 2px 6px;
    border-radius: 3px;
    font-family: "Fira Code", "Consolas", "Monaco", monospace;
    font-size: 0.9em;
    color: #c7254e;
}
</style>
CSS;
    }
}

/**
 * Enqueue Prism.js for syntax highlighting on Claude Conversation posts
 */
function claude_conversations_enqueue_prism() {
    // Only load on single posts
    if (!is_single()) {
        return;
    }

    // Get the current post
    $post = get_post();
    if (!$post) {
        return;
    }

    // Check if post has "Claude Conversations" category
    if (!has_category('Claude Conversations', $post)) {
        return;
    }

    // Enqueue Prism CSS (Tomorrow Night theme)
    wp_enqueue_style(
        'prism-css',
        'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css',
        array(),
        '1.29.0'
    );

    // Enqueue Prism JS core
    wp_enqueue_script(
        'prism-js',
        'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js',
        array(),
        '1.29.0',
        true
    );

    // Enqueue language components
    $languages = array('python', 'bash', 'javascript', 'rust');
    foreach ($languages as $lang) {
        wp_enqueue_script(
            "prism-js-{$lang}",
            "https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-{$lang}.min.js",
            array('prism-js'),
            '1.29.0',
            true
        );
    }

    // Add inline CSS for message styling
    $formatter = new Claude_HtmlFormatter();
    wp_add_inline_style('prism-css', $formatter->get_css());
}
add_action('wp_enqueue_scripts', 'claude_conversations_enqueue_prism');

// Initialize the plugin
new Claude_Conversations_Admin();
