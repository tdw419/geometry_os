/**
 * Tests for MockAgentData - Glass Box Mock Data Generator
 */

// Load the module
const { MockAgentData } = require('../js/MockAgentData.js');

// Also make it available globally for tests
global.MockAgentData = MockAgentData;

let testsPassed = 0;
let testsFailed = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`PASS: ${name}`);
        testsPassed++;
    } catch (e) {
        console.log(`FAIL: ${name} - ${e.message}`);
        testsFailed++;
    }
}

function assertEqual(actual, expected, message = '') {
    if (actual !== expected) {
        throw new Error(`${message} Expected ${expected}, got ${actual}`);
    }
}

function assertTrue(condition, message = '') {
    if (!condition) {
        throw new Error(message || 'Assertion failed');
    }
}

function assertDefined(value, message = '') {
    if (value === undefined || value === null) {
        throw new Error(message || 'Value should be defined');
    }
}

// TEST 1: Module exists and has generate method
test('test_module_exists', () => {
    assertTrue(typeof MockAgentData !== 'undefined', 'MockAgentData should be defined');
    assertTrue(typeof MockAgentData.generate === 'function', 'Should have generate method');
});

// TEST 2: Generate returns object with all required fields
test('test_generate_returns_complete_object', () => {
    const data = MockAgentData.generate('agent-01');
    assertDefined(data.thoughts, 'Should have thoughts field');
    assertDefined(data.intent, 'Should have intent field');
    assertDefined(data.metabolism, 'Should have metabolism field');
    assertDefined(data.communications, 'Should have communications field');
});

// TEST 3: Thoughts is an array with proper structure
test('test_thoughts_structure', () => {
    const data = MockAgentData.generate('agent-01');
    assertTrue(Array.isArray(data.thoughts), 'Thoughts should be an array');
    assertTrue(data.thoughts.length > 0, 'Thoughts should not be empty');

    const thought = data.thoughts[0];
    assertDefined(thought.time, 'Thought should have time');
    assertDefined(thought.text, 'Thought should have text');
    assertDefined(thought.type, 'Thought should have type');
});

// TEST 4: Thought types are valid
test('test_thought_types_valid', () => {
    const data = MockAgentData.generate('agent-01');
    const validTypes = ['inference', 'action'];

    for (const thought of data.thoughts) {
        assertTrue(validTypes.includes(thought.type), `Thought type ${thought.type} should be valid`);
    }
});

// TEST 5: Intent has goal and steps
test('test_intent_structure', () => {
    const data = MockAgentData.generate('agent-01');
    assertDefined(data.intent.goal, 'Intent should have goal');
    assertTrue(Array.isArray(data.intent.steps), 'Intent should have steps array');
    assertTrue(data.intent.steps.length > 0, 'Steps should not be empty');
});

// TEST 6: Steps have proper structure
test('test_steps_structure', () => {
    const data = MockAgentData.generate('agent-01');
    const step = data.intent.steps[0];
    assertDefined(step.text, 'Step should have text');
    assertDefined(step.complete, 'Step should have complete flag');
    assertTrue(typeof step.complete === 'boolean', 'Complete should be boolean');
});

// TEST 7: Metabolism has IPC, memory, activity
test('test_metabolism_structure', () => {
    const data = MockAgentData.generate('agent-01');
    assertDefined(data.metabolism.ipc, 'Metabolism should have IPC');
    assertDefined(data.metabolism.memory, 'Metabolism should have memory');
    assertDefined(data.metabolism.activity, 'Metabolism should have activity');
});

// TEST 8: Metabolism values are in realistic ranges
test('test_metabolism_realistic_values', () => {
    const data = MockAgentData.generate('agent-01');
    assertTrue(data.metabolism.ipc >= 0 && data.metabolism.ipc <= 2, 'IPC should be in realistic range');
    assertTrue(data.metabolism.activity >= 0 && data.metabolism.activity <= 1, 'Activity should be 0-1');
    assertTrue(data.metabolism.memory.used > 0, 'Memory used should be positive');
    assertTrue(data.metabolism.memory.total > 0, 'Memory total should be positive');
});

