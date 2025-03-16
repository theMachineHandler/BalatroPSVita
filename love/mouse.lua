function love.mouse.getPosition()
    Logger.func_info("mouse.getPosition")
    Logger.logfile("mouse.getPosition - passed")
    return Controls.readLeftAnalog()
end

Logger.logfile("love mouse module loaded")