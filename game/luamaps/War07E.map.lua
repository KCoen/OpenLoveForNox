
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_11 = false
	Gvar_12 = false
	Gvar_13 = false
	if true then return end
end
function CreatureSetup()
	MonsterGoHunt(Gvar_4)
	MonsterGoHunt(Gvar_5)
	if true then return end
end
function SaveGame()
	ForceAutosave()
	DisableObject(Gvar_7)
	if true then return end
end
function WallSetOneButton()
	if not Gvar_11 == false then 
		goto l23
	end
	OpenSecretWallGroup(Gvar_8)
	Gvar_11 = true
	goto l35
	::l23::
	CloseSecretWallGroup(Gvar_8)
	Gvar_11 = false
	::l35::
	if true then return end
end
function WallSetTwoButton()
	if not Gvar_12 == false then 
		goto l23
	end
	OpenSecretWallGroup(Gvar_9)
	Gvar_12 = true
	goto l35
	::l23::
	CloseSecretWallGroup(Gvar_9)
	Gvar_12 = false
	::l35::
	if true then return end
end
function WallSetThreeButton()
	if not Gvar_13 == false then 
		goto l28
	end
	OpenSecretWallGroup(Gvar_10)
	Gvar_13 = true
	EnableObject(Gvar_6)
	goto l45
	::l28::
	CloseSecretWallGroup(Gvar_10)
	Gvar_13 = false
	DisableObject(Gvar_6)
	::l45::
	if true then return end
end
function HTHAttack()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l19
	end
	MonsterAttackMelee(Trigger,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	::l19::
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("Hunter2")
	Gvar_5 = ObjFromName("Hunter3")
	Gvar_6 = ObjFromName("MainTeleporter")
	Gvar_7 = ObjFromName("SaveGameTrigger")
	Gvar_8 = WallGroupFromName("WallSetOne")
	Gvar_9 = WallGroupFromName("WallSetTwo")
	Gvar_10 = WallGroupFromName("WallSetThree")
	Gvar_14 = WaypointFromName("PlayerSounds")
	Gvar_15 = WaypointFromName("FromFloor5WP")
	DisableObject(Gvar_6)
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