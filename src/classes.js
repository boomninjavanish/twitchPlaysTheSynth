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

    // Methods:
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

} module.exports = Transport;

class MidiMessages {
    // Fields:
    #TIMING_CLOCK           = 0xF8;
    #START                  = 0xFA;
    #CONTINUE               = 0xFB;
    #STOP                   = 0xFC;
    #ACTIVE_SENSING         = 0xFE;
    #SYSTEM_RESET           = 0xFF;
    #NOTE_ON_BASE           = 0x90;
    #NOTE_OFF_BASE          = 0x80;
    #ATKEYPRESS_BASE        = 0xA0; // After touch key pressure
    #CONTROL_CHANGE_BASE    = 0xB0;
    #PROGRAM_CHANGE_BASE    = 0xC0;
    #ATCHANPRESS_BASE       = 0xD0; // After touch channel pressure
    #PITCH_BEND_BASE        = 0xE0;

    // Getters:
    get timingClock()   { return this.#TIMING_CLOCK;    }
    get start()         { return this.#START;           }
    get continue()      { return this.#CONTINUE;        }
    get stop()          { return this.#STOP;            }
    get activeSensing() { return this.#ACTIVE_SENSING;  }
    get systemReset()   { return this.#SYSTEM_RESET;    }

    // Methods:
    noteOn(voice) {
        return this.#NOTE_ON_BASE + voice;
    }

    noteOff(voice) {
        return this.#NOTE_OFF_BASE + voice;
    }

    afterTouchKey(voice){
        return this.#ATKEYPRESS_BASE + voice;
    }

    controlChange(voice){
        return this.#CONTROL_CHANGE_BASE + voice;
    }

    programChange(voice){
        return this.#PROGRAM_CHANGE_BASE + voice;
    }

    afterTouchChannel(voice){
        return this.#ATCHANPRESS_BASE + voice;
    }

    pitchBend(voice){
        return this.#PITCH_BEND_BASE + voice;
    }
}

module.exports = Transport, MidiMessages;