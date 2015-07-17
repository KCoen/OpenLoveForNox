Door = {}
Door.__index = Door

function Door:UpdateObjectSpriteId(spriteid)

	self.spriteId = spriteid
	self.quad, self.img = videobagcache:getObject(self.spriteId)

	--self.quad, self.img = videobagcache:storeObject(self.quad, self.img)
	if(self.quad == nil) then
		print("Could not update sprite for, " .. self.tt.Name)
		self.spriteId = nil
	end

	self.drawOffsetX, self.drawOffsetY = fixObjectPosition(0,0, self)
end

function Door:draw()
	local b = self.phys[1].body
	local dir = self.mapXfer.Direction + round(((b:getAngle() - math.pi / 8) / (math.pi * 2)) * #self.spriteAnimFrames) + #self.spriteAnimFrames + 1
	dir = math.abs(dir)
	dir = (dir + 1) % #self.spriteAnimFrames + 1
	self:UpdateObjectSpriteId(self.spriteAnimFrames[dir])
	renderer.drawObject(self)
end

function Door:update(dt)
	local b = self.phys[1].body
	local angle = b:getAngle()
	--f(angle > math.pi / 32) then
		b:applyTorque(angle * -100000 * dt) --Heavy door ?? Should we not multiply with dt?
	--end
end

function Door:lock()
	self.isLocked = true
	self.phys[1].joint:setLimits(-0.01, 0.01)
end

function Door:unlock()
	self.isLocked = false
	self.phys[1].joint:setLimits((1/16) * -14.5 * math.pi, (1/16) * 14.5 * math.pi)
end

function DoorCreate(object)
	object = setmetatable(object, Door)
	object.collide = true

	local center = vector.new(object.x, object.y)

	object.type = "DOOR"

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

	scene:add(object)
end

