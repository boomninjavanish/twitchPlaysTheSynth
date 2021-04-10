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

    // Functions:
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

module.exports = MidiMessages;