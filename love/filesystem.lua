function love.filesystem.getDirectoryItems(dir, callback)
    Logger.func_info("filesystem.getDirectoryItems")
    if callback ~= nil then
        Logger.logfile("filesystem.getDiretoryItems - callback: " .. tostring(callback))
    end
    
    if System.doesDirExist(GAME_PATH .. dir) then
        Logger.logfile("filesystem.getDirectoryItems - " .. GAME_PATH .. dir .. " exists")
    else
        Logger.logfile("filesystem.getDirectoryItems - " .. GAME_PATH .. dir .. " not found")
    end

    local files = System.listDirectory(GAME_PATH .. dir)
    local filesLoveTable = {
    }

    -- modifying Luiz Menezes function to remake files 
    -- into a love.getDirectoryItems compliant table
    for k, v in pairs(files) do

      for k2, v2 in pairs(v) do

        if k2 == "name" then
            filesLoveTable[k] =  v2
        end

      end

    end

    --for testing only
    --Logger.logfile(Logger.tprint(filesLoveTable))

    Logger.logfile("filesystem.getDirectoryItems - passed")
    return filesLoveTable

end

function love.filesystem.getInfo(path, filtertype)
    Logger.func_info("filesystem.getInfo")
    Logger.logfile("filesystem.getInfo - arg path: " .. path)
    if filtertype ~= nil then
        Logger.logfile("filesystem.getInfo - filtertype: " .. tostring(filtertype))
    end
    local handle
    local size

    --directory check
    if System.doesDirExist(GAME_PATH .. path) then
        Logger.logfile("filesystem.getInfo - full dir path: " .. GAME_PATH .. "../" .. path)
        return  {FileType.directory, nil, nil}
    elseif System.doesDirExist(SAVE_PATH .. path) then
        Logger.logfile("filesystem.getInfo - full path: " .. SAVE_PATH .. path)
        return  {FileType.directory, nil, nil}
    end

    --profile files check
    for k,v in pairs(PROFILE_FILES) do
        if path == v or path == "1/"..v then
            Logger.logfile("filesystem.getInfo - full path: " .. SAVE_PATH .. "../" .. path)
            handle = System.openFile(SAVE_PATH .. path, FREAD) or System.openFile(SAVE_PATH .. "1/" .. path, FREAD)
            size = System.sizeFile(handle)
            return FileType.file, size, nil
        end
    end

    Logger.logfile("filesystem.getInfo - full path: " .. GAME_PATH .. path)

    if not System.doesFileExist(GAME_PATH .. path) then
        Logger.logfile("filesystem.getInfo - " .. GAME_PATH .. path .. " not found")
        return nil
    end

    Logger.logfile("filesystem.getInfo - " .. GAME_PATH .. path .. " exists")

    handle = System.openFile(GAME_PATH .. path, FREAD)

    size = System.sizeFile(handle)


    local info = {
        type = nil,
        size,
        modtime = nil
    }

    Logger.logfile("filesystem.getInfo - passed")

    return info
end

function love.filesystem.read(name, size)
    Logger.func_info("filesystem.read")
    Logger.logfile("filesystem.read - arg path: " .. name)
    if size ~= nil then
        Logger.logfile("filesystem.read - size to read from " .. name ..": " .. tostring(size))
    end

    --profile files check
    for k,v in pairs(PROFILE_FILES) do
        if name == v or name == "1/"..v then
            Logger.logfile("filesystem.read - full path path: " .. SAVE_PATH .. "../" .. name)
            local handle = System.openFile(SAVE_PATH .. name, FREAD) or System.openFile(SAVE_PATH .. "1/" .. name, FREAD)

            if size == nil then
                size = System.sizeFile(handle)
            end

            local contents = System.readFile(handle, size)

            Logger.logfile("filesystem.read - size: " .. tostring(size))
 
            System.closeFile(handle)
        
            Logger.logfile("filesystem.read - " .. v .. " passed")
        
            return contents, size
        end
    end

    if System.doesFileExist(GAME_PATH .. name) then
        Logger.logfile("filesystem.read - " .. GAME_PATH .. name .. " exists")
    else
        Logger.logfile("filesystem.read - " .. GAME_PATH .. name .. " not found")
        local error = "File not found"
        local contents = nil
        return contents, error
    end

    local handle = System.openFile(GAME_PATH .. name, FREAD)

    if size == nil then
        size = System.sizeFile(handle)
    end

    local contents = System.readFile(handle, size)
    --Logger.logfile("love.filesystem.read - contents: " .. tostring(contents))
    Logger.logfile("filesystem.read - size: " .. tostring(size))
 
    System.closeFile(handle)

    Logger.logfile("filesystem.read - passed")

    return contents, size
end

Logger.logfile("love filesystem module loaded")