--[[
    This needs cleaning
    Needs more work
]]--

local Texture = require("locals/Texture")

local ImageMetatable = Texture:inherit("Image")

-- Added filepath to manage memory 
-- I will try to come up with a solution for on-demand loading
function ImageMetatable:init(x, y, mipmap, linear, scale, filepath)
    self.width_x = x
    self.height_y = y
    self.mipmap = mipmap
    self.linear = linear
    self.scale = scale
    self.filepath = filepath
    --self.image = Graphics.loadImage(filepath)
    Logger.logfile("Image:new - wip - passed")
end

function ImageMetatable:getDimensions()
    Logger.logfile("Image:getDimensions - passed")
    return self.width_x, self.height_y
end

local Image = setmetatable({}, ImageMetatable)

Logger.logfile("love local - Image module called - wip")

return Image