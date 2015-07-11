
function GLOBAL()
	if true then return end
end
function GLOBAL()
	if true then return end
end
function DisableElevators()
	DisableObject(Gvar_24)
	DisableObject(Gvar_25)
	DisableObject(Gvar_26)
	DisableObject(Gvar_27)
	DisableObject(Gvar_28)
	DisableObject(Gvar_29)
	if true then return end
end
function EnableSkeletons()
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterSetAggressiveness(Gvar_31,0.83)
	MonsterSetAggressiveness(Gvar_32,0.83)
	MonsterSetAggressiveness(Gvar_33,0.83)
	MonsterSetAggressiveness(Gvar_34,0.83)
	MonsterSetAggressiveness(Gvar_35,0.83)
	if true then return end
end
function BreakWalls1()
	OpenSecretWallGroup(Gvar_4)
	if true then return end
end
function EnableElevators1()
	EnableObject(Gvar_24)
	EnableObject(Gvar_25)
	EnableObject(Gvar_26)
	EnableObject(Gvar_27)
	EnableObject(Gvar_28)
	EnableObject(Gvar_29)
	WaitFrames(20,6)
	EnableSkeletons()
	if true then return end
end
function SkeletonGoal()
	MoveTo(Gvar_30,Gvar_51)
	MoveTo(Gvar_31,Gvar_51)
	MoveTo(Gvar_32,Gvar_51)
	MoveTo(Gvar_33,Gvar_51)
	MoveTo(Gvar_34,Gvar_51)
	MoveTo(Gvar_35,Gvar_51)
	if true then return end
end
function EndTrap1()
	MoveTo(Gvar_9,Gvar_41)
	MoveTo(Gvar_10,Gvar_42)
	MoveTo(Gvar_11,Gvar_43)
	MoveTo(Gvar_12,Gvar_44)
	DisableObject(Gvar_36)
	AudioEvent("EarthRumbleMinor",Gvar_37)
	AudioEvent("SecretWallSecret",Gvar_37)
	if true then return end
end
function OpenGates()
	OpenSecretWall(GetWallAt(96,208))
	OpenSecretWall(GetWallAt(95,209))
	OpenSecretWall(GetWallAt(94,210))
	if true then return end
end
function CloseBlocks()
	MoveTo(Gvar_7,Gvar_45)
	MoveTo(Gvar_8,Gvar_46)
	AudioEvent("BoulderMove",Gvar_38)
	AudioEvent("EarthRumbleMinor",Gvar_38)
	AudioEvent("SecretWallOpen",Gvar_38)
	AudioEvent("StoneBlockMove",Gvar_38)
	if true then return end
end
function OpenBlocks()
	DisableObject(Trigger)
	MoveTo(Gvar_7,Gvar_39)
	MoveTo(Gvar_8,Gvar_40)
	AudioEvent("BoulderMove",Gvar_38)
	AudioEvent("EarthRumbleMinor",Gvar_38)
	AudioEvent("SecretWallOpen",Gvar_38)
	AudioEvent("StoneBlockMove",Gvar_38)
	if true then return end
end
function Trap1()
	DisableObject(Gvar_13)
	DisableObject(Gvar_14)
	DisableObject(Gvar_15)
	DisableObject(Gvar_16)
	DisableObject(Gvar_17)
	MoveTo(Gvar_9,Gvar_47)
	MoveTo(Gvar_10,Gvar_48)
	MoveTo(Gvar_11,Gvar_49)
	MoveTo(Gvar_12,Gvar_50)
	AudioEvent("EarthRumbleMajor",Gvar_50)
	WaitSeconds(1,4)
	WaitSeconds(2,5)
	PlayMusic(27,100)
	if true then return end
end
function CloseBlocks2()
	MoveTo(Gvar_7,Gvar_45)
	MoveTo(Gvar_8,Gvar_46)
	MoveTo(Gvar_9,Gvar_47)
	MoveTo(Gvar_10,Gvar_48)
	if true then return end
end
function LockCellDoors()
	LockDoor(Gvar_73)
	LockDoor(Gvar_74)
	LockDoor(Gvar_75)
	LockDoor(Gvar_76)
	LockDoor(Gvar_77)
	LockDoor(Gvar_78)
	LockDoor(Gvar_79)
	LockDoor(Gvar_80)
	LockDoor(Gvar_81)
	LockDoor(Gvar_82)
	LockDoor(Gvar_83)
	LockDoor(Gvar_84)
	if true then return end
