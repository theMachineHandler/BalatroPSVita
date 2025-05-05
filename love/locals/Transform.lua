local Object = require("locals/Object")

local TransformMetatable = Object:inherit("Transform")

local Transform = setmetatable({}, TransformMetatable)

Logger.logfile("love local - Transform module loaded - wip")

return Transform