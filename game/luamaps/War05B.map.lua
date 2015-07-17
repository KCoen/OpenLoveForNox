
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_12 = 0
	Gvar_13 = 1
	Gvar_14 = 2
	Gvar_15 = 3
	Gvar_16 = 4
	Gvar_17 = 5
	Gvar_18 = 6
	Gvar_19 = 7
	Gvar_20 = 8
	Gvar_21 = Gvar_12
	Gvar_22 = Gvar_14
	Gvar_23 = Gvar_16
	Gvar_24 = Gvar_19
	Gvar_25 = 0
	Gvar_26 = false
	Gvar_27 = false
	Gvar_28 = false
	if true then return end
end
function StopElevator()
	DisableObject(Gvar_4)
	WaitFrames(60,3)
	if true then return end
end
function LowerKeyProtectWalls()
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_5)
	WallMakeSilent(false)
	if true then return end
end
function RaiseKey()
	EnableObject(Gvar_4)
	WaitFrames(5,2)
	if true then return end
end
function UnlockMainGates()
	DisableObject(Gvar_8)
	UnlockDoor(Gvar_6)
	UnlockDoor(Gvar_7)
	if true then return end
end
function DefendCage()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	MonsterGoFight(Trigger,GetHostPlayer())
	::l13::
	if true then return end
end
function ReturnToPost()
	if not (ObjIsCaller(Gvar_9) or ObjIsCaller(Gvar_10)) then 
		goto l18
	end
	MonsterGotoHome(Caller)
	::l18::
	if true then return end
end
function SecretFound()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_11,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_11)
	PlayerGiveExp(GetHostPlayer(),40)
	if true then return end
end
function CallForGuards()
	ObjFreeze(Gvar_45,true)
	MonsterIdle(Gvar_45)
	SetupDialog(Gvar_45,"NEXT",11,12)
	SetDialogPortrait(Gvar_45,"OgreWarlordPic")
	ForceDialog(Gvar_45,GetHostPlayer())
	if true then return end
end
function ProtectTheKing()
	LetterBoxOff()
	EnableObjectGroup(Gvar_70)
	ObjFreeze(GetHostPlayer(),false)
	CancelEnchant(Gvar_45,"ENCHANT_INVULNERABLE")
	ObjResetMaster(Gvar_45)
	ObjFreeze(Gvar_45,false)
	EnableObject(Gvar_46)
	EnableObject(Gvar_47)
	EnableObject(Gvar_48)
	MonsterSetAggressiveness(Gvar_45,0.5)
	TeleportObj(Gvar_46,GetWaypointX(Gvar_65),GetWaypointY(Gvar_65))
	TeleportObj(Gvar_47,GetWaypointX(Gvar_66),GetWaypointY(Gvar_66))
	TeleportObj(Gvar_48,GetWaypointX(Gvar_67),GetWaypointY(Gvar_67))
	MonsterGoRoam(Gvar_46)
	MonsterGoRoam(Gvar_47)
	MonsterGuardArea(Gvar_48,GetWaypointX(Gvar_68),GetWaypointY(Gvar_68),GetWaypointX(Gvar_64),GetWaypointY(Gvar_64),0)
	if true then return end
end
function KingStart()
	var_0 = Gvar_24
	if (var_0 == Gvar_19) then 
		goto l27
	end
	if (var_0 == Gvar_20) then 
		goto l49
	end
	goto l57
	::l27::
	StartDialogWithCaller("SwordsmanHurt","Con05:OgreTalk07")
	ObjLookAtObj(Gvar_45,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_45)
	goto l57
	::l49::
	StartDialogWithCaller("SwordsmanHurt","Con05:OgreTalk08")
	goto l57
	::l57::
	if true then return end
end
function KingEnd()
	var_0 = Gvar_24
	if (var_0 == Gvar_19) then 
		goto l27
	end
	if (var_0 == Gvar_20) then 
		goto l43
	end
	goto l77
	::l27::
	Gvar_24 = Gvar_20
	ForceDialog(Gvar_45,GetHostPlayer())
	goto l77
	::l43::
	CancelDialog(Gvar_45)
	ProtectTheKing()
	MonsterGuardArea(Gvar_45,GetWaypointX(Gvar_64),GetWaypointY(Gvar_64),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),500)
	goto l77
	::l77::
	if true then return end
end
function CaptainStart()
	var_0 = Gvar_21
	if (var_0 == Gvar_12) then 
		goto l27
	end
	if (var_0 == Gvar_13) then 
		goto l49
	end
	goto l71
	::l27::
	ObjLookAtObj(Gvar_37,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_37)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:CaptainWaiting")
	goto l71
	::l49::
	ObjLookAtObj(Gvar_37,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_37)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:CaptainSuccess3")
	goto l71
	::l71::
	if true then return end
