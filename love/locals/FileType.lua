--[[
    This needs rework
]]--

local Object = require("locals/Object")

local FileType = Object:inherit("FileType")

FileType.file = "file"
FileType.directory = "directory"
FileType.symlink = "symlink"
FileType.other = "other"

Logger.logfile("love local - FileType module called - wip")

return FileType