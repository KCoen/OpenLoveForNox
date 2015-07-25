-- Everything else
local PlayerCollide = {}
PlayerCollide.name = "PlayerCollide"

function PlayerCollide:initObject(obj)
	local tt = ThingDB.Things["NewPlayer"]

	local phys = {}
	phys.body = love.physics.newBody(physworld,obj.x,obj.y, "dynamic")
	phys.shape = love.physics.newCircleShape(0,0,tt.ExtentX)
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	physics:setFilterData(phys.fix, "PLAYER", true, { "EVERYTHING" } )
	phys.fix:setUserData(obj)
	
	phys.body:setMass(tt.Mass)
	phys.body:setFixedRotation( true )
	
	obj.phys = {phys}
end

return PlayerCollide
