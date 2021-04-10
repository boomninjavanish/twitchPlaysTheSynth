const midi = require('midi');
const MidiMessages = require('./midiMessages.js');
const Transport = require('./music');

// setup the virtual midi input and output devices
const input = new midi.input();
const output = new midi.output();

const midiMessages = new MidiMessages(); // midi message constants reference
let transport = new Transport(); // setup a transport object to talk to transportLoop
let settings = { vMidiBaseName: "!tpts" }; // hold the app settings; load from file (TODO) <------------

// midi input callback
input.on('message', (deltaTime, message) => {
    switch(message[0]){
        case midiMessages.timingClock:
            if(!transport.isInternalClock){
                // send a tick to the transport
                transport.tickNow = true;
                process.send({ transport: transport });
            }
            break;

        case midiMessages.stop:
            console.log("<<<<<< STOPPED >>>>>>");
            clockPulse = 1;
            break;

        case midiMessages.start:
            console.log("<<<<<< STARTED >>>>>>")
            break;
    }
});

// create a virtual input/out ports
input.openVirtualPort(`${settings.vMidiBaseName} Input`);
output.openVirtualPort(`${settings.vMidiBaseName} Output`);

// respond to all clock messages
input.ignoreTypes(true, false, true);

const looper = function(){
    // if using internal clock, send tick out
    if(transport.isInternalClock && transport.tickNow){
        // send start if it is first time
        if(transport.isStopped) {
            output.sendMessage(midiMessages.start);
            transport.isStopped = false;
        }
        output.sendMessage(midiMessages.clockPulse;
    }
}

// set the loop run interval to half of the ticks per milliseconds
setInterval(looper, transport.ticksPerMillis/2);

// deal with messages from main thread
process.on('message', async (message) => {
    if(message.transport) message.transport = transport;
    if(message.settings) message.settings = settings;
});