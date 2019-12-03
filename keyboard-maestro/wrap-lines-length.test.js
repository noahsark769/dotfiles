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

test("Comments which start with the same text after the slashes", () => {
    let input = `
    // Something nothing
    //
    // Something other`;

    let output = `
    // Something nothing
    //
    // Something other`;
    assertClipboardInputMatchesRunOutput(input, output);
});

test("Wraps to limit", () => {
    let input = `
    // This is a string which, in the
    // ideal case, would wrap
    //
    // To 80 characters. The only issue is that this line is currently not 80 characters. Hopefully,
    // when running this macro, the line will be shortened.`;

    let output = `
    // This is a string which, in the ideal case, would wrap
    //
    // To 80 characters. The only issue is that this line is currently not 80
    // characters. Hopefully, when running this macro, the line will be
    // shortened.`;
    assertClipboardInputMatchesRunOutput(input, output);
});

test("Works without a newline first", () => {
    globalVariables = { limit: 100 };
    let input = `        // TODO (noah): Weird to have this here, we don't have a server-assigned id
        // yet though...maybe there's a better way. Note that if we change this
        // then we also have to change the sort in VariableConfigurator`;
    let output = `        // TODO (noah): Weird to have this here, we don't have a server-assigned id yet
        // though...maybe there's a better way. Note that if we change this then we also have to
        // change the sort in VariableConfigurator`;
    assertClipboardInputMatchesRunOutput(input, output);
});