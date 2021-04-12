const microtime = require('microtime');
const Transport = require('./classes.js');

let transport = new Transport();
let timeThen = microtime.now();

async function messageHandler(messageIn){
    return 0;
}

const looper = function(){
    const timeNow = microtime.now();
    let timeDelta = timeNow - timeThen;
    let timeDeltaMillis = timeDelta * 0.001;

    // --->**((( [ > tick < ] )))**<---
    if(timeDeltaMillis >= transport.ticksPerMillis){
        // move the transport one tick
        transport.tick();

        // set the clock for next tick interval
        timeThen = timeNow;
    }

    // send current transport object to master process
    process.send({ transport: transport });
}

// set the loop run interval to half of the ticks per milliseconds
setInterval(looper, transport.ticksPerMillis/2);

// deal with messages from main thread
process.on('message', async (message) => {
    //output = await messageHandler(count);
})