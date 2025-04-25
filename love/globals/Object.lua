Object = {
    name = "Object"
}

function Object:new(name, object)
    object = object or {}
    setmetatable(object, {__index = self})
    if object then
        object.name = name or "Undefined"
    end
    return object
end

function Object:typeOf(type)
    local current_type = self
    while current_type do
        if current_type.name == type then
            return true
        end
        local current_metatable = getmetatable(current_type)
        current_type = current_metatable and current_metatable.__index or nil
    end
    return false
end
