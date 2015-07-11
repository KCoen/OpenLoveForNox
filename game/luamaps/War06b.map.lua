
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = 0
	Gvar_5 = 1
	Gvar_6 = 2
	Gvar_7 = 3
	Gvar_8 = 4
	Gvar_9 = true
	Gvar_10 = true
	Gvar_11 = true
	Gvar_12 = true
	Gvar_13 = false
	Gvar_14 = true
	Gvar_17 = 0
	Gvar_18 = 0
	Gvar_19 = 0
	Gvar_20 = Gvar_4
	Gvar_92 = true
	Gvar_93 = false
	Gvar_94 = true
	Gvar_95 = false
	Gvar_96 = 76
	Gvar_97 = 70
	if true then return end
end
function NullCallback()
	if true then return end
end
function fireKnightsRecognize()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l94
	end
	Gvar_17 = RandomInteger(1,3)
	if not Gvar_17 == 1 then 
		goto l42
	end
	SetDialogPortrait(Trigger,"WarriorPic")
	SetupDialog(Trigger,"NORMAL",4,5)
	::l42::
	if not Gvar_17 == 2 then 
		goto l68
	end
	SetDialogPortrait(Trigger,"Warrior2Pic")
	SetupDialog(Trigger,"NORMAL",6,7)
	::l68::
	if not Gvar_17 == 3 then 
		goto l94
	end
	SetDialogPortrait(Trigger,"Warrior3Pic")
	SetupDialog(Trigger,"NORMAL",8,9)
	::l94::
	if true then return end
end
function fireKnightsTalk1Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak1")
	if true then return end
end
function fireKnightsTalk1End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_67)
	MonsterEventScript(Trigger,3,2)
	CancelDialog(Trigger)
	MonsterMakeFriendly(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function fireKnightsTalk2Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak2")
	if true then return end
end
function fireKnightsTalk2End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_67)
	MonsterEventScript(Trigger,3,2)
	CancelDialog(Trigger)
	MonsterMakeFriendly(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function fireKnightsTalk3Start()
	ObjFreeze(GetHostPlayer(),true)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("SwordsmanRecognize","War06a:CityGuardSpeak3")
	if true then return end
end
function fireKnightsTalk3End()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_67)
	MonsterEventScript(Trigger,3,2)
	CancelDialog(Trigger)
	MonsterFollowObj(Trigger,GetHostPlayer())
	MonsterMakeFriendly(Trigger)
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function ownFriends()
	JournalAddEntry(GetHostPlayer(),"War6Horrendous",2)
	JournalUpdateEntry(GetHostPlayer(),"War6Fortress",4)
	ObjSetMaster(GetHostPlayer(),Gvar_21)
	ObjSetMaster(GetHostPlayer(),Gvar_27)
	ObjSetMaster(GetHostPlayer(),Gvar_28)
	ObjSetMaster(GetHostPlayer(),Gvar_29)
	ObjSetMaster(GetHostPlayer(),Gvar_30)
	SetDialogPortrait(Gvar_31,"WarriorPic")
	SetupDialog(Gvar_31,"NORMAL",4,5)
	SetDialogPortrait(Gvar_32,"Warrior2Pic")
	SetupDialog(Gvar_32,"NORMAL",6,7)
	SetDialogPortrait(Gvar_33,"Warrior3Pic")
	SetupDialog(Gvar_33,"NORMAL",8,9)
	SetDialogPortrait(Gvar_34,"WarriorPic")
	SetupDialog(Gvar_34,"NORMAL",4,5)
	if true then return end
end
function secretArea()
	TeleportWaypoint(Gvar_78,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_78)
	PlayerGiveExp(GetHostPlayer(),500)
	if true then return end
end
function toggleMainGates()
	if not Gvar_19 == 0 then 
		goto l18
	end
	Gvar_19 = 1
	openMainGates()
	goto l26
	::l18::
	Gvar_19 = 0
	closeMainGates()
	::l26::
	AudioEvent("SecretWallStoneClose",Gvar_84)
	AudioEvent("BoulderMove",Gvar_84)
	if true then return end
end
function openMainGates()
	MoveTo(Gvar_50,Gvar_80)
	MoveTo(Gvar_51,Gvar_81)
	MoveTo(Gvar_52,Gvar_82)
	MoveTo(Gvar_53,Gvar_83)
	if true then return end
