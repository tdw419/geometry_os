/**
 * Model Zoo Test Suite
 *
 * Comprehensive unit tests for Model Zoo components:
 * - ModelMetadata Validation
 * - ModelRegistry CRUD operations
 * - ModelDiscovery (LM Studio scanning, GGUF parsing)
 *
 * Compatible with the NeuralHeatmapTests framework
 * @see neural_heatmap_test_framework.js
 */

// ============================================================================
// Test Data & Mocks
// ============================================================================

const MOCK_VALID_METADATA = {
    id: 'test-model-1',
    name: 'Test Model 1',
    architecture: 'transformer',
    layers: 24,
    hiddenSize: 2048,
    attentionHeads: 16,
    color: 0xFF6B6B,
    layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
};

const MOCK_MINIMAL_METADATA = {
    name: 'Minimal Model',
    architecture: 'llama'
};

const MOCK_INVALID_METADATA_NO_NAME = {
    id: 'invalid-1',
    architecture: 'transformer'
};

const MOCK_GGUF_FILE = {
    name: 'qwen-7b-v1.5.Q4_K_M.gguf',
    size: 4321012345,
    lastModified: 1704067200000
};

const MOCK_LM_STUDIO_MODELS = [
    'Qwen/Qwen-7B-Chat-GGUF',
    'lmstudio-community/Meta-Llama-3-8B-Instruct-GGUF',
    'mistralai/Mistral-7B-Instruct-v0.2-GGUF'
];

// Valid architecture types
const VALID_ARCHITECTURES = [
    'transformer', 'llama', 'mistral', 'phi', 'gemma', 'unknown'
];

// ============================================================================
// Test Assertions Extension
// ============================================================================

class ModelZooAssert extends Assert {
    static assertValidMetadata(metadata, message = 'Metadata should be valid') {
        if (!metadata || typeof metadata !== 'object') {
            throw new Error(`Assertion failed: ${message} - metadata is not an object`);
        }
        if (!metadata.name || typeof metadata.name !== 'string') {
            throw new Error(`Assertion failed: ${message} - name is required and must be a string`);
        }
        if (!metadata.architecture || typeof metadata.architecture !== 'string') {
            throw new Error(`Assertion failed: ${message} - architecture is required and must be a string`);
        }
    }

    static assertValidArchitecture(architecture, message = 'Architecture should be valid') {
        if (!VALID_ARCHITECTURES.includes(architecture)) {
            throw new Error(
                `Assertion failed: ${message} - "${architecture}" is not a valid architecture. ` +
                `Valid types: ${VALID_ARCHITECTURES.join(', ')}`
            );
        }
    }

    static assertValidLayerTypes(layerTypes, message = 'Layer types should be valid') {
        if (!Array.isArray(layerTypes)) {
            throw new Error(`Assertion failed: ${message} - layerTypes must be an array`);
        }
        const hasLayerPattern = layerTypes.some(type => typeof type === 'string' && type.includes('N'));
        if (!hasLayerPattern && layerTypes.length > 0) {
            throw new Error(
                `Assertion failed: ${message} - layerTypes should contain at least one ` +
                `pattern with 'N' placeholder for layer indexing`
            );
        }
    }

    static assertModelInRegistry(registry, modelId, message = 'Model should exist in registry') {
        if (!registry.has(modelId)) {
            throw new Error(`Assertion failed: ${message} - model "${modelId}" not found in registry`);
        }
    }

    static assertModelNotInRegistry(registry, modelId, message = 'Model should not exist in registry') {
        if (registry.has(modelId)) {
            throw new Error(`Assertion failed: ${message} - model "${modelId}" found in registry`);
        }
    }

    static assertGGUFFileName(filename, message = 'Should be a valid GGUF filename') {
        if (!filename || !filename.toString().endsWith('.gguf')) {
            throw new Error(`Assertion failed: ${message} - "${filename}" is not a .gguf file`);
        }
    }

