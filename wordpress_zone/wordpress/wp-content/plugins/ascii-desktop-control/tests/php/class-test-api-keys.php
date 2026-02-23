<?php
/**
 * Unit tests for API_Keys class
 *
 * @package ASCII_Desktop_Control
 * @subpackage Tests
 */

declare(strict_types=1);

/**
 * Test API_Keys key management operations
 */
class Test_API_Keys {

	/**
	 * Test that generate() returns a 32-character alphanumeric string
	 */
	public function test_generate_returns_32_chars(): bool {
		$api_keys = new API_Keys();

		// Generate multiple keys to verify consistency
		for ( $i = 0; $i < 5; $i++ ) {
			$key = $api_keys->generate();

			// Check length is 32
			if ( strlen( $key ) !== 32 ) {
				echo "✗ test_generate_returns_32_chars: Key length is " . strlen( $key ) . ", expected 32\n";
				return false;
			}

			// Check alphanumeric only (no special chars)
			if ( ! preg_match( '/^[a-zA-Z0-9]+$/', $key ) ) {
				echo "✗ test_generate_returns_32_chars: Key contains non-alphanumeric characters\n";
				return false;
			}
		}

		echo "✓ test_generate_returns_32_chars: Returns 32-char alphanumeric key\n";
		return true;
	}

	/**
	 * Test that hash() returns a 64-character SHA256 hex string
	 */
	public function test_hash_is_sha256(): bool {
		$api_keys = new API_Keys();

		$test_key    = 'abcdefghij1234567890ABCDEFGH';
		$hash_result = $api_keys->hash( $test_key );

		// SHA256 produces 64-character hex string
		if ( strlen( $hash_result ) !== 64 ) {
			echo "✗ test_hash_is_sha256: Hash length is " . strlen( $hash_result ) . ", expected 64\n";
			return false;
		}

		// Check it's valid hex
		if ( ! preg_match( '/^[a-f0-9]+$/', $hash_result ) ) {
			echo "✗ test_hash_is_sha256: Hash contains non-hex characters\n";
			return false;
		}

		// Verify against known SHA256 hash (PHP hash function is deterministic)
		$expected_hash = hash( 'sha256', $test_key );
		if ( $hash_result !== $expected_hash ) {
			echo "✗ test_hash_is_sha256: Hash does not match expected SHA256 output\n";
			return false;
		}

		echo "✓ test_hash_is_sha256: Returns 64-char SHA256 hex string\n";
		return true;
	}

	/**
	 * Test that store() creates an entry in wp_options
	 */
	public function test_store_creates_entry(): bool {
		$api_keys = new API_Keys();

		// Generate and store a key
		$key      = $api_keys->generate();
		$key_hash = $api_keys->hash( $key );
		$name     = 'Test Key ' . time();

		$key_id = $api_keys->store( $name, $key_hash );

		// Verify key_id was returned (UUID format)
		if ( empty( $key_id ) ) {
			echo "✗ test_store_creates_entry: store() returned null or empty\n";
			return false;
		}

		// UUID format check (8-4-4-4-12 hex pattern)
		if ( ! preg_match( '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i', $key_id ) ) {
			echo "✗ test_store_creates_entry: Key ID is not UUID format\n";
			return false;
		}

		// Verify entry exists in wp_options
		$stored_keys = get_option( API_Keys::OPTION_NAME, [] );

		if ( ! isset( $stored_keys[ $key_id ] ) ) {
			echo "✗ test_store_creates_entry: Key not found in wp_options\n";
			return false;
		}

		// Verify stored data structure
		$stored_data = $stored_keys[ $key_id ];
		if ( ! isset( $stored_data['name'] ) || ! isset( $stored_data['hash'] ) || ! isset( $stored_data['created'] ) ) {
			echo "✗ test_store_creates_entry: Stored data missing required fields\n";
			return false;
		}

		if ( $stored_data['name'] !== $name ) {
			echo "✗ test_store_creates_entry: Stored name does not match\n";
			return false;
		}

		if ( $stored_data['hash'] !== $key_hash ) {
			echo "✗ test_store_creates_entry: Stored hash does not match\n";
			return false;
		}

		echo "✓ test_store_creates_entry: Creates entry with UUID and correct data\n";
		return true;
	}

