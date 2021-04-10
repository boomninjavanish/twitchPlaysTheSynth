class Transport{
    // Fields:
    #TICKS_PER_BEAT = 24; // ticks per beat (midi spec)
    #ticks = 0;
    #beat = 0;
    #bar = 1;
    bpm = 120;
    isInternalClock = true;    // using internal or external clock?
    isStopped = true;
    isPaused = false;
    tickNow = false;    // do we create or respond to a tick right now?
    timeSignature = {
        measureLength:  6,   // beats per bar
        subdivision:    8    // the sub-division quantifier (ex: 4 = quarter note)
    };

    // Setters:


    // Getters:
    get beat()              { return this.#beat;                                    }
    get bar()               { return this.#bar;                                     }
    get ticks()             { return this.#ticks;                                   }
    get ticksPerMillis()    {
        // 60000 / BPM = beats per milliseconds
        // subdivision / 4 = beat multiplier
        // (beats per milliseconds / ticks per beat) * beat multiplier  = ticks per milliseconds
        return ((60000 / this.bpm) / this.#TICKS_PER_BEAT) * (this.timeSignature.subdivision / 4);
    }

    // Functions:
    // move the clock forward; calculate ticks, beats, and measures
    tick(){
        this.#ticks++;

        // on tick per beat
        if(this.#ticks === this.#TICKS_PER_BEAT + 1){
            this.#ticks = 1;
        }

        // one beat
        if(this.#ticks === 1) this.#beat++;

        // one measure
        if(this.#beat === this.timeSignature.measureLength + 1)
        {
            this.#beat = 1;
            this.#bar++;
        }

    }

    // stop the transport; reset all values to zero
    stop(){
        if(this.passive){

        }
        this.#ticks = 0;
        this.#beat = 0;
        this.#bar = 0;
    }

    // pause the transport;
    pause(){

    }

    // continue/start the transport
    play(){

    }

}

module.exports = Transport;