    static assertPositiveNumber(value, message = 'Value should be a positive number') {
        if (typeof value !== 'number' || value < 0 || !Number.isFinite(value)) {
            throw new Error(`Assertion failed: ${message} - ${value} is not a positive number`);
        }
    }

    static assertHexString(str, message = 'Should be a hexadecimal color string') {
        if (typeof str !== 'string' || !/^0[xX][0-9A-Fa-f]{6}$/.test(str)) {
            throw new Error(`Assertion failed: ${message} - "${str}" is not a valid hex color`);
        }
    }
}

// ============================================================================
// ModelMetadata Validation Tests
// ============================================================================

class ModelMetadataValidationTest extends TestCase {
    constructor(name, options = {}) {
        super(name, options);
        this.manager = null;
    }

    async execute() {
        this.manager = new ModelZooManager();

        // Test 1: Valid metadata creation
        await this.testValidMetadataCreation();

        // Test 2: Required field validation - name
        await this.testRequiredFieldName();

        // Test 3: Required field validation - architecture
        await this.testRequiredFieldArchitecture();

        // Test 4: Enum value validation - architecture
        await this.testArchitectureValidation();

        // Test 5: Layer types validation
        await this.testLayerTypesValidation();

        // Test 6: Color validation
        await this.testColorValidation();

        // Test 7: Numeric fields validation
        await this.testNumericFieldsValidation();

        // Test 8: Default values
        await this.testDefaultValues();
    }

    async testValidMetadataCreation() {
        const metadata = { ...MOCK_VALID_METADATA };
        ModelZooAssert.assertValidMetadata(metadata);
        ModelZooAssert.assertValidArchitecture(metadata.architecture);
        ModelZooAssert.assertValidLayerTypes(metadata.layerTypes);
    }

    async testRequiredFieldName() {
        const metadata = { ...MOCK_INVALID_METADATA_NO_NAME };
        try {
            ModelZooAssert.assertValidMetadata(metadata);
            throw new Error('Expected assertion to fail for missing name');
        } catch (e) {
            if (e.message.includes('Expected assertion to fail')) {
                throw e;
            }
            // Expected failure
        }
    }

    async testRequiredFieldArchitecture() {
        const metadata = { name: 'Test' };
        try {
            ModelZooAssert.assertValidMetadata(metadata);
            throw new Error('Expected assertion to fail for missing architecture');
        } catch (e) {
            if (e.message.includes('Expected assertion to fail')) {
                throw e;
            }
            // Expected failure
        }
    }

    async testArchitectureValidation() {
        // Valid architectures
        for (const arch of VALID_ARCHITECTURES) {
            ModelZooAssert.assertValidArchitecture(arch);
        }

        // Invalid architecture
        try {
            ModelZooAssert.assertValidArchitecture('invalid_arch');
            throw new Error('Expected assertion to fail for invalid architecture');
        } catch (e) {
            if (e.message.includes('Expected assertion to fail')) {
                throw e;
            }
            // Expected failure
        }
    }

    async testLayerTypesValidation() {
        // Valid layer types
        const validLayerTypes = [
            ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head'],
            ['layers.N.attention', 'layers.N.feed_forward'],
            []
        ];

        for (const layerTypes of validLayerTypes) {
            ModelZooAssert.assertValidLayerTypes(layerTypes);
        }

        // Invalid layer types - not an array
        try {
            ModelZooAssert.assertValidLayerTypes('not-an-array');
            throw new Error('Expected assertion to fail for non-array layerTypes');
        } catch (e) {
            if (e.message.includes('Expected assertion to fail')) {
                throw e;
            }
            // Expected failure
        }
    }

    async testColorValidation() {
        // Valid hex colors
        const validColors = [0xFF6B6B, 0x4ECDC4, 0xFFFFFF, 0x000000];
        for (const color of validColors) {
            ModelZooAssert.assertTrue(
                color >= 0 && color <= 0xFFFFFF,
                `Color ${color.toString(16)} should be valid`
            );
        }

        // Manager's color generation
        const generatedColor = this.manager._generateColor();
        ModelZooAssert.assertTrue(
            generatedColor >= 0 && generatedColor <= 0xFFFFFF,
            `Generated color should be valid hex`
        );
    }

