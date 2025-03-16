--window
function love.window.getMode()
    Logger.func_info("window.getMode")
    local flags = {
        fullscreen     = true,
        fullscreentype = nil,
        vsync          = false,
        msaa           = 0,
        resizable      = false,
        borderless     = false,
        centered       = false,
        display        = 1,
        minwidth       = VITA.ScreenWidth,
        minheight      = VITA.ScreenHeight,
        highdpi        = false,
        refreshrate    = VITA.ScreenRefreshRate,
        x              = 0,
        y              = 0

    }

    Logger.logfile("window.getMode - passed")

    return VITA.ScreenWidth, VITA.ScreenHeight, flags

end

function love.window.updateMode(width, height, settings)
    Logger.func_info("window.updateMode")
    Logger.logfile("window.updateMode - fake - passed")
    return true
end

Logger.logfile("love window module loaded")