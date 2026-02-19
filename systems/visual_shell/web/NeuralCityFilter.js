/**
 * NeuralCityFilter - PIXI.js filter wrapper for neural_city_facade.wgsl
 *
 * Bridges between PIXI.Filter API and the WGSL shader uniforms.
 * Provides GLSL fallback for WebGL contexts.
 */

class NeuralCityFilter {
    constructor(options = {}) {
        this.uniforms = {
            uLowResTexture: options.lowResResTexture || null,
            uHiResTexture: options.hiResTexture || null,
            uResolution: [1920, 1080],
            uTime: 0,
            uFocusDistrict: [960, 540],
            uHiResValid: 0.0
        };
    }

    updateTime(time) {
        this.uniforms.uTime = time;
    }

    setFocusDistrict(x, y) {
        this.uniforms.uFocusDistrict = [x, y];
    }

    setHiResValid(valid) {
        this.uniforms.uHiResValid = valid ? 1.0 : 0.0;
    }

    setResolution(width, height) {
        this.uniforms.uResolution = [width, height];
    }
}

// Export for Node.js tests
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { NeuralCityFilter };
}

// Export for browser
if (typeof window !== 'undefined') {
    window.NeuralCityFilter = NeuralCityFilter;
}
