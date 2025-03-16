--Image global class
Image = {}

-- Generates new image object
-- Added filepath to manage memory by loading on 
-- demand instead of everything at once during initialization
function Image:new(x, y, mipmap, linear, scale, filepath)
    local self = {}
    setmetatable(self, { __index = Image })
    self.width_x = x
    self.height_y = y
    self.mipmap = mipmap
    self.linear = linear
    self.scale = scale
    self.filepath = filepath
    --self.image = Graphics.loadImage(filepath)
    Logger.logfile("Image:new - passed")
    return self
end

function Image:getDimensions()
    Logger.logfile("Image:getDimensions - passed")
    return self.width_x, self.height_y
end

Logger.logfile("love class - Image module loaded")