end
function closeMainGates()
	MoveTo(Gvar_50,Gvar_84)
	MoveTo(Gvar_51,Gvar_85)
	MoveTo(Gvar_52,Gvar_86)
	MoveTo(Gvar_53,Gvar_87)
	if true then return end
end
function deathToDoorStops()
	DeleteObject(Caller)
	if true then return end
end
function startHorrendousTalk()
	ObjLookAtObj(GetHostPlayer(),Gvar_21)
	ForceDialog(Gvar_21,GetHostPlayer())
	if true then return end
end
function faceHorrendous()
	ObjLookAtObj(Trigger,Gvar_21)
	if true then return end
end
function horrendousDie()
	JournalAddEntry(GetHostPlayer(),"War6Necro",2)
	JournalUpdateEntry(GetHostPlayer(),"War6Horrendous",4)
	JournalRemoveEntry(GetHostPlayer(),"War6Fortress")
	Gvar_14 = false
	TeleportObj(Gvar_22,GetObjX(Gvar_21),GetObjY(Gvar_21))
	Gvar_15 = GetObjX(Gvar_21) - 55
	Gvar_16 = GetObjY(Gvar_21) + 20
	TeleportObj(Gvar_21,1161,2794)
	SetupDialog(Gvar_54,"NORMAL",45,46)
	ForceDialog(Gvar_54,GetHostPlayer())
	WaitFrames(110,19)
	if true then return end
end
function horrendousDying()
	TeleportObj(Gvar_23,GetObjX(Gvar_22),GetObjY(Gvar_22))
	DeleteObject(Gvar_22)
	WaitFrames(15,20)
	if true then return end
end
function horrendousDropHalberd()
	TeleportObj(Gvar_26,GetObjX(Gvar_23) - 10,GetObjY(Gvar_23) + 5)
	if true then return end
end
function horrendousDead()
	PlayMusic(28,100)
	CinematicBorders(false)
	TeleportObj(Gvar_24,GetObjX(Gvar_23),GetObjY(Gvar_23))
	DeleteObject(Gvar_23)
	AudioEvent("DemonDie",Gvar_90)
	if not Gvar_54 then 
		goto l48
	end
	DeleteObject(Gvar_54)
	::l48::
	if true then return end
end
function horrendousSpeak()
	PlayMusic(0,100)
	CinematicBorders(true)
	SetupDialog(Gvar_21,"NORMAL",23,24)
	ForceDialog(Gvar_21,GetHostPlayer())
	if true then return end
end
function horrendousTalk1Start()
	EnableObjectGroup(Gvar_71)
	ObjFreeze(GetHostPlayer(),true)
	LockDoor(Gvar_35)
	LockDoor(Gvar_36)
	LockDoor(Gvar_37)
	MonsterGroupWait(Gvar_67,10)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("DemonRecognize","War06a:BoastfulHorrendous")
	if true then return end
end
function horrendousTalk1End()
	CancelDialog(Gvar_21)
	SetupDialog(Gvar_54,"NEXT",41,42)
	WaitFrames(30,36)
	if true then return end
end
function horrendousTalk2Start()
	StartDialogWithCaller("DemonRecognize","War06a:HorrendousVsHec")
	if true then return end
end
function horrendousTalk2End()
	SetupDialog(Gvar_21,"NEXT",27,28)
	WaitFrames(30,16)
	if true then return end
end
function horrendousTalk3Start()
	StartDialogWithCaller("DemonRecognize","War06a:ChallengingHec")
	if true then return end
end
function horrendousTalk3End()
	CancelDialog(Gvar_21)
	SetupDialog(Gvar_54,"NEXT",43,44)
	WaitFrames(30,35)
	if true then return end
end
function horrendousTalk5Start()
	ObjLookAtObj(GetHostPlayer(),Gvar_23)
	StartDialogWithCaller("DemonRecognize","War06a:HecDefeatsHorrendous")
	if true then return end
end
function horrendousTalk5End()
	CancelDialog(Gvar_21)
	SetupDialog(Gvar_54,"NEXT",47,48)
	WaitFrames(30,35)
	if true then return end
end
function horrendousTalk6Start()
	StartDialogWithCaller("DemonRecognize","War06a:HorrendousPride")
	if true then return end
