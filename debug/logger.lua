-- Flag to deactivate logging functions
_IS_LOGGING = true

Logger = {}

local log_file_path = "ux0:/data/log.txt"

local function createStub()
  return function() end
end

local function initializeLogger()
  if not _IS_LOGGING then
    -- Replace all Logger functions with stubs
    Logger.createFile = createStub()
    Logger.func_info = createStub()
    Logger.logfile = createStub()
    Logger.logfile_raw = createStub()
    Logger.tprint = function() return "" end
    Logger.limited_tprint = function() return "" end

  else

    -- Creates log.txt
    -- inside ux0:/data for...
    -- well, logging data :v
    function Logger.createFile()
      if System.doesFileExist(log_file_path) then
        DebugMessage("Deleting old log.txt file", 0.85)
        System.deleteFile(log_file_path)
      end
      DebugMessage("Creating new log.txt file", 0.85)
      local file = System.openFile(log_file_path, FCREATE)
      System.closeFile(file)
      DebugMessage("log.txt created sucessfully!", 0.75)
    end

    function Logger.func_info(called_f_name)
      local info = debug.getinfo(3, "Sl")
      Logger.logfile(called_f_name .. " - called from: " .. tostring(info.source) .. ": " .. tostring(info.currentline))
    end

    function Logger.logfile(text)
      local file = System.openFile(log_file_path, FRDWR)
      System.seekFile(file, 0, END)
      System.writeFile(file, text .. "\n", (string.len(text)) + 1)
      System.closeFile(file)
    end

    function Logger.logfile_raw(text)
      local file = System.openFile(log_file_path, FRDWR)
      System.seekFile(file, 0, END)
      System.writeFile(file, text, (string.len(text)) + 1)
      System.closeFile(file)
    end

    -- Not my solution; 
    -- got from user Luiz Menezes at stackoverflow:
    -- https://stackoverflow.com/questions/41942289/display-contents-of-tables-in-lua
    function Logger.tprint (tbl, indent)
      if tbl == nil then
        return "nil"
      end
      if not indent then indent = 0 end
      local toprint = string.rep(" ", indent) .. "{\r\n"
      indent = indent + 2 
      for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent)
        if (type(k) == "number") then
          toprint = toprint .. "[" .. k .. "] = "
        elseif (type(k) == "string") then
          toprint = toprint  .. k ..  "= "   
        end
        if (type(v) == "number") then
          toprint = toprint .. v .. ",\r\n"
        elseif (type(v) == "string") then
          toprint = toprint .. "\"" .. v .. "\",\r\n"
        elseif (type(v) == "table") then
          toprint = toprint .. Logger.tprint(v, indent + 2) .. ",\r\n"
        else
          toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
        end
      end
      toprint = toprint .. string.rep(" ", indent-2) .. "}"
      return toprint
    end

    function Logger.limited_tprint(tbl, indent, depth, seen)
      -- initialize parameters
      indent = indent or 0
      depth  = depth  or 0

      -- nil guard
      if tbl == nil then
        return string.rep(" ", indent) .. "nil"
      end

      -- if we’re too deep, don’t descend further
      if depth >= 2 then
        return string.rep(" ", indent) .. "{...}"
      end

      local pad = string.rep(" ", indent)
      local out = { pad .. "{\n" }

      for k, v in pairs(tbl) do
        -- skip any “magic”/metamethod fields
        if not (type(k) == "string" and k:sub(1,2) == "__") then
          local keyRep = (type(k) == "string") and k or ("["..tostring(k).."]")
          local line   = string.rep(" ", indent + 2) .. keyRep .. " = "

          if type(v) == "table" then
            -- recurse one level deeper
            out[#out+1] = line .. "\n"
            out[#out+1] = Logger.tprint(v, indent + 4, depth + 1)
            out[#out+1] = ",\n"
          else
            -- primitive value
            local valRep = (type(v) == "string") and string.format("%q", v)
                        or tostring(v)
            out[#out+1] = line .. valRep .. ",\n"
          end
        end
      end

      out[#out+1] = pad .. "}"
      return table.concat(out)
    end

  end

end

initializeLogger()
Logger.createFile()
