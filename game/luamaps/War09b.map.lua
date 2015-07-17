
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_53 = false
	Gvar_54 = 0
	Gvar_55 = 1
	Gvar_56 = 2
	Gvar_57 = 3
	Gvar_58 = 4
	Gvar_62 = Gvar_54
	Gvar_63 = false
	Gvar_64 = false
	Gvar_65 = false
	Gvar_66 = false
	Gvar_67 = false
	Gvar_68 = 0
	Gvar_69 = 1
	Gvar_70 = 2
	Gvar_71 = 3
	Gvar_72 = 4
	Gvar_73 = 5
	Gvar_74 = 15
	Gvar_75 = 2
	if true then return end
end
function PlaySwamp()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(29,100)
	::l12::
	if true then return end
end
function PlaySwamp2()
	PlayMusic(29,100)
	if true then return end
end
function PlayAction()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(26,100)
	::l12::
	if true then return end
end
function PlayOgre()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(7,100)
	::l12::
	if true then return end
end
function PlayerDeath()
	DeathScreen(9)
	if true then return end
end
function AidanDialogStart()
	var_0 = Gvar_62
	if (var_0 == Gvar_54) then 
		goto l54
	end
	if (var_0 == Gvar_55) then 
		goto l74
	end
	if (var_0 == Gvar_56) then 
		goto l82
	end
	if (var_0 == Gvar_57) then 
		goto l90
	end
	if (var_0 == Gvar_58) then 
		goto l103
	end
	goto l116
	::l54::
	CancelChat(Gvar_5)
	StartDialogWithCaller("SwordsmanHurt","War09a:AidanGreet1")
	Gvar_53 = true
	goto l116
	::l74::
	StartDialogWithCaller("SwordsmanHurt","War09a:AidanGreet2")
	goto l116
	::l82::
	StartDialogWithCaller("SwordsmanHurt","War09a:AidanWaiting")
	goto l116
	::l90::
	CancelChat(Gvar_5)
	StartDialogWithCaller("SwordsmanHurt","War09a:AidanThankful")
	goto l116
	::l103::
	CancelChat(Gvar_5)
	StartDialogWithCaller("SwordsmanHurt","War09a:AidanLeaving")
	goto l116
	::l116::
	if true then return end
end
function AidanDialogEnd()
	var_0 = Gvar_62
	if (var_0 == Gvar_54) then 
		goto l54
	end
	if (var_0 == Gvar_55) then 
		goto l63
	end
	if (var_0 == Gvar_56) then 
		goto l72
	end
	if (var_0 == Gvar_57) then 
		goto l74
	end
	if (var_0 == Gvar_58) then 
		goto l150
	end
	goto l152
	::l54::
	Gvar_62 = Gvar_55
	goto l152
	::l63::
	Gvar_62 = Gvar_56
	goto l152
	::l72::
	goto l152
	::l74::
	Gvar_53 = true
	Gvar_66 = true
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	CancelDialog(Gvar_5)
	PlayerGiveExp(GetHostPlayer(),1000)
	InvPutObj(GetHostPlayer(),Gvar_24)
	PrintToAll("GeneralPrint:FindScroll")
	MonsterFollowObj(Gvar_5,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_5,0.5)
	ObjSetMaster(GetHostPlayer(),Gvar_5)
	MonsterMakeFriendly(Gvar_5)
	goto l152
	::l150::
	goto l152
	::l152::
	if true then return end
end
function WispInitialize()
	Gvar_76[0] = ObjFromName("Wisp2")
	Gvar_78[0] = Gvar_68
	Gvar_77[0] = WaypointFromName("Wisp2Dest")
	Gvar_76[1] = ObjFromName("Wisp3")
	Gvar_78[1] = Gvar_68
	Gvar_77[1] = WaypointFromName("Wisp3Dest")
	if true then return end
