
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_10 = 0
	Gvar_41 = 0
	Gvar_42 = 0
	Gvar_43 = 0
	Gvar_53 = false
	Gvar_79 = 0
	Gvar_80 = 1
	Gvar_81 = 0
	Gvar_82 = 10
	Gvar_83 = 180
	Gvar_84 = 0
	if true then return end
end
function ArrowTrapAudio()
	TeleportWaypoint(Gvar_9,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BowShoot",Gvar_9)
	AudioEvent("CrossBowShoot",Gvar_9)
	if true then return end
end
function DisableArrowTrap01()
	DisableObjectGroup(Gvar_5)
	if true then return end
end
function ActivateArrowTrap01()
	EnableObjectGroup(Gvar_5)
	WaitFrames(1,3)
	if true then return end
end
function DisableArrowTrap02()
	DisableObjectGroup(Gvar_6)
	if true then return end
end
function ActivateArrowTrap02()
	EnableObjectGroup(Gvar_6)
	WaitFrames(1,5)
	if true then return end
end
function DisableArrowTrap03()
	DisableObjectGroup(Gvar_7)
	if true then return end
end
function ActivateArrowTrap03()
	EnableObjectGroup(Gvar_7)
	WaitFrames(1,7)
	if true then return end
end
function DisableUltimateArrowTrapGuns()
	DisableObjectGroup(Gvar_8)
	if true then return end
end
function ResetUltimateArrowTrap()
	EnableObject(Gvar_4)
	if true then return end
end
function UltimateArrowTrapLoop()
	if not Gvar_10 < 8 then 
		goto l31
	end
	Gvar_10 = Gvar_10 + 1
	EnableObjectGroup(Gvar_8)
	WaitFrames(1,9)
	WaitFrames(10,11)
	::l31::
	if not Gvar_10 == 8 then 
		goto l62
	end
	Gvar_10 = 0
	EnableObjectGroup(Gvar_8)
	WaitFrames(1,9)
	WaitFrames(10,10)
	::l62::
	if true then return end
end
function ActivateUltimateArrowTrap()
	DisableObject(Trigger)
	EnableObjectGroup(Gvar_8)
	WaitFrames(1,9)
	WaitFrames(10,11)
	if true then return end
end
function InitializeBeholders()
	Gvar_44[0] = "SPELL_STUN"
	Gvar_44[1] = "SPELL_CONFUSE"
	Gvar_44[2] = "SPELL_FUMBLE"
	if true then return end
end
function BeholderIdle()
	MonsterGoRoam(Trigger)
	if true then return end
end
function Beholder01Bombers()
	if not GetObjHealth(Gvar_11) > 0 and GetObjHealth(Gvar_27) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_11)
	var_1 = GetObjY(Gvar_11)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_27 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_27,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_27 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_27,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_27 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_27,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_11,Gvar_27)
	MonsterFollowObj(Gvar_27,Gvar_11)
	::l314::
	if true then return end
end
function Beholder01Recognize()
	WaitFrames(90,15)
	if true then return end
end
function Beholder01Die()
	DamageObject(Gvar_27,0,500,0)
	if true then return end
end
function Beholder02Bombers()
	if not GetObjHealth(Gvar_12) > 0 and GetObjHealth(Gvar_28) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_12)
	var_1 = GetObjY(Gvar_12)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_28 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_28,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_28 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_28,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_28 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_28,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_12,Gvar_28)
	MonsterFollowObj(Gvar_28,Gvar_12)
	::l314::
	if true then return end
end
function Beholder02Recognize()
	WaitFrames(90,18)
	if true then return end
end
function Beholder02Die()
	DamageObject(Gvar_28,0,500,0)
	if true then return end
end
function Beholder03Bombers()
	if not GetObjHealth(Gvar_13) > 0 and GetObjHealth(Gvar_29) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_13)
	var_1 = GetObjY(Gvar_13)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_29 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_29,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_29 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_29,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_29 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_29,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_13,Gvar_29)
	MonsterFollowObj(Gvar_29,Gvar_13)
	::l314::
	if true then return end
end
function Beholder03Recognize()
	WaitFrames(90,21)
	if true then return end
