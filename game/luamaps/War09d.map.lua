
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_45 = 0
	Gvar_46 = 1
	Gvar_47 = 2
	Gvar_48 = 3
	Gvar_49 = 4
	Gvar_52 = 1000
	Gvar_53 = Gvar_45
	Gvar_54 = Gvar_48
	Gvar_57 = false
	Gvar_58 = false
	Gvar_59 = false
	Gvar_60 = false
	Gvar_61 = false
	Gvar_62 = false
	Gvar_63 = false
	Gvar_64 = false
	Gvar_65 = false
	Gvar_66 = false
	Gvar_67 = false
	Gvar_68 = false
	Gvar_69 = false
	Gvar_70 = false
	Gvar_71 = false
	Gvar_72 = false
	Gvar_73 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(9)
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("LoneWolf01")
	Gvar_5 = ObjFromName("Skel01a")
	Gvar_6 = ObjFromName("Skel02a")
	Gvar_7 = ObjFromName("Skel03a")
	Gvar_8 = ObjFromName("SquadLeader")
	Gvar_9 = ObjFromName("Cain")
	Gvar_10 = ObjFromName("Cain2")
	Gvar_11 = ObjFromName("CainWolf01")
	Gvar_12 = ObjFromName("CainWolf02")
	Gvar_13 = ObjFromName("CainWolf03")
	Gvar_14 = ObjFromName("Necromancer1")
	Gvar_15 = ObjFromName("Necromancer2")
	Gvar_16 = ObjFromName("Necromancer")
	Gvar_17 = ObjFromName("NecroStart")
	Gvar_18 = ObjFromName("Lich")
	Gvar_19 = ObjFromName("KeepOutTrigger")
	Gvar_20 = ObjFromName("TreasureLight")
	Gvar_21 = ObjGroupFromName("GoldTrapSpikes")
	Gvar_22 = ObjGroupFromName("WolfCaveTriggers")
	Gvar_23 = ObjGroupFromName("SkeletonSquad")
	Gvar_25 = ObjGroupFromName("NecroTriggers")
	Gvar_24 = ObjGroupFromName("ElevatorGroup1")
	Gvar_26 = ObjGroupFromName("SkeletonMarchTriggers")
	Gvar_27 = WallGroupFromName("SecretHallWalls01")
	Gvar_28 = WallGroupFromName("NecroWalls")
	Gvar_29 = WallGroupFromName("NecroSafetyWalls")
	Gvar_30 = WaypointFromName("NecroWP")
	Gvar_31 = WaypointFromName("GoldTrapWP1")
	Gvar_32 = WaypointFromName("GoldTrapWP2")
	Gvar_33 = WaypointFromName("GoldTrapWP3")
	Gvar_34 = WaypointFromName("GoldTrapWP4")
	Gvar_37 = WaypointFromName("WolfCreateWP01")
	Gvar_38 = WaypointFromName("WolfCreateWP02")
	Gvar_39 = WaypointFromName("LoneWolf01DestWP")
	Gvar_40 = WaypointFromName("Wolf01FacingWP")
	Gvar_35 = WaypointFromName("WolfCreate01Dest")
	Gvar_36 = WaypointFromName("WolfCreate02Dest")
	Gvar_41[0] = WaypointFromName("TeleWP0")
	Gvar_41[1] = WaypointFromName("TeleWP1")
	Gvar_41[2] = WaypointFromName("TeleWP2")
	Gvar_41[3] = WaypointFromName("TeleWP3")
	Gvar_41[4] = WaypointFromName("TeleWP4")
	Gvar_42[0] = WaypointFromName("WallSmokeWP0")
	Gvar_42[1] = WaypointFromName("WallSmokeWP1")
	Gvar_42[2] = WaypointFromName("WallSmokeWP2")
	Gvar_42[3] = WaypointFromName("WallSmokeWP3")
	Gvar_42[4] = WaypointFromName("WallSmokeWP4")
	Gvar_43 = WaypointFromName("PlayerSounds")
	Gvar_44 = WaypointGroupFromName("SearchNetwork1")
	SetDialogPortrait(Gvar_9,"WoundedConjurerPic")
	SetDialogPortrait(Gvar_10,"WoundedConjurerPic")
	SetDialogPortrait(Gvar_16,"NecromancerPic")
	CinematicFadeout()
	if true then return end
