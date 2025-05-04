-- LPP-Vita globlal tables 
-- (to remember not to override): 
--    Camera, Color, Controls, Database, 
--    Font, Graphics, Gui, Keyboard, 
--    Mic, Network, Registry, Render,
--    Screen, Socket, Sound, System,
--    Timer, Video

require("conf")

require("globals/Object")

require("globals/Drawable")

require("globals/Texture")

require("globals/Canvas")
require("globals/Channel")
require("globals/FileType")
require("globals/Font")
require("globals/Image")
require("globals/Joystick")
require("globals/Quad")
require("globals/Shader")
require("globals/Source")
require("globals/Thread")
require("globals/Transform")

Logger.logfile("love classes module loaded")