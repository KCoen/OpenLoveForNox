-- Everything else
local DoorCollide = {}
DoorCollide.name = "DoorCollide"

function DoorCollide:initObject(object)
	local center = vector.new(object.x, object.y)

	--object.type = "DOOR"
	
	

	local rangle = object.mapXfer.Direction * (6.28318530718 / 32) + math.pi * 0.25
	local doorvector = vector.new(math.cos(rangle), math.sin(rangle)):normalized()

	local doorLength = 46 / 2 * 1.4

	local offset = doorvector * doorLength

	object.phys = object.phys or {}
	local phys = {}
	phys.body = love.physics.newBody(physworld, center.x - offset.x / 2, center.y - offset.y / 2, "dynamic")
	phys.shape = love.physics.newRectangleShape(0, 0, doorLength, 5, rangle)
	phys.fix = love.physics.newFixture(phys.body, phys.shape)	
	physics:setFilterData(phys.fix, "DOOR", false, { "WALL" })	
	phys.joint = love.physics.newRevoluteJoint(phys.body, physworldbody, center.x, center.y)
	phys.joint:setLimits((1/16) * -14.5 * math.pi, (1/16) * 14.5 * math.pi)	
	phys.joint:setLimitsEnabled(true)
	phys.body:setMass(object.mass)
	phys.body:setAngularDamping( 25 )

	object.nopartial = true
	
	table.insert(object.phys, phys)
end

return DoorCollide
