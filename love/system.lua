--system
function love.system.getOS()
    Logger.func_info("system.getOS")
    Logger.logfile("system.getOS - passed")
    return "PSVita"
end

Logger.logfile("love system module loaded")