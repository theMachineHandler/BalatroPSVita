--[[
    This needs to be implemented
]]--

local Object = require("locals/Object")

local JoystickMetatable = Object:inherit("Joystick")

function JoystickMetatable:init(id)
    self.id = id
    Logger.logfile("Joystick:new - fake - passed")
end

function JoystickMetatable:getAxes()
    Logger.logfile("Joystick:getAxes - fake - passed")
end

function JoystickMetatable:getAxis()
    Logger.logfile("Joystick:getAxis - fake - passed")
end

function JoystickMetatable:getAxisCount()
    Logger.logfile("Joystick:getAxisCount - fake - passed")
end

function JoystickMetatable:getButtonCount()
    Logger.logfile("Joystick:getButtonCount - fake - passed")
end

function JoystickMetatable:getDeviceInfo()
    Logger.logfile("Joystick:getDeviceInfo - fake - passed")
end

function JoystickMetatable:getGUID()
    Logger.logfile("Joystick:getGUID - fake - passed")
end

function JoystickMetatable:getGamepadAxis()
    Logger.logfile("Joystick:getGamepadAxis - fake - passed")
end

function JoystickMetatable:getGamepadMapping()
    Logger.logfile("Joystick:getGamepadMapping - fake - passed")
end

function JoystickMetatable:getGamepadMappingString()
    Logger.logfile("Joystick:getGamepadMappingString - fake - passed")
end

function JoystickMetatable:getHat()
    Logger.logfile("Joystick:getHat - fake - passed")
end

function JoystickMetatable:getHatCount()
    Logger.logfile("Joystick:getHatCount - fake - passed")
end

function JoystickMetatable:getID()
    Logger.logfile("Joystick:getID - passed")
    return self.id
end

function JoystickMetatable:getName()
    Logger.logfile("Joystick:getName - fake - passed")
end


function JoystickMetatable:getVibration()
    Logger.logfile("Joystick:getVibration - fake - passed")
end

function JoystickMetatable:isConnected()
    Logger.logfile("Joystick:isConnected - fake - passed")
end

function JoystickMetatable:isGamepad()
    Logger.logfile("Joystick:isGamepad - fake - passed")
end

function JoystickMetatable:isGamepadDown()
    Logger.logfile("Joystick:isGamepadDown- fake - passed")
end

function JoystickMetatable:isVibrationSupported()
    Logger.logfile("Joystick:isVibrationSupported - fake - passed")
end

function JoystickMetatable:setVibration()
    Logger.logfile("Joystick:setVibration - fake - passed")
end

local Joystick = setmetatable({}, JoystickMetatable)

Logger.logfile("love local - Joystick module called - wip")

return Joystick