local Drawable = require("locals/Drawable")

local TextureMetatable = Drawable:inherit("Texture")

local Texture = setmetatable({}, TextureMetatable)

Logger.logfile("love local - Texture module called - wip")

return Texture