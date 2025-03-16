
local function check_exe()
    if System.doesFileExist("app0:/Balatro.exe") then
        return true
    end
    return false
end

local function run_extractor()

    DebugMessage("Initializing", 1.5)
    -- Checks if exe is in files
    if check_exe() then

        if System.doesDirExist(GAME_PATH) then
            if not System.doesDirExist(GAME_PATH .. "canvas/") then
                System.createDirectory(GAME_PATH .. "canvas/")
            end
            DebugMessage("Everything seems ok!", 1.5)
            return
        end

        System.createDirectory(GAME_PATH)
        System.createDirectory(GAME_PATH .. "canvas/")

        System.extractZipAsync("app0:/Balatro.exe", GAME_PATH)
        local spinner_frames = { "-", string.char(92), "|", "/"}
        local frame_index = 1
        
        while System.getAsyncState() == 0 do
            local running_symbol = spinner_frames[frame_index]
            DebugMessage("Extracting files\nIt might take a while\nRunning " .. running_symbol, 0.75)
            frame_index = (frame_index % #spinner_frames) + 1
        end

        local asyncState = System.getAsyncState()

        if asyncState == 1 then
            DebugMessage("Extraction completed successfully.", 1.5)
        elseif asyncState == -1 then
            DebugMessage("Extraction failed.", 1.5)
        end

        return
    else
        DebugMessage("No Balatro.exe found, closing app", 1.2)
        System.exit()
    end

end

run_extractor()