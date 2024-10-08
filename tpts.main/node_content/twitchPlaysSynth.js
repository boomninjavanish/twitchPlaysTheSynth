/*
    twitchPlaysSynth.js
    (c) 2020. Matthew Dunlap.
    Twitch Plays the Synth is a project that allows people to perform music collaboratively in
    real time using the a Twitch bot and Max MSP.
    This is the main node.js script that runs in a Max patcher using the node.js object.
*/

/*
   /////////// library includes /////////// 
*/

// Verbose mode for troubleshooting
let isVerbose = true;

// https://docs.cycling74.com/nodeformax/api/module-max-api.html
const max = require('max-api');

// https://github.com/rotemdan/lzutf8.js
const compressor = require('lzutf8');

// tell us the node version
max.post(`Node version: ${process.version}`);

// https://dev.twitch.tv/docs/irc
// https://github.com/tmijs/docs/tree/gh-pages/_posts/v1.4.2
const tmi = require('tmi.js');

/*
   /////////// classes /////////// 
*/

// Named values are mapper parameters value numbers that correspond to a named string
class NamedValue {
    constructor(name = "", value = 0){
        this.name = name;
        this.value = value;
    }
}

// A Mapper is a paramamapper mapper that maps parameters
//  name: the mapper's name
//  access: which level of user may adjust this mapper's value
//  values: an array of named values (see class above)
class Mapper {
    constructor(name = "", access = "public"){
            this.name = name; // the name of the mapper
            this.access = access; // the access level of the mapper
            this.values = []; 
    }

    // Fields:
    // the value range for this mapper
    valueRange = {
        min: 0,
        max: 100
    }
    
    // Setters:
    // set the named value names to the this.value array
    // input: csValueNames: a comma separated string of value names
    set valueNames(csValueNames){
        if(csValueNames){
            let nameArr = csValueNames.split(".");
            let startedEmpty = this.values.length == 0;
            let unequalLength = !(this.values.length == nameArr.length);

            // reset the values array if the new one is different size
            if(unequalLength) this.values = [];

            for(let i in nameArr){            
                // if there is a named value there, set the parsed names to the name field
                if(this.values[i] instanceof NamedValue)
                    this.values[i].name = nameArr[i];

                // otherwise, make a new named value, set the name to the name
                else
                    this.values[i] = new NamedValue(nameArr[i]);            
            }

            if(startedEmpty || unequalLength) this.genValueValues();
        }
    }

    // set the named value values to the this.value array
    // input: csValueValues: a comma separated string of value name values
    set valueValues(csValueValues){
        // if no values are given, automaticaly generate them
        if(!csValueValues) this.genValueValues();

        // otherwise, split out and assign the values
        else {
            let numArr = csValueValues.split(".");
                      
            for(let i in numArr){
                // if there is a named value there, set the number to the value
                if(this.values[i] instanceof NamedValue) {
                    let valueValue = parseFloat(numArr[i]);
                    // if value is NaN, leave the generated value in place 
                    if(!isNaN(valueValue))
                        this.values[i].value = valueValue;
                }
                // otherwise, make a new named value and set the number to value
                else
                    this.values[i] = new NamedValue("", parseInt(numArr[i]));                
            }
        }
    }

    // Getters:
    // returns the named values names in an array 
    get valueNames(){
        let valueNames = [];

        // if no value names present, return empty
        // otherwise, give an array of named value names
        if(!(this.values.length == 0)){
            for(let index in this.values){
                valueNames.push(this.values[index].name);
            }
        }
        return valueNames;
    }

    // returns the named values values in an array
    get valueValues(){
        let valueNames = [];

        // if no value names present, return empty
        // otherwise, give an array of named value values
        if(!(this.values.length == 0)){
            for(let index in this.values){
                valueNames.push(this.values[index].value);
            }
        }
        return valueNames;
    }

    // returns the named values names in comma-separated list
    get cvValueNames(){
        return this.genCSV(this.valueNames);
    }

    // returns the named values values in comma-separated list
    get cvValueValues(){
        return this.genCSV(this.valueValues);
    }

    // Methods:
    genCSV(valueArray){
        let string = "";

        // if no value names present, return undefined
        // otherwise, give a comma separated value version of the array
        if(!(valueArray.length == 0)){
            for(let index in valueArray){
                if(index == 0){ 
                    string = `${valueArray[index]}`; 
                } else { 
                    string += `.${valueArray[index]}`; 
                } 
            }            
        }

        return string;
    }

