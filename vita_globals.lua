VITA = {}

-- screen related --
VITA.ScreenWidth = 960
VITA.ScreenHeight = 544
VITA.ScreenRefreshRate = 60

-- Coroutine hook logic --

-- Coroutine global flag
--(Remember to alter value before resuming)
CAN_RESUME = false
-- Hook function
function HOOK()
    Logger.func_info("HOOK")
    Logger.logfile("Yielding coroutine hook")
    coroutine.yield()
    Logger.logfile("Resuming and ending coroutine hook")
end
-- Coroutine global initialization
COROUTINE_HOOK = coroutine.create(HOOK)
-- Coroutine resume function
function RESUME_COROUTINE()
    if coroutine.status(COROUTINE_HOOK) == "suspended" and CAN_RESUME then
        coroutine.resume(COROUTINE_HOOK)
        CAN_RESUME = false
    end
end

Logger.logfile("Vita globals loaded")