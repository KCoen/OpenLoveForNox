-- Everything else
local ElevatorCollide = {}
ElevatorCollide.name = "ElevatorCollide"

function ElevatorCollide:initObject(obj)
	local phys = {}
	
	phys.body = love.physics.newBody(physworld,obj.x,obj.y)
	
	if obj.tt.ExtentType == "CIRCLE" then
		phys.shape = love.physics.newCircleShape(0,0,obj.tt.ExtentX)
	elseif obj.tt.ExtentType == "BOX" then
		phys.shape = love.physics.newRectangleShape(0,0,obj.tt.ExtentX,obj.tt.ExtentY, math.pi/4)
	end

	phys.fix = love.physics.newFixture(phys.body,phys.shape)

	local trigger = {}
	trigger.body = love.physics.newBody(physworld,obj.x,obj.y)
	
	if obj.tt.ExtentType == "CIRCLE" then
		trigger.shape = love.physics.newCircleShape(0,0,obj.tt.ExtentX)
	elseif obj.tt.ExtentType == "BOX" then
		trigger.shape = love.physics.newRectangleShape(0,0,obj.tt.ExtentX - 5.0 ,obj.tt.ExtentY - 5.0,math.pi/4) -- 
	end

	trigger.fix = love.physics.newFixture(trigger.body,trigger.shape)
	trigger.fix:setSensor(true)

	obj.phys = {phys, trigger}
end

function ElevatorCollide:shouldCollide(obj, obj2, fix1, fix2)	
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
		end
	end
end

function ElevatorCollide:onEndCollide(obj, obj2, fix1, fix2)
	if fix1:isSensor() then
		obj2.isonelevator = nil
	end
end

return ElevatorCollide
