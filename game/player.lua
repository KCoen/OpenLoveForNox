local gdraw = love.graphics.draw

--[[
Sequences:
IDLE
GREAT_SWORD_IDLE
WALK
RUN
JUMP
RECOIL
ELECTRIC_ZAP
STAFF_STRIKE
STAFF_BLOCK
STAFF_SPELL_BLAST
STAFF_THRUST
SHOOT_BOW
SHOOT_CROSSBOW
SWORD_STRIKE
LONG_SWORD_STRIKE
BERSERKER_CHARGE
WARCRY
PUNCH_LEFT
PUNCH_RIGHT
PUNCH_RIGHT_HOOK
CHAKRAM_STRIKE
MACE_STRIKE
HAMMER_STRIKE
GREAT_SWORD_STRIKE
AXE_STRIKE
GREAT_SWORD_BLOCK_LEFT
GREAT_SWORD_BLOCK_RIGHT
GREAT_SWORD_BLOCK_DOWN
RAISE_SHIELD
RECOIL_SHIELD
CAST_SPELL
CONCENTRATE
POINT
HARPOONTHROW
LAUGH
TAUNT
TALK
SNEAK
DIE
DUST
DEAD

Equipment:
STREET_PANTS
HAMMER
OGRE_AXE
LEATHER_HELM
STAFF_OBLIVION_HALBERD
STAFF_FIREBALL
PLATE_BREAST
NAKED
MACE
SHURIKEN
PLATE_HELM
LEATHER_ARMBANDS
STAFF_OBLIVION_ORB
STAFF_FORCE_OF_NATURE
LONG_SWORD
STAFF_SULPHOROUS_FLARE
CHAIN_TUNIC
CHAIN_COIF
BOW
STAFF_LIGHTNING
LEATHER_LEGGINGS
KITE_SHIELD
CHAIN_LEGGINGS
QUIVER
PLATE_ARMS
GREAT_SWORD
SWORD
STAFF_TRIPLE_FIREBALL
MEDIEVAL_PANTS
STAFF_DEATH_RAY
PLATE_LEGGINGS
PLATE_BOOTS
AXE
STAFF_OBLIVION_WIERDLING
MEDIEVAL_CLOAK
CROSSBOW
MEDIEVAL_SHIRT
CONJURER_HELM
ROUND_SHIELD
WIZARD_HELM
ORNATE_HELM
STAFF_OBLIVION_HEART
LEATHER_BOOTS
STREET_SHIRT
LEATHER_ARMORED_BOOTS
LEATHER_TUNIC
WIZARD_ROBE
STAFF
STREET_SNEAKERS
STAFF_SULPHOROUS_SHOWER
CHAKRAM
]]
localplayer = nil

Player = {}
Player.__index = Player

local AnimationDirection = {
	NW = 0,
	N = 1,
	NE = 2,
	W = 3,
	E = 4,
	SW = 5,
	S = 6,
	SE = 7
}

local AnimationDirectionConversion = {
	AnimationDirection.N,
	AnimationDirection.NE,
	AnimationDirection.E,
	AnimationDirection.SE,
	AnimationDirection.S,
	AnimationDirection.SW,
	AnimationDirection.W,
	AnimationDirection.NW
}

local function equipmentFromName(name, intname)
	local db = ModDB.Mods[name]
	local obj = {}
	obj.Name = intname
	if(db.COLOR1) then
		obj.COLOR1 = { db.COLOR1.R, db.COLOR1.G, db.COLOR1.B, db.COLOR1.A }
	end
	if(db.COLOR2) then
		obj.COLOR2 = { db.COLOR2.R, db.COLOR2.G, db.COLOR2.B, db.COLOR2.A }
	end
	if(db.COLOR3) then
		obj.COLOR3 = { db.COLOR3.R, db.COLOR3.G, db.COLOR3.B, db.COLOR3.A }
	end
	if(db.COLOR4) then
		obj.COLOR4 = { db.COLOR4.R, db.COLOR4.G, db.COLOR4.B, db.COLOR4.A }
	end
	if(db.COLOR5) then
		obj.COLOR5 = { db.COLOR5.R, db.COLOR5.G, db.COLOR5.B, db.COLOR5.A }
	end
	if(db.COLOR6) then
		obj.COLOR6 = { db.COLOR6.R, db.COLOR6.G, db.COLOR6.B, db.COLOR6.A }
	end

	return obj
end

function Player:UpdateObjectSpriteId(spriteid)
	function fixPlayerPosition(x, y, sid, tt)
		local vbc_ent = VideoBag.Sequences[sid]
		
		local offsetX
		local offsetY
		
		if vbc_ent == nil then
			offsetX = 0
			offsetY = 0
		else
			offsetX = vbc_ent.offsetX
			offsetY = vbc_ent.offsetY
		end
		
		local sizeX = tt.SizeX / 2
		local sizeY = tt.SizeY / 2
		
		x = x - (sizeX - offsetX)
		y = y - (sizeY - offsetY) - tt.Z
	
		return x,y
	end

	self.spriteId = spriteid
	self.quad, self.img = videobagcache:getSequence(self.spriteId)

	--self.quad, self.img = videobagcache:storeObject(self.quad, self.img)
	if(self.quad == nil) then
		print("Could not update sprite for, " .. self.tt.Name)
		self.spriteId = nil
	end

	self.drawOffsetX, self.drawOffsetY = fixPlayerPosition(0,0, self.spriteId, self.tt)
