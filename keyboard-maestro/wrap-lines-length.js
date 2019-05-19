function wrapLineLengths(inputString, limit) {
    let lines = inputString.split("\r");
    let prefix = sharedStart(lines);

    let output = "";
    let currentLine = "";
    for (let line of lines) {
        line = line.replace(prefix, "").trim();
        for (let word of line.split(" ")) {
            let newCurrentLine = prefix + currentLine + (currentLine.length > 0 ? " " : "") + word;
            if (newCurrentLine.length > limit) {
                output = output + prefix + currentLine + "\n";
                currentLine = "";
            }
            currentLine = currentLine + (currentLine.length > 0 ? " " : "") + word;
        }
    }
    if (currentLine.length > 0) {
        output = output + prefix + currentLine + "\n";
    }
    return output;
}

// https://stackoverflow.com/questions/1916218/find-the-longest-common-starting-substring-in-a-set-of-strings
function sharedStart(array) {
    var A = array.concat().sort(),
        a1 = A[0], a2 = A[A.length - 1], L = a1.length, i = 0;
    while (i < L && a1.charAt(i) === a2.charAt(i)) i++;
    return a1.substring(0, i);
}

function run() {
    var app = Application.currentApplication();
    app.includeStandardAdditions = true;
    var clipboardStr = app.theClipboard();
    var kme = Application("Keyboard Maestro Engine");
    var limit = parseInt(kme.getvariable('limit'), 10);

    return wrapLineLengths(clipboardStr, limit);
}

console.jxaRun = run;

// this is somet this is more lines and I want hjkl hjlsfa jklsd ljfd sl sksdfa
// jhkbsdfab ljkfsad blksda sfdjkl dfdbdb bdf dbd
