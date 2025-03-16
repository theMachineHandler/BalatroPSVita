require("customs/c_loop_sndmngr")

local sndmngr_path = GAME_PATH .. "engine/sound_manager.lua"

local sndmngr_handle = System.openFile(sndmngr_path, FREAD)
local sndmngr_size = System.sizeFile(sndmngr_handle)
local sndmngr_string = System.readFile(sndmngr_handle, sndmngr_size)
System.closeFile(sndmngr_handle)

local loop_start = sndmngr_string:find("while true do")
if not loop_start then
    Debug.func_info("overrides.lua module")
    Debug.logfile("overrides.lua - Couldn't find 'while true do'")
end
local sndmngr_loop = sndmngr_string:sub(loop_start)
-- loop_start - 5 to solve a bug where it 
-- takes the 'w' and empty space from the while loop
sndmngr_string = sndmngr_string:sub(1, loop_start - 5)

--sndmngr_loop = LoopHeader .. sndmngr_loop
sndmngr_loop = sndmngr_loop:sub(1, #sndmngr_loop - 4)
sndmngr_loop = sndmngr_loop .. LoopFooter

Logger.logfile("sndmngr_string =\n" .. sndmngr_string)
Logger.logfile("sndmngr_loop =\n" .. sndmngr_loop)

-- TODO: Logic is not correct, need to rethink it
load(sndmngr_string, "sndmngr", "t")
load(sndmngr_loop, "sndmngr_loop", "t")

-- "Unload" globals and locals after usage
-- In theory, at least...
package.loaded["customs/c_loop_sndmngr"] = nil
_G["LoopHeader"] = nil
_G["LoopFooter"] = nil
sndmngr_loop = nil
sndmngr_string = nil
