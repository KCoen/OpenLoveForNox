-- @todo Some of this code need to be decoupled into collider/draw inits and updates, so it may be idepently replaced

--[[ Available sequences
WARCRY
SHOOT_BOW
WALK
PUNCH_RIGHT_HOOK
LAUGH
TAUNT
HAMMER_STRIKE
GREAT_SWORD_BLOCK_DOWN
CONCENTRATE
GREAT_SWORD_BLOCK_RIGHT
STAFF_STRIKE
SWORD_STRIKE
CAST_SPELL
SHOOT_CROSSBOW
GREAT_SWORD_STRIKE
RUN
CHAKRAM_STRIKE
JUMP
ELECTRIC_ZAP
DEAD
STAFF_SPELL_BLAST
TALK
DIE
PUNCH_LEFT
AXE_STRIKE
MACE_STRIKE
HARPOONTHROW
POINT
STAFF_BLOCK
BERSERKER_CHARGE
IDLE
RECOIL
GREAT_SWORD_IDLE
RAISE_SHIELD
SNEAK
DUST
PUNCH_RIGHT
GREAT_SWORD_BLOCK_LEFT
RECOIL_SHIELD
STAFF_THRUST
LONG_SWORD_STRIKE
]]

local PlayerUpdate = {}
PlayerUpdate.name = "PlayerUpdate"
PlayerUpdate.AnimatePerSecond = 1 / 10

shieldAllowedWeapons = 
{
	SWORD = true,
	MACE = true,
	CHAKRAM = true,
	DAGGER = true
}

