package.path = package.path .. ";./?.lua;./love/?.lua;"

require("initializer")
require("extractor")
require("debug/logger")
require("vita_globals")
require("love")
require("overrides")
require("main")

love.run()