end
function MapInitialize()
	Gvar_5 = ObjFromName("Aidan")
	Gvar_6 = ObjFromName("DeadPrisoner")
	Gvar_7 = ObjFromName("Mystic_Brotherhood")
	Gvar_8 = ObjFromName("OgreCageDoor01")
	Gvar_9 = ObjFromName("CheckRescueTrigger")
	Gvar_10 = ObjFromName("PitElev02")
	Gvar_11 = ObjFromName("PitElev03")
	Gvar_12 = ObjFromName("CryptTrigger01")
	Gvar_13 = ObjFromName("CryptEnd1")
	Gvar_14 = ObjFromName("CryptDoor3")
	Gvar_15 = ObjFromName("CryptDoor4")
	Gvar_16 = ObjFromName("CryptGuardian")
	Gvar_17 = ObjFromName("UrchinCageDoor")
	Gvar_18 = ObjFromName("UrchinShaman")
	Gvar_19 = ObjFromName("Urchin1")
	Gvar_20 = ObjFromName("Urchin2")
	Gvar_21 = ObjFromName("Urchin3")
	Gvar_22 = ObjFromName("Urchin4")
	Gvar_4 = ObjFromName("Necromancer")
	Gvar_23 = ObjFromName("OgreDude")
	Gvar_24 = ObjFromName("WarlordScroll")
	Gvar_37 = WallGroupFromName("Surprise02Walls")
	Gvar_38 = WallGroupFromName("Surprise02DestWalls")
	Gvar_39 = WallGroupFromName("GraveyardTrapWalls")
	Gvar_40 = WallGroupFromName("GraveyardTrapWalls2")
	Gvar_41 = WallGroupFromName("CryptWall01")
	Gvar_42 = WallGroupFromName("SubGraveyardWalls")
	Gvar_25 = ObjGroupFromName("GraveyardTrapEnemies")
	Gvar_26 = ObjGroupFromName("TriggerGroup01")
	Gvar_27 = ObjGroupFromName("TriggerGroup02")
	Gvar_28 = ObjGroupFromName("SubGraveyardTriggers")
	Gvar_29 = ObjGroupFromName("SubGraveyardCreatures")
	Gvar_30 = ObjGroupFromName("CryptGuardianTriggers")
	Gvar_31 = ObjGroupFromName("CryptWarriorTriggers")
	Gvar_32 = ObjGroupFromName("UrchinPrisoners")
	Gvar_33 = ObjGroupFromName("Secret03Enemies")
	Gvar_34 = ObjGroupFromName("Secret03Triggers")
	Gvar_35 = ObjGroupFromName("Secret04Triggers")
	Gvar_36 = ObjGroupFromName("Secret06Triggers")
	Gvar_45[0] = WaypointFromName("CreateWP1")
	Gvar_45[1] = WaypointFromName("CreateWP2")
	Gvar_45[2] = WaypointFromName("CreateWP3")
	Gvar_45[3] = WaypointFromName("CreateWP4")
	Gvar_45[4] = WaypointFromName("CreateWP5")
	Gvar_45[5] = WaypointFromName("CreateWP6")
	Gvar_45[6] = WaypointFromName("CreateWP7")
	Gvar_45[7] = WaypointFromName("CreateWP8")
	Gvar_45[8] = WaypointFromName("CreateWP9")
	Gvar_43 = WaypointFromName("VileZombieCreateWP01")
	Gvar_44 = WaypointFromName("GhostCreateWP01")
	Gvar_49 = WaypointFromName("FaceHereWP")
	Gvar_46[0] = WaypointFromName("TeleWP1")
	Gvar_46[1] = WaypointFromName("TeleWP2")
	Gvar_46[2] = WaypointFromName("TeleWP3")
	Gvar_47 = WaypointFromName("CryptGuardianEntrance")
	Gvar_48 = WaypointFromName("CryptWarriorEntrance")
	Gvar_50 = WaypointFromName("AidanWait")
	Gvar_51 = WaypointFromName("AidanLook")
	Gvar_52 = WaypointFromName("PlayerSounds")
	LockDoor(Gvar_17)
	CinematicFadeout()
	WispInitialize()
	SetDialogPortrait(Gvar_5,"AidanPic")
	SetupDialog(Gvar_5,"NORMAL",7,8)
	ObjSetMaster(Gvar_23,Gvar_5)
	DamageObject(Gvar_6,0,50,8)
	if true then return end
end
function AidanRescued()
	DisableObject(Gvar_9)
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	Gvar_62 = Gvar_57
	ForceDialog(Gvar_5,GetHostPlayer())
	if true then return end
end
function KeepOut()
	if not (ObjIsHostileTo(Caller,GetHostPlayer())) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function AidanNearPlayer()
	if not (Gvar_53 == false and ObjIsCaller(GetHostPlayer())) then 
		goto l49
	end
	SayChat(Gvar_5,"War09a:AidanPlea")
	if not (Gvar_65 == false) then 
		goto l49
	end
	ObjResetMaster(Gvar_5)
	ObjSetMaster(GetHostPlayer(),Gvar_5)
	Gvar_65 = true
	::l49::
	if true then return end
end
function CheckRescue()
	if not (DoorIsLocked(Gvar_8) == false) then 
		goto l23
	end
	if not (GetObjHealth(Gvar_5) > 0) then 
		goto l23
	end
	AidanRescued()
	::l23::
	if true then return end