end
function CaptainEnd()
	var_0 = Gvar_21
	if (var_0 == Gvar_12) then 
		goto l27
	end
	if (var_0 == Gvar_13) then 
		goto l29
	end
	goto l69
	::l27::
	goto l69
	::l29::
	JournalUpdateEntry(GetHostPlayer(),"War05Quest4",4)
	CancelDialog(Gvar_37)
	Gvar_23 = Gvar_18
	SetupDialog(Gvar_38,"NORMAL",25,26)
	ForceDialog(Gvar_38,GetHostPlayer())
	goto l69
	::l69::
	if true then return end
end
function LetterBoxOn()
	CinematicBorders(true)
	if true then return end
end
function LetterBoxOff()
	CinematicBorders(false)
	if true then return end
end
function PlayerDeath()
	DeathScreen(5)
	if true then return end
end
function MaidenStart()
	var_0 = Gvar_22
	if (var_0 == Gvar_14) then 
		goto l27
	end
	if (var_0 == Gvar_15) then 
		goto l35
	end
	goto l43
	::l27::
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:MaidenFollowing")
	goto l43
	::l35::
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:MaidenRescued")
	goto l43
	::l43::
	if true then return end
end
function MaidenEnd()
	var_0 = Gvar_22
	if (var_0 == Gvar_14) then 
		goto l27
	end
	if (var_0 == Gvar_15) then 
		goto l29
	end
	goto l31
	::l27::
	goto l31
	::l29::
	goto l31
	::l31::
	if true then return end
end
function RescueMaidens()
	DisableObject(Gvar_34)
	JournalSetObjective(1,"ChicksSaved")
	LetterBoxOn()
	ObjFreeze(GetHostPlayer(),true)
	MonsterFollowObj(Gvar_30,GetHostPlayer())
	MonsterFollowObj(Gvar_31,GetHostPlayer())
	MonsterFollowObj(Gvar_32,GetHostPlayer())
	MonsterFollowObj(Gvar_33,GetHostPlayer())
	MonsterFollowObj(Gvar_29,GetHostPlayer())
	SetupDialog(Gvar_29,"NORMAL",21,22)
	SetDialogPortrait(Gvar_29,"GlyndaPic")
	ObjLookAtObj(Gvar_29,GetHostPlayer())
	ForceDialog(Gvar_29,GetHostPlayer())
	SetDialogPortrait(Gvar_30,"MaidenPic")
	SetDialogPortrait(Gvar_31,"MaidenPic2")
	SetDialogPortrait(Gvar_32,"MaidenPic3")
	SetDialogPortrait(Gvar_33,"MaidenPic4")
	if true then return end
end
function SisterStart()
	var_0 = Gvar_23
	if (var_0 == Gvar_16) then 
		goto l36
	end
	if (var_0 == Gvar_17) then 
		goto l58
	end
	if (var_0 == Gvar_18) then 
		goto l80
	end
	goto l102
	::l36::
	ObjLookAtObj(Gvar_29,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_29)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:SisterFreed")
	goto l102
	::l58::
	ObjLookAtObj(Gvar_29,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_29)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:SisterFollowing3")
	goto l102
	::l80::
	ObjLookAtObj(Gvar_29,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_29)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:SisterIdle")
	goto l102
	::l102::
	if true then return end
end
function SisterEnd()
	var_0 = Gvar_23
	if (var_0 == Gvar_16) then 
		goto l36
	end
	if (var_0 == Gvar_17) then 
		goto l92
	end
	if (var_0 == Gvar_18) then 
		goto l94
	end
	goto l114
	::l36::
	LetterBoxOff()
	ObjFreeze(GetHostPlayer(),false)
	MonsterMakeFriendly(Gvar_30)
	MonsterMakeFriendly(Gvar_31)
	MonsterMakeFriendly(Gvar_32)
	MonsterMakeFriendly(Gvar_33)
	MonsterMakeFriendly(Gvar_29)
	MoveNPCs()
	Gvar_23 = Gvar_17
	JournalSetObjective(1,"MaidensRescued")
	CancelDialog(Gvar_29)
	goto l114
	::l92::
	goto l114
	::l94::
	SetupDialog(Gvar_38,"NORMAL",25,26)
	ForceDialog(Gvar_38,GetHostPlayer())
	goto l114
	::l114::
	if true then return end
