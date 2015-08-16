
AnimationDirection = {
	NW = 0,
	N = 1,
	NE = 2,
	W = 3,
	E = 4,
	SW = 5,
	S = 6,
	SE = 7
}

AnimationDirectionConversion = {
	AnimationDirection.N,
	AnimationDirection.NE,
	AnimationDirection.E,
	AnimationDirection.SE,
	AnimationDirection.S,
	AnimationDirection.SW,
	AnimationDirection.W,
	AnimationDirection.NW
}

TileEdgeDirection =
{
	SW_Tip = 0,
	West = 1,
	West_02 = 2,
	West_03 = 3,
	NW_Tip = 4,
	South = 5,
	North = 6,
	South_07 = 7,
	North_08 = 8,
	South_09 = 9,
	North_0A = 10,
	SE_Tip = 11,
	East = 12,
	East_D = 13,
	East_E = 14,
	NE_Tip = 15,
	SW_Sides = 16,
	NW_Sides = 17,
	NE_Sides = 18,
	SE_Sid = 19
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

PlayerArmorIds =
{
	0,
	0x4C0F,
	0x2090D0,
	0x3CC02,
	0x0FC0000,
	0x3000,
	0x1C1,
	0x23C,
	0x3000000,
	0x4,
	0x8,
	0x1,
	0x40,
	0x80,
	0x100,
	0x10,
	0x20,
	0x200,
	0x400,
	0x800,
	0x4000,
	0x8000,
	0x10000,
	0x20000,
	0x1000,
	0x2000,
	0x2,
	0x1000000,
	0x2000000,
	0x40000,
	0x80000,
	0x100000,
	0x200000,
	0x400000,
	0x800000
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

PlayerWeaponIds = 
{
	0x0,
	0x7FFFFFE,
	0x47F0000,
	0x7FF8000,
	0x47F00FE,
	0x1,
	0x2,
	0x4,
	0x8,
	0x10,
	0x20,
	0x40,
	0x80,
	0x100,
	0x200,
	0x400,
	0x800,
	0x1000,
	0x2000,
	0x4000,
	0x8000,
	0x10000,
	0x20000,
	0x40000,
	0x80000,
	0x100000,
	0x200000,
	0x400000,
	0x800000,
	0x1000000,
	0x2000000,
	0x4000000
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


armorSlots = 
{
	"BOOTS",
	"ARM_ARMOR",
	"BREASTPLATE",
	"HELMET",
	"LEG_ARMOR",
	"PANTS",
	"SHIRT",
	"BACK",
	"SHIELD"
}

monsterDirectionConversion = 
{
	North = 0,
	NorthEast = math.pi / 4,
	East = math.pi / 2,
	SouthEast = math.pi / 4 + math.pi / 2,
	South = math.pi,
	SouthWest = math.pi + math.pi / 4,
	West = math.pi + math.pi / 2,
	NorthWest = math.pi + math.pi / 2 + math.pi / 4
}

chestDirectionConversion = 
{
	CHEST_NE = math.pi / 4,
	CHEST_SE = math.pi / 4 + math.pi / 2,
	CHEST_SW = math.pi + math.pi / 4,
	CHEST_NW = math.pi + math.pi / 2 + math.pi / 4
}