    // generates the named value names automatically if there
    //  named value names in this.values
    genValueValues(){
        let numNamedValues = this.values.length;

        // exit silently if the array of values are empty
        if(numNamedValues == 0) return;
        
        for(let index in this.values){
            // calculate the middle of each value range
            let mid = (parseFloat(index) + 1 / numNamedValues);
            mid += (parseFloat(index) + 2 / numNamedValues);
            mid /= 2;

            // scale to the actual value 
            let value = (this.valueRange.max * mid) / numNamedValues;
            value = Math.round(value);

            // set the value for the named value
            this.values[index].value = value;
        }
        // output to paramamapper values text box as comma-separated values  
        max.outlet(`/tpts/paramamapper ${this.name} valueValues ${this.cvValueValues}`);
    }

    // finds a name in the array of named values; returns the namedValue object
    findNamedValueName(nameValueValue){
        return this.values.find(object => object.value === nameValueValue);
    }
    
    // finds a value in the array of named values; returns the namedValue object
    findNamedValueValue(namedValueName){
        return this.values.find(object => object.name === namedValueName);
    }
    
}

// Class that makes an array of paramamapper mappers.
class Mappers extends Array {
    // Constructor:
    constructor(...items) {
        super(...items);    
    }

    // Methods:
    // find and return a mapper object within this array
    findMapper(mapperName){
        return this.find(object => object.name === mapperName);
    }

    // find and return a mapper index within this array
    findMapperIndex(mapperName){
        return this.findIndex(object => object.name === mapperName);
    }

    // parses string received from max that contains a mapper name
    //  followed by a space, followed by a comma sepaated list of values
    //  returns an object that contains this array's index, the comma-
    //  separated values, and whether the mapper was found in this array
    parseMaxCvData(maxData){
        if(maxData){
            // parse incoming data into elements
            let dataArr = maxData.split(" ");

            // find the element in the array
            let indexToChange = this.findMapperIndex(dataArr[0]);
            let csValues = dataArr[1];

            if(indexToChange > -1 && csValues)
                return { found: true, index: indexToChange, csValues: csValues };            
        }
        return { found: false, index: null, csValues: null };
    }

    // add a new mapper object to the array
    // maxData is a max list with: <name> <access>
    addMapper(maxData){
        // retrieve the data
        let dataArr = maxData.split(" ");

        if(dataArr[0]){
            const mapper = new Mapper(); // mapper object to push into array
            mapper.name = dataArr[0];
            if(dataArr[1]) mapper.access = dataArr[1];
            
            // if the mapper doesn't exist, push it to the mappers array
            if(!this.findMapper(mapper.name)){
                // add to this array
                this.push(mapper);
            }
        }
    }

    // delete a mapper from the array by mapper name
    deleteMapper(name){
        // find it
        let indexToDelete = this.findMapperIndex(name);

        // if found, delete
        if(indexToDelete > -1)
            this.splice(indexToDelete, 1);
    }

    // change the access level of a mapper
    // maxData is a max list with: <name> <accessLevel>
    changeMapperAccess(maxData){
        // parse incoming data into elements
        let dataArr = maxData.split(" ");

        // find the element in the array
        let indexToChange = this.findMapperIndex(dataArr[0]);

        if(indexToChange > -1){
            // make public if access not defined
            if(!dataArr[1]){ dataArr[1] = "public"; }

            // change access level
            this[indexToChange].access = dataArr[1];
        }
    }

    // add named value names to a mapper
    // input: a string that contains the mapper name followed by a space followed by 
    //  a comma separated list of named value names: "<mapperName> <csNames>"
    addMapperValueNames(maxData){
        max.post(`maxData: ${maxData}`);
        let parsedData = this.parseMaxCvData(maxData);

        if(parsedData.found) this[parsedData.index].valueNames = parsedData.csValues;   
    }

    // add named value values to a mapper
    // input: a string that contains the mapper name followed by a space followed by 
    //  a comma separated list of named value values: "<mapperName> <csValues>"
    addMapperValueValues(maxData){
        let parsedData = this.parseMaxCvData(maxData);
        
        if(parsedData.found) this[parsedData.index].valueValues = parsedData.csValues;
    }
}

/*
   /////////// functions /////////// 
*/