end
function EnableSpikes()
	MoveTo(Gvar_86,Gvar_113)
	MoveTo(Gvar_87,Gvar_114)
	MoveTo(Gvar_88,Gvar_115)
	MoveTo(Gvar_89,Gvar_116)
	MoveTo(Gvar_90,Gvar_117)
	MoveTo(Gvar_91,Gvar_118)
	MoveTo(Gvar_92,Gvar_119)
	MoveTo(Gvar_93,Gvar_120)
	MoveTo(Gvar_94,Gvar_121)
	MoveTo(Gvar_95,Gvar_122)
	MoveTo(Gvar_96,Gvar_123)
	MoveTo(Gvar_97,Gvar_124)
	WaitFrames(50,15)
	if true then return end
end
function DisableSpikes()
	MoveTo(Gvar_86,Gvar_101)
	MoveTo(Gvar_87,Gvar_102)
	MoveTo(Gvar_88,Gvar_103)
	MoveTo(Gvar_89,Gvar_104)
	MoveTo(Gvar_90,Gvar_105)
	MoveTo(Gvar_91,Gvar_106)
	MoveTo(Gvar_92,Gvar_107)
	MoveTo(Gvar_93,Gvar_108)
	MoveTo(Gvar_94,Gvar_109)
	MoveTo(Gvar_95,Gvar_110)
	MoveTo(Gvar_96,Gvar_111)
	MoveTo(Gvar_97,Gvar_112)
	WaitFrames(50,14)
	if true then return end
end
function EnableGears()
	EnableObject(Gvar_64)
	EnableObject(Gvar_65)
	WaitSeconds(2,17)
	if true then return end
end
function DisableGears()
	DisableObject(Gvar_64)
	DisableObject(Gvar_65)
	if true then return end
end
function KillSkeleton7()
	DamageObject(Gvar_72,0,1000,0)
	if true then return end
end
function MaidenDeath()
	PrintToAll("War05B.scr:MaidenDeath")
	DeathScreen(5)
	if true then return end
end
function LetterBoxOff()
	CinematicBorders(false)
	if true then return end
end
function PlayerDeath()
	PrintToAll("War05A.scr:PlayerDeath")
	CinematicFade()
	WaitFrames(30,31)
	if true then return end
end
function SpikeNoise1()
	AudioEvent("EarthRumbleMajor",Gvar_122)
	AudioEvent("EarthRumbleMajor",Gvar_116)
	WaitFrames(60,22)
	if true then return end
