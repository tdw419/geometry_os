#!/usr/bin/env python3
"""
Mock PHP test runner - verifies admin UI PHP code structure and logic
Run when PHP is not available in the environment
"""

import re
import os


def get_php_content():
    """Read the admin UI PHP file"""
    php_path = os.path.join(
        os.path.dirname(__file__),
        '..', 'wordpress', 'wp-content', 'mu-plugins', 'geometry_os_admin_ui.php'
    )
    with open(php_path, 'r') as f:
        return f.read()


def test_plugin_header():
    """Verify plugin header is present"""
    content = get_php_content()

    if 'Plugin Name: Geometry OS Admin UI' not in content:
        print("FAIL: Plugin header not found")
        return False
    print("PASS: Plugin header present")
    return True


def test_metabox_registered():
    """Verify metabox is registered with add_meta_boxes hook"""
    content = get_php_content()

    if "add_action('add_meta_boxes'" not in content:
        print("FAIL: add_meta_boxes hook not found")
        return False

    if "add_meta_box(" not in content:
        print("FAIL: add_meta_box function call not found")
        return False

    if "'geometry_os_agent'" not in content:
        print("FAIL: geometry_os_agent metabox ID not found")
        return False

    print("PASS: Metabox registered correctly")
    return True


def test_three_action_buttons():
    """Verify all three action buttons are present"""
    content = get_php_content()

    buttons = ['geo-auto-tag', 'geo-generate-excerpt', 'geo-suggest-category']
    missing = []

    for button in buttons:
        if f"id=\"{button}\"" not in content:
            missing.append(button)

    if missing:
        print(f"FAIL: Missing buttons: {missing}")
        return False

    print("PASS: All three action buttons present")
    return True


def test_ajax_handler_registered():
    """Verify AJAX handler for agent trigger is registered"""
    content = get_php_content()

    if "add_action('wp_ajax_geometry_os_agent_trigger'" not in content:
        print("FAIL: AJAX handler for agent trigger not registered")
        return False

    print("PASS: AJAX handler registered")
    return True


def test_ajax_handler_calls_bridge():
    """Verify AJAX handler calls geometry_os_send_agent_request"""
    content = get_php_content()

    if 'geometry_os_send_agent_request' not in content:
        print("FAIL: AJAX handler should call geometry_os_send_agent_request")
        return False

    if "'content_intelligence'" not in content:
        print("FAIL: AJAX handler should use content_intelligence agent type")
        return False

    print("PASS: AJAX handler calls bridge function")
    return True


def test_status_polling():
    """Verify status polling with geometry_os_get_task_status"""
    content = get_php_content()

    if 'geometry_os_get_task_status' not in content:
        print("FAIL: Status polling not implemented")
        return False

    if 'usleep(500000)' not in content and 'sleep(0.5)' not in content:
        print("FAIL: Should use usleep/sleep for polling delay")
        return False

    print("PASS: Status polling implemented")
    return True


def test_shortcode_registered():
    """Verify geometry_agent shortcode is registered"""
    content = get_php_content()

    if "add_shortcode('geometry_agent'" not in content:
        print("FAIL: geometry_agent shortcode not registered")
        return False

    print("PASS: Shortcode registered")
    return True


def test_shortcode_attributes():
    """Verify shortcode supports type and text attributes"""
    content = get_php_content()

    # Check for attribute defaults
    if "'type' => 'plugin_analysis'" not in content:
        print("FAIL: Shortcode should have default 'type' attribute")
        return False

    if "'text' => 'Analyze Plugins'" not in content:
        print("FAIL: Shortcode should have default 'text' attribute")
        return False

    print("PASS: Shortcode attributes correct")
    return True


def test_admin_menu_registered():
    """Verify admin menu is registered"""
    content = get_php_content()

    if "add_action('admin_menu'" not in content:
        print("FAIL: admin_menu hook not found")
        return False

    if "add_submenu_page(" not in content:
        print("FAIL: add_submenu_page not called")
        return False

    if "'geometry-os-analysis'" not in content:
        print("FAIL: geometry-os-analysis menu slug not found")
        return False

    print("PASS: Admin menu registered")
    return True