end
function horrendousTalk6End()
	EnableObjectGroup(Gvar_67)
	CancelEnchant(GetHostPlayer(),"ENCHANT_INVULNERABLE")
	CancelDialog(Gvar_21)
	horrendousDead()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_67)
	MonsterSetAggressiveness(Gvar_56,0.83)
	MonsterSetAggressiveness(Gvar_57,0.83)
	MonsterSetAggressiveness(Gvar_58,0.83)
	MonsterSetAggressiveness(Gvar_59,0.83)
	MonsterSetAggressiveness(Gvar_60,0.83)
	MonsterSetAggressiveness(Gvar_61,0.83)
	MonsterSetAggressiveness(Gvar_62,0.83)
	MonsterSetAggressiveness(Gvar_63,0.83)
	MonsterSetAggressiveness(Gvar_64,0.83)
	if true then return end
end
function talkToHorrendous()
	SetupDialog(Gvar_21,"NORMAL",31,32)
	ForceDialog(Gvar_21,GetHostPlayer())
	if true then return end
end
function killMusic()
	PlayMusic(0,100)
	if true then return end
end
function startHecubahTalk()
	ObjLookAtObj(GetHostPlayer(),Gvar_54)
	ForceDialog(Gvar_54,GetHostPlayer())
	if true then return end
end
function hecubahBustIn()
	DisableObjectGroup(Gvar_71)
	EnableObjectGroup(Gvar_66)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_72)
	WallMakeSilent(false)
	DeleteObject(Gvar_46)
	DeleteObject(Gvar_47)
	DeleteObject(Gvar_48)
	DeleteObject(Gvar_49)
	WaitFrames(10,37)
	if true then return end
end
function hecubahBreakIn()
	BreakWallGroup(Gvar_73)
	ApplyEnchant(Gvar_21,"ENCHANT_VILLAIN",0)
	EnableObjectGroup(Gvar_69)
	MonsterSetAggressiveness(Gvar_54,0)
	MonsterSetAggressiveness(Gvar_55,0)
	MonsterSetAggressiveness(Gvar_56,0)
	MonsterSetAggressiveness(Gvar_57,0)
	MonsterSetAggressiveness(Gvar_58,0)
	MonsterSetAggressiveness(Gvar_59,0)
	MonsterSetAggressiveness(Gvar_60,0)
	MonsterSetAggressiveness(Gvar_61,0)
	MonsterSetAggressiveness(Gvar_62,0)
	MonsterSetAggressiveness(Gvar_63,0)
	MonsterSetAggressiveness(Gvar_64,0)
	MonsterGoRoam(Gvar_54)
	ForceDialog(Gvar_54,GetHostPlayer())
	if true then return end
end
function hecKillsEveryone()
	if not ObjIsCaller(Gvar_54) or ObjIsCaller(Gvar_55) then 
		goto l25
	end
	PlayMusic(28,75)
	WaitFrames(3,40)
	::l25::
	if true then return end
end
function isHecKilling()
	if not Gvar_9 then 
		goto l11
	end
	WaitFrames(3,40)
	::l11::
	if true then return end