	/**
	 * Test that validate() returns key data for valid key
	 */
	public function test_validate_returns_key_data(): bool {
		$api_keys = new API_Keys();

		// Generate, hash, and store a key
		$key      = $api_keys->generate();
		$key_hash = $api_keys->hash( $key );
		$name     = 'Validation Test Key ' . time();
		$key_id   = $api_keys->store( $name, $key_hash );

		// Validate the key
		$validated = $api_keys->validate( $key );

		if ( $validated === null ) {
			echo "✗ test_validate_returns_key_data: validate() returned null for valid key\n";
			return false;
		}

		// Check returned data structure
		if ( ! isset( $validated['id'] ) || ! isset( $validated['name'] ) || ! isset( $validated['created'] ) ) {
			echo "✗ test_validate_returns_key_data: Returned data missing required fields\n";
			return false;
		}

		if ( $validated['id'] !== $key_id ) {
			echo "✗ test_validate_returns_key_data: Returned ID does not match\n";
			return false;
		}

		if ( $validated['name'] !== $name ) {
			echo "✗ test_validate_returns_key_data: Returned name does not match\n";
			return false;
		}

		// Hash should NOT be in returned data (security)
		if ( isset( $validated['hash'] ) ) {
			echo "✗ test_validate_returns_key_data: Returned data should not contain hash\n";
			return false;
		}

		echo "✓ test_validate_returns_key_data: Returns key data without hash\n";
		return true;
	}

	/**
	 * Test that validate() returns null for invalid key
	 */
	public function test_validate_rejects_invalid(): bool {
		$api_keys = new API_Keys();

		// Test with completely invalid key
		$validated = $api_keys->validate( 'invalidkey123456789012345678' );

		if ( $validated !== null ) {
			echo "✗ test_validate_rejects_invalid: validate() returned data for invalid key\n";
			return false;
		}

		// Generate and store a valid key, then try wrong key
		$valid_key = $api_keys->generate();
		$key_hash  = $api_keys->hash( $valid_key );
		$api_keys->store( 'Test Key', $key_hash );

		// Try to validate with different key
		$wrong_key     = $api_keys->generate();
		$wrong_validated = $api_keys->validate( $wrong_key );

		if ( $wrong_validated !== null ) {
			echo "✗ test_validate_rejects_invalid: validate() returned data for wrong key\n";
			return false;
		}

		echo "✓ test_validate_rejects_invalid: Returns null for invalid key\n";
		return true;
	}

	/**
	 * Test that hash_equals() is used for timing-safe comparison
	 */
	public function test_hash_equals_timing_safe(): bool {
		$api_keys = new API_Keys();

		// Generate a key with specific length
		$key      = str_repeat( 'a', 32 );
		$key_hash = $api_keys->hash( $key );
		$api_keys->store( 'Timing Test Key', $key_hash );

		// Test 1: Valid key should validate
		$validated = $api_keys->validate( $key );
		if ( $validated === null ) {
			echo "✗ test_hash_equals_timing_safe: Valid key failed validation\n";
			return false;
		}

		// Test 2: Key with different length should fail gracefully
		// hash_equals handles different length strings safely
		$short_key     = str_repeat( 'a', 16 );
		$short_validated = $api_keys->validate( $short_key );
		if ( $short_validated !== null ) {
			echo "✗ test_hash_equals_timing_safe: Short key should not validate\n";
			return false;
		}

		// Test 3: Key with same length but different content should fail
		$different_key = str_repeat( 'b', 32 );
		$diff_validated = $api_keys->validate( $different_key );
		if ( $diff_validated !== null ) {
			echo "✗ test_hash_equals_timing_safe: Different key should not validate\n";
			return false;
		}

		// Verify the hash_equals function is being used by checking class source
		// (This is a structural test - we verify the method exists and behaves correctly)
		$reflection = new ReflectionMethod( 'API_Keys', 'validate' );
		$source     = file_get_contents( $reflection->getFileName() );

		if ( strpos( $source, 'hash_equals' ) === false ) {
			echo "✗ test_hash_equals_timing_safe: hash_equals not found in validate method\n";
			return false;
		}

		echo "✓ test_hash_equals_timing_safe: Uses hash_equals for timing-safe comparison\n";
		return true;
	}

