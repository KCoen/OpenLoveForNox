
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_41 = 0
	Gvar_42 = 1
	Gvar_43 = 2
	Gvar_44 = 3
	Gvar_45 = 4
	Gvar_46 = 5
	Gvar_47 = 6
	Gvar_48 = Gvar_41
	Gvar_49 = Gvar_46
	Gvar_52 = false
	Gvar_53 = false
	Gvar_54 = false
	Gvar_55 = false
	Gvar_56 = false
	Gvar_58 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(8)
	if true then return end
end
function FireFONTrap01()
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_4,GetWaypointX(Gvar_9),GetWaypointY(Gvar_9))
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_5,GetWaypointX(Gvar_10),GetWaypointY(Gvar_10))
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_6,GetWaypointX(Gvar_11),GetWaypointY(Gvar_11))
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_7,GetWaypointX(Gvar_12),GetWaypointY(Gvar_12))
	WaitSeconds(5,3)
	if true then return end
end
function InitializeFONtraps()
	Gvar_4 = ObjFromName("FON_Origin01")
	Gvar_5 = ObjFromName("FON_Origin02")
	Gvar_6 = ObjFromName("FON_Origin03")
	Gvar_7 = ObjFromName("FON_Origin04")
	Gvar_8 = ObjFromName("FON_Origin05")
	Gvar_9 = WaypointFromName("FON_Target01")
	Gvar_10 = WaypointFromName("FON_Target02")
	Gvar_11 = WaypointFromName("FON_Target03")
	Gvar_12 = WaypointFromName("FON_Target04")
	Gvar_13 = WaypointFromName("FON_Target05")
	FireFONTrap01()
	if true then return end
end
function OpenFONSecret()
	DisableObject(Trigger)
	AudioEvent("SecretWallOpen",WaypointFromName("FonSecretWP"))
	OpenSecretWall(GetWallAt(44,122))
	if true then return end
end
function MapInitialize()
	Gvar_14 = ObjFromName("MoverA1")
	Gvar_15 = ObjFromName("MoverA2")
	Gvar_16 = ObjFromName("MoverA3")
	Gvar_17 = ObjFromName("MoverB1")
	Gvar_18 = ObjFromName("MoverB2")
	Gvar_19 = ObjFromName("MoverB3")
	Gvar_20 = ObjFromName("Priest01")
	Gvar_21 = ObjFromName("Priest02")
	Gvar_22 = ObjFromName("Imp01")
	Gvar_23 = ObjFromName("Imp02")
	Gvar_24 = ObjFromName("WierdlingPool")
	Gvar_31 = WaypointFromName("GolemWP_A")
	Gvar_32 = WaypointFromName("GolemWP_B")
	Gvar_33 = WaypointFromName("Priest01WP")
	Gvar_34 = WaypointFromName("Priest02WP")
	Gvar_35 = WaypointFromName("Priest1Home")
	Gvar_36 = WaypointFromName("Priest2Home")
	Gvar_37 = WaypointFromName("Priest1ExitWP")
	Gvar_38 = WaypointFromName("Priest2ExitWP")
	Gvar_39 = WaypointFromName("ImpCreationWP")
	Gvar_40 = WaypointFromName("WierdlingPoolWP")
	Gvar_25 = ObjGroupFromName("GolemLights")
	Gvar_26 = ObjGroupFromName("GolemHandleTriggers")
	Gvar_27 = WallGroupFromName("GolemArenaEntranceWalls")
	Gvar_28 = WallGroupFromName("GolemArenaExitWalls")
	Gvar_29 = WallGroupFromName("WierdlingExitWalls")
	Gvar_30 = WallGroupFromName("AldwynElevatorWalls")
	ObjSetMaster(GetHostPlayer(),Gvar_20)
	ObjSetMaster(GetHostPlayer(),Gvar_21)
	InitializeFONtraps()
	if true then return end
end
function OpenElevatorWalls()
	DisableObject(Trigger)
	OpenSecretWallGroup(Gvar_30)
	if true then return end
end
function NoMonsters()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function PlaySub1Music()
	PlayMusic(18,100)
	if true then return end