end
function PlaySwamp()
	PlayMusic(25,100)
	if true then return end
end
function PlayAction()
	PlayMusic(26,100)
	if true then return end
end
function PlayAction2()
	PlayMusic(28,100)
	if true then return end
end
function PlayMordwyn()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(21,100)
	::l12::
	if true then return end
end
function PlayOgre()
	PlayMusic(7,100)
	if true then return end
end
function PlayCaves()
	PlayMusic(18,100)
	if true then return end
end
function PlayWasteland()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(19,100)
	::l12::
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
function DisableGoldTrapSpikes()
	DisableObjectGroup(Gvar_21)
	if true then return end
end
function TriggerGoldTrapPoison()
	ApplySpellXYXY("SPELL_TOXIC_CLOUD",GetWaypointX(Gvar_31),GetWaypointY(Gvar_31),0,0)
	ApplySpellXYXY("SPELL_TOXIC_CLOUD",GetWaypointX(Gvar_32),GetWaypointY(Gvar_32),0,0)
	ApplySpellXYXY("SPELL_TOXIC_CLOUD",GetWaypointX(Gvar_33),GetWaypointY(Gvar_33),0,0)
	ApplySpellXYXY("SPELL_TOXIC_CLOUD",GetWaypointX(Gvar_34),GetWaypointY(Gvar_34),0,0)
	if true then return end
end
function TriggerGoldTrap()
	EnableObjectGroup(Gvar_21)
	WaitFrames(20,17)
	if true then return end
end
function ToggleElevatorGroup1()
	ToggleObjectGroup(Gvar_24)
	if true then return end
end
function DisableTL()
	DisableObject(Gvar_20)
	if true then return end
end
function WolfOrders()
	var_0 = GetWaypointX(Gvar_35)
	var_1 = GetWaypointY(Gvar_35)
	var_2 = GetWaypointX(Gvar_36)
	var_3 = GetWaypointY(Gvar_36)
	var_4 = GetWaypointX(Gvar_39)
	var_5 = GetWaypointY(Gvar_39)
	MonsterGuardArea(Gvar_50,var_0,var_1,var_4,var_5,350)
	MonsterGuardArea(Gvar_51,var_2,var_3,var_4,var_5,350)
	MonsterSetAggressiveness(Gvar_50,0.83)
	MonsterSetAggressiveness(Gvar_51,0.83)
	if true then return end
end
function CainDialogStart()
	var_0 = Gvar_53
	if (var_0 == Gvar_45) then 
		goto l36
	end
	if (var_0 == Gvar_46) then 
		goto l51
	end
	if (var_0 == Gvar_47) then 
		goto l66
	end
	goto l81
	::l36::
	StartDialogWithCaller("SwordsmanHurt","War09c:CainAsk")
	Gvar_57 = true
	goto l81
	::l51::
	StartDialogWithCaller("SwordsmanHurt","War09c:CainHealed")
	Gvar_57 = true
	goto l81
	::l66::
	StartDialogWithCaller("SwordsmanHurt","War09c:CainEscort")
	Gvar_57 = true
	goto l81
	::l81::
	if true then return end
