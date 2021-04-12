const { fork } = require('child_process');
const Transport = require('./classes.js');
const fileSystem = require('fs');
const homeDirectory = require('os').homedir();

/*
    ////////  Global Vars /////////
*/
const saveDirectory = `${homeDirectory}/tpts`;
const settingsFile = `${saveDirectory}/settings.json`;


// the following vars will act as the app's model
// when the main loop receives data, it will store it in the following
let transport = new Transport();

/*
    ////////  Settings Var /////////
*/
let settings = {
    // sets the virtual midi input/output devices name
    vMidiBaseName: "!tpts"
}

let message = "bang";

/*
    ///////// Do Once ///////////
 */
// check for settings file
try {
    // check for settings file; if not exist write one
    if(!fileSystem.existsSync(settingsFile)){
        fileSystem.mkdirSync(saveDirectory);
        const data = fileSystem.writeFileSync(settingsFile, settings);
        console.log(data);
    } else { // if exists, load file
        settings = fileSystem.readFileSync(settingsFile, "utf8");
    }
} catch (err) {
    console.error(err);
}
fileSystem.access()

// start the forked loops
const transportLoop = fork('./transportLoop.js');
const midiLoop = fork('./midiLoop.js');

/*
    ///////// Message Routing ///////////
 */
// send the settings to the forks
midiLoop.send({ settings: settings });

// receivers
transportLoop.on('message', (message) => {
    // save transport to local var
    transport = message.transport;

    // send the transport to the midiLoop
    midiLoop.send({ transport: transport });
});


