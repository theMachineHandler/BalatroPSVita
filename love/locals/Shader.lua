--[[
    Needs more work
]]--

local Object = require("locals/Object")

local ShaderMetatable = Object:inherit("Shader")

function ShaderMetatable:init()
    Logger.logfile("Shader:init - fake - passed")
end

function ShaderMetatable:send(name, number, ...)
    if type(number) ~= "table" then
        if ... == nil then
            Logger.logfile("Shader:send - name: " .. name
            .. "; arg 2: " .. tostring(number)
            .. ";"
            )
        else
            Logger.logfile("Shader:send - name: " .. name
            .. "; arg 2: " .. tostring(number)
            .. "; " .. Logger.print_all(...)
            )
        end
    end
    
    if type(number) == "table" then
        if ... == nil then
            Logger.logfile("Shader:send - name: " .. name
            .. "; arg 2: " .. Logger.tprint(number)
            .. ";")
        else
            Logger.logfile("Shader:send - name: " .. name
            .. "; arg 2: " .. Logger.tprint(number)
            .. "; " .. Logger.print_all(...)
            )
        end
    end

    Logger.logfile("Shader:send - fake - passed")
end

function ShaderMetatable:sendColor(color, rgba_table, ...)
    Logger.logfile("Shader:sendColor - Color: " .. color .. "; rgba: " .. Logger.tprint(rgba_table))
    if ... ~= nil then
        Logger.logfile("Shader:sendColor - Additional colors: " .. Logger.print_all(...))
    end
    Logger.logfile("Shader:sendColor - fake - passed")
end

local Shader = setmetatable({}, ShaderMetatable)

Logger.logfile("love local - Shader module loaded - wip")

return Shader