end
function PlaySub2Music()
	PlayMusic(19,100)
	if true then return end
end
function SecretFound()
	DisableObject(Trigger)
	TeleportWaypoint(WaypointFromName("FonSecretWP"),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",WaypointFromName("FonSecretWP"))
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),200)
	if true then return end
end
function PriestReport()
	var_0 = Gvar_48
	if var_0 == Gvar_42 then 
		goto l27
	end
	if var_0 == Gvar_43 then 
		goto l170
	end
	goto l231
	::l27::
	if not ObjIsTrigger(Gvar_22) then 
		goto l86
	end
	Gvar_53 = true
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_22),GetObjY(Gvar_22),0,0)
	TeleportObj(Gvar_20,GetObjX(Gvar_22),GetObjY(Gvar_22))
	AudioEvent("ImpRecognize",Gvar_57)
	DeleteObject(Gvar_22)
	::l86::
	if not ObjIsTrigger(Gvar_23) then 
		goto l145
	end
	Gvar_54 = true
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_23),GetObjY(Gvar_23),0,0)
	TeleportObj(Gvar_21,GetObjX(Gvar_23),GetObjY(Gvar_23))
	AudioEvent("ImpRecognize",Gvar_57)
	DeleteObject(Gvar_23)
	::l145::
	if not Gvar_53 then 
		goto l168
	end
	if not Gvar_54 then 
		goto l168
	end
	Gvar_48 = Gvar_44
	WaitFrames(30,19)
	::l168::
	goto l231
	::l170::
	if not ObjIsTrigger(Gvar_22) then 
		goto l184
	end
	Gvar_55 = true
	::l184::
	if not ObjIsTrigger(Gvar_23) then 
		goto l198
	end
	Gvar_56 = true
	::l198::
	if not Gvar_55 and Gvar_56 then 
		goto l229
	end
	CloseSecretWallGroup(Gvar_28)
	Gvar_48 = Gvar_45
	DeleteObject(Gvar_22)
	DeleteObject(Gvar_23)
	::l229::
	goto l231
	::l231::
	if true then return end
end
function GolemDie()
	if not GetObjHealth(Gvar_50) <= 0 and GetObjHealth(Gvar_51) <= 0 then 
		goto l44
	end
	PlayerGiveExp(GetHostPlayer(),1000)
	OpenSecretWallGroup(Gvar_28)
	AudioEvent("BigGong",Gvar_33)
	AudioEvent("BigGong",Gvar_34)
	::l44::
	if true then return end
end
function GolemsAttack()
	MonsterGoFight(Gvar_50,GetHostPlayer())
	MonsterGoFight(Gvar_51,GetHostPlayer())
	if true then return end
end
function RemoveLetterbox()
	CinematicBorders(false)
	DeleteObject(Gvar_22)
	DeleteObject(Gvar_23)
	ObjFreeze(GetHostPlayer(),false)
	PlayMusic(27,100)
	WaitFrames(45,14)
	if true then return end
end
function ImpsExit()
	MoveTo(Gvar_22,Gvar_37)
	MoveTo(Gvar_23,Gvar_38)
	if true then return end
end
function PriestsExit()
	Gvar_48 = Gvar_43
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_20),GetObjY(Gvar_20),0,0)
	TeleportWaypoint(Gvar_39,GetObjX(Gvar_20),GetObjY(Gvar_20))
	Gvar_22 = SpawnObject("Imp",Gvar_39)
	AudioEvent("ImpRecognize",Gvar_39)
	TeleportObj(Gvar_20,GetWaypointX(Gvar_35),GetWaypointY(Gvar_35))
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_21),GetObjY(Gvar_21),0,0)
	TeleportWaypoint(Gvar_39,GetObjX(Gvar_21),GetObjY(Gvar_21))
	Gvar_23 = SpawnObject("Imp",Gvar_39)
	TeleportObj(Gvar_21,GetWaypointX(Gvar_36),GetWaypointY(Gvar_36))
	ObjSetMaster(GetHostPlayer(),Gvar_22)
	ObjSetMaster(GetHostPlayer(),Gvar_23)
	MonsterSetAggressiveness(Gvar_22,0)
	MonsterSetAggressiveness(Gvar_23,0)
	MonsterEventScript(Gvar_22,11,12)
	MonsterEventScript(Gvar_23,11,12)
	WaitFrames(1,16)
	if true then return end
