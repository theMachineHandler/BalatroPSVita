--Thread object globals
Thread = {}

-- just testing
function Thread:new(name)
    local thread = setmetatable({}, { __index = Thread })
    thread.name = name
    table.insert(Thread, thread) -- Probably don´t need this...
    Logger.logfile("Thread:new - fake - passed")
    return thread
end


function Thread:start(arg1, arg2, ...)
    Logger.func_info("Thread:start")
    Logger.logfile("Thread:start - arg1: " .. tostring(arg1) .. 
    "; arg2: " .. tostring(arg2) ..
    "; other args: check for more if two args exists")
    Logger.logfile("Thread:start - fake - passed")
end

Logger.logfile("love class - Thread module loaded")