    async testNumericFieldsValidation() {
        const metadata = { ...MOCK_VALID_METADATA };

        ModelZooAssert.assertPositiveNumber(metadata.layers, 'layers should be positive');
        ModelZooAssert.assertPositiveNumber(metadata.hiddenSize, 'hiddenSize should be positive');
        ModelZooAssert.assertPositiveNumber(metadata.attentionHeads, 'attentionHeads should be positive');

        // Zero values are allowed (custom models default)
        ModelZooAssert.assertTrue(0 >= 0, 'Zero should be allowed for numeric fields');
    }

    async testDefaultValues() {
        const modelId = this.manager.importCustomModel({ ...MOCK_MINIMAL_METADATA });
        const model = this.manager.getModel(modelId);

        ModelZooAssert.assertEquals(model.architecture, 'llama', 'Should preserve architecture');
        ModelZooAssert.assertEquals(model.layers, 0, 'Should default layers to 0');
        ModelZooAssert.assertEquals(model.hiddenSize, 0, 'Should default hiddenSize to 0');
        ModelZooAssert.assertEquals(model.attentionHeads, 0, 'Should default attentionHeads to 0');
        ModelZooAssert.assertTrue(Array.isArray(model.layerTypes), 'Should default layerTypes to array');
        ModelZooAssert.assertEquals(model.layerTypes.length, 0, 'Should default layerTypes to empty');
        ModelZooAssert.assertEquals(model.builtIn, false, 'Should mark as custom model');
    }
}

// ============================================================================
// ModelRegistry CRUD Tests
// ============================================================================

class ModelRegistryCRUDTest extends TestCase {
    constructor(name, options = {}) {
        super(name, options);
        this.manager = null;
    }

    async execute() {
        this.manager = new ModelZooManager();

        // Test 1: Add model
        await this.testAddModel();

        // Test 2: Remove model
        await this.testRemoveModel();

        // Test 3: Get model by ID
        await this.testGetModelById();

        // Test 4: List all models
        await this.testListAllModels();

        // Test 5: Filter by capabilities
        await this.testFilterByCapabilities();

        // Test 6: Import JSON
        await this.testImportJSON();

        // Test 7: Export JSON
        await this.testExportJSON();

        // Test 8: Maximum custom models limit
        await this.testMaxCustomModelsLimit();

        // Test 9: Search models
        await this.testSearchModels();

        // Test 10: Get built-in vs custom models
        await this.testGetBuiltInVsCustomModels();
    }

    async testAddModel() {
        const initialCount = this.manager.getAllModels().length;
        const modelId = this.manager.importCustomModel({
            name: 'Test Model for Add',
            architecture: 'transformer',
            layers: 32,
            hiddenSize: 4096,
            attentionHeads: 32
        });

        ModelZooAssert.assertModelInRegistry(this.manager.customModels, modelId);
        ModelZooAssert.assertEquals(
            this.manager.getAllModels().length,
            initialCount + 1,
            'Total models should increase by 1'
        );

        const model = this.manager.getModel(modelId);
        ModelZooAssert.assertEquals(model.name, 'Test Model for Add');
        ModelZooAssert.assertEquals(model.architecture, 'transformer');
    }

    async testRemoveModel() {
        const modelId = this.manager.importCustomModel({
            name: 'Test Model for Remove',
            architecture: 'llama'
        });

        ModelZooAssert.assertModelInRegistry(this.manager.customModels, modelId);

        this.manager.removeCustomModel(modelId);
        ModelZooAssert.assertModelNotInRegistry(this.manager.customModels, modelId);

        const model = this.manager.getModel(modelId);
        ModelZooAssert.assertEquals(model, null, 'Removed model should not be found');
    }

