--[[
    This needs to be implemented
]]--

local Object = require("locals/Object")

local Joystick = Object:inherit("Joystick")

function Joystick:init(id)
    self.id = id
    Logger.logfile("Joystick:new - fake - passed")
end

function Joystick:getAxes()
    Logger.logfile("Joystick:getAxes - fake - passed")
end

function Joystick:getAxis()
    Logger.logfile("Joystick:getAxis - fake - passed")
end

function Joystick:getAxisCount()
    Logger.logfile("Joystick:getAxisCount - fake - passed")
end

function Joystick:getButtonCount()
    Logger.logfile("Joystick:getButtonCount - fake - passed")
end

function Joystick:getDeviceInfo()
    Logger.logfile("Joystick:getDeviceInfo - fake - passed")
end

function Joystick:getGUID()
    Logger.logfile("Joystick:getGUID - fake - passed")
end

function Joystick:getGamepadAxis()
    Logger.logfile("Joystick:getGamepadAxis - fake - passed")
end

function Joystick:getGamepadMapping()
    Logger.logfile("Joystick:getGamepadMapping - fake - passed")
end

function Joystick:getGamepadMappingString()
    Logger.logfile("Joystick:getGamepadMappingString - fake - passed")
end

function Joystick:getHat()
    Logger.logfile("Joystick:getHat - fake - passed")
end

function Joystick:getHatCount()
    Logger.logfile("Joystick:getHatCount - fake - passed")
end

function Joystick:getID()
    Logger.logfile("Joystick:getID - passed")
    return self.id
end

function Joystick:getName()
    Logger.logfile("Joystick:getName - fake - passed")
end


function Joystick:getVibration()
    Logger.logfile("Joystick:getVibration - fake - passed")
end

function Joystick:isConnected()
    Logger.logfile("Joystick:isConnected - fake - passed")
end

function Joystick:isGamepad()
    Logger.logfile("Joystick:isGamepad - fake - passed")
end

function Joystick:isGamepadDown()
    Logger.logfile("Joystick:isGamepadDown- fake - passed")
end

function Joystick:isVibrationSupported()
    Logger.logfile("Joystick:isVibrationSupported - fake - passed")
end

function Joystick:setVibration()
    Logger.logfile("Joystick:setVibration - fake - passed")
end

Logger.logfile("love local - Joystick module called - wip")

return Joystick