
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_7 = 0
	Gvar_8 = 1
	Gvar_9 = 2
	Gvar_10 = 3
	Gvar_11 = 0
	Gvar_12 = 1
	Gvar_13 = 2
	Gvar_14 = 3
	Gvar_15 = 4
	Gvar_16 = 5
	Gvar_17 = 6
	Gvar_18 = 7
	Gvar_19 = false
	Gvar_20 = true
	Gvar_21 = false
	Gvar_22 = false
	Gvar_23 = false
	Gvar_24 = 0
	Gvar_25 = 0
	Gvar_26 = Gvar_12
	Gvar_27 = 0
	Gvar_28 = Gvar_7
	Gvar_31 = 120
	if true then return end
end
function InitializeSniperRoom()
	Gvar_4 = ObjFromName("ExitGate")
	Gvar_5 = ObjFromName("SkeliGate01")
	Gvar_6 = ObjFromName("SkeliGate02")
	LockDoor(Gvar_4)
	LockDoor(Gvar_5)
	LockDoor(Gvar_6)
	if true then return end
end
function UnlockExitGate()
	UnlockDoor(Gvar_4)
	UnlockDoor(Gvar_5)
	UnlockDoor(Gvar_6)
	if true then return end
end
function setUpFlameLever()
	if not Gvar_19 then 
		goto l6
	end
	if true then return end
	::l6::
	Gvar_19 = true
	Gvar_26 = Gvar_12
	Gvar_25 = 2
	Gvar_24 = 0
	::l32::
	if not Gvar_24 < 56 then 
		goto l58
	end
	Gvar_32[Gvar_24] = 0
	Gvar_24 = Gvar_24 + 1
	goto l32
	::l58::
	flameLever()
	if true then return end
