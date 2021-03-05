/*
    parser.parse(message, tonalCenter);
    (c) 2020 Matthew Dunlap

        Decodes messages sent to a Twitch Bot that control parameters on a modular synth

    parameters:
        inputMessage = input message string
        tonalCenter = the midi number of which the commands will offset


 */
exports.parse = function(inputMessage, mapperNames, tonalCenter = 48.0) {
    // find which message is being parsed
    let outputMessage = []; // the Max formatted output
    let typeRegex = /^![a-zA-Z]+/; // the inputKey with exclamation point
    let matches = inputMessage.match(typeRegex); // get the inputKey from the message
    let noAhhh = ""; // input key with out the AHHHH!!! (exclamation point)

    if(matches.length > 0){
        noAhhh = matches[0].slice(1); // strip the exclamation point from the key for paramamapper messages

        // parse melody if '!m'; everything else is considered to be paramamapper or error
        if(matches[0] === "!m")
            outputMessage = parseMelody(inputMessage, tonalCenter);

        else if(mapperNames.includes(noAhhh)){
            outputMessage.push(`inputMessage = ${inputMessage}, noAhhh = ${noAhhh}`);// delete
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
 parseSequencerNumber - determines the sequencer number and strips the message identifier
    from the message.

 inputMessage: the message given by the user; must have a message identifier that contains
    an exclamation point followed by an alphabetic identifier followed by a number. Examples:
        !m2 or !bongo12 or !c4

  returns: the input message that has been stripped of the message identifier and the
    number that indicates which sequencer the message is destined to receive; if
    the sequencer number cannot be found, return NaN
 */
function parseSequencerNumber(inputMessage){
    let typeRegex = /^![a-zA-Z]+/;
    let numberRegex = /^\d+/;
    let numberSpaceRegex = /^\d+\s/;
    let sequencerNumber;

    // remove messageType
    let strippedMessage = inputMessage.replace(typeRegex, '');

    // find which melody seq. number
    let sequencerNumberArr = strippedMessage.match(numberRegex);

    // set to not a number to indicate error
    if (!sequencerNumberArr) {
        return {
            strippedMessage: null,
            sequencerNumber: NaN
        }
    }
    sequencerNumber = sequencerNumberArr[0];

    // strip out number and first space
    strippedMessage = strippedMessage.replace(numberSpaceRegex, '');

    return {
        strippedMessage: strippedMessage,
        sequencerNumber: parseInt(sequencerNumber)
    }
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
function parseTwoParameters(inputMessage, inputKey, outputKey, min = 0, max = 127){
    let outputMessage = []; // the Max formatted output array
    outputMessage.push(`parseTwoParameters Started`);// delete

    //strip out the identifier
    let strippedMessage = inputMessage.replace(/^!\w+\s/, "");

    // grab the separate commands
    let commands = strippedMessage.split("-");
    outputMessage.push(`commands.length = ${commands.length}`);// delete

    // check for requisite number of commands and correct data type
    if(commands.length === 2){
        outputMessage.push("post if(commands.length === 2)");// delete
        // does the message have invalid characters?
        for(let character of strippedMessage){
            if( !(character === "-" || character === '.' || /^\d$/.test(character)) ){
                // make error and return
                outputMessage.push("/tpts/twitchBot/errorMessage '" + inputKey + seqNumber + ": " +
                    strippedMessage + " is not a valid message'");
                return outputMessage;
            }
        }

        let amount = parseFloat(commands[0]);
        let beats = parseFloat(commands[1]);

        // is amount a number?
        if(isNaN(amount)){
            // make error message
            outputMessage.push("/tpts/twitchBot/errorMessage '" + inputKey + ": " + commands[0] + " is not a valid amount'");
            return outputMessage;
        }

        // is amount in range?
        if(amount < min || amount > max){
            // make error message
            outputMessage.push("/tpts/twitchBot/errorMessage '" + inputKey + ": " + commands[0] + " is out of range; " +
                "must be between " + min + " and " + max + "'");
            return outputMessage;
        }

        // are the number of beats a floating point number?
        if(isNaN(beats)){
            // make error message
            outputMessage.push("/tpts/twitchBot/errorMessage '" + inputKey + ": " + commands[1] +
                " is not a valid number of beats'");
            return outputMessage;
        }

        // if all tests pass, send the parameter changes
        outputMessage.push(outputKey + " " + amount + " " + beats);
        return outputMessage;
    }
    else {
        // make error message
        outputMessage.push("/tpts/twitchBot/errorMessage '" + inputKey + " requires two commands separated by a hyphen'");
        return outputMessage;
    }
}

/*
 parse !m - Decodes a melody
    input message format:
        "!m<seq#> <u/d>-<interval>-<dur> <u/d>-<interval>-<dur> <u/d>-<interval>-<dur>..."
            !m          = (constant) allows the Twitch bot to recognize this as a melody
            <seq#>      = the sequencer to the send melody
            <u/d>       = ("u" | "d") up or down; the direction the note will travel
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
            "!m1 u-0-4 u-2-4 u-2-4 u-1-4 u-2-4 u-2-4 u-2-4 u-1-4"

        Example (Laura's melody):
            "!m1 u-10-0.333 d-6-0.333 d-4-0.333 u-10-0.666 d-3-0.666 u-8-0.666 u-9-2 d-5-2 d-3-4"

    output message format:
        "noteData <seq#> <note> <vel> <dur>"
        "noteData 1 61 127 4, noteQty 1 1"

    returns:
        multiple output messages in an array
*/
function parseMelody(inputMessage, tonalCenter){
    let outputMessage = []; // the Max formatted output array
    let melody = []; // the melody array

    // get sequencer number and strip identifier
    let parsedSequenceNumber = parseSequencerNumber(inputMessage);

    // error if no number is found
    if(isNaN(parsedSequenceNumber.sequencerNumber)){
        outputMessage.push("/tpts/twitchBot/errorMessage '!m: missing melody sequencer number'");
        return outputMessage;
    }

    let seqNumber = parsedSequenceNumber.sequencerNumber;
    let strippedMessage = parsedSequenceNumber.strippedMessage;

    // parse the incoming message
    let messageArray = strippedMessage.split(" "); // get individual notes

    let index = 0; // for note id

    let pitch = tonalCenter; // the final midi pitch number

    for(let note of messageArray){
        //split the note's parameters
        let noteArray = note.split("-");

        // does the note have the correct number of elements?
        if(noteArray.length !== 3){
            // make error and return
            outputMessage.push("/tpts/twitchBot/errorMessage '!m: " + note + " does not contain the correct number of elements'");
            return outputMessage;
        }

        // calculate the midi pitch number relative to the last pitch
        if(noteArray[0] === "u"){
            pitch += parseFloat(noteArray[1]);
        }
        else if(noteArray[0] === "d"){
            pitch -= parseFloat(noteArray[1]);
        }
        // the direction is invalid
        else{
            // make error and return
            outputMessage.push("/tpts/twitchBot/errorMessage '!m: " + note + " does not contain a valid direction'");
            return outputMessage;
        }

        // check the pitch amount for correctness
        if(isNaN(pitch)){
            // make error and return
            outputMessage.push("/tpts/twitchBot/errorMessage '!m: " + note + " does not contain a valid pitch'");
            return outputMessage;
        }

        let duration = parseFloat(noteArray[2]);

        // check the duration for correctness
        if(isNaN(duration)){
            // make error and return
            outputMessage.push("/tpts/twitchBot/errorMessage '!m: " + note + " does not contain a valid duration'");
            return outputMessage;
        }

        let velocity = 127;

        // build message
        melody.push({
            index,
            pitch,
            velocity,
            duration
        });

        index++;
    }

    // output the data to be placed in the melody coll
    for(let line of melody){
        outputMessage.push(
            "/tpts/melodySeq/noteData " +
            seqNumber + " " +
            line.index + " " +
            line.pitch + " " +
            line.velocity + " " +
            line.duration
        );


    }

    // output number of notes to be played
    outputMessage.push("/tpts/melodySeq/noteQty " + seqNumber + " " + melody.length);

    // output the original message for the dashboard
    outputMessage.push("/tpts/melodySeq/userMelody " + seqNumber + " " + inputMessage);

    // return all of the messages in an array
    return outputMessage;
}

/*
 parse !c - Decodes a request to offset the tonal center
    input message format:
        "!c <interval>"
            !c          = (constant) allows the Twitch bot to recognize this as a tonal center change
            <interval>  = the amount of half steps the tonal center will travel; this
                            number must not exceed the bounds of the midi chart.

        Example (move the tonal center a 5th above the current):
            "!c 8"

    output message format:
        "tonalOffset <seq #> <amount>"
        "tonalOffset 1 8"

    returns:
        single output message in an array
*/
function parseTonalOffset(inputMessage){
    let outputMessage = []; // the Max formatted output array

    // get sequencer number and strip identifier
    let parsedSequenceNumber = parseSequencerNumber(inputMessage);

    // error if no number is found
    if(isNaN(parsedSequenceNumber.sequencerNumber)){
        outputMessage.push("/tpts/twitchBot/errorMessage '!c: missing melody sequencer number. For example, use !c2 1 " +
            "to move sequencer number 2 up a step.'");
        return outputMessage;
    }

    let seqNumber = parsedSequenceNumber.sequencerNumber;
    let strippedMessage = parsedSequenceNumber.strippedMessage;

    inputMessage = inputMessage.slice(3); // remove messageType

    // does the tonal center have invalid characters?
    for(let character of strippedMessage){
        if( !(character === '-' || character === '.' || /^\d$/.test(character)) ){
            // make error and return
            outputMessage.push("/tpts/twitchBot/errorMessage '!c: " + inputMessage + " is not a valid tonal center change'");
            return outputMessage;
        }
    }

    // return message in an array
    outputMessage.push("/tpts/melodySeq/tonalOffset " + seqNumber + " " + strippedMessage);
    return outputMessage;
}

/*
 parse !f - Decodes a request to change the filter frequency
    input message format:
        "!f <amount>-<beats> "
            !f          = (constant) allows the Twitch bot to recognize this as a frequency change
            <amount>    = 0-127; the amount of voltage to give to the VCF
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the frequency knob to 64 over 8 beats):
            "!f 64-8"

    output message format:
        "filterFreq <amount> <beats>"
        "filterFreq 64 8"

    returns:
        single output message in an array
*/
function parseFilterFreq(inputMessage){
    return parseTwoParameters(inputMessage, "!f", "filterFreq");
}

/*
 parse !r - Decodes a request to change the filter resonance
    input message format:
        "!r <amount>-<beats> "
            !r          = (constant) allows the Twitch bot to recognize this as a resonance change
            <amount>    = 0-127; the amount of voltage to give to the VCF
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the resonance knob to 64 over 8 beats):
            "!r 64-8"

    output message format:
        "resonance <amount> <beats>"
        "resonance 64 8"

    returns:
        single output message in an array
*/
function parseResonance(inputMessage){
    return parseTwoParameters(inputMessage, "!r", "resonance");

}

/*
 parse !t - Decodes a request to change the tempo
    input message format:
        "!t <amount>-<beats> "
            !t          = (constant) allows the Twitch bot to recognize this as a tempo change
            <amount>    = 1-1000; the amount of beats per minute
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the tempo to 88 bpm over 8 beats):
            "!t 88-8"

    output message format:
        "userTempo <amount> <beats>"
        "userTempo 88 8"

    returns:
        single output message in an array
*/
function parseTempo(inputMessage){

    return parseTwoParameters(inputMessage, "!t", "userBpm", 1.0, 1000.0);

}

/*
 parse !s - Decodes a request to change the melodic control voltage slew amount
    input message format:
        "!s <millis>-<beats>"
            !s          = (constant) allows the Twitch bot to recognize this as a slew amount change
            <millis>    = 0-5000; the amount of slew time in milliseconds
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the slew time to 300 over 5 beats):
        "!s 300-5"

    output message format:
        "slew <amount> <beats>"
        "slew 300 5"

    returns:
        single output message in an array

 */
function parseSlew(inputMessage){

    return parseTwoParameters(inputMessage, "!s", "slew", 0, 5000);

}

/*
 parse !y - Decodes a request to change the how much the LFO drives the frequency modulation
    input message format:
        "!y <amount>-<beats>"
            !y          = (constant) allows the Twitch bot to recognize this as a frequency modulation
                            amount change
            <amount>    = 0-127; the amount of LFO to be applied to the PWM
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the FM amount to 55 over 2 beats):
        "!y 55-2"

    output message format:
        "fmAmount <amount> <beats>"
        "fmAmount 55 2"

    returns:
        single output message in an array

 */
function parseFmAmount(inputMessage){

    return parseTwoParameters(inputMessage, "!y", "fmAmount");

}

/*
 parse !l - Decodes a request to change the low frequency oscillator (LFO) rate
    input message format:
        "!l <amount>-<beats>"
            !l          = (constant) allows the Twitch bot to recognize this as LFO rate change
            <amount>    = 0-127; the rate of the LFO; 0 = slow, 127 = fast
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the LFO rate to 23 over 10 beats):
        "!l 23-10"

    output message format:
        "lfoRate <amount> <beats>"
        "lfoRate 23 10"

    returns:
        single output message in an array

 */
function parseLfo(inputMessage){

    return parseTwoParameters(inputMessage, "!l", "lfoRate");

}

/*
 parse !mario - Decodes a request to change any parameter mapped to it
    input message format:
        "!mario <amount>-<beats>"
            !mario      = (constant) allows the Twitch bot to recognize this as parameter change
            <amount>    = 0-127; the rate of the LFO; 0 = slow, 127 = fast
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the parameter rate to 23 over 10 beats):
        "!mario 23-10"

    output message format:
        "mario <amount> <beats>"
        "mario 23 10"

    returns:
        single output message in an array

 */
function parseMario(inputMessage){

    return parseTwoParameters(inputMessage, "!mario", "mario", 0, 127);

}

/*
 parse !luigi - Decodes a request to change any parameter mapped to it
    input message format:
        "!luigi <amount>-<beats>"
            !luigi      = (constant) allows the Twitch bot to recognize this as parameter change
            <amount>    = 0-127; the rate of the LFO; 0 = slow, 127 = fast
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the parameter rate to 23 over 10 beats):
        "!luigi 23-10"

    output message format:
        "luigi <amount> <beats>"
        "luigi 23 10"

    returns:
        single output message in an array

 */
function parseLuigi(inputMessage){

    return parseTwoParameters(inputMessage, "!luigi", "luigi", 0, 127);

}

/*
 parse !yoshi - Decodes a request to change any parameter mapped to it
    input message format:
        "!yoshi <amount>-<beats>"
            !yoshi      = (constant) allows the Twitch bot to recognize this as parameter change
            <amount>    = 0-127; the rate of the LFO; 0 = slow, 127 = fast
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the parameter rate to 23 over 10 beats):
        "!yoshi 23-10"

    output message format:
        "yoshi <amount> <beats>"
        "yoshi 23 10"

    returns:
        single output message in an array

 */
function parseYoshi(inputMessage){

    return parseTwoParameters(inputMessage, "!yoshi", "yoshi", 0, 127);

}

/*
 parse !peach - Decodes a request to change any parameter mapped to it
    input message format:
        "!peach <amount>-<beats>"
            !peach      = (constant) allows the Twitch bot to recognize this as parameter change
            <amount>    = 0-127; the rate of the LFO; 0 = slow, 127 = fast
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the parameter rate to 23 over 10 beats):
        "!peach 23-10"

    output message format:
        "peach <amount> <beats>"
        "peach 23 10"

    returns:
        single output message in an array

 */
function parsePeach(inputMessage){

    return parseTwoParameters(inputMessage, "!peach", "peach", 0, 127);

}