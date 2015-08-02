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


PlayerArmor = 
{
	NO_ARMOR = 0,
	ALL_CLOTH_ARMOR = 0x4C0F,
	ALL_LEATHER_ARMOR = 0x2090D0,
	ALL_TORSO_ARMOR = 0x3CC02,
	ALL_HELM_ARMOR = 0x0FC0000,
	ALL_ARM_ARMOR = 0x3000,
	ALL_FEET_ARMOR = 0x1C1,
	ALL_LEG_ARMOR = 0x23C,
	ALL_HAND_ARMOR = 0x3000000,
	STREET_PANTS = 0x4,
	MEDIEVAL_PANTS = 0x8,
	STREET_SNEAKERS = 0x1,
	LEATHER_BOOTS = 0x40,
	LEATHER_ARMORED_BOOTS = 0x80,
	PLATE_BOOTS = 0x100,
	LEATHER_LEGGINGS = 0x10,
	CHAIN_LEGGINGS = 0x20,
	PLATE_LEGGINGS = 0x200,
	STREET_SHIRT = 0x400,
	MEDIEVAL_SHIRT = 0x800,
	WIZARD_ROBE = 0x4000,
	LEATHER_TUNIC = 0x8000,
	CHAIN_TUNIC = 0x10000,
	PLATE_BREAST = 0x20000,
	LEATHER_ARMBANDS = 0x1000,
	PLATE_ARMS = 0x2000,
	MEDIEVAL_CLOAK = 0x2,
	ROUND_SHIELD = 0x1000000,
	KITE_SHIELD = 0x2000000,
	CHAIN_COIF = 0x40000,
	WIZARD_HELM = 0x80000,
	CONJURER_HELM = 0x100000,
	LEATHER_HELM = 0x200000,
	PLATE_HELM = 0x400000,
	ORNATE_HELM = 0x800000
}

PlayerWeapon = 
{
	NO_WEAPONS = 0x0,
	ALL_WEAPONS = 0x7FFFFFE,
	ALL_MAGICAL_STAVES = 0x47F0000,
	ALL_STAVES = 0x7FF8000,
	ALL_RANGED_WEAPONS = 0x47F00FE,
	FLAG = 0x1,
	QUIVER = 0x2,
	BOW = 0x4,
	CROSSBOW = 0x8,
	ARROW = 0x10,
	BOLT = 0x20,
	CHAKRAM = 0x40,
	SHURIKEN = 0x80,
	SWORD = 0x100,
	LONG_SWORD = 0x200,
	GREAT_SWORD = 0x400,
	MACE = 0x800,
	AXE = 0x1000,
	OGRE_AXE = 0x2000,
	HAMMER = 0x4000,
	STAFF = 0x8000,
	STAFF_SULPHOROUS_FLARE = 0x10000,
	STAFF_SULPHOROUS_SHOWER = 0x20000,
	STAFF_LIGHTNING = 0x40000,
	STAFF_FIREBALL = 0x80000,
	STAFF_TRIPLE_FIREBALL = 0x100000,
	STAFF_FORCE_OF_NATURE = 0x200000,
	STAFF_DEATH_RAY = 0x400000,
	STAFF_OBLIVION_HALBERD = 0x800000,
	STAFF_OBLIVION_HEART = 0x1000000,
	STAFF_OBLIVION_WIERDLING = 0x2000000,
	STAFF_OBLIVION_ORB = 0x4000000
}

