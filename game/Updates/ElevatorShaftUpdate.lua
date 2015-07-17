-- Everything else
local ElevatorShaftUpdate = {}
ElevatorShaftUpdate.name = "ElevatorShaftUpdate"

ElevatorShaftUpdate.AnimatePerSecond = 1 / 16
ElevatorShaftUpdate.MaxHeight = 64
ElevatorShaftUpdate.Speed = 2

function ElevatorShaftUpdate:initObject(obj)
	obj.elevatorheight = 0
	obj.direction = 4
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 
end

function ElevatorShaftUpdate:update(dt)
	self.curTime = love.timer.getTime()
end

function ElevatorShaftUpdate:updateObject(obj, dt)
	if (obj.animationLastUpdate + ElevatorShaftUpdate.AnimatePerSecond) < self.curTime then
		local target = map:GetByExtendId(obj.mapXfer.ExtentLink)

		obj.animationLastUpdate = self.curTime
		obj.elevatorheight = target.elevatorheight

		for k,v in pairs(obj.childs) do
			v.floorheight = (ElevatorShaftUpdate.MaxHeight - obj.elevatorheight) * -1

			local target = map:GetByExtendId(obj.mapXfer.ExtentLink)
			if target then
				if(v.height < -24) then
					local dx = v.x - obj.x
					local dy = v.y - obj.y

					if(v.setPosition) then
						v:setPosition(target.x + dx, target.y + dy)
					else
						v.x = target.x + dx
						v.y = target.y + dy
					end

					v.elevatorheight = target.elevatorheight
					v.elevatorTransfer = true

					table.remove(obj.childs, table.find(obj.childs, v))
				end
			end
		end

		local index = obj.spriteAnimFrames[round(obj.elevatorheight / ElevatorShaftUpdate.MaxHeight * (#obj.spriteAnimFrames-1) - 0.5) + 1];--local index = obj.spriteAnimFrames[round(ElevatorShaftUpdate.MaxHeight / (#obj.spriteAnimFrames-1) * obj.elevatorheight) + 2];
		UpdateObjectSpriteId(obj, index)
	end
end

return ElevatorShaftUpdate
