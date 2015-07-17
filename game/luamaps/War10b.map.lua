
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_41 = 0
	Gvar_42 = 1
	Gvar_43 = Gvar_41
	Gvar_59 = 0
	Gvar_60 = 1
	Gvar_61 = Gvar_59
	Gvar_71 = 0
	Gvar_72 = 1
	Gvar_73 = Gvar_71
	Gvar_119 = false
	Gvar_120 = false
	if true then return end
end
function DisableArrow1()
	DisableObject(Gvar_5)
	if true then return end
end
function EnableArrow1()
	EnableObject(Gvar_5)
	AudioEvent("BowShoot",Gvar_14)
	WaitFrames(1,2)
	if true then return end
end
function DisableArrow2()
	DisableObject(Gvar_6)
	if true then return end
end
function EnableArrow2()
	EnableObject(Gvar_6)
	AudioEvent("BowShoot",Gvar_15)
	WaitFrames(1,4)
	if true then return end
end
function DisableArrow3()
	DisableObject(Gvar_7)
	if true then return end
end
function EnableArrow3()
	EnableObject(Gvar_7)
	AudioEvent("BowShoot",Gvar_16)
	WaitFrames(1,6)
	if true then return end
end
function DisableArrow4()
	DisableObject(Gvar_8)
	if true then return end
end
function EnableArrow4()
	EnableObject(Gvar_8)
	AudioEvent("BowShoot",Gvar_17)
	WaitFrames(1,8)
	if true then return end
end
function DisableArrow5()
	DisableObject(Gvar_9)
	if true then return end
end
function EnableArrow5()
	EnableObject(Gvar_9)
	AudioEvent("BowShoot",Gvar_18)
	WaitFrames(1,10)
	if true then return end
end
function DisableArrow6()
	DisableObject(Gvar_10)
	if true then return end
end
function EnableArrow6()
	EnableObject(Gvar_10)
	AudioEvent("BowShoot",Gvar_19)
	WaitFrames(1,12)
	if true then return end
end
function DisableArrow7()
	DisableObject(Gvar_11)
	if true then return end
end
function EnableArrow7()
	EnableObject(Gvar_11)
	AudioEvent("BowShoot",Gvar_20)
	WaitFrames(1,14)
	if true then return end
end
function DisableArrow8()
	DisableObject(Gvar_12)
	if true then return end
end
function EnableArrow8()
	EnableObject(Gvar_12)
	AudioEvent("BowShoot",Gvar_21)
	WaitFrames(1,16)
	if true then return end
end
function DisableArrow9()
	DisableObject(Gvar_13)
	if true then return end
end
function EnableArrow9()
	EnableObject(Gvar_13)
	AudioEvent("BowShoot",Gvar_22)
	WaitFrames(1,18)
	if true then return end
end
function DisableArrowTriggers()
	DisableObjectGroup(Gvar_4)
	if true then return end
end
function EnableArrowTriggers()
	EnableObjectGroup(Gvar_4)
	if true then return end
end
function BlockAGotoB()
	MoveTo(Gvar_23,Gvar_29)
	MoveTo(Gvar_24,Gvar_30)
	MoveTo(Gvar_25,Gvar_31)
	MoveTo(Gvar_26,Gvar_32)
	MoveTo(Gvar_27,Gvar_33)
	MoveTo(Gvar_28,Gvar_34)
	Gvar_43 = Gvar_42
	AudioEvent("SpikeBlockMove",Gvar_30)
	AudioEvent("BoulderMove",Gvar_30)
	if true then return end
end
function BlockAGotoC()
	MoveTo(Gvar_23,Gvar_35)
	MoveTo(Gvar_24,Gvar_36)
	MoveTo(Gvar_25,Gvar_37)
	MoveTo(Gvar_26,Gvar_38)
	MoveTo(Gvar_27,Gvar_39)
	MoveTo(Gvar_28,Gvar_40)
	Gvar_43 = Gvar_41
	AudioEvent("SpikeBlockMove",Gvar_30)
	AudioEvent("BoulderMove",Gvar_30)
	if true then return end