end
function Beholder03Die()
	DamageObject(Gvar_29,0,500,0)
	if true then return end
end
function Beholder04Bombers()
	if not GetObjHealth(Gvar_14) > 0 and GetObjHealth(Gvar_30) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_14)
	var_1 = GetObjY(Gvar_14)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_30 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_30,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_30 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_30,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_30 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_30,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_14,Gvar_30)
	MonsterFollowObj(Gvar_30,Gvar_14)
	::l314::
	if true then return end
end
function Beholder04Recognize()
	WaitFrames(90,24)
	if true then return end
end
function Beholder04Die()
	DamageObject(Gvar_30,0,500,0)
	if true then return end
end
function Beholder05Bombers()
	if not GetObjHealth(Gvar_15) > 0 and GetObjHealth(Gvar_31) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_15)
	var_1 = GetObjY(Gvar_15)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_31 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_31,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_31 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_31,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_31 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_31,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_15,Gvar_31)
	MonsterFollowObj(Gvar_31,Gvar_15)
	::l314::
	if true then return end
end
function Beholder05Recognize()
	WaitFrames(90,27)
	if true then return end
end
function Beholder05Die()
	DamageObject(Gvar_31,0,500,0)
	if true then return end
end
function Beholder06Bombers()
	if not GetObjHealth(Gvar_16) > 0 and GetObjHealth(Gvar_32) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_16)
	var_1 = GetObjY(Gvar_16)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_32 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_32,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_32 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_32,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_32 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_32,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_16,Gvar_32)
	MonsterFollowObj(Gvar_32,Gvar_16)
	::l314::
	if true then return end
end
function Beholder06Recognize()
	WaitFrames(90,30)
	if true then return end
end
function Beholder06Die()
	DamageObject(Gvar_32,0,500,0)
	if true then return end
end
function Beholder07Bombers()
	if not GetObjHealth(Gvar_17) > 0 and GetObjHealth(Gvar_33) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_17)
	var_1 = GetObjY(Gvar_17)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_33 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_33,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_33 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_33,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_33 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_33,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_17,Gvar_33)
	MonsterFollowObj(Gvar_33,Gvar_17)
	::l314::
	if true then return end
end
function Beholder07Recognize()
	WaitFrames(90,33)
	if true then return end
end
function Beholder07Die()
	DamageObject(Gvar_33,0,500,0)
	if true then return end
end
function Beholder08Bombers()
	if not GetObjHealth(Gvar_18) > 0 and GetObjHealth(Gvar_34) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_18)
	var_1 = GetObjY(Gvar_18)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_34 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_34,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_34 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_34,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_34 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_34,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_18,Gvar_34)
	MonsterFollowObj(Gvar_34,Gvar_18)
	::l314::
	if true then return end
end
function Beholder08Recognize()
	WaitFrames(90,36)
	if true then return end
end
function Beholder08Die()
	DamageObject(Gvar_34,0,500,0)
	if true then return end
end
function Beholder09Bombers()
	if not GetObjHealth(Gvar_19) > 0 and GetObjHealth(Gvar_35) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_19)
	var_1 = GetObjY(Gvar_19)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_35 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_35,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_35 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_35,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_35 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_35,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_19,Gvar_35)
	MonsterFollowObj(Gvar_35,Gvar_19)
	::l314::
	if true then return end
end
function Beholder09Recognize()
	WaitFrames(90,39)
	if true then return end
end
function Beholder09Die()
	DamageObject(Gvar_35,0,500,0)
	if true then return end
end
function Beholder10Bombers()
	if not GetObjHealth(Gvar_20) > 0 and GetObjHealth(Gvar_36) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_20)
	var_1 = GetObjY(Gvar_20)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_36 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_36,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_36 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_36,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_36 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_36,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_20,Gvar_36)
	MonsterFollowObj(Gvar_36,Gvar_20)
	::l314::
	if true then return end
end
function Beholder10Recognize()
	WaitFrames(90,42)
	if true then return end
end
function Beholder10Die()
	DamageObject(Gvar_36,0,500,0)
	if true then return end
