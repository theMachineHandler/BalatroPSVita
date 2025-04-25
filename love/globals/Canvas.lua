Canvas = Texture:new("Canvas")

function Canvas:new(width, height, settings, filepath)
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

function Canvas:getPixelHeight()
    Logger.logfile("Canvas:getPixelHeight - wip - passed")
    return self.height
end

function Canvas:getPixelWidth()
    Logger.logfile("Canvas:getPixelWidth - wip - passed")
    return self.width
end

function Canvas:setFilter(filter_one, filter_two)
    self.filter.filter_one = filter_one
    self.filter.filter_two = filter_two
    Logger.logfile("Canvas:setFilter - wip - passed")
end

Logger.logfile("love class - Canvas module loaded")
