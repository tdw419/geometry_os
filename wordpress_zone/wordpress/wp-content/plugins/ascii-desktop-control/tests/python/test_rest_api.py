#!/usr/bin/env python3
"""
End-to-End Tests for ASCII Desktop Control REST API

Tests the full REST API stack with API key authentication.
Requires a running WordPress instance with the plugin active.

Setup:
1. Generate an API key via WP-CLI or admin UI
2. Run: python3 test_rest_api.py --url http://localhost:8080 --key YOUR_API_KEY

Or via pytest:
   pytest test_rest_api.py -v --url http://localhost:8080 --key YOUR_API_KEY
"""

import argparse
import json
import sys
import unittest
from typing import Optional, Dict, Any

try:
    import requests
except ImportError:
    print("Error: 'requests' library required. Install with: pip install requests")
    sys.exit(1)


class RESTAPIClient:
    """Client for ASCII Desktop Control REST API"""

    def __init__(self, base_url: str, api_key: str):
        self.base_url = base_url.rstrip('/')
        self.api_key = api_key
        self.namespace = 'ascii/v1'

    def _headers(self) -> Dict[str, str]:
        """Get auth headers"""
        return {
            'X-API-Key': self.api_key,
            'Content-Type': 'application/json'
        }

    def _url(self, endpoint: str) -> str:
        """Build full URL"""
        return f"{self.base_url}/wp-json/{self.namespace}/{endpoint}"

    def get_view(self, width: Optional[int] = None, height: Optional[int] = None) -> requests.Response:
        """GET /ascii/v1/view - Get ASCII grid and bindings"""
        params = {}
        if width:
            params['width'] = width
        if height:
            params['height'] = height
        return requests.get(self._url('view'), headers=self._headers(), params=params, timeout=30)

    def get_status(self) -> requests.Response:
        """GET /ascii/v1/status - Get daemon status"""
        return requests.get(self._url('status'), headers=self._headers(), timeout=30)

    def create_directive(self, title: str, content: str) -> requests.Response:
        """POST /ascii/v1/directives - Create new directive"""
        return requests.post(
            self._url('directives'),
            headers=self._headers(),
            json={'title': title, 'content': content},
            timeout=30
        )

    def list_directives(self, limit: int = 10) -> requests.Response:
        """GET /ascii/v1/directives - List recent directives"""
        return requests.get(
            self._url('directives'),
            headers=self._headers(),
            params={'limit': limit},
            timeout=30
        )

    def get_directive(self, directive_id: int) -> requests.Response:
        """GET /ascii/v1/directives/{id} - Get single directive"""
        return requests.get(
            self._url(f'directives/{directive_id}'),
            headers=self._headers(),
            timeout=30
        )

    # Without auth for testing rejection
    def get_view_no_auth(self) -> requests.Response:
        """GET /ascii/v1/view without authentication"""
        return requests.get(self._url('view'), timeout=30)

    def get_view_invalid_key(self, invalid_key: str = 'invalid_key_12345') -> requests.Response:
        """GET /ascii/v1/view with invalid key"""
        return requests.get(
            self._url('view'),
            headers={'X-API-Key': invalid_key},
            timeout=30
        )

    def get_view_query_param_auth(self) -> requests.Response:
        """GET /ascii/v1/view with api_key query param"""
        return requests.get(
            self._url('view'),
            params={'api_key': self.api_key},
            timeout=30
        )


