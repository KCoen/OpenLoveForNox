
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_38 = false
	Gvar_39 = false
	Gvar_40 = false
	Gvar_41 = false
	Gvar_105 = false
	Gvar_112 = 0
	Gvar_113 = 0
	if true then return end
end
function LightShow()
	TeleportWaypoint(Gvar_35,GetObjX(Gvar_4),GetObjY(Gvar_4))
	var_0 = RandomInteger(1,8)
	var_1 = var_0
	if var_1 == 1 then 
		goto l98
	end
	if var_1 == 2 then 
		goto l131
	end
	if var_1 == 3 then 
		goto l164
	end
	if var_1 == 4 then 
		goto l197
	end
	if var_1 == 5 then 
		goto l230
	end
	if var_1 == 6 then 
		goto l263
	end
	if var_1 == 7 then 
		goto l296
	end
	if var_1 == 8 then 
		goto l329
	end
	goto l362
	::l98::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_6),GetObjY(Gvar_6),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l131::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_7),GetObjY(Gvar_7),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l164::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_8),GetObjY(Gvar_8),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l197::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_9),GetObjY(Gvar_9),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l230::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_10),GetObjY(Gvar_10),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l263::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_11),GetObjY(Gvar_11),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l296::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_12),GetObjY(Gvar_12),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l329::
	AudioEvent("LightningBolt",Gvar_35)
	PlayFX("LIGHTNING",GetObjX(Gvar_13),GetObjY(Gvar_13),GetObjX(Gvar_4),GetObjY(Gvar_4))
	goto l362
	::l362::
	if not Gvar_41 == false then 
		goto l377
	end
	WaitFrames(30,2)
	::l377::
	if true then return end