function PlayerUpdate:initObject(obj)
	local tt = ThingDB.Things["NewPlayer"]

	obj.player = {}
	obj.player._object = obj -- Add a circulare reference

	obj.player.damage = function(_obj, amount, type, source, perframe) 
		local obj = _obj._object
		local perframe = perframe or nil

		obj.health = obj.health - amount * perframe
		if obj.health < 0 then
			obj.player.isdead = true
			obj.player:playSequence("DIE")

			local allItems = {}
			for k,v in pairs(obj.player.inventory) do
				if v then
					table.insert(allItems, k)
				end
			end

			local anglestep = math.pi*2 / #allItems
			local angle = 0
			local distance = 30
			for k,v in pairs(allItems) do
				obj.player:dropItemFromInventory(v, math.cos(angle) * distance + obj.x , math.cos(angle) * distance + obj.y)
				angle = angle + anglestep
			end

			audio:emitSoundByMapping(obj, "HumanMaleDie")

			obj.player.input = {}
		else
			if obj.player.lastHurtSoundEmit + 0.20 < love.timer.getTime() then
				if amount < 5 then
					audio:emitSoundByMapping(obj, "HumanMaleHurtLight")
				elseif amount < 10 then
					audio:emitSoundByMapping(obj, "HumanMaleHurtMedium")
				else
					audio:emitSoundByMapping(obj, "HumanMaleHurtHeavy")
				end
				obj.player.lastHurtSoundEmit = love.timer.getTime()
			end
		end
	end

	obj.player.playSequence = function(_obj, sequencename, onEnd)
		local obj = _obj._object
		if obj.player.playingSequence and obj.player.playingSequenceOnEnd then
			obj.player.playingSequenceOnEnd()
		end
		obj.player.playingSequence = sequencename
		obj.player.sequence = sequencename
		obj.player.playingSequenceOnEnd = onEnd
		obj.player.animationOffset = 1
	end



 	-- Functions
 	obj.player.sendMove = function(_obj, moveDirectionX, moveDirectionY, moveSpeed, jump) 
		local obj = _obj._object

		if obj.player.isdead or obj.isfrozen then
			return
		end

		obj.player.input.moveDirectionX = moveDirectionX
		obj.player.input.moveDirectionY = moveDirectionY
		obj.player.input.moveSpeed = moveSpeed
		obj.player.input.jump = jump
	end

	obj.player.dropItemFromInventory = function(_obj, slot, x,y)
		local obj = _obj._object

		local item = obj.player.inventory[slot]
		local fromStack = false
		if #item.stack > 0 then
			item = table.remove(item.stack)
			fromStack = true
		end
		if item.equipment and item.equipment.isequiped then
			obj.player:useItemFromInventory(slot)
		end
		item.isinInventory = false

		local dx = x - obj.x
		local dy = y - obj.y

		local length = math.sqrt(dx*dx + dy*dy)

		if length > obj.player.pickupRange then
			dx = dx / length * obj.player.pickupRange
			dy = dy / length * obj.player.pickupRange
		end

		x = obj.x + dx
		y = obj.y + dy

		physworld:rayCast(obj.x, obj.y, x,y, function(fix,collidex,collidey)
				local obj = fix:getUserData()
				if obj.flags and obj.flags["SHADOW"] or (obj.iswall and not obj.transparent and not obj.window) then
					local xn = dx / length
					local yn = dy / length
					x = collidex - xn * item.physExtentX
					y = collidey - yn * item.physExtentX
					return 0
				else
					return -1
				end
			end)

		item:setPosition(x,y)


		if not fromStack then
			obj.player.inventory[slot] = false
		end
	end

	obj.player.isPointVisible = function(_obj, x,y) 
		local obj = _obj._object
		local ret = true
		physworld:rayCast(obj.x, obj.y, x,y, function(fix,collidex,collidey)
				local obj2 = fix:getUserData()
				if obj2.flags and obj2.flags["SHADOW"] or (obj2.iswall and not obj2.transparent and not obj2.window) then
					ret = false
					return 0
				else
					return -1
				end
			end)
		return ret
	end

	obj.player.pickupItem = function(_obj, item)
		local function putInInventory(obj, item)
			if not item.class["NOT_STACKABLE"] then
				for k,v in pairs(obj.player.inventory) do
					if v then
						if v.objname == item.objname then
							if #v.stack == 8 then
								return
							end
							table.insert(v.stack, item)
							item.isinInventory = obj
							item:setPosition(0,0)
							return k
						end
					end
				end
			end

			for k,v in pairs(obj.player.inventory) do
				if not v then
					item.isinInventory = obj
					item:setPosition(0,0)
					obj.player.inventory[k] = item
					return k
				end
			end
		end

		if not item.pickupType then
			return
		end

		if obj.player.isdead then
			return
		end

		local obj = _obj._object

		local dx = item.x - obj.x
		local dy = item.y - obj.y

		local length = math.sqrt(dx*dx + dy*dy)

		if length > obj.player.pickupRange then
			return
		end

		if not obj.player:isPointVisible(item.x, item.y) then
			return
		end



		-- "Pickup":      "

		if item.pickupType == "FoodPickup" then
			putInInventory(obj, item)
		elseif item.pickupType == "WeaponPickup" then
			local slot = putInInventory(obj, item)
			if not obj.player.equipment[item.equipment.slot] then
				obj.player:useItemFromInventory(slot)
			end
		elseif item.pickupType == "DefaultPickup" then
			putInInventory(obj, item)	
		elseif item.pickupType == "ArmorPickup" then
			local slot = putInInventory(obj, item)
			if not obj.player.equipment[item.equipment.slot] then
				obj.player:useItemFromInventory(slot)
			end
		elseif item.pickupType == "PotionPickup" then
			putInInventory(obj, item)
		elseif item.pickupType == "GoldPickup" then
			obj.player.gold = obj.player.gold + item.mapXfer.Amount
			audio:playSoundByMapping("TreasurePickup")
			item:destroy()
		elseif item.pickupType == "SpellBookPickup" then
			putInInventory(obj, item)
		elseif item.pickupType:split(" ")[1] == "AudEventPickup" then
			audio:playSoundByMapping(item.pickupType:split(" ")[2])
			putInInventory(obj, item)
		elseif item.pickupType == "AmmoPickup" then
			putInInventory(obj, item)
		else
			print("Unknown pickupType: " .. pickupType)
		end
	end

	obj.player.givexp = function(_obj, xp)
		local obj = _obj._object
		obj.player.xp = obj.player.xp + xp
	end

	obj.player.useItemFromInventory = function(_obj, slot)
		local obj = _obj._object

		if obj.player.isdead then
			return
		end

		local item = obj.player.inventory[slot]

		if item.equipment then
			if item.equipment.isequiped then
				obj.player.equipment[item.equipment.slot] = false
				item.equipment.isequiped = false
				if item.equipment.slot == "WEAPON" then
					obj.player.equipment["PREVWEAPON"] = item
				end
				return
			end

			if item.equipment.slot == "SHIELD" then
				if obj.player.equipment["WEAPON"] and not obj.player.equipment["WEAPON"].equipment.isShieldAllowed then
					obj.player.equipment["WEAPON"].equipment.isequiped = false
					obj.player.equipment["PREVWEAPON"] = obj.player.equipment["WEAPON"]
					if obj.player.equipment["PREVSHIELD"] == item then
						obj.player.equipment["PREVSHIELD"] = false
					end
					obj.player.equipment["WEAPON"] = false
				end
			end

			if item.equipment.slot == "WEAPON" then
				if obj.player.equipment["WEAPON"] then
					obj.player.equipment["WEAPON"].equipment.isequiped = false
					obj.player.equipment["PREVWEAPON"] = obj.player.equipment["WEAPON"]
				end
				--[[if obj.player.equipment["PREVWEAPON"] == item then
					obj.player.equipment["PREVWEAPON"] = false
				end--]]
				obj.player.equipment["WEAPON"] = item
				item.equipment.isequiped = true

				if obj.player.equipment["SHIELD"] and not item.equipment.isShieldAllowed then
					obj.player.equipment["SHIELD"].equipment.isequiped = false
					obj.player.equipment["SHIELD"] = false
					obj.player.equipment["PREVSHIELD"] = obj.player.equipment["SHIELD"]
				end
			elseif item.class["ARMOR"] then
				if obj.player.equipment[item.equipment.slot] then
					obj.player.equipment[item.equipment.slot].equipment.isequiped = false
				end
				obj.player.equipment[item.equipment.slot] = item
				item.equipment.isequiped = true
			end

			return
		end

		-- otherUseFunctionsHere
	end

	obj.player.toggleNoclip = function(_obj)
		local obj = _obj._object

		if obj.player.isdead then
			return
		end

		obj.player.noclip = not obj.player.noclip
		if(obj.player.noclip == true) then
			physics:setFilterData(obj.phys[1].fix, "PLAYER", false, { "EVERYTHING" })
		end
	end

	obj.player.dialogText = function(_obj, text)
		local obj = _obj._object
		print(getNoxString(text))
	end

	obj.player.speed = tt.Speeds[3]
	obj.player.mana = 100
	obj.player.maxmana = 100
	obj.player.maxhealth = tt.Health
	obj.health = obj.player.maxhealth
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
	obj.player.pickupRange = 100
	obj.player.gold = 0
	obj.player.isdead = false
	obj.player.friction = 8
	obj.player.lastHurtSoundEmit = 0
	obj.player.xp = 0

	obj.player.equipment =  
	{
		BOOTS = false,
		ARM_ARMOR = false,
		BREASTPLATE = false,
		HELMET = false,
		LEG_ARMOR = false,
		PANTS = false,
		SHIRT = false,
		BACK = false,
		SHIELD = false,
		WEAPON = false,
		PREVWEAPON = false,
		PREVSHIELD = false
	}

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

	obj.player.inventory = table.prealloc(80)

	obj.player.inventorySlots = 80

	local eq = NoxBaseObject.new("PlateBoots")
	eq.isinInventory = obj
	obj.player.inventory[1] = eq

	eq = NoxBaseObject.new("PlateLeggings")
	eq.isinInventory = obj
	obj.player.inventory[2] = eq

	eq = NoxBaseObject.new("PlateArms")
	eq.isinInventory = obj
	obj.player.inventory[3] = eq

	eq = NoxBaseObject.new("Breastplate")
	eq.isinInventory = obj
	obj.player.inventory[4] = eq

	eq = NoxBaseObject.new("WarHammer")
	eq.isinInventory = obj
	obj.player.inventory[5] = eq
	
	eq = NoxBaseObject.new("MedievalCloak")
	eq.isinInventory = obj
	obj.player.inventory[6] = eq

	eq = NoxBaseObject.new("MedievalPants")
	eq.isinInventory = obj
	obj.player.inventory[7] = eq

	eq = NoxBaseObject.new("MedievalShirt")
	eq.isinInventory = obj
	obj.player.inventory[8] = eq

	eq = NoxBaseObject.new("MedievalCloak")
	eq.isinInventory = obj
	obj.player.inventory[9] = eq

	eq = NoxBaseObject.new("Sword")
	eq.isinInventory = obj
	obj.player.inventory[10] = eq