class TestRESTAPI(unittest.TestCase):
    """End-to-end REST API tests"""

    @classmethod
    def setUpClass(cls):
        """Initialize client from class attributes (set by main())"""
        if not hasattr(cls, 'base_url') or not hasattr(cls, 'api_key'):
            raise ValueError("base_url and api_key must be set via setUpClass")

        cls.client = RESTAPIClient(cls.base_url, cls.api_key)
        cls.created_directive_id = None

    def test_01_invalid_key_rejection(self):
        """Test that invalid API key returns 401"""
        response = self.client.get_view_invalid_key()

        self.assertEqual(response.status_code, 401,
                        f"Expected 401 for invalid key, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertIn('code', data)
        self.assertEqual(data['code'], 'rest_forbidden')

    def test_02_missing_key_rejection(self):
        """Test that missing API key returns 401"""
        response = self.client.get_view_no_auth()

        self.assertEqual(response.status_code, 401,
                        f"Expected 401 for missing key, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertIn('code', data)
        self.assertEqual(data['code'], 'rest_forbidden')

    def test_03_query_param_auth(self):
        """Test authentication via query param"""
        response = self.client.get_view_query_param_auth()

        self.assertEqual(response.status_code, 200,
                        f"Expected 200 for query param auth, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertTrue(data.get('success', False))

    def test_04_get_view(self):
        """Test GET /ascii/v1/view returns ASCII grid"""
        response = self.client.get_view()

        self.assertEqual(response.status_code, 200,
                        f"Expected 200, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertTrue(data.get('success', False), "Response should have success=true")

        # Check expected data structure
        self.assertIn('data', data)
        result_data = data['data']
        self.assertIn('ascii', result_data)
        self.assertIn('bindings', result_data)
        self.assertIn('mode', result_data)
        self.assertIn('timestamp', result_data)

        # ASCII should be a string
        self.assertIsInstance(result_data['ascii'], str)

        # Bindings should be a dict
        self.assertIsInstance(result_data['bindings'], dict)

    def test_05_get_status(self):
        """Test GET /ascii/v1/status returns daemon status"""
        response = self.client.get_status()

        self.assertEqual(response.status_code, 200,
                        f"Expected 200, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertTrue(data.get('success', False), "Response should have success=true")

        self.assertIn('data', data)
        result_data = data['data']
        self.assertIn('running', result_data)
        self.assertIn('pid', result_data)
        self.assertIn('checked_at', result_data)

        # Running should be boolean
        self.assertIsInstance(result_data['running'], bool)

    def test_06_create_directive(self):
        """Test POST /ascii/v1/directives creates directive"""
        response = self.client.create_directive(
            title=f"Test Directive from E2E",
            content="This is a test directive created by the E2E test script"
        )

        # Accept 201 (created) or 400 (duplicate)
        self.assertIn(response.status_code, [201, 400],
                     f"Expected 201 or 400, got {response.status_code}: {response.text}")

        data = response.json()

        if response.status_code == 201:
            self.assertTrue(data.get('success', False))
            self.assertIn('data', data)
            self.assertIn('id', data['data'])

            # Store for subsequent tests
            TestRESTAPI.created_directive_id = data['data']['id']
        else:
            # Duplicate is acceptable
            self.assertTrue(data.get('is_duplicate', False),
                          "400 should be due to duplicate")

    def test_07_list_directives(self):
        """Test GET /ascii/v1/directives returns list"""
        response = self.client.list_directives(limit=10)

        self.assertEqual(response.status_code, 200,
                        f"Expected 200, got {response.status_code}: {response.text}")

        data = response.json()
        self.assertTrue(data.get('success', False))

        self.assertIn('data', data)
        result_data = data['data']
        self.assertIn('directives', result_data)
        self.assertIn('total', result_data)
        self.assertIn('count', result_data)

        # Directives should be a list
        self.assertIsInstance(result_data['directives'], list)

    def test_08_get_directive(self):
        """Test GET /ascii/v1/directives/{id} returns single directive"""
        # Use created ID or fallback to ID 1
        directive_id = TestRESTAPI.created_directive_id or 1

        response = self.client.get_directive(directive_id)

        # Accept 200 or 404 if no directives exist
        self.assertIn(response.status_code, [200, 404],
                     f"Expected 200 or 404, got {response.status_code}: {response.text}")

        if response.status_code == 200:
            data = response.json()
            self.assertTrue(data.get('success', False))
            self.assertIn('data', data)

    def test_09_full_crud_cycle(self):
        """Test create -> get -> list cycle"""
        # Create
        create_response = self.client.create_directive(
            title=f"CRUD Cycle Test",
            content="Testing full CRUD cycle"
        )

        if create_response.status_code == 201:
            created_id = create_response.json()['data']['id']

            # Get
            get_response = self.client.get_directive(created_id)
            self.assertEqual(get_response.status_code, 200)

            # List should include it
            list_response = self.client.list_directives(limit=100)
            self.assertEqual(list_response.status_code, 200)

            directive_ids = [d['id'] for d in list_response.json()['data']['directives']]
            self.assertIn(created_id, directive_ids,
                         f"Created directive {created_id} not found in list")


def run_tests(base_url: str, api_key: str, verbose: bool = True):
    """Run tests with given configuration"""
    TestRESTAPI.base_url = base_url
    TestRESTAPI.api_key = api_key

    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(TestRESTAPI)

    runner = unittest.TextTestRunner(verbosity=2 if verbose else 1)
    result = runner.run(suite)

    return 0 if result.wasSuccessful() else 1


def main():
    parser = argparse.ArgumentParser(
        description='E2E tests for ASCII Desktop Control REST API'
    )
    parser.add_argument(
        '--url',
        required=True,
        help='WordPress base URL (e.g., http://localhost:8080)'
    )
    parser.add_argument(
        '--key',
        required=True,
        help='API key for authentication'
    )
    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        default=True,
        help='Verbose output'
    )

    args = parser.parse_args()

    print(f"Testing REST API at: {args.url}")
    print(f"Using API key: {args.key[:8]}...")
    print("-" * 50)

    exit_code = run_tests(args.url, args.key, args.verbose)
    sys.exit(exit_code)


if __name__ == '__main__':
    main()
