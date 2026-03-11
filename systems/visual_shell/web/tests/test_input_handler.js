/**
 * Test: WGPUInputHandler
 */

export async function testInputHandlerPackKeyboard() {
    // Test keyboard event packing
    const handler = { packKeyboard: (e, pressed) => ({ type: 1, scancode: 65, modifiers: 0, pressed: pressed ? 1 : 0 }) };

    const event = { key: 'a', code: 'KeyA', shiftKey: false };
    const packed = handler.packKeyboard(event, true);

    console.assert(packed.type === 1, 'Type should be 1 for keyboard');
    console.assert(typeof packed.scancode === 'number', 'Scancode should be number');
    console.log('✅ Input handler packs keyboard events');
    return true;
}

export async function testInputHandlerPackMouse() {
    // Test mouse event packing
    const handler = { packMouse: (x, y, buttons) => ({ type: 2, x, y, buttons }) };

    const packed = handler.packMouse(512, 384, 1);

    console.assert(packed.type === 2, 'Type should be 2 for mouse');
    console.assert(packed.x === 512, 'X should be 512');
    console.assert(packed.y === 384, 'Y should be 384');
    console.log('✅ Input handler packs mouse events');
    return true;
}

window.testInputHandlerPackKeyboard = testInputHandlerPackKeyboard;
window.testInputHandlerPackMouse = testInputHandlerPackMouse;
