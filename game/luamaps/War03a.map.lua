
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_28 = 0
	Gvar_29 = 1
	Gvar_30 = Gvar_28
	Gvar_31 = 0
	Gvar_32 = 1
	Gvar_33 = Gvar_31
	Gvar_34 = 0
	Gvar_35 = 1
	Gvar_36 = Gvar_34
	Gvar_37 = 0
	Gvar_38 = 1
	Gvar_39 = Gvar_37
	Gvar_48 = true
	if true then return end
end
function PlayerDeath()
	DeathScreen(3)
	if true then return end
end
function BanditAttack()
	SayChat(Gvar_26,"War01A.scr:Bully1")
	if true then return end
end
function HorrendousTalkStart()
	var_0 = Gvar_30
	if (var_0 == Gvar_28) then 
		goto l27
	end
	if (var_0 == Gvar_29) then 
		goto l42
	end
	goto l50
	::l27::
	StartDialogWithCaller("SwordsmanHurt","War03a:HorrendousSpeech")
	Gvar_30 = Gvar_29
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03a:HorrendousEnd")
	goto l50
	::l50::
	if true then return end
end
function HorrendousTalkEnd()
	JournalAddEntry(GetHostPlayer(),"War03aIxQuest",2)
	if true then return end
end
function DunMirGuard1TalkStart()
	ObjLookAtObj(Gvar_8,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03a:DunMirGuard1")
	if true then return end
end
function DunMirGuard1TalkEnd()
	if true then return end
end
function DunMirGuard2TalkStart()
	ObjLookAtObj(Gvar_9,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03a:DunMirGuard2")
	if true then return end
end
function DunMirGuard2TalkEnd()
	if true then return end
end
function DunMirGuard3TalkStart()
	StartDialogWithCaller("SwordsmanHurt","War03a:DunMirGuard3")
	if true then return end
end
function DunMirGuard3TalkEnd()
	if true then return end
end
function MineGuardTalkStart()
	ObjLookAtObj(Gvar_15,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03a:MineGuard")
	if true then return end
end
function MineGuardTalkEnd()
	if true then return end
end
function GalavaGuard1TalkStart()
	ObjLookAtObj(Gvar_11,GetHostPlayer())
	var_0 = Gvar_33
	if (var_0 == Gvar_31) then 
		goto l34
	end
	if (var_0 == Gvar_32) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03a:GalavaGuardWarn")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03a:GalavaGuardEnd")
	goto l50
	::l50::
	if true then return end
end
function GalavaGuard1TalkEnd()
	var_0 = Gvar_33
	if (var_0 == Gvar_31) then 
		goto l27
	end
	if (var_0 == Gvar_32) then 
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
function GalavaGuard2TalkStart()
	ObjLookAtObj(Gvar_12,GetHostPlayer())
	var_0 = Gvar_33
	if (var_0 == Gvar_31) then 
		goto l34
	end
	if (var_0 == Gvar_32) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03a:GalavaGuardEnd")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03a:GalavaGuardEnd")
	goto l50
	::l50::
	if true then return end
end
function GalavaGuard2TalkEnd()
	var_0 = Gvar_33
	if (var_0 == Gvar_31) then 
		goto l27
	end
	if (var_0 == Gvar_32) then 
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
function IxGuard1TalkStart()
	ObjLookAtObj(Gvar_18,GetHostPlayer())
	var_0 = Gvar_36
	if (var_0 == Gvar_34) then 
		goto l34
	end
	if (var_0 == Gvar_35) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03a:IxGuard1Intro")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03a:IxGuard1End")
	goto l50
	::l50::
	if true then return end
end
function IxGuard1TalkEnd()
	var_0 = Gvar_36
	if (var_0 == Gvar_34) then 
		goto l27
	end
	if (var_0 == Gvar_35) then 
		goto l53
	end
	goto l55
	::l27::
	UnlockDoor(Gvar_20)
	UnlockDoor(Gvar_21)
	Gvar_36 = Gvar_35
	Gvar_39 = Gvar_38
	goto l55
	::l53::
	goto l55
	::l55::
	if true then return end
end
function IxGuard2TalkStart()
	ObjLookAtObj(Gvar_19,GetHostPlayer())
	var_0 = Gvar_39
	if (var_0 == Gvar_37) then 
		goto l34
	end
	if (var_0 == Gvar_38) then 
		goto l42
	end
	goto l50
	::l34::
	StartDialogWithCaller("SwordsmanHurt","War03a:IxGuard2Intro")
	goto l50
	::l42::
	StartDialogWithCaller("SwordsmanHurt","War03a:IxGuard2End")
	goto l50
	::l50::
	if true then return end
end
function IxGuard2TalkEnd()
	var_0 = Gvar_39
	if (var_0 == Gvar_37) then 
		goto l27
	end
	if (var_0 == Gvar_38) then 
		goto l53
	end
	goto l55
	::l27::
	UnlockDoor(Gvar_20)
	UnlockDoor(Gvar_21)
	Gvar_39 = Gvar_38
	Gvar_36 = Gvar_35
	goto l55
	::l53::
	goto l55
	::l55::
	if true then return end
end
function PlayWanderMusic()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(22,100)
	::l12::
	if true then return end