end
function PlateOneTrigger()
	Gvar_38 = true
	if not Gvar_39 == true and Gvar_40 == true then 
		goto l49
	end
	OpenSecretWallGroup(Gvar_36)
	TeleportWaypoint(Gvar_35,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BigGong",Gvar_35)
	::l49::
	if true then return end
end
function PlateTwoTrigger()
	Gvar_39 = true
	if not Gvar_38 == true and Gvar_40 == true then 
		goto l49
	end
	OpenSecretWallGroup(Gvar_36)
	TeleportWaypoint(Gvar_35,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BigGong",Gvar_35)
	::l49::
	if true then return end
end
function PlateThreeTrigger()
	Gvar_40 = true
	if not Gvar_38 == true and Gvar_39 == true then 
		goto l49
	end
	OpenSecretWallGroup(Gvar_36)
	TeleportWaypoint(Gvar_35,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BigGong",Gvar_35)
	::l49::
	if true then return end
end
function PlateOneRelease()
	Gvar_38 = false
	if true then return end
end
function PlateTwoRelease()
	Gvar_39 = false
	if true then return end
end
function PlateThreeRelease()
	Gvar_40 = false
	if true then return end
end
function HONTrigger()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l205
	end
	DisableObject(Gvar_4)
	DisableObject(Gvar_5)
	DisableObject(Gvar_14)
	DisableObject(Gvar_15)
	DisableObject(Gvar_16)
	DisableObject(Gvar_17)
	DisableObject(Gvar_18)
	DisableObject(Gvar_19)
	DisableObject(Gvar_20)
	DisableObject(Gvar_21)
	DisableObject(Gvar_22)
	DisableObject(Gvar_23)
	TeleportObj(Gvar_24,Gvar_42,Gvar_52)
	TeleportObj(Gvar_25,Gvar_43,Gvar_53)
	TeleportObj(Gvar_26,Gvar_44,Gvar_54)
	TeleportObj(Gvar_27,Gvar_45,Gvar_55)
	TeleportObj(Gvar_28,Gvar_46,Gvar_56)
	TeleportObj(Gvar_29,Gvar_47,Gvar_57)
	TeleportObj(Gvar_30,Gvar_48,Gvar_58)
	TeleportObj(Gvar_31,Gvar_49,Gvar_59)
	TeleportObj(Gvar_32,Gvar_50,Gvar_60)
	TeleportObj(Gvar_33,Gvar_51,Gvar_61)
	Gvar_41 = true
	SetOblivionStatus(1)
	PrintToAll("Con07H.scr:HONTada")
	JournalUpdateEntry(GetHostPlayer(),"GetHON",4)
	WaitSeconds(2,11)
	::l205::
	if true then return end
end
function MakeMapSwitch()
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),1922,2014)
	if true then return end
end
function FadeOut()
	CinematicFade()
	ObjFreeze(GetHostPlayer(),true)
	PlayMusic(0,100)
	WaitFrames(60,10)
	if true then return end
end
function HONSetup()
	Gvar_42 = GetObjX(Gvar_14)
	Gvar_43 = GetObjX(Gvar_15)
	Gvar_44 = GetObjX(Gvar_16)
	Gvar_45 = GetObjX(Gvar_17)
	Gvar_46 = GetObjX(Gvar_18)
	Gvar_47 = GetObjX(Gvar_19)
	Gvar_48 = GetObjX(Gvar_20)
	Gvar_49 = GetObjX(Gvar_21)
	Gvar_50 = GetObjX(Gvar_22)
	Gvar_51 = GetObjX(Gvar_23)
	Gvar_52 = GetObjY(Gvar_14)
	Gvar_53 = GetObjY(Gvar_15)
	Gvar_54 = GetObjY(Gvar_16)
	Gvar_55 = GetObjY(Gvar_17)
	Gvar_56 = GetObjY(Gvar_18)
	Gvar_57 = GetObjY(Gvar_19)
	Gvar_58 = GetObjY(Gvar_20)
	Gvar_59 = GetObjY(Gvar_21)
	Gvar_60 = GetObjY(Gvar_22)
	Gvar_61 = GetObjY(Gvar_23)
	if true then return end
end
function CreatureSetup()
	if true then return end
end
function Group1Die()
	Gvar_112 = Gvar_112 + 1
	if not Gvar_112 >= 2 then 
		goto l24
	end
	UnlockDoor(Gvar_86)
	UnlockDoor(Gvar_87)
	::l24::
	if true then return end
end
function StartChamber()
	AudioEvent("FloorSpikesUp",Gvar_110)
	AudioEvent("FloorSpikesDown",Gvar_109)
	EnableObjectGroup(Gvar_97)
	EnableObjectGroup(Gvar_99)
	DisableObjectGroup(Gvar_96)
	DisableObjectGroup(Gvar_98)
	Gvar_105 = true
	WaitSeconds(3,16)
	if true then return end
end
function ChamberSpikes()
	if not Gvar_105 == false then 
		goto l34
	end
	AudioEvent("FloorSpikesDown",Gvar_109)
	DisableObjectGroup(Gvar_96)
	DisableObjectGroup(Gvar_98)
	WaitFrames(10,19)
	goto l57
	::l34::
	AudioEvent("FloorSpikesDown",Gvar_110)
	DisableObjectGroup(Gvar_97)
	DisableObjectGroup(Gvar_99)
	WaitFrames(10,20)
	::l57::
	Gvar_111 = WaitSeconds(3,16)
	if true then return end
end
function Block1Jiggle()
	TeleportWaypoint(Gvar_35,GetObjX(Gvar_93),GetObjY(Gvar_93))
	AudioEvent("HammerMissing",Gvar_35)
	PlayFX("JIGGLE",GetObjX(Gvar_93),GetObjY(Gvar_93),10,0)
	if true then return end
end
function Block2Jiggle()
	AudioEvent("HammerMissing",Gvar_106)
	PlayFX("JIGGLE",GetObjX(Gvar_94),GetObjY(Gvar_94),10,0)
	if true then return end
end
function EnableSpikes2And4()
	AudioEvent("FloorSpikesUp",Gvar_110)
	EnableObjectGroup(Gvar_97)
	EnableObjectGroup(Gvar_99)
	Gvar_105 = true
	if true then return end
end
function EnableSpikes1And3()
	AudioEvent("FloorSpikesUp",Gvar_109)
	EnableObjectGroup(Gvar_96)
	EnableObjectGroup(Gvar_98)
	Gvar_105 = false
	if true then return end
end
function SetTraitors()
	DisableObjectGroup(Gvar_104)
	AudioEvent("TeleportIn",Gvar_107)
	AudioEvent("TeleportIn",Gvar_108)
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_107),GetWaypointY(Gvar_107),0,0)
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_108),GetWaypointY(Gvar_108),0,0)
	PlayFX("SPARK_EXPLOSION",GetWaypointX(Gvar_107),GetWaypointY(Gvar_107),0,0)
	PlayFX("SPARK_EXPLOSION",GetWaypointX(Gvar_108),GetWaypointY(Gvar_108),0,0)
	TeleportObj(Gvar_65,GetWaypointX(Gvar_107),GetWaypointY(Gvar_107))
	TeleportObj(Gvar_66,GetWaypointX(Gvar_108),GetWaypointY(Gvar_108))
	EnableObject(Gvar_65)
	EnableObject(Gvar_66)
	LockDoor(Gvar_67)
	LockDoor(Gvar_68)
	if true then return end
