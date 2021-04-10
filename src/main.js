const { fork } = require('child_process');
const Transport = require('./music');

const transport = new Transport();

/*
    ////////  Settings Var /////////
*/
let settings = {
    // sets the virtual midi input/output devices name
    vMidiBaseName: "!tpts"
}

let message = "bang";


// forks
const transportLoop = fork('./transportLoop.js');
const midiLoop = fork('./midiLoop.js');

// send the settings to the forks
midiLoop.send({ settings: settings });

// receivers
transportLoop.on('message', (message) => {
    // send the transport to the midiLoop
    midiLoop.send({ transport: message.transport });
});