end
function MoveNPCs()
	TeleportObj(Gvar_37,GetWaypointX(Gvar_53),GetWaypointY(Gvar_53))
	MonsterGuardArea(Gvar_37,GetWaypointX(Gvar_53),GetWaypointY(Gvar_53),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	TeleportObj(Gvar_38,GetWaypointX(Gvar_63),GetWaypointY(Gvar_63))
	MonsterGuardArea(Gvar_38,GetWaypointX(Gvar_63),GetWaypointY(Gvar_63),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	TeleportObj(Gvar_41,GetWaypointX(Gvar_54),GetWaypointY(Gvar_54))
	MonsterGuardArea(Gvar_41,GetWaypointX(Gvar_54),GetWaypointY(Gvar_54),GetWaypointX(Gvar_56),GetWaypointY(Gvar_56),0)
	TeleportObj(Gvar_42,GetWaypointX(Gvar_55),GetWaypointY(Gvar_55))
	MonsterGuardArea(Gvar_42,GetWaypointX(Gvar_55),GetWaypointY(Gvar_55),GetWaypointX(Gvar_56),GetWaypointY(Gvar_56),0)
	if true then return end
end
function FinalScene()
	LetterBoxOn()
	ObjFreeze(GetHostPlayer(),true)
	Gvar_21 = Gvar_13
	SetupDialog(Gvar_37,"NEXT",13,14)
	ForceDialog(Gvar_37,GetHostPlayer())
	if true then return end
end
function IngridStart()
	ObjLookAtObj(Gvar_38,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_38)
	StartDialogWithCaller("SwordsmanHurt","War05B.scr:IngridReturned")
	if true then return end
end
function IngridEnd()
	InvPutObj(GetHostPlayer(),Gvar_40)
	InvPutObj(GetHostPlayer(),Gvar_39)
	CancelDialog(Gvar_38)
	MissionComplete()
	if true then return end
end
function MissionComplete()
	PlayerGiveExp(GetHostPlayer(),1000)
	CinematicFade()
	WaitFrames(45,28)
	if true then return end
end
function Victory()
	ObjFreeze(GetHostPlayer(),false)
	LetterBoxOff()
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_69),GetWaypointY(Gvar_69))
	if true then return end
end
function MaidenDeath()
	PrintToAll("War05B.scr:MaidenDeath")
	DeathScreen(5)
	if true then return end
end
function MapInitialize()
	Gvar_6 = ObjFromName("MainGate1")
	Gvar_7 = ObjFromName("MainGate2")
	Gvar_8 = ObjFromName("MainGateSwitch")
	Gvar_43 = ObjFromName("TownGate1")
	Gvar_44 = ObjFromName("TownGate2")
	Gvar_29 = ObjFromName("W5Sister")
	Gvar_30 = ObjFromName("W5Maiden1")
	Gvar_31 = ObjFromName("W5Maiden2")
	Gvar_32 = ObjFromName("W5Maiden3")
	Gvar_33 = ObjFromName("W5Maiden4")
	Gvar_34 = ObjFromName("SetMaidenDialogTrigger")
	Gvar_35 = ObjFromName("CellDoor")
	Gvar_36 = ObjFromName("CellDoorSwitch")
	Gvar_41 = ObjFromName("Soldier1")
	Gvar_42 = ObjFromName("Soldier2")
	Gvar_37 = ObjFromName("W5Captain")
	Gvar_38 = ObjFromName("W5Ingrid")
	Gvar_39 = ObjFromName("PotionGift")
	Gvar_40 = ObjFromName("GoldGift")
	Gvar_45 = ObjFromName("OgreKing")
	Gvar_49 = ObjFromName("CallForGuardsTrigger")
	Gvar_4 = ObjFromName("KeyElevator")
	Gvar_46 = ObjFromName("Guard1")
	Gvar_47 = ObjFromName("Guard2")
	Gvar_48 = ObjFromName("Guard3")
	Gvar_9 = ObjFromName("CageGuard1")
	Gvar_10 = ObjFromName("CageGuard2")
	Gvar_50 = ObjGroupFromName("KingTriggerGroup")
	Gvar_51 = ObjGroupFromName("CaveEnemies")
	Gvar_70 = ObjGroupFromName("WarlordOgres")
	Gvar_52 = WallGroupFromName("LordSafetyWalls")
	Gvar_5 = WallGroupFromName("KeyProtectWalls")
	Gvar_64 = WaypointFromName("OgreKingWaypoint")
	Gvar_53 = WaypointFromName("CaptainWP")
	Gvar_54 = WaypointFromName("Soldier1WP")
	Gvar_55 = WaypointFromName("Soldier2WP")
	Gvar_56 = WaypointFromName("SoldierLook")
	Gvar_57 = WaypointFromName("FaceWP")
	Gvar_58 = WaypointFromName("WP1")
	Gvar_59 = WaypointFromName("WP2")
	Gvar_60 = WaypointFromName("WP3")
	Gvar_61 = WaypointFromName("WP4")
	Gvar_62 = WaypointFromName("SisterWP")
	Gvar_63 = WaypointFromName("IngridWP")
	Gvar_65 = WaypointFromName("Guard1WP")
	Gvar_66 = WaypointFromName("Guard2WP")
	Gvar_67 = WaypointFromName("Guard3WP")
	Gvar_68 = WaypointFromName("Guard3SpotWP")
	Gvar_69 = WaypointFromName("MapExit")
	Gvar_11 = WaypointFromName("PlayerSounds")
	SetDialogPortrait(Gvar_37,"AirshipCaptainPic")
	SetupDialog(Gvar_37,"NORMAL",13,14)
	SetDialogPortrait(Gvar_38,"IngridPic")
	LockDoor(Gvar_35)
	LockDoor(Gvar_6)
	LockDoor(Gvar_7)
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
function Activate()
	Gvar_26 = true
	DisableObjectGroup(Gvar_50)
	EnableObject(Gvar_49)
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_70)
	WaitFrames(1,15)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_52)
	WallMakeSilent(false)
	MoveTo(Gvar_45,Gvar_64)
	if true then return end