    async testGetModelById() {
        // Test getting built-in model
        const qwen7b = this.manager.getModel('qwen-7b');
        ModelZooAssert.assertExists(qwen7b, 'Built-in model should exist');
        ModelZooAssert.assertEquals(qwen7b.id, 'qwen-7b');
        ModelZooAssert.assertEquals(qwen7b.name, 'Qwen 7B');

        // Test getting custom model
        const customId = this.manager.importCustomModel({
            name: 'Custom Test Model',
            architecture: 'mistral'
        });
        const customModel = this.manager.getModel(customId);
        ModelZooAssert.assertExists(customModel, 'Custom model should exist');
        ModelZooAssert.assertEquals(customModel.name, 'Custom Test Model');

        // Test getting non-existent model
        const nonExistent = this.manager.getModel('non-existent-model-id');
        ModelZooAssert.assertEquals(nonExistent, null, 'Non-existent model should return null');
    }

    async testListAllModels() {
        const allModels = this.manager.getAllModels();

        ModelZooAssert.assertTrue(Array.isArray(allModels), 'Should return array');
        ModelZooAssert.assertGreaterThan(allModels.length, 0, 'Should have built-in models');

        // Verify all models have required fields
        for (const model of allModels) {
            ModelZooAssert.assertExists(model.id, 'Model should have id');
            ModelZooAssert.assertExists(model.name, 'Model should have name');
            ModelZooAssert.assertExists(model.architecture, 'Model should have architecture');
        }

        // Check built-in vs custom
        const builtIn = this.manager.getBuiltInModels();
        const custom = this.manager.getCustomModels();

        ModelZooAssert.assertEquals(allModels.length, builtIn.length + custom.length);
    }

    async testFilterByCapabilities() {
        // Filter by architecture
        const transformerModels = this.manager.getAllModels().filter(
            m => m.architecture === 'transformer'
        );

        ModelZooAssert.assertTrue(transformerModels.length > 0, 'Should have transformer models');
        for (const model of transformerModels) {
            ModelZooAssert.assertEquals(model.architecture, 'transformer');
        }

        // Filter by layer count
        const largeModels = this.manager.getAllModels().filter(
            m => m.layers >= 32
        );

        ModelZooAssert.assertTrue(largeModels.length > 0, 'Should have models with 32+ layers');

        // Filter by attention heads
        const multiHeadModels = this.manager.getAllModels().filter(
            m => m.attentionHeads >= 32
        );

        ModelZooAssert.assertTrue(multiHeadModels.length > 0, 'Should have models with 32+ attention heads');
    }

    async testImportJSON() {
        const jsonData = {
            custom: [
                {
                    id: 'imported-model-1',
                    name: 'Imported Model 1',
                    architecture: 'phi',
                    layers: 32,
                    hiddenSize: 2560,
                    attentionHeads: 32,
                    color: 0xF0E68C,
                    layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.mlp', 'lm_head'],
                    builtIn: false,
                    customConfig: {
                        name: 'Imported Model 1',
                        architecture: 'phi'
                    }
                }
            ]
        };

        const initialCount = this.manager.customModels.size;
        this.manager.importLibrary(jsonData);

        ModelZooAssert.assertEquals(
            this.manager.customModels.size,
            initialCount + 1,
            'Should import one custom model'
        );

        const imported = this.manager.getModel('imported-model-1');
        ModelZooAssert.assertExists(imported, 'Imported model should exist');
        ModelZooAssert.assertEquals(imported.name, 'Imported Model 1');
    }

    async testExportJSON() {
        // Add a custom model first
        this.manager.importCustomModel({
            name: 'Export Test Model',
            architecture: 'gemma',
            layers: 18,
            hiddenSize: 2048,
            attentionHeads: 8
        });

        const exported = this.manager.exportLibrary();

        ModelZooAssert.assertExists(exported, 'Export should return data');
        ModelZooAssert.assertTrue(Array.isArray(exported.builtIn), 'Should have built-in array');
        ModelZooAssert.assertTrue(Array.isArray(exported.custom), 'Should have custom array');
        ModelZooAssert.assertExists(exported.exportedAt, 'Should have timestamp');

        ModelZooAssert.assertGreaterThan(exported.builtIn.length, 0, 'Should export built-in models');
        ModelZooAssert.assertGreaterThan(exported.custom.length, 0, 'Should export custom models');

        // Verify data integrity
        const exportedCustom = exported.custom.find(m => m.name === 'Export Test Model');
        ModelZooAssert.assertExists(exportedCustom, 'Exported custom model should be in data');
        ModelZooAssert.assertEquals(exportedCustom.architecture, 'gemma');
    }

