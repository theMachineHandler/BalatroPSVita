--[[
    This needs cleaning
    Needs more work
]]--

local Object = require("locals/Object")

local Source = Object:inherit("Source")

function Source:init(filename, priority, volume)
    Logger.func_info("Source:init")
    self.filename = filename
    self.priority = priority
    self.volume = volume or 10
end

function Source:isPlaying()
    -- should check if it is playing
end

function Source:release()
end

function Source:setVolume(volume)
    self.volume = volume
end

function Source:setPitch()
    -- I don't even know how to begin implementing this
end

function Source:stop()
    -- should stop the sound
end

Logger.logfile("love local - Source module loaded - wip")

return Source