end
function CainDialogEnd()
	var_2 = Gvar_53
	if (var_2 == Gvar_45) then 
		goto l36
	end
	if (var_2 == Gvar_46) then 
		goto l144
	end
	if (var_2 == Gvar_47) then 
		goto l187
	end
	goto l189
	::l36::
	var_0 = DialogGetResult(Gvar_9)
	if not (var_0 == 1) then 
		goto l136
	end
	var_1 = InvGetTopObj(GetHostPlayer())
	::l61::
	if not (var_1 ~= 0) then 
		goto l130
	end
	if not (CheckObjClass(var_1,"FOOD") and CheckInvObjNamed(var_1,"HEALTH_POTION")) then 
		goto l119
	end
	InvDropObj(GetHostPlayer(),var_1)
	DeleteObject(var_1)
	Gvar_55 = GetObjX(Gvar_9)
	Gvar_56 = GetObjY(Gvar_9)
	CainRescue()
	if true then return end
	::l119::
	var_1 = InvGetNextObj(var_1)
	goto l61
	::l130::
	PrintToAll("War09c:CainNoPotion")
	goto l142
	::l136::
	WaitFrames(1,29)
	::l142::
	goto l189
	::l144::
	MonsterFollowObj(Gvar_10,GetHostPlayer())
	MonsterMakeFriendly(Gvar_10)
	PrintToAll("War09c:SavedCain")
	PlayerGiveExp(GetHostPlayer(),2500)
	CancelDialog(Gvar_10)
	Gvar_61 = true
	Gvar_53 = Gvar_47
	goto l189
	::l187::
	goto l189
	::l189::
	if true then return end
end
function LichFight()
	EnableObject(Gvar_18)
	ApplyEnchant(Gvar_18,"ENCHANT_INVISIBLE",3)
	TeleportObj(Gvar_18,GetWaypointX(Gvar_41[3]),GetWaypointY(Gvar_41[3]))
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_41[3]),GetWaypointY(Gvar_41[3]),0,0)
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_41[3]),GetWaypointY(Gvar_41[3]),0,0)
	if true then return end
end
function NecroTalk()
	if not (ObjIsCaller(Gvar_16)) then 
		goto l30
	end
	DisableObject(Gvar_17)
	SetupDialog(Gvar_16,"NORMAL",45,46)
	ForceDialog(Gvar_16,GetHostPlayer())
	::l30::
	if true then return end
end
function MoveBody()
	DeleteObject(Gvar_9)
	TeleportObj(Gvar_10,Gvar_55,Gvar_56)
	if true then return end
end
function StartNecroFight2()
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	MonsterGoto(Gvar_16,GetWaypointX(Gvar_30),GetWaypointY(Gvar_30))
	if true then return end
end
function WolfHarass2()
	var_0 = RandomInteger(40,65)
	var_1 = RandomInteger(0,2)
	if not (ObjIsEnabled(Gvar_11) == 0) then 
		goto l43
	end
	EnableObject(Gvar_11)
	EnableObject(Gvar_12)
	EnableObject(Gvar_13)
	::l43::
	var_2 = var_1
	if (var_2 == 0) then 
		goto l76
	end
	if (var_2 == 1) then 
		goto l118
	end
	if (var_2 == 2) then 
		goto l160
	end
	goto l202
	::l76::
	if not (Gvar_58 == false and Gvar_63 == false) then 
		goto l110
	end
	MonsterAttackMelee(Gvar_11,GetObjX(Gvar_9),GetObjY(Gvar_9))
	goto l116
	::l110::
	var_0 = 2
	::l116::
	goto l202
	::l118::
	if not (Gvar_59 == false and Gvar_64 == false) then 
		goto l152
	end
	MonsterAttackMelee(Gvar_12,GetObjX(Gvar_9),GetObjY(Gvar_9))
	goto l158
	::l152::
	var_0 = 2
	::l158::
	goto l202
	::l160::
	if not (Gvar_60 == false and Gvar_65 == false) then 
		goto l194
	end
	MonsterAttackMelee(Gvar_13,GetObjX(Gvar_9),GetObjY(Gvar_9))
	goto l200
	::l194::
	var_0 = 2
	::l200::
	goto l202
	::l202::
	if not (Gvar_63 == false or Gvar_64 == false or Gvar_65 == false) then 
		goto l236
	end
	WaitFrames(var_0,28)
	goto l237
	::l236::
	if true then return end
	::l237::
	if true then return end
