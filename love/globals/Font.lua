-- Font global class

LoveFont = {}

-- Creates a pseudofont object that is used to load fonts when called
function LoveFont:new(filepath, size)
    local self = {}
    setmetatable(self, { __index = Font })
    self.filepath = filepath
    self.size = size
    return self
end