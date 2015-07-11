
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_60 = false
	Gvar_61 = false
	Gvar_62 = false
	Gvar_63 = false
	Gvar_64 = false
	Gvar_65 = false
	Gvar_66 = false
	Gvar_67 = false
	Gvar_68 = 0
	Gvar_83 = false
	Gvar_84 = false
	if true then return end
end
function DisableAT(arg_0)
	DisableObject(Gvar_4[arg_0])
	if true then return end
end
function FireAT0()
	EnableObject(Gvar_4[0])
	WaitSpecial(1,0,2)
	if true then return end
end
function FireAT1()
	EnableObject(Gvar_4[1])
	WaitSpecial(1,1,2)
	if true then return end
end
function FireAT2()
	EnableObject(Gvar_4[2])
	WaitSpecial(1,2,2)
	if true then return end
end
function FireAT3()
	EnableObject(Gvar_4[3])
	WaitSpecial(1,3,2)
	if true then return end
end
function FireAT4()
	EnableObject(Gvar_4[4])
	WaitSpecial(1,4,2)
	if true then return end
end
function FireAT5()
	EnableObject(Gvar_4[5])
	WaitSpecial(1,5,2)
	if true then return end
end
function FireAT6()
	EnableObject(Gvar_4[6])
	WaitSpecial(1,6,2)
	if true then return end
end
function FireAT7()
	EnableObject(Gvar_4[7])
	WaitSpecial(1,7,2)
	if true then return end
end
function FireAT8()
	EnableObject(Gvar_4[8])
	WaitSpecial(1,8,2)
	if true then return end
end
function FireAT9()
	EnableObject(Gvar_4[9])
	WaitSpecial(1,9,2)
	if true then return end
end
function FireAT10()
	EnableObject(Gvar_4[10])
	WaitSpecial(1,10,2)
	if true then return end
end
function FireAT11()
	EnableObject(Gvar_4[11])
	WaitSpecial(1,11,2)
	if true then return end
end
function FireAT17()
	EnableObject(Gvar_4[17])
	WaitSpecial(1,17,2)
	if true then return end
end
function FireAT18()
	EnableObject(Gvar_4[18])
	WaitSpecial(1,18,2)
	if true then return end
end
function FireAT19()
	EnableObject(Gvar_4[19])
	WaitSpecial(1,19,2)
	if true then return end
end
function FireAT20()
	EnableObject(Gvar_4[20])
	WaitSpecial(1,20,2)
	if true then return end
end
function FireATRow()
	EnableObject(Gvar_4[12])
	EnableObject(Gvar_4[13])
	EnableObject(Gvar_4[14])
	EnableObject(Gvar_4[15])
	EnableObject(Gvar_4[16])
	Gvar_5 = 12
	::l46::
	if not Gvar_5 < 17 then 
		goto l71
	end
	WaitSpecial(1,Gvar_5,2)
	Gvar_5 = Gvar_5 + 1
	goto l46
	::l71::
	if true then return end
end
function PlayerDeath()
	DeathScreen(10)
	if true then return end
end
function OrbLightOff()
	DisableObject(Gvar_6)
	TeleportObj(Gvar_7,GetWaypointX(Gvar_8),GetWaypointY(Gvar_8))
	if true then return end
end
function ForceOrb()
	var_0 = RandomFloat(-30,30)
	var_1 = RandomFloat(-30,30)
	var_2 = GetObjX(Trigger) + var_0
	var_3 = GetObjY(Trigger) + var_1
	TeleportObj(Gvar_6,GetObjX(Trigger),GetObjY(Trigger))
	TeleportObj(Gvar_7,GetObjX(Trigger),GetObjY(Trigger) + 6)
	TeleportWaypoint(Gvar_9,GetObjX(Trigger),GetObjY(Trigger))
	EnableObject(Gvar_6)
	AudioEvent("BallBounce",Gvar_9)
	PushObject(Caller,60,var_2,var_3)
	WaitFrames(4,21)
	if true then return end
end
function StairAccess2()
	if not Gvar_62 == true and Gvar_63 == true then 
		goto l27
	end
	UnlockDoor(Gvar_12)
	UnlockDoor(Gvar_13)
	::l27::
	if true then return end
