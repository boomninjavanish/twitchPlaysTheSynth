/*
    parser.parse(message, tonalCenter);
    (c) 2020. Matthew Dunlap.

        Decodes messages sent to a Twitch Bot that control parameters on a synth

    parameters:
        inputMessage = input message string
        tonalCenter = the midi number of which the commands will offset


 */
exports.parse = function (
    inputMessage, 
    mapperNames, 
    midiNumberMin = 20, 
    midiNumberMax = 110, 
    midiNumberTrimType = "none",
    tonalCenter = 48.0 
) {
    // find which message is being parsed
    let outputMessage = []; // the Max formatted output
    let typeRegex = /^![A-Za-z0-9-]+/; // the inputKey with exclamation point (include all letters, numbers, and hyphens)
    let melodyRegex = /^!m\b|^!m\d+\b/;
    let matches = inputMessage.match(typeRegex); // get the inputKey from the message
    let noAhhh = ""; // input key with out the AHHHH!!! (exclamation point)

    // check to see that we have matches and object is not null or undefined
    if(matches){ 
        noAhhh = matches[0].slice(1); // strip the exclamation point from the key for paramamapper messages

        // parse melody if '!m'; everything else is considered to be paramamapper or error
        if(matches[0].match(melodyRegex))
            outputMessage = parseMelody(inputMessage, tonalCenter, midiNumberMin, midiNumberMax, midiNumberTrimType);

        else if(mapperNames.includes(noAhhh)){
            outputMessage = parseTwoParameters(inputMessage, matches[0], `/tpts/paramamapper ${noAhhh}`);
            return outputMessage;
        } else {
            // incorrect command; make error and return
            outputMessage.push(`/tpts/twitchBot/errorMessage '${inputMessage} is not a valid command'`);
            return outputMessage;
        }
    } else {
        // no matches found; make error and return
        outputMessage.push(`/tpts/twitchBot/errorMessage 'No message found in ${inputMessage}'`);
        return outputMessage;
    }

    // return output to be executed by Max
    return outputMessage;
}

