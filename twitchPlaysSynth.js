/*
    twitchPlaysSynth.js
    2020. Matthew Dunlap.
    Twitch Plays the Synth is a project that allows people to perform music collaboratively in
    real time using the a Twitch bot and Max MSP.
    This is the main node.js script that runs in a Max patcher using the node.js object.
 */

// parses twitch commands and sends output to max
const parser = require('./parser');

// contains the login information for the tmi.client
const creds = require('./creds');

// https://docs.cycling74.com/nodeformax/api/module-max-api.html
const max = require('max-api');

// https://dev.twitch.tv/docs/irc
// https://github.com/tmijs/docs/tree/gh-pages/_posts/v1.4.2
const tmi = require('tmi.js');

// create Twitch client
const client = new tmi.client(creds.opts);

// Register our event handlers (defined below)
client.on('message', onMessageHandler);
client.on('connected', onConnectedHandler);

// Connect to Twitch:
client.connect();

// Called every time a message comes in
function onMessageHandler (target, context, msg, self) {
    //if (self) { return; } // Ignore messages from the bot

    // Remove whitespace from chat message
    const commandName = msg.trim();

    // If the command is known, let's execute it
    if (commandName.slice(0, 1) === '!') {
        max.post(`Parsing ${commandName}...`);

        // parse the command
        let outputMessage = parser.parse(commandName);

        // catch error messages then tell the user
        if(outputMessage[0].slice(0, 12) === "errorMessage"){
            client.say(target, "Error --> " + outputMessage[0].slice(13));
        }

        // output all parsed Max messages in returned array
        for(let line of outputMessage){
            max.outlet(line);
        }

        // if command is a melody, send user name to dashboard
        if(commandName.slice(0, 2) === '!m'){
            max.outlet("userName " + context.username);
        }


    } else {
        //max.post(`¡Unknown command ${commandName}!`);
    }
}

// Called every time the bot connects to Twitch chat
function onConnectedHandler (addr, port) {
    max.post(`* Connected to ${addr}:${port}`);
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

// parse messages sent from the inlet (for testing commands)
max.addHandler("input", (inputMessage) => {

    let outputMessage = parser.parse(inputMessage);

    // output all parsed Max messages in returned array
    for(let line of outputMessage){
        max.outlet(line);
    }
});