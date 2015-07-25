-- Everything else
local ElevatorCollide = {}
ElevatorCollide.name = "ElevatorCollide"

function ElevatorCollide:initObject(obj)
	local phys = {}

	obj.phys = {}

	if not obj.class["ELEVATOR_SHAFT"] then
		phys.body = love.physics.newBody(physworld,obj.x,obj.y)
		
		if obj.physExtentType == "CIRCLE" then
			phys.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
		elseif obj.physExtentType == "BOX" then
			phys.shape = love.physics.newRectangleShape(0,0,obj.physExtentX,obj.physExtentY, math.pi/4)
		end

		phys.fix = love.physics.newFixture(phys.body,phys.shape)

		table.insert(obj.phys, phys)
	end

	local trigger = {}
	trigger.body = love.physics.newBody(physworld,obj.x,obj.y)
	
	if obj.physExtentType == "CIRCLE" then
		trigger.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
	elseif obj.physExtentType == "BOX" then
		trigger.shape = love.physics.newRectangleShape(0,0,obj.physExtentX - 5.0 ,obj.physExtentY - 5.0,math.pi/4) -- 
	end

	trigger.fix = love.physics.newFixture(trigger.body,trigger.shape)
	trigger.fix:setSensor(true)

	table.insert(obj.phys, trigger)
end

function ElevatorCollide:shouldCollide(obj, obj2, fix1, fix2)	
	if(fix1:isSensor() or fix2:isSensor()) then
		return true
	end

	if(obj2.elevatorTransfer) then
		obj2.elevatorTransfer = false
		return false
	end

	if(table.find(obj.childs, obj2)) then
		return false
	end
	if obj2.isonelevator then
		return false
	end
	if obj.elevatorheight and obj.elevatorheight < 3 then
		return false
	else
		return true
	end
end

function ElevatorCollide:onCollide(obj, obj2, fix1, fix2)
	if fix1:isSensor() then
		if obj.elevatorheight then
			obj2.isonelevator = obj
			local loc = table.find(obj.childs, obj2)
			if not loc then
				table.insert(obj.childs, obj2)
			end
		end
	end
end

function ElevatorCollide:onEndCollide(obj, obj2, fix1, fix2)
	if fix1:isSensor() then
		if(obj2.isonelevator == obj) then
			obj2.isonelevator = false
		end
		if(obj2.elevatorTransfer) then

		else
			obj2.floorheight = 0
		end
		
		local loc = table.find(obj.childs, obj2)
		if(loc) then
			table.remove(obj.childs, loc)
		end
		
	end
end

return ElevatorCollide