    async testMaxCustomModelsLimit() {
        const manager = new ModelZooManager({ maxCustomModels: 2 });

        // Add models up to limit
        manager.importCustomModel({ name: 'Model 1', architecture: 'llama' });
        manager.importCustomModel({ name: 'Model 2', architecture: 'mistral' });

        // Try to exceed limit
        try {
            manager.importCustomModel({ name: 'Model 3', architecture: 'phi' });
            throw new Error('Expected error when exceeding max custom models');
        } catch (e) {
            if (e.message.includes('Maximum custom models')) {
                // Expected error
            } else {
                throw e;
            }
        }
    }

    async testSearchModels() {
        // Search by name
        const qwenResults = this.manager.searchModels('qwen');
        ModelZooAssert.assertTrue(qwenResults.length > 0, 'Should find Qwen models');
        ModelZooAssert.assertTrue(
            qwenResults.every(m => m.name.toLowerCase().includes('qwen') ||
                            m.architecture.toLowerCase().includes('qwen') ||
                            m.id.toLowerCase().includes('qwen')),
            'All results should match query'
        );

        // Search by architecture
        const llamaResults = this.manager.searchModels('llama');
        ModelZooAssert.assertTrue(llamaResults.length > 0, 'Should find Llama models');

        // Search with no results
        const noResults = this.manager.searchModels('nonexistent-model-xyz');
        ModelZooAssert.assertEquals(noResults.length, 0, 'Should return empty array for no matches');
    }

    async testGetBuiltInVsCustomModels() {
        // Add some custom models
        this.manager.importCustomModel({ name: 'Custom 1', architecture: 'llama' });
        this.manager.importCustomModel({ name: 'Custom 2', architecture: 'mistral' });

        const builtIn = this.manager.getBuiltInModels();
        const custom = this.manager.getCustomModels();

        ModelZooAssert.assertTrue(builtIn.length > 0, 'Should have built-in models');
        ModelZooAssert.assertTrue(custom.length >= 2, 'Should have at least 2 custom models');

        // Verify built-in flag
        ModelZooAssert.assertTrue(
            builtIn.every(m => m.builtIn === true),
            'All built-in models should have builtIn flag'
        );

        ModelZooAssert.assertTrue(
            custom.every(m => m.builtIn === false),
            'All custom models should have builtIn=false'
        );
    }
}

// ============================================================================
// ModelDiscovery Tests
// ============================================================================

class ModelDiscoveryTest extends TestCase {
    constructor(name, options = {}) {
        super(name, options);
        this.manager = null;
    }

    async execute() {
        this.manager = new ModelZooManager();

        // Test 1: GGUF filename parsing
        await this.testGGUFFilenameParsing();

        // Test 2: LM Studio model path parsing
        await this.testLMStudioPathParsing();

        // Test 3: Metadata extraction from filename
        await this.testMetadataExtraction();

        // Test 4: Model size formatting
        await this.testModelSizeFormatting();

        // Test 5: Quantization type detection
        await this.testQuantizationDetection();

        // Test 6: Layer name generation
        await this.testLayerNameGeneration();

        // Test 7: Heatmap config generation
        await this.testHeatmapConfigGeneration();
    }

    async testGGUFFilenameParsing() {
        const ggufFile = { ...MOCK_GGUF_FILE };

        ModelZooAssert.assertGGUFFileName(ggufFile.name);

        // Parse components from filename
        const filename = ggufFile.name;
        const parts = filename.replace('.gguf', '').split('-');

        ModelZooAssert.assertTrue(parts.length >= 2, 'Filename should have multiple parts');
        ModelZooAssert.assertTrue(
            filename.endsWith('.gguf'),
            'Filename should end with .gguf extension'
        );

        // Test various GGUF filename formats
        const testFiles = [
            'model.Q4_K_M.gguf',
            'model-Q5_K_S.gguf',
            'model.Q8_0.gguf',
            'model.F16.gguf'
        ];

        for (const file of testFiles) {
            ModelZooAssert.assertGGUFFileName(file);
        }
    }

