--[[
    This DEFINETLY needs cleaning
    Needs more work
]]--

function love.graphics.clear(r, g, b, a)
    Logger.func_info("graphics.clear")
    Logger.logfile("graphics.clear - background color - r: " .. tostring(r) 
    .. "; g: " .. tostring(g) 
    .. "; b: " .. tostring(b) 
    .. "; a: " .. tostring(a)
    )
    Screen.clear(Color.new(r,g,b,a))

    Logger.logfile("graphics.clear - passed")

end

-- TODO: Implement graphics.draw 
function love.graphics.draw(...)

    Logger.func_info("graphics.draw")

    local args = {...}
    local argc = #args

    Logger.logfile("graphics.draw - number of args =" .. tostring(argc))

    if type(args[2]) == "userdata" then
        if  args[2]:typeOf("Quad") then
            Logger.logfile("graphics.draw:\nDrawable: " .. Logger.tprint(args[1]) ..
            "\nQuad: " .. tostring(args[2]) .. " y: " .. tostring(args[3]) ..
            "\nr: " .. tostring(args[4]) .. " sx: " .. tostring(args[5]) .. " sy: " .. tostring(args[6]) ..
            "\nox: " .. tostring(args[7]) .. " oy: " .. tostring(args[8]) ..
            "\nkx: " .. tostring(args[9]) .. " ky: " .. tostring(args[10])
            )

            Logger.logfile("graphics.draw - fake - passed")

            return
        end

        if args[2]:typeOf("Transform") then
            Logger.logfile("graphics.draw:\ndrawable: " .. Logger.tprint(args[1]) ..
            "\nTransform: " .. tostring(args[2])
            )

            Logger.logfile("graphics.draw - fake - passed")

            return
        end
    end

    Logger.logfile("graphics.draw:\ndrawable: " .. Logger.tprint(args[1]) ..
    "\nx: " .. tostring(args[2]) ..
    "\nx: " .. tostring(args[3]) .. " y: " .. tostring(args[4]) ..
    "\nr: " .. tostring(args[5]) .. " sx: " .. tostring(args[6]) .. " sy: " .. tostring(args[7]) ..
    "\nox: " .. tostring(args[8]) .. " oy: " .. tostring(args[9]) ..
    "\nkx: " .. tostring(args[10]) .. " ky: " .. tostring(args[11])
    )

    Logger.logfile("graphics.draw - fake - passed")

end

function love.graphics.getHeight()
    Logger.func_info("graphics.getHeight")
    Logger.logfile("graphics.getHeight - wip - passed")
    return VITA.ScreenHeight
end
                                                                          
function love.graphics.getWidth()
    Logger.func_info("graphics.getWidth")
    Logger.logfile("graphics.getWidth - wip - passed")
    return VITA.ScreenWidth
end


function love.graphics.isActive()
    Logger.func_info("graphics.isActive")
    Logger.logfile("graphics.isActive - fake - passed")
    return true
end

-- graphics.newCanvas will generate a new empty image
-- using LPP-Vita. The reason being that it will use 
-- this new image to draw any requested canvas and then
-- save it into storage memory as an image, later checking for it 
-- and loading that image to be drawned into the 
-- render buffer. (That is the plan, at least)
function love.graphics.newCanvas(width, height, settings)
    Logger.func_info("graphics.newCanvas")
    Logger.logfile("graphics.newCanvas - width: " .. tostring(width)
    .. "; height: " .. tostring(height)
    .. "; settings: " .. Logger.tprint(settings)
    )
    Logger.logfile("graphics.newCanvas - Generating new image")

    CANVAS_COUNT = CANVAS_COUNT + 1

    local canvas_filepath = "canvas/canvas_test_" .. tostring(CANVAS_COUNT) .. ".png"

    if not System.doesFileExist(GAME_PATH .. canvas_filepath) then

        local canvas = Graphics.createImage(width, height, Color.new(0,0,0))
        Graphics.saveImage(canvas, GAME_PATH .. canvas_filepath, FORMAT_PNG)
        -- Bug on original lpp-vita was causing freeImage() to
        -- crash app, found solution by changing how createImage 
        -- sets its initial values on lpp-texture
        Graphics.freeImage(canvas)

    end

    Logger.logfile("graphics.newCanvas - wip - passed")

    return Canvas:new(width, height, settings, canvas_filepath)

end

function love.graphics.newFont(filename_path, size)
    -- For some reason size is a table called render_scale on source...
    Logger.func_info("graphics.newFont")
    Logger.logfile("graphics.newFont - file path: " .. GAME_PATH .. filename_path .. "; size: " .. tostring(size))
    local font = LoveFont:new(GAME_PATH .. filename_path, size)

    Logger.logfile("graphics.newFont - wip - passed")

    return font