const connectToTwitch = function (){    
    // fill in the client connection settings
    client.username = twitchApiOptions.identity.username;
    client.password = twitchApiOptions.identity.password;
    client.channels = twitchApiOptions.channels;

    // connect bot to twitch
    client.connect()
        .then((data) => {
            max.outlet(`/tpts/twitchBot/messageOut 'Connected to ${data}'`);
        })
        .catch((err) => {
            max.outlet(`/tpts/twitchBot/messageOut 'Error connecting to Twitch: ${err}'`);
            max.outlet("twitchBangDisconnectError bang");
        });
}

const disconnectFromTwitch = function (){
    // connect bot to twitch
    client.disconnect()
    .then((data) => {
        max.post(`Disconnected from Twitch via ${data[0]}:${data[1]}`);
        max.outlet("/tpts/twitchBot/messageOut 'Disconnected from Twitch'");
    }).catch((err) => {
        max.post(`Error disconnecting from Twitch: "${err}"`);
    });
    max.outlet("/tpts/twitchBot/messageOut 'Disconnected from Twitch'");
}

const parse = function (
    inputMessage, 
    mappers,
    userAccessLevel = "public",
    midiNumberMin = 20, 
    midiNumberMax = 110, 
    midiNumberTrimType = "none",
    tonalCenter = 48.0
) {
    // find which message is being parsed
    let outputMessage = []; // the Max formatted output
    //let typeRegex = /^![A-Za-z0-9-]+|!%/; // the inputKey with exclamation point (include all letters, numbers, and hyphens)
    let typeRegex = /^![A-Za-z0-9-]+/; // the inputKey with exclamation point (include all letters, numbers, and hyphens)
    //let melodyRegex = /^!m\b|^!m\d+\b|^!%/;
    let melodyRegex = /^!m\b|^!m\d+\b/;
    let matches = inputMessage.match(typeRegex); // get the inputKey from the message
    let noAhhh = ""; // input key with out the AHHHH!!! (exclamation point)

    // check to see that we have matches and object is not null or undefined
    if(matches){ 
        noAhhh = matches[0].slice(1); // strip the exclamation point from the key for paramamapper messages
        let mapperIndex = mappers.findIndex(object => object.name === noAhhh); // get the index value of mapper name
        let melodyIndicator = matches[0].match(melodyRegex);

        // parse melody if '!m'; everything else is considered to be paramamapper or error
        if(melodyIndicator){
            
            /* !!!!!! crashes in Max for Live environment            !!!!!!
               !!!!!! will be implemented when moved to VUE/Electron !!!!!!

            // non compressed melody
            if(noAhhh === "%"){
                let theCompressedMelody = inputMessage.slice(2);
                
                // decompress melody before parsing
                let theExpandedMelody = compressor.decompress(theCompressedMelody, {inputEncoding: "Base64"});
                inputMessage = `!m${theExpandedMelody}`;
                if(isVerbose) max.post(`Decompressed melody: ${inputMessage}`);
            } 
            
            */ 
            // parse melody
            outputMessage = parseMelody(inputMessage, tonalCenter, midiNumberMin, midiNumberMax, midiNumberTrimType);
        
        } else if(mapperIndex > -1){ // if not a melody, then it must be a paramamapper    
            // restrict command parsing to different tiers based on mapper[x].access value
            // assign a user and the mapper a level score 
            let levels = [
                "public",   // 0
                "sub",      // 1
                "mod",      // 2
                "bcaster"   // 3
            ];
            let userScore = levels.indexOf(userAccessLevel);
            let mapperScore = levels.indexOf(mappers[mapperIndex].access);

            if(isVerbose) max.post(`userScore: ${userScore}; mapperScore: ${mapperScore}`);
            
            // compare the scores to give tiered access
            if(userScore >= mapperScore){
                // parse mapper command
                outputMessage = parseMapper(inputMessage, matches[0], `/tpts/paramamapper ${noAhhh}`);
                return outputMessage;
            } else {
                // access denied!
                outputMessage.push(`/tpts/twitchBot/errorMessage '${noAhhh} is restricted to ${mappers[mapperIndex].access} members.'`);
                return outputMessage;
            }
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
                The message identifier without the exclamation point; if it is a melody this
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
    let valueRegex = /\s([+-]?(\.)?\d+(\.\d+)?)|\s[\w#@$%^&\*]+/g; 

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
            for(let i in valueMatches){
                // remove the spaces from the values
                let value = valueMatches[i].replace(/^\s/, "");
                
                // if it is a number, parse as a float
                if(value.match(/^[+-]?\d+[.]?[\d+]?/g)){
                    valueMatches[i] = parseFloat(value);
                } else {
                    valueMatches[i] = value;
                }
            }
                    
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
 parse mapper commands - parses a input key followed by two numeric parameters; one for the amount of change
    the other for the duration in beats for the change to glide towards in a linear ramp

    input message format:
        "<inputKey> <amount>[<beats>] "
            <inputKey>  = the key that the user enters to indicate a specific command
            <amount>    = the amount change requested by the user
            <beats>     = beats; how many quarter notes to for the change to take place; 0 = immediately

        Example (change the resonance knob to 64 over 8 beats):

            "!r 64[8]"

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
const parseMapper = function (inputMessage, inputKey, outputKey, min = 0, max = 100){
    let outputMessage = []; // the Max formatted output array
    let median = parseInt((min + max) / 2); // used to communicate range errors
    let mapper = mappers.findMapper(inputKey.slice(1)); // return a mapper object that matches the input key (w/out an '!')

    // get the values for the param
    let extractedValues = extractValues(inputMessage);

    if(extractedValues.error === "none"){
        //////////// <--- TODO: transform the following if else statements into a loop that iterates over the .val array;
        ///////////             this will allow for multi-automations; requires a queue for mapper commands 
        ///////////             (equivalent to a [ coll ] object in Max)
        // check for named value and get the potential mapper value
        let value = extractedValues.val[0]
        let namedValue = mapper.findNamedValueValue(value);

        // if value is named value, then convert named value into real value
        if(namedValue instanceof NamedValue){
            value = namedValue.value;
        }

        // set the current number beats that we will send to command
        let beats = extractedValues.beats[0]; 

        // send the parsed the values and beats if no error
        if(value >= min && value <= max){ // test if val is in range
            if(beats >= 0){ // test if beats are in range
                if(beats < 1) beats = 1; // force beats to be a minimum of 1 beat
                outputMessage.push(`${outputKey} ${value} ${beats}`);
            } else {
                // syntax error and quit
                outputMessage.push(`/tpts/twitchBot/errorMessage 
                'The value of ${beats} is out of range. The value must be greater than
                or equal to zero. --
                Your command: ${inputMessage} --
                An example of a correct command: !${extractedValues.identifier} ${median}[4]'`);

                return outputMessage;
            }
        } else {
            // syntax error and quit
            outputMessage.push(`/tpts/twitchBot/errorMessage 
                'The value of ${value} is out of range. The value must be between
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

            // keep users from submiting too small of a beat
            if(melodyValues.beats[index] < 0.1){
                melodyValues.beats[index] = 0.1;
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

/*
   /////////// global vars /////////// 
*/

// store twitch api connection settings in this data struct
// DO NOT FILL IN WITH YOUR SETTINGS
// this will be populated in the MFL patch via the twitchSettings ID key
const twitchApiOptions = {
    options: {
        clientId: "tptsParser",
        debug: isVerbose
    },
    connection: {
        reconnect: true
    },
    identity: {
        username: "",
        password: ""
    },
    channels: [ "" ]
};

// for making mappers in paramamapper
// each mapper name in the array has the following elements: name, access, and values
const mappers = new Mappers();

// for keeping within midi pitch number range
let midiNumberMin = 20;
let midiNumberMax = 110;
let midiNumberTrimType = "";

// create Twitch client
const client = new tmi.client(twitchApiOptions);

// Register our event handlers (defined below)
client.on('message', onMessageHandler);

/*
   /////////// Twitch Object I/O Handlers /////////// 
*/

// Called every time a message comes in
function onMessageHandler (channel, userstate, msg, self) {
    // Ignore messages from the bot
    //if(self) { return; } 

    // Remove whitespace from chat message
    const commandName = msg.trim();

    // If the command is known, let's execute it
    if (commandName.slice(0, 1) === '!') {
        let errorMessageRegex = /^\/tpts\/twitchBot\/errorMessage/;

        if(isVerbose) max.post(`Parsing: ${commandName}...`);
        if(isVerbose) max.post(`Userstate object: ${JSON.stringify(userstate)}`);
        
        // get the user's access level
        let userAccessLevel = "";

        if(userstate.badges){
            if("broadcaster" in userstate.badges){
                // user is broadcaster
                if(isVerbose) max.post(`${userstate.username} is bcaster!`);
                userAccessLevel = "bcaster";

            } else if("moderator" in userstate.badges){
                // user is moderator
                if(isVerbose) max.post(`${userstate.username} is a mod!`);
                userAccessLevel = "mod";

            } else if("subscriber" in userstate.badges || "founder" in userstate.badges){
                // user is sub
                if(isVerbose) max.post(`${userstate.username} is a subscriber!`);
                userAccessLevel = "sub";
            } else {
                // user has badges, but none meet the requirements
                if(isVerbose) max.post(`${userstate.username} is a pleeb!`);
                userAccessLevel = "public";
            }
            
        } else {
            // user has no badges at all
            if(isVerbose) max.post(`${userstate.username} is a pleeb!`);
            userAccessLevel = "public";
        }

        // parse the command
        let outputMessage = parse(
                commandName, 
                mappers, 
                userAccessLevel, 
                midiNumberMin, 
                midiNumberMax, 
                midiNumberTrimType
            );

        // if no output messages are returned in the parser, then something is wrong
        if(outputMessage.length === 0){
            outputMessage.push("internalError The parser returned nothing to the outputMessage variable.");
        }
        /*
        // catch error messages then whisper to the user
        if(outputMessage[0].match(errorMessageRegex)){
            client.whisper(userstate.username, `!tpts error message --> ${outputMessage[0].replace(errorMessageRegex,"")}`)
            .then((data) => {
                // data contains: [username, message]
                max.post(`Whispered to ${data[0]}: "${data[1]}"`);
            }).catch((err) => {
                max.post(`Error whispering to user: ${err}`);
            });
        }
        */
        // output all parsed Max messages in returned array
        for(let line of outputMessage){
            max.outlet(line);
        }

        // if command is a melody, send user name to dashboard
        if(commandName.slice(0, 2) === '!m'){
            max.outlet(`/tpts/userName ${userstate.username}`);
        }
        


    } else {
        //max.post(`¡Unknown command ${commandName}!`);
    }
}

// Called when a user joins or parts the channel
function onJoinHandler (channel, username, self) {
    // if accumulator is less than one, start recording

    // add one to the users accumulator

}

function onPartHandler (channel, username, self) {
    // subtract one from the accumulator

    // if accumulator is less than one, stop recording


}

/*
   /////////// Max Node Object I/O Handlers /////////// 
*/

// parse message to connect to Twitch (message === "twitchConnect")
max.addHandler("twitchConnect", connectToTwitch);

// parse message to disconnect from Twitch api ("twitchDisconnect")
max.addHandler("twitchDisconnect", disconnectFromTwitch);

// parse twitch api access settings (prepended with twitchSettings)
max.addHandler("twitchSettings", (inputMessage) => {
    // find the setting type by key
    let settingsKey = inputMessage.match(/^\w+/);
    let keyPlusSpaceRegex = /^\w+\s/;

    // twitchApi
    if(settingsKey[0] === "twitchApi"){
        twitchApiOptions.identity.password = inputMessage.replace(keyPlusSpaceRegex, "");
    }

    // twitchUser
    if(settingsKey[0] === "twitchUser"){
        twitchApiOptions.identity.username = inputMessage.replace(keyPlusSpaceRegex, "");
    }

    // twitchChan
    if(settingsKey[0] === "twitchChan"){
        twitchApiOptions.channels[0] = inputMessage.replace(keyPlusSpaceRegex, "");
    }

    // midi range: minimum allowed 
    if(settingsKey[0] === "midiNumberMin"){
        midiNumberMin = parseInt(
            inputMessage.replace(keyPlusSpaceRegex, "")
            );
    }

    // midi range: maximum allowed 
    if(settingsKey[0] === "midiNumberMax"){
        midiNumberMax = parseInt(
            inputMessage.replace(keyPlusSpaceRegex, "")
            );
    }

    // midi range: trimType
    if(settingsKey[0] === "midiNumberTrimType"){
        midiNumberTrimType = inputMessage.replace(keyPlusSpaceRegex, "");
    }
});

// register new mapper names
// data = <mapper> <access>
max.addHandler("mapperName", (data) => {
    mappers.addMapper(data);
});

// delete mapper names
// mapperName = name of mapper to delete
max.addHandler("deleteMapperName", (mapperName) => {
   mappers.deleteMapper(mapperName);
});

// changes the access level of a mapper name
// data = <mapper> <access>
max.addHandler("changeMapperAccess", (data) => {
    mappers.changeMapperAccess(data);
});

// add mapper value names to a mapper
// data = <mapperName> <name,name,name...>
max.addHandler("addMapperValueNames", (data) => {
    max.outlet(mappers.addMapperValueNames(data));
});

// add mapper value values to a mapper
// data = <mapperName> <value,value,value...>
max.addHandler("addMapperValueValues", (data) => {
    mappers.addMapperValueValues(data);
});