end


function Player.new(x, y)
	local self = setmetatable({}, Player)
	localplayer = self
	x = x or 0
	y = y or 0
	local tt = ThingDB.Things["NewPlayer"]
	
	self.x = x
	self.y = y
	self.z = tt.Z
	self.speed = tt.Speeds[3]
	self.runmulti = 1.5
	self.noclipspeed = 500
	self.setPvx = 0
	self.setPvy = 0
	self.animationSpeed = 1 / 10
	self.lastUpdate = 0
	self.tt = tt
	self.animationOffset = 1
	self.shader = shaders.sampleShadow
	self.sequence = "IDLE"
	self.isonground = true
	self.isjumping = false

	-- Default player colors
	

	--self.COLOR1 = { db.COLOR1.R, db.COLOR1.G, db.COLOR1.B, db.COLOR1.A }


	self.equipment = {}

	table.insert(self.equipment, {
		Name = "NAKED",
		COLOR1 = { 0x73, 0x4d, 0x22, 255 },
		COLOR2 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR3 = { 0xFF, 0x0,  0xFF, 255 },
		COLOR4 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR5 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR6 = { 0xda, 0x9a, 0x6e, 255 }
	})

	
	table.insert(self.equipment, equipmentFromName("PlateBoots", "PLATE_BOOTS"))
	table.insert(self.equipment, equipmentFromName("PlateLeggings", "PLATE_LEGGINGS"))
	table.insert(self.equipment, equipmentFromName("PlateArms", "PLATE_ARMS"))
	table.insert(self.equipment, equipmentFromName("Breastplate", "PLATE_BREAST"))
	table.insert(self.equipment, equipmentFromName("WarHammer", "HAMMER"))
	table.insert(self.equipment, equipmentFromName("MedievalCloak", "MEDIEVAL_CLOAK"))--]]
	

	self.spriteStates = {}

	for k,v in pairs(tt.SpriteStates) do
		self.spriteStates[v.Name] = v
		self.spriteStates[v.Name].sequences = {}
		for k2,v2 in pairs(self.spriteStates[v.Name].Animation.Sequences) do
			self.spriteStates[v.Name].sequences[v2.Name] = v2
		end
	end

	local phys = {}
	phys.body = love.physics.newBody(physworld,self.x,self.y, "dynamic")
	phys.shape = love.physics.newCircleShape(0,0,tt.ExtentX)
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	physics:setFilterData(phys.fix, "PLAYER", true, { "EVERYTHING" } )
	phys.fix:setUserData(self)
	
	phys.body:setMass(tt.Mass)
	phys.body:setFixedRotation( true )
	
	self.phys = {phys}
	
	self.noclip = false
	
	--[[physworld:setContactFilter( 
		function(a,b) 
			if a == phys.fix then 
				if self.noclip == true then 
					return false
				end

				if self.isjumping == true then
					local obj = b:getUserData()

					if obj then
						if obj.flags and obj.flags["SHORT"] then
							return false
						end
					end
				end

				return true 
			elseif b == phys.fix then 
				if self.noclip == true then 
					return false
				end

				if self.isjumping == true then
					local obj = a:getUserData()

					if obj then
						if obj.flags and obj.flags["SHORT"] then
							return false
						end
					end
				end

				return true
			else
				return true 
			end 
		end )--]]

	camera:set(self.x, self.y)
	
	return self
end

