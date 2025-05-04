--[[ 
    Not exposing Object (or any table derived from it) to Global 
    is the correct path to avoid external changes and unexpected behavior.
    Also avoid polluting the Global namespace.
]]--

-- Creating a metatable as template for Lua to fallback to
local ObjectMetatable = {}
ObjectMetatable.__index = ObjectMetatable
ObjectMetatable.__type = "Object"


-- An "class inherit" implementation.
function ObjectMetatable:inherit(type_string)
    local subclass = {}
    setmetatable(subclass, self)
    subclass.__index = subclass
    subclass.__type = type_string or "Undefined"
    return subclass
end
-- __call metamethod for Lua to acknowledge
-- this table as callable, giving OOP behavior to it.
function ObjectMetatable:__call(...)
    local instance = {}
    setmetatable(instance, self)
    instance.__type = self.__type
    if instance.init then instance:init(...) end
    return instance
end

-- Checks type_string (a string :d) against the
-- custom metamethod __type
function ObjectMetatable:typeOf(type_string)
    local current_type = self
    while current_type do
        if current_type.__type == type_string then
            return true
        end
        local current_metatable = getmetatable(current_type)
        current_type = current_metatable and current_metatable.__index or nil
    end
    return false
end

-- Exposing ObjectMetatable to an empty Object table
local Object = setmetatable({}, ObjectMetatable)

Logger.logfile("love local - Object module called - wip")

return Object