--[[
    This needs cleaning
    Needs more work
]]--

local Texture = require("locals/Texture")

local Image = Texture:inherit("Image")

-- Added filepath to manage memory 
-- I will try to come up with a solution for on-demand loading
function Image:init(x, y, mipmap, linear, scale, filepath)
    self.width_x = x
    self.height_y = y
    self.mipmap = mipmap
    self.linear = linear
    self.scale = scale
    self.filepath = filepath
    --self.image = Graphics.loadImage(filepath)
    Logger.logfile("Image:new - wip - passed")
end

function Image:getDimensions()
    Logger.logfile("Image:getDimensions - passed")
    return self.width_x, self.height_y
end

Logger.logfile("love local - Image module called - wip")

return Image