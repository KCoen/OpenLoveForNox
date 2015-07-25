-- @todo Some of this code need to be decoupled into collider/draw inits and updates, so it may be idepently replaced

local PlayerUpdate = {}
PlayerUpdate.name = "PlayerUpdate"
PlayerUpdate.AnimatePerSecond = 1 / 10

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


function PlayerUpdate:initObject(obj)
	local tt = ThingDB.Things["NewPlayer"]

	obj.player = {}
	obj.player._object = obj -- Add a circulare reference

 	-- Functions
 	obj.player.sendMove = function(_obj, moveDirectionX, moveDirectionY, moveSpeed, jump) 
		local obj = _obj._object

		obj.player.input.moveDirectionX = moveDirectionX
		obj.player.input.moveDirectionY = moveDirectionY
		obj.player.input.moveSpeed = moveSpeed
		obj.player.input.jump = jump
	end

	obj.player.toggleNoclip = function(_obj)
		local obj = _obj._object

		obj.player.noclip = not obj.player.noclip
		if(obj.player.noclip == true) then
			physics:setFilterData(obj.phys[1].fix, "PLAYER", false, { "EVERYTHING" })
		end
	end


	
	
	--obj.player.noclipSpeed = 500
	obj.player.speed = tt.Speeds[3]
	obj.player.mana = 100
	obj.player.maxmana = 100
	obj.player.maxhealth = tt.Health
	obj.player.lastUpdate = love.timer.getTime()
	obj.player.setPvx = 0
	obj.player.setPvy = 0
	obj.player.noclipspeed = 500
	obj.player.isonground = true
	obj.player.isjumping = false
	obj.player.runmulti = 1.5
	obj.player.angle = 0
	obj.player.noclip = false
	obj.player.input = {}


	
	local angle = (0 + 45.0*0.5) % 360.0
	local offset = math.floor(angle/45.0) + 1
	obj.player.anidirection = AnimationDirectionConversion[offset] 

	local tt = ThingDB.Things["NewPlayer"]
	
	obj.player.sequence = "IDLE"
	obj.player.animationOffset = 1
	obj.player.spriteStates = {}

	for k,v in pairs(tt.SpriteStates) do
		obj.player.spriteStates[v.Name] = v
		obj.player.spriteStates[v.Name].sequences = {}
		for k2,v2 in pairs(obj.player.spriteStates[v.Name].Animation.Sequences) do
			obj.player.spriteStates[v.Name].sequences[v2.Name] = v2
		end
	end



	obj.player.spellsets = {}
	obj.player.spellsets[1] = { NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR") }
	obj.player.spellsets[2] = { NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR") }
	obj.player.spellsets[3] = { NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR") }
	obj.player.spellsets[4] = { NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR") }
	obj.player.spellsets[5] = { NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR"), NoxSpells:get("SPELL_ANCHOR") }
	obj.player.activespellset = 1

	obj.player.equipment = {}

	table.insert(obj.player.equipment, {
		Name = "NAKED",
		COLOR1 = { 0x73, 0x4d, 0x22, 255 },
		COLOR2 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR3 = { 0xFF, 0x0,  0xFF, 255 },
		COLOR4 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR5 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR6 = { 0xda, 0x9a, 0x6e, 255 }
	})

	table.insert(obj.player.equipment, equipmentFromName("PlateBoots", "PLATE_BOOTS"))
	table.insert(obj.player.equipment, equipmentFromName("PlateLeggings", "PLATE_LEGGINGS"))
	table.insert(obj.player.equipment, equipmentFromName("PlateArms", "PLATE_ARMS"))
	table.insert(obj.player.equipment, equipmentFromName("Breastplate", "PLATE_BREAST"))
	table.insert(obj.player.equipment, equipmentFromName("WarHammer", "HAMMER"))
	table.insert(obj.player.equipment, equipmentFromName("MedievalCloak", "MEDIEVAL_CLOAK"))--]]

end

function PlayerUpdate:update(dt)
end

function PlayerUpdate:updateObject(obj, dt)	
	local curtime = love.timer.getTime()

	if(obj.futureX and obj.futureY) then
		obj.phys[1].body:setAwake( true )
		obj.phys[1].body:setPosition(obj.futureX,obj.futureY)
		obj.phys[1].body:setAwake( true )
		camera:set(obj.futureX, obj.futureY)
		obj.futureX = false
		obj.futureY = false
	end

	if(obj.height > obj.floorheight) then -- Should probably be generic
		obj.height = obj.height -1 * 100 * dt
	end
	if(obj.height < obj.floorheight) then
		obj.height = obj.floorheight
	end

	if(obj.player.input.jump) then
		if (obj.player.isonground == true) and (obj.player.isjumping == false) then


			physics:setFilterData(obj.phys[1].fix, "PLAYER", false, { "OBJECT_SHORT" })

			obj.player.isjumping = true
			obj.player.isonground = false

			obj.player.sequence = "JUMP"
			obj.player.animationOffset = 1

			local cx,cy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
			
			local mouseDirectionX = cx - obj.x
			local mouseDirectionY = cy - obj.y
			local mouseDirectionLength = math.sqrt(mouseDirectionX^2 + mouseDirectionY^2)

			local spd = obj.player.speed * obj.player.runmulti	

			obj.player.setPvx = mouseDirectionX / mouseDirectionLength * spd
			obj.player.setPvy = mouseDirectionY / mouseDirectionLength * spd

			--self.setPvx = 0
			--self.setPvy = 0

			obj.phys[1].body:setLinearVelocity( obj.player.appliedVelocityX + obj.player.setPvx, obj.player.appliedVelocityY + obj.player.setPvy)

		end
	end


	local curvelx, curvely = obj.phys[1].body:getLinearVelocity()
	obj.player.appliedVelocityX = obj.player.setPvx - curvelx
	obj.player.appliedVelocityY = obj.player.setPvy - curvely

	if obj.player.isjumping == false then
		obj.phys[1].body:setLinearVelocity(curvelx - curvelx * 8 * dt, curvely - curvely * 8 * dt)

		if (obj.player.input.moveDirectionX ~= 0 or obj.player.input.moveDirectionY ~= 0) and (obj.player.input.moveSpeed ~= 0) then
			local spd
			if(obj.player.noclip) then
				spd = obj.player.noclipspeed
			else
				spd = obj.player.speed
			end

			if(obj.player.input.moveSpeed == 1) then

			else
				spd = spd * obj.player.runmulti
			end


			obj.player.setPvx = obj.player.input.moveDirectionX * spd
			obj.player.setPvy = obj.player.input.moveDirectionY * spd
			obj.phys[1].body:setLinearVelocity( obj.player.appliedVelocityX + obj.player.setPvx, obj.player.appliedVelocityY + obj.player.setPvy )
		else
			obj.player.setPvx = obj.player.setPvx - obj.player.setPvx * 8 * dt
			obj.player.setPvy = obj.player.setPvy - obj.player.setPvy * 8 * dt
		end

	end
	obj.player.setPvspeed = math.sqrt(obj.player.setPvx * obj.player.setPvx + obj.player.setPvy * obj.player.setPvy)


	local angle
	if obj.player.setPvspeed > 10 then
		angle = math.atan2(obj.player.setPvy, obj.player.setPvx) * math.rad2deg + 180.0 + 270.0
	elseif obj.player.input.moveDirectionY or obj.player.input.moveDirectionX then
		angle = math.atan2(obj.player.input.moveDirectionY, obj.player.input.moveDirectionX) * math.rad2deg + 180.0 + 270.0
	else
		angle = obj.player.angle
	end
	obj.player.angle = angle

	angle = (angle + 45.0*0.5) % 360.0
	local offset = math.floor(angle/45.0) + 1
	obj.player.anidirection = AnimationDirectionConversion[offset] 

	if obj.player.isjumping == false then
		if(obj.player.setPvspeed < 10) then
			obj.player.sequence = "IDLE"
		elseif(obj.player.setPvspeed < obj.player.speed * 1.1) then
			obj.player.sequence = "WALK"
		else
			obj.player.sequence = "RUN"
		end
	end

	if curtime - obj.player.lastUpdate > PlayerUpdate.AnimatePerSecond then
		obj.player.lastUpdate = curtime

		if(obj.player.isjumping == true) then
			if (obj.player.animationOffset + 1) == (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8) then
				obj.player.isjumping = false
				obj.player.isonground = true

				physics:setFilterData(obj.phys[1].fix, "PLAYER", true, { "EVERYTHING" } )
			end
		end

		obj.player.animationOffset = ((obj.player.animationOffset + 1) % (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8))
	else
		obj.player.animationOffset = ((obj.player.animationOffset) % (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8))
	end

	
	local dx = camera.x - obj.x
	local dy = camera.y - obj.y
	local length = math.sqrt(dx*dx + dy*dy)

	if length > 5 * camera.scale then
		camera:set(camera.x + (obj.x - camera.x) * 5 * dt, camera.y + (obj.y - camera.y) * 5 * dt)
	end

	obj.player.input = {}
end

return PlayerUpdate
