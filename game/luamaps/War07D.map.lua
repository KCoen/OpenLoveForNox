
function GLOBAL()
	if true then return end
end
function GLOBAL()
	if true then return end
end
function SetUpCreatures()
	MonsterGoHunt(Gvar_6)
	MonsterGoHunt(Gvar_7)
	MonsterGoHunt(Gvar_8)
	MonsterGoHunt(Gvar_9)
	MonsterGoHunt(Gvar_10)
	MonsterGoHunt(Gvar_11)
	if true then return end
end
function OpenMuseumWalls()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l16
	end
	DisableObject(Trigger)
	OpenSecretWallGroup(Gvar_12)
	::l16::
	if true then return end
end
function MapInitialize()
	Gvar_4 = WaypointFromName("PlayerSounds")
	Gvar_6 = ObjFromName("WizHunter1")
	Gvar_7 = ObjFromName("WizHunter2")
	Gvar_8 = ObjFromName("WizHunter3")
	Gvar_9 = ObjFromName("MuseumMage1")
	Gvar_10 = ObjFromName("MuseumMage2")
	Gvar_11 = ObjFromName("MuseumMage3")
	Gvar_5 = ObjFromName("Dalmen")
	Gvar_12 = WallGroupFromName("MuseumWalls")
	WaitFrames(1,2)
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