end
function flameLever()
	if not Gvar_19 then 
		goto l647
	end
	var_0 = Gvar_26
	if var_0 == Gvar_12 then 
		goto l86
	end
	if var_0 == Gvar_13 then 
		goto l165
	end
	if var_0 == Gvar_14 then 
		goto l244
	end
	if var_0 == Gvar_15 then 
		goto l309
	end
	if var_0 == Gvar_16 then 
		goto l374
	end
	if var_0 == Gvar_17 then 
		goto l439
	end
	if var_0 == Gvar_18 then 
		goto l518
	end
	if var_0 == Gvar_11 then 
		goto l583
	end
	goto l640
	::l86::
	Gvar_24 = 0
	::l92::
	if not Gvar_24 < 56 then 
		goto l136
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("SmallFlame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l92
	::l136::
	Gvar_26 = Gvar_13
	AudioEvent("FireballCast",Gvar_54)
	AudioEvent("FireballCast",Gvar_55)
	Gvar_25 = 2
	goto l640
	::l165::
	Gvar_24 = 0
	::l171::
	if not Gvar_24 < 56 then 
		goto l215
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("MediumFlame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l171
	::l215::
	Gvar_26 = Gvar_14
	AudioEvent("DemonBreath",Gvar_54)
	AudioEvent("DemonBreath",Gvar_55)
	Gvar_25 = 2
	goto l640
	::l244::
	Gvar_24 = 0
	::l250::
	if not Gvar_24 < 56 then 
		goto l294
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("Flame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l250
	::l294::
	Gvar_26 = Gvar_15
	Gvar_25 = 2
	goto l640
	::l309::
	Gvar_24 = 0
	::l315::
	if not Gvar_24 < 56 then 
		goto l359
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("LargeFlame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l315
	::l359::
	Gvar_26 = Gvar_16
	Gvar_25 = 150
	goto l640
	::l374::
	Gvar_24 = 0
	::l380::
	if not Gvar_24 < 56 then 
		goto l424
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("Flame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l380
	::l424::
	Gvar_26 = Gvar_17
	Gvar_25 = 2
	goto l640
	::l439::
	Gvar_24 = 0
	::l445::
	if not Gvar_24 < 56 then 
		goto l489
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("MediumFlame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l445
	::l489::
	Gvar_26 = Gvar_18
	AudioEvent("FireExtinguish",Gvar_54)
	AudioEvent("FireExtinguish",Gvar_55)
	Gvar_25 = 2
	goto l640
	::l518::
	Gvar_24 = 0
	::l524::
	if not Gvar_24 < 56 then 
		goto l568
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = SpawnObject("SmallFlame",Gvar_56[Gvar_24])
	Gvar_24 = Gvar_24 + 1
	goto l524
	::l568::
	Gvar_26 = Gvar_11
	Gvar_25 = 2
	goto l640
	::l583::
	Gvar_24 = 0
	::l589::
	if not Gvar_24 < 56 then 
		goto l624
	end
	DeleteObject(Gvar_32[Gvar_24])
	Gvar_32[Gvar_24] = 0
	Gvar_24 = Gvar_24 + 1
	goto l589
	::l624::
	Gvar_26 = Gvar_12
	Gvar_19 = false
	goto l640
	::l640::
	WaitFrames(Gvar_25,5)
	::l647::
	if true then return end
end
function skullHallOn()
	if not Gvar_20 then 
		goto l35
	end
	ApplySpellXYXY("SPELL_FIREBALL",3012,2229,3185,2403)
	ApplySpellXYXY("SPELL_FIREBALL",2896,2346,3070,2517)
	WaitFrames(60,6)
	::l35::
	if true then return end
end
function Zombie1Rise()
	var_0 = GetObjX(Gvar_41)
	var_1 = GetObjY(Gvar_41)
	ZombieStandUp(Gvar_41)
	AudioEvent("ZombieRecognize",WaypointFromName("ZombieAttackWP"))
	ObjLookAtObj(Gvar_33,Gvar_41)
	if true then return end
end
function Zombie2Rise()
	var_0 = GetObjX(Gvar_42)
	var_1 = GetObjY(Gvar_42)
	ZombieStandUp(Gvar_42)
	AudioEvent("ZombieRecognize",WaypointFromName("ZombieAttackWP"))
	ObjLookAtObj(Gvar_33,Gvar_42)
	if true then return end
end
function Zombie3Rise()
	var_0 = GetObjX(Gvar_43)
	var_1 = GetObjY(Gvar_43)
	ZombieStandUp(Gvar_43)
	AudioEvent("ZombieRecognize",WaypointFromName("ZombieAttackWP"))
	ObjLookAtObj(Gvar_33,Gvar_43)
	if true then return end
end
function ZombieAttackHecubah()
	EnableWaypointGroup(Gvar_59)
	DisableWaypointGroup(Gvar_58)
	MonsterAttackMelee(Gvar_41,GetWaypointX(WaypointFromName("ZombieAttackWP")),GetWaypointY(WaypointFromName("ZombieAttackWP")))
	MonsterAttackMelee(Gvar_42,GetWaypointX(WaypointFromName("ZombieAttackWP")),GetWaypointY(WaypointFromName("ZombieAttackWP")))
	MonsterAttackMelee(Gvar_43,GetWaypointX(WaypointFromName("ZombieAttackWP")),GetWaypointY(WaypointFromName("ZombieAttackWP")))
	if true then return end
end
function HecubahEncounterSEG4()
	SetupDialog(Gvar_33,"NORMAL",26,27)
	Gvar_28 = Gvar_10
	ForceDialog(Gvar_33,GetHostPlayer())
	if true then return end
end
function HecubahEncounterSEG3()
	SetupDialog(Gvar_34,"NEXT",26,27)
	Gvar_28 = Gvar_9
	ForceDialog(Gvar_34,GetHostPlayer())
	if true then return end
end
function hecGone()
	if not ObjIsCaller(Gvar_33) then 
		goto l32
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_33,GetWaypointX(Gvar_53),GetWaypointY(Gvar_53))
	DisableObject(Gvar_33)
	::l32::
	if true then return end
end
function ReleasePlayer()
	if not ObjIsCaller(Gvar_33) then 
		goto l91
	end
	DisableObject(Trigger)
	LockDoor(Gvar_39)
	LockDoor(Gvar_40)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_50)
	WallMakeSilent(false)
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(ObjFromName("War03b:Wolf1"),false)
	ObjFreeze(ObjFromName("War03b:Wolf2"),false)
	SetupDialog(Gvar_34,"NORMAL",16,17)
	Gvar_27 = 5
	ForceDialog(Gvar_34,GetHostPlayer())
	::l91::
	if true then return end
end
function necroDies()
	UnlockDoor(Gvar_39)
	UnlockDoor(Gvar_40)
	CancelDialog(Gvar_34)
	SetupDialog(Gvar_34,"NORMAL",16,17)
	Gvar_27 = 4
	ForceDialog(Gvar_34,GetHostPlayer())
	if true then return end
end
function necroTalkStart()
	var_0 = Gvar_27
	if var_0 == 1 then 
		goto l49
	end
	if var_0 == 2 then 
		goto l81
	end
	if var_0 == 3 then 
		goto l113
	end
	if var_0 == 4 then 
		goto l145
	end
	if var_0 == 5 then 
		goto l194
	end
	goto l240
	::l49::
	StartDialogWithCaller("DemonRecognize","Con04a:NecroTaunts")
	ObjFreeze(Gvar_34,true)
	ObjFreeze(Gvar_41,true)
	ObjFreeze(Gvar_43,true)
	goto l240
	::l81::
	StartDialogWithCaller("DemonRecognize","Con04a:NecroGloats")
	ObjFreeze(Gvar_34,true)
	ObjFreeze(Gvar_41,true)
	ObjFreeze(Gvar_43,true)
	goto l240
	::l113::
	StartDialogWithCaller("DemonRecognize","Con04a:NecroThreatens2")
	ObjFreeze(Gvar_34,true)
	ObjFreeze(Gvar_41,true)
	ObjFreeze(Gvar_43,true)
	goto l240
	::l145::
	DisableWaypointGroup(Gvar_59)
	EnableWaypointGroup(Gvar_60)
	ObjLookAtObj(Gvar_34,GetHostPlayer())
	StartDialogWithCaller("DemonRecognize","Con04a:NecroDies")
	ObjFreeze(Gvar_34,true)
	ObjFreeze(Gvar_41,true)
	ObjFreeze(Gvar_43,true)
	goto l240
	::l194::
	MonsterSetAggressiveness(Gvar_34,0.83)
	StartDialogWithCaller("DemonRecognize","Con04a:NecroThreatens")
	ObjLookAtObj(Gvar_34,GetHostPlayer())
	ObjFreeze(Gvar_34,true)
	ObjFreeze(Gvar_41,true)
	ObjFreeze(Gvar_43,true)
	goto l240
	::l240::
	if true then return end
end
function necroTalkEnd()
	CancelDialog(Gvar_34)
	ObjFreeze(Gvar_34,false)
	ObjFreeze(Gvar_41,false)
	ObjFreeze(Gvar_43,false)
	if not Gvar_27 == 4 then 
		goto l61
	end
	JournalUpdateEntry(GetHostPlayer(),"Chapter4SearchCrypts",4)
	JournalAddEntry(GetHostPlayer(),"Chapter4Escape",2)
	PrintToAll("Con02a:ObjectiveComplete")
	PrintToAll("Con01a:NewJournalEntry")
	::l61::
	if true then return end
end
function HecubahShootZombie1()
	ObjLookAtObj(Gvar_33,Gvar_41)
	ApplySpellObjObj("SPELL_FIREBALL",Gvar_33,Gvar_41)
	WaitFrames(30,19)
	if true then return end
end
function HecubahShootZombie2()
	ObjLookAtObj(Gvar_33,Gvar_42)
	ApplySpellObjObj("SPELL_FIREBALL",Gvar_33,Gvar_42)
	WaitFrames(30,20)
	if true then return end
end
function HecubahShootZombie3()
	ObjLookAtObj(Gvar_33,Gvar_43)
	ApplySpellObjObj("SPELL_FIREBALL",Gvar_33,Gvar_43)
	WaitFrames(30,12)
	if true then return end
end
function ZombieInjured()
	DamageObject(Trigger,0,100,1)
	if true then return end
end
function InitializeFistTraps()
	Gvar_30[0] = ObjFromName("FistTrap01")
	Gvar_30[1] = ObjFromName("FistTrap02")
	Gvar_30[2] = ObjFromName("FistTrap03")
	Gvar_30[3] = ObjFromName("FistTrap04")
	Gvar_30[4] = ObjFromName("FistTrap05")
	Gvar_30[5] = ObjFromName("FistTrap06")
	Gvar_30[6] = ObjFromName("FistTrap07")
	Gvar_30[7] = ObjFromName("FistTrap08")
	Gvar_30[8] = ObjFromName("FistTrap09")
	Gvar_30[9] = ObjFromName("FistTrap10")
	Gvar_30[10] = ObjFromName("FistTrap11")
	Gvar_30[11] = ObjFromName("FistTrap12")
	Gvar_30[12] = ObjFromName("FistTrap13")
	Gvar_29[0] = ObjFromName("FistTrapLight01")
	Gvar_29[1] = ObjFromName("FistTrapLight02")
	Gvar_29[2] = ObjFromName("FistTrapLight03")
	Gvar_29[3] = ObjFromName("FistTrapLight04")
	Gvar_29[4] = ObjFromName("FistTrapLight05")
	Gvar_29[5] = ObjFromName("FistTrapLight06")
	Gvar_29[6] = ObjFromName("FistTrapLight07")
	Gvar_29[7] = ObjFromName("FistTrapLight08")
	Gvar_29[8] = ObjFromName("FistTrapLight09")
	Gvar_29[9] = ObjFromName("FistTrapLight10")
	Gvar_29[10] = ObjFromName("FistTrapLight11")
	Gvar_29[11] = ObjFromName("FistTrapLight12")
	Gvar_29[12] = ObjFromName("FistTrapLight13")
	if true then return end
end
function MapInitialize()
	Gvar_24 = 0
	::l6::
	if not Gvar_24 < 56 then 
		goto l43
	end
	Gvar_56[Gvar_24] = WaypointFromName("FlameWay" + IntToString(Gvar_24 + 1))
	Gvar_24 = Gvar_24 + 1
	goto l6
	::l43::
	Gvar_33 = ObjFromName("Hecubah")
	Gvar_34 = ObjFromName("Necromancer")
	Gvar_35 = ObjFromName("EntranceGate1")
	Gvar_36 = ObjFromName("EntranceGate2")
	Gvar_37 = ObjFromName("EntranceGate3")
	Gvar_38 = ObjFromName("EntranceGate4")
	Gvar_39 = ObjFromName("PitGate1")
	Gvar_40 = ObjFromName("PitGate2")
	Gvar_41 = ObjFromName("DeadZombie1")
	Gvar_42 = ObjFromName("DeadZombie2")
	Gvar_43 = ObjFromName("DeadZombie3")
	Gvar_44 = ObjFromName("Zombie01")
	Gvar_45 = ObjFromName("Zombie02")
	Gvar_46 = ObjFromName("Zombie03")
	Gvar_47 = ObjFromName("FlameLever1")
	Gvar_48 = ObjFromName("FlameLever2")
	Gvar_49 = ObjGroupFromName("Zombies")
	Gvar_50 = WallGroupFromName("InvisibleBlockWall")
	Gvar_52 = WaypointFromName("SecretAudioOrigin")
	Gvar_54 = WaypointFromName("FlameSound1")
	Gvar_55 = WaypointFromName("FlameSound2")
	Gvar_51 = WaypointFromName("AudioOrigin")
	Gvar_57 = WaypointFromName("WP")
	Gvar_53 = WaypointFromName("HecubahStorage")
	Gvar_58 = WaypointGroupFromName("BeforeSetpieceWay")
	Gvar_59 = WaypointGroupFromName("SetpieceWay")
	Gvar_60 = WaypointGroupFromName("AfterSetpieceWay")
	DisableWaypointGroup(Gvar_59)
	DisableWaypointGroup(Gvar_60)
	DamageObject(Gvar_41,0,100,0)
	DamageObject(Gvar_42,0,100,0)
	DamageObject(Gvar_43,0,100,0)
	ZombieStayDead(Gvar_41)
	ZombieStayDead(Gvar_42)
	ZombieStayDead(Gvar_43)
	SetDialogPortrait(Gvar_34,"NecromancerPic")
	InitializeFistTraps()
	InitializeSniperRoom()
	if true then return end
end
function PlayerDeath()
	DeathScreen(4)
	if true then return end
end
function ToggleSkullHall()
	if not Gvar_20 then 
		goto l14
	end
	Gvar_20 = false
	goto l23
	::l14::
	Gvar_20 = true
	skullHallOn()
	::l23::
	if true then return end
end
function HecubahDialogStart()
	var_0 = Gvar_28
	if var_0 == Gvar_7 then 
		goto l45
	end
	if var_0 == Gvar_8 then 
		goto l53
	end
	if var_0 == Gvar_9 then 
		goto l61
	end
	if var_0 == Gvar_10 then 
		goto l76
	end
	goto l91
	::l45::
	StartDialogWithCaller("GhostRecognize","War04a:Hecubah")
	goto l91
	::l53::
	StartDialogWithCaller("GhostRecognize","War04a:HecubahSEG2")
	goto l91
	::l61::
	ObjLookAtObj(Gvar_34,GetHostPlayer())
	StartDialogWithCaller("DemonRecognize","Con04a:NecroWarnsHec")
	goto l91
	::l76::
	ObjLookAtObj(Gvar_33,GetHostPlayer())
	StartDialogWithCaller("GhostRecognize","War04a:HecubahSEG3")
	goto l91
	::l91::
	if true then return end
end
function HecubahDialogEnd()
	var_5 = Gvar_28
	if var_5 == Gvar_7 then 
		goto l45
	end
	if var_5 == Gvar_8 then 
		goto l83
	end
	if var_5 == Gvar_9 then 
		goto l234
	end
	if var_5 == Gvar_10 then 
		goto l254
	end
	goto l332
	::l45::
	WaitFrames(20,8)
	WaitFrames(45,7)
	WaitFrames(60,9)
	WaitFrames(60,10)
	Gvar_28 = Gvar_8
	CancelDialog(Gvar_33)
	goto l332
	::l83::
	ObjLookAtObj(Gvar_33,Gvar_42)
	Gvar_28 = Gvar_9
	CancelDialog(Gvar_33)
	MonsterSetAggressiveness(Gvar_41,0)
	MonsterSetAggressiveness(Gvar_42,0)
	MonsterSetAggressiveness(Gvar_43,0)
	PushObject(Gvar_41,40,GetObjX(Gvar_33),GetObjY(Gvar_33))
	PushObject(Gvar_42,40,GetObjX(Gvar_33),GetObjY(Gvar_33))
	PushObject(Gvar_43,40,GetObjX(Gvar_33),GetObjY(Gvar_33))
	ObjSetMaster(Gvar_39,Gvar_41)
	ObjSetMaster(Gvar_39,Gvar_42)
	ObjSetMaster(Gvar_39,Gvar_43)
	MonsterEventScript(Gvar_41,7,21)
	MonsterEventScript(Gvar_42,7,21)
	MonsterEventScript(Gvar_43,7,21)
	WaitFrames(20,18)
	goto l332
	::l234::
	Gvar_28 = Gvar_10
	CancelDialog(Gvar_34)
	WaitFrames(5,11)
	goto l332
	::l254::
	var_4 = WaypointFromName("WP")
	var_0 = GetObjX(Gvar_33)
	var_1 = GetObjY(Gvar_33)
	MonsterIdle(Gvar_34)
	UnlockDoor(Gvar_35)
	UnlockDoor(Gvar_36)
	LockDoor(Gvar_37)
	LockDoor(Gvar_38)
	EnableObject(Gvar_33)
	MoveTo(Gvar_33,var_4)
	Gvar_22 = true
	CancelDialog(Gvar_33)
	goto l332
	::l332::
	if true then return end
end
function AttackSuccessful()
	SetupDialog(Gvar_33,"NEXT",26,27)
	ForceDialog(Gvar_33,GetHostPlayer())
	if true then return end
end
function HecubahEncounterSEG2()
	SetDialogPortrait(Gvar_33,"HecubahPic")
	SetupDialog(Gvar_33,"NEXT",26,27)
	ForceDialog(Gvar_33,GetHostPlayer())
	if true then return end
end
function HecubahEncounterSEG1()
	if not Gvar_21 == 0 and ObjIsCaller(GetHostPlayer()) then 
		goto l54
	end
	Gvar_21 = true
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(ObjFromName("War03b:Wolf1"),true)
	ObjFreeze(ObjFromName("War03b:Wolf2"),true)
	CinematicBorders(true)
	WaitFrames(60,29)
	::l54::
	if true then return end
end
function ResetFistTrap(arg_0)
	EnableObject(Gvar_29[arg_0])
	EnableObject(Gvar_30[arg_0])
	TeleportWaypoint(Gvar_51,GetObjX(Gvar_30[arg_0]),GetObjY(Gvar_30[arg_0]))
	AudioEvent("TriggerReleased",Gvar_51)
	if true then return end
end
function DropFist(arg_0)
	ApplySpellObjXY("SPELL_FIST",Gvar_30[arg_0],GetObjX(Gvar_30[arg_0]),GetObjY(Gvar_30[arg_0]))
	DisableObject(Gvar_30[arg_0])
	DisableObject(Gvar_29[arg_0])
	WaitSpecial(Gvar_31,arg_0,31)
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
function NoEnemys()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function SecretSFX()
	TeleportWaypoint(Gvar_52,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_52)
	if true then return end
end
function FoundSecret01()
	DisableObject(Trigger)
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	SecretSFX()
	if true then return end
end
function FoundSecret02()
	DisableObject(Trigger)
	PlayerGiveExp(GetHostPlayer(),75)
	PrintToAll("GeneralPrint:SecretFound")
	SecretSFX()
	if true then return end
end