end

function love.graphics.newImage(filename_path, settings)
    Logger.func_info("graphics.newImage")
    Logger.logfile("graphics.newImage - path: " .. GAME_PATH .. filename_path)
    if settings ~= nil then
        Logger.logfile("; settings: " .. Logger.tprint(settings))
    end
    local img = Graphics.loadImage(GAME_PATH .. filename_path)

    local img_obj = Image:new(
    Graphics.getImageWidth(img), 
    Graphics.getImageHeight(img), 
    settings.mipmap,
    settings.linear,
    settings.dpiscale,
    GAME_PATH .. filename_path
    )

    Graphics.freeImage(img)

    Logger.logfile("graphics.newImage - " .. filename_path .. ": " 
    .. Logger.tprint(img_obj)
    )
    Logger.logfile("graphics.newImage - passed")
    return img_obj

end

function love.graphics.newQuad(x, y, width, height, sw, sh)
    Logger.func_info("graphics.newQuad")
    Logger.logfile("graphics.newQuad - x: " .. tostring(x) 
    .. "; y: " ..  tostring(y) 
    .. "; width: " ..  tostring(width) 
    .. "; height: " .. tostring(height) 
    .. "; sw: " ..  tostring(sw) 
    .. "; sh: " ..  tostring(sh)
    )
    
    local quad = Quad:new(x, y, width, height, sw, sh)
    Logger.logfile("graphics.newQuad - passed")
    return quad
end

function love.graphics.newShader(filename_path)
    Logger.func_info("graphics.newShader")
    local shader = Shader:new()

    Logger.logfile("graphics.newShader - fake - passed")
    return shader
end

