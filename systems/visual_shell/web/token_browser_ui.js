/**
 * Geometry OS: Semantic Token Browser UI
 *
 * Phase 28: Holographic Token Browser
 *
 * A visual interface for browsing and selecting pre-built semantic tokens.
 * Each token can expand into hundreds of RISC-V instructions.
 *
 * @module token_browser_ui
 */

class TokenBrowserUI {
    /**
     * Create a new TokenBrowserUI
     * @param {PIXI.Application} app - PixiJS application instance
     * @param {GeometricCanvas} canvas - Geometric canvas instance (for painting tokens)
     * @param {Object} options - Configuration options
     */
    constructor(app, canvas, options = {}) {
        this.app = app;
        this.canvas = canvas;
        this.options = {
            x: 240,
            y: 20,
            width: 320,
            height: 600,
            collapsed: false,
            ...options
        };

        // Components
        this.library = null;
        this.container = null;
        this.background = null;
        this.header = null;
        this.contentArea = null;
        this.categoryTabs = [];
        this.tokenList = [];

        // State
        this.isVisible = false;
        this.currentCategory = 'all';
        this.selectedToken = null;

        console.log('🗂️  TokenBrowserUI initialized');
    }

    /**
     * Initialize the browser UI
     */
    async initialize() {
        console.log('═══════════════════════════════════════════════════════════');
        console.log('     SEMANTIC TOKEN BROWSER                                      ');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        // Initialize token library
        this.library = new SemanticTokenLibrary();
        this.library.initialize();

        // Create main container
        this.container = new PIXI.Container();
        this.container.x = this.options.x;
        this.container.y = this.options.y;
        this.container.visible = this.isVisible;

        // Create background
        this._createBackground();

        // Create header
        this._createHeader();

        // Create category tabs
        this._createCategoryTabs();

        // Create token list area
        this._createTokenList();

        // Add to stage
        this.app.stage.addChild(this.container);

        console.log('✅ Token Browser ready');
        console.log(`   Loaded ${this.library.tokens.size} tokens in ${this.library.categories.size} categories`);
        console.log('');
    }

    /**
     * Create the browser background
     * @private
     */
    _createBackground() {
        this.background = new PIXI.Graphics();

        // Semi-transparent dark background
        this.background.beginFill(0x0a0a0a, 0.98);
        this.background.drawRoundedRect(0, 0, this.options.width, this.options.height, 12);
        this.background.endFill();

        // Border
        this.background.lineStyle(2, 0x8B008B, 0.6);
        this.background.drawRoundedRect(0, 0, this.options.width, this.options.height, 12);
        this.background.endFill();

        this.container.addChild(this.background);
    }

    /**
     * Create the header
     * @private
     */
    _createHeader() {
        this.header = new PIXI.Container();
        this.header.y = 15;

        // Title
        const titleText = new PIXI.Text('SEMANTIC TOKENS', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x8B008B,
            fontWeight: 'bold',
            letterSpacing: 2
        });
        titleText.x = 15;
        this.header.addChild(titleText);

        // Stats
        const statsText = new PIXI.Text(`${this.library.tokens.size} TOKENS`, {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0x888888
        });
        statsText.x = this.options.width - 70;
        this.header.addChild(statsText);

        // Close button
        const closeButton = this._createCloseButton();
        closeButton.x = this.options.width - 25;
        this.header.addChild(closeButton);

