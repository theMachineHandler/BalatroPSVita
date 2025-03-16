GAME_TIMER = Timer.new()
GAME_TIMER_DELTA = 0
GAME_TIMER_OLD_DELTA = 0

--timer
function love.timer.getTime()
    Logger.func_info("timer.getTime")
    --might need to change
    --Logger.logfile("timer.getTime - System.getTime: " .. tostring(System.getTime()))
    --Logger.logfile("timer.getTime - os.time: " .. tostring(os.time()))
    Logger.logfile("timer.getTime - GAME_TIMER (MILISECONDS): " .. tostring(Timer.getTime(GAME_TIMER)))
    Logger.logfile("timer.getTime - GAME_TIMER (SECONDS): " .. tostring(Timer.getTime(GAME_TIMER)  / 1000))
    Logger.logfile("timer.getTime - passed")
    return Timer.getTime(GAME_TIMER) / 1000
end

function love.timer.step()
    Logger.func_info("timer.step")
    GAME_TIMER_OLD_DELTA = GAME_TIMER_DELTA
    GAME_TIMER_DELTA = Timer.getTime(GAME_TIMER)
    --Logger.logfile("timer.step - GAME_TIMER: " .. tostring(Timer.getTime(GAME_TIMER)))
    Logger.logfile("timer.step - GAME_TIMER_DELTA: " .. tostring(GAME_TIMER_DELTA))
    Logger.logfile("timer.step - GAME_TIMER_OLD_DELTA: " .. tostring(GAME_TIMER_OLD_DELTA))
    Logger.logfile("timer.step - DELTA TIME (MILISECONDS): " .. tostring(GAME_TIMER_DELTA - GAME_TIMER_OLD_DELTA))
    Logger.logfile("timer.step - DELTA TIME (SECONDS): " .. tostring((GAME_TIMER_DELTA - GAME_TIMER_OLD_DELTA) / 1000))
    Logger.logfile("timer.step - passed")
    return (GAME_TIMER_DELTA - GAME_TIMER_OLD_DELTA) / 1000
end

function love.timer.getDelta()
    Logger.func_info("timer.getDelta")
    return (GAME_TIMER_DELTA - GAME_TIMER_OLD_DELTA) / 1000
end

Logger.logfile("love timer module loaded")