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

function Object:typeOf()
    return self.name
end
