
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_37 = 0
	Gvar_38 = 1
	Gvar_39 = 0
	Gvar_40 = 180
	Gvar_41 = 0
	Gvar_42 = 10
	if true then return end
end
function ArrowTrapAudio()
	TeleportWaypoint(Gvar_7,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BowShoot",Gvar_7)
	AudioEvent("CrossBowShoot",Gvar_7)
	if true then return end
end
function DisableArrowTrapGroup01()
	DisableObjectGroup(Gvar_4)
	if true then return end
end
function EnableArrowTrapGroup01()
	EnableObjectGroup(Gvar_4)
	WaitFrames(1,3)
	if true then return end
end
function DisableArrowTrapGroup02()
	DisableObjectGroup(Gvar_5)
	if true then return end
end
function ActivateArrowTrap02()
	EnableObjectGroup(Gvar_5)
	WaitFrames(1,5)
	if true then return end
end
function DisableArrowTrapGroup03()
	DisableObjectGroup(Gvar_6)
	if true then return end
end
function ActivateArrowTrap03()
	EnableObjectGroup(Gvar_6)
	WaitFrames(1,7)
	if true then return end
end
function BeholderAttackExit()
	if not GetObjHealth(Gvar_8) > 0 then 
		goto l28
	end
	if not ObjCanInteractWith(Gvar_8,GetHostPlayer()) == 0 then 
		goto l28
	end
	MoveTo(Gvar_8,Gvar_11)
	::l28::
	if true then return end
end
function BeholderStay()
	if not ObjIsCaller(Gvar_8) then 
		goto l12
	end
	MonsterGoRoam(Gvar_8)
	::l12::
	if not ObjIsCaller(Gvar_9) then 
		goto l24
	end
	MonsterGoRoam(Gvar_9)
	::l24::
	if true then return end
end
function OpenBoulderHallWall01()
	DisableObject(Trigger)
	OpenSecretWall(GetWallAt(104,162))
	if true then return end
end
function OpenBoulderHallWall02()
	DisableObject(Trigger)
	OpenSecretWall(GetWallAt(213,107))
	if true then return end
end
function GoldKeyRemoved()
	OpenSecretWallGroup(Gvar_12)
	OpenSecretWallGroup(Gvar_13)
	if true then return end
end
function ReleaseGoldKeyBombers()
	OpenSecretWallGroup(Gvar_13)
	if true then return end
end
function PlayerDeath()
	DeathScreen(8)
	if true then return end
end
function InitializeSummoningCircles()
	var_0 = 0
	::l6::
	if not var_0 < 10 then 
		goto l43
	end
	Gvar_44[var_0] = true
	Gvar_43[var_0] = 0
	var_0 = var_0 + 1
	goto l6
	::l43::
	Gvar_46[0] = "UrchinShaman"
	Gvar_46[1] = "Mimic"
	Gvar_46[2] = "Bear"
	Gvar_46[3] = "Urchin"
	Gvar_46[4] = "Imp"
	Gvar_46[5] = "WhiteWolf"
	Gvar_35 = ObjFromName("SummoningCircleTreasureLight")
	Gvar_36[0] = ObjFromName("SummoningCircleTreasure01")
	Gvar_36[1] = ObjFromName("SummoningCircleTreasure02")
	Gvar_36[2] = ObjFromName("SummoningCircleTreasure03")
	Gvar_36[3] = ObjFromName("SummoningCircleTreasure04")
	Gvar_36[4] = ObjFromName("SummoningCircleTreasure05")
	Gvar_36[5] = ObjFromName("SummoningCircleTreasure06")
	Gvar_36[6] = ObjFromName("SummoningCircleTreasure07")
	Gvar_36[7] = ObjFromName("SummoningCircleTreasure08")
	Gvar_36[8] = ObjFromName("SummoningCircleTreasure09")
	Gvar_45[0] = WaypointFromName("SummoningCircle01WP")
	Gvar_45[1] = WaypointFromName("SummoningCircle02WP")
	Gvar_45[2] = WaypointFromName("SummoningCircle03WP")
	Gvar_45[3] = WaypointFromName("SummoningCircle04WP")
	Gvar_45[4] = WaypointFromName("SummoningCircle05WP")
	Gvar_45[5] = WaypointFromName("SummoningCircle06WP")
	Gvar_45[6] = WaypointFromName("SummoningCircle07WP")
	Gvar_45[7] = WaypointFromName("SummoningCircle08WP")
	Gvar_45[8] = WaypointFromName("SummoningCircle09WP")
	Gvar_45[9] = WaypointFromName("SummoningCircle10WP")
	Gvar_33[0] = ObjGroupFromName("SummonCircle01Lights")
	Gvar_33[1] = ObjGroupFromName("SummonCircle02Lights")
	Gvar_33[2] = ObjGroupFromName("SummonCircle03Lights")
	Gvar_33[3] = ObjGroupFromName("SummonCircle04Lights")
	Gvar_33[4] = ObjGroupFromName("SummonCircle05Lights")
	Gvar_33[5] = ObjGroupFromName("SummonCircle06Lights")
	Gvar_33[6] = ObjGroupFromName("SummonCircle07Lights")
	Gvar_33[7] = ObjGroupFromName("SummonCircle08Lights")
	Gvar_33[8] = ObjGroupFromName("SummonCircle09Lights")
	Gvar_33[9] = ObjGroupFromName("SummonCircle10Lights")
	if true then return end
end
function MapInitialize()
	Gvar_8 = ObjFromName("Beholder01")
	Gvar_9 = ObjFromName("Beholder02")
	Gvar_15 = ObjFromName("Beholder03")
	Gvar_16 = ObjFromName("Bat01")
	Gvar_17 = ObjFromName("StoneBlock01")
	Gvar_18 = ObjFromName("StoneBlock02")
	Gvar_19 = ObjFromName("StoneBlock03")
	Gvar_20 = ObjFromName("StoneBlock04")
	Gvar_21 = ObjFromName("BomberPitElevator")
	Gvar_22 = ObjFromName("SpiderPitElevator")
	Gvar_23 = WaypointFromName("StoneBlock01WP")
	Gvar_26 = WaypointFromName("StoneBlock02Home")
	Gvar_28 = WaypointFromName("StoneBlock03Home")
	Gvar_25 = WaypointFromName("StoneBlock02Dest")
	Gvar_27 = WaypointFromName("StoneBlock03Dest")
	Gvar_24 = WaypointFromName("StoneBlock04WP")
	Gvar_14 = WaypointFromName("GoldKeyWP")
	Gvar_30 = WaypointFromName("BomberCreationWP")
	Gvar_10 = WaypointFromName("BomberAudioOrigin")
	Gvar_29 = WaypointFromName("Beholder01SetPieceWP")
	Gvar_11 = WaypointFromName("BeholderRoomExitWP")
	Gvar_7 = WaypointFromName("ArrowTrapAudioOrigin")
	Gvar_31 = WaypointFromName("SecretAudioOrigin")
	Gvar_4 = ObjGroupFromName("ArrowTrapGroup01")
	Gvar_5 = ObjGroupFromName("ArrowTrapGroup02")
	Gvar_6 = ObjGroupFromName("ArrowTrapGroup03")
	Gvar_12 = WallGroupFromName("GoldKeyWalls")
	Gvar_13 = WallGroupFromName("BomberCageWalls")
	InitializeSummoningCircles()
	if true then return end
end
function MapEntry()
	PlayMusic(18,100)
	CinematicFadeout()
	if true then return end
end
function EnableSpiderPitElevator()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l11
	end
	EnableObject(Gvar_22)
	::l11::
	if true then return end
end
function SecretSFX()
	TeleportWaypoint(Gvar_31,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_31)
	if true then return end
end
function Secret01Found()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	SecretSFX()
	if true then return end
end
function SealTheTempleFX()
	var_0 = GetObjX(GetHostPlayer())
	var_1 = GetObjY(GetHostPlayer())
	AudioEvent("HugeFoot",Gvar_23)
	PlayFX("JIGGLE",var_0,var_1,10,0)
	if true then return end
end
function SealTheTemple()
	DisableObject(Trigger)
	MoveTo(Gvar_17,Gvar_23)
	MoveTo(Gvar_20,Gvar_24)
	AudioEvent("BigGong",Gvar_23)
	AudioEvent("SecretWallClose",Gvar_23)
	WaitFrames(10,22)
	if true then return end
end
function EnableElevator()
	EnableObject(Gvar_21)
	if true then return end
end
function ReleasePlayer()
	CinematicBorders(false)
	ObjResetMaster(Gvar_8)
	ObjFreeze(GetHostPlayer(),false)
	if not GetObjHealth(Gvar_16) > 0 then 
		goto l32
	end
	EnableObject(Gvar_16)
	::l32::
	DeleteObject(ObjFromName("War08a:CharmedWolf01"))
	DeleteObject(ObjFromName("War08a:CharmedWolf02"))
	DeleteObject(ObjFromName("War08a:CharmedWolf03"))
	DeleteObject(ObjFromName("War08a:CharmedWolf04"))
	WallMakeSilent(true)
	CloseSecretWall(GetWallAt(169,87))
	WallMakeSilent(false)
	WaitFrames(60,24)
	if true then return end
end
function BeholderSetpieceSEG3()
	WaitFrames(60,25)
	if true then return end
end
function BeholderSetpieceSEG2()
	MoveTo(Gvar_8,Gvar_29)
	WaitFrames(180,25)
	if true then return end
end
function BeholderSetpiece()
	ObjSetMaster(GetHostPlayer(),Gvar_8)
	DisableObject(Trigger)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	CinematicBorders(true)
	if not GetObjHealth(Gvar_16) > 0 then 
		goto l43
	end
	DisableObject(Gvar_16)
	::l43::
	WaitFrames(60,27)
	if true then return end
end
function DisableBomberPitElevator()
	DisableObject(Gvar_21)
	if true then return end
end
function BlockGatesFX()
	var_0 = GetObjX(GetHostPlayer())
	var_1 = GetObjY(GetHostPlayer())
	AudioEvent("HugeFoot",Gvar_25)
	PlayFX("JIGGLE",var_0,var_1,10,0)
	if true then return end
end
function CloseBlockGates()
	MoveTo(Gvar_18,Gvar_25)
	MoveTo(Gvar_19,Gvar_27)
	AudioEvent("SecretWallClose",Gvar_25)
	AudioEvent("SecretWallClose",Gvar_27)
	WaitFrames(10,30)
	if true then return end
end
function SealBeholderRoom()
	DisableObject(Trigger)
	CloseSecretWall(GetWallAt(209,109))
	TeleportObj(Gvar_8,GetWaypointX(Gvar_11),GetWaypointY(Gvar_11))
	MonsterSetAggressiveness(Gvar_8,0.83)
	MonsterSetAggressiveness(Gvar_9,0.83)
	MonsterGoRoam(Gvar_8)
	MonsterGoRoam(Gvar_9)
	if true then return end
end
function ResetSummonCircle(arg_0)
	Gvar_44[arg_0] = true
	EnableObjectGroup(Gvar_33[arg_0])
	if true then return end
end
function SummoningCircleCleared(arg_0)
	Gvar_39 = Gvar_39 + 1
	if not Gvar_39 == 9 then 
		goto l116
	end
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),500)
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]),0,0)
	TeleportObj(Gvar_35,GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]))
	TeleportObj(Gvar_36[Gvar_39 - 1],GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]))
	AudioEvent("SmallGong",Gvar_45[arg_0])
	goto l206
	::l116::
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]),0,0)
	TeleportObj(Gvar_35,GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]))
	TeleportObj(Gvar_36[Gvar_39 - 1],GetWaypointX(Gvar_45[arg_0]),GetWaypointY(Gvar_45[arg_0]))
	AudioEvent("BigGong",Gvar_45[arg_0])
	::l206::
	if true then return end
