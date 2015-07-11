-- Everything else
local ElevatorUpdate = {}
ElevatorUpdate.name = "ElevatorUpdate"

ElevatorUpdate.AnimatePerSecond = 1 / 16

function ElevatorUpdate:initObject(obj)
	obj.elevatorheight = 0
	obj.direction = 1
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 
end

function ElevatorUpdate:update(dt)
	self.curTime = love.timer.getTime()
end

function ElevatorUpdate:updateObject(obj, dt)
	if (obj.animationLastUpdate + ElevatorUpdate.AnimatePerSecond) < self.curTime then

		local a,b,c = obj.phys[1].fix:getFilterData() --Forces filter callback to be re-run.
		obj.phys[1].fix:setFilterData(a,b,c)

		obj.animationLastUpdate = self.curTime
		obj.elevatorheight = obj.elevatorheight + obj.direction

		if(obj.elevatorheight == #obj.tt.SpriteAnimFrames - 1) then
			obj.direction = -1
		end
		if(obj.elevatorheight == 0) then
			obj.direction = 1
		end

		local index = obj.tt.SpriteAnimFrames[obj.elevatorheight + 1];
		UpdateObjectSpriteId(obj, index)
	end
end

return ElevatorUpdate
