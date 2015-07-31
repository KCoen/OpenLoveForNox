-- Everything else
local MonsterCollide = {}
MonsterCollide.name = "MonsterCollide"

function MonsterCollide:initObject(obj, ...)
	local arg = {...}
	local subtype = arg[1]

	local phys = {}
	phys.body = love.physics.newBody(physworld,obj.x,obj.y, "dynamic")
	phys.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	phys.fix:setUserData(obj)
	
	phys.body:setMass(obj.mass)
	phys.body:setFixedRotation( true )
	phys.body:setLinearDamping( 5 )
	
	obj.phys = {phys}
end

return MonsterCollide
