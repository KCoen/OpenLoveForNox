-- Everything else
local DefaultCollide = {}
DefaultCollide.name = "DefaultCollide"

function DefaultCollide:initObject(obj)

	local phys = {}
	if obj.class["IMMOBILE"] then
		phys.body = love.physics.newBody(physworld,obj.x,obj.y)
	else
		phys.body = love.physics.newBody(physworld,obj.x,obj.y, "dynamic")
		
	end
	if obj.tt.ExtentType == "CIRCLE" then
		phys.shape = love.physics.newCircleShape(0,0,obj.tt.ExtentX)
		obj.phys = {phys}
	elseif obj.tt.ExtentType == "BOX" then
		phys.shape = love.physics.newRectangleShape(0,0,obj.tt.ExtentX,obj.tt.ExtentY,math.pi/4)
		obj.phys = {phys}
	end
	
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	
	if not obj.class["IMMOBILE"] then
		phys.body:setFixedRotation( true )
		phys.body:setMass(obj.tt.Mass)
		phys.body:setLinearDamping( 5 )
	end
end

function DefaultCollide:onCollide(obj)	
end

return DefaultCollide
