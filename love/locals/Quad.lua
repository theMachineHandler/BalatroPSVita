--[[
    Needs more work
]]--

local Object = require("locals/Object")

local QuadMetatable = Object:inherit("Quad")

function QuadMetatable:init(x, y, width, height, sw, sh)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.sw = sw
    self.sh = sh
    Logger.logfile("Quad:init - passed")
end

local Quad = setmetatable({}, QuadMetatable)

Logger.logfile("love local - Quad module called - wip")

return Quad