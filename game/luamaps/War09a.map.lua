
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_10 = 0
	Gvar_13 = 0
	Gvar_14 = false
	Gvar_15 = false
	Gvar_16 = false
	Gvar_50 = false
	Gvar_51 = false
	Gvar_52 = 0
	Gvar_53 = 1
	Gvar_54 = 2
	Gvar_55 = 3
	Gvar_56 = 4
	Gvar_57 = 5
	Gvar_58 = 6
	Gvar_60 = Gvar_52
	Gvar_61 = Gvar_55
	Gvar_62 = false
	Gvar_63 = 0
	Gvar_64 = 1
	Gvar_65 = 2
	Gvar_66 = 3
	Gvar_67 = 4
	Gvar_68 = 5
	Gvar_69 = 15
	Gvar_70 = 2
	if true then return end
end
function PlantBarrier()
	Gvar_11 = 0
	::l6::
	if not Gvar_11 < 6 then 
		goto l27
	end
	CreatePlant(Gvar_11)
	Gvar_11 = Gvar_11 + 1
	goto l6
	::l27::
	if true then return end
end
function CreatePlant(arg_0)
	Gvar_9[arg_0] = SpawnObject("CarnivorousPlant",Gvar_8[arg_0])
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_9[arg_0]),GetObjY(Gvar_9[arg_0]),0,0)
	ObjLookAtObj(Gvar_9[arg_0],GetHostPlayer())
	ObjSetMaster(Gvar_4[0],Gvar_9[arg_0])
	MonsterEventScript(Gvar_9[arg_0],7,6)
	if true then return end
end
function CheckPlants()
	if not Gvar_15 == false | Gvar_16 == false then 
		goto l68
	end
	Gvar_11 = 0
	::l23::
	if not Gvar_11 < 6 then 
		goto l62
	end
	if not GetObjHealth(Gvar_9[Gvar_11]) <= 0 then 
		goto l54
	end
	WaitSpecial(14,Gvar_11,5)
	::l54::
	Gvar_11 = Gvar_11 + 1
	goto l23
	::l62::
	WaitFrames(15,4)
	::l68::
	if true then return end
end
function PlantDie(arg_0)
	if not Gvar_15 == false | Gvar_16 == false then 
		goto l31
	end
	DeleteObject(Gvar_9[arg_0])
	CreatePlant(arg_0)
	::l31::
	if true then return end
end
function AttackBack()
	if not ObjIsCaller(GetHostPlayer()) == 0 then 
		goto l15
	end
	MonsterGoFight(Trigger,Caller)
	::l15::
	if true then return end
end
function PlayAction()
	PlayMusic(26,100)
	if true then return end
end
function PlaySwamp()
	PlayMusic(29,100)
	if true then return end
end
function DryadHuntPlayer()
	MonsterGoHunt(Trigger)
	if true then return end
end
function StartDryadSequence()
	if not ObjIsCaller(GetHostPlayer()) and Gvar_14 == false then 
		goto l185
	end
	Gvar_14 = true
	ObjSetMaster(Gvar_4[0],Gvar_4[1])
	PushMusicStack()
	PlayAction()
	WallMakeSilent(true)
	CloseSecretWallGroup(Gvar_6)
	WallMakeSilent(false)
	var_0 = 0
	::l60::
	if not var_0 < 2 then 
		goto l177
	end
	EnableObject(Gvar_4[var_0])
	ApplyEnchant(Gvar_4[var_0],"ENCHANT_INVISIBLE",1)
	TeleportObj(Gvar_4[var_0],GetWaypointX(Gvar_5[var_0]),GetWaypointY(Gvar_5[var_0]))
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_5[var_0]),GetWaypointY(Gvar_5[var_0]),0,0)
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_5[var_0]),GetWaypointY(Gvar_5[var_0]),0,0)
	var_0 = var_0 + 1
	goto l60
	::l177::
	PlantBarrier()
	WaitFrames(1,4)
	::l185::
	if true then return end
