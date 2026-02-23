/**
 * Geometry OS Map Block Editor Script
 *
 * Registers the 'geometry-os/map' Gutenberg block with visual controls.
 *
 * @package Geometry_OS_Map
 */

(function(wp) {
    ''use strict';

    var el = wp.element.createElement;
    var __ = wp.i18n.__;
    var InspectorControls = wp.blockEditor.InspectorControls;
    var PanelBody = wp.components.PanelBody;
    var TextControl = wp.components.TextControl;
    var SelectControl = wp.components.SelectControl;
    var ToggleControl = wp.components.ToggleControl;
    var Placeholder = wp.components.Placeholder;

    /**
     * Block registration
     */
    wp.blocks.registerBlockType('geometry-os/map', {
        title: __('Geometry OS Map', 'geometry-os-map'),
        description: __('Embed the PixiJS Infinite Map with interactive controls.', 'geometry-os-map'),
        icon: 'admin-site',
        category: 'embed',
        keywords: [
            __('map', 'geometry-os-map'),
            __('geometry', 'geometry-os-map'),
            __('pixi', 'geometry-os-map'),
            __('infinite', 'geometry-os-map'),
        ],
        supports: {
            align: ['wide', 'full'],
            html: false,
        },
        attributes: {
            width: {
                type: 'string',
                default: '100%',
            },
            height: {
                type: 'string',
                default: '600px',
            },
            fullscreen: {
                type: 'boolean',
                default: false,
            },
            mode: {
                type: 'string',
                default: '',
            },
            theme: {
                type: 'string',
                default: 'dark',
            },
            showTutorial: {
                type: 'boolean',
                default: true,
            },
        },

        /**
         * Edit component - displayed in the block editor
         *
         * @param {Object} props Block properties.
         * @return {WPElement} Element to render.
         */
        edit: function(props) {
            var attributes = props.attributes;
            var setAttributes = props.setAttributes;

            // Build preview styles
            var previewStyle = {
                width: attributes.width,
                height: attributes.fullscreen ? '400px' : attributes.height,
                backgroundColor: '#111',
                borderRadius: '8px',
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
                color: '#00FFFF',
                fontFamily: 'Courier New, monospace',
                fontSize: '14px',
                border: '2px dashed #00FFFF',
                position: 'relative',
            };

            // Fullscreen indicator
            var fullscreenBadge = attributes.fullscreen ? el('span', {
                style: {
                    position: 'absolute',
                    top: '10px',
                    right: '10px',
                    backgroundColor: '#00FFFF',
                    color: '#111',
                    padding: '2px 8px',
                    borderRadius: '4px',
                    fontSize: '11px',
                    fontWeight: 'bold',
                }
            }, 'FULLSCREEN') : null;

            // Mode indicator
            var modeBadge = attributes.mode ? el('span', {
                style: {
                    position: 'absolute',
                    top: '10px',
                    left: '10px',
                    backgroundColor: '#FF6600',
                    color: '#fff',
                    padding: '2px 8px',
                    borderRadius: '4px',
                    fontSize: '11px',
                    fontWeight: 'bold',
                }
            }, attributes.mode.toUpperCase() + ' MODE') : null;

            // Preview placeholder element
            var previewElement = el('div', { style: previewStyle },
                fullscreenBadge,
                modeBadge,
                el('div', { style: { fontSize: '32px', marginBottom: '10px' } }, '\uD83C\uDF10'),
                el('div', null, __('Geometry OS Map', 'geometry-os-map')),
                el('div', {
                    style: {
                        fontSize: '12px',
                        color: '#888',
                        marginTop: '8px',
                    }
                }, attributes.width + ' x ' + (attributes.fullscreen ? '100vh' : attributes.height))
            );

            // Inspector controls panel
            var inspectorControls = el(InspectorControls, null,
                el(PanelBody, {
                    title: __('Map Dimensions', 'geometry-os-map'),
                    initialOpen: true,
                },
                    el(TextControl, {
                        label: __('Width', 'geometry-os-map'),
                        value: attributes.width,
                        onChange: function(value) {
                            setAttributes({ width: value });
                        },
                        help: __('CSS width value (e.g., 100%, 800px)', 'geometry-os-map'),
                    }),
                    el(TextControl, {
                        label: __('Height', 'geometry-os-map'),
                        value: attributes.height,
                        onChange: function(value) {
                            setAttributes({ height: value });
                        },
                        help: __('CSS height value (e.g., 600px, 50vh)', 'geometry-os-map'),
                    }),
                    el(ToggleControl, {
                        label: __('Fullscreen Mode', 'geometry-os-map'),
                        checked: attributes.fullscreen,
                        onChange: function(value) {
                            setAttributes({ fullscreen: value });
                        },
                        help: __('Display as fixed fullscreen overlay', 'geometry-os-map'),
                    })
                ),
                el(PanelBody, {
                    title: __('Display Settings', 'geometry-os-map'),
                    initialOpen: true,
                },
                    el(SelectControl, {
                        label: __('Theme', 'geometry-os-map'),
                        value: attributes.theme,
                        options: [
                            { label: __('Dark', 'geometry-os-map'), value: 'dark' },
                            { label: __('Light', 'geometry-os-map'), value: 'light' },
                            { label: __('High Contrast', 'geometry-os-map'), value: 'highContrast' },
                        ],
                        onChange: function(value) {
                            setAttributes({ theme: value });
                        },
                    }),
                    el(SelectControl, {
                        label: __('Application Mode', 'geometry-os-map'),
                        value: attributes.mode,
                        options: [
                            { label: __('Default', 'geometry-os-map'), value: '' },
                            { label: __('Desktop Control', 'geometry-os-map'), value: 'desktop' },
                        ],
                        onChange: function(value) {
                            setAttributes({ mode: value });
                        },
                        help: __('Desktop mode enables remote control features', 'geometry-os-map'),
                    }),
                    el(ToggleControl, {
                        label: __('Show Tutorial', 'geometry-os-map'),
                        checked: attributes.showTutorial,
                        onChange: function(value) {
                            setAttributes({ showTutorial: value });
                        },
                        help: __('Display keyboard shortcuts and controls overlay', 'geometry-os-map'),
                    })
                )
            );

            // Return wrapper with controls and preview
            return el('div', null,
                inspectorControls,
                previewElement
            );
        },

        /**
         * Save component - returns null for server-side rendering
         *
         * @return {null} Null to use render_callback.
         */
        save: function() {
            return null;
        },
    });

})(window.wp);