end
function hecIsKilling()
	if not Gvar_10 then 
		goto l409
	end
	Gvar_9 = false
	ObjLookAtObj(GetHostPlayer(),Gvar_54)
	var_0 = Gvar_20
	if var_0 == Gvar_4 then 
		goto l73
	end
	if var_0 == Gvar_5 then 
		goto l139
	end
	if var_0 == Gvar_6 then 
		goto l205
	end
	if var_0 == Gvar_7 then 
		goto l271
	end
	if var_0 == Gvar_8 then 
		goto l337
	end
	goto l403
	::l73::
	ObjLookAtObj(Gvar_54,Gvar_21)
	ObjLookAtObj(GetHostPlayer(),Gvar_21)
	AudioEvent("DeathRayCast",Gvar_90)
	PlayFX("DEATH_RAY",GetObjX(Gvar_54),GetObjY(Gvar_54),GetObjX(Gvar_21),GetObjY(Gvar_21))
	DamageObject(Gvar_21,0,1000,0)
	Gvar_20 = Gvar_5
	goto l403
	::l139::
	ObjLookAtObj(Gvar_54,Gvar_27)
	ObjLookAtObj(GetHostPlayer(),Gvar_27)
	AudioEvent("DeathRayCast",Gvar_90)
	PlayFX("DEATH_RAY",GetObjX(Gvar_54),GetObjY(Gvar_54),GetObjX(Gvar_27),GetObjY(Gvar_27))
	DamageObject(Gvar_27,0,1000,0)
	Gvar_20 = Gvar_6
	goto l403
	::l205::
	ObjLookAtObj(Gvar_54,Gvar_28)
	ObjLookAtObj(GetHostPlayer(),Gvar_28)
	AudioEvent("DeathRayCast",Gvar_90)
	PlayFX("DEATH_RAY",GetObjX(Gvar_54),GetObjY(Gvar_54),GetObjX(Gvar_28),GetObjY(Gvar_28))
	DamageObject(Gvar_28,0,1000,0)
	Gvar_20 = Gvar_7
	goto l403
	::l271::
	ObjLookAtObj(Gvar_54,Gvar_29)
	ObjLookAtObj(GetHostPlayer(),Gvar_29)
	AudioEvent("DeathRayCast",Gvar_90)
	PlayFX("DEATH_RAY",GetObjX(Gvar_54),GetObjY(Gvar_54),GetObjX(Gvar_29),GetObjY(Gvar_29))
	DamageObject(Gvar_29,0,1000,0)
	Gvar_20 = Gvar_8
	goto l403
	::l337::
	ObjLookAtObj(Gvar_54,Gvar_30)
	ObjLookAtObj(GetHostPlayer(),Gvar_30)
	AudioEvent("DeathRayCast",Gvar_90)
	PlayFX("DEATH_RAY",GetObjX(Gvar_54),GetObjY(Gvar_54),GetObjX(Gvar_30),GetObjY(Gvar_30))
	DamageObject(Gvar_30,0,1000,0)
	Gvar_10 = false
	goto l403
	::l403::
	WaitFrames(15,40)
	::l409::
	ObjLookAtObj(GetHostPlayer(),Gvar_54)
	if true then return end
end
function hecubahTalk1Start()
	StartDialogWithCaller("GhostRecognize","War06a:HecubahThreat")
	if true then return end
end
function hecubahTalk1End()
	CancelDialog(Gvar_54)
	SetupDialog(Gvar_21,"NEXT",25,26)
	WaitFrames(30,16)
	if true then return end
end
function hecubahTalk2Start()
	StartDialogWithCaller("GhostRecognize","War06a:HecubahAccepts")
	if true then return end
end
function hecubahTalk2End()
	CancelDialog(Gvar_54)
	ApplyEnchant(GetHostPlayer(),"ENCHANT_INVULNERABLE",0)
	EnableObject(Gvar_38)
	WaitFrames(240,39)
	if true then return end
end
function hecubahTalk4Start()
	DisableObject(Gvar_54)
	StartDialogWithCaller("GhostRecognize","War06a:HecubahWins")
	if true then return end
end
function hecubahTalk4End()
	SetupDialog(Gvar_21,"NEXT",29,30)
	WaitFrames(30,16)
	CancelDialog(Gvar_54)
	if true then return end
end
function hecubahTalk5Start()
	StartDialogWithCaller("GhostRecognize","War06a:HecubahToNecro")
	if true then return end
end
function hecubahTalk5End()
	CancelDialog(Gvar_54)
	EnableObject(Gvar_55)
	MonsterSetAggressiveness(Gvar_55,0)
	MonsterGoto(Gvar_55,GetWaypointX(Gvar_79),GetWaypointY(Gvar_79))
	SetupDialog(Gvar_55,"NEXT",53,54)
	WaitFrames(90,52)
	if true then return end
end
function hecubahTalk6Start()
	StartDialogWithCaller("GhostRecognize","War06a:HecThreatJack")
	if true then return end
end
function hecubahTalk6End()
	CancelDialog(Gvar_54)
	EnableObject(Gvar_54)
	MonsterSetAggressiveness(Gvar_54,0)
	MonsterGoto(Gvar_54,931,3036)
	SetupDialog(Gvar_55,"NEXT",55,56)
	WaitFrames(30,52)
	if true then return end
end
function endFightMusic()
	PlayMusic(27,100)
	if true then return end
end
function startNecromancerTalk()
	ObjLookAtObj(GetHostPlayer(),Gvar_55)
	ForceDialog(Gvar_55,GetHostPlayer())
	if true then return end
end
function necromancerTalk1Start()
	MonsterIdle(Gvar_55)
	ObjLookAtObj(Gvar_55,Gvar_21)
	StartDialogWithCaller("EmberDemonRecognize","War06a:NecroMockHorren")
	if true then return end
