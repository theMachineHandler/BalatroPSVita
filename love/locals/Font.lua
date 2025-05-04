--[[
    This needs more work
]]--

local Object = require("locals/Object")

local FontMetatable = Object:inherit("Font")

function FontMetatable:init(filepath, size)
    self.filepath = filepath
    self.size = size
end

local Font = setmetatable({}, FontMetatable)

Logger.logfile("love local - Font module called - wip")

return Font