'use strict';

(function run() {
    function edit(string) {
        var splitByCommas = string.split(",").join(",\n");
        var splitByOpenParens = splitByCommas.split("(").join("(\n");
        var splitByClosingParens = splitByOpenParens.split(")").join("\n)");
        return splitByClosingParens;
    }

    var app = Application.currentApplication();
    app.includeStandardAdditions = true;
    var kme = Application("Keyboard Maestro Engine");
    var clipboardStr = app.theClipboard();
    console.log("clipboardStr: " + clipboardStr);
    app.setTheClipboardTo(edit(clipboardStr));
})();
