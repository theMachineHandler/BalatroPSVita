--[[
    This needs cleaning
    Needs more work
]]--

local Object = require("locals/Object")

local SourceMetatable = Object:inherit("Source")

function SourceMetatable:init(filename, priority, volume)
    Logger.func_info("Source:init")
    self.filename = filename
    self.priority = priority
    self.volume = volume or 10
end

function SourceMetatable:isPlaying()
    -- should check if it is playing
end

function SourceMetatable:release()
end

function SourceMetatable:setVolume(volume)
    self.volume = volume
end

function SourceMetatable:setPitch()
    -- I don't even know how to begin implementing this
end

function SourceMetatable:stop()
    -- should stop the sound
end

local Source = setmetatable({}, SourceMetatable)

Logger.logfile("love local - Source module loaded - wip")

return Source