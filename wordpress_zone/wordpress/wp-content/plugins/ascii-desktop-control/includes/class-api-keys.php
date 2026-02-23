<?php
/**
 * API Keys class.
 *
 * Manages API key lifecycle: generate, store, validate, revoke.
 * Uses SHA256 hashing with timing-safe comparison.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class API_Keys
 *
 * Provides API key management for REST API authentication.
 */
class API_Keys {

    /**
     * WordPress option name for key storage.
     */
    public const OPTION_NAME = 'ascii_api_keys';

    /**
     * Generate a new 32-char alphanumeric API key.
     *
     * @return string Plain-text key (shown once to user).
     */
    public function generate(): string {
        return wp_generate_password(32, false);
    }

    /**
     * Hash a key using SHA256 for storage.
     *
     * @param string $key Plain-text key.
     * @return string SHA256 hash.
     */
    public function hash(string $key): string {
        return hash('sha256', $key);
    }

    /**
     * Store a new key with metadata.
     *
     * @param string $name     Key name/label.
     * @param string $key_hash Hashed key.
     * @return string|null Key ID or null on failure.
     */
    public function store(string $name, string $key_hash): ?string {
        $keys = get_option(self::OPTION_NAME, []);

        if (!is_array($keys)) {
            $keys = [];
        }

        $key_id = wp_generate_uuid4();

        $keys[$key_id] = [
            'id'        => $key_id,
            'name'      => sanitize_text_field($name),
            'hash'      => $key_hash,
            'created'   => current_time('mysql'),
            'last_used' => null,
        ];

        $updated = update_option(self::OPTION_NAME, $keys);

        return $updated ? $key_id : null;
    }

    /**
     * Validate an API key (timing-safe comparison).
     *
     * @param string $key Plain-text key to validate.
     * @return array|null Key data if valid, null otherwise.
     */
    public function validate(string $key): ?array {
        $keys = get_option(self::OPTION_NAME, []);

        // Handle empty or non-array option
        if (empty($keys) || !is_array($keys)) {
            return null;
        }

        $key_hash = $this->hash($key);

        foreach ($keys as $key_id => $key_data) {
            // Timing-safe comparison to prevent timing attacks
            if (isset($key_data['hash']) && hash_equals($key_data['hash'], $key_hash)) {
                // Return key data without the hash
                return [
                    'id'        => $key_data['id'],
                    'name'      => $key_data['name'],
                    'created'   => $key_data['created'],
                    'last_used' => $key_data['last_used'],
                ];
            }
        }

        return null;
    }

    /**
     * Update last_used timestamp for a key.
     *
     * @param string $key_id Key identifier.
     */
    public function update_last_used(string $key_id): void {
        $keys = get_option(self::OPTION_NAME, []);

        if (!is_array($keys) || !isset($keys[$key_id])) {
            return;
        }

        $keys[$key_id]['last_used'] = current_time('mysql');

        update_option(self::OPTION_NAME, $keys);
    }

    /**
     * Revoke/delete a key by ID.
     *
     * @param string $key_id Key identifier.
     * @return bool Success status.
     */
    public function revoke(string $key_id): bool {
        $keys = get_option(self::OPTION_NAME, []);

        if (!is_array($keys) || !isset($keys[$key_id])) {
            return false;
        }

        unset($keys[$key_id]);

        return update_option(self::OPTION_NAME, $keys);
    }

    /**
     * Get all stored keys (without hashes).
     *
     * @return array List of key metadata.
     */
    public function get_all(): array {
        $keys = get_option(self::OPTION_NAME, []);

        if (!is_array($keys)) {
            return [];
        }

        // Return keys without hash values for security
        return array_map(function ($key_data) {
            return [
                'id'        => $key_data['id'],
                'name'      => $key_data['name'],
                'created'   => $key_data['created'],
                'last_used' => $key_data['last_used'],
            ];
        }, array_values($keys));
    }
}