ModelArmor = {};
ModelArmor[PlayerArmor.CHAIN_COIF] = 14344;
ModelArmor[PlayerArmor.CHAIN_LEGGINGS] = 14309;
ModelArmor[PlayerArmor.CHAIN_TUNIC] = 14343;
ModelArmor[PlayerArmor.CONJURER_HELM] = 14365;
ModelArmor[PlayerArmor.KITE_SHIELD] = 14374;
ModelArmor[PlayerArmor.LEATHER_ARMBANDS] = 14345;
ModelArmor[PlayerArmor.LEATHER_ARMORED_BOOTS] = 14347;
ModelArmor[PlayerArmor.LEATHER_BOOTS] = 14346;
ModelArmor[PlayerArmor.LEATHER_HELM] = 14358;
ModelArmor[PlayerArmor.LEATHER_LEGGINGS] = 14359;
ModelArmor[PlayerArmor.LEATHER_TUNIC] = 14357;
ModelArmor[PlayerArmor.MEDIEVAL_CLOAK] = 14307;
ModelArmor[PlayerArmor.MEDIEVAL_PANTS] = 14354;
ModelArmor[PlayerArmor.MEDIEVAL_SHIRT] = 14353;
ModelArmor[PlayerArmor.ORNATE_HELM] = 14364;
ModelArmor[PlayerArmor.PLATE_ARMS] = 14362;
ModelArmor[PlayerArmor.PLATE_BOOTS] = 14356;
ModelArmor[PlayerArmor.PLATE_BREAST] = 14360;
ModelArmor[PlayerArmor.PLATE_HELM] = 14361;
ModelArmor[PlayerArmor.PLATE_LEGGINGS] = 14363;
ModelArmor[PlayerArmor.ROUND_SHIELD] = 14373;
ModelArmor[PlayerArmor.STREET_PANTS] = 14351;
ModelArmor[PlayerArmor.STREET_SHIRT] = 14352;
ModelArmor[PlayerArmor.STREET_SNEAKERS] = 14350;
ModelArmor[PlayerArmor.WIZARD_HELM] = 14372;
ModelArmor[PlayerArmor.WIZARD_ROBE] = 14371;
	
ModelWeapon = {};
ModelWeapon[PlayerWeapon.FLAG] = null;
ModelWeapon[PlayerWeapon.QUIVER] = 14348;
ModelWeapon[PlayerWeapon.BOW] = 14381;
ModelWeapon[PlayerWeapon.CROSSBOW] = 14366;
ModelWeapon[PlayerWeapon.ARROW] = null;
ModelWeapon[PlayerWeapon.BOLT] = null;
ModelWeapon[PlayerWeapon.CHAKRAM] = 14367;
ModelWeapon[PlayerWeapon.SHURIKEN] = 14368;
ModelWeapon[PlayerWeapon.SWORD] = 14378;
ModelWeapon[PlayerWeapon.LONG_SWORD] = 14375;
ModelWeapon[PlayerWeapon.GREAT_SWORD] = 14379;
ModelWeapon[PlayerWeapon.MACE] = 14377;
ModelWeapon[PlayerWeapon.AXE] = 14380;
ModelWeapon[PlayerWeapon.OGRE_AXE] = 14398;
ModelWeapon[PlayerWeapon.HAMMER] = 14376;
ModelWeapon[PlayerWeapon.STAFF] = 14369;
ModelWeapon[PlayerWeapon.STAFF_SULPHOROUS_FLARE] = 14383;
ModelWeapon[PlayerWeapon.STAFF_SULPHOROUS_SHOWER] = 14384;
ModelWeapon[PlayerWeapon.STAFF_LIGHTNING] = 14385;
ModelWeapon[PlayerWeapon.STAFF_FIREBALL] = 14386;
ModelWeapon[PlayerWeapon.STAFF_TRIPLE_FIREBALL] = 14387;
ModelWeapon[PlayerWeapon.STAFF_FORCE_OF_NATURE] = 14388;
ModelWeapon[PlayerWeapon.STAFF_DEATH_RAY] = 14391;
ModelWeapon[PlayerWeapon.STAFF_OBLIVION_HALBERD] = 14392;
ModelWeapon[PlayerWeapon.STAFF_OBLIVION_HEART] = 14393;
ModelWeapon[PlayerWeapon.STAFF_OBLIVION_WIERDLING] = 14394;
ModelWeapon[PlayerWeapon.STAFF_OBLIVION_ORB] = 14395;

