let counter = 0;
let output = "";

async function messageHandler(messageIn){
    return 0;
}

const looper = function(){
    counter++;
    // send response to master process
    process.send(`mainThread: ${counter}`);
}

setInterval(looper, 1);



// deal with messages
process.on('message', async (messageIn) => {
    //output = await messageHandler(count);
})