end
function CainPlea2()
	SayChat(Gvar_9,"War09c:CainPlea2")
	if true then return end
end
function MapEntry()
	WallMakeSilent(false)
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
function KeepOut2()
	if not (Gvar_69 == false) then 
		goto l23
	end
	if not (ObjIsHostileTo(Caller,GetHostPlayer())) then 
		goto l23
	end
	MonsterGotoHome(Caller)
	::l23::
	if true then return end
end
function Secret01Declare()
	DisableObject(Trigger)
	TeleportWaypoint(Gvar_43,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_43)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),75)
	if true then return end
end
function Secret02Declare()
	DisableObject(Trigger)
	TeleportWaypoint(Gvar_43,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_43)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),150)
	if true then return end
end
function SkeletonMarch()
	DisableObjectGroup(Gvar_26)
	EnableObjectGroup(Gvar_23)
	MonsterGoRoam(Gvar_5)
	MonsterGoRoam(Gvar_6)
	MonsterGoRoam(Gvar_7)
	MonsterGoRoam(Gvar_8)
	if true then return end
end
function LoneWolf01Retreat()
	var_0 = GetWaypointX(Gvar_39)
	var_1 = GetWaypointY(Gvar_39)
	var_2 = GetWaypointX(Gvar_40)
	var_3 = GetWaypointY(Gvar_40)
	MonsterSetRetreatRatio(Gvar_4,0)
	MonsterGuardArea(Gvar_4,var_0,var_1,var_2,var_3,150)
	if true then return end
end
function WolfAmbush()
	DisableObjectGroup(Gvar_22)
	Gvar_50 = SpawnObject("BlackWolf",Gvar_37)
	Gvar_51 = SpawnObject("BlackWolf",Gvar_38)
	WaitFrames(1,21)
	if true then return end
end
function HomePatrol()
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterGotoHome(Trigger)
	MonsterWait(Trigger,120)
	MonsterGoRoam(Trigger)
	if true then return end
end
function WolfGone()
	if not (ObjIsTrigger(Gvar_11)) then 
		goto l31
	end
	Gvar_58 = true
	if not (GetObjHealth(Gvar_11) > 0) then 
		goto l31
	end
	MonsterSetAggressiveness(Gvar_11,0.5)
	::l31::
	if not (ObjIsTrigger(Gvar_12)) then 
		goto l62
	end
	Gvar_59 = true
	if not (GetObjHealth(Gvar_12) > 0) then 
		goto l62
	end
	MonsterSetAggressiveness(Gvar_12,0.5)
	::l62::
	if not (ObjIsTrigger(Gvar_13)) then 
		goto l93
	end
	Gvar_60 = true
	if not (GetObjHealth(Gvar_13) > 0) then 
		goto l93
	end
	MonsterSetAggressiveness(Gvar_13,0.5)
	::l93::
	if not (Gvar_58 == true and Gvar_59 == true and Gvar_60 == true) then 
		goto l148
	end
	CancelChat(Gvar_9)
	Gvar_57 = true
	Gvar_54 = Gvar_49
	SetupDialog(Gvar_9,"YESNO",22,23)
	::l148::
	if true then return end
end
function CainPlea()
	if not (ObjIsCaller(GetHostPlayer()) and GetObjHealth(Gvar_9) > 0) then 
		goto l60
	end
	var_0 = Gvar_54
	if (var_0 == Gvar_48) then 
		goto l42
	end
	if (var_0 == Gvar_49) then 
		goto l51
	end
	goto l60
	::l42::
	SayChat(Gvar_9,"War09c:CainPlea")
	goto l60
	::l51::
	SayChat(Gvar_9,"War09c:CainPlea2")
	goto l60
	::l60::
	if true then return end
