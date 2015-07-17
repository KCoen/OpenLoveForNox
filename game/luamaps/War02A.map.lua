
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_5 = true
	Gvar_6 = false
	Gvar_11 = true
	Gvar_12 = true
	Gvar_90 = 0
	Gvar_99 = 0
	Gvar_100 = 1
	Gvar_101 = 2
	Gvar_102 = 3
	Gvar_103 = 0
	Gvar_104 = 1
	Gvar_105 = 2
	Gvar_106 = 3
	Gvar_107 = 0
	Gvar_108 = 1
	Gvar_109 = 2
	Gvar_110 = 3
	Gvar_111 = 0
	Gvar_112 = 1
	Gvar_113 = 2
	Gvar_114 = 3
	Gvar_115 = 0
	Gvar_116 = 1
	Gvar_117 = 2
	Gvar_118 = 3
	Gvar_119 = 0
	Gvar_120 = 1
	Gvar_121 = 2
	Gvar_122 = 3
	Gvar_123 = 0
	Gvar_124 = 1
	Gvar_125 = 2
	Gvar_126 = 3
	Gvar_127 = 0
	Gvar_128 = 1
	Gvar_129 = 2
	Gvar_130 = 3
	Gvar_131 = 0
	Gvar_132 = 1
	Gvar_133 = 2
	Gvar_134 = 3
	Gvar_135 = 0
	Gvar_136 = 1
	Gvar_137 = 2
	Gvar_138 = 3
	Gvar_139 = true
	Gvar_140 = true
	Gvar_141 = true
	Gvar_142 = true
	Gvar_143 = true
	Gvar_144 = true
	Gvar_145 = true
	Gvar_146 = true
	Gvar_147 = true
	Gvar_148 = true
	Gvar_149 = true
	Gvar_166 = Gvar_100
	Gvar_167 = Gvar_104
	Gvar_168 = Gvar_108
	Gvar_169 = Gvar_112
	Gvar_170 = Gvar_116
	Gvar_171 = Gvar_120
	Gvar_172 = Gvar_124
	Gvar_173 = Gvar_128
	Gvar_174 = Gvar_132
	Gvar_175 = Gvar_136
	Gvar_176 = Gvar_99
	Gvar_177 = Gvar_103
	Gvar_178 = Gvar_107
	Gvar_179 = Gvar_111
	Gvar_180 = Gvar_115
	Gvar_181 = Gvar_119
	Gvar_182 = Gvar_123
	Gvar_183 = Gvar_127
	Gvar_184 = Gvar_131
	Gvar_185 = Gvar_135
	Gvar_206 = 0
	Gvar_215 = true
	Gvar_216 = true
	Gvar_219 = 0
	Gvar_229 = 0
	Gvar_237 = true
	Gvar_238 = false
	Gvar_282 = false
	if true then return end
end
function secretTrigger()
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_55)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),150)
	if true then return end
end
function PlayGauntletMusic()
	PlayMusic(29,100)
	if true then return end
end
function initGauntletDoor()
	Gvar_14 = ObjGroupFromName("GauntletGears")
	DisableObjectGroup(Gvar_14)
	Gvar_13 = ObjGroupFromName("GauntletDoorMovers")
	Gvar_16 = ObjFromName("B1mover")
	Gvar_17 = ObjFromName("B2mover")
	Gvar_18 = ObjFromName("B3mover")
	Gvar_19 = ObjFromName("B4mover")
	Gvar_20 = ObjFromName("B5mover")
	Gvar_21 = ObjFromName("B6mover")
	Gvar_22 = ObjFromName("B7mover")
	Gvar_23 = ObjFromName("B8mover")
	Gvar_24 = ObjFromName("B9mover")
	Gvar_25 = ObjFromName("B10mover")
	Gvar_26 = ObjFromName("F1mover")
	Gvar_27 = ObjFromName("F2mover")
	Gvar_28 = ObjFromName("F3mover")
	Gvar_29 = ObjFromName("F4mover")
	Gvar_30 = ObjFromName("F5mover")
	Gvar_31 = ObjFromName("F6mover")
	Gvar_32 = ObjFromName("F7mover")
	Gvar_33 = ObjFromName("F8mover")
	Gvar_34 = ObjFromName("F9mover")
	Gvar_35 = ObjFromName("F10mover")
	Gvar_56 = WaypointFromName("B1way")
	Gvar_57 = WaypointFromName("B2way")
	Gvar_58 = WaypointFromName("B3way")
	Gvar_59 = WaypointFromName("B4way")
	Gvar_60 = WaypointFromName("B5way")
	Gvar_61 = WaypointFromName("B6way")
	Gvar_62 = WaypointFromName("B7way")
	Gvar_63 = WaypointFromName("B8way")
	Gvar_64 = WaypointFromName("B9way")
	Gvar_65 = WaypointFromName("B10way")
	Gvar_66 = WaypointFromName("B11way")
	Gvar_67 = WaypointFromName("B12way")
	Gvar_68 = WaypointFromName("B13way")
	Gvar_69 = WaypointFromName("F1way")
	Gvar_70 = WaypointFromName("F2way")
	Gvar_71 = WaypointFromName("F3way")
	Gvar_72 = WaypointFromName("F4way")
	Gvar_73 = WaypointFromName("F5way")
	Gvar_74 = WaypointFromName("F6way")
	Gvar_75 = WaypointFromName("F7way")
	Gvar_76 = WaypointFromName("F8way")
	Gvar_77 = WaypointFromName("F9way")
	Gvar_78 = WaypointFromName("F10way")
	Gvar_79 = WaypointFromName("F11way")
	Gvar_80 = WaypointFromName("F12way")
	Gvar_81 = WaypointFromName("F13way")
	DisableObjectGroup(Gvar_233)
	LockDoor(Gvar_283)
	LockDoor(Gvar_284)
	if true then return end
end
function gauntletGearsStop()
	DisableObjectGroup(Gvar_14)
	if true then return end
end
function openGauntlet()
	if not (Gvar_6 == 0) then 
		goto l195
	end
	Gvar_6 = true
	EnableObjectGroup(Gvar_14)
	WaitFrames(75,5)
	EnableObjectGroup(Gvar_13)
	MoveTo(Gvar_16,Gvar_56)
	MoveTo(Gvar_17,Gvar_57)
	MoveTo(Gvar_18,Gvar_58)
	MoveTo(Gvar_19,Gvar_59)
	MoveTo(Gvar_20,Gvar_60)
	MoveTo(Gvar_21,Gvar_61)
	MoveTo(Gvar_22,Gvar_63)
	MoveTo(Gvar_23,Gvar_64)
	MoveTo(Gvar_24,Gvar_65)
	MoveTo(Gvar_25,Gvar_66)
	MoveTo(Gvar_26,Gvar_71)
	MoveTo(Gvar_27,Gvar_72)
	MoveTo(Gvar_28,Gvar_73)
	MoveTo(Gvar_29,Gvar_74)
	MoveTo(Gvar_30,Gvar_76)
	MoveTo(Gvar_31,Gvar_77)
	MoveTo(Gvar_32,Gvar_78)
	MoveTo(Gvar_33,Gvar_79)
	MoveTo(Gvar_34,Gvar_80)
	MoveTo(Gvar_35,Gvar_81)
	WaitFrames(3,8)
	::l195::
	if true then return end