end
function CreateCherub()
	if not Gvar_68 < 6 then 
		goto l132
	end
	var_0 = RandomInteger(0,1)
	Gvar_24[Gvar_68] = SpawnObject("EvilCherub",Gvar_43[var_0])
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_43[var_0]),GetWaypointY(Gvar_43[var_0]),0,0)
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_43[var_0]),GetWaypointY(Gvar_43[var_0]),0,0)
	MonsterEventScript(Gvar_24[Gvar_68],5,24)
	MonsterSetWayFlag(Gvar_24[Gvar_68],128)
	MonsterSetAggressiveness(Gvar_24[Gvar_68],0.83)
	Gvar_68 = Gvar_68 + 1
	goto l133
	::l132::
	if true then return end
	::l133::
	if true then return end
end
function WakeVKBat2()
	EnableObject(Gvar_76[1])
	if true then return end
end
function PlayAction2Music()
	PlayMusic(27,100)
	if true then return end
end
function CherubHostilize()
	MonsterGroupSetAggressiveness(Gvar_41,0.83)
	if true then return end
end
function OpenSecretRoom()
	OpenSecretWallGroup(Gvar_49)
	if true then return end
end
function EnableTreasureLich1()
	EnableObject(Gvar_14)
	if true then return end
end
function AccessTreasureRoom1()
	OpenSecretWallGroup(Gvar_46)
	if true then return end
end
function EnableTreasureLich2()
	EnableObject(Gvar_15)
	if true then return end
end
function AccessTreasureRoom2()
	OpenSecretWallGroup(Gvar_47)
	if true then return end
end
function EnableTreasureMech()
	EnableObject(Gvar_16)
	if true then return end
end
function AccessTreasureRoom3()
	OpenSecretWallGroup(Gvar_48)
	if true then return end
end
function EnableRoom()
	if not ObjIsCaller(GetHostPlayer()) and Gvar_60 == false then 
		goto l36
	end
	Gvar_60 = true
	EnableObject(Gvar_27)
	LockDoor(Gvar_10)
	LockDoor(Gvar_11)
	::l36::
	if true then return end
end
function StairAccess1()
	OpenSecretWallGroup(Gvar_50)
	UnlockDoor(Gvar_10)
	UnlockDoor(Gvar_11)
	if true then return end
end
function AllowAccess2()
	PrintToAll("War10c:SentryDisabled")
	DisableObject(Gvar_21)
	DisableObject(Gvar_20)
	DisableObject(Gvar_19)
	AudioEvent("Gear2",Gvar_69)
	if true then return end
end
function EnableRoom2()
	PlayAction2Music()
	if not ObjIsCaller(GetHostPlayer()) and Gvar_61 == false then 
		goto l39
	end
	Gvar_61 = true
	LockDoor(Gvar_12)
	LockDoor(Gvar_13)
	WaitFrames(800,24)
	::l39::
	if true then return end
end
function OneDown()
	Gvar_62 = true
	WaitFrames(1,23)
	if true then return end
end
function TwoDown()
	Gvar_63 = true
	WaitFrames(1,23)
	if true then return end
end
function SwitchOffSentries()
	DisableObject(Gvar_17)
	DisableObject(Gvar_18)
	UnlockDoor(Gvar_12)
	UnlockDoor(Gvar_13)
	if true then return end
end
function SwitchOnSentries()
	EnableObject(Gvar_17)
	EnableObject(Gvar_18)
	if true then return end
end
function UnlockAccessDoors()
	DisableObject(Gvar_31)
	UnlockDoor(Gvar_25)
	UnlockDoor(Gvar_26)
	if true then return end
end
function OpenWall01()
	OpenSecretWallGroup(Gvar_56)
	MonsterSetAggressiveness(Gvar_42,0.83)
	if true then return end
end
function OpenWindowWall1()
	OpenSecretWallGroup(Gvar_57)
	if true then return end
end
function CloseWindowWall1()
	CloseSecretWallGroup(Gvar_57)
	if true then return end
end
function OpenWindowWall2()
	OpenSecretWallGroup(Gvar_58)
	if true then return end
end
function CloseWindowWall2()
	CloseSecretWallGroup(Gvar_58)
	if true then return end
end
function OpenCage1()
	OpenSecretWallGroup(Gvar_51)
	EnableObject(Gvar_28)
	if true then return end
end
function OpenCage2()
	OpenSecretWallGroup(Gvar_52)
	EnableObject(Gvar_30)
	if true then return end
end
function OpenCage3()
	OpenSecretWallGroup(Gvar_53)
	EnableObject(Gvar_29)
	if true then return end
