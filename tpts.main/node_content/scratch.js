const inputMessage = "!m2 -1.2[57]";

// used to find melody identifiers
let melodyIdentRegex = /^!m\b|^!m\d+\b/;

// used to find other identifiers
let otherIdentRegex = /^!\w+/;

// used to strip out the identifier
let stripRegex = /^![a-zA-Z]+\d+/;

// used to find the value before the brackets []
let valueRegex = /\s([+-]?\d+(\.\d+)?)/g; 

// used to find the value inside the brackets
let beatsRegex = /\[([+-]?\d+(\.\d+)?)\]/g; 

// object array to store the matching values to be returned
let extractedValues = [];

// find and store the stripped identifier
let melodyIdent = inputMessage.match(melodyIdentRegex);
let otherIdent = inputMessage.match(otherIdentRegex);

if(melodyIdent){
    extractedValues.identifier = melodyIdent[0]
} else if (otherIdent){

} else {
    // error
}

// strip out the identifier
let strippedMessage = inputMessage.replace(stripRegex, null);

// find the values
let valueMatches = strippedMessage.match(valueRegex);
let beatsMatches = strippedMessage.match(beatsRegex);

// work through matches; return with error if no matches found
if(valueMatches && beatsMatches){
    // return with error if number of matches in arrays are not equal
    if(valueMatches.length === beatsMatches.length){
        // remove the spaces from the values
        for(let i in valueMatches)
            valueMatches[i] = parseFloat(
                valueMatches[i].replace(/^\s/, "")
                );
                   
        // remove the brackets from the beats
        for(let i in beatsMatches){
            beatsMatches[i] = parseFloat(
                beatsMatches[i]
                    .replace(/\[/, "")
                    .replace(/\]/, "")
            );
        }
                    
        // extract the values and put in returnable array
        extractedValues.val = [...valueMatches];
        extractedValues.beats = [...beatsMatches];

        // report no errors occured
        extractedValues.error = "none";

    } else {
        // error
        extractedValues.error = "non-equal";
    }
} else {
    // error
    extractedValues.error = "no-matches";
}

// return values
console.log(melodyIdent);
console.log(otherIdent);
console.log(valueMatches);
console.log(beatsMatches);
console.log(extractedValues);

if(extractedValues.error === "non-equal"){
    
    console.log("error babay");
}

if(extractedValues.error === "no-matches"){
    
    console.log("error babay");
}