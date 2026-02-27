/**
 * Geometry OS: Morphological Sound Synthesizer
 *
 * Converts SDF geometric properties to audio synthesis parameters.
 * Every morphological glyph becomes a visual-sonic entity.
 *
 * Architecture:
 * [MorphologicalGlyph] → [SDF Parameters] → [Audio Synthesis] → [Visual-Sonic Output]
 *         ↓                      ↓                   ↓
 *   [Shape]              [Frequency]          [Oscillator]
 *   [Size]               [Amplitude]          [Gain Node]
 *   [Rotation]           [Timbre]             [Filter]
 *   [Position]           [Spatial]            [Panner]
 */

export class MorphologicalSound {
    constructor(options = {}) {
        // Audio context
        this.audioContext = null;
        this.masterGain = null;
        this.compressor = null;
        this.reverb = null;
        this.enabled = false;

        // Synthesis parameters
        this.baseFrequency = options.baseFrequency || 220; // A3
        this.scale = options.scale || 'pentatonic'; // pentatonic, major, minor, geometric
        this.polyphony = options.polyphony || 8;
        this.attackTime = options.attackTime || 0.05;
        this.decayTime = options.decayTime || 0.1;
        this.sustainLevel = options.sustainLevel || 0.3;
        this.releaseTime = options.releaseTime || 0.5;

        // Active voices
        this.voices = new Map();
        this.voicePool = [];

        // Visual-sonic mapping
        this.mappings = {
            // Shape → Waveform
            shapeToWaveform: {
                'triangle': 'triangle',
                'circle': 'sine',
                'square': 'square',
                'hexagon': 'sawtooth',
                'diamond': 'triangle',
                'spiral': 'sine',
                'hilbert': 'custom'
            },
            // Size → Frequency multiplier
            sizeToFreq: (size) => {
                // Smaller = higher frequency
                return Math.pow(2, (1 - size) * 2);
            },
            // Position X → Pan
            xToPan: (x, width) => {
                return (x / width) * 2 - 1;
            },
            // Position Y → Filter frequency
            yToFilter: (y, height) => {
                return 200 + (y / height) * 2000;
            },
            // Rotation → Vibrato depth
            rotationToVibrato: (rotation) => {
                return Math.abs(rotation) * 10;
            },
            // Color → Harmonics
            colorToHarmonics: (color) => {
                const hue = this._rgbToHue(color);
                return {
                    h2: Math.sin(hue * Math.PI / 180) * 0.5,
                    h3: Math.cos(hue * Math.PI / 180) * 0.3,
                    h4: Math.sin(hue * Math.PI / 90) * 0.2
                };
            }
        };

        // Scale definitions (frequencies relative to base)
        this.scales = {
            pentatonic: [1, 1.125, 1.25, 1.5, 1.667, 2],
            major: [1, 1.122, 1.26, 1.335, 1.498, 1.682, 1.888, 2],
            minor: [1, 1.122, 1.189, 1.335, 1.498, 1.587, 1.782, 2],
            geometric: [1, 1.414, 1.618, 2, 2.414, 2.618, 3], // sqrt(2), phi, etc.
            hilbert: [1, 1.189, 1.335, 1.498, 1.682, 2, 2.244, 2.37, 2.667, 2.996, 3]
        };

        // Event handlers
        this.onVoiceStart = options.onVoiceStart || (() => {});
        this.onVoiceEnd = options.onVoiceEnd || (() => {});

        console.log('[MorphologicalSound] Initialized');
    }

    /**
     * Initialize audio context (must be called after user gesture).
     */
    async init() {
        try {
            this.audioContext = new (window.AudioContext || window.webkitAudioContext)();

            // Master chain
            this.compressor = this.audioContext.createDynamicsCompressor();
            this.compressor.threshold.value = -24;
            this.compressor.knee.value = 30;
            this.compressor.ratio.value = 12;
            this.compressor.attack.value = 0.003;
            this.compressor.release.value = 0.25;

            this.masterGain = this.audioContext.createGain();
            this.masterGain.gain.value = 0.5;

            // Create reverb
            this.reverb = await this._createReverb();

            // Connect chain
            this.masterGain.connect(this.compressor);
            this.compressor.connect(this.reverb.input);
            this.reverb.output.connect(this.audioContext.destination);
            this.compressor.connect(this.audioContext.destination); // Dry signal

            this.enabled = true;

            // Initialize voice pool
            this._initVoicePool();

            console.log('[MorphologicalSound] Audio context ready');
            return true;
        } catch (e) {
            console.error('[MorphologicalSound] Failed to init audio:', e);
            return false;
        }
    }

