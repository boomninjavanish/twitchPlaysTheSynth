// includes:
const midi = require('midi');
const microtime = require('microtime');
const Transport = require('./classes.js').Transport;
const MidiMessages = require('./classes.js').MidiMessages;

// vars:
let transport = new Transport();
let midiMessages = new MidiMessages();
let timeThen = microtime.now();

// store any settings incoming from main
let settings = {
    baseName: "name",
    usingInternalClock: false,
};

// midi ports:
// setup the virtual midi input and output devices
const midiClockInput = new midi.input();
const midiClockOutput = new midi.output();

// open the virtual midi ports
midiClockInput.openVirtualPort(`${settings.baseName} Clock Input`);
midiClockOutput.openVirtualPort(`${settings.baseName} Clock Input`);

// setup the midi input to listen to the clock signal
midiClockInput.ignoreTypes(true, false, true);

// functions:
async function messageHandler(messageIn){
    return 0;
}

// midi input callback
midiClockInput.on('message', (deltaTime, message) => {
    switch(message[0]){
        case midiMessages.timingClock:
            if(!settings.usingInternalClock){
                // send a tick to the transport
                transport.tick();
            }
            break;

        case midiMessages.stop:
            console.log("<<<<<< STOPPED >>>>>>");
            // TODO: stop transport
            break;

        case midiMessages.start:
            console.log("<<<<<< STARTED >>>>>>")
            // TODO: start transport
            break;

        case midiMessages.songPositionPointer:
            // reset the counts
            transport.reset();
            break;

        default:
            console.log(`${message[0].toString(16)} ${message[1].toString(16)} ${message[2].toString(16)}`)
    }
});

//loop:
const looper = function(){
    // if using internal clock, advance the transport on tick
    // if not, see midi input handler above
    if(settings.usingInternalClock) {
        const timeNow = microtime.now();
        let timeDelta = timeNow - timeThen;
        let timeDeltaMillis = timeDelta * 0.001;

        // --->**((( [ > tick < ] )))**<---
        if (timeDeltaMillis >= transport.ticksPerMillis) {
            // move the transport one tick
            transport.tick();

            // set the clock for next tick interval
            timeThen = timeNow;
        }
    }

    // send current transport object to master process
    process.send({
        ticks: transport.ticks,
        beat: transport.beat,
        bar: transport.bar
    });
}

// set the loop run interval to half of the ticks per milliseconds
setInterval(looper, transport.ticksPerMillis/2);

// deal with messages from main thread:
process.on('message', async (message) => {
    //output = await messageHandler(count);
    if(message.usingInternalClock){
        settings.baseName = message.baseName;
        settings.usingInternalClock = message.usingInternalClock;
    }
    // close all ports; then tell the main app we are ready
    if(message.exit){
        midiClockInput.closePort();
        midiClockOutput.closePort();
        process.send({readyToExit: true});
    }
});