love = {
    audio      = {},
    filesystem = {},
    graphics   = {},
    joystick   = {},
    mouse      = {},
    sound      = {},
    system     = {},
    timer      = {},
    thread     = {},
    window     = {}
}

-- game's love.conf
require("conf")

-- globals used by love
require("globals/love_g_graphics")

-- love custom functions:
require("audio")
require("filesystem")
require("graphics")
require("joystick")
require("mouse")
require("sound")
require("system")
require("timer")
require("thread")
require("window")

Logger.logfile("love module loaded")