function love.graphics.pop()
    Logger.func_info("graphics.pop")
    table.remove(TRANSRFORM_MATRIX_STACK, #TRANSRFORM_MATRIX_STACK)
    Logger.logfile("graphics.pop - wip - passed")
end

function love.graphics.present()
    Logger.func_info("graphics.present")
    Graphics.termBlend()
    Screen.flip()

    Logger.logfile("graphics.present - revise - passed")
end

function love.graphics.print(
    text,
    x,
    y,
    r,
    sx,
    sy,
    ox,
    oy,
    kx,
    ky
)
    Logger.func_info("graphics.print")
    -- 'text' can also be a table with {color1, string1, color2, string2, ...}
    -- would need more complex implementation

    --Font.print(DEFAULT_FONT, x, y, text, WHITE_COLOR)

    Logger.logfile("graphics.print - font is never drawed")
    Logger.logfile("graphics.print - wip - passed")

end

function love.graphics.push(stack)
    Logger.func_info("graphics.push")
    if stack ~= nil then
        Logger.logfile("graphics.push - stack: " .. Logger.tprint(stack))
    end
    table.insert(TRANSRFORM_MATRIX_STACK, #TRANSRFORM_MATRIX_STACK)
    Logger.logfile("graphics.push - wip - passed")
end

function love.graphics.rectangle(
    mode,
    x,
    y,
    width,
    height,
    rx,
    ry,
    segments
)
    Logger.func_info("graphics.rectangle")
    Logger.logfile("graphics.rectangle - mode: " .. mode
    .. "; x: " .. tostring(x)
    .. "; y: " .. tostring(y)
    .. "; width: " .. tostring(width)
    .. "; height: " .. tostring(height)
    .. "; rx: " .. tostring(rx)
    .. "; ry: " .. tostring(ry)
    .. "; segments: " .. tostring(segments)
    )
    local x2 = x + width
    local y2 = y + height

    if mode == "line" then
        Graphics.fillEmptyRect(x, x2, y, y2, DRAW_COLOR)
    else
        Graphics.fillRect(x, x2, y, y2, DRAW_COLOR)
    end


    Logger.logfile("graphics.rectangle - wip - passed")
    --[[
    Arguments not implemented
    number rx (nil)
        The x-axis radius of each round corner. Cannot be greater than half the rectangle's width.
    number ry (rx)
        The y-axis radius of each round corner. Cannot be greater than half the rectangle's height.
    number segments (nil)
        The number of segments used for drawing the round corners. A default amount will be chosen if no number is given.
    ]]--
end

function love.graphics.rotate(radians)
    Logger.func_info("graphics.rotate")
    Logger.logfile("graphics.rotate - radians: " .. tostring(radians))
    Logger.logfile("graphics.rotate - wip - fake - passed")
end

function love.graphics.scale(sx, sy)
    Logger.func_info("graphics.scale")
    if sy == nil then
        sy = sx
    end
    Logger.logfile("graphics.scale - sx: " .. tostring(sx) 
    .. "; sy: " .. tostring(sy))
    Logger.logfile("graphics.scale - wip - passed")
end

-- Function mainly used to reset the render target in Love2D.
-- Since LPP-VITA works a little different, I am using it to 
-- initiate blend instead...
-- But I believe I should actually check if blend was initiated
-- previously. (Maybe through a global bool?)
function love.graphics.setCanvas(canvas, mipmap)
    Logger.func_info("graphics.setCanvas")
    
    if canvas ~= nil then
        Logger.logfile("graphics.setCanvas - Canvas: " .. Logger.tprint(canvas))
    end

    if mipmap ~= nil then
        Logger.logfile("graphics.setCanvas - mipmap: " .. tostring(mipmap))
    end

    Graphics.initBlend()

    Logger.logfile("graphics.setCanvas - used to initiate blend")
    Logger.logfile("graphics.setCanvas - passed")
end


function love.graphics.setColor(r, g, b, a)
    Logger.func_info("graphics.setColor")
    -- can accept table as first arg instead of r,g,b,a
    if type(r) == "table" then
        Logger.logfile("graphics.setColor - DRAW_COLOR - table - r: " .. tostring(r[1]) 
    .. "; g: " .. tostring(r[2]) 
    .. "; b: " .. tostring(r[3]) 
    .. "; a: " .. tostring(r[4])
        )
        DRAW_COLOR = Color.new(255 * r[1], 255 * r[2], 255 * r[3], 255 * r[4])
        Logger.logfile("graphics.setColor - passed")
        return
    end

    -- rgba
    Logger.logfile("graphics.setColor - DRAW_COLOR - r: " .. tostring(r) 
    .. "; g: " .. tostring(g) 
    .. "; b: " .. tostring(b) 
    .. "; a: " .. tostring(a)
    )
    DRAW_COLOR = Color.new(255 * r, 255 * g, 255 * b, 255 * a)

    Logger.logfile("graphics.setColor - passed")
end

function love.graphics.setDefaultFilter(min, mag, anisotropy)
    Logger.func_info("graphics.setDefaultFilter")
    Logger.logfile("graphics.setDefaultFilter -  min: " .. tostring(min) 
    .. "; mag: " .. tostring(mag) 
    .. "; anisotropy: " .. tostring(anisotropy)
    )
    IMG_FILTER_MIN = min
    IMG_FILTER_MAG = mag

    Logger.logfile("graphics.setDefaultFilter - wip - passed")

end

function love.graphics.setLineStyle(style)
    Logger.func_info("graphics.setLineStyle")
    Logger.logfile("graphics.setLineStyle - style: " .. style)
    Logger.logfile("graphics.setLineStyle - wip - fake - passed")
end

function love.graphics.setLineWidth(width)
    Logger.func_info("graphics.setLineWidth")
    Logger.logfile("graphics.setLineWidth - width: " .. tostring(width))
    Logger.logfile("graphics.setLineWidth - wip - fake - passed")
end

function love.graphics.setNewFont(filename, size)
    Logger.func_info("graphics.setNewFont")
    Logger.logfile("graphics.setNewFont - filename: " .. filename 
    .. "; size (nil = 12): " .. tostring(size)
    )
    if size == nil then 
        size = 12
    end
    Logger.logfile("graphics.setNewFont - loading font from: " .. GAME_PATH .. filename)
    Logger.logfile("Font table : " .. Logger.tprint(Font))
    Logger.logfile("Graphics table : " .. Logger.tprint(Graphics))

    local font = Font.load(GAME_PATH .. filename)

    Font.setPixelSizes(font, size)

    Logger.logfile("graphics.setNewFont - wip - passed")
    return font

end

-- When no argument is passed, it actually disables shaders.
-- This allows unfiltered drawing.
function love.graphics.setShader(shader)
    Logger.func_info("graphics.setShader")
    if shader == nil then
        Logger.logfile("graphics.setShader - fake - should reset to default shader here - passed")
        return
    end
    
    Logger.logfile("graphics.setShader - fake - should set specified shader here - passed")
end

function love.graphics.translate(dx, dy)
    Logger.func_info("graphics.translate")
    Logger.logfile("graphics.translate - dx: " .. tostring(dx) 
    .. " dy: " .. tostring(dy)
    )
    Logger.logfile("graphics.translate - wip - fake - passed")
end

Logger.logfile("love graphics module loaded")