end
function Beholder11Bombers()
	if not GetObjHealth(Gvar_21) > 0 and GetObjHealth(Gvar_37) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_21)
	var_1 = GetObjY(Gvar_21)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_37 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_37,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_37 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_37,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_37 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_37,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_21,Gvar_37)
	MonsterFollowObj(Gvar_37,Gvar_21)
	::l314::
	if true then return end
end
function Beholder11Recognize()
	WaitFrames(90,45)
	if true then return end
end
function Beholder11Die()
	DamageObject(Gvar_37,0,500,0)
	if true then return end
end
function Beholder12Bombers()
	if not GetObjHealth(Gvar_22) > 0 and GetObjHealth(Gvar_38) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_22)
	var_1 = GetObjY(Gvar_22)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_38 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_38,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_38 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_38,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_38 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_38,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_22,Gvar_38)
	MonsterFollowObj(Gvar_38,Gvar_22)
	::l314::
	if true then return end
end
function Beholder12Recognize()
	WaitFrames(90,48)
	if true then return end
end
function Beholder12Die()
	DamageObject(Gvar_38,0,500,0)
	if true then return end
end
function Beholder13Bombers()
	if not GetObjHealth(Gvar_23) > 0 and GetObjHealth(Gvar_39) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_23)
	var_1 = GetObjY(Gvar_23)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_39 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_39,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_39 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_39,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_39 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_39,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_23,Gvar_39)
	MonsterFollowObj(Gvar_39,Gvar_23)
	::l314::
	if true then return end
end
function Beholder13Recognize()
	WaitFrames(90,51)
	if true then return end
end
function Beholder13Die()
	DamageObject(Gvar_39,0,500,0)
	if true then return end
end
function Beholder14Bombers()
	if not GetObjHealth(Gvar_24) > 0 and GetObjHealth(Gvar_40) <= 0 then 
		goto l314
	end
	var_0 = GetObjX(Gvar_24)
	var_1 = GetObjY(Gvar_24)
	TeleportWaypoint(Gvar_26,var_0,var_1)
	AudioEvent("SummonCast",Gvar_26)
	var_2 = RandomFloat(Gvar_41,Gvar_42)
	var_3 = RandomFloat(Gvar_41,Gvar_42)
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_43 = RandomInteger(0,2)
	var_4 = Gvar_43
	if var_4 == 0 then 
		goto l147
	end
	if var_4 == 1 then 
		goto l190
	end
	if var_4 == 2 then 
		goto l244
	end
	goto l298
	::l147::
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_40 = SpawnObject("BomberBlue",Gvar_25)
	MonsterTrapSpells(Gvar_40,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l190::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_40 = SpawnObject("BomberGreen",Gvar_25)
	MonsterTrapSpells(Gvar_40,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l244::
	TeleportWaypoint(Gvar_25,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_0,var_1,0,0)
	Gvar_40 = SpawnObject("BomberYellow",Gvar_25)
	MonsterTrapSpells(Gvar_40,Gvar_44[Gvar_43],"NULL","NULL")
	goto l298
	::l298::
	ObjSetMaster(Gvar_24,Gvar_40)
	MonsterFollowObj(Gvar_40,Gvar_24)
	::l314::
	if true then return end
end
function Beholder14Recognize()
	WaitFrames(90,54)
	if true then return end
end
function Beholder14Die()
	DamageObject(Gvar_40,0,500,0)
	if true then return end
end
function OpenBlockPassage()
	DisableObject(Trigger)
	AudioEvent("SpikeBlockMove",Gvar_52)
	MoveTo(Gvar_45,Gvar_48)
	MoveTo(Gvar_46,Gvar_49)
	MoveTo(Gvar_47,Gvar_51)
	if true then return end
end
function SealBlockRoom()
	DisableObject(Trigger)
	AudioEvent("SpikeBlockMove",Gvar_50)
	MoveTo(Gvar_46,Gvar_50)
	if true then return end
end
function CagedAnimalDie()
	if not Gvar_53 == 0 then 
		goto l18
	end
	Gvar_53 = true
	BreakWallGroup(Gvar_56)
	::l18::
	if true then return end
end
function UnlockBearCage()
	DisableObject(Trigger)
	UnlockDoor(Gvar_54)
	UnlockDoor(Gvar_55)
	if true then return end
end
function PlayerDeath()
	DeathScreen(8)
	if true then return end
end
function FireFONTrap01()
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_57,GetWaypointX(Gvar_69),GetWaypointY(Gvar_69))
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_58,GetWaypointX(Gvar_70),GetWaypointY(Gvar_70))
	WaitSeconds(5,62)
	if true then return end
