<?php
/**
 * Directive API class for CPT CRUD operations.
 *
 * Handles create, read, update operations for directive custom post type.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Directive_API
 *
 * CRUD operations for directive custom post type.
 */
class Directive_API {

    /**
     * Directive CPT slug.
     */
    public const CPT_SLUG = 'ascii_directive';

    /**
     * Default status for new directives.
     */
    public const DEFAULT_STATUS = 'pending';

    /**
     * Valid directive statuses.
     */
    public const VALID_STATUSES = [
        'pending',
        'processing',
        'completed',
        'failed',
    ];

    /**
     * Create a new directive.
     *
     * @param string $title   Directive title.
     * @param string $content Directive content/instruction.
     * @return array Result with success status and post_id or error.
     */
    public function create(string $title, string $content): array {
        // Validate inputs
        if (empty($title)) {
            return [
                'success' => false,
                'error' => 'Title is required',
                'post_id' => 0,
            ];
        }

        if (empty($content)) {
            return [
                'success' => false,
                'error' => 'Content is required',
                'post_id' => 0,
            ];
        }

        // Check for duplicate pending directive with same title
        $duplicate = $this->check_duplicate($title);
        if ($duplicate !== false) {
            return [
                'success' => false,
                'error' => sprintf(
                    'Duplicate directive: A pending directive with this title already exists (ID: %d)',
                    $duplicate
                ),
                'post_id' => $duplicate,
                'is_duplicate' => true,
            ];
        }

        // Create the post
        $post_data = [
            'post_title'   => sanitize_text_field($title),
            'post_content' => sanitize_textarea_field($content),
            'post_type'    => self::CPT_SLUG,
            'post_status'  => 'publish', // CPT is always published, status tracked in meta
            'post_author'  => get_current_user_id(),
        ];

        $post_id = wp_insert_post($post_data, true);

        if (is_wp_error($post_id)) {
            return [
                'success' => false,
                'error' => $post_id->get_error_message(),
                'post_id' => 0,
            ];
        }

        // Set initial status in post meta
        update_post_meta($post_id, '_directive_status', self::DEFAULT_STATUS);
        update_post_meta($post_id, '_directive_created', current_time('mysql'));
        update_post_meta($post_id, '_directive_result', '');

        return [
            'success' => true,
            'post_id' => $post_id,
            'message' => 'Directive created successfully',
        ];
    }

    /**
     * Check for duplicate pending directive with same title.
     *
     * @param string $title Title to check.
     * @return int|false Post ID if duplicate found, false otherwise.
     */
    private function check_duplicate(string $title) {
        $args = [
            'post_type'      => self::CPT_SLUG,
            'post_status'    => 'publish',
            'title'          => $title,
            'posts_per_page' => 1,
            'fields'         => 'ids',
            'meta_query'     => [
                [
                    'key'   => '_directive_status',
                    'value' => 'pending',
                ],
            ],
        ];

        $query = new WP_Query($args);

        if ($query->have_posts()) {
            return $query->posts[0];
        }

        return false;
    }

    /**
     * Get recent directives.
     *
     * @param int $limit Number of directives to retrieve (default 10).
     * @return array List of directives with metadata.
     */
    public function get_recent(int $limit = 10): array {
        $args = [
            'post_type'      => self::CPT_SLUG,
            'post_status'    => 'publish',
            'posts_per_page' => $limit,
            'orderby'        => 'date',
            'order'          => 'DESC',
        ];

        $query = new WP_Query($args);
        $directives = [];

        if ($query->have_posts()) {
            while ($query->have_posts()) {
                $query->the_post();
                $post_id = get_the_ID();

                $directives[] = $this->format_directive($post_id);
            }
            wp_reset_postdata();
        }

        return [
            'success' => true,
            'directives' => $directives,
            'total' => $query->found_posts,
            'count' => count($directives),
        ];
    }

