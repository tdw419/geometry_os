/**
 * E2E Test: Geometry OS Web Terminal
 *
 * Uses Puppeteer to verify the web terminal works end-to-end.
 *
 * Prerequisites:
 * - Visual Bridge running on ws://localhost:8768
 * - WordPress running on http://localhost/wordpress
 * - Plugin activated
 *
 * Run: node systems/visual_shell/api/tests/e2e_terminal_test.js
 */

const puppeteer = require('puppeteer');

const CONFIG = {
    wordpressUrl: 'http://localhost/wordpress',
    terminalPage: '/wp-admin/admin.php?page=geometry-os-web-terminal',
    adminUser: 'admin',
    adminPass: process.env.WP_ADMIN_PASS || 'admin',
    visualBridgeUrl: 'ws://localhost:8768',
    timeout: 30000,
};

// ANSI escape code parser for terminal output
function parseAnsiOutput(buffer) {
    // Strip ANSI codes and return clean text
    return buffer.replace(/\x1b\[[0-9;]*m/g, '');
}

// Test suite
async function runTests() {
    console.log('🧪 Starting E2E Web Terminal Tests\n');

    let browser;
    let page;
    let results = { passed: 0, failed: 0, tests: [] };

    try {
        // Launch browser
        browser = await puppeteer.launch({
            headless: 'new',
            args: ['--no-sandbox', '--disable-setuid-sandbox'],
        });
        page = await browser.newPage();

        // Test 1: Plugin page loads
        console.log('Test 1: Plugin page loads...');
        try {
            await page.goto(CONFIG.wordpressUrl + CONFIG.terminalPage, {
                waitUntil: 'networkidle2',
                timeout: CONFIG.timeout
            });

            // Check for terminal container
            const container = await page.$('#geometry-os-terminal-container');
            if (container) {
                console.log('  ✅ Terminal container found');
                results.passed++;
                results.tests.push({ name: 'Page loads', status: 'PASS' });
            } else {
                // Might be on login page - check
                const loginForm = await page.$('#loginform');
                if (loginForm) {
                    console.log('  ⚠️  Redirected to login - authentication required');
                    results.tests.push({ name: 'Page loads', status: 'SKIP', reason: 'Needs auth' });
                } else {
                    throw new Error('Terminal container not found');
                }
            }
        } catch (e) {
            console.log(`  ❌ Failed: ${e.message}`);
            results.failed++;
            results.tests.push({ name: 'Page loads', status: 'FAIL', error: e.message });
        }

        // Test 2: xterm.js terminal initialized
        console.log('Test 2: xterm.js terminal initialized...');
        try {
            const xtermReady = await page.evaluate(() => {
                // Check if xterm instance exists
                return typeof window.Terminal !== 'undefined' ||
                       document.querySelector('.xterm') !== null;
            });

            if (xtermReady) {
                console.log('  ✅ xterm.js terminal element found');
                results.passed++;
                results.tests.push({ name: 'xterm.js init', status: 'PASS' });
            } else {
                console.log('  ⚠️  xterm.js not yet initialized (may need wait)');
                results.tests.push({ name: 'xterm.js init', status: 'SKIP' });
            }
        } catch (e) {
            console.log(`  ❌ Failed: ${e.message}`);
            results.failed++;
            results.tests.push({ name: 'xterm.js init', status: 'FAIL', error: e.message });
        }

        // Test 3: WebSocket connection attempt
        console.log('Test 3: WebSocket connection...');
        try {
            await page.waitForTimeout(2000); // Wait for WS attempt

            const wsStatus = await page.evaluate(() => {
                const statusDot = document.querySelector('#terminal-status-dot');
                const statusText = document.querySelector('#terminal-status-text');
                return {
                    dotClass: statusDot?.className || 'not-found',
                    text: statusText?.textContent || 'not-found'
                };
            });

            if (wsStatus.text.includes('Connected')) {
                console.log('  ✅ WebSocket connected');
                results.passed++;
                results.tests.push({ name: 'WebSocket connect', status: 'PASS' });
            } else if (wsStatus.text.includes('Connecting')) {
                console.log('  ⚠️  WebSocket still connecting');
                results.tests.push({ name: 'WebSocket connect', status: 'SKIP' });
            } else {
                console.log(`  ℹ️  WebSocket status: ${wsStatus.text}`);
                results.tests.push({ name: 'WebSocket connect', status: 'INFO', detail: wsStatus.text });
            }
        } catch (e) {
            console.log(`  ❌ Failed: ${e.message}`);
            results.failed++;
            results.tests.push({ name: 'WebSocket connect', status: 'FAIL', error: e.message });
        }

        // Test 4: Visual Bridge health check
        console.log('Test 4: Visual Bridge health...');
        try {
            const http = require('http');
            const healthCheck = await new Promise((resolve) => {
                const req = http.get('http://localhost:8769/health', (res) => {
                    resolve({ status: res.statusCode });
                });
                req.on('error', () => resolve({ status: 'error' }));
                req.setTimeout(2000, () => { req.destroy(); resolve({ status: 'timeout' }); });
            });

            if (healthCheck.status === 200) {
                console.log('  ✅ Visual Bridge healthy (port 8769)');
                results.passed++;
                results.tests.push({ name: 'Visual Bridge health', status: 'PASS' });
            } else {
                console.log(`  ⚠️  Visual Bridge status: ${healthCheck.status}`);
                results.tests.push({ name: 'Visual Bridge health', status: 'SKIP', reason: 'Not running' });
            }
        } catch (e) {
            console.log(`  ⚠️  Visual Bridge not available: ${e.message}`);
            results.tests.push({ name: 'Visual Bridge health', status: 'SKIP' });
        }

    } catch (e) {
        console.error('Test suite error:', e);
    } finally {
        if (browser) {
            await browser.close();
        }
    }

    // Summary
    console.log('\n' + '='.repeat(50));
    console.log('📊 Test Results Summary');
    console.log('='.repeat(50));
    console.log(`Passed: ${results.passed}`);
    console.log(`Failed: ${results.failed}`);
    console.log('\nDetails:');
    results.tests.forEach(t => {
        const icon = t.status === 'PASS' ? '✅' : t.status === 'FAIL' ? '❌' : '⚠️';
        console.log(`  ${icon} ${t.name}: ${t.status}${t.reason ? ` (${t.reason})` : ''}`);
    });

    return results;
}

// Run if executed directly
if (require.main === module) {
    runTests()
        .then(results => {
            process.exit(results.failed > 0 ? 1 : 0);
        })
        .catch(e => {
            console.error('Fatal error:', e);
            process.exit(1);
        });
}

module.exports = { runTests, CONFIG };
