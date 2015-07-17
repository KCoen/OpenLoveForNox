
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_5 = 60
	Gvar_33 = 0
	Gvar_34 = 1
	Gvar_35 = 2
	Gvar_36 = 3
	Gvar_37 = 4
	Gvar_40 = false
	Gvar_41 = Gvar_33
	Gvar_54 = false
	Gvar_55 = false
	Gvar_56 = false
	Gvar_57 = false
	Gvar_58 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(2)
	if true then return end
end
function MapShutdown()
	JournalSetObjective(2,"War02A:EnteredGauntlet")
	if true then return end
end
function BlockSecret()
	TeleportWaypoint(Gvar_4,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_4)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function OpenBlockSecretExit()
	WallMakeSilent(false)
	OpenSecretWall(GetWallAt(77,157))
	if true then return end
end
function ResetSquishTrapSEG1()
	MoveTo(Gvar_8,Gvar_25)
	MoveTo(Gvar_9,Gvar_26)
	MoveTo(Gvar_10,Gvar_27)
	MoveTo(Gvar_11,Gvar_28)
	MoveTo(Gvar_12,Gvar_29)
	MoveTo(Gvar_13,Gvar_30)
	MoveTo(Gvar_14,Gvar_31)
	MoveTo(Gvar_15,Gvar_32)
	AudioEvent("BoulderMove",Gvar_16)
	WaitFrames(20,7)
	if true then return end
end
function ResetSquishTrapSEG2()
	EnableObject(Gvar_6)
	EnableObject(Gvar_7)
	if true then return end
end
function InitializeSquishBlocks()
	Gvar_6 = ObjFromName("SquishTrigger")
	Gvar_7 = ObjFromName("BoomTrigger")
	Gvar_8 = ObjFromName("SquishBlock01")
	Gvar_9 = ObjFromName("SquishBlock02")
	Gvar_10 = ObjFromName("SquishBlock03")
	Gvar_11 = ObjFromName("SquishBlock04")
	Gvar_12 = ObjFromName("SquishBlock05")
	Gvar_13 = ObjFromName("SquishBlock06")
	Gvar_14 = ObjFromName("SquishBlock07")
	Gvar_15 = ObjFromName("SquishBlock08")
	Gvar_16 = WaypointFromName("SquishAudioOrigin")
	Gvar_17 = WaypointFromName("SquishWP01")
	Gvar_18 = WaypointFromName("SquishWP02")
	Gvar_19 = WaypointFromName("SquishWP03")
	Gvar_20 = WaypointFromName("SquishWP04")
	Gvar_21 = WaypointFromName("SquishWP05")
	Gvar_22 = WaypointFromName("SquishWP06")
	Gvar_23 = WaypointFromName("SquishWP07")
	Gvar_24 = WaypointFromName("SquishWP08")
	Gvar_25 = WaypointFromName("SquishWPHome01")
	Gvar_26 = WaypointFromName("SquishWPHome02")
	Gvar_27 = WaypointFromName("SquishWPHome03")
	Gvar_28 = WaypointFromName("SquishWPHome04")
	Gvar_29 = WaypointFromName("SquishWPHome05")
	Gvar_30 = WaypointFromName("SquishWPHome06")
	Gvar_31 = WaypointFromName("SquishWPHome07")
	Gvar_32 = WaypointFromName("SquishWPHome08")
	if true then return end
end
function Squish()
	DisableObject(Gvar_6)
	MoveTo(Gvar_8,Gvar_17)
	MoveTo(Gvar_9,Gvar_18)
	MoveTo(Gvar_10,Gvar_19)
	MoveTo(Gvar_11,Gvar_20)
	MoveTo(Gvar_12,Gvar_21)
	MoveTo(Gvar_13,Gvar_22)
	MoveTo(Gvar_14,Gvar_23)
	MoveTo(Gvar_15,Gvar_24)
	AudioEvent("BoulderMove",Gvar_16)
	WaitFrames(Gvar_5,6)
	if true then return end