// TEST 9: Memory has used and total
test('test_memory_structure', () => {
    const data = MockAgentData.generate('agent-01');
    assertDefined(data.metabolism.memory.used, 'Memory should have used');
    assertDefined(data.metabolism.memory.total, 'Memory should have total');
    assertTrue(data.metabolism.memory.used <= data.metabolism.memory.total, 'Used should not exceed total');
});

// TEST 10: Communications is array with direction indicators
test('test_communications_structure', () => {
    const data = MockAgentData.generate('agent-01');
    assertTrue(Array.isArray(data.communications), 'Communications should be an array');

    if (data.communications.length > 0) {
        const comm = data.communications[0];
        assertDefined(comm.direction, 'Communication should have direction');
        assertDefined(comm.target, 'Communication should have target');
        assertDefined(comm.type, 'Communication should have type');
    }
});

// TEST 11: Communication directions are valid
test('test_communication_directions_valid', () => {
    const data = MockAgentData.generate('agent-01');
    const validDirections = ['in', 'out'];

    for (const comm of data.communications) {
        assertTrue(validDirections.includes(comm.direction), `Direction ${comm.direction} should be valid`);
    }
});

// TEST 12: Same agent ID produces consistent data
test('test_deterministic_generation', () => {
    const data1 = MockAgentData.generate('agent-01');
    const data2 = MockAgentData.generate('agent-01');

    assertEqual(data1.intent.goal, data2.intent.goal, 'Goal should be consistent for same ID');
    assertEqual(data1.metabolism.ipc, data2.metabolism.ipc, 'IPC should be consistent for same ID');
    assertEqual(data1.thoughts.length, data2.thoughts.length, 'Thoughts count should be consistent');
});

// TEST 13: Different agent IDs produce different data
test('test_different_agents_different_data', () => {
    const data1 = MockAgentData.generate('agent-01');
    const data2 = MockAgentData.generate('agent-02');

    // IPC should differ
    assertTrue(data1.metabolism.ipc !== data2.metabolism.ipc, 'IPC should differ for different agents');
});

// TEST 14: Hash function produces consistent values
test('test_hash_function_consistency', () => {
    const hash1 = MockAgentData._hashString('test-string');
    const hash2 = MockAgentData._hashString('test-string');
    const hash3 = MockAgentData._hashString('different-string');

    assertEqual(hash1, hash2, 'Same string should produce same hash');
    assertTrue(hash1 !== hash3, 'Different strings should produce different hashes');
});

// TEST 15: Generate handles empty agent ID
test('test_handles_empty_agent_id', () => {
    const data = MockAgentData.generate('');
    assertDefined(data.thoughts, 'Should handle empty agent ID');
    assertDefined(data.intent, 'Should handle empty agent ID');
});

// TEST 16: Generate handles special characters in agent ID
test('test_handles_special_characters', () => {
    const data = MockAgentData.generate('agent-with-special-chars-123');
    assertDefined(data.thoughts, 'Should handle special characters');
    assertTrue(data.thoughts.length > 0, 'Should generate thoughts for special char ID');
});

// TEST 17: Thoughts have realistic timestamps
test('test_thought_timestamps_format', () => {
    const data = MockAgentData.generate('agent-01');
    const timeRegex = /^\d{2}:\d{2}:\d{2}$/;

    for (const thought of data.thoughts) {
        assertTrue(timeRegex.test(thought.time), `Time ${thought.time} should match HH:MM:SS format`);
    }
});

// TEST 18: Goal comes from valid goal templates
test('test_goal_from_templates', () => {
    const data = MockAgentData.generate('agent-01');
    assertTrue(MockAgentData.goals.includes(data.intent.goal), 'Goal should be from templates');
});

// Summary
console.log(`\n${testsPassed} passed, ${testsFailed} failed`);
if (typeof process !== 'undefined') {
    process.exit(testsFailed > 0 ? 1 : 0);
}