end
function GetGolemHandles()
	if not Gvar_52 or ObjIsCaller(Gvar_22) or ObjIsCaller(Gvar_23) then 
		goto l18
	end
	if true then return end
	::l18::
	var_0 = Gvar_49
	if var_0 == Gvar_46 then 
		goto l45
	end
	if var_0 == Gvar_47 then 
		goto l98
	end
	goto l181
	::l45::
	DisableObject(Trigger)
	RemoveAllChat()
	Gvar_50 = ScriptCaller()
	MonsterEventScript(Gvar_50,5,13)
	ObjResetMaster(Gvar_20)
	MonsterIdle(Gvar_50)
	ObjResetMaster(Gvar_50)
	MonsterSetAggressiveness(Gvar_50,0)
	Gvar_49 = Gvar_47
	goto l183
	::l98::
	DisableObject(Trigger)
	RemoveAllChat()
	Gvar_51 = ScriptCaller()
	MonsterEventScript(Gvar_51,5,13)
	ObjResetMaster(Gvar_21)
	ObjResetMaster(Gvar_51)
	MonsterIdle(Gvar_51)
	MonsterSetAggressiveness(Gvar_51,0)
	ObjLookAtObj(Gvar_50,GetHostPlayer())
	ObjLookAtObj(Gvar_51,GetHostPlayer())
	Gvar_52 = true
	MonsterSetAggressiveness(Gvar_50,0.83)
	MonsterSetAggressiveness(Gvar_51,0.83)
	RemoveLetterbox()
	goto l183
	::l181::
	goto l183
	::l183::
	if true then return end
end
function SummonGolems()
	ApplySpellObjXY("SPELL_SUMMON_STONE_GOLEM",Gvar_20,GetWaypointX(Gvar_31),GetWaypointY(Gvar_31))
	ApplySpellObjXY("SPELL_SUMMON_STONE_GOLEM",Gvar_21,GetWaypointX(Gvar_32),GetWaypointY(Gvar_32))
	AudioEvent("SummonCast",Gvar_33)
	AudioEvent("SummonCast",Gvar_34)
	EnableObjectGroup(Gvar_26)
	DisableObjectGroup(Gvar_25)
	WaitFrames(60,17)
	if true then return end
end
function ImpsEnter()
	OpenSecretWallGroup(Gvar_28)
	MoveTo(Gvar_22,Gvar_33)
	MoveTo(Gvar_23,Gvar_34)
	if true then return end
end
function GolemSetPiece()
	if not Gvar_48 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l93
	end
	PushMusicStack()
	PlayMusic(10,100)
	Gvar_57 = WaypointFromName("GolemSP_AudioOrigin")
	TeleportWaypoint(Gvar_57,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	Gvar_48 = Gvar_42
	CloseSecretWallGroup(Gvar_27)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	CinematicBorders(true)
	ObjSetMaster(GetHostPlayer(),Gvar_22)
	ObjSetMaster(GetHostPlayer(),Gvar_23)
	WaitFrames(15,20)
	::l93::
	if true then return end
end
function RetrieveWierdling()
	if not Gvar_58 then 
		goto l6
	end
	if true then return end
	::l6::
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l65
	end
	PopMusicStack()
	JournalSetObjective(1,"Chapter8:HasWeirdling")
	Gvar_58 = true
	SetOblivionStatus(2)
	DisableObject(Gvar_24)
	OpenSecretWallGroup(Gvar_29)
	JournalUpdateEntry(GetHostPlayer(),"Chapter8Wierdling",4)
	PrintToAll("Con02a:ObjectiveComplete")
	JournalAddEntry(GetHostPlayer(),"Chapter8MeetCaptain",2)
	PrintToAll("Con01a:NewJournalEntry")
	::l65::
	if true then return end
end