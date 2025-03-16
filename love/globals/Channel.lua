--Channel class globals
Channel = {}

function Channel:new()
    local channel = setmetatable({}, { __index = Channel })
    channel.message = {}
    Logger.logfile("Channel:new - wip - passed")
    return channel
end

function Channel:demand()
    Logger.func_info("Channel:demand")
    -- Testing a possible solution to specific cases that deal with 
    -- threads in love2D (Balatro only)
    -- local info = debug.getinfo(2, "S")

    -- TODO: rework this condition statement (probably won't be needed)
    --if info.source == "sound_manager.lua" then    
    --end

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

Logger.logfile("love class - Channel module loaded")