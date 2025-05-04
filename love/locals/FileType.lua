--[[
    This needs rework
]]--

local Object = require("locals/Object")

local FileTypeMetatable = Object:inherit("FileType")

FileTypeMetatable.file = "file"
FileTypeMetatable.directory = "directory"
FileTypeMetatable.symlink = "symlink"
FileTypeMetatable.other = "other"

local FileType = setmetatable({}, FileTypeMetatable)

Logger.logfile("love local - FileType module called - wip")

return FileType