end
function HaltMusic()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l17
	end
	DisableObject(Trigger)
	PlayMusic(0,100)
	::l17::
	if true then return end
end
function NewMusic()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l17
	end
	DisableObject(Trigger)
	PlayMusic(1,100)
	::l17::
	if true then return end
end
function TraitorDeath()
	Gvar_113 = Gvar_113 + 1
	if not Gvar_113 >= 2 then 
		goto l20
	end
	PlayerGiveExp(GetHostPlayer(),2000)
	::l20::
	if true then return end
end
function LockStairGate()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l22
	end
	DisableObject(Trigger)
	LockDoor(Gvar_69)
	PlayMusic(28,100)
	::l22::
	if true then return end
end
function MapInitialize()
	Gvar_70 = ObjFromName("SnakeHead1Mover")
	Gvar_71 = ObjFromName("SnakeHead2Mover")
	Gvar_72 = ObjFromName("SnakeHead3Mover")
	Gvar_73 = ObjFromName("SnakeHead4Mover")
	Gvar_74 = ObjFromName("SnakeHead5Mover")
	Gvar_75 = ObjFromName("SnakeHead6Mover")
	Gvar_76 = ObjFromName("SnakeHead7Mover")
	Gvar_77 = ObjFromName("SnakeHead8Mover")
	Gvar_78 = ObjFromName("SnakeHead9Mover")
	Gvar_79 = ObjFromName("SnakeHead10Mover")
	Gvar_80 = ObjFromName("SnakeHead11Mover")
	Gvar_81 = ObjFromName("SnakeHead12Mover")
	Gvar_82 = ObjFromName("Block1AMover")
	Gvar_83 = ObjFromName("Block1BMover")
	Gvar_84 = ObjFromName("Block2AMover")
	Gvar_85 = ObjFromName("Block2BMover")
	Gvar_62 = ObjFromName("ToLevelOneTP")
	Gvar_92 = ObjFromName("ToThreeTP")
	Gvar_65 = ObjFromName("Traitor1")
	Gvar_66 = ObjFromName("Traitor2")
	Gvar_67 = ObjFromName("TraitorDoor1")
	Gvar_68 = ObjFromName("TraitorDoor2")
	Gvar_93 = ObjFromName("Block1Trigger")
	Gvar_94 = ObjFromName("Block2Trigger")
	Gvar_69 = ObjFromName("StairGate")
	Gvar_86 = ObjFromName("ChamberDoor1")
	Gvar_87 = ObjFromName("ChamberDoor2")
	Gvar_88 = ObjFromName("ChamberDoor2A")
	Gvar_89 = ObjFromName("ChamberDoor2B")
	Gvar_90 = ObjFromName("ChamberExitDoor1")
	Gvar_91 = ObjFromName("ChamberExitDoor2")
	Gvar_96 = ObjGroupFromName("ChamberSpikes1")
	Gvar_97 = ObjGroupFromName("ChamberSpikes2")
	Gvar_98 = ObjGroupFromName("ChamberSpikes3")
	Gvar_99 = ObjGroupFromName("ChamberSpikes4")
	Gvar_100 = ObjGroupFromName("SnakeLetterMovers")
	Gvar_101 = ObjGroupFromName("Snake3Movers")
	Gvar_102 = ObjGroupFromName("Snake4Movers")
	Gvar_103 = ObjGroupFromName("ShowdownTriggers")
	Gvar_35 = WaypointFromName("PlayerSounds")
	Gvar_106 = WaypointFromName("Jiggle2WP")
	Gvar_107 = WaypointFromName("Traitor1WP")
	Gvar_108 = WaypointFromName("Traitor2WP")
	Gvar_109 = WaypointFromName("Spikes1WP")
	Gvar_110 = WaypointFromName("Spikes2WP")
	Gvar_4 = ObjFromName("HON")
	Gvar_5 = ObjFromName("HONBase")
	Gvar_6 = ObjFromName("PowerCell1")
	Gvar_7 = ObjFromName("PowerCell2")
	Gvar_8 = ObjFromName("PowerCell3")
	Gvar_9 = ObjFromName("PowerCell4")
	Gvar_10 = ObjFromName("PowerCell5")
	Gvar_11 = ObjFromName("PowerCell6")
	Gvar_12 = ObjFromName("PowerCell7")
	Gvar_13 = ObjFromName("PowerCell8")
	Gvar_14 = ObjFromName("HeartLight1")
	Gvar_15 = ObjFromName("HeartLight2")
	Gvar_16 = ObjFromName("HeartLight3")
	Gvar_17 = ObjFromName("HeartLight4")
	Gvar_18 = ObjFromName("HeartLight5")
	Gvar_19 = ObjFromName("HeartLight6")
	Gvar_20 = ObjFromName("HeartLight7")
	Gvar_21 = ObjFromName("HeartLight8")
	Gvar_22 = ObjFromName("HeartLight9")
	Gvar_23 = ObjFromName("HeartLight10")
	Gvar_24 = ObjFromName("NewLight11")
	Gvar_25 = ObjFromName("NewLight12")
	Gvar_26 = ObjFromName("NewLight13")
	Gvar_27 = ObjFromName("NewLight14")
	Gvar_28 = ObjFromName("NewLight15")
	Gvar_29 = ObjFromName("NewLight16")
	Gvar_30 = ObjFromName("NewLight17")
	Gvar_31 = ObjFromName("NewLight18")
	Gvar_32 = ObjFromName("NewLight19")
	Gvar_33 = ObjFromName("NewLight20")
	Gvar_34 = ObjGroupFromName("PowerCells")
	Gvar_104 = ObjGroupFromName("TraitorTriggers")
	Gvar_36 = WallGroupFromName("HONWalls")
	Gvar_37 = WallGroupFromName("HONExitWalls")
	DisableObjectGroup(Gvar_96)
	DisableObjectGroup(Gvar_97)
	DisableObjectGroup(Gvar_98)
	DisableObjectGroup(Gvar_99)
	EnableObject(Gvar_70)
	EnableObject(Gvar_71)
	EnableObject(Gvar_72)
	EnableObject(Gvar_73)
	EnableObject(Gvar_74)
	EnableObject(Gvar_75)
	EnableObject(Gvar_76)
	EnableObject(Gvar_77)
	EnableObject(Gvar_78)
	EnableObject(Gvar_79)
	EnableObject(Gvar_80)
	EnableObject(Gvar_81)
	EnableObjectGroup(Gvar_100)
	EnableObject(Gvar_82)
	EnableObject(Gvar_83)
	EnableObject(Gvar_84)
	EnableObject(Gvar_85)
	EnableObjectGroup(Gvar_101)
	EnableObjectGroup(Gvar_102)
	LockDoor(Gvar_86)
	LockDoor(Gvar_87)
	WaitFrames(2,12)
	WaitFrames(1,13)
	if true then return end
end
function PlayerDeath()
	DeathScreen(7)
	if true then return end
end