end
function PummelPlayer()
	MonsterAttackMelee(Trigger,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	if true then return end
end
function MapEntry()
	ObjFreeze(GetHostPlayer(),false)
	CinematicBorders(false)
	PlayMusic(7,100)
	if not (JournalSetQuest("MaidensRescued") == 1) then 
		goto l112
	end
	Gvar_30 = ObjFromName("War05B:W5Maiden1")
	Gvar_31 = ObjFromName("War05B:W5Maiden2")
	Gvar_32 = ObjFromName("War05B:W5Maiden3")
	Gvar_33 = ObjFromName("War05B:W5Maiden4")
	Gvar_29 = ObjFromName("War05B:W5Sister")
	MonsterEventScript(Gvar_30,5,29)
	MonsterEventScript(Gvar_31,5,29)
	MonsterEventScript(Gvar_32,5,29)
	MonsterEventScript(Gvar_33,5,29)
	MonsterEventScript(Gvar_29,5,29)
	::l112::
	if true then return end
end
function FadeOut()
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	CinematicFade()
	if true then return end
end
function UnlockCellDoor()
	DisableObject(Gvar_36)
	UnlockDoor(Gvar_35)
	PrintToAll("War05B.scr:OgreCageUnlocked")
	if true then return end
end
function PlayerLeft()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_28 = false
	::l13::
	if true then return end
end
function CheckRescue()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l74
	end
	Gvar_28 = true
	if not (JournalSetQuest("MaidensRescued") == 1) then 
		goto l74
	end
	CancelDialog(Gvar_29)
	ApplyEnchant(Gvar_30,"ENCHANT_INVULNERABLE",0)
	ApplyEnchant(Gvar_31,"ENCHANT_INVULNERABLE",0)
	ApplyEnchant(Gvar_32,"ENCHANT_INVULNERABLE",0)
	ApplyEnchant(Gvar_33,"ENCHANT_INVULNERABLE",0)
	ApplyEnchant(Gvar_29,"ENCHANT_INVULNERABLE",0)
	FinalScene()
	::l74::
	if true then return end
end
function CheckRescue2()
	if not (ObjIsCaller(Gvar_30)) then 
		goto l50
	end
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetWaypointX(Gvar_58),GetWaypointY(Gvar_58),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	CancelDialog(Gvar_30)
	Gvar_25 = Gvar_25 + 1
	::l50::
	if not (ObjIsCaller(Gvar_31)) then 
		goto l100
	end
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetWaypointX(Gvar_59),GetWaypointY(Gvar_59),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	CancelDialog(Gvar_31)
	Gvar_25 = Gvar_25 + 1
	::l100::
	if not (ObjIsCaller(Gvar_32)) then 
		goto l150
	end
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetWaypointX(Gvar_60),GetWaypointY(Gvar_60),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	CancelDialog(Gvar_32)
	Gvar_25 = Gvar_25 + 1
	::l150::
	if not (ObjIsCaller(Gvar_33)) then 
		goto l200
	end
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetWaypointX(Gvar_61),GetWaypointY(Gvar_61),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	CancelDialog(Gvar_33)
	Gvar_25 = Gvar_25 + 1
	::l200::
	if not (ObjIsCaller(Gvar_29)) then 
		goto l250
	end
	MonsterMakeHostile(Caller)
	MonsterGuardArea(Caller,GetWaypointX(Gvar_62),GetWaypointY(Gvar_62),GetWaypointX(Gvar_57),GetWaypointY(Gvar_57),0)
	CancelDialog(Gvar_29)
	Gvar_25 = Gvar_25 + 1
	::l250::
	if not (ObjIsHostileTo(Caller,GetHostPlayer())) then 
		goto l264
	end
	MonsterGotoHome(Caller)
	::l264::
	if true then return end
end