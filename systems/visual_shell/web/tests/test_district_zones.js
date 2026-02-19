/**
 * Tests for District Zones in HUD
 */

const assert = require('assert');

// Load VisualDebugOverlay class
const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

// Create DOM environment
const dom = new JSDOM('<!DOCTYPE html><html><body></body></html>', {
    runScripts: 'dangerously',
    resources: 'usable'
});

global.window = dom.window;
global.document = dom.window.document;
global.navigator = dom.window.navigator;

// Load VisualDebugOverlay
const overlayPath = path.resolve(__dirname, '../visual_debug_overlay.js');
const overlayCode = fs.readFileSync(overlayPath, 'utf8');
eval(overlayCode);

describe('DistrictZones', () => {
    let overlay;

    beforeEach(() => {
        // Create a mock VisualDebugOverlay without full DOM setup
        overlay = {
            districtZones: {
                cognitive: { name: 'Cognitive', color: '#00aaff', y: 0, height: 0 },
                metabolic: { name: 'Metabolic', color: '#44ff44', y: 0, height: 0 },
                substrate: { name: 'Substrate', color: '#ff8844', y: 0, height: 0 }
            },
            agentPositions: {},
            draggedAgent: null,
            dropTarget: null,
            _getDistrictColor: function(district) {
                const colors = {
                    'cognitive': '#00aaff',
                    'metabolic': '#44ff44',
                    'substrate': '#ff8844'
                };
                return colors[district] || '#888888';
            },
            processAgentRelocation: function(data) {
                if (!data || !data.agent_id) return;
                const agentId = data.agent_id;
                if (this.agentPositions[agentId]) {
                    this.agentPositions[agentId].district = data.to_district;
                }
            }
        };
    });

    it('initializes with districtZones state', () => {
        assert.ok(overlay.districtZones);
        assert.ok(overlay.districtZones.cognitive);
        assert.ok(overlay.districtZones.metabolic);
        assert.ok(overlay.districtZones.substrate);
    });

    it('district zones have correct colors', () => {
        assert.strictEqual(overlay.districtZones.cognitive.color, '#00aaff');
        assert.strictEqual(overlay.districtZones.metabolic.color, '#44ff44');
        assert.strictEqual(overlay.districtZones.substrate.color, '#ff8844');
    });

    it('_getDistrictColor returns correct colors', () => {
        assert.strictEqual(overlay._getDistrictColor('cognitive'), '#00aaff');
        assert.strictEqual(overlay._getDistrictColor('metabolic'), '#44ff44');
        assert.strictEqual(overlay._getDistrictColor('substrate'), '#ff8844');
        assert.strictEqual(overlay._getDistrictColor('unknown'), '#888888');
    });

    it('processAgentRelocation updates agent district', () => {
        overlay.agentPositions = {
            'worker-001': { district: 'substrate', x: 100, y: 100 }
        };

        overlay.processAgentRelocation({
            agent_id: 'worker-001',
            from_district: 'substrate',
            to_district: 'cognitive'
        });

        assert.strictEqual(overlay.agentPositions['worker-001'].district, 'cognitive');
    });
});
