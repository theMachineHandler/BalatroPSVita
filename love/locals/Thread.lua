--[[
    Does this even need to exist?
]]--

local Object = require("locals/Object")

local ThreadMetatable = Object:inherit("Thread")

-- just testing
function ThreadMetatable:init(name)
    self.thread_name = name or "undefined"
    Logger.logfile("Thread:init - fake - passed")
end

function ThreadMetatable:start(arg1, arg2, ...)
    Logger.func_info("Thread:start")
    Logger.logfile("Thread:start - arg1: " .. tostring(arg1) .. 
    "; arg2: " .. tostring(arg2) ..
    "; other args: check for more if two args exists")
    Logger.logfile("Thread:start - fake - passed")
end

local Thread = setmetatable({}, ThreadMetatable)

Logger.logfile("love local - Thread module loaded - wip")

return Thread