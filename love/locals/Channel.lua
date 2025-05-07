--[[
    This needs cleaning and work
]]--

local Object = require("locals/Object")

local Channel = Object:inherit("Channel")

function Channel:init()
    self.message = {}
    Logger.logfile("Channel:new - wip - passed")
end

function Channel:demand()
    Logger.func_info("Channel:demand")
    local message = self.message[#self.message]
    table.remove(self.message, -1)
    if type(message) == "table" then
        Logger.logfile("Channel:demand - demanding - " .. Logger.tprint(message))
    elseif type(message) == "string" then
        Logger.logfile("Channel:demand - demanding - " .. message)
    else
        Logger.logfile("Channel:demand - demanding - " .. tostring(message))
    end
    Logger.logfile("Channel:demand - wip - passed")
    return message
end

function Channel:pop()
    Logger.func_info("Channel:pop")
    local message = self.message[#self.message]
    table.remove(self.message, -1)
    if type(message) == "table" then 
        Logger.logfile("Channel:pop - popping - " .. Logger.tprint(message))
    elseif type(message) == "string" then
        Logger.logfile("Channel:pop - popping - " .. message)
    else
        Logger.logfile("Channel:pop - popping - " .. tostring(message))
    end
    --Logger.logfile("Current channel messages: " .. Logger.tprint(self.message))
    Logger.logfile("Channel:pop - wip - passed")
    return message
end

function Channel:push(message)
    Logger.func_info("Channel:push")
    table.insert(self.message, message)
    if type(message) == "table" then
        Logger.logfile("Channel:push - pushing - " .. Logger.tprint(message))
    elseif type(message) == "string" then
        Logger.logfile("Channel:push - pushing - " .. message)
    else
        Logger.logfile("Channel:push - pushing - " .. tostring(message))
    end
    --Logger.logfile("Current channel messages: " .. Logger.tprint(self.message))
    Logger.logfile("Channel:push - wip - passed")
end

Logger.logfile("love local - Channel module called - wip")

return Channel