end
function AidanMustGo()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l8
	end
	PlayOgre()
	::l8::
	if not (ObjIsCaller(GetHostPlayer()) and Gvar_64 == false) then 
		goto l55
	end
	Gvar_64 = true
	PlayerGiveExp(GetHostPlayer(),500)
	JournalUpdateEntry(GetHostPlayer(),"FindOutpost",4)
	JournalAddEntry(GetHostPlayer(),"FindLOTD",2)
	PrintToAll("Con01a:NewJournalEntry")
	::l55::
	if not (ObjIsCaller(GetHostPlayer()) and Gvar_66 == true and GetObjHealth(Gvar_5) > 0 and Gvar_67 == false) then 
		goto l157
	end
	Gvar_67 = true
	ObjAddHealth(Gvar_5,120)
	SetupDialog(Gvar_5,"NORMAL",7,8)
	Gvar_62 = Gvar_58
	MonsterGuardArea(Gvar_5,GetWaypointX(Gvar_50),GetWaypointY(Gvar_50),GetWaypointX(Gvar_51),GetWaypointY(Gvar_51),0)
	MonsterMakeHostile(Gvar_5)
	ObjSetMaster(GetHostPlayer(),Gvar_5)
	::l157::
	if true then return end
end
function DestroyAidan()
	if not (Gvar_67 == true) then 
		goto l14
	end
	DeleteObject(Gvar_5)
	::l14::
	if true then return end
end
function Secret03Declare()
	DisableObjectGroup(Gvar_34)
	EnableObjectGroup(Gvar_33)
	TeleportWaypoint(Gvar_52,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_52)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),5)
	if true then return end
end
function Secret04Declare()
	DisableObjectGroup(Gvar_35)
	TeleportWaypoint(Gvar_52,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_52)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),150)
	if true then return end
end
function Secret05Declare()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_52,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_52)
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function Secret06Declare()
	DisableObjectGroup(Gvar_36)
	TeleportWaypoint(Gvar_52,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_52)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	if true then return end
end
function Patrol()
	MonsterGoRoam(Trigger)
	if true then return end
end
function GoMedieval()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	MonsterSetAggressiveness(Trigger,0.83)
	::l13::
	if true then return end
end
function GoNormal()
	MonsterSetAggressiveness(Trigger,0.5)
	if true then return end
end
function StopAndListen()
	var_0 = RandomInteger(1,3)
	if not (ObjIsCaller(GetHostPlayer()) and var_0 == 1) then 
		goto l62
	end
	MonsterWait(Trigger,45)
	ObjLookAtObj(Trigger,Caller)
	if not (ObjCanInteractWith(Trigger,Caller)) then 
		goto l57
	end
	MonsterSetAggressiveness(Trigger,0.5)
	goto l62
	::l57::
	MonsterIdle(Trigger)
	::l62::
	if true then return end
end
function ReturnHome()
	MonsterSetAggressiveness(Trigger,0.5)
	MonsterGotoHome(Trigger)
	if true then return end
end
function EnablePitElev02()
	EnableObject(Gvar_10)
	if true then return end
end
function EnablePitElev03()
	EnableObject(Gvar_11)
	if true then return end
end
function GraveyardCreateOrders()
	var_0 = GetWaypointX(Gvar_43)
	var_1 = GetWaypointY(Gvar_43)
	var_2 = GetWaypointX(Gvar_44)
	var_3 = GetWaypointY(Gvar_44)
	var_4 = GetWaypointX(Gvar_49)
	var_5 = GetWaypointY(Gvar_49)
	SetObjFacing(Gvar_60,224)
	SetObjFacing(Gvar_61,192)
	MonsterGuardArea(Gvar_60,var_0,var_1,var_4,var_5,500)
	MonsterGuardArea(Gvar_61,var_2,var_3,var_4,var_5,500)
	if true then return end
end
function GraveyardTrapTrigger()
	DisableObjectGroup(Gvar_26)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_39)
	WallMakeSilent(false)
	BreakWallGroup(Gvar_40)
	EnableObjectGroup(Gvar_25)
	Gvar_60 = SpawnObject("VileZombie",Gvar_43)
	Gvar_61 = SpawnObject("Ghost",Gvar_44)
	WaitFrames(1,28)
	if true then return end
end
function SubGraveSurprise()
	DisableObjectGroup(Gvar_28)
	EnableObjectGroup(Gvar_29)
	BreakWallGroup(Gvar_42)
	if true then return end