end
function closeGauntlet()
	if not (Gvar_6) then 
		goto l189
	end
	Gvar_6 = false
	EnableObjectGroup(Gvar_14)
	WaitFrames(75,5)
	MoveTo(Gvar_16,Gvar_58)
	MoveTo(Gvar_17,Gvar_59)
	MoveTo(Gvar_18,Gvar_60)
	MoveTo(Gvar_19,Gvar_61)
	MoveTo(Gvar_20,Gvar_62)
	MoveTo(Gvar_21,Gvar_63)
	MoveTo(Gvar_22,Gvar_65)
	MoveTo(Gvar_23,Gvar_66)
	MoveTo(Gvar_24,Gvar_67)
	MoveTo(Gvar_25,Gvar_68)
	MoveTo(Gvar_26,Gvar_69)
	MoveTo(Gvar_27,Gvar_70)
	MoveTo(Gvar_28,Gvar_71)
	MoveTo(Gvar_29,Gvar_72)
	MoveTo(Gvar_30,Gvar_74)
	MoveTo(Gvar_31,Gvar_75)
	MoveTo(Gvar_32,Gvar_76)
	MoveTo(Gvar_33,Gvar_77)
	MoveTo(Gvar_34,Gvar_78)
	MoveTo(Gvar_35,Gvar_79)
	WaitFrames(10,8)
	::l189::
	if true then return end
end
function stoneGrinder()
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("BoulderMove",Gvar_55)
	AudioEvent("SecretWallStoneOpen",Gvar_69)
	AudioEvent("BoulderMove",Gvar_70)
	AudioEvent("SecretWallStoneOpen",Gvar_71)
	AudioEvent("BoulderMove",Gvar_72)
	AudioEvent("SecretWallStoneOpen",Gvar_73)
	AudioEvent("BoulderMove",Gvar_74)
	AudioEvent("SecretWallStoneOpen",Gvar_75)
	AudioEvent("BoulderMove",Gvar_76)
	AudioEvent("SecretWallStoneOpen",Gvar_77)
	AudioEvent("BoulderMove",Gvar_78)
	AudioEvent("SecretWallStoneOpen",Gvar_79)
	if true then return end
end
function openingGauntletPiece()
	PlayGauntletMusic()
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	ObjLookAtObj(GetHostPlayer(),Gvar_42)
	MonsterGuardArea(Gvar_42,4982,5036,GetObjX(Gvar_44),GetObjY(Gvar_44),0)
	SetupDialog(Gvar_42,"NEXT",16,17)
	ForceDialog(Gvar_42,GetHostPlayer())
	if true then return end
