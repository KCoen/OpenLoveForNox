-- Everything else
local ElevatorUpdate = {}
ElevatorUpdate.name = "ElevatorUpdate"

ElevatorUpdate.AnimatePerSecond = 1 / 16
ElevatorUpdate.MaxHeight = 64
ElevatorUpdate.Speed = 128

function ElevatorUpdate:initObject(obj)
	obj.elevatorheight = 0
	obj.direction = ElevatorUpdate.Speed
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
		obj.elevatorheight = obj.elevatorheight + obj.direction * dt
		if(obj.elevatorheight < 0) then
			obj.elevatorheight = 0
		end
		if(obj.elevatorheight > ElevatorUpdate.MaxHeight) then
			obj.elevatorheight = ElevatorUpdate.MaxHeight
		end

		if(obj.elevatorheight >= ElevatorUpdate.MaxHeight) then
			obj.direction = -1 * ElevatorUpdate.Speed
		end
		if(obj.elevatorheight <= 0) then
			obj.direction = ElevatorUpdate.Speed
		end

		if(obj.elevatorheight > ElevatorUpdate.MaxHeight - 24) then
			local target = NoxMap:GetByExtendId(obj.mapXfer.ExtentLink)
			if target then
				if #obj.childs > 0 then
					tprint(target)
				end
				for k,v in pairs(obj.childs) do
					if(v.setPosition) then
						v:setPosition(target.x, target.y)
					else
						v.x = target.x
						v.y = target.y
					end

					v.elevatorTransfer = true
					v.height = (ElevatorUpdate.MaxHeight - obj.elevatorheight) * -1
					v.floorheight = (ElevatorUpdate.MaxHeight - obj.elevatorheight) * -1
					table.remove(obj.childs, table.find(obj.childs, v))
				end
			end
		end

		local index = obj.spriteAnimFrames[round(obj.elevatorheight / ElevatorUpdate.MaxHeight * (#obj.spriteAnimFrames-1) - 0.5) + 1];
		UpdateObjectSpriteId(obj, index)

		for k,v in pairs(obj.childs) do
			v.floorheight = obj.elevatorheight
			--v.height = (obj.elevatorheight - 1) * 4
		end
	end

	
end

return ElevatorUpdate
