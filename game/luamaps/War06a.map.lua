
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_16 = false
	Gvar_17 = true
	Gvar_22 = false
	Gvar_23 = 0
	Gvar_34 = true
	Gvar_48 = true
	if true then return end
end
function KillTownie()
	AudioEvent("HumanMaleDie",Gvar_11)
	TeleportObj(Gvar_4,GetWaypointX(Gvar_11),GetWaypointY(Gvar_11))
	TeleportObj(Gvar_6,4071,1828)
	TeleportObj(Gvar_7,3999,1844)
	if true then return end
end
function townieTalk1Start()
	DisableObjectGroup(Gvar_15)
	StartDialogWithCaller("UrchinRecognize","War06a:TownspeopleSpeak3")
	if true then return end
end
function townieTalk1End()
	EnableObjectGroup(Gvar_15)
	CancelDialog(Gvar_4)
	DeleteObject(Gvar_5)
	WaitFrames(1,2)
	if true then return end
end
function EnableSkeletonGroup()
	DisableObject(Trigger)
	EnableObjectGroup(Gvar_13)
	if true then return end
end
function captainVanishes()
	DisableObject(Trigger)
	DeleteObject(Gvar_10)
	DeleteObject(Gvar_8)
	DeleteObject(Gvar_9)
	EnableObjectGroup(Gvar_12)
	EnableSkeletonGroup()
	if true then return end
end
function GuardiansAttack()
	EnableObject(Gvar_24)
	EnableObject(Gvar_18)
	MonsterSetAggressiveness(Gvar_24,0.83)
	MonsterGoFight(Gvar_24,Gvar_18)
	EnableObject(Gvar_25)
	EnableObject(Gvar_19)
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterGoFight(Gvar_25,Gvar_18)
	EnableObject(Gvar_26)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterGoFight(Gvar_26,Gvar_19)
	MonsterSetAggressiveness(Gvar_18,0.83)
	MonsterGoFight(Gvar_18,Gvar_24)
	MonsterSetAggressiveness(Gvar_19,0.83)
	MonsterGoFight(Gvar_19,Gvar_26)
	if true then return end
end
function Guardian01DialogStart()
	StartDialogWithCaller("SwordsmanHurt","War06a:CityGuardSpeak1")
	if true then return end
end
function Guardian01DialogEnd()
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_20)
	WallMakeSilent(false)
	CancelDialog(Gvar_18)
	MonsterMakeFriendly(Gvar_18)
	MonsterMakeFriendly(Gvar_19)
	MonsterFollowObj(Gvar_18,GetHostPlayer())
	MonsterFollowObj(Gvar_19,GetHostPlayer())
	ObjFreeze(GetHostPlayer(),false)
	CinematicBorders(false)
	EnableObjectGroup(Gvar_14)
	EnableObjectGroup(Gvar_13)
	if true then return end
end
function Zombie1Rise()
	var_0 = GetObjX(Gvar_24)
	var_1 = GetObjY(Gvar_24)
	ZombieStandUp(Gvar_24)
	TeleportWaypoint(Gvar_21,var_0,var_1)
	AudioEvent("ZombieRecognize",WaypointFromName("AudioOrigin"))
	if true then return end
end
function Zombie2Rise()
	var_0 = GetObjX(Gvar_25)
	var_1 = GetObjY(Gvar_25)
	ZombieStandUp(Gvar_25)
	TeleportWaypoint(Gvar_21,var_0,var_1)
	AudioEvent("ZombieRecognize",WaypointFromName("AudioOrigin"))
	if true then return end
end
function Zombie3Rise()
	var_0 = GetObjX(Gvar_26)
	var_1 = GetObjY(Gvar_26)
	ZombieStandUp(Gvar_26)
	TeleportWaypoint(Gvar_21,var_0,var_1)
	AudioEvent("ZombieRecognize",WaypointFromName("AudioOrigin"))
	if true then return end
end
function SetpieceZombieDie()
	Gvar_23 = Gvar_23 + 1
	if not (Gvar_23 >= 3) then 
		goto l80
	end
	SetDialogPortrait(Gvar_18,"WarriorPic")
	SetupDialog(Gvar_18,"NORMAL",8,9)
	ObjLookAtObj(Gvar_18,GetHostPlayer())
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	ForceDialog(Gvar_18,GetHostPlayer())
	MonsterEventScript(Gvar_24,5,15)
	MonsterEventScript(Gvar_25,5,15)
	MonsterEventScript(Gvar_26,5,15)
	::l80::
	if true then return end
end
function SetZombieDieCallbacks()
	MonsterEventScript(Gvar_24,5,13)
	MonsterEventScript(Gvar_25,5,13)
	MonsterEventScript(Gvar_26,5,13)
	if true then return end