end
function EndFONSetpiece()
	ObjFreeze(GetHostPlayer(),false)
	CinematicBorders(false)
	if true then return end
end
function BearAttack()
	CancelEnchant(Gvar_62,"ENCHANT_INVULNERABLE")
	MonsterSetAggressiveness(Gvar_62,0.83)
	MonsterGoFight(Gvar_62,GetHostPlayer())
	WaitFrames(45,62)
	if true then return end
end
function InitializeFONtraps()
	Gvar_57 = ObjFromName("FON_Origin01")
	Gvar_58 = ObjFromName("FON_Origin02")
	Gvar_59 = ObjFromName("FON_Origin03")
	Gvar_60 = ObjFromName("FON_Origin04")
	Gvar_61 = ObjFromName("FON_Origin05")
	Gvar_62 = ObjFromName("Bear01")
	Gvar_63 = ObjFromName("SpikeTrapDoor01")
	Gvar_64 = ObjFromName("SpikeTrapDoor02")
	Gvar_65 = ObjFromName("SpikeTrapDoor03")
	Gvar_66 = ObjFromName("SpikeTrapDoor04")
	Gvar_68 = ObjGroupFromName("SpikeGroup01")
	Gvar_69 = WaypointFromName("FON_Target01")
	Gvar_70 = WaypointFromName("FON_Target02")
	Gvar_71 = WaypointFromName("FON_Target03")
	Gvar_72 = WaypointFromName("FON_Target04")
	Gvar_73 = WaypointFromName("FON_Target05")
	Gvar_74 = WaypointFromName("SpikeTrapAudioOrigin")
	ApplyEnchant(Gvar_62,"ENCHANT_INVULNERABLE",0)
	if true then return end
end
function StartFONSetpiece()
	DisableObject(Trigger)
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	MonsterIdle(GetHostPlayer())
	BearAttack()
	if true then return end
end
function BearDie()
	WaitFrames(60,63)
	if true then return end
end
function BearInjured()
	DamageObject(Trigger,0,300,0)
	if true then return end
end
function FireFONTrap02()
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_59,GetWaypointX(Gvar_71),GetWaypointY(Gvar_71))
	ApplySpellObjXY("SPELL_FORCE_OF_NATURE",Gvar_60,GetWaypointX(Gvar_72),GetWaypointY(Gvar_72))
	if true then return end
end
function EnableSpikeTrap()
	EnableObjectGroup(Gvar_68)
	AudioEvent("FloorSpikesUp",Gvar_74)
	LockDoor(Gvar_63)
	LockDoor(Gvar_64)
	LockDoor(Gvar_65)
	LockDoor(Gvar_66)
	EnableObject(Gvar_67)
	if true then return end
end
function DisableSpikeTrap()
	DisableObjectGroup(Gvar_68)
	AudioEvent("FloorSpikesDown",Gvar_74)
	UnlockDoor(Gvar_63)
	UnlockDoor(Gvar_64)
	UnlockDoor(Gvar_65)
	UnlockDoor(Gvar_66)
	DisableObject(Gvar_67)
	if true then return end