/*
 extractValues - parses a message to extract the values and beats
    Input: 
        Uses the following syntax: 
            !ident <val>[<beats>] 
        For example, the command to adjust "ident" to 12 over 4 beats would be: 
            !ident 12[4]
        If the message is intended for a melody sequencer, it will begin with:
            !m
                -- or --
            !m<seq#> where <seq#> is the melody sequencer number (example; for seq# 3 it will be: !m3)
    Output:
        Returns the following:
            output.val
                An array containing the values 
            output.beats
                An array that contains the number of beats over which to change the value
            output.identifier
                The message identifier withøut the exclamation point; if it is a melody this
                value will simply be "m"
            output.seqNumber
                If the message is intended for a melody sequencer, this number will be > 0 and
                contain the value indicated by the user's message
            output.error
                An error message to identify problems with input syntax.
                    "none"          - no errors found
                    "non-equal"     - value and beats arrays are differing lengths
                    "no-matches"    - no matches were found, this means the syntax is incorrect
                    "no-identifier" - no identifier was included in message
*/
const extractValues = function (inputMessage){    
    // used to find melody identifiers
    let melodyIdentRegex = /^!m\b|^!m\d+\b/;

    // used to find other identifiers (not melody)
    let otherIdentRegex = /^!\w+/;

    // used to strip out the identifier
    let stripRegex = /^![a-zA-Z]+\d+/;

    // used to find the value before the brackets []
    let valueRegex = /\s([+-]?(\.)?\d+(\.\d+)?)/g; 

    // used to find the value inside the brackets or parentheses
    let beatsRegex = /(\[|\()([+-]?\d+(\.\d+)?)(\]|\))/g; 

    // object array to store the matching values to be returned
    let extractedValues = [];

    // store the sequencer number -- if there is one
    extractedValues.seqNumber = 0;

    // find and store the identifier without an exclamation point
    let melodyIdent = inputMessage.match(melodyIdentRegex);
    let otherIdent = inputMessage.match(otherIdentRegex);

    if(melodyIdent){
        // strip the '!'
        extractedValues.identifier = melodyIdent[0].replace(/^!/, "");

        // grab the seq#
        extractedValues.seqNumber = parseInt(
            extractedValues.identifier.replace(/^m/, "")
        );
        
        // if no seq# given, make number 1 by default
        if(isNaN(extractedValues.seqNumber))
            extractedValues.seqNumber = 1;

        // strip the seq#
        extractedValues.identifier = extractedValues.identifier.replace(/\d+$/, "");
        
    } else if (otherIdent){
        // strip the '!'
        extractedValues.identifier = otherIdent[0].replace(/^!/, "",);

    } else {
        // error and game over
        extractedValues.error = "no-identifier";
        return extractedValues;
    }

    // strip out the identifier
    let strippedMessage = inputMessage.replace(stripRegex, null);

    // find the values
    let valueMatches = strippedMessage.match(valueRegex);
    let beatsMatches = strippedMessage.match(beatsRegex);
    let beatsMatchesChecked = [];

    // default the beats to zero if second command omitted
    if(!beatsMatches){
        beatsMatchesChecked[0]= "0";
    } else {
        beatsMatchesChecked = [...beatsMatches];
    }

    // work through matches; return with error if no matches found
    if(valueMatches && beatsMatchesChecked){
        // return with error if number of matches in arrays are not equal
        if(valueMatches.length === beatsMatchesChecked.length){
            // remove the spaces from the values
            for(let i in valueMatches)
                valueMatches[i] = parseFloat(
                    valueMatches[i].replace(/^\s/, "")
                    );
                    
            // remove the brackets from the beats
            for(let i in beatsMatchesChecked){
                beatsMatchesChecked[i] = parseFloat(
                    beatsMatchesChecked[i]
                        .replace(/\[|\(/, "")
                        .replace(/\]|\)/, "")
                );
            }
                        
            // extract the values and put in returnable array
            extractedValues.val = [...valueMatches];
            extractedValues.beats = [...beatsMatchesChecked];

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
    return extractedValues;
}

/*
 parse two parameters - parses a input key followed by two numeric parameters; one for the amount of change
    the other for the duration in beats for the change to glide towards in a linear ramp

    input message format:
        "<inputKey> <amount>-<beats> "
            <inputKey>  = the key that the user enters to indicate a specific command
            <amount>    = the amount change requested by the user
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the resonance knob to 64 over 8 beats):

            "!r 64-8"

    inputKey:
        the key that designates the command to be performed (example: "!z"); this parameter is used for
        error messages

    outputKey:
        the key that will tell the Max patch what command is being requested (example: "resonance")

    min/max (optional):
        the minimum/maximum amount allowed by the command being requested; both min and max
        are used for error checking; defaults to 0 and 127 respectively

    output message format:
        "resonance <amount> <beats>"
        "resonance 64 8"

    returns:
        single output message in an array
*/
const parseTwoParameters= function (inputMessage, inputKey, outputKey, min = 0, max = 100){
    let outputMessage = []; // the Max formatted output array
    let median = parseInt((min + max) / 2); // used to communicate range errors

    // get the values for the param
    let extractedValues = extractValues(inputMessage);

    if(extractedValues.error === "none"){
        // send the parsed the values and beats if no error
        if(extractedValues.val[0] >= min && extractedValues.val[0] <= max){ // test if val is in range
            if(extractedValues.beats[0] >= 0){ // test if beats are in range
                outputMessage.push(`${outputKey} ${extractedValues.val[0]} ${extractedValues.beats[0]}`);
            } else {
                // syntax error and quit
                outputMessage.push(`/tpts/twitchBot/errorMessage 
                'The value of ${extractedValues.beats[0]} is out of range. The value must be greater than
                or equal to zero. --
                Your command: ${inputMessage} --
                An example of a correct command: !${extractedValues.identifier} ${median}[4]'`);

                return outputMessage;
            }
        } else {
            // syntax error and quit
            outputMessage.push(`/tpts/twitchBot/errorMessage 
                'The value of ${extractedValues.val[0]} is out of range. The value must be between
                ${min} and ${max}. --
                Your command: ${inputMessage} --
                An example of a correct command: !${extractedValues.identifier} ${median}[4]'`);

            return outputMessage;
        }
    } else {
        // syntax error and quit
        outputMessage.push(`/tpts/twitchBot/errorMessage 
            'The syntax in your command is incorrect. Please check out the instructions 
            for the correct syntax. --
            Your command: ${inputMessage} --
            An example of a correct command: !${extractedValues.identifier} ${median}[4]'`);

        return outputMessage;
    }

    // if all tests pass send it to the paramamapper!
    return outputMessage;
}

/*
 parse !m - Decodes a melody
    input message format:
        "!m<seq#> <interval>[<dur>] <interval>[<dur>] <interval>[<dur>]..."
            !m          = (constant) allows the Twitch bot to recognize this as a melody
            <seq#>      = optional; the sequencer to the send melody
            <interval>  = the amount of half steps the note will travel; this
                            number must not exceed the bounds of the midi chart.
            <dur>       = duration multiplier (0.002 - 6.0); the note will be held for a
                            given number of beats (1 beat = 1 quarter note). The
                            following are some examples of beat multipliers that
                            correspond to musical notation values:

                                dotted whole note   = 6
                                whole note          = 4
                                dotted half note    = 3
                                half note           = 2
                                dotted quarter note = 1.5
                                quarter note        = 1
                                dotted eight note   = 0.75
                                eight note          = 0.5
                                sixteenth note      = 0.25
                                thirty second note  = 0.125

                            triplet examples :

                                half note triplet    = 1.333
                                quarter note triplet = 0.666
                                eight note triplet   = 0.333

        Example (major scale in whole notes intended for sequencer number one):
            "!m1 0[4] 2[4] 2[4] 1[4] 2[4] 2[4] 2[4] 1[4]"

        Example (Laura's melody):
            "!m1 10[0.333] -6[0.333] -4[0.333] 10[0.666] -3[0.666] 8[0.666] 9[2] -5[2] -3[4]"

    output message format:
        "noteData <seq#> <note> <vel> <dur>"
        "noteData 1 61 127 4, noteQty 1 1"

    returns:
        multiple output messages in an array
*/
const parseMelody = function (inputMessage, tonalCenter, midiNumberMin, midiNumberMax, midiNumberTrimType){    
    let outputMessage = []; // the Max formatted output array

    // get the values for the melody
    let melodyValues = extractValues(inputMessage);

    // check errors from parsing the values
    if(melodyValues.error === "none"){
        // calculate midi pitches from a tonal center
        let pitch = tonalCenter;

        // the velocity is hardcoded (for now)
        let velocity = 127;


        for(let index in melodyValues.val){
            // adjust pitch from previous pitch
            pitch += melodyValues.val[index];

             // keep in sane midi range
            // if value goes out of range, have it wrap around
            if(midiNumberTrimType === "wrap"){
                if(pitch < midiNumberMin)
                    pitch = midiNumberMax - (midiNumberMin - pitch) % (midiNumberMax - midiNumberMin);

                if(pitch > midiNumberMax)
                    pitch = midiNumberMin + (pitch - midiNumberMin) % (midiNumberMax - midiNumberMin);
            }

            // if value go out of range, have it "smash" into the min or max
            if(midiNumberTrimType === "wall"){
                if(pitch < midiNumberMin)
                pitch = midiNumberMin;

                if(pitch > midiNumberMax)
                    pitch = midiNumberMax;
            }

            // output the data to be placed in the melody coll
            outputMessage.push(
                "/tpts/melodySeq/noteData " +
                melodyValues.seqNumber + " " +
                index + " " +
                pitch + " " +
                velocity + " " +
                melodyValues.beats[index]
            );
        }
        
    } else {
        // syntax error and quit
        outputMessage.push(`/tpts/twitchBot/errorMessage 
            'The syntax for your melody is incorrect. Please check out the instructions 
            for the correct syntax. -- 
            Your melody: ${inputMessage} --
            An example of a correct melody: !m 0[1] 1[1] 1[1] 5[0.5] -5[0.5]'`);
        return outputMessage;
    }

    // output number of notes to be played
    outputMessage.push("/tpts/melodySeq/noteQty " + melodyValues.seqNumber + " " + melodyValues.val.length);

    // output the original message for the dashboard
    outputMessage.push("/tpts/melodySeq/userMelody " + melodyValues.seqNumber + " " + inputMessage);

    // return all of the messages in an array
    return outputMessage;
}