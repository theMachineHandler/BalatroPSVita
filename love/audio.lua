local AudioFilePriority = {}

function love.audio.newSource(filename, type)
    local Source = require("locals/Source")
    -- will open an audio file using LPPVita
    Logger.logfile("audio.newSource - file path: " .. GAME_PATH .. filename)
    local sound_source = Source(filename, 0)
    Logger.logfile("audio.newSource - type: " .. type .. " - not being used when called")
    --Logger.logfile("audio.newSource - sound_id (LPPVita): " .. tostring(snd))
    --Logger.logfile("audio.newSource - sound source: " .. Logger.tprint(snd_source))
    Logger.logfile("audio.newSource - \nAudioFilePriority: " .. Logger.tprint(AudioFilePriority) .. " - not being used right now")
    Logger.logfile("audio.newSource - wip - fake - passed")

    return sound_source
end

function love.audio.play(sound)
    -- implement - if needed
end