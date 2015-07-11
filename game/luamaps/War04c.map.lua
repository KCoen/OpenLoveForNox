
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_7 = 50
	Gvar_8 = 20
	Gvar_9 = 5
	Gvar_47 = 120
	Gvar_59 = false
	Gvar_60 = false
	Gvar_61 = 0
	Gvar_62 = 1
	Gvar_63 = Gvar_62
	Gvar_73 = false
	Gvar_74 = false
	Gvar_75 = 0
	Gvar_78 = 0
	Gvar_79 = 0
	Gvar_80 = 0
	Gvar_81 = 0
	Gvar_82 = 0
	Gvar_83 = 0
	Gvar_84 = 0
	Gvar_85 = 0
	Gvar_86 = 0
	Gvar_87 = 0
	Gvar_88 = 0
	Gvar_89 = 0
	Gvar_90 = 0
	if true then return end
end
function InitializeSkeletonAmbush()
	Gvar_4 = WallGroupFromName("SkeletonAmbushWalls")
	if true then return end
end
function SkeletonAmbush()
	BreakWallGroup(Gvar_4)
	if true then return end
end
function SkeletonAmbushTimer()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l12
	end
	WaitFrames(45,3)
	::l12::
	if true then return end
end
function EnablePitTrapElevator01()
	DisableObject(Trigger)
	EnableObject(ObjFromName("PitTrapElevator01"))
	if true then return end
end
function EnablePitTrapElevator02()
	DisableObject(Trigger)
	EnableObject(ObjFromName("PitTrapElevator02"))
	if true then return end
end
function OpenPitElevatorWalls01()
	DisableObject(Trigger)
	OpenSecretWallGroup(WallGroupFromName("PitTrapElevatorWalls01"))
	if true then return end
end
function OpenPitElevatorWalls02()
	DisableObject(Trigger)
	OpenSecretWallGroup(WallGroupFromName("PitTrapElevatorWalls02"))
	if true then return end
end
function ZombieAmbush()
	DisableObject(Trigger)
	BreakWallGroup(WallGroupFromName("ZombieAmbushWalls"))
	if true then return end
end
function InitializeHallwayArrowTraps()
	Gvar_5 = ObjFromName("HallwayArrowTrap01")
	Gvar_6 = ObjFromName("HallwayArrowTrap02")
	if true then return end
end
function ResetHallwayArrowTrap01()
	DisableObject(Gvar_5)
	if true then return end
end
function ResetHallwayArrowTrap02()
	DisableObject(Gvar_6)
	if true then return end
end
function ActivateHallwayArrowTrap01()
	EnableObject(Gvar_5)
	WaitFrames(1,11)
	if true then return end
end
function ActivateHallwayArrowTrap02()
	EnableObject(Gvar_6)
	WaitFrames(1,12)
	if true then return end
