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

    let input = `
    // Something
    // Something
`;
    assertClipboardInputMatchesRunOutput(input, input);
});