end
function necromancerTalk1End()
	CancelDialog(Gvar_55)
	InvPutObj(Gvar_55,Gvar_26)
	SetupDialog(Gvar_54,"NEXT",49,50)
	WaitFrames(30,35)
	if true then return end
end
function necromancerTalk2Start()
	StartDialogWithCaller("EmberDemonRecognize","War06a:NecroThreatJack")
	if true then return end
end
function necromancerTalk2End()
	CancelDialog(Gvar_55)
	EnableObject(Gvar_55)
	MonsterSetAggressiveness(Gvar_55,0)
	MonsterGoto(Gvar_55,931,3036)
	WaitFrames(200,34)
	WaitFrames(240,33)
	if true then return end
end
function getHalberd()
	InvPutObj(GetHostPlayer(),Gvar_26)
	WaitFrames(8,68)
	if true then return end
end
function FreezePlayer()
	PlayMusic(20,100)
	MonsterIdle(Gvar_55)
	ObjLookAtObj(GetHostPlayer(),Gvar_55)
	ObjLookAtObj(Gvar_55,GetHostPlayer())
	ObjFreeze(GetHostPlayer(),true)
	DeleteObject(Gvar_56)
	DeleteObject(Gvar_57)
	DeleteObject(Gvar_58)
	DeleteObject(Gvar_59)
	DeleteObject(Gvar_60)
	DeleteObject(Gvar_61)
	DeleteObject(Gvar_62)
	DeleteObject(Gvar_63)
	DeleteObject(Gvar_64)
	WaitFrames(15,59)
	if true then return end
end
function necroSetPiece()
	CinematicBorders(true)
	DisableObject(Gvar_55)
	SetupDialog(Gvar_55,"NORMAL",63,64)
	ForceDialog(Gvar_55,GetHostPlayer())
	if true then return end
end
function wallWalk()
	if not Gvar_17 == 0 then 
		goto l15
	end
	AudioEvent("SpellPhonemeUpLeft",Gvar_103)
	::l15::
	if not Gvar_17 == 1 then 
		goto l30
	end
	AudioEvent("SpellPhonemeUp",Gvar_103)
	::l30::
	if not Gvar_17 == 2 then 
		goto l45
	end
	AudioEvent("SpellPhonemeUpRight",Gvar_103)
	::l45::
	if not Gvar_17 < 49 then 
		goto l87
	end
	CloseSecretWall(GetWallAt(Gvar_96,Gvar_97))
	Gvar_17 = Gvar_17 + 1
	Gvar_96 = Gvar_96 - 1
	Gvar_97 = Gvar_97 - 1
	WaitFrames(6,60)
	::l87::
	if true then return end
end
function releasePlayer()
	WallMakeSilent(false)
	ApplySpellXYXY("SUMMON_SKELETON_LORD",GetObjX(Gvar_55),GetObjY(Gvar_55),1575,1506)
	ApplySpellXYXY("SUMMON_SKELETON_LORD",GetObjX(Gvar_55),GetObjY(Gvar_55),1702,1506)
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function lowerNecroWall()
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_74)
	if true then return end
end
function necromancerTalk3Start()
	MonsterGroupWait(Gvar_67,10)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("ZombieRecognize","War06a:NecroAttackJack")
	if true then return end
end
function necromancerTalk3End()
	EnableObjectGroup(Gvar_67)
	CancelDialog(Gvar_55)
	CinematicBorders(false)
	EnableObject(Gvar_55)
	ObjFreeze(Gvar_55,false)
	MonsterGoRoam(Gvar_55)
	WaitFrames(10,60)
	WaitFrames(50,61)
	WaitFrames(60,62)
	if true then return end
end
function necromancerTalk4Start()
	MonsterGroupWait(Gvar_67,10)
	DisableObjectGroup(Gvar_67)
	StartDialogWithCaller("ZombieRecognize","War06a:NecroDies")
	if true then return end
end
function necromancerTalk4End()
	EnableObjectGroup(Gvar_67)
	CancelDialog(Gvar_55)
	ObjFreeze(Gvar_55,false)
	DamageObjectGroup(Gvar_68,0,1000,0)
	WaitFrames(2,57)
	if true then return end
end
function necroDies()
	Gvar_18 = Gvar_18 + 1
	Gvar_92 = false
	ObjLookAtObj(Gvar_55,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_55)
	ObjFreeze(Gvar_55,true)
	TeleportObj(Gvar_26,1310,2900)
	SetupDialog(Gvar_55,"NORMAL",65,66)
	ForceDialog(Gvar_55,GetHostPlayer())
	if true then return end
