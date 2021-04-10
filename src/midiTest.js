const midi = require('midi');
const MidiMessages = require('./midiMessages.js');


const input = new midi.input(); // setup the virtual input device

const midiMessages = new MidiMessages(); 

// midi input callback
input.on('message', (deltaTime, message) => {
    switch(message[0]){
        case midiMessages.timingClock:
            // TODO: research if this will slow down thing (do it on another thread?)    
            console.log(`tick`);
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

// create a virtual input port
input.openVirtualPort("!tpts Input");

// respond to all clock messages
input.ignoreTypes(true, false, true);

// listen for two minutes, then shut off
setTimeout(function(){
    // close when done
    input.closePort();
}, 120000);


