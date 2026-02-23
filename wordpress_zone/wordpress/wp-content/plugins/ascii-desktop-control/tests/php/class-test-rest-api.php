<?php
/**
 * Unit tests for REST_API class
 *
 * @package ASCII_Desktop_Control
 * @subpackage Tests
 */

declare(strict_types=1);

/**
 * Test REST_API endpoint and authentication operations
 */
class Test_REST_API {

	/**
	 * Mock API_Keys instance.
	 */
	private $mock_api_keys;

	/**
	 * Mock ASCII_View instance.
	 */
	private $mock_ascii_view;

	/**
	 * Mock Daemon_Status instance.
	 */
	private $mock_daemon_status;

	/**
	 * Mock Directive_API instance.
	 */
	private $mock_directive_api;

	/**
	 * Valid test key for testing.
	 */
	private string $valid_key = 'testapikey12345678901234567890';

	/**
	 * Key data returned on validation.
	 */
	private array $key_data = [
		'id'      => 'test-uuid-1234',
		'name'    => 'Test Key',
		'created' => '2026-01-01 00:00:00',
	];

	/**
	 * Set up test fixtures.
	 */
	private function setup(): void {
		// Create mock objects
		$this->mock_api_keys      = new class( $this->valid_key, $this->key_data ) {
			private string $valid_key;
			private array $key_data;
			private array $last_used_updates = [];

			public function __construct( string $valid_key, array $key_data ) {
				$this->valid_key = $valid_key;
				$this->key_data  = $key_data;
			}

			public function validate( string $key ): ?array {
				if ( $key === $this->valid_key ) {
					return $this->key_data;
				}
				return null;
			}

			public function update_last_used( string $key_id ): void {
				$this->last_used_updates[] = $key_id;
			}

			public function get_last_used_updates(): array {
				return $this->last_used_updates;
			}
		};

		$this->mock_ascii_view = new class() {
			public function get_view( $width = null, $height = null ): array {
				return [
					'success'   => true,
					'ascii'     => 'test ascii grid',
					'bindings'  => [ 'a' => [ 'x' => 0, 'y' => 0 ] ],
					'mode'      => 'desktop',
					'timestamp' => '2026-02-22 12:00:00',
				];
			}
		};

		$this->mock_daemon_status = new class() {
			public function get_status(): array {
				return [
					'running'    => true,
					'pid'        => 12345,
					'last_check' => '2026-02-22 12:00:00',
				];
			}
		};

		$this->mock_directive_api = new class() {
			private int $next_id = 100;
			private array $directives = [];

			public function create( string $title, string $content ): array {
				$id                  = $this->next_id++;
				$this->directives[]  = [
					'id'      => $id,
					'title'   => $title,
					'content' => $content,
				];
				return [
					'success'  => true,
					'post_id'  => $id,
					'message'  => 'Directive created',
				];
			}

			public function get_recent( int $limit = 10 ): array {
				return [
					'directives' => array_slice( $this->directives, 0, $limit ),
					'total'      => count( $this->directives ),
					'count'      => min( $limit, count( $this->directives ) ),
				];
			}

			public function get( int $id ): array {
				foreach ( $this->directives as $directive ) {
					if ( $directive['id'] === $id ) {
						return [
							'success'   => true,
							'directive' => $directive,
						];
					}
				}
				return [
					'success' => false,
					'error'   => 'Directive not found',
				];
			}
		};
	}

	/**
	 * Create a mock WP_REST_Request for testing.
	 */
	private function create_mock_request( array $params = [], array $headers = [] ): object {
		return new class( $params, $headers ) {
			private array $params;
			private array $headers;

			public function __construct( array $params, array $headers ) {
				$this->params  = $params;
				$this->headers = $headers;
			}

			public function get_header( string $key ): ?string {
				return $this->headers[ $key ] ?? null;
			}

			public function get_param( string $key ) {
				return $this->params[ $key ] ?? null;
			}

			public function set_param( string $key, $value ): void {
				$this->params[ $key ] = $value;
			}
		};
	}