end
function DryadDie()
	if not ObjIsTrigger(Gvar_4[0]) then 
		goto l17
	end
	Gvar_15 = true
	::l17::
	if not ObjIsTrigger(Gvar_4[1]) then 
		goto l34
	end
	Gvar_16 = true
	::l34::
	if not Gvar_15 == true and Gvar_16 == true then 
		goto l68
	end
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_6)
	WallMakeSilent(false)
	PopMusicStack()
	::l68::
	if true then return end
end
function DryadStay()
	if not ObjIsCaller(Gvar_4[0]) or ObjIsCaller(Gvar_4[1]) then 
		goto l139
	end
	Gvar_12 = RandomInteger(0,4)
	Gvar_17 = GetWaypointX(Gvar_7[Gvar_12])
	Gvar_18 = GetWaypointY(Gvar_7[Gvar_12])
	ApplyEnchant(Caller,"ENCHANT_INVISIBLE",1.5)
	PlayFX("BLUE_SPARKS",GetObjX(Caller),GetObjY(Caller),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Caller),GetObjY(Caller),0,0)
	TeleportObj(Caller,Gvar_17,Gvar_18)
	PlayFX("BLUE_SPARKS",Gvar_17,Gvar_18,0,0)
	PlayFX("SMOKE_BLAST",Gvar_17,Gvar_18,0,0)
	::l139::
	if true then return end
end
function PlayerDeath()
	DeathScreen(9)
	if true then return end
end
function CaptainDialogStart()
	var_0 = Gvar_60
	if var_0 == Gvar_52 then 
		goto l36
	end
	if var_0 == Gvar_53 then 
		goto l44
	end
	if var_0 == Gvar_54 then 
		goto l52
	end
	goto l60
	::l36::
	StartDialogWithCaller("SwordsmanHurt","War09a:CaptainGreet")
	goto l60
	::l44::
	StartDialogWithCaller("SwordsmanHurt","War09a:CaptainLeave")
	goto l60
	::l52::
	StartDialogWithCaller("SwordsmanHurt","War09a:CaptainImpatient")
	goto l60
	::l60::
	if true then return end
end
function CaptainDialogEnd()
	var_0 = Gvar_60
	if var_0 == Gvar_52 then 
		goto l36
	end
	if var_0 == Gvar_53 then 
		goto l67
	end
	if var_0 == Gvar_54 then 
		goto l76
	end
	goto l78
	::l36::
	JournalAddEntry(GetHostPlayer(),"FindMordwyn",2)
	JournalAddEntry(GetHostPlayer(),"FindOutpost",2)
	PrintToAll("Con01a:NewJournalEntry")
	PlaySwamp()
	Gvar_60 = Gvar_53
	goto l78
	::l67::
	Gvar_60 = Gvar_54
	goto l78
	::l76::
	goto l78
	::l78::
	if true then return end
end
function MordwynDialogStart()
	var_0 = Gvar_61
	if var_0 == Gvar_55 then 
		goto l45
	end
	if var_0 == Gvar_56 then 
		goto l60
	end
	if var_0 == Gvar_57 then 
		goto l87
	end
	if var_0 == Gvar_58 then 
		goto l102
	end
	goto l117
	::l45::
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War09a:MordwynGreet")
	goto l117
	::l60::
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	StartDialogWithCaller("SwordsmanHurt","War09a:MordwynHome")
	goto l117
	::l87::
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War09a:MordwynHome2")
	goto l117
	::l102::
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War09a:MordwynDone")
	goto l117
	::l117::
	if true then return end
