
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = 0
	Gvar_5 = 1
	Gvar_6 = 2
	Gvar_9 = 200
	Gvar_10 = 2
	Gvar_11 = 0
	Gvar_12 = Gvar_4
	Gvar_61 = 0
	Gvar_62 = 1
	Gvar_63 = 2
	Gvar_64 = 3
	Gvar_65 = Gvar_61
	Gvar_66 = 0
	Gvar_67 = 1
	Gvar_68 = 2
	Gvar_69 = 3
	Gvar_70 = Gvar_66
	Gvar_71 = 0
	Gvar_72 = 1
	Gvar_73 = Gvar_71
	Gvar_74 = 0
	Gvar_75 = 1
	Gvar_76 = Gvar_74
	Gvar_77 = 0
	Gvar_78 = 1
	Gvar_79 = Gvar_77
	Gvar_80 = 0
	Gvar_81 = 1
	Gvar_82 = Gvar_80
	Gvar_83 = 0
	Gvar_84 = 1
	Gvar_85 = Gvar_83
	Gvar_86 = 0
	Gvar_87 = 1
	Gvar_88 = Gvar_86
	Gvar_89 = 0
	Gvar_90 = 1
	Gvar_91 = 2
	Gvar_92 = 3
	Gvar_93 = Gvar_89
	Gvar_94 = 0
	Gvar_95 = 1
	Gvar_96 = 2
	Gvar_97 = Gvar_94
	if true then return end
end
function PlayerDeath()
	DeathScreen(3)
	if true then return end
