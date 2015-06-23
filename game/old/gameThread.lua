GameThread = {}
GameThread.__index = GameThread

function GameThread.new(file, argument)
	local self = setmetatable({}, GameThread)
	
	self.name = file;
	
	self.thread = love.thread.newThread(file)
	self.channel = love.thread.getChannel(file)
	self.thread:start(self, argument)
	
	return self
end

function GameThread:update(dt)
	local lasterror = self.thread:getError()
	if(lasterror) then
		self.error = lasterror;
	end       
end

function GameThread:draw()
	if(self.error) then
		love.graphics.print(self.error, 20, 20)
	end  
end

function GameThread:push(var)
	self.channel:push(var)
end

function GameThread:get()
	return self.channel:pop()
end

function GameThread.localize(gameThread)
	gameThread = setmetatable(gameThread, GameThread)
end