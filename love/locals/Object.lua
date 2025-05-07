--[[ 
    Not exposing Object (or any table derived from it) to Global 
    is the correct path to avoid external changes and unexpected behavior.
    Also avoid polluting the Global namespace.
]]--

local Object = {}

Object.__type = "Object"

function Object:init(...) end

function Object:inherit(type_string)
    local subclass = {}
    subclass.__type = type_string or "Undefined"
    setmetatable(subclass, {__index = self})
    return subclass
end

function Object:instantiate(...)
    local instance = {}
    setmetatable(instance, {__index = self})
    instance:init(...)
    return instance
end

return Object