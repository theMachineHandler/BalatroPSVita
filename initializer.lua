GAME_PATH = "ux0:/data/Balatro/game/"
SAVE_PATH = "ux0:/data/Balatro/"
PROFILE_FILES = {
    settings = "settings.jkr",
    meta = "meta.jkr",
    profile = "profile.jkr"
}

local IS_DEBUGING = false

-- Implement message buffer to show all messages on screen 
-- (with new lines for each, and FIFO to delete older ones 
-- when maximum is reached)
MessageBuffer = {}
MAX_BUFFER_RANGE = 20

package.path = package.path .. GAME_PATH .. "?.lua;"

-- Clear the screen and show a debug message (string).
-- Add wait time in seconds for the message to persist
function DebugMessage(message, wait_time)

    if not IS_DEBUGING then
        return
    end

    table.insert(MessageBuffer, message)

    local print_string = ""

    local buffer_range = #MessageBuffer - MAX_BUFFER_RANGE > 0 or 1

    for k = #MessageBuffer, buffer_range, -1 do
        print_string = MessageBuffer[k] .. "\n" .. print_string
    end

    -- Initialize drawing
    Graphics.initBlend()
    Screen.clear()

    Graphics.debugPrint(5, 10, print_string, Color.new(255,255,255))

    -- Terminate blend and flip the screen to show result
    Graphics.termBlend()
    Screen.flip()

    if wait_time ~= nil then
        System.wait(wait_time * 1000000)
    end

end

DebugMessage("Initializing sound device", 0.85)
Sound.init()

-- Creates files (and folders) used by Balatro
-- \- profile, settings, etc - that are not created by the game itself. 
-- Note to self: can't write anything to app0:/ (read-only during execution)
function CreateGameFiles()
    local prof_dir = "1"

    local files = {
        settings = "settings.jkr",
        meta = "1/meta.jkr",
        profile = "1/profile.jkr"
    }

    if not System.doesDirExist(SAVE_PATH) then
        System.createDirectory(SAVE_PATH)
        DebugMessage("CreateGameFiles - directory Balatro created", 0.85)
    end

    if not System.doesDirExist(SAVE_PATH .. prof_dir) then
        System.createDirectory(SAVE_PATH .. prof_dir)
        DebugMessage("CreateGameFiles - directory 1 created", 0.85)
    end

    for k, v in pairs(files) do
        if not System.doesFileExist(SAVE_PATH .. v) then
            DebugMessage(SAVE_PATH .. v, 0.85)
            local handle = System.openFile(SAVE_PATH .. v, FCREATE)
            System.closeFile(handle)
            DebugMessage("CreateGameFiles - file " .. v .. " created", 0.85)
        end
    end

    DebugMessage("CreateGameFiles - passed", 0.85)

end

CreateGameFiles()