    /**
     * Create reverb impulse response.
     */
    async _createReverb() {
        const convolver = this.audioContext.createConvolver();
        const length = this.audioContext.sampleRate * 2; // 2 second reverb
        const impulse = this.audioContext.createBuffer(2, length, this.audioContext.sampleRate);

        for (let channel = 0; channel < 2; channel++) {
            const channelData = impulse.getChannelData(channel);
            for (let i = 0; i < length; i++) {
                channelData[i] = (Math.random() * 2 - 1) * Math.pow(1 - i / length, 2);
            }
        }

        convolver.buffer = impulse;

        const reverbGain = this.audioContext.createGain();
        reverbGain.gain.value = 0.3;

        return {
            input: convolver,
            output: reverbGain
        };
    }

    /**
     * Initialize voice pool for efficient reuse.
     */
    _initVoicePool() {
        for (let i = 0; i < this.polyphony; i++) {
            this.voicePool.push({
                id: `voice-${i}`,
                active: false,
                oscillator: null,
                gainNode: null,
                filter: null,
                panner: null
            });
        }
    }

    /**
     * Play a morphological glyph as sound.
     */
    playGlyph(glyph) {
        if (!this.enabled || !this.audioContext) return null;

        // Get available voice
        const voice = this.voicePool.find(v => !v.active);
        if (!voice) {
            console.warn('[MorphologicalSound] No available voices');
            return null;
        }

        // Extract glyph properties
        const props = this._extractGlyphProperties(glyph);

        // Create synthesis chain
        const chain = this._createSynthesisChain(voice, props);

        // Start sound
        this._startVoice(voice, chain, props);

        return voice.id;
    }

    /**
     * Extract sound-relevant properties from glyph.
     */
    _extractGlyphProperties(glyph) {
        return {
            shape: glyph.shape || 'circle',
            size: Math.max(0, Math.min(1, glyph.size || 0.5)),
            x: glyph.x || 0,
            y: glyph.y || 0,
            width: glyph.width || 800,
            height: glyph.height || 600,
            rotation: glyph.rotation || 0,
            color: glyph.color || 0x00ff88,
            velocity: glyph.velocity || 0.5,
            duration: glyph.duration || 1.0,
            morphState: glyph.morphState || 'stable' // expanding, contracting, stable
        };
    }

    /**
     * Create synthesis chain for voice.
     */
    _createSynthesisChain(voice, props) {
        // Oscillator
        const oscillator = this.audioContext.createOscillator();
        oscillator.type = this.mappings.shapeToWaveform[props.shape] || 'sine';

        // Calculate frequency from size and scale
        const scaleNotes = this.scales[this.scale];
        const noteIndex = Math.floor(props.size * (scaleNotes.length - 1));
        const freqMultiplier = scaleNotes[noteIndex] * this.mappings.sizeToFreq(props.size);
        oscillator.frequency.value = this.baseFrequency * freqMultiplier;

        // Harmonics (additive synthesis)
        const harmonics = this.mappings.colorToHarmonics(props.color);

        // Gain (envelope)
        const gainNode = this.audioContext.createGain();
        gainNode.gain.value = 0;

        // Filter
        const filter = this.audioContext.createBiquadFilter();
        filter.type = 'lowpass';
        filter.frequency.value = this.mappings.yToFilter(props.y, props.height);
        filter.Q.value = 1 + props.velocity * 5;

        // Panner (spatial)
        const panner = this.audioContext.createStereoPanner();
        panner.pan.value = this.mappings.xToPan(props.x, props.width);

        // Connect chain
        oscillator.connect(filter);
        filter.connect(gainNode);
        gainNode.connect(panner);
        panner.connect(this.masterGain);

        // Morph state modulation
        if (props.morphState === 'expanding') {
            // Rising pitch and volume for expanding
            oscillator.frequency.setValueAtTime(
                oscillator.frequency.value * 0.5,
                this.audioContext.currentTime
            );
            oscillator.frequency.exponentialRampToValueAtTime(
                oscillator.frequency.value * 2,
                this.audioContext.currentTime + props.duration
            );
        } else if (props.morphState === 'contracting') {
            // Falling pitch for contracting
            oscillator.frequency.setValueAtTime(
                oscillator.frequency.value * 2,
                this.audioContext.currentTime
            );
            oscillator.frequency.exponentialRampToValueAtTime(
                oscillator.frequency.value * 0.5,
                this.audioContext.currentTime + props.duration
            );
        }

        return { oscillator, gainNode, filter, panner, harmonics, props };
    }

    /**
     * Start voice with ADSR envelope.
     */
    _startVoice(voice, chain, props) {
        const { oscillator, gainNode, filter } = chain;
        const now = this.audioContext.currentTime;
        const velocity = props.velocity * 0.5; // Scale velocity

        voice.active = true;
        voice.oscillator = oscillator;
        voice.gainNode = gainNode;
        voice.filter = filter;
        voice.startTime = now;

        // ADSR envelope
        // Attack
        gainNode.gain.setValueAtTime(0, now);
        gainNode.gain.linearRampToValueAtTime(velocity, now + this.attackTime);

        // Decay
        gainNode.gain.linearRampToValueAtTime(
            velocity * this.sustainLevel,
            now + this.attackTime + this.decayTime
        );

        // Start oscillator
        oscillator.start(now);

        // Schedule release
        const releaseStart = now + props.duration - this.releaseTime;
        gainNode.gain.setValueAtTime(gainNode.gain.value, releaseStart);
        gainNode.gain.linearRampToValueAtTime(0, now + props.duration);

        // Auto-cleanup
        oscillator.stop(now + props.duration + 0.1);
        oscillator.onended = () => {
            voice.active = false;
            this.onVoiceEnd(voice.id);
        };

        this.voices.set(voice.id, voice);
        this.onVoiceStart(voice.id, props);
    }