end
function SquishBoom()
	if not (ObjIsCaller(Gvar_10) == 0) then 
		goto l9
	end
	if true then return end
	::l9::
	DisableObject(Gvar_7)
	AudioEvent("HammerMissing",Gvar_16)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	if true then return end
end
function GearhartDialogStart()
	ObjLookAtObj(Gvar_38,GetHostPlayer())
	DisableObjectGroup(Gvar_48)
	var_0 = Gvar_41
	if (var_0 == Gvar_33) then 
		goto l66
	end
	if (var_0 == Gvar_34) then 
		goto l76
	end
	if (var_0 == Gvar_35) then 
		goto l86
	end
	if (var_0 == Gvar_36) then 
		goto l96
	end
	if (var_0 == Gvar_37) then 
		goto l106
	end
	goto l116
	::l66::
	RemoveAllChat()
	StartDialogWithCaller("SwordsmanHurt","War02a:GearhartTalk02")
	goto l116
	::l76::
	RemoveAllChat()
	StartDialogWithCaller("SwordsmanHurt","War02a:GearhartTalk03")
	goto l116
	::l86::
	RemoveAllChat()
	StartDialogWithCaller("SwordsmanHurt","War02a:GearhartTalk04")
	goto l116
	::l96::
	RemoveAllChat()
	StartDialogWithCaller("SwordsmanHurt","War02a:GearhartTalk05")
	goto l116
	::l106::
	RemoveAllChat()
	StartDialogWithCaller("SwordsmanHurt","War02a:GearhartTalk06")
	goto l116
	::l116::
	if true then return end
end
function GearhartDialogEnd()
	EnableObjectGroup(Gvar_48)
	var_0 = Gvar_41
	if (var_0 == Gvar_33) then 
		goto l59
	end
	if (var_0 == Gvar_34) then 
		goto l119
	end
	if (var_0 == Gvar_35) then 
		goto l162
	end
	if (var_0 == Gvar_36) then 
		goto l164
	end
	if (var_0 == Gvar_37) then 
		goto l166
	end
	goto l192
	::l59::
	CancelDialog(Gvar_38)
	MonsterGuardArea(Gvar_38,GetWaypointX(Gvar_50),GetWaypointY(Gvar_50),GetWaypointX(Gvar_52),GetWaypointY(Gvar_52),0)
	InvPutObj(GetHostPlayer(),ObjFromName("SilverKey01"))
	PrintToAll("GeneralPrint:GainedKey")
	AudioEvent("KeyDrop",Gvar_39)
	Gvar_41 = Gvar_34
	goto l192
	::l119::
	Gvar_55 = true
	MonsterGuardArea(Gvar_38,GetWaypointX(Gvar_53),GetWaypointY(Gvar_53),GetWaypointX(Gvar_52),GetWaypointY(Gvar_52),0)
	Gvar_41 = Gvar_35
	goto l192
	::l162::
	goto l192
	::l164::
	goto l192
	::l166::
	Gvar_56 = true
	MonsterFollowObj(Gvar_38,GetHostPlayer())
	CancelDialog(Gvar_38)
	EnableObject(Gvar_45)
	goto l192
	::l192::
	if true then return end
end
function GearRoomMusic()
	PlayMusic(26,100)
	if true then return end
end
function InitializeSwitchPuzzle()
	Gvar_42 = ObjFromName("ExitElevator")
	Gvar_43 = ObjFromName("PlayerSwitch")
	Gvar_44 = ObjFromName("GearhartSwitch")
	Gvar_45 = ObjFromName("ExitTrigger")
	Gvar_46 = ObjGroupFromName("ElevatorSwitches")
	Gvar_47 = ObjGroupFromName("ElevatorGears")
	Gvar_49 = WaypointFromName("FenceWP")
	Gvar_50 = WaypointFromName("GateWP")
	Gvar_51 = WaypointFromName("GearRoomEntranceWP")
	Gvar_52 = WaypointFromName("PlayerSwitchWP")
	Gvar_53 = WaypointFromName("GearhartSwitchWP")
	Gvar_39 = WaypointFromName("SilverKeyWay")
	if true then return end
