# !tpts Change Log

## v0.1 (pre-release) (2021-x-x)
- This is the first release of the twitch plays the synth Max for Live Devices. Each devices is self contained and doesn't require any external files.
- Connected !f, !r, !s, and !y to mappers
- Added new aux functions (as mario characters) [resolves #4 and #8]
- Added bypass button to the melody sequencer which when pressed, bypasses the chat's melody and parameters and replaces with Ableton's MIDI and automation [resolves #17]

## v0.2 (pre-release) (2021-x-x)
- Added a settings tab to tpts.main Max for Live device.
- Twitch API credentials are no longer hard-coded; users enter the credentials into the settings tab on tpts.main.amxd live device [resolves #19]

## v0.3 (pre-release) (2021-x-x)
- Project reorganized to take advantage of Max projects for better packaging of dependencies.
- Resolves #21 and #23

## v0.4 (pre-release) (2021-3-x)
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