end
function MapInitialize()
	Gvar_136 = WaypointFromName("Secret01WP")
	Gvar_137 = WaypointFromName("Secret02WP")
	Gvar_52 = ObjGroupFromName("BatEntryGroup")
	Gvar_58 = ObjFromName("Bear1")
	Gvar_98 = ObjFromName("Ogre1")
	Gvar_99 = ObjFromName("Ogre2")
	Gvar_63 = WallGroupFromName("ScorpionWallGroup")
	Gvar_7 = ObjFromName("Block1")
	Gvar_8 = ObjFromName("Block2")
	Gvar_9 = ObjFromName("Block3")
	Gvar_10 = ObjFromName("Block4")
	Gvar_11 = ObjFromName("Block5")
	Gvar_12 = ObjFromName("Block6")
	Gvar_18 = ObjFromName("BlockMover1")
	Gvar_19 = ObjFromName("BlockMover2")
	Gvar_20 = ObjFromName("BlockMover3")
	Gvar_21 = ObjFromName("BlockMover4")
	Gvar_22 = ObjFromName("BlockMover5")
	Gvar_23 = ObjFromName("BlockMover6")
	Gvar_132 = ObjFromName("SilverKeyTrigger1")
	Gvar_133 = ObjFromName("SilverKeyTrigger2")
	Gvar_134 = ObjFromName("SilverKeyTrigger3")
	Gvar_135 = ObjFromName("SilverKeyTrigger4")
	Gvar_100 = WallGroupFromName("SilverKeyWallGroup")
	Gvar_126 = ObjFromName("Grunt1")
	Gvar_127 = ObjFromName("Grunt2")
	Gvar_128 = ObjFromName("Grunt3")
	Gvar_129 = ObjFromName("Grunt4")
	Gvar_4 = WallGroupFromName("AmbushWallGroup")
	Gvar_66 = ObjFromName("Pit1")
	Gvar_67 = ObjFromName("Pit2")
	Gvar_68 = ObjFromName("Pit3")
	Gvar_69 = ObjFromName("Pit4")
	Gvar_70 = ObjFromName("Pit5")
	Gvar_71 = ObjFromName("Pit6")
	Gvar_24 = ObjFromName("Elevator1")
	Gvar_25 = ObjFromName("Elevator2")
	Gvar_26 = ObjFromName("Elevator3")
	Gvar_27 = ObjFromName("Elevator4")
	Gvar_28 = ObjFromName("Elevator5")
	Gvar_29 = ObjFromName("Elevator6")
	Gvar_30 = ObjFromName("Skeleton1")
	Gvar_31 = ObjFromName("Skeleton2")
	Gvar_32 = ObjFromName("Skeleton3")
	Gvar_33 = ObjFromName("Skeleton4")
	Gvar_34 = ObjFromName("Skeleton5")
	Gvar_35 = ObjFromName("Skeleton6")
	Gvar_72 = ObjFromName("Skeleton7")
	Gvar_36 = ObjFromName("EndTrapTrigger")
	Gvar_64 = ObjFromName("Gear1")
	Gvar_65 = ObjFromName("Gear2")
	Gvar_13 = ObjFromName("Plate1")
	Gvar_14 = ObjFromName("Plate2")
	Gvar_15 = ObjFromName("Plate3")
	Gvar_16 = ObjFromName("Plate4")
	Gvar_17 = ObjFromName("Plate5")
	Gvar_86 = ObjFromName("Spike1")
	Gvar_87 = ObjFromName("Spike2")
	Gvar_88 = ObjFromName("Spike3")
	Gvar_89 = ObjFromName("Spike4")
	Gvar_90 = ObjFromName("Spike5")
	Gvar_91 = ObjFromName("Spike6")
	Gvar_92 = ObjFromName("Spike7")
	Gvar_93 = ObjFromName("Spike8")
	Gvar_94 = ObjFromName("Spike9")
	Gvar_95 = ObjFromName("Spike10")
	Gvar_96 = ObjFromName("Spike11")
	Gvar_97 = ObjFromName("Spike12")
	Gvar_73 = ObjFromName("CellDoor1")
	Gvar_74 = ObjFromName("CellDoor2")
	Gvar_75 = ObjFromName("CellDoor3")
	Gvar_76 = ObjFromName("CellDoor4")
	Gvar_77 = ObjFromName("CellDoor5")
	Gvar_78 = ObjFromName("CellDoor6")
	Gvar_79 = ObjFromName("CellDoor7")
	Gvar_80 = ObjFromName("CellDoor8")
	Gvar_81 = ObjFromName("CellDoor9")
	Gvar_82 = ObjFromName("CellDoor10")
	Gvar_83 = ObjFromName("CellDoor11")
	Gvar_84 = ObjFromName("CellDoor12")
	Gvar_85 = ObjFromName("CellLever")
	Gvar_39 = WaypointFromName("BlockOpen1")
	Gvar_45 = WaypointFromName("BlockClosed1")
	Gvar_40 = WaypointFromName("BlockOpen2")
	Gvar_46 = WaypointFromName("BlockClosed2")
	Gvar_41 = WaypointFromName("BlockOpen3")
	Gvar_47 = WaypointFromName("BlockClosed3")
	Gvar_42 = WaypointFromName("BlockOpen4")
	Gvar_48 = WaypointFromName("BlockClosed4")
	Gvar_43 = WaypointFromName("BlockOpen5")
	Gvar_49 = WaypointFromName("BlockClosed5")
	Gvar_44 = WaypointFromName("BlockOpen6")
	Gvar_50 = WaypointFromName("BlockClosed6")
	Gvar_130 = WaypointFromName("Gates1WP")
	Gvar_131 = WaypointFromName("Gates2WP")
	Gvar_5 = WallGroupFromName("Gates1")
	Gvar_6 = WallGroupFromName("Gates2")
	Gvar_38 = WaypointFromName("BlockAudio1WP")
	Gvar_101 = WaypointFromName("Spike1Open")
	Gvar_102 = WaypointFromName("Spike2Open")
	Gvar_103 = WaypointFromName("Spike3Open")
	Gvar_104 = WaypointFromName("Spike4Open")
	Gvar_105 = WaypointFromName("Spike5Open")
	Gvar_106 = WaypointFromName("Spike6Open")
	Gvar_107 = WaypointFromName("Spike7Open")
	Gvar_108 = WaypointFromName("Spike8Open")
	Gvar_109 = WaypointFromName("Spike9Open")
	Gvar_110 = WaypointFromName("Spike10Open")
	Gvar_111 = WaypointFromName("Spike11Open")
	Gvar_112 = WaypointFromName("Spike12Open")
	Gvar_113 = WaypointFromName("Spike1Closed")
	Gvar_114 = WaypointFromName("Spike2Closed")
	Gvar_115 = WaypointFromName("Spike3Closed")
	Gvar_116 = WaypointFromName("Spike4Closed")
	Gvar_117 = WaypointFromName("Spike5Closed")
	Gvar_118 = WaypointFromName("Spike6Closed")
	Gvar_119 = WaypointFromName("Spike7Closed")
	Gvar_120 = WaypointFromName("Spike8Closed")
	Gvar_121 = WaypointFromName("Spike9Closed")
	Gvar_122 = WaypointFromName("Spike10Closed")
	Gvar_123 = WaypointFromName("Spike11Closed")
	Gvar_124 = WaypointFromName("Spike12Closed")
	Gvar_51 = WaypointFromName("SkeletonGoal")
	Gvar_37 = WaypointFromName("EndTrapAudioWP")
	OpenGates()
	CloseBlocks()
	LockCellDoors()
	KillSkeleton7()
	MoveTo(Gvar_11,Gvar_49)
	MoveTo(Gvar_12,Gvar_50)
	EnableSpikes()
	if true then return end