end
function InitializeSummoningCircles()
	var_0 = 0
	::l6::
	if not var_0 < 21 then 
		goto l43
	end
	Gvar_86[var_0] = true
	Gvar_85[var_0] = 0
	var_0 = var_0 + 1
	goto l6
	::l43::
	Gvar_88[0] = "UrchinShaman"
	Gvar_88[1] = "Mimic"
	Gvar_88[2] = "Bear"
	Gvar_88[3] = "Urchin"
	Gvar_88[4] = "Imp"
	Gvar_88[5] = "WhiteWolf"
	Gvar_76 = ObjFromName("SummoningCircleTreasureLight")
	Gvar_77[0] = ObjFromName("SummoningCircleTreasure01")
	Gvar_77[1] = ObjFromName("SummoningCircleTreasure02")
	Gvar_77[2] = ObjFromName("SummoningCircleTreasure03")
	Gvar_77[3] = ObjFromName("SummoningCircleTreasure04")
	Gvar_77[4] = ObjFromName("SummoningCircleTreasure05")
	Gvar_77[5] = ObjFromName("SummoningCircleTreasure06")
	Gvar_77[6] = ObjFromName("SummoningCircleTreasure07")
	Gvar_77[7] = ObjFromName("SummoningCircleTreasure08")
	Gvar_77[8] = ObjFromName("SummoningCircleTreasure09")
	Gvar_77[9] = ObjFromName("SummoningCircleTreasure10")
	Gvar_77[10] = ObjFromName("SummoningCircleTreasure11")
	Gvar_77[11] = ObjFromName("SummoningCircleTreasure12")
	Gvar_77[12] = ObjFromName("SummoningCircleTreasure13")
	Gvar_77[13] = ObjFromName("SummoningCircleTreasure14")
	Gvar_77[14] = ObjFromName("SummoningCircleTreasure15")
	Gvar_87[0] = WaypointFromName("SummoningCircle01WP")
	Gvar_87[1] = WaypointFromName("SummoningCircle02WP")
	Gvar_87[2] = WaypointFromName("SummoningCircle03WP")
	Gvar_87[3] = WaypointFromName("SummoningCircle04WP")
	Gvar_87[4] = WaypointFromName("SummoningCircle05WP")
	Gvar_87[5] = WaypointFromName("SummoningCircle06WP")
	Gvar_87[6] = WaypointFromName("SummoningCircle07WP")
	Gvar_87[7] = WaypointFromName("SummoningCircle08WP")
	Gvar_87[8] = WaypointFromName("SummoningCircle09WP")
	Gvar_87[9] = WaypointFromName("SummoningCircle10WP")
	Gvar_87[10] = WaypointFromName("SummoningCircle11WP")
	Gvar_87[11] = WaypointFromName("SummoningCircle12WP")
	Gvar_87[12] = WaypointFromName("SummoningCircle13WP")
	Gvar_87[13] = WaypointFromName("SummoningCircle14WP")
	Gvar_87[14] = WaypointFromName("SummoningCircle15WP")
	Gvar_87[15] = WaypointFromName("SummoningCircle16WP")
	Gvar_87[16] = WaypointFromName("SummoningCircle17WP")
	Gvar_87[17] = WaypointFromName("SummoningCircle18WP")
	Gvar_87[18] = WaypointFromName("SummoningCircle19WP")
	Gvar_87[19] = WaypointFromName("SummoningCircle20WP")
	Gvar_87[20] = WaypointFromName("SummoningCircle21WP")
	Gvar_78[0] = ObjGroupFromName("SummonCircle01Lights")
	Gvar_78[1] = ObjGroupFromName("SummonCircle02Lights")
	Gvar_78[2] = ObjGroupFromName("SummonCircle03Lights")
	Gvar_78[3] = ObjGroupFromName("SummonCircle04Lights")
	Gvar_78[4] = ObjGroupFromName("SummonCircle05Lights")
	Gvar_78[5] = ObjGroupFromName("SummonCircle06Lights")
	Gvar_78[6] = ObjGroupFromName("SummonCircle07Lights")
	Gvar_78[7] = ObjGroupFromName("SummonCircle08Lights")
	Gvar_78[8] = ObjGroupFromName("SummonCircle09Lights")
	Gvar_78[9] = ObjGroupFromName("SummonCircle10Lights")
	Gvar_78[10] = ObjGroupFromName("SummonCircle11Lights")
	Gvar_78[11] = ObjGroupFromName("SummonCircle12Lights")
	Gvar_78[12] = ObjGroupFromName("SummonCircle13Lights")
	Gvar_78[13] = ObjGroupFromName("SummonCircle14Lights")
	Gvar_78[14] = ObjGroupFromName("SummonCircle15Lights")
	Gvar_78[15] = ObjGroupFromName("SummonCircle16Lights")
	Gvar_78[16] = ObjGroupFromName("SummonCircle17Lights")
	Gvar_78[17] = ObjGroupFromName("SummonCircle18Lights")
	Gvar_78[18] = ObjGroupFromName("SummonCircle19Lights")
	Gvar_78[19] = ObjGroupFromName("SummonCircle20Lights")
	Gvar_78[20] = ObjGroupFromName("SummonCircle21Lights")
	if true then return end