end
function InitializeBlockTrap()
	Gvar_10 = ObjFromName("SpikeBlock01")
	Gvar_11 = ObjFromName("SpikeBlock02")
	Gvar_12 = ObjFromName("SpikeBlock03")
	Gvar_13 = ObjFromName("SpikeBlock04")
	Gvar_14 = ObjFromName("SpikeBlock05")
	Gvar_15 = ObjFromName("SpikeBlock06")
	Gvar_16 = ObjFromName("SpikeBlock07")
	Gvar_17 = ObjFromName("SpikeBlock08")
	Gvar_18 = ObjFromName("SpikeBlock09")
	Gvar_19 = ObjFromName("SpikeBlock10")
	Gvar_20 = ObjFromName("SpikeBlock11")
	Gvar_21 = ObjFromName("SpikeBlock12")
	Gvar_22 = ObjFromName("SpikeBlock13")
	Gvar_23 = ObjFromName("SpikeBlock14")
	Gvar_24 = ObjFromName("SpikeBlock15")
	Gvar_25 = ObjFromName("SpikeBlock16")
	Gvar_26 = WaypointFromName("BlockWP01")
	Gvar_27 = WaypointFromName("BlockWP02")
	Gvar_28 = WaypointFromName("BlockWP03")
	Gvar_29 = WaypointFromName("BlockWP04")
	Gvar_30 = WaypointFromName("BlockWP05")
	Gvar_31 = WaypointFromName("BlockWP06")
	Gvar_32 = WaypointFromName("BlockWP07")
	Gvar_33 = WaypointFromName("BlockWP08")
	Gvar_34 = WaypointFromName("BlockWP09")
	Gvar_35 = WaypointFromName("BlockWP10")
	Gvar_36 = WaypointFromName("BlockWP11")
	Gvar_37 = WaypointFromName("BlockWP12")
	Gvar_38 = WaypointFromName("BlockWP13")
	Gvar_39 = WaypointFromName("BlockWP14")
	Gvar_40 = WaypointFromName("BlockWP15")
	Gvar_41 = WaypointFromName("BlockWP16")
	Gvar_42 = ObjGroupFromName("BlockTrap01Triggers")
	Gvar_43 = ObjGroupFromName("BlockTrap02Triggers")
	Gvar_44 = ObjGroupFromName("BlockTrap03Triggers")
	if true then return end
end
function BlockTrapBoom(arg_0)
	var_1 = arg_0
	if var_1 == 1 then 
		goto l33
	end
	if var_1 == 2 then 
		goto l61
	end
	if var_1 == 3 then 
		goto l89
	end
	goto l117
	::l33::
	AudioEvent("HammerMissing",Gvar_28)
	PlayFX("JIGGLE",GetWaypointX(Gvar_28),GetWaypointY(Gvar_28),Gvar_9,0)
	goto l117
	::l61::
	AudioEvent("HammerMissing",Gvar_34)
	PlayFX("JIGGLE",GetWaypointX(Gvar_34),GetWaypointY(Gvar_34),Gvar_9,0)
	goto l117
	::l89::
	AudioEvent("HammerMissing",Gvar_38)
	PlayFX("JIGGLE",GetWaypointX(Gvar_38),GetWaypointY(Gvar_38),Gvar_9,0)
	goto l117
	::l117::
	if true then return end
end
function ResetBlockTrap(arg_0)
	var_1 = arg_0
	if var_1 == 1 then 
		goto l33
	end
	if var_1 == 2 then 
		goto l47
	end
	if var_1 == 3 then 
		goto l61
	end
	goto l75
	::l33::
	EnableObjectGroup(Gvar_42)
	AudioEvent("TriggerReleased",Gvar_28)
	goto l75
	::l47::
	EnableObjectGroup(Gvar_43)
	AudioEvent("TriggerReleased",Gvar_34)
	goto l75
	::l61::
	EnableObjectGroup(Gvar_44)
	AudioEvent("TriggerReleased",Gvar_38)
	goto l75
	::l75::
	if true then return end
end
function CloseBlockTrap01()
	DisableObjectGroup(Gvar_42)
	MoveTo(Gvar_10,Gvar_26)
	MoveTo(Gvar_11,Gvar_27)
	MoveTo(Gvar_12,Gvar_28)
	MoveTo(Gvar_13,Gvar_29)
	MoveTo(Gvar_14,Gvar_30)
	MoveTo(Gvar_15,Gvar_31)
	WaitSpecial(Gvar_8,1,16)
	WaitSpecial(Gvar_7,1,17)
	if true then return end
end
function CloseBlockTrap02()
	DisableObjectGroup(Gvar_43)
	MoveTo(Gvar_16,Gvar_32)
	MoveTo(Gvar_17,Gvar_33)
	MoveTo(Gvar_18,Gvar_34)
	MoveTo(Gvar_19,Gvar_35)
	MoveTo(Gvar_20,Gvar_36)
	MoveTo(Gvar_21,Gvar_37)
	WaitSpecial(Gvar_8,2,16)
	WaitSpecial(Gvar_7,2,17)
	if true then return end
