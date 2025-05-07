--[[
    This needs more work
]]--

local Object = require("locals/Object")

local Font = Object:inherit("Font")

function Font:init(filepath, size)
    Logger.logfile("FontMetatable:init - filepath: " .. filepath)
    Logger.logfile_raw("; size: " .. tostring(size))
    Logger.logfile_raw("\n")

    self.filepath = filepath
    self.size = size
    Logger.logfile("FontMetatable:init - Font: " .. Logger.tprint(self))
end

Logger.logfile("love local - Font module called - wip")

return Font