	/**
	 * Test that missing key returns 401 error.
	 */
	public function test_missing_key_returns_401(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Request with no auth at all
		$request  = $this->create_mock_request();
		$result   = $rest_api->authenticate_request( $request );

		// Should return WP_Error
		if ( ! is_wp_error( $result ) ) {
			echo "✗ test_missing_key_returns_401: Should return WP_Error\n";
			return false;
		}

		// Check error code
		if ( $result->get_error_code() !== 'rest_forbidden' ) {
			echo "✗ test_missing_key_returns_401: Error code should be 'rest_forbidden'\n";
			return false;
		}

		// Check error data for 401 status
		$error_data = $result->get_error_data();
		if ( ! isset( $error_data['status'] ) || $error_data['status'] !== 401 ) {
			echo "✗ test_missing_key_returns_401: Status should be 401\n";
			return false;
		}

		echo "✓ test_missing_key_returns_401: Returns 401 when no key provided\n";
		return true;
	}

	/**
	 * Test that invalid key returns 401 error.
	 */
	public function test_invalid_key_returns_401(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Request with invalid key in header
		$request  = $this->create_mock_request( [], [ 'X-API-Key' => 'wrongkey12345678901234567890' ] );
		$result   = $rest_api->authenticate_request( $request );

		// Should return WP_Error
		if ( ! is_wp_error( $result ) ) {
			echo "✗ test_invalid_key_returns_401: Should return WP_Error\n";
			return false;
		}

		// Check error code
		if ( $result->get_error_code() !== 'rest_forbidden' ) {
			echo "✗ test_invalid_key_returns_401: Error code should be 'rest_forbidden'\n";
			return false;
		}

		// Check error data for 401 status
		$error_data = $result->get_error_data();
		if ( ! isset( $error_data['status'] ) || $error_data['status'] !== 401 ) {
			echo "✗ test_invalid_key_returns_401: Status should be 401\n";
			return false;
		}

		echo "✓ test_invalid_key_returns_401: Returns 401 for invalid key\n";
		return true;
	}

	/**
	 * Test that valid key proceeds (returns true).
	 */
	public function test_valid_key_proceeds(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Request with valid key in header
		$request  = $this->create_mock_request( [], [ 'X-API-Key' => $this->valid_key ] );
		$result   = $rest_api->authenticate_request( $request );

		// Should return true (authenticated)
		if ( $result !== true ) {
			echo "✗ test_valid_key_proceeds: Should return true for valid key\n";
			return false;
		}

		// Check that key data was stored in request
		$key_data = $request->get_param( '_api_key_data' );
		if ( $key_data === null ) {
			echo "✗ test_valid_key_proceeds: Key data should be stored in request\n";
			return false;
		}

		if ( $key_data['id'] !== $this->key_data['id'] ) {
			echo "✗ test_valid_key_proceeds: Key data ID should match\n";
			return false;
		}

		echo "✓ test_valid_key_proceeds: Returns true for valid key\n";
		return true;
	}

	/**
	 * Test authentication via both header and query param.
	 */
	public function test_header_and_query_param_auth(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Test 1: Header auth
		$request1 = $this->create_mock_request( [], [ 'X-API-Key' => $this->valid_key ] );
		$result1  = $rest_api->authenticate_request( $request1 );

		if ( $result1 !== true ) {
			echo "✗ test_header_and_query_param_auth: Header auth should work\n";
			return false;
		}

		// Test 2: Query param auth
		$request2 = $this->create_mock_request( [ 'api_key' => $this->valid_key ] );
		$result2  = $rest_api->authenticate_request( $request2 );

		if ( $result2 !== true ) {
			echo "✗ test_header_and_query_param_auth: Query param auth should work\n";
			return false;
		}

		// Test 3: Header takes precedence over query param
		$request3 = $this->create_mock_request(
			[ 'api_key' => 'wrongkey12345678901234567890' ],
			[ 'X-API-Key' => $this->valid_key ]
		);
		$result3  = $rest_api->authenticate_request( $request3 );

		if ( $result3 !== true ) {
			echo "✗ test_header_and_query_param_auth: Header should take precedence\n";
			return false;
		}

		echo "✓ test_header_and_query_param_auth: Both header and query param work\n";
		return true;
	}