ItemNameToSequenceID = {
	LesserFireballWand = PlayerWeapon.STAFF_FIREBALL,
	LeatherBoots = PlayerArmor.LEATHER_BOOTS,
	WizardRobe = PlayerArmor.WIZARD_ROBE,
	Breastplate = PlayerArmor.PLATE_BREAST,
	GreatSword = PlayerWeapon.GREAT_SWORD,
	SulphorousFlareWand = PlayerWeapon.STAFF_SULPHOROUS_FLARE,
	LeatherArmbands = PlayerArmor.LEATHER_ARMBANDS,
	LeatherArmor = PlayerArmor.LEATHER_TUNIC,
	ForceWand = PlayerWeapon.STAFF_LIGHTNING,
	LeatherHelm = PlayerArmor.LEATHER_HELM,
	Sword = PlayerWeapon.SWORD,
	OgreAxe = PlayerWeapon.OGRE_AXE,
	MedievalCloak = PlayerArmor.MEDIEVAL_CLOAK,
	LeatherLeggings = PlayerArmor.LEATHER_LEGGINGS,
	OblivionWierdling = PlayerWeapon.STAFF_OBLIVION_WIERDLING,
	SteelShield = PlayerArmor.KITE_SHIELD,
	MorningStar = PlayerWeapon.MACE,
	Flag = PlayerWeapon.FLAG,
	ChainTunic = PlayerArmor.CHAIN_TUNIC,
	WizardHelm = PlayerArmor.WIZARD_HELM,
	Quiver = PlayerWeapon.QUIVER,
	PlateBoots = PlayerArmor.PLATE_BOOTS,
	RoundChakram = PlayerWeapon.CHAKRAM,
	RoundChakramInMotion = PlayerWeapon.CHAKRAM,
	StaffWooden = PlayerWeapon.STAFF,
	OblivionOrb = PlayerWeapon.STAFF_OBLIVION_ORB,
	SteelHelm = PlayerArmor.PLATE_HELM,
	FanChakramInMotion = PlayerWeapon.SHURIKEN,
	StreetShirt = PlayerArmor.STREET_SHIRT,
	CrossBow = PlayerWeapon.CROSSBOW,
	BattleAxe = PlayerWeapon.AXE,
	PlateLeggings = PlayerArmor.PLATE_LEGGINGS,
	ConjurerHelm = PlayerArmor.CONJURER_HELM,
	Bow = PlayerWeapon.BOW,
	FireStormWand = PlayerWeapon.STAFF_TRIPLE_FIREBALL,
	WarHammer = PlayerWeapon.HAMMER,
	ChainCoif = PlayerArmor.CHAIN_COIF,
	MedievalShirt = PlayerArmor.MEDIEVAL_SHIRT,
	StreetPants = PlayerArmor.STREET_PANTS,
	ChainLeggings = PlayerArmor.CHAIN_LEGGINGS,
	StreetSneakers = PlayerArmor.STREET_SNEAKERS,
	SulphorousShowerWand = PlayerWeapon.STAFF_SULPHOROUS_SHOWER,
	MedievalPants = PlayerArmor.MEDIEVAL_PANTS,
	LeatherArmoredBoots = PlayerArmor.LEATHER_ARMORED_BOOTS,
	DeathRayWand = PlayerWeapon.STAFF_DEATH_RAY,
	FanChakram = PlayerWeapon.SHURIKEN,
	OblivionHeart = PlayerWeapon.STAFF_OBLIVION_HEART,
	OrnateHelm = PlayerArmor.ORNATE_HELM,
	Longsword = PlayerWeapon.LONG_SWORD,
	InfinitePainWand = PlayerWeapon.STAFF_FORCE_OF_NATURE,
	OblivionHalberd = PlayerWeapon.STAFF_OBLIVION_HALBERD,
	PlateArms = PlayerArmor.PLATE_ARMS,
	WoodenShield = PlayerArmor.ROUND_SHIELD 
}