end
function MordwynDialogEnd()
	var_0 = Gvar_61
	if var_0 == Gvar_55 then 
		goto l45
	end
	if var_0 == Gvar_56 then 
		goto l96
	end
	if var_0 == Gvar_57 then 
		goto l122
	end
	if var_0 == Gvar_58 then 
		goto l195
	end
	goto l197
	::l45::
	Gvar_61 = Gvar_56
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	JournalUpdateEntry(GetHostPlayer(),"FindMordwyn",4)
	CancelDialog(Gvar_19)
	MonsterEventScript(Gvar_19,11,28)
	MoveTo(Gvar_19,Gvar_46)
	goto l197
	::l96::
	Gvar_61 = Gvar_57
	MonsterEventScript(Gvar_19,11,22)
	MoveTo(Gvar_19,Gvar_47)
	goto l197
	::l122::
	Gvar_61 = Gvar_58
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	MonsterGuardArea(Gvar_19,GetWaypointX(Gvar_46),GetWaypointY(Gvar_46),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterEventScript(Gvar_19,11,26)
	InvPutObj(GetHostPlayer(),Gvar_23)
	InvPutObj(GetHostPlayer(),Gvar_24)
	PrintToAll("War09a:GainedArmor")
	goto l197
	::l195::
	goto l197
	::l197::
	if true then return end
end
function StartCaptainConversation()
	SetupDialog(Gvar_20,"NORMAL",14,15)
	ForceDialog(Gvar_20,GetHostPlayer())
	if true then return end
end
function WispInitialize()
	Gvar_71[0] = ObjFromName("Wisp0")
	Gvar_73[0] = Gvar_63
	Gvar_72[0] = WaypointFromName("Wisp0Dest")
	Gvar_71[1] = ObjFromName("Wisp1")
	Gvar_73[1] = Gvar_63
	Gvar_72[1] = WaypointFromName("Wisp1Dest")
	if true then return end
end
function MapInitialize()
	Gvar_20 = ObjFromName("Jandor")
	Gvar_21 = ObjFromName("Basket")
	Gvar_22 = ObjFromName("BasketShadow")
	Gvar_19 = ObjFromName("Mordwyn")
	Gvar_24 = ObjFromName("JHelm")
	Gvar_23 = ObjFromName("JBreast")
	Gvar_25 = ObjFromName("PitElev01")
	Gvar_26 = ObjFromName("PitElev02")
	Gvar_27 = ObjFromName("PitElev03")
	Gvar_28 = ObjFromName("TreasureTrap01")
	Gvar_29 = ObjFromName("TreasureTrap01Light")
	Gvar_30 = ObjFromName("Secret02Trigger")
	Gvar_4[0] = ObjFromName("Dryad0")
	Gvar_4[1] = ObjFromName("Dryad1")
	Gvar_38 = WallGroupFromName("Surprise00Walls")
	Gvar_39 = WallGroupFromName("Surprise00DestWalls")
	Gvar_40 = WallGroupFromName("Surprise01Walls")
	Gvar_41 = WallGroupFromName("Surprise01DWalls")
	Gvar_42 = WallGroupFromName("Surprise02Walls")
	Gvar_43 = WallGroupFromName("Surprise02DestWalls")
	Gvar_44 = WallGroupFromName("TreasureTrap01Walls")
	Gvar_6 = WallGroupFromName("DryadWalls")
	Gvar_33 = ObjGroupFromName("Surprise00Triggers")
	Gvar_32 = ObjGroupFromName("Surprise00Creatures")
	Gvar_34 = ObjGroupFromName("Surprise01Creatures")
	Gvar_35 = ObjGroupFromName("Surprise01Triggers")
	Gvar_31 = ObjGroupFromName("MordwynTriggers")
	Gvar_36 = ObjGroupFromName("TreasureTrap01Zombies")
	Gvar_37 = ObjGroupFromName("Secret01Triggers")
	Gvar_45 = WaypointFromName("TalkToPlayer")
	Gvar_46 = WaypointFromName("MordwynHome")
	Gvar_47 = WaypointFromName("MordwynBedroom")
	Gvar_5[0] = WaypointFromName("DryadHome0")
	Gvar_5[1] = WaypointFromName("DryadHome1")
	Gvar_7[0] = WaypointFromName("DryadWarp0")
	Gvar_7[1] = WaypointFromName("DryadWarp1")
	Gvar_7[2] = WaypointFromName("DryadWarp2")
	Gvar_7[3] = WaypointFromName("DryadWarp3")
	Gvar_7[4] = WaypointFromName("DryadWarp4")
	Gvar_8[0] = WaypointFromName("PlantLoc0")
	Gvar_8[1] = WaypointFromName("PlantLoc1")
	Gvar_8[2] = WaypointFromName("PlantLoc2")
	Gvar_8[3] = WaypointFromName("PlantLoc3")
	Gvar_8[4] = WaypointFromName("PlantLoc4")
	Gvar_8[5] = WaypointFromName("PlantLoc5")
	Gvar_48 = WaypointFromName("WellWP")
	Gvar_49 = WaypointFromName("PlayerSounds")
	CinematicFadeout()
	WispInitialize()
	SetDialogPortrait(Gvar_20,"AirshipCaptainPic")
	SetDialogPortrait(Gvar_19,"MordwynPic")
	SetupDialog(Gvar_19,"NORMAL",16,17)
	StartScreen(9)
	PlayMusic(0,100)
	WaitFrames(5,18)
	EnableObject(ObjFromName("StayHere1"))
	MoveTo(ObjFromName("StayHere1"),WaypointFromName("Here1"))
	EnableObject(ObjFromName("StayHere2"))
	MoveTo(ObjFromName("StayHere2"),WaypointFromName("Here2"))
	EnableObject(ObjFromName("StayHere3"))
	MoveTo(ObjFromName("StayHere3"),WaypointFromName("Here3"))
	EnableObject(ObjFromName("StayHere4"))
	MoveTo(ObjFromName("StayHere4"),WaypointFromName("Here4"))
	EnableObject(ObjFromName("StayHere5"))
	MoveTo(ObjFromName("StayHere5"),WaypointFromName("Here5"))
	if true then return end
end
function MordwynGreet()
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	ForceDialog(Gvar_19,GetHostPlayer())
	MonsterEventScript(Gvar_19,11,26)
	if true then return end
end
function GetArmorOfJandor()
	MonsterWait(Gvar_19,75)
	MonsterEventScript(Gvar_19,11,23)
	MoveTo(Gvar_19,Gvar_46)
	if true then return end
end
function GiveArmorToPlayer()
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	ForceDialog(Gvar_19,GetHostPlayer())
	if true then return end
end
function KeepOut()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function CapTakeoff()
	if not ObjIsCaller(GetHostPlayer()) and Gvar_51 == false then 
		goto l36
	end
	Gvar_51 = true
	DeleteObject(Gvar_21)
	DeleteObject(Gvar_22)
	DeleteObject(Gvar_20)
	::l36::
	if true then return end
end
function NullFunction()
	if true then return end
end
function MordwynMove()
	DisableObjectGroup(Gvar_31)
	EnableObject(Gvar_19)
	ObjSetMaster(GetHostPlayer(),Gvar_19)
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	MoveTo(Gvar_19,Gvar_45)
	if true then return end
end
function AllowDialog()
	MonsterGuardArea(Gvar_19,GetWaypointX(Gvar_46),GetWaypointY(Gvar_46),GetWaypointX(Gvar_45),GetWaypointY(Gvar_45),0)
	SetupDialog(Gvar_19,"NORMAL",16,17)
	if true then return end
end
function Surprise00()
	DisableObjectGroup(Gvar_33)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_38)
	WallMakeSilent(false)
	BreakWallGroup(Gvar_39)
	EnableObjectGroup(Gvar_32)
	GroupMonsterGoRoam(Gvar_32)
	if true then return end