end
function necroDies2()
	if not Gvar_18 > 4 then 
		goto l48
	end
	if not DoesHaveObject(GetHostPlayer(),Gvar_26) then 
		goto l40
	end
	JournalUpdateEntry(GetHostPlayer(),"War6Necro",4)
	ObjFreeze(GetHostPlayer(),true)
	WaitFrames(45,69)
	goto l46
	::l40::
	WaitFrames(3,68)
	::l46::
	goto l54
	::l48::
	WaitFrames(3,68)
	::l54::
	if true then return end
end
function exitFade()
	CinematicFade()
	WaitFrames(60,70)
	if true then return end
end
function exitTile()
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),5394,2955)
	if true then return end
end
function MapInitialize()
	Gvar_21 = ObjFromName("Horrendous")
	Gvar_22 = ObjFromName("Horrendous_")
	Gvar_23 = ObjFromName("Horrendous__")
	Gvar_24 = ObjFromName("Horrendous___")
	Gvar_25 = ObjFromName("Horrendous____")
	Gvar_26 = ObjFromName("OblivionHalberd")
	Gvar_27 = ObjFromName("EliteGuard1")
	Gvar_28 = ObjFromName("EliteGuard2")
	Gvar_29 = ObjFromName("EliteGuard3")
	Gvar_30 = ObjFromName("EliteGuard4")
	Gvar_31 = ObjFromName("F2Fire6")
	Gvar_32 = ObjFromName("F6FireGuard1")
	Gvar_33 = ObjFromName("F6FireGuard4")
	Gvar_34 = ObjFromName("F6Guard8")
	Gvar_35 = ObjFromName("ArenaDoor1")
	Gvar_36 = ObjFromName("ArenaDoor2")
	Gvar_37 = ObjFromName("ArenaDoor3")
	Gvar_38 = ObjFromName("KillTrigger")
	DisableObject(Gvar_38)
	Gvar_39 = ObjFromName("CellDoor1")
	Gvar_40 = ObjFromName("CellDoor2")
	Gvar_41 = ObjFromName("CellDoor3")
	Gvar_42 = ObjFromName("CellDoor4")
	Gvar_43 = ObjFromName("CellDoor5")
	Gvar_44 = ObjFromName("CellDoor6")
	Gvar_45 = ObjFromName("CellDoor7")
	Gvar_46 = ObjFromName("BreakInObject1")
	Gvar_47 = ObjFromName("BreakInObject2")
	Gvar_48 = ObjFromName("BreakInObject3")
	Gvar_49 = ObjFromName("BreakInObject4")
	Gvar_54 = ObjFromName("Hecubah")
	Gvar_55 = ObjFromName("Necromancer")
	Gvar_56 = ObjFromName("UndeadWar1")
	Gvar_57 = ObjFromName("UndeadWar2")
	Gvar_58 = ObjFromName("UndeadWar3")
	Gvar_59 = ObjFromName("UndeadWar4")
	Gvar_60 = ObjFromName("SkeLord1")
	Gvar_61 = ObjFromName("SkeLord2")
	Gvar_62 = ObjFromName("SkeLord3")
	Gvar_63 = ObjFromName("SkeLord4")
	Gvar_64 = ObjFromName("SkeLord5")
	Gvar_50 = ObjFromName("FG1Mover")
	Gvar_51 = ObjFromName("FG2Mover")
	Gvar_52 = ObjFromName("FG3Mover")
	Gvar_53 = ObjFromName("FG4Mover")
	Gvar_65 = ObjGroupFromName("NecroGuards")
	DisableObjectGroup(Gvar_65)
	Gvar_66 = ObjGroupFromName("Wolves")
	DisableObjectGroup(Gvar_66)
	Gvar_67 = ObjGroupFromName("EveryMonsterOnMap")
	Gvar_68 = ObjGroupFromName("EveryMonsterOnMap2")
	Gvar_69 = ObjGroupFromName("PartyCrashers")
	Gvar_70 = ObjGroupFromName("HecBreakInObjects")
	Gvar_71 = ObjGroupFromName("DoorStopTriggers")
	DisableObjectGroup(Gvar_71)
	Gvar_72 = WallGroupFromName("HecBreakIn")
	Gvar_73 = WallGroupFromName("HecBreakDown")
	Gvar_74 = WallGroupFromName("NecroWall")
	Gvar_75 = WallGroupFromName("NecroExitWall")
	Gvar_76 = WallGroupFromName("WizardCages")
	Gvar_77 = WallGroupFromName("DeathCage")
	Gvar_78 = WaypointFromName("PlayerSounds")
	Gvar_79 = WaypointFromName("NecroSpotWP")
	Gvar_80 = WaypointFromName("FG1Open")
	Gvar_81 = WaypointFromName("FG2Open")
	Gvar_82 = WaypointFromName("FG3Open")
	Gvar_83 = WaypointFromName("FG4Open")
	Gvar_84 = WaypointFromName("FG1Closed")
	Gvar_85 = WaypointFromName("FG2Closed")
	Gvar_86 = WaypointFromName("FG3Closed")
	Gvar_87 = WaypointFromName("FG4Closed")
	Gvar_88 = WaypointFromName("UpStairs")
	Gvar_89 = WaypointFromName("DownStairs")
	Gvar_90 = WaypointFromName("NecroNoise")
	Gvar_91 = WaypointFromName("WellWP")
	Gvar_55 = ObjFromName("Necromancer")
	Gvar_98 = ObjFromName("Halberd")
	Gvar_103 = WaypointFromName("SewerChase")
	SetDialogPortrait(Gvar_55,"BlackWizardPic")
	SetDialogPortrait(Gvar_21,"HorrendousPic")
	SetDialogPortrait(Gvar_54,"HecubahPic")
	SetDialogPortrait(Gvar_55,"NecromancerPic")
	MonsterSetAggressiveness(Gvar_21,0)
	MonsterSetAggressiveness(Gvar_27,0)
	MonsterSetAggressiveness(Gvar_28,0)
	MonsterSetAggressiveness(Gvar_29,0)
	MonsterSetAggressiveness(Gvar_30,0)
	DisableObjectGroup(Gvar_69)
	LockDoor(Gvar_39)
	LockDoor(Gvar_40)
	LockDoor(Gvar_41)
	LockDoor(Gvar_42)
	LockDoor(Gvar_43)
	LockDoor(Gvar_44)
	LockDoor(Gvar_45)
	WaitFrames(3,10)
	if true then return end