end
function WolfHarass()
	if not (ObjIsHostileTo(Caller,GetHostPlayer()) and Gvar_61 == false) then 
		goto l22
	end
	MonsterGotoHome(Caller)
	::l22::
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l47
	end
	if not (Gvar_61 == false and Gvar_62 == false) then 
		goto l47
	end
	WolfHarass2()
	::l47::
	if true then return end
end
function WolvesTargetPlayer()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l96
	end
	if not (Gvar_58 == false) then 
		goto l36
	end
	Gvar_63 = true
	MonsterSetAggressiveness(Gvar_11,0.5)
	MonsterGoFight(Gvar_11,GetHostPlayer())
	::l36::
	if not (Gvar_59 == false) then 
		goto l66
	end
	Gvar_64 = true
	MonsterSetAggressiveness(Gvar_12,0.5)
	MonsterGoFight(Gvar_12,GetHostPlayer())
	::l66::
	if not (Gvar_60 == false) then 
		goto l96
	end
	Gvar_65 = true
	MonsterSetAggressiveness(Gvar_13,0.5)
	MonsterGoFight(Gvar_13,GetHostPlayer())
	::l96::
	if true then return end
end
function CainDie()
	if not (GetObjHealth(Gvar_11) > 0) then 
		goto l17
	end
	MonsterSetAggressiveness(Gvar_11,0.83)
	::l17::
	if not (GetObjHealth(Gvar_12) > 0) then 
		goto l34
	end
	MonsterSetAggressiveness(Gvar_12,0.83)
	::l34::
	if not (GetObjHealth(Gvar_13) > 0) then 
		goto l51
	end
	MonsterSetAggressiveness(Gvar_13,0.83)
	::l51::
	Gvar_55 = GetObjX(Gvar_9)
	Gvar_56 = GetObjY(Gvar_9)
	Gvar_62 = true
	EnableObject(Gvar_10)
	DamageObject(Gvar_10,0,200000,0)
	WaitFrames(1,26)
	if true then return end
end
function CainRescue()
	DeleteObject(Gvar_9)
	TeleportObj(Gvar_10,Gvar_55,Gvar_56)
	EnableObject(Gvar_10)
	MonsterGuardArea(Gvar_10,Gvar_55,Gvar_56,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	Gvar_53 = Gvar_46
	SetupDialog(Gvar_10,"NORMAL",22,23)
	ObjLookAtObj(Gvar_10,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_10)
	ForceDialog(Gvar_10,GetHostPlayer())
	if true then return end
end
function NecroDialogStart()
	var_0 = RandomInteger(1,2)
	var_1 = var_0
	if (var_1 == 1) then 
		goto l35
	end
	if (var_1 == 2) then 
		goto l71
	end
	goto l107
	::l35::
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	ObjLookAtObj(Gvar_14,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_16)
	StartDialogWithCaller("SwordsmanHurt","Con09a:NecroThreat1")
	goto l107
	::l71::
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	ObjLookAtObj(Gvar_14,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_16)
	StartDialogWithCaller("SwordsmanHurt","Con09a:NecroThreat4")
	goto l107
	::l107::
	if true then return end
end
function NecroDialogEnd()
	CancelDialog(Gvar_16)
	MonsterSetAggressiveness(Gvar_14,0.83)
	MonsterSetAggressiveness(Gvar_15,0.83)
	MonsterSetAggressiveness(Gvar_16,0.83)
	MonsterIdle(Gvar_14)
	MonsterIdle(Gvar_15)
	ObjFreeze(GetHostPlayer(),false)
	CinematicBorders(false)
	WaitFrames(Gvar_52,24)
	if true then return end
end
function StartNecroFight()
	DisableWaypointGroup(Gvar_44)
	DisableObject(Gvar_19)
	DisableObjectGroup(Gvar_25)
	EnableObject(Gvar_17)
	EnableObject(Gvar_14)
	EnableObject(Gvar_15)
	EnableObject(Gvar_16)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_29)
	WallMakeSilent(false)
	PushMusicStack()
	PlayAction2()
	CloseSecretWallGroup(Gvar_28)
	var_0 = 0
	::l65::
	if not (var_0 < 5) then 
		goto l107
	end
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_42[var_0]),GetWaypointY(Gvar_42[var_0]),0,0)
	var_0 = var_0 + 1
	goto l65
	::l107::
	WaitFrames(1,27)
	if true then return end
