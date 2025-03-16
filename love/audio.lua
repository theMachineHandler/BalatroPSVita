AudioFilePriority = {}

function love.audio.newSource(filename, type)
    -- will open an audio file using LPPVita
    Logger.logfile("audio.newSource - file path: " .. GAME_PATH .. filename)
    local sound_source = Source:new({}, filename, 0)
    Logger.logfile("audio.newSource - type: " .. type)
    --Logger.logfile("audio.newSource - sound_id (LPPVita): " .. tostring(snd))
    --Logger.logfile("audio.newSource - sound source: " .. Logger.tprint(snd_source))
    Logger.logfile("audio.newSource - \nAudioFilePriority:" .. Logger.tprint(AudioFilePriority))
    Logger.logfile("audio.newSource - wip - passed")

    return sound_source
end

function love.audio.play(sound)
    -- implement
end 