end
function NullCallback()
	if true then return end
end
function InitializeGuardianSetpiece()
	Gvar_24 = ObjFromName("SetpieceZombie01")
	Gvar_25 = ObjFromName("SetpieceZombie02")
	Gvar_26 = ObjFromName("SetpieceZombie03")
	DamageObject(Gvar_24,0,100,0)
	DamageObject(Gvar_25,0,100,0)
	DamageObject(Gvar_26,0,100,0)
	ZombieStayDead(Gvar_24)
	ZombieStayDead(Gvar_25)
	ZombieStayDead(Gvar_26)
	WaitFrames(30,14)
	if true then return end
end
function StartGuardianSetpiece()
	if not (ObjIsCaller(GetHostPlayer()) and Gvar_22 == 0) then 
		goto l63
	end
	Gvar_22 = true
	MonsterIdle(GetHostPlayer())
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	WaitFrames(15,10)
	WaitFrames(25,11)
	WaitFrames(20,12)
	WaitFrames(45,7)
	DisableObjectGroup(Gvar_13)
	::l63::
	if true then return end
end
function TurnOffLights()
	ToggleObjectGroup(Gvar_30)
	ToggleObjectGroup(Gvar_31)
	ToggleObjectGroup(Gvar_32)
	ToggleObjectGroup(Gvar_33)
	ToggleObject(Gvar_27)
	ToggleObject(Gvar_28)
	ToggleObject(Gvar_29)
	if true then return end
end
function PlayerDeath()
	DeathScreen(6)
	if true then return end
end
function captainTalk()
	ForceDialog(Gvar_10,GetHostPlayer())
	if true then return end
end
function captainTalk1Start()
	ObjFreeze(GetHostPlayer(),true)
	StartDialogWithCaller("ArcherRecognize","Con01a:CaptainProd")
	if true then return end
end
function captainTalk1End()
	ObjFreeze(GetHostPlayer(),false)
	SetupDialog(Gvar_10,"NORMAL",21,22)
	if true then return end
end
function undeadBreakIn()
	BreakWall(GetWallAt(220,118))
	BreakWall(GetWallAt(219,119))
	BreakWall(GetWallAt(220,120))
	if true then return end
end
function KirikEnd1()
	SetupDialog(Gvar_42,"NORMAL",25,24)
	if true then return end
end
function KirikStart1()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Guard1Talk01")
	if true then return end
end
function SecretRoom()
	TeleportWaypoint(Gvar_44,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_44)
	DisableObjectGroup(Gvar_43)
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function InitializeTownspeople()
	Gvar_49 = ObjFromName("Townsman1")
	Gvar_50 = ObjFromName("Townsman2")
	Gvar_51 = ObjFromName("Townsman3")
	Gvar_52 = ObjFromName("Townsman4")
	Gvar_53 = ObjFromName("Townsman5")
	Gvar_54 = ObjFromName("Townsman6")
	Gvar_55 = ObjFromName("Townswoman1")
	Gvar_56 = ObjFromName("Townswoman2")
	Gvar_57 = ObjFromName("Townswoman3")
	Gvar_58 = ObjFromName("Townswoman4")
	Gvar_59 = ObjFromName("Townswoman5")
	Gvar_60 = ObjFromName("Townswoman6")
	Gvar_61 = WaypointFromName("TownspeopleStorage")
	Gvar_62 = ObjGroupFromName("Townspeople")
	WaitFrames(15,32)
	if true then return end
end
function NewJournalEntry()
	JournalAddEntry(GetHostPlayer(),"War6Fortress",2)
	PrintToAll("Con01a:NewJournalEntry")
	if true then return end