end

function PlayerUpdate:update(dt)
end

function PlayerUpdate:updateObject(obj, dt)	
	--print(obj.height)
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

			obj.player.friction = 0

			--obj.player.sequence = "JUMP"
			obj.player:playSequence("JUMP", function()
					obj.player.isjumping = false
					obj.player.isonground = true
					physics:setFilterData(obj.phys[1].fix, "PLAYER", true, { "EVERYTHING" } )
					obj.player.friction = 8
				end)

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

	obj.phys[1].body:setLinearVelocity(curvelx - curvelx * obj.player.friction * dt, curvely - curvely * obj.player.friction * dt)

	if not obj.player.playingSequence and not obj.player.isdead then
		if (obj.player.input.moveSpeed and obj.player.input.moveSpeed ~= 0) then
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
			obj.player.setPvx = obj.player.setPvx - obj.player.setPvx * obj.player.friction * dt
			obj.player.setPvy = obj.player.setPvy - obj.player.setPvy * obj.player.friction * dt
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

	if not obj.player.playingSequence then
		if obj.player.isjumping == false then
			if(obj.player.setPvspeed < 10) then
				obj.player.sequence = "IDLE"
			elseif(obj.player.setPvspeed < obj.player.speed * 1.1) then
				obj.player.sequence = "WALK"
			else
				obj.player.sequence = "RUN"
			end
		end
	end

	if curtime - obj.player.lastUpdate > PlayerUpdate.AnimatePerSecond then
		obj.player.lastUpdate = curtime

		if obj.player.playingSequence then
			if (obj.player.animationOffset + 1) == (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8) then
				if not obj.player.isdead then
					obj.player.playingSequence = nil
				end
				if obj.player.playingSequenceOnEnd then
					obj.player.playingSequenceOnEnd()
				end
			end
		end

		local rawOffset = obj.player.animationOffset + 1
		if obj.player.isdead then
			if obj.player.animationOffset + 1 == (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8) then
				rawOffset = obj.player.animationOffset
			end
		end

		obj.player.animationOffset = ((rawOffset) % (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8))
	else
		obj.player.animationOffset = ((obj.player.animationOffset) % (#obj.player.spriteStates[obj.player.sequence].sequences["NAKED"].Frames / 8))
	end


	if not obj.player.isdead and obj.player.isonground then
		local tile, edge = NoxMap:getActiveTile(obj.x, obj.y)

		if (tile and tile.name == "Lava") or (edge and (edge.name == "LavaEdge" or edge.name == "LavaEdgeBrownDirt" or edge.name == "LavaEdgeBlackDirt")) then
			obj.player:damage(100,nil, nil, dt)
		end
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
