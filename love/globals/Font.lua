--[[
    Font needs to be called LoveFont so it won't override lpp-vita Font global
    Needs more work
]]--

LoveFont = Object:new("Font")

function LoveFont:new(filepath, size)
    self = Object:new(self.name, self)
    self.filepath = filepath
    self.size = size
    return self
end