    /**
     * Get directive logs with filtering.
     *
     * @param array $filters Optional filters:
     *                       - status: string (pending, processing, completed, failed)
     *                       - date_from: string (Y-m-d format)
     *                       - date_to: string (Y-m-d format)
     *                       - search: string (search in title/content)
     *                       - page: int (pagination, default 1)
     *                       - per_page: int (items per page, default 20)
     * @return array Filtered logs with pagination info.
     */
    public function get_logs(array $filters = []): array {
        $defaults = [
            'status'    => '',
            'date_from' => '',
            'date_to'   => '',
            'search'    => '',
            'page'      => 1,
            'per_page'  => 20,
        ];

        $filters = wp_parse_args($filters, $defaults);
        $per_page = max(1, min(100, (int) $filters['per_page']));
        $page = max(1, (int) $filters['page']);

        $args = [
            'post_type'      => self::CPT_SLUG,
            'post_status'    => 'publish',
            'posts_per_page' => $per_page,
            'paged'          => $page,
            'orderby'        => 'date',
            'order'          => 'DESC',
        ];

        // Status filter via meta query
        if (!empty($filters['status']) && in_array($filters['status'], self::VALID_STATUSES, true)) {
            $args['meta_query'] = [
                [
                    'key'   => '_directive_status',
                    'value' => $filters['status'],
                ],
            ];
        }

        // Date range filter
        if (!empty($filters['date_from']) || !empty($filters['date_to'])) {
            $date_query = [];

            if (!empty($filters['date_from'])) {
                $date_query['after'] = $filters['date_from'] . ' 00:00:00';
            }

            if (!empty($filters['date_to'])) {
                $date_query['before'] = $filters['date_to'] . ' 23:59:59';
            }

            $date_query['inclusive'] = true;
            $args['date_query'] = [$date_query];
        }

        // Search filter
        if (!empty($filters['search'])) {
            $args['s'] = sanitize_text_field($filters['search']);
        }

        $query = new WP_Query($args);
        $logs = [];

        if ($query->have_posts()) {
            while ($query->have_posts()) {
                $query->the_post();
                $post_id = get_the_ID();

                $logs[] = $this->format_directive($post_id);
            }
            wp_reset_postdata();
        }

        return [
            'success'    => true,
            'logs'       => $logs,
            'total'      => $query->found_posts,
            'page'       => $page,
            'per_page'   => $per_page,
            'total_pages' => $query->max_num_pages,
        ];
    }

    /**
     * Update directive status and result.
     *
     * @param int    $post_id Directive post ID.
     * @param string $status  New status (pending, processing, completed, failed).
     * @param string $result  Optional result/message from execution.
     * @return array Result with success status.
     */
    public function update_status(int $post_id, string $status, string $result = ''): array {
        // Verify post exists and is correct type
        $post = get_post($post_id);

        if (!$post || $post->post_type !== self::CPT_SLUG) {
            return [
                'success' => false,
                'error' => 'Invalid directive ID',
            ];
        }

        // Validate status
        if (!in_array($status, self::VALID_STATUSES, true)) {
            return [
                'success' => false,
                'error' => sprintf(
                    'Invalid status. Valid statuses: %s',
                    implode(', ', self::VALID_STATUSES)
                ),
            ];
        }

        // Update status
        update_post_meta($post_id, '_directive_status', $status);
        update_post_meta($post_id, '_directive_updated', current_time('mysql'));

        // Update result if provided
        if (!empty($result)) {
            update_post_meta($post_id, '_directive_result', sanitize_textarea_field($result));
        }

        return [
            'success' => true,
            'post_id' => $post_id,
            'status'  => $status,
            'message' => 'Status updated successfully',
        ];
    }

    /**
     * Get a single directive by ID.
     *
     * @param int $post_id Directive post ID.
     * @return array Directive data or error.
     */
    public function get(int $post_id): array {
        $post = get_post($post_id);

        if (!$post || $post->post_type !== self::CPT_SLUG) {
            return [
                'success' => false,
                'error' => 'Directive not found',
            ];
        }

        return [
            'success'   => true,
            'directive' => $this->format_directive($post_id),
        ];
    }

