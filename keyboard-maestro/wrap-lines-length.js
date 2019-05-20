function wrapLineLengths(inputString, limit) {
    let lines = inputString.replace(/(\r\n|\n|\r)/gm, "\n").split("\n");

    let lastLine = "";
    // for prefix calculation, we use only "lines with content" as defined by
    // the following filter:
    let prefix = sharedStart(lines.filter((line) => {
        // filter out all lines which are complete subsets of the last line
        if (lastLine.includes(line)) {
            return false;
        }
        // filter out all empty lines
        lastLine = line;
        return line.trim().length > 0
    }));

    let output = "";
    let currentLine = "";
    for (let line of lines) {
        line = line.trimRight();
        if (line.length === 0) {
            if (currentLine.length > 0) {
                output = output + currentLine + "\n";
            }
            output = output + line + "\n";
            currentLine = "";
            continue;
        }

        if (prefix.includes(line)) {
            output = output + prefix + currentLine + "\n";
            output = output + line + "\n";
            currentLine = "";
            continue;
        }

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
    if (output[output.length - 1] === "\n") {
        output = output.substring(0, output.length - 1);
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

// something nothing
//
// other something
