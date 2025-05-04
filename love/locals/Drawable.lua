local Object = require("locals/Object")

local DrawableMetatable = Object:inherit("Drawable")

local Drawable = setmetatable({}, DrawableMetatable)

Logger.logfile("love local - Drawable module called - wip")

return Drawable