end
function CryptGuardian()
	var_0 = GetWaypointX(Gvar_47)
	var_1 = GetWaypointY(Gvar_47)
	DisableObjectGroup(Gvar_30)
	LockDoor(Gvar_14)
	LockDoor(Gvar_15)
	EnableObject(Gvar_16)
	ApplyEnchant(Gvar_16,"ENCHANT_INVISIBLE",2)
	TeleportObj(Gvar_16,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	if true then return end
end
function TurnInvisible()
	ApplyEnchant(Gvar_16,"ENCHANT_INVISIBLE",1.5)
	if true then return end
end
function UnlockCryptDoors2()
	UnlockDoor(Gvar_14)
	UnlockDoor(Gvar_15)
	if true then return end
end
function CreatureOrders()
	var_0 = 0
	::l6::
	if not (var_0 < 9) then 
		goto l53
	end
	MonsterSetWayFlag(Gvar_59[var_0],1)
	MonsterGoRoam(Gvar_59[var_0])
	MonsterSetAggressiveness(Gvar_59[var_0],0.83)
	var_0 = var_0 + 1
	goto l6
	::l53::
	if true then return end
end
function CreateZombies01()
	DisableObjectGroup(Gvar_27)
	EnableObject(Gvar_4)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_37)
	WallMakeSilent(false)
	BreakWallGroup(Gvar_38)
	var_0 = 0
	::l36::
	if not (var_0 < 5) then 
		goto l71
	end
	Gvar_59[var_0] = SpawnObject("Zombie",Gvar_45[var_0])
	var_0 = var_0 + 1
	goto l36
	::l71::
	var_0 = 5
	::l77::
	if not (var_0 < 7) then 
		goto l112
	end
	Gvar_59[var_0] = SpawnObject("Ghost",Gvar_45[var_0])
	var_0 = var_0 + 1
	goto l77
	::l112::
	var_0 = 7
	::l118::
	if not (var_0 < 9) then 
		goto l153
	end
	Gvar_59[var_0] = SpawnObject("VileZombie",Gvar_45[var_0])
	var_0 = var_0 + 1
	goto l118
	::l153::
	WaitFrames(1,34)
	if true then return end
