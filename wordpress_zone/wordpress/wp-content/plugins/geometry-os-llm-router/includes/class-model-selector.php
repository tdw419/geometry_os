<?php
/**
 * Model Selector
 *
 * Provides UI and logic for selecting LLM models.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Geometry_OS_Model_Selector
 *
 * Manages model selection and configuration.
 */
class Geometry_OS_Model_Selector
{
    /**
     * Available Claude models
     *
     * @var array
     */
    private static $claude_models = [
        'claude-opus-4-20250514' => [
            'name'        => 'Claude Opus 4',
            'description' => 'Most powerful model for complex tasks',
            'context'     => 200000,
            'tier'        => 'premium',
        ],
        'claude-sonnet-4-20250514' => [
            'name'        => 'Claude Sonnet 4',
            'description' => 'Balanced performance and speed',
            'context'     => 200000,
            'tier'        => 'standard',
        ],
        'claude-haiku-4-20250514' => [
            'name'        => 'Claude Haiku 4',
            'description' => 'Fastest model for simple tasks',
            'context'     => 200000,
            'tier'        => 'economy',
        ],
    ];

    /**
     * Available local models
     *
     * @var array
     */
    private static $local_models = [
        'lm-studio-local' => [
            'name'        => 'LM Studio',
            'description' => 'Local inference via LM Studio',
            'context'     => null, // Varies by model
            'tier'        => 'local',
        ],
        'ollama-local' => [
            'name'        => 'Ollama',
            'description' => 'Local inference via Ollama',
            'context'     => null, // Varies by model
            'tier'        => 'local',
        ],
    ];

    /**
     * Get all available models
     *
     * @return array All models grouped by provider
     */
    public static function get_all_models()
    {
        return [
            'claude' => self::$claude_models,
            'local'  => self::$local_models,
        ];
    }

    /**
     * Get Claude models
     *
     * @return array Claude models
     */
    public static function get_claude_models()
    {
        return self::$claude_models;
    }

    /**
     * Get local models
     *
     * @return array Local models
     */
    public static function get_local_models()
    {
        return self::$local_models;
    }

    /**
     * Get model info
     *
     * @param string $model_id Model identifier
     * @return array|null Model info or null if not found
     */
    public static function get_model_info($model_id)
    {
        $all = self::get_all_models();

        foreach ($all as $provider => $models) {
            if (isset($models[$model_id])) {
                return array_merge(
                    ['id' => $model_id, 'provider' => $provider],
                    $models[$model_id]
                );
            }
        }

        return null;
    }

    /**
     * Get primary model
     *
     * @return string Model ID
     */
    public static function get_primary_model()
    {
        return get_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514');
    }

    /**
     * Get fallback model
     *
     * @return string Model ID
     */
    public static function get_fallback_model()
    {
        return get_option('geometry_os_llm_router_fallback_model', 'lm-studio-local');
    }

    /**
     * Set primary model
     *
     * @param string $model_id Model ID
     * @return bool True if updated successfully
     */
    public static function set_primary_model($model_id)
    {
        $info = self::get_model_info($model_id);

        if (!$info) {
            return false;
        }

        return update_option('geometry_os_llm_router_primary_model', $model_id);
    }

    /**
     * Set fallback model
     *
     * @param string $model_id Model ID
     * @return bool True if updated successfully
     */
    public static function set_fallback_model($model_id)
    {
        $info = self::get_model_info($model_id);

        if (!$info) {
            return false;
        }

        return update_option('geometry_os_llm_router_fallback_model', $model_id);
    }

    /**
     * Check if fallback is enabled
     *
     * @return bool
     */
    public static function is_fallback_enabled()
    {
        return (bool) get_option('geometry_os_llm_router_fallback_enabled', true);
    }

    /**
     * Set fallback enabled state
     *
     * @param bool $enabled Whether fallback should be enabled
     * @return bool
     */
    public static function set_fallback_enabled($enabled)
    {
        return update_option('geometry_os_llm_router_fallback_enabled', (bool) $enabled);
    }

    /**
     * Validate model ID
     *
     * @param string $model_id Model ID to validate
     * @return bool True if model ID is valid
     */
    public static function is_valid_model($model_id)
    {
        return self::get_model_info($model_id) !== null;
    }

    /**
     * Get model display name
     *
     * @param string $model_id Model ID
     * @return string Display name
     */
    public static function get_model_name($model_id)
    {
        $info = self::get_model_info($model_id);
        return $info['name'] ?? $model_id;
    }

    /**
     * Render model selection dropdown
     *
     * @param string $name Field name
     * @param string $selected Currently selected model ID
     * @param string $type Filter by type (claude, local, or all)
     * @param array $args Additional arguments
     * @return string HTML select element
     */
    public static function render_select($name, $selected = '', $type = 'all', $args = [])
    {
        $defaults = [
            'id' => $name,
            'class' => 'regular-text',
            'disabled' => false,
        ];

        $args = wp_parse_args($args, $defaults);

        $models = self::get_all_models();

        $html = sprintf(
            '<select name="%s" id="%s" class="%s"%s>',
            esc_attr($name),
            esc_attr($args['id']),
            esc_attr($args['class']),
            $args['disabled'] ? ' disabled' : ''
        );

        foreach ($models as $provider => $provider_models) {
            if ($type !== 'all' && $type !== $provider) {
                continue;
            }

            $label = $provider === 'claude' ? __('Claude API Models', 'geometry-os-llm-router')
                                            : __('Local Models', 'geometry-os-llm-router');

            $html .= sprintf('<optgroup label="%s">', esc_html($label));

            foreach ($provider_models as $model_id => $model_info) {
                $label = sprintf(
                    '%s (%s)',
                    $model_info['name'],
                    $model_info['description']
                );

                $html .= sprintf(
                    '<option value="%s"%s>%s</option>',
                    esc_attr($model_id),
                    selected($selected, $model_id, false),
                    esc_html($label)
                );
            }

            $html .= '</optgroup>';
        }

        $html .= '</select>';

        return $html;
    }

    /**
     * Get model capabilities
     *
     * Returns capabilities for a given model like:
     * - max_tokens
     * - supports_vision
     * - supports_tools
     *
     * @param string $model_id Model ID
     * @return array Model capabilities
     */
    public static function get_model_capabilities($model_id)
    {
        $capabilities = [
            'claude-opus-4-20250514' => [
                'max_tokens' => 8192,
                'supports_vision' => true,
                'supports_tools' => true,
            ],
            'claude-sonnet-4-20250514' => [
                'max_tokens' => 8192,
                'supports_vision' => true,
                'supports_tools' => true,
            ],
            'claude-haiku-4-20250514' => [
                'max_tokens' => 8192,
                'supports_vision' => true,
                'supports_tools' => false,
            ],
        ];

        return $capabilities[$model_id] ?? [
            'max_tokens' => 4096,
            'supports_vision' => false,
            'supports_tools' => false,
        ];
    }
}
