NoxBaseObject = {}
NoxBaseObject.__index = NoxBaseObject
-- Try to keep the codebase semi maintainable by giving some kind of predictable structures key:value to objects
NoxBaseObject.__newindex = function (table, key, value)
	if(table._isInit) then
		assert(false, "You're not allowed to add new keys to this object " .. tostring(key) .. " : " .. tostring(value))
	end
	rawset(table,key,value)
end


function NoxBaseObject:UpdateSpriteId(spriteid)
	self.spriteId = spriteid
	self.quad, self.img = videobagcache:getSprite(self.spriteId)
	if(self.quad == nil) then
		print("Could not update sprite for, " .. self.objname)
		self.spriteId = nil
	end
	
	self:fixDrawPosition()
end

function NoxBaseObject:fixDrawPosition()
	local vbc_ent = VideoBag.Sprites[self.spriteId]
	
	local offsetX
	local offsetY
	
	if vbc_ent == nil then
		offsetX = 0
		offsetY = 0
	else
		offsetX = vbc_ent.offsetX
		offsetY = vbc_ent.offsetY
	end
	
	local sizeX = self.sizeX / 2
	local sizeY = self.sizeY / 2
	
	local x = 0 - (sizeX - offsetX)
	local y = 0 - (sizeY - offsetY) - self.z
	
	self.drawOffsetX = x
	self.drawOffsetY = y
end



function NoxBaseObject.new(fromObject)
	local self = setmetatable({}, NoxBaseObject)

	self.x = 0
	self.y = 0
	self.sizeX = 0
	self.sizeY = 0
	self.z = 0
	self.last_x = 0
	self.last_y = 0

	self.spatialhashes = false
	self.spatialhashPos = false
	
	self.collider = false
	self.COLOR1 = false
	self.COLOR2 = false
	self.COLOR3 = false
	self.COLOR4 = false
	self.COLOR5 = false
	self.COLOR6 = false

	self.drawOffsetX = 0
	self.drawOffsetY = 0

	self.spriteId = 0
	
	self.img = false
	self.quad = false

	self.animationLastUpdate = 0
	self.spriteState = 0
	self.animationState = 0

	self.spriteAnimFrames = false
	self.spriteMenuIcon = false
	self.conditionalAnimations = false
	self.spriteStates = false

	self.class = {}
	self.flags = {}

	self.childs = {}
	self.phys = false

	self.renderer = false
	self.updater = false

	self.direction = 1
	self.elevatorheight = 0
	self.mapXfer = false

	self.mass = 0

	self.drawType = ""
	self.updateType = ""
	self.collideType = ""

	self.physExtentX = 0
	self.physExtentY = 0
	self.physExtentType = ""

	self.xferType = ""

	self.extentId = -1

	self.isDisabled = false

	self.floorheight = 0

	self.objname = ""

	self.elevatorTransfer = false
	self.scriptName = ""

	self.isLocked = false

	self.nopartial = false

	self.health = 0
	self.height = 0
	self.floorheight = 0
	self.isonelevator = false
	self.orderOffset = 0

	self.futureX = false
	self.futureY = false

	self.isinInventory = false

	self.npcInventoryList = false

	self.sequenceid = false
	self.sequencename = false
	self.modtype = false
	self.isequiped = false
	self.isprevweapon = false
	self.animationOffset = false
	self.anidirection = false
	self.spriteStatesS = false
	self.sequence = false




	-- Compontents
	self.door = false
	self.player = false
	self.damagecollide = false
	self.monster = false
	self.equipment = false

	self._isInit = true

	if(type(fromObject) == "string") then
		self:initFromType(fromObject)
	elseif fromObject and fromObject.Extent then
		self:initFromMapObject(fromObject)
	end

	Updates:RegisterObject(self)
	Colliders:RegisterObject(self)
	DrawTypes:RegisterObject(self)



	return self
end

function NoxBaseObject:setPosition(x,y)
	self.x = x
	self.y = y

	if(self.phys) then
		for k,v in pairs(self.phys) do
			v.body:setAwake( true )
			v.body:setPosition(x,y)
			v.body:setAwake( true )
		end
	end
end

function NoxBaseObject:setPositionDelayed(x,y)
	self.futureX = x
	self.futureY = y
end

function NoxBaseObject:initFromType(objecttype)
	local tt = ThingDB.Things[objecttype]

	--self.spriteId = GetObjectSpriteId(mobject)
	
	self.z = tt.Z
	self.sizeX = tt.SizeX
	self.sizeY = tt.SizeY
	self.mass = tt.Mass
	
	self.objname = tt.Name

	self.drawType = tt.DrawType
	self.collideType = tt.Collide
	self.updateType = tt.Update

	self.physExtentX = tt.ExtentX
	self.physExtentY = tt.ExtentY
	self.physExtentType = tt.ExtentType

	self.spriteAnimFrames = tt.SpriteAnimFrames
	self.conditionalAnimations = tt.ConditionalAnimations
	self.spriteMenuIcon = tt.SpriteMenuIcon
	self.spriteStates = tt.SpriteStates
	

	self.drawOffsetX = 0
	self.drawOffsetY = 0

	self.xferType = tt.Xfer

	self.health = tt.Health



	

	local db = ModDB.Mods[self.objname]
	if(db) then
		self.equipment = {}
		self.sequenceid = ItemNameToSequenceID[self.objname]
		self.sequencename = ItemNameToSequenceName[self.objname]
		self.modtype = db.type
		self.equipment.charges = false
	end

	if tt.Flags then
		for k,v in ipairs(tt.Flags) do
			self.flags[v] = true
		end
	end
	
	if(tt.Class) then
		for k,v in pairs(tt.Class) do
			self.class[v] = true
		end
	end
end

function NoxBaseObject:initFromMapObject(mobject)
	self:initFromType(mobject.Name)

	self.scriptName = mobject.ScrNameShort
	self.extentId = mobject.Extent
	self.x = mobject.Location.X
	self.y = mobject.Location.Y
	self.mapXfer = mobject.ObjXfer
	self.npcInventoryList = mobject.InventoryList
end

function fixObjectPosition(x, y, object)
	local vbc_ent = VideoBag.Sprites[object.spriteId]
	
	local offsetX
	local offsetY
	
	if vbc_ent == nil then
		offsetX = 0
		offsetY = 0
	else
		offsetX = vbc_ent.offsetX
		offsetY = vbc_ent.offsetY
	end
	
	local sizeX = object.sizeX / 2
	local sizeY = object.sizeY / 2
	
	x = x - (sizeX - offsetX)
	y = y - (sizeY - offsetY) - object.z
	
	return x,y
end

function UpdateObjectSpriteId(object, spriteid)
	object.spriteId = spriteid
	object.quad, object.img = videobagcache:getSprite(object.spriteId)--GetObject(object.spriteId)
	if(object.quad == nil) then
		print("Could not update sprite for, " .. object.objname)
		object.spriteId = nil
	end
	
	object.drawOffsetX, object.drawOffsetY = fixObjectPosition(0,0, object)--object.spriteId, object.tt)
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
