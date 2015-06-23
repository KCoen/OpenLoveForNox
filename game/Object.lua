function ObjectFromMapObject(mobject)
	local object = {}
	if mobject.Name == "PlayerStart" then
		if(not player) then
			player = Player.new(mobject.Location.X, mobject.Location.Y)
			scene:add(player)
			map.Objects:add(player)
			DrawTypes:RegisterObject(player)
			physics:registerDynamicObject(player)
			--object = player
		end
	end
	local tt = ThingDB.Things[mobject.Name]
	object.mobject = mobject
	object.spriteId = GetObjectSpriteId(mobject)
	object.x = mobject.Location.X
	object.y = mobject.Location.Y
	object.z = tt.Z
	object.tt = tt

	object.drawOffsetX = 0
	object.drawOffsetY = 0
	object.drawOrderOffset = 0
			
	--[[if(object.spriteId) then
		object.quad, object.img = GetObject(object.spriteId)
		if(object.quad == nil) then
			print("Could not load sprite for, " .. mobject.Name)
			object.spriteId = nil
		end

		object.drawOffsetX, object.drawOffsetY = map:fixObjectPosition(0,0, object.spriteId, tt)
		
		object.x = round(object.x, 0)
		object.y = round(object.y, 0)
		
		object.drawOffsetX = round(object.drawOffsetX, 0)
		object.drawOffsetY = round(object.drawOffsetY, 0)
		
		if tt.ExtentType == "CIRCLE" then
			local center = tt.Z
		else
		
		end			
	else
		object.drawOffsetX = 0
		object.drawOffsetY = 0
		object.drawOrderOffset = 0
	end--]]
	
	object.flags = {}
	if tt.Flags then
		for k,v in ipairs(tt.Flags) do
			object.flags[v] = true
		end
	end
	
	object.class = {}
	if(tt.Class) then
		for k,v in pairs(tt.Class) do
			object.class[v] = true
		end
	end

	if(object.class["DOOR"]) then
		DoorCreate(object)
	end
	
	Colliders:RegisterObject(object)
	DrawTypes:RegisterObject(object)
	
	
	
	
	return object
end

function fixObjectPosition(x, y, sid, tt)
	local vbc_ent = VideoBag.Objects[sid]
	
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

function UpdateObjectSpriteId(object, spriteid)
	object.spriteId = spriteid
	object.quad, object.img = videobagcache:getObject(object.spriteId)--GetObject(object.spriteId)
	if(object.quad == nil) then
		print("Could not update sprite for, " .. object.tt.Name)
		object.spriteId = nil
	end
	
	object.drawOffsetX, object.drawOffsetY = fixObjectPosition(0,0, object.spriteId, object.tt)
	--object.drawOffsetX = object.drawOffsetX
	--object.drawOffsetY = object.drawOffsetY
end

function GetObjectSpriteId(obj)
	local result = 0;
	local index = -1;
	local tt = ThingDB.Things[obj.Name];
	
	if tt.DrawType == "StaticDraw" or
	tt.DrawType == "BaseDraw" or
	tt.DrawType == "AnimateDraw" or
	tt.DrawType == "SphericalShieldDraw" or
	tt.DrawType == "WeaponAnimateDraw" or
	tt.DrawType == "FlagDraw" or
	tt.DrawType == "SummonEffectDraw" or
	tt.DrawType == "ReleasedSoulDraw" or
	tt.DrawType == "GlyphDraw" or
	tt.DrawType == "BoulderDraw" or
	tt.DrawType == "StaticRandomDraw" or
	tt.DrawType == "ArrowDraw" or
	tt.DrawType == "HarpoonDraw" or
	tt.DrawType == "WeakArrowDraw" or
	tt.DrawType == "VectorAnimateDraw" or
	tt.DrawType == "SlaveDraw" then
		if (tt.Subclass[SubclassBitIndex["VISIBLE_OBELISK"] + 1] == true) then
			index = tt.SpriteAnimFrames[#tt.SpriteAnimFrames];
		else 
			index = tt.SpriteAnimFrames[1];
		end
		return index
	elseif tt.DrawType == "DoorDraw" then
		if (#obj.modbuf > 0)  then
			index = tt.SpriteAnimFrames[obj.modbuf[0]];
		else 
			index = tt.SpriteMenuIcon;
		end
		return index
	elseif tt.DrawType == "AnimateStateDraw" then
		if table.contains(tt.Class, "HOLE") then
			if bit.band(obj.CreateFlags, 0x1000000) == 0x1000000  then-- ENABLED
				index = tt.SpriteStates[3].Animation.Frames[1];
			else
				index = tt.SpriteStates[1].Animation.Frames[1];
			end
		elseif #tt.SpriteStates > 0 then
			index = tt.SpriteStates[1].Animation.Frames[1];
		end
		return index
	elseif tt.DrawType == "MonsterDraw" or tt.DrawType == "MaidenDraw" then
		if (#tt.SpriteStates > 0) then
			index = tt.SpriteStates[1].Animation.Frames[1];
		end
		return index;
	else
		if (tt.SpriteMenuIcon > 0) then
			return tt.SpriteMenuIcon;
		else 
			return -1;
		end
	end
end