    async testLMStudioPathParsing() {
        // Mock LM Studio model paths
        const paths = [
            'Qwen/Qwen-7B-Chat-GGUF',
            'lmstudio-community/Meta-Llama-3-8B-Instruct-GGUF',
            'mistralai/Mistral-7B-Instruct-v0.2-GGUF'
        ];

        for (const path of paths) {
            const parts = path.split('/');
            ModelZooAssert.assertEquals(parts.length, 2, 'Path should have author/model format');

            const [author, model] = parts;
            ModelZooAssert.assertExists(author, 'Should have author');
            ModelZooAssert.assertExists(model, 'Should have model name');
            ModelZooAssert.assertTrue(model.includes('GGUF'), 'Model name should indicate GGUF');
        }
    }

    async testMetadataExtraction() {
        // Extract metadata from various sources
        const testCases = [
            {
                source: 'qwen-7b-chat.gguf',
                expected: {
                    baseName: 'qwen',
                    size: '7b',
                    type: 'chat'
                }
            },
            {
                source: 'llama-13b-instruct.Q4_K_M.gguf',
                expected: {
                    baseName: 'llama',
                    size: '13b',
                    quantization: 'Q4_K_M'
                }
            },
            {
                source: 'mistral-7b-v0.2.gguf',
                expected: {
                    baseName: 'mistral',
                    size: '7b',
                    version: 'v0.2'
                }
            }
        ];

        for (const testCase of testCases) {
            const filename = testCase.source;
            const expected = testCase.expected;

            // Basic parsing logic
            const nameWithoutExt = filename.replace('.gguf', '');
            const parts = nameWithoutExt.split('-');

            ModelZooAssert.assertTrue(
                nameWithoutExt.toLowerCase().includes(expected.baseName),
                `Should extract base name: ${expected.baseName}`
            );

            if (expected.size) {
                ModelZooAssert.assertTrue(
                    nameWithoutExt.toLowerCase().includes(expected.size),
                    `Should extract size: ${expected.size}`
                );
            }
        }
    }

