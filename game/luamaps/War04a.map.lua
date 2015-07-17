
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = 50
	Gvar_5 = 20
	Gvar_6 = 1
	Gvar_7 = 5
	Gvar_18 = 0
	Gvar_19 = 1
	Gvar_20 = Gvar_18
	if true then return end
end
function CloseBlockTrap01()
	DisableObject(Gvar_12)
	MoveTo(Gvar_8,Gvar_14)
	MoveTo(Gvar_9,Gvar_15)
	WaitSpecial(Gvar_5,1,6)
	WaitSpecial(Gvar_4,1,7)
	if true then return end
end
function CloseBlockTrap02()
	DisableObject(Gvar_13)
	MoveTo(Gvar_10,Gvar_16)
	MoveTo(Gvar_11,Gvar_17)
	WaitSpecial(Gvar_5,2,6)
	WaitSpecial(Gvar_4,2,7)
	if true then return end
end
function BlockTrapLoop()
	var_0 = Gvar_6
	if (var_0 == 1) then 
		goto l25
	end
	if (var_0 == 2) then 
		goto l35
	end
	goto l45
	::l25::
	CloseBlockTrap01()
	Gvar_6 = 2
	goto l45
	::l35::
	CloseBlockTrap02()
	Gvar_6 = 1
	goto l45
	::l45::
	WaitFrames(30,4)
	if true then return end
end
function InitializeBlockTrap()
	Gvar_8 = ObjFromName("SpikeBlock01")
	Gvar_9 = ObjFromName("SpikeBlock02")
	Gvar_10 = ObjFromName("SpikeBlock03")
	Gvar_11 = ObjFromName("SpikeBlock04")
	Gvar_14 = WaypointFromName("BlockWP01")
	Gvar_15 = WaypointFromName("BlockWP02")
	Gvar_16 = WaypointFromName("BlockWP03")
	Gvar_17 = WaypointFromName("BlockWP04")
	Gvar_12 = ObjFromName("BlockTrap01Trigger")
	Gvar_13 = ObjFromName("BlockTrap02Trigger")
	BlockTrapLoop()
	if true then return end
end
function BlockTrapBoom(arg_0)
	var_1 = arg_0
	if (var_1 == 1) then 
		goto l25
	end
	if (var_1 == 2) then 
		goto l53
	end
	goto l81
	::l25::
	AudioEvent("HammerMissing",Gvar_14)
	PlayFX("JIGGLE",GetWaypointX(Gvar_14),GetWaypointY(Gvar_14),Gvar_7,0)
	goto l81
	::l53::
	AudioEvent("HammerMissing",Gvar_16)
	PlayFX("JIGGLE",GetWaypointX(Gvar_16),GetWaypointY(Gvar_16),Gvar_7,0)
	goto l81
	::l81::
	if true then return end
end
function ResetBlockTrap(arg_0)
	var_1 = arg_0
	if (var_1 == 1) then 
		goto l25
	end
	if (var_1 == 2) then 
		goto l39
	end
	goto l53
	::l25::
	EnableObject(Gvar_12)
	AudioEvent("TriggerReleased",Gvar_14)
	goto l53
	::l39::
	EnableObject(Gvar_13)
	AudioEvent("TriggerReleased",Gvar_16)
	goto l53
	::l53::
	if true then return end
end
function PlayerDeath()
	DeathScreen(4)
	if true then return end
end
function CaptainDialogStart()
	var_0 = Gvar_20
	if (var_0 == Gvar_18) then 
		goto l27
	end
	if (var_0 == Gvar_19) then 
		goto l35
	end
	goto l43
	::l27::
	StartDialogWithCaller("SwordsmanHurt","Con04a:CaptainGreet")
	goto l43
	::l35::
	StartDialogWithCaller("SwordsmanHurt","Con04a:CaptainIdle")
	goto l43
	::l43::
	if true then return end
end
function CaptainDialogEnd()
	var_0 = Gvar_20
	if (var_0 == Gvar_18) then 
		goto l27
	end
	if (var_0 == Gvar_19) then 
		goto l48
	end
	goto l50
	::l27::
	JournalAddEntry(GetHostPlayer(),"Chapter4SearchCrypts",2)
	PrintToAll("Con01a:NewJournalEntry")
	Gvar_20 = Gvar_19
	goto l50
	::l48::
	goto l50
	::l50::
	if true then return end
end
function StartCaptainConversation()
	SetupDialog(Gvar_23,"NORMAL",9,10)
	ForceDialog(Gvar_23,GetHostPlayer())
	if true then return end
end
function PlayOutdoorMusic()
	PlayMusic(22,100)
	if true then return end
end
function MapInitialize()
	Gvar_21 = ObjGroupFromName("Secret2Triggers")
	Gvar_22 = ObjGroupFromName("Fish")
	Gvar_23 = ObjFromName("Airship_Captain")
	Gvar_24 = WaypointFromName("SecretAudioOrigin")
	SetDialogPortrait(Gvar_23,"AirshipCaptainPic")
	ObjSetMaster(GetHostPlayer(),Gvar_23)
	GroupMonsterGoRoam(Gvar_22)
	InitializeBlockTrap()
	PlayOutdoorMusic()
	StartScreen(4)
	WaitFrames(5,11)
	if true then return end
end
function OpenSecretPassageWalls()
	OpenSecretWall(GetWallAt(129,137))
	if true then return end
end
function ExitMessage()
	PrintToAll("War04a:ExitMessage")
	if true then return end
end
function ClearScreen()
	BlackScreen()
	if true then return end
end
function PlayUndergroundMusic()
	PlayMusic(20,100)
	if true then return end
end
function SecretSFX()
	TeleportWaypoint(Gvar_24,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_24)
	if true then return end
end
function FoundSecret1()
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),25)
	SecretSFX()
	if true then return end
end
function FoundSecret2()
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	DisableObjectGroup(Gvar_21)
	SecretSFX()
	if true then return end
end
function FoundSecret3()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	SecretSFX()
	if true then return end
end