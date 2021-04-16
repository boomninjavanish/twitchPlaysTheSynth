const blessed = require('blessed');

let transportInfo = {
    ticks: 0,
    beat: 0,
    bar: 1
}

// create the screen object
const screen = blessed.screen({
    smartCSR: true
});

screen.title = '!tpts';

const box = blessed.box({
    top: 'center',
    left: 'center',
    width: '50%',
    height: '50%',
    content: 'Hi',
    tags: true,
    border: {
        type: 'line'
    },
    style: {
        fg: 'white',
        bg: 'magenta',
        border: {
            fg: '#f0f0f0'
        },
        hover: {
            bg: 'green'
        }
    }
});

const displayTransport = function(){
    box.content = `Transport\n\n
        Bar:\t${transportInfo.bar}\n
        Meas:\t${transportInfo.beat}\n
        Tick:\t${transportInfo.ticks}`;

    screen.render();
}

screen.append(box);

screen.key(['escape', 'C-c'], function(ch, key){
    // tell app to shutdown
    process.send({exit: true});
});

box.focus();
screen.render();
displayTransport();

// listen for messages
process.on('message', async (message) => {
    transportInfo.bar = message.bar;
    transportInfo.beat = message.beat;
    transportInfo.ticks = message.ticks;
    displayTransport();
});