end
function NecroTeleport()
	var_2 = RandomInteger(0,2)
	var_0 = GetWaypointX(Gvar_46[var_2])
	var_1 = GetWaypointY(Gvar_46[var_2])
	if not (ObjIsCaller(Gvar_4)) then 
		goto l127
	end
	ApplyEnchant(Caller,"ENCHANT_INVISIBLE",1)
	PlayFX("BLUE_SPARKS",GetObjX(Caller),GetObjY(Caller),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Caller),GetObjY(Caller),0,0)
	TeleportObj(Gvar_4,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	::l127::
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l135
	end
	PlaySwamp()
	::l135::
	if true then return end
end
function NecroTeleportInjured()
	var_2 = RandomInteger(0,2)
	var_0 = GetWaypointX(Gvar_46[var_2])
	var_1 = GetWaypointY(Gvar_46[var_2])
	MonsterWait(Trigger,15)
	ApplyEnchant(Trigger,"ENCHANT_INVISIBLE",2)
	PlayFX("BLUE_SPARKS",GetObjX(Trigger),GetObjY(Trigger),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Trigger),GetObjY(Trigger),0,0)
	TeleportObj(Trigger,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	if true then return end
end
function HuntPlayer()
	MonsterGoHunt(Trigger)
	if true then return end
end
function FreeUrchins01()
	UnlockDoor(Gvar_17)
	if not (Gvar_63 == false) then 
		goto l126
	end
	Gvar_63 = true
	ObjSetMaster(GetHostPlayer(),Gvar_19)
	ObjSetMaster(GetHostPlayer(),Gvar_20)
	ObjSetMaster(GetHostPlayer(),Gvar_21)
	ObjSetMaster(GetHostPlayer(),Gvar_22)
	ObjSetMaster(GetHostPlayer(),Gvar_18)
	MonsterSetWayFlag(Gvar_18,1)
	MonsterSetWayFlag(Gvar_19,1)
	MonsterSetWayFlag(Gvar_20,1)
	MonsterSetWayFlag(Gvar_21,1)
	MonsterSetWayFlag(Gvar_22,1)
	MonsterSetAggressiveness(Gvar_18,0.83)
	MonsterSetAggressiveness(Gvar_19,0.83)
	MonsterSetAggressiveness(Gvar_20,0.83)
	MonsterSetAggressiveness(Gvar_21,0.83)
	MonsterSetAggressiveness(Gvar_22,0.83)
	::l126::
	if true then return end
end
function LockUrchinCage()
	LockDoor(Gvar_17)
	if true then return end
end
function HurtUrchins01()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l23
	end
	MonsterSetAggressiveness(Trigger,0.5)
	MonsterFleeFrom(Trigger,Caller,120)
	::l23::
	if true then return end
end
function MapEntry()
	WallMakeSilent(false)
	if true then return end
end
function whichWisp:C:\nox\game\maps\War09b\Scripts\Wisps.scr(arg_0)
	var_1 = 0
	::l6::
	if not (var_1 < Gvar_75) then 
		goto l40
	end
	if not (Gvar_76[var_1] == arg_0) then 
		goto l32
	end
	if true then return var_1 end
	::l32::
	var_1 = var_1 + 1
	goto l6
	::l40::
	if true then return -1 end
	if true then return end
end
function WispAction(arg_0)
	var_2 = Gvar_78[arg_0]
	if (var_2 == Gvar_69) then 
		goto l40
	end
	if (var_2 == Gvar_71) then 
		goto l109
	end
	if (var_2 == Gvar_70) then 
		goto l166
	end
	goto l239
	::l40::
	var_1 = GetDistance(GetObjX(Gvar_76[arg_0]),GetObjY(Gvar_76[arg_0]),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	if not (var_1 < 70) then 
		goto l107
	end
	Gvar_78[arg_0] = Gvar_70
	MoveTo(Gvar_76[arg_0],Gvar_77[arg_0])
	::l107::
	goto l239
	::l109::
	ObjLookAtObj(Gvar_76[arg_0],GetHostPlayer())
	Gvar_79[arg_0] = Gvar_79[arg_0] + 1
	if not (Gvar_79[arg_0] > 4) then 
		goto l164
	end
	Gvar_78[arg_0] = Gvar_69
	MonsterFollowObj(Gvar_76[arg_0],GetHostPlayer())
	::l164::
	goto l239
	::l166::
	var_1 = GetDistance(GetObjX(Gvar_76[arg_0]),GetObjY(Gvar_76[arg_0]),GetWaypointX(Gvar_77[arg_0]),GetWaypointY(Gvar_77[arg_0]))
	if not (var_1 < 30) then 
		goto l237
	end
	Gvar_78[arg_0] = Gvar_72
	MonsterIdle(Gvar_76[arg_0])
	if true then return end
	::l237::
	goto l239
	::l239::
	WaitSpecial(Gvar_74,arg_0,44)
	if true then return end
end
function WispRecognize()
	if not (CheckObjClass(Caller,"PLAYER") == false) then 
		goto l14
	end
	if true then return end
	::l14::
	var_0 = whichWisp:C:\nox\game\maps\War09b\Scripts\Wisps.scr(ScriptTrigger())
	if not (var_0 < 0) then 
		goto l31
	end
	if true then return end
	::l31::
	var_1 = Gvar_78[var_0]
	if (var_1 == Gvar_68) then 
		goto l62
	end
	if (var_1 == Gvar_71) then 
		goto l101
	end
	goto l126
	::l62::
	Gvar_78[var_0] = Gvar_69
	MonsterFollowObj(Trigger,Caller)
	Gvar_80[var_0] = WaitSpecial(Gvar_74,var_0,44)
	goto l126
	::l101::
	Gvar_78[var_0] = Gvar_70
	MoveTo(Trigger,Gvar_77[var_0])
	goto l126
	::l126::
	if true then return end
end
function WispLoseSight()
	if not (CheckObjClass(Caller,"PLAYER") == false) then 
		goto l14
	end
	if true then return end
	::l14::
	var_0 = whichWisp:C:\nox\game\maps\War09b\Scripts\Wisps.scr(ScriptTrigger())
	if not (var_0 < 0) then 
		goto l31
	end
	if true then return end
	::l31::
	var_1 = Gvar_78[var_0]
	if (var_1 == Gvar_70) then 
		goto l53
	end
	goto l81
	::l53::
	Gvar_78[var_0] = Gvar_71
	Gvar_79[var_0] = 0
	MonsterIdle(Trigger)
	goto l81
	::l81::
	if true then return end
end
function WispGetMad()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l54
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterIdle(Trigger)
	var_0 = whichWisp:C:\nox\game\maps\War09b\Scripts\Wisps.scr(ScriptTrigger())
	if not (var_0 >= 0) then 
		goto l54
	end
	Gvar_78[var_0] = Gvar_73
	CancelWait(Gvar_80[var_0])
	::l54::
	if true then return end
end
function WispMedieval()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l18
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterIdle(Trigger)
	::l18::
	if true then return end
end