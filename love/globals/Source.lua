--[[
    This needs cleaning
    Needs more work
]]--

Source = Object:new("Source")

function Source:new(filename, priority)
    Logger.func_info("Source:new")
    self = Object:new(self.name, self)
    self.filename = filename
    self.priority = priority
    return self
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

