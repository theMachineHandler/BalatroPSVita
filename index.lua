package.path = package.path .. ";./?.lua;./love/?.lua;"
-- Potential problems: 
-- a) GAME_PATH might not exist during first execution
-- so it might be ignored
-- (solution a) Create all files and paths before starting the game 
require("initializer")

package.path = package.path .. GAME_PATH .. "?.lua;"

require("extractor")

require("debug/logger")
Logger.createFile()

require("vita_globals")

require("love")

require("overrides")

require("main")

love.run()