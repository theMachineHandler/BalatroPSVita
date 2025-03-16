
function love.joystick.getJoysticks()
    Logger.func_info("joystick.getJoysticks")
    local ctrl = Controls.getDeviceInfo()

    Logger.logfile(Logger.tprint(ctrl))

    Logger.logfile("joystick.getJoysticks - passed")

    return ctrl
end

function love.joystick.loadGamepadMappings(mappings)
    Logger.func_info("joystick.loadGamepadMappings")
    Logger.logfile("joystick.loadGamepadMappings - fake - passed")
end

Logger.logfile("love joystick module loaded")