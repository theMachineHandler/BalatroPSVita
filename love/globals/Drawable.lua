Drawable = Object:new("Drawable")

function Drawable:new(name)
    local drawable = Object:new(name)
    setmetatable(drawable, {__index = self})
    return drawable
end