end
function BatsHostilize()
	MonsterGroupSetAggressiveness(Gvar_52,0.83)
	if true then return end
end
function BearHostilize()
	MonsterSetAggressiveness(Gvar_58,0.83)
	if true then return end
end
function OgresHostilize()
	MonsterSetAggressiveness(Gvar_98,0.83)
	MonsterSetAggressiveness(Gvar_99,0.83)
	if true then return end
end
function DestroyWalls()
	BreakWallGroup(Gvar_63)
	MonsterGoFight(Gvar_59,GetHostPlayer())
	MonsterGoFight(Gvar_60,GetHostPlayer())
	MonsterGoFight(Gvar_61,GetHostPlayer())
	if true then return end
end
function OpenCellDoors()
	UnlockDoor(Gvar_73)
	UnlockDoor(Gvar_74)
	UnlockDoor(Gvar_75)
	UnlockDoor(Gvar_76)
	UnlockDoor(Gvar_77)
	UnlockDoor(Gvar_78)
	UnlockDoor(Gvar_79)
	UnlockDoor(Gvar_80)
	UnlockDoor(Gvar_81)
	UnlockDoor(Gvar_82)
	UnlockDoor(Gvar_83)
	UnlockDoor(Gvar_84)
	DisableObject(Gvar_85)
	EnableGears()
	if true then return end
end
function ToggleGates1()
	AudioEvent("FireBallExplode",Gvar_130)
	OpenSecretWallGroup(Gvar_5)
	if true then return end
end
function ToggleGates2()
	AudioEvent("FireBallExplode",Gvar_131)
	OpenSecretWallGroup(Gvar_6)
	if true then return end
end
function ChapterFail2()
	CancelEnchant(GetHostPlayer(),"ENCHANT_INVULNERABLE")
	DeathScreen(5)
	if true then return end
end
function SilverKeyTrap()
	DisableObject(Gvar_132)
	DisableObject(Gvar_133)
	DisableObject(Gvar_134)
	DisableObject(Gvar_135)
	BreakWallGroup(Gvar_100)
	MonsterSetAggressiveness(Gvar_126,0.83)
	MonsterSetAggressiveness(Gvar_127,0.83)
	MonsterSetAggressiveness(Gvar_128,0.83)
	MonsterSetAggressiveness(Gvar_129,0.83)
	if true then return end
end
function MapEntry()
	CinematicFadeout()
	LetterBoxOff()
	ObjFreeze(GetHostPlayer(),false)
	if not JournalSetQuest("MaidensRescued") == 1 then 
		goto l105
	end
	Gvar_53 = ObjFromName("War05B:W5Maiden1")
	Gvar_54 = ObjFromName("War05B:W5Maiden2")
	Gvar_55 = ObjFromName("War05B:W5Maiden3")
	Gvar_56 = ObjFromName("War05B:W5Maiden4")
	Gvar_57 = ObjFromName("War05B:W5Sister")
	MonsterEventScript(Gvar_53,5,19)
	MonsterEventScript(Gvar_54,5,19)
	MonsterEventScript(Gvar_55,5,19)
	MonsterEventScript(Gvar_56,5,19)
	MonsterEventScript(Gvar_57,5,19)
	::l105::
	if true then return end
end
function PlaySubMusic()
	PlayMusic(20,100)
	if true then return end
end
function MonsterGoHome()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) == true then 
		goto l18
	end
	MonsterGotoHome(Caller)
	::l18::
	if true then return end
end
function Secret01()
	AudioEvent("SecretFound",Gvar_136)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	if true then return end
end
function Secret02()
	AudioEvent("SecretFound",Gvar_137)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end