end
function OpenCage4()
	OpenSecretWallGroup(Gvar_54)
	WakeVKBat2()
	if true then return end
end
function OpenAccess()
	OpenSecretWallGroup(Gvar_55)
	if true then return end
end
function CheckIdols()
	if not Gvar_64 == true and Gvar_65 == true then 
		goto l22
	end
	EnableObjectGroup(Gvar_40)
	::l22::
	if true then return end
end
function BlueIdol()
	if not ObjIsCaller(Gvar_32) then 
		goto l43
	end
	Gvar_64 = true
	CheckIdols()
	DisableObject(Gvar_38)
	EnableObject(Gvar_33)
	DeleteObject(Gvar_32)
	DeleteObject(Gvar_36)
	AudioEvent("Gear2",Gvar_70)
	::l43::
	if true then return end
end
function RedIdol()
	if not ObjIsCaller(Gvar_34) then 
		goto l43
	end
	Gvar_65 = true
	CheckIdols()
	DisableObject(Gvar_39)
	EnableObject(Gvar_35)
	DeleteObject(Gvar_34)
	DeleteObject(Gvar_37)
	AudioEvent("Gear2",Gvar_70)
	::l43::
	if true then return end
end
function CheckSwitches()
	if not Gvar_66 == true and Gvar_67 == true then 
		goto l22
	end
	OpenSecretWallGroup(Gvar_59)
	::l22::
	AudioEvent("CreatureCageAppear",Gvar_45)
	if true then return end
end
function ExitWallSwitch1()
	AudioEvent("Gear3",Gvar_45)
	Gvar_66 = true
	CheckSwitches()
	if true then return end
end
function ExitWallSwitch2()
	AudioEvent("Gear3",Gvar_45)
	Gvar_67 = true
	CheckSwitches()
	if true then return end
end
function InitializeVampireKnights()
	Gvar_75[0] = ObjFromName("VampireKnight1")
	Gvar_75[1] = ObjFromName("VampireKnight2")
	Gvar_76[0] = ObjFromName("VKBat1")
	Gvar_76[1] = ObjFromName("VKBat2")
	Gvar_78 = WaypointFromName("VKSpot")
	Gvar_79 = WaypointFromName("VampireKnight1WP")
	Gvar_80 = WaypointFromName("BatCreate")
	if true then return end
end
function PlaySubMusic()
	PlayMusic(18,100)
	if true then return end