end
function CloseBlockTrap03()
	DisableObjectGroup(Gvar_44)
	MoveTo(Gvar_22,Gvar_38)
	MoveTo(Gvar_23,Gvar_39)
	MoveTo(Gvar_24,Gvar_40)
	MoveTo(Gvar_25,Gvar_41)
	WaitSpecial(Gvar_8,3,16)
	WaitSpecial(Gvar_7,3,17)
	if true then return end
end
function InitializeFistTraps()
	Gvar_46[0] = ObjFromName("FistTrap01")
	Gvar_46[1] = ObjFromName("FistTrap02")
	Gvar_46[2] = ObjFromName("FistTrap03")
	Gvar_46[3] = ObjFromName("FistTrap04")
	Gvar_46[4] = ObjFromName("FistTrap05")
	Gvar_46[5] = ObjFromName("FistTrap06")
	Gvar_46[6] = ObjFromName("FistTrap07")
	Gvar_46[7] = ObjFromName("FistTrap08")
	Gvar_46[8] = ObjFromName("FistTrap09")
	Gvar_46[9] = ObjFromName("FistTrap10")
	Gvar_46[10] = ObjFromName("FistTrap11")
	Gvar_46[11] = ObjFromName("FistTrap12")
	Gvar_46[12] = ObjFromName("FistTrap13")
	Gvar_45[0] = ObjFromName("FistTrapLight01")
	Gvar_45[1] = ObjFromName("FistTrapLight02")
	Gvar_45[2] = ObjFromName("FistTrapLight03")
	Gvar_45[3] = ObjFromName("FistTrapLight04")
	Gvar_45[4] = ObjFromName("FistTrapLight05")
	Gvar_45[5] = ObjFromName("FistTrapLight06")
	Gvar_45[6] = ObjFromName("FistTrapLight07")
	Gvar_45[7] = ObjFromName("FistTrapLight08")
	Gvar_45[8] = ObjFromName("FistTrapLight09")
	Gvar_45[9] = ObjFromName("FistTrapLight10")
	Gvar_45[10] = ObjFromName("FistTrapLight11")
	Gvar_45[11] = ObjFromName("FistTrapLight12")
	Gvar_45[12] = ObjFromName("FistTrapLight13")
	if true then return end
end
function ResetFistTrap(arg_0)
	EnableObject(Gvar_45[arg_0])
	EnableObject(Gvar_46[arg_0])
	TeleportWaypoint(Gvar_48,GetObjX(Gvar_46[arg_0]),GetObjY(Gvar_46[arg_0]))
	AudioEvent("TriggerReleased",Gvar_48)
	if true then return end
end
function DropFist(arg_0)
	ApplySpellObjXY("SPELL_FIST",Gvar_46[arg_0],GetObjX(Gvar_46[arg_0]),GetObjY(Gvar_46[arg_0]))
	DisableObject(Gvar_46[arg_0])
	DisableObject(Gvar_45[arg_0])
	WaitSpecial(Gvar_47,arg_0,22)
	if true then return end
end
function ActivateFistTrap01()
	DropFist(0)
	if true then return end
end
function ActivateFistTrap02()
	DropFist(1)
	if true then return end
end
function ActivateFistTrap03()
	DropFist(2)
	if true then return end
end
function ActivateFistTrap04()
	DropFist(3)
	if true then return end
end
function ActivateFistTrap05()
	DropFist(4)
	if true then return end
end
function ActivateFistTrap06()
	DropFist(5)
	if true then return end
end
function ActivateFistTrap07()
	DropFist(6)
	if true then return end
end
function ActivateFistTrap08()
	DropFist(7)
	if true then return end
end
function ActivateFistTrap09()
	DropFist(8)
	if true then return end
end
function ActivateFistTrap10()
	DropFist(9)
	if true then return end
end
function ActivateFistTrap11()
	DropFist(10)
	if true then return end
end
function ActivateFistTrap12()
	DropFist(11)
	if true then return end
