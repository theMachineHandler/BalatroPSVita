--Quad global class
Quad = {}

function Quad:new(x, y, width, height, sw, sh)
    local self = {}
    setmetatable(self, { __index = Quad })
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.sw = sw
    self.sh = sh
    Logger.logfile("Quad:new - passed")
    return self
end

Logger.logfile("love class - Quad module loaded")