end
function SummonCircle01Activate()
	Gvar_37 = 0
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle02Activate()
	Gvar_37 = 1
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle03Activate()
	Gvar_37 = 2
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle04Activate()
	Gvar_37 = 3
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle05Activate()
	Gvar_37 = 4
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle06Activate()
	Gvar_37 = 5
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle07Activate()
	Gvar_37 = 6
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle08Activate()
	Gvar_37 = 7
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle09Activate()
	Gvar_37 = 8
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function SummonCircle10Activate()
	Gvar_37 = 9
	if not ObjIsCaller(GetHostPlayer()) and Gvar_44[Gvar_37] == true then 
		goto l238
	end
	Gvar_44[Gvar_37] = false
	DisableObjectGroup(Gvar_33[Gvar_37])
	AudioEvent("SummonCast",Gvar_45[Gvar_37])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_45[Gvar_37]),GetWaypointY(Gvar_45[Gvar_37]),0,0)
	if not RandomInteger(0,100) <= Gvar_42 then 
		goto l168
	end
	var_1 = RandomInteger(0,1)
	if var_1 == 0 then 
		goto l121
	end
	if var_1 == 1 then 
		goto l149
	end
	goto l166
	::l121::
	var_0 = SpawnObject("BomberYellow",Gvar_45[Gvar_37])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_45[Gvar_37])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_41 = RandomInteger(0,5)
	SpawnObject(Gvar_46[Gvar_41],Gvar_45[Gvar_37])
	::l194::
	Gvar_43[Gvar_37] = Gvar_43[Gvar_37] + 1
	if not Gvar_43[Gvar_37] > Gvar_38 then 
		goto l228
	end
	WaitSpecial(30,Gvar_37,34)
	goto l238
	::l228::
	WaitSpecial(Gvar_40,Gvar_37,33)
	::l238::
	if true then return end
end
function EnableBomberPitElevator()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l11
	end
	EnableObject(Gvar_21)
	::l11::
	if true then return end
end
function OpenBomberPitExit()
	DisableObject(Trigger)
	OpenSecretWall(GetWallAt(159,109))
	if true then return end
end