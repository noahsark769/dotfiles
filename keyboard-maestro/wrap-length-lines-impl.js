export default function(inputString, limit) {
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