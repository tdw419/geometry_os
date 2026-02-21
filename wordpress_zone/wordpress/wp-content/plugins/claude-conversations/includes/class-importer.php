<?php
/**
 * Import Engine for Claude conversations
 *
 * @package Claude_Conversations
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Claude_Importer
 *
 * Imports Claude Code CLI conversations into WordPress posts.
 */
class Claude_Importer {

    /**
     * Category ID cache
     *
     * @var int|null
     */
    private $category_id = null;

    /**
     * Import all sessions from Claude directory
     *
     * @param string $claude_dir Base Claude directory (e.g., ~/.claude/projects/).
     * @return array Stats array with imported, skipped, errors counts.
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
     * @param string $filepath Path to JSONL file.
     * @param string $project Project name.
     * @return bool|string True on success, 'skipped' if duplicate, false on error.
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
     * @param string $session_id Session ID to search for.
     * @return int|false Post ID if found, false otherwise.
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
     * @param string $title Post title.
     * @param string $content Post content (HTML).
     * @param string $session_id Session ID.
     * @param string $project Project name.
     * @param array $metadata Additional metadata.
     * @return int|false Post ID on success, false on failure.
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
     * @return int Category ID.
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