end
function SetGearhartDialog()
	if not (ObjIsCaller(Gvar_38)) then 
		goto l30
	end
	SetDialogPortrait(Gvar_38,"GearhartPic")
	SetupDialog(Gvar_38,"FALSE",11,12)
	DisableObject(Trigger)
	::l30::
	if true then return end
end
function GearhartCallForHelp()
	if not (Gvar_54) then 
		goto l6
	end
	if true then return end
	::l6::
	Gvar_54 = true
	SayChat(Gvar_38,"War02a:GearhartTalk01")
	MoveTo(Gvar_38,Gvar_49)
	SetDialogPortrait(Gvar_38,"GearhartPic")
	SetupDialog(Gvar_38,"FALSE",11,12)
	if true then return end
end
function CheckForBothButtons()
	if not (Gvar_55 == 0) then 
		goto l7
	end
	if true then return end
	::l7::
	if not (Gvar_58 and Gvar_57) then 
		goto l51
	end
	PlayMusic(16,100)
	EnableObject(Gvar_42)
	EnableObjectGroup(Gvar_47)
	DisableObjectGroup(Gvar_46)
	Gvar_41 = Gvar_37
	ForceDialog(Gvar_38,GetHostPlayer())
	::l51::
	if true then return end
end
function PlayerSwitchActivate()
	Gvar_58 = true
	CheckForBothButtons()
	if true then return end
end
function PlayerSwitchDeactivate()
	Gvar_58 = false
	if true then return end
end
function GearhartSwitchActivate()
	if not (ObjIsCaller(Gvar_38)) then 
		goto l14
	end
	SayChat(Gvar_38,"War02a:GearhartTalk05")
	::l14::
	Gvar_57 = true
	CheckForBothButtons()
	if true then return end
end
function GearhartSwitchDeactivate()
	Gvar_57 = false
	if true then return end
end
function LeaveGearRoom()
	if not (ObjIsCaller(Gvar_38)) then 
		goto l28
	end
	MonsterGuardArea(Gvar_38,GetWaypointX(Gvar_51),GetWaypointY(Gvar_51),0,0,0)
	::l28::
	if true then return end
end
function EnterGearRoom()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l18
	end
	if not (Gvar_56) then 
		goto l18
	end
	MonsterFollowObj(Gvar_38,GetHostPlayer())
	::l18::
	if true then return end
end
function gotoExit()
	if not (Gvar_40 == 0) then 
		goto l14
	end
	TeleportObj(GetHostPlayer(),494,610)
	::l14::
	if true then return end
end
function ExitSewers()
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(60,24)
	if true then return end