function Player:update(dt)
	self.x, self.y = self.phys[1].body:getPosition()


	
	-- Manual linear damping so we can control the timing

	local curvelx, curvely = self.phys[1].body:getLinearVelocity()
	self.appliedVelocityX = self.setPvx - curvelx
	self.appliedVelocityY = self.setPvy - curvely

	if self.isjumping == false then
		self.phys[1].body:setLinearVelocity(curvelx - curvelx * 8 * dt, curvely - curvely * 8 * dt)

		if love.mouse.isDown( 'r' ) then
			local cx,cy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
			
			local mouseDirectionX = cx - self.x
			local mouseDirectionY = cy - self.y
			
			local mouseDirectionLength = math.sqrt(mouseDirectionX^2 + mouseDirectionY^2)
			
			local spd
			if(self.noclip) then
				spd = self.noclipspeed
			else
				spd = self.speed
			end
			
			
			if(mouseDirectionLength < 5) then
				spd = 0
			elseif (mouseDirectionLength < 100) then
				
			else
				spd = spd * self.runmulti
			end


			self.setPvx = mouseDirectionX / mouseDirectionLength * spd
			self.setPvy = mouseDirectionY / mouseDirectionLength * spd
			self.phys[1].body:setLinearVelocity( self.appliedVelocityX + self.setPvx, self.appliedVelocityY + self.setPvy )
		else
			self.setPvx = self.setPvx - self.setPvx * 8 * dt
			self.setPvy = self.setPvy - self.setPvy * 8 * dt
		end

	end
	self.setPvspeed = math.sqrt(self.setPvx * self.setPvx + self.setPvy * self.setPvy)


	local angle
	if self.setPvspeed > 10 then
		angle = math.atan2(self.setPvy, self.setPvx) * math.rad2deg + 180.0 + 270.0
	else
		local cx,cy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
		local mouseDirectionX = cx - self.x
		local mouseDirectionY = cy - self.y
		angle = math.atan2(mouseDirectionY, mouseDirectionX) * math.rad2deg + 180.0 + 270.0
	end

	angle = (angle + 45.0*0.5) % 360.0
	local offset = math.floor(angle/45.0) + 1
	self.anidirection = AnimationDirectionConversion[offset] 

	--print(angle, offset, anidirection)

	local curtime = love.timer.getTime()

	if self.isjumping == false then
		if(self.setPvspeed < 10) then
			self.sequence = "IDLE"
		elseif(self.setPvspeed < self.speed * 1.1) then
			self.sequence = "WALK"
		else
			self.sequence = "RUN"
		end
	end

	if curtime - self.lastUpdate > self.animationSpeed then
		self.lastUpdate = curtime

		if(self.isjumping == true) then
			if (self.animationOffset + 1) == (#self.spriteStates[self.sequence].sequences["NAKED"].Frames / 8) then
				self.isjumping = false
				self.isonground = true

				physics:setFilterData(self.phys[1].fix, "PLAYER", true, { "EVERYTHING" } )
			end
		end

		self.animationOffset = ((self.animationOffset + 1) % (#self.spriteStates[self.sequence].sequences["NAKED"].Frames / 8))
	else
		self.animationOffset = ((self.animationOffset) % (#self.spriteStates[self.sequence].sequences["NAKED"].Frames / 8))
	end

	

	local dx = camera.x - self.x
	local dy = camera.y - self.y
	local length = math.sqrt(dx*dx + dy*dy)

	if length > 5 * camera.scale then
		camera:set(camera.x + (self.x - camera.x) * 5 * dt, camera.y + (self.y - camera.y) * 5 * dt)
	end

end

function Player:draw()
	--local vx, vy = self.phys[1].body:getLinearVelocity()
	--local vlength = math.sqrt(vx^2 + vy^2)

	self.shader:send("type46",true)
	self.shader:send("pos",{camera:worldToLocal(self.x,self.y)})

	for k,v in pairs(self.equipment) do
		self:UpdateObjectSpriteId(self.spriteStates[self.sequence].sequences[v.Name].Frames[self.animationOffset + (#self.spriteStates[self.sequence].sequences[v.Name].Frames / 8) * self.anidirection + 1])

		if(v.COLOR1) then
			self.COLOR1 = v.COLOR1
		end
		if(v.COLOR2) then
			self.COLOR2 = v.COLOR2
		end
		if(v.COLOR3) then
			self.COLOR3 = v.COLOR3
		end
		if(v.COLOR4) then
			self.COLOR4 = v.COLOR4
		end
		if(v.COLOR5) then
			self.COLOR5 = v.COLOR5
		end
		if(v.COLOR6) then 
			self.COLOR6 = v.COLOR6
		end



		if(self.quad) then
			--love.graphics.draw(self.img, self.quad, round(self.x + self.drawOffsetX), round(self.y + self.drawOffsetY))
			--renderer.update()
			renderer.drawObject(self)--gdraw(self.img, self.quad, round(self.x + self.drawOffsetX), round(self.y + self.drawOffsetY))
			--renderer.drawObjects(true, self.img)
			
		end
	end
end

function Player:keypressed(key, isrepeat)
	if(key == 'v') then
		self.noclip = not self.noclip
		if(self.noclip == true) then
			physics:setFilterData(self.phys[1].fix, "PLAYER", false, { "EVERYTHING" })
		end
		print("nocip", self.noclip)
	end

	if(key == ' ') then
		if (self.isonground == true) and (self.isjumping == false) then
			--self.phys[1].body:setAwake(false)
			--self.phys[1].body:setAwake(true)
			--self.phys[1].body:putToSleep()

			--self.phys[1].fix:setFilterData(2,0x1,0)
			--physics:setFilterData(self.phys[1].fix, "NOT_WALL", {} )

			physics:setFilterData(self.phys[1].fix, "PLAYER", false, { "OBJECT_SHORT" })

			self.isjumping = true
			self.isonground = false

			self.sequence = "JUMP"
			self.animationOffset = 1

			local cx,cy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
			
			local mouseDirectionX = cx - self.x
			local mouseDirectionY = cy - self.y
			local mouseDirectionLength = math.sqrt(mouseDirectionX^2 + mouseDirectionY^2)

			local spd = self.speed* self.runmulti	

			self.setPvx = mouseDirectionX / mouseDirectionLength * spd
			self.setPvy = mouseDirectionY / mouseDirectionLength * spd

			--self.setPvx = 0
			--self.setPvy = 0

			self.phys[1].body:setLinearVelocity( self.appliedVelocityX + self.setPvx, self.appliedVelocityY + self.setPvy )

		end
	end
end