end
function MapInitialize()
	Gvar_45 = ObjFromName("StoneBlock01")
	Gvar_46 = ObjFromName("StoneBlock02")
	Gvar_47 = ObjFromName("StoneBlock03")
	Gvar_11 = ObjFromName("Beholder01")
	Gvar_12 = ObjFromName("Beholder02")
	Gvar_13 = ObjFromName("Beholder03")
	Gvar_14 = ObjFromName("Beholder04")
	Gvar_15 = ObjFromName("Beholder05")
	Gvar_16 = ObjFromName("Beholder06")
	Gvar_17 = ObjFromName("Beholder07")
	Gvar_18 = ObjFromName("Beholder08")
	Gvar_19 = ObjFromName("Beholder09")
	Gvar_20 = ObjFromName("Beholder10")
	Gvar_21 = ObjFromName("Beholder11")
	Gvar_22 = ObjFromName("Beholder12")
	Gvar_23 = ObjFromName("Beholder13")
	Gvar_24 = ObjFromName("Beholder14")
	Gvar_54 = ObjFromName("CageGateL")
	Gvar_55 = ObjFromName("CageGateR")
	Gvar_4 = ObjFromName("UltimateArrowTrapSwitch")
	Gvar_9 = WaypointFromName("ArrowTrapAudioOrigin")
	Gvar_67 = ObjFromName("SpikeSFX")
	Gvar_48 = WaypointFromName("StoneBlock01WP")
	Gvar_49 = WaypointFromName("StoneBlock02WP")
	Gvar_50 = WaypointFromName("StoneBlock02WP2")
	Gvar_51 = WaypointFromName("StoneBlock03WP")
	Gvar_52 = WaypointFromName("StoneBlockAudioOrigin")
	Gvar_25 = WaypointFromName("BomberCreationWP")
	Gvar_26 = WaypointFromName("BomberAudioOrigin")
	Gvar_75 = WaypointFromName("SecretAudioOrigin")
	Gvar_5 = ObjGroupFromName("ArrowTrapGroup01")
	Gvar_6 = ObjGroupFromName("ArrowTrapGroup02")
	Gvar_7 = ObjGroupFromName("ArrowTrapGroup03")
	Gvar_8 = ObjGroupFromName("ArrowTrapGroup04")
	Gvar_56 = WallGroupFromName("CageWalls")
	MonsterGoRoam(Gvar_11)
	MonsterGoRoam(Gvar_12)
	MonsterGoRoam(Gvar_13)
	MonsterSetAggressiveness(Gvar_13,0.83)
	MonsterGoRoam(Gvar_14)
	MonsterSetAggressiveness(Gvar_14,0.83)
	MonsterGoRoam(Gvar_15)
	MonsterSetAggressiveness(Gvar_15,0.83)
	MonsterGoRoam(Gvar_16)
	MonsterSetAggressiveness(Gvar_16,0.83)
	MonsterGoRoam(Gvar_17)
	MonsterSetAggressiveness(Gvar_17,0.83)
	MonsterGoRoam(Gvar_18)
	MonsterSetAggressiveness(Gvar_18,0.83)
	MonsterGoRoam(Gvar_19)
	MonsterSetAggressiveness(Gvar_19,0.83)
	MonsterGoRoam(Gvar_20)
	MonsterSetAggressiveness(Gvar_20,0.83)
	MonsterGoRoam(Gvar_21)
	MonsterSetAggressiveness(Gvar_21,0.83)
	MonsterGoRoam(Gvar_22)
	MonsterSetAggressiveness(Gvar_22,0.83)
	LockDoor(Gvar_54)
	LockDoor(Gvar_55)
	InitializeBeholders()
	InitializeSummoningCircles()
	InitializeFONtraps()
	if true then return end
