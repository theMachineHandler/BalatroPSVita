--[[
    Needs more work
]]--

local Object = require("locals/Object")

local Quad = Object:inherit("Quad")

function Quad:init(x, y, width, height, sw, sh)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.sw = sw
    self.sh = sh
    Logger.logfile("Quad:init - passed")
end

Logger.logfile("love local - Quad module called - wip")

return Quad