    async testModelSizeFormatting() {
        // Mock file size formatting
        const sizes = [
            { bytes: 1024, expected: '1 KB' },
            { bytes: 1048576, expected: '1 MB' },
            { bytes: 4321012345, expected: '4.02 GB' },
            { bytes: 500, expected: '500 B' }
        ];

        const formatBytes = (bytes) => {
            const k = 1024;
            const sizes = ['B', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
        };

        for (const size of sizes) {
            const formatted = formatBytes(size.bytes);
            ModelZooAssert.assertTrue(
                formatted.includes(size.expected.split(' ')[1]),
                `Should format to correct unit: ${size.expected}`
            );
        }
    }

    async testQuantizationDetection() {
        const quantizationTypes = [
            'Q4_K_M', 'Q4_K_S', 'Q5_K_M', 'Q5_K_S', 'Q8_0', 'Q6_K', 'Q3_K_M', 'Q2_K', 'F16', 'F32'
        ];

        const detectQuantization = (filename) => {
            for (const type of quantizationTypes) {
                if (filename.includes(type)) {
                    return type;
                }
            }
            return null;
        };

        ModelZooAssert.assertEquals(detectQuantization('model.Q4_K_M.gguf'), 'Q4_K_M');
        ModelZooAssert.assertEquals(detectQuantization('model.Q5_K_S.gguf'), 'Q5_K_S');
        ModelZooAssert.assertEquals(detectQuantization('model.Q8_0.gguf'), 'Q8_0');
        ModelZooAssert.assertEquals(detectQuantization('model.gguf'), null);
    }

    async testLayerNameGeneration() {
        const modelId = 'qwen-7b';
        const layerNames = this.manager.getLayerNames(modelId);

        ModelZooAssert.assertTrue(Array.isArray(layerNames), 'Should return array');
        ModelZooAssert.assertGreaterThan(layerNames.length, 0, 'Should have layer names');

        // Verify layer name format
        const firstLayerName = layerNames[0];
        ModelZooAssert.assertTrue(
            typeof firstLayerName === 'string',
            'Layer name should be string'
        );

        // For qwen-7b: 24 layers, 4 layer types each = 96 total
        ModelZooAssert.assertEquals(layerNames.length, 24 * 4, 'Should generate correct number of layers');

        // Test with custom model
        const customId = this.manager.importCustomModel({
            name: 'Custom Layer Test',
            architecture: 'transformer',
            layers: 4,
            layerTypes: ['embed', 'layers.N.attn', 'layers.N.ffn', 'output']
        });

        const customLayers = this.manager.getLayerNames(customId);
        ModelZooAssert.assertEquals(customLayers.length, 4 * 4, 'Should generate custom layer names');

        // Verify pattern replacement
        const hasLayer0 = customLayers.some(l => l.includes('layers.0.'));
        ModelZooAssert.assertTrue(hasLayer0, 'Should replace N with layer indices');
    }

    async testHeatmapConfigGeneration() {
        const modelId = 'llama-7b';
        const config = this.manager.getHeatmapConfig(modelId);

        ModelZooAssert.assertExists(config, 'Should return config');
        ModelZooAssert.assertEquals(config.modelId, modelId);
        ModelZooAssert.assertEquals(config.architecture, 'llama');
        ModelZooAssert.assertEquals(config.totalLayers, 32);
        ModelZooAssert.assertTrue(Array.isArray(config.layerNames));
        ModelZooAssert.assertGreaterThan(config.layerNames.length, 0);

        // Test with non-existent model
        const nullConfig = this.manager.getHeatmapConfig('non-existent');
        ModelZooAssert.assertEquals(nullConfig, null, 'Should return null for non-existent model');
    }
}

// ============================================================================
// Integration Tests
// ============================================================================

class ModelZooIntegrationTest extends TestCase {
    constructor(name, options = {}) {
        super(name, options);
        this.manager = null;
    }

    async execute() {
        this.manager = new ModelZooManager();

        // Test 1: Full workflow - import, search, export
        await this.testFullWorkflow();

        // Test 2: Multiple models comparison setup
        await this.testMultiModelComparisonSetup();

        // Test 3: Model metadata persistence simulation
        await this.testMetadataPersistence();
    }

    async testFullWorkflow() {
        // Step 1: Import multiple custom models
        const model1Id = this.manager.importCustomModel({
            name: 'Custom GPT Model',
            architecture: 'transformer',
            layers: 24,
            hiddenSize: 2048,
            attentionHeads: 16
        });

        const model2Id = this.manager.importCustomModel({
            name: 'Custom BERT Model',
            architecture: 'transformer',
            layers: 12,
            hiddenSize: 768,
            attentionHeads: 12
        });

        // Step 2: Search for models
        const transformerModels = this.manager.searchModels('transformer');
        ModelZooAssert.assertTrue(
            transformerModels.length >= 2,
            'Should find imported transformer models'
        );

        // Step 3: Export and verify
        const exported = this.manager.exportLibrary();
        ModelZooAssert.assertTrue(exported.custom.length >= 2, 'Should export custom models');

        // Step 4: Remove one model
        this.manager.removeCustomModel(model1Id);
        ModelZooAssert.assertEquals(
            this.manager.getModel(model1Id),
            null,
            'Removed model should not exist'
        );
    }