end
function BlockAGo()
	var_0 = Gvar_43
	if (var_0 == Gvar_41) then 
		goto l27
	end
	if (var_0 == Gvar_42) then 
		goto l31
	end
	goto l35
	::l27::
	BlockAGotoB()
	goto l35
	::l31::
	BlockAGotoC()
	goto l35
	::l35::
	if true then return end
end
function BlockBGotoB()
	MoveTo(Gvar_44,Gvar_49)
	MoveTo(Gvar_45,Gvar_50)
	MoveTo(Gvar_46,Gvar_51)
	MoveTo(Gvar_47,Gvar_52)
	MoveTo(Gvar_48,Gvar_53)
	Gvar_61 = Gvar_60
	AudioEvent("SpikeBlockMove",Gvar_50)
	AudioEvent("BoulderMove",Gvar_50)
	if true then return end
end
function BlockBGotoC()
	MoveTo(Gvar_44,Gvar_54)
	MoveTo(Gvar_45,Gvar_55)
	MoveTo(Gvar_46,Gvar_56)
	MoveTo(Gvar_47,Gvar_57)
	MoveTo(Gvar_48,Gvar_58)
	Gvar_61 = Gvar_59
	AudioEvent("SpikeBlockMove",Gvar_50)
	AudioEvent("BoulderMove",Gvar_50)
	if true then return end
end
function BlockBGo()
	var_0 = Gvar_61
	if (var_0 == Gvar_59) then 
		goto l27
	end
	if (var_0 == Gvar_60) then 
		goto l31
	end
	goto l35
	::l27::
	BlockBGotoB()
	goto l35
	::l31::
	BlockBGotoC()
	goto l35
	::l35::
	if true then return end
end
function BlockCGotoB()
	MoveTo(Gvar_62,Gvar_65)
	MoveTo(Gvar_63,Gvar_66)
	MoveTo(Gvar_64,Gvar_67)
	Gvar_73 = Gvar_72
	AudioEvent("SpikeBlockMove",Gvar_65)
	AudioEvent("BoulderMove",Gvar_65)
	if true then return end
end
function BlockCGotoC()
	MoveTo(Gvar_62,Gvar_68)
	MoveTo(Gvar_63,Gvar_69)
	MoveTo(Gvar_64,Gvar_70)
	Gvar_73 = Gvar_71
	AudioEvent("SpikeBlockMove",Gvar_68)
	AudioEvent("BoulderMove",Gvar_68)
	if true then return end
end
function BlockCGo()
	var_0 = Gvar_73
	if (var_0 == Gvar_71) then 
		goto l27
	end
	if (var_0 == Gvar_72) then 
		goto l31
	end
	goto l35
	::l27::
	BlockCGotoB()
	goto l35
	::l31::
	BlockCGotoC()
	goto l35
	::l35::
	if true then return end
end
function PlayerDeath()
	DeathScreen(10)
	if true then return end
end
function OrbLightOff()
	DisableObject(Gvar_74)
	TeleportObj(Gvar_75,GetWaypointX(Gvar_76),GetWaypointY(Gvar_76))
	if true then return end
end
function ForceOrb()
	var_0 = RandomFloat(-30,30)
	var_1 = RandomFloat(-30,30)
	var_2 = GetObjX(Trigger) + var_0
	var_3 = GetObjY(Trigger) + var_1
	TeleportObj(Gvar_74,GetObjX(Trigger),GetObjY(Trigger))
	TeleportObj(Gvar_75,GetObjX(Trigger),GetObjY(Trigger) + 6)
	TeleportWaypoint(Gvar_77,GetObjX(Trigger),GetObjY(Trigger))
	EnableObject(Gvar_74)
	AudioEvent("BallBounce",Gvar_77)
	PushObject(Caller,60,var_2,var_3)
	WaitFrames(4,32)
	if true then return end
end
function OpenBouncySecretWallGroup()
	OpenSecretWallGroup(Gvar_78)
	if true then return end
