require("love.filesystem")
require("resourceManager")

local args = { ... }

local gameThread = args[1]
--GameThread.localize(gameThread)

local argument = args[2]
local funcName = argument.func 
local arg = argument.argument

gameThread.channel:push("asdf")

gameThread.asdf = resourceManager[funcName](arg)

gameThread.channel:push("done")