end
function OpenPitElevatorWall()
	DisableObject(Trigger)
	OpenSecretWall(GetWallAt(56,134))
	if true then return end
end
function MonstersGoHome()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function SecretSFX()
	TeleportWaypoint(Gvar_75,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_75)
	if true then return end
end
function BoulderSecretFound()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),200)
	SecretSFX()
	if true then return end
end
function OpenBoulderSecret()
	DisableObject(Trigger)
	OpenSecretWall(GetWallAt(104,40))
	AudioEvent("SecretWallOpen",WaypointFromName("BoulderSecretAudioOrigin"))
	SecretSFX()
	if true then return end
end
function SecretFound()
	DisableObject(Trigger)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),100)
	SecretSFX()
	if true then return end
end
function ResetSummonCircle(arg_0)
	Gvar_86[arg_0] = true
	EnableObjectGroup(Gvar_78[arg_0])
	if true then return end
end
function SummoningCircleCleared(arg_0)
	Gvar_84 = Gvar_84 + 1
	if not Gvar_84 == 15 then 
		goto l116
	end
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),500)
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]),0,0)
	TeleportObj(Gvar_76,GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]))
	TeleportObj(Gvar_77[Gvar_84 - 1],GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]))
	AudioEvent("SmallGong",Gvar_87[arg_0])
	goto l206
	::l116::
	PlayFX("BLUE_SPARKS",GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]),0,0)
	TeleportObj(Gvar_76,GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]))
	TeleportObj(Gvar_77[Gvar_84 - 1],GetWaypointX(Gvar_87[arg_0]),GetWaypointY(Gvar_87[arg_0]))
	AudioEvent("BigGong",Gvar_87[arg_0])
	::l206::
	if true then return end
end
function SummonCircle01Activate()
	Gvar_79 = 0
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle02Activate()
	Gvar_79 = 1
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle03Activate()
	Gvar_79 = 2
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle04Activate()
	Gvar_79 = 3
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle05Activate()
	Gvar_79 = 4
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle06Activate()
	Gvar_79 = 5
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle07Activate()
	Gvar_79 = 6
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle08Activate()
	Gvar_79 = 7
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle09Activate()
	Gvar_79 = 8
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle10Activate()
	Gvar_79 = 9
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle11Activate()
	Gvar_79 = 10
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle12Activate()
	Gvar_79 = 11
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle13Activate()
	Gvar_79 = 12
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle14Activate()
	Gvar_79 = 13
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle15Activate()
	Gvar_79 = 14
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle16Activate()
	Gvar_79 = 15
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle17Activate()
	Gvar_79 = 16
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle18Activate()
	Gvar_79 = 17
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle19Activate()
	Gvar_79 = 18
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle20Activate()
	Gvar_79 = 19
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end
function SummonCircle21Activate()
	Gvar_79 = 20
	if not ObjIsCaller(GetHostPlayer()) and Gvar_86[Gvar_79] == true then 
		goto l238
	end
	Gvar_86[Gvar_79] = false
	DisableObjectGroup(Gvar_78[Gvar_79])
	AudioEvent("SummonCast",Gvar_87[Gvar_79])
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_87[Gvar_79]),GetWaypointY(Gvar_87[Gvar_79]),0,0)
	if not RandomInteger(0,100) <= Gvar_82 then 
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
	var_0 = SpawnObject("BomberYellow",Gvar_87[Gvar_79])
	MonsterTrapSpells(var_0,"SPELL_METEOR","NULL","NULL")
	goto l166
	::l149::
	var_0 = SpawnObject("Bomber",Gvar_87[Gvar_79])
	goto l166
	::l166::
	goto l194
	::l168::
	Gvar_81 = RandomInteger(0,5)
	SpawnObject(Gvar_88[Gvar_81],Gvar_87[Gvar_79])
	::l194::
	Gvar_85[Gvar_79] = Gvar_85[Gvar_79] + 1
	if not Gvar_85[Gvar_79] > Gvar_80 then 
		goto l228
	end
	WaitSpecial(30,Gvar_79,81)
	goto l238
	::l228::
	WaitSpecial(Gvar_83,Gvar_79,80)
	::l238::
	if true then return end
end