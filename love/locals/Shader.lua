--[[
    Needs more work
]]--
Shader = Object:new("Shader")

function Shader:new()
    Logger.logfile("Shader:new - fake - passed")
    return self
end

function Shader:send(name, number, ...)
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

function Shader:sendColor(color, rgba_table, ...)
    Logger.logfile("Shader:sendColor - Color: " .. color .. "; rgba: " .. tprint(rgba_table))
    if ... ~= nil then
        Logger.logfile("Shader:sendColor - Additional colors: " .. Logger.print_all(...))
    end
    Logger.logfile("Shader:sendColor - fake - passed")
end

Logger.logfile("love class - Shader module loaded")