end
function ActivateFistTrap13()
	DropFist(12)
	if true then return end
end
function EnableGuardian()
	CinematicBorders(false)
	AudioEvent("SwordsmanRecognize",Gvar_48)
	ObjFreeze(GetHostPlayer(),false)
	MonsterSetAggressiveness(Gvar_53,0.83)
	WallMakeSilent(false)
	if true then return end
end
function GuardianEnterFX()
	TeleportWaypoint(Gvar_48,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("WallDestroyedStone",Gvar_48)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	if true then return end
end
function GuardianMoveToArena()
	MoveTo(Gvar_53,Gvar_55)
	if true then return end
end
function InitializeGuardian()
	Gvar_53 = ObjFromName("Guardian")
	Gvar_49 = ObjFromName("RightGuardianGate")
	Gvar_50 = ObjFromName("LeftGuardianGate")
	Gvar_51 = ObjFromName("RightGuardianDoor")
	Gvar_52 = ObjFromName("LeftGuardianDoor")
	Gvar_54 = ObjFromName("GuardianDoorTrigger")
	Gvar_55 = WaypointFromName("GuardianArena")
	Gvar_56 = WaypointFromName("GuardianDoorWP")
	Gvar_57 = WallGroupFromName("GuardianWalls")
	Gvar_58 = WallGroupFromName("GuardianDestructableWalls")
	LockDoor(Gvar_49)
	LockDoor(Gvar_50)
	if true then return end
end
function GuardianEnter()
	if not Gvar_59 == 0 and ObjIsCaller(GetHostPlayer()) then 
		goto l65
	end
	PushMusicStack()
	PlayMusic(26,100)
	LockDoor(Gvar_51)
	LockDoor(Gvar_52)
	EnableObject(Gvar_54)
	Gvar_59 = true
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	WaitFrames(60,39)
	WaitFrames(30,38)
	::l65::
	if true then return end
end
function BreakGuardianWalls()
	DisableObject(Trigger)
	WallMakeSilent(true)
	AudioEvent("WallDestroyedStone",Gvar_48)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	OpenSecretWallGroup(Gvar_57)
	BreakWallGroup(Gvar_58)
	if true then return end
end
function GuardianArrivesInArena()
	if not ObjIsCaller(Gvar_53) then 
		goto l30
	end
	DisableObject(Trigger)
	ObjLookAtObj(Gvar_53,GetHostPlayer())
	DisableObject(Gvar_54)
	WaitFrames(30,37)
	::l30::
	if true then return end
end
function GuardianDie()
	if not Gvar_60 == 0 then 
		goto l65
	end
	Gvar_60 = true
	UnlockDoor(Gvar_50)
	UnlockDoor(Gvar_49)
	UnlockDoor(Gvar_52)
	UnlockDoor(Gvar_51)
	TeleportWaypoint(Gvar_48,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagDrop",Gvar_48)
	PrintToAll("War04d:WarriorDie")
	PlayerGiveExp(GetHostPlayer(),700)
	PopMusicStack()
	::l65::
	if true then return end
end
function ClearGuardianDoor()
	if not ObjIsCaller(GetHostPlayer()) == 0 then 
		goto l22
	end
	TeleportObj(Caller,GetWaypointX(Gvar_56),GetWaypointY(Gvar_56))
	::l22::
	if true then return end
end
function EnableKeeper()
	ObjLookAtObj(Gvar_64,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_64,0.83)
	if true then return end
end
function InitializeKeeper()
	Gvar_64 = ObjFromName("Keeper")
	Gvar_65 = ObjFromName("LeftKeeperEntranceDoor")
	Gvar_66 = ObjFromName("RightKeeperEntranceDoor")
	Gvar_67 = ObjFromName("LeftKeeperExitDoor")
	Gvar_68 = ObjFromName("RightKeeperExitDoor")
	Gvar_69 = ObjFromName("KeeperDoorTrigger")
	Gvar_70[0] = WaypointFromName("BlinkWP1")
	Gvar_70[1] = WaypointFromName("BlinkWP2")
	Gvar_70[2] = WaypointFromName("BlinkWP3")
	Gvar_70[3] = WaypointFromName("BlinkWP4")
	Gvar_71 = WaypointFromName("KeeperEnterWP")
	Gvar_72 = WaypointFromName("KeeperDoorWP")
	LockDoor(Gvar_67)
	LockDoor(Gvar_68)
	if true then return end
end
function EnemyGoHome()
	if not ObjIsHostileTo(GetHostPlayer(),Caller) and ScriptCaller() ~= Gvar_64 then 
		goto l21
	end
	MonsterGotoHome(Caller)
	::l21::
	if true then return end
end
function GoInvisible()
	var_6 = 0
	var_7 = 0
	Gvar_75 = Gvar_75 + 1
	if not Gvar_63 == Gvar_62 then 
		goto l37
	end
	Gvar_63 = Gvar_61
	if true then return end
	goto l44
	::l37::
	Gvar_63 = Gvar_62
	::l44::
	var_3 = GetObjX(Gvar_64)
	var_4 = GetObjY(Gvar_64)
	var_0 = 0
	::l68::
	if not var_0 < 4 then 
		goto l118
	end
	var_5[var_0] = GetDistance(var_3,var_4,GetWaypointX(Gvar_70[var_0]),GetWaypointY(Gvar_70[var_0]))
	var_0 = var_0 + 1
	goto l68
	::l118::
	var_0 = 0
	::l124::
	if not var_0 < 4 then 
		goto l171
	end
	if not var_5[var_0] > var_6 then 
		goto l163
	end
	var_6 = var_5[var_0]
	var_7 = var_0
	::l163::
	var_0 = var_0 + 1
	goto l124
	::l171::
	if not GetObjHealth(Gvar_64) > 0 then 
		goto l287
	end
	var_1 = GetWaypointX(Gvar_70[var_7])
	var_2 = GetWaypointY(Gvar_70[var_7])
	if not Gvar_75 >= 4 then 
		goto l230
	end
	Gvar_75 = 0
	ApplyEnchant(Gvar_64,"ENCHANT_INVISIBLE",3)
	::l230::
	PlayFX("TELEPORT",var_3,var_4,0,0)
	TeleportWaypoint(Gvar_48,var_3,var_4)
	AudioEvent("BlinkCast",Gvar_48)
	PlayFX("SMOKE_BLAST",var_1,var_2,0,0)
	TeleportObj(Gvar_64,var_1,var_2)
	::l287::
	if true then return end
end
function DisableKeeperDoorTrigger()
	DisableObject(Gvar_69)
	if true then return end
end
function KeeperEnter()
	var_0 = GetWaypointX(Gvar_71)
	var_1 = GetWaypointY(Gvar_71)
	if not ObjIsCaller(GetHostPlayer()) and Gvar_74 == false then 
		goto l106
	end
	EnableObject(Gvar_69)
	PushMusicStack()
	PlayMusic(4,100)
	Gvar_74 = true
	PlayFX("TELEPORT",var_0,var_1,0,0)
	AudioEvent("TeleportIn",Gvar_71)
	TeleportObj(Gvar_64,var_0,var_1)
	LockDoor(Gvar_65)
	LockDoor(Gvar_66)
	WaitFrames(1,46)
	WaitFrames(30,50)
	::l106::
	if true then return end
end
function KeeperDie()
	if not Gvar_73 == 0 then 
		goto l65
	end
	PopMusicStack()
	Gvar_73 = true
	TeleportWaypoint(Gvar_48,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagCapture",Gvar_48)
	PrintToAll("War04f:WizardDie")
	PlayerGiveExp(GetHostPlayer(),1000)
	UnlockDoor(Gvar_68)
	UnlockDoor(Gvar_67)
	UnlockDoor(Gvar_66)
	UnlockDoor(Gvar_65)
	::l65::
	if true then return end
end
function ClearKeeperDoor()
	if not ObjIsCaller(GetHostPlayer()) == 0 then 
		goto l22
	end
	TeleportObj(Caller,GetWaypointX(Gvar_72),GetWaypointY(Gvar_72))
	::l22::
	if true then return end
end
function InitializeSkullGuns()
	Gvar_91 = ObjFromName("ArrowTrap01")
	Gvar_92 = ObjFromName("ArrowTrap02")
	Gvar_93 = ObjFromName("ArrowTrap03")
	Gvar_94 = ObjFromName("ArrowTrap04")
	Gvar_95 = ObjFromName("ArrowTrap05")
	Gvar_96 = ObjFromName("ArrowTrap06")
	Gvar_97 = ObjFromName("ArrowTrap07")
	Gvar_98 = ObjFromName("ArrowTrap08")
	Gvar_99 = ObjFromName("ArrowTrap09")
	Gvar_100 = ObjFromName("ArrowTrap10")
	Gvar_101 = ObjFromName("ArrowTrap11")
	if true then return end
end
function InitializeMonsterGroups()
	Gvar_77 = ObjGroupFromName("MonsterGroup01")
	if true then return end
end
function MapInitialize()
	Gvar_48 = WaypointFromName("AudioOrigin")
	Gvar_76 = WaypointFromName("SecretAudioOrigin")
	InitializeSkullGuns()
	InitializeSkeletonAmbush()
	InitializeGuardian()
	InitializeKeeper()
	InitializeFistTraps()
	InitializeHallwayArrowTraps()
	InitializeMonsterGroups()
	InitializeBlockTrap()
	if true then return end
end
function PlayerDeath()
	DeathScreen(4)
	if true then return end
end
function EnableMonsterGroup01()
	DisableObject(Trigger)
	EnableObjectGroup(Gvar_77)
	if true then return end
end
function SecretSFX()
	TeleportWaypoint(Gvar_76,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_76)
	if true then return end
end
function Secret01Found()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	MonsterSetAggressiveness(ObjFromName("Secret01Spider"),0.83)
	SecretSFX()
	if true then return end
end
function Secret02Found()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	SecretSFX()
	if true then return end
end
function CheckRows(arg_0)
	var_1 = arg_0
	if var_1 == 1 then 
		goto l97
	end
	if var_1 == 2 then 
		goto l119
	end
	if var_1 == 3 then 
		goto l141
	end
	if var_1 == 4 then 
		goto l163
	end
	if var_1 == 5 then 
		goto l185
	end
	if var_1 == 6 then 
		goto l207
	end
	if var_1 == 7 then 
		goto l229
	end
	if var_1 == 8 then 
		goto l251
	end
	if var_1 == 9 then 
		goto l273
	end
	if var_1 == 10 then 
		goto l295
	end
	if var_1 == 11 then 
		goto l317
	end
	goto l339
	::l97::
	if not Gvar_78 > 0 then 
		goto l112
	end
	EnableObject(Gvar_91)
	goto l117
	::l112::
	DisableObject(Gvar_91)
	::l117::
	goto l339
	::l119::
	if not Gvar_79 > 0 then 
		goto l134
	end
	EnableObject(Gvar_92)
	goto l139
	::l134::
	DisableObject(Gvar_92)
	::l139::
	goto l339
	::l141::
	if not Gvar_80 > 0 then 
		goto l156
	end
	EnableObject(Gvar_93)
	goto l161
	::l156::
	DisableObject(Gvar_93)
	::l161::
	goto l339
	::l163::
	if not Gvar_81 > 0 then 
		goto l178
	end
	EnableObject(Gvar_94)
	goto l183
	::l178::
	DisableObject(Gvar_94)
	::l183::
	goto l339
	::l185::
	if not Gvar_82 > 0 then 
		goto l200
	end
	EnableObject(Gvar_95)
	goto l205
	::l200::
	DisableObject(Gvar_95)
	::l205::
	goto l339
	::l207::
	if not Gvar_83 > 0 then 
		goto l222
	end
	EnableObject(Gvar_96)
	goto l227
	::l222::
	DisableObject(Gvar_96)
	::l227::
	goto l339
	::l229::
	if not Gvar_84 > 0 then 
		goto l244
	end
	EnableObject(Gvar_97)
	goto l249
	::l244::
	DisableObject(Gvar_97)
	::l249::
	goto l339
	::l251::
	if not Gvar_85 > 0 then 
		goto l266
	end
	EnableObject(Gvar_98)
	goto l271
	::l266::
	DisableObject(Gvar_98)
	::l271::
	goto l339
	::l273::
	if not Gvar_86 > 0 then 
		goto l288
	end
	EnableObject(Gvar_99)
	goto l293
	::l288::
	DisableObject(Gvar_99)
	::l293::
	goto l339
	::l295::
	if not Gvar_87 > 0 then 
		goto l310
	end
	EnableObject(Gvar_100)
	goto l315
	::l310::
	DisableObject(Gvar_100)
	::l315::
	goto l339
	::l317::
	if not Gvar_88 > 0 then 
		goto l332
	end
	EnableObject(Gvar_101)
	goto l337
	::l332::
	DisableObject(Gvar_101)
	::l337::
	goto l339
	::l339::
	if true then return end
end
function ActivateRow01()
	Gvar_78 = Gvar_78 + 1
	CheckRows(1)
	if true then return end
end
function DisableRow01()
	Gvar_78 = Gvar_78 - 1
	CheckRows(1)
	if true then return end
end
function ActivateRow02()
	Gvar_79 = Gvar_79 + 1
	CheckRows(2)
	if true then return end
end
function DisableRow02()
	Gvar_79 = Gvar_79 - 1
	CheckRows(2)
	if true then return end
end
function ActivateRow03()
	Gvar_80 = Gvar_80 + 1
	CheckRows(3)
	if true then return end
end
function DisableRow03()
	Gvar_80 = Gvar_80 - 1
	CheckRows(3)
	if true then return end
end
function ActivateRow04()
	Gvar_81 = Gvar_81 + 1
	CheckRows(4)
	if true then return end
end
function DisableRow04()
	Gvar_81 = Gvar_81 - 1
	CheckRows(4)
	if true then return end
end
function ActivateRow05()
	Gvar_82 = Gvar_82 + 1
	CheckRows(5)
	if true then return end
end
function DisableRow05()
	Gvar_82 = Gvar_82 - 1
	CheckRows(5)
	if true then return end
end
function ActivateRow06()
	Gvar_83 = Gvar_83 + 1
	CheckRows(6)
	if true then return end
end
function DisableRow06()
	Gvar_83 = Gvar_83 - 1
	CheckRows(6)
	if true then return end
end
function ActivateRow07()
	Gvar_84 = Gvar_84 + 1
	CheckRows(7)
	if true then return end
end
function DisableRow07()
	Gvar_84 = Gvar_84 - 1
	CheckRows(7)
	if true then return end
end
function ActivateRow08()
	Gvar_85 = Gvar_85 + 1
	CheckRows(8)
	if true then return end
end
function DisableRow08()
	Gvar_85 = Gvar_85 - 1
	CheckRows(8)
	if true then return end
end
function ActivateRow09()
	Gvar_86 = Gvar_86 + 1
	CheckRows(9)
	if true then return end
end
function DisableRow09()
	Gvar_86 = Gvar_86 - 1
	CheckRows(9)
	if true then return end
end
function ActivateRow10()
	Gvar_87 = Gvar_87 + 1
	CheckRows(10)
	if true then return end
end
function DisableRow10()
	Gvar_87 = Gvar_87 - 1
	CheckRows(10)
	if true then return end
end
function ActivateRow11()
	Gvar_88 = Gvar_88 + 1
	CheckRows(11)
	if true then return end
end
function DisableRow11()
	Gvar_88 = Gvar_88 - 1
	CheckRows(11)
	if true then return end
end