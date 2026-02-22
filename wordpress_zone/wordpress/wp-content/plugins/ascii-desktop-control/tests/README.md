# ASCII Desktop Control - Test Suite

This directory contains tests for the ASCII Desktop Control WordPress plugin.

## Test Structure

```
tests/
├── php/                          # PHP/WordPress tests
│   ├── bootstrap.php             # Test bootstrap
│   ├── run-tests.php             # Simple test runner
│   ├── class-test-directive-api.php
│   ├── class-test-ascii-view.php
│   ├── class-test-daemon-status.php
│   └── class-test-ajax-handlers.php
├── js/                           # JavaScript tests
│   ├── control.test.js           # UI/ polling tests
│   └── package.json              # JS test dependencies
├── python/                       # Python script tests
│   ├── test_ascii_capture.py     # get_ascii_view.py tests
│   └── run_tests.py              # Python test runner
└── README.md                     # This file
```

## Running Tests

### PHP Tests

Simple runner (no WordPress):
```bash
cd tests/php
php run-tests.php
```

With PHPUnit (requires WordPress test environment):
```bash
# Install PHPUnit
composer require --dev phpunit/phpunit

# Run tests
vendor/bin/phpunit
```

### JavaScript Tests

```bash
cd tests/js
npm install
npm test
```

### Python Tests

```bash
cd tests/python
python3 -m pytest -v
# Or:
python3 run_tests.py
```

## Test Coverage Goals

| Component | Target | Current |
|-----------|--------|---------|
| PHP Classes | 80% | - |
| AJAX Handlers | 100% | - |
| JavaScript | 70% | - |
| Python Scripts | 80% | - |

## Test Categories

### Unit Tests
- Test individual class methods in isolation
- Mock external dependencies (shell_exec, WordPress functions)

### Integration Tests
- Test AJAX endpoints with proper nonce/capability
- Test directive creation → status update flow

### E2E Tests (Future)
- Use Playwright or Cypress
- Test full user workflows in browser

## Writing New Tests

### PHP Test Template

```php
public function test_new_feature(): bool {
    // Arrange
    $api = new Directive_API();

    // Act
    $result = $api->some_method();

    // Assert
    $this->assertTrue($result);
    echo "✓ test_new_feature: Passed\n";
    return true;
}
```

### JavaScript Test Template

```javascript
test_new_feature: function() {
    // Arrange & Act
    const result = ASCIIControl.someMethod();

    // Assert
    console.log('✓ test_new_feature: Passed');
    return true;
}
```

### Python Test Template

```python
def test_new_feature(self):
    """Test description"""
    # Arrange
    obj = SomeClass()

    # Act
    result = obj.some_method()

    # Assert
    self.assertTrue(result)
```

## CI Integration

Add to your CI pipeline:

```yaml
# .github/workflows/tests.yml
- name: Run PHP Tests
  run: cd tests/php && php run-tests.php

- name: Run JS Tests
  run: cd tests/js && npm test

- name: Run Python Tests
  run: cd tests/python && python3 -m pytest
```
