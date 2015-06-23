-- This should have a task system, not important enough right now
require("gameThread");
local JSON = require("JSON");

resourceManager = {}
resourceManager.threads = {}


function resourceManager:load()
end

local c = 0
function resourceManager:update(dt)
	for key, gt in pairs(resourceManager.threads) do
		local res = gt:get()
		if(res) then
			c = c + 1
			gt.task.callback(res)
		end
		
	end
	
	for key, gt in pairs(resourceManager.threads) do
		gt:update(dt)
	end
end


function resourceManager:draw()
	for key, gt in pairs(resourceManager.threads) do
		gt:draw()
	end
	love.graphics.print("asdf: " .. c)
end

function resourceManager:getJSON(file, callback)
	local task = {}
	task.func = "_getJSON"
	task.argument = file
	
	
	gt = GameThread.new("resourceManagerThread.lua", task)
	gt.task = task
	gt.task.callback = callback -- Can't pass function references
	
	table.insert(resourceManager.threads, gt)
end

function resourceManager._getJSON(file)
	contents, size = love.filesystem.read(file);
	return JSON:decode(contents)
end