end
function Surprise01()
	DisableObjectGroup(Gvar_35)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_40)
	WallMakeSilent(false)
	BreakWallGroup(Gvar_41)
	EnableObjectGroup(Gvar_34)
	if true then return end
end
function Secret01Declare()
	DisableObjectGroup(Gvar_37)
	TeleportWaypoint(Gvar_49,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_49)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function Secret02Declare()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_49,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_49)
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function EnablePitElev01()
	EnableObject(Gvar_25)
	if true then return end
end
function EnablePitElev02()
	EnableObject(Gvar_26)
	if true then return end
end
function EnablePitElev03()
	EnableObject(Gvar_27)
	if true then return end
end
function TriggerTreasureTrap()
	BreakWallGroup(Gvar_44)
	DisableObject(Gvar_29)
	MonsterGroupSetAggressiveness(Gvar_36,0.83)
	GroupMonsterGoRoam(Gvar_36)
	if true then return end
end
function MapEntry()
	WallMakeSilent(false)
	if true then return end
end
function whichWisp:C:\nox\game\maps\War09a\Scripts\Wisps.scr(arg_0)
	var_1 = 0
	::l6::
	if not var_1 < Gvar_70 then 
		goto l40
	end
	if not Gvar_71[var_1] == arg_0 then 
		goto l32
	end
	if true then return end var_1
	::l32::
	var_1 = var_1 + 1
	goto l6
	::l40::
	if true then return end -1
	if true then return end