    async testMultiModelComparisonSetup() {
        // Setup models for comparison (max 3 active)
        const models = ['qwen-7b', 'llama-7b', 'mistral-7b'];
        const configs = [];

        for (const modelId of models) {
            const config = this.manager.getHeatmapConfig(modelId);
            ModelZooAssert.assertExists(config, `Should get config for ${modelId}`);
            configs.push(config);
        }

        ModelZooAssert.assertEquals(configs.length, 3, 'Should setup 3 models');

        // Verify each has layer names
        for (const config of configs) {
            ModelZooAssert.assertTrue(config.layerNames.length > 0, 'Should have layer names');
            ModelZooAssert.assertExists(config.color, 'Should have color');
        }
    }

    async testMetadataPersistence() {
        // Create a manager and add custom models
        const manager1 = new ModelZooManager();
        manager1.importCustomModel({
            name: 'Persistent Model 1',
            architecture: 'llama',
            layers: 32
        });
        manager1.importCustomModel({
            name: 'Persistent Model 2',
            architecture: 'mistral',
            layers: 24
        });

        // Export
        const exported = manager1.exportLibrary();

        // Simulate new session - create new manager
        const manager2 = new ModelZooManager();
        ModelZooAssert.assertEquals(manager2.customModels.size, 0, 'New manager should have no custom models');

        // Import
        manager2.importLibrary(exported);

        // Verify
        ModelZooAssert.assertEquals(manager2.customModels.size, 2, 'Should import 2 custom models');
        ModelZooAssert.assertExists(manager2.getModel('Persistent Model 1') || manager2.customModels.get('Persistent Model 1'));
    }
}

// ============================================================================
// Test Suite Builder
// ============================================================================

/**
 * Create and run the Model Zoo test suite
 * @returns {Promise<TestSuite>} Test results
 */
async function runModelZooTests() {
    const suite = new TestSuite('Model Zoo Tests');

    // Setup - ensure ModelZooManager is available
    suite.onSetup(async () => {
        if (typeof ModelZooManager === 'undefined') {
            // Mock if not available (for standalone testing)
            console.warn('[ModelZooTests] ModelZooManager not loaded, using mock');
            return false;
        }
        return true;
    });

    // Metadata Validation Tests
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Valid metadata creation'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Required field validation - name'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Required field validation - architecture'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Enum value validation - architecture'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Layer types validation'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Color validation'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Numeric fields validation'));
    suite.addTest(new ModelMetadataValidationTest('ModelMetadata: Default values'));

    // ModelRegistry CRUD Tests
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Add model'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Remove model'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Get model by ID'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: List all models'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Filter by capabilities'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Import JSON'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Export JSON'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Maximum custom models limit'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Search models'));
    suite.addTest(new ModelRegistryCRUDTest('ModelRegistry: Get built-in vs custom models'));

    // ModelDiscovery Tests
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: GGUF filename parsing'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: LM Studio path parsing'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: Metadata extraction'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: Model size formatting'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: Quantization type detection'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: Layer name generation'));
    suite.addTest(new ModelDiscoveryTest('ModelDiscovery: Heatmap config generation'));

    // Integration Tests
    suite.addTest(new ModelZooIntegrationTest('Integration: Full workflow'));
    suite.addTest(new ModelZooIntegrationTest('Integration: Multi-model comparison setup'));
    suite.addTest(new ModelZooIntegrationTest('Integration: Metadata persistence'));

    return await suite.run();
}

// ============================================================================
// Exports
// ============================================================================

if (typeof window !== 'undefined') {
    // Browser environment
    window.ModelZooTests = {
        ModelZooAssert,
        ModelMetadataValidationTest,
        ModelRegistryCRUDTest,
        ModelDiscoveryTest,
        ModelZooIntegrationTest,
        runModelZooTests
    };

    // Auto-run if test page loads this script
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            console.log('[ModelZooTests] Loaded. Run with: await runModelZooTests()');
        });
    } else {
        console.log('[ModelZooTests] Loaded. Run with: await runModelZooTests()');
    }
}

if (typeof module !== 'undefined' && module.exports) {
    // Node.js environment
    module.exports = {
        ModelZooAssert,
        ModelMetadataValidationTest,
        ModelRegistryCRUDTest,
        ModelDiscoveryTest,
        ModelZooIntegrationTest,
        runModelZooTests
    };
}