        this.container.addChild(this.header);
    }

    /**
     * Create close button
     * @private
     */
    _createCloseButton() {
        const btn = new PIXI.Container();

        const bg = new PIXI.Graphics();
        bg.beginFill(0xFF0000, 0.3);
        bg.drawCircle(10, 10, 8);
        bg.endFill();
        btn.addChild(bg);

        const x = new PIXI.Graphics();
        x.lineStyle(2, 0xFFFFFF);
        x.moveTo(5, 5);
        x.lineTo(15, 15);
        x.moveTo(15, 5);
        x.lineTo(5, 15);
        btn.addChild(x);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this.hide());

        return btn;
    }

    /**
     * Create category tabs
     * @private
     */
    _createCategoryTabs() {
        const tabsContainer = new PIXI.Container();
        tabsContainer.y = 50;

        const categories = [
            { id: 'all', name: 'ALL', color: 0x888888 },
            { id: 'computation', name: 'COMPUTE', color: 0x4169E1 },
            { id: 'crypto', name: 'CRYPTO', color: 0x8B008B },
            { id: 'ai', name: 'NEURAL', color: 0xFF1493 },
            { id: 'io', name: 'I/O', color: 0x32CD32 },
            { id: 'system', name: 'SYSTEM', color: 0xFF4500 }
        ];

        let x = 15;
        for (const cat of categories) {
            const tab = this._createCategoryTab(cat, x);
            tabsContainer.addChild(tab);
            this.categoryTabs.push({ id: cat.id, container: tab });
            x += tab.width + 5;
        }

        this.container.addChild(tabsContainer);
    }

    /**
     * Create a single category tab
     * @private
     */
    _createCategoryTab(category, x) {
        const tab = new PIXI.Container();
        tab.x = x;

        const bg = new PIXI.Graphics();
        bg.beginFill(category.id === 'all' ? 0x2a2a2a : 0x1a1a1a, 1);
        bg.lineStyle(1, category.color, 0.5);
        bg.drawRoundedRect(0, 0, 50, 24, 4);
        bg.endFill();
        tab.addChild(bg);

        const text = new PIXI.Text(category.name, {
            fontFamily: 'Courier New',
            fontSize: 9,
            fill: category.color,
            fontWeight: 'bold'
        });
        text.x = (50 - text.width) / 2;
        text.y = 5;
        tab.addChild(text);

        tab.width = 50;
        tab.categoryId = category.id;

        tab.eventMode = 'static';
        tab.cursor = 'pointer';
        tab.on('pointerdown', () => this._selectCategory(category.id));

        return tab;
    }

    /**
     * Create token list area
     * @private
     */
    _createTokenList() {
        this.contentArea = new PIXI.Container();
        this.contentArea.y = 85;

        // Create scrollable area
        const scrollBg = new PIXI.Graphics();
        scrollBg.beginFill(0x111111, 0.5);
        scrollBg.drawRoundedRect(15, 0, this.options.width - 30, this.options.height - 100, 8);
        scrollBg.endFill();
        this.contentArea.addChild(scrollBg);

        // Populate with tokens
        this._populateTokenList();

        this.container.addChild(this.contentArea);
    }

    /**
     * Populate the token list with tokens
     * @private
     */
    _populateTokenList() {
        // Clear existing items
        for (const item of this.tokenList) {
            this.contentArea.removeChild(item.container);
        }
        this.tokenList = [];

        let y = 10;
        const maxWidth = this.options.width - 50;

        // Get tokens for current category
        const tokens = this.currentCategory === 'all'
            ? Array.from(this.library.tokens.values())
            : this.library.getTokensByCategory(this.currentCategory);

        // Sort by complexity
        tokens.sort((a, b) => b.complexity - a.complexity);

        for (const token of tokens) {
            const item = this._createTokenListItem(token, maxWidth);
            item.container.y = y;
            this.contentArea.addChild(item.container);
            this.tokenList.push(item);
            y += item.height + 8;

            if (y > this.options.height - 120) break; // Max visible items
        }
    }

    /**
     * Create a single token list item
     * @private
     */
    _createTokenListItem(token, maxWidth) {
        const item = new PIXI.Container();
        const height = 50;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x1a1a1a, 0.9);
        bg.lineStyle(1, token.color, 0.4);
        bg.drawRoundedRect(0, 0, maxWidth, height, 6);
        bg.endFill();
        item.addChild(bg);

        // Color indicator
        const indicator = new PIXI.Graphics();
        indicator.beginFill(token.color, 1);
        indicator.drawRect(0, 0, 4, height);
        indicator.endFill();
        item.addChild(indicator);

        // Token name
        const nameText = new PIXI.Text(token.name, {
            fontFamily: 'Courier New',
            fontSize: 11,
            fill: 0xFFFFFF,
            fontWeight: 'bold'
        });
        nameText.x = 12;
        nameText.y = 8;
        item.addChild(nameText);

        // Token details
        const detailsText = new PIXI.Text(
            `${token.instructionCount} instr | ${Math.round(token.complexity * 100)}% complexity`,
            {
                fontFamily: 'Courier New',
                fontSize: 9,
                fill: 0x888888
            }
        );
        detailsText.x = 12;
        detailsText.y = 26;
        item.addChild(detailsText);

        // Paint button
        const paintBtn = this._createPaintButton(token);
        paintBtn.x = maxWidth - 60;
        paintBtn.y = 10;
        item.addChild(paintBtn);

        // Info button
        const infoBtn = this._createInfoButton(token);
        infoBtn.x = maxWidth - 60;
        infoBtn.y = 30;
        item.addChild(infoBtn);

        item.height = height;
        return { container: item, token };
    }

    /**
     * Create paint button for a token
     * @private
     */
    _createPaintButton(token) {
        const btn = new PIXI.Container();

        const bg = new PIXI.Graphics();
        bg.beginFill(token.color, 0.3);
        bg.drawRoundedRect(0, 0, 55, 16, 3);
        bg.endFill();
        btn.addChild(bg);

        const text = new PIXI.Text('PAINT', {
            fontFamily: 'Courier New',
            fontSize: 8,
            fill: token.color,
            fontWeight: 'bold'
        });
        text.x = (55 - text.width) / 2;
        text.y = 3;
        btn.addChild(text);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this._paintToken(token));

        return btn;
    }

    /**
     * Create info button for a token
     * @private
     */
    _createInfoButton(token) {
        const btn = new PIXI.Container();

        const bg = new PIXI.Graphics();
        bg.beginFill(0x333333, 0.5);
        bg.drawRoundedRect(0, 0, 55, 16, 3);
        bg.endFill();
        btn.addChild(bg);

        const text = new PIXI.Text('INFO', {
            fontFamily: 'Courier New',
            fontSize: 8,
            fill: 0xAAAAAA
        });
        text.x = (55 - text.width) / 2;
        text.y = 3;
        btn.addChild(text);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this._showTokenInfo(token));

        return btn;
    }

    /**
     * Handle category selection
     * @private
     */
    _selectCategory(categoryId) {
        this.currentCategory = categoryId;

        // Update tab visuals
        for (const tab of this.categoryTabs) {
            const isSelected = tab.id === categoryId;
            tab.container.children[0].clear();
            tab.container.children[0].beginFill(isSelected ? 0x2a2a2a : 0x1a1a1a, 1);
            tab.container.children[0].lineStyle(1, 0, isSelected ? 0.8 : 0.3);
            tab.container.children[0].drawRoundedRect(0, 0, 50, 24, 4);
            tab.container.children[0].endFill();
        }

        // Refresh token list
        this._populateTokenList();
    }

    /**
     * Paint a token onto the canvas
     * @private
     */
    _paintToken(token) {
        if (!this.canvas) {
            console.warn('⚠️  No canvas available for painting');
            return;
        }

        // Create brush from token
        const brush = {
            color: token.color,
            category: token.category,
            operation: token.name
        };

        // Set as current brush
        this.canvas.setBrush(brush);

        console.log(`🖌️  Token brush selected: ${token.name}`);
        console.log(`   Color: 0x${token.color.toString(16).padStart(6, '0')}`);
        console.log(`   Expands to: ${token.instructionCount} instructions`);
        console.log('');
    }

    /**
     * Show token information
     * @private
     */
    _showTokenInfo(token) {
        const info = `
═══════════════════════════════════════════════════════════
  ${token.name}
═══════════════════════════════════════════════════════════

  Category:    ${token.category.toUpperCase()}
  Token ID:    0x${token.tokenId.toString(16).padStart(6, '0').toUpperCase()}
  Color:       #${token.color.toString(16).padStart(6, '0').toUpperCase()}

  Expands to:  ${token.instructionCount} RISC-V instructions
  Complexity:  ${(token.complexity * 100).toFixed(1)}%
  Stability:   ${(token.stability * 100).toFixed(1)}%

  Click "PAINT" to use this token on the canvas.
  A single pixel = ${token.instructionCount} instructions.

═══════════════════════════════════════════════════════════
        `;
        console.log(info);

        // Also show as alert for visibility
        alert(`${token.name}\n\n${token.instructionCount} instructions\n${(token.complexity * 100).toFixed(1)}% complexity`);
    }

    /**
     * Show the browser
     */
    show() {
        this.isVisible = true;
        this.container.visible = true;
        console.log('🗂️  Token Browser shown');
    }

    /**
     * Hide the browser
     */
    hide() {
        this.isVisible = false;
        this.container.visible = false;
        console.log('🗂️  Token Browser hidden');
    }

    /**
     * Toggle visibility
     */
    toggle() {
        if (this.isVisible) {
            this.hide();
        } else {
            this.show();
        }
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            totalTokens: this.library.tokens.size,
            categories: this.library.categories.size,
            totalInstructions: this.library._calculateTotalInstructions(),
            currentCategory: this.currentCategory
        };
    }
}

/**
 * Factory function to create and initialize the token browser
 */
async function createTokenBrowser(app, canvas, options = {}) {
    const browser = new TokenBrowserUI(app, canvas, options);
    await browser.initialize();
    return browser;
}

// Export for browser
if (typeof window !== 'undefined') {
    window.TokenBrowserUI = TokenBrowserUI;
    window.createTokenBrowser = createTokenBrowser;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        TokenBrowserUI,
        createTokenBrowser
    };
}
