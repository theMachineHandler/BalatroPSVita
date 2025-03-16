-- Sound source in love2d
-- -- I will need to do a custom implementation that
-- -- allow me to load and unload sounds as needed...
-- -- Maybe there is a way to predict what sounds to 
-- -- load as priority.
-- --
-- -- 

Source = {}

function Source:new(filename, priority)
    Logger.func_info("Source:new")
    local self = setmetatable({}, {__index = Source})
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