end
function MapInitialize()
	Gvar_10 = ObjFromName("Captain")
	Gvar_8 = ObjFromName("Basket")
	Gvar_9 = ObjFromName("BasketShadow")
	Gvar_4 = ObjFromName("Townie1")
	Gvar_7 = ObjFromName("DeadGuyBoots")
	Gvar_6 = ObjFromName("DeadGuyChain")
	Gvar_5 = ObjFromName("F6Elite2")
	Gvar_35 = ObjFromName("GauntletDoorR")
	Gvar_36 = ObjFromName("GauntletDoorL")
	Gvar_37 = ObjFromName("IxDoorR")
	Gvar_38 = ObjFromName("IxDoorL")
	Gvar_18 = ObjFromName("F6FireGuard10")
	Gvar_19 = ObjFromName("F6FireGuard7")
	Gvar_39 = ObjFromName("F6FireGuard9")
	Gvar_40 = ObjFromName("F2Fire6")
	Gvar_41 = ObjFromName("F2Fire8")
	Gvar_27 = ObjFromName("GearLight1")
	Gvar_28 = ObjFromName("GearLight2")
	Gvar_29 = ObjFromName("GearLight3")
	Gvar_42 = ObjFromName("Kirik")
	ObjSetMaster(GetHostPlayer(),Gvar_42)
	ObjSetMaster(GetHostPlayer(),Gvar_5)
	Gvar_12 = ObjGroupFromName("ZombieGroupA")
	Gvar_13 = ObjGroupFromName("SkeletonGroup01")
	Gvar_30 = ObjGroupFromName("StreetLamps")
	Gvar_31 = ObjGroupFromName("StreetLamps2")
	Gvar_32 = ObjGroupFromName("LightGears")
	Gvar_33 = ObjGroupFromName("LightGears2")
	Gvar_43 = ObjGroupFromName("SecretRoom2Triggers")
	Gvar_14 = ObjGroupFromName("EveryMonsterOnMap")
	Gvar_15 = ObjGroupFromName("FleemanMonsters")
	Gvar_11 = WaypointFromName("TownieWP")
	Gvar_21 = WaypointFromName("AudioOrigin")
	Gvar_44 = WaypointFromName("PlayerSounds")
	Gvar_45 = WaypointFromName("WellWP")
	Gvar_20 = WallGroupFromName("GrdnStpcWalls")
	SetDialogPortrait(Gvar_10,"AirshipCaptainPic")
	SetupDialog(Gvar_10,"NORMAL",21,22)
	SetDialogPortrait(Gvar_5,"WoundedWarriorPic")
	SetupDialog(Gvar_5,"NORMAL",3,4)
	SetDialogPortrait(Gvar_42,"Warrior4Pic")
	SetupDialog(Gvar_42,"NORMAL",25,24)
	LockDoor(Gvar_35)
	LockDoor(Gvar_36)
	LockDoor(Gvar_37)
	LockDoor(Gvar_38)
	InitializeGuardianSetpiece()
	InitializeTownspeople()
	StartScreen(6)
	WaitFrames(15,28)
	PlayMusic(16,100)
	WaitFrames(1,20)
	DamageObject(Gvar_4,0,100,0)
	if true then return end
end
function NoEnemys()
	if not (ObjIsHostileTo(Caller,GetHostPlayer())) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function MonstersGoHome()
	if not (ObjIsHostileTo(Caller,GetHostPlayer())) then 
		goto l21
	end
	MonsterSetAggressiveness(Caller,0.16)
	MonsterGotoHome(Caller)
	::l21::
	if true then return end
end
function OwnTownspeople()
	ObjGroupSetMaster(GetHostPlayer(),Gvar_62)
	SetDialogPortrait(Gvar_18,"WarriorPic")
	SetDialogPortrait(Gvar_19,"WarriorPic")
	SetDialogPortrait(Gvar_39,"WarriorPic")
	SetupDialog(Gvar_39,"NORMAL",34,35)
	SetDialogPortrait(Gvar_40,"Warrior2Pic")
	SetupDialog(Gvar_40,"NORMAL",36,37)
	SetDialogPortrait(Gvar_41,"Warrior3Pic")
	SetupDialog(Gvar_41,"NORMAL",38,39)
	if true then return end
end
function fireKnightsRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l94
	end
	Gvar_47 = RandomInteger(1,3)
	if not (Gvar_47 == 1) then 
		goto l42
	end
	SetDialogPortrait(Trigger,"WarriorPic")
	SetupDialog(Trigger,"NORMAL",34,35)
	::l42::
	if not (Gvar_47 == 2) then 
		goto l68
	end
	SetDialogPortrait(Trigger,"Warrior2Pic")
	SetupDialog(Trigger,"NORMAL",36,37)
	::l68::
	if not (Gvar_47 == 3) then 
		goto l94
	end
	SetDialogPortrait(Trigger,"Warrior3Pic")
	SetupDialog(Trigger,"NORMAL",38,39)
	::l94::
	if true then return end
end
function fireKnightsTalk1Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak1")
	if true then return end
