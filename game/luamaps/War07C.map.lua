
function GLOBAL()
	if true then return end
end
function GLOBAL()
	if true then return end
end
function SecondFloorPatrolMage1()
	MonsterGoRoam(Gvar_8)
	if true then return end
end
function SecondFloorPatrolMage2()
	MonsterGoRoam(Gvar_9)
	if true then return end
end
function SecondFloorPatrolMage3()
	MonsterGoRoam(Gvar_10)
	if true then return end
end
function ActivateGears()
	if not ObjIsEnabled(Gvar_5) then 
		goto l54
	end
	TeleportWaypoint(Gvar_6,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("Gear2",Gvar_6)
	DisableObjectGroup(Gvar_16)
	DisableObject(Gvar_11)
	DisableObject(Gvar_12)
	DisableObject(Gvar_13)
	DisableObject(Gvar_14)
	goto l99
	::l54::
	TeleportWaypoint(Gvar_6,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("Gear3",Gvar_6)
	EnableObjectGroup(Gvar_16)
	EnableObject(Gvar_11)
	EnableObject(Gvar_12)
	EnableObject(Gvar_13)
	EnableObject(Gvar_14)
	::l99::
	if true then return end
end
function TrainingRoomXP()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l41
	end
	DisableObject(Trigger)
	TeleportWaypoint(Gvar_7,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_7)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	::l41::
	if true then return end
end
function MapInitialize()
	Gvar_8 = ObjFromName("PatrolMage1")
	Gvar_9 = ObjFromName("PatrolMage2")
	Gvar_10 = ObjFromName("PatrolMage3")
	Gvar_4 = ObjFromName("ToLevelOneTP")
	Gvar_11 = ObjFromName("Globe1")
	Gvar_12 = ObjFromName("Globe2")
	Gvar_13 = ObjFromName("Globe3")
	Gvar_14 = ObjFromName("Globe4")
	Gvar_5 = ObjFromName("TestGear")
	Gvar_15 = ObjFromName("ResetWizTrigger")
	Gvar_16 = ObjGroupFromName("Level2Gears")
	Gvar_6 = WaypointFromName("PlayerSounds")
	Gvar_7 = WaypointFromName("SecretSounds")
	MonsterGoHunt(Gvar_8)
	MonsterGoHunt(Gvar_9)
	MonsterGoHunt(Gvar_10)
	EnableObjectGroup(Gvar_16)
	if true then return end
end
function MapEntry()
	PlayMusic(16,100)
	if true then return end
end
function PlayerDeath()
	DeathScreen(7)
	if true then return end
end