end
function PlayerDeath()
	DeathScreen(6)
	if true then return end
end
function unlockCells()
	UnlockDoor(Gvar_39)
	UnlockDoor(Gvar_40)
	UnlockDoor(Gvar_41)
	UnlockDoor(Gvar_42)
	UnlockDoor(Gvar_43)
	UnlockDoor(Gvar_44)
	UnlockDoor(Gvar_45)
	if true then return end
end
function lockCells()
	LockDoor(Gvar_39)
	LockDoor(Gvar_40)
	LockDoor(Gvar_41)
	LockDoor(Gvar_42)
	LockDoor(Gvar_43)
	LockDoor(Gvar_44)
	LockDoor(Gvar_45)
	if true then return end
end
function setNecroPosition()
	if not ObjIsCaller(Gvar_55) then 
		goto l24
	end
	ObjFreeze(Gvar_55,true)
	TeleportObj(Gvar_55,1776,1502)
	::l24::
	if not ObjIsCaller(Gvar_54) then 
		goto l41
	end
	if not Gvar_54 then 
		goto l41
	end
	DeleteObject(Gvar_54)
	::l41::
	if true then return end
end
function setupNecroSetPiece()
	DisableObject(Trigger)
	MonsterWait(Trigger,10)
	WaitFrames(1,58)
	if true then return end
end
function setNecroPosition2()
	if not ObjIsCaller(Gvar_55) then 
		goto l16
	end
	TeleportObj(Gvar_55,5057,3809)
	::l16::
	if true then return end
end
function necroGuard()
	MonsterGuardArea(Gvar_55,5057,3809,5232,3991,500)
	MonsterSetAggressiveness(Gvar_55,0.5)
	EnableObjectGroup(Gvar_65)
	if true then return end
end
function necroGuardDies()
	Gvar_18 = Gvar_18 + 1
	if true then return end
end
function NecroInjured()
	if not ObjIsCaller(GetHostPlayer()) == 0 then 
		goto l31
	end
	ObjAddHealth(Gvar_55,14)
	if not GetObjHealth(Gvar_55) < 50 then 
		goto l31
	end
	ObjAddHealth(Gvar_55,50)
	::l31::
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_91)
	if true then return end
end