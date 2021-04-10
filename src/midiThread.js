// midi interfaces
/*
    ////////  Midi Input Callback /////////
*/
const midi = require('midi');
const vMidiInput = new midi.input();    // setup the virtual input device
const vMidiOutput = new midi.output();  // setup the virtual output device
let inLoop = true;

const vMidiInputCallback = function(deltaTime, message){
    switch(message[0]){
        case midiMessages.timingClock:
            // TODO: research if this will slow down thing (do it on another thread?)
            //transport.tick(); // transport clock go brrrrrrrrrr
            break;

        case midiMessages.stop:
            console.log("<<<<<< STOPPED >>>>>>");
            clockPulse = 1;
            break;

        case midiMessages.start:
            console.log("<<<<<< STARTED >>>>>>")
            break;
    }
}

// callback for midi input
vMidiInput.on('message', vMidiInputCallback(deltaTime, message));

// callback for midi output
// todo

// create a virtual input port
input.openVirtualPort(`${settings.vMidiBaseName} Input`);

// respond to all clock messages
input.ignoreTypes(true, false, true);

// keep the thread alive
while(inLoop){

}

// do before exiting thread
vMidiInput.closePort();
vMidiOutput.closePort();