end
function MapInitialize()
	Gvar_70 = WaypointFromName("LichKeyAudioWP")
	Gvar_69 = WaypointFromName("SentryAudioWP")
	Gvar_41 = ObjGroupFromName("CherubPitGroup")
	Gvar_6 = ObjFromName("OrbLight")
	Gvar_7 = ObjFromName("OrbEffect")
	Gvar_10 = ObjFromName("ForceOrbDoorA")
	Gvar_11 = ObjFromName("ForceOrbDoorB")
	Gvar_12 = ObjFromName("ForceOrbDoorC")
	Gvar_13 = ObjFromName("ForceOrbDoorD")
	Gvar_4[0] = ObjFromName("AT0")
	Gvar_4[1] = ObjFromName("AT1")
	Gvar_4[2] = ObjFromName("AT2")
	Gvar_4[3] = ObjFromName("AT3")
	Gvar_4[4] = ObjFromName("AT4")
	Gvar_4[5] = ObjFromName("AT5")
	Gvar_4[6] = ObjFromName("AT6")
	Gvar_4[7] = ObjFromName("AT7")
	Gvar_4[8] = ObjFromName("AT8")
	Gvar_4[9] = ObjFromName("AT9")
	Gvar_4[10] = ObjFromName("AT10")
	Gvar_4[11] = ObjFromName("AT11")
	Gvar_4[12] = ObjFromName("AT12")
	Gvar_4[13] = ObjFromName("AT13")
	Gvar_4[14] = ObjFromName("AT14")
	Gvar_4[15] = ObjFromName("AT15")
	Gvar_4[16] = ObjFromName("AT16")
	Gvar_4[17] = ObjFromName("AT17")
	Gvar_4[18] = ObjFromName("AT18")
	Gvar_4[19] = ObjFromName("AT19")
	Gvar_4[20] = ObjFromName("AT20")
	Gvar_14 = ObjFromName("TreasureLich1")
	Gvar_15 = ObjFromName("TreasureLich2")
	Gvar_16 = ObjFromName("TreasureMech")
	Gvar_27 = ObjFromName("Necromancer1")
	Gvar_28 = ObjFromName("Necromancer2")
	Gvar_29 = ObjFromName("Necromancer3")
	Gvar_42 = ObjFromName("Lich1")
	Gvar_71 = ObjFromName("Lich2")
	Gvar_30 = ObjFromName("Lich3")
	Gvar_17 = ObjFromName("Sentry1")
	Gvar_18 = ObjFromName("Sentry2")
	Gvar_19 = ObjFromName("Sentry3")
	Gvar_20 = ObjFromName("Sentry4")
	Gvar_21 = ObjFromName("SentrySwitch")
	Gvar_22 = ObjFromName("MainSentry1")
	Gvar_23 = ObjFromName("MainSentry2")
	Gvar_25 = ObjFromName("AccessDoorA")
	Gvar_26 = ObjFromName("AccessDoorB")
	Gvar_31 = ObjFromName("OpenDoors")
	Gvar_32 = ObjFromName("BlueIdol")
	Gvar_34 = ObjFromName("RedIdol")
	Gvar_33 = ObjFromName("BlueIdolBase")
	Gvar_35 = ObjFromName("RedIdolBase")
	Gvar_36 = ObjFromName("BlueTrigger")
	Gvar_37 = ObjFromName("RedTrigger")
	Gvar_38 = ObjFromName("BlueIdolSentry")
	Gvar_39 = ObjFromName("RedIdolSentry")
	Gvar_73[0] = WaypointFromName("N1TeleWP0")
	Gvar_73[1] = WaypointFromName("N1TeleWP1")
	Gvar_73[2] = WaypointFromName("N1TeleWP2")
	Gvar_73[3] = WaypointFromName("N1TeleWP3")
	Gvar_73[4] = WaypointFromName("N1TeleWP4")
	Gvar_9 = WaypointFromName("OrbSoundWP")
	Gvar_8 = WaypointFromName("OrbEffectWP")
	Gvar_43[0] = WaypointFromName("CherubCreate1")
	Gvar_43[1] = WaypointFromName("CherubCreate2")
	Gvar_72 = ObjGroupFromName("VampTriggers")
	Gvar_40 = ObjGroupFromName("FinalLiches")
	Gvar_46 = WallGroupFromName("TreasureRoom1Walls")
	Gvar_47 = WallGroupFromName("TreasureRoom2Walls")
	Gvar_48 = WallGroupFromName("TreasureRoom3Walls")
	Gvar_44 = WaypointFromName("MechGolemAudioWP")
	Gvar_49 = WallGroupFromName("SecretRoomWall")
	Gvar_50 = WallGroupFromName("ForceOrbRoomWalls1")
	Gvar_51 = WallGroupFromName("Cage1")
	Gvar_52 = WallGroupFromName("Cage2")
	Gvar_53 = WallGroupFromName("Cage3")
	Gvar_54 = WallGroupFromName("Cage4")
	Gvar_55 = WallGroupFromName("AccessTreasureRoom3")
	Gvar_56 = WallGroupFromName("OpeningWall01")
	Gvar_57 = WallGroupFromName("WindowWall1")
	Gvar_58 = WallGroupFromName("WindowWall2")
	Gvar_59 = WallGroupFromName("LichStairAccess")
	Gvar_45 = WaypointFromName("ExitAudioWP")
	Gvar_74 = WaypointFromName("Secret1AudioWP")
	InitializeVampireKnights()
	PlaySubMusic()
	LockDoor(Gvar_25)
	LockDoor(Gvar_26)
	if true then return end
end
function Secret100XP()
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	AudioEvent("SecretFound",Gvar_74)
	if true then return end
end
function PlayWanderMusic()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l12
	end
	PlayMusic(17,100)
	::l12::
	if true then return end