    /**
     * Delete a directive.
     *
     * @param int  $post_id  Directive post ID.
     * @param bool $force_delete Whether to bypass trash (default true).
     * @return array Result with success status.
     */
    public function delete(int $post_id, bool $force_delete = true): array {
        $post = get_post($post_id);

        if (!$post || $post->post_type !== self::CPT_SLUG) {
            return [
                'success' => false,
                'error' => 'Invalid directive ID',
            ];
        }

        $deleted = wp_delete_post($post_id, $force_delete);

        if (!$deleted || is_wp_error($deleted)) {
            return [
                'success' => false,
                'error' => 'Failed to delete directive',
            ];
        }

        return [
            'success' => true,
            'post_id' => $post_id,
            'message' => 'Directive deleted successfully',
        ];
    }

    /**
     * Format directive data for API response.
     *
     * @param int $post_id Post ID.
     * @return array Formatted directive data.
     */
    private function format_directive(int $post_id): array {
        $post = get_post($post_id);

        return [
            'id'         => $post_id,
            'title'      => $post->post_title,
            'content'    => $post->post_content,
            'status'     => get_post_meta($post_id, '_directive_status', true) ?: self::DEFAULT_STATUS,
            'result'     => get_post_meta($post_id, '_directive_result', true) ?: '',
            'created'    => get_post_meta($post_id, '_directive_created', true) ?: $post->post_date,
            'updated'    => get_post_meta($post_id, '_directive_updated', true) ?: '',
            'author'     => get_the_author_meta('display_name', $post->post_author),
            'author_id'  => (int) $post->post_author,
            'edit_link'  => get_edit_post_link($post_id, 'raw'),
        ];
    }

    /**
     * Get count of directives by status.
     *
     * @return array Counts by status.
     */
    public function get_status_counts(): array {
        $counts = [
            'total' => 0,
        ];

        foreach (self::VALID_STATUSES as $status) {
            $args = [
                'post_type'      => self::CPT_SLUG,
                'post_status'    => 'publish',
                'posts_per_page' => -1,
                'fields'         => 'ids',
                'meta_query'     => [
                    [
                        'key'   => '_directive_status',
                        'value' => $status,
                    ],
                ],
            ];

            $query = new WP_Query($args);
            $counts[$status] = $query->found_posts;
            $counts['total'] += $query->found_posts;
        }

        return $counts;
    }

    /**
     * Clean up old logs based on retention setting.
     *
     * @param int $retention_days Number of days to keep logs.
     * @return array Deletion result.
     */
    public function cleanup_old_logs(int $retention_days = 30): array {
        if ($retention_days < 1) {
            return [
                'success' => false,
                'error' => 'Retention days must be at least 1',
            ];
        }

        $cutoff_date = date('Y-m-d H:i:s', strtotime("-{$retention_days} days"));

        $args = [
            'post_type'      => self::CPT_SLUG,
            'post_status'    => 'publish',
            'posts_per_page' => -1,
            'fields'         => 'ids',
            'date_query'     => [
                [
                    'before'    => $cutoff_date,
                    'inclusive' => true,
                ],
            ],
            // Only delete completed or failed directives
            'meta_query' => [
                [
                    'key'     => '_directive_status',
                    'value'   => ['completed', 'failed'],
                    'compare' => 'IN',
                ],
            ],
        ];

        $query = new WP_Query($args);
        $deleted_count = 0;

        if ($query->have_posts()) {
            foreach ($query->posts as $post_id) {
                $deleted = wp_delete_post($post_id, true);
                if ($deleted && !is_wp_error($deleted)) {
                    $deleted_count++;
                }
            }
        }

        return [
            'success'       => true,
            'deleted_count' => $deleted_count,
            'cutoff_date'   => $cutoff_date,
            'message'       => sprintf('Deleted %d old directives', $deleted_count),
        ];
    }
}
