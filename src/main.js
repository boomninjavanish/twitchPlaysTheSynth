// the following vars will act as the app's model
// when the main loop receives data, it will process it then
//  send it along to another module

// includes:
const { fork } = require('child_process');
const Settings = require('./classes').Settings;

// vars:
let readyToExit = false;
let settings = new Settings();
let transportInfo = {
    ticks: 0,
    beat: 0,
    bar: 0
}

// forks:
// start the forked loops
const transportLoop = fork('./transportLoop.js');
const viewLoop = fork('./viewLoop.js');

// message routing:
// transmitters
transportLoop.send({
    baseName: settings.baseName,
    usingInternalClock: settings.usingInternalClock,
});

// receivers
transportLoop.on('message', (message) => {
    if(message.ticks) transportInfo.ticks = message.ticks;
    if(message.beat) transportInfo.beat = message.beat;
    if(message.bar) transportInfo.bar = message.bar;

    // send to viewer
    viewLoop.send({
       ticks: message.ticks,
       beat: message.beat,
       bar: message.bar
    });

    // ready to exit
    if(message.exit){
        readyToExit = true;
    }
});

viewLoop.on('message', (message) => {
    // if the user exits, shut everything down
    if(message.exit){
        // close the transport's midi ports
        transportLoop.send({exit: true});
        //while(!readyToExit){}; // wait until all things have shutdown
        process.exit(0);
    }
});