end
function InitializeVampireKnights()
	Gvar_111[0] = ObjFromName("VampireKnight1")
	Gvar_112[0] = ObjFromName("VKBat1")
	Gvar_114 = WaypointFromName("VKSpot")
	Gvar_115 = WaypointFromName("VampireKnight1WP")
	Gvar_116 = WaypointFromName("BatCreate")
	if true then return end
end
function MapInitialize()
	Gvar_80 = WallGroupFromName("ZombieAmbushWalls")
	Gvar_79 = ObjGroupFromName("ZombieAmbushGroup")
	Gvar_81 = WallGroupFromName("SkeletonWallGroup")
	Gvar_82 = WallGroupFromName("SkeletonWallGroup2")
	Gvar_83 = ObjFromName("SkeletonTrigger1")
	Gvar_84 = ObjFromName("SkeletonElevator")
	Gvar_85 = ObjGroupFromName("SkelAmbushGroup")
	Gvar_86 = ObjGroupFromName("SecretMechGroup")
	Gvar_87 = WallGroupFromName("SecretMechWallGroup")
	Gvar_88 = ObjFromName("SecretMechTrig")
	Gvar_89 = WaypointFromName("Secret1AudioWP")
	Gvar_23 = ObjFromName("BlockA1")
	Gvar_24 = ObjFromName("BlockA2")
	Gvar_25 = ObjFromName("BlockA3")
	Gvar_26 = ObjFromName("BlockA4")
	Gvar_27 = ObjFromName("BlockA5")
	Gvar_28 = ObjFromName("BlockA6")
	Gvar_29 = WaypointFromName("BlockWPA1b")
	Gvar_30 = WaypointFromName("BlockWPA2b")
	Gvar_31 = WaypointFromName("BlockWPA3b")
	Gvar_32 = WaypointFromName("BlockWPA4b")
	Gvar_33 = WaypointFromName("BlockWPA5b")
	Gvar_34 = WaypointFromName("BlockWPA6b")
	Gvar_35 = WaypointFromName("BlockWPA1c")
	Gvar_36 = WaypointFromName("BlockWPA2c")
	Gvar_37 = WaypointFromName("BlockWPA3c")
	Gvar_38 = WaypointFromName("BlockWPA4c")
	Gvar_39 = WaypointFromName("BlockWPA5c")
	Gvar_40 = WaypointFromName("BlockWPA6c")
	Gvar_44 = ObjFromName("BlockB1")
	Gvar_45 = ObjFromName("BlockB2")
	Gvar_46 = ObjFromName("BlockB3")
	Gvar_47 = ObjFromName("BlockB4")
	Gvar_48 = ObjFromName("BlockB5")
	Gvar_49 = WaypointFromName("BlockWPB1b")
	Gvar_50 = WaypointFromName("BlockWPB2b")
	Gvar_51 = WaypointFromName("BlockWPB3b")
	Gvar_52 = WaypointFromName("BlockWPB4b")
	Gvar_53 = WaypointFromName("BlockWPB5b")
	Gvar_54 = WaypointFromName("BlockWPB1c")
	Gvar_55 = WaypointFromName("BlockWPB2c")
	Gvar_56 = WaypointFromName("BlockWPB3c")
	Gvar_57 = WaypointFromName("BlockWPB4c")
	Gvar_58 = WaypointFromName("BlockWPB5c")
	Gvar_62 = ObjFromName("BlockC1")
	Gvar_63 = ObjFromName("BlockC2")
	Gvar_64 = ObjFromName("BlockC3")
	Gvar_65 = WaypointFromName("BlockWPC1b")
	Gvar_66 = WaypointFromName("BlockWPC2b")
	Gvar_67 = WaypointFromName("BlockWPC3b")
	Gvar_68 = WaypointFromName("BlockWPC1c")
	Gvar_69 = WaypointFromName("BlockWPC2c")
	Gvar_70 = WaypointFromName("BlockWPC3c")
	Gvar_90 = WallGroupFromName("VampireWallGroup")
	Gvar_91 = ObjFromName("VampireKnight1")
	Gvar_92 = ObjFromName("VKBat1")
	Gvar_93 = ObjFromName("RetreatBat")
	Gvar_94 = WaypointFromName("VampireKnight1WP")
	Gvar_95 = WaypointFromName("BatCreate")
	Gvar_96 = WaypointFromName("VKSpot")
	InitializeVampireKnights()
	Gvar_4 = ObjGroupFromName("ArrowTrigGroup")
	Gvar_5 = ObjFromName("Arrow1")
	Gvar_6 = ObjFromName("Arrow2")
	Gvar_7 = ObjFromName("Arrow3")
	Gvar_8 = ObjFromName("Arrow4")
	Gvar_9 = ObjFromName("Arrow5")
	Gvar_10 = ObjFromName("Arrow6")
	Gvar_11 = ObjFromName("Arrow7")
	Gvar_12 = ObjFromName("Arrow8")
	Gvar_13 = ObjFromName("Arrow9")
	Gvar_14 = WaypointFromName("Arrow1WP")
	Gvar_15 = WaypointFromName("Arrow2WP")
	Gvar_16 = WaypointFromName("Arrow3WP")
	Gvar_17 = WaypointFromName("Arrow4WP")
	Gvar_18 = WaypointFromName("Arrow5WP")
	Gvar_19 = WaypointFromName("Arrow6WP")
	Gvar_20 = WaypointFromName("Arrow7WP")
	Gvar_21 = WaypointFromName("Arrow8WP")
	Gvar_22 = WaypointFromName("Arrow9WP")
	Gvar_97 = ObjFromName("MechGolem1")
	Gvar_98 = ObjFromName("MechGolem2")
	Gvar_99 = ObjFromName("MechGolem3")
	Gvar_100 = WaypointFromName("MechGolem2WP")
	Gvar_101 = WaypointFromName("MechGolemAudioWP")
	Gvar_102 = ObjGroupFromName("GolemTrigGroup")
	Gvar_109 = ObjFromName("MazeTrig1")
	Gvar_110 = ObjFromName("MazeTrig2")
	Gvar_103 = WallGroupFromName("GolemWallGroup")
	Gvar_104 = WallGroupFromName("GolemWall2Group")
	Gvar_105 = WallGroupFromName("GolemWall3Group")
	Gvar_106 = WallGroupFromName("GolemGate1Group")
	Gvar_107 = WallGroupFromName("GolemGate2Group")
	Gvar_108 = WallGroupFromName("CherubWallGroup")
	Gvar_74 = ObjFromName("OrbLight")
	Gvar_75 = ObjFromName("OrbEffect")
	Gvar_76 = WaypointFromName("OrbEffectWP")
	Gvar_77 = WaypointFromName("OrbSoundWP")
	Gvar_78 = WallGroupFromName("BouncySecretWallGroup")
	if true then return end