end
function realHorrendousTalk1Start()
	MonsterGuardArea(Gvar_44,4991,4991,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	StartDialogWithCaller("DemonRecognize","War02A.scr:RealTalk1Start")
	JournalAddEntry(GetHostPlayer(),"War2Gauntlet",2)
	if true then return end
end
function realHorrendousTalk1End()
	SetupDialog(Gvar_44,"FALSE",12,13)
	MonsterGuardArea(Gvar_44,5071,4979,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_42,4980,5059,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_7,4922,5014,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_8,5014,4922,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function realHorrendousTalk2Start()
	StartDialogWithCaller("DemonRecognize","War02A.scr:RealTalk2Start")
	if true then return end
end
function realHorrendousTalk2End()
	SetupDialog(Gvar_44,"FALSE",14,15)
	if true then return end
end
function realHorrendousTalk3Start()
	StartDialogWithCaller("DemonRecognize","War02A.scr:RealTalk3Start")
	if true then return end
end
function realHorrendousTalk3End()
	CancelDialog(Gvar_44)
	if true then return end
end
function guardTalk2Start()
	StartDialogWithCaller("SwordsmanRecognize","War02A.scr:GuardSay1Start")
	if true then return end
end
function guardTalk2End()
	CancelDialog(Gvar_42)
	SetupDialog(Gvar_44,"FALSE",10,11)
	ForceDialog(Gvar_44,GetHostPlayer())
	if true then return end
end
function horrendousTalk1Start()
	StartDialogWithCaller("DemonRecognize","War02A.scr:HorrendousTalk1Start")
	if true then return end
end
function horrendousTalk1End()
	CancelDialog(Gvar_43)
	ObjLookAtObj(Gvar_43,Gvar_45)
	ObjFreeze(GetHostPlayer(),false)
	CinematicBorders(false)
	WaitFrames(5,20)
	if true then return end
end
function chickenShirtTalk1Start()
	SayChat(Gvar_47,"War02A.scr:ChickenTalk1Start")
	WaitFrames(120,22)
	if true then return end
end
function horrendousSay1()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l69
	end
	if not (Gvar_11) then 
		goto l69
	end
	PlayMusic(0,100)
	EnableObjectGroup(Gvar_15)
	Gvar_11 = false
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	LockDoor(Gvar_50)
	LockDoor(Gvar_51)
	SetupDialog(Gvar_43,"FALSE",18,19)
	ForceDialog(Gvar_43,GetHostPlayer())
	::l69::
	if true then return end
end
function redShirtRunGauntlet()
	AudioEvent("SwordsmanHurt",Gvar_89)
	SayChat(Gvar_45,"War02A.scr:RedShirtRunGauntlet")
	WaitFrames(70,23)
	if true then return end
end
function redShirtDies()
	AudioEvent("BerserkerChargeInvoke",Gvar_88)
	MonsterGoRoam(Gvar_45)
	if true then return end
end
function bonesFly()
	AudioEvent("HammerMissing",Gvar_89)
	AudioEvent("GolemHitting",Gvar_89)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	AudioEvent("EmberDemonDie",Gvar_88)
	AudioEvent("SkeletonDie",Gvar_89)
	Gvar_4 = 0
	::l50::
	if not (Gvar_4 < 40) then 
		goto l97
	end
	Gvar_54[Gvar_4] = SpawnObject("ArmBone",Gvar_88)
	PushObject(Gvar_54[Gvar_4],-150,1880,3553)
	Gvar_4 = Gvar_4 + 1
	goto l50
	::l97::
	Gvar_4 = 0
	::l103::
	if not (Gvar_4 < 40) then 
		goto l150
	end
	Gvar_54[Gvar_4] = SpawnObject("LegBone",Gvar_88)
	PushObject(Gvar_54[Gvar_4],-150,1880,3553)
	Gvar_4 = Gvar_4 + 1
	goto l103
	::l150::
	WaitFrames(30,28)
	WaitFrames(10,25)
	if true then return end
end
function deadHead()
	DeleteObject(Gvar_45)
	AudioEvent("MechGolemHit",Gvar_86)
	AudioEvent("SpikesDown",Gvar_87)
	AudioEvent("SkeletonDie",Gvar_89)
	TeleportObj(Gvar_46,1692,3627)
	PushObject(Gvar_46,-150,1880,3553)
	SetupDialog(Gvar_46,"NORMAL",26,27)
	WaitFrames(40,28)
	if true then return end
end
function deadTalk1Start()
	StartDialogWithCaller("EmberDemonDies","War02a:RedShirtDead")
	if true then return end
end
function deadTalk1End()
	CancelDialog(Gvar_46)
	if true then return end
end
function chickenShirtRuns()
	SayChat(Gvar_47,"War02A.scr:ChickenShirtRuns")
	chickenShirtCries1()
	MonsterGuardArea(Gvar_47,2033,3833,2035,3905,0)
	CancelDialog(Gvar_47)
	SetupDialog(Gvar_47,"NORMAL",30,31)
	WaitFrames(45,32)
	if true then return end
end
function chickenShirtCries1()
	AudioEvent("UrchinRecognize",Gvar_85)
	if true then return end
end
function chickenTalk1Start()
	StartDialogWithCaller("UrchinRecognize","War02A.scr:ChickenShirtRuns")
	if true then return end
end
function chickenTalk1End()
	SetupDialog(Gvar_47,"NORMAL",30,31)
	if true then return end
end
function horrendousSay2()
	PlayMusic(29,100)
	DisableObjectGroup(Gvar_15)
	SayChat(Gvar_43,"War02A.scr:HorrendousSay2")
	UnlockDoor(Gvar_52)
	if true then return end
end
function blockBash()
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("HammerMissing",Gvar_55)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	if true then return end
end
function blockSmash1()
	EnableObject(Gvar_36)
	EnableObject(Gvar_37)
	if true then return end
end
function blockSmash2()
	EnableObject(Gvar_38)
	EnableObject(Gvar_39)
	if true then return end
end
function blockSmash3()
	EnableObject(Gvar_40)
	EnableObject(Gvar_41)
	if true then return end
end
function releaseUrchins1()
	OpenSecretWallGroup(Gvar_98)
	LockDoor(Gvar_93)
	LockDoor(Gvar_94)
	EnableObject(Gvar_91)
	EnableObject(Gvar_92)
	DisableObject(Gvar_97)
	if true then return end
end
function twoDeadUrchins()
	if not (Gvar_90 > 1) then 
		goto l18
	end
	UnlockDoor(Gvar_95)
	UnlockDoor(Gvar_96)
	::l18::
	if true then return end
end
function flamesOn()
	if not (Gvar_139) then 
		goto l275
	end
	Gvar_4 = 0
	::l11::
	if not (Gvar_4 < 8) then 
		goto l127
	end
	Gvar_186[Gvar_4] = 0
	Gvar_187[Gvar_4] = 0
	Gvar_188[Gvar_4] = 0
	Gvar_189[Gvar_4] = 0
	Gvar_190[Gvar_4] = 0
	Gvar_191[Gvar_4] = 0
	Gvar_192[Gvar_4] = 0
	Gvar_193[Gvar_4] = 0
	Gvar_194[Gvar_4] = 0
	Gvar_195[Gvar_4] = 0
	Gvar_4 = Gvar_4 + 1
	goto l11
	::l127::
	Gvar_139 = false
	Gvar_140 = true
	Gvar_141 = true
	Gvar_142 = true
	Gvar_143 = true
	Gvar_144 = true
	Gvar_145 = true
	Gvar_146 = true
	Gvar_147 = true
	Gvar_148 = true
	Gvar_149 = true
	flameWalk()
	WaitFrames(4,42)
	WaitFrames(8,43)
	WaitFrames(12,44)
	WaitFrames(16,45)
	WaitFrames(20,46)
	WaitFrames(24,47)
	WaitFrames(28,48)
	WaitFrames(32,49)
	WaitFrames(36,50)
	LockDoor(Gvar_52)
	LockDoor(Gvar_48)
	LockDoor(Gvar_49)
	::l275::
	if true then return end
end
function flamesOff()
	Gvar_140 = false
	Gvar_141 = false
	Gvar_142 = false
	Gvar_143 = false
	Gvar_144 = false
	Gvar_145 = false
	Gvar_146 = false
	Gvar_147 = false
	Gvar_148 = false
	Gvar_149 = false
	if true then return end
end
function flameWalk()
	var_0 = Gvar_166
	if (var_0 == Gvar_99) then 
		goto l45
	end
	if (var_0 == Gvar_100) then 
		goto l108
	end
	if (var_0 == Gvar_101) then 
		goto l208
	end
	if (var_0 == Gvar_102) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_4 = 0
	::l51::
	if not (Gvar_4 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_186[Gvar_4])
	Gvar_186[Gvar_4] = 0
	Gvar_4 = Gvar_4 + 1
	goto l51
	::l86::
	Gvar_166 = Gvar_100
	Gvar_176 = Gvar_99
	Gvar_156 = 60
	goto l390
	::l108::
	Gvar_4 = 0
	::l114::
	if not (Gvar_4 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_186[Gvar_4])
	Gvar_186[Gvar_4] = SpawnObject("SmallFlame",Gvar_196[Gvar_4])
	Gvar_4 = Gvar_4 + 1
	goto l114
	::l158::
	if not (Gvar_176 == Gvar_99) then 
		goto l186
	end
	Gvar_166 = Gvar_101
	AudioEvent("FireballCast",Gvar_196[4])
	goto l193
	::l186::
	Gvar_166 = Gvar_99
	::l193::
	Gvar_176 = Gvar_100
	Gvar_156 = 2
	goto l390
	::l208::
	Gvar_4 = 0
	::l214::
	if not (Gvar_4 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_186[Gvar_4])
	Gvar_186[Gvar_4] = SpawnObject("MediumFlame",Gvar_196[Gvar_4])
	Gvar_4 = Gvar_4 + 1
	goto l214
	::l258::
	if not (Gvar_176 == Gvar_100) then 
		goto l286
	end
	Gvar_166 = Gvar_102
	AudioEvent("DemonBreath",Gvar_196[5])
	goto l303
	::l286::
	Gvar_166 = Gvar_100
	AudioEvent("FireExtinguish",Gvar_196[4])
	::l303::
	Gvar_176 = Gvar_101
	Gvar_156 = 2
	goto l390
	::l318::
	Gvar_4 = 0
	::l324::
	if not (Gvar_4 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_186[Gvar_4])
	Gvar_186[Gvar_4] = SpawnObject("Flame",Gvar_196[Gvar_4])
	Gvar_4 = Gvar_4 + 1
	goto l324
	::l368::
	Gvar_166 = Gvar_101
	Gvar_176 = Gvar_102
	Gvar_156 = 12
	goto l390
	::l390::
	if not (Gvar_140) then 
		goto l404
	end
	WaitFrames(Gvar_156,41)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_186[Gvar_154])
	Gvar_186[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk2()
	var_0 = Gvar_167
	if (var_0 == Gvar_103) then 
		goto l45
	end
	if (var_0 == Gvar_104) then 
		goto l108
	end
	if (var_0 == Gvar_105) then 
		goto l208
	end
	if (var_0 == Gvar_106) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_150 = 0
	::l51::
	if not (Gvar_150 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_187[Gvar_150])
	Gvar_187[Gvar_150] = 0
	Gvar_150 = Gvar_150 + 1
	goto l51
	::l86::
	Gvar_167 = Gvar_104
	Gvar_177 = Gvar_103
	Gvar_157 = 60
	goto l390
	::l108::
	Gvar_150 = 0
	::l114::
	if not (Gvar_150 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_187[Gvar_150])
	Gvar_187[Gvar_150] = SpawnObject("SmallFlame",Gvar_197[Gvar_150])
	Gvar_150 = Gvar_150 + 1
	goto l114
	::l158::
	if not (Gvar_177 == Gvar_103) then 
		goto l186
	end
	Gvar_167 = Gvar_105
	AudioEvent("FireballCast",Gvar_197[4])
	goto l193
	::l186::
	Gvar_167 = Gvar_103
	::l193::
	Gvar_177 = Gvar_104
	Gvar_157 = 2
	goto l390
	::l208::
	Gvar_150 = 0
	::l214::
	if not (Gvar_150 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_187[Gvar_150])
	Gvar_187[Gvar_150] = SpawnObject("MediumFlame",Gvar_197[Gvar_150])
	Gvar_150 = Gvar_150 + 1
	goto l214
	::l258::
	if not (Gvar_177 == Gvar_104) then 
		goto l286
	end
	Gvar_167 = Gvar_106
	AudioEvent("DemonBreath",Gvar_197[5])
	goto l303
	::l286::
	Gvar_167 = Gvar_104
	AudioEvent("FireExtinguish",Gvar_197[4])
	::l303::
	Gvar_177 = Gvar_105
	Gvar_157 = 2
	goto l390
	::l318::
	Gvar_150 = 0
	::l324::
	if not (Gvar_150 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_187[Gvar_150])
	Gvar_187[Gvar_150] = SpawnObject("Flame",Gvar_197[Gvar_150])
	Gvar_150 = Gvar_150 + 1
	goto l324
	::l368::
	Gvar_167 = Gvar_105
	Gvar_177 = Gvar_106
	Gvar_157 = 12
	goto l390
	::l390::
	if not (Gvar_141) then 
		goto l404
	end
	WaitFrames(Gvar_157,42)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_187[Gvar_154])
	Gvar_187[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk3()
	var_0 = Gvar_168
	if (var_0 == Gvar_107) then 
		goto l45
	end
	if (var_0 == Gvar_108) then 
		goto l108
	end
	if (var_0 == Gvar_109) then 
		goto l208
	end
	if (var_0 == Gvar_110) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_151 = 0
	::l51::
	if not (Gvar_151 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_188[Gvar_151])
	Gvar_188[Gvar_151] = 0
	Gvar_151 = Gvar_151 + 1
	goto l51
	::l86::
	Gvar_168 = Gvar_108
	Gvar_178 = Gvar_107
	Gvar_158 = 60
	goto l390
	::l108::
	Gvar_151 = 0
	::l114::
	if not (Gvar_151 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_188[Gvar_151])
	Gvar_188[Gvar_151] = SpawnObject("SmallFlame",Gvar_198[Gvar_151])
	Gvar_151 = Gvar_151 + 1
	goto l114
	::l158::
	if not (Gvar_178 == Gvar_107) then 
		goto l186
	end
	Gvar_168 = Gvar_109
	AudioEvent("FireballCast",Gvar_198[4])
	goto l193
	::l186::
	Gvar_168 = Gvar_107
	::l193::
	Gvar_178 = Gvar_108
	Gvar_158 = 2
	goto l390
	::l208::
	Gvar_151 = 0
	::l214::
	if not (Gvar_151 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_188[Gvar_151])
	Gvar_188[Gvar_151] = SpawnObject("MediumFlame",Gvar_198[Gvar_151])
	Gvar_151 = Gvar_151 + 1
	goto l214
	::l258::
	if not (Gvar_178 == Gvar_108) then 
		goto l286
	end
	Gvar_168 = Gvar_110
	AudioEvent("DemonBreath",Gvar_198[5])
	goto l303
	::l286::
	Gvar_168 = Gvar_108
	AudioEvent("FireExtinguish",Gvar_198[4])
	::l303::
	Gvar_178 = Gvar_109
	Gvar_158 = 2
	goto l390
	::l318::
	Gvar_151 = 0
	::l324::
	if not (Gvar_151 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_188[Gvar_151])
	Gvar_188[Gvar_151] = SpawnObject("Flame",Gvar_198[Gvar_151])
	Gvar_151 = Gvar_151 + 1
	goto l324
	::l368::
	Gvar_168 = Gvar_109
	Gvar_178 = Gvar_110
	Gvar_158 = 12
	goto l390
	::l390::
	if not (Gvar_142) then 
		goto l404
	end
	WaitFrames(Gvar_158,43)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_188[Gvar_154])
	Gvar_188[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk4()
	var_0 = Gvar_169
	if (var_0 == Gvar_111) then 
		goto l45
	end
	if (var_0 == Gvar_112) then 
		goto l108
	end
	if (var_0 == Gvar_113) then 
		goto l208
	end
	if (var_0 == Gvar_114) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_152 = 0
	::l51::
	if not (Gvar_152 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_189[Gvar_152])
	Gvar_189[Gvar_152] = 0
	Gvar_152 = Gvar_152 + 1
	goto l51
	::l86::
	Gvar_169 = Gvar_112
	Gvar_179 = Gvar_111
	Gvar_159 = 60
	goto l390
	::l108::
	Gvar_152 = 0
	::l114::
	if not (Gvar_152 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_189[Gvar_152])
	Gvar_189[Gvar_152] = SpawnObject("SmallFlame",Gvar_199[Gvar_152])
	Gvar_152 = Gvar_152 + 1
	goto l114
	::l158::
	if not (Gvar_179 == Gvar_111) then 
		goto l186
	end
	Gvar_169 = Gvar_113
	AudioEvent("FireballCast",Gvar_199[4])
	goto l193
	::l186::
	Gvar_169 = Gvar_111
	::l193::
	Gvar_179 = Gvar_112
	Gvar_159 = 2
	goto l390
	::l208::
	Gvar_152 = 0
	::l214::
	if not (Gvar_152 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_189[Gvar_152])
	Gvar_189[Gvar_152] = SpawnObject("MediumFlame",Gvar_199[Gvar_152])
	Gvar_152 = Gvar_152 + 1
	goto l214
	::l258::
	if not (Gvar_179 == Gvar_112) then 
		goto l286
	end
	Gvar_169 = Gvar_114
	AudioEvent("DemonBreath",Gvar_199[5])
	goto l303
	::l286::
	Gvar_169 = Gvar_112
	AudioEvent("FireExtinguish",Gvar_199[4])
	::l303::
	Gvar_179 = Gvar_113
	Gvar_159 = 2
	goto l390
	::l318::
	Gvar_152 = 0
	::l324::
	if not (Gvar_152 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_189[Gvar_152])
	Gvar_189[Gvar_152] = SpawnObject("Flame",Gvar_199[Gvar_152])
	Gvar_152 = Gvar_152 + 1
	goto l324
	::l368::
	Gvar_169 = Gvar_113
	Gvar_179 = Gvar_114
	Gvar_159 = 12
	goto l390
	::l390::
	if not (Gvar_143) then 
		goto l404
	end
	WaitFrames(Gvar_159,44)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_189[Gvar_154])
	Gvar_189[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk5()
	var_0 = Gvar_170
	if (var_0 == Gvar_115) then 
		goto l45
	end
	if (var_0 == Gvar_116) then 
		goto l108
	end
	if (var_0 == Gvar_117) then 
		goto l208
	end
	if (var_0 == Gvar_118) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_153 = 0
	::l51::
	if not (Gvar_153 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_190[Gvar_153])
	Gvar_190[Gvar_153] = 0
	Gvar_153 = Gvar_153 + 1
	goto l51
	::l86::
	Gvar_170 = Gvar_116
	Gvar_180 = Gvar_115
	Gvar_160 = 60
	goto l390
	::l108::
	Gvar_153 = 0
	::l114::
	if not (Gvar_153 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_190[Gvar_153])
	Gvar_190[Gvar_153] = SpawnObject("SmallFlame",Gvar_200[Gvar_153])
	Gvar_153 = Gvar_153 + 1
	goto l114
	::l158::
	if not (Gvar_180 == Gvar_115) then 
		goto l186
	end
	Gvar_170 = Gvar_117
	AudioEvent("FireballCast",Gvar_200[4])
	goto l193
	::l186::
	Gvar_170 = Gvar_115
	::l193::
	Gvar_180 = Gvar_116
	Gvar_160 = 2
	goto l390
	::l208::
	Gvar_153 = 0
	::l214::
	if not (Gvar_153 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_190[Gvar_153])
	Gvar_190[Gvar_153] = SpawnObject("MediumFlame",Gvar_200[Gvar_153])
	Gvar_153 = Gvar_153 + 1
	goto l214
	::l258::
	if not (Gvar_180 == Gvar_116) then 
		goto l286
	end
	Gvar_170 = Gvar_118
	AudioEvent("DemonBreath",Gvar_200[5])
	goto l303
	::l286::
	Gvar_170 = Gvar_116
	AudioEvent("FireExtinguish",Gvar_200[4])
	::l303::
	Gvar_180 = Gvar_117
	Gvar_160 = 2
	goto l390
	::l318::
	Gvar_153 = 0
	::l324::
	if not (Gvar_153 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_190[Gvar_153])
	Gvar_190[Gvar_153] = SpawnObject("Flame",Gvar_200[Gvar_153])
	Gvar_153 = Gvar_153 + 1
	goto l324
	::l368::
	Gvar_170 = Gvar_117
	Gvar_180 = Gvar_118
	Gvar_160 = 12
	goto l390
	::l390::
	if not (Gvar_144) then 
		goto l404
	end
	WaitFrames(Gvar_160,45)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_190[Gvar_154])
	Gvar_190[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk6()
	var_0 = Gvar_171
	if (var_0 == Gvar_119) then 
		goto l45
	end
	if (var_0 == Gvar_120) then 
		goto l108
	end
	if (var_0 == Gvar_121) then 
		goto l208
	end
	if (var_0 == Gvar_122) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_154 = 0
	::l51::
	if not (Gvar_154 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_191[Gvar_154])
	Gvar_191[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l51
	::l86::
	Gvar_171 = Gvar_120
	Gvar_181 = Gvar_119
	Gvar_161 = 60
	goto l390
	::l108::
	Gvar_154 = 0
	::l114::
	if not (Gvar_154 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_191[Gvar_154])
	Gvar_191[Gvar_154] = SpawnObject("SmallFlame",Gvar_201[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l114
	::l158::
	if not (Gvar_181 == Gvar_119) then 
		goto l186
	end
	Gvar_171 = Gvar_121
	AudioEvent("FireballCast",Gvar_201[4])
	goto l193
	::l186::
	Gvar_171 = Gvar_119
	::l193::
	Gvar_181 = Gvar_120
	Gvar_161 = 2
	goto l390
	::l208::
	Gvar_154 = 0
	::l214::
	if not (Gvar_154 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_191[Gvar_154])
	Gvar_191[Gvar_154] = SpawnObject("MediumFlame",Gvar_201[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l214
	::l258::
	if not (Gvar_181 == Gvar_120) then 
		goto l286
	end
	Gvar_171 = Gvar_122
	AudioEvent("DemonBreath",Gvar_201[5])
	goto l303
	::l286::
	Gvar_171 = Gvar_120
	AudioEvent("FireExtinguish",Gvar_201[4])
	::l303::
	Gvar_181 = Gvar_121
	Gvar_161 = 2
	goto l390
	::l318::
	Gvar_154 = 0
	::l324::
	if not (Gvar_154 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_191[Gvar_154])
	Gvar_191[Gvar_154] = SpawnObject("Flame",Gvar_201[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l324
	::l368::
	Gvar_171 = Gvar_121
	Gvar_181 = Gvar_122
	Gvar_161 = 12
	goto l390
	::l390::
	if not (Gvar_145) then 
		goto l404
	end
	WaitFrames(Gvar_161,46)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_191[Gvar_154])
	Gvar_191[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk7()
	var_0 = Gvar_172
	if (var_0 == Gvar_123) then 
		goto l45
	end
	if (var_0 == Gvar_124) then 
		goto l108
	end
	if (var_0 == Gvar_125) then 
		goto l208
	end
	if (var_0 == Gvar_126) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_154 = 0
	::l51::
	if not (Gvar_154 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_192[Gvar_154])
	Gvar_192[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l51
	::l86::
	Gvar_172 = Gvar_124
	Gvar_182 = Gvar_123
	Gvar_162 = 60
	goto l390
	::l108::
	Gvar_154 = 0
	::l114::
	if not (Gvar_154 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_192[Gvar_154])
	Gvar_192[Gvar_154] = SpawnObject("SmallFlame",Gvar_202[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l114
	::l158::
	if not (Gvar_182 == Gvar_123) then 
		goto l186
	end
	Gvar_172 = Gvar_125
	AudioEvent("FireballCast",Gvar_202[4])
	goto l193
	::l186::
	Gvar_172 = Gvar_123
	::l193::
	Gvar_182 = Gvar_124
	Gvar_162 = 2
	goto l390
	::l208::
	Gvar_154 = 0
	::l214::
	if not (Gvar_154 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_192[Gvar_154])
	Gvar_192[Gvar_154] = SpawnObject("MediumFlame",Gvar_202[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l214
	::l258::
	if not (Gvar_182 == Gvar_124) then 
		goto l286
	end
	Gvar_172 = Gvar_126
	AudioEvent("DemonBreath",Gvar_202[5])
	goto l303
	::l286::
	Gvar_172 = Gvar_124
	AudioEvent("FireExtinguish",Gvar_202[4])
	::l303::
	Gvar_182 = Gvar_125
	Gvar_162 = 2
	goto l390
	::l318::
	Gvar_154 = 0
	::l324::
	if not (Gvar_154 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_192[Gvar_154])
	Gvar_192[Gvar_154] = SpawnObject("Flame",Gvar_202[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l324
	::l368::
	Gvar_172 = Gvar_125
	Gvar_182 = Gvar_126
	Gvar_162 = 12
	goto l390
	::l390::
	if not (Gvar_146) then 
		goto l404
	end
	WaitFrames(Gvar_162,47)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_192[Gvar_154])
	Gvar_192[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk8()
	var_0 = Gvar_173
	if (var_0 == Gvar_127) then 
		goto l45
	end
	if (var_0 == Gvar_128) then 
		goto l108
	end
	if (var_0 == Gvar_129) then 
		goto l208
	end
	if (var_0 == Gvar_130) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_155 = 0
	::l51::
	if not (Gvar_155 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_193[Gvar_155])
	Gvar_193[Gvar_155] = 0
	Gvar_155 = Gvar_155 + 1
	goto l51
	::l86::
	Gvar_173 = Gvar_128
	Gvar_183 = Gvar_127
	Gvar_163 = 60
	goto l390
	::l108::
	Gvar_155 = 0
	::l114::
	if not (Gvar_155 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_193[Gvar_155])
	Gvar_193[Gvar_155] = SpawnObject("SmallFlame",Gvar_203[Gvar_155])
	Gvar_155 = Gvar_155 + 1
	goto l114
	::l158::
	if not (Gvar_183 == Gvar_127) then 
		goto l186
	end
	Gvar_173 = Gvar_129
	AudioEvent("FireballCast",Gvar_203[4])
	goto l193
	::l186::
	Gvar_173 = Gvar_127
	::l193::
	Gvar_183 = Gvar_128
	Gvar_163 = 2
	goto l390
	::l208::
	Gvar_155 = 0
	::l214::
	if not (Gvar_155 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_193[Gvar_155])
	Gvar_193[Gvar_155] = SpawnObject("MediumFlame",Gvar_203[Gvar_155])
	Gvar_155 = Gvar_155 + 1
	goto l214
	::l258::
	if not (Gvar_183 == Gvar_128) then 
		goto l286
	end
	Gvar_173 = Gvar_130
	AudioEvent("DemonBreath",Gvar_203[5])
	goto l303
	::l286::
	Gvar_173 = Gvar_128
	AudioEvent("FireExtinguish",Gvar_203[4])
	::l303::
	Gvar_183 = Gvar_129
	Gvar_163 = 2
	goto l390
	::l318::
	Gvar_155 = 0
	::l324::
	if not (Gvar_155 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_193[Gvar_155])
	Gvar_193[Gvar_155] = SpawnObject("Flame",Gvar_203[Gvar_155])
	Gvar_155 = Gvar_155 + 1
	goto l324
	::l368::
	Gvar_173 = Gvar_129
	Gvar_183 = Gvar_130
	Gvar_163 = 12
	goto l390
	::l390::
	if not (Gvar_147) then 
		goto l404
	end
	WaitFrames(Gvar_163,48)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_193[Gvar_154])
	Gvar_193[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk9()
	var_0 = Gvar_174
	if (var_0 == Gvar_131) then 
		goto l45
	end
	if (var_0 == Gvar_132) then 
		goto l108
	end
	if (var_0 == Gvar_133) then 
		goto l208
	end
	if (var_0 == Gvar_134) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_154 = 0
	::l51::
	if not (Gvar_154 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_194[Gvar_154])
	Gvar_194[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l51
	::l86::
	Gvar_174 = Gvar_132
	Gvar_184 = Gvar_131
	Gvar_164 = 60
	goto l390
	::l108::
	Gvar_154 = 0
	::l114::
	if not (Gvar_154 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_194[Gvar_154])
	Gvar_194[Gvar_154] = SpawnObject("SmallFlame",Gvar_204[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l114
	::l158::
	if not (Gvar_184 == Gvar_131) then 
		goto l186
	end
	Gvar_174 = Gvar_133
	AudioEvent("FireballCast",Gvar_203[4])
	goto l193
	::l186::
	Gvar_174 = Gvar_131
	::l193::
	Gvar_184 = Gvar_132
	Gvar_164 = 2
	goto l390
	::l208::
	Gvar_154 = 0
	::l214::
	if not (Gvar_154 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_194[Gvar_154])
	Gvar_194[Gvar_154] = SpawnObject("MediumFlame",Gvar_204[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l214
	::l258::
	if not (Gvar_184 == Gvar_132) then 
		goto l286
	end
	Gvar_174 = Gvar_134
	AudioEvent("DemonBreath",Gvar_204[5])
	goto l303
	::l286::
	Gvar_174 = Gvar_132
	AudioEvent("FireExtinguish",Gvar_204[4])
	::l303::
	Gvar_184 = Gvar_133
	Gvar_164 = 2
	goto l390
	::l318::
	Gvar_154 = 0
	::l324::
	if not (Gvar_154 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_194[Gvar_154])
	Gvar_194[Gvar_154] = SpawnObject("Flame",Gvar_204[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l324
	::l368::
	Gvar_174 = Gvar_133
	Gvar_184 = Gvar_134
	Gvar_164 = 12
	goto l390
	::l390::
	if not (Gvar_148) then 
		goto l404
	end
	WaitFrames(Gvar_164,49)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_194[Gvar_154])
	Gvar_194[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function flameWalk10()
	var_0 = Gvar_175
	if (var_0 == Gvar_135) then 
		goto l45
	end
	if (var_0 == Gvar_136) then 
		goto l108
	end
	if (var_0 == Gvar_137) then 
		goto l208
	end
	if (var_0 == Gvar_138) then 
		goto l318
	end
	goto l390
	::l45::
	Gvar_154 = 0
	::l51::
	if not (Gvar_154 < 8) then 
		goto l86
	end
	DeleteObject(Gvar_195[Gvar_154])
	Gvar_195[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l51
	::l86::
	Gvar_175 = Gvar_136
	Gvar_185 = Gvar_135
	Gvar_165 = 60
	goto l390
	::l108::
	Gvar_154 = 0
	::l114::
	if not (Gvar_154 < 8) then 
		goto l158
	end
	DeleteObject(Gvar_195[Gvar_154])
	Gvar_195[Gvar_154] = SpawnObject("SmallFlame",Gvar_205[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l114
	::l158::
	if not (Gvar_185 == Gvar_135) then 
		goto l186
	end
	Gvar_175 = Gvar_137
	AudioEvent("FireballCast",Gvar_205[4])
	goto l193
	::l186::
	Gvar_175 = Gvar_135
	::l193::
	Gvar_185 = Gvar_136
	Gvar_165 = 2
	goto l390
	::l208::
	Gvar_154 = 0
	::l214::
	if not (Gvar_154 < 8) then 
		goto l258
	end
	DeleteObject(Gvar_195[Gvar_154])
	Gvar_195[Gvar_154] = SpawnObject("MediumFlame",Gvar_205[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l214
	::l258::
	if not (Gvar_185 == Gvar_136) then 
		goto l286
	end
	Gvar_175 = Gvar_138
	AudioEvent("DemonBreath",Gvar_205[5])
	goto l303
	::l286::
	Gvar_175 = Gvar_136
	AudioEvent("FireExtinguish",Gvar_205[4])
	::l303::
	Gvar_185 = Gvar_137
	Gvar_165 = 2
	goto l390
	::l318::
	Gvar_154 = 0
	::l324::
	if not (Gvar_154 < 8) then 
		goto l368
	end
	DeleteObject(Gvar_195[Gvar_154])
	Gvar_195[Gvar_154] = SpawnObject("Flame",Gvar_205[Gvar_154])
	Gvar_154 = Gvar_154 + 1
	goto l324
	::l368::
	Gvar_175 = Gvar_137
	Gvar_185 = Gvar_138
	Gvar_165 = 12
	goto l390
	::l390::
	if not (Gvar_149) then 
		goto l404
	end
	WaitFrames(Gvar_165,50)
	goto l445
	::l404::
	Gvar_154 = 0
	::l410::
	if not (Gvar_154 < 8) then 
		goto l445
	end
	DeleteObject(Gvar_195[Gvar_154])
	Gvar_195[Gvar_154] = 0
	Gvar_154 = Gvar_154 + 1
	goto l410
	::l445::
	if true then return end
end
function initFlameGrates()
	Gvar_4 = 0
	::l6::
	if not (Gvar_4 < 8) then 
		goto l232
	end
	Gvar_196[Gvar_4] = WaypointFromName("FlameWay1-" + IntToString(Gvar_4 + 1))
	Gvar_197[Gvar_4] = WaypointFromName("FlameWay2-" + IntToString(Gvar_4 + 1))
	Gvar_198[Gvar_4] = WaypointFromName("FlameWay3-" + IntToString(Gvar_4 + 1))
	Gvar_199[Gvar_4] = WaypointFromName("FlameWay4-" + IntToString(Gvar_4 + 1))
	Gvar_200[Gvar_4] = WaypointFromName("FlameWay5-" + IntToString(Gvar_4 + 1))
	Gvar_201[Gvar_4] = WaypointFromName("FlameWay6-" + IntToString(Gvar_4 + 1))
	Gvar_202[Gvar_4] = WaypointFromName("FlameWay7-" + IntToString(Gvar_4 + 1))
	Gvar_203[Gvar_4] = WaypointFromName("FlameWay8-" + IntToString(Gvar_4 + 1))
	Gvar_204[Gvar_4] = WaypointFromName("FlameWay9-" + IntToString(Gvar_4 + 1))
	Gvar_205[Gvar_4] = WaypointFromName("FlameWay10-" + IntToString(Gvar_4 + 1))
	Gvar_4 = Gvar_4 + 1
	goto l6
	::l232::
	if true then return end
end
function releaseUrchins2()
	OpenSecretWallGroup(Gvar_214)
	LockDoor(Gvar_209)
	LockDoor(Gvar_210)
	EnableObject(Gvar_207)
	EnableObject(Gvar_208)
	DisableObject(Gvar_213)
	if true then return end
end
function urchins2Die()
	Gvar_206 = Gvar_206 + 1
	threeDeadUrchins()
	if true then return end
end
function threeDeadUrchins()
	if not (Gvar_206 > 1) then 
		goto l18
	end
	UnlockDoor(Gvar_211)
	UnlockDoor(Gvar_212)
	::l18::
	if true then return end
end
function skullHallOn1()
	if not (Gvar_215) then 
		goto l23
	end
	ApplySpellXYXY("SPELL_FIREBALL",2323,2047,2794,2518)
	WaitFrames(75,55)
	::l23::
	if true then return end
end
function skullHallOff1()
	Gvar_215 = false
	if true then return end
end
function releaseArena3()
	PlayMusic(4,100)
	OpenSecretWallGroup(Gvar_228)
	EnableObject(Gvar_224)
	EnableObject(Gvar_225)
	EnableObject(Gvar_226)
	LockDoor(Gvar_220)
	LockDoor(Gvar_221)
	DisableObject(Gvar_227)
	if true then return end
end
function arena3Die()
	Gvar_219 = Gvar_219 + 1
	arena3DeathToll()
	if true then return end
end
function arena3DeathToll()
	if not (Gvar_219 > 2) then 
		goto l18
	end
	UnlockDoor(Gvar_222)
	UnlockDoor(Gvar_223)
	::l18::
	if true then return end
end
function lockArena4()
	LockDoor(Gvar_230)
	LockDoor(Gvar_231)
	if true then return end
end
function loadArena4()
	EnableObjectGroup(Gvar_233)
	lockArena4()
	DisableObject(Gvar_232)
	WaitFrames(10,66)
	WaitFrames(40,62)
	WaitFrames(90,63)
	if true then return end
end
function disableArena4Elevators()
	DisableObjectGroup(Gvar_233)
	if true then return end
end
function openArena4Cages()
	OpenSecretWallGroup(Gvar_235)
	if true then return end
end
function arena4Die()
	Gvar_229 = Gvar_229 + 1
	arena4DeathToll()
	WaitFrames(90,67)
	if true then return end
end
function arena4DeathToll()
	if not (Gvar_229 > 0) then 
		goto l24
	end
	PlayMusic(29,100)
	UnlockDoor(Gvar_231)
	UnlockDoor(Gvar_240)
	::l24::
	if true then return end
end
function arena4SpikesUp()
	EnableObjectGroup(Gvar_234)
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FloorSpikesUp",Gvar_55)
	if true then return end
end
function arena4SpikesDown()
	DisableObjectGroup(Gvar_234)
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FloorSpikesDown",Gvar_55)
	if true then return end
end
function enableZipperOfDeath()
	Gvar_238 = true
	cascade1()
	zipperNoise()
	zipperNoise2()
	if true then return end
end
function zipperNoise()
	if not (Gvar_238) then 
		goto l102
	end
	AudioEvent("SecretWallStoneOpen",Gvar_262)
	AudioEvent("BoulderRoll",Gvar_264)
	AudioEvent("BoulderRoll",Gvar_265)
	AudioEvent("SecretWallStoneOpen",Gvar_266)
	AudioEvent("EarthRumbleMajor",Gvar_268)
	AudioEvent("EarthRumbleMajor",Gvar_270)
	AudioEvent("EarthRumbleMajor",Gvar_272)
	AudioEvent("EarthRumbleMajor",Gvar_274)
	AudioEvent("SecretWallStoneOpen",Gvar_276)
	AudioEvent("BoulderRoll",Gvar_278)
	AudioEvent("BoulderRoll",Gvar_279)
	AudioEvent("SecretWallStoneOpen",Gvar_280)
	AudioEvent("SecretWallStoneOpen",Gvar_281)
	WaitFrames(30,69)
	::l102::
	if true then return end
end
function zipperNoise2()
	if not (Gvar_238) then 
		goto l25
	end
	AudioEvent("MechGolemPowerUp",Gvar_270)
	AudioEvent("MechGolemPowerUp",Gvar_271)
	WaitFrames(5,70)
	::l25::
	if true then return end
end
function cascade1()
	EnableObject(Gvar_261)
	EnableObject(Gvar_241)
	EnableObject(Gvar_242)
	WaitFrames(4,72)
	if true then return end
end
function cascade2()
	EnableObject(Gvar_243)
	EnableObject(Gvar_244)
	WaitFrames(4,73)
	if true then return end
end
function cascade3()
	EnableObject(Gvar_245)
	EnableObject(Gvar_246)
	WaitFrames(4,74)
	if true then return end
end
function cascade4()
	EnableObject(Gvar_247)
	EnableObject(Gvar_248)
	WaitFrames(4,75)
	if true then return end
end
function cascade5()
	EnableObject(Gvar_249)
	EnableObject(Gvar_250)
	WaitFrames(4,76)
	if true then return end
end
function cascade6()
	EnableObject(Gvar_251)
	EnableObject(Gvar_252)
	WaitFrames(4,77)
	if true then return end
end
function cascade7()
	EnableObject(Gvar_253)
	EnableObject(Gvar_254)
	WaitFrames(4,78)
	if true then return end
end
function cascade8()
	EnableObject(Gvar_255)
	EnableObject(Gvar_256)
	WaitFrames(4,79)
	if true then return end
end
function cascade9()
	EnableObject(Gvar_257)
	EnableObject(Gvar_258)
	WaitFrames(4,80)
	if true then return end
end
function cascade10()
	EnableObject(Gvar_259)
	EnableObject(Gvar_260)
	if true then return end
end
function endGauntletTalk1Start()
	StartDialogWithCaller("SwordsmanRecognize","War02A.scr:HorrendousTalk3Start")
	if true then return end
end
function endGauntletTalk1End()
	CancelDialog(Gvar_43)
	JournalSetObjective(1,"EnteredGauntlet")
	TeleportWaypoint(Gvar_55,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagCapture",Gvar_55)
	JournalUpdateEntry(GetHostPlayer(),"War2Gauntlet",4)
	CinematicFade()
	WaitFrames(60,83)
	if true then return end
end
function backToDunMir()
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),5323,5301)
	if true then return end
end
function MapInitialize()
	WallMakeSilent(false)
	PlayMusic(0,100)
	Gvar_7 = ObjFromName("GG1")
	Gvar_8 = ObjFromName("GG2")
	Gvar_9 = ObjGroupFromName("FireKnights")
	Gvar_10 = WaypointFromName("WarCryWay")
	WaitFrames(3,4)
	Gvar_42 = ObjFromName("F2Dant")
	SetDialogPortrait(Gvar_42,"WarriorPic")
	Gvar_43 = ObjFromName("F2Sargent")
	SetDialogPortrait(Gvar_43,"Warrior3Pic")
	Gvar_44 = ObjFromName("Horrendous")
	SetDialogPortrait(Gvar_44,"HorrendousPic")
	Gvar_45 = ObjFromName("RedShirt")
	Gvar_46 = ObjFromName("F2RedShirt")
	SetDialogPortrait(Gvar_46,"SkullPic")
	ObjSetMaster(GetHostPlayer(),Gvar_46)
	Gvar_47 = ObjFromName("F2ChickenShirt")
	SetDialogPortrait(Gvar_47,"Townsman2Pic")
	Gvar_53 = ObjFromName("GearRoom")
	Gvar_48 = ObjFromName("FromAcademy1")
	Gvar_49 = ObjFromName("FromAcademy2")
	Gvar_50 = ObjFromName("ToGauntlet1")
	Gvar_51 = ObjFromName("ToGauntlet2")
	Gvar_52 = ObjFromName("GauntletEntrance")
	Gvar_36 = ObjFromName("GSMover1")
	Gvar_37 = ObjFromName("GSMover2")
	Gvar_38 = ObjFromName("GSMover3")
	Gvar_39 = ObjFromName("GSMover4")
	Gvar_40 = ObjFromName("GSMover5")
	Gvar_41 = ObjFromName("GSMover6")
	Gvar_55 = WaypointFromName("PlayerAudio")
	Gvar_85 = WaypointFromName("GearWay")
	Gvar_86 = WaypointFromName("StereoRWay")
	Gvar_87 = WaypointFromName("StereoLWay")
	Gvar_88 = WaypointFromName("BoneCruncherWay")
	Gvar_89 = WaypointFromName("ChickenRunsWay")
	Gvar_73 = WaypointFromName("F5way")
	Gvar_75 = WaypointFromName("F7way")
	Gvar_77 = WaypointFromName("F9way")
	Gvar_82 = WaypointFromName("GSWay1")
	Gvar_83 = WaypointFromName("GSWay3")
	Gvar_84 = WaypointFromName("GSWay5")
	Gvar_15 = ObjGroupFromName("GauntletEntrySounds")
	DisableObjectGroup(Gvar_15)
	LockDoor(Gvar_53)
	LockDoor(Gvar_48)
	LockDoor(Gvar_49)
	LockDoor(Gvar_52)
	Gvar_91 = ObjFromName("Spider1a")
	Gvar_92 = ObjFromName("Spider1b")
	DisableObject(Gvar_91)
	DisableObject(Gvar_92)
	Gvar_93 = ObjFromName("Arena1Door1a")
	Gvar_94 = ObjFromName("Arena1Door1b")
	Gvar_95 = ObjFromName("Arena1Door2a")
	Gvar_96 = ObjFromName("Arena1Door2b")
	Gvar_97 = ObjFromName("Arena1Switch")
	LockDoor(Gvar_95)
	LockDoor(Gvar_96)
	Gvar_98 = WallGroupFromName("Arena1Walls")
	initFlameGrates()
	Gvar_207 = ObjFromName("Urchin2a")
	Gvar_208 = ObjFromName("Urchin2b")
	DisableObject(Gvar_207)
	DisableObject(Gvar_208)
	Gvar_209 = ObjFromName("Arena2Door1a")
	Gvar_210 = ObjFromName("Arena2Door1b")
	Gvar_211 = ObjFromName("Arena2Door2a")
	Gvar_212 = ObjFromName("Arena2Door2b")
	Gvar_213 = ObjFromName("Arena2Switch")
	LockDoor(Gvar_211)
	LockDoor(Gvar_212)
	Gvar_214 = WallGroupFromName("Arena2Walls")
	Gvar_220 = ObjFromName("Arena3Door1a")
	Gvar_221 = ObjFromName("Arena3Door1b")
	Gvar_222 = ObjFromName("Arena3Door2a")
	Gvar_223 = ObjFromName("Arena3Door2b")
	Gvar_224 = ObjFromName("Arena3Urchin1")
	Gvar_225 = ObjFromName("Arena3Urchin2")
	Gvar_226 = ObjFromName("Arena3Urchin3")
	Gvar_227 = ObjFromName("Arena3Switch")
	DisableObject(Gvar_224)
	DisableObject(Gvar_225)
	DisableObject(Gvar_226)
	LockDoor(Gvar_222)
	LockDoor(Gvar_223)
	Gvar_228 = WallGroupFromName("Arena3Walls")
	Gvar_230 = ObjFromName("Arena4Door1")
	Gvar_231 = ObjFromName("Arena4Door2")
	Gvar_232 = ObjFromName("Arena4Switch")
	Gvar_233 = ObjGroupFromName("Arena4Elevators")
	Gvar_234 = ObjGroupFromName("Arena4Spikes")
	DisableObjectGroup(Gvar_234)
	Gvar_235 = WallGroupFromName("Arena4Cages")
	Gvar_236 = WaypointFromName("UrchinSoundsWay")
	Gvar_239 = ObjGroupFromName("ZipperOfDeath")
	DisableObjectGroup(Gvar_239)
	Gvar_240 = ObjFromName("ZipperDoor")
	LockDoor(Gvar_240)
	Gvar_241 = ObjFromName("am1")
	Gvar_242 = ObjFromName("am2")
	Gvar_243 = ObjFromName("am3")
	Gvar_244 = ObjFromName("am4")
	Gvar_245 = ObjFromName("am5")
	Gvar_246 = ObjFromName("am6")
	Gvar_247 = ObjFromName("am7")
	Gvar_248 = ObjFromName("am8")
	Gvar_249 = ObjFromName("am9")
	Gvar_250 = ObjFromName("am10")
	Gvar_251 = ObjFromName("am11")
	Gvar_252 = ObjFromName("am12")
	Gvar_253 = ObjFromName("am13")
	Gvar_254 = ObjFromName("am14")
	Gvar_255 = ObjFromName("am15")
	Gvar_256 = ObjFromName("am16")
	Gvar_257 = ObjFromName("am17")
	Gvar_258 = ObjFromName("am18")
	Gvar_259 = ObjFromName("am19")
	Gvar_260 = ObjFromName("am20")
	Gvar_261 = ObjFromName("asbm1")
	Gvar_262 = WaypointFromName("arsw1")
	Gvar_263 = WaypointFromName("arsw2")
	Gvar_264 = WaypointFromName("arsw3")
	Gvar_265 = WaypointFromName("arsw4")
	Gvar_266 = WaypointFromName("arsw5")
	Gvar_267 = WaypointFromName("arsw6")
	Gvar_268 = WaypointFromName("arsw7")
	Gvar_269 = WaypointFromName("arsw8")
	Gvar_270 = WaypointFromName("arsw9")
	Gvar_271 = WaypointFromName("arsw10")
	Gvar_272 = WaypointFromName("arsw11")
	Gvar_273 = WaypointFromName("arsw12")
	Gvar_274 = WaypointFromName("arsw13")
	Gvar_275 = WaypointFromName("arsw14")
	Gvar_276 = WaypointFromName("arsw15")
	Gvar_277 = WaypointFromName("arsw16")
	Gvar_278 = WaypointFromName("arsw17")
	Gvar_279 = WaypointFromName("arsw18")
	Gvar_280 = WaypointFromName("arsw19")
	Gvar_281 = WaypointFromName("arsw20")
	Gvar_283 = ObjFromName("FromGauntlet1")
	Gvar_284 = ObjFromName("FromGauntlet2")
	Gvar_285 = ObjGroupFromName("FinishGauntletTriggers")
	StartScreen(2)
	if true then return end
end
function PlayerDeath()
	DeathScreen(2)
	if true then return end
end
function openGauntSecret()
	WallMakeSilent(false)
	OpenSecretWall(GetWallAt(119,191))
	OpenSecretWall(GetWallAt(120,192))
	if true then return end
end
function urchins1Die()
	Gvar_90 = Gvar_90 + 1
	twoDeadUrchins()
	if true then return end
end
function fireGrateReward()
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function fireballHallReward()
	PlayerGiveExp(GetHostPlayer(),250)
	if true then return end
end
function unlockExitDoor()
	PlayMusic(22,100)
	UnlockDoor(Gvar_283)
	UnlockDoor(Gvar_284)
	Gvar_282 = true
	PlayerGiveExp(GetHostPlayer(),2500)
	TeleportObj(Gvar_43,5071,4894)
	MonsterGuardArea(Gvar_43,5071,4894,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	TeleportObj(Gvar_44,4335,3151)
	TeleportObj(Gvar_42,4335,3151)
	if true then return end
end
function finishGauntlet()
	if not (Gvar_282) then 
		goto l54
	end
	Gvar_282 = false
	DisableObjectGroup(Gvar_285)
	ObjLookAtObj(Gvar_43,GetHostPlayer())
	CinematicBorders(true)
	ObjFreeze(GetHostPlayer(),true)
	SetupDialog(Gvar_43,"FALSE",81,82)
	ForceDialog(Gvar_43,GetHostPlayer())
	::l54::
	if true then return end
end