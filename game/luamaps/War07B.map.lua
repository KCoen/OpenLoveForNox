
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_27 = false
	Gvar_28 = false
	Gvar_29 = false
	Gvar_30 = false
	if true then return end
end
function EnableReceptionist()
	EnableObject(Gvar_5)
	if not GetObjHealth(Gvar_5) > 0 then 
		goto l22
	end
	SayChat(Gvar_5,"War07B.scr:MainReceptionistTalk01")
	::l22::
	DisableObjectGroup(Gvar_22)
	MonsterGoHunt(Gvar_11)
	MonsterGoHunt(Gvar_12)
	MonsterGoHunt(Gvar_13)
	if true then return end
end
function ClassroomAttacks()
	EnableObjectGroup(Gvar_19)
	EnableObject(Gvar_6)
	if true then return end
end
function BirdManAttacks()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l29
	end
	if not Gvar_29 == false then 
		goto l29
	end
	SayChat(Gvar_7,"War07B.scr:BirdManTalk01")
	Gvar_29 = true
	::l29::
	if true then return end
end
function OpenLabBookcase()
	EnableObject(Gvar_16)
	EnableObject(Gvar_17)
	OpenSecretWall(Gvar_23)
	BreakWallGroup(Gvar_24)
	DisableObjectGroup(Gvar_21)
	DeleteObjectGroup(Gvar_21)
	DisableObject(Gvar_15)
	Gvar_28 = true
	if true then return end
end
function DestroyLab()
	if not Gvar_28 == false then 
		goto l38
	end
	SayChat(Gvar_8,"War07B.scr:TempWizardTalk01")
	EnableObjectGroup(Gvar_20)
	OpenSecretWallGroup(Gvar_25)
	DeleteObject(Gvar_14)
	Gvar_28 = true
	::l38::
	if true then return end
end
function EnterClassroom()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l94
	end
	DisableObject(Trigger)
	if not GetObjHealth(Gvar_11) > 0 then 
		goto l29
	end
	ObjFreeze(Gvar_11,true)
	::l29::
	if not GetObjHealth(Gvar_12) > 0 then 
		goto l47
	end
	ObjFreeze(Gvar_12,true)
	::l47::
	if not GetObjHealth(Gvar_13) > 0 then 
		goto l65
	end
	ObjFreeze(Gvar_13,true)
	::l65::
	if not GetObjHealth(Gvar_6) > 0 then 
		goto l92
	end
	ObjFreeze(Gvar_6,true)
	ForceDialog(Gvar_6,GetHostPlayer())
	goto l94
	::l92::
	ClassroomAttacks()
	::l94::
	if true then return end
end
function TeacherStart()
	StartDialogWithCaller("HumanMaleEatFood","War07B.scr:TeacherTalk01")
	if true then return end
end
function TeacherEnd()
	CancelDialog(Gvar_6)
	if not GetObjHealth(Gvar_11) > 0 then 
		goto l23
	end
	ObjFreeze(Gvar_11,false)
	::l23::
	if not GetObjHealth(Gvar_12) > 0 then 
		goto l41
	end
	ObjFreeze(Gvar_12,false)
	::l41::
	if not GetObjHealth(Gvar_13) > 0 then 
		goto l59
	end
	ObjFreeze(Gvar_13,false)
	::l59::
	ObjFreeze(Gvar_6,false)
	ClassroomAttacks()
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("ChamberSpawn")
	Gvar_5 = ObjFromName("MainReceptionist")
	Gvar_6 = ObjFromName("Teacher")
	Gvar_7 = ObjFromName("BirdMan")
	Gvar_8 = ObjFromName("TempWizard")
	Gvar_9 = ObjFromName("TrapWiz1")
	Gvar_10 = ObjFromName("TrapWiz2")
	Gvar_11 = ObjFromName("MageHunter1")
	Gvar_12 = ObjFromName("MageHunter2")
	Gvar_13 = ObjFromName("MageHunter3")
	Gvar_14 = ObjFromName("FloorOneMagicAxe")
	Gvar_15 = ObjFromName("LabExplodeTrigger")
	Gvar_16 = ObjFromName("LabBookcaseMover1")
	Gvar_17 = ObjFromName("LabBookcaseMover2")
	Gvar_18 = ObjFromName("ToLevelTwoTP")
	Gvar_19 = ObjGroupFromName("Students")
	Gvar_20 = ObjGroupFromName("LabFlames")
	Gvar_21 = ObjGroupFromName("ExplodingBarrels")
	Gvar_22 = ObjGroupFromName("ReceptionTriggers")
	Gvar_23 = GetWallAt(123,191)
	Gvar_24 = WallGroupFromName("LabWalls")
	Gvar_25 = WallGroupFromName("LabSecretWalls2")
	Gvar_26 = WaypointFromName("PlayerSounds")
	DisableObject(Gvar_5)
	DisableObject(Gvar_6)
	DisableObjectGroup(Gvar_19)
	DisableObjectGroup(Gvar_20)
	SetDialogPortrait(Gvar_6,"WizardGuard2Pic")
	SetupDialog(Gvar_6,"NORMAL",8,9)
	if true then return end
end
function PlayerDeath()
	DeathScreen(7)
	if true then return end
end
function MapEntry()
	PlayMusic(16,100)
	if true then return end
end