	/**
	 * Test GET /view endpoint response structure.
	 */
	public function test_get_view_endpoint(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		$request = $this->create_mock_request();
		$response = $rest_api->handle_get_view( $request );

		// Check response is WP_REST_Response
		if ( ! ( $response instanceof WP_REST_Response ) ) {
			echo "✗ test_get_view_endpoint: Should return WP_REST_Response\n";
			return false;
		}

		// Check status code
		if ( $response->get_status() !== 200 ) {
			echo "✗ test_get_view_endpoint: Status should be 200\n";
			return false;
		}

		// Check response data structure
		$data = $response->get_data();
		if ( ! isset( $data['success'] ) || $data['success'] !== true ) {
			echo "✗ test_get_view_endpoint: success should be true\n";
			return false;
		}

		if ( ! isset( $data['data']['ascii'] ) ) {
			echo "✗ test_get_view_endpoint: Should contain ascii in data\n";
			return false;
		}

		if ( ! isset( $data['data']['bindings'] ) ) {
			echo "✗ test_get_view_endpoint: Should contain bindings in data\n";
			return false;
		}

		if ( ! isset( $data['data']['mode'] ) ) {
			echo "✗ test_get_view_endpoint: Should contain mode in data\n";
			return false;
		}

		if ( ! isset( $data['data']['timestamp'] ) ) {
			echo "✗ test_get_view_endpoint: Should contain timestamp in data\n";
			return false;
		}

		echo "✓ test_get_view_endpoint: Returns correct response structure\n";
		return true;
	}

	/**
	 * Test GET /status endpoint response structure.
	 */
	public function test_get_status_endpoint(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		$request = $this->create_mock_request();
		$response = $rest_api->handle_get_status( $request );

		// Check response is WP_REST_Response
		if ( ! ( $response instanceof WP_REST_Response ) ) {
			echo "✗ test_get_status_endpoint: Should return WP_REST_Response\n";
			return false;
		}

		// Check status code
		if ( $response->get_status() !== 200 ) {
			echo "✗ test_get_status_endpoint: Status should be 200\n";
			return false;
		}

		// Check response data structure
		$data = $response->get_data();
		if ( ! isset( $data['success'] ) || $data['success'] !== true ) {
			echo "✗ test_get_status_endpoint: success should be true\n";
			return false;
		}

		if ( ! isset( $data['data']['running'] ) ) {
			echo "✗ test_get_status_endpoint: Should contain running in data\n";
			return false;
		}

		if ( ! isset( $data['data']['pid'] ) ) {
			echo "✗ test_get_status_endpoint: Should contain pid in data\n";
			return false;
		}

		if ( ! isset( $data['data']['checked_at'] ) ) {
			echo "✗ test_get_status_endpoint: Should contain checked_at in data\n";
			return false;
		}

		echo "✓ test_get_status_endpoint: Returns correct response structure\n";
		return true;
	}

	/**
	 * Test POST /directives endpoint with 201 response.
	 */
	public function test_create_directive_endpoint(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Test with required fields
		$request = $this->create_mock_request( [
			'title'   => 'Test Directive',
			'content' => 'Test content for directive',
		] );
		$response = $rest_api->handle_create_directive( $request );

		// Check response is WP_REST_Response
		if ( ! ( $response instanceof WP_REST_Response ) ) {
			echo "✗ test_create_directive_endpoint: Should return WP_REST_Response\n";
			return false;
		}

		// Check status code is 201 Created
		if ( $response->get_status() !== 201 ) {
			echo "✗ test_create_directive_endpoint: Status should be 201\n";
			return false;
		}

		// Check response data structure
		$data = $response->get_data();
		if ( ! isset( $data['success'] ) || $data['success'] !== true ) {
			echo "✗ test_create_directive_endpoint: success should be true\n";
			return false;
		}

		if ( ! isset( $data['data']['id'] ) ) {
			echo "✗ test_create_directive_endpoint: Should contain id in data\n";
			return false;
		}

		// Test missing title returns 400
		$request2 = $this->create_mock_request( [ 'content' => 'Test content' ] );
		$response2 = $rest_api->handle_create_directive( $request2 );

		if ( $response2->get_status() !== 400 ) {
			echo "✗ test_create_directive_endpoint: Missing title should return 400\n";
			return false;
		}

		// Test missing content returns 400
		$request3 = $this->create_mock_request( [ 'title' => 'Test Title' ] );
		$response3 = $rest_api->handle_create_directive( $request3 );

		if ( $response3->get_status() !== 400 ) {
			echo "✗ test_create_directive_endpoint: Missing content should return 400\n";
			return false;
		}

		echo "✓ test_create_directive_endpoint: Returns 201 with valid data, 400 for missing fields\n";
		return true;
	}

