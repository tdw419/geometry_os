/**
 * Volumetric Mind's Eye - 3D Semantic Strata Visualization
 *
 * Uses Three.js to render token orbs in 3D Hilbert space.
 * Z-axis represents Semantic Abstraction Depth.
 */

import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

export class VolumetricMindEye {
    constructor(containerId) {
        this.container = document.getElementById(containerId);
        this.orbs = new Map(); // path -> THREE.Mesh
        this.tokenOrbs = [];   // Floating token spheres

        this.init();
        this.connectWebSocket();
        this.animate();
    }

    init() {
        // Scene setup
        this.scene = new THREE.Scene();
        this.scene.background = new THREE.Color(0x0a0a0f);

        // Camera - positioned to see the full Hilbert cube
        const aspect = this.container.clientWidth / this.container.clientHeight;
        this.camera = new THREE.PerspectiveCamera(60, aspect, 0.1, 5000);
        this.camera.position.set(512, 512, 800);
        this.camera.lookAt(256, 256, 128);

        // Renderer
        this.renderer = new THREE.WebGLRenderer({ antialias: true });
        this.renderer.setSize(this.container.clientWidth, this.container.clientHeight);
        this.renderer.setPixelRatio(window.devicePixelRatio);
        this.container.appendChild(this.renderer.domElement);

        // Controls
        this.controls = new OrbitControls(this.camera, this.renderer.domElement);
        this.controls.enableDamping = true;
        this.controls.dampingFactor = 0.05;
        this.controls.target.set(256, 256, 128);

        // Lighting
        const ambient = new THREE.AmbientLight(0x404040, 0.5);
        this.scene.add(ambient);

        const directional = new THREE.DirectionalLight(0xffffff, 0.8);
        directional.position.set(500, 500, 500);
        this.scene.add(directional);

        // Z-axis strata planes (visual guides)
        this.createStrataPlanes();

        // Handle resize
        window.addEventListener('resize', () => this.onResize());
    }

    createStrataPlanes() {
        // Create semi-transparent planes at each semantic layer
        const strata = [
            { z: 0, color: 0x3366ff, label: 'Hardware/Machine Code' },
            { z: 64, color: 0x33ff66, label: 'Implementation' },
            { z: 128, color: 0xffff33, label: 'Business Logic' },
            { z: 192, color: 0xff9933, label: 'APIs/Interfaces' },
            { z: 255, color: 0xff3333, label: 'Architecture/Design' }
        ];

        strata.forEach(s => {
            const geometry = new THREE.PlaneGeometry(512, 512);
            const material = new THREE.MeshBasicMaterial({
                color: s.color,
                transparent: true,
                opacity: 0.05,
                side: THREE.DoubleSide
            });
            const plane = new THREE.Mesh(geometry, material);
            plane.position.set(256, 256, s.z);
            plane.rotation.x = -Math.PI / 2; // Horizontal
            this.scene.add(plane);
        });
    }

    connectWebSocket() {
        const wsUrl = 'ws://localhost:3002/ws/v1/thoughts';

        try {
            this.ws = new WebSocket(wsUrl);

            this.ws.onopen = () => {
                console.log('[VolumetricMindEye] Connected to thought stream');
            };

            this.ws.onmessage = (event) => {
                try {
                    const thought = JSON.parse(event.data);
                    this.handleThought(thought);
                } catch (e) {
                    console.error('[VolumetricMindEye] Parse error:', e);
                }
            };

            this.ws.onerror = (error) => {
                console.error('[VolumetricMindEye] WebSocket error:', error);
            };

            this.ws.onclose = () => {
                console.log('[VolumetricMindEye] Disconnected, reconnecting in 3s...');
                setTimeout(() => this.connectWebSocket(), 3000);
            };
        } catch (e) {
            console.error('[VolumetricMindEye] WebSocket init failed:', e);
        }
    }

    handleThought(thought) {
        // Handle 3D token renders
        if (thought.type === 'TOKEN_RENDER_3D' || thought.msg_type === 'Token3D') {
            this.addTokenOrb(thought);
        }

        // Handle 3D file orb updates
        if (thought.type === 'FILE_ORB_3D') {
            this.updateFileOrb(thought);
        }
    }

    addTokenOrb(data) {
        const x = data.x || 0;
        const y = data.y || 0;
        const z = data.z || 128; // Default to middle layer

        // Get color from data or use default
        let color = 0x666666;
        if (data.color) {
            const [r, g, b] = data.color;
            color = (Math.floor(r * 255) << 16) |
                    (Math.floor(g * 255) << 8) |
                    Math.floor(b * 255);
        }

        // Create small sphere for token
        const radius = 2 + (z / 128); // Larger at higher Z (more abstract)
        const geometry = new THREE.SphereGeometry(radius, 8, 8);
        const material = new THREE.MeshPhongMaterial({
            color: color,
            emissive: color,
            emissiveIntensity: 0.3,
            transparent: true,
            opacity: 0.8
        });

        const orb = new THREE.Mesh(geometry, material);
        orb.position.set(x, y, z);
        orb.userData = { type: 'token', content: data.content, tokenType: data.token_type };

        this.scene.add(orb);
        this.tokenOrbs.push(orb);

        // Limit total tokens for performance
        if (this.tokenOrbs.length > 5000) {
            const old = this.tokenOrbs.shift();
            this.scene.remove(old);
            old.geometry.dispose();
            old.material.dispose();
        }
    }

    updateFileOrb(data) {
        const path = data.path;
        const x = data.x || 0;
        const y = data.y || 0;
        const z = data.z || 128;

        if (this.orbs.has(path)) {
            // Update existing orb position
            const orb = this.orbs.get(path);
            orb.position.set(x, y, z);
        } else {
            // Create new file orb
            const radius = 5 + (data.mass || 1) * 2;
            const geometry = new THREE.SphereGeometry(radius, 16, 16);
            const material = new THREE.MeshPhongMaterial({
                color: 0x00aaff,
                emissive: 0x003366,
                emissiveIntensity: 0.2
            });

            const orb = new THREE.Mesh(geometry, material);
            orb.position.set(x, y, z);
            orb.userData = { type: 'file', path: path };

            this.scene.add(orb);
            this.orbs.set(path, orb);
        }
    }

    animate() {
        requestAnimationFrame(() => this.animate());

        // Update controls
        this.controls.update();

        // Pulse token orbs
        const time = Date.now() * 0.001;
        this.tokenOrbs.forEach((orb, i) => {
            const pulse = 0.3 + 0.1 * Math.sin(time * 2 + i * 0.1);
            orb.material.emissiveIntensity = pulse;
        });

        // Render
        this.renderer.render(this.scene, this.camera);
    }

    onResize() {
        const width = this.container.clientWidth;
        const height = this.container.clientHeight;

        this.camera.aspect = width / height;
        this.camera.updateProjectionMatrix();
        this.renderer.setSize(width, height);
    }
}