end
function Necro1TeleportInjured()
	var_2 = RandomInteger(0,4)
	var_0 = GetWaypointX(Gvar_73[var_2])
	var_1 = GetWaypointY(Gvar_73[var_2])
	MonsterWait(Trigger,15)
	ApplyEnchant(Trigger,"ENCHANT_INVISIBLE",2)
	PlayFX("BLUE_SPARKS",GetObjX(Trigger),GetObjY(Trigger),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	TeleportObj(Trigger,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	if true then return end
end
function SmackPlayer()
	if not ObjIsHostileTo(Caller,Trigger) then 
		goto l33
	end
	ObjLookAtObj(Trigger,Caller)
	MonsterAttackMelee(Trigger,GetObjX(Caller),GetObjY(Caller))
	::l33::
	if true then return end
end
function HuntPlayer()
	MonsterGoHunt(Trigger)
	if true then return end
end
function BatToVampireKnight()
	if not Gvar_83 == false then 
		goto l40
	end
	Gvar_81 = GetObjX(Trigger)
	Gvar_82 = GetObjY(Trigger)
	DeleteObject(Trigger)
	EnableObject(Gvar_75[0])
	::l40::
	PlayFX("BLUE_SPARKS",Gvar_81,Gvar_82,0,0)
	PlayFX("SMOKE_BLAST",Gvar_81,Gvar_82,0,0)
	ApplyEnchant(Gvar_75[0],"ENCHANT_INVISIBLE",0.25)
	TeleportObj(Gvar_75[0],Gvar_81,Gvar_82)
	ObjLookAtObj(Gvar_75[0],GetHostPlayer())
	Gvar_83 = false
	if true then return end
end
function BatToVampireKnight2()
	if not Gvar_83 == false then 
		goto l40
	end
	Gvar_81 = GetObjX(Trigger)
	Gvar_82 = GetObjY(Trigger)
	DeleteObject(Trigger)
	EnableObject(Gvar_75[1])
	::l40::
	PlayFX("BLUE_SPARKS",Gvar_81,Gvar_82,0,0)
	PlayFX("SMOKE_BLAST",Gvar_81,Gvar_82,0,0)
	ApplyEnchant(Gvar_75[1],"ENCHANT_INVISIBLE",0.25)
	TeleportObj(Gvar_75[1],Gvar_81,Gvar_82)
	ObjLookAtObj(Gvar_75[1],GetHostPlayer())
	if true then return end
end
function SetRetreatBat()
	MonsterSetAggressiveness(Gvar_77,0.83)
	MonsterEventScript(Gvar_77,7,71)
	MonsterEventScript(Gvar_77,5,71)
	if true then return end
end
function BatDie()
	if not GetObjHealth(Trigger) <= 0 then 
		goto l136
	end
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	TeleportWaypoint(Gvar_80,GetObjX(Trigger),GetObjY(Trigger))
	TeleportObj(Trigger,GetWaypointX(Gvar_79),GetWaypointY(Gvar_79))
	DeleteObject(Gvar_77)
	AudioEvent("BurnCast",Gvar_80)
	var_0 = SpawnObject("Flame",Gvar_80)
	var_1 = SpawnObject("MediumFlame",Gvar_80)
	var_2 = SpawnObject("SmallFlame",Gvar_80)
	ObjSetDecayTime(var_0,80)
	ObjSetDecayTime(var_1,83)
	ObjSetDecayTime(var_2,85)
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l136
	end
	PlayerGiveExp(GetHostPlayer(),250)
	::l136::
	if true then return end
end
function ChangeOnSight()
	if not Gvar_84 == true then 
		goto l25
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterEventScript(Trigger,6,68)
	::l25::
	if true then return end
end
function InjureVampireKnight()
	if not Gvar_83 == false then 
		goto l85
	end
	Gvar_81 = GetObjX(Trigger)
	Gvar_82 = GetObjY(Trigger)
	EnableObject(Gvar_75[0])
	DamageObject(Gvar_75[0],0,50,0)
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	DeleteObject(Trigger)
	Gvar_83 = true
	WaitFrames(1,68)
	::l85::
	if true then return end
end
function InjureVampireKnight2()
	Gvar_81 = GetObjX(Trigger)
	Gvar_82 = GetObjY(Trigger)
	EnableObject(Gvar_75[1])
	DamageObject(Gvar_75[1],0,50,0)
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	DeleteObject(Trigger)
	Gvar_83 = true
	WaitFrames(1,69)
	if true then return end
end
function BatMove()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l22
	end
	MonsterEventScript(Trigger,4,72)
	MonsterWait(Trigger,15)
	::l22::
	if true then return end
end
function VKDie()
	Gvar_81 = GetObjX(Trigger)
	Gvar_82 = GetObjY(Trigger)
	DeleteObject(Trigger)
	TeleportWaypoint(Gvar_80,Gvar_81,Gvar_82)
	Gvar_77 = SpawnObject("Bat",Gvar_80)
	WaitFrames(1,70)
	if true then return end
end