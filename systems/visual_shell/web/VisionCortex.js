/**
 * VisionCortex - Visual Text Recognition and Semantic Analysis Module
 *
 * Provides OCR capabilities via Tesseract.js and semantic analysis
 * of UI elements for visual shell interactions.
 */

class VisionCortex {
  // Private configuration fields
  #config = {
    tesseractLang: 'eng',
    cacheTTL: 60000,        // 60 seconds default cache TTL
    cacheMaxSize: 100,      // Maximum cached entries
    defaultScale: 2,        // Default image scale factor for OCR
    lazyLoad: true,         // Lazy load Tesseract worker
    workerPath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/worker.min.js',
    corePath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract-core.wasm.js',
    langPath: 'https://tessdata.projectnaptha.com/4.0.0'
  };

  #tesseractWorker = null;
  #textCache = new Map();
  #isLoading = false;
  #isReady = false;
  #cacheOrder = [];

  /**
   * Create a new VisionCortex instance
   * @param {Object} config - Configuration options to override defaults
   */
  constructor(config = {}) {
    this.#config = { ...this.#config, ...config };
  }

  /**
   * Generate a fast hash for a canvas region
   * Samples pixels at intervals rather than full image hash
   * @private
   * @param {HTMLCanvasElement} canvas - Source canvas
   * @param {Object} region - Region to hash {x, y, width, height}
   * @returns {string} Hash string for the region
   */
  #hashRegion(canvas, region) {
    const ctx = canvas.getContext('2d');
    const { x, y, width, height } = region;

    // Get image data for the region
    const imageData = ctx.getImageData(x, y, width, height);
    const data = imageData.data;
    const pixelCount = width * height;

    // Sample pixels at intervals for fast hashing
    const sampleInterval = Math.max(1, Math.floor(pixelCount / 100));
    let hash = `${width}:${height}:`;

    for (let i = 0; i < data.length; i += 4 * sampleInterval) {
      // Sample RGB values (ignore alpha for hash)
      hash += `${data[i]},${data[i + 1]},${data[i + 2]};`;
    }

    return hash;
  }

  /**
   * Scale canvas for better OCR on pixel fonts or high-DPI
   * @private
   * @param {HTMLCanvasElement} canvas
   * @param {number} scale
   * @returns {HTMLCanvasElement}
   */
  #scaleCanvas(canvas, scale) {
    if (scale === 1.0) return canvas;

    const scaled = document.createElement('canvas');
    scaled.width = Math.floor(canvas.width * scale);
    scaled.height = Math.floor(canvas.height * scale);

    const ctx = scaled.getContext('2d');
    ctx.imageSmoothingEnabled = scale < 1.0; // Smooth for downscale only
    ctx.drawImage(canvas, 0, 0, scaled.width, scaled.height);

    return scaled;
  }

  /**
   * Extract region from canvas
   * @private
   * @param {HTMLCanvasElement} canvas
   * @param {Object} region
   * @returns {HTMLCanvasElement}
   */
  #extractRegion(canvas, region) {
    if (!region) return canvas;

    const { x, y, width, height } = region;
    const extracted = document.createElement('canvas');
    extracted.width = width;
    extracted.height = height;

    const ctx = extracted.getContext('2d');
    ctx.drawImage(canvas, x, y, width, height, 0, 0, width, height);

    return extracted;
  }

  /**
   * Normalize bounds from scaled coordinates back to original
   * @private
   */
  #unscaleBounds(bounds, scale) {
    return {
      x: Math.floor(bounds.x / scale),
      y: Math.floor(bounds.y / scale),
      width: Math.floor(bounds.width / scale),
      height: Math.floor(bounds.height / scale)
    };
  }

  /**
   * Get cached result if available and not expired
   * @private
   * @param {string} hash - Cache key to look up
   * @returns {Object|null} Cached result or null if not found/expired
   */
  #getCached(hash) {
    if (!this.#textCache.has(hash)) {
      return null;
    }

    const cached = this.#textCache.get(hash);
    const now = Date.now();

    // Check if TTL has expired
    if (now - cached.timestamp > this.#config.cacheTTL) {
      // Remove expired entry
      this.#textCache.delete(hash);
      const orderIndex = this.#cacheOrder.indexOf(hash);
      if (orderIndex !== -1) {
        this.#cacheOrder.splice(orderIndex, 1);
      }
      return null;
    }

    return cached.result;
  }

  /**
   * Store result in cache with LRU eviction
   * @private
   * @param {string} hash - Cache key
   * @param {Object} result - Result to cache
   */
  #setCache(hash, result) {
    // Implement LRU eviction - remove oldest entries if cache is full
    while (this.#textCache.size >= this.#config.cacheMaxSize) {
      const oldestHash = this.#cacheOrder.shift();
      if (oldestHash) {
        this.#textCache.delete(oldestHash);
      }
    }

    // Store the result with timestamp
    this.#textCache.set(hash, {
      result,
      timestamp: Date.now()
    });

    // Add hash to end of cache order (most recently used)
    this.#cacheOrder.push(hash);
  }

  /**
   * Scale a canvas by the given factor
   * @private
   * @param {HTMLCanvasElement} canvas - Source canvas to scale
   * @param {number} scale - Scale factor (1.0 = no scaling)
   * @returns {HTMLCanvasElement} New scaled canvas or original if scale is 1.0
   */
  #scaleCanvas(canvas, scale) {
    // Return unchanged if no scaling needed
    if (scale === 1.0) {
      return canvas;
    }

    const scaledWidth = Math.floor(canvas.width * scale);
    const scaledHeight = Math.floor(canvas.height * scale);

    // Create new canvas with scaled dimensions
    const scaledCanvas = document.createElement('canvas');
    scaledCanvas.width = scaledWidth;
    scaledCanvas.height = scaledHeight;

    const ctx = scaledCanvas.getContext('2d');

    // Enable smoothing for downscaling, disable for upscaling
    ctx.imageSmoothingEnabled = scale < 1.0;
    ctx.imageSmoothingQuality = 'high';

    // Draw scaled image
    ctx.drawImage(canvas, 0, 0, scaledWidth, scaledHeight);

    return scaledCanvas;
  }

  /**
   * Extract a specific region from a canvas
   * @private
   * @param {HTMLCanvasElement} canvas - Source canvas
   * @param {Object} region - Region to extract {x, y, width, height}
   * @returns {HTMLCanvasElement} New canvas with extracted region or original if no region
   */
  #extractRegion(canvas, region) {
    // Return unchanged if no region specified
    if (!region) {
      return canvas;
    }

    const { x, y, width, height } = region;

    // Create new canvas with region dimensions
    const regionCanvas = document.createElement('canvas');
    regionCanvas.width = width;
    regionCanvas.height = height;

    const ctx = regionCanvas.getContext('2d');

    // Draw only the specified region from source
    ctx.drawImage(
      canvas,
      x, y, width, height,    // Source rectangle
      0, 0, width, height     // Destination rectangle
    );

    return regionCanvas;
  }

  /**
   * Unscale bounds coordinates by dividing by scale factor
   * @private
   * @param {Object} bounds - Bounds to unscale {x, y, width, height}
   * @param {number} scale - Scale factor to divide by
   * @returns {Object} New bounds object with unscaled values
   */
  #unscaleBounds(bounds, scale) {
    return {
      x: Math.floor(bounds.x / scale),
      y: Math.floor(bounds.y / scale),
      width: Math.floor(bounds.width / scale),
      height: Math.floor(bounds.height / scale)
    };
  }

  /**
   * Initialize the VisionCortex module
   * Loads Tesseract worker and prepares for recognition
   * @returns {Promise<void>}
   */
  async initialize() {
    // Return early if already ready
    if (this.#isReady) {
      return;
    }

    // Handle concurrent initialization - wait if already loading
    if (this.#isLoading) {
      // Poll until ready (max 30 seconds)
      const maxWait = 300;
      let waited = 0;
      while (!this.#isReady && waited < maxWait) {
        await new Promise(resolve => setTimeout(resolve, 100));
        waited++;
      }
      if (this.#isReady) {
        return;
      }
      throw new Error('VisionCortex.initialize: Initialization timeout');
    }

    // Set loading flag
    this.#isLoading = true;

    try {
      // Load Tesseract.js from CDN if not available
      if (typeof window.Tesseract === 'undefined') {
        await this.#loadTesseractScript();
      }

      // Create Tesseract worker with configured paths
      const workerConfig = {
        logger: (m) => {
          // Silent by default, could be configured for debugging
          if (m.status === 'recognize text') {
            // Progress updates during recognition
          }
        }
      };

      // Add custom paths if configured
      if (this.#config.workerPath) {
        workerConfig.workerPath = this.#config.workerPath;
      }
      if (this.#config.corePath) {
        workerConfig.corePath = this.#config.corePath;
      }
      if (this.#config.langPath) {
        workerConfig.langPath = this.#config.langPath;
      }

      this.#tesseractWorker = await window.Tesseract.createWorker(
        this.#config.tesseractLang,
        1,
        workerConfig
      );

      // Set ready flag on success
      this.#isReady = true;
    } catch (error) {
      // Reset loading flag on error
      this.#isLoading = false;
      throw new Error(`VisionCortex.initialize: ${error.message}`);
    }
  }

  /**
   * Load Tesseract.js script from CDN
   * @private
   * @returns {Promise<void>} Resolves when script is loaded
   */
  #loadTesseractScript() {
    return new Promise((resolve, reject) => {
      const script = document.createElement('script');
      script.src = 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js';
      script.async = true;

      script.onload = () => {
        resolve();
      };

      script.onerror = () => {
        reject(new Error('Failed to load Tesseract.js from CDN'));
      };

      document.head.appendChild(script);
    });
  }

  async recognize(canvas, region = null, options = {}) {
    const scale = options.scale || this.#config.defaultScale;
    const startTime = performance.now();

    try {
      // Validate canvas
      if (!canvas || !(canvas instanceof HTMLCanvasElement)) {
        throw new Error('Invalid canvas: expected HTMLCanvasElement');
      }

      // Default to full canvas
      const targetRegion = region || {
        x: 0,
        y: 0,
        width: canvas.width,
        height: canvas.height
      };

      // Check cache
      const hash = this.#hashRegion(canvas, targetRegion);
      if (hash) {
        const cached = this.#getCached(hash);
        if (cached) {
          // console.log('[VisionCortex] Cache hit for region');
          return {
            ...cached,
            fromCache: true,
            processing_time_ms: performance.now() - startTime
          };
        }
      }

      // Ensure Tesseract is ready (lazy load)
      if (!this.#isReady) {
        await this.initialize();
      }

      // Prepare image for OCR
      const regionCanvas = this.#extractRegion(canvas, targetRegion);
      const scaledCanvas = this.#scaleCanvas(regionCanvas, scale);

      // Run OCR
      // console.log(`[VisionCortex] Running OCR on region ${targetRegion.width}x${targetRegion.height} at scale ${scale}`);
      const result = await this.#tesseractWorker.recognize(scaledCanvas);

      // Process results
      const output = {
        success: true,
        text: result.data.text,
        confidence: result.data.confidence / 100, // Normalize to 0-1
        regions: result.data.words.map(word => ({
          text: word.text,
          bounds: this.#unscaleBounds({
            x: word.bbox.x0,
            y: word.bbox.y0,
            width: word.bbox.x1 - word.bbox.x0,
            height: word.bbox.y1 - word.bbox.y0
          }, scale),
          confidence: word.confidence / 100
        })),
        processing_time_ms: performance.now() - startTime,
        fromCache: false
      };

      // Cache result
      if (hash) {
        this.#setCache(hash, output);
      }

      // console.log(`[VisionCortex] OCR complete: ${output.regions.length} words, confidence ${(output.confidence * 100).toFixed(1)}%`);
      return output;

    } catch (error) {
      console.error('[VisionCortex] OCR failed:', error);
      return {
        success: false,
        error: error.message,
        text: '',
        confidence: 0,
        regions: [],
        processing_time_ms: performance.now() - startTime
      };
    }
  }

  /**
   * Find a UI element by label and type
   * @param {string} label - Text label to search for
   * @param {string} type - Element type ('button', 'input', 'text', etc.)
   * @param {HTMLCanvasElement} canvas - Source canvas
   * @param {Object} options - Search options
   * @throws {Error} Always throws 'Not implemented'
   */
  async findElement(label, type, canvas, options = {}) {
    throw new Error('VisionCortex.findElement: Not implemented');
  }

  /**
   * Get semantic frame analysis of canvas
   * @param {HTMLCanvasElement} canvas - Source canvas
   * @throws {Error} Always throws 'Not implemented'
   */
  async getSemanticFrame(canvas) {
    throw new Error('VisionCortex.getSemanticFrame: Not implemented');
  }

  /**
   * Clear the text recognition cache
   */
  clearCache() {
    this.#textCache.clear();
    this.#cacheOrder = [];
  }

  /**
   * Check if VisionCortex is ready for recognition
   * @returns {boolean}
   */
  get isReady() {
    return this.#isReady;
  }
}

// Export for CommonJS environments
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { VisionCortex };
}