end
function ReleaseCharmedWolf(arg_0)
	var_1 = arg_0
	if (var_1 == 0) then 
		goto l41
	end
	if (var_1 == 1) then 
		goto l102
	end
	if (var_1 == 2) then 
		goto l163
	end
	if (var_1 == 3) then 
		goto l224
	end
	goto l285
	::l41::
	OpenSecretWall(GetWallAt(128,106))
	MonsterFollowObj(Gvar_13[arg_0],GetHostPlayer())
	MonsterWait(Gvar_13[arg_0],30)
	MonsterSetAggressiveness(Gvar_13[arg_0],0.83)
	ObjSetMasterByHost(Gvar_13[arg_0])
	MonsterMakeFriendly(Gvar_13[arg_0])
	goto l285
	::l102::
	OpenSecretWall(GetWallAt(130,104))
	MonsterFollowObj(Gvar_13[arg_0],GetHostPlayer())
	MonsterWait(Gvar_13[arg_0],30)
	MonsterSetAggressiveness(Gvar_13[arg_0],0.83)
	ObjSetMasterByHost(Gvar_13[arg_0])
	MonsterMakeFriendly(Gvar_13[arg_0])
	goto l285
	::l163::
	OpenSecretWall(GetWallAt(55,109))
	CancelEnchant(Gvar_13[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_13[arg_0],GetHostPlayer())
	MonsterSetAggressiveness(Gvar_13[arg_0],0.83)
	ObjSetMasterByHost(Gvar_13[arg_0])
	MonsterMakeFriendly(Gvar_13[arg_0])
	goto l285
	::l224::
	OpenSecretWall(GetWallAt(53,107))
	CancelEnchant(Gvar_13[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_13[arg_0],GetHostPlayer())
	MonsterSetAggressiveness(Gvar_13[arg_0],0.83)
	ObjSetMasterByHost(Gvar_13[arg_0])
	MonsterMakeFriendly(Gvar_13[arg_0])
	goto l285
	::l285::
	if true then return end
end
function HenrickTalkStart()
	var_0 = Gvar_12
	if (var_0 == Gvar_4) then 
		goto l36
	end
	if (var_0 == Gvar_5) then 
		goto l51
	end
	if (var_0 == Gvar_6) then 
		goto l66
	end
	goto l81
	::l36::
	ObjLookAtObj(Gvar_7,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSalesPitchA")
	goto l81
	::l51::
	ObjLookAtObj(Gvar_7,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSalesPitchB")
	goto l81
	::l66::
	ObjLookAtObj(Gvar_7,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNoMoreWolves")
	goto l81
	::l81::
	if true then return end
end
function HenrickTalkEnd()
	var_0 = 0
	var_1 = 0
	var_2 = 1
	var_3 = 2
	var_4 = 0
	var_7 = Gvar_12
	if (var_7 == Gvar_4) then 
		goto l66
	end
	if (var_7 == Gvar_5) then 
		goto l198
	end
	if (var_7 == Gvar_6) then 
		goto l349
	end
	goto l351
	::l66::
	var_1 = DialogGetResult(Gvar_7)
	var_5 = var_1
	if (var_5 == var_2) then 
		goto l111
	end
	if (var_5 == var_3) then 
		goto l192
	end
	if (var_5 == var_4) then 
		goto l194
	end
	goto l196
	::l111::
	var_0 = PlayerGetGold(GetHostPlayer())
	if not (var_0 < Gvar_9) then 
		goto l147
	end
	SetupDialog(Gvar_7,"NORMAL",6,8)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNotEnoughGold")
	goto l190
	::l147::
	PlayerAddGold(GetHostPlayer(),-Gvar_9)
	Gvar_12 = Gvar_5
	ReleaseCharmedWolf(Gvar_11)
	Gvar_11 = Gvar_11 + 1
	SetupDialog(Gvar_7,"NORMAL",6,8)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSaleSuccessful")
	::l190::
	goto l196
	::l192::
	goto l196
	::l194::
	goto l196
	::l196::
	goto l351
	::l198::
	var_1 = DialogGetResult(Gvar_7)
	var_6 = var_1
	if (var_6 == var_2) then 
		goto l243
	end
	if (var_6 == var_3) then 
		goto l343
	end
	if (var_6 == var_4) then 
		goto l345
	end
	goto l347
	::l243::
	var_0 = PlayerGetGold(GetHostPlayer())
	if not (var_0 < Gvar_9) then 
		goto l279
	end
	SetupDialog(Gvar_7,"NORMAL",6,8)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNotEnoughGold")
	goto l341
	::l279::
	PlayerAddGold(GetHostPlayer(),-Gvar_9)
	ReleaseCharmedWolf(Gvar_11)
	Gvar_11 = Gvar_11 + 1
	SetupDialog(Gvar_7,"NORMAL",6,8)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSaleSuccessful")
	if not (Gvar_11 >= 2) then 
		goto l341
	end
	Gvar_12 = Gvar_6
	SetupDialog(Gvar_7,"NORMAL",4,5)
	::l341::
	goto l347
	::l343::
	goto l347
	::l345::
	goto l347
	::l347::
	goto l351
	::l349::
	goto l351
	::l351::
	if true then return end
end
function NullDialogStart()
	if true then return end
end
function InitializeHenrick()
	SetDialogPortrait(Gvar_7,"HenrickPic")
	SetupDialog(Gvar_7,"YESNO",4,5)
	if true then return end
end
function ResetHenrickDialogChoice()
	SetupDialog(Gvar_7,"YESNO",4,5)
	if true then return end
end
function AirshipCaptainAppear()
	var_0 = GetWaypointX(Gvar_55)
	var_1 = GetWaypointY(Gvar_55)
	var_2 = GetWaypointX(Gvar_57)
	var_3 = GetWaypointY(Gvar_57)
	TeleportObj(Gvar_54,var_0,var_1)
	WaitFrames(1,57)
	if true then return end
end
function MayorPickup()
	TeleportObj(ObjFromName("War03c:MayorScepter"),4963,453)
	InvPutObj(GetHostPlayer(),Gvar_19)
	if true then return end
end
function MayorSpeaks()
	var_0 = GetObjX(Gvar_15)
	var_1 = GetObjY(Gvar_15)
	var_2 = GetObjX(GetHostPlayer())
	var_3 = GetObjY(GetHostPlayer())
	if not (GetDistance(var_0,var_1,var_2,var_3) < 150) then 
		goto l69
	end
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	ForceDialog(Gvar_15,GetHostPlayer())
	goto l75
	::l69::
	WaitFrames(22,11)
	::l75::
	if true then return end
end
function MayorGuardTime()
	var_0 = GetWaypointX(Gvar_58)
	var_1 = GetWaypointY(Gvar_58)
	var_2 = GetWaypointX(Gvar_17)
	var_3 = GetWaypointY(Gvar_17)
	MonsterGuardArea(Gvar_15,var_0,var_1,var_2,var_3,0)
	SetDialogPortrait(Gvar_15,"TheogrinPic")
	SetupDialog(Gvar_15,"NORMAL",13,28)
	if true then return end
end
function MayorTalkStart()
	if not (DoesHaveObject(GetHostPlayer(),ObjFromName("War03c:MayorScepter"))) then 
		goto l17
	end
	Gvar_65 = Gvar_63
	::l17::
	var_0 = Gvar_65
	if (var_0 == Gvar_61) then 
		goto l62
	end
	if (var_0 == Gvar_62) then 
		goto l77
	end
	if (var_0 == Gvar_63) then 
		goto l97
	end
	if (var_0 == Gvar_64) then 
		goto l112
	end
	goto l127
	::l62::
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorIntro")
	goto l127
	::l77::
	MonsterIdle(Gvar_15)
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorPre")
	goto l127
	::l97::
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorPost")
	goto l127
	::l112::
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorPost2")
	goto l127
	::l127::
	if true then return end
end
function MayorsGuardTalkStart()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	var_0 = Gvar_93
	if (var_0 == Gvar_89) then 
		goto l52
	end
	if (var_0 == Gvar_90) then 
		goto l60
	end
	if (var_0 == Gvar_91) then 
		goto l68
	end
	if (var_0 == Gvar_92) then 
		goto l76
	end
	goto l84
	::l52::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorsGuardIntro")
	goto l84
	::l60::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorsGuardPre")
	goto l84
	::l68::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorsGuardPost")
	goto l84
	::l76::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorsGuardPost2")
	goto l84
	::l84::
	if true then return end
end
function GatekeeperTalkStart()
	ObjLookAtObj(Gvar_23,GetHostPlayer())
	var_0 = Gvar_88
	if (var_0 == Gvar_86) then 
		goto l34
	end
	if (var_0 == Gvar_87) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03b:GatekeeperPre")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03b:GatekeeperPost")
	goto l50
	::l50::
	if true then return end
end
function BarkeeperTalkStart()
	ObjLookAtObj(Gvar_24,GetHostPlayer())
	var_0 = Gvar_85
	if (var_0 == Gvar_83) then 
		goto l34
	end
	if (var_0 == Gvar_84) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03b:BarkeeperPre")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03b:BarkeeperPost")
	goto l50
	::l50::
	if true then return end
end
function ContestGuardTalkStart()
	ObjLookAtObj(Gvar_25,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:ContestGuard")
	if true then return end
end
function BridgeGuardTalkStart()
	ObjLookAtObj(Gvar_36,GetHostPlayer())
	var_0 = Gvar_97
	if (var_0 == Gvar_94) then 
		goto l43
	end
	if (var_0 == Gvar_95) then 
		goto l51
	end
	if (var_0 == Gvar_96) then 
		goto l59
	end
	goto l67
	::l43::
	StartDialogWithCaller("SwordsmanHurt","War03b:BridgeGuardIntro")
	goto l67
	::l51::
	StartDialogWithCaller("SwordsmanHurt","War03b:BridgeGuardPre")
	goto l67
	::l59::
	StartDialogWithCaller("SwordsmanHurt","War03b:BridgeGuardPost")
	goto l67
	::l67::
	if true then return end
end
function Townsman1TalkStart()
	MonsterIdle(Gvar_26)
	ObjLookAtObj(Gvar_26,GetHostPlayer())
	var_0 = Gvar_73
	if (var_0 == Gvar_71) then 
		goto l39
	end
	if (var_0 == Gvar_72) then 
		goto l47
	end
	goto l55
	::l39::
	StartDialogWithCaller("SwordsmanHurt","War03b:T1Pre")
	goto l55
	::l47::
	StartDialogWithCaller("SwordsmanHurt","War03b:T1Post")
	goto l55
	::l55::
	if true then return end
end
function Townsman2TalkStart()
	MonsterIdle(Gvar_27)
	ObjLookAtObj(Gvar_27,GetHostPlayer())
	var_0 = Gvar_76
	if (var_0 == Gvar_74) then 
		goto l39
	end
	if (var_0 == Gvar_75) then 
		goto l47
	end
	goto l55
	::l39::
	StartDialogWithCaller("SwordsmanHurt","War03b:T2Pre")
	goto l55
	::l47::
	StartDialogWithCaller("SwordsmanHurt","War03b:T2Post")
	goto l55
	::l55::
	if true then return end
end
function Townsman3TalkStart()
	ObjLookAtObj(Gvar_28,GetHostPlayer())
	var_0 = Gvar_79
	if (var_0 == Gvar_77) then 
		goto l34
	end
	if (var_0 == Gvar_78) then 
		goto l43
	end
	goto l52
	::l34::
	SayChat(Gvar_28,"War02a:NewTownsman1")
	goto l52
	::l43::
	SayChat(Gvar_28,"War02a:NewTownsman2")
	goto l52
	::l52::
	if true then return end
end
function Townsman4TalkStart()
	ObjLookAtObj(Gvar_29,GetHostPlayer())
	var_0 = Gvar_82
	if (var_0 == Gvar_80) then 
		goto l34
	end
	if (var_0 == Gvar_81) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03b:T4Pre")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03b:T4Post")
	goto l50
	::l50::
	if true then return end
end
function AldwynTalkStart()
	ObjLookAtObj(Gvar_33,GetHostPlayer())
	if not (DoesHaveObject(GetHostPlayer(),ObjFromName("War03c:MayorScepter"))) then 
		goto l24
	end
	Gvar_70 = Gvar_68
	::l24::
	var_0 = Gvar_70
	if (var_0 == Gvar_66) then 
		goto l69
	end
	if (var_0 == Gvar_67) then 
		goto l77
	end
	if (var_0 == Gvar_68) then 
		goto l85
	end
	if (var_0 == Gvar_69) then 
		goto l93
	end
	goto l101
	::l69::
	StartDialogWithCaller("SwordsmanHurt","War03b:AldwynIntro")
	goto l101
	::l77::
	StartDialogWithCaller("SwordsmanHurt","War03b:AldwynPre")
	goto l101
	::l85::
	StartDialogWithCaller("SwordsmanHurt","War03b:AldwynPost")
	goto l101
	::l93::
	StartDialogWithCaller("SwordsmanHurt","War03b:AldwynPost2")
	goto l101
	::l101::
	if true then return end
end
function AirshipCaptainTalkStart()
	StartDialogWithCaller("SwordsmanHurt","War03b:AirshipCaptainIxSpeech")
	if true then return end
end
function PlayerExit()
	var_0 = GetWaypointX(Gvar_56)
	var_1 = GetWaypointY(Gvar_56)
	TeleportObj(GetHostPlayer(),var_0,var_1)
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function Maiden1TalkStart()
	MonsterIdle(Gvar_30)
	ObjLookAtObj(Gvar_30,GetHostPlayer())
	ObjLookAtObj(Gvar_30,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:Maiden1")
	if true then return end
end
function Maiden2TalkStart()
	MonsterIdle(Gvar_31)
	ObjLookAtObj(Gvar_31,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:Maiden2")
	if true then return end
end
function MayorTalkEnd()
	var_0 = Gvar_65
	if (var_0 == Gvar_61) then 
		goto l36
	end
	if (var_0 == Gvar_62) then 
		goto l99
	end
	if (var_0 == Gvar_63) then 
		goto l128
	end
	goto l227
	::l36::
	MoveTo(Gvar_15,Gvar_58)
	Print("Con01a:NewJournalEntry")
	JournalAddEntry(GetHostPlayer(),"War03bGetScepter",2)
	JournalUpdateEntry(GetHostPlayer(),"War03aIxQuest",4)
	Gvar_65 = Gvar_62
	Gvar_93 = Gvar_90
	Gvar_97 = Gvar_95
	Gvar_88 = Gvar_86
	CancelDialog(Gvar_15)
	goto l227
	::l99::
	MonsterGuardArea(Gvar_15,GetWaypointX(Gvar_58),GetWaypointY(Gvar_58),GetWaypointX(Gvar_17),GetWaypointY(Gvar_17),0)
	goto l227
	::l128::
	Gvar_65 = Gvar_64
	Gvar_93 = Gvar_92
	Gvar_70 = Gvar_69
	Gvar_20 = InvGetTopObj(GetHostPlayer())
	::l157::
	if not (Gvar_20) then 
		goto l195
	end
	Gvar_21 = InvGetNextObj(Gvar_20)
	if not (Gvar_20 == ObjFromName("War03c:MayorScepter")) then 
		goto l186
	end
	DeleteObject(Gvar_20)
	::l186::
	Gvar_20 = Gvar_21
	goto l157
	::l195::
	InvDropObj(Gvar_15,Gvar_19)
	WaitFrames(1,10)
	JournalUpdateEntry(GetHostPlayer(),"War03bGetScepter",4)
	PlayerGiveExp(GetHostPlayer(),1000)
	AirshipCaptainAppear()
	goto l227
	::l227::
	if true then return end
end
function MayorsGuardTalkEnd()
	if true then return end
end
function GatekeeperTalkEnd()
	if true then return end
end
function BarkeeperTalkEnd()
	if true then return end
end
function ContestGuardTalkEnd()
	if true then return end
end
function BridgeGuardTalkEnd()
	if true then return end
end
function Townsman1TalkEnd()
	MonsterGoRoam(Gvar_26)
	if true then return end
end
function Townsman2TalkEnd()
	MonsterGoRoam(Gvar_27)
	if true then return end
end
function Townsman3TalkEnd()
	MonsterGoRoam(Gvar_28)
	if true then return end
end
function Townsman4TalkEnd()
	if true then return end
end
function AldwynTalkEnd()
	var_0 = Gvar_70
	if (var_0 == Gvar_66) then 
		goto l18
	end
	goto l49
	::l18::
	InvDropObj(Gvar_33,Gvar_34)
	InvDropObj(Gvar_33,Gvar_35)
	WaitFrames(1,56)
	Gvar_70 = Gvar_67
	goto l49
	::l49::
	if true then return end
end
function AirshipCaptainTalkEnd()
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(60,25)
	CancelDialog(Gvar_54)
	if true then return end
end
function PlayTownMusic()
	PlayMusic(15,100)
	if true then return end
end
function Maiden1TalkEnd()
	MonsterGoRoam(Gvar_30)
	if true then return end
end
function Maiden2TalkEnd()
	if true then return end
end
function JacobDialogStart()
	ObjLookAtObj(Gvar_41,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con02A:JailerTalk01")
	if true then return end
end
function JacobDialogEnd()
	if true then return end
end
function MapInitialize()
	Gvar_42 = ObjFromName("CaveDoor")
	LockDoor(Gvar_42)
	Gvar_41 = ObjFromName("Jacob")
	Gvar_60 = WaypointFromName("WellWP")
	Gvar_22 = ObjGroupFromName("QuestTrigGroup")
	Gvar_15 = ObjFromName("MayorTheogrin")
	Gvar_17 = WaypointFromName("MayorLook")
	Gvar_18 = ObjFromName("MayorScepter")
	Gvar_19 = ObjFromName("MayorGift")
	InvPutObj(Gvar_15,Gvar_19)
	Gvar_58 = WaypointFromName("MayorHome")
	InvPutObj(Gvar_15,Gvar_19)
	Gvar_14 = ObjGroupFromName("MayorTrigs")
	Gvar_37 = ObjFromName("IxGuard1")
	Gvar_38 = ObjFromName("IxGuard2")
	Gvar_23 = ObjFromName("Geoff")
	Gvar_16 = ObjFromName("Mayor's_Guard")
	Gvar_24 = ObjFromName("Barkeeper")
	Gvar_39 = ObjFromName("BelforByzanti")
	Gvar_40 = ObjFromName("Mystic")
	Gvar_36 = ObjFromName("BridgeGuard")
	Gvar_25 = ObjFromName("ContestGuard")
	Gvar_26 = ObjFromName("Seth")
	Gvar_27 = ObjFromName("Rayner")
	Gvar_28 = ObjFromName("Townsman3")
	Gvar_29 = ObjFromName("Floyd")
	Gvar_7 = ObjFromName("Henrick")
	Gvar_8 = ObjFromName("Wolf1")
	Gvar_32 = ObjFromName("Wolf2")
	Gvar_30 = ObjFromName("F6Townswoman1")
	Gvar_31 = ObjFromName("F6Townswoman4")
	Gvar_13[0] = ObjFromName("Wolf1")
	Gvar_13[1] = ObjFromName("Wolf2")
	MonsterGoRoam(Gvar_26)
	MonsterGoRoam(Gvar_27)
	MonsterGoRoam(Gvar_28)
	Gvar_43 = ObjFromName("WaitTrig1")
	Gvar_44 = ObjFromName("WaitTrig2")
	Gvar_45 = ObjFromName("WaitTrig3")
	Gvar_46 = ObjGroupFromName("NPCs")
	Gvar_47 = ObjFromName("IxGate01")
	Gvar_48 = ObjFromName("IxGate02")
	Gvar_49 = ObjFromName("IxGate03")
	Gvar_50 = ObjFromName("IxGate04")
	Gvar_51 = ObjFromName("TempDoorL")
	Gvar_52 = ObjFromName("TempDoorR")
	Gvar_53 = ObjFromName("AldwynDoor")
	LockDoor(Gvar_49)
	LockDoor(Gvar_50)
	LockDoor(Gvar_51)
	LockDoor(Gvar_52)
	LockDoor(Gvar_53)
	Gvar_54 = ObjFromName("AirshipCaptain")
	Gvar_55 = WaypointFromName("AirshipCaptainWP")
	Gvar_57 = WaypointFromName("AirshipCaptainLook")
	Gvar_56 = WaypointFromName("ExitWP")
	ObjGroupSetMaster(GetHostPlayer(),Gvar_46)
	ObjSetMaster(GetHostPlayer(),Gvar_15)
	ObjSetMaster(GetHostPlayer(),Gvar_16)
	ObjSetMaster(GetHostPlayer(),Gvar_36)
	ObjSetMaster(GetHostPlayer(),Gvar_25)
	ObjSetMaster(GetHostPlayer(),Gvar_24)
	ObjSetMaster(GetHostPlayer(),Gvar_23)
	ObjSetMaster(GetHostPlayer(),Gvar_33)
	ObjSetMaster(GetHostPlayer(),Gvar_26)
	ObjSetMaster(GetHostPlayer(),Gvar_27)
	ObjSetMaster(GetHostPlayer(),Gvar_28)
	ObjSetMaster(GetHostPlayer(),Gvar_29)
	ObjSetMaster(GetHostPlayer(),Gvar_54)
	ObjSetMaster(GetHostPlayer(),Gvar_37)
	ObjSetMaster(GetHostPlayer(),Gvar_38)
	ObjSetMaster(GetHostPlayer(),Gvar_39)
	ObjSetMaster(GetHostPlayer(),Gvar_40)
	ObjSetMaster(GetHostPlayer(),Gvar_8)
	ObjSetMaster(GetHostPlayer(),Gvar_32)
	ObjSetMaster(GetHostPlayer(),Gvar_7)
	ObjSetMaster(GetHostPlayer(),Gvar_30)
	ObjSetMaster(GetHostPlayer(),Gvar_31)
	ObjSetMaster(GetHostPlayer(),Gvar_41)
	SetDialogPortrait(Gvar_23,"MalePic10")
	SetupDialog(Gvar_23,"NORMAL",15,30)
	SetDialogPortrait(Gvar_15,"TheogrinPic")
	SetupDialog(Gvar_15,"NORMAL",13,28)
	SetDialogPortrait(Gvar_16,"Warrior3Pic")
	SetupDialog(Gvar_16,"NORMAL",14,29)
	SetDialogPortrait(Gvar_25,"MalePic4")
	SetupDialog(Gvar_25,"NORMAL",17,32)
	SetDialogPortrait(Gvar_36,"MalePic9")
	SetupDialog(Gvar_36,"NORMAL",18,33)
	SetDialogPortrait(Gvar_26,"Townsman1Pic")
	SetupDialog(Gvar_26,"NORMAL",19,34)
	SetDialogPortrait(Gvar_27,"Townsman2Pic")
	SetupDialog(Gvar_27,"NORMAL",20,35)
	SetDialogPortrait(Gvar_28,"Townsman3Pic")
	SetupDialog(Gvar_28,"NORMAL",21,36)
	SetDialogPortrait(Gvar_29,"Townsman3Pic")
	SetupDialog(Gvar_29,"NORMAL",22,37)
	SetDialogPortrait(Gvar_33,"AldwynPic")
	SetupDialog(Gvar_33,"NORMAL",23,38)
	SetDialogPortrait(Gvar_54,"AirshipCaptainPic")
	SetupDialog(Gvar_54,"NORMAL",24,39)
	SetDialogPortrait(Gvar_30,"MaidenPic2")
	SetupDialog(Gvar_30,"NORMAL",26,41)
	SetDialogPortrait(Gvar_31,"MaidenPic6")
	SetupDialog(Gvar_31,"NORMAL",27,42)
	SetDialogPortrait(Gvar_41,"WardenPic")
	SetupDialog(Gvar_41,"NORMAL",43,44)
	Gvar_98 = ObjFromName("Bookcase")
	Gvar_100 = WaypointFromName("BookcaseWP")
	Gvar_99 = WallGroupFromName("MayorSecretWallGroup")
	Gvar_101 = WaypointFromName("Secret01WP")
	Gvar_102 = WaypointFromName("Secret02WP")
	InitializeHenrick()
	if true then return end
end
function MapEntry()
	Gvar_18 = ObjFromName("War03c:MayorScepter")
	CinematicFadeout()
	PlayTownMusic()
	if true then return end
end
function QuestSwitch()
	if not (DoesHaveObject(GetHostPlayer(),ObjFromName("War03c:MayorScepter"))) then 
		goto l92
	end
	DisableObjectGroup(Gvar_22)
	Gvar_93 = Gvar_91
	SetShopkeeperGreet(Gvar_24,"War03b:BarkeeperPost")
	Gvar_88 = Gvar_87
	Gvar_97 = Gvar_96
	Gvar_73 = Gvar_72
	Gvar_76 = Gvar_75
	Gvar_79 = Gvar_78
	Gvar_82 = Gvar_81
	CancelDialog(Gvar_31)
	JournalSetObjective(1,"QuestComplete")
	LockDoor(Gvar_47)
	LockDoor(Gvar_48)
	::l92::
	if true then return end
end
function MayorGreet()
	MonsterFollowObj(Gvar_15,GetHostPlayer())
	DisableObjectGroup(Gvar_14)
	MayorSpeaks()
	if true then return end
end
function EnableWaitTrigGroup1()
	EnableObjectGroup(Gvar_43)
	if true then return end
end
function Wait1()
	if not (ObjIsCaller(Gvar_26)) then 
		goto l19
	end
	MonsterWait(Gvar_26,500)
	DisableObjectGroup(Gvar_43)
	::l19::
	if true then return end
end
function EnableWaitTrigGroup2()
	EnableObjectGroup(Gvar_44)
	if true then return end
end
function Wait2()
	if not (ObjIsCaller(Gvar_27)) then 
		goto l19
	end
	MonsterWait(Gvar_27,500)
	DisableObjectGroup(Gvar_44)
	::l19::
	if true then return end
end
function EnableWaitTrigGroup3()
	EnableObjectGroup(Gvar_45)
	if true then return end
end
function Wait3()
	if not (ObjIsCaller(Gvar_28)) then 
		goto l19
	end
	MonsterWait(Gvar_28,500)
	DisableObjectGroup(Gvar_45)
	::l19::
	if true then return end
end
function MonsterGoHome()
	if not (CheckObjClass(Caller,"MONSTER") == true) then 
		goto l25
	end
	MonsterSetAggressiveness(Caller,0.16)
	MonsterGotoHome(Caller)
	::l25::
	if true then return end
end
function FieldGuidePickup()
	InvPutObj(GetHostPlayer(),Gvar_34)
	InvPutObj(GetHostPlayer(),Gvar_35)
	if true then return end
end
function CaptainGuard()
	var_0 = GetWaypointX(Gvar_55)
	var_1 = GetWaypointY(Gvar_55)
	var_2 = GetWaypointX(Gvar_57)
	var_3 = GetWaypointY(Gvar_57)
	MonsterGuardArea(Gvar_54,var_0,var_1,var_2,var_3,500)
	if true then return end
end
function PlaySubMusic()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(18,100)
	::l12::
	if true then return end
end
function PlayWanderMusic()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(17,100)
	::l12::
	if true then return end
end
function OpenMayorSecretWallGroup()
	MoveTo(Gvar_98,Gvar_100)
	OpenSecretWallGroup(Gvar_99)
	if true then return end
end
function Secret01XP()
	AudioEvent("SecretFound",Gvar_101)
	PlayerGiveExp(GetHostPlayer(),50)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret02XP()
	AudioEvent("SecretFound",Gvar_102)
	PlayerGiveExp(GetHostPlayer(),50)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_60)
	if true then return end
end