def test_analysis_page_has_security_scan():
    """Verify analysis page has security scan button"""
    content = get_php_content()

    if 'id="geo-security-scan"' not in content:
        print("FAIL: Security scan button not found")
        return False

    print("PASS: Security scan button present")
    return True


def test_analysis_page_has_update_check():
    """Verify analysis page has update check button"""
    content = get_php_content()

    if 'id="geo-update-check"' not in content:
        print("FAIL: Update check button not found")
        return False

    print("PASS: Update check button present")
    return True


def test_plugin_analysis_ajax_handler():
    """Verify plugin analysis AJAX handler is registered"""
    content = get_php_content()

    if "add_action('wp_ajax_geometry_os_plugin_analysis'" not in content:
        print("FAIL: Plugin analysis AJAX handler not registered")
        return False

    print("PASS: Plugin analysis AJAX handler registered")
    return True


def test_jquery_ajax_calls():
    """Verify jQuery AJAX calls to ajaxurl"""
    content = get_php_content()

    if 'ajaxurl' not in content:
        print("FAIL: ajaxurl not used in JavaScript")
        return False

    if '$.ajax(' not in content and '$.post(' not in content:
        print("FAIL: jQuery AJAX calls not found")
        return False

    print("PASS: jQuery AJAX calls present")
    return True


def test_status_spinner():
    """Verify status spinner element exists"""
    content = get_php_content()

    if 'id="geo-agent-status"' not in content:
        print("FAIL: Status container not found")
        return False

    if 'spinner' not in content:
        print("FAIL: Spinner element not found")
        return False

    print("PASS: Status spinner present")
    return True


def test_result_display():
    """Verify result display element exists"""
    content = get_php_content()

    if 'id="geo-agent-result"' not in content:
        print("FAIL: Result container not found")
        return False

    print("PASS: Result display element present")
    return True


def test_nonce_security():
    """Verify nonce field for security"""
    content = get_php_content()

    if 'wp_nonce_field' not in content and 'check_ajax_referer' not in content:
        print("FAIL: Nonce security not implemented")
        return False

    print("PASS: Nonce security implemented")
    return True


def test_esc_functions_for_output():
    """Verify proper escaping for output"""
    content = get_php_content()

    if 'esc_attr' not in content and 'esc_html' not in content and 'esc_js' not in content:
        print("FAIL: Output escaping not found")
        return False

    print("PASS: Output escaping implemented")
    return True


def test_usleep_for_polling():
    """Verify usleep is used for half-second polling intervals"""
    content = get_php_content()

    if 'usleep(500000)' not in content:
        print("FAIL: usleep(500000) for 0.5s polling not found")
        return False

    print("PASS: usleep polling interval correct")
    return True


def test_function_exists_checks():
    """Verify function_exists checks for WordPress functions"""
    content = get_php_content()

    if 'function_exists(' not in content:
        print("FAIL: function_exists checks not found (needed for mu-plugins)")
        return False

    print("PASS: function_exists checks present")
    return True


def main():
    tests = [
        test_plugin_header,
        test_metabox_registered,
        test_three_action_buttons,
        test_ajax_handler_registered,
        test_ajax_handler_calls_bridge,
        test_status_polling,
        test_shortcode_registered,
        test_shortcode_attributes,
        test_admin_menu_registered,
        test_analysis_page_has_security_scan,
        test_analysis_page_has_update_check,
        test_plugin_analysis_ajax_handler,
        test_jquery_ajax_calls,
        test_status_spinner,
        test_result_display,
        test_nonce_security,
        test_esc_functions_for_output,
        test_usleep_for_polling,
        test_function_exists_checks,
    ]

    print("Running Admin UI Mock PHP Verification Tests")
    print("=" * 50)
    print()

    passed = 0
    failed = 0

    for test in tests:
        try:
            if test():
                passed += 1
            else:
                failed += 1
        except Exception as e:
            print(f"FAIL: {test.__name__} - Exception: {e}")
            failed += 1

    print()
    print("=" * 50)
    print(f"Results: {passed} passed, {failed} failed")

    return failed == 0


if __name__ == '__main__':
    import sys
    sys.exit(0 if main() else 1)