end
function Secret300XP()
	PlayerGiveExp(GetHostPlayer(),300)
	PrintToAll("GeneralPrint:SecretFound")
	AudioEvent("SecretFound",Gvar_89)
	if true then return end
end
function PlaySubMusic()
	PlayMusic(18,100)
	if true then return end
end
function PlayAction1Music()
	PlayMusic(26,100)
	if true then return end
end
function GolemWallDown()
	OpenSecretWallGroup(Gvar_103)
	EnableObject(Gvar_97)
	AudioEvent("MechGolemPowerUp",Gvar_101)
	DisableObjectGroup(Gvar_102)
	PlayAction1Music()
	if true then return end
end
function GolemWall2Down()
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_104)
	WallMakeSilent(false)
	EnableObject(Gvar_98)
	AudioEvent("MechGolemRecognize",Gvar_100)
	AudioEvent("MechGolemPowerUp",Gvar_100)
	if true then return end
end
function GolemWall3Down()
	OpenSecretWallGroup(Gvar_105)
	EnableObject(Gvar_99)
	EnableObject(Gvar_88)
	if true then return end
end
function OpenGolemGate1()
	OpenSecretWallGroup(Gvar_106)
	DisableObject(Gvar_109)
	if true then return end
end
function OpenGolemGate2()
	OpenSecretWallGroup(Gvar_107)
	DisableObject(Gvar_110)
	if true then return end