end
function fireKnightsTalk1End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	MonsterEventScript(Trigger,3,15)
	CancelDialog(Trigger)
	MonsterMakeFriendly(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function fireKnightsTalk2Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak2")
	if true then return end
end
function fireKnightsTalk2End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	MonsterEventScript(Trigger,3,15)
	CancelDialog(Trigger)
	MonsterMakeFriendly(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function fireKnightsTalk3Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak3")
	if true then return end
end
function fireKnightsTalk3End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	MonsterEventScript(Trigger,3,15)
	CancelDialog(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterMakeFriendly(Trigger)
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function fireKnightsStayTalkInit()
	if not (ObjIsCaller(Gvar_18) or ObjIsCaller(Gvar_19) or ObjIsCaller(Gvar_39) or ObjIsCaller(Gvar_40) or ObjIsCaller(Gvar_41)) then 
		goto l149
	end
	if not (ObjCanInteractWith(Caller,GetHostPlayer())) then 
		goto l135
	end
	MonsterIdle(Caller)
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetObjX(Caller),GetObjY(Caller),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),150)
	MonsterSetAggressiveness(Caller,0.5)
	MonsterGoRoam(Caller)
	if not (Gvar_48) then 
		goto l133
	end
	Gvar_48 = false
	Gvar_46 = Caller
	SetupDialog(Caller,"NORMAL",41,42)
	if not (HostPlayerIsTalking() == 0 and HostPlayerIsTrading() == 0) then 
		goto l133
	end
	ForceDialog(Caller,GetHostPlayer())
	::l133::
	goto l147
	::l135::
	MonsterSetAggressiveness(Caller,0.5)
	MonsterGoRoam(Caller)
	::l147::
	goto l161
	::l149::
	MonsterSetAggressiveness(Caller,0.5)
	MonsterGoRoam(Caller)
	::l161::
	if true then return end
end
function fireKnightsStayTalkStart()
	StartDialogWithCaller("SwordsmanRecognize","Con06:SaveDunMir06Warrior")
	if true then return end
end
function fireKnightsStayTalkEnd()
	CancelDialog(Gvar_46)
	if true then return end
end
function townsMenRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l94
	end
	Gvar_47 = RandomInteger(1,3)
	if not (Gvar_47 == 1) then 
		goto l42
	end
	SetDialogPortrait(Trigger,"Townsman1Pic")
	SetupDialog(Trigger,"NORMAL",44,45)
	::l42::
	if not (Gvar_47 == 2) then 
		goto l68
	end
	SetDialogPortrait(Trigger,"Townsman2Pic")
	SetupDialog(Trigger,"NORMAL",46,47)
	::l68::
	if not (Gvar_47 == 3) then 
		goto l94
	end
	SetDialogPortrait(Trigger,"Townsman3Pic")
	SetupDialog(Trigger,"NORMAL",48,49)
	::l94::
	if true then return end
end
function townsmenTalk1Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("UrchinRecognize","War06a:TownspeopleSpeak1")
	if true then return end
end
function townsmenTalk1End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function townsmenTalk2Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("UrchinRecognize","War06a:TownspeopleSpeak2")
	if true then return end
end
function townsmenTalk2End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function townsmenTalk3Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("UrchinRecognize","War06a:TownspeopleSpeak3")
	if true then return end
end
function townsmenTalk3End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function townsWomenRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l94
	end
	Gvar_47 = RandomInteger(1,3)
	if not (Gvar_47 == 1) then 
		goto l42
	end
	SetDialogPortrait(Trigger,"MaidenPic")
	SetupDialog(Trigger,"NORMAL",51,52)
	::l42::
	if not (Gvar_47 == 2) then 
		goto l68
	end
	SetDialogPortrait(Trigger,"MaidenPic2")
	SetupDialog(Trigger,"NORMAL",53,54)
	::l68::
	if not (Gvar_47 == 3) then 
		goto l94
	end
	SetDialogPortrait(Trigger,"MaidenPic3")
	SetupDialog(Trigger,"NORMAL",55,56)
	::l94::
	if true then return end
end
function townsWomenTalk1Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("GhostRecognize","War06a:WomenSpeak1")
	if true then return end
end
function townsWomenTalk1End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function townsWomenTalk2Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("GhostRecognize","War06a:WomenSpeak1")
	if true then return end
end
function townsWomenTalk2End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function townsWomenTalk3Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_14)
	StartDialogWithCaller("GhostRecognize","War06a:WomenSpeak1")
	if true then return end
end
function townsWomenTalk3End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_14)
	if true then return end
end
function leavingDunMir()
	if not (ObjIsCaller(Gvar_49) or ObjIsCaller(Gvar_50) or ObjIsCaller(Gvar_51) or ObjIsCaller(Gvar_52) or ObjIsCaller(Gvar_53) or ObjIsCaller(Gvar_54) or ObjIsCaller(Gvar_55) or ObjIsCaller(Gvar_56) or ObjIsCaller(Gvar_57) or ObjIsCaller(Gvar_58) or ObjIsCaller(Gvar_59) or ObjIsCaller(Gvar_60)) then 
		goto l93
	end
	TeleportObj(Caller,GetWaypointX(Gvar_61),GetWaypointY(Gvar_61))
	DisableObject(Caller)
	::l93::
	if true then return end
end
function flee()
	MonsterGoRoam(Trigger)
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_45)
	if true then return end
end