end
function MapEntry()
	PlayWanderMusic()
	CinematicFadeout()
	if not (JournalSetQuest("War03b:QuestComplete") == 1) then 
		goto l23
	end
	CancelDialog(Gvar_18)
	CancelDialog(Gvar_19)
	::l23::
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("MissionTrig")
	Gvar_8 = ObjFromName("Lance")
	Gvar_9 = ObjFromName("Kenneth")
	Gvar_10 = ObjFromName("Brigadin")
	Gvar_11 = ObjFromName("Rastur")
	Gvar_12 = ObjFromName("Kirik")
	Gvar_13 = ObjFromName("GalavaGate1")
	Gvar_14 = ObjFromName("GalavaGate2")
	LockDoor(Gvar_13)
	LockDoor(Gvar_14)
	Gvar_15 = ObjFromName("Millard")
	Gvar_16 = ObjFromName("MineDoor1")
	Gvar_17 = ObjFromName("MineDoor2")
	LockDoor(Gvar_16)
	LockDoor(Gvar_17)
	Gvar_22 = ObjGroupFromName("GuardGroup")
	Gvar_18 = ObjFromName("Janero")
	Gvar_19 = ObjFromName("Horst")
	Gvar_20 = ObjFromName("IxGate01")
	Gvar_21 = ObjFromName("IxGate02")
	LockDoor(Gvar_20)
	LockDoor(Gvar_21)
	Gvar_23 = ObjFromName("Loproc")
	Gvar_24 = ObjFromName("BiffordByzanti")
	Gvar_25 = ObjFromName("GarretByzanti")
	ObjGroupSetMaster(GetHostPlayer(),Gvar_22)
	ObjSetMaster(GetHostPlayer(),Gvar_15)
	ObjSetMaster(GetHostPlayer(),Gvar_10)
	Gvar_40 = ObjGroupFromName("WaspGroup1")
	Gvar_41 = ObjGroupFromName("WaspGroup2")
	Gvar_43 = ObjFromName("Wolf01")
	Gvar_42 = ObjGroupFromName("FishGroup")
	GroupMonsterGoRoam(Gvar_40)
	GroupMonsterGoRoam(Gvar_41)
	MonsterGoRoam(Gvar_43)
	GroupMonsterGoRoam(Gvar_42)
	Gvar_44 = ObjFromName("Osborn")
	DamageObject(Gvar_44,0,200,2)
	SetDialogPortrait(Gvar_5,"HorrendousPic")
	SetupDialog(Gvar_5,"NORMAL",4,5)
	SetDialogPortrait(Gvar_8,"Warrior2Pic")
	SetupDialog(Gvar_8,"NORMAL",6,7)
	SetDialogPortrait(Gvar_9,"Warrior3Pic")
	SetupDialog(Gvar_9,"NORMAL",8,9)
	SetDialogPortrait(Gvar_10,"Warrior4Pic")
	SetupDialog(Gvar_10,"NORMAL",10,11)
	SetDialogPortrait(Gvar_11,"WizardGuard1Pic")
	SetupDialog(Gvar_11,"NORMAL",14,15)
	SetDialogPortrait(Gvar_12,"WizardGuard2Pic")
	SetupDialog(Gvar_12,"NORMAL",16,17)
	SetDialogPortrait(Gvar_15,"MalePic2")
	SetupDialog(Gvar_15,"NORMAL",12,13)
	SetDialogPortrait(Gvar_18,"IxGuard1Pic")
	SetupDialog(Gvar_18,"NORMAL",18,19)
	SetDialogPortrait(Gvar_19,"IxGuard2Pic")
	SetupDialog(Gvar_19,"NORMAL",20,21)
	Gvar_6 = ObjFromName("DMDoorL")
	Gvar_7 = ObjFromName("DMDoorR")
	LockDoor(Gvar_6)
	LockDoor(Gvar_7)
	Gvar_26 = ObjFromName("Bandit01")
	Gvar_27 = WallGroupFromName("RogueSecretWallGroup")
	Gvar_45 = WaypointFromName("Secret01WP")
	Gvar_46 = WaypointFromName("Secret01aWP")
	Gvar_47 = WaypointFromName("Secret02WP")
	if true then return end
end
function SetHorrendous()
	DisableObject(Gvar_5)
	TeleportObj(Gvar_5,5569,5071)
	if true then return end
end
function ClearIxGuardDialog()
	CancelDialog(Gvar_18)
	CancelDialog(Gvar_19)
	if true then return end
end
function OpenRogueSecretWallGroup()
	OpenSecretWallGroup(Gvar_27)
	if true then return end
end
function WolfIdle()
	MonsterIdle(Gvar_43)
	if true then return end
end
function WaspIdle()
	MonsterGroupIdle(Gvar_41)
	if true then return end
end
function MonsterGoHome()
	if not (ObjIsHostileTo(Caller,GetHostPlayer()) == true) then 
		goto l18
	end
	MonsterGotoHome(Caller)
	::l18::
	if true then return end
end
function PlaySubMusic()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(20,100)
	::l12::
	if true then return end
end
function PlayActionMusic()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l12
	end
	PlayMusic(5,100)
	::l12::
	if true then return end
end
function RobberRecognize()
	if not (ObjIsCaller(GetHostPlayer()) and Gvar_48) then 
		goto l31
	end
	Gvar_48 = false
	MonsterGoFight(Trigger,GetHostPlayer())
	SayChat(Trigger,"War01A.scr:Bully1")
	::l31::
	if true then return end
end
function RobberDie()
	RemoveAllChat()
	if true then return end
end
function Secret01()
	AudioEvent("SecretFound",Gvar_45)
	AudioEvent("SecretFound",Gvar_46)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	if true then return end
end
function Secret02()
	AudioEvent("SecretFound",Gvar_47)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end