	/**
	 * Test GET /directives pagination with limit param.
	 */
	public function test_list_directives_pagination(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Test 1: Default limit
		$request1 = $this->create_mock_request();
		$response1 = $rest_api->handle_list_directives( $request1 );

		if ( $response1->get_status() !== 200 ) {
			echo "✗ test_list_directives_pagination: Default request should return 200\n";
			return false;
		}

		$data1 = $response1->get_data();
		if ( ! isset( $data1['data']['directives'] ) ) {
			echo "✗ test_list_directives_pagination: Should contain directives array\n";
			return false;
		}

		if ( ! isset( $data1['data']['total'] ) || ! isset( $data1['data']['count'] ) ) {
			echo "✗ test_list_directives_pagination: Should contain total and count\n";
			return false;
		}

		// Test 2: Custom limit
		$request2 = $this->create_mock_request( [ 'limit' => 5 ] );
		$response2 = $rest_api->handle_list_directives( $request2 );

		if ( $response2->get_status() !== 200 ) {
			echo "✗ test_list_directives_pagination: Custom limit should return 200\n";
			return false;
		}

		// Test 3: Limit > 100 should clamp to 100
		$request3 = $this->create_mock_request( [ 'limit' => 200 ] );
		$response3 = $rest_api->handle_list_directives( $request3 );

		if ( $response3->get_status() !== 200 ) {
			echo "✗ test_list_directives_pagination: Large limit should return 200\n";
			return false;
		}

		// Test 4: Limit < 1 should default to 10
		$request4 = $this->create_mock_request( [ 'limit' => 0 ] );
		$response4 = $rest_api->handle_list_directives( $request4 );

		if ( $response4->get_status() !== 200 ) {
			echo "✗ test_list_directives_pagination: Zero limit should return 200\n";
			return false;
		}

		// Test 5: Non-numeric limit should return 400
		$request5 = $this->create_mock_request( [ 'limit' => 'abc' ] );
		$response5 = $rest_api->handle_list_directives( $request5 );

		if ( $response5->get_status() !== 400 ) {
			echo "✗ test_list_directives_pagination: Non-numeric limit should return 400\n";
			return false;
		}

		echo "✓ test_list_directives_pagination: Limit param handled correctly\n";
		return true;
	}

	/**
	 * Test GET /directives/{id} returns 404 for non-existent ID.
	 */
	public function test_get_directive_404(): bool {
		$this->setup();

		$rest_api = new REST_API(
			$this->mock_api_keys,
			$this->mock_ascii_view,
			$this->mock_daemon_status,
			$this->mock_directive_api
		);

		// Test with non-existent ID
		$request = $this->create_mock_request( [ 'id' => 99999 ] );
		$response = $rest_api->handle_get_directive( $request );

		// Check status code is 404
		if ( $response->get_status() !== 404 ) {
			echo "✗ test_get_directive_404: Non-existent ID should return 404\n";
			return false;
		}

		// Check error structure
		$data = $response->get_data();
		if ( ! isset( $data['success'] ) || $data['success'] !== false ) {
			echo "✗ test_get_directive_404: success should be false\n";
			return false;
		}

		if ( ! isset( $data['error'] ) ) {
			echo "✗ test_get_directive_404: Should contain error message\n";
			return false;
		}

		// Test invalid ID (non-numeric)
		$request2 = $this->create_mock_request( [ 'id' => 'invalid' ] );
		$response2 = $rest_api->handle_get_directive( $request2 );

		if ( $response2->get_status() !== 400 ) {
			echo "✗ test_get_directive_404: Invalid ID should return 400\n";
			return false;
		}

		echo "✓ test_get_directive_404: Returns 404 for non-existent, 400 for invalid ID\n";
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
