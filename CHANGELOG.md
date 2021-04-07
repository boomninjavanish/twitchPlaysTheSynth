# !tpts Change Log

## v0.1 (pre-release) (2021-2-21)
- This is the first release of the twitch plays the synth Max for Live Devices. Each devices is self contained and doesn't require any external files.
- Connected !f, !r, !s, and !y to mappers
- Added new aux functions (as mario characters) [resolves #4 and #8]
- Added bypass button to the melody sequencer which when pressed, bypasses the chat's melody and parameters and replaces with Ableton's MIDI and automation [resolves #17]

## v0.2 (pre-release) (2021-2-22)
- Added a settings tab to tpts.main Max for Live device.
- Twitch API credentials are no longer hard-coded; users enter the credentials into the settings tab on tpts.main.amxd live device [resolves #19]

## v0.3 (pre-release) (2021-2-24)
- Project reorganized to take advantage of Max projects for better packaging of dependencies.
- Resolves #21 and #23

## v0.4 (pre-release) (2021-3-4)
- tpts.main device is now a standalone app.
- tpts.melodySequencer is now separate from the mapper controls
- Mapper controls are now in tpts.paramamapper Max for Live device
- Error messages to users are now sent via a whisper (direct message) rather than to the entire chat.
- Sequencer and mapper are now separate Max for Live devices (tpts.melodySequencer and tpts.paramamapper). [Resolves #9, #27, and #26.]
- tpts.paramamapper now has dynamic mapper names.
- Fixed crashing when tmi.js reports errors via client.say or client.whisper. [Resolves #24]
- Removed !t and !c commands; they will now be controlled via the paramamapper Ableton Live device
- Cleaned up Node.js modules; was pulling npm dependencies for "tmi" (Too Many Images) rather than just the "tmi.js" (Twitch Messaging Interface).
- Found that node version on dev machine should be 12 to match what is shipped with Max; this also means that tmi.js should be 1.5 as this combination was found to work well together; versions of tmi.js > 1.5 were found to be buggy with node 12.

## v0.5 (pre-release) (2021-3-10)
- changed syntax for melody sequencers to !m\<seq\#\> \<interval\>\[\<beats\>\] (example; move melody for sequencer two down a major 2nd for two measures: **!m2 0\[4\] -2\[4\]**) (resolves #16)
- entering a melody without a sequencer number now defaults to sequencer 1
- fixed sequencer number display in tpts.melodySequencer; fonts now match the other devices/app
- resolved #33
- Unresolved bugs: 
    - crash when a decimal value is entered without a number in the whole number digit (for example: .25 instead of 0.25)
- To do:
    - make twoParams function use the same syntax as melody seq
    - #30
    - #31
    - #35

## v0.6 (pre-release) (2021-3-11)
- made the paramamapper commands have the same syntax as melody commands (resolves #35)

## v0.6.1 (pre-release) (2021-3-11)
- the wrong version of the app was released; repackaged correct version

## v0.6.2 (pre-release) (2021-3-15)
- fixed problem in paramamapper that was causing the regex object to spam the console with several `regexp: doesn't understand "bang"` error messages upon loading
- removed syntax error reporting via direct message; commented out client.say() function call in twitchPlaysSynth.js; resolves #41
- fixed bug: parameter names now can have hyphens; resolves #45
- fixed bug: the sequencers are now reassigned when the connect button is pressed in tpts.main; resolves #43
- users can enter a value without a beat number and mapper will immediately go to that value; resolves #31

## v0.7 (pre-release) (2021-3-16)
- cleaned up and made code more java-script friendly
- added error catching to client.whisper() to prevent crashing and burning; resolves #50
- added auto-restart function in settings page: setting that restarts the node script automatically within five seconds when the script hard crashes or user accidentally presses disconnect; resolves #47

## v1.0 (2021-3-22)
- [feature] parentheses may now be used instead of or in addition to brackets; resolves #53
- [feature] midi note numbers are now kept in a sane range; resolves #51; 
    the following options were added to the settings tab in tpts.main:
    - min midi number
    - max midi number
    - midi trim type
        - "wrap" wraps any number out of range back into the range (default)
        - "wall" has has the value quantize to the nearest edge of the range (like it is hitting a wall that contains the midi notes)
        - more algorithms may be added in the future as needed
- [bug] range is now 0-100 for paramamapper parameters; resolves #55
- [enhancement] change some wording and formatting in the settings page in tpts.main 

## v1.1 (2021-3-30)
- [feature] paramamapper commands may now be restricted to the following access levels. Users in upper levels may access may access mappers below their level while users in lower levels may only use mappers for their level and below; resolves #59; resolves #7
    - "bcaster": the broadcaster
    - "mod": moderators
    - "sub": subscribers
    - "public": everyone else
- [bug] note plays for proper durations in melody sequencer (note off occurs 10 ms before next note)
- [bug] melody sequencers now have a limit of how small a note beat duration may be; if beat is less that 0.1 it is set to 0.1; resolves #49
- [bug] tmi.js now reconnects when the connection times out; solves the problem of script stalling when the connection is lost for a long period of time (node.js: stdout [12:42] error: Ping timeout)
- [enhancement] updated tmi.js from v1.5.0 to v1.7.3
- [housekeeping] javascript has been consolidated to a single file; was having trouble with importing a class into the main file

## v1.2 (2021-4-7)
- [feature] user can now submit melodies compressed using LZ-UTF8 encoded as a "StorageBinaryString". (see: https://github.com/rotemdan/lzutf8.js):
    - all the characters to the right of "!m" should be compressed using the above encoding algorithm
    - before submitting, all compressed characters should be preceded by the identifier (sans quotes): "!%"
    - also, the total sum of the characters being submitted must be less than or equal to ( <= ) 500 as this is the Twitch chat character limit
- [feature]* mappers may now have named values assigned to them:
    - syntax: each entry of names or values must be separated by periods ('.'); no spaces are allowed; examples:
        - names: a.b.c.d 
        - values: 1.2.3.4
    - when the names are entered, values are generated automatically; after which new values may be substituted with a number of values equal to the number of names entered; see the syntax above for example
    - resolves #57; resolves #60
- [bug] users that had badges but were not subscribers, mods, or the broadcaster would be denied public access to mappers; resolves #68


*[bug/knownissue] the top value names fields in the GUI does not send information to the main app; this will be fixed in v1.2.1