--[[
    Does this even need to exist?
]]--

Thread = Object:new("Thread")

-- just testing
function Thread:new(name)
    self = Object:new(self.name, self)
    self.name = name
    Logger.logfile("Thread:new - fake - passed")
    return self
end


function Thread:start(arg1, arg2, ...)
    Logger.func_info("Thread:start")
    Logger.logfile("Thread:start - arg1: " .. tostring(arg1) .. 
    "; arg2: " .. tostring(arg2) ..
    "; other args: check for more if two args exists")
    Logger.logfile("Thread:start - fake - passed")
end

Logger.logfile("love class - Thread module loaded")
