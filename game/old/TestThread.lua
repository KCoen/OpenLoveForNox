local gameThread = ...
local JSON = require("JSON");
require("gameThread")
require("love.filesystem")

gameThread = setmetatable(gameThread, GameThread)

--c = love.thread.getChannel("test")

contents, size = love.filesystem.read("ThingDB.min.json");
local lua_value = JSON:decode(contents)

if(gameThread) then
gameThread:push("hi")
end