    /**
     * Stop a specific voice.
     */
    stopVoice(voiceId) {
        const voice = this.voices.get(voiceId);
        if (!voice || !voice.active) return;

        const now = this.audioContext.currentTime;
        voice.gainNode.gain.cancelScheduledValues(now);
        voice.gainNode.gain.linearRampToValueAtTime(0, now + this.releaseTime);

        voice.oscillator.stop(now + this.releaseTime + 0.1);
    }

    /**
     * Play a sequence of glyphs.
     */
    playSequence(glyphs, interval = 0.2) {
        const voiceIds = [];

        glyphs.forEach((glyph, i) => {
            setTimeout(() => {
                const id = this.playGlyph(glyph);
                if (id) voiceIds.push(id);
            }, i * interval * 1000);
        });

        return voiceIds;
    }

    /**
     * Play a Hilbert curve as sound (traverse the curve).
     */
    playHilbertCurve(points, duration = 5.0) {
        if (!this.enabled) return;

        const interval = duration / points.length;

        points.forEach((point, i) => {
            setTimeout(() => {
                this.playGlyph({
                    shape: 'circle',
                    size: 0.3 + (i / points.length) * 0.4,
                    x: point.x,
                    y: point.y,
                    width: 1,
                    height: 1,
                    color: this._hslToRgb(120 + (i / points.length) * 120, 70, 60),
                    velocity: 0.3,
                    duration: interval * 2,
                    morphState: 'stable'
                });
            }, i * interval * 1000);
        });
    }

    /**
     * Convert RGB to Hue for color mapping.
     */
    _rgbToHue(rgb) {
        const r = ((rgb >> 16) & 0xff) / 255;
        const g = ((rgb >> 8) & 0xff) / 255;
        const b = (rgb & 0xff) / 255;

        const max = Math.max(r, g, b);
        const min = Math.min(r, g, b);
        let h = 0;

        if (max !== min) {
            const d = max - min;
            switch (max) {
                case r: h = ((g - b) / d + (g < b ? 6 : 0)) / 6; break;
                case g: h = ((b - r) / d + 2) / 6; break;
                case b: h = ((r - g) / d + 4) / 6; break;
            }
        }

        return h * 360;
    }

    /**
     * Convert HSL to RGB.
     */
    _hslToRgb(h, s, l) {
        s /= 100;
        l /= 100;

        const c = (1 - Math.abs(2 * l - 1)) * s;
        const x = c * (1 - Math.abs((h / 60) % 2 - 1));
        const m = l - c / 2;

        let r = 0, g = 0, b = 0;

        if (h < 60) { r = c; g = x; b = 0; }
        else if (h < 120) { r = x; g = c; b = 0; }
        else if (h < 180) { r = 0; g = c; b = x; }
        else if (h < 240) { r = 0; g = x; b = c; }
        else if (h < 300) { r = x; g = 0; b = c; }
        else { r = c; g = 0; b = x; }

        return ((Math.round((r + m) * 255) << 16) |
                (Math.round((g + m) * 255) << 8) |
                Math.round((b + m) * 255));
    }

    /**
     * Set master volume.
     */
    setVolume(value) {
        if (this.masterGain) {
            this.masterGain.gain.value = Math.max(0, Math.min(1, value));
        }
    }

    /**
     * Set scale mode.
     */
    setScale(scale) {
        if (this.scales[scale]) {
            this.scale = scale;
            console.log(`[MorphologicalSound] Scale: ${scale}`);
        }
    }

    /**
     * Set base frequency.
     */
    setBaseFrequency(freq) {
        this.baseFrequency = Math.max(20, Math.min(2000, freq));
    }

    /**
     * Stop all voices.
     */
    stopAll() {
        for (const [id, voice] of this.voices) {
            this.stopVoice(id);
        }
        this.voices.clear();
    }

    /**
     * Suspend audio context.
     */
    suspend() {
        if (this.audioContext) {
            this.audioContext.suspend();
        }
    }

    /**
     * Resume audio context.
     */
    resume() {
        if (this.audioContext) {
            this.audioContext.resume();
        }
    }

    /**
     * Get active voice count.
     */
    getActiveVoiceCount() {
        let count = 0;
        for (const voice of this.voicePool) {
            if (voice.active) count++;
        }
        return count;
    }

    /**
     * Destroy synthesizer.
     */
    destroy() {
        this.stopAll();
        if (this.audioContext) {
            this.audioContext.close();
        }
        this.enabled = false;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MorphologicalSound;
}