end
function DestroyCherubWallGroup()
	BreakWallGroup(Gvar_108)
	PlaySubMusic()
	if true then return end
end
function HostilizeMe()
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function PlayAction3Music()
	PlayMusic(28,100)
	if true then return end
end
function BatToVampireKnight()
	if not (Gvar_119 == false) then 
		goto l40
	end
	Gvar_117 = GetObjX(Trigger)
	Gvar_118 = GetObjY(Trigger)
	DeleteObject(Trigger)
	EnableObject(Gvar_111[0])
	::l40::
	PlayFX("BLUE_SPARKS",Gvar_117,Gvar_118,0,0)
	PlayFX("SMOKE_BLAST",Gvar_117,Gvar_118,0,0)
	ApplyEnchant(Gvar_111[0],"ENCHANT_INVISIBLE",0.25)
	TeleportObj(Gvar_111[0],Gvar_117,Gvar_118)
	ObjLookAtObj(Gvar_111[0],GetHostPlayer())
	if true then return end
end
function SetRetreatBat()
	MonsterSetAggressiveness(Gvar_113,0.83)
	MonsterEventScript(Gvar_113,7,50)
	MonsterEventScript(Gvar_113,5,50)
	if true then return end
end
function BatDie()
	if not (GetObjHealth(Gvar_113) <= 0) then 
		goto l121
	end
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_113),GetObjY(Gvar_113),0,0)
	TeleportWaypoint(Gvar_116,GetObjX(Trigger),GetObjY(Trigger))
	DeleteObject(Gvar_113)
	AudioEvent("BurnCast",Gvar_116)
	var_0 = SpawnObject("Flame",Gvar_116)
	var_1 = SpawnObject("MediumFlame",Gvar_116)
	var_2 = SpawnObject("SmallFlame",Gvar_116)
	ObjSetDecayTime(var_0,80)
	ObjSetDecayTime(var_1,85)
	ObjSetDecayTime(var_2,90)
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l121
	end
	PlayerGiveExp(GetHostPlayer(),250)
	::l121::
	if true then return end
end
function ChangeOnSight()
	if not (Gvar_120 == true) then 
		goto l25
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterEventScript(Trigger,6,48)
	::l25::
	if true then return end
end
function InjureVampireKnight()
	Gvar_117 = GetObjX(Trigger)
	Gvar_118 = GetObjY(Trigger)
	EnableObject(Gvar_111[0])
	DamageObject(Gvar_111[0],0,50,0)
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	DeleteObject(Trigger)
	Gvar_119 = true
	WaitFrames(1,48)
	if true then return end
end
function BatMove()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l26
	end
	MonsterEventScript(Trigger,4,51)
	MoveTo(Gvar_112[0],Gvar_114)
	::l26::
	if true then return end
end
function VKDie()
	Gvar_117 = GetObjX(Trigger)
	Gvar_118 = GetObjY(Trigger)
	DeleteObject(Trigger)
	TeleportWaypoint(Gvar_116,Gvar_117,Gvar_118)
	Gvar_113 = SpawnObject("Bat",Gvar_116)
	WaitFrames(1,49)
	if true then return end
end
function ZombieAmbush()
	OpenSecretWallGroup(Gvar_80)
	EnableObjectGroup(Gvar_79)
	if true then return end
end
function SkeletonAttack()
	OpenSecretWallGroup(Gvar_81)
	CloseSecretWallGroup(Gvar_82)
	EnableObject(Gvar_83)
	EnableObjectGroup(Gvar_85)
	PlayAction3Music()
	if true then return end
end
function OpenSkeletonWallGroup2()
	OpenSecretWallGroup(Gvar_82)
	EnableObject(Gvar_84)
	if true then return end
end
function Secret300()
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),300)
	if true then return end
end
function OpenSecretMechWallGroup()
	OpenSecretWallGroup(Gvar_87)
	MonsterGroupSetAggressiveness(Gvar_86,0.83)
	Secret300()
	if true then return end
end