end
function Exit()
	Gvar_40 = true
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function sweepsOn123()
	if not (ObjIsEnabled(Gvar_59) == 0) then 
		goto l13
	end
	EnableObject(Gvar_59)
	::l13::
	TeleportWaypoint(Gvar_4,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BoulderMove",Gvar_4)
	EnableObject(Gvar_60)
	EnableObject(Gvar_61)
	EnableObject(Gvar_62)
	MoveTo(Gvar_60,Gvar_75)
	MoveTo(Gvar_61,Gvar_77)
	MoveTo(Gvar_62,Gvar_79)
	if true then return end
end
function sweepsOn456()
	TeleportWaypoint(Gvar_4,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BoulderMove",Gvar_4)
	EnableObject(Gvar_63)
	EnableObject(Gvar_64)
	EnableObject(Gvar_65)
	MoveTo(Gvar_63,Gvar_80)
	MoveTo(Gvar_64,Gvar_82)
	MoveTo(Gvar_65,Gvar_84)
	if true then return end
end
function sweepsOn789()
	TeleportWaypoint(Gvar_4,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BoulderMove",Gvar_4)
	EnableObject(Gvar_66)
	EnableObject(Gvar_67)
	EnableObject(Gvar_68)
	MoveTo(Gvar_66,Gvar_87)
	MoveTo(Gvar_67,Gvar_89)
	MoveTo(Gvar_68,Gvar_91)
	if true then return end
end
function sweepsOn10thru14()
	EnableObject(Gvar_69)
	EnableObject(Gvar_70)
	EnableObject(Gvar_71)
	EnableObject(Gvar_72)
	EnableObject(Gvar_73)
	if true then return end
end
function sweepsOff123()
	MoveTo(Gvar_60,Gvar_74)
	MoveTo(Gvar_61,Gvar_76)
	MoveTo(Gvar_62,Gvar_78)
	if true then return end
end
function sweepsOff456()
	MoveTo(Gvar_63,Gvar_81)
	MoveTo(Gvar_64,Gvar_83)
	MoveTo(Gvar_65,Gvar_85)
	if true then return end
end
function sweepsOff789()
	MoveTo(Gvar_66,Gvar_86)
	MoveTo(Gvar_67,Gvar_88)
	MoveTo(Gvar_68,Gvar_90)
	if true then return end
end
function sweepsOff10thru14()
	DisableObject(Gvar_69)
	DisableObject(Gvar_70)
	DisableObject(Gvar_71)
	DisableObject(Gvar_72)
	DisableObject(Gvar_73)
	if true then return end
end
function MapInitialize()
	Gvar_38 = ObjFromName("F2Gearhart")
	Gvar_60 = ObjFromName("SweeperMover1")
	Gvar_61 = ObjFromName("SweeperMover2")
	Gvar_62 = ObjFromName("SweeperMover3")
	Gvar_63 = ObjFromName("SweeperMover4")
	Gvar_64 = ObjFromName("SweeperMover5")
	Gvar_65 = ObjFromName("SweeperMover6")
	Gvar_66 = ObjFromName("SweeperMover7")
	Gvar_67 = ObjFromName("SweeperMover8")
	Gvar_68 = ObjFromName("SweeperMover9")
	Gvar_69 = ObjFromName("SweeperMover10")
	Gvar_70 = ObjFromName("SweeperMover11")
	Gvar_71 = ObjFromName("SweeperMover12")
	Gvar_72 = ObjFromName("SweeperMover13")
	Gvar_73 = ObjFromName("SweeperMover14")
	Gvar_48 = ObjGroupFromName("EveryMonsterOnMap")
	Gvar_4 = WaypointFromName("AudioOrigin")
	Gvar_74 = WaypointFromName("SweeperWay1a")
	Gvar_75 = WaypointFromName("SweeperWay1b")
	Gvar_76 = WaypointFromName("SweeperWay2a")
	Gvar_77 = WaypointFromName("SweeperWay2b")
	Gvar_78 = WaypointFromName("SweeperWay3a")
	Gvar_79 = WaypointFromName("SweeperWay3b")
	Gvar_80 = WaypointFromName("SweeperWay4")
	Gvar_81 = WaypointFromName("SweeperWay4a")
	Gvar_82 = WaypointFromName("SweeperWay5")
	Gvar_83 = WaypointFromName("SweeperWay5a")
	Gvar_84 = WaypointFromName("SweeperWay6")
	Gvar_85 = WaypointFromName("SweeperWay6a")
	Gvar_86 = WaypointFromName("SweeperWay7")
	Gvar_87 = WaypointFromName("SweeperWay7a")
	Gvar_88 = WaypointFromName("SweeperWay8")
	Gvar_89 = WaypointFromName("SweeperWay8a")
	Gvar_90 = WaypointFromName("SweeperWay9")
	Gvar_91 = WaypointFromName("SweeperWay9a")
	Gvar_59 = ObjFromName("Spider01")
	InitializeSwitchPuzzle()
	InitializeSquishBlocks()
	if true then return end
end
function MapEntry()
	CinematicFadeout()
	if true then return end
end