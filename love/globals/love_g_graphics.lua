--love.graphics globals
DRAW_COLOR = Color.new(0,0,0,0)
WHITE_COLOR = Color.new(255,255,255,255)

IMG_FILTER_MIN = "linear"
IMG_FILTER_MAG = "linear"

LINE_WIDTH = 1

DPI_SCALE_FACTOR = 2.29

-- Canvas counter
CANVAS_COUNT = 0

-- Original transformStack matrix is 4x4 (probably due to upgradability purposes)
-- but since we are dealing with 2d, a 3x3 should suffice for this port
TRANSRFORM_MATRIX_STACK = {}

MATRIX3 = {}

-- Do I even need this?
function MATRIX3.setIdentity()
    local matrix = {
        1,0,0,
        0,1,0,
        0,0,1
    }
    
    return matrix
end

function MATRIX3.setRotation(rad)
    local matrix = MATRIX3.setIdentity()
    local c = math.cos(rad)
    local s = math.sin(rad)
    matrix[0] = c
    matrix[1] = -s
    matrix[4] = s
    matrix[5] = c

    return matrix
end

function MATRIX3.setScale(sx, sy)
    local matrix = MATRIX3.setIdentity()
    matrix[0] = sx
    matrix[5] = sy

    return matrix
end

-- This assumes tangent values as arguments
function MATRIX3.setShear(kx, ky)
    local matrix = MATRIX3.setIdentity()
    matrix[1] = ky
    matrix[4] = kx
end

function MATRIX3.setTranslation(x, y)
    local matrix = MATRIX3.setIdentity()
    matrix[7] = x
    matrix[8] = y

    return matrix
end

table.insert(TRANSRFORM_MATRIX_STACK, MATRIX3.setIdentity)

Logger.logfile("love graphics globals module loaded")