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
//const creds = require('./creds');

// https://docs.cycling74.com/nodeformax/api/module-max-api.html
const max = require('max-api');

// https://dev.twitch.tv/docs/irc
// https://github.com/tmijs/docs/tree/gh-pages/_posts/v1.4.2
const tmi = require('tmi.js');

// store twitch api connection settings in this data struct
// DO NOT FILL IN WITH YOUR SETTINGS
// this will be populated in the MFL patch via the twitchSettings ID key
twitchApiOptions = {
    identity: {
        username: "",
        password: ""
    },
    channels: [ "" ]
};

// for making mappers
let mapperNames = [];

// tell us the node version
max.post(`Node version: ${process.version}`);

// create Twitch client
//const client = new tmi.client();
const client = new tmi.client(twitchApiOptions);

// Register our event handlers (defined below)
client.on('message', onMessageHandler);

// Called every time a message comes in
function onMessageHandler (target, context, msg, self) {
    // Ignore messages from the bot
    // if (self) { return; } 

    max.outlet("onMessageHandler start!");

    // Remove whitespace from chat message
    const commandName = msg.trim();

    // If the command is known, let's execute it
    if (commandName.slice(0, 1) === '!') {
        let errorMessageRegex = /^\/tpts\/twitchBot\/errorMessage/;

        max.post(`Parsing ${commandName}...`);

        // parse the command
        let outputMessage = parser.parse(commandName, mapperNames);

        // if no output messages are returned in the parser, then something is wrong
        if(outputMessage.length === 0){
            outputMessage.push("internalError The parser returned nothing to the outputMessage variable.");
        }
        // catch error messages then whisper to the user
        if(outputMessage[0].match(errorMessageRegex)){
            max.post(`context.username = ${context.username}`);
            client.whisper(context.username, `!tpts error message --> ${outputMessage[0].replace(errorMessageRegex,"")}`);
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

// Called when a user joins or parts the channel
function onJoinHandler (channel, username, self) {
    // if accumulator is less than one, start recording

    // add one to the users accumulator

}

function onPartHandler (channel, username, self) {
    // subtract one from the accumulator

    // if accumulator is less than one, stop recording


}

// parse message to connect to Twitch (message === "twitchConnect")
max.addHandler("twitchConnect", () => {
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
});

// parse message to disconnect from Twitch api ("twitchDisconnect")
max.addHandler("twitchDisconnect", () => {
    // connect bot to twitch
    client.disconnect();
    max.outlet("/tpts/twitchBot/messageOut 'Disconnected from Twitch'");
});

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
});


// parse messages sent from the inlet (for testing commands)
max.addHandler("input", (inputMessage) => {
    // parse through command parser if prepended with "input"
    let outputMessage = parser.parse(inputMessage);

    // output all parsed Max messages in returned array
    for(let line of outputMessage){
        max.outlet(line);
    }
});

// register new mapper names
max.addHandler("mapperName", (mapperName) => {
    // do not register if already there
    if(!mapperNames.includes(mapperName)){
        mapperNames.push(mapperName);
    }
});

// deletes mapper names
max.addHandler("deleteMapperName", (mapperName) => {
    // find it
    let indexToDelete = mapperNames.indexOf(mapperName);

    // if found, delete
    if(indexToDelete > -1){
        mapperNames.splice(indexToDelete);
    }
});