end
function NecroTeleport()
	var_2 = RandomInteger(0,4)
	var_0 = GetWaypointX(Gvar_41[var_2])
	var_1 = GetWaypointY(Gvar_41[var_2])
	if not (ObjIsCaller(Gvar_14) or ObjIsCaller(Gvar_15) or ObjIsCaller(Gvar_16) or ObjIsCaller(Gvar_18)) then 
		goto l145
	end
	ApplyEnchant(Caller,"ENCHANT_INVISIBLE",2)
	PlayFX("BLUE_SPARKS",GetObjX(Caller),GetObjY(Caller),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Caller),GetObjY(Caller),0,0)
	TeleportObj(Caller,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	::l145::
	if true then return end
end
function NecroTeleportInjured()
	var_2 = RandomInteger(0,4)
	var_0 = GetWaypointX(Gvar_41[var_2])
	var_1 = GetWaypointY(Gvar_41[var_2])
	if not (ObjIsTrigger(Gvar_14) or ObjIsTrigger(Gvar_15) or ObjIsTrigger(Gvar_16)) then 
		goto l62
	end
	MonsterWait(Trigger,15)
	::l62::
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
function OpenMagicWalls()
	if not (ObjIsTrigger(Gvar_14)) then 
		goto l14
	end
	Gvar_66 = true
	::l14::
	if not (ObjIsTrigger(Gvar_15)) then 
		goto l28
	end
	Gvar_67 = true
	::l28::
	if not (ObjIsTrigger(Gvar_16)) then 
		goto l42
	end
	Gvar_68 = true
	::l42::
	if not (ObjIsTrigger(Gvar_18)) then 
		goto l56
	end
	Gvar_69 = true
	::l56::
	if not (Gvar_66 == true and Gvar_67 == true and Gvar_68 == true and Gvar_69 == true) then 
		goto l149
	end
	OpenSecretWallGroup(Gvar_28)
	var_0 = 0
	::l100::
	if not (var_0 < 5) then 
		goto l142
	end
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_42[var_0]),GetWaypointY(Gvar_42[var_0]),0,0)
	var_0 = var_0 + 1
	goto l100
	::l142::
	EnableWaypointGroup(Gvar_44)
	PopMusicStack()
	::l149::
	if true then return end
end
function TeleportToPlayer()
	var_2 = 1000000
	var_0 = 0
	::l12::
	if not (var_0 < 5) then 
		goto l87
	end
	var_1 = GetDistance(GetWaypointX(Gvar_41[var_0]),GetWaypointY(Gvar_41[var_0]),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	if not (var_1 < var_2) then 
		goto l79
	end
	var_2 = var_1
	var_3 = Gvar_41[var_0]
	::l79::
	var_0 = var_0 + 1
	goto l12
	::l87::
	ApplyEnchant(Gvar_18,"ENCHANT_INVISIBLE",1)
	PlayFX("BLUE_SPARKS",GetObjX(Gvar_18),GetObjY(Gvar_18),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_18),GetObjY(Gvar_18),0,0)
	TeleportObj(Gvar_18,GetWaypointX(var_3),GetWaypointY(var_3))
	PlayFX("BLUE_SPARKS",GetWaypointX(var_3),GetWaypointY(var_3),0,0)
	PlayFX("SMOKE_BLAST",GetWaypointX(var_3),GetWaypointY(var_3),0,0)
	if true then return end
end