end
function WispAction(arg_0)
	var_2 = Gvar_73[arg_0]
	if var_2 == Gvar_64 then 
		goto l40
	end
	if var_2 == Gvar_66 then 
		goto l109
	end
	if var_2 == Gvar_65 then 
		goto l166
	end
	goto l239
	::l40::
	var_1 = GetDistance(GetObjX(Gvar_71[arg_0]),GetObjY(Gvar_71[arg_0]),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	if not var_1 < 70 then 
		goto l107
	end
	Gvar_73[arg_0] = Gvar_65
	MoveTo(Gvar_71[arg_0],Gvar_72[arg_0])
	::l107::
	goto l239
	::l109::
	ObjLookAtObj(Gvar_71[arg_0],GetHostPlayer())
	Gvar_74[arg_0] = Gvar_74[arg_0] + 1
	if not Gvar_74[arg_0] > 4 then 
		goto l164
	end
	Gvar_73[arg_0] = Gvar_64
	MonsterFollowObj(Gvar_71[arg_0],GetHostPlayer())
	::l164::
	goto l239
	::l166::
	var_1 = GetDistance(GetObjX(Gvar_71[arg_0]),GetObjY(Gvar_71[arg_0]),GetWaypointX(Gvar_72[arg_0]),GetWaypointY(Gvar_72[arg_0]))
	if not var_1 < 30 then 
		goto l237
	end
	Gvar_73[arg_0] = Gvar_67
	MonsterIdle(Gvar_71[arg_0])
	if true then return end
	::l237::
	goto l239
	::l239::
	WaitSpecial(Gvar_69,arg_0,39)
	if true then return end
end
function WispRecognize()
	if not CheckObjClass(Caller,"PLAYER") == false then 
		goto l14
	end
	if true then return end
	::l14::
	var_0 = whichWisp:C:\nox\game\maps\War09a\Scripts\Wisps.scr(ScriptTrigger())
	if not var_0 < 0 then 
		goto l31
	end
	if true then return end
	::l31::
	var_1 = Gvar_73[var_0]
	if var_1 == Gvar_63 then 
		goto l62
	end
	if var_1 == Gvar_66 then 
		goto l101
	end
	goto l126
	::l62::
	Gvar_73[var_0] = Gvar_64
	MonsterFollowObj(Trigger,Caller)
	Gvar_75[var_0] = WaitSpecial(Gvar_69,var_0,39)
	goto l126
	::l101::
	Gvar_73[var_0] = Gvar_65
	MoveTo(Trigger,Gvar_72[var_0])
	goto l126
	::l126::
	if true then return end
end
function WispLoseSight()
	if not CheckObjClass(Caller,"PLAYER") == false then 
		goto l14
	end
	if true then return end
	::l14::
	var_0 = whichWisp:C:\nox\game\maps\War09a\Scripts\Wisps.scr(ScriptTrigger())
	if not var_0 < 0 then 
		goto l31
	end
	if true then return end
	::l31::
	var_1 = Gvar_73[var_0]
	if var_1 == Gvar_65 then 
		goto l53
	end
	goto l81
	::l53::
	Gvar_73[var_0] = Gvar_66
	Gvar_74[var_0] = 0
	MonsterIdle(Trigger)
	goto l81
	::l81::
	if true then return end
end
function WispGetMad()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l54
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterIdle(Trigger)
	var_0 = whichWisp:C:\nox\game\maps\War09a\Scripts\Wisps.scr(ScriptTrigger())
	if not var_0 >= 0 then 
		goto l54
	end
	Gvar_73[var_0] = Gvar_68
	CancelWait(Gvar_75[var_0])
	::l54::
	if true then return end
end
function WispMedieval()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l18
	end
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterIdle(Trigger)
	::l18::
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_48)
	if true then return end
end
function PlayMordwyn()
	if not ObjIsCaller(GetHostPlayer()) then 
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
	PlayMusic(19,100)
	if true then return end
end