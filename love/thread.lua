
    --thread
function love.thread.getChannel(name)
    local Channel = require("locals/Channel")
    Logger.func_info("thread.getChannel")
    Logger.logfile("thread.getChannel - name: " .. name )
    local fake_channel = Channel:instantiate()
    Logger.logfile("thread.getChannel - fake - passed")
    return fake_channel
end

function love.thread.newThread(filepath)
    local Thread = require("locals/Thread")
    Logger.func_info("thread.newThread")
    Logger.logfile("thread.newThread - filepath: " .. filepath)
    local fake_thread = Thread:instantiate()
    Logger.logfile("thread.newThread - fake - passed")
    return fake_thread
end

Logger.logfile("love thread module loaded")