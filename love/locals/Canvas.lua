local Texture = require("locals/Texture")

local CanvasMetatable = Texture:inherit("Canvas")

function CanvasMetatable:new(width, height, settings, filepath)
    self.width = width
    self.height = height
    self.type = settings.type
    self.readable = settings.readable
    self.filter = {
        filter_one = "linear",
        filter_two = "linear"
    }
    self.filepath = filepath
    Logger.logfile("Canvas:new - wip - passed")
    return self
end

function CanvasMetatable:getPixelHeight()
    Logger.logfile("Canvas:getPixelHeight - wip - passed")
    return self.height
end

function CanvasMetatable:getPixelWidth()
    Logger.logfile("Canvas:getPixelWidth - wip - passed")
    return self.width
end

function CanvasMetatable:setFilter(filter_one, filter_two)
    self.filter.filter_one = filter_one
    self.filter.filter_two = filter_two
    Logger.logfile("Canvas:setFilter - wip - passed")
end

local Canvas = setmetatable({}, CanvasMetatable)

Logger.logfile("love local - Canvas module called - wip")

return Canvas