ItemNameToSequenceName = {
	LesserFireballWand = "STAFF_FIREBALL",
	LeatherBoots = "LEATHER_BOOTS",
	WeakArcherArrow = "",
	WizardRobe = "WIZARD_ROBE",
	Breastplate = "PLATE_BREAST",
	GreatSword = "GREAT_SWORD",
	SulphorousFlareWand = "STAFF_SULPHOROUS_FLARE",
	LeatherArmbands = "LEATHER_ARMBANDS",
	LeatherArmor = "LEATHER_TUNIC",
	ForceWand = "STAFF_LIGHTNING",
	LeatherHelm = "LEATHER_HELM",
	Sword = "SWORD",
	OgreAxe = "OGRE_AXE",
	MedievalCloak = "MEDIEVAL_CLOAK",
	LeatherLeggings = "LEATHER_LEGGINGS",
	OblivionWierdling = "STAFF_OBLIVION_WIERDLING",
	SteelShield = "KITE_SHIELD",
	MorningStar = "MACE",
	Flag = "FLAG",
	ChainTunic = "CHAIN_TUNIC",
	WizardHelm = "WIZARD_HELM",
	Quiver = "QUIVER",
	PlateBoots = "PLATE_BOOTS",
	RoundChakram = "CHAKRAM",
	RoundChakramInMotion = "CHAKRAM",
	StaffWooden = "STAFF",
	OblivionOrb = "STAFF_OBLIVION_ORB",
	SteelHelm = "PLATE_HELM",
	ArcherArrow = "",
	FanChakramInMotion = "SHURIKEN",
	StreetShirt = "STREET_SHIRT",
	CrossBow = "CROSSBOW",
	BattleAxe = "AXE",
	PlateLeggings = "PLATE_LEGGINGS",
	ConjurerHelm = "CONJURER_HELM",
	Bow = "BOW",
	FireStormWand = "STAFF_TRIPLE_FIREBALL",
	WarHammer = "HAMMER",
	ChainCoif = "CHAIN_COIF",
	MedievalShirt = "MEDIEVAL_SHIRT",
	StreetPants = "STREET_PANTS",
	ChainLeggings = "CHAIN_LEGGINGS",
	StreetSneakers = "STREET_SNEAKERS",
	SulphorousShowerWand = "STAFF_SULPHOROUS_SHOWER",
	MedievalPants = "MEDIEVAL_PANTS",
	LeatherArmoredBoots = "LEATHER_ARMORED_BOOTS",
	DeathRayWand = "STAFF_DEATH_RAY",
	FanChakram = "SHURIKEN",
	OblivionHeart = "STAFF_OBLIVION_HEART",
	OrnateHelm = "ORNATE_HELM",
	Longsword = "LONG_SWORD",
	InfinitePainWand = "STAFF_FORCE_OF_NATURE",
	OblivionHalberd = "STAFF_OBLIVION_HALBERD",
	PlateArms = "PLATE_ARMS",
	WoodenShield = "ROUND_SHIELD"
}


local function equipmentFromName(name)
	local obj = NoxBaseObject.new(name)
	return obj

	--[[local db = ModDB.Mods[name]
	local obj = {}
	obj.sequenceid = ItemNameToSequenceID[name]
	obj.sequencename = ItemNameToSequenceName[name]
	obj.Name = name
	obj.type = db.type
	obj.isequiped = false
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

	return obj--]]
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

	obj.player.inventory = table.prealloc(80)

	obj.player.inventorySlots = 80

	local eq = equipmentFromName("PlateBoots")
	eq.isequiped = true
	obj.player.inventory[1] = eq

	eq = equipmentFromName("PlateLeggings")
	eq.isequiped = true
	obj.player.inventory[2] = eq

	eq = equipmentFromName("PlateArms")
	eq.isequiped = true
	obj.player.inventory[3] = eq

	eq = equipmentFromName("Breastplate")
	eq.isequiped = true
	obj.player.inventory[4] = eq

	eq = equipmentFromName("WarHammer")
	eq.isequiped = true
	obj.player.inventory[5] = eq
	
	eq = equipmentFromName("MedievalCloak")
	eq.isequiped = true
	obj.player.inventory[6] = eq


	eq = equipmentFromName("MedievalCloak")
	for i = 10, obj.player.inventorySlots do
		obj.player.inventory[i] = eq
	end

	--[[table.insert(obj.player.equipment, {
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
