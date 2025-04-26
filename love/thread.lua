
    --thread
function love.thread.getChannel(name)
    Logger.func_info("thread.getChannel")
    Logger.logfile("thread.getChannel - name: " .. name )
    local fake_channel = Channel.new({})
    Logger.logfile("thread.getChannel - fake - passed")
    return fake_channel
end

function love.thread.newThread(filepath)
    Logger.func_info("thread.newThread")
    Logger.logfile("thread.newThread - filepath: " .. filepath)
    local fake_thread = Thread:new()
    Logger.logfile("thread.newThread - fake - passed")
    return fake_thread
end

Logger.logfile("love thread module loaded")