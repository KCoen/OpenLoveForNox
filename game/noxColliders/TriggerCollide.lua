-- Everything else
local TriggerCollide = {}
TriggerCollide.name = "TriggerCollide"

function TriggerCollide:initObject(obj)

	--[[local phys = {}
	if obj.class["IMMOBILE"] then
		phys.body = love.physics.newBody(physworld,obj.x,obj.y)
	else
		phys.body = love.physics.newBody(physworld,obj.x,obj.y, "dynamic")
		
	end
	if obj.physExtentType == "CIRCLE" then
		phys.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
		obj.phys = {phys}
	elseif obj.physExtentType == "BOX" then
		phys.shape = love.physics.newRectangleShape(0,0,obj.physExtentX,obj.physExtentY,math.pi/4)
		obj.phys = {phys}
	end
	
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	
	if not obj.class["IMMOBILE"] then
		phys.body:setFixedRotation( true )
		phys.body:setMass(obj.mass)
		phys.body:setLinearDamping( 5 )
	end--]]
end


return TriggerCollide