	/**
	 * Test that revoke() removes a key from storage
	 */
	public function test_revoke_removes_key(): bool {
		$api_keys = new API_Keys();

		// Create a key to revoke
		$key      = $api_keys->generate();
		$key_hash = $api_keys->hash( $key );
		$key_id   = $api_keys->store( 'Key To Revoke', $key_hash );

		// Verify key exists before revoke
		$stored_keys = get_option( API_Keys::OPTION_NAME, [] );
		if ( ! isset( $stored_keys[ $key_id ] ) ) {
			echo "✗ test_revoke_removes_key: Key not stored before revoke test\n";
			return false;
		}

		// Revoke the key
		$result = $api_keys->revoke( $key_id );

		if ( $result !== true ) {
			echo "✗ test_revoke_removes_key: revoke() did not return true\n";
			return false;
		}

		// Verify key is gone from storage
		$stored_keys = get_option( API_Keys::OPTION_NAME, [] );
		if ( isset( $stored_keys[ $key_id ] ) ) {
			echo "✗ test_revoke_removes_key: Key still exists in storage after revoke\n";
			return false;
		}

		// Verify key no longer validates
		$validated = $api_keys->validate( $key );
		if ( $validated !== null ) {
			echo "✗ test_revoke_removes_key: Revoked key still validates\n";
			return false;
		}

		// Test revoking non-existent key returns false
		$fake_revoke = $api_keys->revoke( 'non-existent-uuid' );
		if ( $fake_revoke !== false ) {
			echo "✗ test_revoke_removes_key: Revoking non-existent key should return false\n";
			return false;
		}

		echo "✓ test_revoke_removes_key: Removes key and prevents validation\n";
		return true;
	}

	/**
	 * Test that update_last_used() updates the timestamp
	 */
	public function test_update_last_used(): bool {
		$api_keys = new API_Keys();

		// Create a key
		$key      = $api_keys->generate();
		$key_hash = $api_keys->hash( $key );
		$key_id   = $api_keys->store( 'Timestamp Test Key', $key_hash );

		// Verify last_used is null initially
		$stored_keys = get_option( API_Keys::OPTION_NAME, [] );
		if ( $stored_keys[ $key_id ]['last_used'] !== null ) {
			echo "✗ test_update_last_used: last_used should be null initially\n";
			return false;
		}

		// Wait a tiny bit to ensure timestamp difference
		usleep( 1000 );

		// Update last_used
		$api_keys->update_last_used( $key_id );

		// Verify last_used is now set
		$stored_keys = get_option( API_Keys::OPTION_NAME, [] );
		if ( $stored_keys[ $key_id ]['last_used'] === null ) {
			echo "✗ test_update_last_used: last_used should be set after update\n";
			return false;
		}

		// Verify it's a valid MySQL datetime format
		$last_used = $stored_keys[ $key_id ]['last_used'];
		if ( ! preg_match( '/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/', $last_used ) ) {
			echo "✗ test_update_last_used: last_used is not in MySQL datetime format\n";
			return false;
		}

		// Test updating non-existent key (should not throw)
		try {
			$api_keys->update_last_used( 'non-existent-uuid' );
			// Should silently fail, not throw exception
		} catch ( Exception $e ) {
			echo "✗ test_update_last_used: Should not throw for non-existent key\n";
			return false;
		}

		echo "✓ test_update_last_used: Updates timestamp in MySQL format\n";
		return true;
	}

	/**
	 * Run all tests
	 */
	public function run_all(): array {
		$results = [];

		$methods = get_class_methods( $this );
		foreach ( $methods as $method ) {
			if ( strpos( $method, 'test_' ) === 0 ) {
				try {
					$results[ $method ] = $this->$method();
				} catch ( Exception $e ) {
					$results[ $method ] = false;
					echo "✗ $method: " . $e->getMessage() . "\n";
				}
			}
		}

		return $results;
	}
}
