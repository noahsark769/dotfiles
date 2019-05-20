require('./wrap-lines-length.js');

var globalVariables = {};
var globalClipboard = "";

global.isTest = true;
global.Application = function() {
    return {
        getvariable: function(key) {
            return globalVariables[key];
        }
    };
};

global.Application.currentApplication = function() {
    return {
        theClipboard: function() {
            return globalClipboard;
        }
    };
};

function assertClipboardInputMatchesRunOutput(clipboardInput, expectedOutput) {
    globalClipboard = clipboardInput;
    expect(console.jxaRun()).toEqual(expectedOutput);
}

test('Wrap lines length', () => {
    globalVariables = { limit: 80 };

let input = `// Something nothing\r// Other other`;
let output = `// Something nothing Other other`;

    assertClipboardInputMatchesRunOutput(input, output);
});

test("Leading and trailing newlines", () => {
    globalVariables = { limit: 80 };

let input = `
    // Something nothing\r
    // Other other`;
let output = `
    // Something nothing Other other`;

    assertClipboardInputMatchesRunOutput(input, output);
});

test("Comments with newlines which don't have a space after slashes", () => {
    let input = `
    // Something nothing
    //
    // Other other`;

    let output = `
    // Something nothing
    //
    // Other other`;
    assertClipboardInputMatchesRunOutput(input, output);
});

test("Comments which start with the same text after the slashes", () => {});

// Something nothing
//
// Something other