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

  async findElement(label, type = 'any', canvas, options = {}) {
    if (!canvas) {
      return {
        success: false,
        error: 'Canvas required',
        found: false,
        elements: []
      };
    }

    // Get OCR results
    const ocrResult = await this.recognize(canvas, null, { scale: options.scale });

    if (!ocrResult.success) {
      return {
        success: false,
        error: ocrResult.error,
        found: false,
        elements: []
      };
    }

    const searchLabel = label.toLowerCase();
    const exact = options.exact || false;

    // Find matching regions
    const matches = ocrResult.regions.filter(region => {
      const regionText = region.text.toLowerCase().trim();
      if (exact) {
        return regionText === searchLabel;
      }
      // Fuzzy match: contains or is contained by
      return regionText.includes(searchLabel) || searchLabel.includes(regionText);
    });

    // Process by type
    const elements = matches.map(match => {
      const element = {
        label: match.text,
        type: this.#detectElementType(match, type),
        bounds: match.bounds,
        center: {
          x: match.bounds.x + Math.floor(match.bounds.width / 2),
          y: match.bounds.y + Math.floor(match.bounds.height / 2)
        },
        confidence: match.confidence
      };

      // Expand bounds for buttons (add padding for click target)
      if (element.type === 'button') {
        element.clickBounds = {
          x: Math.max(0, element.bounds.x - 4),
          y: Math.max(0, element.bounds.y - 4),
          width: element.bounds.width + 8,
          height: element.bounds.height + 8
        };
      }

      return element;
    }).filter(el => type === 'any' || el.type === type);

    // Generate suggestions if not found
    let suggestion = null;
    if (elements.length === 0) {
      const allLabels = [...new Set(ocrResult.regions.map(r => r.text.trim()))];
      const similar = this.#findSimilarLabels(searchLabel, allLabels);
      suggestion = `No elements matching '${label}' found.` +
        (similar.length > 0 ? ` Similar: ${similar.join(', ')}` : '');
    }

    return {
      success: true,
      found: elements.length > 0,
      elements,
      count: elements.length,
      suggestion
    };
  }

  /**
   * Detect element type from OCR region
   * @private
   */
  #detectElementType(region, requestedType) {
    const text = region.text.toLowerCase();

    // Button heuristics
    const buttonWords = ['ok', 'cancel', 'submit', 'login', 'logout', 'save', 'delete', 'yes', 'no', 'apply', 'close'];
    if (buttonWords.includes(text)) return 'button';

    // Link heuristics (URLs, starts with http)
    if (text.startsWith('http') || text.includes('://')) return 'link';

    // Default to text
    return 'text';
  }

  /**
   * Find similar labels for suggestions
   * @private
   */
  #findSimilarLabels(search, labels) {
    return labels
      .filter(label => {
        const l = label.toLowerCase();
        // Levenshtein-like: check for common substrings
        return l.includes(search.substring(0, 3)) ||
          search.includes(l.substring(0, 3));
      })
      .slice(0, 3);
  }

  async getSemanticFrame(canvas, options = {}) {
    if (!canvas) {
      return {
        success: false,
        error: 'Canvas required',
        format: 'semantic'
      };
    }

    const startTime = performance.now();

    // Get OCR results
    const ocrResult = await this.recognize(canvas, null, { scale: options.scale });

    if (!ocrResult.success) {
      return {
        success: false,
        error: ocrResult.error,
        format: 'semantic'
      };
    }

    // Parse into semantic structures
    const semantic = {
      success: true,
      format: 'semantic',
      timestamp: Date.now(),
      screen: {
        width: canvas.width,
        height: canvas.height
      },
      windows: this.#parseWindows(ocrResult.regions),
      buttons: this.#parseButtons(ocrResult.regions),
      text_fields: this.#parseTextFields(ocrResult.regions),
      text_content: ocrResult.text,
      processing_time_ms: performance.now() - startTime
    };

    return semantic;
  }

  /**
   * Parse window-like structures from OCR regions
   * @private
   */
  #parseWindows(regions) {
    const windows = [];

    // Look for title bar patterns (centered text at top of regions)
    const titleCandidates = regions.filter(r =>
      r.text.length > 3 &&
      r.text.length < 50 &&
      !r.text.includes('\n') &&
      r.confidence > 0.8
    );

    // Group by vertical position (potential title bars)
    const titleGroups = new Map();
    for (const title of titleCandidates) {
      const yBucket = Math.floor(title.bounds.y / 50) * 50;
      if (!titleGroups.has(yBucket)) {
        titleGroups.set(yBucket, []);
      }
      titleGroups.get(yBucket).push(title);
    }

    // Convert to window objects
    for (const [yBucket, titles] of titleGroups) {
      for (const title of titles) {
        windows.push({
          id: `win_${windows.length}`,
          title: title.text,
          bounds: {
            x: title.bounds.x - 20,
            y: Math.max(0, title.bounds.y - 20),
            width: title.bounds.width + 40,
            height: 400 // Estimate
          },
          focused: windows.length === 0 // First window is focused
        });
      }
    }

    return windows;
  }

  /**
   * Parse button-like structures
   * @private
   */
  #parseButtons(regions) {
    const buttonWords = ['ok', 'cancel', 'submit', 'login', 'logout', 'save', 'delete', 'yes', 'no', 'apply', 'close', 'open', 'edit', 'view', 'help'];

    return regions
      .filter(r => {
        const text = r.text.toLowerCase().trim();
        return buttonWords.includes(text) ||
          (r.confidence > 0.9 && text.length < 20);
      })
      .map(r => ({
        label: r.text,
        bounds: r.bounds,
        enabled: true // Assume enabled unless we detect otherwise
      }));
  }

  /**
   * Parse text field structures
   * @private
   */
  #parseTextFields(regions) {
    // Look for input field labels (followed by empty space or cursor)
    const fieldLabels = ['search', 'input', 'name', 'email', 'password', 'address', 'url', 'query'];

    return regions
      .filter(r => {
        const text = r.text.toLowerCase().trim();
        return fieldLabels.some(label => text.includes(label));
      })
      .map(r => ({
        label: r.text,
        bounds: {
          x: r.bounds.x + r.bounds.width + 5,
          y: r.bounds.y,
          width: 200,
          height: r.bounds.height + 4
        },
        value: '',
        focused: false
      }));
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
} else {
  // Browser global
  window.VisionCortex = VisionCortex;
}
