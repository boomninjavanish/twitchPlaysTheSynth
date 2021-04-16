// https://github.com/indexzero/nconf#readme
const nconf = require('nconf'); // for saving the settings file

// https://lodash.com/docs/4.17.15
const _ = require('lodash'); // for object iterations and comparison

const homeDirectory = require('os').homedir(); // save settings in home directory
const fileSystem = require('fs'); // making setting dir and replacing save files

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
    get beat()              { return this.#beat;  }
    get bar()               { return this.#bar;   }
    get ticks()             { return this.#ticks; }
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
    reset(){
        this.#ticks = 0;
        this.#beat = 0;
        this.#bar = 1;
    }

    // pause the transport;
    pause(){

    }

    // continue/start the transport
    play(){

    }

}

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
    #SONG_POS_PTR           = 0xF2; // MIDI 1.0 Detailed Specification 4.2.1 (pg. 27)

    // Getters:
    get timingClock()           { return this.#TIMING_CLOCK;    }
    get start()                 { return this.#START;           }
    get continue()              { return this.#CONTINUE;        }
    get stop()                  { return this.#STOP;            }
    get activeSensing()         { return this.#ACTIVE_SENSING;  }
    get systemReset()           { return this.#SYSTEM_RESET;    }
    get songPositionPointer()   { return this.#SONG_POS_PTR;    }

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

    // calculate the song position pointer as per
    // MIDI 1.0 Detailed Specification 4.2.1 (pg. 27)
    calcPosition(sppValue, beatsPerMeas, ticksPerBeat){

    }

}

class Settings{
    constructor() {
        // the file directory will be stored in a dir in the home folder
        // the folder is named the same as the base name
        this.#fileDirectory = `${homeDirectory}/${this.#baseName}`;
        this.#filePath = `${this.#fileDirectory}/settings.json`;

        // setup the settings file location or load file; return file status
        return this.initFile();
    }

    // Fields:
    #defaultValues = {
        usingInternalClock: true, // use the internal clock to drive external midi
    }
    #baseName = "!tpts"; // this name will determine the settings file location and midi device names
    #fileDirectory; // the home directory
    #filePath; // the home directory + base name + file name
    #prototype = { // used to validate that the data from the loaded file is correct
        usingInternalClock: (val) => { return _.isBoolean(val)},
    }


    // Setters:
    set #memory(memoryContents){
        nconf.stores.file.store = memoryContents;
    }
    set usingInternalClock(bool){
        // change the string to boolean value
        bool = this.#toBool(bool);
        nconf.set('usingInternalClock', bool);//?
        this.save();//?
    }

    // Getters:
    get #memory(){
        return nconf.stores.file.store;
    }

    get baseName(){
        return this.#baseName;
    }

    get usingInternalClock(){
        return nconf.get('usingInternalClock');
    }

    // Methods:
    #toBool(bool){
        if(bool === 'true') bool = true;
        if(bool === 'false') bool = false;
        return bool;
    }

    initFile(){
        // load the file and check for data
        const fileLoadMessage = this.load();

        // if nothing exists in loaded file, we will load defaults
        if(fileLoadMessage === "emptyObject"){
            // load the default values into the file then save
            this.#memory = this.#defaultValues;
            this.save();

            return "fileInitialized";
        }
        // whether the file contains errors or loaded properly, return message
        return fileLoadMessage;//?
    }

    load(filePath = this.#filePath){
        nconf.file(filePath);
        nconf.load();
        const fileExists = !(_.isEmpty(nconf.stores.file.store));

        // if the file exists, check the loaded data against the prototype
        if(fileExists){
            // check the file for proper fields keys
            let hasProperFields = _.isEqual(
                // get the sorted keys from the prototype and file
                _.keys(this.#prototype).sort(),
                _.keys(this.#memory).sort()
            );

            // if the the file and the prototype don't match, return message
            if(!hasProperFields) return "fieldsNotMatching";

            // check for the proper data types; if not return message
            let hasMatchingDataTypes = _.conformsTo(this.#memory, this.#prototype);
            if(!hasMatchingDataTypes) return "dataTypeMismatch";
        } else {
            return "emptyObject"
        }

        return "fileLoaded";
    }

    save(){
        // check if file exists
        let fileExists = fileSystem.existsSync(this.#filePath);
        if(fileExists) {
            // delete the file (to be replaced)
            try {
                fileSystem.rmSync(this.#filePath);
            } catch (err){
                console.error(err);
            }
        } else {
            // make the directory for file to be saved
            try {
                fileSystem.mkdirSync(this.#fileDirectory);
            } catch(err){
                console.error(err);
            }
        }

        // save the file
        nconf.save(function(err){
            if(err){
                console.error(err.message);//?
                return false;
            }
            return true;//?
        });
    }
}

class Note{
    // Fields:
    midiNumber;
    velocity = 127;
    noteValue;
    duration;

}

class Melody{
    // Fields:
    notes = []; // an array of class Notes
    userName; // the user name who submitted the melody

    // Setters:
    set notes(note){
        this.notes.push(note);
    }
}

module.exports = {
    Transport: Transport,
    MidiMessages: MidiMessages,
    Settings: Settings,
    Note: Note,
    Melody: Melody,
};