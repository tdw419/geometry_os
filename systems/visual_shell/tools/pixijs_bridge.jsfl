/**
 * @file PixiJSBridge.jsfl
 * @description Flash JavaScript API (JSFL) script to export Flash Timeline to PixiJS.
 * This runs within the Macromedia Flash MX / 8 / CS environment.
 */

var dom = fl.getDocumentDOM();
if (!dom) {
    alert("Please open a Flash document first.");
} else {
    exportToPixi();
}

function exportToPixi() {
    var output = {
        name: dom.name,
        width: dom.width,
        height: dom.height,
        frameRate: dom.frameRate,
        layers: []
    };

    var timeline = dom.getTimeline();
    fl.trace("[*] Exporting Timeline: " + timeline.name);

    for (var i = 0; i < timeline.layerCount; i++) {
        var layer = timeline.layers[i];
        if (layer.layerType == "normal") {
            fl.trace("  > Processing Layer: " + layer.name);
            output.layers.push(processLayer(layer));
        }
    }

    // Serialize to JSON (simulated - legacy Flash JSFL might need a polyfill)
    var json = serialize(output);
    
    // Save to the Substrate Bridge path
    var exportPath = "C:\\substrate_bridge\\pixi_export.json";
    FLfile.write("file:///" + exportPath.replace(/\\/g, "/"), json);
    
    alert("Export Complete! PixiJS Scene saved to substrate bridge.");
}

function processLayer(layer) {
    var layerData = {
        name: layer.name,
        frames: []
    };

    for (var f = 0; f < layer.frames.length; f++) {
        var frame = layer.frames[f];
        if (f == frame.startFrame) { // Keyframe
            var frameData = {
                index: f,
                elements: []
            };

            for (var e = 0; e < frame.elements.length; e++) {
                var element = frame.elements[e];
                frameData.elements.push({
                    type: element.elementType,
                    name: element.name,
                    x: element.x,
                    y: element.y,
                    rotation: element.rotation,
                    scaleX: element.scaleX,
                    scaleY: element.scaleY
                });
            }
            layerData.frames.push(frameData);
        }
    }
    return layerData;
}

// Simple JSON serializer for legacy JSFL environment
function serialize(obj) {
    var parts = [];
    var isArray = (obj instanceof Array);
    for (var key in obj) {
        var value = obj[key];
        var part = isArray ? "" : '"' + key + '":';
        if (typeof value == "string") part += '"' + value + '"';
        else if (typeof value == "number") part += value;
        else if (typeof value == "boolean") part += value;
        else if (typeof value == "object") part += serialize(value);
        parts.push(part);
    }
    return isArray ? "[" + parts.join(",") + "]" : "{" + parts.join(",") + "}";
}
